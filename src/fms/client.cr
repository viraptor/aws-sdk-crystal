module Aws
  module FMS
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

      # Sets a Firewall Manager default administrator account. The Firewall Manager default administrator
      # account can manage third-party firewalls and has full administrative scope that allows
      # administration of all policy types, accounts, organizational units, and Regions. This account must
      # be a member account of the organization in Organizations whose resources you want to protect. For
      # information about working with Firewall Manager administrator accounts, see Managing Firewall
      # Manager administrators in the Firewall Manager Developer Guide .

      def associate_admin_account(
        admin_account : String
      ) : Nil

        input = Types::AssociateAdminAccountRequest.new(admin_account: admin_account)
        associate_admin_account(input)
      end

      def associate_admin_account(input : Types::AssociateAdminAccountRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_ADMIN_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the Firewall Manager policy administrator as a tenant administrator of a third-party firewall
      # service. A tenant is an instance of the third-party firewall service that's associated with your
      # Amazon Web Services customer account.

      def associate_third_party_firewall(
        third_party_firewall : String
      ) : Types::AssociateThirdPartyFirewallResponse

        input = Types::AssociateThirdPartyFirewallRequest.new(third_party_firewall: third_party_firewall)
        associate_third_party_firewall(input)
      end

      def associate_third_party_firewall(input : Types::AssociateThirdPartyFirewallRequest) : Types::AssociateThirdPartyFirewallResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_THIRD_PARTY_FIREWALL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateThirdPartyFirewallResponse, "AssociateThirdPartyFirewall")
      end

      # Associate resources to a Firewall Manager resource set.

      def batch_associate_resource(
        items : Array(String),
        resource_set_identifier : String
      ) : Types::BatchAssociateResourceResponse

        input = Types::BatchAssociateResourceRequest.new(items: items, resource_set_identifier: resource_set_identifier)
        batch_associate_resource(input)
      end

      def batch_associate_resource(input : Types::BatchAssociateResourceRequest) : Types::BatchAssociateResourceResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_ASSOCIATE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchAssociateResourceResponse, "BatchAssociateResource")
      end

      # Disassociates resources from a Firewall Manager resource set.

      def batch_disassociate_resource(
        items : Array(String),
        resource_set_identifier : String
      ) : Types::BatchDisassociateResourceResponse

        input = Types::BatchDisassociateResourceRequest.new(items: items, resource_set_identifier: resource_set_identifier)
        batch_disassociate_resource(input)
      end

      def batch_disassociate_resource(input : Types::BatchDisassociateResourceRequest) : Types::BatchDisassociateResourceResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DISASSOCIATE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDisassociateResourceResponse, "BatchDisassociateResource")
      end

      # Permanently deletes an Firewall Manager applications list.

      def delete_apps_list(
        list_id : String
      ) : Nil

        input = Types::DeleteAppsListRequest.new(list_id: list_id)
        delete_apps_list(input)
      end

      def delete_apps_list(input : Types::DeleteAppsListRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Firewall Manager association with the IAM role and the Amazon Simple Notification Service
      # (SNS) topic that is used to record Firewall Manager SNS logs.

      def delete_notification_channel : Nil
        input = Types::DeleteNotificationChannelRequest.new
        delete_notification_channel(input)
      end

      def delete_notification_channel(input : Types::DeleteNotificationChannelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_NOTIFICATION_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Permanently deletes an Firewall Manager policy.

      def delete_policy(
        policy_id : String,
        delete_all_policy_resources : Bool? = nil
      ) : Nil

        input = Types::DeletePolicyRequest.new(policy_id: policy_id, delete_all_policy_resources: delete_all_policy_resources)
        delete_policy(input)
      end

      def delete_policy(input : Types::DeletePolicyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Permanently deletes an Firewall Manager protocols list.

      def delete_protocols_list(
        list_id : String
      ) : Nil

        input = Types::DeleteProtocolsListRequest.new(list_id: list_id)
        delete_protocols_list(input)
      end

      def delete_protocols_list(input : Types::DeleteProtocolsListRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROTOCOLS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified ResourceSet .

      def delete_resource_set(
        identifier : String
      ) : Nil

        input = Types::DeleteResourceSetRequest.new(identifier: identifier)
        delete_resource_set(input)
      end

      def delete_resource_set(input : Types::DeleteResourceSetRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Disassociates an Firewall Manager administrator account. To set a different account as an Firewall
      # Manager administrator, submit a PutAdminAccount request. To set an account as a default
      # administrator account, you must submit an AssociateAdminAccount request. Disassociation of the
      # default administrator account follows the first in, last out principle. If you are the default
      # administrator, all Firewall Manager administrators within the organization must first disassociate
      # their accounts before you can disassociate your account.

      def disassociate_admin_account : Nil
        input = Types::DisassociateAdminAccountRequest.new
        disassociate_admin_account(input)
      end

      def disassociate_admin_account(input : Types::DisassociateAdminAccountRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_ADMIN_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Disassociates a Firewall Manager policy administrator from a third-party firewall tenant. When you
      # call DisassociateThirdPartyFirewall , the third-party firewall vendor deletes all of the firewalls
      # that are associated with the account.

      def disassociate_third_party_firewall(
        third_party_firewall : String
      ) : Types::DisassociateThirdPartyFirewallResponse

        input = Types::DisassociateThirdPartyFirewallRequest.new(third_party_firewall: third_party_firewall)
        disassociate_third_party_firewall(input)
      end

      def disassociate_third_party_firewall(input : Types::DisassociateThirdPartyFirewallRequest) : Types::DisassociateThirdPartyFirewallResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_THIRD_PARTY_FIREWALL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateThirdPartyFirewallResponse, "DisassociateThirdPartyFirewall")
      end

      # Returns the Organizations account that is associated with Firewall Manager as the Firewall Manager
      # default administrator.

      def get_admin_account : Types::GetAdminAccountResponse
        input = Types::GetAdminAccountRequest.new
        get_admin_account(input)
      end

      def get_admin_account(input : Types::GetAdminAccountRequest) : Types::GetAdminAccountResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADMIN_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAdminAccountResponse, "GetAdminAccount")
      end

      # Returns information about the specified account's administrative scope. The administrative scope
      # defines the resources that an Firewall Manager administrator can manage.

      def get_admin_scope(
        admin_account : String
      ) : Types::GetAdminScopeResponse

        input = Types::GetAdminScopeRequest.new(admin_account: admin_account)
        get_admin_scope(input)
      end

      def get_admin_scope(input : Types::GetAdminScopeRequest) : Types::GetAdminScopeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADMIN_SCOPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAdminScopeResponse, "GetAdminScope")
      end

      # Returns information about the specified Firewall Manager applications list.

      def get_apps_list(
        list_id : String,
        default_list : Bool? = nil
      ) : Types::GetAppsListResponse

        input = Types::GetAppsListRequest.new(list_id: list_id, default_list: default_list)
        get_apps_list(input)
      end

      def get_apps_list(input : Types::GetAppsListRequest) : Types::GetAppsListResponse
        request = Protocol::JsonRpc.build_request(Model::GET_APPS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAppsListResponse, "GetAppsList")
      end

      # Returns detailed compliance information about the specified member account. Details include
      # resources that are in and out of compliance with the specified policy. The reasons for resources
      # being considered compliant depend on the Firewall Manager policy type.

      def get_compliance_detail(
        member_account : String,
        policy_id : String
      ) : Types::GetComplianceDetailResponse

        input = Types::GetComplianceDetailRequest.new(member_account: member_account, policy_id: policy_id)
        get_compliance_detail(input)
      end

      def get_compliance_detail(input : Types::GetComplianceDetailRequest) : Types::GetComplianceDetailResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COMPLIANCE_DETAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComplianceDetailResponse, "GetComplianceDetail")
      end

      # Information about the Amazon Simple Notification Service (SNS) topic that is used to record Firewall
      # Manager SNS logs.

      def get_notification_channel : Types::GetNotificationChannelResponse
        input = Types::GetNotificationChannelRequest.new
        get_notification_channel(input)
      end

      def get_notification_channel(input : Types::GetNotificationChannelRequest) : Types::GetNotificationChannelResponse
        request = Protocol::JsonRpc.build_request(Model::GET_NOTIFICATION_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetNotificationChannelResponse, "GetNotificationChannel")
      end

      # Returns information about the specified Firewall Manager policy.

      def get_policy(
        policy_id : String
      ) : Types::GetPolicyResponse

        input = Types::GetPolicyRequest.new(policy_id: policy_id)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Types::GetPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPolicyResponse, "GetPolicy")
      end

      # If you created a Shield Advanced policy, returns policy-level attack summary information in the
      # event of a potential DDoS attack. Other policy types are currently unsupported.

      def get_protection_status(
        policy_id : String,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        member_account_id : String? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::GetProtectionStatusResponse

        input = Types::GetProtectionStatusRequest.new(policy_id: policy_id, end_time: end_time, max_results: max_results, member_account_id: member_account_id, next_token: next_token, start_time: start_time)
        get_protection_status(input)
      end

      def get_protection_status(input : Types::GetProtectionStatusRequest) : Types::GetProtectionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PROTECTION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProtectionStatusResponse, "GetProtectionStatus")
      end

      # Returns information about the specified Firewall Manager protocols list.

      def get_protocols_list(
        list_id : String,
        default_list : Bool? = nil
      ) : Types::GetProtocolsListResponse

        input = Types::GetProtocolsListRequest.new(list_id: list_id, default_list: default_list)
        get_protocols_list(input)
      end

      def get_protocols_list(input : Types::GetProtocolsListRequest) : Types::GetProtocolsListResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PROTOCOLS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProtocolsListResponse, "GetProtocolsList")
      end

      # Gets information about a specific resource set.

      def get_resource_set(
        identifier : String
      ) : Types::GetResourceSetResponse

        input = Types::GetResourceSetRequest.new(identifier: identifier)
        get_resource_set(input)
      end

      def get_resource_set(input : Types::GetResourceSetRequest) : Types::GetResourceSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceSetResponse, "GetResourceSet")
      end

      # The onboarding status of a Firewall Manager admin account to third-party firewall vendor tenant.

      def get_third_party_firewall_association_status(
        third_party_firewall : String
      ) : Types::GetThirdPartyFirewallAssociationStatusResponse

        input = Types::GetThirdPartyFirewallAssociationStatusRequest.new(third_party_firewall: third_party_firewall)
        get_third_party_firewall_association_status(input)
      end

      def get_third_party_firewall_association_status(input : Types::GetThirdPartyFirewallAssociationStatusRequest) : Types::GetThirdPartyFirewallAssociationStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_THIRD_PARTY_FIREWALL_ASSOCIATION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetThirdPartyFirewallAssociationStatusResponse, "GetThirdPartyFirewallAssociationStatus")
      end

      # Retrieves violations for a resource based on the specified Firewall Manager policy and Amazon Web
      # Services account.

      def get_violation_details(
        member_account : String,
        policy_id : String,
        resource_id : String,
        resource_type : String
      ) : Types::GetViolationDetailsResponse

        input = Types::GetViolationDetailsRequest.new(member_account: member_account, policy_id: policy_id, resource_id: resource_id, resource_type: resource_type)
        get_violation_details(input)
      end

      def get_violation_details(input : Types::GetViolationDetailsRequest) : Types::GetViolationDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_VIOLATION_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetViolationDetailsResponse, "GetViolationDetails")
      end

      # Returns a AdminAccounts object that lists the Firewall Manager administrators within the
      # organization that are onboarded to Firewall Manager by AssociateAdminAccount . This operation can be
      # called only from the organization's management account.

      def list_admin_accounts_for_organization(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAdminAccountsForOrganizationResponse

        input = Types::ListAdminAccountsForOrganizationRequest.new(max_results: max_results, next_token: next_token)
        list_admin_accounts_for_organization(input)
      end

      def list_admin_accounts_for_organization(input : Types::ListAdminAccountsForOrganizationRequest) : Types::ListAdminAccountsForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADMIN_ACCOUNTS_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAdminAccountsForOrganizationResponse, "ListAdminAccountsForOrganization")
      end

      # Lists the accounts that are managing the specified Organizations member account. This is useful for
      # any member account so that they can view the accounts who are managing their account. This operation
      # only returns the managing administrators that have the requested account within their AdminScope .

      def list_admins_managing_account(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAdminsManagingAccountResponse

        input = Types::ListAdminsManagingAccountRequest.new(max_results: max_results, next_token: next_token)
        list_admins_managing_account(input)
      end

      def list_admins_managing_account(input : Types::ListAdminsManagingAccountRequest) : Types::ListAdminsManagingAccountResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADMINS_MANAGING_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAdminsManagingAccountResponse, "ListAdminsManagingAccount")
      end

      # Returns an array of AppsListDataSummary objects.

      def list_apps_lists(
        max_results : Int32,
        default_lists : Bool? = nil,
        next_token : String? = nil
      ) : Types::ListAppsListsResponse

        input = Types::ListAppsListsRequest.new(max_results: max_results, default_lists: default_lists, next_token: next_token)
        list_apps_lists(input)
      end

      def list_apps_lists(input : Types::ListAppsListsRequest) : Types::ListAppsListsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPS_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAppsListsResponse, "ListAppsLists")
      end

      # Returns an array of PolicyComplianceStatus objects. Use PolicyComplianceStatus to get a summary of
      # which member accounts are protected by the specified policy.

      def list_compliance_status(
        policy_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListComplianceStatusResponse

        input = Types::ListComplianceStatusRequest.new(policy_id: policy_id, max_results: max_results, next_token: next_token)
        list_compliance_status(input)
      end

      def list_compliance_status(input : Types::ListComplianceStatusRequest) : Types::ListComplianceStatusResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPLIANCE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComplianceStatusResponse, "ListComplianceStatus")
      end

      # Returns an array of resources in the organization's accounts that are available to be associated
      # with a resource set.

      def list_discovered_resources(
        member_account_ids : Array(String),
        resource_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDiscoveredResourcesResponse

        input = Types::ListDiscoveredResourcesRequest.new(member_account_ids: member_account_ids, resource_type: resource_type, max_results: max_results, next_token: next_token)
        list_discovered_resources(input)
      end

      def list_discovered_resources(input : Types::ListDiscoveredResourcesRequest) : Types::ListDiscoveredResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DISCOVERED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDiscoveredResourcesResponse, "ListDiscoveredResources")
      end

      # Returns a MemberAccounts object that lists the member accounts in the administrator's Amazon Web
      # Services organization. Either an Firewall Manager administrator or the organization's management
      # account can make this request.

      def list_member_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMemberAccountsResponse

        input = Types::ListMemberAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_member_accounts(input)
      end

      def list_member_accounts(input : Types::ListMemberAccountsRequest) : Types::ListMemberAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MEMBER_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMemberAccountsResponse, "ListMemberAccounts")
      end

      # Returns an array of PolicySummary objects.

      def list_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPoliciesResponse

        input = Types::ListPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_policies(input)
      end

      def list_policies(input : Types::ListPoliciesRequest) : Types::ListPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPoliciesResponse, "ListPolicies")
      end

      # Returns an array of ProtocolsListDataSummary objects.

      def list_protocols_lists(
        max_results : Int32,
        default_lists : Bool? = nil,
        next_token : String? = nil
      ) : Types::ListProtocolsListsResponse

        input = Types::ListProtocolsListsRequest.new(max_results: max_results, default_lists: default_lists, next_token: next_token)
        list_protocols_lists(input)
      end

      def list_protocols_lists(input : Types::ListProtocolsListsRequest) : Types::ListProtocolsListsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROTOCOLS_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProtocolsListsResponse, "ListProtocolsLists")
      end

      # Returns an array of resources that are currently associated to a resource set.

      def list_resource_set_resources(
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceSetResourcesResponse

        input = Types::ListResourceSetResourcesRequest.new(identifier: identifier, max_results: max_results, next_token: next_token)
        list_resource_set_resources(input)
      end

      def list_resource_set_resources(input : Types::ListResourceSetResourcesRequest) : Types::ListResourceSetResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_SET_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceSetResourcesResponse, "ListResourceSetResources")
      end

      # Returns an array of ResourceSetSummary objects.

      def list_resource_sets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceSetsResponse

        input = Types::ListResourceSetsRequest.new(max_results: max_results, next_token: next_token)
        list_resource_sets(input)
      end

      def list_resource_sets(input : Types::ListResourceSetsRequest) : Types::ListResourceSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceSetsResponse, "ListResourceSets")
      end

      # Retrieves the list of tags for the specified Amazon Web Services resource.

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

      # Retrieves a list of all of the third-party firewall policies that are associated with the
      # third-party firewall administrator's account.

      def list_third_party_firewall_firewall_policies(
        max_results : Int32,
        third_party_firewall : String,
        next_token : String? = nil
      ) : Types::ListThirdPartyFirewallFirewallPoliciesResponse

        input = Types::ListThirdPartyFirewallFirewallPoliciesRequest.new(max_results: max_results, third_party_firewall: third_party_firewall, next_token: next_token)
        list_third_party_firewall_firewall_policies(input)
      end

      def list_third_party_firewall_firewall_policies(input : Types::ListThirdPartyFirewallFirewallPoliciesRequest) : Types::ListThirdPartyFirewallFirewallPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_THIRD_PARTY_FIREWALL_FIREWALL_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListThirdPartyFirewallFirewallPoliciesResponse, "ListThirdPartyFirewallFirewallPolicies")
      end

      # Creates or updates an Firewall Manager administrator account. The account must be a member of the
      # organization that was onboarded to Firewall Manager by AssociateAdminAccount . Only the
      # organization's management account can create an Firewall Manager administrator account. When you
      # create an Firewall Manager administrator account, the service checks to see if the account is
      # already a delegated administrator within Organizations. If the account isn't a delegated
      # administrator, Firewall Manager calls Organizations to delegate the account within Organizations.
      # For more information about administrator accounts within Organizations, see Managing the Amazon Web
      # Services Accounts in Your Organization .

      def put_admin_account(
        admin_account : String,
        admin_scope : Types::AdminScope? = nil
      ) : Nil

        input = Types::PutAdminAccountRequest.new(admin_account: admin_account, admin_scope: admin_scope)
        put_admin_account(input)
      end

      def put_admin_account(input : Types::PutAdminAccountRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_ADMIN_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an Firewall Manager applications list.

      def put_apps_list(
        apps_list : Types::AppsListData,
        tag_list : Array(Types::Tag)? = nil
      ) : Types::PutAppsListResponse

        input = Types::PutAppsListRequest.new(apps_list: apps_list, tag_list: tag_list)
        put_apps_list(input)
      end

      def put_apps_list(input : Types::PutAppsListRequest) : Types::PutAppsListResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_APPS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAppsListResponse, "PutAppsList")
      end

      # Designates the IAM role and Amazon Simple Notification Service (SNS) topic that Firewall Manager
      # uses to record SNS logs. To perform this action outside of the console, you must first configure the
      # SNS topic's access policy to allow the SnsRoleName to publish SNS logs. If the SnsRoleName provided
      # is a role other than the AWSServiceRoleForFMS service-linked role, this role must have a trust
      # relationship configured to allow the Firewall Manager service principal fms.amazonaws.com to assume
      # this role. For information about configuring an SNS access policy, see Service roles for Firewall
      # Manager in the Firewall Manager Developer Guide .

      def put_notification_channel(
        sns_role_name : String,
        sns_topic_arn : String
      ) : Nil

        input = Types::PutNotificationChannelRequest.new(sns_role_name: sns_role_name, sns_topic_arn: sns_topic_arn)
        put_notification_channel(input)
      end

      def put_notification_channel(input : Types::PutNotificationChannelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_NOTIFICATION_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an Firewall Manager policy. A Firewall Manager policy is specific to the individual policy
      # type. If you want to enforce multiple policy types across accounts, you can create multiple
      # policies. You can create more than one policy for each type. If you add a new account to an
      # organization that you created with Organizations, Firewall Manager automatically applies the policy
      # to the resources in that account that are within scope of the policy. Firewall Manager provides the
      # following types of policies: WAF policy - This policy applies WAF web ACL protections to specified
      # accounts and resources. Shield Advanced policy - This policy applies Shield Advanced protection to
      # specified accounts and resources. Security Groups policy - This type of policy gives you control
      # over security groups that are in use throughout your organization in Organizations and lets you
      # enforce a baseline set of rules across your organization. Network ACL policy - This type of policy
      # gives you control over the network ACLs that are in use throughout your organization in
      # Organizations and lets you enforce a baseline set of first and last network ACL rules across your
      # organization. Network Firewall policy - This policy applies Network Firewall protection to your
      # organization's VPCs. DNS Firewall policy - This policy applies Amazon Route 53 Resolver DNS Firewall
      # protections to your organization's VPCs. Third-party firewall policy - This policy applies
      # third-party firewall protections. Third-party firewalls are available by subscription through the
      # Amazon Web Services Marketplace console at Amazon Web Services Marketplace . Palo Alto Networks
      # Cloud NGFW policy - This policy applies Palo Alto Networks Cloud Next Generation Firewall (NGFW)
      # protections and Palo Alto Networks Cloud NGFW rulestacks to your organization's VPCs. Fortigate CNF
      # policy - This policy applies Fortigate Cloud Native Firewall (CNF) protections. Fortigate CNF is a
      # cloud-centered solution that blocks Zero-Day threats and secures cloud infrastructures with
      # industry-leading advanced threat prevention, smart web application firewalls (WAF), and API
      # protection.

      def put_policy(
        policy : Types::Policy,
        tag_list : Array(Types::Tag)? = nil
      ) : Types::PutPolicyResponse

        input = Types::PutPolicyRequest.new(policy: policy, tag_list: tag_list)
        put_policy(input)
      end

      def put_policy(input : Types::PutPolicyRequest) : Types::PutPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutPolicyResponse, "PutPolicy")
      end

      # Creates an Firewall Manager protocols list.

      def put_protocols_list(
        protocols_list : Types::ProtocolsListData,
        tag_list : Array(Types::Tag)? = nil
      ) : Types::PutProtocolsListResponse

        input = Types::PutProtocolsListRequest.new(protocols_list: protocols_list, tag_list: tag_list)
        put_protocols_list(input)
      end

      def put_protocols_list(input : Types::PutProtocolsListRequest) : Types::PutProtocolsListResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PROTOCOLS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutProtocolsListResponse, "PutProtocolsList")
      end

      # Creates the resource set. An Firewall Manager resource set defines the resources to import into an
      # Firewall Manager policy from another Amazon Web Services service.

      def put_resource_set(
        resource_set : Types::ResourceSet,
        tag_list : Array(Types::Tag)? = nil
      ) : Types::PutResourceSetResponse

        input = Types::PutResourceSetRequest.new(resource_set: resource_set, tag_list: tag_list)
        put_resource_set(input)
      end

      def put_resource_set(input : Types::PutResourceSetRequest) : Types::PutResourceSetResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourceSetResponse, "PutResourceSet")
      end

      # Adds one or more tags to an Amazon Web Services resource.

      def tag_resource(
        resource_arn : String,
        tag_list : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tag_list: tag_list)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes one or more tags from an Amazon Web Services resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end
    end
  end
end
