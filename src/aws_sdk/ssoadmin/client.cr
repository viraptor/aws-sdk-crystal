module AwsSdk
  module SSOAdmin
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

      # Attaches the specified customer managed policy to the specified PermissionSet .

      def attach_customer_managed_policy_reference_to_permission_set(
        customer_managed_policy_reference : Types::CustomerManagedPolicyReference,
        instance_arn : String,
        permission_set_arn : String
      ) : Types::AttachCustomerManagedPolicyReferenceToPermissionSetResponse

        input = Types::AttachCustomerManagedPolicyReferenceToPermissionSetRequest.new(customer_managed_policy_reference: customer_managed_policy_reference, instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        attach_customer_managed_policy_reference_to_permission_set(input)
      end

      def attach_customer_managed_policy_reference_to_permission_set(input : Types::AttachCustomerManagedPolicyReferenceToPermissionSetRequest) : Types::AttachCustomerManagedPolicyReferenceToPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::ATTACH_CUSTOMER_MANAGED_POLICY_REFERENCE_TO_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachCustomerManagedPolicyReferenceToPermissionSetResponse, "AttachCustomerManagedPolicyReferenceToPermissionSet")
      end

      # Attaches an Amazon Web Services managed policy ARN to a permission set. If the permission set is
      # already referenced by one or more account assignments, you will need to call ProvisionPermissionSet
      # after this operation. Calling ProvisionPermissionSet applies the corresponding IAM policy updates to
      # all assigned accounts.

      def attach_managed_policy_to_permission_set(
        instance_arn : String,
        managed_policy_arn : String,
        permission_set_arn : String
      ) : Types::AttachManagedPolicyToPermissionSetResponse

        input = Types::AttachManagedPolicyToPermissionSetRequest.new(instance_arn: instance_arn, managed_policy_arn: managed_policy_arn, permission_set_arn: permission_set_arn)
        attach_managed_policy_to_permission_set(input)
      end

      def attach_managed_policy_to_permission_set(input : Types::AttachManagedPolicyToPermissionSetRequest) : Types::AttachManagedPolicyToPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::ATTACH_MANAGED_POLICY_TO_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachManagedPolicyToPermissionSetResponse, "AttachManagedPolicyToPermissionSet")
      end

      # Assigns access to a principal for a specified Amazon Web Services account using a specified
      # permission set. The term principal here refers to a user or group that is defined in IAM Identity
      # Center. As part of a successful CreateAccountAssignment call, the specified permission set will
      # automatically be provisioned to the account in the form of an IAM policy. That policy is attached to
      # the IAM role created in IAM Identity Center. If the permission set is subsequently updated, the
      # corresponding IAM policies attached to roles in your accounts will not be updated automatically. In
      # this case, you must call ProvisionPermissionSet to make these updates. After a successful response,
      # call DescribeAccountAssignmentCreationStatus to describe the status of an assignment creation
      # request.

      def create_account_assignment(
        instance_arn : String,
        permission_set_arn : String,
        principal_id : String,
        principal_type : String,
        target_id : String,
        target_type : String
      ) : Types::CreateAccountAssignmentResponse

        input = Types::CreateAccountAssignmentRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, principal_id: principal_id, principal_type: principal_type, target_id: target_id, target_type: target_type)
        create_account_assignment(input)
      end

      def create_account_assignment(input : Types::CreateAccountAssignmentRequest) : Types::CreateAccountAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACCOUNT_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAccountAssignmentResponse, "CreateAccountAssignment")
      end

      # Creates an OAuth 2.0 customer managed application in IAM Identity Center for the given application
      # provider. This API does not support creating SAML 2.0 customer managed applications or Amazon Web
      # Services managed applications. To learn how to create an Amazon Web Services managed application,
      # see the application user guide. You can create a SAML 2.0 customer managed application in the Amazon
      # Web Services Management Console only. See Setting up customer managed SAML 2.0 applications . For
      # more information on these application types, see Amazon Web Services managed applications .

      def create_application(
        application_provider_arn : String,
        instance_arn : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        portal_options : Types::PortalOptions? = nil,
        status : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateApplicationResponse

        input = Types::CreateApplicationRequest.new(application_provider_arn: application_provider_arn, instance_arn: instance_arn, name: name, client_token: client_token, description: description, portal_options: portal_options, status: status, tags: tags)
        create_application(input)
      end

      def create_application(input : Types::CreateApplicationRequest) : Types::CreateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationResponse, "CreateApplication")
      end

      # Grant application access to a user or group.

      def create_application_assignment(
        application_arn : String,
        principal_id : String,
        principal_type : String
      ) : Types::CreateApplicationAssignmentResponse

        input = Types::CreateApplicationAssignmentRequest.new(application_arn: application_arn, principal_id: principal_id, principal_type: principal_type)
        create_application_assignment(input)
      end

      def create_application_assignment(input : Types::CreateApplicationAssignmentRequest) : Types::CreateApplicationAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPLICATION_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApplicationAssignmentResponse, "CreateApplicationAssignment")
      end

      # Creates an instance of IAM Identity Center for a standalone Amazon Web Services account that is not
      # managed by Organizations or a member Amazon Web Services account in an organization. You can create
      # only one instance per account and across all Amazon Web Services Regions. The CreateInstance request
      # is rejected if the following apply: The instance is created within the organization management
      # account. An instance already exists in the same account.

      def create_instance(
        client_token : String? = nil,
        name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateInstanceResponse

        input = Types::CreateInstanceRequest.new(client_token: client_token, name: name, tags: tags)
        create_instance(input)
      end

      def create_instance(input : Types::CreateInstanceRequest) : Types::CreateInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInstanceResponse, "CreateInstance")
      end

      # Enables the attributes-based access control (ABAC) feature for the specified IAM Identity Center
      # instance. You can also specify new attributes to add to your ABAC configuration during the enabling
      # process. For more information about ABAC, see Attribute-Based Access Control in the IAM Identity
      # Center User Guide . After a successful response, call
      # DescribeInstanceAccessControlAttributeConfiguration to validate that
      # InstanceAccessControlAttributeConfiguration was created.

      def create_instance_access_control_attribute_configuration(
        instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration,
        instance_arn : String
      ) : Types::CreateInstanceAccessControlAttributeConfigurationResponse

        input = Types::CreateInstanceAccessControlAttributeConfigurationRequest.new(instance_access_control_attribute_configuration: instance_access_control_attribute_configuration, instance_arn: instance_arn)
        create_instance_access_control_attribute_configuration(input)
      end

      def create_instance_access_control_attribute_configuration(input : Types::CreateInstanceAccessControlAttributeConfigurationRequest) : Types::CreateInstanceAccessControlAttributeConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInstanceAccessControlAttributeConfigurationResponse, "CreateInstanceAccessControlAttributeConfiguration")
      end

      # Creates a permission set within a specified IAM Identity Center instance. To grant users and groups
      # access to Amazon Web Services account resources, use CreateAccountAssignment .

      def create_permission_set(
        instance_arn : String,
        name : String,
        description : String? = nil,
        relay_state : String? = nil,
        session_duration : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePermissionSetResponse

        input = Types::CreatePermissionSetRequest.new(instance_arn: instance_arn, name: name, description: description, relay_state: relay_state, session_duration: session_duration, tags: tags)
        create_permission_set(input)
      end

      def create_permission_set(input : Types::CreatePermissionSetRequest) : Types::CreatePermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePermissionSetResponse, "CreatePermissionSet")
      end

      # Creates a connection to a trusted token issuer in an instance of IAM Identity Center. A trusted
      # token issuer enables trusted identity propagation to be used with applications that authenticate
      # outside of Amazon Web Services. This trusted token issuer describes an external identity provider
      # (IdP) that can generate claims or assertions in the form of access tokens for a user. Applications
      # enabled for IAM Identity Center can use these tokens for authentication.

      def create_trusted_token_issuer(
        instance_arn : String,
        name : String,
        trusted_token_issuer_configuration : Types::TrustedTokenIssuerConfiguration,
        trusted_token_issuer_type : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTrustedTokenIssuerResponse

        input = Types::CreateTrustedTokenIssuerRequest.new(instance_arn: instance_arn, name: name, trusted_token_issuer_configuration: trusted_token_issuer_configuration, trusted_token_issuer_type: trusted_token_issuer_type, client_token: client_token, tags: tags)
        create_trusted_token_issuer(input)
      end

      def create_trusted_token_issuer(input : Types::CreateTrustedTokenIssuerRequest) : Types::CreateTrustedTokenIssuerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRUSTED_TOKEN_ISSUER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrustedTokenIssuerResponse, "CreateTrustedTokenIssuer")
      end

      # Deletes a principal's access from a specified Amazon Web Services account using a specified
      # permission set. After a successful response, call DescribeAccountAssignmentDeletionStatus to
      # describe the status of an assignment deletion request.

      def delete_account_assignment(
        instance_arn : String,
        permission_set_arn : String,
        principal_id : String,
        principal_type : String,
        target_id : String,
        target_type : String
      ) : Types::DeleteAccountAssignmentResponse

        input = Types::DeleteAccountAssignmentRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, principal_id: principal_id, principal_type: principal_type, target_id: target_id, target_type: target_type)
        delete_account_assignment(input)
      end

      def delete_account_assignment(input : Types::DeleteAccountAssignmentRequest) : Types::DeleteAccountAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCOUNT_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAccountAssignmentResponse, "DeleteAccountAssignment")
      end

      # Deletes the association with the application. The connected service resource still exists.

      def delete_application(
        application_arn : String
      ) : Types::DeleteApplicationResponse

        input = Types::DeleteApplicationRequest.new(application_arn: application_arn)
        delete_application(input)
      end

      def delete_application(input : Types::DeleteApplicationRequest) : Types::DeleteApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationResponse, "DeleteApplication")
      end

      # Deletes an IAM Identity Center access scope from an application.

      def delete_application_access_scope(
        application_arn : String,
        scope : String
      ) : Nil

        input = Types::DeleteApplicationAccessScopeRequest.new(application_arn: application_arn, scope: scope)
        delete_application_access_scope(input)
      end

      def delete_application_access_scope(input : Types::DeleteApplicationAccessScopeRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_ACCESS_SCOPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Revoke application access to an application by deleting application assignments for a user or group.

      def delete_application_assignment(
        application_arn : String,
        principal_id : String,
        principal_type : String
      ) : Types::DeleteApplicationAssignmentResponse

        input = Types::DeleteApplicationAssignmentRequest.new(application_arn: application_arn, principal_id: principal_id, principal_type: principal_type)
        delete_application_assignment(input)
      end

      def delete_application_assignment(input : Types::DeleteApplicationAssignmentRequest) : Types::DeleteApplicationAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApplicationAssignmentResponse, "DeleteApplicationAssignment")
      end

      # Deletes an authentication method from an application.

      def delete_application_authentication_method(
        application_arn : String,
        authentication_method_type : String
      ) : Nil

        input = Types::DeleteApplicationAuthenticationMethodRequest.new(application_arn: application_arn, authentication_method_type: authentication_method_type)
        delete_application_authentication_method(input)
      end

      def delete_application_authentication_method(input : Types::DeleteApplicationAuthenticationMethodRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_AUTHENTICATION_METHOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a grant from an application.

      def delete_application_grant(
        application_arn : String,
        grant_type : String
      ) : Nil

        input = Types::DeleteApplicationGrantRequest.new(application_arn: application_arn, grant_type: grant_type)
        delete_application_grant(input)
      end

      def delete_application_grant(input : Types::DeleteApplicationGrantRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPLICATION_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the inline policy from a specified permission set.

      def delete_inline_policy_from_permission_set(
        instance_arn : String,
        permission_set_arn : String
      ) : Types::DeleteInlinePolicyFromPermissionSetResponse

        input = Types::DeleteInlinePolicyFromPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        delete_inline_policy_from_permission_set(input)
      end

      def delete_inline_policy_from_permission_set(input : Types::DeleteInlinePolicyFromPermissionSetRequest) : Types::DeleteInlinePolicyFromPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INLINE_POLICY_FROM_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInlinePolicyFromPermissionSetResponse, "DeleteInlinePolicyFromPermissionSet")
      end

      # Deletes the instance of IAM Identity Center. Only the account that owns the instance can call this
      # API. Neither the delegated administrator nor member account can delete the organization instance,
      # but those roles can delete their own instance.

      def delete_instance(
        instance_arn : String
      ) : Types::DeleteInstanceResponse

        input = Types::DeleteInstanceRequest.new(instance_arn: instance_arn)
        delete_instance(input)
      end

      def delete_instance(input : Types::DeleteInstanceRequest) : Types::DeleteInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInstanceResponse, "DeleteInstance")
      end

      # Disables the attributes-based access control (ABAC) feature for the specified IAM Identity Center
      # instance and deletes all of the attribute mappings that have been configured. Once deleted, any
      # attributes that are received from an identity source and any custom attributes you have previously
      # configured will not be passed. For more information about ABAC, see Attribute-Based Access Control
      # in the IAM Identity Center User Guide .

      def delete_instance_access_control_attribute_configuration(
        instance_arn : String
      ) : Types::DeleteInstanceAccessControlAttributeConfigurationResponse

        input = Types::DeleteInstanceAccessControlAttributeConfigurationRequest.new(instance_arn: instance_arn)
        delete_instance_access_control_attribute_configuration(input)
      end

      def delete_instance_access_control_attribute_configuration(input : Types::DeleteInstanceAccessControlAttributeConfigurationRequest) : Types::DeleteInstanceAccessControlAttributeConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInstanceAccessControlAttributeConfigurationResponse, "DeleteInstanceAccessControlAttributeConfiguration")
      end

      # Deletes the specified permission set.

      def delete_permission_set(
        instance_arn : String,
        permission_set_arn : String
      ) : Types::DeletePermissionSetResponse

        input = Types::DeletePermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        delete_permission_set(input)
      end

      def delete_permission_set(input : Types::DeletePermissionSetRequest) : Types::DeletePermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePermissionSetResponse, "DeletePermissionSet")
      end

      # Deletes the permissions boundary from a specified PermissionSet .

      def delete_permissions_boundary_from_permission_set(
        instance_arn : String,
        permission_set_arn : String
      ) : Types::DeletePermissionsBoundaryFromPermissionSetResponse

        input = Types::DeletePermissionsBoundaryFromPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        delete_permissions_boundary_from_permission_set(input)
      end

      def delete_permissions_boundary_from_permission_set(input : Types::DeletePermissionsBoundaryFromPermissionSetRequest) : Types::DeletePermissionsBoundaryFromPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PERMISSIONS_BOUNDARY_FROM_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePermissionsBoundaryFromPermissionSetResponse, "DeletePermissionsBoundaryFromPermissionSet")
      end

      # Deletes a trusted token issuer configuration from an instance of IAM Identity Center. Deleting this
      # trusted token issuer configuration will cause users to lose access to any applications that are
      # configured to use the trusted token issuer.

      def delete_trusted_token_issuer(
        trusted_token_issuer_arn : String
      ) : Types::DeleteTrustedTokenIssuerResponse

        input = Types::DeleteTrustedTokenIssuerRequest.new(trusted_token_issuer_arn: trusted_token_issuer_arn)
        delete_trusted_token_issuer(input)
      end

      def delete_trusted_token_issuer(input : Types::DeleteTrustedTokenIssuerRequest) : Types::DeleteTrustedTokenIssuerResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRUSTED_TOKEN_ISSUER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTrustedTokenIssuerResponse, "DeleteTrustedTokenIssuer")
      end

      # Describes the status of the assignment creation request.

      def describe_account_assignment_creation_status(
        account_assignment_creation_request_id : String,
        instance_arn : String
      ) : Types::DescribeAccountAssignmentCreationStatusResponse

        input = Types::DescribeAccountAssignmentCreationStatusRequest.new(account_assignment_creation_request_id: account_assignment_creation_request_id, instance_arn: instance_arn)
        describe_account_assignment_creation_status(input)
      end

      def describe_account_assignment_creation_status(input : Types::DescribeAccountAssignmentCreationStatusRequest) : Types::DescribeAccountAssignmentCreationStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_ASSIGNMENT_CREATION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountAssignmentCreationStatusResponse, "DescribeAccountAssignmentCreationStatus")
      end

      # Describes the status of the assignment deletion request.

      def describe_account_assignment_deletion_status(
        account_assignment_deletion_request_id : String,
        instance_arn : String
      ) : Types::DescribeAccountAssignmentDeletionStatusResponse

        input = Types::DescribeAccountAssignmentDeletionStatusRequest.new(account_assignment_deletion_request_id: account_assignment_deletion_request_id, instance_arn: instance_arn)
        describe_account_assignment_deletion_status(input)
      end

      def describe_account_assignment_deletion_status(input : Types::DescribeAccountAssignmentDeletionStatusRequest) : Types::DescribeAccountAssignmentDeletionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_ASSIGNMENT_DELETION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountAssignmentDeletionStatusResponse, "DescribeAccountAssignmentDeletionStatus")
      end

      # Retrieves the details of an application associated with an instance of IAM Identity Center.

      def describe_application(
        application_arn : String
      ) : Types::DescribeApplicationResponse

        input = Types::DescribeApplicationRequest.new(application_arn: application_arn)
        describe_application(input)
      end

      def describe_application(input : Types::DescribeApplicationRequest) : Types::DescribeApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationResponse, "DescribeApplication")
      end

      # Retrieves a direct assignment of a user or group to an application. If the user doesn’t have a
      # direct assignment to the application, the user may still have access to the application through a
      # group. Therefore, don’t use this API to test access to an application for a user. Instead use
      # ListApplicationAssignmentsForPrincipal .

      def describe_application_assignment(
        application_arn : String,
        principal_id : String,
        principal_type : String
      ) : Types::DescribeApplicationAssignmentResponse

        input = Types::DescribeApplicationAssignmentRequest.new(application_arn: application_arn, principal_id: principal_id, principal_type: principal_type)
        describe_application_assignment(input)
      end

      def describe_application_assignment(input : Types::DescribeApplicationAssignmentRequest) : Types::DescribeApplicationAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationAssignmentResponse, "DescribeApplicationAssignment")
      end

      # Retrieves details about a provider that can be used to connect an Amazon Web Services managed
      # application or customer managed application to IAM Identity Center.

      def describe_application_provider(
        application_provider_arn : String
      ) : Types::DescribeApplicationProviderResponse

        input = Types::DescribeApplicationProviderRequest.new(application_provider_arn: application_provider_arn)
        describe_application_provider(input)
      end

      def describe_application_provider(input : Types::DescribeApplicationProviderRequest) : Types::DescribeApplicationProviderResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationProviderResponse, "DescribeApplicationProvider")
      end

      # Returns the details of an instance of IAM Identity Center. The status can be one of the following:
      # CREATE_IN_PROGRESS - The instance is in the process of being created. When the instance is ready for
      # use, DescribeInstance returns the status of ACTIVE . While the instance is in the CREATE_IN_PROGRESS
      # state, you can call only DescribeInstance and DeleteInstance operations. DELETE_IN_PROGRESS - The
      # instance is being deleted. Returns AccessDeniedException after the delete operation completes.
      # ACTIVE - The instance is active.

      def describe_instance(
        instance_arn : String
      ) : Types::DescribeInstanceResponse

        input = Types::DescribeInstanceRequest.new(instance_arn: instance_arn)
        describe_instance(input)
      end

      def describe_instance(input : Types::DescribeInstanceRequest) : Types::DescribeInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstanceResponse, "DescribeInstance")
      end

      # Returns the list of IAM Identity Center identity store attributes that have been configured to work
      # with attributes-based access control (ABAC) for the specified IAM Identity Center instance. This
      # will not return attributes configured and sent by an external identity provider. For more
      # information about ABAC, see Attribute-Based Access Control in the IAM Identity Center User Guide .

      def describe_instance_access_control_attribute_configuration(
        instance_arn : String
      ) : Types::DescribeInstanceAccessControlAttributeConfigurationResponse

        input = Types::DescribeInstanceAccessControlAttributeConfigurationRequest.new(instance_arn: instance_arn)
        describe_instance_access_control_attribute_configuration(input)
      end

      def describe_instance_access_control_attribute_configuration(input : Types::DescribeInstanceAccessControlAttributeConfigurationRequest) : Types::DescribeInstanceAccessControlAttributeConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstanceAccessControlAttributeConfigurationResponse, "DescribeInstanceAccessControlAttributeConfiguration")
      end

      # Gets the details of the permission set.

      def describe_permission_set(
        instance_arn : String,
        permission_set_arn : String
      ) : Types::DescribePermissionSetResponse

        input = Types::DescribePermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        describe_permission_set(input)
      end

      def describe_permission_set(input : Types::DescribePermissionSetRequest) : Types::DescribePermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePermissionSetResponse, "DescribePermissionSet")
      end

      # Describes the status for the given permission set provisioning request.

      def describe_permission_set_provisioning_status(
        instance_arn : String,
        provision_permission_set_request_id : String
      ) : Types::DescribePermissionSetProvisioningStatusResponse

        input = Types::DescribePermissionSetProvisioningStatusRequest.new(instance_arn: instance_arn, provision_permission_set_request_id: provision_permission_set_request_id)
        describe_permission_set_provisioning_status(input)
      end

      def describe_permission_set_provisioning_status(input : Types::DescribePermissionSetProvisioningStatusRequest) : Types::DescribePermissionSetProvisioningStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PERMISSION_SET_PROVISIONING_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePermissionSetProvisioningStatusResponse, "DescribePermissionSetProvisioningStatus")
      end

      # Retrieves details about a trusted token issuer configuration stored in an instance of IAM Identity
      # Center. Details include the name of the trusted token issuer, the issuer URL, and the path of the
      # source attribute and the destination attribute for a trusted token issuer configuration.

      def describe_trusted_token_issuer(
        trusted_token_issuer_arn : String
      ) : Types::DescribeTrustedTokenIssuerResponse

        input = Types::DescribeTrustedTokenIssuerRequest.new(trusted_token_issuer_arn: trusted_token_issuer_arn)
        describe_trusted_token_issuer(input)
      end

      def describe_trusted_token_issuer(input : Types::DescribeTrustedTokenIssuerRequest) : Types::DescribeTrustedTokenIssuerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRUSTED_TOKEN_ISSUER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrustedTokenIssuerResponse, "DescribeTrustedTokenIssuer")
      end

      # Detaches the specified customer managed policy from the specified PermissionSet .

      def detach_customer_managed_policy_reference_from_permission_set(
        customer_managed_policy_reference : Types::CustomerManagedPolicyReference,
        instance_arn : String,
        permission_set_arn : String
      ) : Types::DetachCustomerManagedPolicyReferenceFromPermissionSetResponse

        input = Types::DetachCustomerManagedPolicyReferenceFromPermissionSetRequest.new(customer_managed_policy_reference: customer_managed_policy_reference, instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        detach_customer_managed_policy_reference_from_permission_set(input)
      end

      def detach_customer_managed_policy_reference_from_permission_set(input : Types::DetachCustomerManagedPolicyReferenceFromPermissionSetRequest) : Types::DetachCustomerManagedPolicyReferenceFromPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::DETACH_CUSTOMER_MANAGED_POLICY_REFERENCE_FROM_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachCustomerManagedPolicyReferenceFromPermissionSetResponse, "DetachCustomerManagedPolicyReferenceFromPermissionSet")
      end

      # Detaches the attached Amazon Web Services managed policy ARN from the specified permission set.

      def detach_managed_policy_from_permission_set(
        instance_arn : String,
        managed_policy_arn : String,
        permission_set_arn : String
      ) : Types::DetachManagedPolicyFromPermissionSetResponse

        input = Types::DetachManagedPolicyFromPermissionSetRequest.new(instance_arn: instance_arn, managed_policy_arn: managed_policy_arn, permission_set_arn: permission_set_arn)
        detach_managed_policy_from_permission_set(input)
      end

      def detach_managed_policy_from_permission_set(input : Types::DetachManagedPolicyFromPermissionSetRequest) : Types::DetachManagedPolicyFromPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::DETACH_MANAGED_POLICY_FROM_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachManagedPolicyFromPermissionSetResponse, "DetachManagedPolicyFromPermissionSet")
      end

      # Retrieves the authorized targets for an IAM Identity Center access scope for an application.

      def get_application_access_scope(
        application_arn : String,
        scope : String
      ) : Types::GetApplicationAccessScopeResponse

        input = Types::GetApplicationAccessScopeRequest.new(application_arn: application_arn, scope: scope)
        get_application_access_scope(input)
      end

      def get_application_access_scope(input : Types::GetApplicationAccessScopeRequest) : Types::GetApplicationAccessScopeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_APPLICATION_ACCESS_SCOPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApplicationAccessScopeResponse, "GetApplicationAccessScope")
      end

      # Retrieves the configuration of PutApplicationAssignmentConfiguration .

      def get_application_assignment_configuration(
        application_arn : String
      ) : Types::GetApplicationAssignmentConfigurationResponse

        input = Types::GetApplicationAssignmentConfigurationRequest.new(application_arn: application_arn)
        get_application_assignment_configuration(input)
      end

      def get_application_assignment_configuration(input : Types::GetApplicationAssignmentConfigurationRequest) : Types::GetApplicationAssignmentConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_APPLICATION_ASSIGNMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApplicationAssignmentConfigurationResponse, "GetApplicationAssignmentConfiguration")
      end

      # Retrieves details about an authentication method used by an application.

      def get_application_authentication_method(
        application_arn : String,
        authentication_method_type : String
      ) : Types::GetApplicationAuthenticationMethodResponse

        input = Types::GetApplicationAuthenticationMethodRequest.new(application_arn: application_arn, authentication_method_type: authentication_method_type)
        get_application_authentication_method(input)
      end

      def get_application_authentication_method(input : Types::GetApplicationAuthenticationMethodRequest) : Types::GetApplicationAuthenticationMethodResponse
        request = Protocol::JsonRpc.build_request(Model::GET_APPLICATION_AUTHENTICATION_METHOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApplicationAuthenticationMethodResponse, "GetApplicationAuthenticationMethod")
      end

      # Retrieves details about an application grant.

      def get_application_grant(
        application_arn : String,
        grant_type : String
      ) : Types::GetApplicationGrantResponse

        input = Types::GetApplicationGrantRequest.new(application_arn: application_arn, grant_type: grant_type)
        get_application_grant(input)
      end

      def get_application_grant(input : Types::GetApplicationGrantRequest) : Types::GetApplicationGrantResponse
        request = Protocol::JsonRpc.build_request(Model::GET_APPLICATION_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApplicationGrantResponse, "GetApplicationGrant")
      end

      # Retrieves the session configuration for an application in IAM Identity Center. The session
      # configuration determines how users can access an application. This includes whether user background
      # sessions are enabled. User background sessions allow users to start a job on a supported Amazon Web
      # Services managed application without having to remain signed in to an active session while the job
      # runs.

      def get_application_session_configuration(
        application_arn : String
      ) : Types::GetApplicationSessionConfigurationResponse

        input = Types::GetApplicationSessionConfigurationRequest.new(application_arn: application_arn)
        get_application_session_configuration(input)
      end

      def get_application_session_configuration(input : Types::GetApplicationSessionConfigurationRequest) : Types::GetApplicationSessionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_APPLICATION_SESSION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApplicationSessionConfigurationResponse, "GetApplicationSessionConfiguration")
      end

      # Obtains the inline policy assigned to the permission set.

      def get_inline_policy_for_permission_set(
        instance_arn : String,
        permission_set_arn : String
      ) : Types::GetInlinePolicyForPermissionSetResponse

        input = Types::GetInlinePolicyForPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        get_inline_policy_for_permission_set(input)
      end

      def get_inline_policy_for_permission_set(input : Types::GetInlinePolicyForPermissionSetRequest) : Types::GetInlinePolicyForPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INLINE_POLICY_FOR_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInlinePolicyForPermissionSetResponse, "GetInlinePolicyForPermissionSet")
      end

      # Obtains the permissions boundary for a specified PermissionSet .

      def get_permissions_boundary_for_permission_set(
        instance_arn : String,
        permission_set_arn : String
      ) : Types::GetPermissionsBoundaryForPermissionSetResponse

        input = Types::GetPermissionsBoundaryForPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        get_permissions_boundary_for_permission_set(input)
      end

      def get_permissions_boundary_for_permission_set(input : Types::GetPermissionsBoundaryForPermissionSetRequest) : Types::GetPermissionsBoundaryForPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PERMISSIONS_BOUNDARY_FOR_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPermissionsBoundaryForPermissionSetResponse, "GetPermissionsBoundaryForPermissionSet")
      end

      # Lists the status of the Amazon Web Services account assignment creation requests for a specified IAM
      # Identity Center instance.

      def list_account_assignment_creation_status(
        instance_arn : String,
        filter : Types::OperationStatusFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountAssignmentCreationStatusResponse

        input = Types::ListAccountAssignmentCreationStatusRequest.new(instance_arn: instance_arn, filter: filter, max_results: max_results, next_token: next_token)
        list_account_assignment_creation_status(input)
      end

      def list_account_assignment_creation_status(input : Types::ListAccountAssignmentCreationStatusRequest) : Types::ListAccountAssignmentCreationStatusResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNT_ASSIGNMENT_CREATION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountAssignmentCreationStatusResponse, "ListAccountAssignmentCreationStatus")
      end

      # Lists the status of the Amazon Web Services account assignment deletion requests for a specified IAM
      # Identity Center instance.

      def list_account_assignment_deletion_status(
        instance_arn : String,
        filter : Types::OperationStatusFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountAssignmentDeletionStatusResponse

        input = Types::ListAccountAssignmentDeletionStatusRequest.new(instance_arn: instance_arn, filter: filter, max_results: max_results, next_token: next_token)
        list_account_assignment_deletion_status(input)
      end

      def list_account_assignment_deletion_status(input : Types::ListAccountAssignmentDeletionStatusRequest) : Types::ListAccountAssignmentDeletionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNT_ASSIGNMENT_DELETION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountAssignmentDeletionStatusResponse, "ListAccountAssignmentDeletionStatus")
      end

      # Lists the assignee of the specified Amazon Web Services account with the specified permission set.

      def list_account_assignments(
        account_id : String,
        instance_arn : String,
        permission_set_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountAssignmentsResponse

        input = Types::ListAccountAssignmentsRequest.new(account_id: account_id, instance_arn: instance_arn, permission_set_arn: permission_set_arn, max_results: max_results, next_token: next_token)
        list_account_assignments(input)
      end

      def list_account_assignments(input : Types::ListAccountAssignmentsRequest) : Types::ListAccountAssignmentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNT_ASSIGNMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountAssignmentsResponse, "ListAccountAssignments")
      end

      # Retrieves a list of the IAM Identity Center associated Amazon Web Services accounts that the
      # principal has access to. This action must be called from the management account containing your
      # organization instance of IAM Identity Center. This action is not valid for account instances of IAM
      # Identity Center.

      def list_account_assignments_for_principal(
        instance_arn : String,
        principal_id : String,
        principal_type : String,
        filter : Types::ListAccountAssignmentsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountAssignmentsForPrincipalResponse

        input = Types::ListAccountAssignmentsForPrincipalRequest.new(instance_arn: instance_arn, principal_id: principal_id, principal_type: principal_type, filter: filter, max_results: max_results, next_token: next_token)
        list_account_assignments_for_principal(input)
      end

      def list_account_assignments_for_principal(input : Types::ListAccountAssignmentsForPrincipalRequest) : Types::ListAccountAssignmentsForPrincipalResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNT_ASSIGNMENTS_FOR_PRINCIPAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountAssignmentsForPrincipalResponse, "ListAccountAssignmentsForPrincipal")
      end

      # Lists all the Amazon Web Services accounts where the specified permission set is provisioned.

      def list_accounts_for_provisioned_permission_set(
        instance_arn : String,
        permission_set_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        provisioning_status : String? = nil
      ) : Types::ListAccountsForProvisionedPermissionSetResponse

        input = Types::ListAccountsForProvisionedPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, max_results: max_results, next_token: next_token, provisioning_status: provisioning_status)
        list_accounts_for_provisioned_permission_set(input)
      end

      def list_accounts_for_provisioned_permission_set(input : Types::ListAccountsForProvisionedPermissionSetRequest) : Types::ListAccountsForProvisionedPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNTS_FOR_PROVISIONED_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountsForProvisionedPermissionSetResponse, "ListAccountsForProvisionedPermissionSet")
      end

      # Lists the access scopes and authorized targets associated with an application.

      def list_application_access_scopes(
        application_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationAccessScopesResponse

        input = Types::ListApplicationAccessScopesRequest.new(application_arn: application_arn, max_results: max_results, next_token: next_token)
        list_application_access_scopes(input)
      end

      def list_application_access_scopes(input : Types::ListApplicationAccessScopesRequest) : Types::ListApplicationAccessScopesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_ACCESS_SCOPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationAccessScopesResponse, "ListApplicationAccessScopes")
      end

      # Lists Amazon Web Services account users that are assigned to an application.

      def list_application_assignments(
        application_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationAssignmentsResponse

        input = Types::ListApplicationAssignmentsRequest.new(application_arn: application_arn, max_results: max_results, next_token: next_token)
        list_application_assignments(input)
      end

      def list_application_assignments(input : Types::ListApplicationAssignmentsRequest) : Types::ListApplicationAssignmentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_ASSIGNMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationAssignmentsResponse, "ListApplicationAssignments")
      end

      # Lists the applications to which a specified principal is assigned. You must provide a filter when
      # calling this action from a member account against your organization instance of IAM Identity Center.
      # A filter is not required when called from the management account against an organization instance of
      # IAM Identity Center, or from a member account against an account instance of IAM Identity Center in
      # the same account.

      def list_application_assignments_for_principal(
        instance_arn : String,
        principal_id : String,
        principal_type : String,
        filter : Types::ListApplicationAssignmentsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationAssignmentsForPrincipalResponse

        input = Types::ListApplicationAssignmentsForPrincipalRequest.new(instance_arn: instance_arn, principal_id: principal_id, principal_type: principal_type, filter: filter, max_results: max_results, next_token: next_token)
        list_application_assignments_for_principal(input)
      end

      def list_application_assignments_for_principal(input : Types::ListApplicationAssignmentsForPrincipalRequest) : Types::ListApplicationAssignmentsForPrincipalResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_ASSIGNMENTS_FOR_PRINCIPAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationAssignmentsForPrincipalResponse, "ListApplicationAssignmentsForPrincipal")
      end

      # Lists all of the authentication methods supported by the specified application.

      def list_application_authentication_methods(
        application_arn : String,
        next_token : String? = nil
      ) : Types::ListApplicationAuthenticationMethodsResponse

        input = Types::ListApplicationAuthenticationMethodsRequest.new(application_arn: application_arn, next_token: next_token)
        list_application_authentication_methods(input)
      end

      def list_application_authentication_methods(input : Types::ListApplicationAuthenticationMethodsRequest) : Types::ListApplicationAuthenticationMethodsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_AUTHENTICATION_METHODS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationAuthenticationMethodsResponse, "ListApplicationAuthenticationMethods")
      end

      # List the grants associated with an application.

      def list_application_grants(
        application_arn : String,
        next_token : String? = nil
      ) : Types::ListApplicationGrantsResponse

        input = Types::ListApplicationGrantsRequest.new(application_arn: application_arn, next_token: next_token)
        list_application_grants(input)
      end

      def list_application_grants(input : Types::ListApplicationGrantsRequest) : Types::ListApplicationGrantsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_GRANTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationGrantsResponse, "ListApplicationGrants")
      end

      # Lists the application providers configured in the IAM Identity Center identity store.

      def list_application_providers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationProvidersResponse

        input = Types::ListApplicationProvidersRequest.new(max_results: max_results, next_token: next_token)
        list_application_providers(input)
      end

      def list_application_providers(input : Types::ListApplicationProvidersRequest) : Types::ListApplicationProvidersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_PROVIDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationProvidersResponse, "ListApplicationProviders")
      end

      # Lists all applications associated with the instance of IAM Identity Center. When listing
      # applications for an organization instance in the management account, member accounts must use the
      # applicationAccount parameter to filter the list to only applications created from that account. When
      # listing applications for an account instance in the same member account, a filter is not required.

      def list_applications(
        instance_arn : String,
        filter : Types::ListApplicationsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationsResponse

        input = Types::ListApplicationsRequest.new(instance_arn: instance_arn, filter: filter, max_results: max_results, next_token: next_token)
        list_applications(input)
      end

      def list_applications(input : Types::ListApplicationsRequest) : Types::ListApplicationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationsResponse, "ListApplications")
      end

      # Lists all customer managed policies attached to a specified PermissionSet .

      def list_customer_managed_policy_references_in_permission_set(
        instance_arn : String,
        permission_set_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomerManagedPolicyReferencesInPermissionSetResponse

        input = Types::ListCustomerManagedPolicyReferencesInPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, max_results: max_results, next_token: next_token)
        list_customer_managed_policy_references_in_permission_set(input)
      end

      def list_customer_managed_policy_references_in_permission_set(input : Types::ListCustomerManagedPolicyReferencesInPermissionSetRequest) : Types::ListCustomerManagedPolicyReferencesInPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOMER_MANAGED_POLICY_REFERENCES_IN_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomerManagedPolicyReferencesInPermissionSetResponse, "ListCustomerManagedPolicyReferencesInPermissionSet")
      end

      # Lists the details of the organization and account instances of IAM Identity Center that were created
      # in or visible to the account calling this API.

      def list_instances(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInstancesResponse

        input = Types::ListInstancesRequest.new(max_results: max_results, next_token: next_token)
        list_instances(input)
      end

      def list_instances(input : Types::ListInstancesRequest) : Types::ListInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInstancesResponse, "ListInstances")
      end

      # Lists the Amazon Web Services managed policy that is attached to a specified permission set.

      def list_managed_policies_in_permission_set(
        instance_arn : String,
        permission_set_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListManagedPoliciesInPermissionSetResponse

        input = Types::ListManagedPoliciesInPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, max_results: max_results, next_token: next_token)
        list_managed_policies_in_permission_set(input)
      end

      def list_managed_policies_in_permission_set(input : Types::ListManagedPoliciesInPermissionSetRequest) : Types::ListManagedPoliciesInPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MANAGED_POLICIES_IN_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListManagedPoliciesInPermissionSetResponse, "ListManagedPoliciesInPermissionSet")
      end

      # Lists the status of the permission set provisioning requests for a specified IAM Identity Center
      # instance.

      def list_permission_set_provisioning_status(
        instance_arn : String,
        filter : Types::OperationStatusFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPermissionSetProvisioningStatusResponse

        input = Types::ListPermissionSetProvisioningStatusRequest.new(instance_arn: instance_arn, filter: filter, max_results: max_results, next_token: next_token)
        list_permission_set_provisioning_status(input)
      end

      def list_permission_set_provisioning_status(input : Types::ListPermissionSetProvisioningStatusRequest) : Types::ListPermissionSetProvisioningStatusResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PERMISSION_SET_PROVISIONING_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPermissionSetProvisioningStatusResponse, "ListPermissionSetProvisioningStatus")
      end

      # Lists the PermissionSet s in an IAM Identity Center instance.

      def list_permission_sets(
        instance_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPermissionSetsResponse

        input = Types::ListPermissionSetsRequest.new(instance_arn: instance_arn, max_results: max_results, next_token: next_token)
        list_permission_sets(input)
      end

      def list_permission_sets(input : Types::ListPermissionSetsRequest) : Types::ListPermissionSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PERMISSION_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPermissionSetsResponse, "ListPermissionSets")
      end

      # Lists all the permission sets that are provisioned to a specified Amazon Web Services account.

      def list_permission_sets_provisioned_to_account(
        account_id : String,
        instance_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        provisioning_status : String? = nil
      ) : Types::ListPermissionSetsProvisionedToAccountResponse

        input = Types::ListPermissionSetsProvisionedToAccountRequest.new(account_id: account_id, instance_arn: instance_arn, max_results: max_results, next_token: next_token, provisioning_status: provisioning_status)
        list_permission_sets_provisioned_to_account(input)
      end

      def list_permission_sets_provisioned_to_account(input : Types::ListPermissionSetsProvisionedToAccountRequest) : Types::ListPermissionSetsProvisionedToAccountResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PERMISSION_SETS_PROVISIONED_TO_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPermissionSetsProvisionedToAccountResponse, "ListPermissionSetsProvisionedToAccount")
      end

      # Lists the tags that are attached to a specified resource.

      def list_tags_for_resource(
        resource_arn : String,
        instance_arn : String? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, instance_arn: instance_arn, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists all the trusted token issuers configured in an instance of IAM Identity Center.

      def list_trusted_token_issuers(
        instance_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTrustedTokenIssuersResponse

        input = Types::ListTrustedTokenIssuersRequest.new(instance_arn: instance_arn, max_results: max_results, next_token: next_token)
        list_trusted_token_issuers(input)
      end

      def list_trusted_token_issuers(input : Types::ListTrustedTokenIssuersRequest) : Types::ListTrustedTokenIssuersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRUSTED_TOKEN_ISSUERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrustedTokenIssuersResponse, "ListTrustedTokenIssuers")
      end

      # The process by which a specified permission set is provisioned to the specified target.

      def provision_permission_set(
        instance_arn : String,
        permission_set_arn : String,
        target_type : String,
        target_id : String? = nil
      ) : Types::ProvisionPermissionSetResponse

        input = Types::ProvisionPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, target_type: target_type, target_id: target_id)
        provision_permission_set(input)
      end

      def provision_permission_set(input : Types::ProvisionPermissionSetRequest) : Types::ProvisionPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::PROVISION_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ProvisionPermissionSetResponse, "ProvisionPermissionSet")
      end

      # Adds or updates the list of authorized targets for an IAM Identity Center access scope for an
      # application.

      def put_application_access_scope(
        application_arn : String,
        scope : String,
        authorized_targets : Array(String)? = nil
      ) : Nil

        input = Types::PutApplicationAccessScopeRequest.new(application_arn: application_arn, scope: scope, authorized_targets: authorized_targets)
        put_application_access_scope(input)
      end

      def put_application_access_scope(input : Types::PutApplicationAccessScopeRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_APPLICATION_ACCESS_SCOPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Configure how users gain access to an application. If AssignmentsRequired is true (default value),
      # users don’t have access to the application unless an assignment is created using the
      # CreateApplicationAssignment API . If false , all users have access to the application. If an
      # assignment is created using CreateApplicationAssignment ., the user retains access if
      # AssignmentsRequired is set to true .

      def put_application_assignment_configuration(
        application_arn : String,
        assignment_required : Bool
      ) : Types::PutApplicationAssignmentConfigurationResponse

        input = Types::PutApplicationAssignmentConfigurationRequest.new(application_arn: application_arn, assignment_required: assignment_required)
        put_application_assignment_configuration(input)
      end

      def put_application_assignment_configuration(input : Types::PutApplicationAssignmentConfigurationRequest) : Types::PutApplicationAssignmentConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_APPLICATION_ASSIGNMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutApplicationAssignmentConfigurationResponse, "PutApplicationAssignmentConfiguration")
      end

      # Adds or updates an authentication method for an application.

      def put_application_authentication_method(
        application_arn : String,
        authentication_method : Types::AuthenticationMethod,
        authentication_method_type : String
      ) : Nil

        input = Types::PutApplicationAuthenticationMethodRequest.new(application_arn: application_arn, authentication_method: authentication_method, authentication_method_type: authentication_method_type)
        put_application_authentication_method(input)
      end

      def put_application_authentication_method(input : Types::PutApplicationAuthenticationMethodRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_APPLICATION_AUTHENTICATION_METHOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a configuration for an application to use grants. Conceptually grants are authorization to
      # request actions related to tokens. This configuration will be used when parties are requesting and
      # receiving tokens during the trusted identity propagation process. For more information on the IAM
      # Identity Center supported grant workflows, see SAML 2.0 and OAuth 2.0 . A grant is created between
      # your applications and Identity Center instance which enables an application to use specified
      # mechanisms to obtain tokens. These tokens are used by your applications to gain access to Amazon Web
      # Services resources on behalf of users. The following elements are within these exchanges: Requester
      # - The application requesting access to Amazon Web Services resources. Subject - Typically the user
      # that is requesting access to Amazon Web Services resources. Grant - Conceptually, a grant is
      # authorization to access Amazon Web Services resources. These grants authorize token generation for
      # authenticating access to the requester and for the request to make requests on behalf of the
      # subjects. There are four types of grants: AuthorizationCode - Allows an application to request
      # authorization through a series of user-agent redirects. JWT bearer - Authorizes an application to
      # exchange a JSON Web Token that came from an external identity provider. To learn more, see RFC 6479
      # . Refresh token - Enables application to request new access tokens to replace expiring or expired
      # access tokens. Exchange token - A grant that requests tokens from the authorization server by
      # providing a ‘subject’ token with access scope authorizing trusted identity propagation to this
      # application. To learn more, see RFC 8693 . Authorization server - IAM Identity Center requests
      # tokens. User credentials are never shared directly within these exchanges. Instead, applications use
      # grants to request access tokens from IAM Identity Center. For more information, see RFC 6479 . Use
      # cases Connecting to custom applications. Configuring an Amazon Web Services service to make calls to
      # another Amazon Web Services services using JWT tokens.

      def put_application_grant(
        application_arn : String,
        grant : Types::Grant,
        grant_type : String
      ) : Nil

        input = Types::PutApplicationGrantRequest.new(application_arn: application_arn, grant: grant, grant_type: grant_type)
        put_application_grant(input)
      end

      def put_application_grant(input : Types::PutApplicationGrantRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_APPLICATION_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the session configuration for an application in IAM Identity Center. The session
      # configuration determines how users can access an application. This includes whether user background
      # sessions are enabled. User background sessions allow users to start a job on a supported Amazon Web
      # Services managed application without having to remain signed in to an active session while the job
      # runs.

      def put_application_session_configuration(
        application_arn : String,
        user_background_session_application_status : String? = nil
      ) : Types::PutApplicationSessionConfigurationResponse

        input = Types::PutApplicationSessionConfigurationRequest.new(application_arn: application_arn, user_background_session_application_status: user_background_session_application_status)
        put_application_session_configuration(input)
      end

      def put_application_session_configuration(input : Types::PutApplicationSessionConfigurationRequest) : Types::PutApplicationSessionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_APPLICATION_SESSION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutApplicationSessionConfigurationResponse, "PutApplicationSessionConfiguration")
      end

      # Attaches an inline policy to a permission set. If the permission set is already referenced by one or
      # more account assignments, you will need to call ProvisionPermissionSet after this action to apply
      # the corresponding IAM policy updates to all assigned accounts.

      def put_inline_policy_to_permission_set(
        inline_policy : String,
        instance_arn : String,
        permission_set_arn : String
      ) : Types::PutInlinePolicyToPermissionSetResponse

        input = Types::PutInlinePolicyToPermissionSetRequest.new(inline_policy: inline_policy, instance_arn: instance_arn, permission_set_arn: permission_set_arn)
        put_inline_policy_to_permission_set(input)
      end

      def put_inline_policy_to_permission_set(input : Types::PutInlinePolicyToPermissionSetRequest) : Types::PutInlinePolicyToPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_INLINE_POLICY_TO_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutInlinePolicyToPermissionSetResponse, "PutInlinePolicyToPermissionSet")
      end

      # Attaches an Amazon Web Services managed or customer managed policy to the specified PermissionSet as
      # a permissions boundary.

      def put_permissions_boundary_to_permission_set(
        instance_arn : String,
        permission_set_arn : String,
        permissions_boundary : Types::PermissionsBoundary
      ) : Types::PutPermissionsBoundaryToPermissionSetResponse

        input = Types::PutPermissionsBoundaryToPermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, permissions_boundary: permissions_boundary)
        put_permissions_boundary_to_permission_set(input)
      end

      def put_permissions_boundary_to_permission_set(input : Types::PutPermissionsBoundaryToPermissionSetRequest) : Types::PutPermissionsBoundaryToPermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PERMISSIONS_BOUNDARY_TO_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutPermissionsBoundaryToPermissionSetResponse, "PutPermissionsBoundaryToPermissionSet")
      end

      # Associates a set of tags with a specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag),
        instance_arn : String? = nil
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags, instance_arn: instance_arn)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Disassociates a set of tags from a specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String),
        instance_arn : String? = nil
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys, instance_arn: instance_arn)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates application properties.

      def update_application(
        application_arn : String,
        description : String? = nil,
        name : String? = nil,
        portal_options : Types::UpdateApplicationPortalOptions? = nil,
        status : String? = nil
      ) : Types::UpdateApplicationResponse

        input = Types::UpdateApplicationRequest.new(application_arn: application_arn, description: description, name: name, portal_options: portal_options, status: status)
        update_application(input)
      end

      def update_application(input : Types::UpdateApplicationRequest) : Types::UpdateApplicationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApplicationResponse, "UpdateApplication")
      end

      # Update the details for the instance of IAM Identity Center that is owned by the Amazon Web Services
      # account.

      def update_instance(
        instance_arn : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        name : String? = nil
      ) : Types::UpdateInstanceResponse

        input = Types::UpdateInstanceRequest.new(instance_arn: instance_arn, encryption_configuration: encryption_configuration, name: name)
        update_instance(input)
      end

      def update_instance(input : Types::UpdateInstanceRequest) : Types::UpdateInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInstanceResponse, "UpdateInstance")
      end

      # Updates the IAM Identity Center identity store attributes that you can use with the IAM Identity
      # Center instance for attributes-based access control (ABAC). When using an external identity provider
      # as an identity source, you can pass attributes through the SAML assertion as an alternative to
      # configuring attributes from the IAM Identity Center identity store. If a SAML assertion passes any
      # of these attributes, IAM Identity Center replaces the attribute value with the value from the IAM
      # Identity Center identity store. For more information about ABAC, see Attribute-Based Access Control
      # in the IAM Identity Center User Guide .

      def update_instance_access_control_attribute_configuration(
        instance_access_control_attribute_configuration : Types::InstanceAccessControlAttributeConfiguration,
        instance_arn : String
      ) : Types::UpdateInstanceAccessControlAttributeConfigurationResponse

        input = Types::UpdateInstanceAccessControlAttributeConfigurationRequest.new(instance_access_control_attribute_configuration: instance_access_control_attribute_configuration, instance_arn: instance_arn)
        update_instance_access_control_attribute_configuration(input)
      end

      def update_instance_access_control_attribute_configuration(input : Types::UpdateInstanceAccessControlAttributeConfigurationRequest) : Types::UpdateInstanceAccessControlAttributeConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInstanceAccessControlAttributeConfigurationResponse, "UpdateInstanceAccessControlAttributeConfiguration")
      end

      # Updates an existing permission set.

      def update_permission_set(
        instance_arn : String,
        permission_set_arn : String,
        description : String? = nil,
        relay_state : String? = nil,
        session_duration : String? = nil
      ) : Types::UpdatePermissionSetResponse

        input = Types::UpdatePermissionSetRequest.new(instance_arn: instance_arn, permission_set_arn: permission_set_arn, description: description, relay_state: relay_state, session_duration: session_duration)
        update_permission_set(input)
      end

      def update_permission_set(input : Types::UpdatePermissionSetRequest) : Types::UpdatePermissionSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PERMISSION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePermissionSetResponse, "UpdatePermissionSet")
      end

      # Updates the name of the trusted token issuer, or the path of a source attribute or destination
      # attribute for a trusted token issuer configuration. Updating this trusted token issuer configuration
      # might cause users to lose access to any applications that are configured to use the trusted token
      # issuer.

      def update_trusted_token_issuer(
        trusted_token_issuer_arn : String,
        name : String? = nil,
        trusted_token_issuer_configuration : Types::TrustedTokenIssuerUpdateConfiguration? = nil
      ) : Types::UpdateTrustedTokenIssuerResponse

        input = Types::UpdateTrustedTokenIssuerRequest.new(trusted_token_issuer_arn: trusted_token_issuer_arn, name: name, trusted_token_issuer_configuration: trusted_token_issuer_configuration)
        update_trusted_token_issuer(input)
      end

      def update_trusted_token_issuer(input : Types::UpdateTrustedTokenIssuerRequest) : Types::UpdateTrustedTokenIssuerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRUSTED_TOKEN_ISSUER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTrustedTokenIssuerResponse, "UpdateTrustedTokenIssuer")
      end
    end
  end
end
