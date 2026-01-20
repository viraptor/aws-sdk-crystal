require "json"
require "time"

module Aws
  module Invoicing
    module Types

      # You don't have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # You don't have sufficient access to perform this action.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Details about how the total amount was calculated and categorized.

      struct AmountBreakdown
        include JSON::Serializable

        # The discounted amount.

        @[JSON::Field(key: "Discounts")]
        getter discounts : Types::DiscountsBreakdown?

        # The fee amount.

        @[JSON::Field(key: "Fees")]
        getter fees : Types::FeesBreakdown?

        # The total of a set of the breakdown.

        @[JSON::Field(key: "SubTotalAmount")]
        getter sub_total_amount : String?

        # The tax amount.

        @[JSON::Field(key: "Taxes")]
        getter taxes : Types::TaxesBreakdown?

        def initialize(
          @discounts : Types::DiscountsBreakdown? = nil,
          @fees : Types::FeesBreakdown? = nil,
          @sub_total_amount : String? = nil,
          @taxes : Types::TaxesBreakdown? = nil
        )
        end
      end


      struct BatchGetInvoiceProfileRequest
        include JSON::Serializable

        # Retrieves the corresponding invoice profile data for these account IDs.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end


      struct BatchGetInvoiceProfileResponse
        include JSON::Serializable

        # A list of invoice profiles corresponding to the requested accounts.

        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::InvoiceProfile)?

        def initialize(
          @profiles : Array(Types::InvoiceProfile)? = nil
        )
        end
      end

      # The billing period for which you want to retrieve invoice-related documents.

      struct BillingPeriod
        include JSON::Serializable

        # The billing period month.

        @[JSON::Field(key: "Month")]
        getter month : Int32

        # The billing period year.

        @[JSON::Field(key: "Year")]
        getter year : Int32

        def initialize(
          @month : Int32,
          @year : Int32
        )
        end
      end

      # The request could not be completed due to a conflict with the current state of the resource. This
      # exception occurs when a concurrent modification is detected during an update operation, or when
      # attempting to create a resource that already exists.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The identifier of the resource that caused the conflict.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource that caused the conflict.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Represents contact information for a person or role associated with the procurement portal
      # preference.

      struct Contact
        include JSON::Serializable

        # The email address of the contact person or role.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The name of the contact person or role.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @email : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateInvoiceUnitRequest
        include JSON::Serializable

        # The Amazon Web Services account ID chosen to be the receiver of an invoice unit. All invoices
        # generated for that invoice unit will be sent to this account ID.

        @[JSON::Field(key: "InvoiceReceiver")]
        getter invoice_receiver : String

        # The unique name of the invoice unit that is shown on the generated invoice. This can't be changed
        # once it is set. To change this name, you must delete the invoice unit recreate.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The InvoiceUnitRule object used to create invoice units.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::InvoiceUnitRule

        # The invoice unit's description. This can be changed at a later time.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tag structure that contains a tag key and value.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # Whether the invoice unit based tax inheritance is/ should be enabled or disabled.

        @[JSON::Field(key: "TaxInheritanceDisabled")]
        getter tax_inheritance_disabled : Bool?

        def initialize(
          @invoice_receiver : String,
          @name : String,
          @rule : Types::InvoiceUnitRule,
          @description : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @tax_inheritance_disabled : Bool? = nil
        )
        end
      end


      struct CreateInvoiceUnitResponse
        include JSON::Serializable

        # The ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String?

        def initialize(
          @invoice_unit_arn : String? = nil
        )
        end
      end


      struct CreateProcurementPortalPreferenceRequest
        include JSON::Serializable

        # The domain identifier for the buyer in the procurement portal.

        @[JSON::Field(key: "BuyerDomain")]
        getter buyer_domain : String

        # The unique identifier for the buyer in the procurement portal.

        @[JSON::Field(key: "BuyerIdentifier")]
        getter buyer_identifier : String

        # List of contact information for portal administrators and technical contacts responsible for the
        # e-invoice integration.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Array(Types::Contact)

        # Indicates whether e-invoice delivery is enabled for this procurement portal preference. Set to true
        # to enable e-invoice delivery, false to disable.

        @[JSON::Field(key: "EinvoiceDeliveryEnabled")]
        getter einvoice_delivery_enabled : Bool

        # The name of the procurement portal.

        @[JSON::Field(key: "ProcurementPortalName")]
        getter procurement_portal_name : String

        # Indicates whether purchase order retrieval is enabled for this procurement portal preference. Set to
        # true to enable PO retrieval, false to disable.

        @[JSON::Field(key: "PurchaseOrderRetrievalEnabled")]
        getter purchase_order_retrieval_enabled : Bool

        # The domain identifier for the supplier in the procurement portal.

        @[JSON::Field(key: "SupplierDomain")]
        getter supplier_domain : String

        # The unique identifier for the supplier in the procurement portal.

        @[JSON::Field(key: "SupplierIdentifier")]
        getter supplier_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Specifies the e-invoice delivery configuration including document types, attachment types, and
        # customization settings for the portal.

        @[JSON::Field(key: "EinvoiceDeliveryPreference")]
        getter einvoice_delivery_preference : Types::EinvoiceDeliveryPreference?

        # The endpoint URL where e-invoices will be delivered to the procurement portal. Must be a valid HTTPS
        # URL.

        @[JSON::Field(key: "ProcurementPortalInstanceEndpoint")]
        getter procurement_portal_instance_endpoint : String?

        # The shared secret or authentication credential used to establish secure communication with the
        # procurement portal. This value must be encrypted at rest.

        @[JSON::Field(key: "ProcurementPortalSharedSecret")]
        getter procurement_portal_shared_secret : String?

        # The tags to apply to this procurement portal preference resource. Each tag consists of a key and an
        # optional value.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?


        @[JSON::Field(key: "Selector")]
        getter selector : Types::ProcurementPortalPreferenceSelector?

        # Configuration settings for the test environment of the procurement portal. Includes test credentials
        # and endpoints that are used for validation before production deployment.

        @[JSON::Field(key: "TestEnvPreference")]
        getter test_env_preference : Types::TestEnvPreferenceInput?

        def initialize(
          @buyer_domain : String,
          @buyer_identifier : String,
          @contacts : Array(Types::Contact),
          @einvoice_delivery_enabled : Bool,
          @procurement_portal_name : String,
          @purchase_order_retrieval_enabled : Bool,
          @supplier_domain : String,
          @supplier_identifier : String,
          @client_token : String? = nil,
          @einvoice_delivery_preference : Types::EinvoiceDeliveryPreference? = nil,
          @procurement_portal_instance_endpoint : String? = nil,
          @procurement_portal_shared_secret : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @selector : Types::ProcurementPortalPreferenceSelector? = nil,
          @test_env_preference : Types::TestEnvPreferenceInput? = nil
        )
        end
      end


      struct CreateProcurementPortalPreferenceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created procurement portal preference.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        def initialize(
          @procurement_portal_preference_arn : String
        )
        end
      end

      # The details of currency exchange.

      struct CurrencyExchangeDetails
        include JSON::Serializable

        # The currency exchange rate.

        @[JSON::Field(key: "Rate")]
        getter rate : String?

        # The exchange source currency.

        @[JSON::Field(key: "SourceCurrencyCode")]
        getter source_currency_code : String?

        # The exchange target currency.

        @[JSON::Field(key: "TargetCurrencyCode")]
        getter target_currency_code : String?

        def initialize(
          @rate : String? = nil,
          @source_currency_code : String? = nil,
          @target_currency_code : String? = nil
        )
        end
      end

      # The time period that you want invoice-related documents for.

      struct DateInterval
        include JSON::Serializable

        # The end of the time period that you want invoice-related documents for. The end date is exclusive.
        # For example, if end is 2019-01-10 , Amazon Web Services retrieves invoice-related documents from the
        # start date up to, but not including, 2018-01-10 .

        @[JSON::Field(key: "EndDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_date : Time

        # The beginning of the time period that you want invoice-related documents for. The start date is
        # inclusive. For example, if start is 2019-01-01 , AWS retrieves invoices starting at 2019-01-01 up to
        # the end date.

        @[JSON::Field(key: "StartDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_date : Time

        def initialize(
          @end_date : Time,
          @start_date : Time
        )
        end
      end


      struct DeleteInvoiceUnitRequest
        include JSON::Serializable

        # The ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String

        def initialize(
          @invoice_unit_arn : String
        )
        end
      end


      struct DeleteInvoiceUnitResponse
        include JSON::Serializable

        # The ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String?

        def initialize(
          @invoice_unit_arn : String? = nil
        )
        end
      end


      struct DeleteProcurementPortalPreferenceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the procurement portal preference to delete.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        def initialize(
          @procurement_portal_preference_arn : String
        )
        end
      end


      struct DeleteProcurementPortalPreferenceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted procurement portal preference.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        def initialize(
          @procurement_portal_preference_arn : String
        )
        end
      end

      # The discounts details.

      struct DiscountsBreakdown
        include JSON::Serializable

        # The list of discounts information.

        @[JSON::Field(key: "Breakdown")]
        getter breakdown : Array(Types::DiscountsBreakdownAmount)?

        # The discount's total amount.

        @[JSON::Field(key: "TotalAmount")]
        getter total_amount : String?

        def initialize(
          @breakdown : Array(Types::DiscountsBreakdownAmount)? = nil,
          @total_amount : String? = nil
        )
        end
      end

      # The discounted amount.

      struct DiscountsBreakdownAmount
        include JSON::Serializable

        # The discounted amount.

        @[JSON::Field(key: "Amount")]
        getter amount : String?

        # The list of discounts information.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The details for the discount rate..

        @[JSON::Field(key: "Rate")]
        getter rate : String?

        def initialize(
          @amount : String? = nil,
          @description : String? = nil,
          @rate : String? = nil
        )
        end
      end

      # Specifies the preferences for e-invoice delivery, including document types, attachment types, and
      # customization settings.

      struct EinvoiceDeliveryPreference
        include JSON::Serializable

        # The method to use for testing the connection to the procurement portal.

        @[JSON::Field(key: "ConnectionTestingMethod")]
        getter connection_testing_method : String

        # The date when e-invoice delivery should be activated for this preference.

        @[JSON::Field(key: "EinvoiceDeliveryActivationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter einvoice_delivery_activation_date : Time

        # The types of e-invoice documents to be delivered.

        @[JSON::Field(key: "EinvoiceDeliveryDocumentTypes")]
        getter einvoice_delivery_document_types : Array(String)

        # The communication protocol to use for e-invoice delivery.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # The sources of purchase order data to use for e-invoice generation and delivery.

        @[JSON::Field(key: "PurchaseOrderDataSources")]
        getter purchase_order_data_sources : Array(Types::PurchaseOrderDataSource)

        # The types of attachments to include with the e-invoice delivery.

        @[JSON::Field(key: "EinvoiceDeliveryAttachmentTypes")]
        getter einvoice_delivery_attachment_types : Array(String)?

        def initialize(
          @connection_testing_method : String,
          @einvoice_delivery_activation_date : Time,
          @einvoice_delivery_document_types : Array(String),
          @protocol : String,
          @purchase_order_data_sources : Array(Types::PurchaseOrderDataSource),
          @einvoice_delivery_attachment_types : Array(String)? = nil
        )
        end
      end

      # The organization name providing Amazon Web Services services.

      struct Entity
        include JSON::Serializable

        # The name of the entity that issues the Amazon Web Services invoice.

        @[JSON::Field(key: "InvoicingEntity")]
        getter invoicing_entity : String?

        def initialize(
          @invoicing_entity : String? = nil
        )
        end
      end

      # The details of fees.

      struct FeesBreakdown
        include JSON::Serializable

        # The list of fees information.

        @[JSON::Field(key: "Breakdown")]
        getter breakdown : Array(Types::FeesBreakdownAmount)?

        # The total amount of fees.

        @[JSON::Field(key: "TotalAmount")]
        getter total_amount : String?

        def initialize(
          @breakdown : Array(Types::FeesBreakdownAmount)? = nil,
          @total_amount : String? = nil
        )
        end
      end

      # The fee amount.

      struct FeesBreakdownAmount
        include JSON::Serializable

        # The fee amount.

        @[JSON::Field(key: "Amount")]
        getter amount : String?

        # The list of fees information.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Details about the rate amount.

        @[JSON::Field(key: "Rate")]
        getter rate : String?

        def initialize(
          @amount : String? = nil,
          @description : String? = nil,
          @rate : String? = nil
        )
        end
      end

      # An optional input to the list API. If multiple filters are specified, the returned list will be a
      # configuration that match all of the provided filters. Supported filter types are InvoiceReceivers ,
      # Names , and Accounts .

      struct Filters
        include JSON::Serializable

        # You can specify a list of Amazon Web Services account IDs inside filters to return invoice units
        # that match only the specified accounts. If multiple accounts are provided, the result is an OR
        # condition (match any) of the specified accounts. The specified account IDs are matched with either
        # the receiver or the linked accounts in the rules.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # A list of Amazon Web Services account account IDs used to filter invoice units. These are payer
        # accounts from other Organizations that have delegated their billing responsibility to the receiver
        # account through the billing transfer feature.

        @[JSON::Field(key: "BillSourceAccounts")]
        getter bill_source_accounts : Array(String)?

        # You can specify a list of Amazon Web Services account IDs inside filters to return invoice units
        # that match only the specified accounts. If multiple accounts are provided, the result is an OR
        # condition (match any) of the specified accounts. This filter only matches the specified accounts on
        # the invoice receivers of the invoice units.

        @[JSON::Field(key: "InvoiceReceivers")]
        getter invoice_receivers : Array(String)?

        # An optional input to the list API. You can specify a list of invoice unit names inside filters to
        # return invoice units that match only the specified invoice unit names. If multiple names are
        # provided, the result is an OR condition (match any) of the specified invoice unit names.

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        def initialize(
          @accounts : Array(String)? = nil,
          @bill_source_accounts : Array(String)? = nil,
          @invoice_receivers : Array(String)? = nil,
          @names : Array(String)? = nil
        )
        end
      end


      struct GetInvoicePDFRequest
        include JSON::Serializable

        # Your unique invoice ID.

        @[JSON::Field(key: "InvoiceId")]
        getter invoice_id : String

        def initialize(
          @invoice_id : String
        )
        end
      end


      struct GetInvoicePDFResponse
        include JSON::Serializable

        # The invoice document and supplemental documents associated with the invoice.

        @[JSON::Field(key: "InvoicePDF")]
        getter invoice_pdf : Types::InvoicePDF?

        def initialize(
          @invoice_pdf : Types::InvoicePDF? = nil
        )
        end
      end


      struct GetInvoiceUnitRequest
        include JSON::Serializable

        # The ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String

        # The state of an invoice unit at a specified time. You can see legacy invoice units that are
        # currently deleted if the AsOf time is set to before it was deleted. If an AsOf is not provided, the
        # default value is the current time.

        @[JSON::Field(key: "AsOf", converter: Aws::Runtime::UnixTimestampConverter)]
        getter as_of : Time?

        def initialize(
          @invoice_unit_arn : String,
          @as_of : Time? = nil
        )
        end
      end


      struct GetInvoiceUnitResponse
        include JSON::Serializable

        # The assigned description for an invoice unit.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Web Services account ID chosen to be the receiver of an invoice unit. All invoices
        # generated for that invoice unit will be sent to this account ID.

        @[JSON::Field(key: "InvoiceReceiver")]
        getter invoice_receiver : String?

        # The ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String?

        # The most recent date the invoice unit response was updated.

        @[JSON::Field(key: "LastModified", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified : Time?

        # The unique name of the invoice unit that is shown on the generated invoice.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "Rule")]
        getter rule : Types::InvoiceUnitRule?

        # Whether the invoice unit based tax inheritance is/ should be enabled or disabled.

        @[JSON::Field(key: "TaxInheritanceDisabled")]
        getter tax_inheritance_disabled : Bool?

        def initialize(
          @description : String? = nil,
          @invoice_receiver : String? = nil,
          @invoice_unit_arn : String? = nil,
          @last_modified : Time? = nil,
          @name : String? = nil,
          @rule : Types::InvoiceUnitRule? = nil,
          @tax_inheritance_disabled : Bool? = nil
        )
        end
      end


      struct GetProcurementPortalPreferenceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the procurement portal preference to retrieve.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        def initialize(
          @procurement_portal_preference_arn : String
        )
        end
      end


      struct GetProcurementPortalPreferenceResponse
        include JSON::Serializable

        # The detailed configuration of the requested procurement portal preference.

        @[JSON::Field(key: "ProcurementPortalPreference")]
        getter procurement_portal_preference : Types::ProcurementPortalPreference

        def initialize(
          @procurement_portal_preference : Types::ProcurementPortalPreference
        )
        end
      end

      # The processing request failed because of an unknown error, exception, or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The processing request failed because of an unknown error, exception, or failure.

        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String? = nil,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The amount charged after taxes, in the preferred currency.

      struct InvoiceCurrencyAmount
        include JSON::Serializable

        # Details about the invoice currency amount.

        @[JSON::Field(key: "AmountBreakdown")]
        getter amount_breakdown : Types::AmountBreakdown?

        # The currency dominion of the invoice document.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The details of currency exchange.

        @[JSON::Field(key: "CurrencyExchangeDetails")]
        getter currency_exchange_details : Types::CurrencyExchangeDetails?

        # The invoice currency amount.

        @[JSON::Field(key: "TotalAmount")]
        getter total_amount : String?

        # Details about the invoice total amount before tax.

        @[JSON::Field(key: "TotalAmountBeforeTax")]
        getter total_amount_before_tax : String?

        def initialize(
          @amount_breakdown : Types::AmountBreakdown? = nil,
          @currency_code : String? = nil,
          @currency_exchange_details : Types::CurrencyExchangeDetails? = nil,
          @total_amount : String? = nil,
          @total_amount_before_tax : String? = nil
        )
        end
      end

      # Invoice document data.

      struct InvoicePDF
        include JSON::Serializable

        # The pre-signed URL to download the invoice document.

        @[JSON::Field(key: "DocumentUrl")]
        getter document_url : String?

        # The pre-signed URL expiration date of the invoice document.

        @[JSON::Field(key: "DocumentUrlExpirationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter document_url_expiration_date : Time?

        # Your unique invoice ID.

        @[JSON::Field(key: "InvoiceId")]
        getter invoice_id : String?

        # List of supplemental documents associated with the invoice.

        @[JSON::Field(key: "SupplementalDocuments")]
        getter supplemental_documents : Array(Types::SupplementalDocument)?

        def initialize(
          @document_url : String? = nil,
          @document_url_expiration_date : Time? = nil,
          @invoice_id : String? = nil,
          @supplemental_documents : Array(Types::SupplementalDocument)? = nil
        )
        end
      end

      # Contains high-level information about the invoice receiver.

      struct InvoiceProfile
        include JSON::Serializable

        # The account ID the invoice profile is generated for.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # This specifies the issuing entity of the invoice.

        @[JSON::Field(key: "Issuer")]
        getter issuer : String?

        # The address of the receiver that will be printed on the invoice.

        @[JSON::Field(key: "ReceiverAddress")]
        getter receiver_address : Types::ReceiverAddress?

        # The email address for the invoice profile receiver.

        @[JSON::Field(key: "ReceiverEmail")]
        getter receiver_email : String?

        # The name of the person receiving the invoice profile.

        @[JSON::Field(key: "ReceiverName")]
        getter receiver_name : String?

        # Your Tax Registration Number (TRN) information.

        @[JSON::Field(key: "TaxRegistrationNumber")]
        getter tax_registration_number : String?

        def initialize(
          @account_id : String? = nil,
          @issuer : String? = nil,
          @receiver_address : Types::ReceiverAddress? = nil,
          @receiver_email : String? = nil,
          @receiver_name : String? = nil,
          @tax_registration_number : String? = nil
        )
        end
      end

      # Filters for your invoice summaries.

      struct InvoiceSummariesFilter
        include JSON::Serializable

        # The billing period associated with the invoice documents.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : Types::BillingPeriod?

        # The name of the entity that issues the Amazon Web Services invoice.

        @[JSON::Field(key: "InvoicingEntity")]
        getter invoicing_entity : String?

        # The date range for invoice summary retrieval.

        @[JSON::Field(key: "TimeInterval")]
        getter time_interval : Types::DateInterval?

        def initialize(
          @billing_period : Types::BillingPeriod? = nil,
          @invoicing_entity : String? = nil,
          @time_interval : Types::DateInterval? = nil
        )
        end
      end

      # Specifies the invoice summary.

      struct InvoiceSummariesSelector
        include JSON::Serializable

        # The query identifier type ( INVOICE_ID or ACCOUNT_ID ).

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The value of the query identifier.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @resource_type : String,
          @value : String
        )
        end
      end

      # The invoice that the API retrieved.

      struct InvoiceSummary
        include JSON::Serializable

        # The Amazon Web Services account ID.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The summary with the product and service currency.

        @[JSON::Field(key: "BaseCurrencyAmount")]
        getter base_currency_amount : Types::InvoiceCurrencyAmount?

        # The billing period of the invoice-related document.

        @[JSON::Field(key: "BillingPeriod")]
        getter billing_period : Types::BillingPeriod?

        # The invoice due date.

        @[JSON::Field(key: "DueDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter due_date : Time?

        # The organization name providing Amazon Web Services services.

        @[JSON::Field(key: "Entity")]
        getter entity : Types::Entity?

        # The invoice ID.

        @[JSON::Field(key: "InvoiceId")]
        getter invoice_id : String?

        # The type of invoice.

        @[JSON::Field(key: "InvoiceType")]
        getter invoice_type : String?

        # The issued date of the invoice.

        @[JSON::Field(key: "IssuedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter issued_date : Time?

        # The initial or original invoice ID.

        @[JSON::Field(key: "OriginalInvoiceId")]
        getter original_invoice_id : String?

        # The summary with the customer configured currency.

        @[JSON::Field(key: "PaymentCurrencyAmount")]
        getter payment_currency_amount : Types::InvoiceCurrencyAmount?

        # The purchase order number associated to the invoice.

        @[JSON::Field(key: "PurchaseOrderNumber")]
        getter purchase_order_number : String?

        # The summary with the tax currency.

        @[JSON::Field(key: "TaxCurrencyAmount")]
        getter tax_currency_amount : Types::InvoiceCurrencyAmount?

        def initialize(
          @account_id : String? = nil,
          @base_currency_amount : Types::InvoiceCurrencyAmount? = nil,
          @billing_period : Types::BillingPeriod? = nil,
          @due_date : Time? = nil,
          @entity : Types::Entity? = nil,
          @invoice_id : String? = nil,
          @invoice_type : String? = nil,
          @issued_date : Time? = nil,
          @original_invoice_id : String? = nil,
          @payment_currency_amount : Types::InvoiceCurrencyAmount? = nil,
          @purchase_order_number : String? = nil,
          @tax_currency_amount : Types::InvoiceCurrencyAmount? = nil
        )
        end
      end

      # An invoice unit is a set of mutually exclusive accounts that correspond to your business entity.
      # Invoice units allow you separate Amazon Web Services account costs and configures your invoice for
      # each business entity going forward.

      struct InvoiceUnit
        include JSON::Serializable

        # The assigned description for an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The account that receives invoices related to the invoice unit.

        @[JSON::Field(key: "InvoiceReceiver")]
        getter invoice_receiver : String?

        # ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String?

        # The last time the invoice unit was updated. This is important to determine the version of invoice
        # unit configuration used to create the invoices. Any invoice created after this modified time will
        # use this invoice unit configuration.

        @[JSON::Field(key: "LastModified", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified : Time?

        # A unique name that is distinctive within your Amazon Web Services.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An InvoiceUnitRule object used the categorize invoice units.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::InvoiceUnitRule?

        # Whether the invoice unit based tax inheritance is/ should be enabled or disabled.

        @[JSON::Field(key: "TaxInheritanceDisabled")]
        getter tax_inheritance_disabled : Bool?

        def initialize(
          @description : String? = nil,
          @invoice_receiver : String? = nil,
          @invoice_unit_arn : String? = nil,
          @last_modified : Time? = nil,
          @name : String? = nil,
          @rule : Types::InvoiceUnitRule? = nil,
          @tax_inheritance_disabled : Bool? = nil
        )
        end
      end

      # This is used to categorize the invoice unit. Values are Amazon Web Services account IDs. Currently,
      # the only supported rule is LINKED_ACCOUNT .

      struct InvoiceUnitRule
        include JSON::Serializable

        # A list of Amazon Web Services account account IDs that have delegated their billing responsibility
        # to the receiver account through transfer billing. Unlike linked accounts, these bill source accounts
        # can be payer accounts from other organizations that have authorized billing transfer to this
        # account.

        @[JSON::Field(key: "BillSourceAccounts")]
        getter bill_source_accounts : Array(String)?

        # The list of LINKED_ACCOUNT IDs where charges are included within the invoice unit.

        @[JSON::Field(key: "LinkedAccounts")]
        getter linked_accounts : Array(String)?

        def initialize(
          @bill_source_accounts : Array(String)? = nil,
          @linked_accounts : Array(String)? = nil
        )
        end
      end


      struct ListInvoiceSummariesRequest
        include JSON::Serializable

        # The option to retrieve details for a specific invoice by providing its unique ID. Alternatively,
        # access information for all invoices linked to the account by providing an account ID.

        @[JSON::Field(key: "Selector")]
        getter selector : Types::InvoiceSummariesSelector

        # Filters you can use to customize your invoice summary.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::InvoiceSummariesFilter?

        # The maximum number of invoice summaries a paginated response can contain.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @selector : Types::InvoiceSummariesSelector,
          @filter : Types::InvoiceSummariesFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInvoiceSummariesResponse
        include JSON::Serializable

        # List of key (summary level) invoice details without line item details.

        @[JSON::Field(key: "InvoiceSummaries")]
        getter invoice_summaries : Array(Types::InvoiceSummary)

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @invoice_summaries : Array(Types::InvoiceSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListInvoiceUnitsRequest
        include JSON::Serializable

        # The state of an invoice unit at a specified time. You can see legacy invoice units that are
        # currently deleted if the AsOf time is set to before it was deleted. If an AsOf is not provided, the
        # default value is the current time.

        @[JSON::Field(key: "AsOf", converter: Aws::Runtime::UnixTimestampConverter)]
        getter as_of : Time?

        # An optional input to the list API. If multiple filters are specified, the returned list will be a
        # configuration that match all of the provided filters. Supported filter types are InvoiceReceivers ,
        # Names , and Accounts .

        @[JSON::Field(key: "Filters")]
        getter filters : Types::Filters?

        # The maximum number of invoice units that can be returned.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next token used to indicate where the returned list should start from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @as_of : Time? = nil,
          @filters : Types::Filters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInvoiceUnitsResponse
        include JSON::Serializable

        # An invoice unit is a set of mutually exclusive accounts that correspond to your business entity.

        @[JSON::Field(key: "InvoiceUnits")]
        getter invoice_units : Array(Types::InvoiceUnit)?

        # The next token used to indicate where the returned list should start from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @invoice_units : Array(Types::InvoiceUnit)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProcurementPortalPreferencesRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProcurementPortalPreferencesResponse
        include JSON::Serializable

        # The token to use to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of procurement portal preferences associated with the Amazon Web Services account.

        @[JSON::Field(key: "ProcurementPortalPreferences")]
        getter procurement_portal_preferences : Array(Types::ProcurementPortalPreferenceSummary)?

        def initialize(
          @next_token : String? = nil,
          @procurement_portal_preferences : Array(Types::ProcurementPortalPreferenceSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of tags to list.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Adds a tag to a resource.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      # Represents the full configuration of a procurement portal preference, including settings for
      # e-invoice delivery and purchase order retrieval.

      struct ProcurementPortalPreference
        include JSON::Serializable

        # The Amazon Web Services account ID associated with this procurement portal preference.

        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String

        # The domain identifier for the buyer in the procurement portal.

        @[JSON::Field(key: "BuyerDomain")]
        getter buyer_domain : String

        # The unique identifier for the buyer in the procurement portal.

        @[JSON::Field(key: "BuyerIdentifier")]
        getter buyer_identifier : String

        # The date and time when the procurement portal preference was created.

        @[JSON::Field(key: "CreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_date : Time

        # Indicates whether e-invoice delivery is enabled for this procurement portal preference.

        @[JSON::Field(key: "EinvoiceDeliveryEnabled")]
        getter einvoice_delivery_enabled : Bool

        # The date and time when the procurement portal preference was last updated.

        @[JSON::Field(key: "LastUpdateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_date : Time

        # The name of the procurement portal.

        @[JSON::Field(key: "ProcurementPortalName")]
        getter procurement_portal_name : String

        # The Amazon Resource Name (ARN) of the procurement portal preference.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        # Indicates whether purchase order retrieval is enabled for this procurement portal preference.

        @[JSON::Field(key: "PurchaseOrderRetrievalEnabled")]
        getter purchase_order_retrieval_enabled : Bool

        # The domain identifier for the supplier in the procurement portal.

        @[JSON::Field(key: "SupplierDomain")]
        getter supplier_domain : String

        # The unique identifier for the supplier in the procurement portal.

        @[JSON::Field(key: "SupplierIdentifier")]
        getter supplier_identifier : String

        # The version number of the procurement portal preference configuration.

        @[JSON::Field(key: "Version")]
        getter version : Int64

        # List of contact information for portal administrators and technical contacts.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Array(Types::Contact)?

        # The configuration settings that specify how e-invoices are delivered to the procurement portal.

        @[JSON::Field(key: "EinvoiceDeliveryPreference")]
        getter einvoice_delivery_preference : Types::EinvoiceDeliveryPreference?

        # The current status of the e-invoice delivery preference.

        @[JSON::Field(key: "EinvoiceDeliveryPreferenceStatus")]
        getter einvoice_delivery_preference_status : String?

        # The reason for the current e-invoice delivery preference status.

        @[JSON::Field(key: "EinvoiceDeliveryPreferenceStatusReason")]
        getter einvoice_delivery_preference_status_reason : String?

        # The endpoint URL where e-invoices are delivered to the procurement portal.

        @[JSON::Field(key: "ProcurementPortalInstanceEndpoint")]
        getter procurement_portal_instance_endpoint : String?

        # The shared secret or authentication credential used for secure communication with the procurement
        # portal.

        @[JSON::Field(key: "ProcurementPortalSharedSecret")]
        getter procurement_portal_shared_secret : String?

        # The endpoint URL used for retrieving purchase orders from the procurement portal.

        @[JSON::Field(key: "PurchaseOrderRetrievalEndpoint")]
        getter purchase_order_retrieval_endpoint : String?

        # The current status of the purchase order retrieval preference.

        @[JSON::Field(key: "PurchaseOrderRetrievalPreferenceStatus")]
        getter purchase_order_retrieval_preference_status : String?

        # The reason for the current purchase order retrieval preference status.

        @[JSON::Field(key: "PurchaseOrderRetrievalPreferenceStatusReason")]
        getter purchase_order_retrieval_preference_status_reason : String?


        @[JSON::Field(key: "Selector")]
        getter selector : Types::ProcurementPortalPreferenceSelector?

        # Configuration on settings for the test environment of the procurement portal.

        @[JSON::Field(key: "TestEnvPreference")]
        getter test_env_preference : Types::TestEnvPreference?

        def initialize(
          @aws_account_id : String,
          @buyer_domain : String,
          @buyer_identifier : String,
          @create_date : Time,
          @einvoice_delivery_enabled : Bool,
          @last_update_date : Time,
          @procurement_portal_name : String,
          @procurement_portal_preference_arn : String,
          @purchase_order_retrieval_enabled : Bool,
          @supplier_domain : String,
          @supplier_identifier : String,
          @version : Int64,
          @contacts : Array(Types::Contact)? = nil,
          @einvoice_delivery_preference : Types::EinvoiceDeliveryPreference? = nil,
          @einvoice_delivery_preference_status : String? = nil,
          @einvoice_delivery_preference_status_reason : String? = nil,
          @procurement_portal_instance_endpoint : String? = nil,
          @procurement_portal_shared_secret : String? = nil,
          @purchase_order_retrieval_endpoint : String? = nil,
          @purchase_order_retrieval_preference_status : String? = nil,
          @purchase_order_retrieval_preference_status_reason : String? = nil,
          @selector : Types::ProcurementPortalPreferenceSelector? = nil,
          @test_env_preference : Types::TestEnvPreference? = nil
        )
        end
      end

      # Specifies criteria for selecting which invoices should be processed using a particular procurement
      # portal preference.

      struct ProcurementPortalPreferenceSelector
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of invoice unit identifiers to which this preference applies.

        @[JSON::Field(key: "InvoiceUnitArns")]
        getter invoice_unit_arns : Array(String)?

        # The list of seller of record IDs to which this preference applies.

        @[JSON::Field(key: "SellerOfRecords")]
        getter seller_of_records : Array(String)?

        def initialize(
          @invoice_unit_arns : Array(String)? = nil,
          @seller_of_records : Array(String)? = nil
        )
        end
      end

      # Provides a summary of a procurement portal preference, including key identifiers and status
      # information.

      struct ProcurementPortalPreferenceSummary
        include JSON::Serializable

        # The Amazon Web Services account ID associated with this procurement portal preference summary.

        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String

        # The domain identifier for the buyer in the procurement portal.

        @[JSON::Field(key: "BuyerDomain")]
        getter buyer_domain : String

        # The unique identifier for the buyer in the procurement portal.

        @[JSON::Field(key: "BuyerIdentifier")]
        getter buyer_identifier : String

        # The date and time when the procurement portal preference was created.

        @[JSON::Field(key: "CreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_date : Time

        # Indicates whether e-invoice delivery is enabled for this procurement portal preference.

        @[JSON::Field(key: "EinvoiceDeliveryEnabled")]
        getter einvoice_delivery_enabled : Bool

        # The date and time when the procurement portal preference was last updated.

        @[JSON::Field(key: "LastUpdateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_date : Time

        # The name of the procurement portal.

        @[JSON::Field(key: "ProcurementPortalName")]
        getter procurement_portal_name : String

        # The Amazon Resource Name (ARN) of the procurement portal preference.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        # Indicates whether purchase order retrieval is enabled for this procurement portal preference.

        @[JSON::Field(key: "PurchaseOrderRetrievalEnabled")]
        getter purchase_order_retrieval_enabled : Bool

        # The domain identifier for the supplier in the procurement portal.

        @[JSON::Field(key: "SupplierDomain")]
        getter supplier_domain : String

        # The unique identifier for the supplier in the procurement portal.

        @[JSON::Field(key: "SupplierIdentifier")]
        getter supplier_identifier : String

        # The version number of the procurement portal preference configuration in this summary.

        @[JSON::Field(key: "Version")]
        getter version : Int64

        # The current status of the e-invoice delivery preference in this summary.

        @[JSON::Field(key: "EinvoiceDeliveryPreferenceStatus")]
        getter einvoice_delivery_preference_status : String?

        # The reason for the current e-invoice delivery preference status in this summary.

        @[JSON::Field(key: "EinvoiceDeliveryPreferenceStatusReason")]
        getter einvoice_delivery_preference_status_reason : String?

        # The current status of the purchase order retrieval preference in this summary.

        @[JSON::Field(key: "PurchaseOrderRetrievalPreferenceStatus")]
        getter purchase_order_retrieval_preference_status : String?

        # The reason for the current purchase order retrieval preference status in this summary.

        @[JSON::Field(key: "PurchaseOrderRetrievalPreferenceStatusReason")]
        getter purchase_order_retrieval_preference_status_reason : String?


        @[JSON::Field(key: "Selector")]
        getter selector : Types::ProcurementPortalPreferenceSelector?

        def initialize(
          @aws_account_id : String,
          @buyer_domain : String,
          @buyer_identifier : String,
          @create_date : Time,
          @einvoice_delivery_enabled : Bool,
          @last_update_date : Time,
          @procurement_portal_name : String,
          @procurement_portal_preference_arn : String,
          @purchase_order_retrieval_enabled : Bool,
          @supplier_domain : String,
          @supplier_identifier : String,
          @version : Int64,
          @einvoice_delivery_preference_status : String? = nil,
          @einvoice_delivery_preference_status_reason : String? = nil,
          @purchase_order_retrieval_preference_status : String? = nil,
          @purchase_order_retrieval_preference_status_reason : String? = nil,
          @selector : Types::ProcurementPortalPreferenceSelector? = nil
        )
        end
      end

      # Specifies the source configuration for retrieving purchase order data.

      struct PurchaseOrderDataSource
        include JSON::Serializable

        # The type of e-invoice document that requires purchase order data.

        @[JSON::Field(key: "EinvoiceDeliveryDocumentType")]
        getter einvoice_delivery_document_type : String?

        # The type of source for purchase order data.

        @[JSON::Field(key: "PurchaseOrderDataSourceType")]
        getter purchase_order_data_source_type : String?

        def initialize(
          @einvoice_delivery_document_type : String? = nil,
          @purchase_order_data_source_type : String? = nil
        )
        end
      end


      struct PutProcurementPortalPreferenceRequest
        include JSON::Serializable

        # Updated list of contact information for portal administrators and technical contacts.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Array(Types::Contact)

        # Updated flag indicating whether e-invoice delivery is enabled for this procurement portal
        # preference.

        @[JSON::Field(key: "EinvoiceDeliveryEnabled")]
        getter einvoice_delivery_enabled : Bool

        # The Amazon Resource Name (ARN) of the procurement portal preference to update.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        # Updated flag indicating whether purchase order retrieval is enabled for this procurement portal
        # preference.

        @[JSON::Field(key: "PurchaseOrderRetrievalEnabled")]
        getter purchase_order_retrieval_enabled : Bool

        # Updated e-invoice delivery configuration including document types, attachment types, and
        # customization settings for the portal.

        @[JSON::Field(key: "EinvoiceDeliveryPreference")]
        getter einvoice_delivery_preference : Types::EinvoiceDeliveryPreference?

        # The updated endpoint URL where e-invoices will be delivered to the procurement portal. Must be a
        # valid HTTPS URL.

        @[JSON::Field(key: "ProcurementPortalInstanceEndpoint")]
        getter procurement_portal_instance_endpoint : String?

        # The updated shared secret or authentication credential for the procurement portal. This value must
        # be encrypted at rest.

        @[JSON::Field(key: "ProcurementPortalSharedSecret")]
        getter procurement_portal_shared_secret : String?


        @[JSON::Field(key: "Selector")]
        getter selector : Types::ProcurementPortalPreferenceSelector?

        # Updated configuration settings for the test environment of the procurement portal.

        @[JSON::Field(key: "TestEnvPreference")]
        getter test_env_preference : Types::TestEnvPreferenceInput?

        def initialize(
          @contacts : Array(Types::Contact),
          @einvoice_delivery_enabled : Bool,
          @procurement_portal_preference_arn : String,
          @purchase_order_retrieval_enabled : Bool,
          @einvoice_delivery_preference : Types::EinvoiceDeliveryPreference? = nil,
          @procurement_portal_instance_endpoint : String? = nil,
          @procurement_portal_shared_secret : String? = nil,
          @selector : Types::ProcurementPortalPreferenceSelector? = nil,
          @test_env_preference : Types::TestEnvPreferenceInput? = nil
        )
        end
      end


      struct PutProcurementPortalPreferenceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated procurement portal preference.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        def initialize(
          @procurement_portal_preference_arn : String
        )
        end
      end

      # The details of the address associated with the receiver.

      struct ReceiverAddress
        include JSON::Serializable

        # The first line of the address.

        @[JSON::Field(key: "AddressLine1")]
        getter address_line1 : String?

        # The second line of the address, if applicable.

        @[JSON::Field(key: "AddressLine2")]
        getter address_line2 : String?

        # The third line of the address, if applicable.

        @[JSON::Field(key: "AddressLine3")]
        getter address_line3 : String?

        # The city that the address is in.

        @[JSON::Field(key: "City")]
        getter city : String?

        # A unique company name.

        @[JSON::Field(key: "CompanyName")]
        getter company_name : String?

        # The country code for the country the address is in.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # The district or country the address is located in.

        @[JSON::Field(key: "DistrictOrCounty")]
        getter district_or_county : String?

        # The postal code associated with the address.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # The state, region, or province the address is located.

        @[JSON::Field(key: "StateOrRegion")]
        getter state_or_region : String?

        def initialize(
          @address_line1 : String? = nil,
          @address_line2 : String? = nil,
          @address_line3 : String? = nil,
          @city : String? = nil,
          @company_name : String? = nil,
          @country_code : String? = nil,
          @district_or_county : String? = nil,
          @postal_code : String? = nil,
          @state_or_region : String? = nil
        )
        end
      end

      # The resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The resource could not be found.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The tag structure that contains a tag key and value.

      struct ResourceTag
        include JSON::Serializable

        # The object key of your of your resource tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The specific value of the resource tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The request was rejected because it attempted to create resources beyond the current Amazon Web
      # Services account limits. The error message describes the limit exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Supplemental document associated with the invoice.

      struct SupplementalDocument
        include JSON::Serializable

        # The pre-signed URL to download invoice supplemental document.

        @[JSON::Field(key: "DocumentUrl")]
        getter document_url : String?

        # The pre-signed URL expiration date of invoice supplemental document.

        @[JSON::Field(key: "DocumentUrlExpirationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter document_url_expiration_date : Time?

        def initialize(
          @document_url : String? = nil,
          @document_url_expiration_date : Time? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Adds a tag to a resource.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)

        def initialize(
          @resource_arn : String,
          @resource_tags : Array(Types::ResourceTag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The details of the taxes.

      struct TaxesBreakdown
        include JSON::Serializable

        # A list of tax information.

        @[JSON::Field(key: "Breakdown")]
        getter breakdown : Array(Types::TaxesBreakdownAmount)?

        # The total amount for your taxes.

        @[JSON::Field(key: "TotalAmount")]
        getter total_amount : String?

        def initialize(
          @breakdown : Array(Types::TaxesBreakdownAmount)? = nil,
          @total_amount : String? = nil
        )
        end
      end

      # The tax amount.

      struct TaxesBreakdownAmount
        include JSON::Serializable

        # The tax amount.

        @[JSON::Field(key: "Amount")]
        getter amount : String?

        # The details of the taxes.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The details of the tax rate.

        @[JSON::Field(key: "Rate")]
        getter rate : String?

        def initialize(
          @amount : String? = nil,
          @description : String? = nil,
          @rate : String? = nil
        )
        end
      end

      # Contains configuration settings for testing the procurement portal integration in a non-production
      # environment.

      struct TestEnvPreference
        include JSON::Serializable

        # The domain identifier for the buyer in the test environment of the procurement portal.

        @[JSON::Field(key: "BuyerDomain")]
        getter buyer_domain : String

        # The unique identifier for the buyer in the test environment of the procurement portal.

        @[JSON::Field(key: "BuyerIdentifier")]
        getter buyer_identifier : String

        # The domain identifier for the supplier in the test environment of the procurement portal.

        @[JSON::Field(key: "SupplierDomain")]
        getter supplier_domain : String

        # The unique identifier for the supplier in the test environment of the procurement portal.

        @[JSON::Field(key: "SupplierIdentifier")]
        getter supplier_identifier : String

        # The endpoint URL where e-invoices are delivered in the test environment.

        @[JSON::Field(key: "ProcurementPortalInstanceEndpoint")]
        getter procurement_portal_instance_endpoint : String?

        # The shared secret or authentication credential used for secure communication with the test
        # environment.

        @[JSON::Field(key: "ProcurementPortalSharedSecret")]
        getter procurement_portal_shared_secret : String?

        # The endpoint URL used for retrieving purchase orders in the test environment.

        @[JSON::Field(key: "PurchaseOrderRetrievalEndpoint")]
        getter purchase_order_retrieval_endpoint : String?

        def initialize(
          @buyer_domain : String,
          @buyer_identifier : String,
          @supplier_domain : String,
          @supplier_identifier : String,
          @procurement_portal_instance_endpoint : String? = nil,
          @procurement_portal_shared_secret : String? = nil,
          @purchase_order_retrieval_endpoint : String? = nil
        )
        end
      end

      # Input parameters for configuring test environment preferences for a procurement portal.

      struct TestEnvPreferenceInput
        include JSON::Serializable

        # The domain identifier to use for the buyer in the test environment.

        @[JSON::Field(key: "BuyerDomain")]
        getter buyer_domain : String

        # The unique identifier to use for the buyer in the test environment.

        @[JSON::Field(key: "BuyerIdentifier")]
        getter buyer_identifier : String

        # The domain identifier to use for the supplier in the test environment.

        @[JSON::Field(key: "SupplierDomain")]
        getter supplier_domain : String

        # The unique identifier to use for the supplier in the test environment.

        @[JSON::Field(key: "SupplierIdentifier")]
        getter supplier_identifier : String

        # The endpoint URL where e-invoices will be delivered in the test environment.

        @[JSON::Field(key: "ProcurementPortalInstanceEndpoint")]
        getter procurement_portal_instance_endpoint : String?

        # The shared secret or authentication credential to use for secure communication in the test
        # environment.

        @[JSON::Field(key: "ProcurementPortalSharedSecret")]
        getter procurement_portal_shared_secret : String?

        def initialize(
          @buyer_domain : String,
          @buyer_identifier : String,
          @supplier_domain : String,
          @supplier_identifier : String,
          @procurement_portal_instance_endpoint : String? = nil,
          @procurement_portal_shared_secret : String? = nil
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


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to untag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Keys for the tags to be removed.

        @[JSON::Field(key: "ResourceTagKeys")]
        getter resource_tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @resource_tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateInvoiceUnitRequest
        include JSON::Serializable

        # The ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String

        # The assigned description for an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The InvoiceUnitRule object used to update invoice units.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::InvoiceUnitRule?

        # Whether the invoice unit based tax inheritance is/ should be enabled or disabled.

        @[JSON::Field(key: "TaxInheritanceDisabled")]
        getter tax_inheritance_disabled : Bool?

        def initialize(
          @invoice_unit_arn : String,
          @description : String? = nil,
          @rule : Types::InvoiceUnitRule? = nil,
          @tax_inheritance_disabled : Bool? = nil
        )
        end
      end


      struct UpdateInvoiceUnitResponse
        include JSON::Serializable

        # The ARN to identify an invoice unit. This information can't be modified or deleted.

        @[JSON::Field(key: "InvoiceUnitArn")]
        getter invoice_unit_arn : String?

        def initialize(
          @invoice_unit_arn : String? = nil
        )
        end
      end


      struct UpdateProcurementPortalPreferenceStatusRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the procurement portal preference to update.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        # The updated status of the e-invoice delivery preference.

        @[JSON::Field(key: "EinvoiceDeliveryPreferenceStatus")]
        getter einvoice_delivery_preference_status : String?

        # The reason for the e-invoice delivery preference status update, providing context for the change.

        @[JSON::Field(key: "EinvoiceDeliveryPreferenceStatusReason")]
        getter einvoice_delivery_preference_status_reason : String?

        # The updated status of the purchase order retrieval preference.

        @[JSON::Field(key: "PurchaseOrderRetrievalPreferenceStatus")]
        getter purchase_order_retrieval_preference_status : String?

        # The reason for the purchase order retrieval preference status update, providing context for the
        # change.

        @[JSON::Field(key: "PurchaseOrderRetrievalPreferenceStatusReason")]
        getter purchase_order_retrieval_preference_status_reason : String?

        def initialize(
          @procurement_portal_preference_arn : String,
          @einvoice_delivery_preference_status : String? = nil,
          @einvoice_delivery_preference_status_reason : String? = nil,
          @purchase_order_retrieval_preference_status : String? = nil,
          @purchase_order_retrieval_preference_status_reason : String? = nil
        )
        end
      end


      struct UpdateProcurementPortalPreferenceStatusResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the procurement portal preference with updated status.

        @[JSON::Field(key: "ProcurementPortalPreferenceArn")]
        getter procurement_portal_preference_arn : String

        def initialize(
          @procurement_portal_preference_arn : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # You don't have sufficient access to perform this action.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # You don't have sufficient access to perform this action.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationExceptionField
        include JSON::Serializable

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.

        @[JSON::Field(key: "message")]
        getter message : String

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.

        @[JSON::Field(key: "name")]
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
