require "json"
require "time"

module Aws
  module MarketplaceAgreement
    module Types

      # A subset of terms proposed by the proposer, which have been accepted by the acceptor as part of
      # agreement creation.

      struct AcceptedTerm
        include JSON::Serializable

        # Enables you and your customers to move your existing agreements to AWS Marketplace. The customer
        # won't be charged for product usage in AWS Marketplace because they already paid for the product
        # outside of AWS Marketplace.

        @[JSON::Field(key: "byolPricingTerm")]
        getter byol_pricing_term : Types::ByolPricingTerm?

        # Defines a prepaid payment model that allows buyers to configure the entitlements they want to
        # purchase and the duration.

        @[JSON::Field(key: "configurableUpfrontPricingTerm")]
        getter configurable_upfront_pricing_term : Types::ConfigurableUpfrontPricingTerm?

        # Defines a pre-paid pricing model where the customers are charged a fixed upfront amount.

        @[JSON::Field(key: "fixedUpfrontPricingTerm")]
        getter fixed_upfront_pricing_term : Types::FixedUpfrontPricingTerm?

        # Defines a short-term free pricing model where the buyers aren’t charged anything within a specified
        # limit.

        @[JSON::Field(key: "freeTrialPricingTerm")]
        getter free_trial_pricing_term : Types::FreeTrialPricingTerm?

        # Defines the list of text agreements proposed to the acceptors. An example is the end user license
        # agreement (EULA).

        @[JSON::Field(key: "legalTerm")]
        getter legal_term : Types::LegalTerm?

        # Defines an installment-based pricing model where customers are charged a fixed price on different
        # dates during the agreement validity period. This is used most commonly for flexible payment schedule
        # pricing.

        @[JSON::Field(key: "paymentScheduleTerm")]
        getter payment_schedule_term : Types::PaymentScheduleTerm?

        # Defines a pricing model where customers are charged a fixed recurring price at the end of each
        # billing period.

        @[JSON::Field(key: "recurringPaymentTerm")]
        getter recurring_payment_term : Types::RecurringPaymentTerm?

        # Defines that on graceful expiration of the agreement (when the agreement ends on its pre-defined end
        # date), a new agreement will be created using the accepted terms on the existing agreement. In other
        # words, the agreement will be renewed. Presence of RenewalTerm in the offer document means that
        # auto-renewal is allowed. Buyers will have the option to accept or decline auto-renewal at the offer
        # acceptance/agreement creation. Buyers can also change this flag from True to False or False to True
        # at anytime during the agreement's lifecycle.

        @[JSON::Field(key: "renewalTerm")]
        getter renewal_term : Types::RenewalTerm?

        # Defines the customer support available for the acceptors when they purchase the software.

        @[JSON::Field(key: "supportTerm")]
        getter support_term : Types::SupportTerm?

        # Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the customers are
        # charged based on product usage.

        @[JSON::Field(key: "usageBasedPricingTerm")]
        getter usage_based_pricing_term : Types::UsageBasedPricingTerm?

        # Defines the conditions that will keep an agreement created from this offer valid.

        @[JSON::Field(key: "validityTerm")]
        getter validity_term : Types::ValidityTerm?

        # Defines a payment model where sellers can submit variable payment requests up to a maximum charge
        # amount, with configurable approval strategies and expiration timelines.

        @[JSON::Field(key: "variablePaymentTerm")]
        getter variable_payment_term : Types::VariablePaymentTerm?

        def initialize(
          @byol_pricing_term : Types::ByolPricingTerm? = nil,
          @configurable_upfront_pricing_term : Types::ConfigurableUpfrontPricingTerm? = nil,
          @fixed_upfront_pricing_term : Types::FixedUpfrontPricingTerm? = nil,
          @free_trial_pricing_term : Types::FreeTrialPricingTerm? = nil,
          @legal_term : Types::LegalTerm? = nil,
          @payment_schedule_term : Types::PaymentScheduleTerm? = nil,
          @recurring_payment_term : Types::RecurringPaymentTerm? = nil,
          @renewal_term : Types::RenewalTerm? = nil,
          @support_term : Types::SupportTerm? = nil,
          @usage_based_pricing_term : Types::UsageBasedPricingTerm? = nil,
          @validity_term : Types::ValidityTerm? = nil,
          @variable_payment_term : Types::VariablePaymentTerm? = nil
        )
        end
      end

      # The details of the party accepting the agreement terms. This is commonly the buyer for
      # PurchaseAgreement .

      struct Acceptor
        include JSON::Serializable

        # The AWS account ID of the acceptor.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end

      # User does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The unique identifier for the error.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # A summary of the agreement, including top-level attributes (for example, the agreement ID, proposer,
      # and acceptor).

      struct AgreementViewSummary
        include JSON::Serializable

        # The date and time that the agreement was accepted.

        @[JSON::Field(key: "acceptanceTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter acceptance_time : Time?

        # Details of the party accepting the agreement terms. This is commonly the buyer for
        # PurchaseAgreement.

        @[JSON::Field(key: "acceptor")]
        getter acceptor : Types::Acceptor?

        # The unique identifier of the agreement.

        @[JSON::Field(key: "agreementId")]
        getter agreement_id : String?

        # The type of agreement. Value is PurchaseAgreement .

        @[JSON::Field(key: "agreementType")]
        getter agreement_type : String?

        # The date and time when the agreement ends. The field is null for pay-as-you-go agreements, which
        # don’t have end dates.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # A summary of the proposal

        @[JSON::Field(key: "proposalSummary")]
        getter proposal_summary : Types::ProposalSummary?

        # Details of the party proposing the agreement terms, most commonly the seller for PurchaseAgreement .

        @[JSON::Field(key: "proposer")]
        getter proposer : Types::Proposer?

        # The date and time when the agreement starts.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The current status of the agreement.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @acceptance_time : Time? = nil,
          @acceptor : Types::Acceptor? = nil,
          @agreement_id : String? = nil,
          @agreement_type : String? = nil,
          @end_time : Time? = nil,
          @proposal_summary : Types::ProposalSummary? = nil,
          @proposer : Types::Proposer? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Enables you and your customers to move your existing agreements to AWS Marketplace. The customer
      # won't be charged for product usage in AWS Marketplace because they already paid for the product
      # outside of AWS Marketplace.

      struct ByolPricingTerm
        include JSON::Serializable

        # Type of the term being updated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # Defines a prepaid payment model that allows buyers to configure the entitlements they want to
      # purchase and the duration.

      struct ConfigurableUpfrontPricingTerm
        include JSON::Serializable

        # Additional parameters specified by the acceptor while accepting the term.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurableUpfrontPricingTermConfiguration?

        # Defines the currency for the prices mentioned in the term.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # A rate card defines the per unit rates for product dimensions.

        @[JSON::Field(key: "rateCards")]
        getter rate_cards : Array(Types::ConfigurableUpfrontRateCardItem)?

        # Category of selector.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @configuration : Types::ConfigurableUpfrontPricingTermConfiguration? = nil,
          @currency_code : String? = nil,
          @rate_cards : Array(Types::ConfigurableUpfrontRateCardItem)? = nil,
          @type : String? = nil
        )
        end
      end

      # Defines a prepaid payment model that allows buyers to configure the entitlements they want to
      # purchase and the duration.

      struct ConfigurableUpfrontPricingTermConfiguration
        include JSON::Serializable

        # Defines the dimensions that the acceptor has purchased from the overall set of dimensions presented
        # in the rate card.

        @[JSON::Field(key: "dimensions")]
        getter dimensions : Array(Types::Dimension)

        # Defines the length of time for which the particular pricing/dimension is being purchased by the
        # acceptor.

        @[JSON::Field(key: "selectorValue")]
        getter selector_value : String

        def initialize(
          @dimensions : Array(Types::Dimension),
          @selector_value : String
        )
        end
      end

      # Within the prepaid payment model defined under ConfigurableUpfrontPricingTerm , the RateCardItem
      # defines all the various rate cards (including pricing and dimensions) that have been proposed.

      struct ConfigurableUpfrontRateCardItem
        include JSON::Serializable

        # Defines limits on how the term can be configured by acceptors.

        @[JSON::Field(key: "constraints")]
        getter constraints : Types::Constraints?

        # Defines the per unit rates for product dimensions.

        @[JSON::Field(key: "rateCard")]
        getter rate_card : Array(Types::RateCardItem)?

        # Differentiates between the mutually exclusive rate cards in the same pricing term to be selected by
        # the buyer.

        @[JSON::Field(key: "selector")]
        getter selector : Types::Selector?

        def initialize(
          @constraints : Types::Constraints? = nil,
          @rate_card : Array(Types::RateCardItem)? = nil,
          @selector : Types::Selector? = nil
        )
        end
      end

      # Defines limits on how the term can be configured by acceptors.

      struct Constraints
        include JSON::Serializable

        # Determines if buyers are allowed to select multiple dimensions in the rate card. The possible values
        # are Allowed and Disallowed . The default value is Allowed .

        @[JSON::Field(key: "multipleDimensionSelection")]
        getter multiple_dimension_selection : String?

        # Determines if acceptors are allowed to configure quantity for each dimension in rate card. The
        # possible values are Allowed and Disallowed . The default value is Allowed .

        @[JSON::Field(key: "quantityConfiguration")]
        getter quantity_configuration : String?

        def initialize(
          @multiple_dimension_selection : String? = nil,
          @quantity_configuration : String? = nil
        )
        end
      end


      struct DescribeAgreementInput
        include JSON::Serializable

        # The unique identifier of the agreement.

        @[JSON::Field(key: "agreementId")]
        getter agreement_id : String

        def initialize(
          @agreement_id : String
        )
        end
      end


      struct DescribeAgreementOutput
        include JSON::Serializable

        # The date and time the offer was accepted or the agreement was created. AcceptanceTime and StartTime
        # can differ for future dated agreements (FDAs).

        @[JSON::Field(key: "acceptanceTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter acceptance_time : Time?

        # The details of the party accepting the agreement terms. This is commonly the buyer for
        # PurchaseAgreement .

        @[JSON::Field(key: "acceptor")]
        getter acceptor : Types::Acceptor?

        # The unique identifier of the agreement.

        @[JSON::Field(key: "agreementId")]
        getter agreement_id : String?

        # The type of agreement. Values are PurchaseAgreement or VendorInsightsAgreement .

        @[JSON::Field(key: "agreementType")]
        getter agreement_type : String?

        # The date and time when the agreement ends. The field is null for pay-as-you-go agreements, which
        # don’t have end dates.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The estimated cost of the agreement.

        @[JSON::Field(key: "estimatedCharges")]
        getter estimated_charges : Types::EstimatedCharges?

        # A summary of the proposal received from the proposer.

        @[JSON::Field(key: "proposalSummary")]
        getter proposal_summary : Types::ProposalSummary?

        # The details of the party proposing the agreement terms. This is commonly the seller for
        # PurchaseAgreement .

        @[JSON::Field(key: "proposer")]
        getter proposer : Types::Proposer?

        # The date and time when the agreement starts.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The current status of the agreement. Statuses include: ACTIVE – The terms of the agreement are
        # active. ARCHIVED – The agreement ended without a specified reason. CANCELLED – The acceptor ended
        # the agreement before the defined end date. EXPIRED – The agreement ended on the defined end date.
        # RENEWED – The agreement was renewed into a new agreement (for example, an auto-renewal). REPLACED –
        # The agreement was replaced using an agreement replacement offer. TERMINATED – The agreement ended
        # before the defined end date because of an AWS termination (for example, a payment failure).

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @acceptance_time : Time? = nil,
          @acceptor : Types::Acceptor? = nil,
          @agreement_id : String? = nil,
          @agreement_type : String? = nil,
          @end_time : Time? = nil,
          @estimated_charges : Types::EstimatedCharges? = nil,
          @proposal_summary : Types::ProposalSummary? = nil,
          @proposer : Types::Proposer? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Defines the dimensions that the acceptor has purchased from the overall set of dimensions presented
      # in the rate card.

      struct Dimension
        include JSON::Serializable

        # The name of key value of the dimension.

        @[JSON::Field(key: "dimensionKey")]
        getter dimension_key : String

        # The number of units of the dimension the acceptor has purchased. For Agreements with
        # ConfigurableUpfrontPricingTerm , the RateCard section will define the prices and dimensions defined
        # by the seller (proposer), whereas the Configuration section will define the actual dimensions,
        # prices, and units the buyer has chosen to accept.

        @[JSON::Field(key: "dimensionValue")]
        getter dimension_value : Int32

        def initialize(
          @dimension_key : String,
          @dimension_value : Int32
        )
        end
      end

      # Includes the list of references to legal resources proposed by the proposer to the acceptor. Each
      # DocumentItem refers to an individual reference.

      struct DocumentItem
        include JSON::Serializable

        # Category of the document. Document types include: CustomEula – A custom EULA provided by you as
        # seller. A URL for a EULA stored in an accessible Amazon S3 bucket is required for this document
        # type. CustomDsa – A custom Data Subscription Agreement (DSA) provided by you as seller. A URL for a
        # DSA stored in an accessible Amazon S3 bucket is required for this document type. StandardEula – The
        # Standard Contract for AWS Marketplace (SCMP). For more information about SCMP, see the AWS
        # Marketplace Seller Guide. You don’t provide a URL for this type because it’s managed by AWS
        # Marketplace. StandardDsa – DSA for AWS Marketplace. For more information about the DSA, see the AWS
        # Data Exchange User Guide. You don’t provide a URL for this type because it’s managed by AWS
        # Marketplace.

        @[JSON::Field(key: "type")]
        getter type : String?

        # A URL to the legal document for buyers to read. Required when Type is CustomEula .

        @[JSON::Field(key: "url")]
        getter url : String?

        # Version of standard contracts provided by AWS Marketplace. Required when Type is StandardEula or
        # StandardDsa .

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @type : String? = nil,
          @url : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Estimated cost of the agreement.

      struct EstimatedCharges
        include JSON::Serializable

        # The total known amount customer has to pay across the lifecycle of the agreement. This is the total
        # contract value if accepted terms contain ConfigurableUpfrontPricingTerm or FixedUpfrontPricingTerm .
        # In the case of pure contract pricing, this will be the total value of the contract. In the case of
        # contracts with consumption pricing, this will only include the committed value and not include any
        # overages that occur. If the accepted terms contain PaymentScheduleTerm , it will be the total
        # payment schedule amount. This occurs when flexible payment schedule is used, and is the sum of all
        # invoice charges in the payment schedule. In case a customer has amended an agreement, by purchasing
        # more units of any dimension, this will include both the original cost as well as the added cost
        # incurred due to addition of new units. This is 0 if the accepted terms contain UsageBasedPricingTerm
        # without ConfigurableUpfrontPricingTerm or RecurringPaymentTerm . This occurs for usage-based pricing
        # (such as SaaS metered or AMI/container hourly or monthly), because the exact usage is not known
        # upfront.

        @[JSON::Field(key: "agreementValue")]
        getter agreement_value : String?

        # Defines the currency code for the charge.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        def initialize(
          @agreement_value : String? = nil,
          @currency_code : String? = nil
        )
        end
      end

      # The filter name and value pair that is used to return a more specific list of results. Filters can
      # be used to match a set of resources by various criteria, such as offerId or productId .

      struct Filter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter value.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Defines a prepaid pricing model where the customers are charged a fixed upfront amount.

      struct FixedUpfrontPricingTerm
        include JSON::Serializable

        # Defines the currency for the prices mentioned in this term.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # Contract duration for the terms.

        @[JSON::Field(key: "duration")]
        getter duration : String?

        # Entitlements granted to the acceptor of fixed upfront as part of agreement execution.

        @[JSON::Field(key: "grants")]
        getter grants : Array(Types::GrantItem)?

        # Fixed amount to be charged to the customer when this term is accepted.

        @[JSON::Field(key: "price")]
        getter price : String?

        # Category of the term being updated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @currency_code : String? = nil,
          @duration : String? = nil,
          @grants : Array(Types::GrantItem)? = nil,
          @price : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Defines a short-term free pricing model where the buyers aren’t charged anything within a specified
      # limit.

      struct FreeTrialPricingTerm
        include JSON::Serializable

        # Duration of the free trial period (5–31 days).

        @[JSON::Field(key: "duration")]
        getter duration : String?

        # Entitlements granted to the acceptor of a free trial as part of an agreement execution.

        @[JSON::Field(key: "grants")]
        getter grants : Array(Types::GrantItem)?

        # Category of the term.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @duration : String? = nil,
          @grants : Array(Types::GrantItem)? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetAgreementTermsInput
        include JSON::Serializable

        # The unique identifier of the agreement.

        @[JSON::Field(key: "agreementId")]
        getter agreement_id : String

        # The maximum number of agreements to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start pagination

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agreement_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetAgreementTermsOutput
        include JSON::Serializable

        # A subset of terms proposed by the proposer that have been accepted by the acceptor as part of the
        # agreement creation.

        @[JSON::Field(key: "acceptedTerms")]
        getter accepted_terms : Array(Types::AcceptedTerm)?

        # A token to specify where to start pagination

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @accepted_terms : Array(Types::AcceptedTerm)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Entitlements granted to the acceptor of fixed upfront as part of agreement execution.

      struct GrantItem
        include JSON::Serializable

        # Unique dimension key defined in the product document. Dimensions represent categories of capacity in
        # a product and are specified when the product is listed in AWS Marketplace.

        @[JSON::Field(key: "dimensionKey")]
        getter dimension_key : String?

        # Maximum amount of capacity that the buyer can be entitled to the given dimension of the product. If
        # MaxQuantity is not provided, the buyer will be able to use an unlimited amount of the given
        # dimension.

        @[JSON::Field(key: "maxQuantity")]
        getter max_quantity : Int32?

        def initialize(
          @dimension_key : String? = nil,
          @max_quantity : Int32? = nil
        )
        end
      end

      # Unexpected error during processing of request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The unique identifier for the error.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Defines the list of text agreements proposed to the acceptors. An example is the end user license
      # agreement (EULA).

      struct LegalTerm
        include JSON::Serializable

        # List of references to legal resources proposed to the buyers. An example is the EULA.

        @[JSON::Field(key: "documents")]
        getter documents : Array(Types::DocumentItem)?

        # Category of the term being updated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @documents : Array(Types::DocumentItem)? = nil,
          @type : String? = nil
        )
        end
      end

      # Defines an installment-based pricing model where customers are charged a fixed price on different
      # dates during the agreement validity period. This is used most commonly for flexible payment schedule
      # pricing.

      struct PaymentScheduleTerm
        include JSON::Serializable

        # Defines the currency for the prices mentioned in the term.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # List of the payment schedule where each element defines one installment of payment. It contains the
        # information necessary for calculating the price.

        @[JSON::Field(key: "schedule")]
        getter schedule : Array(Types::ScheduleItem)?

        # Type of the term.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @currency_code : String? = nil,
          @schedule : Array(Types::ScheduleItem)? = nil,
          @type : String? = nil
        )
        end
      end

      # A summary of the proposal received from the proposer.

      struct ProposalSummary
        include JSON::Serializable

        # The unique identifier of the offer in AWS Marketplace.

        @[JSON::Field(key: "offerId")]
        getter offer_id : String?

        # A unique identifier for the offer set containing this offer. All agreements created from offers in
        # this set include this identifier as context.

        @[JSON::Field(key: "offerSetId")]
        getter offer_set_id : String?

        # The list of resources involved in the agreement.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)?

        def initialize(
          @offer_id : String? = nil,
          @offer_set_id : String? = nil,
          @resources : Array(Types::Resource)? = nil
        )
        end
      end

      # Details of the party proposing the agreement terms,. This is commonly the seller for
      # PurchaseAgreement .

      struct Proposer
        include JSON::Serializable

        # The AWS account ID of the proposer.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end

      # Defines the per unit rates for each individual product dimension.

      struct RateCardItem
        include JSON::Serializable

        # Dimension for which the given entitlement applies. Dimensions represent categories of capacity in a
        # product and are specified when the product is listed in AWS Marketplace.

        @[JSON::Field(key: "dimensionKey")]
        getter dimension_key : String?

        # Per unit price for the product dimension that’s used for calculating the amount to be charged.

        @[JSON::Field(key: "price")]
        getter price : String?

        def initialize(
          @dimension_key : String? = nil,
          @price : String? = nil
        )
        end
      end

      # Defines a pricing model where customers are charged a fixed recurring price at the end of each
      # billing period.

      struct RecurringPaymentTerm
        include JSON::Serializable

        # Defines the recurrence at which buyers are charged.

        @[JSON::Field(key: "billingPeriod")]
        getter billing_period : String?

        # Defines the currency for the prices mentioned in this term.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # Amount charged to the buyer every billing period.

        @[JSON::Field(key: "price")]
        getter price : String?

        # Type of the term being updated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @billing_period : String? = nil,
          @currency_code : String? = nil,
          @price : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Defines that on graceful expiration of the agreement (when the agreement ends on its pre-defined end
      # date), a new agreement will be created using the accepted terms on the existing agreement. In other
      # words, the agreement will be renewed. The presence of RenewalTerm in the offer document means that
      # auto-renewal is allowed. Buyers will have the option to accept or decline auto-renewal at the offer
      # acceptance/agreement creation. Buyers can also change this flag from True to False or False to True
      # at anytime during the agreement's lifecycle.

      struct RenewalTerm
        include JSON::Serializable

        # Additional parameters specified by the acceptor while accepting the term.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RenewalTermConfiguration?

        # Category of the term being updated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @configuration : Types::RenewalTermConfiguration? = nil,
          @type : String? = nil
        )
        end
      end

      # Additional parameters specified by the acceptor while accepting the term.

      struct RenewalTermConfiguration
        include JSON::Serializable

        # Defines whether the acceptor has chosen to auto-renew the agreement at the end of its lifecycle. Can
        # be set to True or False .

        @[JSON::Field(key: "enableAutoRenew")]
        getter enable_auto_renew : Bool

        def initialize(
          @enable_auto_renew : Bool
        )
        end
      end

      # The list of resources involved in the agreement.

      struct Resource
        include JSON::Serializable

        # The unique identifier of the resource. We mention the term resource, which is most commonly a
        # product, so a resourceId is also a productId .

        @[JSON::Field(key: "id")]
        getter id : String?

        # Type of the resource, which is the product. Values include SaaSProduct or AmiProduct .

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Request references a resource which does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The unique identifier for the error.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # The unique identifier for the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # An individual installment of the payment that includes the date and amount of the charge.

      struct ScheduleItem
        include JSON::Serializable

        # The price that the customer would pay on the scheduled date (chargeDate).

        @[JSON::Field(key: "chargeAmount")]
        getter charge_amount : String?

        # The date that the customer would pay the price defined in this payment schedule term. Invoices are
        # generated on the date provided.

        @[JSON::Field(key: "chargeDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter charge_date : Time?

        def initialize(
          @charge_amount : String? = nil,
          @charge_date : Time? = nil
        )
        end
      end


      struct SearchAgreementsInput
        include JSON::Serializable

        # The catalog in which the agreement was created.

        @[JSON::Field(key: "catalog")]
        getter catalog : String?

        # The filter name and value pair used to return a specific list of results. The following filters are
        # supported: ResourceIdentifier – The unique identifier of the resource. ResourceType – Type of the
        # resource, which is the product ( AmiProduct , ContainerProduct , SaaSProduct ,
        # ProfessionalServicesProduct , or MachineLearningProduct ). PartyType – The party type of the caller.
        # For agreements where the caller is the proposer, use the Proposer filter. AcceptorAccountId – The
        # AWS account ID of the party accepting the agreement terms. OfferId – The unique identifier of the
        # offer in which the terms are registered in the agreement token. Status – The current status of the
        # agreement. Values include ACTIVE , ARCHIVED , CANCELLED , EXPIRED , RENEWED , REPLACED , and
        # TERMINATED . BeforeEndTime – A date used to filter agreements with a date before the endTime of an
        # agreement. AfterEndTime – A date used to filter agreements with a date after the endTime of an
        # agreement. AgreementType – The type of agreement. Supported value includes PurchaseAgreement .
        # OfferSetId – A unique identifier for the offer set containing this offer. All agreements created
        # from offers in this set include this identifier as context.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of agreements to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to specify where to start pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object that contains the SortBy and SortOrder attributes. Only EndTime is supported for
        # SearchAgreements . The default sort is EndTime descending.

        @[JSON::Field(key: "sort")]
        getter sort : Types::Sort?

        def initialize(
          @catalog : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::Sort? = nil
        )
        end
      end


      struct SearchAgreementsOutput
        include JSON::Serializable

        # A summary of the agreement, including top-level attributes (for example, the agreement ID, proposer,
        # and acceptor).

        @[JSON::Field(key: "agreementViewSummaries")]
        getter agreement_view_summaries : Array(Types::AgreementViewSummary)?

        # The token used for pagination. The field is null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agreement_view_summaries : Array(Types::AgreementViewSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Differentiates between the mutually exclusive rate cards in the same pricing term to be selected by
      # the buyer.

      struct Selector
        include JSON::Serializable

        # Category of selector.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Contract duration. This field supports the ISO 8601 format.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # An object that contains the SortBy and SortOrder attributes.

      struct Sort
        include JSON::Serializable

        # The attribute on which the data is grouped, which can be by StartTime and EndTime . The default
        # value is EndTime .

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sorting order, which can be ASCENDING or DESCENDING . The default value is DESCENDING .

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Defines the customer support available for the acceptors when they purchase the software.

      struct SupportTerm
        include JSON::Serializable

        # Free-text field about the refund policy description that will be shown to customers as is on the
        # website and console.

        @[JSON::Field(key: "refundPolicy")]
        getter refund_policy : String?

        # Category of the term being updated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @refund_policy : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The unique identifier for the error.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the customers are
      # charged based on product usage.

      struct UsageBasedPricingTerm
        include JSON::Serializable

        # Defines the currency for the prices mentioned in the term.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # List of rate cards.

        @[JSON::Field(key: "rateCards")]
        getter rate_cards : Array(Types::UsageBasedRateCardItem)?

        # Category of the term.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @currency_code : String? = nil,
          @rate_cards : Array(Types::UsageBasedRateCardItem)? = nil,
          @type : String? = nil
        )
        end
      end

      # Within the pay-as-you-go model defined under UsageBasedPricingTerm , the UsageBasedRateCardItem
      # defines an individual rate for a product dimension.

      struct UsageBasedRateCardItem
        include JSON::Serializable

        # Defines the per unit rates for product dimensions.

        @[JSON::Field(key: "rateCard")]
        getter rate_card : Array(Types::RateCardItem)?

        def initialize(
          @rate_card : Array(Types::RateCardItem)? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by the service.

      struct ValidationException
        include JSON::Serializable

        # The fields associated with the error.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # The reason associated with the error.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The unique identifier associated with the error.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by the service.

      struct ValidationExceptionField
        include JSON::Serializable

        # See applicable actions.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field associated with the error.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Defines the conditions that will keep an agreement created from this offer valid.

      struct ValidityTerm
        include JSON::Serializable

        # Defines the duration that the agreement remains active. If AgreementStartDate isn’t provided, the
        # agreement duration is relative to the agreement signature time. The duration is represented in the
        # ISO_8601 format.

        @[JSON::Field(key: "agreementDuration")]
        getter agreement_duration : String?

        # Defines the date when the agreement ends. The agreement ends at 23:59:59.999 UTC on the date
        # provided. If AgreementEndDate isn’t provided, the agreement end date is determined by the validity
        # of individual terms.

        @[JSON::Field(key: "agreementEndDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter agreement_end_date : Time?

        # Defines the date when agreement starts. The agreement starts at 00:00:00.000 UTC on the date
        # provided. If AgreementStartDate isn’t provided, the agreement start date is determined based on
        # agreement signature time.

        @[JSON::Field(key: "agreementStartDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter agreement_start_date : Time?

        # Category of the term being updated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @agreement_duration : String? = nil,
          @agreement_end_date : Time? = nil,
          @agreement_start_date : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # Defines a payment model where sellers can submit variable payment requests up to a maximum charge
      # amount, with configurable approval strategies and expiration timelines.

      struct VariablePaymentTerm
        include JSON::Serializable

        # Additional parameters specified by the acceptor while accepting the term.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::VariablePaymentTermConfiguration?

        # Defines the currency for the prices mentioned in the term.

        @[JSON::Field(key: "currencyCode")]
        getter currency_code : String?

        # The maximum total amount that can be charged to the customer through variable payment requests under
        # this term.

        @[JSON::Field(key: "maxTotalChargeAmount")]
        getter max_total_charge_amount : String?

        # Type of the term.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @configuration : Types::VariablePaymentTermConfiguration? = nil,
          @currency_code : String? = nil,
          @max_total_charge_amount : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Additional parameters specified by the acceptor while accepting the variable payment term.

      struct VariablePaymentTermConfiguration
        include JSON::Serializable

        # Defines the strategy for approving payment requests. Values include AUTO_APPROVE_ON_EXPIRATION and
        # WAIT_FOR_APPROVAL

        @[JSON::Field(key: "paymentRequestApprovalStrategy")]
        getter payment_request_approval_strategy : String

        # Defines the duration after which a payment request is automatically approved if no further action is
        # taken. This only applies when the payment request approval strategy is set to
        # AUTO_APPROVE_ON_EXPIRATION . The duration is represented in the ISO_8601 format (e.g., P10D for 10
        # days).

        @[JSON::Field(key: "expirationDuration")]
        getter expiration_duration : String?

        def initialize(
          @payment_request_approval_strategy : String,
          @expiration_duration : String? = nil
        )
        end
      end
    end
  end
end
