module AwsSdk
  module Organizations
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

      # Accepts a handshake by sending an ACCEPTED response to the sender. You can view accepted handshakes
      # in API responses for 30 days before they are deleted. Only the management account can accept the
      # following handshakes : Enable all features final confirmation ( APPROVE_ALL_FEATURES ) Billing
      # transfer ( TRANSFER_RESPONSIBILITY ) For more information, see Enabling all features and Responding
      # to a billing transfer invitation in the Organizations User Guide . Only a member account can accept
      # the following handshakes : Invitation to join ( INVITE ) Approve all features request (
      # ENABLE_ALL_FEATURES ) For more information, see Responding to invitations and Enabling all features
      # in the Organizations User Guide .
      def accept_handshake(
        handshake_id : String
      ) : Types::AcceptHandshakeResponse
        input = Types::AcceptHandshakeRequest.new(handshake_id: handshake_id)
        accept_handshake(input)
      end
      def accept_handshake(input : Types::AcceptHandshakeRequest) : Types::AcceptHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptHandshakeResponse, "AcceptHandshake")
      end

      # Attaches a policy to a root, an organizational unit (OU), or an individual account. How the policy
      # affects accounts depends on the type of policy. Refer to the Organizations User Guide for
      # information about each policy type: SERVICE_CONTROL_POLICY RESOURCE_CONTROL_POLICY
      # DECLARATIVE_POLICY_EC2 BACKUP_POLICY TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY
      # SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY
      # NETWORK_SECURITY_DIRECTOR_POLICY You can only call this operation from the management account or a
      # member account that is a delegated administrator.
      def attach_policy(
        policy_id : String,
        target_id : String
      ) : Nil
        input = Types::AttachPolicyRequest.new(policy_id: policy_id, target_id: target_id)
        attach_policy(input)
      end
      def attach_policy(input : Types::AttachPolicyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ATTACH_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Cancels a Handshake . Only the account that sent a handshake can call this operation. The recipient
      # of the handshake can't cancel it, but can use DeclineHandshake to decline. After a handshake is
      # canceled, the recipient can no longer respond to the handshake. You can view canceled handshakes in
      # API responses for 30 days before they are deleted.
      def cancel_handshake(
        handshake_id : String
      ) : Types::CancelHandshakeResponse
        input = Types::CancelHandshakeRequest.new(handshake_id: handshake_id)
        cancel_handshake(input)
      end
      def cancel_handshake(input : Types::CancelHandshakeRequest) : Types::CancelHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelHandshakeResponse, "CancelHandshake")
      end

      # Closes an Amazon Web Services member account within an organization. You can close an account when
      # all features are enabled . You can't close the management account with this API. This is an
      # asynchronous request that Amazon Web Services performs in the background. Because CloseAccount
      # operates asynchronously, it can return a successful completion message even though account closure
      # might still be in progress. You need to wait a few minutes before the account is fully closed. To
      # check the status of the request, do one of the following: Use the AccountId that you sent in the
      # CloseAccount request to provide as a parameter to the DescribeAccount operation. While the close
      # account request is in progress, Account status will indicate PENDING_CLOSURE. When the close account
      # request completes, the status will change to SUSPENDED. Check the CloudTrail log for the
      # CloseAccountResult event that gets published after the account closes successfully. For information
      # on using CloudTrail with Organizations, see Logging and monitoring in Organizations in the
      # Organizations User Guide . You can close only 10% of member accounts, between 10 and 1000, within a
      # rolling 30 day period. This quota is not bound by a calendar month, but starts when you close an
      # account. After you reach this limit, you can't close additional accounts. For more information, see
      # Closing a member account in your organization and Quotas for Organizations in the Organizations User
      # Guide . To reinstate a closed account, contact Amazon Web Services Support within the 90-day grace
      # period while the account is in SUSPENDED status. If the Amazon Web Services account you attempt to
      # close is linked to an Amazon Web Services GovCloud (US) account, the CloseAccount request will close
      # both accounts. To learn important pre-closure details, see Closing an Amazon Web Services GovCloud
      # (US) account in the Amazon Web Services GovCloud User Guide .
      def close_account(
        account_id : String
      ) : Nil
        input = Types::CloseAccountRequest.new(account_id: account_id)
        close_account(input)
      end
      def close_account(input : Types::CloseAccountRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::CLOSE_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an Amazon Web Services account that is automatically a member of the organization whose
      # credentials made the request. This is an asynchronous request that Amazon Web Services performs in
      # the background. Because CreateAccount operates asynchronously, it can return a successful completion
      # message even though account initialization might still be in progress. You might need to wait a few
      # minutes before you can successfully access the account. To check the status of the request, do one
      # of the following: Use the Id value of the CreateAccountStatus response element from this operation
      # to provide as a parameter to the DescribeCreateAccountStatus operation. Check the CloudTrail log for
      # the CreateAccountResult event. For information on using CloudTrail with Organizations, see Logging
      # and monitoring in Organizations in the Organizations User Guide . The user who calls the API to
      # create an account must have the organizations:CreateAccount permission. If you enabled all features
      # in the organization, Organizations creates the required service-linked role named
      # AWSServiceRoleForOrganizations . For more information, see Organizations and service-linked roles in
      # the Organizations User Guide . If the request includes tags, then the requester must have the
      # organizations:TagResource permission. Organizations preconfigures the new member account with a role
      # (named OrganizationAccountAccessRole by default) that grants users in the management account
      # administrator permissions in the new member account. Principals in the management account can assume
      # the role. Organizations clones the company name and address information for the new account from the
      # organization's management account. You can only call this operation from the management account. For
      # more information about creating accounts, see Creating a member account in your organization in the
      # Organizations User Guide . When you create an account in an organization using the Organizations
      # console, API, or CLI commands, the information required for the account to operate as a standalone
      # account, such as a payment method is not automatically collected. If you must remove an account from
      # your organization later, you can do so only after you provide the missing information. For more
      # information, see Considerations before removing an account from an organization in the Organizations
      # User Guide . If you get an exception that indicates that you exceeded your account limits for the
      # organization, contact Amazon Web Services Support . If you get an exception that indicates that the
      # operation failed because your organization is still initializing, wait one hour and then try again.
      # If the error persists, contact Amazon Web Services Support . It isn't recommended to use
      # CreateAccount to create multiple temporary accounts, and using the CreateAccount API to close
      # accounts is subject to a 30-day usage quota. For information on the requirements and process for
      # closing an account, see Closing a member account in your organization in the Organizations User
      # Guide . When you create a member account with this operation, you can choose whether to create the
      # account with the IAM User and Role Access to Billing Information switch enabled. If you enable it,
      # IAM users and roles that have appropriate permissions can view billing information for the account.
      # If you disable it, only the account root user can access billing information. For information about
      # how to disable this switch for an account, see Granting access to your billing information and tools
      # .
      def create_account(
        account_name : String,
        email : String,
        iam_user_access_to_billing : String? = nil,
        role_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAccountResponse
        input = Types::CreateAccountRequest.new(account_name: account_name, email: email, iam_user_access_to_billing: iam_user_access_to_billing, role_name: role_name, tags: tags)
        create_account(input)
      end
      def create_account(input : Types::CreateAccountRequest) : Types::CreateAccountResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAccountResponse, "CreateAccount")
      end

      # This action is available if all of the following are true: You're authorized to create accounts in
      # the Amazon Web Services GovCloud (US) Region. For more information on the Amazon Web Services
      # GovCloud (US) Region, see the Amazon Web Services GovCloud User Guide . You already have an account
      # in the Amazon Web Services GovCloud (US) Region that is paired with a management account of an
      # organization in the commercial Region. You call this action from the management account of your
      # organization in the commercial Region. You have the organizations:CreateGovCloudAccount permission.
      # Organizations automatically creates the required service-linked role named
      # AWSServiceRoleForOrganizations . For more information, see Organizations and service-linked roles in
      # the Organizations User Guide . Amazon Web Services automatically enables CloudTrail for Amazon Web
      # Services GovCloud (US) accounts, but you should also do the following: Verify that CloudTrail is
      # enabled to store logs. Create an Amazon S3 bucket for CloudTrail log storage. For more information,
      # see Verifying CloudTrail Is Enabled in the Amazon Web Services GovCloud User Guide . If the request
      # includes tags, then the requester must have the organizations:TagResource permission. The tags are
      # attached to the commercial account associated with the GovCloud account, rather than the GovCloud
      # account itself. To add tags to the GovCloud account, call the TagResource operation in the GovCloud
      # Region after the new GovCloud account exists. You call this action from the management account of
      # your organization in the commercial Region to create a standalone Amazon Web Services account in the
      # Amazon Web Services GovCloud (US) Region. After the account is created, the management account of an
      # organization in the Amazon Web Services GovCloud (US) Region can invite it to that organization. For
      # more information on inviting standalone accounts in the Amazon Web Services GovCloud (US) to join an
      # organization, see Organizations in the Amazon Web Services GovCloud User Guide . Calling
      # CreateGovCloudAccount is an asynchronous request that Amazon Web Services performs in the
      # background. Because CreateGovCloudAccount operates asynchronously, it can return a successful
      # completion message even though account initialization might still be in progress. You might need to
      # wait a few minutes before you can successfully access the account. To check the status of the
      # request, do one of the following: Use the OperationId response element from this operation to
      # provide as a parameter to the DescribeCreateAccountStatus operation. Check the CloudTrail log for
      # the CreateAccountResult event. For information on using CloudTrail with Organizations, see Logging
      # and monitoring in Organizations in the Organizations User Guide . When you call the
      # CreateGovCloudAccount action, you create two accounts: a standalone account in the Amazon Web
      # Services GovCloud (US) Region and an associated account in the commercial Region for billing and
      # support purposes. The account in the commercial Region is automatically a member of the organization
      # whose credentials made the request. Both accounts are associated with the same email address. A role
      # is created in the new account in the commercial Region that allows the management account in the
      # organization in the commercial Region to assume it. An Amazon Web Services GovCloud (US) account is
      # then created and associated with the commercial account that you just created. A role is also
      # created in the new Amazon Web Services GovCloud (US) account that can be assumed by the Amazon Web
      # Services GovCloud (US) account that is associated with the management account of the commercial
      # organization. For more information and to view a diagram that explains how account access works, see
      # Organizations in the Amazon Web Services GovCloud User Guide . For more information about creating
      # accounts, see Creating a member account in your organization in the Organizations User Guide . When
      # you create an account in an organization using the Organizations console, API, or CLI commands, the
      # information required for the account to operate as a standalone account is not automatically
      # collected. This includes a payment method and signing the end user license agreement (EULA). If you
      # must remove an account from your organization later, you can do so only after you provide the
      # missing information. For more information, see Considerations before removing an account from an
      # organization in the Organizations User Guide . If you get an exception that indicates that you
      # exceeded your account limits for the organization, contact Amazon Web Services Support . If you get
      # an exception that indicates that the operation failed because your organization is still
      # initializing, wait one hour and then try again. If the error persists, contact Amazon Web Services
      # Support . Using CreateGovCloudAccount to create multiple temporary accounts isn't recommended. You
      # can only close an account from the Amazon Web Services Billing and Cost Management console, and you
      # must be signed in as the root user. For information on the requirements and process for closing an
      # account, see Closing a member account in your organization in the Organizations User Guide . When
      # you create a member account with this operation, you can choose whether to create the account with
      # the IAM User and Role Access to Billing Information switch enabled. If you enable it, IAM users and
      # roles that have appropriate permissions can view billing information for the account. If you disable
      # it, only the account root user can access billing information. For information about how to disable
      # this switch for an account, see Granting access to your billing information and tools .
      def create_gov_cloud_account(
        account_name : String,
        email : String,
        iam_user_access_to_billing : String? = nil,
        role_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateGovCloudAccountResponse
        input = Types::CreateGovCloudAccountRequest.new(account_name: account_name, email: email, iam_user_access_to_billing: iam_user_access_to_billing, role_name: role_name, tags: tags)
        create_gov_cloud_account(input)
      end
      def create_gov_cloud_account(input : Types::CreateGovCloudAccountRequest) : Types::CreateGovCloudAccountResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GOV_CLOUD_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGovCloudAccountResponse, "CreateGovCloudAccount")
      end

      # Creates an Amazon Web Services organization. The account whose user is calling the
      # CreateOrganization operation automatically becomes the management account of the new organization.
      # This operation must be called using credentials from the account that is to become the new
      # organization's management account. The principal must also have the relevant IAM permissions. By
      # default (or if you set the FeatureSet parameter to ALL ), the new organization is created with all
      # features enabled and service control policies automatically enabled in the root. If you instead
      # choose to create the organization supporting only the consolidated billing features by setting the
      # FeatureSet parameter to CONSOLIDATED_BILLING , no policy types are enabled by default and you can't
      # use organization policies.
      def create_organization(
        feature_set : String? = nil
      ) : Types::CreateOrganizationResponse
        input = Types::CreateOrganizationRequest.new(feature_set: feature_set)
        create_organization(input)
      end
      def create_organization(input : Types::CreateOrganizationRequest) : Types::CreateOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOrganizationResponse, "CreateOrganization")
      end

      # Creates an organizational unit (OU) within a root or parent OU. An OU is a container for accounts
      # that enables you to organize your accounts to apply policies according to your business
      # requirements. The number of levels deep that you can nest OUs is dependent upon the policy types
      # enabled for that root. For service control policies, the limit is five. For more information about
      # OUs, see Managing organizational units (OUs) in the Organizations User Guide . If the request
      # includes tags, then the requester must have the organizations:TagResource permission. You can only
      # call this operation from the management account.
      def create_organizational_unit(
        name : String,
        parent_id : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateOrganizationalUnitResponse
        input = Types::CreateOrganizationalUnitRequest.new(name: name, parent_id: parent_id, tags: tags)
        create_organizational_unit(input)
      end
      def create_organizational_unit(input : Types::CreateOrganizationalUnitRequest) : Types::CreateOrganizationalUnitResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ORGANIZATIONAL_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOrganizationalUnitResponse, "CreateOrganizationalUnit")
      end

      # Creates a policy of a specified type that you can attach to a root, an organizational unit (OU), or
      # an individual Amazon Web Services account. For more information about policies and their use, see
      # Managing Organizations policies . If the request includes tags, then the requester must have the
      # organizations:TagResource permission. You can only call this operation from the management account
      # or a member account that is a delegated administrator.
      def create_policy(
        content : String,
        description : String,
        name : String,
        type : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePolicyResponse
        input = Types::CreatePolicyRequest.new(content: content, description: description, name: name, type: type, tags: tags)
        create_policy(input)
      end
      def create_policy(input : Types::CreatePolicyRequest) : Types::CreatePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePolicyResponse, "CreatePolicy")
      end

      # Declines a Handshake . Only the account that receives a handshake can call this operation. The
      # sender of the handshake can use CancelHandshake to cancel if the handshake hasn't yet been responded
      # to. You can view canceled handshakes in API responses for 30 days before they are deleted.
      def decline_handshake(
        handshake_id : String
      ) : Types::DeclineHandshakeResponse
        input = Types::DeclineHandshakeRequest.new(handshake_id: handshake_id)
        decline_handshake(input)
      end
      def decline_handshake(input : Types::DeclineHandshakeRequest) : Types::DeclineHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::DECLINE_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeclineHandshakeResponse, "DeclineHandshake")
      end

      # Deletes the organization. You can delete an organization only by using credentials from the
      # management account. The organization must be empty of member accounts.
      def delete_organization : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ORGANIZATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an organizational unit (OU) from a root or another OU. You must first remove all accounts
      # and child OUs from the OU that you want to delete. You can only call this operation from the
      # management account.
      def delete_organizational_unit(
        organizational_unit_id : String
      ) : Nil
        input = Types::DeleteOrganizationalUnitRequest.new(organizational_unit_id: organizational_unit_id)
        delete_organizational_unit(input)
      end
      def delete_organizational_unit(input : Types::DeleteOrganizationalUnitRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ORGANIZATIONAL_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified policy from your organization. Before you perform this operation, you must
      # first detach the policy from all organizational units (OUs), roots, and accounts. You can only call
      # this operation from the management account or a member account that is a delegated administrator.
      def delete_policy(
        policy_id : String
      ) : Nil
        input = Types::DeletePolicyRequest.new(policy_id: policy_id)
        delete_policy(input)
      end
      def delete_policy(input : Types::DeletePolicyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the resource policy from your organization. You can only call this operation from the
      # management account.
      def delete_resource_policy : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified member Amazon Web Services account as a delegated administrator for the
      # specified Amazon Web Services service. Deregistering a delegated administrator can have unintended
      # impacts on the functionality of the enabled Amazon Web Services service. See the documentation for
      # the enabled service before you deregister a delegated administrator so that you understand any
      # potential impacts. You can run this action only for Amazon Web Services services that support this
      # feature. For a current list of services that support it, see the column Supports Delegated
      # Administrator in the table at Amazon Web Services Services that you can use with Organizations in
      # the Organizations User Guide. You can only call this operation from the management account.
      def deregister_delegated_administrator(
        account_id : String,
        service_principal : String
      ) : Nil
        input = Types::DeregisterDelegatedAdministratorRequest.new(account_id: account_id, service_principal: service_principal)
        deregister_delegated_administrator(input)
      end
      def deregister_delegated_administrator(input : Types::DeregisterDelegatedAdministratorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_DELEGATED_ADMINISTRATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves Organizations-related information about the specified account. You can only call this
      # operation from the management account or a member account that is a delegated administrator.
      def describe_account(
        account_id : String
      ) : Types::DescribeAccountResponse
        input = Types::DescribeAccountRequest.new(account_id: account_id)
        describe_account(input)
      end
      def describe_account(input : Types::DescribeAccountRequest) : Types::DescribeAccountResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountResponse, "DescribeAccount")
      end

      # Retrieves the current status of an asynchronous request to create an account. You can only call this
      # operation from the management account or a member account that is a delegated administrator.
      def describe_create_account_status(
        create_account_request_id : String
      ) : Types::DescribeCreateAccountStatusResponse
        input = Types::DescribeCreateAccountStatusRequest.new(create_account_request_id: create_account_request_id)
        describe_create_account_status(input)
      end
      def describe_create_account_status(input : Types::DescribeCreateAccountStatusRequest) : Types::DescribeCreateAccountStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CREATE_ACCOUNT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCreateAccountStatusResponse, "DescribeCreateAccountStatus")
      end

      # Returns the contents of the effective policy for specified policy type and account. The effective
      # policy is the aggregation of any policies of the specified type that the account inherits, plus any
      # policy of that type that is directly attached to the account. This operation applies only to
      # management policies. It does not apply to authorization policies: service control policies (SCPs)
      # and resource control policies (RCPs). For more information about policy inheritance, see
      # Understanding management policy inheritance in the Organizations User Guide . You can call this
      # operation from any account in a organization.
      def describe_effective_policy(
        policy_type : String,
        target_id : String? = nil
      ) : Types::DescribeEffectivePolicyResponse
        input = Types::DescribeEffectivePolicyRequest.new(policy_type: policy_type, target_id: target_id)
        describe_effective_policy(input)
      end
      def describe_effective_policy(input : Types::DescribeEffectivePolicyRequest) : Types::DescribeEffectivePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EFFECTIVE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEffectivePolicyResponse, "DescribeEffectivePolicy")
      end

      # Returns details for a handshake. A handshake is the secure exchange of information between two
      # Amazon Web Services accounts: a sender and a recipient. You can view ACCEPTED , DECLINED , or
      # CANCELED handshakes in API Responses for 30 days before they are deleted. You can call this
      # operation from any account in a organization.
      def describe_handshake(
        handshake_id : String
      ) : Types::DescribeHandshakeResponse
        input = Types::DescribeHandshakeRequest.new(handshake_id: handshake_id)
        describe_handshake(input)
      end
      def describe_handshake(input : Types::DescribeHandshakeRequest) : Types::DescribeHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHandshakeResponse, "DescribeHandshake")
      end

      # Retrieves information about the organization that the user's account belongs to. You can call this
      # operation from any account in a organization. Even if a policy type is shown as available in the
      # organization, you can disable it separately at the root level with DisablePolicyType . Use ListRoots
      # to see the status of policy types for a specified root.
      def describe_organization : Types::DescribeOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORGANIZATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrganizationResponse, "DescribeOrganization")
      end

      # Retrieves information about an organizational unit (OU). You can only call this operation from the
      # management account or a member account that is a delegated administrator.
      def describe_organizational_unit(
        organizational_unit_id : String
      ) : Types::DescribeOrganizationalUnitResponse
        input = Types::DescribeOrganizationalUnitRequest.new(organizational_unit_id: organizational_unit_id)
        describe_organizational_unit(input)
      end
      def describe_organizational_unit(input : Types::DescribeOrganizationalUnitRequest) : Types::DescribeOrganizationalUnitResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORGANIZATIONAL_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrganizationalUnitResponse, "DescribeOrganizationalUnit")
      end

      # Retrieves information about a policy. You can only call this operation from the management account
      # or a member account that is a delegated administrator.
      def describe_policy(
        policy_id : String
      ) : Types::DescribePolicyResponse
        input = Types::DescribePolicyRequest.new(policy_id: policy_id)
        describe_policy(input)
      end
      def describe_policy(input : Types::DescribePolicyRequest) : Types::DescribePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePolicyResponse, "DescribePolicy")
      end

      # Retrieves information about a resource policy. You can only call this operation from the management
      # account or a member account that is a delegated administrator.
      def describe_resource_policy : Types::DescribeResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESOURCE_POLICY, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeResourcePolicyResponse, "DescribeResourcePolicy")
      end

      # Returns details for a transfer. A transfer is an arrangement between two management accounts where
      # one account designates the other with specified responsibilities for their organization.
      def describe_responsibility_transfer(
        id : String
      ) : Types::DescribeResponsibilityTransferResponse
        input = Types::DescribeResponsibilityTransferRequest.new(id: id)
        describe_responsibility_transfer(input)
      end
      def describe_responsibility_transfer(input : Types::DescribeResponsibilityTransferRequest) : Types::DescribeResponsibilityTransferResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESPONSIBILITY_TRANSFER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeResponsibilityTransferResponse, "DescribeResponsibilityTransfer")
      end

      # Detaches a policy from a target root, organizational unit (OU), or account. If the policy being
      # detached is a service control policy (SCP), the changes to permissions for Identity and Access
      # Management (IAM) users and roles in affected accounts are immediate. Every root, OU, and account
      # must have at least one SCP attached. If you want to replace the default FullAWSAccess policy with an
      # SCP that limits the permissions that can be delegated, you must attach the replacement SCP before
      # you can remove the default SCP. This is the authorization strategy of an " allow list ". If you
      # instead attach a second SCP and leave the FullAWSAccess SCP still attached, and specify "Effect":
      # "Deny" in the second SCP to override the "Effect": "Allow" in the FullAWSAccess policy (or any other
      # attached SCP), you're using the authorization strategy of a " deny list ". You can only call this
      # operation from the management account or a member account that is a delegated administrator.
      def detach_policy(
        policy_id : String,
        target_id : String
      ) : Nil
        input = Types::DetachPolicyRequest.new(policy_id: policy_id, target_id: target_id)
        detach_policy(input)
      end
      def detach_policy(input : Types::DetachPolicyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DETACH_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Disables the integration of an Amazon Web Services service (the service that is specified by
      # ServicePrincipal ) with Organizations. When you disable integration, the specified service no longer
      # can create a service-linked role in new accounts in your organization. This means the service can't
      # perform operations on your behalf on any new accounts in your organization. The service can still
      # perform operations in older accounts until the service completes its clean-up from Organizations. We
      # strongly recommend that you don't use this command to disable integration between Organizations and
      # the specified Amazon Web Services service. Instead, use the console or commands that are provided by
      # the specified service. This lets the trusted service perform any required initialization when
      # enabling trusted access, such as creating any required resources and any required clean up of
      # resources when disabling trusted access. For information about how to disable trusted service access
      # to your organization using the trusted service, see the Learn more link under the Supports Trusted
      # Access column at Amazon Web Services services that you can use with Organizations . on this page. If
      # you disable access by using this command, it causes the following actions to occur: The service can
      # no longer create a service-linked role in the accounts in your organization. This means that the
      # service can't perform operations on your behalf on any new accounts in your organization. The
      # service can still perform operations in older accounts until the service completes its clean-up from
      # Organizations. The service can no longer perform tasks in the member accounts in the organization,
      # unless those operations are explicitly permitted by the IAM policies that are attached to your
      # roles. This includes any data aggregation from the member accounts to the management account, or to
      # a delegated administrator account, where relevant. Some services detect this and clean up any
      # remaining data or resources related to the integration, while other services stop accessing the
      # organization but leave any historical data and configuration in place to support a possible
      # re-enabling of the integration. Using the other service's console or commands to disable the
      # integration ensures that the other service is aware that it can clean up any resources that are
      # required only for the integration. How the service cleans up its resources in the organization's
      # accounts depends on that service. For more information, see the documentation for the other Amazon
      # Web Services service. After you perform the DisableAWSServiceAccess operation, the specified service
      # can no longer perform operations in your organization's accounts For more information about
      # integrating other services with Organizations, including the list of services that work with
      # Organizations, see Using Organizations with other Amazon Web Services services in the Organizations
      # User Guide . You can only call this operation from the management account.
      def disable_aws_service_access(
        service_principal : String
      ) : Nil
        input = Types::DisableAWSServiceAccessRequest.new(service_principal: service_principal)
        disable_aws_service_access(input)
      end
      def disable_aws_service_access(input : Types::DisableAWSServiceAccessRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DISABLE_AWS_SERVICE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Disables an organizational policy type in a root. A policy of a certain type can be attached to
      # entities in a root only if that type is enabled in the root. After you perform this operation, you
      # no longer can attach policies of the specified type to that root or to any organizational unit (OU)
      # or account in that root. You can undo this by using the EnablePolicyType operation. This is an
      # asynchronous request that Amazon Web Services performs in the background. If you disable a policy
      # type for a root, it still appears enabled for the organization if all features are enabled for the
      # organization. Amazon Web Services recommends that you first use ListRoots to see the status of
      # policy types for a specified root, and then use this operation. You can only call this operation
      # from the management account or a member account that is a delegated administrator. To view the
      # status of available policy types in the organization, use ListRoots .
      def disable_policy_type(
        policy_type : String,
        root_id : String
      ) : Types::DisablePolicyTypeResponse
        input = Types::DisablePolicyTypeRequest.new(policy_type: policy_type, root_id: root_id)
        disable_policy_type(input)
      end
      def disable_policy_type(input : Types::DisablePolicyTypeRequest) : Types::DisablePolicyTypeResponse
        request = Protocol::JsonRpc.build_request(Model::DISABLE_POLICY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisablePolicyTypeResponse, "DisablePolicyType")
      end

      # Provides an Amazon Web Services service (the service that is specified by ServicePrincipal ) with
      # permissions to view the structure of an organization, create a service-linked role in all the
      # accounts in the organization, and allow the service to perform operations on behalf of the
      # organization and its accounts. Establishing these permissions can be a first step in enabling the
      # integration of an Amazon Web Services service with Organizations. We recommend that you enable
      # integration between Organizations and the specified Amazon Web Services service by using the console
      # or commands that are provided by the specified service. Doing so ensures that the service is aware
      # that it can create the resources that are required for the integration. How the service creates
      # those resources in the organization's accounts depends on that service. For more information, see
      # the documentation for the other Amazon Web Services service. For more information about enabling
      # services to integrate with Organizations, see Using Organizations with other Amazon Web Services
      # services in the Organizations User Guide . You can only call this operation from the management
      # account.
      def enable_aws_service_access(
        service_principal : String
      ) : Nil
        input = Types::EnableAWSServiceAccessRequest.new(service_principal: service_principal)
        enable_aws_service_access(input)
      end
      def enable_aws_service_access(input : Types::EnableAWSServiceAccessRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ENABLE_AWS_SERVICE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables all features in an organization. This enables the use of organization policies that can
      # restrict the services and actions that can be called in each account. Until you enable all features,
      # you have access only to consolidated billing, and you can't use any of the advanced account
      # administration features that Organizations supports. For more information, see Enabling all features
      # in your organization in the Organizations User Guide . This operation is required only for
      # organizations that were created explicitly with only the consolidated billing features enabled.
      # Calling this operation sends a handshake to every invited account in the organization. The feature
      # set change can be finalized and the additional features enabled only after all administrators in the
      # invited accounts approve the change by accepting the handshake. After you enable all features, you
      # can separately enable or disable individual policy types in a root using EnablePolicyType and
      # DisablePolicyType . To see the status of policy types in a root, use ListRoots . After all invited
      # member accounts accept the handshake, you finalize the feature set change by accepting the handshake
      # that contains "Action": "ENABLE_ALL_FEATURES" . This completes the change. After you enable all
      # features in your organization, the management account in the organization can apply policies on all
      # member accounts. These policies can restrict what users and even administrators in those accounts
      # can do. The management account can apply policies that prevent accounts from leaving the
      # organization. Ensure that your account administrators are aware of this. You can only call this
      # operation from the management account.
      def enable_all_features : Types::EnableAllFeaturesResponse
        input = Types::EnableAllFeaturesRequest.new
        enable_all_features(input)
      end
      def enable_all_features(input : Types::EnableAllFeaturesRequest) : Types::EnableAllFeaturesResponse
        request = Protocol::JsonRpc.build_request(Model::ENABLE_ALL_FEATURES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableAllFeaturesResponse, "EnableAllFeatures")
      end

      # Enables a policy type in a root. After you enable a policy type in a root, you can attach policies
      # of that type to the root, any organizational unit (OU), or account in that root. You can undo this
      # by using the DisablePolicyType operation. This is an asynchronous request that Amazon Web Services
      # performs in the background. Amazon Web Services recommends that you first use ListRoots to see the
      # status of policy types for a specified root, and then use this operation. You can only call this
      # operation from the management account or a member account that is a delegated administrator. You can
      # enable a policy type in a root only if that policy type is available in the organization. To view
      # the status of available policy types in the organization, use ListRoots .
      def enable_policy_type(
        policy_type : String,
        root_id : String
      ) : Types::EnablePolicyTypeResponse
        input = Types::EnablePolicyTypeRequest.new(policy_type: policy_type, root_id: root_id)
        enable_policy_type(input)
      end
      def enable_policy_type(input : Types::EnablePolicyTypeRequest) : Types::EnablePolicyTypeResponse
        request = Protocol::JsonRpc.build_request(Model::ENABLE_POLICY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnablePolicyTypeResponse, "EnablePolicyType")
      end

      # Sends an invitation to another account to join your organization as a member account. Organizations
      # sends email on your behalf to the email address that is associated with the other account's owner.
      # The invitation is implemented as a Handshake whose details are in the response. If you receive an
      # exception that indicates that you exceeded your account limits for the organization or that the
      # operation failed because your organization is still initializing, wait one hour and then try again.
      # If the error persists after an hour, contact Amazon Web Services Support . If the request includes
      # tags, then the requester must have the organizations:TagResource permission. You can only call this
      # operation from the management account.
      def invite_account_to_organization(
        target : Types::HandshakeParty,
        notes : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::InviteAccountToOrganizationResponse
        input = Types::InviteAccountToOrganizationRequest.new(target: target, notes: notes, tags: tags)
        invite_account_to_organization(input)
      end
      def invite_account_to_organization(input : Types::InviteAccountToOrganizationRequest) : Types::InviteAccountToOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::INVITE_ACCOUNT_TO_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InviteAccountToOrganizationResponse, "InviteAccountToOrganization")
      end

      # Sends an invitation to another organization's management account to designate your account with the
      # specified responsibilities for their organization. The invitation is implemented as a Handshake
      # whose details are in the response. You can only call this operation from the management account.
      def invite_organization_to_transfer_responsibility(
        source_name : String,
        start_timestamp : Time,
        target : Types::HandshakeParty,
        type : String,
        notes : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::InviteOrganizationToTransferResponsibilityResponse
        input = Types::InviteOrganizationToTransferResponsibilityRequest.new(source_name: source_name, start_timestamp: start_timestamp, target: target, type: type, notes: notes, tags: tags)
        invite_organization_to_transfer_responsibility(input)
      end
      def invite_organization_to_transfer_responsibility(input : Types::InviteOrganizationToTransferResponsibilityRequest) : Types::InviteOrganizationToTransferResponsibilityResponse
        request = Protocol::JsonRpc.build_request(Model::INVITE_ORGANIZATION_TO_TRANSFER_RESPONSIBILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InviteOrganizationToTransferResponsibilityResponse, "InviteOrganizationToTransferResponsibility")
      end

      # Removes a member account from its parent organization. This version of the operation is performed by
      # the account that wants to leave. To remove a member account as a user in the management account, use
      # RemoveAccountFromOrganization instead. You can only call from operation from a member account. The
      # management account in an organization with all features enabled can set service control policies
      # (SCPs) that can restrict what administrators of member accounts can do. This includes preventing
      # them from successfully calling LeaveOrganization and leaving the organization. You can leave an
      # organization as a member account only if the account is configured with the information required to
      # operate as a standalone account. When you create an account in an organization using the
      # Organizations console, API, or CLI commands, the information required of standalone accounts is not
      # automatically collected. For each account that you want to make standalone, you must perform the
      # following steps. If any of the steps are already completed for this account, that step doesn't
      # appear. Choose a support plan Provide and verify the required contact information Provide a current
      # payment method Amazon Web Services uses the payment method to charge for any billable (not free
      # tier) Amazon Web Services activity that occurs while the account isn't attached to an organization.
      # For more information, see Considerations before removing an account from an organization in the
      # Organizations User Guide . The account that you want to leave must not be a delegated administrator
      # account for any Amazon Web Services service enabled for your organization. If the account is a
      # delegated administrator, you must first change the delegated administrator account to another
      # account that is remaining in the organization. After the account leaves the organization, all tags
      # that were attached to the account object in the organization are deleted. Amazon Web Services
      # accounts outside of an organization do not support tags. A newly created account has a waiting
      # period before it can be removed from its organization. You must wait until at least four days after
      # the account was created. Invited accounts aren't subject to this waiting period. If you are using an
      # organization principal to call LeaveOrganization across multiple accounts, you can only do this up
      # to 5 accounts per second in a single organization.
      def leave_organization : Nil
        request = Protocol::JsonRpc.build_request(Model::LEAVE_ORGANIZATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Returns a list of the Amazon Web Services services that you enabled to integrate with your
      # organization. After a service on this list creates the resources that it requires for the
      # integration, it can perform operations on your organization and its accounts. For more information
      # about integrating other services with Organizations, including the list of services that currently
      # work with Organizations, see Using Organizations with other Amazon Web Services services in the
      # Organizations User Guide . You can only call this operation from the management account or a member
      # account that is a delegated administrator.
      def list_aws_service_access_for_organization(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAWSServiceAccessForOrganizationResponse
        input = Types::ListAWSServiceAccessForOrganizationRequest.new(max_results: max_results, next_token: next_token)
        list_aws_service_access_for_organization(input)
      end
      def list_aws_service_access_for_organization(input : Types::ListAWSServiceAccessForOrganizationRequest) : Types::ListAWSServiceAccessForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AWS_SERVICE_ACCESS_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAWSServiceAccessForOrganizationResponse, "ListAWSServiceAccessForOrganization")
      end

      # Lists all the accounts in the organization. To request only the accounts in a specified root or
      # organizational unit (OU), use the ListAccountsForParent operation instead. When calling List*
      # operations, always check the NextToken response parameter value, even if you receive an empty result
      # set. These operations can occasionally return an empty set of results even when more results are
      # available. Continue making requests until NextToken returns null. A null NextToken value indicates
      # that you have retrieved all available results. You can only call this operation from the management
      # account or a member account that is a delegated administrator.
      def list_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountsResponse
        input = Types::ListAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_accounts(input)
      end
      def list_accounts(input : Types::ListAccountsRequest) : Types::ListAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountsResponse, "ListAccounts")
      end

      # Lists the accounts in an organization that are contained by the specified target root or
      # organizational unit (OU). If you specify the root, you get a list of all the accounts that aren't in
      # any OU. If you specify an OU, you get a list of all the accounts in only that OU and not in any
      # child OUs. To get a list of all accounts in the organization, use the ListAccounts operation. When
      # calling List* operations, always check the NextToken response parameter value, even if you receive
      # an empty result set. These operations can occasionally return an empty set of results even when more
      # results are available. Continue making requests until NextToken returns null. A null NextToken value
      # indicates that you have retrieved all available results. You can only call this operation from the
      # management account or a member account that is a delegated administrator.
      def list_accounts_for_parent(
        parent_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountsForParentResponse
        input = Types::ListAccountsForParentRequest.new(parent_id: parent_id, max_results: max_results, next_token: next_token)
        list_accounts_for_parent(input)
      end
      def list_accounts_for_parent(input : Types::ListAccountsForParentRequest) : Types::ListAccountsForParentResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNTS_FOR_PARENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountsForParentResponse, "ListAccountsForParent")
      end

      # Lists all the accounts in an organization that have invalid effective policies. An invalid effective
      # policy is an effective policy that fails validation checks, resulting in the effective policy not
      # being fully enforced on all the intended accounts within an organization. You can only call this
      # operation from the management account or a member account that is a delegated administrator.
      def list_accounts_with_invalid_effective_policy(
        policy_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountsWithInvalidEffectivePolicyResponse
        input = Types::ListAccountsWithInvalidEffectivePolicyRequest.new(policy_type: policy_type, max_results: max_results, next_token: next_token)
        list_accounts_with_invalid_effective_policy(input)
      end
      def list_accounts_with_invalid_effective_policy(input : Types::ListAccountsWithInvalidEffectivePolicyRequest) : Types::ListAccountsWithInvalidEffectivePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNTS_WITH_INVALID_EFFECTIVE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountsWithInvalidEffectivePolicyResponse, "ListAccountsWithInvalidEffectivePolicy")
      end

      # Lists all of the organizational units (OUs) or accounts that are contained in the specified parent
      # OU or root. This operation, along with ListParents enables you to traverse the tree structure that
      # makes up this root. When calling List* operations, always check the NextToken response parameter
      # value, even if you receive an empty result set. These operations can occasionally return an empty
      # set of results even when more results are available. Continue making requests until NextToken
      # returns null. A null NextToken value indicates that you have retrieved all available results. You
      # can only call this operation from the management account or a member account that is a delegated
      # administrator.
      def list_children(
        child_type : String,
        parent_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListChildrenResponse
        input = Types::ListChildrenRequest.new(child_type: child_type, parent_id: parent_id, max_results: max_results, next_token: next_token)
        list_children(input)
      end
      def list_children(input : Types::ListChildrenRequest) : Types::ListChildrenResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CHILDREN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListChildrenResponse, "ListChildren")
      end

      # Lists the account creation requests that match the specified status that is currently being tracked
      # for the organization. When calling List* operations, always check the NextToken response parameter
      # value, even if you receive an empty result set. These operations can occasionally return an empty
      # set of results even when more results are available. Continue making requests until NextToken
      # returns null. A null NextToken value indicates that you have retrieved all available results. You
      # can only call this operation from the management account or a member account that is a delegated
      # administrator.
      def list_create_account_status(
        max_results : Int32? = nil,
        next_token : String? = nil,
        states : Array(String)? = nil
      ) : Types::ListCreateAccountStatusResponse
        input = Types::ListCreateAccountStatusRequest.new(max_results: max_results, next_token: next_token, states: states)
        list_create_account_status(input)
      end
      def list_create_account_status(input : Types::ListCreateAccountStatusRequest) : Types::ListCreateAccountStatusResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CREATE_ACCOUNT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCreateAccountStatusResponse, "ListCreateAccountStatus")
      end

      # Lists the Amazon Web Services accounts that are designated as delegated administrators in this
      # organization. You can only call this operation from the management account or a member account that
      # is a delegated administrator.
      def list_delegated_administrators(
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_principal : String? = nil
      ) : Types::ListDelegatedAdministratorsResponse
        input = Types::ListDelegatedAdministratorsRequest.new(max_results: max_results, next_token: next_token, service_principal: service_principal)
        list_delegated_administrators(input)
      end
      def list_delegated_administrators(input : Types::ListDelegatedAdministratorsRequest) : Types::ListDelegatedAdministratorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DELEGATED_ADMINISTRATORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDelegatedAdministratorsResponse, "ListDelegatedAdministrators")
      end

      # List the Amazon Web Services services for which the specified account is a delegated administrator.
      # You can only call this operation from the management account or a member account that is a delegated
      # administrator.
      def list_delegated_services_for_account(
        account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDelegatedServicesForAccountResponse
        input = Types::ListDelegatedServicesForAccountRequest.new(account_id: account_id, max_results: max_results, next_token: next_token)
        list_delegated_services_for_account(input)
      end
      def list_delegated_services_for_account(input : Types::ListDelegatedServicesForAccountRequest) : Types::ListDelegatedServicesForAccountResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DELEGATED_SERVICES_FOR_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDelegatedServicesForAccountResponse, "ListDelegatedServicesForAccount")
      end

      # Lists all the validation errors on an effective policy for a specified account and policy type. You
      # can only call this operation from the management account or a member account that is a delegated
      # administrator.
      def list_effective_policy_validation_errors(
        account_id : String,
        policy_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEffectivePolicyValidationErrorsResponse
        input = Types::ListEffectivePolicyValidationErrorsRequest.new(account_id: account_id, policy_type: policy_type, max_results: max_results, next_token: next_token)
        list_effective_policy_validation_errors(input)
      end
      def list_effective_policy_validation_errors(input : Types::ListEffectivePolicyValidationErrorsRequest) : Types::ListEffectivePolicyValidationErrorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EFFECTIVE_POLICY_VALIDATION_ERRORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEffectivePolicyValidationErrorsResponse, "ListEffectivePolicyValidationErrors")
      end

      # Lists the recent handshakes that you have received. You can view CANCELED , ACCEPTED , DECLINED , or
      # EXPIRED handshakes in API responses for 30 days before they are deleted. You can call this operation
      # from any account in a organization. When calling List* operations, always check the NextToken
      # response parameter value, even if you receive an empty result set. These operations can occasionally
      # return an empty set of results even when more results are available. Continue making requests until
      # NextToken returns null. A null NextToken value indicates that you have retrieved all available
      # results.
      def list_handshakes_for_account(
        filter : Types::HandshakeFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListHandshakesForAccountResponse
        input = Types::ListHandshakesForAccountRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_handshakes_for_account(input)
      end
      def list_handshakes_for_account(input : Types::ListHandshakesForAccountRequest) : Types::ListHandshakesForAccountResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HANDSHAKES_FOR_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHandshakesForAccountResponse, "ListHandshakesForAccount")
      end

      # Lists the recent handshakes that you have sent. You can view CANCELED , ACCEPTED , DECLINED , or
      # EXPIRED handshakes in API responses for 30 days before they are deleted. You can only call this
      # operation from the management account or a member account that is a delegated administrator. When
      # calling List* operations, always check the NextToken response parameter value, even if you receive
      # an empty result set. These operations can occasionally return an empty set of results even when more
      # results are available. Continue making requests until NextToken returns null. A null NextToken value
      # indicates that you have retrieved all available results.
      def list_handshakes_for_organization(
        filter : Types::HandshakeFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListHandshakesForOrganizationResponse
        input = Types::ListHandshakesForOrganizationRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_handshakes_for_organization(input)
      end
      def list_handshakes_for_organization(input : Types::ListHandshakesForOrganizationRequest) : Types::ListHandshakesForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HANDSHAKES_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHandshakesForOrganizationResponse, "ListHandshakesForOrganization")
      end

      # Lists transfers that allow you to manage the specified responsibilities for another organization.
      # This operation returns both transfer invitations and transfers. When calling List* operations,
      # always check the NextToken response parameter value, even if you receive an empty result set. These
      # operations can occasionally return an empty set of results even when more results are available.
      # Continue making requests until NextToken returns null. A null NextToken value indicates that you
      # have retrieved all available results.
      def list_inbound_responsibility_transfers(
        type : String,
        id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInboundResponsibilityTransfersResponse
        input = Types::ListInboundResponsibilityTransfersRequest.new(type: type, id: id, max_results: max_results, next_token: next_token)
        list_inbound_responsibility_transfers(input)
      end
      def list_inbound_responsibility_transfers(input : Types::ListInboundResponsibilityTransfersRequest) : Types::ListInboundResponsibilityTransfersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INBOUND_RESPONSIBILITY_TRANSFERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInboundResponsibilityTransfersResponse, "ListInboundResponsibilityTransfers")
      end

      # Lists the organizational units (OUs) in a parent organizational unit or root. When calling List*
      # operations, always check the NextToken response parameter value, even if you receive an empty result
      # set. These operations can occasionally return an empty set of results even when more results are
      # available. Continue making requests until NextToken returns null. A null NextToken value indicates
      # that you have retrieved all available results. You can only call this operation from the management
      # account or a member account that is a delegated administrator.
      def list_organizational_units_for_parent(
        parent_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOrganizationalUnitsForParentResponse
        input = Types::ListOrganizationalUnitsForParentRequest.new(parent_id: parent_id, max_results: max_results, next_token: next_token)
        list_organizational_units_for_parent(input)
      end
      def list_organizational_units_for_parent(input : Types::ListOrganizationalUnitsForParentRequest) : Types::ListOrganizationalUnitsForParentResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ORGANIZATIONAL_UNITS_FOR_PARENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOrganizationalUnitsForParentResponse, "ListOrganizationalUnitsForParent")
      end

      # Lists transfers that allow an account outside your organization to manage the specified
      # responsibilities for your organization. This operation returns both transfer invitations and
      # transfers. When calling List* operations, always check the NextToken response parameter value, even
      # if you receive an empty result set. These operations can occasionally return an empty set of results
      # even when more results are available. Continue making requests until NextToken returns null. A null
      # NextToken value indicates that you have retrieved all available results.
      def list_outbound_responsibility_transfers(
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOutboundResponsibilityTransfersResponse
        input = Types::ListOutboundResponsibilityTransfersRequest.new(type: type, max_results: max_results, next_token: next_token)
        list_outbound_responsibility_transfers(input)
      end
      def list_outbound_responsibility_transfers(input : Types::ListOutboundResponsibilityTransfersRequest) : Types::ListOutboundResponsibilityTransfersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OUTBOUND_RESPONSIBILITY_TRANSFERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOutboundResponsibilityTransfersResponse, "ListOutboundResponsibilityTransfers")
      end

      # Lists the root or organizational units (OUs) that serve as the immediate parent of the specified
      # child OU or account. This operation, along with ListChildren enables you to traverse the tree
      # structure that makes up this root. When calling List* operations, always check the NextToken
      # response parameter value, even if you receive an empty result set. These operations can occasionally
      # return an empty set of results even when more results are available. Continue making requests until
      # NextToken returns null. A null NextToken value indicates that you have retrieved all available
      # results. You can only call this operation from the management account or a member account that is a
      # delegated administrator. In the current release, a child can have only a single parent.
      def list_parents(
        child_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListParentsResponse
        input = Types::ListParentsRequest.new(child_id: child_id, max_results: max_results, next_token: next_token)
        list_parents(input)
      end
      def list_parents(input : Types::ListParentsRequest) : Types::ListParentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PARENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListParentsResponse, "ListParents")
      end

      # Retrieves the list of all policies in an organization of a specified type. When calling List*
      # operations, always check the NextToken response parameter value, even if you receive an empty result
      # set. These operations can occasionally return an empty set of results even when more results are
      # available. Continue making requests until NextToken returns null. A null NextToken value indicates
      # that you have retrieved all available results. You can only call this operation from the management
      # account or a member account that is a delegated administrator.
      def list_policies(
        filter : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPoliciesResponse
        input = Types::ListPoliciesRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_policies(input)
      end
      def list_policies(input : Types::ListPoliciesRequest) : Types::ListPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPoliciesResponse, "ListPolicies")
      end

      # Lists the policies that are directly attached to the specified target root, organizational unit
      # (OU), or account. You must specify the policy type that you want included in the returned list. When
      # calling List* operations, always check the NextToken response parameter value, even if you receive
      # an empty result set. These operations can occasionally return an empty set of results even when more
      # results are available. Continue making requests until NextToken returns null. A null NextToken value
      # indicates that you have retrieved all available results. You can only call this operation from the
      # management account or a member account that is a delegated administrator.
      def list_policies_for_target(
        filter : String,
        target_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPoliciesForTargetResponse
        input = Types::ListPoliciesForTargetRequest.new(filter: filter, target_id: target_id, max_results: max_results, next_token: next_token)
        list_policies_for_target(input)
      end
      def list_policies_for_target(input : Types::ListPoliciesForTargetRequest) : Types::ListPoliciesForTargetResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_POLICIES_FOR_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPoliciesForTargetResponse, "ListPoliciesForTarget")
      end

      # Lists the roots that are defined in the current organization. When calling List* operations, always
      # check the NextToken response parameter value, even if you receive an empty result set. These
      # operations can occasionally return an empty set of results even when more results are available.
      # Continue making requests until NextToken returns null. A null NextToken value indicates that you
      # have retrieved all available results. You can only call this operation from the management account
      # or a member account that is a delegated administrator. Policy types can be enabled and disabled in
      # roots. This is distinct from whether they're available in the organization. When you enable all
      # features, you make policy types available for use in that organization. Individual policy types can
      # then be enabled and disabled in a root. To see the availability of a policy type in an organization,
      # use DescribeOrganization .
      def list_roots(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRootsResponse
        input = Types::ListRootsRequest.new(max_results: max_results, next_token: next_token)
        list_roots(input)
      end
      def list_roots(input : Types::ListRootsRequest) : Types::ListRootsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ROOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRootsResponse, "ListRoots")
      end

      # Lists tags that are attached to the specified resource. You can attach tags to the following
      # resources in Organizations. Amazon Web Services account Organization root Organizational unit (OU)
      # Policy (any type) You can only call this operation from the management account or a member account
      # that is a delegated administrator.
      def list_tags_for_resource(
        resource_id : String,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse
        input = Types::ListTagsForResourceRequest.new(resource_id: resource_id, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists all the roots, organizational units (OUs), and accounts that the specified policy is attached
      # to. When calling List* operations, always check the NextToken response parameter value, even if you
      # receive an empty result set. These operations can occasionally return an empty set of results even
      # when more results are available. Continue making requests until NextToken returns null. A null
      # NextToken value indicates that you have retrieved all available results. You can only call this
      # operation from the management account or a member account that is a delegated administrator.
      def list_targets_for_policy(
        policy_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTargetsForPolicyResponse
        input = Types::ListTargetsForPolicyRequest.new(policy_id: policy_id, max_results: max_results, next_token: next_token)
        list_targets_for_policy(input)
      end
      def list_targets_for_policy(input : Types::ListTargetsForPolicyRequest) : Types::ListTargetsForPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TARGETS_FOR_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTargetsForPolicyResponse, "ListTargetsForPolicy")
      end

      # Moves an account from its current source parent root or organizational unit (OU) to the specified
      # destination parent root or OU. You can only call this operation from the management account.
      def move_account(
        account_id : String,
        destination_parent_id : String,
        source_parent_id : String
      ) : Nil
        input = Types::MoveAccountRequest.new(account_id: account_id, destination_parent_id: destination_parent_id, source_parent_id: source_parent_id)
        move_account(input)
      end
      def move_account(input : Types::MoveAccountRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::MOVE_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or updates a resource policy. You can only call this operation from the management account..
      def put_resource_policy(
        content : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutResourcePolicyResponse
        input = Types::PutResourcePolicyRequest.new(content: content, tags: tags)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Enables the specified member account to administer the Organizations features of the specified
      # Amazon Web Services service. It grants read-only access to Organizations service data. The account
      # still requires IAM permissions to access and administer the Amazon Web Services service. You can run
      # this action only for Amazon Web Services services that support this feature. For a current list of
      # services that support it, see the column Supports Delegated Administrator in the table at Amazon Web
      # Services Services that you can use with Organizations in the Organizations User Guide. You can only
      # call this operation from the management account.
      def register_delegated_administrator(
        account_id : String,
        service_principal : String
      ) : Nil
        input = Types::RegisterDelegatedAdministratorRequest.new(account_id: account_id, service_principal: service_principal)
        register_delegated_administrator(input)
      end
      def register_delegated_administrator(input : Types::RegisterDelegatedAdministratorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REGISTER_DELEGATED_ADMINISTRATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified account from the organization. The removed account becomes a standalone
      # account that isn't a member of any organization. It's no longer subject to any policies and is
      # responsible for its own bill payments. The organization's management account is no longer charged
      # for any expenses accrued by the member account after it's removed from the organization. You can
      # only call this operation from the management account. Member accounts can remove themselves with
      # LeaveOrganization instead. You can remove an account from your organization only if the account is
      # configured with the information required to operate as a standalone account. When you create an
      # account in an organization using the Organizations console, API, or CLI commands, the information
      # required of standalone accounts is not automatically collected. For more information, see
      # Considerations before removing an account from an organization in the Organizations User Guide . The
      # account that you want to leave must not be a delegated administrator account for any Amazon Web
      # Services service enabled for your organization. If the account is a delegated administrator, you
      # must first change the delegated administrator account to another account that is remaining in the
      # organization. After the account leaves the organization, all tags that were attached to the account
      # object in the organization are deleted. Amazon Web Services accounts outside of an organization do
      # not support tags.
      def remove_account_from_organization(
        account_id : String
      ) : Nil
        input = Types::RemoveAccountFromOrganizationRequest.new(account_id: account_id)
        remove_account_from_organization(input)
      end
      def remove_account_from_organization(input : Types::RemoveAccountFromOrganizationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_ACCOUNT_FROM_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to the specified resource. Currently, you can attach tags to the following
      # resources in Organizations. Amazon Web Services account Organization root Organizational unit (OU)
      # Policy (any type) You can only call this operation from the management account or a member account
      # that is a delegated administrator.
      def tag_resource(
        resource_id : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagResourceRequest.new(resource_id: resource_id, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Ends a transfer. A transfer is an arrangement between two management accounts where one account
      # designates the other with specified responsibilities for their organization.
      def terminate_responsibility_transfer(
        id : String,
        end_timestamp : Time? = nil
      ) : Types::TerminateResponsibilityTransferResponse
        input = Types::TerminateResponsibilityTransferRequest.new(id: id, end_timestamp: end_timestamp)
        terminate_responsibility_transfer(input)
      end
      def terminate_responsibility_transfer(input : Types::TerminateResponsibilityTransferRequest) : Types::TerminateResponsibilityTransferResponse
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_RESPONSIBILITY_TRANSFER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateResponsibilityTransferResponse, "TerminateResponsibilityTransfer")
      end

      # Removes any tags with the specified keys from the specified resource. You can attach tags to the
      # following resources in Organizations. Amazon Web Services account Organization root Organizational
      # unit (OU) Policy (any type) You can only call this operation from the management account or a member
      # account that is a delegated administrator.
      def untag_resource(
        resource_id : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagResourceRequest.new(resource_id: resource_id, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Renames the specified organizational unit (OU). The ID and ARN don't change. The child OUs and
      # accounts remain in place, and any attached policies of the OU remain attached. You can only call
      # this operation from the management account.
      def update_organizational_unit(
        organizational_unit_id : String,
        name : String? = nil
      ) : Types::UpdateOrganizationalUnitResponse
        input = Types::UpdateOrganizationalUnitRequest.new(organizational_unit_id: organizational_unit_id, name: name)
        update_organizational_unit(input)
      end
      def update_organizational_unit(input : Types::UpdateOrganizationalUnitRequest) : Types::UpdateOrganizationalUnitResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ORGANIZATIONAL_UNIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateOrganizationalUnitResponse, "UpdateOrganizationalUnit")
      end

      # Updates an existing policy with a new name, description, or content. If you don't supply any
      # parameter, that value remains unchanged. You can't change a policy's type. You can only call this
      # operation from the management account or a member account that is a delegated administrator.
      def update_policy(
        policy_id : String,
        content : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Types::UpdatePolicyResponse
        input = Types::UpdatePolicyRequest.new(policy_id: policy_id, content: content, description: description, name: name)
        update_policy(input)
      end
      def update_policy(input : Types::UpdatePolicyRequest) : Types::UpdatePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePolicyResponse, "UpdatePolicy")
      end

      # Updates a transfer. A transfer is the arrangement between two management accounts where one account
      # designates the other with specified responsibilities for their organization. You can update the name
      # assigned to a transfer.
      def update_responsibility_transfer(
        id : String,
        name : String
      ) : Types::UpdateResponsibilityTransferResponse
        input = Types::UpdateResponsibilityTransferRequest.new(id: id, name: name)
        update_responsibility_transfer(input)
      end
      def update_responsibility_transfer(input : Types::UpdateResponsibilityTransferRequest) : Types::UpdateResponsibilityTransferResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESPONSIBILITY_TRANSFER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResponsibilityTransferResponse, "UpdateResponsibilityTransfer")
      end
    end
  end
end
