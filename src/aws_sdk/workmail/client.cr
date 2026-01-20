module AwsSdk
  module WorkMail
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

      # Adds a member (user or group) to the resource's set of delegates.

      def associate_delegate_to_resource(
        entity_id : String,
        organization_id : String,
        resource_id : String
      ) : Types::AssociateDelegateToResourceResponse

        input = Types::AssociateDelegateToResourceRequest.new(entity_id: entity_id, organization_id: organization_id, resource_id: resource_id)
        associate_delegate_to_resource(input)
      end

      def associate_delegate_to_resource(input : Types::AssociateDelegateToResourceRequest) : Types::AssociateDelegateToResourceResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_DELEGATE_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateDelegateToResourceResponse, "AssociateDelegateToResource")
      end

      # Adds a member (user or group) to the group's set.

      def associate_member_to_group(
        group_id : String,
        member_id : String,
        organization_id : String
      ) : Types::AssociateMemberToGroupResponse

        input = Types::AssociateMemberToGroupRequest.new(group_id: group_id, member_id: member_id, organization_id: organization_id)
        associate_member_to_group(input)
      end

      def associate_member_to_group(input : Types::AssociateMemberToGroupRequest) : Types::AssociateMemberToGroupResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_MEMBER_TO_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateMemberToGroupResponse, "AssociateMemberToGroup")
      end

      # Assumes an impersonation role for the given WorkMail organization. This method returns an
      # authentication token you can use to make impersonated calls.

      def assume_impersonation_role(
        impersonation_role_id : String,
        organization_id : String
      ) : Types::AssumeImpersonationRoleResponse

        input = Types::AssumeImpersonationRoleRequest.new(impersonation_role_id: impersonation_role_id, organization_id: organization_id)
        assume_impersonation_role(input)
      end

      def assume_impersonation_role(input : Types::AssumeImpersonationRoleRequest) : Types::AssumeImpersonationRoleResponse
        request = Protocol::JsonRpc.build_request(Model::ASSUME_IMPERSONATION_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssumeImpersonationRoleResponse, "AssumeImpersonationRole")
      end

      # Cancels a mailbox export job. If the mailbox export job is near completion, it might not be possible
      # to cancel it.

      def cancel_mailbox_export_job(
        client_token : String,
        job_id : String,
        organization_id : String
      ) : Types::CancelMailboxExportJobResponse

        input = Types::CancelMailboxExportJobRequest.new(client_token: client_token, job_id: job_id, organization_id: organization_id)
        cancel_mailbox_export_job(input)
      end

      def cancel_mailbox_export_job(input : Types::CancelMailboxExportJobRequest) : Types::CancelMailboxExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_MAILBOX_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelMailboxExportJobResponse, "CancelMailboxExportJob")
      end

      # Adds an alias to the set of a given member (user or group) of WorkMail.

      def create_alias(
        alias_ : String,
        entity_id : String,
        organization_id : String
      ) : Types::CreateAliasResponse

        input = Types::CreateAliasRequest.new(alias_: alias_, entity_id: entity_id, organization_id: organization_id)
        create_alias(input)
      end

      def create_alias(input : Types::CreateAliasRequest) : Types::CreateAliasResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAliasResponse, "CreateAlias")
      end

      # Creates an AvailabilityConfiguration for the given WorkMail organization and domain.

      def create_availability_configuration(
        domain_name : String,
        organization_id : String,
        client_token : String? = nil,
        ews_provider : Types::EwsAvailabilityProvider? = nil,
        lambda_provider : Types::LambdaAvailabilityProvider? = nil
      ) : Types::CreateAvailabilityConfigurationResponse

        input = Types::CreateAvailabilityConfigurationRequest.new(domain_name: domain_name, organization_id: organization_id, client_token: client_token, ews_provider: ews_provider, lambda_provider: lambda_provider)
        create_availability_configuration(input)
      end

      def create_availability_configuration(input : Types::CreateAvailabilityConfigurationRequest) : Types::CreateAvailabilityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AVAILABILITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAvailabilityConfigurationResponse, "CreateAvailabilityConfiguration")
      end

      # Creates a group that can be used in WorkMail by calling the RegisterToWorkMail operation.

      def create_group(
        name : String,
        organization_id : String,
        hidden_from_global_address_list : Bool? = nil
      ) : Types::CreateGroupResponse

        input = Types::CreateGroupRequest.new(name: name, organization_id: organization_id, hidden_from_global_address_list: hidden_from_global_address_list)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupRequest) : Types::CreateGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGroupResponse, "CreateGroup")
      end

      # Creates the WorkMail application in IAM Identity Center that can be used later in the WorkMail - IdC
      # integration. For more information, see PutIdentityProviderConfiguration. This action does not affect
      # the authentication settings for any WorkMail organizations.

      def create_identity_center_application(
        instance_arn : String,
        name : String,
        client_token : String? = nil
      ) : Types::CreateIdentityCenterApplicationResponse

        input = Types::CreateIdentityCenterApplicationRequest.new(instance_arn: instance_arn, name: name, client_token: client_token)
        create_identity_center_application(input)
      end

      def create_identity_center_application(input : Types::CreateIdentityCenterApplicationRequest) : Types::CreateIdentityCenterApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_IDENTITY_CENTER_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIdentityCenterApplicationResponse, "CreateIdentityCenterApplication")
      end

      # Creates an impersonation role for the given WorkMail organization. Idempotency ensures that an API
      # request completes no more than one time. With an idempotent request, if the original request
      # completes successfully, any subsequent retries also complete successfully without performing any
      # further actions.

      def create_impersonation_role(
        name : String,
        organization_id : String,
        rules : Array(Types::ImpersonationRule),
        type : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::CreateImpersonationRoleResponse

        input = Types::CreateImpersonationRoleRequest.new(name: name, organization_id: organization_id, rules: rules, type: type, client_token: client_token, description: description)
        create_impersonation_role(input)
      end

      def create_impersonation_role(input : Types::CreateImpersonationRoleRequest) : Types::CreateImpersonationRoleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_IMPERSONATION_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateImpersonationRoleResponse, "CreateImpersonationRole")
      end

      # Creates a new mobile device access rule for the specified WorkMail organization.

      def create_mobile_device_access_rule(
        effect : String,
        name : String,
        organization_id : String,
        client_token : String? = nil,
        description : String? = nil,
        device_models : Array(String)? = nil,
        device_operating_systems : Array(String)? = nil,
        device_types : Array(String)? = nil,
        device_user_agents : Array(String)? = nil,
        not_device_models : Array(String)? = nil,
        not_device_operating_systems : Array(String)? = nil,
        not_device_types : Array(String)? = nil,
        not_device_user_agents : Array(String)? = nil
      ) : Types::CreateMobileDeviceAccessRuleResponse

        input = Types::CreateMobileDeviceAccessRuleRequest.new(effect: effect, name: name, organization_id: organization_id, client_token: client_token, description: description, device_models: device_models, device_operating_systems: device_operating_systems, device_types: device_types, device_user_agents: device_user_agents, not_device_models: not_device_models, not_device_operating_systems: not_device_operating_systems, not_device_types: not_device_types, not_device_user_agents: not_device_user_agents)
        create_mobile_device_access_rule(input)
      end

      def create_mobile_device_access_rule(input : Types::CreateMobileDeviceAccessRuleRequest) : Types::CreateMobileDeviceAccessRuleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MOBILE_DEVICE_ACCESS_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMobileDeviceAccessRuleResponse, "CreateMobileDeviceAccessRule")
      end

      # Creates a new WorkMail organization. Optionally, you can choose to associate an existing AWS
      # Directory Service directory with your organization. If an AWS Directory Service directory ID is
      # specified, the organization alias must match the directory alias. If you choose not to associate an
      # existing directory with your organization, then we create a new WorkMail directory for you. For more
      # information, see Adding an organization in the WorkMail Administrator Guide . You can associate
      # multiple email domains with an organization, then choose your default email domain from the WorkMail
      # console. You can also associate a domain that is managed in an Amazon Route 53 public hosted zone.
      # For more information, see Adding a domain and Choosing the default domain in the WorkMail
      # Administrator Guide . Optionally, you can use a customer managed key from AWS Key Management Service
      # (AWS KMS) to encrypt email for your organization. If you don't associate an AWS KMS key, WorkMail
      # creates a default, AWS managed key for you.

      def create_organization(
        alias_ : String,
        client_token : String? = nil,
        directory_id : String? = nil,
        domains : Array(Types::Domain)? = nil,
        enable_interoperability : Bool? = nil,
        kms_key_arn : String? = nil
      ) : Types::CreateOrganizationResponse

        input = Types::CreateOrganizationRequest.new(alias_: alias_, client_token: client_token, directory_id: directory_id, domains: domains, enable_interoperability: enable_interoperability, kms_key_arn: kms_key_arn)
        create_organization(input)
      end

      def create_organization(input : Types::CreateOrganizationRequest) : Types::CreateOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOrganizationResponse, "CreateOrganization")
      end

      # Creates a new WorkMail resource.

      def create_resource(
        name : String,
        organization_id : String,
        type : String,
        description : String? = nil,
        hidden_from_global_address_list : Bool? = nil
      ) : Types::CreateResourceResponse

        input = Types::CreateResourceRequest.new(name: name, organization_id: organization_id, type: type, description: description, hidden_from_global_address_list: hidden_from_global_address_list)
        create_resource(input)
      end

      def create_resource(input : Types::CreateResourceRequest) : Types::CreateResourceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResourceResponse, "CreateResource")
      end

      # Creates a user who can be used in WorkMail by calling the RegisterToWorkMail operation.

      def create_user(
        display_name : String,
        name : String,
        organization_id : String,
        first_name : String? = nil,
        hidden_from_global_address_list : Bool? = nil,
        identity_provider_user_id : String? = nil,
        last_name : String? = nil,
        password : String? = nil,
        role : String? = nil
      ) : Types::CreateUserResponse

        input = Types::CreateUserRequest.new(display_name: display_name, name: name, organization_id: organization_id, first_name: first_name, hidden_from_global_address_list: hidden_from_global_address_list, identity_provider_user_id: identity_provider_user_id, last_name: last_name, password: password, role: role)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Types::CreateUserResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserResponse, "CreateUser")
      end

      # Deletes an access control rule for the specified WorkMail organization. Deleting already deleted and
      # non-existing rules does not produce an error. In those cases, the service sends back an HTTP 200
      # response with an empty HTTP body.

      def delete_access_control_rule(
        name : String,
        organization_id : String
      ) : Types::DeleteAccessControlRuleResponse

        input = Types::DeleteAccessControlRuleRequest.new(name: name, organization_id: organization_id)
        delete_access_control_rule(input)
      end

      def delete_access_control_rule(input : Types::DeleteAccessControlRuleRequest) : Types::DeleteAccessControlRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCESS_CONTROL_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAccessControlRuleResponse, "DeleteAccessControlRule")
      end

      # Remove one or more specified aliases from a set of aliases for a given user.

      def delete_alias(
        alias_ : String,
        entity_id : String,
        organization_id : String
      ) : Types::DeleteAliasResponse

        input = Types::DeleteAliasRequest.new(alias_: alias_, entity_id: entity_id, organization_id: organization_id)
        delete_alias(input)
      end

      def delete_alias(input : Types::DeleteAliasRequest) : Types::DeleteAliasResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAliasResponse, "DeleteAlias")
      end

      # Deletes the AvailabilityConfiguration for the given WorkMail organization and domain.

      def delete_availability_configuration(
        domain_name : String,
        organization_id : String
      ) : Types::DeleteAvailabilityConfigurationResponse

        input = Types::DeleteAvailabilityConfigurationRequest.new(domain_name: domain_name, organization_id: organization_id)
        delete_availability_configuration(input)
      end

      def delete_availability_configuration(input : Types::DeleteAvailabilityConfigurationRequest) : Types::DeleteAvailabilityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_AVAILABILITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAvailabilityConfigurationResponse, "DeleteAvailabilityConfiguration")
      end

      # Deletes the email monitoring configuration for a specified organization.

      def delete_email_monitoring_configuration(
        organization_id : String
      ) : Types::DeleteEmailMonitoringConfigurationResponse

        input = Types::DeleteEmailMonitoringConfigurationRequest.new(organization_id: organization_id)
        delete_email_monitoring_configuration(input)
      end

      def delete_email_monitoring_configuration(input : Types::DeleteEmailMonitoringConfigurationRequest) : Types::DeleteEmailMonitoringConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EMAIL_MONITORING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEmailMonitoringConfigurationResponse, "DeleteEmailMonitoringConfiguration")
      end

      # Deletes a group from WorkMail.

      def delete_group(
        group_id : String,
        organization_id : String
      ) : Types::DeleteGroupResponse

        input = Types::DeleteGroupRequest.new(group_id: group_id, organization_id: organization_id)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Types::DeleteGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGroupResponse, "DeleteGroup")
      end

      # Deletes the IAM Identity Center application from WorkMail. This action does not affect the
      # authentication settings for any WorkMail organizations.

      def delete_identity_center_application(
        application_arn : String
      ) : Types::DeleteIdentityCenterApplicationResponse

        input = Types::DeleteIdentityCenterApplicationRequest.new(application_arn: application_arn)
        delete_identity_center_application(input)
      end

      def delete_identity_center_application(input : Types::DeleteIdentityCenterApplicationRequest) : Types::DeleteIdentityCenterApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IDENTITY_CENTER_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIdentityCenterApplicationResponse, "DeleteIdentityCenterApplication")
      end

      # Disables the integration between IdC and WorkMail. Authentication will continue with the directory
      # as it was before the IdC integration. You might have to reset your directory passwords and
      # reconfigure your desktop and mobile email clients.

      def delete_identity_provider_configuration(
        organization_id : String
      ) : Types::DeleteIdentityProviderConfigurationResponse

        input = Types::DeleteIdentityProviderConfigurationRequest.new(organization_id: organization_id)
        delete_identity_provider_configuration(input)
      end

      def delete_identity_provider_configuration(input : Types::DeleteIdentityProviderConfigurationRequest) : Types::DeleteIdentityProviderConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IDENTITY_PROVIDER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIdentityProviderConfigurationResponse, "DeleteIdentityProviderConfiguration")
      end

      # Deletes an impersonation role for the given WorkMail organization.

      def delete_impersonation_role(
        impersonation_role_id : String,
        organization_id : String
      ) : Types::DeleteImpersonationRoleResponse

        input = Types::DeleteImpersonationRoleRequest.new(impersonation_role_id: impersonation_role_id, organization_id: organization_id)
        delete_impersonation_role(input)
      end

      def delete_impersonation_role(input : Types::DeleteImpersonationRoleRequest) : Types::DeleteImpersonationRoleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IMPERSONATION_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteImpersonationRoleResponse, "DeleteImpersonationRole")
      end

      # Deletes permissions granted to a member (user or group).

      def delete_mailbox_permissions(
        entity_id : String,
        grantee_id : String,
        organization_id : String
      ) : Types::DeleteMailboxPermissionsResponse

        input = Types::DeleteMailboxPermissionsRequest.new(entity_id: entity_id, grantee_id: grantee_id, organization_id: organization_id)
        delete_mailbox_permissions(input)
      end

      def delete_mailbox_permissions(input : Types::DeleteMailboxPermissionsRequest) : Types::DeleteMailboxPermissionsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MAILBOX_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMailboxPermissionsResponse, "DeleteMailboxPermissions")
      end

      # Deletes the mobile device access override for the given WorkMail organization, user, and device.
      # Deleting already deleted and non-existing overrides does not produce an error. In those cases, the
      # service sends back an HTTP 200 response with an empty HTTP body.

      def delete_mobile_device_access_override(
        device_id : String,
        organization_id : String,
        user_id : String
      ) : Types::DeleteMobileDeviceAccessOverrideResponse

        input = Types::DeleteMobileDeviceAccessOverrideRequest.new(device_id: device_id, organization_id: organization_id, user_id: user_id)
        delete_mobile_device_access_override(input)
      end

      def delete_mobile_device_access_override(input : Types::DeleteMobileDeviceAccessOverrideRequest) : Types::DeleteMobileDeviceAccessOverrideResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MOBILE_DEVICE_ACCESS_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMobileDeviceAccessOverrideResponse, "DeleteMobileDeviceAccessOverride")
      end

      # Deletes a mobile device access rule for the specified WorkMail organization. Deleting already
      # deleted and non-existing rules does not produce an error. In those cases, the service sends back an
      # HTTP 200 response with an empty HTTP body.

      def delete_mobile_device_access_rule(
        mobile_device_access_rule_id : String,
        organization_id : String
      ) : Types::DeleteMobileDeviceAccessRuleResponse

        input = Types::DeleteMobileDeviceAccessRuleRequest.new(mobile_device_access_rule_id: mobile_device_access_rule_id, organization_id: organization_id)
        delete_mobile_device_access_rule(input)
      end

      def delete_mobile_device_access_rule(input : Types::DeleteMobileDeviceAccessRuleRequest) : Types::DeleteMobileDeviceAccessRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MOBILE_DEVICE_ACCESS_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMobileDeviceAccessRuleResponse, "DeleteMobileDeviceAccessRule")
      end

      # Deletes an WorkMail organization and all underlying AWS resources managed by WorkMail as part of the
      # organization. You can choose whether to delete the associated directory. For more information, see
      # Removing an organization in the WorkMail Administrator Guide .

      def delete_organization(
        delete_directory : Bool,
        organization_id : String,
        client_token : String? = nil,
        delete_identity_center_application : Bool? = nil,
        force_delete : Bool? = nil
      ) : Types::DeleteOrganizationResponse

        input = Types::DeleteOrganizationRequest.new(delete_directory: delete_directory, organization_id: organization_id, client_token: client_token, delete_identity_center_application: delete_identity_center_application, force_delete: force_delete)
        delete_organization(input)
      end

      def delete_organization(input : Types::DeleteOrganizationRequest) : Types::DeleteOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOrganizationResponse, "DeleteOrganization")
      end

      # Deletes the Personal Access Token from the provided WorkMail Organization.

      def delete_personal_access_token(
        organization_id : String,
        personal_access_token_id : String
      ) : Types::DeletePersonalAccessTokenResponse

        input = Types::DeletePersonalAccessTokenRequest.new(organization_id: organization_id, personal_access_token_id: personal_access_token_id)
        delete_personal_access_token(input)
      end

      def delete_personal_access_token(input : Types::DeletePersonalAccessTokenRequest) : Types::DeletePersonalAccessTokenResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PERSONAL_ACCESS_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePersonalAccessTokenResponse, "DeletePersonalAccessToken")
      end

      # Deletes the specified resource.

      def delete_resource(
        organization_id : String,
        resource_id : String
      ) : Types::DeleteResourceResponse

        input = Types::DeleteResourceRequest.new(organization_id: organization_id, resource_id: resource_id)
        delete_resource(input)
      end

      def delete_resource(input : Types::DeleteResourceRequest) : Types::DeleteResourceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourceResponse, "DeleteResource")
      end

      # Deletes the specified retention policy from the specified organization.

      def delete_retention_policy(
        id : String,
        organization_id : String
      ) : Types::DeleteRetentionPolicyResponse

        input = Types::DeleteRetentionPolicyRequest.new(id: id, organization_id: organization_id)
        delete_retention_policy(input)
      end

      def delete_retention_policy(input : Types::DeleteRetentionPolicyRequest) : Types::DeleteRetentionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RETENTION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRetentionPolicyResponse, "DeleteRetentionPolicy")
      end

      # Deletes a user from WorkMail and all subsequent systems. Before you can delete a user, the user
      # state must be DISABLED . Use the DescribeUser action to confirm the user state. Deleting a user is
      # permanent and cannot be undone. WorkMail archives user mailboxes for 30 days before they are
      # permanently removed.

      def delete_user(
        organization_id : String,
        user_id : String
      ) : Types::DeleteUserResponse

        input = Types::DeleteUserRequest.new(organization_id: organization_id, user_id: user_id)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Types::DeleteUserResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserResponse, "DeleteUser")
      end

      # Mark a user, group, or resource as no longer used in WorkMail. This action disassociates the mailbox
      # and schedules it for clean-up. WorkMail keeps mailboxes for 30 days before they are permanently
      # removed. The functionality in the console is Disable .

      def deregister_from_work_mail(
        entity_id : String,
        organization_id : String
      ) : Types::DeregisterFromWorkMailResponse

        input = Types::DeregisterFromWorkMailRequest.new(entity_id: entity_id, organization_id: organization_id)
        deregister_from_work_mail(input)
      end

      def deregister_from_work_mail(input : Types::DeregisterFromWorkMailRequest) : Types::DeregisterFromWorkMailResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_FROM_WORK_MAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterFromWorkMailResponse, "DeregisterFromWorkMail")
      end

      # Removes a domain from WorkMail, stops email routing to WorkMail, and removes the authorization
      # allowing WorkMail use. SES keeps the domain because other applications may use it. You must first
      # remove any email address used by WorkMail entities before you remove the domain.

      def deregister_mail_domain(
        domain_name : String,
        organization_id : String
      ) : Types::DeregisterMailDomainResponse

        input = Types::DeregisterMailDomainRequest.new(domain_name: domain_name, organization_id: organization_id)
        deregister_mail_domain(input)
      end

      def deregister_mail_domain(input : Types::DeregisterMailDomainRequest) : Types::DeregisterMailDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_MAIL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterMailDomainResponse, "DeregisterMailDomain")
      end

      # Describes the current email monitoring configuration for a specified organization.

      def describe_email_monitoring_configuration(
        organization_id : String
      ) : Types::DescribeEmailMonitoringConfigurationResponse

        input = Types::DescribeEmailMonitoringConfigurationRequest.new(organization_id: organization_id)
        describe_email_monitoring_configuration(input)
      end

      def describe_email_monitoring_configuration(input : Types::DescribeEmailMonitoringConfigurationRequest) : Types::DescribeEmailMonitoringConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EMAIL_MONITORING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEmailMonitoringConfigurationResponse, "DescribeEmailMonitoringConfiguration")
      end

      # Returns basic details about an entity in WorkMail.

      def describe_entity(
        email : String,
        organization_id : String
      ) : Types::DescribeEntityResponse

        input = Types::DescribeEntityRequest.new(email: email, organization_id: organization_id)
        describe_entity(input)
      end

      def describe_entity(input : Types::DescribeEntityRequest) : Types::DescribeEntityResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntityResponse, "DescribeEntity")
      end

      # Returns the data available for the group.

      def describe_group(
        group_id : String,
        organization_id : String
      ) : Types::DescribeGroupResponse

        input = Types::DescribeGroupRequest.new(group_id: group_id, organization_id: organization_id)
        describe_group(input)
      end

      def describe_group(input : Types::DescribeGroupRequest) : Types::DescribeGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeGroupResponse, "DescribeGroup")
      end

      # Returns detailed information on the current IdC setup for the WorkMail organization.

      def describe_identity_provider_configuration(
        organization_id : String
      ) : Types::DescribeIdentityProviderConfigurationResponse

        input = Types::DescribeIdentityProviderConfigurationRequest.new(organization_id: organization_id)
        describe_identity_provider_configuration(input)
      end

      def describe_identity_provider_configuration(input : Types::DescribeIdentityProviderConfigurationRequest) : Types::DescribeIdentityProviderConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IDENTITY_PROVIDER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeIdentityProviderConfigurationResponse, "DescribeIdentityProviderConfiguration")
      end

      # Lists the settings in a DMARC policy for a specified organization.

      def describe_inbound_dmarc_settings(
        organization_id : String
      ) : Types::DescribeInboundDmarcSettingsResponse

        input = Types::DescribeInboundDmarcSettingsRequest.new(organization_id: organization_id)
        describe_inbound_dmarc_settings(input)
      end

      def describe_inbound_dmarc_settings(input : Types::DescribeInboundDmarcSettingsRequest) : Types::DescribeInboundDmarcSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INBOUND_DMARC_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInboundDmarcSettingsResponse, "DescribeInboundDmarcSettings")
      end

      # Describes the current status of a mailbox export job.

      def describe_mailbox_export_job(
        job_id : String,
        organization_id : String
      ) : Types::DescribeMailboxExportJobResponse

        input = Types::DescribeMailboxExportJobRequest.new(job_id: job_id, organization_id: organization_id)
        describe_mailbox_export_job(input)
      end

      def describe_mailbox_export_job(input : Types::DescribeMailboxExportJobRequest) : Types::DescribeMailboxExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAILBOX_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMailboxExportJobResponse, "DescribeMailboxExportJob")
      end

      # Provides more information regarding a given organization based on its identifier.

      def describe_organization(
        organization_id : String
      ) : Types::DescribeOrganizationResponse

        input = Types::DescribeOrganizationRequest.new(organization_id: organization_id)
        describe_organization(input)
      end

      def describe_organization(input : Types::DescribeOrganizationRequest) : Types::DescribeOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrganizationResponse, "DescribeOrganization")
      end

      # Returns the data available for the resource.

      def describe_resource(
        organization_id : String,
        resource_id : String
      ) : Types::DescribeResourceResponse

        input = Types::DescribeResourceRequest.new(organization_id: organization_id, resource_id: resource_id)
        describe_resource(input)
      end

      def describe_resource(input : Types::DescribeResourceRequest) : Types::DescribeResourceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeResourceResponse, "DescribeResource")
      end

      # Provides information regarding the user.

      def describe_user(
        organization_id : String,
        user_id : String
      ) : Types::DescribeUserResponse

        input = Types::DescribeUserRequest.new(organization_id: organization_id, user_id: user_id)
        describe_user(input)
      end

      def describe_user(input : Types::DescribeUserRequest) : Types::DescribeUserResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserResponse, "DescribeUser")
      end

      # Removes a member from the resource's set of delegates.

      def disassociate_delegate_from_resource(
        entity_id : String,
        organization_id : String,
        resource_id : String
      ) : Types::DisassociateDelegateFromResourceResponse

        input = Types::DisassociateDelegateFromResourceRequest.new(entity_id: entity_id, organization_id: organization_id, resource_id: resource_id)
        disassociate_delegate_from_resource(input)
      end

      def disassociate_delegate_from_resource(input : Types::DisassociateDelegateFromResourceRequest) : Types::DisassociateDelegateFromResourceResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_DELEGATE_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateDelegateFromResourceResponse, "DisassociateDelegateFromResource")
      end

      # Removes a member from a group.

      def disassociate_member_from_group(
        group_id : String,
        member_id : String,
        organization_id : String
      ) : Types::DisassociateMemberFromGroupResponse

        input = Types::DisassociateMemberFromGroupRequest.new(group_id: group_id, member_id: member_id, organization_id: organization_id)
        disassociate_member_from_group(input)
      end

      def disassociate_member_from_group(input : Types::DisassociateMemberFromGroupRequest) : Types::DisassociateMemberFromGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_MEMBER_FROM_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateMemberFromGroupResponse, "DisassociateMemberFromGroup")
      end

      # Gets the effects of an organization's access control rules as they apply to a specified IPv4
      # address, access protocol action, and user ID or impersonation role ID. You must provide either the
      # user ID or impersonation role ID. Impersonation role ID can only be used with Action EWS.

      def get_access_control_effect(
        action : String,
        ip_address : String,
        organization_id : String,
        impersonation_role_id : String? = nil,
        user_id : String? = nil
      ) : Types::GetAccessControlEffectResponse

        input = Types::GetAccessControlEffectRequest.new(action: action, ip_address: ip_address, organization_id: organization_id, impersonation_role_id: impersonation_role_id, user_id: user_id)
        get_access_control_effect(input)
      end

      def get_access_control_effect(input : Types::GetAccessControlEffectRequest) : Types::GetAccessControlEffectResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCESS_CONTROL_EFFECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccessControlEffectResponse, "GetAccessControlEffect")
      end

      # Gets the default retention policy details for the specified organization.

      def get_default_retention_policy(
        organization_id : String
      ) : Types::GetDefaultRetentionPolicyResponse

        input = Types::GetDefaultRetentionPolicyRequest.new(organization_id: organization_id)
        get_default_retention_policy(input)
      end

      def get_default_retention_policy(input : Types::GetDefaultRetentionPolicyRequest) : Types::GetDefaultRetentionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DEFAULT_RETENTION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDefaultRetentionPolicyResponse, "GetDefaultRetentionPolicy")
      end

      # Gets the impersonation role details for the given WorkMail organization.

      def get_impersonation_role(
        impersonation_role_id : String,
        organization_id : String
      ) : Types::GetImpersonationRoleResponse

        input = Types::GetImpersonationRoleRequest.new(impersonation_role_id: impersonation_role_id, organization_id: organization_id)
        get_impersonation_role(input)
      end

      def get_impersonation_role(input : Types::GetImpersonationRoleRequest) : Types::GetImpersonationRoleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IMPERSONATION_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetImpersonationRoleResponse, "GetImpersonationRole")
      end

      # Tests whether the given impersonation role can impersonate a target user.

      def get_impersonation_role_effect(
        impersonation_role_id : String,
        organization_id : String,
        target_user : String
      ) : Types::GetImpersonationRoleEffectResponse

        input = Types::GetImpersonationRoleEffectRequest.new(impersonation_role_id: impersonation_role_id, organization_id: organization_id, target_user: target_user)
        get_impersonation_role_effect(input)
      end

      def get_impersonation_role_effect(input : Types::GetImpersonationRoleEffectRequest) : Types::GetImpersonationRoleEffectResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IMPERSONATION_ROLE_EFFECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetImpersonationRoleEffectResponse, "GetImpersonationRoleEffect")
      end

      # Gets details for a mail domain, including domain records required to configure your domain with
      # recommended security.

      def get_mail_domain(
        domain_name : String,
        organization_id : String
      ) : Types::GetMailDomainResponse

        input = Types::GetMailDomainRequest.new(domain_name: domain_name, organization_id: organization_id)
        get_mail_domain(input)
      end

      def get_mail_domain(input : Types::GetMailDomainRequest) : Types::GetMailDomainResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MAIL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMailDomainResponse, "GetMailDomain")
      end

      # Requests a user's mailbox details for a specified organization and user.

      def get_mailbox_details(
        organization_id : String,
        user_id : String
      ) : Types::GetMailboxDetailsResponse

        input = Types::GetMailboxDetailsRequest.new(organization_id: organization_id, user_id: user_id)
        get_mailbox_details(input)
      end

      def get_mailbox_details(input : Types::GetMailboxDetailsRequest) : Types::GetMailboxDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MAILBOX_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMailboxDetailsResponse, "GetMailboxDetails")
      end

      # Simulates the effect of the mobile device access rules for the given attributes of a sample access
      # event. Use this method to test the effects of the current set of mobile device access rules for the
      # WorkMail organization for a particular user's attributes.

      def get_mobile_device_access_effect(
        organization_id : String,
        device_model : String? = nil,
        device_operating_system : String? = nil,
        device_type : String? = nil,
        device_user_agent : String? = nil
      ) : Types::GetMobileDeviceAccessEffectResponse

        input = Types::GetMobileDeviceAccessEffectRequest.new(organization_id: organization_id, device_model: device_model, device_operating_system: device_operating_system, device_type: device_type, device_user_agent: device_user_agent)
        get_mobile_device_access_effect(input)
      end

      def get_mobile_device_access_effect(input : Types::GetMobileDeviceAccessEffectRequest) : Types::GetMobileDeviceAccessEffectResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MOBILE_DEVICE_ACCESS_EFFECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMobileDeviceAccessEffectResponse, "GetMobileDeviceAccessEffect")
      end

      # Gets the mobile device access override for the given WorkMail organization, user, and device.

      def get_mobile_device_access_override(
        device_id : String,
        organization_id : String,
        user_id : String
      ) : Types::GetMobileDeviceAccessOverrideResponse

        input = Types::GetMobileDeviceAccessOverrideRequest.new(device_id: device_id, organization_id: organization_id, user_id: user_id)
        get_mobile_device_access_override(input)
      end

      def get_mobile_device_access_override(input : Types::GetMobileDeviceAccessOverrideRequest) : Types::GetMobileDeviceAccessOverrideResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MOBILE_DEVICE_ACCESS_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMobileDeviceAccessOverrideResponse, "GetMobileDeviceAccessOverride")
      end

      # Requests details of a specific Personal Access Token within the WorkMail organization.

      def get_personal_access_token_metadata(
        organization_id : String,
        personal_access_token_id : String
      ) : Types::GetPersonalAccessTokenMetadataResponse

        input = Types::GetPersonalAccessTokenMetadataRequest.new(organization_id: organization_id, personal_access_token_id: personal_access_token_id)
        get_personal_access_token_metadata(input)
      end

      def get_personal_access_token_metadata(input : Types::GetPersonalAccessTokenMetadataRequest) : Types::GetPersonalAccessTokenMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PERSONAL_ACCESS_TOKEN_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPersonalAccessTokenMetadataResponse, "GetPersonalAccessTokenMetadata")
      end

      # Lists the access control rules for the specified organization.

      def list_access_control_rules(
        organization_id : String
      ) : Types::ListAccessControlRulesResponse

        input = Types::ListAccessControlRulesRequest.new(organization_id: organization_id)
        list_access_control_rules(input)
      end

      def list_access_control_rules(input : Types::ListAccessControlRulesRequest) : Types::ListAccessControlRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCESS_CONTROL_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccessControlRulesResponse, "ListAccessControlRules")
      end

      # Creates a paginated call to list the aliases associated with a given entity.

      def list_aliases(
        entity_id : String,
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAliasesResponse

        input = Types::ListAliasesRequest.new(entity_id: entity_id, organization_id: organization_id, max_results: max_results, next_token: next_token)
        list_aliases(input)
      end

      def list_aliases(input : Types::ListAliasesRequest) : Types::ListAliasesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAliasesResponse, "ListAliases")
      end

      # List all the AvailabilityConfiguration 's for the given WorkMail organization.

      def list_availability_configurations(
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAvailabilityConfigurationsResponse

        input = Types::ListAvailabilityConfigurationsRequest.new(organization_id: organization_id, max_results: max_results, next_token: next_token)
        list_availability_configurations(input)
      end

      def list_availability_configurations(input : Types::ListAvailabilityConfigurationsRequest) : Types::ListAvailabilityConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AVAILABILITY_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAvailabilityConfigurationsResponse, "ListAvailabilityConfigurations")
      end

      # Returns an overview of the members of a group. Users and groups can be members of a group.

      def list_group_members(
        group_id : String,
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupMembersResponse

        input = Types::ListGroupMembersRequest.new(group_id: group_id, organization_id: organization_id, max_results: max_results, next_token: next_token)
        list_group_members(input)
      end

      def list_group_members(input : Types::ListGroupMembersRequest) : Types::ListGroupMembersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUP_MEMBERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupMembersResponse, "ListGroupMembers")
      end

      # Returns summaries of the organization's groups.

      def list_groups(
        organization_id : String,
        filters : Types::ListGroupsFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupsResponse

        input = Types::ListGroupsRequest.new(organization_id: organization_id, filters: filters, max_results: max_results, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Types::ListGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupsResponse, "ListGroups")
      end

      # Returns all the groups to which an entity belongs.

      def list_groups_for_entity(
        entity_id : String,
        organization_id : String,
        filters : Types::ListGroupsForEntityFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupsForEntityResponse

        input = Types::ListGroupsForEntityRequest.new(entity_id: entity_id, organization_id: organization_id, filters: filters, max_results: max_results, next_token: next_token)
        list_groups_for_entity(input)
      end

      def list_groups_for_entity(input : Types::ListGroupsForEntityRequest) : Types::ListGroupsForEntityResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUPS_FOR_ENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupsForEntityResponse, "ListGroupsForEntity")
      end

      # Lists all the impersonation roles for the given WorkMail organization.

      def list_impersonation_roles(
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListImpersonationRolesResponse

        input = Types::ListImpersonationRolesRequest.new(organization_id: organization_id, max_results: max_results, next_token: next_token)
        list_impersonation_roles(input)
      end

      def list_impersonation_roles(input : Types::ListImpersonationRolesRequest) : Types::ListImpersonationRolesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IMPERSONATION_ROLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListImpersonationRolesResponse, "ListImpersonationRoles")
      end

      # Lists the mail domains in a given WorkMail organization.

      def list_mail_domains(
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMailDomainsResponse

        input = Types::ListMailDomainsRequest.new(organization_id: organization_id, max_results: max_results, next_token: next_token)
        list_mail_domains(input)
      end

      def list_mail_domains(input : Types::ListMailDomainsRequest) : Types::ListMailDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MAIL_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMailDomainsResponse, "ListMailDomains")
      end

      # Lists the mailbox export jobs started for the specified organization within the last seven days.

      def list_mailbox_export_jobs(
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMailboxExportJobsResponse

        input = Types::ListMailboxExportJobsRequest.new(organization_id: organization_id, max_results: max_results, next_token: next_token)
        list_mailbox_export_jobs(input)
      end

      def list_mailbox_export_jobs(input : Types::ListMailboxExportJobsRequest) : Types::ListMailboxExportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MAILBOX_EXPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMailboxExportJobsResponse, "ListMailboxExportJobs")
      end

      # Lists the mailbox permissions associated with a user, group, or resource mailbox.

      def list_mailbox_permissions(
        entity_id : String,
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMailboxPermissionsResponse

        input = Types::ListMailboxPermissionsRequest.new(entity_id: entity_id, organization_id: organization_id, max_results: max_results, next_token: next_token)
        list_mailbox_permissions(input)
      end

      def list_mailbox_permissions(input : Types::ListMailboxPermissionsRequest) : Types::ListMailboxPermissionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MAILBOX_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMailboxPermissionsResponse, "ListMailboxPermissions")
      end

      # Lists all the mobile device access overrides for any given combination of WorkMail organization,
      # user, or device.

      def list_mobile_device_access_overrides(
        organization_id : String,
        device_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Types::ListMobileDeviceAccessOverridesResponse

        input = Types::ListMobileDeviceAccessOverridesRequest.new(organization_id: organization_id, device_id: device_id, max_results: max_results, next_token: next_token, user_id: user_id)
        list_mobile_device_access_overrides(input)
      end

      def list_mobile_device_access_overrides(input : Types::ListMobileDeviceAccessOverridesRequest) : Types::ListMobileDeviceAccessOverridesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MOBILE_DEVICE_ACCESS_OVERRIDES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMobileDeviceAccessOverridesResponse, "ListMobileDeviceAccessOverrides")
      end

      # Lists the mobile device access rules for the specified WorkMail organization.

      def list_mobile_device_access_rules(
        organization_id : String
      ) : Types::ListMobileDeviceAccessRulesResponse

        input = Types::ListMobileDeviceAccessRulesRequest.new(organization_id: organization_id)
        list_mobile_device_access_rules(input)
      end

      def list_mobile_device_access_rules(input : Types::ListMobileDeviceAccessRulesRequest) : Types::ListMobileDeviceAccessRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MOBILE_DEVICE_ACCESS_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMobileDeviceAccessRulesResponse, "ListMobileDeviceAccessRules")
      end

      # Returns summaries of the customer's organizations.

      def list_organizations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOrganizationsResponse

        input = Types::ListOrganizationsRequest.new(max_results: max_results, next_token: next_token)
        list_organizations(input)
      end

      def list_organizations(input : Types::ListOrganizationsRequest) : Types::ListOrganizationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ORGANIZATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOrganizationsResponse, "ListOrganizations")
      end

      # Returns a summary of your Personal Access Tokens.

      def list_personal_access_tokens(
        organization_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Types::ListPersonalAccessTokensResponse

        input = Types::ListPersonalAccessTokensRequest.new(organization_id: organization_id, max_results: max_results, next_token: next_token, user_id: user_id)
        list_personal_access_tokens(input)
      end

      def list_personal_access_tokens(input : Types::ListPersonalAccessTokensRequest) : Types::ListPersonalAccessTokensResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PERSONAL_ACCESS_TOKENS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPersonalAccessTokensResponse, "ListPersonalAccessTokens")
      end

      # Lists the delegates associated with a resource. Users and groups can be resource delegates and
      # answer requests on behalf of the resource.

      def list_resource_delegates(
        organization_id : String,
        resource_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceDelegatesResponse

        input = Types::ListResourceDelegatesRequest.new(organization_id: organization_id, resource_id: resource_id, max_results: max_results, next_token: next_token)
        list_resource_delegates(input)
      end

      def list_resource_delegates(input : Types::ListResourceDelegatesRequest) : Types::ListResourceDelegatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_DELEGATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceDelegatesResponse, "ListResourceDelegates")
      end

      # Returns summaries of the organization's resources.

      def list_resources(
        organization_id : String,
        filters : Types::ListResourcesFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourcesResponse

        input = Types::ListResourcesRequest.new(organization_id: organization_id, filters: filters, max_results: max_results, next_token: next_token)
        list_resources(input)
      end

      def list_resources(input : Types::ListResourcesRequest) : Types::ListResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourcesResponse, "ListResources")
      end

      # Lists the tags applied to an WorkMail organization resource.

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

      # Returns summaries of the organization's users.

      def list_users(
        organization_id : String,
        filters : Types::ListUsersFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUsersResponse

        input = Types::ListUsersRequest.new(organization_id: organization_id, filters: filters, max_results: max_results, next_token: next_token)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Types::ListUsersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsersResponse, "ListUsers")
      end

      # Adds a new access control rule for the specified organization. The rule allows or denies access to
      # the organization for the specified IPv4 addresses, access protocol actions, user IDs and
      # impersonation IDs. Adding a new rule with the same name as an existing rule replaces the older rule.

      def put_access_control_rule(
        description : String,
        effect : String,
        name : String,
        organization_id : String,
        actions : Array(String)? = nil,
        impersonation_role_ids : Array(String)? = nil,
        ip_ranges : Array(String)? = nil,
        not_actions : Array(String)? = nil,
        not_impersonation_role_ids : Array(String)? = nil,
        not_ip_ranges : Array(String)? = nil,
        not_user_ids : Array(String)? = nil,
        user_ids : Array(String)? = nil
      ) : Types::PutAccessControlRuleResponse

        input = Types::PutAccessControlRuleRequest.new(description: description, effect: effect, name: name, organization_id: organization_id, actions: actions, impersonation_role_ids: impersonation_role_ids, ip_ranges: ip_ranges, not_actions: not_actions, not_impersonation_role_ids: not_impersonation_role_ids, not_ip_ranges: not_ip_ranges, not_user_ids: not_user_ids, user_ids: user_ids)
        put_access_control_rule(input)
      end

      def put_access_control_rule(input : Types::PutAccessControlRuleRequest) : Types::PutAccessControlRuleResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ACCESS_CONTROL_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAccessControlRuleResponse, "PutAccessControlRule")
      end

      # Creates or updates the email monitoring configuration for a specified organization.

      def put_email_monitoring_configuration(
        log_group_arn : String,
        organization_id : String,
        role_arn : String? = nil
      ) : Types::PutEmailMonitoringConfigurationResponse

        input = Types::PutEmailMonitoringConfigurationRequest.new(log_group_arn: log_group_arn, organization_id: organization_id, role_arn: role_arn)
        put_email_monitoring_configuration(input)
      end

      def put_email_monitoring_configuration(input : Types::PutEmailMonitoringConfigurationRequest) : Types::PutEmailMonitoringConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_EMAIL_MONITORING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEmailMonitoringConfigurationResponse, "PutEmailMonitoringConfiguration")
      end

      # Enables integration between IAM Identity Center (IdC) and WorkMail to proxy authentication requests
      # for mailbox users. You can connect your IdC directory or your external directory to WorkMail through
      # IdC and manage access to WorkMail mailboxes in a single place. For enhanced protection, you could
      # enable Multifactor Authentication (MFA) and Personal Access Tokens.

      def put_identity_provider_configuration(
        authentication_mode : String,
        identity_center_configuration : Types::IdentityCenterConfiguration,
        organization_id : String,
        personal_access_token_configuration : Types::PersonalAccessTokenConfiguration
      ) : Types::PutIdentityProviderConfigurationResponse

        input = Types::PutIdentityProviderConfigurationRequest.new(authentication_mode: authentication_mode, identity_center_configuration: identity_center_configuration, organization_id: organization_id, personal_access_token_configuration: personal_access_token_configuration)
        put_identity_provider_configuration(input)
      end

      def put_identity_provider_configuration(input : Types::PutIdentityProviderConfigurationRequest) : Types::PutIdentityProviderConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_IDENTITY_PROVIDER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutIdentityProviderConfigurationResponse, "PutIdentityProviderConfiguration")
      end

      # Enables or disables a DMARC policy for a given organization.

      def put_inbound_dmarc_settings(
        enforced : Bool,
        organization_id : String
      ) : Types::PutInboundDmarcSettingsResponse

        input = Types::PutInboundDmarcSettingsRequest.new(enforced: enforced, organization_id: organization_id)
        put_inbound_dmarc_settings(input)
      end

      def put_inbound_dmarc_settings(input : Types::PutInboundDmarcSettingsRequest) : Types::PutInboundDmarcSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_INBOUND_DMARC_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutInboundDmarcSettingsResponse, "PutInboundDmarcSettings")
      end

      # Sets permissions for a user, group, or resource. This replaces any pre-existing permissions.

      def put_mailbox_permissions(
        entity_id : String,
        grantee_id : String,
        organization_id : String,
        permission_values : Array(String)
      ) : Types::PutMailboxPermissionsResponse

        input = Types::PutMailboxPermissionsRequest.new(entity_id: entity_id, grantee_id: grantee_id, organization_id: organization_id, permission_values: permission_values)
        put_mailbox_permissions(input)
      end

      def put_mailbox_permissions(input : Types::PutMailboxPermissionsRequest) : Types::PutMailboxPermissionsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_MAILBOX_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutMailboxPermissionsResponse, "PutMailboxPermissions")
      end

      # Creates or updates a mobile device access override for the given WorkMail organization, user, and
      # device.

      def put_mobile_device_access_override(
        device_id : String,
        effect : String,
        organization_id : String,
        user_id : String,
        description : String? = nil
      ) : Types::PutMobileDeviceAccessOverrideResponse

        input = Types::PutMobileDeviceAccessOverrideRequest.new(device_id: device_id, effect: effect, organization_id: organization_id, user_id: user_id, description: description)
        put_mobile_device_access_override(input)
      end

      def put_mobile_device_access_override(input : Types::PutMobileDeviceAccessOverrideRequest) : Types::PutMobileDeviceAccessOverrideResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_MOBILE_DEVICE_ACCESS_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutMobileDeviceAccessOverrideResponse, "PutMobileDeviceAccessOverride")
      end

      # Puts a retention policy to the specified organization.

      def put_retention_policy(
        folder_configurations : Array(Types::FolderConfiguration),
        name : String,
        organization_id : String,
        description : String? = nil,
        id : String? = nil
      ) : Types::PutRetentionPolicyResponse

        input = Types::PutRetentionPolicyRequest.new(folder_configurations: folder_configurations, name: name, organization_id: organization_id, description: description, id: id)
        put_retention_policy(input)
      end

      def put_retention_policy(input : Types::PutRetentionPolicyRequest) : Types::PutRetentionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RETENTION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRetentionPolicyResponse, "PutRetentionPolicy")
      end

      # Registers a new domain in WorkMail and SES, and configures it for use by WorkMail. Emails received
      # by SES for this domain are routed to the specified WorkMail organization, and WorkMail has permanent
      # permission to use the specified domain for sending your users' emails.

      def register_mail_domain(
        domain_name : String,
        organization_id : String,
        client_token : String? = nil
      ) : Types::RegisterMailDomainResponse

        input = Types::RegisterMailDomainRequest.new(domain_name: domain_name, organization_id: organization_id, client_token: client_token)
        register_mail_domain(input)
      end

      def register_mail_domain(input : Types::RegisterMailDomainRequest) : Types::RegisterMailDomainResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_MAIL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterMailDomainResponse, "RegisterMailDomain")
      end

      # Registers an existing and disabled user, group, or resource for WorkMail use by associating a
      # mailbox and calendaring capabilities. It performs no change if the user, group, or resource is
      # enabled and fails if the user, group, or resource is deleted. This operation results in the
      # accumulation of costs. For more information, see Pricing . The equivalent console functionality for
      # this operation is Enable . Users can either be created by calling the CreateUser API operation or
      # they can be synchronized from your directory. For more information, see DeregisterFromWorkMail .

      def register_to_work_mail(
        email : String,
        entity_id : String,
        organization_id : String
      ) : Types::RegisterToWorkMailResponse

        input = Types::RegisterToWorkMailRequest.new(email: email, entity_id: entity_id, organization_id: organization_id)
        register_to_work_mail(input)
      end

      def register_to_work_mail(input : Types::RegisterToWorkMailRequest) : Types::RegisterToWorkMailResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_TO_WORK_MAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterToWorkMailResponse, "RegisterToWorkMail")
      end

      # Allows the administrator to reset the password for a user.

      def reset_password(
        organization_id : String,
        password : String,
        user_id : String
      ) : Types::ResetPasswordResponse

        input = Types::ResetPasswordRequest.new(organization_id: organization_id, password: password, user_id: user_id)
        reset_password(input)
      end

      def reset_password(input : Types::ResetPasswordRequest) : Types::ResetPasswordResponse
        request = Protocol::JsonRpc.build_request(Model::RESET_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResetPasswordResponse, "ResetPassword")
      end

      # Starts a mailbox export job to export MIME-format email messages and calendar items from the
      # specified mailbox to the specified Amazon Simple Storage Service (Amazon S3) bucket. For more
      # information, see Exporting mailbox content in the WorkMail Administrator Guide .

      def start_mailbox_export_job(
        client_token : String,
        entity_id : String,
        kms_key_arn : String,
        organization_id : String,
        role_arn : String,
        s3_bucket_name : String,
        s3_prefix : String,
        description : String? = nil
      ) : Types::StartMailboxExportJobResponse

        input = Types::StartMailboxExportJobRequest.new(client_token: client_token, entity_id: entity_id, kms_key_arn: kms_key_arn, organization_id: organization_id, role_arn: role_arn, s3_bucket_name: s3_bucket_name, s3_prefix: s3_prefix, description: description)
        start_mailbox_export_job(input)
      end

      def start_mailbox_export_job(input : Types::StartMailboxExportJobRequest) : Types::StartMailboxExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_MAILBOX_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMailboxExportJobResponse, "StartMailboxExportJob")
      end

      # Applies the specified tags to the specified WorkMailorganization resource.

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

      # Performs a test on an availability provider to ensure that access is allowed. For EWS, it verifies
      # the provided credentials can be used to successfully log in. For Lambda, it verifies that the Lambda
      # function can be invoked and that the resource access policy was configured to deny anonymous access.
      # An anonymous invocation is one done without providing either a SourceArn or SourceAccount header.
      # The request must contain either one provider definition ( EwsProvider or LambdaProvider ) or the
      # DomainName parameter. If the DomainName parameter is provided, the configuration stored under the
      # DomainName will be tested.

      def test_availability_configuration(
        organization_id : String,
        domain_name : String? = nil,
        ews_provider : Types::EwsAvailabilityProvider? = nil,
        lambda_provider : Types::LambdaAvailabilityProvider? = nil
      ) : Types::TestAvailabilityConfigurationResponse

        input = Types::TestAvailabilityConfigurationRequest.new(organization_id: organization_id, domain_name: domain_name, ews_provider: ews_provider, lambda_provider: lambda_provider)
        test_availability_configuration(input)
      end

      def test_availability_configuration(input : Types::TestAvailabilityConfigurationRequest) : Types::TestAvailabilityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_AVAILABILITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestAvailabilityConfigurationResponse, "TestAvailabilityConfiguration")
      end

      # Untags the specified tags from the specified WorkMail organization resource.

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

      # Updates an existing AvailabilityConfiguration for the given WorkMail organization and domain.

      def update_availability_configuration(
        domain_name : String,
        organization_id : String,
        ews_provider : Types::EwsAvailabilityProvider? = nil,
        lambda_provider : Types::LambdaAvailabilityProvider? = nil
      ) : Types::UpdateAvailabilityConfigurationResponse

        input = Types::UpdateAvailabilityConfigurationRequest.new(domain_name: domain_name, organization_id: organization_id, ews_provider: ews_provider, lambda_provider: lambda_provider)
        update_availability_configuration(input)
      end

      def update_availability_configuration(input : Types::UpdateAvailabilityConfigurationRequest) : Types::UpdateAvailabilityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AVAILABILITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAvailabilityConfigurationResponse, "UpdateAvailabilityConfiguration")
      end

      # Updates the default mail domain for an organization. The default mail domain is used by the WorkMail
      # AWS Console to suggest an email address when enabling a mail user. You can only have one default
      # domain.

      def update_default_mail_domain(
        domain_name : String,
        organization_id : String
      ) : Types::UpdateDefaultMailDomainResponse

        input = Types::UpdateDefaultMailDomainRequest.new(domain_name: domain_name, organization_id: organization_id)
        update_default_mail_domain(input)
      end

      def update_default_mail_domain(input : Types::UpdateDefaultMailDomainRequest) : Types::UpdateDefaultMailDomainResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEFAULT_MAIL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDefaultMailDomainResponse, "UpdateDefaultMailDomain")
      end

      # Updates attributes in a group.

      def update_group(
        group_id : String,
        organization_id : String,
        hidden_from_global_address_list : Bool? = nil
      ) : Types::UpdateGroupResponse

        input = Types::UpdateGroupRequest.new(group_id: group_id, organization_id: organization_id, hidden_from_global_address_list: hidden_from_global_address_list)
        update_group(input)
      end

      def update_group(input : Types::UpdateGroupRequest) : Types::UpdateGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGroupResponse, "UpdateGroup")
      end

      # Updates an impersonation role for the given WorkMail organization.

      def update_impersonation_role(
        impersonation_role_id : String,
        name : String,
        organization_id : String,
        rules : Array(Types::ImpersonationRule),
        type : String,
        description : String? = nil
      ) : Types::UpdateImpersonationRoleResponse

        input = Types::UpdateImpersonationRoleRequest.new(impersonation_role_id: impersonation_role_id, name: name, organization_id: organization_id, rules: rules, type: type, description: description)
        update_impersonation_role(input)
      end

      def update_impersonation_role(input : Types::UpdateImpersonationRoleRequest) : Types::UpdateImpersonationRoleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IMPERSONATION_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateImpersonationRoleResponse, "UpdateImpersonationRole")
      end

      # Updates a user's current mailbox quota for a specified organization and user.

      def update_mailbox_quota(
        mailbox_quota : Int32,
        organization_id : String,
        user_id : String
      ) : Types::UpdateMailboxQuotaResponse

        input = Types::UpdateMailboxQuotaRequest.new(mailbox_quota: mailbox_quota, organization_id: organization_id, user_id: user_id)
        update_mailbox_quota(input)
      end

      def update_mailbox_quota(input : Types::UpdateMailboxQuotaRequest) : Types::UpdateMailboxQuotaResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MAILBOX_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMailboxQuotaResponse, "UpdateMailboxQuota")
      end

      # Updates a mobile device access rule for the specified WorkMail organization.

      def update_mobile_device_access_rule(
        effect : String,
        mobile_device_access_rule_id : String,
        name : String,
        organization_id : String,
        description : String? = nil,
        device_models : Array(String)? = nil,
        device_operating_systems : Array(String)? = nil,
        device_types : Array(String)? = nil,
        device_user_agents : Array(String)? = nil,
        not_device_models : Array(String)? = nil,
        not_device_operating_systems : Array(String)? = nil,
        not_device_types : Array(String)? = nil,
        not_device_user_agents : Array(String)? = nil
      ) : Types::UpdateMobileDeviceAccessRuleResponse

        input = Types::UpdateMobileDeviceAccessRuleRequest.new(effect: effect, mobile_device_access_rule_id: mobile_device_access_rule_id, name: name, organization_id: organization_id, description: description, device_models: device_models, device_operating_systems: device_operating_systems, device_types: device_types, device_user_agents: device_user_agents, not_device_models: not_device_models, not_device_operating_systems: not_device_operating_systems, not_device_types: not_device_types, not_device_user_agents: not_device_user_agents)
        update_mobile_device_access_rule(input)
      end

      def update_mobile_device_access_rule(input : Types::UpdateMobileDeviceAccessRuleRequest) : Types::UpdateMobileDeviceAccessRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MOBILE_DEVICE_ACCESS_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMobileDeviceAccessRuleResponse, "UpdateMobileDeviceAccessRule")
      end

      # Updates the primary email for a user, group, or resource. The current email is moved into the list
      # of aliases (or swapped between an existing alias and the current primary email), and the email
      # provided in the input is promoted as the primary.

      def update_primary_email_address(
        email : String,
        entity_id : String,
        organization_id : String
      ) : Types::UpdatePrimaryEmailAddressResponse

        input = Types::UpdatePrimaryEmailAddressRequest.new(email: email, entity_id: entity_id, organization_id: organization_id)
        update_primary_email_address(input)
      end

      def update_primary_email_address(input : Types::UpdatePrimaryEmailAddressRequest) : Types::UpdatePrimaryEmailAddressResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PRIMARY_EMAIL_ADDRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePrimaryEmailAddressResponse, "UpdatePrimaryEmailAddress")
      end

      # Updates data for the resource. To have the latest information, it must be preceded by a
      # DescribeResource call. The dataset in the request should be the one expected when performing another
      # DescribeResource call.

      def update_resource(
        organization_id : String,
        resource_id : String,
        booking_options : Types::BookingOptions? = nil,
        description : String? = nil,
        hidden_from_global_address_list : Bool? = nil,
        name : String? = nil,
        type : String? = nil
      ) : Types::UpdateResourceResponse

        input = Types::UpdateResourceRequest.new(organization_id: organization_id, resource_id: resource_id, booking_options: booking_options, description: description, hidden_from_global_address_list: hidden_from_global_address_list, name: name, type: type)
        update_resource(input)
      end

      def update_resource(input : Types::UpdateResourceRequest) : Types::UpdateResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResourceResponse, "UpdateResource")
      end

      # Updates data for the user. To have the latest information, it must be preceded by a DescribeUser
      # call. The dataset in the request should be the one expected when performing another DescribeUser
      # call.

      def update_user(
        organization_id : String,
        user_id : String,
        city : String? = nil,
        company : String? = nil,
        country : String? = nil,
        department : String? = nil,
        display_name : String? = nil,
        first_name : String? = nil,
        hidden_from_global_address_list : Bool? = nil,
        identity_provider_user_id : String? = nil,
        initials : String? = nil,
        job_title : String? = nil,
        last_name : String? = nil,
        office : String? = nil,
        role : String? = nil,
        street : String? = nil,
        telephone : String? = nil,
        zip_code : String? = nil
      ) : Types::UpdateUserResponse

        input = Types::UpdateUserRequest.new(organization_id: organization_id, user_id: user_id, city: city, company: company, country: country, department: department, display_name: display_name, first_name: first_name, hidden_from_global_address_list: hidden_from_global_address_list, identity_provider_user_id: identity_provider_user_id, initials: initials, job_title: job_title, last_name: last_name, office: office, role: role, street: street, telephone: telephone, zip_code: zip_code)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Types::UpdateUserResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserResponse, "UpdateUser")
      end
    end
  end
end
