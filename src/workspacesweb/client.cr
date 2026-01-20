module Aws
  module WorkSpacesWeb
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates a browser settings resource with a web portal.

      def associate_browser_settings(
        browser_settings_arn : String,
        portal_arn : String
      ) : Protocol::Request
        input = Types::AssociateBrowserSettingsRequest.new(browser_settings_arn: browser_settings_arn, portal_arn: portal_arn)
        associate_browser_settings(input)
      end

      def associate_browser_settings(input : Types::AssociateBrowserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_BROWSER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a data protection settings resource with a web portal.

      def associate_data_protection_settings(
        data_protection_settings_arn : String,
        portal_arn : String
      ) : Protocol::Request
        input = Types::AssociateDataProtectionSettingsRequest.new(data_protection_settings_arn: data_protection_settings_arn, portal_arn: portal_arn)
        associate_data_protection_settings(input)
      end

      def associate_data_protection_settings(input : Types::AssociateDataProtectionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_DATA_PROTECTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an IP access settings resource with a web portal.

      def associate_ip_access_settings(
        ip_access_settings_arn : String,
        portal_arn : String
      ) : Protocol::Request
        input = Types::AssociateIpAccessSettingsRequest.new(ip_access_settings_arn: ip_access_settings_arn, portal_arn: portal_arn)
        associate_ip_access_settings(input)
      end

      def associate_ip_access_settings(input : Types::AssociateIpAccessSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_IP_ACCESS_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a network settings resource with a web portal.

      def associate_network_settings(
        network_settings_arn : String,
        portal_arn : String
      ) : Protocol::Request
        input = Types::AssociateNetworkSettingsRequest.new(network_settings_arn: network_settings_arn, portal_arn: portal_arn)
        associate_network_settings(input)
      end

      def associate_network_settings(input : Types::AssociateNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a session logger with a portal.

      def associate_session_logger(
        portal_arn : String,
        session_logger_arn : String
      ) : Protocol::Request
        input = Types::AssociateSessionLoggerRequest.new(portal_arn: portal_arn, session_logger_arn: session_logger_arn)
        associate_session_logger(input)
      end

      def associate_session_logger(input : Types::AssociateSessionLoggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SESSION_LOGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a trust store with a web portal.

      def associate_trust_store(
        portal_arn : String,
        trust_store_arn : String
      ) : Protocol::Request
        input = Types::AssociateTrustStoreRequest.new(portal_arn: portal_arn, trust_store_arn: trust_store_arn)
        associate_trust_store(input)
      end

      def associate_trust_store(input : Types::AssociateTrustStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_TRUST_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a user access logging settings resource with a web portal.

      def associate_user_access_logging_settings(
        portal_arn : String,
        user_access_logging_settings_arn : String
      ) : Protocol::Request
        input = Types::AssociateUserAccessLoggingSettingsRequest.new(portal_arn: portal_arn, user_access_logging_settings_arn: user_access_logging_settings_arn)
        associate_user_access_logging_settings(input)
      end

      def associate_user_access_logging_settings(input : Types::AssociateUserAccessLoggingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_USER_ACCESS_LOGGING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a user settings resource with a web portal.

      def associate_user_settings(
        portal_arn : String,
        user_settings_arn : String
      ) : Protocol::Request
        input = Types::AssociateUserSettingsRequest.new(portal_arn: portal_arn, user_settings_arn: user_settings_arn)
        associate_user_settings(input)
      end

      def associate_user_settings(input : Types::AssociateUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a browser settings resource that can be associated with a web portal. Once associated with a
      # web portal, browser settings control how the browser will behave once a user starts a streaming
      # session for the web portal.

      def create_browser_settings(
        additional_encryption_context : Hash(String, String)? = nil,
        browser_policy : String? = nil,
        client_token : String? = nil,
        customer_managed_key : String? = nil,
        tags : Array(Types::Tag)? = nil,
        web_content_filtering_policy : Types::WebContentFilteringPolicy? = nil
      ) : Protocol::Request
        input = Types::CreateBrowserSettingsRequest.new(additional_encryption_context: additional_encryption_context, browser_policy: browser_policy, client_token: client_token, customer_managed_key: customer_managed_key, tags: tags, web_content_filtering_policy: web_content_filtering_policy)
        create_browser_settings(input)
      end

      def create_browser_settings(input : Types::CreateBrowserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BROWSER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data protection settings resource that can be associated with a web portal.

      def create_data_protection_settings(
        additional_encryption_context : Hash(String, String)? = nil,
        client_token : String? = nil,
        customer_managed_key : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        inline_redaction_configuration : Types::InlineRedactionConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDataProtectionSettingsRequest.new(additional_encryption_context: additional_encryption_context, client_token: client_token, customer_managed_key: customer_managed_key, description: description, display_name: display_name, inline_redaction_configuration: inline_redaction_configuration, tags: tags)
        create_data_protection_settings(input)
      end

      def create_data_protection_settings(input : Types::CreateDataProtectionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_PROTECTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an identity provider resource that is then associated with a web portal.

      def create_identity_provider(
        identity_provider_details : Hash(String, String),
        identity_provider_name : String,
        identity_provider_type : String,
        portal_arn : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateIdentityProviderRequest.new(identity_provider_details: identity_provider_details, identity_provider_name: identity_provider_name, identity_provider_type: identity_provider_type, portal_arn: portal_arn, client_token: client_token, tags: tags)
        create_identity_provider(input)
      end

      def create_identity_provider(input : Types::CreateIdentityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IDENTITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IP access settings resource that can be associated with a web portal.

      def create_ip_access_settings(
        ip_rules : Array(Types::IpRule),
        additional_encryption_context : Hash(String, String)? = nil,
        client_token : String? = nil,
        customer_managed_key : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateIpAccessSettingsRequest.new(ip_rules: ip_rules, additional_encryption_context: additional_encryption_context, client_token: client_token, customer_managed_key: customer_managed_key, description: description, display_name: display_name, tags: tags)
        create_ip_access_settings(input)
      end

      def create_ip_access_settings(input : Types::CreateIpAccessSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IP_ACCESS_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a network settings resource that can be associated with a web portal. Once associated with a
      # web portal, network settings define how streaming instances will connect with your specified VPC.

      def create_network_settings(
        security_group_ids : Array(String),
        subnet_ids : Array(String),
        vpc_id : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateNetworkSettingsRequest.new(security_group_ids: security_group_ids, subnet_ids: subnet_ids, vpc_id: vpc_id, client_token: client_token, tags: tags)
        create_network_settings(input)
      end

      def create_network_settings(input : Types::CreateNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a web portal.

      def create_portal(
        additional_encryption_context : Hash(String, String)? = nil,
        authentication_type : String? = nil,
        client_token : String? = nil,
        customer_managed_key : String? = nil,
        display_name : String? = nil,
        instance_type : String? = nil,
        max_concurrent_sessions : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreatePortalRequest.new(additional_encryption_context: additional_encryption_context, authentication_type: authentication_type, client_token: client_token, customer_managed_key: customer_managed_key, display_name: display_name, instance_type: instance_type, max_concurrent_sessions: max_concurrent_sessions, tags: tags)
        create_portal(input)
      end

      def create_portal(input : Types::CreatePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a session logger.

      def create_session_logger(
        event_filter : Types::EventFilter,
        log_configuration : Types::LogConfiguration,
        additional_encryption_context : Hash(String, String)? = nil,
        client_token : String? = nil,
        customer_managed_key : String? = nil,
        display_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSessionLoggerRequest.new(event_filter: event_filter, log_configuration: log_configuration, additional_encryption_context: additional_encryption_context, client_token: client_token, customer_managed_key: customer_managed_key, display_name: display_name, tags: tags)
        create_session_logger(input)
      end

      def create_session_logger(input : Types::CreateSessionLoggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SESSION_LOGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a trust store that can be associated with a web portal. A trust store contains certificate
      # authority (CA) certificates. Once associated with a web portal, the browser in a streaming session
      # will recognize certificates that have been issued using any of the CAs in the trust store. If your
      # organization has internal websites that use certificates issued by private CAs, you should add the
      # private CA certificate to the trust store.

      def create_trust_store(
        certificate_list : Array(Bytes),
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateTrustStoreRequest.new(certificate_list: certificate_list, client_token: client_token, tags: tags)
        create_trust_store(input)
      end

      def create_trust_store(input : Types::CreateTrustStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRUST_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user access logging settings resource that can be associated with a web portal.

      def create_user_access_logging_settings(
        kinesis_stream_arn : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateUserAccessLoggingSettingsRequest.new(kinesis_stream_arn: kinesis_stream_arn, client_token: client_token, tags: tags)
        create_user_access_logging_settings(input)
      end

      def create_user_access_logging_settings(input : Types::CreateUserAccessLoggingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER_ACCESS_LOGGING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user settings resource that can be associated with a web portal. Once associated with a
      # web portal, user settings control how users can transfer data between a streaming session and the
      # their local devices.

      def create_user_settings(
        copy_allowed : String,
        download_allowed : String,
        paste_allowed : String,
        print_allowed : String,
        upload_allowed : String,
        additional_encryption_context : Hash(String, String)? = nil,
        branding_configuration_input : Types::BrandingConfigurationCreateInput? = nil,
        client_token : String? = nil,
        cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration? = nil,
        customer_managed_key : String? = nil,
        deep_link_allowed : String? = nil,
        disconnect_timeout_in_minutes : Int32? = nil,
        idle_disconnect_timeout_in_minutes : Int32? = nil,
        tags : Array(Types::Tag)? = nil,
        toolbar_configuration : Types::ToolbarConfiguration? = nil,
        web_authn_allowed : String? = nil
      ) : Protocol::Request
        input = Types::CreateUserSettingsRequest.new(copy_allowed: copy_allowed, download_allowed: download_allowed, paste_allowed: paste_allowed, print_allowed: print_allowed, upload_allowed: upload_allowed, additional_encryption_context: additional_encryption_context, branding_configuration_input: branding_configuration_input, client_token: client_token, cookie_synchronization_configuration: cookie_synchronization_configuration, customer_managed_key: customer_managed_key, deep_link_allowed: deep_link_allowed, disconnect_timeout_in_minutes: disconnect_timeout_in_minutes, idle_disconnect_timeout_in_minutes: idle_disconnect_timeout_in_minutes, tags: tags, toolbar_configuration: toolbar_configuration, web_authn_allowed: web_authn_allowed)
        create_user_settings(input)
      end

      def create_user_settings(input : Types::CreateUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes browser settings.

      def delete_browser_settings(
        browser_settings_arn : String
      ) : Protocol::Request
        input = Types::DeleteBrowserSettingsRequest.new(browser_settings_arn: browser_settings_arn)
        delete_browser_settings(input)
      end

      def delete_browser_settings(input : Types::DeleteBrowserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BROWSER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes data protection settings.

      def delete_data_protection_settings(
        data_protection_settings_arn : String
      ) : Protocol::Request
        input = Types::DeleteDataProtectionSettingsRequest.new(data_protection_settings_arn: data_protection_settings_arn)
        delete_data_protection_settings(input)
      end

      def delete_data_protection_settings(input : Types::DeleteDataProtectionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_PROTECTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the identity provider.

      def delete_identity_provider(
        identity_provider_arn : String
      ) : Protocol::Request
        input = Types::DeleteIdentityProviderRequest.new(identity_provider_arn: identity_provider_arn)
        delete_identity_provider(input)
      end

      def delete_identity_provider(input : Types::DeleteIdentityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IDENTITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes IP access settings.

      def delete_ip_access_settings(
        ip_access_settings_arn : String
      ) : Protocol::Request
        input = Types::DeleteIpAccessSettingsRequest.new(ip_access_settings_arn: ip_access_settings_arn)
        delete_ip_access_settings(input)
      end

      def delete_ip_access_settings(input : Types::DeleteIpAccessSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IP_ACCESS_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes network settings.

      def delete_network_settings(
        network_settings_arn : String
      ) : Protocol::Request
        input = Types::DeleteNetworkSettingsRequest.new(network_settings_arn: network_settings_arn)
        delete_network_settings(input)
      end

      def delete_network_settings(input : Types::DeleteNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a web portal.

      def delete_portal(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DeletePortalRequest.new(portal_arn: portal_arn)
        delete_portal(input)
      end

      def delete_portal(input : Types::DeletePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a session logger resource.

      def delete_session_logger(
        session_logger_arn : String
      ) : Protocol::Request
        input = Types::DeleteSessionLoggerRequest.new(session_logger_arn: session_logger_arn)
        delete_session_logger(input)
      end

      def delete_session_logger(input : Types::DeleteSessionLoggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SESSION_LOGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the trust store.

      def delete_trust_store(
        trust_store_arn : String
      ) : Protocol::Request
        input = Types::DeleteTrustStoreRequest.new(trust_store_arn: trust_store_arn)
        delete_trust_store(input)
      end

      def delete_trust_store(input : Types::DeleteTrustStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TRUST_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes user access logging settings.

      def delete_user_access_logging_settings(
        user_access_logging_settings_arn : String
      ) : Protocol::Request
        input = Types::DeleteUserAccessLoggingSettingsRequest.new(user_access_logging_settings_arn: user_access_logging_settings_arn)
        delete_user_access_logging_settings(input)
      end

      def delete_user_access_logging_settings(input : Types::DeleteUserAccessLoggingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER_ACCESS_LOGGING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes user settings.

      def delete_user_settings(
        user_settings_arn : String
      ) : Protocol::Request
        input = Types::DeleteUserSettingsRequest.new(user_settings_arn: user_settings_arn)
        delete_user_settings(input)
      end

      def delete_user_settings(input : Types::DeleteUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates browser settings from a web portal.

      def disassociate_browser_settings(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateBrowserSettingsRequest.new(portal_arn: portal_arn)
        disassociate_browser_settings(input)
      end

      def disassociate_browser_settings(input : Types::DisassociateBrowserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_BROWSER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates data protection settings from a web portal.

      def disassociate_data_protection_settings(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateDataProtectionSettingsRequest.new(portal_arn: portal_arn)
        disassociate_data_protection_settings(input)
      end

      def disassociate_data_protection_settings(input : Types::DisassociateDataProtectionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_DATA_PROTECTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates IP access settings from a web portal.

      def disassociate_ip_access_settings(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateIpAccessSettingsRequest.new(portal_arn: portal_arn)
        disassociate_ip_access_settings(input)
      end

      def disassociate_ip_access_settings(input : Types::DisassociateIpAccessSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_IP_ACCESS_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates network settings from a web portal.

      def disassociate_network_settings(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateNetworkSettingsRequest.new(portal_arn: portal_arn)
        disassociate_network_settings(input)
      end

      def disassociate_network_settings(input : Types::DisassociateNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a session logger from a portal.

      def disassociate_session_logger(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateSessionLoggerRequest.new(portal_arn: portal_arn)
        disassociate_session_logger(input)
      end

      def disassociate_session_logger(input : Types::DisassociateSessionLoggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SESSION_LOGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a trust store from a web portal.

      def disassociate_trust_store(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateTrustStoreRequest.new(portal_arn: portal_arn)
        disassociate_trust_store(input)
      end

      def disassociate_trust_store(input : Types::DisassociateTrustStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_TRUST_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates user access logging settings from a web portal.

      def disassociate_user_access_logging_settings(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateUserAccessLoggingSettingsRequest.new(portal_arn: portal_arn)
        disassociate_user_access_logging_settings(input)
      end

      def disassociate_user_access_logging_settings(input : Types::DisassociateUserAccessLoggingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_USER_ACCESS_LOGGING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates user settings from a web portal.

      def disassociate_user_settings(
        portal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateUserSettingsRequest.new(portal_arn: portal_arn)
        disassociate_user_settings(input)
      end

      def disassociate_user_settings(input : Types::DisassociateUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Expires an active secure browser session.

      def expire_session(
        portal_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::ExpireSessionRequest.new(portal_id: portal_id, session_id: session_id)
        expire_session(input)
      end

      def expire_session(input : Types::ExpireSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPIRE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets browser settings.

      def get_browser_settings(
        browser_settings_arn : String
      ) : Protocol::Request
        input = Types::GetBrowserSettingsRequest.new(browser_settings_arn: browser_settings_arn)
        get_browser_settings(input)
      end

      def get_browser_settings(input : Types::GetBrowserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BROWSER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the data protection settings.

      def get_data_protection_settings(
        data_protection_settings_arn : String
      ) : Protocol::Request
        input = Types::GetDataProtectionSettingsRequest.new(data_protection_settings_arn: data_protection_settings_arn)
        get_data_protection_settings(input)
      end

      def get_data_protection_settings(input : Types::GetDataProtectionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_PROTECTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the identity provider.

      def get_identity_provider(
        identity_provider_arn : String
      ) : Protocol::Request
        input = Types::GetIdentityProviderRequest.new(identity_provider_arn: identity_provider_arn)
        get_identity_provider(input)
      end

      def get_identity_provider(input : Types::GetIdentityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IDENTITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the IP access settings.

      def get_ip_access_settings(
        ip_access_settings_arn : String
      ) : Protocol::Request
        input = Types::GetIpAccessSettingsRequest.new(ip_access_settings_arn: ip_access_settings_arn)
        get_ip_access_settings(input)
      end

      def get_ip_access_settings(input : Types::GetIpAccessSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IP_ACCESS_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the network settings.

      def get_network_settings(
        network_settings_arn : String
      ) : Protocol::Request
        input = Types::GetNetworkSettingsRequest.new(network_settings_arn: network_settings_arn)
        get_network_settings(input)
      end

      def get_network_settings(input : Types::GetNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the web portal.

      def get_portal(
        portal_arn : String
      ) : Protocol::Request
        input = Types::GetPortalRequest.new(portal_arn: portal_arn)
        get_portal(input)
      end

      def get_portal(input : Types::GetPortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the service provider metadata.

      def get_portal_service_provider_metadata(
        portal_arn : String
      ) : Protocol::Request
        input = Types::GetPortalServiceProviderMetadataRequest.new(portal_arn: portal_arn)
        get_portal_service_provider_metadata(input)
      end

      def get_portal_service_provider_metadata(input : Types::GetPortalServiceProviderMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PORTAL_SERVICE_PROVIDER_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information for a secure browser session.

      def get_session(
        portal_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetSessionRequest.new(portal_id: portal_id, session_id: session_id)
        get_session(input)
      end

      def get_session(input : Types::GetSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a specific session logger resource.

      def get_session_logger(
        session_logger_arn : String
      ) : Protocol::Request
        input = Types::GetSessionLoggerRequest.new(session_logger_arn: session_logger_arn)
        get_session_logger(input)
      end

      def get_session_logger(input : Types::GetSessionLoggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION_LOGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the trust store.

      def get_trust_store(
        trust_store_arn : String
      ) : Protocol::Request
        input = Types::GetTrustStoreRequest.new(trust_store_arn: trust_store_arn)
        get_trust_store(input)
      end

      def get_trust_store(input : Types::GetTrustStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRUST_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the trust store certificate.

      def get_trust_store_certificate(
        thumbprint : String,
        trust_store_arn : String
      ) : Protocol::Request
        input = Types::GetTrustStoreCertificateRequest.new(thumbprint: thumbprint, trust_store_arn: trust_store_arn)
        get_trust_store_certificate(input)
      end

      def get_trust_store_certificate(input : Types::GetTrustStoreCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRUST_STORE_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets user access logging settings.

      def get_user_access_logging_settings(
        user_access_logging_settings_arn : String
      ) : Protocol::Request
        input = Types::GetUserAccessLoggingSettingsRequest.new(user_access_logging_settings_arn: user_access_logging_settings_arn)
        get_user_access_logging_settings(input)
      end

      def get_user_access_logging_settings(input : Types::GetUserAccessLoggingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER_ACCESS_LOGGING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets user settings.

      def get_user_settings(
        user_settings_arn : String
      ) : Protocol::Request
        input = Types::GetUserSettingsRequest.new(user_settings_arn: user_settings_arn)
        get_user_settings(input)
      end

      def get_user_settings(input : Types::GetUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of browser settings.

      def list_browser_settings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBrowserSettingsRequest.new(max_results: max_results, next_token: next_token)
        list_browser_settings(input)
      end

      def list_browser_settings(input : Types::ListBrowserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BROWSER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of data protection settings.

      def list_data_protection_settings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataProtectionSettingsRequest.new(max_results: max_results, next_token: next_token)
        list_data_protection_settings(input)
      end

      def list_data_protection_settings(input : Types::ListDataProtectionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_PROTECTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of identity providers for a specific web portal.

      def list_identity_providers(
        portal_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdentityProvidersRequest.new(portal_arn: portal_arn, max_results: max_results, next_token: next_token)
        list_identity_providers(input)
      end

      def list_identity_providers(input : Types::ListIdentityProvidersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IDENTITY_PROVIDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of IP access settings.

      def list_ip_access_settings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIpAccessSettingsRequest.new(max_results: max_results, next_token: next_token)
        list_ip_access_settings(input)
      end

      def list_ip_access_settings(input : Types::ListIpAccessSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IP_ACCESS_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of network settings.

      def list_network_settings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNetworkSettingsRequest.new(max_results: max_results, next_token: next_token)
        list_network_settings(input)
      end

      def list_network_settings(input : Types::ListNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list or web portals.

      def list_portals(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPortalsRequest.new(max_results: max_results, next_token: next_token)
        list_portals(input)
      end

      def list_portals(input : Types::ListPortalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PORTALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all available session logger resources.

      def list_session_loggers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionLoggersRequest.new(max_results: max_results, next_token: next_token)
        list_session_loggers(input)
      end

      def list_session_loggers(input : Types::ListSessionLoggersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSION_LOGGERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information for multiple secure browser sessions from a specific portal.

      def list_sessions(
        portal_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        session_id : String? = nil,
        sort_by : String? = nil,
        status : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionsRequest.new(portal_id: portal_id, max_results: max_results, next_token: next_token, session_id: session_id, sort_by: sort_by, status: status, username: username)
        list_sessions(input)
      end

      def list_sessions(input : Types::ListSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of tags for a resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of trust store certificates.

      def list_trust_store_certificates(
        trust_store_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrustStoreCertificatesRequest.new(trust_store_arn: trust_store_arn, max_results: max_results, next_token: next_token)
        list_trust_store_certificates(input)
      end

      def list_trust_store_certificates(input : Types::ListTrustStoreCertificatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRUST_STORE_CERTIFICATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of trust stores.

      def list_trust_stores(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrustStoresRequest.new(max_results: max_results, next_token: next_token)
        list_trust_stores(input)
      end

      def list_trust_stores(input : Types::ListTrustStoresRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRUST_STORES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of user access logging settings.

      def list_user_access_logging_settings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUserAccessLoggingSettingsRequest.new(max_results: max_results, next_token: next_token)
        list_user_access_logging_settings(input)
      end

      def list_user_access_logging_settings(input : Types::ListUserAccessLoggingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USER_ACCESS_LOGGING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of user settings.

      def list_user_settings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUserSettingsRequest.new(max_results: max_results, next_token: next_token)
        list_user_settings(input)
      end

      def list_user_settings(input : Types::ListUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or overwrites one or more tags for the specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags, client_token: client_token)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates browser settings.

      def update_browser_settings(
        browser_settings_arn : String,
        browser_policy : String? = nil,
        client_token : String? = nil,
        web_content_filtering_policy : Types::WebContentFilteringPolicy? = nil
      ) : Protocol::Request
        input = Types::UpdateBrowserSettingsRequest.new(browser_settings_arn: browser_settings_arn, browser_policy: browser_policy, client_token: client_token, web_content_filtering_policy: web_content_filtering_policy)
        update_browser_settings(input)
      end

      def update_browser_settings(input : Types::UpdateBrowserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BROWSER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates data protection settings.

      def update_data_protection_settings(
        data_protection_settings_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        inline_redaction_configuration : Types::InlineRedactionConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateDataProtectionSettingsRequest.new(data_protection_settings_arn: data_protection_settings_arn, client_token: client_token, description: description, display_name: display_name, inline_redaction_configuration: inline_redaction_configuration)
        update_data_protection_settings(input)
      end

      def update_data_protection_settings(input : Types::UpdateDataProtectionSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_PROTECTION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the identity provider.

      def update_identity_provider(
        identity_provider_arn : String,
        client_token : String? = nil,
        identity_provider_details : Hash(String, String)? = nil,
        identity_provider_name : String? = nil,
        identity_provider_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIdentityProviderRequest.new(identity_provider_arn: identity_provider_arn, client_token: client_token, identity_provider_details: identity_provider_details, identity_provider_name: identity_provider_name, identity_provider_type: identity_provider_type)
        update_identity_provider(input)
      end

      def update_identity_provider(input : Types::UpdateIdentityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IDENTITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates IP access settings.

      def update_ip_access_settings(
        ip_access_settings_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        ip_rules : Array(Types::IpRule)? = nil
      ) : Protocol::Request
        input = Types::UpdateIpAccessSettingsRequest.new(ip_access_settings_arn: ip_access_settings_arn, client_token: client_token, description: description, display_name: display_name, ip_rules: ip_rules)
        update_ip_access_settings(input)
      end

      def update_ip_access_settings(input : Types::UpdateIpAccessSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IP_ACCESS_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates network settings.

      def update_network_settings(
        network_settings_arn : String,
        client_token : String? = nil,
        security_group_ids : Array(String)? = nil,
        subnet_ids : Array(String)? = nil,
        vpc_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateNetworkSettingsRequest.new(network_settings_arn: network_settings_arn, client_token: client_token, security_group_ids: security_group_ids, subnet_ids: subnet_ids, vpc_id: vpc_id)
        update_network_settings(input)
      end

      def update_network_settings(input : Types::UpdateNetworkSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NETWORK_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a web portal.

      def update_portal(
        portal_arn : String,
        authentication_type : String? = nil,
        display_name : String? = nil,
        instance_type : String? = nil,
        max_concurrent_sessions : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdatePortalRequest.new(portal_arn: portal_arn, authentication_type: authentication_type, display_name: display_name, instance_type: instance_type, max_concurrent_sessions: max_concurrent_sessions)
        update_portal(input)
      end

      def update_portal(input : Types::UpdatePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the details of a session logger.

      def update_session_logger(
        session_logger_arn : String,
        display_name : String? = nil,
        event_filter : Types::EventFilter? = nil,
        log_configuration : Types::LogConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateSessionLoggerRequest.new(session_logger_arn: session_logger_arn, display_name: display_name, event_filter: event_filter, log_configuration: log_configuration)
        update_session_logger(input)
      end

      def update_session_logger(input : Types::UpdateSessionLoggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SESSION_LOGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the trust store.

      def update_trust_store(
        trust_store_arn : String,
        certificates_to_add : Array(Bytes)? = nil,
        certificates_to_delete : Array(String)? = nil,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTrustStoreRequest.new(trust_store_arn: trust_store_arn, certificates_to_add: certificates_to_add, certificates_to_delete: certificates_to_delete, client_token: client_token)
        update_trust_store(input)
      end

      def update_trust_store(input : Types::UpdateTrustStoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TRUST_STORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the user access logging settings.

      def update_user_access_logging_settings(
        user_access_logging_settings_arn : String,
        client_token : String? = nil,
        kinesis_stream_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserAccessLoggingSettingsRequest.new(user_access_logging_settings_arn: user_access_logging_settings_arn, client_token: client_token, kinesis_stream_arn: kinesis_stream_arn)
        update_user_access_logging_settings(input)
      end

      def update_user_access_logging_settings(input : Types::UpdateUserAccessLoggingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_ACCESS_LOGGING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the user settings.

      def update_user_settings(
        user_settings_arn : String,
        branding_configuration_input : Types::BrandingConfigurationUpdateInput? = nil,
        client_token : String? = nil,
        cookie_synchronization_configuration : Types::CookieSynchronizationConfiguration? = nil,
        copy_allowed : String? = nil,
        deep_link_allowed : String? = nil,
        disconnect_timeout_in_minutes : Int32? = nil,
        download_allowed : String? = nil,
        idle_disconnect_timeout_in_minutes : Int32? = nil,
        paste_allowed : String? = nil,
        print_allowed : String? = nil,
        toolbar_configuration : Types::ToolbarConfiguration? = nil,
        upload_allowed : String? = nil,
        web_authn_allowed : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserSettingsRequest.new(user_settings_arn: user_settings_arn, branding_configuration_input: branding_configuration_input, client_token: client_token, cookie_synchronization_configuration: cookie_synchronization_configuration, copy_allowed: copy_allowed, deep_link_allowed: deep_link_allowed, disconnect_timeout_in_minutes: disconnect_timeout_in_minutes, download_allowed: download_allowed, idle_disconnect_timeout_in_minutes: idle_disconnect_timeout_in_minutes, paste_allowed: paste_allowed, print_allowed: print_allowed, toolbar_configuration: toolbar_configuration, upload_allowed: upload_allowed, web_authn_allowed: web_authn_allowed)
        update_user_settings(input)
      end

      def update_user_settings(input : Types::UpdateUserSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
