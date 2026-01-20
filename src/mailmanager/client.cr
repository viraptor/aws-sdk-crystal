module Aws
  module MailManager
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

      # Creates an Add On instance for the subscription indicated in the request. The resulting Amazon
      # Resource Name (ARN) can be used in a conditional statement for a rule set or traffic policy.

      def create_addon_instance(
        addon_subscription_id : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAddonInstanceResponse

        input = Types::CreateAddonInstanceRequest.new(addon_subscription_id: addon_subscription_id, client_token: client_token, tags: tags)
        create_addon_instance(input)
      end

      def create_addon_instance(input : Types::CreateAddonInstanceRequest) : Types::CreateAddonInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADDON_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAddonInstanceResponse, "CreateAddonInstance")
      end

      # Creates a subscription for an Add On representing the acceptance of its terms of use and additional
      # pricing. The subscription can then be used to create an instance for use in rule sets or traffic
      # policies.

      def create_addon_subscription(
        addon_name : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAddonSubscriptionResponse

        input = Types::CreateAddonSubscriptionRequest.new(addon_name: addon_name, client_token: client_token, tags: tags)
        create_addon_subscription(input)
      end

      def create_addon_subscription(input : Types::CreateAddonSubscriptionRequest) : Types::CreateAddonSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADDON_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAddonSubscriptionResponse, "CreateAddonSubscription")
      end

      # Creates a new address list.

      def create_address_list(
        address_list_name : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAddressListResponse

        input = Types::CreateAddressListRequest.new(address_list_name: address_list_name, client_token: client_token, tags: tags)
        create_address_list(input)
      end

      def create_address_list(input : Types::CreateAddressListRequest) : Types::CreateAddressListResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADDRESS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAddressListResponse, "CreateAddressList")
      end

      # Creates an import job for an address list.

      def create_address_list_import_job(
        address_list_id : String,
        import_data_format : Types::ImportDataFormat,
        name : String,
        client_token : String? = nil
      ) : Types::CreateAddressListImportJobResponse

        input = Types::CreateAddressListImportJobRequest.new(address_list_id: address_list_id, import_data_format: import_data_format, name: name, client_token: client_token)
        create_address_list_import_job(input)
      end

      def create_address_list_import_job(input : Types::CreateAddressListImportJobRequest) : Types::CreateAddressListImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADDRESS_LIST_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAddressListImportJobResponse, "CreateAddressListImportJob")
      end

      # Creates a new email archive resource for storing and retaining emails.

      def create_archive(
        archive_name : String,
        client_token : String? = nil,
        kms_key_arn : String? = nil,
        retention : Types::ArchiveRetention? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateArchiveResponse

        input = Types::CreateArchiveRequest.new(archive_name: archive_name, client_token: client_token, kms_key_arn: kms_key_arn, retention: retention, tags: tags)
        create_archive(input)
      end

      def create_archive(input : Types::CreateArchiveRequest) : Types::CreateArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateArchiveResponse, "CreateArchive")
      end

      # Provision a new ingress endpoint resource.

      def create_ingress_point(
        ingress_point_name : String,
        rule_set_id : String,
        traffic_policy_id : String,
        type : String,
        client_token : String? = nil,
        ingress_point_configuration : Types::IngressPointConfiguration? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateIngressPointResponse

        input = Types::CreateIngressPointRequest.new(ingress_point_name: ingress_point_name, rule_set_id: rule_set_id, traffic_policy_id: traffic_policy_id, type: type, client_token: client_token, ingress_point_configuration: ingress_point_configuration, network_configuration: network_configuration, tags: tags)
        create_ingress_point(input)
      end

      def create_ingress_point(input : Types::CreateIngressPointRequest) : Types::CreateIngressPointResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INGRESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIngressPointResponse, "CreateIngressPoint")
      end

      # Creates a relay resource which can be used in rules to relay incoming emails to defined relay
      # destinations.

      def create_relay(
        authentication : Types::RelayAuthentication,
        relay_name : String,
        server_name : String,
        server_port : Int32,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRelayResponse

        input = Types::CreateRelayRequest.new(authentication: authentication, relay_name: relay_name, server_name: server_name, server_port: server_port, client_token: client_token, tags: tags)
        create_relay(input)
      end

      def create_relay(input : Types::CreateRelayRequest) : Types::CreateRelayResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RELAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRelayResponse, "CreateRelay")
      end

      # Provision a new rule set.

      def create_rule_set(
        rule_set_name : String,
        rules : Array(Types::Rule),
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRuleSetResponse

        input = Types::CreateRuleSetRequest.new(rule_set_name: rule_set_name, rules: rules, client_token: client_token, tags: tags)
        create_rule_set(input)
      end

      def create_rule_set(input : Types::CreateRuleSetRequest) : Types::CreateRuleSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRuleSetResponse, "CreateRuleSet")
      end

      # Provision a new traffic policy resource.

      def create_traffic_policy(
        default_action : String,
        policy_statements : Array(Types::PolicyStatement),
        traffic_policy_name : String,
        client_token : String? = nil,
        max_message_size_bytes : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTrafficPolicyResponse

        input = Types::CreateTrafficPolicyRequest.new(default_action: default_action, policy_statements: policy_statements, traffic_policy_name: traffic_policy_name, client_token: client_token, max_message_size_bytes: max_message_size_bytes, tags: tags)
        create_traffic_policy(input)
      end

      def create_traffic_policy(input : Types::CreateTrafficPolicyRequest) : Types::CreateTrafficPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRAFFIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrafficPolicyResponse, "CreateTrafficPolicy")
      end

      # Deletes an Add On instance.

      def delete_addon_instance(
        addon_instance_id : String
      ) : Types::DeleteAddonInstanceResponse

        input = Types::DeleteAddonInstanceRequest.new(addon_instance_id: addon_instance_id)
        delete_addon_instance(input)
      end

      def delete_addon_instance(input : Types::DeleteAddonInstanceRequest) : Types::DeleteAddonInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ADDON_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAddonInstanceResponse, "DeleteAddonInstance")
      end

      # Deletes an Add On subscription.

      def delete_addon_subscription(
        addon_subscription_id : String
      ) : Types::DeleteAddonSubscriptionResponse

        input = Types::DeleteAddonSubscriptionRequest.new(addon_subscription_id: addon_subscription_id)
        delete_addon_subscription(input)
      end

      def delete_addon_subscription(input : Types::DeleteAddonSubscriptionRequest) : Types::DeleteAddonSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ADDON_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAddonSubscriptionResponse, "DeleteAddonSubscription")
      end

      # Deletes an address list.

      def delete_address_list(
        address_list_id : String
      ) : Types::DeleteAddressListResponse

        input = Types::DeleteAddressListRequest.new(address_list_id: address_list_id)
        delete_address_list(input)
      end

      def delete_address_list(input : Types::DeleteAddressListRequest) : Types::DeleteAddressListResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ADDRESS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAddressListResponse, "DeleteAddressList")
      end

      # Initiates deletion of an email archive. This changes the archive state to pending deletion. In this
      # state, no new emails can be added, and existing archived emails become inaccessible (search, export,
      # download). The archive and all of its contents will be permanently deleted 30 days after entering
      # the pending deletion state, regardless of the configured retention period.

      def delete_archive(
        archive_id : String
      ) : Types::DeleteArchiveResponse

        input = Types::DeleteArchiveRequest.new(archive_id: archive_id)
        delete_archive(input)
      end

      def delete_archive(input : Types::DeleteArchiveRequest) : Types::DeleteArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteArchiveResponse, "DeleteArchive")
      end

      # Delete an ingress endpoint resource.

      def delete_ingress_point(
        ingress_point_id : String
      ) : Types::DeleteIngressPointResponse

        input = Types::DeleteIngressPointRequest.new(ingress_point_id: ingress_point_id)
        delete_ingress_point(input)
      end

      def delete_ingress_point(input : Types::DeleteIngressPointRequest) : Types::DeleteIngressPointResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INGRESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIngressPointResponse, "DeleteIngressPoint")
      end

      # Deletes an existing relay resource.

      def delete_relay(
        relay_id : String
      ) : Types::DeleteRelayResponse

        input = Types::DeleteRelayRequest.new(relay_id: relay_id)
        delete_relay(input)
      end

      def delete_relay(input : Types::DeleteRelayRequest) : Types::DeleteRelayResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RELAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRelayResponse, "DeleteRelay")
      end

      # Delete a rule set.

      def delete_rule_set(
        rule_set_id : String
      ) : Types::DeleteRuleSetResponse

        input = Types::DeleteRuleSetRequest.new(rule_set_id: rule_set_id)
        delete_rule_set(input)
      end

      def delete_rule_set(input : Types::DeleteRuleSetRequest) : Types::DeleteRuleSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRuleSetResponse, "DeleteRuleSet")
      end

      # Delete a traffic policy resource.

      def delete_traffic_policy(
        traffic_policy_id : String
      ) : Types::DeleteTrafficPolicyResponse

        input = Types::DeleteTrafficPolicyRequest.new(traffic_policy_id: traffic_policy_id)
        delete_traffic_policy(input)
      end

      def delete_traffic_policy(input : Types::DeleteTrafficPolicyRequest) : Types::DeleteTrafficPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRAFFIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTrafficPolicyResponse, "DeleteTrafficPolicy")
      end

      # Removes a member from an address list.

      def deregister_member_from_address_list(
        address : String,
        address_list_id : String
      ) : Types::DeregisterMemberFromAddressListResponse

        input = Types::DeregisterMemberFromAddressListRequest.new(address: address, address_list_id: address_list_id)
        deregister_member_from_address_list(input)
      end

      def deregister_member_from_address_list(input : Types::DeregisterMemberFromAddressListRequest) : Types::DeregisterMemberFromAddressListResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_MEMBER_FROM_ADDRESS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterMemberFromAddressListResponse, "DeregisterMemberFromAddressList")
      end

      # Gets detailed information about an Add On instance.

      def get_addon_instance(
        addon_instance_id : String
      ) : Types::GetAddonInstanceResponse

        input = Types::GetAddonInstanceRequest.new(addon_instance_id: addon_instance_id)
        get_addon_instance(input)
      end

      def get_addon_instance(input : Types::GetAddonInstanceRequest) : Types::GetAddonInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADDON_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAddonInstanceResponse, "GetAddonInstance")
      end

      # Gets detailed information about an Add On subscription.

      def get_addon_subscription(
        addon_subscription_id : String
      ) : Types::GetAddonSubscriptionResponse

        input = Types::GetAddonSubscriptionRequest.new(addon_subscription_id: addon_subscription_id)
        get_addon_subscription(input)
      end

      def get_addon_subscription(input : Types::GetAddonSubscriptionRequest) : Types::GetAddonSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADDON_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAddonSubscriptionResponse, "GetAddonSubscription")
      end

      # Fetch attributes of an address list.

      def get_address_list(
        address_list_id : String
      ) : Types::GetAddressListResponse

        input = Types::GetAddressListRequest.new(address_list_id: address_list_id)
        get_address_list(input)
      end

      def get_address_list(input : Types::GetAddressListRequest) : Types::GetAddressListResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADDRESS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAddressListResponse, "GetAddressList")
      end

      # Fetch attributes of an import job.

      def get_address_list_import_job(
        job_id : String
      ) : Types::GetAddressListImportJobResponse

        input = Types::GetAddressListImportJobRequest.new(job_id: job_id)
        get_address_list_import_job(input)
      end

      def get_address_list_import_job(input : Types::GetAddressListImportJobRequest) : Types::GetAddressListImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADDRESS_LIST_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAddressListImportJobResponse, "GetAddressListImportJob")
      end

      # Retrieves the full details and current state of a specified email archive.

      def get_archive(
        archive_id : String
      ) : Types::GetArchiveResponse

        input = Types::GetArchiveRequest.new(archive_id: archive_id)
        get_archive(input)
      end

      def get_archive(input : Types::GetArchiveRequest) : Types::GetArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetArchiveResponse, "GetArchive")
      end

      # Retrieves the details and current status of a specific email archive export job.

      def get_archive_export(
        export_id : String
      ) : Types::GetArchiveExportResponse

        input = Types::GetArchiveExportRequest.new(export_id: export_id)
        get_archive_export(input)
      end

      def get_archive_export(input : Types::GetArchiveExportRequest) : Types::GetArchiveExportResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ARCHIVE_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetArchiveExportResponse, "GetArchiveExport")
      end

      # Returns a pre-signed URL that provides temporary download access to the specific email message
      # stored in the archive.

      def get_archive_message(
        archived_message_id : String
      ) : Types::GetArchiveMessageResponse

        input = Types::GetArchiveMessageRequest.new(archived_message_id: archived_message_id)
        get_archive_message(input)
      end

      def get_archive_message(input : Types::GetArchiveMessageRequest) : Types::GetArchiveMessageResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ARCHIVE_MESSAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetArchiveMessageResponse, "GetArchiveMessage")
      end

      # Returns the textual content of a specific email message stored in the archive. Attachments are not
      # included.

      def get_archive_message_content(
        archived_message_id : String
      ) : Types::GetArchiveMessageContentResponse

        input = Types::GetArchiveMessageContentRequest.new(archived_message_id: archived_message_id)
        get_archive_message_content(input)
      end

      def get_archive_message_content(input : Types::GetArchiveMessageContentRequest) : Types::GetArchiveMessageContentResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ARCHIVE_MESSAGE_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetArchiveMessageContentResponse, "GetArchiveMessageContent")
      end

      # Retrieves the details and current status of a specific email archive search job.

      def get_archive_search(
        search_id : String
      ) : Types::GetArchiveSearchResponse

        input = Types::GetArchiveSearchRequest.new(search_id: search_id)
        get_archive_search(input)
      end

      def get_archive_search(input : Types::GetArchiveSearchRequest) : Types::GetArchiveSearchResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ARCHIVE_SEARCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetArchiveSearchResponse, "GetArchiveSearch")
      end

      # Returns the results of a completed email archive search job.

      def get_archive_search_results(
        search_id : String
      ) : Types::GetArchiveSearchResultsResponse

        input = Types::GetArchiveSearchResultsRequest.new(search_id: search_id)
        get_archive_search_results(input)
      end

      def get_archive_search_results(input : Types::GetArchiveSearchResultsRequest) : Types::GetArchiveSearchResultsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ARCHIVE_SEARCH_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetArchiveSearchResultsResponse, "GetArchiveSearchResults")
      end

      # Fetch ingress endpoint resource attributes.

      def get_ingress_point(
        ingress_point_id : String
      ) : Types::GetIngressPointResponse

        input = Types::GetIngressPointRequest.new(ingress_point_id: ingress_point_id)
        get_ingress_point(input)
      end

      def get_ingress_point(input : Types::GetIngressPointRequest) : Types::GetIngressPointResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INGRESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIngressPointResponse, "GetIngressPoint")
      end

      # Fetch attributes of a member in an address list.

      def get_member_of_address_list(
        address : String,
        address_list_id : String
      ) : Types::GetMemberOfAddressListResponse

        input = Types::GetMemberOfAddressListRequest.new(address: address, address_list_id: address_list_id)
        get_member_of_address_list(input)
      end

      def get_member_of_address_list(input : Types::GetMemberOfAddressListRequest) : Types::GetMemberOfAddressListResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MEMBER_OF_ADDRESS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMemberOfAddressListResponse, "GetMemberOfAddressList")
      end

      # Fetch the relay resource and it's attributes.

      def get_relay(
        relay_id : String
      ) : Types::GetRelayResponse

        input = Types::GetRelayRequest.new(relay_id: relay_id)
        get_relay(input)
      end

      def get_relay(input : Types::GetRelayRequest) : Types::GetRelayResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RELAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelayResponse, "GetRelay")
      end

      # Fetch attributes of a rule set.

      def get_rule_set(
        rule_set_id : String
      ) : Types::GetRuleSetResponse

        input = Types::GetRuleSetRequest.new(rule_set_id: rule_set_id)
        get_rule_set(input)
      end

      def get_rule_set(input : Types::GetRuleSetRequest) : Types::GetRuleSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRuleSetResponse, "GetRuleSet")
      end

      # Fetch attributes of a traffic policy resource.

      def get_traffic_policy(
        traffic_policy_id : String
      ) : Types::GetTrafficPolicyResponse

        input = Types::GetTrafficPolicyRequest.new(traffic_policy_id: traffic_policy_id)
        get_traffic_policy(input)
      end

      def get_traffic_policy(input : Types::GetTrafficPolicyRequest) : Types::GetTrafficPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRAFFIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTrafficPolicyResponse, "GetTrafficPolicy")
      end

      # Lists all Add On instances in your account.

      def list_addon_instances(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListAddonInstancesResponse

        input = Types::ListAddonInstancesRequest.new(next_token: next_token, page_size: page_size)
        list_addon_instances(input)
      end

      def list_addon_instances(input : Types::ListAddonInstancesRequest) : Types::ListAddonInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADDON_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAddonInstancesResponse, "ListAddonInstances")
      end

      # Lists all Add On subscriptions in your account.

      def list_addon_subscriptions(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListAddonSubscriptionsResponse

        input = Types::ListAddonSubscriptionsRequest.new(next_token: next_token, page_size: page_size)
        list_addon_subscriptions(input)
      end

      def list_addon_subscriptions(input : Types::ListAddonSubscriptionsRequest) : Types::ListAddonSubscriptionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADDON_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAddonSubscriptionsResponse, "ListAddonSubscriptions")
      end

      # Lists jobs for an address list.

      def list_address_list_import_jobs(
        address_list_id : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListAddressListImportJobsResponse

        input = Types::ListAddressListImportJobsRequest.new(address_list_id: address_list_id, next_token: next_token, page_size: page_size)
        list_address_list_import_jobs(input)
      end

      def list_address_list_import_jobs(input : Types::ListAddressListImportJobsRequest) : Types::ListAddressListImportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADDRESS_LIST_IMPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAddressListImportJobsResponse, "ListAddressListImportJobs")
      end

      # Lists address lists for this account.

      def list_address_lists(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListAddressListsResponse

        input = Types::ListAddressListsRequest.new(next_token: next_token, page_size: page_size)
        list_address_lists(input)
      end

      def list_address_lists(input : Types::ListAddressListsRequest) : Types::ListAddressListsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADDRESS_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAddressListsResponse, "ListAddressLists")
      end

      # Returns a list of email archive export jobs.

      def list_archive_exports(
        archive_id : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListArchiveExportsResponse

        input = Types::ListArchiveExportsRequest.new(archive_id: archive_id, next_token: next_token, page_size: page_size)
        list_archive_exports(input)
      end

      def list_archive_exports(input : Types::ListArchiveExportsRequest) : Types::ListArchiveExportsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ARCHIVE_EXPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListArchiveExportsResponse, "ListArchiveExports")
      end

      # Returns a list of email archive search jobs.

      def list_archive_searches(
        archive_id : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListArchiveSearchesResponse

        input = Types::ListArchiveSearchesRequest.new(archive_id: archive_id, next_token: next_token, page_size: page_size)
        list_archive_searches(input)
      end

      def list_archive_searches(input : Types::ListArchiveSearchesRequest) : Types::ListArchiveSearchesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ARCHIVE_SEARCHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListArchiveSearchesResponse, "ListArchiveSearches")
      end

      # Returns a list of all email archives in your account.

      def list_archives(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListArchivesResponse

        input = Types::ListArchivesRequest.new(next_token: next_token, page_size: page_size)
        list_archives(input)
      end

      def list_archives(input : Types::ListArchivesRequest) : Types::ListArchivesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ARCHIVES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListArchivesResponse, "ListArchives")
      end

      # List all ingress endpoint resources.

      def list_ingress_points(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListIngressPointsResponse

        input = Types::ListIngressPointsRequest.new(next_token: next_token, page_size: page_size)
        list_ingress_points(input)
      end

      def list_ingress_points(input : Types::ListIngressPointsRequest) : Types::ListIngressPointsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INGRESS_POINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIngressPointsResponse, "ListIngressPoints")
      end

      # Lists members of an address list.

      def list_members_of_address_list(
        address_list_id : String,
        filter : Types::AddressFilter? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListMembersOfAddressListResponse

        input = Types::ListMembersOfAddressListRequest.new(address_list_id: address_list_id, filter: filter, next_token: next_token, page_size: page_size)
        list_members_of_address_list(input)
      end

      def list_members_of_address_list(input : Types::ListMembersOfAddressListRequest) : Types::ListMembersOfAddressListResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MEMBERS_OF_ADDRESS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMembersOfAddressListResponse, "ListMembersOfAddressList")
      end

      # Lists all the existing relay resources.

      def list_relays(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListRelaysResponse

        input = Types::ListRelaysRequest.new(next_token: next_token, page_size: page_size)
        list_relays(input)
      end

      def list_relays(input : Types::ListRelaysRequest) : Types::ListRelaysResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RELAYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRelaysResponse, "ListRelays")
      end

      # List rule sets for this account.

      def list_rule_sets(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListRuleSetsResponse

        input = Types::ListRuleSetsRequest.new(next_token: next_token, page_size: page_size)
        list_rule_sets(input)
      end

      def list_rule_sets(input : Types::ListRuleSetsRequest) : Types::ListRuleSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RULE_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRuleSetsResponse, "ListRuleSets")
      end

      # Retrieves the list of tags (keys and values) assigned to the resource.

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

      # List traffic policy resources.

      def list_traffic_policies(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListTrafficPoliciesResponse

        input = Types::ListTrafficPoliciesRequest.new(next_token: next_token, page_size: page_size)
        list_traffic_policies(input)
      end

      def list_traffic_policies(input : Types::ListTrafficPoliciesRequest) : Types::ListTrafficPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRAFFIC_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrafficPoliciesResponse, "ListTrafficPolicies")
      end

      # Adds a member to an address list.

      def register_member_to_address_list(
        address : String,
        address_list_id : String
      ) : Types::RegisterMemberToAddressListResponse

        input = Types::RegisterMemberToAddressListRequest.new(address: address, address_list_id: address_list_id)
        register_member_to_address_list(input)
      end

      def register_member_to_address_list(input : Types::RegisterMemberToAddressListRequest) : Types::RegisterMemberToAddressListResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_MEMBER_TO_ADDRESS_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterMemberToAddressListResponse, "RegisterMemberToAddressList")
      end

      # Starts an import job for an address list.

      def start_address_list_import_job(
        job_id : String
      ) : Types::StartAddressListImportJobResponse

        input = Types::StartAddressListImportJobRequest.new(job_id: job_id)
        start_address_list_import_job(input)
      end

      def start_address_list_import_job(input : Types::StartAddressListImportJobRequest) : Types::StartAddressListImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_ADDRESS_LIST_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAddressListImportJobResponse, "StartAddressListImportJob")
      end

      # Initiates an export of emails from the specified archive.

      def start_archive_export(
        archive_id : String,
        export_destination_configuration : Types::ExportDestinationConfiguration,
        from_timestamp : Time,
        to_timestamp : Time,
        filters : Types::ArchiveFilters? = nil,
        include_metadata : Bool? = nil,
        max_results : Int32? = nil
      ) : Types::StartArchiveExportResponse

        input = Types::StartArchiveExportRequest.new(archive_id: archive_id, export_destination_configuration: export_destination_configuration, from_timestamp: from_timestamp, to_timestamp: to_timestamp, filters: filters, include_metadata: include_metadata, max_results: max_results)
        start_archive_export(input)
      end

      def start_archive_export(input : Types::StartArchiveExportRequest) : Types::StartArchiveExportResponse
        request = Protocol::JsonRpc.build_request(Model::START_ARCHIVE_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartArchiveExportResponse, "StartArchiveExport")
      end

      # Initiates a search across emails in the specified archive.

      def start_archive_search(
        archive_id : String,
        from_timestamp : Time,
        max_results : Int32,
        to_timestamp : Time,
        filters : Types::ArchiveFilters? = nil
      ) : Types::StartArchiveSearchResponse

        input = Types::StartArchiveSearchRequest.new(archive_id: archive_id, from_timestamp: from_timestamp, max_results: max_results, to_timestamp: to_timestamp, filters: filters)
        start_archive_search(input)
      end

      def start_archive_search(input : Types::StartArchiveSearchRequest) : Types::StartArchiveSearchResponse
        request = Protocol::JsonRpc.build_request(Model::START_ARCHIVE_SEARCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartArchiveSearchResponse, "StartArchiveSearch")
      end

      # Stops an ongoing import job for an address list.

      def stop_address_list_import_job(
        job_id : String
      ) : Types::StopAddressListImportJobResponse

        input = Types::StopAddressListImportJobRequest.new(job_id: job_id)
        stop_address_list_import_job(input)
      end

      def stop_address_list_import_job(input : Types::StopAddressListImportJobRequest) : Types::StopAddressListImportJobResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_ADDRESS_LIST_IMPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopAddressListImportJobResponse, "StopAddressListImportJob")
      end

      # Stops an in-progress export of emails from an archive.

      def stop_archive_export(
        export_id : String
      ) : Types::StopArchiveExportResponse

        input = Types::StopArchiveExportRequest.new(export_id: export_id)
        stop_archive_export(input)
      end

      def stop_archive_export(input : Types::StopArchiveExportRequest) : Types::StopArchiveExportResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_ARCHIVE_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopArchiveExportResponse, "StopArchiveExport")
      end

      # Stops an in-progress archive search job.

      def stop_archive_search(
        search_id : String
      ) : Types::StopArchiveSearchResponse

        input = Types::StopArchiveSearchRequest.new(search_id: search_id)
        stop_archive_search(input)
      end

      def stop_archive_search(input : Types::StopArchiveSearchRequest) : Types::StopArchiveSearchResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_ARCHIVE_SEARCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopArchiveSearchResponse, "StopArchiveSearch")
      end

      # Adds one or more tags (keys and values) to a specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Remove one or more tags (keys and values) from a specified resource.

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

      # Updates the attributes of an existing email archive.

      def update_archive(
        archive_id : String,
        archive_name : String? = nil,
        retention : Types::ArchiveRetention? = nil
      ) : Types::UpdateArchiveResponse

        input = Types::UpdateArchiveRequest.new(archive_id: archive_id, archive_name: archive_name, retention: retention)
        update_archive(input)
      end

      def update_archive(input : Types::UpdateArchiveRequest) : Types::UpdateArchiveResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ARCHIVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateArchiveResponse, "UpdateArchive")
      end

      # Update attributes of a provisioned ingress endpoint resource.

      def update_ingress_point(
        ingress_point_id : String,
        ingress_point_configuration : Types::IngressPointConfiguration? = nil,
        ingress_point_name : String? = nil,
        rule_set_id : String? = nil,
        status_to_update : String? = nil,
        traffic_policy_id : String? = nil
      ) : Types::UpdateIngressPointResponse

        input = Types::UpdateIngressPointRequest.new(ingress_point_id: ingress_point_id, ingress_point_configuration: ingress_point_configuration, ingress_point_name: ingress_point_name, rule_set_id: rule_set_id, status_to_update: status_to_update, traffic_policy_id: traffic_policy_id)
        update_ingress_point(input)
      end

      def update_ingress_point(input : Types::UpdateIngressPointRequest) : Types::UpdateIngressPointResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INGRESS_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIngressPointResponse, "UpdateIngressPoint")
      end

      # Updates the attributes of an existing relay resource.

      def update_relay(
        relay_id : String,
        authentication : Types::RelayAuthentication? = nil,
        relay_name : String? = nil,
        server_name : String? = nil,
        server_port : Int32? = nil
      ) : Types::UpdateRelayResponse

        input = Types::UpdateRelayRequest.new(relay_id: relay_id, authentication: authentication, relay_name: relay_name, server_name: server_name, server_port: server_port)
        update_relay(input)
      end

      def update_relay(input : Types::UpdateRelayRequest) : Types::UpdateRelayResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RELAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRelayResponse, "UpdateRelay")
      end

      # Update attributes of an already provisioned rule set.

      def update_rule_set(
        rule_set_id : String,
        rule_set_name : String? = nil,
        rules : Array(Types::Rule)? = nil
      ) : Types::UpdateRuleSetResponse

        input = Types::UpdateRuleSetRequest.new(rule_set_id: rule_set_id, rule_set_name: rule_set_name, rules: rules)
        update_rule_set(input)
      end

      def update_rule_set(input : Types::UpdateRuleSetRequest) : Types::UpdateRuleSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuleSetResponse, "UpdateRuleSet")
      end

      # Update attributes of an already provisioned traffic policy resource.

      def update_traffic_policy(
        traffic_policy_id : String,
        default_action : String? = nil,
        max_message_size_bytes : Int32? = nil,
        policy_statements : Array(Types::PolicyStatement)? = nil,
        traffic_policy_name : String? = nil
      ) : Types::UpdateTrafficPolicyResponse

        input = Types::UpdateTrafficPolicyRequest.new(traffic_policy_id: traffic_policy_id, default_action: default_action, max_message_size_bytes: max_message_size_bytes, policy_statements: policy_statements, traffic_policy_name: traffic_policy_name)
        update_traffic_policy(input)
      end

      def update_traffic_policy(input : Types::UpdateTrafficPolicyRequest) : Types::UpdateTrafficPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRAFFIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTrafficPolicyResponse, "UpdateTrafficPolicy")
      end
    end
  end
end
