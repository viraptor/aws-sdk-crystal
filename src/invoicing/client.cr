module Aws
  module Invoicing
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # This gets the invoice profile associated with a set of accounts. The accounts must be linked
      # accounts under the requester management account organization.

      def batch_get_invoice_profile(
        account_ids : Array(String)
      ) : Types::BatchGetInvoiceProfileResponse

        input = Types::BatchGetInvoiceProfileRequest.new(account_ids: account_ids)
        batch_get_invoice_profile(input)
      end

      def batch_get_invoice_profile(input : Types::BatchGetInvoiceProfileRequest) : Types::BatchGetInvoiceProfileResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_INVOICE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetInvoiceProfileResponse, "BatchGetInvoiceProfile")
      end

      # This creates a new invoice unit with the provided definition.

      def create_invoice_unit(
        invoice_receiver : String,
        name : String,
        rule : Types::InvoiceUnitRule,
        description : String? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil,
        tax_inheritance_disabled : Bool? = nil
      ) : Types::CreateInvoiceUnitResponse

        input = Types::CreateInvoiceUnitRequest.new(invoice_receiver: invoice_receiver, name: name, rule: rule, description: description, resource_tags: resource_tags, tax_inheritance_disabled: tax_inheritance_disabled)
        create_invoice_unit(input)
      end

      def create_invoice_unit(input : Types::CreateInvoiceUnitRequest) : Types::CreateInvoiceUnitResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INVOICE_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInvoiceUnitResponse, "CreateInvoiceUnit")
      end

      # Creates a procurement portal preference configuration for e-invoice delivery and purchase order
      # retrieval. This preference defines how invoices are delivered to a procurement portal and how
      # purchase orders are retrieved.

      def create_procurement_portal_preference(
        buyer_domain : String,
        buyer_identifier : String,
        contacts : Array(Types::Contact),
        einvoice_delivery_enabled : Bool,
        procurement_portal_name : String,
        purchase_order_retrieval_enabled : Bool,
        supplier_domain : String,
        supplier_identifier : String,
        client_token : String? = nil,
        einvoice_delivery_preference : Types::EinvoiceDeliveryPreference? = nil,
        procurement_portal_instance_endpoint : String? = nil,
        procurement_portal_shared_secret : String? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil,
        selector : Types::ProcurementPortalPreferenceSelector? = nil,
        test_env_preference : Types::TestEnvPreferenceInput? = nil
      ) : Types::CreateProcurementPortalPreferenceResponse

        input = Types::CreateProcurementPortalPreferenceRequest.new(buyer_domain: buyer_domain, buyer_identifier: buyer_identifier, contacts: contacts, einvoice_delivery_enabled: einvoice_delivery_enabled, procurement_portal_name: procurement_portal_name, purchase_order_retrieval_enabled: purchase_order_retrieval_enabled, supplier_domain: supplier_domain, supplier_identifier: supplier_identifier, client_token: client_token, einvoice_delivery_preference: einvoice_delivery_preference, procurement_portal_instance_endpoint: procurement_portal_instance_endpoint, procurement_portal_shared_secret: procurement_portal_shared_secret, resource_tags: resource_tags, selector: selector, test_env_preference: test_env_preference)
        create_procurement_portal_preference(input)
      end

      def create_procurement_portal_preference(input : Types::CreateProcurementPortalPreferenceRequest) : Types::CreateProcurementPortalPreferenceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROCUREMENT_PORTAL_PREFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProcurementPortalPreferenceResponse, "CreateProcurementPortalPreference")
      end

      # This deletes an invoice unit with the provided invoice unit ARN.

      def delete_invoice_unit(
        invoice_unit_arn : String
      ) : Types::DeleteInvoiceUnitResponse

        input = Types::DeleteInvoiceUnitRequest.new(invoice_unit_arn: invoice_unit_arn)
        delete_invoice_unit(input)
      end

      def delete_invoice_unit(input : Types::DeleteInvoiceUnitRequest) : Types::DeleteInvoiceUnitResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INVOICE_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInvoiceUnitResponse, "DeleteInvoiceUnit")
      end

      # Deletes an existing procurement portal preference. This action cannot be undone. Active e-invoice
      # delivery and PO retrieval configurations will be terminated.

      def delete_procurement_portal_preference(
        procurement_portal_preference_arn : String
      ) : Types::DeleteProcurementPortalPreferenceResponse

        input = Types::DeleteProcurementPortalPreferenceRequest.new(procurement_portal_preference_arn: procurement_portal_preference_arn)
        delete_procurement_portal_preference(input)
      end

      def delete_procurement_portal_preference(input : Types::DeleteProcurementPortalPreferenceRequest) : Types::DeleteProcurementPortalPreferenceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROCUREMENT_PORTAL_PREFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProcurementPortalPreferenceResponse, "DeleteProcurementPortalPreference")
      end

      # Returns a URL to download the invoice document and supplemental documents associated with an
      # invoice. The URLs are pre-signed and have expiration time. For special cases like Brazil, where
      # Amazon Web Services generated invoice identifiers and government provided identifiers do not match,
      # use the Amazon Web Services generated invoice identifier when making API requests. To grant IAM
      # permission to use this operation, the caller needs the invoicing:GetInvoicePDF policy action.

      def get_invoice_pdf(
        invoice_id : String
      ) : Types::GetInvoicePDFResponse

        input = Types::GetInvoicePDFRequest.new(invoice_id: invoice_id)
        get_invoice_pdf(input)
      end

      def get_invoice_pdf(input : Types::GetInvoicePDFRequest) : Types::GetInvoicePDFResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INVOICE_PDF, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInvoicePDFResponse, "GetInvoicePDF")
      end

      # This retrieves the invoice unit definition.

      def get_invoice_unit(
        invoice_unit_arn : String,
        as_of : Time? = nil
      ) : Types::GetInvoiceUnitResponse

        input = Types::GetInvoiceUnitRequest.new(invoice_unit_arn: invoice_unit_arn, as_of: as_of)
        get_invoice_unit(input)
      end

      def get_invoice_unit(input : Types::GetInvoiceUnitRequest) : Types::GetInvoiceUnitResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INVOICE_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInvoiceUnitResponse, "GetInvoiceUnit")
      end

      # Retrieves the details of a specific procurement portal preference configuration.

      def get_procurement_portal_preference(
        procurement_portal_preference_arn : String
      ) : Types::GetProcurementPortalPreferenceResponse

        input = Types::GetProcurementPortalPreferenceRequest.new(procurement_portal_preference_arn: procurement_portal_preference_arn)
        get_procurement_portal_preference(input)
      end

      def get_procurement_portal_preference(input : Types::GetProcurementPortalPreferenceRequest) : Types::GetProcurementPortalPreferenceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PROCUREMENT_PORTAL_PREFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProcurementPortalPreferenceResponse, "GetProcurementPortalPreference")
      end

      # Retrieves your invoice details programmatically, without line item details.

      def list_invoice_summaries(
        selector : Types::InvoiceSummariesSelector,
        filter : Types::InvoiceSummariesFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInvoiceSummariesResponse

        input = Types::ListInvoiceSummariesRequest.new(selector: selector, filter: filter, max_results: max_results, next_token: next_token)
        list_invoice_summaries(input)
      end

      def list_invoice_summaries(input : Types::ListInvoiceSummariesRequest) : Types::ListInvoiceSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INVOICE_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInvoiceSummariesResponse, "ListInvoiceSummaries")
      end

      # This fetches a list of all invoice unit definitions for a given account, as of the provided AsOf
      # date.

      def list_invoice_units(
        as_of : Time? = nil,
        filters : Types::Filters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInvoiceUnitsResponse

        input = Types::ListInvoiceUnitsRequest.new(as_of: as_of, filters: filters, max_results: max_results, next_token: next_token)
        list_invoice_units(input)
      end

      def list_invoice_units(input : Types::ListInvoiceUnitsRequest) : Types::ListInvoiceUnitsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INVOICE_UNITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInvoiceUnitsResponse, "ListInvoiceUnits")
      end

      # Retrieves a list of procurement portal preferences associated with the Amazon Web Services account.

      def list_procurement_portal_preferences(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProcurementPortalPreferencesResponse

        input = Types::ListProcurementPortalPreferencesRequest.new(max_results: max_results, next_token: next_token)
        list_procurement_portal_preferences(input)
      end

      def list_procurement_portal_preferences(input : Types::ListProcurementPortalPreferencesRequest) : Types::ListProcurementPortalPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROCUREMENT_PORTAL_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProcurementPortalPreferencesResponse, "ListProcurementPortalPreferences")
      end

      # Lists the tags for a resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Updates an existing procurement portal preference configuration. This operation can modify settings
      # for e-invoice delivery and purchase order retrieval.

      def put_procurement_portal_preference(
        contacts : Array(Types::Contact),
        einvoice_delivery_enabled : Bool,
        procurement_portal_preference_arn : String,
        purchase_order_retrieval_enabled : Bool,
        einvoice_delivery_preference : Types::EinvoiceDeliveryPreference? = nil,
        procurement_portal_instance_endpoint : String? = nil,
        procurement_portal_shared_secret : String? = nil,
        selector : Types::ProcurementPortalPreferenceSelector? = nil,
        test_env_preference : Types::TestEnvPreferenceInput? = nil
      ) : Types::PutProcurementPortalPreferenceResponse

        input = Types::PutProcurementPortalPreferenceRequest.new(contacts: contacts, einvoice_delivery_enabled: einvoice_delivery_enabled, procurement_portal_preference_arn: procurement_portal_preference_arn, purchase_order_retrieval_enabled: purchase_order_retrieval_enabled, einvoice_delivery_preference: einvoice_delivery_preference, procurement_portal_instance_endpoint: procurement_portal_instance_endpoint, procurement_portal_shared_secret: procurement_portal_shared_secret, selector: selector, test_env_preference: test_env_preference)
        put_procurement_portal_preference(input)
      end

      def put_procurement_portal_preference(input : Types::PutProcurementPortalPreferenceRequest) : Types::PutProcurementPortalPreferenceResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PROCUREMENT_PORTAL_PREFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutProcurementPortalPreferenceResponse, "PutProcurementPortalPreference")
      end

      # Adds a tag to a resource.

      def tag_resource(
        resource_arn : String,
        resource_tags : Array(Types::ResourceTag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, resource_tags: resource_tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes a tag from a resource.

      def untag_resource(
        resource_arn : String,
        resource_tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, resource_tag_keys: resource_tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # You can update the invoice unit configuration at any time, and Amazon Web Services will use the
      # latest configuration at the end of the month.

      def update_invoice_unit(
        invoice_unit_arn : String,
        description : String? = nil,
        rule : Types::InvoiceUnitRule? = nil,
        tax_inheritance_disabled : Bool? = nil
      ) : Types::UpdateInvoiceUnitResponse

        input = Types::UpdateInvoiceUnitRequest.new(invoice_unit_arn: invoice_unit_arn, description: description, rule: rule, tax_inheritance_disabled: tax_inheritance_disabled)
        update_invoice_unit(input)
      end

      def update_invoice_unit(input : Types::UpdateInvoiceUnitRequest) : Types::UpdateInvoiceUnitResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INVOICE_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInvoiceUnitResponse, "UpdateInvoiceUnit")
      end

      # Updates the status of a procurement portal preference, including the activation state of e-invoice
      # delivery and purchase order retrieval features.

      def update_procurement_portal_preference_status(
        procurement_portal_preference_arn : String,
        einvoice_delivery_preference_status : String? = nil,
        einvoice_delivery_preference_status_reason : String? = nil,
        purchase_order_retrieval_preference_status : String? = nil,
        purchase_order_retrieval_preference_status_reason : String? = nil
      ) : Types::UpdateProcurementPortalPreferenceStatusResponse

        input = Types::UpdateProcurementPortalPreferenceStatusRequest.new(procurement_portal_preference_arn: procurement_portal_preference_arn, einvoice_delivery_preference_status: einvoice_delivery_preference_status, einvoice_delivery_preference_status_reason: einvoice_delivery_preference_status_reason, purchase_order_retrieval_preference_status: purchase_order_retrieval_preference_status, purchase_order_retrieval_preference_status_reason: purchase_order_retrieval_preference_status_reason)
        update_procurement_portal_preference_status(input)
      end

      def update_procurement_portal_preference_status(input : Types::UpdateProcurementPortalPreferenceStatusRequest) : Types::UpdateProcurementPortalPreferenceStatusResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROCUREMENT_PORTAL_PREFERENCE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProcurementPortalPreferenceStatusResponse, "UpdateProcurementPortalPreferenceStatus")
      end
    end
  end
end
