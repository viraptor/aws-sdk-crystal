require "json"
require "time"

module AwsSdk
  module BCMPricingCalculator
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Represents an action to add a Reserved Instance to a bill scenario.
      struct AddReservedInstanceAction
        include JSON::Serializable

        # The number of instances to add for this Reserved Instance offering.
        @[JSON::Field(key: "instanceCount")]
        getter instance_count : Int32?

        # The ID of the Reserved Instance offering to add. For more information, see
        # DescribeReservedInstancesOfferings .
        @[JSON::Field(key: "reservedInstancesOfferingId")]
        getter reserved_instances_offering_id : String?

        def initialize(
          @instance_count : Int32? = nil,
          @reserved_instances_offering_id : String? = nil
        )
        end
      end

      # Represents an action to add a Savings Plan to a bill scenario.
      struct AddSavingsPlanAction
        include JSON::Serializable

        # The hourly commitment, in the same currency of the savingsPlanOfferingId . This is a value between
        # 0.001 and 1 million. You cannot specify more than five digits after the decimal point.
        @[JSON::Field(key: "commitment")]
        getter commitment : Float64?

        # The ID of the Savings Plan offering to add. For more information, see DescribeSavingsPlansOfferings
        # .
        @[JSON::Field(key: "savingsPlanOfferingId")]
        getter savings_plan_offering_id : String?

        def initialize(
          @commitment : Float64? = nil,
          @savings_plan_offering_id : String? = nil
        )
        end
      end

      # Represents an entry object in the batch operation to create bill scenario commitment modifications.
      struct BatchCreateBillScenarioCommitmentModificationEntry
        include JSON::Serializable

        # The specific commitment action to be taken (e.g., adding a Reserved Instance or Savings Plan).
        @[JSON::Field(key: "commitmentAction")]
        getter commitment_action : Types::BillScenarioCommitmentModificationAction

        # A unique identifier for this entry in the batch operation. This can be any valid string. This key is
        # useful to identify errors associated with any commitment entry as any error is returned with this
        # key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The Amazon Web Services account ID to which this commitment will be applied to.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String

        # An optional group identifier for the commitment modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        def initialize(
          @commitment_action : Types::BillScenarioCommitmentModificationAction,
          @key : String,
          @usage_account_id : String,
          @group : String? = nil
        )
        end
      end

      # Represents an error that occurred during a batch create operation for bill scenario commitment
      # modifications.
      struct BatchCreateBillScenarioCommitmentModificationError
        include JSON::Serializable

        # The error code associated with the failed operation.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A descriptive message for the error that occurred.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The key of the entry that caused the error.
        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Represents a successfully created item in a batch operation for bill scenario commitment
      # modifications.
      struct BatchCreateBillScenarioCommitmentModificationItem
        include JSON::Serializable

        # The specific commitment action that was taken.
        @[JSON::Field(key: "commitmentAction")]
        getter commitment_action : Types::BillScenarioCommitmentModificationAction?

        # The group identifier for the created commitment modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        # The unique identifier assigned to the created commitment modification.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The key of the successfully created entry. This can be any valid string. This key is useful to
        # identify errors associated with any commitment entry as any error is returned with this key.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The Amazon Web Services account ID associated with the created commitment modification.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @commitment_action : Types::BillScenarioCommitmentModificationAction? = nil,
          @group : String? = nil,
          @id : String? = nil,
          @key : String? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      struct BatchCreateBillScenarioCommitmentModificationRequest
        include JSON::Serializable

        # The ID of the Bill Scenario for which you want to create the modeled commitment.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # List of commitments that you want to model in the Bill Scenario.
        @[JSON::Field(key: "commitmentModifications")]
        getter commitment_modifications : Array(Types::BatchCreateBillScenarioCommitmentModificationEntry)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @bill_scenario_id : String,
          @commitment_modifications : Array(Types::BatchCreateBillScenarioCommitmentModificationEntry),
          @client_token : String? = nil
        )
        end
      end

      struct BatchCreateBillScenarioCommitmentModificationResponse
        include JSON::Serializable

        # Returns the list of errors reason and the commitment item keys that cannot be created in the Bill
        # Scenario.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchCreateBillScenarioCommitmentModificationError)?

        # Returns the list of successful commitment line items that were created for the Bill Scenario.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BatchCreateBillScenarioCommitmentModificationItem)?

        def initialize(
          @errors : Array(Types::BatchCreateBillScenarioCommitmentModificationError)? = nil,
          @items : Array(Types::BatchCreateBillScenarioCommitmentModificationItem)? = nil
        )
        end
      end

      # Represents an entry in a batch operation to create bill scenario usage modifications.
      struct BatchCreateBillScenarioUsageModificationEntry
        include JSON::Serializable

        # A unique identifier for this entry in the batch operation. This can be any valid string. This key is
        # useful to identify errors associated with any usage entry as any error is returned with this key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The specific operation associated with this usage modification. Describes the specific Amazon Web
        # Services operation that this usage line models. For example, RunInstances indicates the operation of
        # an Amazon EC2 instance.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code for this usage modification. This identifies the specific
        # Amazon Web Services service to the customer as a unique short abbreviation. For example, AmazonEC2
        # and AWSKMS .
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The Amazon Web Services account ID to which this usage will be applied to.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String

        # Describes the usage details of the usage line item.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The amount of usage you want to create for the service use you are modeling.
        @[JSON::Field(key: "amounts")]
        getter amounts : Array(Types::UsageAmount)?

        # The Availability Zone that this usage line uses.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # An optional group identifier for the usage modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        # Historical usage data associated with this modification, if available.
        @[JSON::Field(key: "historicalUsage")]
        getter historical_usage : Types::HistoricalUsageEntity?

        def initialize(
          @key : String,
          @operation : String,
          @service_code : String,
          @usage_account_id : String,
          @usage_type : String,
          @amounts : Array(Types::UsageAmount)? = nil,
          @availability_zone : String? = nil,
          @group : String? = nil,
          @historical_usage : Types::HistoricalUsageEntity? = nil
        )
        end
      end

      # Represents an error that occurred during a batch create operation for bill scenario usage
      # modifications.
      struct BatchCreateBillScenarioUsageModificationError
        include JSON::Serializable

        # The error code associated with the failed operation.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A descriptive message for the error that occurred.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The key of the entry that caused the error.
        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Represents a successfully created item in a batch operation for bill scenario usage modifications.
      struct BatchCreateBillScenarioUsageModificationItem
        include JSON::Serializable

        # The specific operation associated with this usage modification.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code for this usage modification.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The type of usage that was modified.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The availability zone associated with this usage modification, if applicable.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The group identifier for the created usage modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        # Historical usage data associated with this modification, if available.
        @[JSON::Field(key: "historicalUsage")]
        getter historical_usage : Types::HistoricalUsageEntity?

        # The unique identifier assigned to the created usage modification.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The key of the successfully created entry.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The location associated with this usage modification.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The modified usage quantities.
        @[JSON::Field(key: "quantities")]
        getter quantities : Array(Types::UsageQuantity)?

        # The Amazon Web Services account ID associated with the created usage modification.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @operation : String,
          @service_code : String,
          @usage_type : String,
          @availability_zone : String? = nil,
          @group : String? = nil,
          @historical_usage : Types::HistoricalUsageEntity? = nil,
          @id : String? = nil,
          @key : String? = nil,
          @location : String? = nil,
          @quantities : Array(Types::UsageQuantity)? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      struct BatchCreateBillScenarioUsageModificationRequest
        include JSON::Serializable

        # The ID of the Bill Scenario for which you want to create the modeled usage.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # List of usage that you want to model in the Bill Scenario.
        @[JSON::Field(key: "usageModifications")]
        getter usage_modifications : Array(Types::BatchCreateBillScenarioUsageModificationEntry)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @bill_scenario_id : String,
          @usage_modifications : Array(Types::BatchCreateBillScenarioUsageModificationEntry),
          @client_token : String? = nil
        )
        end
      end

      struct BatchCreateBillScenarioUsageModificationResponse
        include JSON::Serializable

        # Returns the list of errors reason and the usage item keys that cannot be created in the Bill
        # Scenario.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchCreateBillScenarioUsageModificationError)?

        # Returns the list of successful usage line items that were created for the Bill Scenario.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BatchCreateBillScenarioUsageModificationItem)?

        def initialize(
          @errors : Array(Types::BatchCreateBillScenarioUsageModificationError)? = nil,
          @items : Array(Types::BatchCreateBillScenarioUsageModificationItem)? = nil
        )
        end
      end

      # Represents an entry in a batch operation to create workload estimate usage.
      struct BatchCreateWorkloadEstimateUsageEntry
        include JSON::Serializable

        # The estimated usage amount.
        @[JSON::Field(key: "amount")]
        getter amount : Float64

        # A unique identifier for this entry in the batch operation.
        @[JSON::Field(key: "key")]
        getter key : String

        # The specific operation associated with this usage estimate.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code for this usage estimate.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The Amazon Web Services account ID associated with this usage estimate.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String

        # The type of usage being estimated.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # An optional group identifier for the usage estimate.
        @[JSON::Field(key: "group")]
        getter group : String?

        # Historical usage data associated with this estimate, if available.
        @[JSON::Field(key: "historicalUsage")]
        getter historical_usage : Types::HistoricalUsageEntity?

        def initialize(
          @amount : Float64,
          @key : String,
          @operation : String,
          @service_code : String,
          @usage_account_id : String,
          @usage_type : String,
          @group : String? = nil,
          @historical_usage : Types::HistoricalUsageEntity? = nil
        )
        end
      end

      # Represents an error that occurred during a batch create operation for workload estimate usage.
      struct BatchCreateWorkloadEstimateUsageError
        include JSON::Serializable

        # The error code associated with the failed operation.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A descriptive message for the error that occurred.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The key of the entry that caused the error.
        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Represents a successfully created item in a batch operation for workload estimate usage.
      struct BatchCreateWorkloadEstimateUsageItem
        include JSON::Serializable

        # The specific operation associated with this usage estimate.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code for this usage estimate.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The type of usage that was estimated.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The estimated cost associated with this usage.
        @[JSON::Field(key: "cost")]
        getter cost : Float64?

        # The currency of the estimated cost.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The group identifier for the created usage estimate.
        @[JSON::Field(key: "group")]
        getter group : String?

        # Historical usage data associated with this estimate, if available.
        @[JSON::Field(key: "historicalUsage")]
        getter historical_usage : Types::HistoricalUsageEntity?

        # The unique identifier assigned to the created usage estimate.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The key of the successfully created entry.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The location associated with this usage estimate.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The estimated usage quantity.
        @[JSON::Field(key: "quantity")]
        getter quantity : Types::WorkloadEstimateUsageQuantity?

        # The current status of the created usage estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Web Services account ID associated with the created usage estimate.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @operation : String,
          @service_code : String,
          @usage_type : String,
          @cost : Float64? = nil,
          @currency : String? = nil,
          @group : String? = nil,
          @historical_usage : Types::HistoricalUsageEntity? = nil,
          @id : String? = nil,
          @key : String? = nil,
          @location : String? = nil,
          @quantity : Types::WorkloadEstimateUsageQuantity? = nil,
          @status : String? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      struct BatchCreateWorkloadEstimateUsageRequest
        include JSON::Serializable

        # List of usage that you want to model in the Workload estimate.
        @[JSON::Field(key: "usage")]
        getter usage : Array(Types::BatchCreateWorkloadEstimateUsageEntry)

        # The ID of the Workload estimate for which you want to create the modeled usage.
        @[JSON::Field(key: "workloadEstimateId")]
        getter workload_estimate_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @usage : Array(Types::BatchCreateWorkloadEstimateUsageEntry),
          @workload_estimate_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct BatchCreateWorkloadEstimateUsageResponse
        include JSON::Serializable

        # Returns the list of errors reason and the usage item keys that cannot be created in the Workload
        # estimate.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchCreateWorkloadEstimateUsageError)?

        # Returns the list of successful usage line items that were created for the Workload estimate.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BatchCreateWorkloadEstimateUsageItem)?

        def initialize(
          @errors : Array(Types::BatchCreateWorkloadEstimateUsageError)? = nil,
          @items : Array(Types::BatchCreateWorkloadEstimateUsageItem)? = nil
        )
        end
      end

      # Represents an error that occurred when deleting a commitment in a Bill Scenario.
      struct BatchDeleteBillScenarioCommitmentModificationError
        include JSON::Serializable

        # The code associated with the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message that describes the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the error.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct BatchDeleteBillScenarioCommitmentModificationRequest
        include JSON::Serializable

        # The ID of the Bill Scenario for which you want to delete the modeled commitment.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # List of commitments that you want to delete from the Bill Scenario.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        def initialize(
          @bill_scenario_id : String,
          @ids : Array(String)
        )
        end
      end

      struct BatchDeleteBillScenarioCommitmentModificationResponse
        include JSON::Serializable

        # Returns the list of errors reason and the commitment item keys that cannot be deleted from the Bill
        # Scenario.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteBillScenarioCommitmentModificationError)?

        def initialize(
          @errors : Array(Types::BatchDeleteBillScenarioCommitmentModificationError)? = nil
        )
        end
      end

      # Represents an error that occurred when deleting usage in a Bill Scenario.
      struct BatchDeleteBillScenarioUsageModificationError
        include JSON::Serializable

        # The code associated with the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message that describes the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the error.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct BatchDeleteBillScenarioUsageModificationRequest
        include JSON::Serializable

        # The ID of the Bill Scenario for which you want to delete the modeled usage.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # List of usage that you want to delete from the Bill Scenario.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        def initialize(
          @bill_scenario_id : String,
          @ids : Array(String)
        )
        end
      end

      struct BatchDeleteBillScenarioUsageModificationResponse
        include JSON::Serializable

        # Returns the list of errors reason and the usage item keys that cannot be deleted from the Bill
        # Scenario.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteBillScenarioUsageModificationError)?

        def initialize(
          @errors : Array(Types::BatchDeleteBillScenarioUsageModificationError)? = nil
        )
        end
      end

      # Represents an error that occurred when deleting usage in a workload estimate.
      struct BatchDeleteWorkloadEstimateUsageError
        include JSON::Serializable

        # The code associated with the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message that describes the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the error.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct BatchDeleteWorkloadEstimateUsageRequest
        include JSON::Serializable

        # List of usage that you want to delete from the Workload estimate.
        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        # The ID of the Workload estimate for which you want to delete the modeled usage.
        @[JSON::Field(key: "workloadEstimateId")]
        getter workload_estimate_id : String

        def initialize(
          @ids : Array(String),
          @workload_estimate_id : String
        )
        end
      end

      struct BatchDeleteWorkloadEstimateUsageResponse
        include JSON::Serializable

        # Returns the list of errors reason and the usage item keys that cannot be deleted from the Workload
        # estimate.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteWorkloadEstimateUsageError)?

        def initialize(
          @errors : Array(Types::BatchDeleteWorkloadEstimateUsageError)? = nil
        )
        end
      end

      # Represents an entry in a batch operation to update bill scenario commitment modifications.
      struct BatchUpdateBillScenarioCommitmentModificationEntry
        include JSON::Serializable

        # The unique identifier of the commitment modification to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # The updated group identifier for the commitment modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        def initialize(
          @id : String,
          @group : String? = nil
        )
        end
      end

      # Represents an error that occurred when updating a commitment in a Bill Scenario.
      struct BatchUpdateBillScenarioCommitmentModificationError
        include JSON::Serializable

        # The code associated with the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message that describes the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the error.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct BatchUpdateBillScenarioCommitmentModificationRequest
        include JSON::Serializable

        # The ID of the Bill Scenario for which you want to modify the commitment group of a modeled
        # commitment.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # List of commitments that you want to update in a Bill Scenario.
        @[JSON::Field(key: "commitmentModifications")]
        getter commitment_modifications : Array(Types::BatchUpdateBillScenarioCommitmentModificationEntry)

        def initialize(
          @bill_scenario_id : String,
          @commitment_modifications : Array(Types::BatchUpdateBillScenarioCommitmentModificationEntry)
        )
        end
      end

      struct BatchUpdateBillScenarioCommitmentModificationResponse
        include JSON::Serializable

        # Returns the list of error reasons and commitment line item IDs that could not be updated for the
        # Bill Scenario.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchUpdateBillScenarioCommitmentModificationError)?

        # Returns the list of successful commitment line items that were updated for a Bill Scenario.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillScenarioCommitmentModificationItem)?

        def initialize(
          @errors : Array(Types::BatchUpdateBillScenarioCommitmentModificationError)? = nil,
          @items : Array(Types::BillScenarioCommitmentModificationItem)? = nil
        )
        end
      end

      # Represents an entry in a batch operation to update bill scenario usage modifications.
      struct BatchUpdateBillScenarioUsageModificationEntry
        include JSON::Serializable

        # The unique identifier of the usage modification to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # The updated usage amounts for the modification.
        @[JSON::Field(key: "amounts")]
        getter amounts : Array(Types::UsageAmount)?

        # The updated group identifier for the usage modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        def initialize(
          @id : String,
          @amounts : Array(Types::UsageAmount)? = nil,
          @group : String? = nil
        )
        end
      end

      # Represents an error that occurred when updating usage in a Bill Scenario.
      struct BatchUpdateBillScenarioUsageModificationError
        include JSON::Serializable

        # The code associated with the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message that describes the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the error.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct BatchUpdateBillScenarioUsageModificationRequest
        include JSON::Serializable

        # The ID of the Bill Scenario for which you want to modify the usage lines.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # List of usage lines that you want to update in a Bill Scenario identified by the usage ID.
        @[JSON::Field(key: "usageModifications")]
        getter usage_modifications : Array(Types::BatchUpdateBillScenarioUsageModificationEntry)

        def initialize(
          @bill_scenario_id : String,
          @usage_modifications : Array(Types::BatchUpdateBillScenarioUsageModificationEntry)
        )
        end
      end

      struct BatchUpdateBillScenarioUsageModificationResponse
        include JSON::Serializable

        # Returns the list of error reasons and usage line item IDs that could not be updated for the Bill
        # Scenario.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchUpdateBillScenarioUsageModificationError)?

        # Returns the list of successful usage line items that were updated for a Bill Scenario.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillScenarioUsageModificationItem)?

        def initialize(
          @errors : Array(Types::BatchUpdateBillScenarioUsageModificationError)? = nil,
          @items : Array(Types::BillScenarioUsageModificationItem)? = nil
        )
        end
      end

      # Represents an entry in a batch operation to update workload estimate usage.
      struct BatchUpdateWorkloadEstimateUsageEntry
        include JSON::Serializable

        # The unique identifier of the usage estimate to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # The updated estimated usage amount.
        @[JSON::Field(key: "amount")]
        getter amount : Float64?

        # The updated group identifier for the usage estimate.
        @[JSON::Field(key: "group")]
        getter group : String?

        def initialize(
          @id : String,
          @amount : Float64? = nil,
          @group : String? = nil
        )
        end
      end

      # Represents an error that occurred when updating usage in a workload estimate.
      struct BatchUpdateWorkloadEstimateUsageError
        include JSON::Serializable

        # The code associated with the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message that describes the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the error.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct BatchUpdateWorkloadEstimateUsageRequest
        include JSON::Serializable

        # List of usage line amounts and usage group that you want to update in a Workload estimate identified
        # by the usage ID.
        @[JSON::Field(key: "usage")]
        getter usage : Array(Types::BatchUpdateWorkloadEstimateUsageEntry)

        # The ID of the Workload estimate for which you want to modify the usage lines.
        @[JSON::Field(key: "workloadEstimateId")]
        getter workload_estimate_id : String

        def initialize(
          @usage : Array(Types::BatchUpdateWorkloadEstimateUsageEntry),
          @workload_estimate_id : String
        )
        end
      end

      struct BatchUpdateWorkloadEstimateUsageResponse
        include JSON::Serializable

        # Returns the list of error reasons and usage line item IDs that could not be updated for the Workload
        # estimate.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchUpdateWorkloadEstimateUsageError)?

        # Returns the list of successful usage line items that were updated for a Workload estimate.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::WorkloadEstimateUsageItem)?

        def initialize(
          @errors : Array(Types::BatchUpdateWorkloadEstimateUsageError)? = nil,
          @items : Array(Types::WorkloadEstimateUsageItem)? = nil
        )
        end
      end

      # Provides a summary of commitment-related information for a bill estimate.
      struct BillEstimateCommitmentSummary
        include JSON::Serializable

        # The unique identifier of the commitment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The monthly payment amount for this commitment, if applicable.
        @[JSON::Field(key: "monthlyPayment")]
        getter monthly_payment : Types::CostAmount?

        # The identifier of the specific offering associated with this commitment.
        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?

        # The payment option chosen for this commitment (e.g., All Upfront, Partial Upfront, No Upfront).
        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The type of purchase agreement (e.g., Reserved Instance, Savings Plan).
        @[JSON::Field(key: "purchaseAgreementType")]
        getter purchase_agreement_type : String?

        # The Amazon Web Services region associated with this commitment.
        @[JSON::Field(key: "region")]
        getter region : String?

        # The length of the commitment term.
        @[JSON::Field(key: "termLength")]
        getter term_length : String?

        # The upfront payment amount for this commitment, if applicable.
        @[JSON::Field(key: "upfrontPayment")]
        getter upfront_payment : Types::CostAmount?

        # The Amazon Web Services account ID associated with this commitment.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @id : String? = nil,
          @monthly_payment : Types::CostAmount? = nil,
          @offering_id : String? = nil,
          @payment_option : String? = nil,
          @purchase_agreement_type : String? = nil,
          @region : String? = nil,
          @term_length : String? = nil,
          @upfront_payment : Types::CostAmount? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      # Provides a summary of cost-related information for a bill estimate.
      struct BillEstimateCostSummary
        include JSON::Serializable

        # A breakdown of cost differences by Amazon Web Services service.
        @[JSON::Field(key: "serviceCostDifferences")]
        getter service_cost_differences : Hash(String, Types::CostDifference)?

        # The total difference in cost between the estimated and historical costs.
        @[JSON::Field(key: "totalCostDifference")]
        getter total_cost_difference : Types::CostDifference?

        def initialize(
          @service_cost_differences : Hash(String, Types::CostDifference)? = nil,
          @total_cost_difference : Types::CostDifference? = nil
        )
        end
      end

      # Summarizes an input commitment modification for a bill estimate.
      struct BillEstimateInputCommitmentModificationSummary
        include JSON::Serializable

        # The specific commitment action taken in this modification.
        @[JSON::Field(key: "commitmentAction")]
        getter commitment_action : Types::BillScenarioCommitmentModificationAction?

        # The group identifier for the commitment modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        # The unique identifier of the commitment modification.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Web Services account ID associated with this commitment modification.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @commitment_action : Types::BillScenarioCommitmentModificationAction? = nil,
          @group : String? = nil,
          @id : String? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      # Summarizes an input usage modification for a bill estimate.
      struct BillEstimateInputUsageModificationSummary
        include JSON::Serializable

        # The specific operation associated with this usage modification.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code for this usage modification.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The type of usage being modified.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The availability zone associated with this usage modification, if applicable.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The group identifier for the usage modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        # Historical usage data associated with this modification, if available.
        @[JSON::Field(key: "historicalUsage")]
        getter historical_usage : Types::HistoricalUsageEntity?

        # The unique identifier of the usage modification.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The location associated with this usage modification.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The modified usage quantities.
        @[JSON::Field(key: "quantities")]
        getter quantities : Array(Types::UsageQuantity)?

        # The Amazon Web Services account ID associated with this usage modification.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @operation : String,
          @service_code : String,
          @usage_type : String,
          @availability_zone : String? = nil,
          @group : String? = nil,
          @historical_usage : Types::HistoricalUsageEntity? = nil,
          @id : String? = nil,
          @location : String? = nil,
          @quantities : Array(Types::UsageQuantity)? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      # Provides a summary of a line item in a bill estimate.
      struct BillEstimateLineItemSummary
        include JSON::Serializable

        # The specific operation associated with this line item.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code associated with this line item.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The type of usage for this line item.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The availability zone associated with this line item, if applicable.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The estimated cost for this line item.
        @[JSON::Field(key: "estimatedCost")]
        getter estimated_cost : Types::CostAmount?

        # The estimated usage quantity for this line item.
        @[JSON::Field(key: "estimatedUsageQuantity")]
        getter estimated_usage_quantity : Types::UsageQuantityResult?

        # The historical cost for this line item.
        @[JSON::Field(key: "historicalCost")]
        getter historical_cost : Types::CostAmount?

        # The historical usage quantity for this line item.
        @[JSON::Field(key: "historicalUsageQuantity")]
        getter historical_usage_quantity : Types::UsageQuantityResult?

        # The unique identifier of this line item.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The line item identifier from the original bill.
        @[JSON::Field(key: "lineItemId")]
        getter line_item_id : String?

        # The type of this line item (e.g., Usage, Tax, Credit).
        @[JSON::Field(key: "lineItemType")]
        getter line_item_type : String?

        # The location associated with this line item.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The Amazon Web Services account ID of the payer for this line item.
        @[JSON::Field(key: "payerAccountId")]
        getter payer_account_id : String?

        # The Amazon Resource Names (ARNs) of any Savings Plans applied to this line item.
        @[JSON::Field(key: "savingsPlanArns")]
        getter savings_plan_arns : Array(String)?

        # The Amazon Web Services account ID associated with the usage for this line item.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @operation : String,
          @service_code : String,
          @usage_type : String,
          @availability_zone : String? = nil,
          @estimated_cost : Types::CostAmount? = nil,
          @estimated_usage_quantity : Types::UsageQuantityResult? = nil,
          @historical_cost : Types::CostAmount? = nil,
          @historical_usage_quantity : Types::UsageQuantityResult? = nil,
          @id : String? = nil,
          @line_item_id : String? = nil,
          @line_item_type : String? = nil,
          @location : String? = nil,
          @payer_account_id : String? = nil,
          @savings_plan_arns : Array(String)? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      # Provides a summary of a bill estimate.
      struct BillEstimateSummary
        include JSON::Serializable

        # The unique identifier of the bill estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time period covered by the bill estimate.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The timestamp when the bill estimate was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the bill estimate will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The name of the bill estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the bill estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents a time interval for a bill or estimate.
      struct BillInterval
        include JSON::Serializable

        # The end date and time of the interval.
        @[JSON::Field(key: "end", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end : Time?

        # The start date and time of the interval.
        @[JSON::Field(key: "start", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start : Time?

        def initialize(
          @end : Time? = nil,
          @start : Time? = nil
        )
        end
      end

      # Represents an action to modify commitments in a bill scenario.
      struct BillScenarioCommitmentModificationAction
        include JSON::Serializable

        # Action to add a Reserved Instance to the scenario.
        @[JSON::Field(key: "addReservedInstanceAction")]
        getter add_reserved_instance_action : Types::AddReservedInstanceAction?

        # Action to add a Savings Plan to the scenario.
        @[JSON::Field(key: "addSavingsPlanAction")]
        getter add_savings_plan_action : Types::AddSavingsPlanAction?

        # Action to remove a Reserved Instance from the scenario.
        @[JSON::Field(key: "negateReservedInstanceAction")]
        getter negate_reserved_instance_action : Types::NegateReservedInstanceAction?

        # Action to remove a Savings Plan from the scenario.
        @[JSON::Field(key: "negateSavingsPlanAction")]
        getter negate_savings_plan_action : Types::NegateSavingsPlanAction?

        def initialize(
          @add_reserved_instance_action : Types::AddReservedInstanceAction? = nil,
          @add_savings_plan_action : Types::AddSavingsPlanAction? = nil,
          @negate_reserved_instance_action : Types::NegateReservedInstanceAction? = nil,
          @negate_savings_plan_action : Types::NegateSavingsPlanAction? = nil
        )
        end
      end

      # Represents a commitment modification item in a bill scenario.
      struct BillScenarioCommitmentModificationItem
        include JSON::Serializable

        # The specific commitment action taken in this modification.
        @[JSON::Field(key: "commitmentAction")]
        getter commitment_action : Types::BillScenarioCommitmentModificationAction?

        # The group identifier for the commitment modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        # The unique identifier of the commitment modification.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Web Services account ID associated with this commitment modification.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @commitment_action : Types::BillScenarioCommitmentModificationAction? = nil,
          @group : String? = nil,
          @id : String? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      # Provides a summary of a bill scenario.
      struct BillScenarioSummary
        include JSON::Serializable

        # The unique identifier of the bill scenario.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time period covered by the bill scenario.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # The timestamp when the bill scenario was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the bill scenario will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the bill scenario creation or processing failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The name of the bill scenario.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the bill scenario.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents a usage modification item in a bill scenario.
      struct BillScenarioUsageModificationItem
        include JSON::Serializable

        # The specific operation associated with this usage modification.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code for this usage modification.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The type of usage being modified.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The availability zone associated with this usage modification, if applicable.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The group identifier for the usage modification.
        @[JSON::Field(key: "group")]
        getter group : String?

        # Historical usage data associated with this modification, if available.
        @[JSON::Field(key: "historicalUsage")]
        getter historical_usage : Types::HistoricalUsageEntity?

        # The unique identifier of the usage modification.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The location associated with this usage modification.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The modified usage quantities.
        @[JSON::Field(key: "quantities")]
        getter quantities : Array(Types::UsageQuantity)?

        # The Amazon Web Services account ID associated with this usage modification.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @operation : String,
          @service_code : String,
          @usage_type : String,
          @availability_zone : String? = nil,
          @group : String? = nil,
          @historical_usage : Types::HistoricalUsageEntity? = nil,
          @id : String? = nil,
          @location : String? = nil,
          @quantities : Array(Types::UsageQuantity)? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that was not found.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that was not found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Represents a monetary amount with associated currency.
      struct CostAmount
        include JSON::Serializable

        # The numeric value of the cost.
        @[JSON::Field(key: "amount")]
        getter amount : Float64?

        # The currency code for the cost amount.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        def initialize(
          @amount : Float64? = nil,
          @currency : String? = nil
        )
        end
      end

      # Represents the difference between historical and estimated costs.
      struct CostDifference
        include JSON::Serializable

        # The estimated cost amount.
        @[JSON::Field(key: "estimatedCost")]
        getter estimated_cost : Types::CostAmount?

        # The historical cost amount.
        @[JSON::Field(key: "historicalCost")]
        getter historical_cost : Types::CostAmount?

        def initialize(
          @estimated_cost : Types::CostAmount? = nil,
          @historical_cost : Types::CostAmount? = nil
        )
        end
      end

      struct CreateBillEstimateRequest
        include JSON::Serializable

        # The ID of the Bill Scenario for which you want to create a Bill estimate.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # The name of the Bill estimate that will be created. Names must be unique for an account.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional list of tags to associate with the specified BillEstimate. You can use resource tags to
        # control access to your BillEstimate using IAM policies. Each tag consists of a key and a value, and
        # each key must be unique for the resource. The following restrictions apply to resource tags:
        # Although the maximum number of array members is 200, you can assign a maximum of 50 user-tags to one
        # resource. The remaining are reserved for Amazon Web Services. The maximum length of a key is 128
        # characters. The maximum length of a value is 256 characters. Keys and values can only contain
        # alphanumeric characters, spaces, and any of the following: _.:/=+@- . Keys and values are case
        # sensitive. Keys and values are trimmed for any leading or trailing whitespaces. Don't use aws: as a
        # prefix for your keys. This prefix is reserved for Amazon Web Services.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @bill_scenario_id : String,
          @name : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateBillEstimateResponse
        include JSON::Serializable

        # The unique identifier of your newly created Bill estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The bill month start and end timestamp that was used to create the Bill estimate. This is set to the
        # last complete anniversary bill month start and end timestamp.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # Timestamp of the effective date of the cost category used in the group sharing settings.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceEffectiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cost_category_group_sharing_preference_effective_date : Time?

        # Returns summary-level cost information once a Bill estimate is successfully generated. This summary
        # includes: 1) the total cost difference, showing the pre-tax cost change for the consolidated billing
        # family between the completed anniversary bill and the estimated bill, and 2) total cost differences
        # per service, detailing the pre-tax cost of each service, comparing the completed anniversary bill to
        # the estimated bill on a per-service basis.
        @[JSON::Field(key: "costSummary")]
        getter cost_summary : Types::BillEstimateCostSummary?

        # The timestamp of when the Bill estimate create process was started (not when it successfully
        # completed or failed).
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp of when the Bill estimate will expire. A Bill estimate becomes inaccessible after
        # expiration.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # This attribute provides the reason if a Bill estimate result generation fails.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The name of your newly created Bill estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of your newly created Bill estimate. Bill estimate creation can take anywhere between 8
        # to 12 hours. The status will allow you to identify when the Bill estimate is complete or has failed.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @cost_category_group_sharing_preference_effective_date : Time? = nil,
          @cost_summary : Types::BillEstimateCostSummary? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateBillScenarioRequest
        include JSON::Serializable

        # A descriptive name for the bill scenario.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The tags to apply to the bill scenario.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @group_sharing_preference : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateBillScenarioResponse
        include JSON::Serializable

        # The unique identifier for the created bill scenario.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time period covered by the bill scenario.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # The timestamp when the bill scenario was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the bill scenario will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the bill scenario creation failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The name of the created bill scenario.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the bill scenario.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateWorkloadEstimateRequest
        include JSON::Serializable

        # A descriptive name for the workload estimate.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The type of pricing rates to use for the estimate.
        @[JSON::Field(key: "rateType")]
        getter rate_type : String?

        # The tags to apply to the workload estimate.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @rate_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Mixin for common fields returned by CRUD APIs
      struct CreateWorkloadEstimateResponse
        include JSON::Serializable

        # The unique identifier for the created workload estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The currency of the estimated cost.
        @[JSON::Field(key: "costCurrency")]
        getter cost_currency : String?

        # The timestamp when the workload estimate was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the workload estimate will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the workload estimate creation failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The name of the created workload estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp of the pricing rates used for the estimate.
        @[JSON::Field(key: "rateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter rate_timestamp : Time?

        # The type of pricing rates used for the estimate.
        @[JSON::Field(key: "rateType")]
        getter rate_type : String?

        # The current status of the workload estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The total estimated cost for the workload.
        @[JSON::Field(key: "totalCost")]
        getter total_cost : Float64?

        def initialize(
          @id : String,
          @cost_currency : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @name : String? = nil,
          @rate_timestamp : Time? = nil,
          @rate_type : String? = nil,
          @status : String? = nil,
          @total_cost : Float64? = nil
        )
        end
      end

      # The requested data is currently unavailable.
      struct DataUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct DeleteBillEstimateRequest
        include JSON::Serializable

        # The unique identifier of the bill estimate to delete.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteBillEstimateResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteBillScenarioRequest
        include JSON::Serializable

        # The unique identifier of the bill scenario to delete.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteBillScenarioResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteWorkloadEstimateRequest
        include JSON::Serializable

        # The unique identifier of the workload estimate to delete.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteWorkloadEstimateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a complex filtering expression for cost and usage data.
      struct Expression
        include JSON::Serializable

        # A list of expressions to be combined with AND logic.
        @[JSON::Field(key: "and")]
        getter and : Array(Types::Expression)?

        # Filters based on cost categories.
        @[JSON::Field(key: "costCategories")]
        getter cost_categories : Types::ExpressionFilter?

        # Filters based on dimensions (e.g., service, operation).
        @[JSON::Field(key: "dimensions")]
        getter dimensions : Types::ExpressionFilter?

        # An expression to be negated.
        @[JSON::Field(key: "not")]
        getter not : Types::Expression?

        # A list of expressions to be combined with OR logic.
        @[JSON::Field(key: "or")]
        getter or : Array(Types::Expression)?

        # Filters based on resource tags.
        @[JSON::Field(key: "tags")]
        getter tags : Types::ExpressionFilter?

        def initialize(
          @and : Array(Types::Expression)? = nil,
          @cost_categories : Types::ExpressionFilter? = nil,
          @dimensions : Types::ExpressionFilter? = nil,
          @not : Types::Expression? = nil,
          @or : Array(Types::Expression)? = nil,
          @tags : Types::ExpressionFilter? = nil
        )
        end
      end

      # Represents a filter used within an expression.
      struct ExpressionFilter
        include JSON::Serializable

        # The key or attribute to filter on.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The match options for the filter (e.g., equals, contains).
        @[JSON::Field(key: "matchOptions")]
        getter match_options : Array(String)?

        # The values to match against.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @match_options : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Represents a time-based filter.
      struct FilterTimestamp
        include JSON::Serializable

        # Include results after this timestamp.
        @[JSON::Field(key: "afterTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter after_timestamp : Time?

        # Include results before this timestamp.
        @[JSON::Field(key: "beforeTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter before_timestamp : Time?

        def initialize(
          @after_timestamp : Time? = nil,
          @before_timestamp : Time? = nil
        )
        end
      end

      struct GetBillEstimateRequest
        include JSON::Serializable

        # The unique identifier of the bill estimate to retrieve.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetBillEstimateResponse
        include JSON::Serializable

        # The unique identifier of the retrieved bill estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time period covered by the bill estimate.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # Timestamp of the effective date of the cost category used in the group sharing settings.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceEffectiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cost_category_group_sharing_preference_effective_date : Time?

        # A summary of the estimated costs.
        @[JSON::Field(key: "costSummary")]
        getter cost_summary : Types::BillEstimateCostSummary?

        # The timestamp when the bill estimate was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the bill estimate will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the bill estimate retrieval failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The name of the retrieved bill estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the bill estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @cost_category_group_sharing_preference_effective_date : Time? = nil,
          @cost_summary : Types::BillEstimateCostSummary? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetBillScenarioRequest
        include JSON::Serializable

        # The unique identifier of the bill scenario to retrieve.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetBillScenarioResponse
        include JSON::Serializable

        # The unique identifier of the retrieved bill scenario.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time period covered by the bill scenario.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # The timestamp when the bill scenario was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the bill scenario will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the bill scenario retrieval failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The name of the retrieved bill scenario.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the bill scenario.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil,
          @status : String? = nil
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

        # The preferred rate types for the management account.
        @[JSON::Field(key: "managementAccountRateTypeSelections")]
        getter management_account_rate_type_selections : Array(String)?

        # The preferred rate types for member accounts.
        @[JSON::Field(key: "memberAccountRateTypeSelections")]
        getter member_account_rate_type_selections : Array(String)?

        # The preferred rate types for a standalone account.
        @[JSON::Field(key: "standaloneAccountRateTypeSelections")]
        getter standalone_account_rate_type_selections : Array(String)?

        def initialize(
          @management_account_rate_type_selections : Array(String)? = nil,
          @member_account_rate_type_selections : Array(String)? = nil,
          @standalone_account_rate_type_selections : Array(String)? = nil
        )
        end
      end

      struct GetWorkloadEstimateRequest
        include JSON::Serializable

        # The unique identifier of the workload estimate to retrieve.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # Mixin for common fields returned by CRUD APIs
      struct GetWorkloadEstimateResponse
        include JSON::Serializable

        # The unique identifier of the retrieved workload estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The currency of the estimated cost.
        @[JSON::Field(key: "costCurrency")]
        getter cost_currency : String?

        # The timestamp when the workload estimate was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the workload estimate will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the workload estimate retrieval failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The name of the retrieved workload estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp of the pricing rates used for the estimate.
        @[JSON::Field(key: "rateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter rate_timestamp : Time?

        # The type of pricing rates used for the estimate.
        @[JSON::Field(key: "rateType")]
        getter rate_type : String?

        # The current status of the workload estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The total estimated cost for the workload.
        @[JSON::Field(key: "totalCost")]
        getter total_cost : Float64?

        def initialize(
          @id : String,
          @cost_currency : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @name : String? = nil,
          @rate_timestamp : Time? = nil,
          @rate_type : String? = nil,
          @status : String? = nil,
          @total_cost : Float64? = nil
        )
        end
      end

      # Represents historical usage data for a specific entity.
      struct HistoricalUsageEntity
        include JSON::Serializable

        # The time interval for the historical usage data.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval

        # An optional filter expression to apply to the historical usage data.
        @[JSON::Field(key: "filterExpression")]
        getter filter_expression : Types::Expression

        # The specific operation associated with the usage.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code associated with the usage.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The Amazon Web Services account ID associated with the usage.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String

        # The type of usage.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The location associated with the usage.
        @[JSON::Field(key: "location")]
        getter location : String?

        def initialize(
          @bill_interval : Types::BillInterval,
          @filter_expression : Types::Expression,
          @operation : String,
          @service_code : String,
          @usage_account_id : String,
          @usage_type : String,
          @location : String? = nil
        )
        end
      end

      # An internal error has occurred. Retry your request, but if the problem persists, contact Amazon Web
      # Services support.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # An internal error has occurred. Retry your request, but if the problem persists, contact Amazon Web
        # Services support.
        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListBillEstimateCommitmentsRequest
        include JSON::Serializable

        # The unique identifier of the bill estimate to list commitments for.
        @[JSON::Field(key: "billEstimateId")]
        getter bill_estimate_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bill_estimate_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillEstimateCommitmentsResponse
        include JSON::Serializable

        # The list of commitments associated with the bill estimate.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillEstimateCommitmentSummary)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillEstimateCommitmentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillEstimateInputCommitmentModificationsRequest
        include JSON::Serializable

        # The unique identifier of the bill estimate to list input commitment modifications for.
        @[JSON::Field(key: "billEstimateId")]
        getter bill_estimate_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bill_estimate_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillEstimateInputCommitmentModificationsResponse
        include JSON::Serializable

        # The list of input commitment modifications associated with the bill estimate.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillEstimateInputCommitmentModificationSummary)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillEstimateInputCommitmentModificationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillEstimateInputUsageModificationsRequest
        include JSON::Serializable

        # The unique identifier of the bill estimate to list input usage modifications for.
        @[JSON::Field(key: "billEstimateId")]
        getter bill_estimate_id : String

        # Filters to apply to the list of input usage modifications.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListUsageFilter)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bill_estimate_id : String,
          @filters : Array(Types::ListUsageFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillEstimateInputUsageModificationsResponse
        include JSON::Serializable

        # The list of input usage modifications associated with the bill estimate.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillEstimateInputUsageModificationSummary)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillEstimateInputUsageModificationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a filter for listing bill estimate line items.
      struct ListBillEstimateLineItemsFilter
        include JSON::Serializable

        # The name of the filter attribute.
        @[JSON::Field(key: "name")]
        getter name : String

        # The values to filter by.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The match option for the filter (e.g., equals, contains).
        @[JSON::Field(key: "matchOption")]
        getter match_option : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @match_option : String? = nil
        )
        end
      end

      struct ListBillEstimateLineItemsRequest
        include JSON::Serializable

        # The unique identifier of the bill estimate to list line items for.
        @[JSON::Field(key: "billEstimateId")]
        getter bill_estimate_id : String

        # Filters to apply to the list of line items.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListBillEstimateLineItemsFilter)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bill_estimate_id : String,
          @filters : Array(Types::ListBillEstimateLineItemsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillEstimateLineItemsResponse
        include JSON::Serializable

        # The list of line items associated with the bill estimate.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillEstimateLineItemSummary)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillEstimateLineItemSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a filter for listing bill estimates.
      struct ListBillEstimatesFilter
        include JSON::Serializable

        # The name of the filter attribute.
        @[JSON::Field(key: "name")]
        getter name : String

        # The values to filter by.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The match option for the filter (e.g., equals, contains).
        @[JSON::Field(key: "matchOption")]
        getter match_option : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @match_option : String? = nil
        )
        end
      end

      struct ListBillEstimatesRequest
        include JSON::Serializable

        # Filter bill estimates based on the creation date.
        @[JSON::Field(key: "createdAtFilter")]
        getter created_at_filter : Types::FilterTimestamp?

        # Filter bill estimates based on the expiration date.
        @[JSON::Field(key: "expiresAtFilter")]
        getter expires_at_filter : Types::FilterTimestamp?

        # Filters to apply to the list of bill estimates.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListBillEstimatesFilter)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @created_at_filter : Types::FilterTimestamp? = nil,
          @expires_at_filter : Types::FilterTimestamp? = nil,
          @filters : Array(Types::ListBillEstimatesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillEstimatesResponse
        include JSON::Serializable

        # The list of bill estimates for the account.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillEstimateSummary)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillEstimateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillScenarioCommitmentModificationsRequest
        include JSON::Serializable

        # The unique identifier of the bill scenario to list commitment modifications for.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bill_scenario_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillScenarioCommitmentModificationsResponse
        include JSON::Serializable

        # The list of commitment modifications associated with the bill scenario.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillScenarioCommitmentModificationItem)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillScenarioCommitmentModificationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillScenarioUsageModificationsRequest
        include JSON::Serializable

        # The unique identifier of the bill scenario to list usage modifications for.
        @[JSON::Field(key: "billScenarioId")]
        getter bill_scenario_id : String

        # Filters to apply to the list of usage modifications.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListUsageFilter)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @bill_scenario_id : String,
          @filters : Array(Types::ListUsageFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillScenarioUsageModificationsResponse
        include JSON::Serializable

        # The list of usage modifications associated with the bill scenario.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillScenarioUsageModificationItem)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillScenarioUsageModificationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a filter for listing bill scenarios.
      struct ListBillScenariosFilter
        include JSON::Serializable

        # The name of the filter attribute.
        @[JSON::Field(key: "name")]
        getter name : String

        # The values to filter by.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The match option for the filter (e.g., equals, contains).
        @[JSON::Field(key: "matchOption")]
        getter match_option : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @match_option : String? = nil
        )
        end
      end

      struct ListBillScenariosRequest
        include JSON::Serializable

        # Filter bill scenarios based on the creation date.
        @[JSON::Field(key: "createdAtFilter")]
        getter created_at_filter : Types::FilterTimestamp?

        # Filter bill scenarios based on the expiration date.
        @[JSON::Field(key: "expiresAtFilter")]
        getter expires_at_filter : Types::FilterTimestamp?

        # Filters to apply to the list of bill scenarios.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListBillScenariosFilter)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @created_at_filter : Types::FilterTimestamp? = nil,
          @expires_at_filter : Types::FilterTimestamp? = nil,
          @filters : Array(Types::ListBillScenariosFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBillScenariosResponse
        include JSON::Serializable

        # The list of bill scenarios for the account.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::BillScenarioSummary)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::BillScenarioSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to list tags for.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags associated with the specified resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a filter for listing usage data.
      struct ListUsageFilter
        include JSON::Serializable

        # The name of the filter attribute.
        @[JSON::Field(key: "name")]
        getter name : String

        # The values to filter by.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The match option for the filter (e.g., equals, contains).
        @[JSON::Field(key: "matchOption")]
        getter match_option : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @match_option : String? = nil
        )
        end
      end

      struct ListWorkloadEstimateUsageRequest
        include JSON::Serializable

        # The unique identifier of the workload estimate to list usage for.
        @[JSON::Field(key: "workloadEstimateId")]
        getter workload_estimate_id : String

        # Filters to apply to the list of usage items.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListUsageFilter)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workload_estimate_id : String,
          @filters : Array(Types::ListUsageFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkloadEstimateUsageResponse
        include JSON::Serializable

        # The list of usage items associated with the workload estimate.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::WorkloadEstimateUsageItem)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::WorkloadEstimateUsageItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a filter for listing workload estimates.
      struct ListWorkloadEstimatesFilter
        include JSON::Serializable

        # The name of the filter attribute.
        @[JSON::Field(key: "name")]
        getter name : String

        # The values to filter by.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The match option for the filter (e.g., equals, contains).
        @[JSON::Field(key: "matchOption")]
        getter match_option : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @match_option : String? = nil
        )
        end
      end

      struct ListWorkloadEstimatesRequest
        include JSON::Serializable

        # Filter workload estimates based on the creation date.
        @[JSON::Field(key: "createdAtFilter")]
        getter created_at_filter : Types::FilterTimestamp?

        # Filter workload estimates based on the expiration date.
        @[JSON::Field(key: "expiresAtFilter")]
        getter expires_at_filter : Types::FilterTimestamp?

        # Filters to apply to the list of workload estimates.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ListWorkloadEstimatesFilter)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @created_at_filter : Types::FilterTimestamp? = nil,
          @expires_at_filter : Types::FilterTimestamp? = nil,
          @filters : Array(Types::ListWorkloadEstimatesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkloadEstimatesResponse
        include JSON::Serializable

        # The list of workload estimates for the account.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::WorkloadEstimateSummary)?

        # A token to retrieve the next page of results, if any.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::WorkloadEstimateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents an action to remove a Reserved Instance from a bill scenario. This is the ID of an
      # existing Reserved Instance in your account.
      struct NegateReservedInstanceAction
        include JSON::Serializable

        # The ID of the Reserved Instance to remove.
        @[JSON::Field(key: "reservedInstancesId")]
        getter reserved_instances_id : String?

        def initialize(
          @reserved_instances_id : String? = nil
        )
        end
      end

      # Represents an action to remove a Savings Plan from a bill scenario. This is the ID of an existing
      # Savings Plan in your account.
      struct NegateSavingsPlanAction
        include JSON::Serializable

        # The ID of the Savings Plan to remove.
        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String?

        def initialize(
          @savings_plan_id : String? = nil
        )
        end
      end

      # The specified resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that was not found.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that was not found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The request would cause you to exceed your service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that exceeded quota.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that exceeded quota.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The quota code that was exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The service code that exceeded quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to add tags to.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The tags to add to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @arn : String,
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
        getter message : String

        # The quota code that exceeded the throttling limit.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The service code that exceeded the throttling limit. Retry your request, but if the problem
        # persists, contact Amazon Web Services support.
        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        # The service code that exceeded the throttling limit.
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

        # The Amazon Resource Name (ARN) of the resource to remove tags from.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The keys of the tags to remove from the resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateBillEstimateRequest
        include JSON::Serializable

        # The unique identifier of the bill estimate to update.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The new expiration date for the bill estimate.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The new name for the bill estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @expires_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateBillEstimateResponse
        include JSON::Serializable

        # The unique identifier of the updated bill estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time period covered by the updated bill estimate.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # Timestamp of the effective date of the cost category used in the group sharing settings.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceEffectiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter cost_category_group_sharing_preference_effective_date : Time?

        # A summary of the updated estimated costs.
        @[JSON::Field(key: "costSummary")]
        getter cost_summary : Types::BillEstimateCostSummary?

        # The timestamp when the bill estimate was originally created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The updated expiration timestamp for the bill estimate.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the bill estimate update failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The updated name of the bill estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the updated bill estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @cost_category_group_sharing_preference_effective_date : Time? = nil,
          @cost_summary : Types::BillEstimateCostSummary? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateBillScenarioRequest
        include JSON::Serializable

        # The unique identifier of the bill scenario to update.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # The new expiration date for the bill scenario.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The new name for the bill scenario.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @expires_at : Time? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateBillScenarioResponse
        include JSON::Serializable

        # The unique identifier of the updated bill scenario.
        @[JSON::Field(key: "id")]
        getter id : String

        # The time period covered by the updated bill scenario.
        @[JSON::Field(key: "billInterval")]
        getter bill_interval : Types::BillInterval?

        # The arn of the cost category used in the reserved and prioritized group sharing.
        @[JSON::Field(key: "costCategoryGroupSharingPreferenceArn")]
        getter cost_category_group_sharing_preference_arn : String?

        # The timestamp when the bill scenario was originally created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The updated expiration timestamp for the bill scenario.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the bill scenario update failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The setting for the reserved instance and savings plan group sharing used in this estimate.
        @[JSON::Field(key: "groupSharingPreference")]
        getter group_sharing_preference : String?

        # The updated name of the bill scenario.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the updated bill scenario.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String,
          @bill_interval : Types::BillInterval? = nil,
          @cost_category_group_sharing_preference_arn : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @group_sharing_preference : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdatePreferencesRequest
        include JSON::Serializable

        # The updated preferred rate types for the management account.
        @[JSON::Field(key: "managementAccountRateTypeSelections")]
        getter management_account_rate_type_selections : Array(String)?

        # The updated preferred rate types for member accounts.
        @[JSON::Field(key: "memberAccountRateTypeSelections")]
        getter member_account_rate_type_selections : Array(String)?

        # The updated preferred rate types for a standalone account.
        @[JSON::Field(key: "standaloneAccountRateTypeSelections")]
        getter standalone_account_rate_type_selections : Array(String)?

        def initialize(
          @management_account_rate_type_selections : Array(String)? = nil,
          @member_account_rate_type_selections : Array(String)? = nil,
          @standalone_account_rate_type_selections : Array(String)? = nil
        )
        end
      end

      struct UpdatePreferencesResponse
        include JSON::Serializable

        # The updated preferred rate types for the management account.
        @[JSON::Field(key: "managementAccountRateTypeSelections")]
        getter management_account_rate_type_selections : Array(String)?

        # The updated preferred rate types for member accounts.
        @[JSON::Field(key: "memberAccountRateTypeSelections")]
        getter member_account_rate_type_selections : Array(String)?

        # The updated preferred rate types for a standalone account.
        @[JSON::Field(key: "standaloneAccountRateTypeSelections")]
        getter standalone_account_rate_type_selections : Array(String)?

        def initialize(
          @management_account_rate_type_selections : Array(String)? = nil,
          @member_account_rate_type_selections : Array(String)? = nil,
          @standalone_account_rate_type_selections : Array(String)? = nil
        )
        end
      end

      struct UpdateWorkloadEstimateRequest
        include JSON::Serializable

        # The unique identifier of the workload estimate to update.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The new expiration date for the workload estimate.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The new name for the workload estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @expires_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Mixin for common fields returned by CRUD APIs
      struct UpdateWorkloadEstimateResponse
        include JSON::Serializable

        # The unique identifier of the updated workload estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The currency of the updated estimated cost.
        @[JSON::Field(key: "costCurrency")]
        getter cost_currency : String?

        # The timestamp when the workload estimate was originally created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The updated expiration timestamp for the workload estimate.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the workload estimate update failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The updated name of the workload estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp of the pricing rates used for the updated estimate.
        @[JSON::Field(key: "rateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter rate_timestamp : Time?

        # The type of pricing rates used for the updated estimate.
        @[JSON::Field(key: "rateType")]
        getter rate_type : String?

        # The current status of the updated workload estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The updated total estimated cost for the workload.
        @[JSON::Field(key: "totalCost")]
        getter total_cost : Float64?

        def initialize(
          @id : String,
          @cost_currency : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @name : String? = nil,
          @rate_timestamp : Time? = nil,
          @rate_type : String? = nil,
          @status : String? = nil,
          @total_cost : Float64? = nil
        )
        end
      end

      # Represents a usage amount for a specific time period.
      struct UsageAmount
        include JSON::Serializable

        # The usage amount for the period.
        @[JSON::Field(key: "amount")]
        getter amount : Float64

        # The start hour of the usage period.
        @[JSON::Field(key: "startHour", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_hour : Time

        def initialize(
          @amount : Float64,
          @start_hour : Time
        )
        end
      end

      # Represents a usage quantity with associated unit and time period.
      struct UsageQuantity
        include JSON::Serializable

        # The numeric value of the usage quantity.
        @[JSON::Field(key: "amount")]
        getter amount : Float64?

        # The start hour of the usage period.
        @[JSON::Field(key: "startHour", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_hour : Time?

        # The unit of measurement for the usage quantity.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @amount : Float64? = nil,
          @start_hour : Time? = nil,
          @unit : String? = nil
        )
        end
      end

      # Represents the result of a usage quantity calculation.
      struct UsageQuantityResult
        include JSON::Serializable

        # The numeric value of the usage quantity result.
        @[JSON::Field(key: "amount")]
        getter amount : Float64?

        # The unit of measurement for the usage quantity result.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @amount : Float64? = nil,
          @unit : String? = nil
        )
        end
      end

      # The input provided fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The list of fields that are invalid.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        # The reason for the validation exception.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Represents a field that failed validation in a request.
      struct ValidationExceptionField
        include JSON::Serializable

        # The error message describing why the field failed validation.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that failed validation.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Provides a summary of a workload estimate.
      struct WorkloadEstimateSummary
        include JSON::Serializable

        # The unique identifier of the workload estimate.
        @[JSON::Field(key: "id")]
        getter id : String

        # The currency of the estimated cost.
        @[JSON::Field(key: "costCurrency")]
        getter cost_currency : String?

        # The timestamp when the workload estimate was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the workload estimate will expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # An error message if the workload estimate creation or processing failed.
        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The name of the workload estimate.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp of the pricing rates used for the estimate.
        @[JSON::Field(key: "rateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter rate_timestamp : Time?

        # The type of pricing rates used for the estimate.
        @[JSON::Field(key: "rateType")]
        getter rate_type : String?

        # The current status of the workload estimate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The total estimated cost for the workload.
        @[JSON::Field(key: "totalCost")]
        getter total_cost : Float64?

        def initialize(
          @id : String,
          @cost_currency : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @failure_message : String? = nil,
          @name : String? = nil,
          @rate_timestamp : Time? = nil,
          @rate_type : String? = nil,
          @status : String? = nil,
          @total_cost : Float64? = nil
        )
        end
      end

      # Represents a usage item in a workload estimate.
      struct WorkloadEstimateUsageItem
        include JSON::Serializable

        # The specific operation associated with this usage item.
        @[JSON::Field(key: "operation")]
        getter operation : String

        # The Amazon Web Services service code associated with this usage item.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The type of usage for this item.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String

        # The estimated cost for this usage item.
        @[JSON::Field(key: "cost")]
        getter cost : Float64?

        # The currency of the estimated cost.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The group identifier for this usage item.
        @[JSON::Field(key: "group")]
        getter group : String?

        # Historical usage data associated with this item, if available.
        @[JSON::Field(key: "historicalUsage")]
        getter historical_usage : Types::HistoricalUsageEntity?

        # The unique identifier of this usage item.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The location associated with this usage item.
        @[JSON::Field(key: "location")]
        getter location : String?

        # The estimated usage quantity for this item.
        @[JSON::Field(key: "quantity")]
        getter quantity : Types::WorkloadEstimateUsageQuantity?

        # The current status of this usage item.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Web Services account ID associated with this usage item.
        @[JSON::Field(key: "usageAccountId")]
        getter usage_account_id : String?

        def initialize(
          @operation : String,
          @service_code : String,
          @usage_type : String,
          @cost : Float64? = nil,
          @currency : String? = nil,
          @group : String? = nil,
          @historical_usage : Types::HistoricalUsageEntity? = nil,
          @id : String? = nil,
          @location : String? = nil,
          @quantity : Types::WorkloadEstimateUsageQuantity? = nil,
          @status : String? = nil,
          @usage_account_id : String? = nil
        )
        end
      end

      # Represents a usage quantity for a workload estimate.
      struct WorkloadEstimateUsageQuantity
        include JSON::Serializable

        # The numeric value of the usage quantity.
        @[JSON::Field(key: "amount")]
        getter amount : Float64?

        # The unit of measurement for the usage quantity.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @amount : Float64? = nil,
          @unit : String? = nil
        )
        end
      end
    end
  end
end
