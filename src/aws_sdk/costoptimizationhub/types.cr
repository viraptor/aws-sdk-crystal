require "json"
require "time"

module AwsSdk
  module CostOptimizationHub
    module Types

      # You are not authorized to use this operation with the given parameters.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes the enrollment status of an organization's member accounts in Cost Optimization Hub.

      struct AccountEnrollmentStatus
        include JSON::Serializable

        # The Amazon Web Services account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The time when the account enrollment status was created.

        @[JSON::Field(key: "createdTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The time when the account enrollment status was last updated.

        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The account enrollment status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @created_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains the details of an Aurora DB cluster storage.

      struct AuroraDbClusterStorage
        include JSON::Serializable

        # The Aurora DB cluster storage configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AuroraDbClusterStorageConfiguration?


        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::AuroraDbClusterStorageConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The Aurora DB cluster storage configuration used for recommendations.

      struct AuroraDbClusterStorageConfiguration
        include JSON::Serializable

        # The storage type to associate with the Aurora DB cluster.

        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        def initialize(
          @storage_type : String? = nil
        )
        end
      end

      # Describes the Amazon Elastic Block Store performance configuration of the current and recommended
      # resource configuration for a recommendation.

      struct BlockStoragePerformanceConfiguration
        include JSON::Serializable

        # The number of I/O operations per second.

        @[JSON::Field(key: "iops")]
        getter iops : Float64?

        # The throughput that the volume supports.

        @[JSON::Field(key: "throughput")]
        getter throughput : Float64?

        def initialize(
          @iops : Float64? = nil,
          @throughput : Float64? = nil
        )
        end
      end

      # Describes the performance configuration for compute services such as Amazon EC2, Lambda, and ECS.

      struct ComputeConfiguration
        include JSON::Serializable

        # The architecture of the resource.

        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The memory size of the resource.

        @[JSON::Field(key: "memorySizeInMB")]
        getter memory_size_in_mb : Int32?

        # The platform of the resource. The platform is the specific combination of operating system, license
        # model, and software on an instance.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The number of vCPU cores in the resource.

        @[JSON::Field(key: "vCpu")]
        getter v_cpu : Float64?

        def initialize(
          @architecture : String? = nil,
          @memory_size_in_mb : Int32? = nil,
          @platform : String? = nil,
          @v_cpu : Float64? = nil
        )
        end
      end

      # The Compute Savings Plans recommendation details.

      struct ComputeSavingsPlans
        include JSON::Serializable

        # Configuration details of the Compute Savings Plans to purchase.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ComputeSavingsPlansConfiguration?

        # Cost impact of the Savings Plans purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::SavingsPlansCostCalculation?

        def initialize(
          @configuration : Types::ComputeSavingsPlansConfiguration? = nil,
          @cost_calculation : Types::SavingsPlansCostCalculation? = nil
        )
        end
      end

      # The Compute Savings Plans configuration used for recommendations.

      struct ComputeSavingsPlansConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations. Amazon Web Services calculates recommendations
        # including the management account and member accounts if the value is set to PAYER . If the value is
        # LINKED , recommendations are calculated for individual member accounts only.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # The hourly commitment for the Savings Plans type.

        @[JSON::Field(key: "hourlyCommitment")]
        getter hourly_commitment : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Savings Plans recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        def initialize(
          @account_scope : String? = nil,
          @hourly_commitment : String? = nil,
          @payment_option : String? = nil,
          @term : String? = nil
        )
        end
      end

      # The DB instance configuration used for recommendations.

      struct DbInstanceConfiguration
        include JSON::Serializable

        # The DB instance class of the DB instance.

        @[JSON::Field(key: "dbInstanceClass")]
        getter db_instance_class : String?

        def initialize(
          @db_instance_class : String? = nil
        )
        end
      end

      # The DynamoDB reserved capacity recommendation details.

      struct DynamoDbReservedCapacity
        include JSON::Serializable

        # The DynamoDB reserved capacity configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DynamoDbReservedCapacityConfiguration?


        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ReservedInstancesCostCalculation?

        def initialize(
          @configuration : Types::DynamoDbReservedCapacityConfiguration? = nil,
          @cost_calculation : Types::ReservedInstancesCostCalculation? = nil
        )
        end
      end

      # The DynamoDB reserved capacity configuration used for recommendations.

      struct DynamoDbReservedCapacityConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # The capacity unit of the recommended reservation.

        @[JSON::Field(key: "capacityUnits")]
        getter capacity_units : String?

        # How much purchasing this reserved capacity costs you on a monthly basis.

        @[JSON::Field(key: "monthlyRecurringCost")]
        getter monthly_recurring_cost : String?

        # The number of reserved capacity units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "numberOfCapacityUnitsToPurchase")]
        getter number_of_capacity_units_to_purchase : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "reservedInstancesRegion")]
        getter reserved_instances_region : String?

        # The service for which you want recommendations.

        @[JSON::Field(key: "service")]
        getter service : String?

        # The reserved capacity recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        # How much purchasing this reserved capacity costs you upfront.

        @[JSON::Field(key: "upfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_scope : String? = nil,
          @capacity_units : String? = nil,
          @monthly_recurring_cost : String? = nil,
          @number_of_capacity_units_to_purchase : String? = nil,
          @payment_option : String? = nil,
          @reserved_instances_region : String? = nil,
          @service : String? = nil,
          @term : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Describes the Amazon Elastic Block Store volume configuration of the current and recommended
      # resource configuration for a recommendation.

      struct EbsVolume
        include JSON::Serializable

        # The Amazon Elastic Block Store volume configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::EbsVolumeConfiguration?

        # Cost impact of the recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::EbsVolumeConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The Amazon Elastic Block Store volume configuration used for recommendations.

      struct EbsVolumeConfiguration
        include JSON::Serializable

        # The Amazon Elastic Block Store attachment state.

        @[JSON::Field(key: "attachmentState")]
        getter attachment_state : String?

        # The Amazon Elastic Block Store performance configuration.

        @[JSON::Field(key: "performance")]
        getter performance : Types::BlockStoragePerformanceConfiguration?

        # The disk storage of the Amazon Elastic Block Store volume.

        @[JSON::Field(key: "storage")]
        getter storage : Types::StorageConfiguration?

        def initialize(
          @attachment_state : String? = nil,
          @performance : Types::BlockStoragePerformanceConfiguration? = nil,
          @storage : Types::StorageConfiguration? = nil
        )
        end
      end

      # The EC2 Auto Scaling group recommendation details.

      struct Ec2AutoScalingGroup
        include JSON::Serializable

        # The EC2 Auto Scaling group configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::Ec2AutoScalingGroupConfiguration?

        # Cost impact of the recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::Ec2AutoScalingGroupConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The EC2 Auto Scaling group configuration used for recommendations.

      struct Ec2AutoScalingGroupConfiguration
        include JSON::Serializable

        # The strategy used for allocating instances, based on a predefined priority order or based on the
        # lowest available price.

        @[JSON::Field(key: "allocationStrategy")]
        getter allocation_strategy : String?

        # Details about the instance for the EC2 Auto Scaling group with a single instance type.

        @[JSON::Field(key: "instance")]
        getter instance : Types::InstanceConfiguration?

        # A list of instance types for an EC2 Auto Scaling group with mixed instance types.

        @[JSON::Field(key: "mixedInstances")]
        getter mixed_instances : Array(Types::MixedInstanceConfiguration)?

        # The type of EC2 Auto Scaling group, showing whether it consists of a single instance type or mixed
        # instance types.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @allocation_strategy : String? = nil,
          @instance : Types::InstanceConfiguration? = nil,
          @mixed_instances : Array(Types::MixedInstanceConfiguration)? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the EC2 instance configuration of the current and recommended resource configuration for a
      # recommendation.

      struct Ec2Instance
        include JSON::Serializable

        # The EC2 instance configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::Ec2InstanceConfiguration?

        # Cost impact of the recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::Ec2InstanceConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The EC2 instance configuration used for recommendations.

      struct Ec2InstanceConfiguration
        include JSON::Serializable

        # Details about the instance.

        @[JSON::Field(key: "instance")]
        getter instance : Types::InstanceConfiguration?

        def initialize(
          @instance : Types::InstanceConfiguration? = nil
        )
        end
      end

      # The EC2 instance Savings Plans recommendation details.

      struct Ec2InstanceSavingsPlans
        include JSON::Serializable

        # The EC2 instance Savings Plans configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::Ec2InstanceSavingsPlansConfiguration?

        # Cost impact of the Savings Plans purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::SavingsPlansCostCalculation?

        def initialize(
          @configuration : Types::Ec2InstanceSavingsPlansConfiguration? = nil,
          @cost_calculation : Types::SavingsPlansCostCalculation? = nil
        )
        end
      end

      # The EC2 instance Savings Plans configuration used for recommendations.

      struct Ec2InstanceSavingsPlansConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # The hourly commitment for the Savings Plans type.

        @[JSON::Field(key: "hourlyCommitment")]
        getter hourly_commitment : String?

        # The instance family of the recommended Savings Plans.

        @[JSON::Field(key: "instanceFamily")]
        getter instance_family : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "savingsPlansRegion")]
        getter savings_plans_region : String?

        # The Savings Plans recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        def initialize(
          @account_scope : String? = nil,
          @hourly_commitment : String? = nil,
          @instance_family : String? = nil,
          @payment_option : String? = nil,
          @savings_plans_region : String? = nil,
          @term : String? = nil
        )
        end
      end

      # The EC2 reserved instances recommendation details.

      struct Ec2ReservedInstances
        include JSON::Serializable

        # The EC2 reserved instances configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::Ec2ReservedInstancesConfiguration?

        # Cost impact of the purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ReservedInstancesCostCalculation?

        def initialize(
          @configuration : Types::Ec2ReservedInstancesConfiguration? = nil,
          @cost_calculation : Types::ReservedInstancesCostCalculation? = nil
        )
        end
      end

      # The EC2 reserved instances configuration used for recommendations.

      struct Ec2ReservedInstancesConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "currentGeneration")]
        getter current_generation : String?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "instanceFamily")]
        getter instance_family : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # How much purchasing these reserved instances costs you on a monthly basis.

        @[JSON::Field(key: "monthlyRecurringCost")]
        getter monthly_recurring_cost : String?

        # The number of normalized units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "normalizedUnitsToPurchase")]
        getter normalized_units_to_purchase : String?

        # The number of instances that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "numberOfInstancesToPurchase")]
        getter number_of_instances_to_purchase : String?

        # Indicates whether the recommendation is for standard or convertible reservations.

        @[JSON::Field(key: "offeringClass")]
        getter offering_class : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The platform of the recommended reservation. The platform is the specific combination of operating
        # system, license model, and software on an instance.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "reservedInstancesRegion")]
        getter reserved_instances_region : String?

        # The service for which you want recommendations.

        @[JSON::Field(key: "service")]
        getter service : String?

        # Determines whether the recommendation is size flexible.

        @[JSON::Field(key: "sizeFlexEligible")]
        getter size_flex_eligible : Bool?

        # Determines whether the recommended reservation is dedicated or shared.

        @[JSON::Field(key: "tenancy")]
        getter tenancy : String?

        # The reserved instances recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        # How much purchasing this instance costs you upfront.

        @[JSON::Field(key: "upfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_scope : String? = nil,
          @current_generation : String? = nil,
          @instance_family : String? = nil,
          @instance_type : String? = nil,
          @monthly_recurring_cost : String? = nil,
          @normalized_units_to_purchase : String? = nil,
          @number_of_instances_to_purchase : String? = nil,
          @offering_class : String? = nil,
          @payment_option : String? = nil,
          @platform : String? = nil,
          @reserved_instances_region : String? = nil,
          @service : String? = nil,
          @size_flex_eligible : Bool? = nil,
          @tenancy : String? = nil,
          @term : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # The ECS service recommendation details.

      struct EcsService
        include JSON::Serializable

        # The ECS service configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::EcsServiceConfiguration?

        # Cost impact of the recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::EcsServiceConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The ECS service configuration used for recommendations.

      struct EcsServiceConfiguration
        include JSON::Serializable

        # Details about the compute configuration.

        @[JSON::Field(key: "compute")]
        getter compute : Types::ComputeConfiguration?

        def initialize(
          @compute : Types::ComputeConfiguration? = nil
        )
        end
      end

      # Contains cost efficiency metrics for a specific group over time. The group is defined by the
      # grouping dimension specified in the request, such as account ID, Amazon Web Services Region.

      struct EfficiencyMetricsByGroup
        include JSON::Serializable

        # The value of the grouping dimension for this set of metrics. For example, if grouped by account ID,
        # this field contains the account ID. If no grouping is specified, this field is empty.

        @[JSON::Field(key: "group")]
        getter group : String?

        # An explanation of why efficiency metrics could not be calculated for this group when the
        # metricsByTime field is null. Common reasons include insufficient or inconclusive cost and usage data
        # during the specified time period. This field is null or empty when metrics are successfully
        # calculated.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of time-series data points containing efficiency metrics for this group. Each data point
        # includes an efficiency score, estimated savings, spending, and a timestamp corresponding to the
        # specified granularity. This field is null when efficiency metrics cannot be calculated for the
        # group, in which case the message field provides an explanation.

        @[JSON::Field(key: "metricsByTime")]
        getter metrics_by_time : Array(Types::MetricsByTime)?

        def initialize(
          @group : String? = nil,
          @message : String? = nil,
          @metrics_by_time : Array(Types::MetricsByTime)? = nil
        )
        end
      end

      # The ElastiCache reserved instances recommendation details.

      struct ElastiCacheReservedInstances
        include JSON::Serializable

        # The ElastiCache reserved instances configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ElastiCacheReservedInstancesConfiguration?

        # Cost impact of the purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ReservedInstancesCostCalculation?

        def initialize(
          @configuration : Types::ElastiCacheReservedInstancesConfiguration? = nil,
          @cost_calculation : Types::ReservedInstancesCostCalculation? = nil
        )
        end
      end

      # The ElastiCache reserved instances configuration used for recommendations.

      struct ElastiCacheReservedInstancesConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "currentGeneration")]
        getter current_generation : String?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "instanceFamily")]
        getter instance_family : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # How much purchasing these reserved instances costs you on a monthly basis.

        @[JSON::Field(key: "monthlyRecurringCost")]
        getter monthly_recurring_cost : String?

        # The number of normalized units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "normalizedUnitsToPurchase")]
        getter normalized_units_to_purchase : String?

        # The number of instances that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "numberOfInstancesToPurchase")]
        getter number_of_instances_to_purchase : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "reservedInstancesRegion")]
        getter reserved_instances_region : String?

        # The service for which you want recommendations.

        @[JSON::Field(key: "service")]
        getter service : String?

        # Determines whether the recommendation is size flexible.

        @[JSON::Field(key: "sizeFlexEligible")]
        getter size_flex_eligible : Bool?

        # The reserved instances recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        # How much purchasing this instance costs you upfront.

        @[JSON::Field(key: "upfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_scope : String? = nil,
          @current_generation : String? = nil,
          @instance_family : String? = nil,
          @instance_type : String? = nil,
          @monthly_recurring_cost : String? = nil,
          @normalized_units_to_purchase : String? = nil,
          @number_of_instances_to_purchase : String? = nil,
          @payment_option : String? = nil,
          @reserved_instances_region : String? = nil,
          @service : String? = nil,
          @size_flex_eligible : Bool? = nil,
          @term : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Estimated discount details of the current and recommended resource configuration for a
      # recommendation.

      struct EstimatedDiscounts
        include JSON::Serializable

        # Estimated other discounts include all discounts that are not itemized. Itemized discounts include
        # reservedInstanceDiscount and savingsPlansDiscount .

        @[JSON::Field(key: "otherDiscount")]
        getter other_discount : Float64?

        # Estimated reserved instance discounts.

        @[JSON::Field(key: "reservedInstancesDiscount")]
        getter reserved_instances_discount : Float64?

        # Estimated Savings Plans discounts.

        @[JSON::Field(key: "savingsPlansDiscount")]
        getter savings_plans_discount : Float64?

        def initialize(
          @other_discount : Float64? = nil,
          @reserved_instances_discount : Float64? = nil,
          @savings_plans_discount : Float64? = nil
        )
        end
      end

      # Describes a filter that returns a more specific list of recommendations. Filters recommendations by
      # different dimensions.

      struct Filter
        include JSON::Serializable

        # The account to which the recommendation applies.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The type of action you can take by adopting the recommendation.

        @[JSON::Field(key: "actionTypes")]
        getter action_types : Array(String)?

        # The effort required to implement the recommendation.

        @[JSON::Field(key: "implementationEfforts")]
        getter implementation_efforts : Array(String)?

        # The IDs for the recommendations.

        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)?

        # The Amazon Web Services Region of the resource.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        # The Amazon Resource Name (ARN) of the recommendation.

        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # The resource ID of the recommendation.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        # The resource type of the recommendation.

        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        # Whether or not implementing the recommendation requires a restart.

        @[JSON::Field(key: "restartNeeded")]
        getter restart_needed : Bool?

        # Whether or not implementing the recommendation can be rolled back.

        @[JSON::Field(key: "rollbackPossible")]
        getter rollback_possible : Bool?

        # A list of tags assigned to the recommendation.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @action_types : Array(String)? = nil,
          @implementation_efforts : Array(String)? = nil,
          @recommendation_ids : Array(String)? = nil,
          @regions : Array(String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_ids : Array(String)? = nil,
          @resource_types : Array(String)? = nil,
          @restart_needed : Bool? = nil,
          @rollback_possible : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct GetPreferencesRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetPreferencesResponse
        include JSON::Serializable

        # Retrieves the status of the "member account discount visibility" preference.

        @[JSON::Field(key: "memberAccountDiscountVisibility")]
        getter member_account_discount_visibility : String?

        # Retrieves the current preferences for how Reserved Instances and Savings Plans cost-saving
        # opportunities are prioritized in terms of payment option and term length.

        @[JSON::Field(key: "preferredCommitment")]
        getter preferred_commitment : Types::PreferredCommitment?

        # Retrieves the status of the "savings estimation mode" preference.

        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : String?

        def initialize(
          @member_account_discount_visibility : String? = nil,
          @preferred_commitment : Types::PreferredCommitment? = nil,
          @savings_estimation_mode : String? = nil
        )
        end
      end


      struct GetRecommendationRequest
        include JSON::Serializable

        # The ID for the recommendation.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String

        def initialize(
          @recommendation_id : String
        )
        end
      end


      struct GetRecommendationResponse
        include JSON::Serializable

        # The account to which the recommendation applies.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The type of action you can take by adopting the recommendation.

        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # The lookback period used to calculate cost impact for a recommendation.

        @[JSON::Field(key: "costCalculationLookbackPeriodInDays")]
        getter cost_calculation_lookback_period_in_days : Int32?

        # The currency code used for the recommendation.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # The details for the resource.

        @[JSON::Field(key: "currentResourceDetails")]
        getter current_resource_details : Types::ResourceDetails?

        # The type of resource.

        @[JSON::Field(key: "currentResourceType")]
        getter current_resource_type : String?

        # The estimated monthly cost of the current resource. For Reserved Instances and Savings Plans, it
        # refers to the cost for eligible usage.

        @[JSON::Field(key: "estimatedMonthlyCost")]
        getter estimated_monthly_cost : Float64?

        # The estimated monthly savings amount for the recommendation.

        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Float64?

        # The estimated savings amount over the lookback period used to calculate cost impact for a
        # recommendation.

        @[JSON::Field(key: "estimatedSavingsOverCostCalculationLookbackPeriod")]
        getter estimated_savings_over_cost_calculation_lookback_period : Float64?

        # The estimated savings percentage relative to the total cost over the cost calculation lookback
        # period.

        @[JSON::Field(key: "estimatedSavingsPercentage")]
        getter estimated_savings_percentage : Float64?

        # The effort required to implement the recommendation.

        @[JSON::Field(key: "implementationEffort")]
        getter implementation_effort : String?

        # The time when the recommendation was last generated.

        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The ID for the recommendation.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        # The lookback period that's used to generate the recommendation.

        @[JSON::Field(key: "recommendationLookbackPeriodInDays")]
        getter recommendation_lookback_period_in_days : Int32?

        # The details about the recommended resource.

        @[JSON::Field(key: "recommendedResourceDetails")]
        getter recommended_resource_details : Types::ResourceDetails?

        # The resource type of the recommendation.

        @[JSON::Field(key: "recommendedResourceType")]
        getter recommended_resource_type : String?

        # The Amazon Web Services Region of the resource.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The unique identifier for the resource. This is the same as the Amazon Resource Name (ARN), if
        # available.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Whether or not implementing the recommendation requires a restart.

        @[JSON::Field(key: "restartNeeded")]
        getter restart_needed : Bool?

        # Whether or not implementing the recommendation can be rolled back.

        @[JSON::Field(key: "rollbackPossible")]
        getter rollback_possible : Bool?

        # The source of the recommendation.

        @[JSON::Field(key: "source")]
        getter source : String?

        # A list of tags associated with the resource for which the recommendation exists.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String? = nil,
          @action_type : String? = nil,
          @cost_calculation_lookback_period_in_days : Int32? = nil,
          @currency_code : String? = nil,
          @current_resource_details : Types::ResourceDetails? = nil,
          @current_resource_type : String? = nil,
          @estimated_monthly_cost : Float64? = nil,
          @estimated_monthly_savings : Float64? = nil,
          @estimated_savings_over_cost_calculation_lookback_period : Float64? = nil,
          @estimated_savings_percentage : Float64? = nil,
          @implementation_effort : String? = nil,
          @last_refresh_timestamp : Time? = nil,
          @recommendation_id : String? = nil,
          @recommendation_lookback_period_in_days : Int32? = nil,
          @recommended_resource_details : Types::ResourceDetails? = nil,
          @recommended_resource_type : String? = nil,
          @region : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @restart_needed : Bool? = nil,
          @rollback_possible : Bool? = nil,
          @source : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The instance configuration used for recommendations.

      struct InstanceConfiguration
        include JSON::Serializable

        # The instance type of the configuration.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # An error on the server occurred during the processing of your request. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The Lambda function recommendation details.

      struct LambdaFunction
        include JSON::Serializable

        # The Lambda function configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::LambdaFunctionConfiguration?

        # Cost impact of the recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::LambdaFunctionConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The Lambda function configuration used for recommendations.

      struct LambdaFunctionConfiguration
        include JSON::Serializable

        # Details about the compute configuration.

        @[JSON::Field(key: "compute")]
        getter compute : Types::ComputeConfiguration?

        def initialize(
          @compute : Types::ComputeConfiguration? = nil
        )
        end
      end


      struct ListEfficiencyMetricsRequest
        include JSON::Serializable

        # The time granularity for the cost efficiency metrics. Specify Daily for metrics aggregated by day,
        # or Monthly for metrics aggregated by month.

        @[JSON::Field(key: "granularity")]
        getter granularity : String

        # The time period for which to retrieve the cost efficiency metrics. The start date is inclusive and
        # the end date is exclusive. Dates can be specified in either YYYY-MM-DD format or YYYY-MM format
        # depending on the desired granularity.

        @[JSON::Field(key: "timePeriod")]
        getter time_period : Types::TimePeriod

        # The dimension by which to group the cost efficiency metrics. Valid values include account ID, Amazon
        # Web Services Region. When no grouping is specified, metrics are aggregated across all resources in
        # the specified time period.

        @[JSON::Field(key: "groupBy")]
        getter group_by : String?

        # The maximum number of groups to return in the response. Valid values range from 0 to 1000. Use in
        # conjunction with nextToken to paginate through results when the total number of groups exceeds this
        # limit.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next page of results. This value is returned in the response when the
        # number of groups exceeds the specified maxResults value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ordering specification for the results. Defines which dimension to sort by and whether to sort
        # in ascending or descending order.

        @[JSON::Field(key: "orderBy")]
        getter order_by : Types::OrderBy?

        def initialize(
          @granularity : String,
          @time_period : Types::TimePeriod,
          @group_by : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order_by : Types::OrderBy? = nil
        )
        end
      end


      struct ListEfficiencyMetricsResponse
        include JSON::Serializable

        # A list of cost efficiency metrics grouped by the specified dimension. Each group contains
        # time-series data points with cost efficiency, potential savings, and optimzable spend for the
        # specified time period.

        @[JSON::Field(key: "efficiencyMetricsByGroup")]
        getter efficiency_metrics_by_group : Array(Types::EfficiencyMetricsByGroup)?

        # The token to retrieve the next page of results. When this value is present in the response,
        # additional groups are available. Pass this token in the nextToken parameter of a subsequent request
        # to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @efficiency_metrics_by_group : Array(Types::EfficiencyMetricsByGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnrollmentStatusesRequest
        include JSON::Serializable

        # The account ID of a member account in the organization.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Indicates whether to return the enrollment status for the organization.

        @[JSON::Field(key: "includeOrganizationInfo")]
        getter include_organization_info : Bool?

        # The maximum number of objects that are returned for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String? = nil,
          @include_organization_info : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnrollmentStatusesResponse
        include JSON::Serializable

        # The enrollment status of all member accounts in the organization if the account is the management
        # account or delegated administrator.

        @[JSON::Field(key: "includeMemberAccounts")]
        getter include_member_accounts : Bool?

        # The enrollment status of a specific account ID, including creation and last updated timestamps.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::AccountEnrollmentStatus)?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @include_member_accounts : Bool? = nil,
          @items : Array(Types::AccountEnrollmentStatus)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendationSummariesRequest
        include JSON::Serializable

        # The grouping of recommendations by a dimension.

        @[JSON::Field(key: "groupBy")]
        getter group_by : String


        @[JSON::Field(key: "filter")]
        getter filter : Types::Filter?

        # The maximum number of recommendations to be returned for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Additional metrics to be returned for the request. The only valid value is savingsPercentage .

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(String)?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @group_by : String,
          @filter : Types::Filter? = nil,
          @max_results : Int32? = nil,
          @metrics : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendationSummariesResponse
        include JSON::Serializable

        # The currency code used for the recommendation.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # The total overall savings for the aggregated view.

        @[JSON::Field(key: "estimatedTotalDedupedSavings")]
        getter estimated_total_deduped_savings : Float64?

        # The dimension used to group the recommendations by.

        @[JSON::Field(key: "groupBy")]
        getter group_by : String?

        # A list of all savings recommendations.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::RecommendationSummary)?

        # The results or descriptions for the additional metrics, based on whether the metrics were or were
        # not requested.

        @[JSON::Field(key: "metrics")]
        getter metrics : Types::SummaryMetricsResult?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @currency_code : String? = nil,
          @estimated_total_deduped_savings : Float64? = nil,
          @group_by : String? = nil,
          @items : Array(Types::RecommendationSummary)? = nil,
          @metrics : Types::SummaryMetricsResult? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendationsRequest
        include JSON::Serializable

        # The constraints that you want all returned recommendations to match.

        @[JSON::Field(key: "filter")]
        getter filter : Types::Filter?

        # List of all recommendations for a resource, or a single recommendation if de-duped by resourceId .

        @[JSON::Field(key: "includeAllRecommendations")]
        getter include_all_recommendations : Bool?

        # The maximum number of recommendations that are returned for the request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ordering of recommendations by a dimension.

        @[JSON::Field(key: "orderBy")]
        getter order_by : Types::OrderBy?

        def initialize(
          @filter : Types::Filter? = nil,
          @include_all_recommendations : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order_by : Types::OrderBy? = nil
        )
        end
      end


      struct ListRecommendationsResponse
        include JSON::Serializable

        # List of all savings recommendations.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Recommendation)?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Recommendation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The MemoryDB reserved instances recommendation details. While the API reference uses "MemoryDB
      # reserved instances", the user guide and other documentation refer to them as "MemoryDB reserved
      # nodes", as the terms are used interchangeably.

      struct MemoryDbReservedInstances
        include JSON::Serializable

        # The MemoryDB reserved instances configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::MemoryDbReservedInstancesConfiguration?


        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ReservedInstancesCostCalculation?

        def initialize(
          @configuration : Types::MemoryDbReservedInstancesConfiguration? = nil,
          @cost_calculation : Types::ReservedInstancesCostCalculation? = nil
        )
        end
      end

      # The MemoryDB reserved instances configuration used for recommendations. While the API reference uses
      # "MemoryDB reserved instances", the user guide and other documentation refer to them as "MemoryDB
      # reserved nodes", as the terms are used interchangeably.

      struct MemoryDbReservedInstancesConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "currentGeneration")]
        getter current_generation : String?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "instanceFamily")]
        getter instance_family : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # How much purchasing these reserved instances costs you on a monthly basis.

        @[JSON::Field(key: "monthlyRecurringCost")]
        getter monthly_recurring_cost : String?

        # The number of normalized units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "normalizedUnitsToPurchase")]
        getter normalized_units_to_purchase : String?

        # The number of instances that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "numberOfInstancesToPurchase")]
        getter number_of_instances_to_purchase : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "reservedInstancesRegion")]
        getter reserved_instances_region : String?

        # The service for which you want recommendations.

        @[JSON::Field(key: "service")]
        getter service : String?

        # Determines whether the recommendation is size flexible.

        @[JSON::Field(key: "sizeFlexEligible")]
        getter size_flex_eligible : Bool?

        # The reserved instances recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        # How much purchasing these reserved instances costs you upfront.

        @[JSON::Field(key: "upfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_scope : String? = nil,
          @current_generation : String? = nil,
          @instance_family : String? = nil,
          @instance_type : String? = nil,
          @monthly_recurring_cost : String? = nil,
          @normalized_units_to_purchase : String? = nil,
          @number_of_instances_to_purchase : String? = nil,
          @payment_option : String? = nil,
          @reserved_instances_region : String? = nil,
          @service : String? = nil,
          @size_flex_eligible : Bool? = nil,
          @term : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Contains efficiency metrics for a specific point in time, including an efficiency score, potential
      # savings, optimizable spend, and timestamp.

      struct MetricsByTime
        include JSON::Serializable

        # The estimated savings amount for this time period, representing the potential cost reduction
        # achieved through optimization recommendations.

        @[JSON::Field(key: "savings")]
        getter savings : Float64?

        # The efficiency score for this time period. The score represents a measure of how effectively the
        # cloud resources are being optimized, with higher scores indicating better optimization performance.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        # The total spending amount for this time period.

        @[JSON::Field(key: "spend")]
        getter spend : Float64?

        # The timestamp for this data point. The format depends on the granularity: YYYY-MM-DD for daily
        # metrics, or YYYY-MM for monthly metrics.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : String?

        def initialize(
          @savings : Float64? = nil,
          @score : Float64? = nil,
          @spend : Float64? = nil,
          @timestamp : String? = nil
        )
        end
      end

      # The configuration for the EC2 Auto Scaling group with mixed instance types.

      struct MixedInstanceConfiguration
        include JSON::Serializable

        # The instance type of the configuration.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # The NAT Gateway recommendation details.

      struct NatGateway
        include JSON::Serializable

        # The NAT Gateway configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::NatGatewayConfiguration?


        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::NatGatewayConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The NAT Gateway configuration used for recommendations.

      struct NatGatewayConfiguration
        include JSON::Serializable

        # The number of active connections through the NAT Gateway.

        @[JSON::Field(key: "activeConnectionCount")]
        getter active_connection_count : Int64?

        # The number of packets received from the destination through the NAT Gateway.

        @[JSON::Field(key: "packetsInFromDestination")]
        getter packets_in_from_destination : Int64?

        # The number of packets received from the source through the NAT Gateway.

        @[JSON::Field(key: "packetsInFromSource")]
        getter packets_in_from_source : Int64?

        def initialize(
          @active_connection_count : Int64? = nil,
          @packets_in_from_destination : Int64? = nil,
          @packets_in_from_source : Int64? = nil
        )
        end
      end

      # The OpenSearch reserved instances recommendation details.

      struct OpenSearchReservedInstances
        include JSON::Serializable

        # The OpenSearch reserved instances configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::OpenSearchReservedInstancesConfiguration?

        # Cost impact of the purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ReservedInstancesCostCalculation?

        def initialize(
          @configuration : Types::OpenSearchReservedInstancesConfiguration? = nil,
          @cost_calculation : Types::ReservedInstancesCostCalculation? = nil
        )
        end
      end

      # The OpenSearch reserved instances configuration used for recommendations.

      struct OpenSearchReservedInstancesConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "currentGeneration")]
        getter current_generation : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # How much purchasing these reserved instances costs you on a monthly basis.

        @[JSON::Field(key: "monthlyRecurringCost")]
        getter monthly_recurring_cost : String?

        # The number of normalized units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "normalizedUnitsToPurchase")]
        getter normalized_units_to_purchase : String?

        # The number of instances that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "numberOfInstancesToPurchase")]
        getter number_of_instances_to_purchase : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "reservedInstancesRegion")]
        getter reserved_instances_region : String?

        # The service for which you want recommendations.

        @[JSON::Field(key: "service")]
        getter service : String?

        # Determines whether the recommendation is size flexible.

        @[JSON::Field(key: "sizeFlexEligible")]
        getter size_flex_eligible : Bool?

        # The reserved instances recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        # How much purchasing this instance costs you upfront.

        @[JSON::Field(key: "upfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_scope : String? = nil,
          @current_generation : String? = nil,
          @instance_type : String? = nil,
          @monthly_recurring_cost : String? = nil,
          @normalized_units_to_purchase : String? = nil,
          @number_of_instances_to_purchase : String? = nil,
          @payment_option : String? = nil,
          @reserved_instances_region : String? = nil,
          @service : String? = nil,
          @size_flex_eligible : Bool? = nil,
          @term : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Defines how rows will be sorted in the response.

      struct OrderBy
        include JSON::Serializable

        # Sorts by dimension values.

        @[JSON::Field(key: "dimension")]
        getter dimension : String?

        # The order that's used to sort the data.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @dimension : String? = nil,
          @order : String? = nil
        )
        end
      end

      # The preferred configuration for Reserved Instances and Savings Plans commitment-based discounts,
      # consisting of a payment option and a commitment duration.

      struct PreferredCommitment
        include JSON::Serializable

        # The preferred upfront payment structure for commitments. If the value is null, it will default to
        # AllUpfront (highest savings) where applicable.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The preferred length of the commitment period. If the value is null, it will default to ThreeYears
        # (highest savings) where applicable.

        @[JSON::Field(key: "term")]
        getter term : String?

        def initialize(
          @payment_option : String? = nil,
          @term : String? = nil
        )
        end
      end

      # Contains the details of an Amazon RDS DB instance.

      struct RdsDbInstance
        include JSON::Serializable

        # The Amazon RDS DB instance configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RdsDbInstanceConfiguration?


        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::RdsDbInstanceConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The Amazon RDS DB instance configuration used for recommendations.

      struct RdsDbInstanceConfiguration
        include JSON::Serializable

        # Details about the instance configuration.

        @[JSON::Field(key: "instance")]
        getter instance : Types::DbInstanceConfiguration?

        def initialize(
          @instance : Types::DbInstanceConfiguration? = nil
        )
        end
      end

      # Contains the details of an Amazon RDS DB instance storage.

      struct RdsDbInstanceStorage
        include JSON::Serializable

        # The Amazon RDS DB instance storage configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RdsDbInstanceStorageConfiguration?


        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ResourceCostCalculation?

        def initialize(
          @configuration : Types::RdsDbInstanceStorageConfiguration? = nil,
          @cost_calculation : Types::ResourceCostCalculation? = nil
        )
        end
      end

      # The Amazon RDS DB instance storage configuration used for recommendations.

      struct RdsDbInstanceStorageConfiguration
        include JSON::Serializable

        # The new amount of storage in GB to allocate for the DB instance.

        @[JSON::Field(key: "allocatedStorageInGb")]
        getter allocated_storage_in_gb : Float64?

        # The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for
        # the DB instance.

        @[JSON::Field(key: "iops")]
        getter iops : Float64?

        # The storage throughput for the DB instance.

        @[JSON::Field(key: "storageThroughput")]
        getter storage_throughput : Float64?

        # The storage type to associate with the DB instance.

        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        def initialize(
          @allocated_storage_in_gb : Float64? = nil,
          @iops : Float64? = nil,
          @storage_throughput : Float64? = nil,
          @storage_type : String? = nil
        )
        end
      end

      # The RDS reserved instances recommendation details.

      struct RdsReservedInstances
        include JSON::Serializable

        # The RDS reserved instances configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RdsReservedInstancesConfiguration?

        # Cost impact of the purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ReservedInstancesCostCalculation?

        def initialize(
          @configuration : Types::RdsReservedInstancesConfiguration? = nil,
          @cost_calculation : Types::ReservedInstancesCostCalculation? = nil
        )
        end
      end

      # The RDS reserved instances configuration used for recommendations.

      struct RdsReservedInstancesConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "currentGeneration")]
        getter current_generation : String?

        # The database edition that the recommended reservation supports.

        @[JSON::Field(key: "databaseEdition")]
        getter database_edition : String?

        # The database engine that the recommended reservation supports.

        @[JSON::Field(key: "databaseEngine")]
        getter database_engine : String?

        # Determines whether the recommendation is for a reservation in a single Availability Zone or a
        # reservation with a backup in a second Availability Zone.

        @[JSON::Field(key: "deploymentOption")]
        getter deployment_option : String?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "instanceFamily")]
        getter instance_family : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The license model that the recommended reservation supports.

        @[JSON::Field(key: "licenseModel")]
        getter license_model : String?

        # How much purchasing this instance costs you on a monthly basis.

        @[JSON::Field(key: "monthlyRecurringCost")]
        getter monthly_recurring_cost : String?

        # The number of normalized units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "normalizedUnitsToPurchase")]
        getter normalized_units_to_purchase : String?

        # The number of instances that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "numberOfInstancesToPurchase")]
        getter number_of_instances_to_purchase : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "reservedInstancesRegion")]
        getter reserved_instances_region : String?

        # The service for which you want recommendations.

        @[JSON::Field(key: "service")]
        getter service : String?

        # Determines whether the recommendation is size flexible.

        @[JSON::Field(key: "sizeFlexEligible")]
        getter size_flex_eligible : Bool?

        # The reserved instances recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        # How much purchasing this instance costs you upfront.

        @[JSON::Field(key: "upfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_scope : String? = nil,
          @current_generation : String? = nil,
          @database_edition : String? = nil,
          @database_engine : String? = nil,
          @deployment_option : String? = nil,
          @instance_family : String? = nil,
          @instance_type : String? = nil,
          @license_model : String? = nil,
          @monthly_recurring_cost : String? = nil,
          @normalized_units_to_purchase : String? = nil,
          @number_of_instances_to_purchase : String? = nil,
          @payment_option : String? = nil,
          @reserved_instances_region : String? = nil,
          @service : String? = nil,
          @size_flex_eligible : Bool? = nil,
          @term : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Describes a recommendation.

      struct Recommendation
        include JSON::Serializable

        # The account to which the recommendation applies.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The type of tasks that can be carried out by this action.

        @[JSON::Field(key: "actionType")]
        getter action_type : String?

        # The currency code used for the recommendation.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # Describes the current resource.

        @[JSON::Field(key: "currentResourceSummary")]
        getter current_resource_summary : String?

        # The current resource type.

        @[JSON::Field(key: "currentResourceType")]
        getter current_resource_type : String?

        # The estimated monthly cost of the current resource. For Reserved Instances and Savings Plans, it
        # refers to the cost for eligible usage.

        @[JSON::Field(key: "estimatedMonthlyCost")]
        getter estimated_monthly_cost : Float64?

        # The estimated monthly savings amount for the recommendation.

        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Float64?

        # The estimated savings percentage relative to the total cost over the cost calculation lookback
        # period.

        @[JSON::Field(key: "estimatedSavingsPercentage")]
        getter estimated_savings_percentage : Float64?

        # The effort required to implement the recommendation.

        @[JSON::Field(key: "implementationEffort")]
        getter implementation_effort : String?

        # The time when the recommendation was last generated.

        @[JSON::Field(key: "lastRefreshTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_refresh_timestamp : Time?

        # The ID for the recommendation.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        # The lookback period that's used to generate the recommendation.

        @[JSON::Field(key: "recommendationLookbackPeriodInDays")]
        getter recommendation_lookback_period_in_days : Int32?

        # Describes the recommended resource.

        @[JSON::Field(key: "recommendedResourceSummary")]
        getter recommended_resource_summary : String?

        # The recommended resource type.

        @[JSON::Field(key: "recommendedResourceType")]
        getter recommended_resource_type : String?

        # The Amazon Web Services Region of the resource.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Resource Name (ARN) for the recommendation.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The resource ID for the recommendation.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Whether or not implementing the recommendation requires a restart.

        @[JSON::Field(key: "restartNeeded")]
        getter restart_needed : Bool?

        # Whether or not implementing the recommendation can be rolled back.

        @[JSON::Field(key: "rollbackPossible")]
        getter rollback_possible : Bool?

        # The source of the recommendation.

        @[JSON::Field(key: "source")]
        getter source : String?

        # A list of tags assigned to the recommendation.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String? = nil,
          @action_type : String? = nil,
          @currency_code : String? = nil,
          @current_resource_summary : String? = nil,
          @current_resource_type : String? = nil,
          @estimated_monthly_cost : Float64? = nil,
          @estimated_monthly_savings : Float64? = nil,
          @estimated_savings_percentage : Float64? = nil,
          @implementation_effort : String? = nil,
          @last_refresh_timestamp : Time? = nil,
          @recommendation_id : String? = nil,
          @recommendation_lookback_period_in_days : Int32? = nil,
          @recommended_resource_summary : String? = nil,
          @recommended_resource_type : String? = nil,
          @region : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @restart_needed : Bool? = nil,
          @rollback_possible : Bool? = nil,
          @source : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The summary of rightsizing recommendations, including de-duped savings from all types of
      # recommendations.

      struct RecommendationSummary
        include JSON::Serializable

        # The estimated total savings resulting from modifications, on a monthly basis.

        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Float64?

        # The grouping of recommendations.

        @[JSON::Field(key: "group")]
        getter group : String?

        # The total number of instance recommendations.

        @[JSON::Field(key: "recommendationCount")]
        getter recommendation_count : Int32?

        def initialize(
          @estimated_monthly_savings : Float64? = nil,
          @group : String? = nil,
          @recommendation_count : Int32? = nil
        )
        end
      end

      # The Redshift reserved instances recommendation details.

      struct RedshiftReservedInstances
        include JSON::Serializable

        # The Redshift reserved instances configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RedshiftReservedInstancesConfiguration?

        # Cost impact of the purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::ReservedInstancesCostCalculation?

        def initialize(
          @configuration : Types::RedshiftReservedInstancesConfiguration? = nil,
          @cost_calculation : Types::ReservedInstancesCostCalculation? = nil
        )
        end
      end

      # The Redshift reserved instances configuration used for recommendations.

      struct RedshiftReservedInstancesConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "currentGeneration")]
        getter current_generation : String?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "instanceFamily")]
        getter instance_family : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # How much purchasing these reserved instances costs you on a monthly basis.

        @[JSON::Field(key: "monthlyRecurringCost")]
        getter monthly_recurring_cost : String?

        # The number of normalized units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "normalizedUnitsToPurchase")]
        getter normalized_units_to_purchase : String?

        # The number of instances that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "numberOfInstancesToPurchase")]
        getter number_of_instances_to_purchase : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Amazon Web Services Region of the commitment.

        @[JSON::Field(key: "reservedInstancesRegion")]
        getter reserved_instances_region : String?

        # The service for which you want recommendations.

        @[JSON::Field(key: "service")]
        getter service : String?

        # Determines whether the recommendation is size flexible.

        @[JSON::Field(key: "sizeFlexEligible")]
        getter size_flex_eligible : Bool?

        # The reserved instances recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        # How much purchasing this instance costs you upfront.

        @[JSON::Field(key: "upfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_scope : String? = nil,
          @current_generation : String? = nil,
          @instance_family : String? = nil,
          @instance_type : String? = nil,
          @monthly_recurring_cost : String? = nil,
          @normalized_units_to_purchase : String? = nil,
          @number_of_instances_to_purchase : String? = nil,
          @payment_option : String? = nil,
          @reserved_instances_region : String? = nil,
          @service : String? = nil,
          @size_flex_eligible : Bool? = nil,
          @term : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Cost impact of the purchase recommendation.

      struct ReservedInstancesCostCalculation
        include JSON::Serializable

        # Pricing details of the purchase recommendation.

        @[JSON::Field(key: "pricing")]
        getter pricing : Types::ReservedInstancesPricing?

        def initialize(
          @pricing : Types::ReservedInstancesPricing? = nil
        )
        end
      end

      # Pricing details for your recommended reserved instance.

      struct ReservedInstancesPricing
        include JSON::Serializable

        # The estimated cost of your recurring monthly fees for the recommended reserved instance across the
        # month.

        @[JSON::Field(key: "estimatedMonthlyAmortizedReservationCost")]
        getter estimated_monthly_amortized_reservation_cost : Float64?

        # The remaining On-Demand cost estimated to not be covered by the recommended reserved instance, over
        # the length of the lookback period.

        @[JSON::Field(key: "estimatedOnDemandCost")]
        getter estimated_on_demand_cost : Float64?

        # The cost of paying for the recommended reserved instance monthly.

        @[JSON::Field(key: "monthlyReservationEligibleCost")]
        getter monthly_reservation_eligible_cost : Float64?

        # The savings percentage relative to the total On-Demand costs that are associated with this instance.

        @[JSON::Field(key: "savingsPercentage")]
        getter savings_percentage : Float64?

        def initialize(
          @estimated_monthly_amortized_reservation_cost : Float64? = nil,
          @estimated_on_demand_cost : Float64? = nil,
          @monthly_reservation_eligible_cost : Float64? = nil,
          @savings_percentage : Float64? = nil
        )
        end
      end

      # Cost impact of the resource recommendation.

      struct ResourceCostCalculation
        include JSON::Serializable

        # Pricing details of the resource recommendation.

        @[JSON::Field(key: "pricing")]
        getter pricing : Types::ResourcePricing?

        # Usage details of the resource recommendation.

        @[JSON::Field(key: "usages")]
        getter usages : Array(Types::Usage)?

        def initialize(
          @pricing : Types::ResourcePricing? = nil,
          @usages : Array(Types::Usage)? = nil
        )
        end
      end

      # Contains detailed information about the specified resource.

      struct ResourceDetails
        include JSON::Serializable

        # The Aurora DB cluster storage recommendation details.

        @[JSON::Field(key: "auroraDbClusterStorage")]
        getter aurora_db_cluster_storage : Types::AuroraDbClusterStorage?

        # The Compute Savings Plans recommendation details.

        @[JSON::Field(key: "computeSavingsPlans")]
        getter compute_savings_plans : Types::ComputeSavingsPlans?

        # The DynamoDB reserved capacity recommendation details.

        @[JSON::Field(key: "dynamoDbReservedCapacity")]
        getter dynamo_db_reserved_capacity : Types::DynamoDbReservedCapacity?

        # The Amazon Elastic Block Store volume recommendation details.

        @[JSON::Field(key: "ebsVolume")]
        getter ebs_volume : Types::EbsVolume?

        # The EC2 Auto Scaling group recommendation details.

        @[JSON::Field(key: "ec2AutoScalingGroup")]
        getter ec2_auto_scaling_group : Types::Ec2AutoScalingGroup?

        # The EC2 instance recommendation details.

        @[JSON::Field(key: "ec2Instance")]
        getter ec2_instance : Types::Ec2Instance?

        # The EC2 instance Savings Plans recommendation details.

        @[JSON::Field(key: "ec2InstanceSavingsPlans")]
        getter ec2_instance_savings_plans : Types::Ec2InstanceSavingsPlans?

        # The EC2 reserved instances recommendation details.

        @[JSON::Field(key: "ec2ReservedInstances")]
        getter ec2_reserved_instances : Types::Ec2ReservedInstances?

        # The ECS service recommendation details.

        @[JSON::Field(key: "ecsService")]
        getter ecs_service : Types::EcsService?

        # The ElastiCache reserved instances recommendation details.

        @[JSON::Field(key: "elastiCacheReservedInstances")]
        getter elasti_cache_reserved_instances : Types::ElastiCacheReservedInstances?

        # The Lambda function recommendation details.

        @[JSON::Field(key: "lambdaFunction")]
        getter lambda_function : Types::LambdaFunction?

        # The MemoryDB reserved instances recommendation details.

        @[JSON::Field(key: "memoryDbReservedInstances")]
        getter memory_db_reserved_instances : Types::MemoryDbReservedInstances?

        # The NAT Gateway recommendation details.

        @[JSON::Field(key: "natGateway")]
        getter nat_gateway : Types::NatGateway?

        # The OpenSearch reserved instances recommendation details.

        @[JSON::Field(key: "openSearchReservedInstances")]
        getter open_search_reserved_instances : Types::OpenSearchReservedInstances?

        # The DB instance recommendation details.

        @[JSON::Field(key: "rdsDbInstance")]
        getter rds_db_instance : Types::RdsDbInstance?

        # The DB instance storage recommendation details.

        @[JSON::Field(key: "rdsDbInstanceStorage")]
        getter rds_db_instance_storage : Types::RdsDbInstanceStorage?

        # The RDS reserved instances recommendation details.

        @[JSON::Field(key: "rdsReservedInstances")]
        getter rds_reserved_instances : Types::RdsReservedInstances?

        # The Redshift reserved instances recommendation details.

        @[JSON::Field(key: "redshiftReservedInstances")]
        getter redshift_reserved_instances : Types::RedshiftReservedInstances?

        # The SageMaker AI Savings Plans recommendation details.

        @[JSON::Field(key: "sageMakerSavingsPlans")]
        getter sage_maker_savings_plans : Types::SageMakerSavingsPlans?

        def initialize(
          @aurora_db_cluster_storage : Types::AuroraDbClusterStorage? = nil,
          @compute_savings_plans : Types::ComputeSavingsPlans? = nil,
          @dynamo_db_reserved_capacity : Types::DynamoDbReservedCapacity? = nil,
          @ebs_volume : Types::EbsVolume? = nil,
          @ec2_auto_scaling_group : Types::Ec2AutoScalingGroup? = nil,
          @ec2_instance : Types::Ec2Instance? = nil,
          @ec2_instance_savings_plans : Types::Ec2InstanceSavingsPlans? = nil,
          @ec2_reserved_instances : Types::Ec2ReservedInstances? = nil,
          @ecs_service : Types::EcsService? = nil,
          @elasti_cache_reserved_instances : Types::ElastiCacheReservedInstances? = nil,
          @lambda_function : Types::LambdaFunction? = nil,
          @memory_db_reserved_instances : Types::MemoryDbReservedInstances? = nil,
          @nat_gateway : Types::NatGateway? = nil,
          @open_search_reserved_instances : Types::OpenSearchReservedInstances? = nil,
          @rds_db_instance : Types::RdsDbInstance? = nil,
          @rds_db_instance_storage : Types::RdsDbInstanceStorage? = nil,
          @rds_reserved_instances : Types::RdsReservedInstances? = nil,
          @redshift_reserved_instances : Types::RedshiftReservedInstances? = nil,
          @sage_maker_savings_plans : Types::SageMakerSavingsPlans? = nil
        )
        end
      end

      # The specified Amazon Resource Name (ARN) in the request doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that was not found.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_id : String
        )
        end
      end

      # Contains pricing information about the specified resource.

      struct ResourcePricing
        include JSON::Serializable

        # The savings estimate incorporating all discounts with Amazon Web Services, such as Reserved
        # Instances and Savings Plans.

        @[JSON::Field(key: "estimatedCostAfterDiscounts")]
        getter estimated_cost_after_discounts : Float64?

        # The savings estimate using Amazon Web Services public pricing without incorporating any discounts.

        @[JSON::Field(key: "estimatedCostBeforeDiscounts")]
        getter estimated_cost_before_discounts : Float64?

        # The estimated discounts for a recommendation.

        @[JSON::Field(key: "estimatedDiscounts")]
        getter estimated_discounts : Types::EstimatedDiscounts?

        # The estimated net unused amortized commitment for the recommendation.

        @[JSON::Field(key: "estimatedNetUnusedAmortizedCommitments")]
        getter estimated_net_unused_amortized_commitments : Float64?

        def initialize(
          @estimated_cost_after_discounts : Float64? = nil,
          @estimated_cost_before_discounts : Float64? = nil,
          @estimated_discounts : Types::EstimatedDiscounts? = nil,
          @estimated_net_unused_amortized_commitments : Float64? = nil
        )
        end
      end

      # The SageMaker Savings Plans recommendation details.

      struct SageMakerSavingsPlans
        include JSON::Serializable

        # The SageMaker Savings Plans configuration used for recommendations.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::SageMakerSavingsPlansConfiguration?

        # Cost impact of the Savings Plans purchase recommendation.

        @[JSON::Field(key: "costCalculation")]
        getter cost_calculation : Types::SavingsPlansCostCalculation?

        def initialize(
          @configuration : Types::SageMakerSavingsPlansConfiguration? = nil,
          @cost_calculation : Types::SavingsPlansCostCalculation? = nil
        )
        end
      end

      # The SageMaker Savings Plans configuration used for recommendations.

      struct SageMakerSavingsPlansConfiguration
        include JSON::Serializable

        # The account scope for which you want recommendations.

        @[JSON::Field(key: "accountScope")]
        getter account_scope : String?

        # The hourly commitment for the Savings Plans type.

        @[JSON::Field(key: "hourlyCommitment")]
        getter hourly_commitment : String?

        # The payment option for the commitment.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The Savings Plans recommendation term in years.

        @[JSON::Field(key: "term")]
        getter term : String?

        def initialize(
          @account_scope : String? = nil,
          @hourly_commitment : String? = nil,
          @payment_option : String? = nil,
          @term : String? = nil
        )
        end
      end

      # Cost impact of the purchase recommendation.

      struct SavingsPlansCostCalculation
        include JSON::Serializable

        # Pricing details of the purchase recommendation.

        @[JSON::Field(key: "pricing")]
        getter pricing : Types::SavingsPlansPricing?

        def initialize(
          @pricing : Types::SavingsPlansPricing? = nil
        )
        end
      end

      # Pricing information about a Savings Plans.

      struct SavingsPlansPricing
        include JSON::Serializable

        # Estimated monthly commitment for the Savings Plans.

        @[JSON::Field(key: "estimatedMonthlyCommitment")]
        getter estimated_monthly_commitment : Float64?

        # Estimated On-Demand cost you will pay after buying the Savings Plans.

        @[JSON::Field(key: "estimatedOnDemandCost")]
        getter estimated_on_demand_cost : Float64?

        # The cost of paying for the recommended Savings Plans monthly.

        @[JSON::Field(key: "monthlySavingsPlansEligibleCost")]
        getter monthly_savings_plans_eligible_cost : Float64?

        # Estimated savings as a percentage of your overall costs after buying the Savings Plans.

        @[JSON::Field(key: "savingsPercentage")]
        getter savings_percentage : Float64?

        def initialize(
          @estimated_monthly_commitment : Float64? = nil,
          @estimated_on_demand_cost : Float64? = nil,
          @monthly_savings_plans_eligible_cost : Float64? = nil,
          @savings_percentage : Float64? = nil
        )
        end
      end

      # The storage configuration used for recommendations.

      struct StorageConfiguration
        include JSON::Serializable

        # The storage volume.

        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Float64?

        # The storage type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @size_in_gb : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # The results or descriptions for the additional metrics, based on whether the metrics were or were
      # not requested.

      struct SummaryMetricsResult
        include JSON::Serializable

        # The savings percentage based on your Amazon Web Services spend over the past 30 days. Savings
        # percentage is only supported when filtering by Region, account ID, or tags.

        @[JSON::Field(key: "savingsPercentage")]
        getter savings_percentage : String?

        def initialize(
          @savings_percentage : String? = nil
        )
        end
      end

      # The tag structure that contains a tag key and value.

      struct Tag
        include JSON::Serializable

        # The key that's associated with the tag.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The value that's associated with the tag.

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
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies a date range for retrieving efficiency metrics. The start date is inclusive and the end
      # date is exclusive.

      struct TimePeriod
        include JSON::Serializable

        # The end of the time period (exclusive). Specify the date in ISO 8601 format, such as 2024-12-31.

        @[JSON::Field(key: "end")]
        getter end : String

        # The beginning of the time period (inclusive). Specify the date in ISO 8601 format, such as
        # 2024-01-01.

        @[JSON::Field(key: "start")]
        getter start : String

        def initialize(
          @end : String,
          @start : String
        )
        end
      end


      struct UpdateEnrollmentStatusRequest
        include JSON::Serializable

        # Sets the account status.

        @[JSON::Field(key: "status")]
        getter status : String

        # Indicates whether to enroll member accounts of the organization if the account is the management
        # account or delegated administrator.

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

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct UpdatePreferencesRequest
        include JSON::Serializable

        # Sets the "member account discount visibility" preference.

        @[JSON::Field(key: "memberAccountDiscountVisibility")]
        getter member_account_discount_visibility : String?

        # Sets the preferences for how Reserved Instances and Savings Plans cost-saving opportunities are
        # prioritized in terms of payment option and term length.

        @[JSON::Field(key: "preferredCommitment")]
        getter preferred_commitment : Types::PreferredCommitment?

        # Sets the "savings estimation mode" preference.

        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : String?

        def initialize(
          @member_account_discount_visibility : String? = nil,
          @preferred_commitment : Types::PreferredCommitment? = nil,
          @savings_estimation_mode : String? = nil
        )
        end
      end


      struct UpdatePreferencesResponse
        include JSON::Serializable

        # Shows the status of the "member account discount visibility" preference.

        @[JSON::Field(key: "memberAccountDiscountVisibility")]
        getter member_account_discount_visibility : String?

        # Shows the updated preferences for how Reserved Instances and Savings Plans cost-saving opportunities
        # are prioritized in terms of payment option and term length.

        @[JSON::Field(key: "preferredCommitment")]
        getter preferred_commitment : Types::PreferredCommitment?

        # Shows the status of the "savings estimation mode" preference.

        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : String?

        def initialize(
          @member_account_discount_visibility : String? = nil,
          @preferred_commitment : Types::PreferredCommitment? = nil,
          @savings_estimation_mode : String? = nil
        )
        end
      end

      # Details about the usage.

      struct Usage
        include JSON::Serializable

        # The operation value.

        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The product code.

        @[JSON::Field(key: "productCode")]
        getter product_code : String?

        # The usage unit.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # The usage amount.

        @[JSON::Field(key: "usageAmount")]
        getter usage_amount : Float64?

        # The usage type.

        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @operation : String? = nil,
          @product_code : String? = nil,
          @unit : String? = nil,
          @usage_amount : Float64? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The list of fields that are invalid.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionDetail)?

        # The reason for the validation exception.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionDetail)? = nil,
          @reason : String? = nil
        )
        end
      end

      # The input failed to meet the constraints specified by the Amazon Web Services service in a specified
      # field.

      struct ValidationExceptionDetail
        include JSON::Serializable

        # The field name where the invalid entry was detected.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        # A message with the reason for the validation exception error.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @field_name : String,
          @message : String
        )
        end
      end
    end
  end
end
