require "json"

module Aws
  module Billingconductor
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A representation of a linked account.

      struct AccountAssociationsListElement
        include JSON::Serializable

        # The Amazon Web Services account email.

        @[JSON::Field(key: "AccountEmail")]
        getter account_email : String?

        # The associating array of account IDs.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The Amazon Web Services account name.

        @[JSON::Field(key: "AccountName")]
        getter account_name : String?

        # The Billing Group Arn that the linked account is associated to.

        @[JSON::Field(key: "BillingGroupArn")]
        getter billing_group_arn : String?

        def initialize(
          @account_email : String? = nil,
          @account_id : String? = nil,
          @account_name : String? = nil,
          @billing_group_arn : String? = nil
        )
        end
      end

      # The set of accounts that will be under the billing group. The set of accounts resemble the linked
      # accounts in a consolidated billing family.

      struct AccountGrouping
        include JSON::Serializable

        # Specifies if this billing group will automatically associate newly added Amazon Web Services
        # accounts that join your consolidated billing family.

        @[JSON::Field(key: "AutoAssociate")]
        getter auto_associate : Bool?

        # The account IDs that make up the billing group. Account IDs must be a part of the consolidated
        # billing family, and not associated with another billing group.

        @[JSON::Field(key: "LinkedAccountIds")]
        getter linked_account_ids : Array(String)?

        # The Amazon Resource Name (ARN) that identifies the transfer relationship owned by the Bill Transfer
        # account (caller account). When specified, the PrimaryAccountId is no longer required.

        @[JSON::Field(key: "ResponsibilityTransferArn")]
        getter responsibility_transfer_arn : String?

        def initialize(
          @auto_associate : Bool? = nil,
          @linked_account_ids : Array(String)? = nil,
          @responsibility_transfer_arn : String? = nil
        )
        end
      end


      struct AssociateAccountsInput
        include JSON::Serializable

        # The associating array of account IDs.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)

        # The Amazon Resource Name (ARN) of the billing group that associates the array of account IDs.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @account_ids : Array(String),
          @arn : String
        )
        end
      end


      struct AssociateAccountsOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing group that associates the array of account IDs.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct AssociatePricingRulesInput
        include JSON::Serializable

        # The PricingPlanArn that the PricingRuleArns are associated with.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The PricingRuleArns that are associated with the Pricing Plan.

        @[JSON::Field(key: "PricingRuleArns")]
        getter pricing_rule_arns : Array(String)

        def initialize(
          @arn : String,
          @pricing_rule_arns : Array(String)
        )
        end
      end


      struct AssociatePricingRulesOutput
        include JSON::Serializable

        # The PricingPlanArn that the PricingRuleArns are associated with.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # A representation of a resource association error.

      struct AssociateResourceError
        include JSON::Serializable

        # The reason why the resource association failed.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A static error code that's used to classify the type of failure.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A resource association result for a percentage custom line item.

      struct AssociateResourceResponseElement
        include JSON::Serializable

        # The resource ARN that was associated to the custom line item.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An AssociateResourceError that will populate if the resource association fails.

        @[JSON::Field(key: "Error")]
        getter error : Types::AssociateResourceError?

        def initialize(
          @arn : String? = nil,
          @error : Types::AssociateResourceError? = nil
        )
        end
      end

      # The key-value pair that represents the attribute by which the BillingGroupCostReportResults are
      # grouped. For example, if you want a service-level breakdown for Amazon Simple Storage Service
      # (Amazon S3) of the billing group, the attribute will be a key-value pair of "PRODUCT_NAME" and "S3"
      # .

      struct Attribute
        include JSON::Serializable

        # The key in a key-value pair that describes the margin summary.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value in a key-value pair that describes the margin summary.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct BatchAssociateResourcesToCustomLineItemInput
        include JSON::Serializable

        # A list containing the ARNs of the resources to be associated.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        # A percentage custom line item ARN to associate the resources to.

        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String


        @[JSON::Field(key: "BillingPeriodRange")]
        getter billing_period_range : Types::CustomLineItemBillingPeriodRange?

        def initialize(
          @resource_arns : Array(String),
          @target_arn : String,
          @billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil
        )
        end
      end


      struct BatchAssociateResourcesToCustomLineItemOutput
        include JSON::Serializable

        # A list of AssociateResourceResponseElement for each resource that failed association to a percentage
        # custom line item.

        @[JSON::Field(key: "FailedAssociatedResources")]
        getter failed_associated_resources : Array(Types::AssociateResourceResponseElement)?

        # A list of AssociateResourceResponseElement for each resource that's been associated to a percentage
        # custom line item successfully.

        @[JSON::Field(key: "SuccessfullyAssociatedResources")]
        getter successfully_associated_resources : Array(Types::AssociateResourceResponseElement)?

        def initialize(
          @failed_associated_resources : Array(Types::AssociateResourceResponseElement)? = nil,
          @successfully_associated_resources : Array(Types::AssociateResourceResponseElement)? = nil
        )
        end
      end


      struct BatchDisassociateResourcesFromCustomLineItemInput
        include JSON::Serializable

        # A list containing the ARNs of resources to be disassociated.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        # A percentage custom line item ARN to disassociate the resources from.

        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String


        @[JSON::Field(key: "BillingPeriodRange")]
        getter billing_period_range : Types::CustomLineItemBillingPeriodRange?

        def initialize(
          @resource_arns : Array(String),
          @target_arn : String,
          @billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil
        )
        end
      end


      struct BatchDisassociateResourcesFromCustomLineItemOutput
        include JSON::Serializable

        # A list of DisassociateResourceResponseElement for each resource that failed disassociation from a
        # percentage custom line item.

        @[JSON::Field(key: "FailedDisassociatedResources")]
        getter failed_disassociated_resources : Array(Types::DisassociateResourceResponseElement)?

        # A list of DisassociateResourceResponseElement for each resource that's been disassociated from a
        # percentage custom line item successfully.

        @[JSON::Field(key: "SuccessfullyDisassociatedResources")]
        getter successfully_disassociated_resources : Array(Types::DisassociateResourceResponseElement)?

        def initialize(
          @failed_disassociated_resources : Array(Types::DisassociateResourceResponseElement)? = nil,
          @successfully_disassociated_resources : Array(Types::DisassociateResourceResponseElement)? = nil
        )
        end
      end

      # A summary report of actual Amazon Web Services charges and calculated Amazon Web Services charges,
      # based on the associated pricing plan of a billing group.

      struct BillingGroupCostReportElement
        include JSON::Serializable

        # The actual Amazon Web Services charges for the billing group.

        @[JSON::Field(key: "AWSCost")]
        getter aws_cost : String?

        # The Amazon Resource Name (ARN) of a billing group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The displayed currency.

        @[JSON::Field(key: "Currency")]
        getter currency : String?

        # The billing group margin.

        @[JSON::Field(key: "Margin")]
        getter margin : String?

        # The percentage of billing group margin.

        @[JSON::Field(key: "MarginPercentage")]
        getter margin_percentage : String?

        # The hypothetical Amazon Web Services charges based on the associated pricing plan of a billing
        # group.

        @[JSON::Field(key: "ProformaCost")]
        getter proforma_cost : String?

        def initialize(
          @aws_cost : String? = nil,
          @arn : String? = nil,
          @currency : String? = nil,
          @margin : String? = nil,
          @margin_percentage : String? = nil,
          @proforma_cost : String? = nil
        )
        end
      end

      # A paginated call to retrieve a list of summary reports of actual Amazon Web Services charges and the
      # calculated Amazon Web Services charges, broken down by attributes.

      struct BillingGroupCostReportResultElement
        include JSON::Serializable

        # The actual Amazon Web Services charges for the billing group.

        @[JSON::Field(key: "AWSCost")]
        getter aws_cost : String?

        # The Amazon Resource Number (ARN) that uniquely identifies the billing group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The list of key-value pairs that represent the attributes by which the BillingGroupCostReportResults
        # are grouped. For example, if you want the Amazon S3 service-level breakdown of a billing group for
        # November 2023, the attributes list will contain a key-value pair of "PRODUCT_NAME" and "S3" and a
        # key-value pair of "BILLING_PERIOD" and "Nov 2023" .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::Attribute)?

        # The displayed currency.

        @[JSON::Field(key: "Currency")]
        getter currency : String?

        # The billing group margin.

        @[JSON::Field(key: "Margin")]
        getter margin : String?

        # The percentage of the billing group margin.

        @[JSON::Field(key: "MarginPercentage")]
        getter margin_percentage : String?

        # The hypothetical Amazon Web Services charges based on the associated pricing plan of a billing
        # group.

        @[JSON::Field(key: "ProformaCost")]
        getter proforma_cost : String?

        def initialize(
          @aws_cost : String? = nil,
          @arn : String? = nil,
          @attributes : Array(Types::Attribute)? = nil,
          @currency : String? = nil,
          @margin : String? = nil,
          @margin_percentage : String? = nil,
          @proforma_cost : String? = nil
        )
        end
      end

      # A representation of a billing group.

      struct BillingGroupListElement
        include JSON::Serializable

        # Specifies if the billing group has automatic account association ( AutoAssociate ) enabled.

        @[JSON::Field(key: "AccountGrouping")]
        getter account_grouping : Types::ListBillingGroupAccountGrouping?

        # The Amazon Resource Number (ARN) that can be used to uniquely identify the billing group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The type of billing group.

        @[JSON::Field(key: "BillingGroupType")]
        getter billing_group_type : String?


        @[JSON::Field(key: "ComputationPreference")]
        getter computation_preference : Types::ComputationPreference?

        # The time when the billing group was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Int64?

        # The description of the billing group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time when the billing group was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The name of the billing group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The account ID that serves as the main account in a billing group.

        @[JSON::Field(key: "PrimaryAccountId")]
        getter primary_account_id : String?

        # The number of accounts in the particular billing group.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # The billing group status. Only one of the valid values can be used.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason why the billing group is in its current status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @account_grouping : Types::ListBillingGroupAccountGrouping? = nil,
          @arn : String? = nil,
          @billing_group_type : String? = nil,
          @computation_preference : Types::ComputationPreference? = nil,
          @creation_time : Int64? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @name : String? = nil,
          @primary_account_id : String? = nil,
          @size : Int64? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # A time range for which the margin summary is effective. The time range can be up to 12 months.

      struct BillingPeriodRange
        include JSON::Serializable

        # The exclusive end billing period that defines a billing period range for the margin summary. For
        # example, if you choose a billing period that starts in October 2023 and ends in December 2023, the
        # margin summary will only include data from October 2023 and November 2023.

        @[JSON::Field(key: "ExclusiveEndBillingPeriod")]
        getter exclusive_end_billing_period : String

        # The inclusive start billing period that defines a billing period range for the margin summary.

        @[JSON::Field(key: "InclusiveStartBillingPeriod")]
        getter inclusive_start_billing_period : String

        def initialize(
          @exclusive_end_billing_period : String,
          @inclusive_start_billing_period : String
        )
        end
      end

      # The preferences and settings that will be used to compute the Amazon Web Services charges for a
      # billing group.

      struct ComputationPreference
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pricing plan that's used to compute the Amazon Web Services
        # charges for a billing group.

        @[JSON::Field(key: "PricingPlanArn")]
        getter pricing_plan_arn : String

        def initialize(
          @pricing_plan_arn : String
        )
        end
      end

      # You can cause an inconsistent state by updating or deleting a resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Identifier of the resource in use.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Type of the resource in use.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Reason for the inconsistent state.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String,
          @reason : String? = nil
        )
        end
      end


      struct CreateBillingGroupInput
        include JSON::Serializable

        # The set of accounts that will be under the billing group. The set of accounts resemble the linked
        # accounts in a consolidated billing family.

        @[JSON::Field(key: "AccountGrouping")]
        getter account_grouping : Types::AccountGrouping

        # The preferences and settings that will be used to compute the Amazon Web Services charges for a
        # billing group.

        @[JSON::Field(key: "ComputationPreference")]
        getter computation_preference : Types::ComputationPreference

        # The billing group name. The names must be unique.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique, case-sensitive identifier that you specify to ensure idempotency of the request.
        # Idempotency ensures that an API request completes no more than one time. With an idempotent request,
        # if the original request completes successfully, any subsequent retries complete successfully without
        # performing any further actions.

        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter client_token : String?

        # The description of the billing group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The account ID that serves as the main account in a billing group.

        @[JSON::Field(key: "PrimaryAccountId")]
        getter primary_account_id : String?

        # A map that contains tag keys and tag values that are attached to a billing group. This feature isn't
        # available during the beta.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @account_grouping : Types::AccountGrouping,
          @computation_preference : Types::ComputationPreference,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @primary_account_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateBillingGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created billing group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct CreateCustomLineItemInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that references the billing group where the custom line item applies
        # to.

        @[JSON::Field(key: "BillingGroupArn")]
        getter billing_group_arn : String

        # A CustomLineItemChargeDetails that describes the charge details for a custom line item.

        @[JSON::Field(key: "ChargeDetails")]
        getter charge_details : Types::CustomLineItemChargeDetails

        # The description of the custom line item. This is shown on the Bills page in association with the
        # charge value.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the custom line item.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Web Services account in which this custom line item will be applied to.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # A time range for which the custom line item is effective.

        @[JSON::Field(key: "BillingPeriodRange")]
        getter billing_period_range : Types::CustomLineItemBillingPeriodRange?

        # A unique, case-sensitive identifier that you specify to ensure idempotency of the request.
        # Idempotency ensures that an API request completes no more than one time. With an idempotent request,
        # if the original request completes successfully, any subsequent retries complete successfully without
        # performing any further actions.

        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter client_token : String?

        # Specifies how the custom line item charges are computed.

        @[JSON::Field(key: "ComputationRule")]
        getter computation_rule : String?

        # Details controlling how the custom line item charges are presented in the bill. Contains
        # specifications for which service the charges will be shown under.

        @[JSON::Field(key: "PresentationDetails")]
        getter presentation_details : Types::PresentationObject?

        # A map that contains tag keys and tag values that are attached to a custom line item.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @billing_group_arn : String,
          @charge_details : Types::CustomLineItemChargeDetails,
          @description : String,
          @name : String,
          @account_id : String? = nil,
          @billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil,
          @client_token : String? = nil,
          @computation_rule : String? = nil,
          @presentation_details : Types::PresentationObject? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCustomLineItemOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created custom line item.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The possible Amazon Web Services Free Tier configurations.

      struct CreateFreeTierConfig
        include JSON::Serializable

        # Activate or deactivate Amazon Web Services Free Tier.

        @[JSON::Field(key: "Activated")]
        getter activated : Bool

        def initialize(
          @activated : Bool
        )
        end
      end


      struct CreatePricingPlanInput
        include JSON::Serializable

        # The name of the pricing plan. The names must be unique to each pricing plan.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique, case-sensitive identifier that you specify to ensure idempotency of the request.
        # Idempotency ensures that an API request completes no more than one time. With an idempotent request,
        # if the original request completes successfully, any subsequent retries complete successfully without
        # performing any further actions.

        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter client_token : String?

        # The description of the pricing plan.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of Amazon Resource Names (ARNs) that define the pricing plan parameters.

        @[JSON::Field(key: "PricingRuleArns")]
        getter pricing_rule_arns : Array(String)?

        # A map that contains tag keys and tag values that are attached to a pricing plan.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @pricing_rule_arns : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePricingPlanOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created pricing plan.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct CreatePricingRuleInput
        include JSON::Serializable

        # The pricing rule name. The names must be unique to each pricing rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The scope of pricing rule that indicates if it's globally applicable, or it's service-specific.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The type of pricing rule.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The seller of services provided by Amazon Web Services, their affiliates, or third-party providers
        # selling services via Amazon Web Services Marketplace.

        @[JSON::Field(key: "BillingEntity")]
        getter billing_entity : String?

        # A unique, case-sensitive identifier that you specify to ensure idempotency of the request.
        # Idempotency ensures that an API request completes no more than one time. With an idempotent request,
        # if the original request completes successfully, any subsequent retries complete successfully without
        # performing any further actions.

        @[JSON::Field(key: "X-Amzn-Client-Token")]
        getter client_token : String?

        # The pricing rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A percentage modifier that's applied on the public pricing rates. Your entry will be rounded to the
        # nearest 2 decimal places.

        @[JSON::Field(key: "ModifierPercentage")]
        getter modifier_percentage : Float64?

        # Operation is the specific Amazon Web Services action covered by this line item. This describes the
        # specific usage of the line item. If the Scope attribute is set to SKU , this attribute indicates
        # which operation the PricingRule is modifying. For example, a value of RunInstances:0202 indicates
        # the operation of running an Amazon EC2 instance.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # If the Scope attribute is set to SERVICE or SKU , the attribute indicates which service the
        # PricingRule is applicable for.

        @[JSON::Field(key: "Service")]
        getter service : String?

        # A map that contains tag keys and tag values that are attached to a pricing rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The set of tiering configurations for the pricing rule.

        @[JSON::Field(key: "Tiering")]
        getter tiering : Types::CreateTieringInput?

        # Usage type is the unit that each service uses to measure the usage of a specific type of resource.
        # If the Scope attribute is set to SKU , this attribute indicates which usage type the PricingRule is
        # modifying. For example, USW2-BoxUsage:m2.2xlarge describes an M2 High Memory Double Extra Large
        # instance in the US West (Oregon) Region.

        @[JSON::Field(key: "UsageType")]
        getter usage_type : String?

        def initialize(
          @name : String,
          @scope : String,
          @type : String,
          @billing_entity : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @modifier_percentage : Float64? = nil,
          @operation : String? = nil,
          @service : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tiering : Types::CreateTieringInput? = nil,
          @usage_type : String? = nil
        )
        end
      end


      struct CreatePricingRuleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created pricing rule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The set of tiering configurations for the pricing rule.

      struct CreateTieringInput
        include JSON::Serializable

        # The possible Amazon Web Services Free Tier configurations.

        @[JSON::Field(key: "FreeTier")]
        getter free_tier : Types::CreateFreeTierConfig

        def initialize(
          @free_tier : Types::CreateFreeTierConfig
        )
        end
      end

      # The billing period range in which the custom line item request will be applied.

      struct CustomLineItemBillingPeriodRange
        include JSON::Serializable

        # The inclusive start billing period that defines a billing period range where a custom line is
        # applied.

        @[JSON::Field(key: "InclusiveStartBillingPeriod")]
        getter inclusive_start_billing_period : String

        # The inclusive end billing period that defines a billing period range where a custom line is applied.

        @[JSON::Field(key: "ExclusiveEndBillingPeriod")]
        getter exclusive_end_billing_period : String?

        def initialize(
          @inclusive_start_billing_period : String,
          @exclusive_end_billing_period : String? = nil
        )
        end
      end

      # The charge details of a custom line item. It should contain only one of Flat or Percentage .

      struct CustomLineItemChargeDetails
        include JSON::Serializable

        # The type of the custom line item that indicates whether the charge is a fee or credit.

        @[JSON::Field(key: "Type")]
        getter type : String

        # A CustomLineItemFlatChargeDetails that describes the charge details of a flat custom line item.

        @[JSON::Field(key: "Flat")]
        getter flat : Types::CustomLineItemFlatChargeDetails?

        # A representation of the line item filter.

        @[JSON::Field(key: "LineItemFilters")]
        getter line_item_filters : Array(Types::LineItemFilter)?

        # A CustomLineItemPercentageChargeDetails that describes the charge details of a percentage custom
        # line item.

        @[JSON::Field(key: "Percentage")]
        getter percentage : Types::CustomLineItemPercentageChargeDetails?

        def initialize(
          @type : String,
          @flat : Types::CustomLineItemFlatChargeDetails? = nil,
          @line_item_filters : Array(Types::LineItemFilter)? = nil,
          @percentage : Types::CustomLineItemPercentageChargeDetails? = nil
        )
        end
      end

      # A representation of the charge details that are associated with a flat custom line item.

      struct CustomLineItemFlatChargeDetails
        include JSON::Serializable

        # The custom line item's fixed charge value in USD.

        @[JSON::Field(key: "ChargeValue")]
        getter charge_value : Float64

        def initialize(
          @charge_value : Float64
        )
        end
      end

      # A representation of a custom line item.

      struct CustomLineItemListElement
        include JSON::Serializable

        # The Amazon Web Services account in which this custom line item will be applied to.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The Amazon Resource Names (ARNs) for custom line items.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The number of resources that are associated to the custom line item.

        @[JSON::Field(key: "AssociationSize")]
        getter association_size : Int64?

        # The Amazon Resource Name (ARN) that references the billing group where the custom line item applies
        # to.

        @[JSON::Field(key: "BillingGroupArn")]
        getter billing_group_arn : String?

        # A ListCustomLineItemChargeDetails that describes the charge details of a custom line item.

        @[JSON::Field(key: "ChargeDetails")]
        getter charge_details : Types::ListCustomLineItemChargeDetails?

        # The computation rule that determines how the custom line item charges are computed and reflected in
        # the bill.

        @[JSON::Field(key: "ComputationRule")]
        getter computation_rule : String?

        # The time created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Int64?

        # The custom line item's charge value currency. Only one of the valid values can be used.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The custom line item's description. This is shown on the Bills page in association with the charge
        # value.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time when the custom line item was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The custom line item's name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Configuration details specifying how the custom line item charges are presented, including which
        # service the charges are shown under.

        @[JSON::Field(key: "PresentationDetails")]
        getter presentation_details : Types::PresentationObject?

        # The product code that's associated with the custom line item.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @association_size : Int64? = nil,
          @billing_group_arn : String? = nil,
          @charge_details : Types::ListCustomLineItemChargeDetails? = nil,
          @computation_rule : String? = nil,
          @creation_time : Int64? = nil,
          @currency_code : String? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @name : String? = nil,
          @presentation_details : Types::PresentationObject? = nil,
          @product_code : String? = nil
        )
        end
      end

      # A representation of the charge details that are associated with a percentage custom line item.

      struct CustomLineItemPercentageChargeDetails
        include JSON::Serializable

        # The custom line item's percentage value. This will be multiplied against the combined value of its
        # associated resources to determine its charge value.

        @[JSON::Field(key: "PercentageValue")]
        getter percentage_value : Float64

        # A list of resource ARNs to associate to the percentage custom line item.

        @[JSON::Field(key: "AssociatedValues")]
        getter associated_values : Array(String)?

        def initialize(
          @percentage_value : Float64,
          @associated_values : Array(String)? = nil
        )
        end
      end

      # A representation of a custom line item version.

      struct CustomLineItemVersionListElement
        include JSON::Serializable

        # The Amazon Web Services account in which this custom line item will be applied to.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # A list of custom line item Amazon Resource Names (ARNs) to retrieve information.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The number of resources that are associated with the custom line item.

        @[JSON::Field(key: "AssociationSize")]
        getter association_size : Int64?

        # The Amazon Resource Name (ARN) of the billing group that the custom line item applies to.

        @[JSON::Field(key: "BillingGroupArn")]
        getter billing_group_arn : String?


        @[JSON::Field(key: "ChargeDetails")]
        getter charge_details : Types::ListCustomLineItemChargeDetails?

        # The computation rule for a specific version of a custom line item, determining how charges are
        # computed and reflected in the bill.

        @[JSON::Field(key: "ComputationRule")]
        getter computation_rule : String?

        # The time when the custom line item version was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Int64?

        # The charge value currency of the custom line item.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The description of the custom line item.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The end billing period of the custom line item version.

        @[JSON::Field(key: "EndBillingPeriod")]
        getter end_billing_period : String?

        # The most recent time that the custom line item version was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The name of the custom line item.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Presentation configuration for a specific version of a custom line item, specifying how charges are
        # displayed in the bill.

        @[JSON::Field(key: "PresentationDetails")]
        getter presentation_details : Types::PresentationObject?

        # The product code that’s associated with the custom line item.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String?

        # The start billing period of the custom line item version.

        @[JSON::Field(key: "StartBillingPeriod")]
        getter start_billing_period : String?

        # The inclusive start time.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Int64?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @association_size : Int64? = nil,
          @billing_group_arn : String? = nil,
          @charge_details : Types::ListCustomLineItemChargeDetails? = nil,
          @computation_rule : String? = nil,
          @creation_time : Int64? = nil,
          @currency_code : String? = nil,
          @description : String? = nil,
          @end_billing_period : String? = nil,
          @last_modified_time : Int64? = nil,
          @name : String? = nil,
          @presentation_details : Types::PresentationObject? = nil,
          @product_code : String? = nil,
          @start_billing_period : String? = nil,
          @start_time : Int64? = nil
        )
        end
      end


      struct DeleteBillingGroupInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing group that you're deleting.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteBillingGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted billing group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct DeleteCustomLineItemInput
        include JSON::Serializable

        # The ARN of the custom line item to be deleted.

        @[JSON::Field(key: "Arn")]
        getter arn : String


        @[JSON::Field(key: "BillingPeriodRange")]
        getter billing_period_range : Types::CustomLineItemBillingPeriodRange?

        def initialize(
          @arn : String,
          @billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil
        )
        end
      end


      struct DeleteCustomLineItemOutput
        include JSON::Serializable

        # The ARN of the deleted custom line item.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct DeletePricingPlanInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pricing plan that you're deleting.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeletePricingPlanOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted pricing plan.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct DeletePricingRuleInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pricing rule that you are deleting.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeletePricingRuleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted pricing rule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct DisassociateAccountsInput
        include JSON::Serializable

        # The array of account IDs to disassociate.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)

        # The Amazon Resource Name (ARN) of the billing group that the array of account IDs will disassociate
        # from.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @account_ids : Array(String),
          @arn : String
        )
        end
      end


      struct DisassociateAccountsOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing group that the array of account IDs is disassociated
        # from.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct DisassociatePricingRulesInput
        include JSON::Serializable

        # The pricing plan Amazon Resource Name (ARN) to disassociate pricing rules from.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A list containing the Amazon Resource Name (ARN) of the pricing rules that will be disassociated.

        @[JSON::Field(key: "PricingRuleArns")]
        getter pricing_rule_arns : Array(String)

        def initialize(
          @arn : String,
          @pricing_rule_arns : Array(String)
        )
        end
      end


      struct DisassociatePricingRulesOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pricing plan that the pricing rules successfully disassociated
        # from.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # A resource disassociation result for a percentage custom line item.

      struct DisassociateResourceResponseElement
        include JSON::Serializable

        # The resource ARN that was disassociated from the custom line item.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An AssociateResourceError that's shown if the resource disassociation fails.

        @[JSON::Field(key: "Error")]
        getter error : Types::AssociateResourceError?

        def initialize(
          @arn : String? = nil,
          @error : Types::AssociateResourceError? = nil
        )
        end
      end

      # The possible Amazon Web Services Free Tier configurations.

      struct FreeTierConfig
        include JSON::Serializable

        # Activate or deactivate Amazon Web Services Free Tier application.

        @[JSON::Field(key: "Activated")]
        getter activated : Bool

        def initialize(
          @activated : Bool
        )
        end
      end


      struct GetBillingGroupCostReportInput
        include JSON::Serializable

        # The Amazon Resource Number (ARN) that uniquely identifies the billing group.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A time range for which the margin summary is effective. You can specify up to 12 months.

        @[JSON::Field(key: "BillingPeriodRange")]
        getter billing_period_range : Types::BillingPeriodRange?

        # A list of strings that specify the attributes that are used to break down costs in the margin
        # summary reports for the billing group. For example, you can view your costs by the Amazon Web
        # Services service name or the billing period.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(String)?

        # The maximum number of margin summary reports to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token used on subsequent calls to get reports.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @billing_period_range : Types::BillingPeriodRange? = nil,
          @group_by : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetBillingGroupCostReportOutput
        include JSON::Serializable

        # The list of margin summary reports.

        @[JSON::Field(key: "BillingGroupCostReportResults")]
        getter billing_group_cost_report_results : Array(Types::BillingGroupCostReportResultElement)?

        # The pagination token used on subsequent calls to get reports.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_group_cost_report_results : Array(Types::BillingGroupCostReportResultElement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # An unexpected error occurred while processing a request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Number of seconds you can retry after the call.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # A representation of the line item filter for your custom line item. You can use line item filters to
      # include or exclude specific resource values from the billing group's total cost. For example, if you
      # create a custom line item and you want to filter out a value, such as Savings Plans discounts, you
      # can update LineItemFilter to exclude it.

      struct LineItemFilter
        include JSON::Serializable

        # The attribute of the line item filter. This specifies what attribute that you can filter on.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String

        # The match criteria of the line item filter. This parameter specifies whether not to include the
        # resource value from the billing group total cost.

        @[JSON::Field(key: "MatchOption")]
        getter match_option : String

        # The values of the line item filter. This specifies the values to filter on.

        @[JSON::Field(key: "AttributeValues")]
        getter attribute_values : Array(String)?

        # The values of the line item filter. This specifies the values to filter on. Currently, you can only
        # exclude Savings Plans discounts.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @attribute : String,
          @match_option : String,
          @attribute_values : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The filter on the account ID of the linked account, or any of the following: MONITORED : linked
      # accounts that are associated to billing groups. UNMONITORED : linked accounts that are not
      # associated to billing groups. Billing Group Arn : linked accounts that are associated to the
      # provided Billing Group Arn.

      struct ListAccountAssociationsFilter
        include JSON::Serializable

        # The Amazon Web Services account ID to filter on.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The list of Amazon Web Services IDs to retrieve their associated billing group for a given time
        # range.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # MONITORED : linked accounts that are associated to billing groups. UNMONITORED : linked accounts
        # that are not associated to billing groups. Billing Group Arn : linked accounts that are associated
        # to the provided Billing Group Arn.

        @[JSON::Field(key: "Association")]
        getter association : String?

        def initialize(
          @account_id : String? = nil,
          @account_ids : Array(String)? = nil,
          @association : String? = nil
        )
        end
      end


      struct ListAccountAssociationsInput
        include JSON::Serializable

        # The preferred billing period to get account associations.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # The filter on the account ID of the linked account, or any of the following: MONITORED : linked
        # accounts that are associated to billing groups. UNMONITORED : linked accounts that aren't associated
        # to billing groups. Billing Group Arn : linked accounts that are associated to the provided billing
        # group Arn.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListAccountAssociationsFilter?

        # The pagination token that's used on subsequent calls to retrieve accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_period : String? = nil,
          @filters : Types::ListAccountAssociationsFilter? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountAssociationsOutput
        include JSON::Serializable

        # The list of linked accounts in the payer account.

        @[JSON::Field(key: "LinkedAccounts")]
        getter linked_accounts : Array(Types::AccountAssociationsListElement)?

        # The pagination token that's used on subsequent calls to get accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @linked_accounts : Array(Types::AccountAssociationsListElement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies if the billing group has the following features enabled.

      struct ListBillingGroupAccountGrouping
        include JSON::Serializable

        # Specifies if this billing group will automatically associate newly added Amazon Web Services
        # accounts that join your consolidated billing family.

        @[JSON::Field(key: "AutoAssociate")]
        getter auto_associate : Bool?

        # The Amazon Resource Name (ARN) that identifies the transfer relationship for the billing group.

        @[JSON::Field(key: "ResponsibilityTransferArn")]
        getter responsibility_transfer_arn : String?

        def initialize(
          @auto_associate : Bool? = nil,
          @responsibility_transfer_arn : String? = nil
        )
        end
      end

      # The filter used to retrieve specific BillingGroupCostReportElements .

      struct ListBillingGroupCostReportsFilter
        include JSON::Serializable

        # The list of Amazon Resource Names (ARNs) used to filter billing groups to retrieve reports.

        @[JSON::Field(key: "BillingGroupArns")]
        getter billing_group_arns : Array(String)?

        def initialize(
          @billing_group_arns : Array(String)? = nil
        )
        end
      end


      struct ListBillingGroupCostReportsInput
        include JSON::Serializable

        # The preferred billing period for your report.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # A ListBillingGroupCostReportsFilter to specify billing groups to retrieve reports from.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListBillingGroupCostReportsFilter?

        # The maximum number of reports to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that's used on subsequent calls to get reports.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_period : String? = nil,
          @filters : Types::ListBillingGroupCostReportsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBillingGroupCostReportsOutput
        include JSON::Serializable

        # A list of BillingGroupCostReportElement retrieved.

        @[JSON::Field(key: "BillingGroupCostReports")]
        getter billing_group_cost_reports : Array(Types::BillingGroupCostReportElement)?

        # The pagination token that's used on subsequent calls to get reports.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_group_cost_reports : Array(Types::BillingGroupCostReportElement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The filter that specifies the billing groups and pricing plans to retrieve billing group
      # information.

      struct ListBillingGroupsFilter
        include JSON::Serializable

        # The list of billing group Amazon Resource Names (ARNs) to retrieve information.

        @[JSON::Field(key: "Arns")]
        getter arns : Array(String)?

        # Specifies if this billing group will automatically associate newly added Amazon Web Services
        # accounts that join your consolidated billing family.

        @[JSON::Field(key: "AutoAssociate")]
        getter auto_associate : Bool?

        # Filter billing groups by their type.

        @[JSON::Field(key: "BillingGroupTypes")]
        getter billing_group_types : Array(String)?

        # Filter billing groups by their names.

        @[JSON::Field(key: "Names")]
        getter names : Array(Types::StringSearch)?

        # The pricing plan Amazon Resource Names (ARNs) to retrieve information.

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # A list of primary account IDs to filter the billing groups.

        @[JSON::Field(key: "PrimaryAccountIds")]
        getter primary_account_ids : Array(String)?

        # Filter billing groups by their responsibility transfer ARNs.

        @[JSON::Field(key: "ResponsibilityTransferArns")]
        getter responsibility_transfer_arns : Array(String)?

        # A list of billing groups to retrieve their current status for a specific time range

        @[JSON::Field(key: "Statuses")]
        getter statuses : Array(String)?

        def initialize(
          @arns : Array(String)? = nil,
          @auto_associate : Bool? = nil,
          @billing_group_types : Array(String)? = nil,
          @names : Array(Types::StringSearch)? = nil,
          @pricing_plan : String? = nil,
          @primary_account_ids : Array(String)? = nil,
          @responsibility_transfer_arns : Array(String)? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct ListBillingGroupsInput
        include JSON::Serializable

        # The preferred billing period to get billing groups.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # A ListBillingGroupsFilter that specifies the billing group and pricing plan to retrieve billing
        # group information.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListBillingGroupsFilter?

        # The maximum number of billing groups to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that's used on subsequent calls to get billing groups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_period : String? = nil,
          @filters : Types::ListBillingGroupsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBillingGroupsOutput
        include JSON::Serializable

        # A list of BillingGroupListElement retrieved.

        @[JSON::Field(key: "BillingGroups")]
        getter billing_groups : Array(Types::BillingGroupListElement)?

        # The pagination token that's used on subsequent calls to get billing groups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_groups : Array(Types::BillingGroupListElement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A representation of the charge details of a custom line item.

      struct ListCustomLineItemChargeDetails
        include JSON::Serializable

        # The type of the custom line item that indicates whether the charge is a fee or credit .

        @[JSON::Field(key: "Type")]
        getter type : String

        # A ListCustomLineItemFlatChargeDetails that describes the charge details of a flat custom line item.

        @[JSON::Field(key: "Flat")]
        getter flat : Types::ListCustomLineItemFlatChargeDetails?

        # A representation of the line item filter.

        @[JSON::Field(key: "LineItemFilters")]
        getter line_item_filters : Array(Types::LineItemFilter)?

        # A ListCustomLineItemPercentageChargeDetails that describes the charge details of a percentage custom
        # line item.

        @[JSON::Field(key: "Percentage")]
        getter percentage : Types::ListCustomLineItemPercentageChargeDetails?

        def initialize(
          @type : String,
          @flat : Types::ListCustomLineItemFlatChargeDetails? = nil,
          @line_item_filters : Array(Types::LineItemFilter)? = nil,
          @percentage : Types::ListCustomLineItemPercentageChargeDetails? = nil
        )
        end
      end

      # A representation of the charge details that are associated with a flat custom line item.

      struct ListCustomLineItemFlatChargeDetails
        include JSON::Serializable

        # The custom line item's fixed charge value in USD.

        @[JSON::Field(key: "ChargeValue")]
        getter charge_value : Float64

        def initialize(
          @charge_value : Float64
        )
        end
      end

      # A representation of the charge details that are associated with a percentage custom line item.

      struct ListCustomLineItemPercentageChargeDetails
        include JSON::Serializable

        # The custom line item's percentage value. This will be multiplied against the combined value of its
        # associated resources to determine its charge value.

        @[JSON::Field(key: "PercentageValue")]
        getter percentage_value : Float64

        def initialize(
          @percentage_value : Float64
        )
        end
      end

      # A billing period filter that specifies the custom line item versions to retrieve.

      struct ListCustomLineItemVersionsBillingPeriodRangeFilter
        include JSON::Serializable

        # The exclusive end billing period that defines a billing period range where a custom line item
        # version is applied.

        @[JSON::Field(key: "EndBillingPeriod")]
        getter end_billing_period : String?

        # The inclusive start billing period that defines a billing period range where a custom line item
        # version is applied.

        @[JSON::Field(key: "StartBillingPeriod")]
        getter start_billing_period : String?

        def initialize(
          @end_billing_period : String? = nil,
          @start_billing_period : String? = nil
        )
        end
      end

      # A filter that specifies the billing period range where the custom line item versions reside.

      struct ListCustomLineItemVersionsFilter
        include JSON::Serializable

        # The billing period range in which the custom line item version is applied.

        @[JSON::Field(key: "BillingPeriodRange")]
        getter billing_period_range : Types::ListCustomLineItemVersionsBillingPeriodRangeFilter?

        def initialize(
          @billing_period_range : Types::ListCustomLineItemVersionsBillingPeriodRangeFilter? = nil
        )
        end
      end


      struct ListCustomLineItemVersionsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the custom line item.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A ListCustomLineItemVersionsFilter that specifies the billing period range in which the custom line
        # item versions are applied.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListCustomLineItemVersionsFilter?

        # The maximum number of custom line item versions to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that's used on subsequent calls to retrieve custom line item versions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @filters : Types::ListCustomLineItemVersionsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomLineItemVersionsOutput
        include JSON::Serializable

        # A list of CustomLineItemVersionListElements that are received.

        @[JSON::Field(key: "CustomLineItemVersions")]
        getter custom_line_item_versions : Array(Types::CustomLineItemVersionListElement)?

        # The pagination token that's used on subsequent calls to retrieve custom line item versions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @custom_line_item_versions : Array(Types::CustomLineItemVersionListElement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A filter that specifies the custom line items and billing groups to retrieve FFLI information.

      struct ListCustomLineItemsFilter
        include JSON::Serializable

        # The Amazon Web Services accounts in which this custom line item will be applied to.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # A list of custom line item ARNs to retrieve information.

        @[JSON::Field(key: "Arns")]
        getter arns : Array(String)?

        # The billing group Amazon Resource Names (ARNs) to retrieve information.

        @[JSON::Field(key: "BillingGroups")]
        getter billing_groups : Array(String)?

        # A list of custom line items to retrieve information.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @arns : Array(String)? = nil,
          @billing_groups : Array(String)? = nil,
          @names : Array(String)? = nil
        )
        end
      end


      struct ListCustomLineItemsInput
        include JSON::Serializable

        # The preferred billing period to get custom line items (FFLIs).

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # A ListCustomLineItemsFilter that specifies the custom line item names and/or billing group Amazon
        # Resource Names (ARNs) to retrieve FFLI information.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListCustomLineItemsFilter?

        # The maximum number of billing groups to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that's used on subsequent calls to get custom line items (FFLIs).

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_period : String? = nil,
          @filters : Types::ListCustomLineItemsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomLineItemsOutput
        include JSON::Serializable

        # A list of FreeFormLineItemListElements received.

        @[JSON::Field(key: "CustomLineItems")]
        getter custom_line_items : Array(Types::CustomLineItemListElement)?

        # The pagination token that's used on subsequent calls to get custom line items (FFLIs).

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @custom_line_items : Array(Types::CustomLineItemListElement)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPricingPlansAssociatedWithPricingRuleInput
        include JSON::Serializable

        # The pricing rule Amazon Resource Name (ARN) for which associations will be listed.

        @[JSON::Field(key: "PricingRuleArn")]
        getter pricing_rule_arn : String

        # The pricing plan billing period for which associations will be listed.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # The optional maximum number of pricing rule associations to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The optional pagination token returned by a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @pricing_rule_arn : String,
          @billing_period : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPricingPlansAssociatedWithPricingRuleOutput
        include JSON::Serializable

        # The pricing plan billing period for which associations will be listed.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # The pagination token to be used on subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list containing pricing plans that are associated with the requested pricing rule.

        @[JSON::Field(key: "PricingPlanArns")]
        getter pricing_plan_arns : Array(String)?

        # The pricing rule Amazon Resource Name (ARN) for which associations will be listed.

        @[JSON::Field(key: "PricingRuleArn")]
        getter pricing_rule_arn : String?

        def initialize(
          @billing_period : String? = nil,
          @next_token : String? = nil,
          @pricing_plan_arns : Array(String)? = nil,
          @pricing_rule_arn : String? = nil
        )
        end
      end

      # The filter that specifies the Amazon Resource Names (ARNs) of pricing plans, to retrieve pricing
      # plan information.

      struct ListPricingPlansFilter
        include JSON::Serializable

        # A list of pricing plan Amazon Resource Names (ARNs) to retrieve information.

        @[JSON::Field(key: "Arns")]
        getter arns : Array(String)?

        def initialize(
          @arns : Array(String)? = nil
        )
        end
      end


      struct ListPricingPlansInput
        include JSON::Serializable

        # The preferred billing period to get pricing plan.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # A ListPricingPlansFilter that specifies the Amazon Resource Name (ARNs) of pricing plans to retrieve
        # pricing plans information.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListPricingPlansFilter?

        # The maximum number of pricing plans to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that's used on subsequent call to get pricing plans.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_period : String? = nil,
          @filters : Types::ListPricingPlansFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPricingPlansOutput
        include JSON::Serializable

        # The billing period for which the described pricing plans are applicable.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # The pagination token that's used on subsequent calls to get pricing plans.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of PricingPlanListElement retrieved.

        @[JSON::Field(key: "PricingPlans")]
        getter pricing_plans : Array(Types::PricingPlanListElement)?

        def initialize(
          @billing_period : String? = nil,
          @next_token : String? = nil,
          @pricing_plans : Array(Types::PricingPlanListElement)? = nil
        )
        end
      end


      struct ListPricingRulesAssociatedToPricingPlanInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pricing plan for which associations are to be listed.

        @[JSON::Field(key: "PricingPlanArn")]
        getter pricing_plan_arn : String

        # The billing period for which the pricing rule associations are to be listed.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # The optional maximum number of pricing rule associations to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The optional pagination token returned by a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @pricing_plan_arn : String,
          @billing_period : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPricingRulesAssociatedToPricingPlanOutput
        include JSON::Serializable

        # The billing period for which the pricing rule associations are listed.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # The pagination token to be used on subsequent calls.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the pricing plan for which associations are listed.

        @[JSON::Field(key: "PricingPlanArn")]
        getter pricing_plan_arn : String?

        # A list containing pricing rules that are associated with the requested pricing plan.

        @[JSON::Field(key: "PricingRuleArns")]
        getter pricing_rule_arns : Array(String)?

        def initialize(
          @billing_period : String? = nil,
          @next_token : String? = nil,
          @pricing_plan_arn : String? = nil,
          @pricing_rule_arns : Array(String)? = nil
        )
        end
      end

      # The filter that specifies criteria that the pricing rules returned by the ListPricingRules API will
      # adhere to.

      struct ListPricingRulesFilter
        include JSON::Serializable

        # A list containing the pricing rule Amazon Resource Names (ARNs) to include in the API response.

        @[JSON::Field(key: "Arns")]
        getter arns : Array(String)?

        def initialize(
          @arns : Array(String)? = nil
        )
        end
      end


      struct ListPricingRulesInput
        include JSON::Serializable

        # The preferred billing period to get the pricing plan.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # A DescribePricingRuleFilter that specifies the Amazon Resource Name (ARNs) of pricing rules to
        # retrieve pricing rules information.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListPricingRulesFilter?

        # The maximum number of pricing rules to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that's used on subsequent call to get pricing rules.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @billing_period : String? = nil,
          @filters : Types::ListPricingRulesFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPricingRulesOutput
        include JSON::Serializable

        # The billing period for which the described pricing rules are applicable.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # The pagination token that's used on subsequent calls to get pricing rules.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list containing the described pricing rules.

        @[JSON::Field(key: "PricingRules")]
        getter pricing_rules : Array(Types::PricingRuleListElement)?

        def initialize(
          @billing_period : String? = nil,
          @next_token : String? = nil,
          @pricing_rules : Array(Types::PricingRuleListElement)? = nil
        )
        end
      end

      # A filter that specifies the type of resource associations that should be retrieved for a custom line
      # item.

      struct ListResourcesAssociatedToCustomLineItemFilter
        include JSON::Serializable

        # The type of relationship between the custom line item and the associated resource.

        @[JSON::Field(key: "Relationship")]
        getter relationship : String?

        def initialize(
          @relationship : String? = nil
        )
        end
      end


      struct ListResourcesAssociatedToCustomLineItemInput
        include JSON::Serializable

        # The ARN of the custom line item for which the resource associations will be listed.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The billing period for which the resource associations will be listed.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : String?

        # (Optional) A ListResourcesAssociatedToCustomLineItemFilter that can specify the types of resources
        # that should be retrieved.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListResourcesAssociatedToCustomLineItemFilter?

        # (Optional) The maximum number of resource associations to be retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # (Optional) The pagination token that's returned by a previous request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @billing_period : String? = nil,
          @filters : Types::ListResourcesAssociatedToCustomLineItemFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourcesAssociatedToCustomLineItemOutput
        include JSON::Serializable

        # The custom line item ARN for which the resource associations are listed.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A list of ListResourcesAssociatedToCustomLineItemResponseElement for each resource association
        # retrieved.

        @[JSON::Field(key: "AssociatedResources")]
        getter associated_resources : Array(Types::ListResourcesAssociatedToCustomLineItemResponseElement)?

        # The pagination token to be used in subsequent requests to retrieve additional results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arn : String? = nil,
          @associated_resources : Array(Types::ListResourcesAssociatedToCustomLineItemResponseElement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A representation of a resource association for a custom line item.

      struct ListResourcesAssociatedToCustomLineItemResponseElement
        include JSON::Serializable

        # The ARN of the associated resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The end billing period of the associated resource.

        @[JSON::Field(key: "EndBillingPeriod")]
        getter end_billing_period : String?

        # The type of relationship between the custom line item and the associated resource.

        @[JSON::Field(key: "Relationship")]
        getter relationship : String?

        def initialize(
          @arn : String? = nil,
          @end_billing_period : String? = nil,
          @relationship : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list the tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object that defines how custom line item charges are presented in the bill, containing
      # specifications for service presentation.

      struct PresentationObject
        include JSON::Serializable

        # The service under which the custom line item charges will be presented. Must be a string between 1
        # and 128 characters matching the pattern " ^[a-zA-Z0-9]+$ ".

        @[JSON::Field(key: "Service")]
        getter service : String

        def initialize(
          @service : String
        )
        end
      end

      # A representation of a pricing plan.

      struct PricingPlanListElement
        include JSON::Serializable

        # The pricing plan Amazon Resource Names (ARN). This can be used to uniquely identify a pricing plan.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time when the pricing plan was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Int64?

        # The pricing plan description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time when the pricing plan was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The name of a pricing plan.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The pricing rules count that's currently associated with this pricing plan list element.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        def initialize(
          @arn : String? = nil,
          @creation_time : Int64? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @name : String? = nil,
          @size : Int64? = nil
        )
        end
      end

      # A representation of a pricing rule.

      struct PricingRuleListElement
        include JSON::Serializable

        # The Amazon Resource Name (ARN) used to uniquely identify a pricing rule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The pricing plans count that this pricing rule is associated with.

        @[JSON::Field(key: "AssociatedPricingPlanCount")]
        getter associated_pricing_plan_count : Int64?

        # The seller of services provided by Amazon Web Services, their affiliates, or third-party providers
        # selling services via Amazon Web Services Marketplace.

        @[JSON::Field(key: "BillingEntity")]
        getter billing_entity : String?

        # The time when the pricing rule was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Int64?

        # The pricing rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time when the pricing rule was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # A percentage modifier applied on the public pricing rates.

        @[JSON::Field(key: "ModifierPercentage")]
        getter modifier_percentage : Float64?

        # The name of a pricing rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Operation is the specific Amazon Web Services action covered by this line item. This describes the
        # specific usage of the line item. If the Scope attribute is set to SKU , this attribute indicates
        # which operation the PricingRule is modifying. For example, a value of RunInstances:0202 indicates
        # the operation of running an Amazon EC2 instance.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The scope of pricing rule that indicates if it is globally applicable, or if it is service-specific.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # If the Scope attribute is SERVICE , this attribute indicates which service the PricingRule is
        # applicable for.

        @[JSON::Field(key: "Service")]
        getter service : String?

        # The set of tiering configurations for the pricing rule.

        @[JSON::Field(key: "Tiering")]
        getter tiering : Types::Tiering?

        # The type of pricing rule.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Usage type is the unit that each service uses to measure the usage of a specific type of resource.
        # If the Scope attribute is set to SKU , this attribute indicates which usage type the PricingRule is
        # modifying. For example, USW2-BoxUsage:m2.2xlarge describes an M2 High Memory Double Extra Large
        # instance in the US West (Oregon) Region.

        @[JSON::Field(key: "UsageType")]
        getter usage_type : String?

        def initialize(
          @arn : String? = nil,
          @associated_pricing_plan_count : Int64? = nil,
          @billing_entity : String? = nil,
          @creation_time : Int64? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @modifier_percentage : Float64? = nil,
          @name : String? = nil,
          @operation : String? = nil,
          @scope : String? = nil,
          @service : String? = nil,
          @tiering : Types::Tiering? = nil,
          @type : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # The request references a resource that doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Resource identifier that was not found.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Resource type that was not found.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The request would cause a service limit to exceed.

      struct ServiceLimitExceededException
        include JSON::Serializable

        # The unique code identifier of the service limit that is being exceeded.

        @[JSON::Field(key: "LimitCode")]
        getter limit_code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        # The unique code for the service of the limit that is being exceeded.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Identifier of the resource affected.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Type of the resource affected.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @limit_code : String,
          @message : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # A structure that defines string search parameters.

      struct StringSearch
        include JSON::Serializable

        # The search option to be applied when performing the string search.

        @[JSON::Field(key: "SearchOption")]
        getter search_option : String

        # The value to search for within the specified string field.

        @[JSON::Field(key: "SearchValue")]
        getter search_value : String

        def initialize(
          @search_option : String,
          @search_value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which to add tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to add to the resource as a list of key-value pairs.

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

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Number of seconds you can safely retry after the call.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The set of tiering configurations for the pricing rule.

      struct Tiering
        include JSON::Serializable

        # The possible Amazon Web Services Free Tier configurations.

        @[JSON::Field(key: "FreeTier")]
        getter free_tier : Types::FreeTierConfig

        def initialize(
          @free_tier : Types::FreeTierConfig
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which to delete tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to delete from the resource as a list of key-value pairs.

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

      # Specifies if the billing group has the following features enabled.

      struct UpdateBillingGroupAccountGrouping
        include JSON::Serializable

        # Specifies if this billing group will automatically associate newly added Amazon Web Services
        # accounts that join your consolidated billing family.

        @[JSON::Field(key: "AutoAssociate")]
        getter auto_associate : Bool?

        # The Amazon Resource Name (ARN) that identifies the transfer relationship. Note: Modifications to the
        # ResponsibilityTransferArn are not permitted for existing billing groups.

        @[JSON::Field(key: "ResponsibilityTransferArn")]
        getter responsibility_transfer_arn : String?

        def initialize(
          @auto_associate : Bool? = nil,
          @responsibility_transfer_arn : String? = nil
        )
        end
      end


      struct UpdateBillingGroupInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing group being updated.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Specifies if the billing group has automatic account association ( AutoAssociate ) enabled.

        @[JSON::Field(key: "AccountGrouping")]
        getter account_grouping : Types::UpdateBillingGroupAccountGrouping?

        # The preferences and settings that will be used to compute the Amazon Web Services charges for a
        # billing group.

        @[JSON::Field(key: "ComputationPreference")]
        getter computation_preference : Types::ComputationPreference?

        # A description of the billing group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the billing group. The names must be unique to each billing group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the billing group. Only one of the valid values can be used.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String,
          @account_grouping : Types::UpdateBillingGroupAccountGrouping? = nil,
          @computation_preference : Types::ComputationPreference? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateBillingGroupOutput
        include JSON::Serializable

        # Specifies if the billing group has automatic account association ( AutoAssociate ) enabled.

        @[JSON::Field(key: "AccountGrouping")]
        getter account_grouping : Types::UpdateBillingGroupAccountGrouping?

        # The Amazon Resource Name (ARN) of the billing group that was updated.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A description of the billing group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time when the billing group was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The name of the billing group. The names must be unique to each billing group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the pricing plan to compute Amazon Web Services charges for the
        # billing group.

        @[JSON::Field(key: "PricingPlanArn")]
        getter pricing_plan_arn : String?

        # The account ID that serves as the main account in a billing group.

        @[JSON::Field(key: "PrimaryAccountId")]
        getter primary_account_id : String?

        # The number of accounts in the particular billing group.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # The status of the billing group. Only one of the valid values can be used.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason why the billing group is in its current status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @account_grouping : Types::UpdateBillingGroupAccountGrouping? = nil,
          @arn : String? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @name : String? = nil,
          @pricing_plan_arn : String? = nil,
          @primary_account_id : String? = nil,
          @size : Int64? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # A representation of the new charge details of a custom line item. This should contain only one of
      # Flat or Percentage .

      struct UpdateCustomLineItemChargeDetails
        include JSON::Serializable

        # An UpdateCustomLineItemFlatChargeDetails that describes the new charge details of a flat custom line
        # item.

        @[JSON::Field(key: "Flat")]
        getter flat : Types::UpdateCustomLineItemFlatChargeDetails?

        # A representation of the line item filter.

        @[JSON::Field(key: "LineItemFilters")]
        getter line_item_filters : Array(Types::LineItemFilter)?

        # An UpdateCustomLineItemPercentageChargeDetails that describes the new charge details of a percentage
        # custom line item.

        @[JSON::Field(key: "Percentage")]
        getter percentage : Types::UpdateCustomLineItemPercentageChargeDetails?

        def initialize(
          @flat : Types::UpdateCustomLineItemFlatChargeDetails? = nil,
          @line_item_filters : Array(Types::LineItemFilter)? = nil,
          @percentage : Types::UpdateCustomLineItemPercentageChargeDetails? = nil
        )
        end
      end

      # A representation of the new charge details that are associated with a flat custom line item.

      struct UpdateCustomLineItemFlatChargeDetails
        include JSON::Serializable

        # The custom line item's new fixed charge value in USD.

        @[JSON::Field(key: "ChargeValue")]
        getter charge_value : Float64

        def initialize(
          @charge_value : Float64
        )
        end
      end


      struct UpdateCustomLineItemInput
        include JSON::Serializable

        # The ARN of the custom line item to be updated.

        @[JSON::Field(key: "Arn")]
        getter arn : String


        @[JSON::Field(key: "BillingPeriodRange")]
        getter billing_period_range : Types::CustomLineItemBillingPeriodRange?

        # A ListCustomLineItemChargeDetails containing the new charge details for the custom line item.

        @[JSON::Field(key: "ChargeDetails")]
        getter charge_details : Types::UpdateCustomLineItemChargeDetails?

        # The new line item description of the custom line item.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new name for the custom line item.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String,
          @billing_period_range : Types::CustomLineItemBillingPeriodRange? = nil,
          @charge_details : Types::UpdateCustomLineItemChargeDetails? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateCustomLineItemOutput
        include JSON::Serializable

        # The ARN of the successfully updated custom line item.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The number of resources that are associated to the custom line item.

        @[JSON::Field(key: "AssociationSize")]
        getter association_size : Int64?

        # The ARN of the billing group that the custom line item is applied to.

        @[JSON::Field(key: "BillingGroupArn")]
        getter billing_group_arn : String?

        # A ListCustomLineItemChargeDetails containing the charge details of the successfully updated custom
        # line item.

        @[JSON::Field(key: "ChargeDetails")]
        getter charge_details : Types::ListCustomLineItemChargeDetails?

        # The description of the successfully updated custom line item.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time when the custom line item was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The name of the successfully updated custom line item.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @association_size : Int64? = nil,
          @billing_group_arn : String? = nil,
          @charge_details : Types::ListCustomLineItemChargeDetails? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @name : String? = nil
        )
        end
      end

      # A representation of the new charge details that are associated with a percentage custom line item.

      struct UpdateCustomLineItemPercentageChargeDetails
        include JSON::Serializable

        # The custom line item's new percentage value. This will be multiplied against the combined value of
        # its associated resources to determine its charge value.

        @[JSON::Field(key: "PercentageValue")]
        getter percentage_value : Float64

        def initialize(
          @percentage_value : Float64
        )
        end
      end

      # The possible Amazon Web Services Free Tier configurations.

      struct UpdateFreeTierConfig
        include JSON::Serializable

        # Activate or deactivate application of Amazon Web Services Free Tier.

        @[JSON::Field(key: "Activated")]
        getter activated : Bool

        def initialize(
          @activated : Bool
        )
        end
      end


      struct UpdatePricingPlanInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pricing plan that you're updating.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The description of the pricing plan.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the pricing plan. The name must be unique to each pricing plan.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdatePricingPlanOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated pricing plan.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The new description for the pricing rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time when the pricing plan was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The name of the pricing plan. The name must be unique to each pricing plan.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The pricing rules count that's currently associated with this pricing plan list.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @name : String? = nil,
          @size : Int64? = nil
        )
        end
      end


      struct UpdatePricingRuleInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the pricing rule to update.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The new description for the pricing rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new modifier to show pricing plan rates as a percentage. Your entry will be rounded to the
        # nearest 2 decimal places.

        @[JSON::Field(key: "ModifierPercentage")]
        getter modifier_percentage : Float64?

        # The new name of the pricing rule. The name must be unique to each pricing rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The set of tiering configurations for the pricing rule.

        @[JSON::Field(key: "Tiering")]
        getter tiering : Types::UpdateTieringInput?

        # The new pricing rule type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String,
          @description : String? = nil,
          @modifier_percentage : Float64? = nil,
          @name : String? = nil,
          @tiering : Types::UpdateTieringInput? = nil,
          @type : String? = nil
        )
        end
      end


      struct UpdatePricingRuleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the successfully updated pricing rule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The pricing plans count that this pricing rule is associated with.

        @[JSON::Field(key: "AssociatedPricingPlanCount")]
        getter associated_pricing_plan_count : Int64?

        # The seller of services provided by Amazon Web Services, their affiliates, or third-party providers
        # selling services via Amazon Web Services Marketplace.

        @[JSON::Field(key: "BillingEntity")]
        getter billing_entity : String?

        # The new description for the pricing rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent time the pricing rule was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Int64?

        # The new modifier to show pricing plan rates as a percentage.

        @[JSON::Field(key: "ModifierPercentage")]
        getter modifier_percentage : Float64?

        # The new name of the pricing rule. The name must be unique to each pricing rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Operation refers to the specific Amazon Web Services covered by this line item. This describes the
        # specific usage of the line item. If the Scope attribute is set to SKU , this attribute indicates
        # which operation the PricingRule is modifying. For example, a value of RunInstances:0202 indicates
        # the operation of running an Amazon EC2 instance.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The scope of pricing rule that indicates if it's globally applicable, or it's service-specific.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # If the Scope attribute is set to SERVICE , the attribute indicates which service the PricingRule is
        # applicable for.

        @[JSON::Field(key: "Service")]
        getter service : String?

        # The set of tiering configurations for the pricing rule.

        @[JSON::Field(key: "Tiering")]
        getter tiering : Types::UpdateTieringInput?

        # The new pricing rule type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Usage type is the unit that each service uses to measure the usage of a specific type of resource.
        # If the Scope attribute is set to SKU , this attribute indicates which usage type the PricingRule is
        # modifying. For example, USW2-BoxUsage:m2.2xlarge describes an M2 High Memory Double Extra Large
        # instance in the US West (Oregon) Region.

        @[JSON::Field(key: "UsageType")]
        getter usage_type : String?

        def initialize(
          @arn : String? = nil,
          @associated_pricing_plan_count : Int64? = nil,
          @billing_entity : String? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @modifier_percentage : Float64? = nil,
          @name : String? = nil,
          @operation : String? = nil,
          @scope : String? = nil,
          @service : String? = nil,
          @tiering : Types::UpdateTieringInput? = nil,
          @type : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # The set of tiering configurations for the pricing rule.

      struct UpdateTieringInput
        include JSON::Serializable

        # The possible Amazon Web Services Free Tier configurations.

        @[JSON::Field(key: "FreeTier")]
        getter free_tier : Types::UpdateFreeTierConfig

        def initialize(
          @free_tier : Types::UpdateFreeTierConfig
        )
        end
      end

      # The input doesn't match with the constraints specified by Amazon Web Services services.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The fields that caused the error, if applicable.

        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # The reason the request's validation failed.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # The field's information of a request that resulted in an exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # The message describing why the field failed validation.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The field name.

        @[JSON::Field(key: "Name")]
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
