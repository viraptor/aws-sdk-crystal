module AwsSdk
  module Route53Domains
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

      # Accepts the transfer of a domain from another Amazon Web Services account to the currentAmazon Web
      # Services account. You initiate a transfer between Amazon Web Services accounts using
      # TransferDomainToAnotherAwsAccount . If you use the CLI command at
      # accept-domain-transfer-from-another-aws-account , use JSON format as input instead of text because
      # otherwise CLI will throw an error from domain transfer input that includes single quotes. Use either
      # ListOperations or GetOperationDetail to determine whether the operation succeeded.
      # GetOperationDetail provides additional information, for example, Domain Transfer from Aws Account
      # 111122223333 has been cancelled .
      def accept_domain_transfer_from_another_aws_account(
        domain_name : String,
        password : String
      ) : Types::AcceptDomainTransferFromAnotherAwsAccountResponse
        input = Types::AcceptDomainTransferFromAnotherAwsAccountRequest.new(domain_name: domain_name, password: password)
        accept_domain_transfer_from_another_aws_account(input)
      end
      def accept_domain_transfer_from_another_aws_account(input : Types::AcceptDomainTransferFromAnotherAwsAccountRequest) : Types::AcceptDomainTransferFromAnotherAwsAccountResponse
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_DOMAIN_TRANSFER_FROM_ANOTHER_AWS_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptDomainTransferFromAnotherAwsAccountResponse, "AcceptDomainTransferFromAnotherAwsAccount")
      end

      # Creates a delegation signer (DS) record in the registry zone for this domain name. Note that
      # creating DS record at the registry impacts DNSSEC validation of your DNS records. This action may
      # render your domain name unavailable on the internet if the steps are completed in the wrong order,
      # or with incorrect timing. For more information about DNSSEC signing, see Configuring DNSSEC signing
      # in the Route 53 developer guide .
      def associate_delegation_signer_to_domain(
        domain_name : String,
        signing_attributes : Types::DnssecSigningAttributes
      ) : Types::AssociateDelegationSignerToDomainResponse
        input = Types::AssociateDelegationSignerToDomainRequest.new(domain_name: domain_name, signing_attributes: signing_attributes)
        associate_delegation_signer_to_domain(input)
      end
      def associate_delegation_signer_to_domain(input : Types::AssociateDelegationSignerToDomainRequest) : Types::AssociateDelegationSignerToDomainResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_DELEGATION_SIGNER_TO_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateDelegationSignerToDomainResponse, "AssociateDelegationSignerToDomain")
      end

      # Cancels the transfer of a domain from the current Amazon Web Services account to another Amazon Web
      # Services account. You initiate a transfer betweenAmazon Web Services accounts using
      # TransferDomainToAnotherAwsAccount . You must cancel the transfer before the other Amazon Web
      # Services account accepts the transfer using AcceptDomainTransferFromAnotherAwsAccount . Use either
      # ListOperations or GetOperationDetail to determine whether the operation succeeded.
      # GetOperationDetail provides additional information, for example, Domain Transfer from Aws Account
      # 111122223333 has been cancelled .
      def cancel_domain_transfer_to_another_aws_account(
        domain_name : String
      ) : Types::CancelDomainTransferToAnotherAwsAccountResponse
        input = Types::CancelDomainTransferToAnotherAwsAccountRequest.new(domain_name: domain_name)
        cancel_domain_transfer_to_another_aws_account(input)
      end
      def cancel_domain_transfer_to_another_aws_account(input : Types::CancelDomainTransferToAnotherAwsAccountRequest) : Types::CancelDomainTransferToAnotherAwsAccountResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_DOMAIN_TRANSFER_TO_ANOTHER_AWS_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelDomainTransferToAnotherAwsAccountResponse, "CancelDomainTransferToAnotherAwsAccount")
      end

      # This operation checks the availability of one domain name. Note that if the availability status of a
      # domain is pending, you must submit another request to determine the availability of the domain name.
      def check_domain_availability(
        domain_name : String,
        idn_lang_code : String? = nil
      ) : Types::CheckDomainAvailabilityResponse
        input = Types::CheckDomainAvailabilityRequest.new(domain_name: domain_name, idn_lang_code: idn_lang_code)
        check_domain_availability(input)
      end
      def check_domain_availability(input : Types::CheckDomainAvailabilityRequest) : Types::CheckDomainAvailabilityResponse
        request = Protocol::JsonRpc.build_request(Model::CHECK_DOMAIN_AVAILABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CheckDomainAvailabilityResponse, "CheckDomainAvailability")
      end

      # Checks whether a domain name can be transferred to Amazon Route 53.
      def check_domain_transferability(
        domain_name : String,
        auth_code : String? = nil
      ) : Types::CheckDomainTransferabilityResponse
        input = Types::CheckDomainTransferabilityRequest.new(domain_name: domain_name, auth_code: auth_code)
        check_domain_transferability(input)
      end
      def check_domain_transferability(input : Types::CheckDomainTransferabilityRequest) : Types::CheckDomainTransferabilityResponse
        request = Protocol::JsonRpc.build_request(Model::CHECK_DOMAIN_TRANSFERABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CheckDomainTransferabilityResponse, "CheckDomainTransferability")
      end

      # This operation deletes the specified domain. This action is permanent. For more information, see
      # Deleting a domain name registration . To transfer the domain registration to another registrar, use
      # the transfer process that’s provided by the registrar to which you want to transfer the
      # registration. Otherwise, the following apply: You can’t get a refund for the cost of a deleted
      # domain registration. The registry for the top-level domain might hold the domain name for a brief
      # time before releasing it for other users to register (varies by registry). When the registration has
      # been deleted, we'll send you a confirmation to the registrant contact. The email will come from
      # noreply@domainnameverification.net or noreply@registrar.amazon.com .
      def delete_domain(
        domain_name : String
      ) : Types::DeleteDomainResponse
        input = Types::DeleteDomainRequest.new(domain_name: domain_name)
        delete_domain(input)
      end
      def delete_domain(input : Types::DeleteDomainRequest) : Types::DeleteDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDomainResponse, "DeleteDomain")
      end

      # This operation deletes the specified tags for a domain. All tag operations are eventually
      # consistent; subsequent operations might not immediately represent all issued operations.
      def delete_tags_for_domain(
        domain_name : String,
        tags_to_delete : Array(String)
      ) : Types::DeleteTagsForDomainResponse
        input = Types::DeleteTagsForDomainRequest.new(domain_name: domain_name, tags_to_delete: tags_to_delete)
        delete_tags_for_domain(input)
      end
      def delete_tags_for_domain(input : Types::DeleteTagsForDomainRequest) : Types::DeleteTagsForDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAGS_FOR_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTagsForDomainResponse, "DeleteTagsForDomain")
      end

      # This operation disables automatic renewal of domain registration for the specified domain.
      def disable_domain_auto_renew(
        domain_name : String
      ) : Types::DisableDomainAutoRenewResponse
        input = Types::DisableDomainAutoRenewRequest.new(domain_name: domain_name)
        disable_domain_auto_renew(input)
      end
      def disable_domain_auto_renew(input : Types::DisableDomainAutoRenewRequest) : Types::DisableDomainAutoRenewResponse
        request = Protocol::JsonRpc.build_request(Model::DISABLE_DOMAIN_AUTO_RENEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableDomainAutoRenewResponse, "DisableDomainAutoRenew")
      end

      # This operation removes the transfer lock on the domain (specifically the clientTransferProhibited
      # status) to allow domain transfers. We recommend you refrain from performing this action unless you
      # intend to transfer the domain to a different registrar. Successful submission returns an operation
      # ID that you can use to track the progress and completion of the action. If the request is not
      # completed successfully, the domain registrant will be notified by email.
      def disable_domain_transfer_lock(
        domain_name : String
      ) : Types::DisableDomainTransferLockResponse
        input = Types::DisableDomainTransferLockRequest.new(domain_name: domain_name)
        disable_domain_transfer_lock(input)
      end
      def disable_domain_transfer_lock(input : Types::DisableDomainTransferLockRequest) : Types::DisableDomainTransferLockResponse
        request = Protocol::JsonRpc.build_request(Model::DISABLE_DOMAIN_TRANSFER_LOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableDomainTransferLockResponse, "DisableDomainTransferLock")
      end

      # Deletes a delegation signer (DS) record in the registry zone for this domain name.
      def disassociate_delegation_signer_from_domain(
        domain_name : String,
        id : String
      ) : Types::DisassociateDelegationSignerFromDomainResponse
        input = Types::DisassociateDelegationSignerFromDomainRequest.new(domain_name: domain_name, id: id)
        disassociate_delegation_signer_from_domain(input)
      end
      def disassociate_delegation_signer_from_domain(input : Types::DisassociateDelegationSignerFromDomainRequest) : Types::DisassociateDelegationSignerFromDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_DELEGATION_SIGNER_FROM_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateDelegationSignerFromDomainResponse, "DisassociateDelegationSignerFromDomain")
      end

      # This operation configures Amazon Route 53 to automatically renew the specified domain before the
      # domain registration expires. The cost of renewing your domain registration is billed to your Amazon
      # Web Services account. The period during which you can renew a domain name varies by TLD. For a list
      # of TLDs and their renewal policies, see Domains That You Can Register with Amazon Route 53 in the
      # Amazon Route 53 Developer Guide . Route 53 requires that you renew before the end of the renewal
      # period so we can complete processing before the deadline.
      def enable_domain_auto_renew(
        domain_name : String
      ) : Types::EnableDomainAutoRenewResponse
        input = Types::EnableDomainAutoRenewRequest.new(domain_name: domain_name)
        enable_domain_auto_renew(input)
      end
      def enable_domain_auto_renew(input : Types::EnableDomainAutoRenewRequest) : Types::EnableDomainAutoRenewResponse
        request = Protocol::JsonRpc.build_request(Model::ENABLE_DOMAIN_AUTO_RENEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableDomainAutoRenewResponse, "EnableDomainAutoRenew")
      end

      # This operation sets the transfer lock on the domain (specifically the clientTransferProhibited
      # status) to prevent domain transfers. Successful submission returns an operation ID that you can use
      # to track the progress and completion of the action. If the request is not completed successfully,
      # the domain registrant will be notified by email.
      def enable_domain_transfer_lock(
        domain_name : String
      ) : Types::EnableDomainTransferLockResponse
        input = Types::EnableDomainTransferLockRequest.new(domain_name: domain_name)
        enable_domain_transfer_lock(input)
      end
      def enable_domain_transfer_lock(input : Types::EnableDomainTransferLockRequest) : Types::EnableDomainTransferLockResponse
        request = Protocol::JsonRpc.build_request(Model::ENABLE_DOMAIN_TRANSFER_LOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableDomainTransferLockResponse, "EnableDomainTransferLock")
      end

      # For operations that require confirmation that the email address for the registrant contact is valid,
      # such as registering a new domain, this operation returns information about whether the registrant
      # contact has responded. If you want us to resend the email, use the ResendContactReachabilityEmail
      # operation.
      def get_contact_reachability_status(
        domain_name : String? = nil
      ) : Types::GetContactReachabilityStatusResponse
        input = Types::GetContactReachabilityStatusRequest.new(domain_name: domain_name)
        get_contact_reachability_status(input)
      end
      def get_contact_reachability_status(input : Types::GetContactReachabilityStatusRequest) : Types::GetContactReachabilityStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONTACT_REACHABILITY_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContactReachabilityStatusResponse, "GetContactReachabilityStatus")
      end

      # This operation returns detailed information about a specified domain that is associated with the
      # current Amazon Web Services account. Contact information for the domain is also returned as part of
      # the output.
      def get_domain_detail(
        domain_name : String
      ) : Types::GetDomainDetailResponse
        input = Types::GetDomainDetailRequest.new(domain_name: domain_name)
        get_domain_detail(input)
      end
      def get_domain_detail(input : Types::GetDomainDetailRequest) : Types::GetDomainDetailResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DOMAIN_DETAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDomainDetailResponse, "GetDomainDetail")
      end

      # The GetDomainSuggestions operation returns a list of suggested domain names.
      def get_domain_suggestions(
        domain_name : String,
        only_available : Bool,
        suggestion_count : Int32
      ) : Types::GetDomainSuggestionsResponse
        input = Types::GetDomainSuggestionsRequest.new(domain_name: domain_name, only_available: only_available, suggestion_count: suggestion_count)
        get_domain_suggestions(input)
      end
      def get_domain_suggestions(input : Types::GetDomainSuggestionsRequest) : Types::GetDomainSuggestionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DOMAIN_SUGGESTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDomainSuggestionsResponse, "GetDomainSuggestions")
      end

      # This operation returns the current status of an operation that is not completed.
      def get_operation_detail(
        operation_id : String
      ) : Types::GetOperationDetailResponse
        input = Types::GetOperationDetailRequest.new(operation_id: operation_id)
        get_operation_detail(input)
      end
      def get_operation_detail(input : Types::GetOperationDetailRequest) : Types::GetOperationDetailResponse
        request = Protocol::JsonRpc.build_request(Model::GET_OPERATION_DETAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOperationDetailResponse, "GetOperationDetail")
      end

      # This operation returns all the domain names registered with Amazon Route 53 for the current Amazon
      # Web Services account if no filtering conditions are used.
      def list_domains(
        filter_conditions : Array(Types::FilterCondition)? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        sort_condition : Types::SortCondition? = nil
      ) : Types::ListDomainsResponse
        input = Types::ListDomainsRequest.new(filter_conditions: filter_conditions, marker: marker, max_items: max_items, sort_condition: sort_condition)
        list_domains(input)
      end
      def list_domains(input : Types::ListDomainsRequest) : Types::ListDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDomainsResponse, "ListDomains")
      end

      # Returns information about all of the operations that return an operation ID and that have ever been
      # performed on domains that were registered by the current account. This command runs only in the
      # us-east-1 Region.
      def list_operations(
        marker : String? = nil,
        max_items : Int32? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status : Array(String)? = nil,
        submitted_since : Time? = nil,
        type : Array(String)? = nil
      ) : Types::ListOperationsResponse
        input = Types::ListOperationsRequest.new(marker: marker, max_items: max_items, sort_by: sort_by, sort_order: sort_order, status: status, submitted_since: submitted_since, type: type)
        list_operations(input)
      end
      def list_operations(input : Types::ListOperationsRequest) : Types::ListOperationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOperationsResponse, "ListOperations")
      end

      # Lists the following prices for either all the TLDs supported by Route 53, or the specified TLD:
      # Registration Transfer Owner change Domain renewal Domain restoration
      def list_prices(
        marker : String? = nil,
        max_items : Int32? = nil,
        tld : String? = nil
      ) : Types::ListPricesResponse
        input = Types::ListPricesRequest.new(marker: marker, max_items: max_items, tld: tld)
        list_prices(input)
      end
      def list_prices(input : Types::ListPricesRequest) : Types::ListPricesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PRICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPricesResponse, "ListPrices")
      end

      # This operation returns all of the tags that are associated with the specified domain. All tag
      # operations are eventually consistent; subsequent operations might not immediately represent all
      # issued operations.
      def list_tags_for_domain(
        domain_name : String
      ) : Types::ListTagsForDomainResponse
        input = Types::ListTagsForDomainRequest.new(domain_name: domain_name)
        list_tags_for_domain(input)
      end
      def list_tags_for_domain(input : Types::ListTagsForDomainRequest) : Types::ListTagsForDomainResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForDomainResponse, "ListTagsForDomain")
      end

      # Moves a domain from Amazon Web Services to another registrar. Supported actions: Changes the IPS
      # tags of a .uk domain, and pushes it to transit. Transit means that the domain is ready to be
      # transferred to another registrar.
      def push_domain(
        domain_name : String,
        target : String
      ) : Nil
        input = Types::PushDomainRequest.new(domain_name: domain_name, target: target)
        push_domain(input)
      end
      def push_domain(input : Types::PushDomainRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUSH_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This operation registers a domain. For some top-level domains (TLDs), this operation requires extra
      # parameters. When you register a domain, Amazon Route 53 does the following: Creates a Route 53
      # hosted zone that has the same name as the domain. Route 53 assigns four name servers to your hosted
      # zone and automatically updates your domain registration with the names of these name servers.
      # Enables auto renew, so your domain registration will renew automatically each year. We'll notify you
      # in advance of the renewal date so you can choose whether to renew the registration. Optionally
      # enables privacy protection, so WHOIS queries return contact for the registrar or the phrase
      # "REDACTED FOR PRIVACY", or "On behalf of &lt;domain name&gt; owner." If you don't enable privacy
      # protection, WHOIS queries return the information that you entered for the administrative,
      # registrant, and technical contacts. While some domains may allow different privacy settings per
      # contact, we recommend specifying the same privacy setting for all contacts. If registration is
      # successful, returns an operation ID that you can use to track the progress and completion of the
      # action. If the request is not completed successfully, the domain registrant is notified by email.
      # Charges your Amazon Web Services account an amount based on the top-level domain. For more
      # information, see Amazon Route 53 Pricing .
      def register_domain(
        admin_contact : Types::ContactDetail,
        domain_name : String,
        duration_in_years : Int32,
        registrant_contact : Types::ContactDetail,
        tech_contact : Types::ContactDetail,
        auto_renew : Bool? = nil,
        billing_contact : Types::ContactDetail? = nil,
        idn_lang_code : String? = nil,
        privacy_protect_admin_contact : Bool? = nil,
        privacy_protect_billing_contact : Bool? = nil,
        privacy_protect_registrant_contact : Bool? = nil,
        privacy_protect_tech_contact : Bool? = nil
      ) : Types::RegisterDomainResponse
        input = Types::RegisterDomainRequest.new(admin_contact: admin_contact, domain_name: domain_name, duration_in_years: duration_in_years, registrant_contact: registrant_contact, tech_contact: tech_contact, auto_renew: auto_renew, billing_contact: billing_contact, idn_lang_code: idn_lang_code, privacy_protect_admin_contact: privacy_protect_admin_contact, privacy_protect_billing_contact: privacy_protect_billing_contact, privacy_protect_registrant_contact: privacy_protect_registrant_contact, privacy_protect_tech_contact: privacy_protect_tech_contact)
        register_domain(input)
      end
      def register_domain(input : Types::RegisterDomainRequest) : Types::RegisterDomainResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterDomainResponse, "RegisterDomain")
      end

      # Rejects the transfer of a domain from another Amazon Web Services account to the current Amazon Web
      # Services account. You initiate a transfer betweenAmazon Web Services accounts using
      # TransferDomainToAnotherAwsAccount . Use either ListOperations or GetOperationDetail to determine
      # whether the operation succeeded. GetOperationDetail provides additional information, for example,
      # Domain Transfer from Aws Account 111122223333 has been cancelled .
      def reject_domain_transfer_from_another_aws_account(
        domain_name : String
      ) : Types::RejectDomainTransferFromAnotherAwsAccountResponse
        input = Types::RejectDomainTransferFromAnotherAwsAccountRequest.new(domain_name: domain_name)
        reject_domain_transfer_from_another_aws_account(input)
      end
      def reject_domain_transfer_from_another_aws_account(input : Types::RejectDomainTransferFromAnotherAwsAccountRequest) : Types::RejectDomainTransferFromAnotherAwsAccountResponse
        request = Protocol::JsonRpc.build_request(Model::REJECT_DOMAIN_TRANSFER_FROM_ANOTHER_AWS_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectDomainTransferFromAnotherAwsAccountResponse, "RejectDomainTransferFromAnotherAwsAccount")
      end

      # This operation renews a domain for the specified number of years. The cost of renewing your domain
      # is billed to your Amazon Web Services account. We recommend that you renew your domain several weeks
      # before the expiration date. Some TLD registries delete domains before the expiration date if you
      # haven't renewed far enough in advance. For more information about renewing domain registration, see
      # Renewing Registration for a Domain in the Amazon Route 53 Developer Guide .
      def renew_domain(
        current_expiry_year : Int32,
        domain_name : String,
        duration_in_years : Int32? = nil
      ) : Types::RenewDomainResponse
        input = Types::RenewDomainRequest.new(current_expiry_year: current_expiry_year, domain_name: domain_name, duration_in_years: duration_in_years)
        renew_domain(input)
      end
      def renew_domain(input : Types::RenewDomainRequest) : Types::RenewDomainResponse
        request = Protocol::JsonRpc.build_request(Model::RENEW_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RenewDomainResponse, "RenewDomain")
      end

      # For operations that require confirmation that the email address for the registrant contact is valid,
      # such as registering a new domain, this operation resends the confirmation email to the current email
      # address for the registrant contact.
      def resend_contact_reachability_email(
        domain_name : String? = nil
      ) : Types::ResendContactReachabilityEmailResponse
        input = Types::ResendContactReachabilityEmailRequest.new(domain_name: domain_name)
        resend_contact_reachability_email(input)
      end
      def resend_contact_reachability_email(input : Types::ResendContactReachabilityEmailRequest) : Types::ResendContactReachabilityEmailResponse
        request = Protocol::JsonRpc.build_request(Model::RESEND_CONTACT_REACHABILITY_EMAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResendContactReachabilityEmailResponse, "ResendContactReachabilityEmail")
      end

      # Resend the form of authorization email for this operation.
      def resend_operation_authorization(
        operation_id : String
      ) : Nil
        input = Types::ResendOperationAuthorizationRequest.new(operation_id: operation_id)
        resend_operation_authorization(input)
      end
      def resend_operation_authorization(input : Types::ResendOperationAuthorizationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESEND_OPERATION_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This operation returns the authorization code for the domain. To transfer a domain to another
      # registrar, you provide this value to the new registrar.
      def retrieve_domain_auth_code(
        domain_name : String
      ) : Types::RetrieveDomainAuthCodeResponse
        input = Types::RetrieveDomainAuthCodeRequest.new(domain_name: domain_name)
        retrieve_domain_auth_code(input)
      end
      def retrieve_domain_auth_code(input : Types::RetrieveDomainAuthCodeRequest) : Types::RetrieveDomainAuthCodeResponse
        request = Protocol::JsonRpc.build_request(Model::RETRIEVE_DOMAIN_AUTH_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetrieveDomainAuthCodeResponse, "RetrieveDomainAuthCode")
      end

      # Transfers a domain from another registrar to Amazon Route 53. For more information about
      # transferring domains, see the following topics: For transfer requirements, a detailed procedure, and
      # information about viewing the status of a domain that you're transferring to Route 53, see
      # Transferring Registration for a Domain to Amazon Route 53 in the Amazon Route 53 Developer Guide .
      # For information about how to transfer a domain from one Amazon Web Services account to another, see
      # TransferDomainToAnotherAwsAccount . For information about how to transfer a domain to another domain
      # registrar, see Transferring a Domain from Amazon Route 53 to Another Registrar in the Amazon Route
      # 53 Developer Guide . During the transfer of any country code top-level domains (ccTLDs) to Route 53,
      # except for .cc and .tv, updates to the owner contact are ignored and the owner contact data from the
      # registry is used. You can update the owner contact after the transfer is complete. For more
      # information, see UpdateDomainContact . If the registrar for your domain is also the DNS service
      # provider for the domain, we highly recommend that you transfer your DNS service to Route 53 or to
      # another DNS service provider before you transfer your registration. Some registrars provide free DNS
      # service when you purchase a domain registration. When you transfer the registration, the previous
      # registrar will not renew your domain registration and could end your DNS service at any time. If the
      # registrar for your domain is also the DNS service provider for the domain and you don't transfer DNS
      # service to another provider, your website, email, and the web applications associated with the
      # domain might become unavailable. If the transfer is successful, this method returns an operation ID
      # that you can use to track the progress and completion of the action. If the transfer doesn't
      # complete successfully, the domain registrant will be notified by email.
      def transfer_domain(
        admin_contact : Types::ContactDetail,
        domain_name : String,
        duration_in_years : Int32,
        registrant_contact : Types::ContactDetail,
        tech_contact : Types::ContactDetail,
        auth_code : String? = nil,
        auto_renew : Bool? = nil,
        billing_contact : Types::ContactDetail? = nil,
        idn_lang_code : String? = nil,
        nameservers : Array(Types::Nameserver)? = nil,
        privacy_protect_admin_contact : Bool? = nil,
        privacy_protect_billing_contact : Bool? = nil,
        privacy_protect_registrant_contact : Bool? = nil,
        privacy_protect_tech_contact : Bool? = nil
      ) : Types::TransferDomainResponse
        input = Types::TransferDomainRequest.new(admin_contact: admin_contact, domain_name: domain_name, duration_in_years: duration_in_years, registrant_contact: registrant_contact, tech_contact: tech_contact, auth_code: auth_code, auto_renew: auto_renew, billing_contact: billing_contact, idn_lang_code: idn_lang_code, nameservers: nameservers, privacy_protect_admin_contact: privacy_protect_admin_contact, privacy_protect_billing_contact: privacy_protect_billing_contact, privacy_protect_registrant_contact: privacy_protect_registrant_contact, privacy_protect_tech_contact: privacy_protect_tech_contact)
        transfer_domain(input)
      end
      def transfer_domain(input : Types::TransferDomainRequest) : Types::TransferDomainResponse
        request = Protocol::JsonRpc.build_request(Model::TRANSFER_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TransferDomainResponse, "TransferDomain")
      end

      # Transfers a domain from the current Amazon Web Services account to another Amazon Web Services
      # account. Note the following: The Amazon Web Services account that you're transferring the domain to
      # must accept the transfer. If the other account doesn't accept the transfer within 3 days, we cancel
      # the transfer. See AcceptDomainTransferFromAnotherAwsAccount . You can cancel the transfer before the
      # other account accepts it. See CancelDomainTransferToAnotherAwsAccount . The other account can reject
      # the transfer. See RejectDomainTransferFromAnotherAwsAccount . When you transfer a domain from one
      # Amazon Web Services account to another, Route 53 doesn't transfer the hosted zone that is associated
      # with the domain. DNS resolution isn't affected if the domain and the hosted zone are owned by
      # separate accounts, so transferring the hosted zone is optional. For information about transferring
      # the hosted zone to another Amazon Web Services account, see Migrating a Hosted Zone to a Different
      # Amazon Web Services Account in the Amazon Route 53 Developer Guide . Use either ListOperations or
      # GetOperationDetail to determine whether the operation succeeded. GetOperationDetail provides
      # additional information, for example, Domain Transfer from Aws Account 111122223333 has been
      # cancelled .
      def transfer_domain_to_another_aws_account(
        account_id : String,
        domain_name : String
      ) : Types::TransferDomainToAnotherAwsAccountResponse
        input = Types::TransferDomainToAnotherAwsAccountRequest.new(account_id: account_id, domain_name: domain_name)
        transfer_domain_to_another_aws_account(input)
      end
      def transfer_domain_to_another_aws_account(input : Types::TransferDomainToAnotherAwsAccountRequest) : Types::TransferDomainToAnotherAwsAccountResponse
        request = Protocol::JsonRpc.build_request(Model::TRANSFER_DOMAIN_TO_ANOTHER_AWS_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TransferDomainToAnotherAwsAccountResponse, "TransferDomainToAnotherAwsAccount")
      end

      # This operation updates the contact information for a particular domain. You must specify information
      # for at least one contact: registrant, administrator, or technical. If the update is successful, this
      # method returns an operation ID that you can use to track the progress and completion of the
      # operation. If the request is not completed successfully, the domain registrant will be notified by
      # email.
      def update_domain_contact(
        domain_name : String,
        admin_contact : Types::ContactDetail? = nil,
        billing_contact : Types::ContactDetail? = nil,
        consent : Types::Consent? = nil,
        registrant_contact : Types::ContactDetail? = nil,
        tech_contact : Types::ContactDetail? = nil
      ) : Types::UpdateDomainContactResponse
        input = Types::UpdateDomainContactRequest.new(domain_name: domain_name, admin_contact: admin_contact, billing_contact: billing_contact, consent: consent, registrant_contact: registrant_contact, tech_contact: tech_contact)
        update_domain_contact(input)
      end
      def update_domain_contact(input : Types::UpdateDomainContactRequest) : Types::UpdateDomainContactResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOMAIN_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDomainContactResponse, "UpdateDomainContact")
      end

      # This operation updates the specified domain contact's privacy setting. When privacy protection is
      # enabled, your contact information is replaced with contact information for the registrar or with the
      # phrase "REDACTED FOR PRIVACY", or "On behalf of &lt;domain name&gt; owner." While some domains may
      # allow different privacy settings per contact, we recommend specifying the same privacy setting for
      # all contacts. This operation affects only the contact information for the specified contact type
      # (administrative, registrant, or technical). If the request succeeds, Amazon Route 53 returns an
      # operation ID that you can use with GetOperationDetail to track the progress and completion of the
      # action. If the request doesn't complete successfully, the domain registrant will be notified by
      # email. By disabling the privacy service via API, you consent to the publication of the contact
      # information provided for this domain via the public WHOIS database. You certify that you are the
      # registrant of this domain name and have the authority to make this decision. You may withdraw your
      # consent at any time by enabling privacy protection using either UpdateDomainContactPrivacy or the
      # Route 53 console. Enabling privacy protection removes the contact information provided for this
      # domain from the WHOIS database. For more information on our privacy practices, see
      # https://aws.amazon.com/privacy/ .
      def update_domain_contact_privacy(
        domain_name : String,
        admin_privacy : Bool? = nil,
        billing_privacy : Bool? = nil,
        registrant_privacy : Bool? = nil,
        tech_privacy : Bool? = nil
      ) : Types::UpdateDomainContactPrivacyResponse
        input = Types::UpdateDomainContactPrivacyRequest.new(domain_name: domain_name, admin_privacy: admin_privacy, billing_privacy: billing_privacy, registrant_privacy: registrant_privacy, tech_privacy: tech_privacy)
        update_domain_contact_privacy(input)
      end
      def update_domain_contact_privacy(input : Types::UpdateDomainContactPrivacyRequest) : Types::UpdateDomainContactPrivacyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOMAIN_CONTACT_PRIVACY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDomainContactPrivacyResponse, "UpdateDomainContactPrivacy")
      end

      # This operation replaces the current set of name servers for the domain with the specified set of
      # name servers. If you use Amazon Route 53 as your DNS service, specify the four name servers in the
      # delegation set for the hosted zone for the domain. If successful, this operation returns an
      # operation ID that you can use to track the progress and completion of the action. If the request is
      # not completed successfully, the domain registrant will be notified by email.
      def update_domain_nameservers(
        domain_name : String,
        nameservers : Array(Types::Nameserver),
        fi_auth_key : String? = nil
      ) : Types::UpdateDomainNameserversResponse
        input = Types::UpdateDomainNameserversRequest.new(domain_name: domain_name, nameservers: nameservers, fi_auth_key: fi_auth_key)
        update_domain_nameservers(input)
      end
      def update_domain_nameservers(input : Types::UpdateDomainNameserversRequest) : Types::UpdateDomainNameserversResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOMAIN_NAMESERVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDomainNameserversResponse, "UpdateDomainNameservers")
      end

      # This operation adds or updates tags for a specified domain. All tag operations are eventually
      # consistent; subsequent operations might not immediately represent all issued operations.
      def update_tags_for_domain(
        domain_name : String,
        tags_to_update : Array(Types::Tag)? = nil
      ) : Types::UpdateTagsForDomainResponse
        input = Types::UpdateTagsForDomainRequest.new(domain_name: domain_name, tags_to_update: tags_to_update)
        update_tags_for_domain(input)
      end
      def update_tags_for_domain(input : Types::UpdateTagsForDomainRequest) : Types::UpdateTagsForDomainResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TAGS_FOR_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTagsForDomainResponse, "UpdateTagsForDomain")
      end

      # Returns all the domain-related billing records for the current Amazon Web Services account for a
      # specified period
      def view_billing(
        end : Time? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        start : Time? = nil
      ) : Types::ViewBillingResponse
        input = Types::ViewBillingRequest.new(end: end, marker: marker, max_items: max_items, start: start)
        view_billing(input)
      end
      def view_billing(input : Types::ViewBillingRequest) : Types::ViewBillingResponse
        request = Protocol::JsonRpc.build_request(Model::VIEW_BILLING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ViewBillingResponse, "ViewBilling")
      end
    end
  end
end
