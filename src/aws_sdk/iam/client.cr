module AwsSdk
  module IAM
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

      # Accepts a delegation request, granting the requested temporary access. Once the delegation request
      # is accepted, it is eligible to send the exchange token to the partner. The SendDelegationToken API
      # has to be explicitly called to send the delegation token. At the time of acceptance, IAM records the
      # details and the state of the identity that called this API. This is the identity that gets mapped to
      # the delegated credential. An accepted request may be rejected before the exchange token is sent to
      # the partner.
      def accept_delegation_request(
        delegation_request_id : String
      ) : Nil
        input = Types::AcceptDelegationRequestRequest.new(delegation_request_id: delegation_request_id)
        accept_delegation_request(input)
      end
      def accept_delegation_request(input : Types::AcceptDelegationRequestRequest) : Nil
        request = Protocol::Query.build_request(Model::ACCEPT_DELEGATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds a new client ID (also known as audience) to the list of client IDs already registered for the
      # specified IAM OpenID Connect (OIDC) provider resource. This operation is idempotent; it does not
      # fail or return an error if you add an existing client ID to the provider.
      def add_client_id_to_open_id_connect_provider(
        client_id : String,
        open_id_connect_provider_arn : String
      ) : Nil
        input = Types::AddClientIDToOpenIDConnectProviderRequest.new(client_id: client_id, open_id_connect_provider_arn: open_id_connect_provider_arn)
        add_client_id_to_open_id_connect_provider(input)
      end
      def add_client_id_to_open_id_connect_provider(input : Types::AddClientIDToOpenIDConnectProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::ADD_CLIENT_ID_TO_OPEN_ID_CONNECT_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds the specified IAM role to the specified instance profile. An instance profile can contain only
      # one role, and this quota cannot be increased. You can remove the existing role and then add a
      # different role to an instance profile. You must then wait for the change to appear across all of
      # Amazon Web Services because of eventual consistency . To force the change, you must disassociate the
      # instance profile and then associate the instance profile , or you can stop your instance and then
      # restart it. The caller of this operation must be granted the PassRole permission on the IAM role by
      # a permissions policy. When using the iam:AssociatedResourceArn condition in a policy to restrict the
      # PassRole IAM action, special considerations apply if the policy is intended to define access for the
      # AddRoleToInstanceProfile action. In this case, you cannot specify a Region or instance ID in the EC2
      # instance ARN. The ARN value must be arn:aws:ec2:*:CallerAccountId:instance/* . Using any other ARN
      # value may lead to unexpected evaluation results. For more information about roles, see IAM roles in
      # the IAM User Guide . For more information about instance profiles, see Using instance profiles in
      # the IAM User Guide .
      def add_role_to_instance_profile(
        instance_profile_name : String,
        role_name : String
      ) : Nil
        input = Types::AddRoleToInstanceProfileRequest.new(instance_profile_name: instance_profile_name, role_name: role_name)
        add_role_to_instance_profile(input)
      end
      def add_role_to_instance_profile(input : Types::AddRoleToInstanceProfileRequest) : Nil
        request = Protocol::Query.build_request(Model::ADD_ROLE_TO_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds the specified user to the specified group.
      def add_user_to_group(
        group_name : String,
        user_name : String
      ) : Nil
        input = Types::AddUserToGroupRequest.new(group_name: group_name, user_name: user_name)
        add_user_to_group(input)
      end
      def add_user_to_group(input : Types::AddUserToGroupRequest) : Nil
        request = Protocol::Query.build_request(Model::ADD_USER_TO_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Associates a delegation request with the current identity. If the partner that created the
      # delegation request has specified the owner account during creation, only an identity from that owner
      # account can call the AssociateDelegationRequest API for the specified delegation request. Once the
      # AssociateDelegationRequest API call is successful, the ARN of the current calling identity will be
      # stored as the ownerId of the request. If the partner that created the delegation request has not
      # specified the owner account during creation, any caller from any account can call the
      # AssociateDelegationRequest API for the delegation request. Once this API call is successful, the ARN
      # of the current calling identity will be stored as the ownerId and the Amazon Web Services account ID
      # of the current calling identity will be stored as the ownerAccount of the request. For more details,
      # see Managing Permissions for Delegation Requests .
      def associate_delegation_request(
        delegation_request_id : String
      ) : Nil
        input = Types::AssociateDelegationRequestRequest.new(delegation_request_id: delegation_request_id)
        associate_delegation_request(input)
      end
      def associate_delegation_request(input : Types::AssociateDelegationRequestRequest) : Nil
        request = Protocol::Query.build_request(Model::ASSOCIATE_DELEGATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Attaches the specified managed policy to the specified IAM group. You use this operation to attach a
      # managed policy to a group. To embed an inline policy in a group, use PutGroupPolicy . As a best
      # practice, you can validate your IAM policies. To learn more, see Validating IAM policies in the IAM
      # User Guide . For more information about policies, see Managed policies and inline policies in the
      # IAM User Guide .
      def attach_group_policy(
        group_name : String,
        policy_arn : String
      ) : Nil
        input = Types::AttachGroupPolicyRequest.new(group_name: group_name, policy_arn: policy_arn)
        attach_group_policy(input)
      end
      def attach_group_policy(input : Types::AttachGroupPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::ATTACH_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Attaches the specified managed policy to the specified IAM role. When you attach a managed policy to
      # a role, the managed policy becomes part of the role's permission (access) policy. You cannot use a
      # managed policy as the role's trust policy. The role's trust policy is created at the same time as
      # the role, using CreateRole . You can update a role's trust policy using UpdateAssumerolePolicy . Use
      # this operation to attach a managed policy to a role. To embed an inline policy in a role, use
      # PutRolePolicy . For more information about policies, see Managed policies and inline policies in the
      # IAM User Guide . As a best practice, you can validate your IAM policies. To learn more, see
      # Validating IAM policies in the IAM User Guide .
      def attach_role_policy(
        policy_arn : String,
        role_name : String
      ) : Nil
        input = Types::AttachRolePolicyRequest.new(policy_arn: policy_arn, role_name: role_name)
        attach_role_policy(input)
      end
      def attach_role_policy(input : Types::AttachRolePolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::ATTACH_ROLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Attaches the specified managed policy to the specified user. You use this operation to attach a
      # managed policy to a user. To embed an inline policy in a user, use PutUserPolicy . As a best
      # practice, you can validate your IAM policies. To learn more, see Validating IAM policies in the IAM
      # User Guide . For more information about policies, see Managed policies and inline policies in the
      # IAM User Guide .
      def attach_user_policy(
        policy_arn : String,
        user_name : String
      ) : Nil
        input = Types::AttachUserPolicyRequest.new(policy_arn: policy_arn, user_name: user_name)
        attach_user_policy(input)
      end
      def attach_user_policy(input : Types::AttachUserPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::ATTACH_USER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Changes the password of the IAM user who is calling this operation. This operation can be performed
      # using the CLI, the Amazon Web Services API, or the My Security Credentials page in the Amazon Web
      # Services Management Console. The Amazon Web Services account root user password is not affected by
      # this operation. Use UpdateLoginProfile to use the CLI, the Amazon Web Services API, or the Users
      # page in the IAM console to change the password for any IAM user. For more information about
      # modifying passwords, see Managing passwords in the IAM User Guide .
      def change_password(
        new_password : String,
        old_password : String
      ) : Nil
        input = Types::ChangePasswordRequest.new(new_password: new_password, old_password: old_password)
        change_password(input)
      end
      def change_password(input : Types::ChangePasswordRequest) : Nil
        request = Protocol::Query.build_request(Model::CHANGE_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a new Amazon Web Services secret access key and corresponding Amazon Web Services access key
      # ID for the specified user. The default status for new keys is Active . If you do not specify a user
      # name, IAM determines the user name implicitly based on the Amazon Web Services access key ID signing
      # the request. This operation works for access keys under the Amazon Web Services account.
      # Consequently, you can use this operation to manage Amazon Web Services account root user
      # credentials. This is true even if the Amazon Web Services account has no associated users. For
      # information about quotas on the number of keys you can create, see IAM and STS quotas in the IAM
      # User Guide . To ensure the security of your Amazon Web Services account, the secret access key is
      # accessible only during key and user creation. You must save the key (for example, in a text file) if
      # you want to be able to access it again. If a secret key is lost, you can delete the access keys for
      # the associated user and then create new keys.
      def create_access_key(
        user_name : String? = nil
      ) : Types::CreateAccessKeyResponse
        input = Types::CreateAccessKeyRequest.new(user_name: user_name)
        create_access_key(input)
      end
      def create_access_key(input : Types::CreateAccessKeyRequest) : Types::CreateAccessKeyResponse
        request = Protocol::Query.build_request(Model::CREATE_ACCESS_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateAccessKeyResponse, "CreateAccessKey")
      end

      # Creates an alias for your Amazon Web Services account. For information about using an Amazon Web
      # Services account alias, see Creating, deleting, and listing an Amazon Web Services account alias in
      # the Amazon Web Services Sign-In User Guide .
      def create_account_alias(
        account_alias : String
      ) : Nil
        input = Types::CreateAccountAliasRequest.new(account_alias: account_alias)
        create_account_alias(input)
      end
      def create_account_alias(input : Types::CreateAccountAliasRequest) : Nil
        request = Protocol::Query.build_request(Model::CREATE_ACCOUNT_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an IAM delegation request for temporary access delegation. This API is not available for
      # general use. In order to use this API, a caller first need to go through an onboarding process
      # described in the partner onboarding documentation .
      def create_delegation_request(
        description : String,
        notification_channel : String,
        permissions : Types::DelegationPermission,
        requestor_workflow_id : String,
        session_duration : Int32,
        only_send_by_owner : Bool? = nil,
        owner_account_id : String? = nil,
        redirect_url : String? = nil,
        request_message : String? = nil
      ) : Types::CreateDelegationRequestResponse
        input = Types::CreateDelegationRequestRequest.new(description: description, notification_channel: notification_channel, permissions: permissions, requestor_workflow_id: requestor_workflow_id, session_duration: session_duration, only_send_by_owner: only_send_by_owner, owner_account_id: owner_account_id, redirect_url: redirect_url, request_message: request_message)
        create_delegation_request(input)
      end
      def create_delegation_request(input : Types::CreateDelegationRequestRequest) : Types::CreateDelegationRequestResponse
        request = Protocol::Query.build_request(Model::CREATE_DELEGATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDelegationRequestResponse, "CreateDelegationRequest")
      end

      # Creates a new group. For information about the number of groups you can create, see IAM and STS
      # quotas in the IAM User Guide .
      def create_group(
        group_name : String,
        path : String? = nil
      ) : Types::CreateGroupResponse
        input = Types::CreateGroupRequest.new(group_name: group_name, path: path)
        create_group(input)
      end
      def create_group(input : Types::CreateGroupRequest) : Types::CreateGroupResponse
        request = Protocol::Query.build_request(Model::CREATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateGroupResponse, "CreateGroup")
      end

      # Creates a new instance profile. For information about instance profiles, see Using roles for
      # applications on Amazon EC2 in the IAM User Guide , and Instance profiles in the Amazon EC2 User
      # Guide . For information about the number of instance profiles you can create, see IAM object quotas
      # in the IAM User Guide .
      def create_instance_profile(
        instance_profile_name : String,
        path : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateInstanceProfileResponse
        input = Types::CreateInstanceProfileRequest.new(instance_profile_name: instance_profile_name, path: path, tags: tags)
        create_instance_profile(input)
      end
      def create_instance_profile(input : Types::CreateInstanceProfileRequest) : Types::CreateInstanceProfileResponse
        request = Protocol::Query.build_request(Model::CREATE_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateInstanceProfileResponse, "CreateInstanceProfile")
      end

      # Creates a password for the specified IAM user. A password allows an IAM user to access Amazon Web
      # Services services through the Amazon Web Services Management Console. You can use the CLI, the
      # Amazon Web Services API, or the Users page in the IAM console to create a password for any IAM user.
      # Use ChangePassword to update your own existing password in the My Security Credentials page in the
      # Amazon Web Services Management Console. For more information about managing passwords, see Managing
      # passwords in the IAM User Guide .
      def create_login_profile(
        password : String? = nil,
        password_reset_required : Bool? = nil,
        user_name : String? = nil
      ) : Types::CreateLoginProfileResponse
        input = Types::CreateLoginProfileRequest.new(password: password, password_reset_required: password_reset_required, user_name: user_name)
        create_login_profile(input)
      end
      def create_login_profile(input : Types::CreateLoginProfileRequest) : Types::CreateLoginProfileResponse
        request = Protocol::Query.build_request(Model::CREATE_LOGIN_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateLoginProfileResponse, "CreateLoginProfile")
      end

      # Creates an IAM entity to describe an identity provider (IdP) that supports OpenID Connect (OIDC) .
      # The OIDC provider that you create with this operation can be used as a principal in a role's trust
      # policy. Such a policy establishes a trust relationship between Amazon Web Services and the OIDC
      # provider. If you are using an OIDC identity provider from Google, Facebook, or Amazon Cognito, you
      # don't need to create a separate IAM identity provider. These OIDC identity providers are already
      # built-in to Amazon Web Services and are available for your use. Instead, you can move directly to
      # creating new roles using your identity provider. To learn more, see Creating a role for web identity
      # or OpenID connect federation in the IAM User Guide . When you create the IAM OIDC provider, you
      # specify the following: The URL of the OIDC identity provider (IdP) to trust A list of client IDs
      # (also known as audiences) that identify the application or applications allowed to authenticate
      # using the OIDC provider A list of tags that are attached to the specified IAM OIDC provider A list
      # of thumbprints of one or more server certificates that the IdP uses You get all of this information
      # from the OIDC IdP you want to use to access Amazon Web Services. Amazon Web Services secures
      # communication with OIDC identity providers (IdPs) using our library of trusted root certificate
      # authorities (CAs) to verify the JSON Web Key Set (JWKS) endpoint's TLS certificate. If your OIDC IdP
      # relies on a certificate that is not signed by one of these trusted CAs, only then we secure
      # communication using the thumbprints set in the IdP's configuration. The trust for the OIDC provider
      # is derived from the IAM provider that this operation creates. Therefore, it is best to limit access
      # to the CreateOpenIDConnectProvider operation to highly privileged users.
      def create_open_id_connect_provider(
        url : String,
        client_id_list : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        thumbprint_list : Array(String)? = nil
      ) : Types::CreateOpenIDConnectProviderResponse
        input = Types::CreateOpenIDConnectProviderRequest.new(url: url, client_id_list: client_id_list, tags: tags, thumbprint_list: thumbprint_list)
        create_open_id_connect_provider(input)
      end
      def create_open_id_connect_provider(input : Types::CreateOpenIDConnectProviderRequest) : Types::CreateOpenIDConnectProviderResponse
        request = Protocol::Query.build_request(Model::CREATE_OPEN_ID_CONNECT_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateOpenIDConnectProviderResponse, "CreateOpenIDConnectProvider")
      end

      # Creates a new managed policy for your Amazon Web Services account. This operation creates a policy
      # version with a version identifier of v1 and sets v1 as the policy's default version. For more
      # information about policy versions, see Versioning for managed policies in the IAM User Guide . As a
      # best practice, you can validate your IAM policies. To learn more, see Validating IAM policies in the
      # IAM User Guide . For more information about managed policies in general, see Managed policies and
      # inline policies in the IAM User Guide .
      def create_policy(
        policy_document : String,
        policy_name : String,
        description : String? = nil,
        path : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePolicyResponse
        input = Types::CreatePolicyRequest.new(policy_document: policy_document, policy_name: policy_name, description: description, path: path, tags: tags)
        create_policy(input)
      end
      def create_policy(input : Types::CreatePolicyRequest) : Types::CreatePolicyResponse
        request = Protocol::Query.build_request(Model::CREATE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreatePolicyResponse, "CreatePolicy")
      end

      # Creates a new version of the specified managed policy. To update a managed policy, you create a new
      # policy version. A managed policy can have up to five versions. If the policy has five versions, you
      # must delete an existing version using DeletePolicyVersion before you create a new version.
      # Optionally, you can set the new version as the policy's default version. The default version is the
      # version that is in effect for the IAM users, groups, and roles to which the policy is attached. For
      # more information about managed policy versions, see Versioning for managed policies in the IAM User
      # Guide .
      def create_policy_version(
        policy_arn : String,
        policy_document : String,
        set_as_default : Bool? = nil
      ) : Types::CreatePolicyVersionResponse
        input = Types::CreatePolicyVersionRequest.new(policy_arn: policy_arn, policy_document: policy_document, set_as_default: set_as_default)
        create_policy_version(input)
      end
      def create_policy_version(input : Types::CreatePolicyVersionRequest) : Types::CreatePolicyVersionResponse
        request = Protocol::Query.build_request(Model::CREATE_POLICY_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreatePolicyVersionResponse, "CreatePolicyVersion")
      end

      # Creates a new role for your Amazon Web Services account. For more information about roles, see IAM
      # roles in the IAM User Guide . For information about quotas for role names and the number of roles
      # you can create, see IAM and STS quotas in the IAM User Guide .
      def create_role(
        assume_role_policy_document : String,
        role_name : String,
        description : String? = nil,
        max_session_duration : Int32? = nil,
        path : String? = nil,
        permissions_boundary : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRoleResponse
        input = Types::CreateRoleRequest.new(assume_role_policy_document: assume_role_policy_document, role_name: role_name, description: description, max_session_duration: max_session_duration, path: path, permissions_boundary: permissions_boundary, tags: tags)
        create_role(input)
      end
      def create_role(input : Types::CreateRoleRequest) : Types::CreateRoleResponse
        request = Protocol::Query.build_request(Model::CREATE_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateRoleResponse, "CreateRole")
      end

      # Creates an IAM resource that describes an identity provider (IdP) that supports SAML 2.0. The SAML
      # provider resource that you create with this operation can be used as a principal in an IAM role's
      # trust policy. Such a policy can enable federated users who sign in using the SAML IdP to assume the
      # role. You can create an IAM role that supports Web-based single sign-on (SSO) to the Amazon Web
      # Services Management Console or one that supports API access to Amazon Web Services. When you create
      # the SAML provider resource, you upload a SAML metadata document that you get from your IdP. That
      # document includes the issuer's name, expiration information, and keys that can be used to validate
      # the SAML authentication response (assertions) that the IdP sends. You must generate the metadata
      # document using the identity management software that is used as your organization's IdP. This
      # operation requires Signature Version 4 . For more information, see Enabling SAML 2.0 federated users
      # to access the Amazon Web Services Management Console and About SAML 2.0-based federation in the IAM
      # User Guide .
      def create_saml_provider(
        name : String,
        saml_metadata_document : String,
        add_private_key : String? = nil,
        assertion_encryption_mode : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSAMLProviderResponse
        input = Types::CreateSAMLProviderRequest.new(name: name, saml_metadata_document: saml_metadata_document, add_private_key: add_private_key, assertion_encryption_mode: assertion_encryption_mode, tags: tags)
        create_saml_provider(input)
      end
      def create_saml_provider(input : Types::CreateSAMLProviderRequest) : Types::CreateSAMLProviderResponse
        request = Protocol::Query.build_request(Model::CREATE_SAML_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateSAMLProviderResponse, "CreateSAMLProvider")
      end

      # Creates an IAM role that is linked to a specific Amazon Web Services service. The service controls
      # the attached policies and when the role can be deleted. This helps ensure that the service is not
      # broken by an unexpectedly changed or deleted role, which could put your Amazon Web Services
      # resources into an unknown state. Allowing the service to control the role helps improve service
      # stability and proper cleanup when a service and its role are no longer needed. For more information,
      # see Using service-linked roles in the IAM User Guide . To attach a policy to this service-linked
      # role, you must make the request using the Amazon Web Services service that depends on this role.
      def create_service_linked_role(
        aws_service_name : String,
        custom_suffix : String? = nil,
        description : String? = nil
      ) : Types::CreateServiceLinkedRoleResponse
        input = Types::CreateServiceLinkedRoleRequest.new(aws_service_name: aws_service_name, custom_suffix: custom_suffix, description: description)
        create_service_linked_role(input)
      end
      def create_service_linked_role(input : Types::CreateServiceLinkedRoleRequest) : Types::CreateServiceLinkedRoleResponse
        request = Protocol::Query.build_request(Model::CREATE_SERVICE_LINKED_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateServiceLinkedRoleResponse, "CreateServiceLinkedRole")
      end

      # Generates a set of credentials consisting of a user name and password that can be used to access the
      # service specified in the request. These credentials are generated by IAM, and can be used only for
      # the specified service. You can have a maximum of two sets of service-specific credentials for each
      # supported service per user. You can create service-specific credentials for Amazon Bedrock,
      # CodeCommit and Amazon Keyspaces (for Apache Cassandra). You can reset the password to a new
      # service-generated value by calling ResetServiceSpecificCredential . For more information about
      # service-specific credentials, see Service-specific credentials for IAM users in the IAM User Guide .
      def create_service_specific_credential(
        service_name : String,
        user_name : String,
        credential_age_days : Int32? = nil
      ) : Types::CreateServiceSpecificCredentialResponse
        input = Types::CreateServiceSpecificCredentialRequest.new(service_name: service_name, user_name: user_name, credential_age_days: credential_age_days)
        create_service_specific_credential(input)
      end
      def create_service_specific_credential(input : Types::CreateServiceSpecificCredentialRequest) : Types::CreateServiceSpecificCredentialResponse
        request = Protocol::Query.build_request(Model::CREATE_SERVICE_SPECIFIC_CREDENTIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateServiceSpecificCredentialResponse, "CreateServiceSpecificCredential")
      end

      # Creates a new IAM user for your Amazon Web Services account. For information about quotas for the
      # number of IAM users you can create, see IAM and STS quotas in the IAM User Guide .
      def create_user(
        user_name : String,
        path : String? = nil,
        permissions_boundary : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateUserResponse
        input = Types::CreateUserRequest.new(user_name: user_name, path: path, permissions_boundary: permissions_boundary, tags: tags)
        create_user(input)
      end
      def create_user(input : Types::CreateUserRequest) : Types::CreateUserResponse
        request = Protocol::Query.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateUserResponse, "CreateUser")
      end

      # Creates a new virtual MFA device for the Amazon Web Services account. After creating the virtual
      # MFA, use EnableMFADevice to attach the MFA device to an IAM user. For more information about
      # creating and working with virtual MFA devices, see Using a virtual MFA device in the IAM User Guide
      # . For information about the maximum number of MFA devices you can create, see IAM and STS quotas in
      # the IAM User Guide . The seed information contained in the QR code and the Base32 string should be
      # treated like any other secret access information. In other words, protect the seed information as
      # you would your Amazon Web Services access keys or your passwords. After you provision your virtual
      # device, you should ensure that the information is destroyed following secure procedures.
      def create_virtual_mfa_device(
        virtual_mfa_device_name : String,
        path : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVirtualMFADeviceResponse
        input = Types::CreateVirtualMFADeviceRequest.new(virtual_mfa_device_name: virtual_mfa_device_name, path: path, tags: tags)
        create_virtual_mfa_device(input)
      end
      def create_virtual_mfa_device(input : Types::CreateVirtualMFADeviceRequest) : Types::CreateVirtualMFADeviceResponse
        request = Protocol::Query.build_request(Model::CREATE_VIRTUAL_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateVirtualMFADeviceResponse, "CreateVirtualMFADevice")
      end

      # Deactivates the specified MFA device and removes it from association with the user name for which it
      # was originally enabled. For more information about creating and working with virtual MFA devices,
      # see Enabling a virtual multi-factor authentication (MFA) device in the IAM User Guide .
      def deactivate_mfa_device(
        serial_number : String,
        user_name : String? = nil
      ) : Nil
        input = Types::DeactivateMFADeviceRequest.new(serial_number: serial_number, user_name: user_name)
        deactivate_mfa_device(input)
      end
      def deactivate_mfa_device(input : Types::DeactivateMFADeviceRequest) : Nil
        request = Protocol::Query.build_request(Model::DEACTIVATE_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the access key pair associated with the specified IAM user. If you do not specify a user
      # name, IAM determines the user name implicitly based on the Amazon Web Services access key ID signing
      # the request. This operation works for access keys under the Amazon Web Services account.
      # Consequently, you can use this operation to manage Amazon Web Services account root user credentials
      # even if the Amazon Web Services account has no associated users.
      def delete_access_key(
        access_key_id : String,
        user_name : String? = nil
      ) : Nil
        input = Types::DeleteAccessKeyRequest.new(access_key_id: access_key_id, user_name: user_name)
        delete_access_key(input)
      end
      def delete_access_key(input : Types::DeleteAccessKeyRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ACCESS_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified Amazon Web Services account alias. For information about using an Amazon Web
      # Services account alias, see Creating, deleting, and listing an Amazon Web Services account alias in
      # the Amazon Web Services Sign-In User Guide .
      def delete_account_alias(
        account_alias : String
      ) : Nil
        input = Types::DeleteAccountAliasRequest.new(account_alias: account_alias)
        delete_account_alias(input)
      end
      def delete_account_alias(input : Types::DeleteAccountAliasRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ACCOUNT_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the password policy for the Amazon Web Services account. There are no parameters.
      def delete_account_password_policy : Nil
        request = Protocol::Query.build_request(Model::DELETE_ACCOUNT_PASSWORD_POLICY, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified IAM group. The group must not contain any users or have any attached policies.
      def delete_group(
        group_name : String
      ) : Nil
        input = Types::DeleteGroupRequest.new(group_name: group_name)
        delete_group(input)
      end
      def delete_group(input : Types::DeleteGroupRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified inline policy that is embedded in the specified IAM group. A group can also
      # have managed policies attached to it. To detach a managed policy from a group, use DetachGroupPolicy
      # . For more information about policies, refer to Managed policies and inline policies in the IAM User
      # Guide .
      def delete_group_policy(
        group_name : String,
        policy_name : String
      ) : Nil
        input = Types::DeleteGroupPolicyRequest.new(group_name: group_name, policy_name: policy_name)
        delete_group_policy(input)
      end
      def delete_group_policy(input : Types::DeleteGroupPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified instance profile. The instance profile must not have an associated role. Make
      # sure that you do not have any Amazon EC2 instances running with the instance profile you are about
      # to delete. Deleting a role or instance profile that is associated with a running instance will break
      # any applications running on the instance. For more information about instance profiles, see Using
      # instance profiles in the IAM User Guide .
      def delete_instance_profile(
        instance_profile_name : String
      ) : Nil
        input = Types::DeleteInstanceProfileRequest.new(instance_profile_name: instance_profile_name)
        delete_instance_profile(input)
      end
      def delete_instance_profile(input : Types::DeleteInstanceProfileRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the password for the specified IAM user or root user, For more information, see Managing
      # passwords for IAM users . You can use the CLI, the Amazon Web Services API, or the Users page in the
      # IAM console to delete a password for any IAM user. You can use ChangePassword to update, but not
      # delete, your own password in the My Security Credentials page in the Amazon Web Services Management
      # Console. Deleting a user's password does not prevent a user from accessing Amazon Web Services
      # through the command line interface or the API. To prevent all user access, you must also either make
      # any access keys inactive or delete them. For more information about making keys inactive or deleting
      # them, see UpdateAccessKey and DeleteAccessKey .
      def delete_login_profile(
        user_name : String? = nil
      ) : Nil
        input = Types::DeleteLoginProfileRequest.new(user_name: user_name)
        delete_login_profile(input)
      end
      def delete_login_profile(input : Types::DeleteLoginProfileRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_LOGIN_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an OpenID Connect identity provider (IdP) resource object in IAM. Deleting an IAM OIDC
      # provider resource does not update any roles that reference the provider as a principal in their
      # trust policies. Any attempt to assume a role that references a deleted provider fails. This
      # operation is idempotent; it does not fail or return an error if you call the operation for a
      # provider that does not exist.
      def delete_open_id_connect_provider(
        open_id_connect_provider_arn : String
      ) : Nil
        input = Types::DeleteOpenIDConnectProviderRequest.new(open_id_connect_provider_arn: open_id_connect_provider_arn)
        delete_open_id_connect_provider(input)
      end
      def delete_open_id_connect_provider(input : Types::DeleteOpenIDConnectProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_OPEN_ID_CONNECT_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified managed policy. Before you can delete a managed policy, you must first detach
      # the policy from all users, groups, and roles that it is attached to. In addition, you must delete
      # all the policy's versions. The following steps describe the process for deleting a managed policy:
      # Detach the policy from all users, groups, and roles that the policy is attached to, using
      # DetachUserPolicy , DetachGroupPolicy , or DetachRolePolicy . To list all the users, groups, and
      # roles that a policy is attached to, use ListEntitiesForPolicy . Delete all versions of the policy
      # using DeletePolicyVersion . To list the policy's versions, use ListPolicyVersions . You cannot use
      # DeletePolicyVersion to delete the version that is marked as the default version. You delete the
      # policy's default version in the next step of the process. Delete the policy (this automatically
      # deletes the policy's default version) using this operation. For information about managed policies,
      # see Managed policies and inline policies in the IAM User Guide .
      def delete_policy(
        policy_arn : String
      ) : Nil
        input = Types::DeletePolicyRequest.new(policy_arn: policy_arn)
        delete_policy(input)
      end
      def delete_policy(input : Types::DeletePolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified version from the specified managed policy. You cannot delete the default
      # version from a policy using this operation. To delete the default version from a policy, use
      # DeletePolicy . To find out which version of a policy is marked as the default version, use
      # ListPolicyVersions . For information about versions for managed policies, see Versioning for managed
      # policies in the IAM User Guide .
      def delete_policy_version(
        policy_arn : String,
        version_id : String
      ) : Nil
        input = Types::DeletePolicyVersionRequest.new(policy_arn: policy_arn, version_id: version_id)
        delete_policy_version(input)
      end
      def delete_policy_version(input : Types::DeletePolicyVersionRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_POLICY_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified role. Unlike the Amazon Web Services Management Console, when you delete a
      # role programmatically, you must delete the items attached to the role manually, or the deletion
      # fails. For more information, see Deleting an IAM role . Before attempting to delete a role, remove
      # the following attached items: Inline policies ( DeleteRolePolicy ) Attached managed policies (
      # DetachRolePolicy ) Instance profile ( RemoveRoleFromInstanceProfile ) Optional – Delete instance
      # profile after detaching from role for resource clean up ( DeleteInstanceProfile ) Make sure that you
      # do not have any Amazon EC2 instances running with the role you are about to delete. Deleting a role
      # or instance profile that is associated with a running instance will break any applications running
      # on the instance.
      def delete_role(
        role_name : String
      ) : Nil
        input = Types::DeleteRoleRequest.new(role_name: role_name)
        delete_role(input)
      end
      def delete_role(input : Types::DeleteRoleRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the permissions boundary for the specified IAM role. You cannot set the boundary for a
      # service-linked role. Deleting the permissions boundary for a role might increase its permissions.
      # For example, it might allow anyone who assumes the role to perform all the actions granted in its
      # permissions policies.
      def delete_role_permissions_boundary(
        role_name : String
      ) : Nil
        input = Types::DeleteRolePermissionsBoundaryRequest.new(role_name: role_name)
        delete_role_permissions_boundary(input)
      end
      def delete_role_permissions_boundary(input : Types::DeleteRolePermissionsBoundaryRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ROLE_PERMISSIONS_BOUNDARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified inline policy that is embedded in the specified IAM role. A role can also have
      # managed policies attached to it. To detach a managed policy from a role, use DetachRolePolicy . For
      # more information about policies, refer to Managed policies and inline policies in the IAM User Guide
      # .
      def delete_role_policy(
        policy_name : String,
        role_name : String
      ) : Nil
        input = Types::DeleteRolePolicyRequest.new(policy_name: policy_name, role_name: role_name)
        delete_role_policy(input)
      end
      def delete_role_policy(input : Types::DeleteRolePolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ROLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a SAML provider resource in IAM. Deleting the provider resource from IAM does not update any
      # roles that reference the SAML provider resource's ARN as a principal in their trust policies. Any
      # attempt to assume a role that references a non-existent provider resource ARN fails. This operation
      # requires Signature Version 4 .
      def delete_saml_provider(
        saml_provider_arn : String
      ) : Nil
        input = Types::DeleteSAMLProviderRequest.new(saml_provider_arn: saml_provider_arn)
        delete_saml_provider(input)
      end
      def delete_saml_provider(input : Types::DeleteSAMLProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SAML_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified SSH public key. The SSH public key deleted by this operation is used only for
      # authenticating the associated IAM user to an CodeCommit repository. For more information about using
      # SSH keys to authenticate to an CodeCommit repository, see Set up CodeCommit for SSH connections in
      # the CodeCommit User Guide .
      def delete_ssh_public_key(
        ssh_public_key_id : String,
        user_name : String
      ) : Nil
        input = Types::DeleteSSHPublicKeyRequest.new(ssh_public_key_id: ssh_public_key_id, user_name: user_name)
        delete_ssh_public_key(input)
      end
      def delete_ssh_public_key(input : Types::DeleteSSHPublicKeyRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified server certificate. For more information about working with server
      # certificates, see Working with server certificates in the IAM User Guide . This topic also includes
      # a list of Amazon Web Services services that can use the server certificates that you manage with
      # IAM. If you are using a server certificate with Elastic Load Balancing, deleting the certificate
      # could have implications for your application. If Elastic Load Balancing doesn't detect the deletion
      # of bound certificates, it may continue to use the certificates. This could cause Elastic Load
      # Balancing to stop accepting traffic. We recommend that you remove the reference to the certificate
      # from Elastic Load Balancing before using this command to delete the certificate. For more
      # information, see DeleteLoadBalancerListeners in the Elastic Load Balancing API Reference .
      def delete_server_certificate(
        server_certificate_name : String
      ) : Nil
        input = Types::DeleteServerCertificateRequest.new(server_certificate_name: server_certificate_name)
        delete_server_certificate(input)
      end
      def delete_server_certificate(input : Types::DeleteServerCertificateRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SERVER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Submits a service-linked role deletion request and returns a DeletionTaskId , which you can use to
      # check the status of the deletion. Before you call this operation, confirm that the role has no
      # active sessions and that any resources used by the role in the linked service are deleted. If you
      # call this operation more than once for the same service-linked role and an earlier deletion task is
      # not complete, then the DeletionTaskId of the earlier request is returned. If you submit a deletion
      # request for a service-linked role whose linked service is still accessing a resource, then the
      # deletion task fails. If it fails, the GetServiceLinkedRoleDeletionStatus operation returns the
      # reason for the failure, usually including the resources that must be deleted. To delete the
      # service-linked role, you must first remove those resources from the linked service and then submit
      # the deletion request again. Resources are specific to the service that is linked to the role. For
      # more information about removing resources from a service, see the Amazon Web Services documentation
      # for your service. For more information about service-linked roles, see Roles terms and concepts:
      # Amazon Web Services service-linked role in the IAM User Guide .
      def delete_service_linked_role(
        role_name : String
      ) : Types::DeleteServiceLinkedRoleResponse
        input = Types::DeleteServiceLinkedRoleRequest.new(role_name: role_name)
        delete_service_linked_role(input)
      end
      def delete_service_linked_role(input : Types::DeleteServiceLinkedRoleRequest) : Types::DeleteServiceLinkedRoleResponse
        request = Protocol::Query.build_request(Model::DELETE_SERVICE_LINKED_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteServiceLinkedRoleResponse, "DeleteServiceLinkedRole")
      end

      # Deletes the specified service-specific credential.
      def delete_service_specific_credential(
        service_specific_credential_id : String,
        user_name : String? = nil
      ) : Nil
        input = Types::DeleteServiceSpecificCredentialRequest.new(service_specific_credential_id: service_specific_credential_id, user_name: user_name)
        delete_service_specific_credential(input)
      end
      def delete_service_specific_credential(input : Types::DeleteServiceSpecificCredentialRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SERVICE_SPECIFIC_CREDENTIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a signing certificate associated with the specified IAM user. If you do not specify a user
      # name, IAM determines the user name implicitly based on the Amazon Web Services access key ID signing
      # the request. This operation works for access keys under the Amazon Web Services account.
      # Consequently, you can use this operation to manage Amazon Web Services account root user credentials
      # even if the Amazon Web Services account has no associated IAM users.
      def delete_signing_certificate(
        certificate_id : String,
        user_name : String? = nil
      ) : Nil
        input = Types::DeleteSigningCertificateRequest.new(certificate_id: certificate_id, user_name: user_name)
        delete_signing_certificate(input)
      end
      def delete_signing_certificate(input : Types::DeleteSigningCertificateRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SIGNING_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified IAM user. Unlike the Amazon Web Services Management Console, when you delete a
      # user programmatically, you must delete the items attached to the user manually, or the deletion
      # fails. For more information, see Deleting an IAM user . Before attempting to delete a user, remove
      # the following items: Password ( DeleteLoginProfile ) Access keys ( DeleteAccessKey ) Signing
      # certificate ( DeleteSigningCertificate ) SSH public key ( DeleteSSHPublicKey ) Git credentials (
      # DeleteServiceSpecificCredential ) Multi-factor authentication (MFA) device ( DeactivateMFADevice ,
      # DeleteVirtualMFADevice ) Inline policies ( DeleteUserPolicy ) Attached managed policies (
      # DetachUserPolicy ) Group memberships ( RemoveUserFromGroup )
      def delete_user(
        user_name : String
      ) : Nil
        input = Types::DeleteUserRequest.new(user_name: user_name)
        delete_user(input)
      end
      def delete_user(input : Types::DeleteUserRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the permissions boundary for the specified IAM user. Deleting the permissions boundary for a
      # user might increase its permissions by allowing the user to perform all the actions granted in its
      # permissions policies.
      def delete_user_permissions_boundary(
        user_name : String
      ) : Nil
        input = Types::DeleteUserPermissionsBoundaryRequest.new(user_name: user_name)
        delete_user_permissions_boundary(input)
      end
      def delete_user_permissions_boundary(input : Types::DeleteUserPermissionsBoundaryRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_USER_PERMISSIONS_BOUNDARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified inline policy that is embedded in the specified IAM user. A user can also have
      # managed policies attached to it. To detach a managed policy from a user, use DetachUserPolicy . For
      # more information about policies, refer to Managed policies and inline policies in the IAM User Guide
      # .
      def delete_user_policy(
        policy_name : String,
        user_name : String
      ) : Nil
        input = Types::DeleteUserPolicyRequest.new(policy_name: policy_name, user_name: user_name)
        delete_user_policy(input)
      end
      def delete_user_policy(input : Types::DeleteUserPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_USER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a virtual MFA device. You must deactivate a user's virtual MFA device before you can delete
      # it. For information about deactivating MFA devices, see DeactivateMFADevice .
      def delete_virtual_mfa_device(
        serial_number : String
      ) : Nil
        input = Types::DeleteVirtualMFADeviceRequest.new(serial_number: serial_number)
        delete_virtual_mfa_device(input)
      end
      def delete_virtual_mfa_device(input : Types::DeleteVirtualMFADeviceRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_VIRTUAL_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified managed policy from the specified IAM group. A group can also have inline
      # policies embedded with it. To delete an inline policy, use DeleteGroupPolicy . For information about
      # policies, see Managed policies and inline policies in the IAM User Guide .
      def detach_group_policy(
        group_name : String,
        policy_arn : String
      ) : Nil
        input = Types::DetachGroupPolicyRequest.new(group_name: group_name, policy_arn: policy_arn)
        detach_group_policy(input)
      end
      def detach_group_policy(input : Types::DetachGroupPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::DETACH_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified managed policy from the specified role. A role can also have inline policies
      # embedded with it. To delete an inline policy, use DeleteRolePolicy . For information about policies,
      # see Managed policies and inline policies in the IAM User Guide .
      def detach_role_policy(
        policy_arn : String,
        role_name : String
      ) : Nil
        input = Types::DetachRolePolicyRequest.new(policy_arn: policy_arn, role_name: role_name)
        detach_role_policy(input)
      end
      def detach_role_policy(input : Types::DetachRolePolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::DETACH_ROLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified managed policy from the specified user. A user can also have inline policies
      # embedded with it. To delete an inline policy, use DeleteUserPolicy . For information about policies,
      # see Managed policies and inline policies in the IAM User Guide .
      def detach_user_policy(
        policy_arn : String,
        user_name : String
      ) : Nil
        input = Types::DetachUserPolicyRequest.new(policy_arn: policy_arn, user_name: user_name)
        detach_user_policy(input)
      end
      def detach_user_policy(input : Types::DetachUserPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::DETACH_USER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Disables the management of privileged root user credentials across member accounts in your
      # organization. When you disable this feature, the management account and the delegated administrator
      # for IAM can no longer manage root user credentials for member accounts in your organization.
      def disable_organizations_root_credentials_management : Types::DisableOrganizationsRootCredentialsManagementResponse
        input = Types::DisableOrganizationsRootCredentialsManagementRequest.new
        disable_organizations_root_credentials_management(input)
      end
      def disable_organizations_root_credentials_management(input : Types::DisableOrganizationsRootCredentialsManagementRequest) : Types::DisableOrganizationsRootCredentialsManagementResponse
        request = Protocol::Query.build_request(Model::DISABLE_ORGANIZATIONS_ROOT_CREDENTIALS_MANAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DisableOrganizationsRootCredentialsManagementResponse, "DisableOrganizationsRootCredentialsManagement")
      end

      # Disables root user sessions for privileged tasks across member accounts in your organization. When
      # you disable this feature, the management account and the delegated administrator for IAM can no
      # longer perform privileged tasks on member accounts in your organization.
      def disable_organizations_root_sessions : Types::DisableOrganizationsRootSessionsResponse
        input = Types::DisableOrganizationsRootSessionsRequest.new
        disable_organizations_root_sessions(input)
      end
      def disable_organizations_root_sessions(input : Types::DisableOrganizationsRootSessionsRequest) : Types::DisableOrganizationsRootSessionsResponse
        request = Protocol::Query.build_request(Model::DISABLE_ORGANIZATIONS_ROOT_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DisableOrganizationsRootSessionsResponse, "DisableOrganizationsRootSessions")
      end

      # Disables the outbound identity federation feature for your Amazon Web Services account. When
      # disabled, IAM principals in the account cannot use the GetWebIdentityToken API to obtain JSON Web
      # Tokens (JWTs) for authentication with external services. This operation does not affect tokens that
      # were issued before the feature was disabled.
      def disable_outbound_web_identity_federation : Nil
        request = Protocol::Query.build_request(Model::DISABLE_OUTBOUND_WEB_IDENTITY_FEDERATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Enables the specified MFA device and associates it with the specified IAM user. When enabled, the
      # MFA device is required for every subsequent login by the IAM user associated with the device.
      def enable_mfa_device(
        authentication_code1 : String,
        authentication_code2 : String,
        serial_number : String,
        user_name : String
      ) : Nil
        input = Types::EnableMFADeviceRequest.new(authentication_code1: authentication_code1, authentication_code2: authentication_code2, serial_number: serial_number, user_name: user_name)
        enable_mfa_device(input)
      end
      def enable_mfa_device(input : Types::EnableMFADeviceRequest) : Nil
        request = Protocol::Query.build_request(Model::ENABLE_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Enables the management of privileged root user credentials across member accounts in your
      # organization. When you enable root credentials management for centralized root access , the
      # management account and the delegated administrator for IAM can manage root user credentials for
      # member accounts in your organization. Before you enable centralized root access, you must have an
      # account configured with the following settings: You must manage your Amazon Web Services accounts in
      # Organizations . Enable trusted access for Identity and Access Management in Organizations. For
      # details, see IAM and Organizations in the Organizations User Guide .
      def enable_organizations_root_credentials_management : Types::EnableOrganizationsRootCredentialsManagementResponse
        input = Types::EnableOrganizationsRootCredentialsManagementRequest.new
        enable_organizations_root_credentials_management(input)
      end
      def enable_organizations_root_credentials_management(input : Types::EnableOrganizationsRootCredentialsManagementRequest) : Types::EnableOrganizationsRootCredentialsManagementResponse
        request = Protocol::Query.build_request(Model::ENABLE_ORGANIZATIONS_ROOT_CREDENTIALS_MANAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnableOrganizationsRootCredentialsManagementResponse, "EnableOrganizationsRootCredentialsManagement")
      end

      # Allows the management account or delegated administrator to perform privileged tasks on member
      # accounts in your organization. For more information, see Centrally manage root access for member
      # accounts in the Identity and Access Management User Guide . Before you enable this feature, you must
      # have an account configured with the following settings: You must manage your Amazon Web Services
      # accounts in Organizations . Enable trusted access for Identity and Access Management in
      # Organizations. For details, see IAM and Organizations in the Organizations User Guide .
      def enable_organizations_root_sessions : Types::EnableOrganizationsRootSessionsResponse
        input = Types::EnableOrganizationsRootSessionsRequest.new
        enable_organizations_root_sessions(input)
      end
      def enable_organizations_root_sessions(input : Types::EnableOrganizationsRootSessionsRequest) : Types::EnableOrganizationsRootSessionsResponse
        request = Protocol::Query.build_request(Model::ENABLE_ORGANIZATIONS_ROOT_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnableOrganizationsRootSessionsResponse, "EnableOrganizationsRootSessions")
      end

      # Enables the outbound identity federation feature for your Amazon Web Services account. When enabled,
      # IAM principals in your account can use the GetWebIdentityToken API to obtain JSON Web Tokens (JWTs)
      # for secure authentication with external services. This operation also generates a unique issuer URL
      # for your Amazon Web Services account.
      def enable_outbound_web_identity_federation : Types::EnableOutboundWebIdentityFederationResponse
        request = Protocol::Query.build_request(Model::ENABLE_OUTBOUND_WEB_IDENTITY_FEDERATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnableOutboundWebIdentityFederationResponse, "EnableOutboundWebIdentityFederation")
      end

      # Generates a credential report for the Amazon Web Services account. For more information about the
      # credential report, see Getting credential reports in the IAM User Guide .
      def generate_credential_report : Types::GenerateCredentialReportResponse
        request = Protocol::Query.build_request(Model::GENERATE_CREDENTIAL_REPORT, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GenerateCredentialReportResponse, "GenerateCredentialReport")
      end

      # Generates a report for service last accessed data for Organizations. You can generate a report for
      # any entities (organization root, organizational unit, or account) or policies in your organization.
      # To call this operation, you must be signed in using your Organizations management account
      # credentials. You can use your long-term IAM user or root user credentials, or temporary credentials
      # from assuming an IAM role. SCPs must be enabled for your organization root. You must have the
      # required IAM and Organizations permissions. For more information, see Refining permissions using
      # service last accessed data in the IAM User Guide . You can generate a service last accessed data
      # report for entities by specifying only the entity's path. This data includes a list of services that
      # are allowed by any service control policies (SCPs) that apply to the entity. You can generate a
      # service last accessed data report for a policy by specifying an entity's path and an optional
      # Organizations policy ID. This data includes a list of services that are allowed by the specified
      # SCP. For each service in both report types, the data includes the most recent account activity that
      # the policy allows to account principals in the entity or the entity's children. For important
      # information about the data, reporting period, permissions required, troubleshooting, and supported
      # Regions see Reducing permissions using service last accessed data in the IAM User Guide . The data
      # includes all attempts to access Amazon Web Services, not just the successful ones. This includes all
      # attempts that were made using the Amazon Web Services Management Console, the Amazon Web Services
      # API through any of the SDKs, or any of the command line tools. An unexpected entry in the service
      # last accessed data does not mean that an account has been compromised, because the request might
      # have been denied. Refer to your CloudTrail logs as the authoritative source for information about
      # all API calls and whether they were successful or denied access. For more information, see Logging
      # IAM events with CloudTrail in the IAM User Guide . This operation returns a JobId . Use this
      # parameter in the GetOrganizationsAccessReport operation to check the status of the report
      # generation. To check the status of this request, use the JobId parameter in the
      # GetOrganizationsAccessReport operation and test the JobStatus response parameter. When the job is
      # complete, you can retrieve the report. To generate a service last accessed data report for entities,
      # specify an entity path without specifying the optional Organizations policy ID. The type of entity
      # that you specify determines the data returned in the report. Root – When you specify the
      # organizations root as the entity, the resulting report lists all of the services allowed by SCPs
      # that are attached to your root. For each service, the report includes data for all accounts in your
      # organization except the management account, because the management account is not limited by SCPs.
      # OU – When you specify an organizational unit (OU) as the entity, the resulting report lists all of
      # the services allowed by SCPs that are attached to the OU and its parents. For each service, the
      # report includes data for all accounts in the OU or its children. This data excludes the management
      # account, because the management account is not limited by SCPs. management account – When you
      # specify the management account, the resulting report lists all Amazon Web Services services, because
      # the management account is not limited by SCPs. For each service, the report includes data for only
      # the management account. Account – When you specify another account as the entity, the resulting
      # report lists all of the services allowed by SCPs that are attached to the account and its parents.
      # For each service, the report includes data for only the specified account. To generate a service
      # last accessed data report for policies, specify an entity path and the optional Organizations policy
      # ID. The type of entity that you specify determines the data returned for each service. Root – When
      # you specify the root entity and a policy ID, the resulting report lists all of the services that are
      # allowed by the specified SCP. For each service, the report includes data for all accounts in your
      # organization to which the SCP applies. This data excludes the management account, because the
      # management account is not limited by SCPs. If the SCP is not attached to any entities in the
      # organization, then the report will return a list of services with no data. OU – When you specify an
      # OU entity and a policy ID, the resulting report lists all of the services that are allowed by the
      # specified SCP. For each service, the report includes data for all accounts in the OU or its children
      # to which the SCP applies. This means that other accounts outside the OU that are affected by the SCP
      # might not be included in the data. This data excludes the management account, because the management
      # account is not limited by SCPs. If the SCP is not attached to the OU or one of its children, the
      # report will return a list of services with no data. management account – When you specify the
      # management account, the resulting report lists all Amazon Web Services services, because the
      # management account is not limited by SCPs. If you specify a policy ID in the CLI or API, the policy
      # is ignored. For each service, the report includes data for only the management account. Account –
      # When you specify another account entity and a policy ID, the resulting report lists all of the
      # services that are allowed by the specified SCP. For each service, the report includes data for only
      # the specified account. This means that other accounts in the organization that are affected by the
      # SCP might not be included in the data. If the SCP is not attached to the account, the report will
      # return a list of services with no data. Service last accessed data does not use other policy types
      # when determining whether a principal could access a service. These other policy types include
      # identity-based policies, resource-based policies, access control lists, IAM permissions boundaries,
      # and STS assume role policies. It only applies SCP logic. For more about the evaluation of policy
      # types, see Evaluating policies in the IAM User Guide . For more information about service last
      # accessed data, see Reducing policy scope by viewing user activity in the IAM User Guide .
      def generate_organizations_access_report(
        entity_path : String,
        organizations_policy_id : String? = nil
      ) : Types::GenerateOrganizationsAccessReportResponse
        input = Types::GenerateOrganizationsAccessReportRequest.new(entity_path: entity_path, organizations_policy_id: organizations_policy_id)
        generate_organizations_access_report(input)
      end
      def generate_organizations_access_report(input : Types::GenerateOrganizationsAccessReportRequest) : Types::GenerateOrganizationsAccessReportResponse
        request = Protocol::Query.build_request(Model::GENERATE_ORGANIZATIONS_ACCESS_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GenerateOrganizationsAccessReportResponse, "GenerateOrganizationsAccessReport")
      end

      # Generates a report that includes details about when an IAM resource (user, group, role, or policy)
      # was last used in an attempt to access Amazon Web Services services. Recent activity usually appears
      # within four hours. IAM reports activity for at least the last 400 days, or less if your Region began
      # supporting this feature within the last year. For more information, see Regions where data is
      # tracked . For more information about services and actions for which action last accessed information
      # is displayed, see IAM action last accessed information services and actions . The service last
      # accessed data includes all attempts to access an Amazon Web Services API, not just the successful
      # ones. This includes all attempts that were made using the Amazon Web Services Management Console,
      # the Amazon Web Services API through any of the SDKs, or any of the command line tools. An unexpected
      # entry in the service last accessed data does not mean that your account has been compromised,
      # because the request might have been denied. Refer to your CloudTrail logs as the authoritative
      # source for information about all API calls and whether they were successful or denied access. For
      # more information, see Logging IAM events with CloudTrail in the IAM User Guide . The
      # GenerateServiceLastAccessedDetails operation returns a JobId . Use this parameter in the following
      # operations to retrieve the following details from your report: GetServiceLastAccessedDetails – Use
      # this operation for users, groups, roles, or policies to list every Amazon Web Services service that
      # the resource could access using permissions policies. For each service, the response includes
      # information about the most recent access attempt. The JobId returned by
      # GenerateServiceLastAccessedDetail must be used by the same role within a session, or by the same
      # user when used to call GetServiceLastAccessedDetail . GetServiceLastAccessedDetailsWithEntities –
      # Use this operation for groups and policies to list information about the associated entities (users
      # or roles) that attempted to access a specific Amazon Web Services service. To check the status of
      # the GenerateServiceLastAccessedDetails request, use the JobId parameter in the same operations and
      # test the JobStatus response parameter. For additional information about the permissions policies
      # that allow an identity (user, group, or role) to access specific services, use the
      # ListPoliciesGrantingServiceAccess operation. Service last accessed data does not use other policy
      # types when determining whether a resource could access a service. These other policy types include
      # resource-based policies, access control lists, Organizations policies, IAM permissions boundaries,
      # and STS assume role policies. It only applies permissions policy logic. For more about the
      # evaluation of policy types, see Evaluating policies in the IAM User Guide . For more information
      # about service and action last accessed data, see Reducing permissions using service last accessed
      # data in the IAM User Guide .
      def generate_service_last_accessed_details(
        arn : String,
        granularity : String? = nil
      ) : Types::GenerateServiceLastAccessedDetailsResponse
        input = Types::GenerateServiceLastAccessedDetailsRequest.new(arn: arn, granularity: granularity)
        generate_service_last_accessed_details(input)
      end
      def generate_service_last_accessed_details(input : Types::GenerateServiceLastAccessedDetailsRequest) : Types::GenerateServiceLastAccessedDetailsResponse
        request = Protocol::Query.build_request(Model::GENERATE_SERVICE_LAST_ACCESSED_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GenerateServiceLastAccessedDetailsResponse, "GenerateServiceLastAccessedDetails")
      end

      # Retrieves information about when the specified access key was last used. The information includes
      # the date and time of last use, along with the Amazon Web Services service and Region that were
      # specified in the last request made with that key.
      def get_access_key_last_used(
        access_key_id : String
      ) : Types::GetAccessKeyLastUsedResponse
        input = Types::GetAccessKeyLastUsedRequest.new(access_key_id: access_key_id)
        get_access_key_last_used(input)
      end
      def get_access_key_last_used(input : Types::GetAccessKeyLastUsedRequest) : Types::GetAccessKeyLastUsedResponse
        request = Protocol::Query.build_request(Model::GET_ACCESS_KEY_LAST_USED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetAccessKeyLastUsedResponse, "GetAccessKeyLastUsed")
      end

      # Retrieves information about all IAM users, groups, roles, and policies in your Amazon Web Services
      # account, including their relationships to one another. Use this operation to obtain a snapshot of
      # the configuration of IAM permissions (users, groups, roles, and policies) in your account. Policies
      # returned by this operation are URL-encoded compliant with RFC 3986 . You can use a URL decoding
      # method to convert the policy back to plain JSON text. For example, if you use Java, you can use the
      # decode method of the java.net.URLDecoder utility class in the Java SDK. Other languages and SDKs
      # provide similar functionality, and some SDKs do this decoding automatically. You can optionally
      # filter the results using the Filter parameter. You can paginate the results using the MaxItems and
      # Marker parameters.
      def get_account_authorization_details(
        filter : Array(String)? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::GetAccountAuthorizationDetailsResponse
        input = Types::GetAccountAuthorizationDetailsRequest.new(filter: filter, marker: marker, max_items: max_items)
        get_account_authorization_details(input)
      end
      def get_account_authorization_details(input : Types::GetAccountAuthorizationDetailsRequest) : Types::GetAccountAuthorizationDetailsResponse
        request = Protocol::Query.build_request(Model::GET_ACCOUNT_AUTHORIZATION_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetAccountAuthorizationDetailsResponse, "GetAccountAuthorizationDetails")
      end

      # Retrieves the password policy for the Amazon Web Services account. This tells you the complexity
      # requirements and mandatory rotation periods for the IAM user passwords in your account. For more
      # information about using a password policy, see Managing an IAM password policy .
      def get_account_password_policy : Types::GetAccountPasswordPolicyResponse
        request = Protocol::Query.build_request(Model::GET_ACCOUNT_PASSWORD_POLICY, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetAccountPasswordPolicyResponse, "GetAccountPasswordPolicy")
      end

      # Retrieves information about IAM entity usage and IAM quotas in the Amazon Web Services account. For
      # information about IAM quotas, see IAM and STS quotas in the IAM User Guide .
      def get_account_summary : Types::GetAccountSummaryResponse
        request = Protocol::Query.build_request(Model::GET_ACCOUNT_SUMMARY, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetAccountSummaryResponse, "GetAccountSummary")
      end

      # Gets a list of all of the context keys referenced in the input policies. The policies are supplied
      # as a list of one or more strings. To get the context keys from policies associated with an IAM user,
      # group, or role, use GetContextKeysForPrincipalPolicy . Context keys are variables maintained by
      # Amazon Web Services and its services that provide details about the context of an API query request.
      # Context keys can be evaluated by testing against a value specified in an IAM policy. Use
      # GetContextKeysForCustomPolicy to understand what key names and values you must supply when you call
      # SimulateCustomPolicy . Note that all parameters are shown in unencoded form here for clarity but
      # must be URL encoded to be included as a part of a real HTML request.
      def get_context_keys_for_custom_policy(
        policy_input_list : Array(String)
      ) : Types::GetContextKeysForPolicyResponse
        input = Types::GetContextKeysForCustomPolicyRequest.new(policy_input_list: policy_input_list)
        get_context_keys_for_custom_policy(input)
      end
      def get_context_keys_for_custom_policy(input : Types::GetContextKeysForCustomPolicyRequest) : Types::GetContextKeysForPolicyResponse
        request = Protocol::Query.build_request(Model::GET_CONTEXT_KEYS_FOR_CUSTOM_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetContextKeysForPolicyResponse, "GetContextKeysForCustomPolicy")
      end

      # Gets a list of all of the context keys referenced in all the IAM policies that are attached to the
      # specified IAM entity. The entity can be an IAM user, group, or role. If you specify a user, then the
      # request also includes all of the policies attached to groups that the user is a member of. You can
      # optionally include a list of one or more additional policies, specified as strings. If you want to
      # include only a list of policies by string, use GetContextKeysForCustomPolicy instead. Note: This
      # operation discloses information about the permissions granted to other users. If you do not want
      # users to see other user's permissions, then consider allowing them to use
      # GetContextKeysForCustomPolicy instead. Context keys are variables maintained by Amazon Web Services
      # and its services that provide details about the context of an API query request. Context keys can be
      # evaluated by testing against a value in an IAM policy. Use GetContextKeysForPrincipalPolicy to
      # understand what key names and values you must supply when you call SimulatePrincipalPolicy .
      def get_context_keys_for_principal_policy(
        policy_source_arn : String,
        policy_input_list : Array(String)? = nil
      ) : Types::GetContextKeysForPolicyResponse
        input = Types::GetContextKeysForPrincipalPolicyRequest.new(policy_source_arn: policy_source_arn, policy_input_list: policy_input_list)
        get_context_keys_for_principal_policy(input)
      end
      def get_context_keys_for_principal_policy(input : Types::GetContextKeysForPrincipalPolicyRequest) : Types::GetContextKeysForPolicyResponse
        request = Protocol::Query.build_request(Model::GET_CONTEXT_KEYS_FOR_PRINCIPAL_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetContextKeysForPolicyResponse, "GetContextKeysForPrincipalPolicy")
      end

      # Retrieves a credential report for the Amazon Web Services account. For more information about the
      # credential report, see Getting credential reports in the IAM User Guide .
      def get_credential_report : Types::GetCredentialReportResponse
        request = Protocol::Query.build_request(Model::GET_CREDENTIAL_REPORT, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetCredentialReportResponse, "GetCredentialReport")
      end

      # Retrieves information about a specific delegation request. If a delegation request has no owner or
      # owner account, GetDelegationRequest for that delegation request can be called by any account. If the
      # owner account is assigned but there is no owner id, only identities within that owner account can
      # call GetDelegationRequest for the delegation request. Once the delegation request is fully owned,
      # the owner of the request gets a default permission to get that delegation request. For more details,
      # see Managing Permissions for Delegation Requests .
      def get_delegation_request(
        delegation_request_id : String,
        delegation_permission_check : Bool? = nil
      ) : Types::GetDelegationRequestResponse
        input = Types::GetDelegationRequestRequest.new(delegation_request_id: delegation_request_id, delegation_permission_check: delegation_permission_check)
        get_delegation_request(input)
      end
      def get_delegation_request(input : Types::GetDelegationRequestRequest) : Types::GetDelegationRequestResponse
        request = Protocol::Query.build_request(Model::GET_DELEGATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetDelegationRequestResponse, "GetDelegationRequest")
      end

      # Returns a list of IAM users that are in the specified IAM group. You can paginate the results using
      # the MaxItems and Marker parameters.
      def get_group(
        group_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::GetGroupResponse
        input = Types::GetGroupRequest.new(group_name: group_name, marker: marker, max_items: max_items)
        get_group(input)
      end
      def get_group(input : Types::GetGroupRequest) : Types::GetGroupResponse
        request = Protocol::Query.build_request(Model::GET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetGroupResponse, "GetGroup")
      end

      # Retrieves the specified inline policy document that is embedded in the specified IAM group. Policies
      # returned by this operation are URL-encoded compliant with RFC 3986 . You can use a URL decoding
      # method to convert the policy back to plain JSON text. For example, if you use Java, you can use the
      # decode method of the java.net.URLDecoder utility class in the Java SDK. Other languages and SDKs
      # provide similar functionality, and some SDKs do this decoding automatically. An IAM group can also
      # have managed policies attached to it. To retrieve a managed policy document that is attached to a
      # group, use GetPolicy to determine the policy's default version, then use GetPolicyVersion to
      # retrieve the policy document. For more information about policies, see Managed policies and inline
      # policies in the IAM User Guide .
      def get_group_policy(
        group_name : String,
        policy_name : String
      ) : Types::GetGroupPolicyResponse
        input = Types::GetGroupPolicyRequest.new(group_name: group_name, policy_name: policy_name)
        get_group_policy(input)
      end
      def get_group_policy(input : Types::GetGroupPolicyRequest) : Types::GetGroupPolicyResponse
        request = Protocol::Query.build_request(Model::GET_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetGroupPolicyResponse, "GetGroupPolicy")
      end

      # Retrieves a human readable summary for a given entity. At this time, the only supported entity type
      # is delegation-request This method uses a Large Language Model (LLM) to generate the summary. If a
      # delegation request has no owner or owner account, GetHumanReadableSummary for that delegation
      # request can be called by any account. If the owner account is assigned but there is no owner id,
      # only identities within that owner account can call GetHumanReadableSummary for the delegation
      # request to retrieve a summary of that request. Once the delegation request is fully owned, the owner
      # of the request gets a default permission to get that delegation request. For more details, read
      # default permissions granted to delegation requests . These rules are identical to
      # GetDelegationRequest API behavior, such that a party who has permissions to call
      # GetDelegationRequest for a given delegation request will always be able to retrieve the human
      # readable summary for that request.
      def get_human_readable_summary(
        entity_arn : String,
        locale : String? = nil
      ) : Types::GetHumanReadableSummaryResponse
        input = Types::GetHumanReadableSummaryRequest.new(entity_arn: entity_arn, locale: locale)
        get_human_readable_summary(input)
      end
      def get_human_readable_summary(input : Types::GetHumanReadableSummaryRequest) : Types::GetHumanReadableSummaryResponse
        request = Protocol::Query.build_request(Model::GET_HUMAN_READABLE_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetHumanReadableSummaryResponse, "GetHumanReadableSummary")
      end

      # Retrieves information about the specified instance profile, including the instance profile's path,
      # GUID, ARN, and role. For more information about instance profiles, see Using instance profiles in
      # the IAM User Guide .
      def get_instance_profile(
        instance_profile_name : String
      ) : Types::GetInstanceProfileResponse
        input = Types::GetInstanceProfileRequest.new(instance_profile_name: instance_profile_name)
        get_instance_profile(input)
      end
      def get_instance_profile(input : Types::GetInstanceProfileRequest) : Types::GetInstanceProfileResponse
        request = Protocol::Query.build_request(Model::GET_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetInstanceProfileResponse, "GetInstanceProfile")
      end

      # Retrieves the user name for the specified IAM user. A login profile is created when you create a
      # password for the user to access the Amazon Web Services Management Console. If the user does not
      # exist or does not have a password, the operation returns a 404 ( NoSuchEntity ) error. If you create
      # an IAM user with access to the console, the CreateDate reflects the date you created the initial
      # password for the user. If you create an IAM user with programmatic access, and then later add a
      # password for the user to access the Amazon Web Services Management Console, the CreateDate reflects
      # the initial password creation date. A user with programmatic access does not have a login profile
      # unless you create a password for the user to access the Amazon Web Services Management Console.
      def get_login_profile(
        user_name : String? = nil
      ) : Types::GetLoginProfileResponse
        input = Types::GetLoginProfileRequest.new(user_name: user_name)
        get_login_profile(input)
      end
      def get_login_profile(input : Types::GetLoginProfileRequest) : Types::GetLoginProfileResponse
        request = Protocol::Query.build_request(Model::GET_LOGIN_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetLoginProfileResponse, "GetLoginProfile")
      end

      # Retrieves information about an MFA device for a specified user.
      def get_mfa_device(
        serial_number : String,
        user_name : String? = nil
      ) : Types::GetMFADeviceResponse
        input = Types::GetMFADeviceRequest.new(serial_number: serial_number, user_name: user_name)
        get_mfa_device(input)
      end
      def get_mfa_device(input : Types::GetMFADeviceRequest) : Types::GetMFADeviceResponse
        request = Protocol::Query.build_request(Model::GET_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetMFADeviceResponse, "GetMFADevice")
      end

      # Returns information about the specified OpenID Connect (OIDC) provider resource object in IAM.
      def get_open_id_connect_provider(
        open_id_connect_provider_arn : String
      ) : Types::GetOpenIDConnectProviderResponse
        input = Types::GetOpenIDConnectProviderRequest.new(open_id_connect_provider_arn: open_id_connect_provider_arn)
        get_open_id_connect_provider(input)
      end
      def get_open_id_connect_provider(input : Types::GetOpenIDConnectProviderRequest) : Types::GetOpenIDConnectProviderResponse
        request = Protocol::Query.build_request(Model::GET_OPEN_ID_CONNECT_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetOpenIDConnectProviderResponse, "GetOpenIDConnectProvider")
      end

      # Retrieves the service last accessed data report for Organizations that was previously generated
      # using the GenerateOrganizationsAccessReport operation. This operation retrieves the status of your
      # report job and the report contents. Depending on the parameters that you passed when you generated
      # the report, the data returned could include different information. For details, see
      # GenerateOrganizationsAccessReport . To call this operation, you must be signed in to the management
      # account in your organization. SCPs must be enabled for your organization root. You must have
      # permissions to perform this operation. For more information, see Refining permissions using service
      # last accessed data in the IAM User Guide . For each service that principals in an account (root
      # user, IAM users, or IAM roles) could access using SCPs, the operation returns details about the most
      # recent access attempt. If there was no attempt, the service is listed without details about the most
      # recent attempt to access the service. If the operation fails, it returns the reason that it failed.
      # By default, the list is sorted by service namespace.
      def get_organizations_access_report(
        job_id : String,
        marker : String? = nil,
        max_items : Int32? = nil,
        sort_key : String? = nil
      ) : Types::GetOrganizationsAccessReportResponse
        input = Types::GetOrganizationsAccessReportRequest.new(job_id: job_id, marker: marker, max_items: max_items, sort_key: sort_key)
        get_organizations_access_report(input)
      end
      def get_organizations_access_report(input : Types::GetOrganizationsAccessReportRequest) : Types::GetOrganizationsAccessReportResponse
        request = Protocol::Query.build_request(Model::GET_ORGANIZATIONS_ACCESS_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetOrganizationsAccessReportResponse, "GetOrganizationsAccessReport")
      end

      # Retrieves the configuration information for the outbound identity federation feature in your Amazon
      # Web Services account. The response includes the unique issuer URL for your Amazon Web Services
      # account and the current enabled/disabled status of the feature. Use this operation to obtain the
      # issuer URL that you need to configure trust relationships with external services.
      def get_outbound_web_identity_federation_info : Types::GetOutboundWebIdentityFederationInfoResponse
        request = Protocol::Query.build_request(Model::GET_OUTBOUND_WEB_IDENTITY_FEDERATION_INFO, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetOutboundWebIdentityFederationInfoResponse, "GetOutboundWebIdentityFederationInfo")
      end

      # Retrieves information about the specified managed policy, including the policy's default version and
      # the total number of IAM users, groups, and roles to which the policy is attached. To retrieve the
      # list of the specific users, groups, and roles that the policy is attached to, use
      # ListEntitiesForPolicy . This operation returns metadata about the policy. To retrieve the actual
      # policy document for a specific version of the policy, use GetPolicyVersion . This operation
      # retrieves information about managed policies. To retrieve information about an inline policy that is
      # embedded with an IAM user, group, or role, use GetUserPolicy , GetGroupPolicy , or GetRolePolicy .
      # For more information about policies, see Managed policies and inline policies in the IAM User Guide
      # .
      def get_policy(
        policy_arn : String
      ) : Types::GetPolicyResponse
        input = Types::GetPolicyRequest.new(policy_arn: policy_arn)
        get_policy(input)
      end
      def get_policy(input : Types::GetPolicyRequest) : Types::GetPolicyResponse
        request = Protocol::Query.build_request(Model::GET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetPolicyResponse, "GetPolicy")
      end

      # Retrieves information about the specified version of the specified managed policy, including the
      # policy document. Policies returned by this operation are URL-encoded compliant with RFC 3986 . You
      # can use a URL decoding method to convert the policy back to plain JSON text. For example, if you use
      # Java, you can use the decode method of the java.net.URLDecoder utility class in the Java SDK. Other
      # languages and SDKs provide similar functionality, and some SDKs do this decoding automatically. To
      # list the available versions for a policy, use ListPolicyVersions . This operation retrieves
      # information about managed policies. To retrieve information about an inline policy that is embedded
      # in a user, group, or role, use GetUserPolicy , GetGroupPolicy , or GetRolePolicy . For more
      # information about the types of policies, see Managed policies and inline policies in the IAM User
      # Guide . For more information about managed policy versions, see Versioning for managed policies in
      # the IAM User Guide .
      def get_policy_version(
        policy_arn : String,
        version_id : String
      ) : Types::GetPolicyVersionResponse
        input = Types::GetPolicyVersionRequest.new(policy_arn: policy_arn, version_id: version_id)
        get_policy_version(input)
      end
      def get_policy_version(input : Types::GetPolicyVersionRequest) : Types::GetPolicyVersionResponse
        request = Protocol::Query.build_request(Model::GET_POLICY_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetPolicyVersionResponse, "GetPolicyVersion")
      end

      # Retrieves information about the specified role, including the role's path, GUID, ARN, and the role's
      # trust policy that grants permission to assume the role. For more information about roles, see IAM
      # roles in the IAM User Guide . Policies returned by this operation are URL-encoded compliant with RFC
      # 3986 . You can use a URL decoding method to convert the policy back to plain JSON text. For example,
      # if you use Java, you can use the decode method of the java.net.URLDecoder utility class in the Java
      # SDK. Other languages and SDKs provide similar functionality, and some SDKs do this decoding
      # automatically.
      def get_role(
        role_name : String
      ) : Types::GetRoleResponse
        input = Types::GetRoleRequest.new(role_name: role_name)
        get_role(input)
      end
      def get_role(input : Types::GetRoleRequest) : Types::GetRoleResponse
        request = Protocol::Query.build_request(Model::GET_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetRoleResponse, "GetRole")
      end

      # Retrieves the specified inline policy document that is embedded with the specified IAM role.
      # Policies returned by this operation are URL-encoded compliant with RFC 3986 . You can use a URL
      # decoding method to convert the policy back to plain JSON text. For example, if you use Java, you can
      # use the decode method of the java.net.URLDecoder utility class in the Java SDK. Other languages and
      # SDKs provide similar functionality, and some SDKs do this decoding automatically. An IAM role can
      # also have managed policies attached to it. To retrieve a managed policy document that is attached to
      # a role, use GetPolicy to determine the policy's default version, then use GetPolicyVersion to
      # retrieve the policy document. For more information about policies, see Managed policies and inline
      # policies in the IAM User Guide . For more information about roles, see IAM roles in the IAM User
      # Guide .
      def get_role_policy(
        policy_name : String,
        role_name : String
      ) : Types::GetRolePolicyResponse
        input = Types::GetRolePolicyRequest.new(policy_name: policy_name, role_name: role_name)
        get_role_policy(input)
      end
      def get_role_policy(input : Types::GetRolePolicyRequest) : Types::GetRolePolicyResponse
        request = Protocol::Query.build_request(Model::GET_ROLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetRolePolicyResponse, "GetRolePolicy")
      end

      # Returns the SAML provider metadocument that was uploaded when the IAM SAML provider resource object
      # was created or updated. This operation requires Signature Version 4 .
      def get_saml_provider(
        saml_provider_arn : String
      ) : Types::GetSAMLProviderResponse
        input = Types::GetSAMLProviderRequest.new(saml_provider_arn: saml_provider_arn)
        get_saml_provider(input)
      end
      def get_saml_provider(input : Types::GetSAMLProviderRequest) : Types::GetSAMLProviderResponse
        request = Protocol::Query.build_request(Model::GET_SAML_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetSAMLProviderResponse, "GetSAMLProvider")
      end

      # Retrieves the specified SSH public key, including metadata about the key. The SSH public key
      # retrieved by this operation is used only for authenticating the associated IAM user to an CodeCommit
      # repository. For more information about using SSH keys to authenticate to an CodeCommit repository,
      # see Set up CodeCommit for SSH connections in the CodeCommit User Guide .
      def get_ssh_public_key(
        encoding : String,
        ssh_public_key_id : String,
        user_name : String
      ) : Types::GetSSHPublicKeyResponse
        input = Types::GetSSHPublicKeyRequest.new(encoding: encoding, ssh_public_key_id: ssh_public_key_id, user_name: user_name)
        get_ssh_public_key(input)
      end
      def get_ssh_public_key(input : Types::GetSSHPublicKeyRequest) : Types::GetSSHPublicKeyResponse
        request = Protocol::Query.build_request(Model::GET_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetSSHPublicKeyResponse, "GetSSHPublicKey")
      end

      # Retrieves information about the specified server certificate stored in IAM. For more information
      # about working with server certificates, see Working with server certificates in the IAM User Guide .
      # This topic includes a list of Amazon Web Services services that can use the server certificates that
      # you manage with IAM.
      def get_server_certificate(
        server_certificate_name : String
      ) : Types::GetServerCertificateResponse
        input = Types::GetServerCertificateRequest.new(server_certificate_name: server_certificate_name)
        get_server_certificate(input)
      end
      def get_server_certificate(input : Types::GetServerCertificateRequest) : Types::GetServerCertificateResponse
        request = Protocol::Query.build_request(Model::GET_SERVER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetServerCertificateResponse, "GetServerCertificate")
      end

      # Retrieves a service last accessed report that was created using the
      # GenerateServiceLastAccessedDetails operation. You can use the JobId parameter in
      # GetServiceLastAccessedDetails to retrieve the status of your report job. When the report is
      # complete, you can retrieve the generated report. The report includes a list of Amazon Web Services
      # services that the resource (user, group, role, or managed policy) can access. Service last accessed
      # data does not use other policy types when determining whether a resource could access a service.
      # These other policy types include resource-based policies, access control lists, Organizations
      # policies, IAM permissions boundaries, and STS assume role policies. It only applies permissions
      # policy logic. For more about the evaluation of policy types, see Evaluating policies in the IAM User
      # Guide . For each service that the resource could access using permissions policies, the operation
      # returns details about the most recent access attempt. If there was no attempt, the service is listed
      # without details about the most recent attempt to access the service. If the operation fails, the
      # GetServiceLastAccessedDetails operation returns the reason that it failed. The
      # GetServiceLastAccessedDetails operation returns a list of services. This list includes the number of
      # entities that have attempted to access the service and the date and time of the last attempt. It
      # also returns the ARN of the following entity, depending on the resource ARN that you used to
      # generate the report: User – Returns the user ARN that you used to generate the report Group –
      # Returns the ARN of the group member (user) that last attempted to access the service Role – Returns
      # the role ARN that you used to generate the report Policy – Returns the ARN of the user or role that
      # last used the policy to attempt to access the service By default, the list is sorted by service
      # namespace. If you specified ACTION_LEVEL granularity when you generated the report, this operation
      # returns service and action last accessed data. This includes the most recent access attempt for each
      # tracked action within a service. Otherwise, this operation returns only service data. For more
      # information about service and action last accessed data, see Reducing permissions using service last
      # accessed data in the IAM User Guide .
      def get_service_last_accessed_details(
        job_id : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::GetServiceLastAccessedDetailsResponse
        input = Types::GetServiceLastAccessedDetailsRequest.new(job_id: job_id, marker: marker, max_items: max_items)
        get_service_last_accessed_details(input)
      end
      def get_service_last_accessed_details(input : Types::GetServiceLastAccessedDetailsRequest) : Types::GetServiceLastAccessedDetailsResponse
        request = Protocol::Query.build_request(Model::GET_SERVICE_LAST_ACCESSED_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetServiceLastAccessedDetailsResponse, "GetServiceLastAccessedDetails")
      end

      # After you generate a group or policy report using the GenerateServiceLastAccessedDetails operation,
      # you can use the JobId parameter in GetServiceLastAccessedDetailsWithEntities . This operation
      # retrieves the status of your report job and a list of entities that could have used group or policy
      # permissions to access the specified service. Group – For a group report, this operation returns a
      # list of users in the group that could have used the group’s policies in an attempt to access the
      # service. Policy – For a policy report, this operation returns a list of entities (users or roles)
      # that could have used the policy in an attempt to access the service. You can also use this operation
      # for user or role reports to retrieve details about those entities. If the operation fails, the
      # GetServiceLastAccessedDetailsWithEntities operation returns the reason that it failed. By default,
      # the list of associated entities is sorted by date, with the most recent access listed first.
      def get_service_last_accessed_details_with_entities(
        job_id : String,
        service_namespace : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::GetServiceLastAccessedDetailsWithEntitiesResponse
        input = Types::GetServiceLastAccessedDetailsWithEntitiesRequest.new(job_id: job_id, service_namespace: service_namespace, marker: marker, max_items: max_items)
        get_service_last_accessed_details_with_entities(input)
      end
      def get_service_last_accessed_details_with_entities(input : Types::GetServiceLastAccessedDetailsWithEntitiesRequest) : Types::GetServiceLastAccessedDetailsWithEntitiesResponse
        request = Protocol::Query.build_request(Model::GET_SERVICE_LAST_ACCESSED_DETAILS_WITH_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetServiceLastAccessedDetailsWithEntitiesResponse, "GetServiceLastAccessedDetailsWithEntities")
      end

      # Retrieves the status of your service-linked role deletion. After you use DeleteServiceLinkedRole to
      # submit a service-linked role for deletion, you can use the DeletionTaskId parameter in
      # GetServiceLinkedRoleDeletionStatus to check the status of the deletion. If the deletion fails, this
      # operation returns the reason that it failed, if that information is returned by the service.
      def get_service_linked_role_deletion_status(
        deletion_task_id : String
      ) : Types::GetServiceLinkedRoleDeletionStatusResponse
        input = Types::GetServiceLinkedRoleDeletionStatusRequest.new(deletion_task_id: deletion_task_id)
        get_service_linked_role_deletion_status(input)
      end
      def get_service_linked_role_deletion_status(input : Types::GetServiceLinkedRoleDeletionStatusRequest) : Types::GetServiceLinkedRoleDeletionStatusResponse
        request = Protocol::Query.build_request(Model::GET_SERVICE_LINKED_ROLE_DELETION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetServiceLinkedRoleDeletionStatusResponse, "GetServiceLinkedRoleDeletionStatus")
      end

      # Retrieves information about the specified IAM user, including the user's creation date, path, unique
      # ID, and ARN. If you do not specify a user name, IAM determines the user name implicitly based on the
      # Amazon Web Services access key ID used to sign the request to this operation.
      def get_user(
        user_name : String? = nil
      ) : Types::GetUserResponse
        input = Types::GetUserRequest.new(user_name: user_name)
        get_user(input)
      end
      def get_user(input : Types::GetUserRequest) : Types::GetUserResponse
        request = Protocol::Query.build_request(Model::GET_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetUserResponse, "GetUser")
      end

      # Retrieves the specified inline policy document that is embedded in the specified IAM user. Policies
      # returned by this operation are URL-encoded compliant with RFC 3986 . You can use a URL decoding
      # method to convert the policy back to plain JSON text. For example, if you use Java, you can use the
      # decode method of the java.net.URLDecoder utility class in the Java SDK. Other languages and SDKs
      # provide similar functionality, and some SDKs do this decoding automatically. An IAM user can also
      # have managed policies attached to it. To retrieve a managed policy document that is attached to a
      # user, use GetPolicy to determine the policy's default version. Then use GetPolicyVersion to retrieve
      # the policy document. For more information about policies, see Managed policies and inline policies
      # in the IAM User Guide .
      def get_user_policy(
        policy_name : String,
        user_name : String
      ) : Types::GetUserPolicyResponse
        input = Types::GetUserPolicyRequest.new(policy_name: policy_name, user_name: user_name)
        get_user_policy(input)
      end
      def get_user_policy(input : Types::GetUserPolicyRequest) : Types::GetUserPolicyResponse
        request = Protocol::Query.build_request(Model::GET_USER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetUserPolicyResponse, "GetUserPolicy")
      end

      # Returns information about the access key IDs associated with the specified IAM user. If there is
      # none, the operation returns an empty list. Although each user is limited to a small number of keys,
      # you can still paginate the results using the MaxItems and Marker parameters. If the UserName is not
      # specified, the user name is determined implicitly based on the Amazon Web Services access key ID
      # used to sign the request. If a temporary access key is used, then UserName is required. If a
      # long-term key is assigned to the user, then UserName is not required. This operation works for
      # access keys under the Amazon Web Services account. If the Amazon Web Services account has no
      # associated users, the root user returns it's own access key IDs by running this command. To ensure
      # the security of your Amazon Web Services account, the secret access key is accessible only during
      # key and user creation.
      def list_access_keys(
        marker : String? = nil,
        max_items : Int32? = nil,
        user_name : String? = nil
      ) : Types::ListAccessKeysResponse
        input = Types::ListAccessKeysRequest.new(marker: marker, max_items: max_items, user_name: user_name)
        list_access_keys(input)
      end
      def list_access_keys(input : Types::ListAccessKeysRequest) : Types::ListAccessKeysResponse
        request = Protocol::Query.build_request(Model::LIST_ACCESS_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListAccessKeysResponse, "ListAccessKeys")
      end

      # Lists the account alias associated with the Amazon Web Services account (Note: you can have only
      # one). For information about using an Amazon Web Services account alias, see Creating, deleting, and
      # listing an Amazon Web Services account alias in the IAM User Guide .
      def list_account_aliases(
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListAccountAliasesResponse
        input = Types::ListAccountAliasesRequest.new(marker: marker, max_items: max_items)
        list_account_aliases(input)
      end
      def list_account_aliases(input : Types::ListAccountAliasesRequest) : Types::ListAccountAliasesResponse
        request = Protocol::Query.build_request(Model::LIST_ACCOUNT_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListAccountAliasesResponse, "ListAccountAliases")
      end

      # Lists all managed policies that are attached to the specified IAM group. An IAM group can also have
      # inline policies embedded with it. To list the inline policies for a group, use ListGroupPolicies .
      # For information about policies, see Managed policies and inline policies in the IAM User Guide . You
      # can paginate the results using the MaxItems and Marker parameters. You can use the PathPrefix
      # parameter to limit the list of policies to only those matching the specified path prefix. If there
      # are no policies attached to the specified group (or none that match the specified path prefix), the
      # operation returns an empty list.
      def list_attached_group_policies(
        group_name : String,
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListAttachedGroupPoliciesResponse
        input = Types::ListAttachedGroupPoliciesRequest.new(group_name: group_name, marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_attached_group_policies(input)
      end
      def list_attached_group_policies(input : Types::ListAttachedGroupPoliciesRequest) : Types::ListAttachedGroupPoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_ATTACHED_GROUP_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListAttachedGroupPoliciesResponse, "ListAttachedGroupPolicies")
      end

      # Lists all managed policies that are attached to the specified IAM role. An IAM role can also have
      # inline policies embedded with it. To list the inline policies for a role, use ListRolePolicies . For
      # information about policies, see Managed policies and inline policies in the IAM User Guide . You can
      # paginate the results using the MaxItems and Marker parameters. You can use the PathPrefix parameter
      # to limit the list of policies to only those matching the specified path prefix. If there are no
      # policies attached to the specified role (or none that match the specified path prefix), the
      # operation returns an empty list.
      def list_attached_role_policies(
        role_name : String,
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListAttachedRolePoliciesResponse
        input = Types::ListAttachedRolePoliciesRequest.new(role_name: role_name, marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_attached_role_policies(input)
      end
      def list_attached_role_policies(input : Types::ListAttachedRolePoliciesRequest) : Types::ListAttachedRolePoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_ATTACHED_ROLE_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListAttachedRolePoliciesResponse, "ListAttachedRolePolicies")
      end

      # Lists all managed policies that are attached to the specified IAM user. An IAM user can also have
      # inline policies embedded with it. To list the inline policies for a user, use ListUserPolicies . For
      # information about policies, see Managed policies and inline policies in the IAM User Guide . You can
      # paginate the results using the MaxItems and Marker parameters. You can use the PathPrefix parameter
      # to limit the list of policies to only those matching the specified path prefix. If there are no
      # policies attached to the specified group (or none that match the specified path prefix), the
      # operation returns an empty list.
      def list_attached_user_policies(
        user_name : String,
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListAttachedUserPoliciesResponse
        input = Types::ListAttachedUserPoliciesRequest.new(user_name: user_name, marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_attached_user_policies(input)
      end
      def list_attached_user_policies(input : Types::ListAttachedUserPoliciesRequest) : Types::ListAttachedUserPoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_ATTACHED_USER_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListAttachedUserPoliciesResponse, "ListAttachedUserPolicies")
      end

      # Lists delegation requests based on the specified criteria. If a delegation request has no owner,
      # even if it is assigned to a specific account, it will not be part of the ListDelegationRequests
      # output for that account. For more details, see Managing Permissions for Delegation Requests .
      def list_delegation_requests(
        marker : String? = nil,
        max_items : Int32? = nil,
        owner_id : String? = nil
      ) : Types::ListDelegationRequestsResponse
        input = Types::ListDelegationRequestsRequest.new(marker: marker, max_items: max_items, owner_id: owner_id)
        list_delegation_requests(input)
      end
      def list_delegation_requests(input : Types::ListDelegationRequestsRequest) : Types::ListDelegationRequestsResponse
        request = Protocol::Query.build_request(Model::LIST_DELEGATION_REQUESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListDelegationRequestsResponse, "ListDelegationRequests")
      end

      # Lists all IAM users, groups, and roles that the specified managed policy is attached to. You can use
      # the optional EntityFilter parameter to limit the results to a particular type of entity (users,
      # groups, or roles). For example, to list only the roles that are attached to the specified policy,
      # set EntityFilter to Role . You can paginate the results using the MaxItems and Marker parameters.
      def list_entities_for_policy(
        policy_arn : String,
        entity_filter : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil,
        policy_usage_filter : String? = nil
      ) : Types::ListEntitiesForPolicyResponse
        input = Types::ListEntitiesForPolicyRequest.new(policy_arn: policy_arn, entity_filter: entity_filter, marker: marker, max_items: max_items, path_prefix: path_prefix, policy_usage_filter: policy_usage_filter)
        list_entities_for_policy(input)
      end
      def list_entities_for_policy(input : Types::ListEntitiesForPolicyRequest) : Types::ListEntitiesForPolicyResponse
        request = Protocol::Query.build_request(Model::LIST_ENTITIES_FOR_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListEntitiesForPolicyResponse, "ListEntitiesForPolicy")
      end

      # Lists the names of the inline policies that are embedded in the specified IAM group. An IAM group
      # can also have managed policies attached to it. To list the managed policies that are attached to a
      # group, use ListAttachedGroupPolicies . For more information about policies, see Managed policies and
      # inline policies in the IAM User Guide . You can paginate the results using the MaxItems and Marker
      # parameters. If there are no inline policies embedded with the specified group, the operation returns
      # an empty list.
      def list_group_policies(
        group_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListGroupPoliciesResponse
        input = Types::ListGroupPoliciesRequest.new(group_name: group_name, marker: marker, max_items: max_items)
        list_group_policies(input)
      end
      def list_group_policies(input : Types::ListGroupPoliciesRequest) : Types::ListGroupPoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_GROUP_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListGroupPoliciesResponse, "ListGroupPolicies")
      end

      # Lists the IAM groups that have the specified path prefix. You can paginate the results using the
      # MaxItems and Marker parameters.
      def list_groups(
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListGroupsResponse
        input = Types::ListGroupsRequest.new(marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_groups(input)
      end
      def list_groups(input : Types::ListGroupsRequest) : Types::ListGroupsResponse
        request = Protocol::Query.build_request(Model::LIST_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListGroupsResponse, "ListGroups")
      end

      # Lists the IAM groups that the specified IAM user belongs to. You can paginate the results using the
      # MaxItems and Marker parameters.
      def list_groups_for_user(
        user_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListGroupsForUserResponse
        input = Types::ListGroupsForUserRequest.new(user_name: user_name, marker: marker, max_items: max_items)
        list_groups_for_user(input)
      end
      def list_groups_for_user(input : Types::ListGroupsForUserRequest) : Types::ListGroupsForUserResponse
        request = Protocol::Query.build_request(Model::LIST_GROUPS_FOR_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListGroupsForUserResponse, "ListGroupsForUser")
      end

      # Lists the tags that are attached to the specified IAM instance profile. The returned list of tags is
      # sorted by tag key. For more information about tagging, see Tagging IAM resources in the IAM User
      # Guide .
      def list_instance_profile_tags(
        instance_profile_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListInstanceProfileTagsResponse
        input = Types::ListInstanceProfileTagsRequest.new(instance_profile_name: instance_profile_name, marker: marker, max_items: max_items)
        list_instance_profile_tags(input)
      end
      def list_instance_profile_tags(input : Types::ListInstanceProfileTagsRequest) : Types::ListInstanceProfileTagsResponse
        request = Protocol::Query.build_request(Model::LIST_INSTANCE_PROFILE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListInstanceProfileTagsResponse, "ListInstanceProfileTags")
      end

      # Lists the instance profiles that have the specified path prefix. If there are none, the operation
      # returns an empty list. For more information about instance profiles, see Using instance profiles in
      # the IAM User Guide . IAM resource-listing operations return a subset of the available attributes for
      # the resource. For example, this operation does not return tags, even though they are an attribute of
      # the returned object. To view all of the information for an instance profile, see GetInstanceProfile
      # . You can paginate the results using the MaxItems and Marker parameters.
      def list_instance_profiles(
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListInstanceProfilesResponse
        input = Types::ListInstanceProfilesRequest.new(marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_instance_profiles(input)
      end
      def list_instance_profiles(input : Types::ListInstanceProfilesRequest) : Types::ListInstanceProfilesResponse
        request = Protocol::Query.build_request(Model::LIST_INSTANCE_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListInstanceProfilesResponse, "ListInstanceProfiles")
      end

      # Lists the instance profiles that have the specified associated IAM role. If there are none, the
      # operation returns an empty list. For more information about instance profiles, go to Using instance
      # profiles in the IAM User Guide . You can paginate the results using the MaxItems and Marker
      # parameters.
      def list_instance_profiles_for_role(
        role_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListInstanceProfilesForRoleResponse
        input = Types::ListInstanceProfilesForRoleRequest.new(role_name: role_name, marker: marker, max_items: max_items)
        list_instance_profiles_for_role(input)
      end
      def list_instance_profiles_for_role(input : Types::ListInstanceProfilesForRoleRequest) : Types::ListInstanceProfilesForRoleResponse
        request = Protocol::Query.build_request(Model::LIST_INSTANCE_PROFILES_FOR_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListInstanceProfilesForRoleResponse, "ListInstanceProfilesForRole")
      end

      # Lists the tags that are attached to the specified IAM virtual multi-factor authentication (MFA)
      # device. The returned list of tags is sorted by tag key. For more information about tagging, see
      # Tagging IAM resources in the IAM User Guide .
      def list_mfa_device_tags(
        serial_number : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListMFADeviceTagsResponse
        input = Types::ListMFADeviceTagsRequest.new(serial_number: serial_number, marker: marker, max_items: max_items)
        list_mfa_device_tags(input)
      end
      def list_mfa_device_tags(input : Types::ListMFADeviceTagsRequest) : Types::ListMFADeviceTagsResponse
        request = Protocol::Query.build_request(Model::LIST_MFA_DEVICE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListMFADeviceTagsResponse, "ListMFADeviceTags")
      end

      # Lists the MFA devices for an IAM user. If the request includes a IAM user name, then this operation
      # lists all the MFA devices associated with the specified user. If you do not specify a user name, IAM
      # determines the user name implicitly based on the Amazon Web Services access key ID signing the
      # request for this operation. You can paginate the results using the MaxItems and Marker parameters.
      def list_mfa_devices(
        marker : String? = nil,
        max_items : Int32? = nil,
        user_name : String? = nil
      ) : Types::ListMFADevicesResponse
        input = Types::ListMFADevicesRequest.new(marker: marker, max_items: max_items, user_name: user_name)
        list_mfa_devices(input)
      end
      def list_mfa_devices(input : Types::ListMFADevicesRequest) : Types::ListMFADevicesResponse
        request = Protocol::Query.build_request(Model::LIST_MFA_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListMFADevicesResponse, "ListMFADevices")
      end

      # Lists the tags that are attached to the specified OpenID Connect (OIDC)-compatible identity
      # provider. The returned list of tags is sorted by tag key. For more information, see About web
      # identity federation . For more information about tagging, see Tagging IAM resources in the IAM User
      # Guide .
      def list_open_id_connect_provider_tags(
        open_id_connect_provider_arn : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListOpenIDConnectProviderTagsResponse
        input = Types::ListOpenIDConnectProviderTagsRequest.new(open_id_connect_provider_arn: open_id_connect_provider_arn, marker: marker, max_items: max_items)
        list_open_id_connect_provider_tags(input)
      end
      def list_open_id_connect_provider_tags(input : Types::ListOpenIDConnectProviderTagsRequest) : Types::ListOpenIDConnectProviderTagsResponse
        request = Protocol::Query.build_request(Model::LIST_OPEN_ID_CONNECT_PROVIDER_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListOpenIDConnectProviderTagsResponse, "ListOpenIDConnectProviderTags")
      end

      # Lists information about the IAM OpenID Connect (OIDC) provider resource objects defined in the
      # Amazon Web Services account. IAM resource-listing operations return a subset of the available
      # attributes for the resource. For example, this operation does not return tags, even though they are
      # an attribute of the returned object. To view all of the information for an OIDC provider, see
      # GetOpenIDConnectProvider .
      def list_open_id_connect_providers : Types::ListOpenIDConnectProvidersResponse
        input = Types::ListOpenIDConnectProvidersRequest.new
        list_open_id_connect_providers(input)
      end
      def list_open_id_connect_providers(input : Types::ListOpenIDConnectProvidersRequest) : Types::ListOpenIDConnectProvidersResponse
        request = Protocol::Query.build_request(Model::LIST_OPEN_ID_CONNECT_PROVIDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListOpenIDConnectProvidersResponse, "ListOpenIDConnectProviders")
      end

      # Lists the centralized root access features enabled for your organization. For more information, see
      # Centrally manage root access for member accounts .
      def list_organizations_features : Types::ListOrganizationsFeaturesResponse
        input = Types::ListOrganizationsFeaturesRequest.new
        list_organizations_features(input)
      end
      def list_organizations_features(input : Types::ListOrganizationsFeaturesRequest) : Types::ListOrganizationsFeaturesResponse
        request = Protocol::Query.build_request(Model::LIST_ORGANIZATIONS_FEATURES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListOrganizationsFeaturesResponse, "ListOrganizationsFeatures")
      end

      # Lists all the managed policies that are available in your Amazon Web Services account, including
      # your own customer-defined managed policies and all Amazon Web Services managed policies. You can
      # filter the list of policies that is returned using the optional OnlyAttached , Scope , and
      # PathPrefix parameters. For example, to list only the customer managed policies in your Amazon Web
      # Services account, set Scope to Local . To list only Amazon Web Services managed policies, set Scope
      # to AWS . You can paginate the results using the MaxItems and Marker parameters. For more information
      # about managed policies, see Managed policies and inline policies in the IAM User Guide . IAM
      # resource-listing operations return a subset of the available attributes for the resource. For
      # example, this operation does not return tags, even though they are an attribute of the returned
      # object. To view all of the information for a customer manged policy, see GetPolicy .
      def list_policies(
        marker : String? = nil,
        max_items : Int32? = nil,
        only_attached : Bool? = nil,
        path_prefix : String? = nil,
        policy_usage_filter : String? = nil,
        scope : String? = nil
      ) : Types::ListPoliciesResponse
        input = Types::ListPoliciesRequest.new(marker: marker, max_items: max_items, only_attached: only_attached, path_prefix: path_prefix, policy_usage_filter: policy_usage_filter, scope: scope)
        list_policies(input)
      end
      def list_policies(input : Types::ListPoliciesRequest) : Types::ListPoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPoliciesResponse, "ListPolicies")
      end

      # Retrieves a list of policies that the IAM identity (user, group, or role) can use to access each
      # specified service. This operation does not use other policy types when determining whether a
      # resource could access a service. These other policy types include resource-based policies, access
      # control lists, Organizations policies, IAM permissions boundaries, and STS assume role policies. It
      # only applies permissions policy logic. For more about the evaluation of policy types, see Evaluating
      # policies in the IAM User Guide . The list of policies returned by the operation depends on the ARN
      # of the identity that you provide. User – The list of policies includes the managed and inline
      # policies that are attached to the user directly. The list also includes any additional managed and
      # inline policies that are attached to the group to which the user belongs. Group – The list of
      # policies includes only the managed and inline policies that are attached to the group directly.
      # Policies that are attached to the group’s user are not included. Role – The list of policies
      # includes only the managed and inline policies that are attached to the role. For each managed
      # policy, this operation returns the ARN and policy name. For each inline policy, it returns the
      # policy name and the entity to which it is attached. Inline policies do not have an ARN. For more
      # information about these policy types, see Managed policies and inline policies in the IAM User Guide
      # . Policies that are attached to users and roles as permissions boundaries are not returned. To view
      # which managed policy is currently used to set the permissions boundary for a user or role, use the
      # GetUser or GetRole operations.
      def list_policies_granting_service_access(
        arn : String,
        service_namespaces : Array(String),
        marker : String? = nil
      ) : Types::ListPoliciesGrantingServiceAccessResponse
        input = Types::ListPoliciesGrantingServiceAccessRequest.new(arn: arn, service_namespaces: service_namespaces, marker: marker)
        list_policies_granting_service_access(input)
      end
      def list_policies_granting_service_access(input : Types::ListPoliciesGrantingServiceAccessRequest) : Types::ListPoliciesGrantingServiceAccessResponse
        request = Protocol::Query.build_request(Model::LIST_POLICIES_GRANTING_SERVICE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPoliciesGrantingServiceAccessResponse, "ListPoliciesGrantingServiceAccess")
      end

      # Lists the tags that are attached to the specified IAM customer managed policy. The returned list of
      # tags is sorted by tag key. For more information about tagging, see Tagging IAM resources in the IAM
      # User Guide .
      def list_policy_tags(
        policy_arn : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListPolicyTagsResponse
        input = Types::ListPolicyTagsRequest.new(policy_arn: policy_arn, marker: marker, max_items: max_items)
        list_policy_tags(input)
      end
      def list_policy_tags(input : Types::ListPolicyTagsRequest) : Types::ListPolicyTagsResponse
        request = Protocol::Query.build_request(Model::LIST_POLICY_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPolicyTagsResponse, "ListPolicyTags")
      end

      # Lists information about the versions of the specified managed policy, including the version that is
      # currently set as the policy's default version. For more information about managed policies, see
      # Managed policies and inline policies in the IAM User Guide .
      def list_policy_versions(
        policy_arn : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListPolicyVersionsResponse
        input = Types::ListPolicyVersionsRequest.new(policy_arn: policy_arn, marker: marker, max_items: max_items)
        list_policy_versions(input)
      end
      def list_policy_versions(input : Types::ListPolicyVersionsRequest) : Types::ListPolicyVersionsResponse
        request = Protocol::Query.build_request(Model::LIST_POLICY_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPolicyVersionsResponse, "ListPolicyVersions")
      end

      # Lists the names of the inline policies that are embedded in the specified IAM role. An IAM role can
      # also have managed policies attached to it. To list the managed policies that are attached to a role,
      # use ListAttachedRolePolicies . For more information about policies, see Managed policies and inline
      # policies in the IAM User Guide . You can paginate the results using the MaxItems and Marker
      # parameters. If there are no inline policies embedded with the specified role, the operation returns
      # an empty list.
      def list_role_policies(
        role_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListRolePoliciesResponse
        input = Types::ListRolePoliciesRequest.new(role_name: role_name, marker: marker, max_items: max_items)
        list_role_policies(input)
      end
      def list_role_policies(input : Types::ListRolePoliciesRequest) : Types::ListRolePoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_ROLE_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListRolePoliciesResponse, "ListRolePolicies")
      end

      # Lists the tags that are attached to the specified role. The returned list of tags is sorted by tag
      # key. For more information about tagging, see Tagging IAM resources in the IAM User Guide .
      def list_role_tags(
        role_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListRoleTagsResponse
        input = Types::ListRoleTagsRequest.new(role_name: role_name, marker: marker, max_items: max_items)
        list_role_tags(input)
      end
      def list_role_tags(input : Types::ListRoleTagsRequest) : Types::ListRoleTagsResponse
        request = Protocol::Query.build_request(Model::LIST_ROLE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListRoleTagsResponse, "ListRoleTags")
      end

      # Lists the IAM roles that have the specified path prefix. If there are none, the operation returns an
      # empty list. For more information about roles, see IAM roles in the IAM User Guide . IAM
      # resource-listing operations return a subset of the available attributes for the resource. This
      # operation does not return the following attributes, even though they are an attribute of the
      # returned object: PermissionsBoundary RoleLastUsed Tags To view all of the information for a role,
      # see GetRole . You can paginate the results using the MaxItems and Marker parameters.
      def list_roles(
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListRolesResponse
        input = Types::ListRolesRequest.new(marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_roles(input)
      end
      def list_roles(input : Types::ListRolesRequest) : Types::ListRolesResponse
        request = Protocol::Query.build_request(Model::LIST_ROLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListRolesResponse, "ListRoles")
      end

      # Lists the tags that are attached to the specified Security Assertion Markup Language (SAML) identity
      # provider. The returned list of tags is sorted by tag key. For more information, see About SAML
      # 2.0-based federation . For more information about tagging, see Tagging IAM resources in the IAM User
      # Guide .
      def list_saml_provider_tags(
        saml_provider_arn : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListSAMLProviderTagsResponse
        input = Types::ListSAMLProviderTagsRequest.new(saml_provider_arn: saml_provider_arn, marker: marker, max_items: max_items)
        list_saml_provider_tags(input)
      end
      def list_saml_provider_tags(input : Types::ListSAMLProviderTagsRequest) : Types::ListSAMLProviderTagsResponse
        request = Protocol::Query.build_request(Model::LIST_SAML_PROVIDER_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListSAMLProviderTagsResponse, "ListSAMLProviderTags")
      end

      # Lists the SAML provider resource objects defined in IAM in the account. IAM resource-listing
      # operations return a subset of the available attributes for the resource. For example, this operation
      # does not return tags, even though they are an attribute of the returned object. To view all of the
      # information for a SAML provider, see GetSAMLProvider . This operation requires Signature Version 4 .
      def list_saml_providers : Types::ListSAMLProvidersResponse
        input = Types::ListSAMLProvidersRequest.new
        list_saml_providers(input)
      end
      def list_saml_providers(input : Types::ListSAMLProvidersRequest) : Types::ListSAMLProvidersResponse
        request = Protocol::Query.build_request(Model::LIST_SAML_PROVIDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListSAMLProvidersResponse, "ListSAMLProviders")
      end

      # Returns information about the SSH public keys associated with the specified IAM user. If none
      # exists, the operation returns an empty list. The SSH public keys returned by this operation are used
      # only for authenticating the IAM user to an CodeCommit repository. For more information about using
      # SSH keys to authenticate to an CodeCommit repository, see Set up CodeCommit for SSH connections in
      # the CodeCommit User Guide . Although each user is limited to a small number of keys, you can still
      # paginate the results using the MaxItems and Marker parameters.
      def list_ssh_public_keys(
        marker : String? = nil,
        max_items : Int32? = nil,
        user_name : String? = nil
      ) : Types::ListSSHPublicKeysResponse
        input = Types::ListSSHPublicKeysRequest.new(marker: marker, max_items: max_items, user_name: user_name)
        list_ssh_public_keys(input)
      end
      def list_ssh_public_keys(input : Types::ListSSHPublicKeysRequest) : Types::ListSSHPublicKeysResponse
        request = Protocol::Query.build_request(Model::LIST_SSH_PUBLIC_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListSSHPublicKeysResponse, "ListSSHPublicKeys")
      end

      # Lists the tags that are attached to the specified IAM server certificate. The returned list of tags
      # is sorted by tag key. For more information about tagging, see Tagging IAM resources in the IAM User
      # Guide . For certificates in a Region supported by Certificate Manager (ACM), we recommend that you
      # don't use IAM server certificates. Instead, use ACM to provision, manage, and deploy your server
      # certificates. For more information about IAM server certificates, Working with server certificates
      # in the IAM User Guide .
      def list_server_certificate_tags(
        server_certificate_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListServerCertificateTagsResponse
        input = Types::ListServerCertificateTagsRequest.new(server_certificate_name: server_certificate_name, marker: marker, max_items: max_items)
        list_server_certificate_tags(input)
      end
      def list_server_certificate_tags(input : Types::ListServerCertificateTagsRequest) : Types::ListServerCertificateTagsResponse
        request = Protocol::Query.build_request(Model::LIST_SERVER_CERTIFICATE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListServerCertificateTagsResponse, "ListServerCertificateTags")
      end

      # Lists the server certificates stored in IAM that have the specified path prefix. If none exist, the
      # operation returns an empty list. You can paginate the results using the MaxItems and Marker
      # parameters. For more information about working with server certificates, see Working with server
      # certificates in the IAM User Guide . This topic also includes a list of Amazon Web Services services
      # that can use the server certificates that you manage with IAM. IAM resource-listing operations
      # return a subset of the available attributes for the resource. For example, this operation does not
      # return tags, even though they are an attribute of the returned object. To view all of the
      # information for a servercertificate, see GetServerCertificate .
      def list_server_certificates(
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListServerCertificatesResponse
        input = Types::ListServerCertificatesRequest.new(marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_server_certificates(input)
      end
      def list_server_certificates(input : Types::ListServerCertificatesRequest) : Types::ListServerCertificatesResponse
        request = Protocol::Query.build_request(Model::LIST_SERVER_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListServerCertificatesResponse, "ListServerCertificates")
      end

      # Returns information about the service-specific credentials associated with the specified IAM user.
      # If none exists, the operation returns an empty list. The service-specific credentials returned by
      # this operation are used only for authenticating the IAM user to a specific service. For more
      # information about using service-specific credentials to authenticate to an Amazon Web Services
      # service, see Set up service-specific credentials in the CodeCommit User Guide.
      def list_service_specific_credentials(
        all_users : Bool? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        service_name : String? = nil,
        user_name : String? = nil
      ) : Types::ListServiceSpecificCredentialsResponse
        input = Types::ListServiceSpecificCredentialsRequest.new(all_users: all_users, marker: marker, max_items: max_items, service_name: service_name, user_name: user_name)
        list_service_specific_credentials(input)
      end
      def list_service_specific_credentials(input : Types::ListServiceSpecificCredentialsRequest) : Types::ListServiceSpecificCredentialsResponse
        request = Protocol::Query.build_request(Model::LIST_SERVICE_SPECIFIC_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListServiceSpecificCredentialsResponse, "ListServiceSpecificCredentials")
      end

      # Returns information about the signing certificates associated with the specified IAM user. If none
      # exists, the operation returns an empty list. Although each user is limited to a small number of
      # signing certificates, you can still paginate the results using the MaxItems and Marker parameters.
      # If the UserName field is not specified, the user name is determined implicitly based on the Amazon
      # Web Services access key ID used to sign the request for this operation. This operation works for
      # access keys under the Amazon Web Services account. Consequently, you can use this operation to
      # manage Amazon Web Services account root user credentials even if the Amazon Web Services account has
      # no associated users.
      def list_signing_certificates(
        marker : String? = nil,
        max_items : Int32? = nil,
        user_name : String? = nil
      ) : Types::ListSigningCertificatesResponse
        input = Types::ListSigningCertificatesRequest.new(marker: marker, max_items: max_items, user_name: user_name)
        list_signing_certificates(input)
      end
      def list_signing_certificates(input : Types::ListSigningCertificatesRequest) : Types::ListSigningCertificatesResponse
        request = Protocol::Query.build_request(Model::LIST_SIGNING_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListSigningCertificatesResponse, "ListSigningCertificates")
      end

      # Lists the names of the inline policies embedded in the specified IAM user. An IAM user can also have
      # managed policies attached to it. To list the managed policies that are attached to a user, use
      # ListAttachedUserPolicies . For more information about policies, see Managed policies and inline
      # policies in the IAM User Guide . You can paginate the results using the MaxItems and Marker
      # parameters. If there are no inline policies embedded with the specified user, the operation returns
      # an empty list.
      def list_user_policies(
        user_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListUserPoliciesResponse
        input = Types::ListUserPoliciesRequest.new(user_name: user_name, marker: marker, max_items: max_items)
        list_user_policies(input)
      end
      def list_user_policies(input : Types::ListUserPoliciesRequest) : Types::ListUserPoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_USER_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListUserPoliciesResponse, "ListUserPolicies")
      end

      # Lists the tags that are attached to the specified IAM user. The returned list of tags is sorted by
      # tag key. For more information about tagging, see Tagging IAM resources in the IAM User Guide .
      def list_user_tags(
        user_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListUserTagsResponse
        input = Types::ListUserTagsRequest.new(user_name: user_name, marker: marker, max_items: max_items)
        list_user_tags(input)
      end
      def list_user_tags(input : Types::ListUserTagsRequest) : Types::ListUserTagsResponse
        request = Protocol::Query.build_request(Model::LIST_USER_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListUserTagsResponse, "ListUserTags")
      end

      # Lists the IAM users that have the specified path prefix. If no path prefix is specified, the
      # operation returns all users in the Amazon Web Services account. If there are none, the operation
      # returns an empty list. IAM resource-listing operations return a subset of the available attributes
      # for the resource. This operation does not return the following attributes, even though they are an
      # attribute of the returned object: PermissionsBoundary Tags To view all of the information for a
      # user, see GetUser . You can paginate the results using the MaxItems and Marker parameters.
      def list_users(
        marker : String? = nil,
        max_items : Int32? = nil,
        path_prefix : String? = nil
      ) : Types::ListUsersResponse
        input = Types::ListUsersRequest.new(marker: marker, max_items: max_items, path_prefix: path_prefix)
        list_users(input)
      end
      def list_users(input : Types::ListUsersRequest) : Types::ListUsersResponse
        request = Protocol::Query.build_request(Model::LIST_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListUsersResponse, "ListUsers")
      end

      # Lists the virtual MFA devices defined in the Amazon Web Services account by assignment status. If
      # you do not specify an assignment status, the operation returns a list of all virtual MFA devices.
      # Assignment status can be Assigned , Unassigned , or Any . IAM resource-listing operations return a
      # subset of the available attributes for the resource. For example, this operation does not return
      # tags, even though they are an attribute of the returned object. To view tag information for a
      # virtual MFA device, see ListMFADeviceTags . You can paginate the results using the MaxItems and
      # Marker parameters.
      def list_virtual_mfa_devices(
        assignment_status : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Types::ListVirtualMFADevicesResponse
        input = Types::ListVirtualMFADevicesRequest.new(assignment_status: assignment_status, marker: marker, max_items: max_items)
        list_virtual_mfa_devices(input)
      end
      def list_virtual_mfa_devices(input : Types::ListVirtualMFADevicesRequest) : Types::ListVirtualMFADevicesResponse
        request = Protocol::Query.build_request(Model::LIST_VIRTUAL_MFA_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListVirtualMFADevicesResponse, "ListVirtualMFADevices")
      end

      # Adds or updates an inline policy document that is embedded in the specified IAM group. A user can
      # also have managed policies attached to it. To attach a managed policy to a group, use
      # AttachGroupPolicy . To create a new managed policy, use CreatePolicy . For information about
      # policies, see Managed policies and inline policies in the IAM User Guide . For information about the
      # maximum number of inline policies that you can embed in a group, see IAM and STS quotas in the IAM
      # User Guide . Because policy documents can be large, you should use POST rather than GET when calling
      # PutGroupPolicy . For general information about using the Query API with IAM, see Making query
      # requests in the IAM User Guide .
      def put_group_policy(
        group_name : String,
        policy_document : String,
        policy_name : String
      ) : Nil
        input = Types::PutGroupPolicyRequest.new(group_name: group_name, policy_document: policy_document, policy_name: policy_name)
        put_group_policy(input)
      end
      def put_group_policy(input : Types::PutGroupPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::PUT_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds or updates the policy that is specified as the IAM role's permissions boundary. You can use an
      # Amazon Web Services managed policy or a customer managed policy to set the boundary for a role. Use
      # the boundary to control the maximum permissions that the role can have. Setting a permissions
      # boundary is an advanced feature that can affect the permissions for the role. You cannot set the
      # boundary for a service-linked role. Policies used as permissions boundaries do not provide
      # permissions. You must also attach a permissions policy to the role. To learn how the effective
      # permissions for a role are evaluated, see IAM JSON policy evaluation logic in the IAM User Guide.
      def put_role_permissions_boundary(
        permissions_boundary : String,
        role_name : String
      ) : Nil
        input = Types::PutRolePermissionsBoundaryRequest.new(permissions_boundary: permissions_boundary, role_name: role_name)
        put_role_permissions_boundary(input)
      end
      def put_role_permissions_boundary(input : Types::PutRolePermissionsBoundaryRequest) : Nil
        request = Protocol::Query.build_request(Model::PUT_ROLE_PERMISSIONS_BOUNDARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds or updates an inline policy document that is embedded in the specified IAM role. When you embed
      # an inline policy in a role, the inline policy is used as part of the role's access (permissions)
      # policy. The role's trust policy is created at the same time as the role, using CreateRole . You can
      # update a role's trust policy using UpdateAssumeRolePolicy . For more information about roles, see
      # IAM roles in the IAM User Guide . A role can also have a managed policy attached to it. To attach a
      # managed policy to a role, use AttachRolePolicy . To create a new managed policy, use CreatePolicy .
      # For information about policies, see Managed policies and inline policies in the IAM User Guide . For
      # information about the maximum number of inline policies that you can embed with a role, see IAM and
      # STS quotas in the IAM User Guide . Because policy documents can be large, you should use POST rather
      # than GET when calling PutRolePolicy . For general information about using the Query API with IAM,
      # see Making query requests in the IAM User Guide .
      def put_role_policy(
        policy_document : String,
        policy_name : String,
        role_name : String
      ) : Nil
        input = Types::PutRolePolicyRequest.new(policy_document: policy_document, policy_name: policy_name, role_name: role_name)
        put_role_policy(input)
      end
      def put_role_policy(input : Types::PutRolePolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::PUT_ROLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds or updates the policy that is specified as the IAM user's permissions boundary. You can use an
      # Amazon Web Services managed policy or a customer managed policy to set the boundary for a user. Use
      # the boundary to control the maximum permissions that the user can have. Setting a permissions
      # boundary is an advanced feature that can affect the permissions for the user. Policies that are used
      # as permissions boundaries do not provide permissions. You must also attach a permissions policy to
      # the user. To learn how the effective permissions for a user are evaluated, see IAM JSON policy
      # evaluation logic in the IAM User Guide.
      def put_user_permissions_boundary(
        permissions_boundary : String,
        user_name : String
      ) : Nil
        input = Types::PutUserPermissionsBoundaryRequest.new(permissions_boundary: permissions_boundary, user_name: user_name)
        put_user_permissions_boundary(input)
      end
      def put_user_permissions_boundary(input : Types::PutUserPermissionsBoundaryRequest) : Nil
        request = Protocol::Query.build_request(Model::PUT_USER_PERMISSIONS_BOUNDARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds or updates an inline policy document that is embedded in the specified IAM user. An IAM user
      # can also have a managed policy attached to it. To attach a managed policy to a user, use
      # AttachUserPolicy . To create a new managed policy, use CreatePolicy . For information about
      # policies, see Managed policies and inline policies in the IAM User Guide . For information about the
      # maximum number of inline policies that you can embed in a user, see IAM and STS quotas in the IAM
      # User Guide . Because policy documents can be large, you should use POST rather than GET when calling
      # PutUserPolicy . For general information about using the Query API with IAM, see Making query
      # requests in the IAM User Guide .
      def put_user_policy(
        policy_document : String,
        policy_name : String,
        user_name : String
      ) : Nil
        input = Types::PutUserPolicyRequest.new(policy_document: policy_document, policy_name: policy_name, user_name: user_name)
        put_user_policy(input)
      end
      def put_user_policy(input : Types::PutUserPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::PUT_USER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Rejects a delegation request, denying the requested temporary access. Once a request is rejected, it
      # cannot be accepted or updated later. Rejected requests expire after 7 days. When rejecting a
      # request, an optional explanation can be added using the Notes request parameter. For more details,
      # see Managing Permissions for Delegation Requests .
      def reject_delegation_request(
        delegation_request_id : String,
        notes : String? = nil
      ) : Nil
        input = Types::RejectDelegationRequestRequest.new(delegation_request_id: delegation_request_id, notes: notes)
        reject_delegation_request(input)
      end
      def reject_delegation_request(input : Types::RejectDelegationRequestRequest) : Nil
        request = Protocol::Query.build_request(Model::REJECT_DELEGATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified client ID (also known as audience) from the list of client IDs registered for
      # the specified IAM OpenID Connect (OIDC) provider resource object. This operation is idempotent; it
      # does not fail or return an error if you try to remove a client ID that does not exist.
      def remove_client_id_from_open_id_connect_provider(
        client_id : String,
        open_id_connect_provider_arn : String
      ) : Nil
        input = Types::RemoveClientIDFromOpenIDConnectProviderRequest.new(client_id: client_id, open_id_connect_provider_arn: open_id_connect_provider_arn)
        remove_client_id_from_open_id_connect_provider(input)
      end
      def remove_client_id_from_open_id_connect_provider(input : Types::RemoveClientIDFromOpenIDConnectProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::REMOVE_CLIENT_ID_FROM_OPEN_ID_CONNECT_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified IAM role from the specified Amazon EC2 instance profile. Make sure that you do
      # not have any Amazon EC2 instances running with the role you are about to remove from the instance
      # profile. Removing a role from an instance profile that is associated with a running instance might
      # break any applications running on the instance. For more information about roles, see IAM roles in
      # the IAM User Guide . For more information about instance profiles, see Using instance profiles in
      # the IAM User Guide .
      def remove_role_from_instance_profile(
        instance_profile_name : String,
        role_name : String
      ) : Nil
        input = Types::RemoveRoleFromInstanceProfileRequest.new(instance_profile_name: instance_profile_name, role_name: role_name)
        remove_role_from_instance_profile(input)
      end
      def remove_role_from_instance_profile(input : Types::RemoveRoleFromInstanceProfileRequest) : Nil
        request = Protocol::Query.build_request(Model::REMOVE_ROLE_FROM_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified user from the specified group.
      def remove_user_from_group(
        group_name : String,
        user_name : String
      ) : Nil
        input = Types::RemoveUserFromGroupRequest.new(group_name: group_name, user_name: user_name)
        remove_user_from_group(input)
      end
      def remove_user_from_group(input : Types::RemoveUserFromGroupRequest) : Nil
        request = Protocol::Query.build_request(Model::REMOVE_USER_FROM_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Resets the password for a service-specific credential. The new password is Amazon Web Services
      # generated and cryptographically strong. It cannot be configured by the user. Resetting the password
      # immediately invalidates the previous password associated with this user.
      def reset_service_specific_credential(
        service_specific_credential_id : String,
        user_name : String? = nil
      ) : Types::ResetServiceSpecificCredentialResponse
        input = Types::ResetServiceSpecificCredentialRequest.new(service_specific_credential_id: service_specific_credential_id, user_name: user_name)
        reset_service_specific_credential(input)
      end
      def reset_service_specific_credential(input : Types::ResetServiceSpecificCredentialRequest) : Types::ResetServiceSpecificCredentialResponse
        request = Protocol::Query.build_request(Model::RESET_SERVICE_SPECIFIC_CREDENTIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ResetServiceSpecificCredentialResponse, "ResetServiceSpecificCredential")
      end

      # Synchronizes the specified MFA device with its IAM resource object on the Amazon Web Services
      # servers. For more information about creating and working with virtual MFA devices, see Using a
      # virtual MFA device in the IAM User Guide .
      def resync_mfa_device(
        authentication_code1 : String,
        authentication_code2 : String,
        serial_number : String,
        user_name : String
      ) : Nil
        input = Types::ResyncMFADeviceRequest.new(authentication_code1: authentication_code1, authentication_code2: authentication_code2, serial_number: serial_number, user_name: user_name)
        resync_mfa_device(input)
      end
      def resync_mfa_device(input : Types::ResyncMFADeviceRequest) : Nil
        request = Protocol::Query.build_request(Model::RESYNC_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Sends the exchange token for an accepted delegation request. The exchange token is sent to the
      # partner via an asynchronous notification channel, established by the partner. The delegation request
      # must be in the ACCEPTED state when calling this API. After the SendDelegationToken API call is
      # successful, the request transitions to a FINALIZED state and cannot be rolled back. However, a user
      # may reject an accepted request before the SendDelegationToken API is called. For more details, see
      # Managing Permissions for Delegation Requests .
      def send_delegation_token(
        delegation_request_id : String
      ) : Nil
        input = Types::SendDelegationTokenRequest.new(delegation_request_id: delegation_request_id)
        send_delegation_token(input)
      end
      def send_delegation_token(input : Types::SendDelegationTokenRequest) : Nil
        request = Protocol::Query.build_request(Model::SEND_DELEGATION_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the specified version of the specified policy as the policy's default (operative) version. This
      # operation affects all users, groups, and roles that the policy is attached to. To list the users,
      # groups, and roles that the policy is attached to, use ListEntitiesForPolicy . For information about
      # managed policies, see Managed policies and inline policies in the IAM User Guide .
      def set_default_policy_version(
        policy_arn : String,
        version_id : String
      ) : Nil
        input = Types::SetDefaultPolicyVersionRequest.new(policy_arn: policy_arn, version_id: version_id)
        set_default_policy_version(input)
      end
      def set_default_policy_version(input : Types::SetDefaultPolicyVersionRequest) : Nil
        request = Protocol::Query.build_request(Model::SET_DEFAULT_POLICY_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the specified version of the global endpoint token as the token version used for the Amazon Web
      # Services account. By default, Security Token Service (STS) is available as a global service, and all
      # STS requests go to a single endpoint at https://sts.amazonaws.com . Amazon Web Services recommends
      # using Regional STS endpoints to reduce latency, build in redundancy, and increase session token
      # availability. For information about Regional endpoints for STS, see Security Token Service endpoints
      # and quotas in the Amazon Web Services General Reference . If you make an STS call to the global
      # endpoint, the resulting session tokens might be valid in some Regions but not others. It depends on
      # the version that is set in this operation. Version 1 tokens are valid only in Amazon Web Services
      # Regions that are available by default. These tokens do not work in manually enabled Regions, such as
      # Asia Pacific (Hong Kong). Version 2 tokens are valid in all Regions. However, version 2 tokens are
      # longer and might affect systems where you temporarily store tokens. For information, see Activating
      # and deactivating STS in an Amazon Web Services Region in the IAM User Guide . To view the current
      # session token version, see the GlobalEndpointTokenVersion entry in the response of the
      # GetAccountSummary operation.
      def set_security_token_service_preferences(
        global_endpoint_token_version : String
      ) : Nil
        input = Types::SetSecurityTokenServicePreferencesRequest.new(global_endpoint_token_version: global_endpoint_token_version)
        set_security_token_service_preferences(input)
      end
      def set_security_token_service_preferences(input : Types::SetSecurityTokenServicePreferencesRequest) : Nil
        request = Protocol::Query.build_request(Model::SET_SECURITY_TOKEN_SERVICE_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Simulate how a set of IAM policies and optionally a resource-based policy works with a list of API
      # operations and Amazon Web Services resources to determine the policies' effective permissions. The
      # policies are provided as strings. The simulation does not perform the API operations; it only checks
      # the authorization to determine if the simulated policies allow or deny the operations. You can
      # simulate resources that don't exist in your account. If you want to simulate existing policies that
      # are attached to an IAM user, group, or role, use SimulatePrincipalPolicy instead. Context keys are
      # variables that are maintained by Amazon Web Services and its services and which provide details
      # about the context of an API query request. You can use the Condition element of an IAM policy to
      # evaluate context keys. To get the list of context keys that the policies require for correct
      # simulation, use GetContextKeysForCustomPolicy . If the output is long, you can use MaxItems and
      # Marker parameters to paginate the results. The IAM policy simulator evaluates statements in the
      # identity-based policy and the inputs that you provide during simulation. The policy simulator
      # results can differ from your live Amazon Web Services environment. We recommend that you check your
      # policies against your live Amazon Web Services environment after testing using the policy simulator
      # to confirm that you have the desired results. For more information about using the policy simulator,
      # see Testing IAM policies with the IAM policy simulator in the IAM User Guide .
      def simulate_custom_policy(
        action_names : Array(String),
        policy_input_list : Array(String),
        caller_arn : String? = nil,
        context_entries : Array(Types::ContextEntry)? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        permissions_boundary_policy_input_list : Array(String)? = nil,
        resource_arns : Array(String)? = nil,
        resource_handling_option : String? = nil,
        resource_owner : String? = nil,
        resource_policy : String? = nil
      ) : Types::SimulatePolicyResponse
        input = Types::SimulateCustomPolicyRequest.new(action_names: action_names, policy_input_list: policy_input_list, caller_arn: caller_arn, context_entries: context_entries, marker: marker, max_items: max_items, permissions_boundary_policy_input_list: permissions_boundary_policy_input_list, resource_arns: resource_arns, resource_handling_option: resource_handling_option, resource_owner: resource_owner, resource_policy: resource_policy)
        simulate_custom_policy(input)
      end
      def simulate_custom_policy(input : Types::SimulateCustomPolicyRequest) : Types::SimulatePolicyResponse
        request = Protocol::Query.build_request(Model::SIMULATE_CUSTOM_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SimulatePolicyResponse, "SimulateCustomPolicy")
      end

      # Simulate how a set of IAM policies attached to an IAM entity works with a list of API operations and
      # Amazon Web Services resources to determine the policies' effective permissions. The entity can be an
      # IAM user, group, or role. If you specify a user, then the simulation also includes all of the
      # policies that are attached to groups that the user belongs to. You can simulate resources that don't
      # exist in your account. You can optionally include a list of one or more additional policies
      # specified as strings to include in the simulation. If you want to simulate only policies specified
      # as strings, use SimulateCustomPolicy instead. You can also optionally include one resource-based
      # policy to be evaluated with each of the resources included in the simulation for IAM users only. The
      # simulation does not perform the API operations; it only checks the authorization to determine if the
      # simulated policies allow or deny the operations. Note: This operation discloses information about
      # the permissions granted to other users. If you do not want users to see other user's permissions,
      # then consider allowing them to use SimulateCustomPolicy instead. Context keys are variables
      # maintained by Amazon Web Services and its services that provide details about the context of an API
      # query request. You can use the Condition element of an IAM policy to evaluate context keys. To get
      # the list of context keys that the policies require for correct simulation, use
      # GetContextKeysForPrincipalPolicy . If the output is long, you can use the MaxItems and Marker
      # parameters to paginate the results. The IAM policy simulator evaluates statements in the
      # identity-based policy and the inputs that you provide during simulation. The policy simulator
      # results can differ from your live Amazon Web Services environment. We recommend that you check your
      # policies against your live Amazon Web Services environment after testing using the policy simulator
      # to confirm that you have the desired results. For more information about using the policy simulator,
      # see Testing IAM policies with the IAM policy simulator in the IAM User Guide .
      def simulate_principal_policy(
        action_names : Array(String),
        policy_source_arn : String,
        caller_arn : String? = nil,
        context_entries : Array(Types::ContextEntry)? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        permissions_boundary_policy_input_list : Array(String)? = nil,
        policy_input_list : Array(String)? = nil,
        resource_arns : Array(String)? = nil,
        resource_handling_option : String? = nil,
        resource_owner : String? = nil,
        resource_policy : String? = nil
      ) : Types::SimulatePolicyResponse
        input = Types::SimulatePrincipalPolicyRequest.new(action_names: action_names, policy_source_arn: policy_source_arn, caller_arn: caller_arn, context_entries: context_entries, marker: marker, max_items: max_items, permissions_boundary_policy_input_list: permissions_boundary_policy_input_list, policy_input_list: policy_input_list, resource_arns: resource_arns, resource_handling_option: resource_handling_option, resource_owner: resource_owner, resource_policy: resource_policy)
        simulate_principal_policy(input)
      end
      def simulate_principal_policy(input : Types::SimulatePrincipalPolicyRequest) : Types::SimulatePolicyResponse
        request = Protocol::Query.build_request(Model::SIMULATE_PRINCIPAL_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SimulatePolicyResponse, "SimulatePrincipalPolicy")
      end

      # Adds one or more tags to an IAM instance profile. If a tag with the same key name already exists,
      # then that tag is overwritten with the new value. Each tag consists of a key name and an associated
      # value. By assigning tags to your resources, you can do the following: Administrative grouping and
      # discovery - Attach tags to resources to aid in organization and search. For example, you could
      # search for all resources with the key name Project and the value MyImportantProject . Or search for
      # all resources with the key name Cost Center and the value 41200 . Access control - Include tags in
      # IAM user-based and resource-based policies. You can use tags to restrict access to only an IAM
      # instance profile that has a specified tag attached. For examples of policies that show how to use
      # tags to control access, see Control access using IAM tags in the IAM User Guide . If any one of the
      # tags is invalid or if you exceed the allowed maximum number of tags, then the entire request fails
      # and the resource is not created. For more information about tagging, see Tagging IAM resources in
      # the IAM User Guide . Amazon Web Services always interprets the tag Value as a single string. If you
      # need to store an array, you can store comma-separated values in the string. However, you must
      # interpret the value in your code.
      def tag_instance_profile(
        instance_profile_name : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagInstanceProfileRequest.new(instance_profile_name: instance_profile_name, tags: tags)
        tag_instance_profile(input)
      end
      def tag_instance_profile(input : Types::TagInstanceProfileRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to an IAM virtual multi-factor authentication (MFA) device. If a tag with the
      # same key name already exists, then that tag is overwritten with the new value. A tag consists of a
      # key name and an associated value. By assigning tags to your resources, you can do the following:
      # Administrative grouping and discovery - Attach tags to resources to aid in organization and search.
      # For example, you could search for all resources with the key name Project and the value
      # MyImportantProject . Or search for all resources with the key name Cost Center and the value 41200 .
      # Access control - Include tags in IAM user-based and resource-based policies. You can use tags to
      # restrict access to only an IAM virtual MFA device that has a specified tag attached. For examples of
      # policies that show how to use tags to control access, see Control access using IAM tags in the IAM
      # User Guide . If any one of the tags is invalid or if you exceed the allowed maximum number of tags,
      # then the entire request fails and the resource is not created. For more information about tagging,
      # see Tagging IAM resources in the IAM User Guide . Amazon Web Services always interprets the tag
      # Value as a single string. If you need to store an array, you can store comma-separated values in the
      # string. However, you must interpret the value in your code.
      def tag_mfa_device(
        serial_number : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagMFADeviceRequest.new(serial_number: serial_number, tags: tags)
        tag_mfa_device(input)
      end
      def tag_mfa_device(input : Types::TagMFADeviceRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to an OpenID Connect (OIDC)-compatible identity provider. For more information
      # about these providers, see About web identity federation . If a tag with the same key name already
      # exists, then that tag is overwritten with the new value. A tag consists of a key name and an
      # associated value. By assigning tags to your resources, you can do the following: Administrative
      # grouping and discovery - Attach tags to resources to aid in organization and search. For example,
      # you could search for all resources with the key name Project and the value MyImportantProject . Or
      # search for all resources with the key name Cost Center and the value 41200 . Access control -
      # Include tags in IAM identity-based and resource-based policies. You can use tags to restrict access
      # to only an OIDC provider that has a specified tag attached. For examples of policies that show how
      # to use tags to control access, see Control access using IAM tags in the IAM User Guide . If any one
      # of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
      # fails and the resource is not created. For more information about tagging, see Tagging IAM resources
      # in the IAM User Guide . Amazon Web Services always interprets the tag Value as a single string. If
      # you need to store an array, you can store comma-separated values in the string. However, you must
      # interpret the value in your code.
      def tag_open_id_connect_provider(
        open_id_connect_provider_arn : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagOpenIDConnectProviderRequest.new(open_id_connect_provider_arn: open_id_connect_provider_arn, tags: tags)
        tag_open_id_connect_provider(input)
      end
      def tag_open_id_connect_provider(input : Types::TagOpenIDConnectProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_OPEN_ID_CONNECT_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to an IAM customer managed policy. If a tag with the same key name already
      # exists, then that tag is overwritten with the new value. A tag consists of a key name and an
      # associated value. By assigning tags to your resources, you can do the following: Administrative
      # grouping and discovery - Attach tags to resources to aid in organization and search. For example,
      # you could search for all resources with the key name Project and the value MyImportantProject . Or
      # search for all resources with the key name Cost Center and the value 41200 . Access control -
      # Include tags in IAM user-based and resource-based policies. You can use tags to restrict access to
      # only an IAM customer managed policy that has a specified tag attached. For examples of policies that
      # show how to use tags to control access, see Control access using IAM tags in the IAM User Guide . If
      # any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire
      # request fails and the resource is not created. For more information about tagging, see Tagging IAM
      # resources in the IAM User Guide . Amazon Web Services always interprets the tag Value as a single
      # string. If you need to store an array, you can store comma-separated values in the string. However,
      # you must interpret the value in your code.
      def tag_policy(
        policy_arn : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagPolicyRequest.new(policy_arn: policy_arn, tags: tags)
        tag_policy(input)
      end
      def tag_policy(input : Types::TagPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to an IAM role. The role can be a regular role or a service-linked role. If a
      # tag with the same key name already exists, then that tag is overwritten with the new value. A tag
      # consists of a key name and an associated value. By assigning tags to your resources, you can do the
      # following: Administrative grouping and discovery - Attach tags to resources to aid in organization
      # and search. For example, you could search for all resources with the key name Project and the value
      # MyImportantProject . Or search for all resources with the key name Cost Center and the value 41200 .
      # Access control - Include tags in IAM user-based and resource-based policies. You can use tags to
      # restrict access to only an IAM role that has a specified tag attached. You can also restrict access
      # to only those resources that have a certain tag attached. For examples of policies that show how to
      # use tags to control access, see Control access using IAM tags in the IAM User Guide . Cost
      # allocation - Use tags to help track which individuals and teams are using which Amazon Web Services
      # resources. If any one of the tags is invalid or if you exceed the allowed maximum number of tags,
      # then the entire request fails and the resource is not created. For more information about tagging,
      # see Tagging IAM resources in the IAM User Guide . Amazon Web Services always interprets the tag
      # Value as a single string. If you need to store an array, you can store comma-separated values in the
      # string. However, you must interpret the value in your code. For more information about tagging, see
      # Tagging IAM identities in the IAM User Guide .
      def tag_role(
        role_name : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagRoleRequest.new(role_name: role_name, tags: tags)
        tag_role(input)
      end
      def tag_role(input : Types::TagRoleRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to a Security Assertion Markup Language (SAML) identity provider. For more
      # information about these providers, see About SAML 2.0-based federation . If a tag with the same key
      # name already exists, then that tag is overwritten with the new value. A tag consists of a key name
      # and an associated value. By assigning tags to your resources, you can do the following:
      # Administrative grouping and discovery - Attach tags to resources to aid in organization and search.
      # For example, you could search for all resources with the key name Project and the value
      # MyImportantProject . Or search for all resources with the key name Cost Center and the value 41200 .
      # Access control - Include tags in IAM user-based and resource-based policies. You can use tags to
      # restrict access to only a SAML identity provider that has a specified tag attached. For examples of
      # policies that show how to use tags to control access, see Control access using IAM tags in the IAM
      # User Guide . If any one of the tags is invalid or if you exceed the allowed maximum number of tags,
      # then the entire request fails and the resource is not created. For more information about tagging,
      # see Tagging IAM resources in the IAM User Guide . Amazon Web Services always interprets the tag
      # Value as a single string. If you need to store an array, you can store comma-separated values in the
      # string. However, you must interpret the value in your code.
      def tag_saml_provider(
        saml_provider_arn : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagSAMLProviderRequest.new(saml_provider_arn: saml_provider_arn, tags: tags)
        tag_saml_provider(input)
      end
      def tag_saml_provider(input : Types::TagSAMLProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_SAML_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to an IAM server certificate. If a tag with the same key name already exists,
      # then that tag is overwritten with the new value. For certificates in a Region supported by
      # Certificate Manager (ACM), we recommend that you don't use IAM server certificates. Instead, use ACM
      # to provision, manage, and deploy your server certificates. For more information about IAM server
      # certificates, Working with server certificates in the IAM User Guide . A tag consists of a key name
      # and an associated value. By assigning tags to your resources, you can do the following:
      # Administrative grouping and discovery - Attach tags to resources to aid in organization and search.
      # For example, you could search for all resources with the key name Project and the value
      # MyImportantProject . Or search for all resources with the key name Cost Center and the value 41200 .
      # Access control - Include tags in IAM user-based and resource-based policies. You can use tags to
      # restrict access to only a server certificate that has a specified tag attached. For examples of
      # policies that show how to use tags to control access, see Control access using IAM tags in the IAM
      # User Guide . Cost allocation - Use tags to help track which individuals and teams are using which
      # Amazon Web Services resources. If any one of the tags is invalid or if you exceed the allowed
      # maximum number of tags, then the entire request fails and the resource is not created. For more
      # information about tagging, see Tagging IAM resources in the IAM User Guide . Amazon Web Services
      # always interprets the tag Value as a single string. If you need to store an array, you can store
      # comma-separated values in the string. However, you must interpret the value in your code.
      def tag_server_certificate(
        server_certificate_name : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagServerCertificateRequest.new(server_certificate_name: server_certificate_name, tags: tags)
        tag_server_certificate(input)
      end
      def tag_server_certificate(input : Types::TagServerCertificateRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_SERVER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to an IAM user. If a tag with the same key name already exists, then that tag
      # is overwritten with the new value. A tag consists of a key name and an associated value. By
      # assigning tags to your resources, you can do the following: Administrative grouping and discovery -
      # Attach tags to resources to aid in organization and search. For example, you could search for all
      # resources with the key name Project and the value MyImportantProject . Or search for all resources
      # with the key name Cost Center and the value 41200 . Access control - Include tags in IAM
      # identity-based and resource-based policies. You can use tags to restrict access to only an IAM
      # requesting user that has a specified tag attached. You can also restrict access to only those
      # resources that have a certain tag attached. For examples of policies that show how to use tags to
      # control access, see Control access using IAM tags in the IAM User Guide . Cost allocation - Use tags
      # to help track which individuals and teams are using which Amazon Web Services resources. If any one
      # of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
      # fails and the resource is not created. For more information about tagging, see Tagging IAM resources
      # in the IAM User Guide . Amazon Web Services always interprets the tag Value as a single string. If
      # you need to store an array, you can store comma-separated values in the string. However, you must
      # interpret the value in your code. For more information about tagging, see Tagging IAM identities in
      # the IAM User Guide .
      def tag_user(
        tags : Array(Types::Tag),
        user_name : String
      ) : Nil
        input = Types::TagUserRequest.new(tags: tags, user_name: user_name)
        tag_user(input)
      end
      def tag_user(input : Types::TagUserRequest) : Nil
        request = Protocol::Query.build_request(Model::TAG_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the IAM instance profile. For more information about tagging, see
      # Tagging IAM resources in the IAM User Guide .
      def untag_instance_profile(
        instance_profile_name : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagInstanceProfileRequest.new(instance_profile_name: instance_profile_name, tag_keys: tag_keys)
        untag_instance_profile(input)
      end
      def untag_instance_profile(input : Types::UntagInstanceProfileRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the IAM virtual multi-factor authentication (MFA) device. For more
      # information about tagging, see Tagging IAM resources in the IAM User Guide .
      def untag_mfa_device(
        serial_number : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagMFADeviceRequest.new(serial_number: serial_number, tag_keys: tag_keys)
        untag_mfa_device(input)
      end
      def untag_mfa_device(input : Types::UntagMFADeviceRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_MFA_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the specified OpenID Connect (OIDC)-compatible identity provider in
      # IAM. For more information about OIDC providers, see About web identity federation . For more
      # information about tagging, see Tagging IAM resources in the IAM User Guide .
      def untag_open_id_connect_provider(
        open_id_connect_provider_arn : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagOpenIDConnectProviderRequest.new(open_id_connect_provider_arn: open_id_connect_provider_arn, tag_keys: tag_keys)
        untag_open_id_connect_provider(input)
      end
      def untag_open_id_connect_provider(input : Types::UntagOpenIDConnectProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_OPEN_ID_CONNECT_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the customer managed policy. For more information about tagging, see
      # Tagging IAM resources in the IAM User Guide .
      def untag_policy(
        policy_arn : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagPolicyRequest.new(policy_arn: policy_arn, tag_keys: tag_keys)
        untag_policy(input)
      end
      def untag_policy(input : Types::UntagPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the role. For more information about tagging, see Tagging IAM
      # resources in the IAM User Guide .
      def untag_role(
        role_name : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagRoleRequest.new(role_name: role_name, tag_keys: tag_keys)
        untag_role(input)
      end
      def untag_role(input : Types::UntagRoleRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the specified Security Assertion Markup Language (SAML) identity
      # provider in IAM. For more information about these providers, see About web identity federation . For
      # more information about tagging, see Tagging IAM resources in the IAM User Guide .
      def untag_saml_provider(
        saml_provider_arn : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagSAMLProviderRequest.new(saml_provider_arn: saml_provider_arn, tag_keys: tag_keys)
        untag_saml_provider(input)
      end
      def untag_saml_provider(input : Types::UntagSAMLProviderRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_SAML_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the IAM server certificate. For more information about tagging, see
      # Tagging IAM resources in the IAM User Guide . For certificates in a Region supported by Certificate
      # Manager (ACM), we recommend that you don't use IAM server certificates. Instead, use ACM to
      # provision, manage, and deploy your server certificates. For more information about IAM server
      # certificates, Working with server certificates in the IAM User Guide .
      def untag_server_certificate(
        server_certificate_name : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagServerCertificateRequest.new(server_certificate_name: server_certificate_name, tag_keys: tag_keys)
        untag_server_certificate(input)
      end
      def untag_server_certificate(input : Types::UntagServerCertificateRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_SERVER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the user. For more information about tagging, see Tagging IAM
      # resources in the IAM User Guide .
      def untag_user(
        tag_keys : Array(String),
        user_name : String
      ) : Nil
        input = Types::UntagUserRequest.new(tag_keys: tag_keys, user_name: user_name)
        untag_user(input)
      end
      def untag_user(input : Types::UntagUserRequest) : Nil
        request = Protocol::Query.build_request(Model::UNTAG_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Changes the status of the specified access key from Active to Inactive, or vice versa. This
      # operation can be used to disable a user's key as part of a key rotation workflow. If the UserName is
      # not specified, the user name is determined implicitly based on the Amazon Web Services access key ID
      # used to sign the request. If a temporary access key is used, then UserName is required. If a
      # long-term key is assigned to the user, then UserName is not required. This operation works for
      # access keys under the Amazon Web Services account. Consequently, you can use this operation to
      # manage Amazon Web Services account root user credentials even if the Amazon Web Services account has
      # no associated users. For information about rotating keys, see Managing keys and certificates in the
      # IAM User Guide .
      def update_access_key(
        access_key_id : String,
        status : String,
        user_name : String? = nil
      ) : Nil
        input = Types::UpdateAccessKeyRequest.new(access_key_id: access_key_id, status: status, user_name: user_name)
        update_access_key(input)
      end
      def update_access_key(input : Types::UpdateAccessKeyRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_ACCESS_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the password policy settings for the Amazon Web Services account. This operation does not
      # support partial updates. No parameters are required, but if you do not specify a parameter, that
      # parameter's value reverts to its default value. See the Request Parameters section for each
      # parameter's default value. Also note that some parameters do not allow the default parameter to be
      # explicitly set. Instead, to invoke the default value, do not include that parameter when you invoke
      # the operation. For more information about using a password policy, see Managing an IAM password
      # policy in the IAM User Guide .
      def update_account_password_policy(
        allow_users_to_change_password : Bool? = nil,
        hard_expiry : Bool? = nil,
        max_password_age : Int32? = nil,
        minimum_password_length : Int32? = nil,
        password_reuse_prevention : Int32? = nil,
        require_lowercase_characters : Bool? = nil,
        require_numbers : Bool? = nil,
        require_symbols : Bool? = nil,
        require_uppercase_characters : Bool? = nil
      ) : Nil
        input = Types::UpdateAccountPasswordPolicyRequest.new(allow_users_to_change_password: allow_users_to_change_password, hard_expiry: hard_expiry, max_password_age: max_password_age, minimum_password_length: minimum_password_length, password_reuse_prevention: password_reuse_prevention, require_lowercase_characters: require_lowercase_characters, require_numbers: require_numbers, require_symbols: require_symbols, require_uppercase_characters: require_uppercase_characters)
        update_account_password_policy(input)
      end
      def update_account_password_policy(input : Types::UpdateAccountPasswordPolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_ACCOUNT_PASSWORD_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the policy that grants an IAM entity permission to assume a role. This is typically referred
      # to as the "role trust policy". For more information about roles, see Using roles to delegate
      # permissions and federate identities .
      def update_assume_role_policy(
        policy_document : String,
        role_name : String
      ) : Nil
        input = Types::UpdateAssumeRolePolicyRequest.new(policy_document: policy_document, role_name: role_name)
        update_assume_role_policy(input)
      end
      def update_assume_role_policy(input : Types::UpdateAssumeRolePolicyRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_ASSUME_ROLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates an existing delegation request with additional information. When the delegation request is
      # updated, it reaches the PENDING_APPROVAL state. Once a delegation request has an owner, that owner
      # gets a default permission to update the delegation request. For more details, see Managing
      # Permissions for Delegation Requests .
      def update_delegation_request(
        delegation_request_id : String,
        notes : String? = nil
      ) : Nil
        input = Types::UpdateDelegationRequestRequest.new(delegation_request_id: delegation_request_id, notes: notes)
        update_delegation_request(input)
      end
      def update_delegation_request(input : Types::UpdateDelegationRequestRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_DELEGATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the name and/or the path of the specified IAM group. You should understand the implications
      # of changing a group's path or name. For more information, see Renaming users and groups in the IAM
      # User Guide . The person making the request (the principal), must have permission to change the role
      # group with the old name and the new name. For example, to change the group named Managers to MGRs ,
      # the principal must have a policy that allows them to update both groups. If the principal has
      # permission to update the Managers group, but not the MGRs group, then the update fails. For more
      # information about permissions, see Access management .
      def update_group(
        group_name : String,
        new_group_name : String? = nil,
        new_path : String? = nil
      ) : Nil
        input = Types::UpdateGroupRequest.new(group_name: group_name, new_group_name: new_group_name, new_path: new_path)
        update_group(input)
      end
      def update_group(input : Types::UpdateGroupRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Changes the password for the specified IAM user. You can use the CLI, the Amazon Web Services API,
      # or the Users page in the IAM console to change the password for any IAM user. Use ChangePassword to
      # change your own password in the My Security Credentials page in the Amazon Web Services Management
      # Console. For more information about modifying passwords, see Managing passwords in the IAM User
      # Guide .
      def update_login_profile(
        user_name : String,
        password : String? = nil,
        password_reset_required : Bool? = nil
      ) : Nil
        input = Types::UpdateLoginProfileRequest.new(user_name: user_name, password: password, password_reset_required: password_reset_required)
        update_login_profile(input)
      end
      def update_login_profile(input : Types::UpdateLoginProfileRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_LOGIN_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Replaces the existing list of server certificate thumbprints associated with an OpenID Connect
      # (OIDC) provider resource object with a new list of thumbprints. The list that you pass with this
      # operation completely replaces the existing list of thumbprints. (The lists are not merged.)
      # Typically, you need to update a thumbprint only when the identity provider certificate changes,
      # which occurs rarely. However, if the provider's certificate does change, any attempt to assume an
      # IAM role that specifies the OIDC provider as a principal fails until the certificate thumbprint is
      # updated. Amazon Web Services secures communication with OIDC identity providers (IdPs) using our
      # library of trusted root certificate authorities (CAs) to verify the JSON Web Key Set (JWKS)
      # endpoint's TLS certificate. If your OIDC IdP relies on a certificate that is not signed by one of
      # these trusted CAs, only then we secure communication using the thumbprints set in the IdP's
      # configuration. Trust for the OIDC provider is derived from the provider certificate and is validated
      # by the thumbprint. Therefore, it is best to limit access to the
      # UpdateOpenIDConnectProviderThumbprint operation to highly privileged users.
      def update_open_id_connect_provider_thumbprint(
        open_id_connect_provider_arn : String,
        thumbprint_list : Array(String)
      ) : Nil
        input = Types::UpdateOpenIDConnectProviderThumbprintRequest.new(open_id_connect_provider_arn: open_id_connect_provider_arn, thumbprint_list: thumbprint_list)
        update_open_id_connect_provider_thumbprint(input)
      end
      def update_open_id_connect_provider_thumbprint(input : Types::UpdateOpenIDConnectProviderThumbprintRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_OPEN_ID_CONNECT_PROVIDER_THUMBPRINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the description or maximum session duration setting of a role.
      def update_role(
        role_name : String,
        description : String? = nil,
        max_session_duration : Int32? = nil
      ) : Types::UpdateRoleResponse
        input = Types::UpdateRoleRequest.new(role_name: role_name, description: description, max_session_duration: max_session_duration)
        update_role(input)
      end
      def update_role(input : Types::UpdateRoleRequest) : Types::UpdateRoleResponse
        request = Protocol::Query.build_request(Model::UPDATE_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateRoleResponse, "UpdateRole")
      end

      # Use UpdateRole instead. Modifies only the description of a role. This operation performs the same
      # function as the Description parameter in the UpdateRole operation.
      def update_role_description(
        description : String,
        role_name : String
      ) : Types::UpdateRoleDescriptionResponse
        input = Types::UpdateRoleDescriptionRequest.new(description: description, role_name: role_name)
        update_role_description(input)
      end
      def update_role_description(input : Types::UpdateRoleDescriptionRequest) : Types::UpdateRoleDescriptionResponse
        request = Protocol::Query.build_request(Model::UPDATE_ROLE_DESCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateRoleDescriptionResponse, "UpdateRoleDescription")
      end

      # Updates the metadata document, SAML encryption settings, and private keys for an existing SAML
      # provider. To rotate private keys, add your new private key and then remove the old key in a separate
      # request.
      def update_saml_provider(
        saml_provider_arn : String,
        add_private_key : String? = nil,
        assertion_encryption_mode : String? = nil,
        remove_private_key : String? = nil,
        saml_metadata_document : String? = nil
      ) : Types::UpdateSAMLProviderResponse
        input = Types::UpdateSAMLProviderRequest.new(saml_provider_arn: saml_provider_arn, add_private_key: add_private_key, assertion_encryption_mode: assertion_encryption_mode, remove_private_key: remove_private_key, saml_metadata_document: saml_metadata_document)
        update_saml_provider(input)
      end
      def update_saml_provider(input : Types::UpdateSAMLProviderRequest) : Types::UpdateSAMLProviderResponse
        request = Protocol::Query.build_request(Model::UPDATE_SAML_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateSAMLProviderResponse, "UpdateSAMLProvider")
      end

      # Sets the status of an IAM user's SSH public key to active or inactive. SSH public keys that are
      # inactive cannot be used for authentication. This operation can be used to disable a user's SSH
      # public key as part of a key rotation work flow. The SSH public key affected by this operation is
      # used only for authenticating the associated IAM user to an CodeCommit repository. For more
      # information about using SSH keys to authenticate to an CodeCommit repository, see Set up CodeCommit
      # for SSH connections in the CodeCommit User Guide .
      def update_ssh_public_key(
        ssh_public_key_id : String,
        status : String,
        user_name : String
      ) : Nil
        input = Types::UpdateSSHPublicKeyRequest.new(ssh_public_key_id: ssh_public_key_id, status: status, user_name: user_name)
        update_ssh_public_key(input)
      end
      def update_ssh_public_key(input : Types::UpdateSSHPublicKeyRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the name and/or the path of the specified server certificate stored in IAM. For more
      # information about working with server certificates, see Working with server certificates in the IAM
      # User Guide . This topic also includes a list of Amazon Web Services services that can use the server
      # certificates that you manage with IAM. You should understand the implications of changing a server
      # certificate's path or name. For more information, see Renaming a server certificate in the IAM User
      # Guide . The person making the request (the principal), must have permission to change the server
      # certificate with the old name and the new name. For example, to change the certificate named
      # ProductionCert to ProdCert , the principal must have a policy that allows them to update both
      # certificates. If the principal has permission to update the ProductionCert group, but not the
      # ProdCert certificate, then the update fails. For more information about permissions, see Access
      # management in the IAM User Guide .
      def update_server_certificate(
        server_certificate_name : String,
        new_path : String? = nil,
        new_server_certificate_name : String? = nil
      ) : Nil
        input = Types::UpdateServerCertificateRequest.new(server_certificate_name: server_certificate_name, new_path: new_path, new_server_certificate_name: new_server_certificate_name)
        update_server_certificate(input)
      end
      def update_server_certificate(input : Types::UpdateServerCertificateRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_SERVER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the status of a service-specific credential to Active or Inactive . Service-specific
      # credentials that are inactive cannot be used for authentication to the service. This operation can
      # be used to disable a user's service-specific credential as part of a credential rotation work flow.
      def update_service_specific_credential(
        service_specific_credential_id : String,
        status : String,
        user_name : String? = nil
      ) : Nil
        input = Types::UpdateServiceSpecificCredentialRequest.new(service_specific_credential_id: service_specific_credential_id, status: status, user_name: user_name)
        update_service_specific_credential(input)
      end
      def update_service_specific_credential(input : Types::UpdateServiceSpecificCredentialRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_SERVICE_SPECIFIC_CREDENTIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Changes the status of the specified user signing certificate from active to disabled, or vice versa.
      # This operation can be used to disable an IAM user's signing certificate as part of a certificate
      # rotation work flow. If the UserName field is not specified, the user name is determined implicitly
      # based on the Amazon Web Services access key ID used to sign the request. This operation works for
      # access keys under the Amazon Web Services account. Consequently, you can use this operation to
      # manage Amazon Web Services account root user credentials even if the Amazon Web Services account has
      # no associated users.
      def update_signing_certificate(
        certificate_id : String,
        status : String,
        user_name : String? = nil
      ) : Nil
        input = Types::UpdateSigningCertificateRequest.new(certificate_id: certificate_id, status: status, user_name: user_name)
        update_signing_certificate(input)
      end
      def update_signing_certificate(input : Types::UpdateSigningCertificateRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_SIGNING_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the name and/or the path of the specified IAM user. You should understand the implications
      # of changing an IAM user's path or name. For more information, see Renaming an IAM user and Renaming
      # an IAM group in the IAM User Guide . To change a user name, the requester must have appropriate
      # permissions on both the source object and the target object. For example, to change Bob to Robert,
      # the entity making the request must have permission on Bob and Robert, or must have permission on all
      # (*). For more information about permissions, see Permissions and policies .
      def update_user(
        user_name : String,
        new_path : String? = nil,
        new_user_name : String? = nil
      ) : Nil
        input = Types::UpdateUserRequest.new(user_name: user_name, new_path: new_path, new_user_name: new_user_name)
        update_user(input)
      end
      def update_user(input : Types::UpdateUserRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Uploads an SSH public key and associates it with the specified IAM user. The SSH public key uploaded
      # by this operation can be used only for authenticating the associated IAM user to an CodeCommit
      # repository. For more information about using SSH keys to authenticate to an CodeCommit repository,
      # see Set up CodeCommit for SSH connections in the CodeCommit User Guide .
      def upload_ssh_public_key(
        ssh_public_key_body : String,
        user_name : String
      ) : Types::UploadSSHPublicKeyResponse
        input = Types::UploadSSHPublicKeyRequest.new(ssh_public_key_body: ssh_public_key_body, user_name: user_name)
        upload_ssh_public_key(input)
      end
      def upload_ssh_public_key(input : Types::UploadSSHPublicKeyRequest) : Types::UploadSSHPublicKeyResponse
        request = Protocol::Query.build_request(Model::UPLOAD_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UploadSSHPublicKeyResponse, "UploadSSHPublicKey")
      end

      # Uploads a server certificate entity for the Amazon Web Services account. The server certificate
      # entity includes a public key certificate, a private key, and an optional certificate chain, which
      # should all be PEM-encoded. We recommend that you use Certificate Manager to provision, manage, and
      # deploy your server certificates. With ACM you can request a certificate, deploy it to Amazon Web
      # Services resources, and let ACM handle certificate renewals for you. Certificates provided by ACM
      # are free. For more information about using ACM, see the Certificate Manager User Guide . For more
      # information about working with server certificates, see Working with server certificates in the IAM
      # User Guide . This topic includes a list of Amazon Web Services services that can use the server
      # certificates that you manage with IAM. For information about the number of server certificates you
      # can upload, see IAM and STS quotas in the IAM User Guide . Because the body of the public key
      # certificate, private key, and the certificate chain can be large, you should use POST rather than
      # GET when calling UploadServerCertificate . For information about setting up signatures and
      # authorization through the API, see Signing Amazon Web Services API requests in the Amazon Web
      # Services General Reference . For general information about using the Query API with IAM, see Calling
      # the API by making HTTP query requests in the IAM User Guide .
      def upload_server_certificate(
        certificate_body : String,
        private_key : String,
        server_certificate_name : String,
        certificate_chain : String? = nil,
        path : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::UploadServerCertificateResponse
        input = Types::UploadServerCertificateRequest.new(certificate_body: certificate_body, private_key: private_key, server_certificate_name: server_certificate_name, certificate_chain: certificate_chain, path: path, tags: tags)
        upload_server_certificate(input)
      end
      def upload_server_certificate(input : Types::UploadServerCertificateRequest) : Types::UploadServerCertificateResponse
        request = Protocol::Query.build_request(Model::UPLOAD_SERVER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UploadServerCertificateResponse, "UploadServerCertificate")
      end

      # Uploads an X.509 signing certificate and associates it with the specified IAM user. Some Amazon Web
      # Services services require you to use certificates to validate requests that are signed with a
      # corresponding private key. When you upload the certificate, its default status is Active . For
      # information about when you would use an X.509 signing certificate, see Managing server certificates
      # in IAM in the IAM User Guide . If the UserName is not specified, the IAM user name is determined
      # implicitly based on the Amazon Web Services access key ID used to sign the request. This operation
      # works for access keys under the Amazon Web Services account. Consequently, you can use this
      # operation to manage Amazon Web Services account root user credentials even if the Amazon Web
      # Services account has no associated users. Because the body of an X.509 certificate can be large, you
      # should use POST rather than GET when calling UploadSigningCertificate . For information about
      # setting up signatures and authorization through the API, see Signing Amazon Web Services API
      # requests in the Amazon Web Services General Reference . For general information about using the
      # Query API with IAM, see Making query requests in the IAM User Guide .
      def upload_signing_certificate(
        certificate_body : String,
        user_name : String? = nil
      ) : Types::UploadSigningCertificateResponse
        input = Types::UploadSigningCertificateRequest.new(certificate_body: certificate_body, user_name: user_name)
        upload_signing_certificate(input)
      end
      def upload_signing_certificate(input : Types::UploadSigningCertificateRequest) : Types::UploadSigningCertificateResponse
        request = Protocol::Query.build_request(Model::UPLOAD_SIGNING_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UploadSigningCertificateResponse, "UploadSigningCertificate")
      end
    end
  end
end
