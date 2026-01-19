module AwsSdk
  module WorkSpaces
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

      # Accepts the account link invitation. There's currently no unlinking capability after you accept the
      # account linking invitation.
      def accept_account_link_invitation(
        link_id : String,
        client_token : String? = nil
      ) : Types::AcceptAccountLinkInvitationResult
        input = Types::AcceptAccountLinkInvitationRequest.new(link_id: link_id, client_token: client_token)
        accept_account_link_invitation(input)
      end
      def accept_account_link_invitation(input : Types::AcceptAccountLinkInvitationRequest) : Types::AcceptAccountLinkInvitationResult
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_ACCOUNT_LINK_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptAccountLinkInvitationResult, "AcceptAccountLinkInvitation")
      end

      # Associates the specified connection alias with the specified directory to enable cross-Region
      # redirection. For more information, see Cross-Region Redirection for Amazon WorkSpaces . Before
      # performing this operation, call DescribeConnectionAliases to make sure that the current state of the
      # connection alias is CREATED .
      def associate_connection_alias(
        alias_id : String,
        resource_id : String
      ) : Types::AssociateConnectionAliasResult
        input = Types::AssociateConnectionAliasRequest.new(alias_id: alias_id, resource_id: resource_id)
        associate_connection_alias(input)
      end
      def associate_connection_alias(input : Types::AssociateConnectionAliasRequest) : Types::AssociateConnectionAliasResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_CONNECTION_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateConnectionAliasResult, "AssociateConnectionAlias")
      end

      # Associates the specified IP access control group with the specified directory.
      def associate_ip_groups(
        directory_id : String,
        group_ids : Array(String)
      ) : Types::AssociateIpGroupsResult
        input = Types::AssociateIpGroupsRequest.new(directory_id: directory_id, group_ids: group_ids)
        associate_ip_groups(input)
      end
      def associate_ip_groups(input : Types::AssociateIpGroupsRequest) : Types::AssociateIpGroupsResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_IP_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateIpGroupsResult, "AssociateIpGroups")
      end

      # Associates the specified application to the specified WorkSpace.
      def associate_workspace_application(
        application_id : String,
        workspace_id : String
      ) : Types::AssociateWorkspaceApplicationResult
        input = Types::AssociateWorkspaceApplicationRequest.new(application_id: application_id, workspace_id: workspace_id)
        associate_workspace_application(input)
      end
      def associate_workspace_application(input : Types::AssociateWorkspaceApplicationRequest) : Types::AssociateWorkspaceApplicationResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_WORKSPACE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateWorkspaceApplicationResult, "AssociateWorkspaceApplication")
      end

      # Adds one or more rules to the specified IP access control group. This action gives users permission
      # to access their WorkSpaces from the CIDR address ranges specified in the rules.
      def authorize_ip_rules(
        group_id : String,
        user_rules : Array(Types::IpRuleItem)
      ) : Types::AuthorizeIpRulesResult
        input = Types::AuthorizeIpRulesRequest.new(group_id: group_id, user_rules: user_rules)
        authorize_ip_rules(input)
      end
      def authorize_ip_rules(input : Types::AuthorizeIpRulesRequest) : Types::AuthorizeIpRulesResult
        request = Protocol::JsonRpc.build_request(Model::AUTHORIZE_IP_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AuthorizeIpRulesResult, "AuthorizeIpRules")
      end

      # Copies the specified image from the specified Region to the current Region. For more information
      # about copying images, see Copy a Custom WorkSpaces Image . In the China (Ningxia) Region, you can
      # copy images only within the same Region. In Amazon Web Services GovCloud (US), to copy images to and
      # from other Regions, contact Amazon Web Services Support. Before copying a shared image, be sure to
      # verify that it has been shared from the correct Amazon Web Services account. To determine if an
      # image has been shared and to see the ID of the Amazon Web Services account that owns an image, use
      # the DescribeWorkSpaceImages and DescribeWorkspaceImagePermissions API operations.
      def copy_workspace_image(
        name : String,
        source_image_id : String,
        source_region : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CopyWorkspaceImageResult
        input = Types::CopyWorkspaceImageRequest.new(name: name, source_image_id: source_image_id, source_region: source_region, description: description, tags: tags)
        copy_workspace_image(input)
      end
      def copy_workspace_image(input : Types::CopyWorkspaceImageRequest) : Types::CopyWorkspaceImageResult
        request = Protocol::JsonRpc.build_request(Model::COPY_WORKSPACE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopyWorkspaceImageResult, "CopyWorkspaceImage")
      end

      # Creates the account link invitation.
      def create_account_link_invitation(
        target_account_id : String,
        client_token : String? = nil
      ) : Types::CreateAccountLinkInvitationResult
        input = Types::CreateAccountLinkInvitationRequest.new(target_account_id: target_account_id, client_token: client_token)
        create_account_link_invitation(input)
      end
      def create_account_link_invitation(input : Types::CreateAccountLinkInvitationRequest) : Types::CreateAccountLinkInvitationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACCOUNT_LINK_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAccountLinkInvitationResult, "CreateAccountLinkInvitation")
      end

      # Creates a client-add-in for Amazon Connect within a directory. You can create only one Amazon
      # Connect client add-in within a directory. This client add-in allows WorkSpaces users to seamlessly
      # connect to Amazon Connect.
      def create_connect_client_add_in(
        name : String,
        resource_id : String,
        url : String
      ) : Types::CreateConnectClientAddInResult
        input = Types::CreateConnectClientAddInRequest.new(name: name, resource_id: resource_id, url: url)
        create_connect_client_add_in(input)
      end
      def create_connect_client_add_in(input : Types::CreateConnectClientAddInRequest) : Types::CreateConnectClientAddInResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECT_CLIENT_ADD_IN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectClientAddInResult, "CreateConnectClientAddIn")
      end

      # Creates the specified connection alias for use with cross-Region redirection. For more information,
      # see Cross-Region Redirection for Amazon WorkSpaces .
      def create_connection_alias(
        connection_string : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateConnectionAliasResult
        input = Types::CreateConnectionAliasRequest.new(connection_string: connection_string, tags: tags)
        create_connection_alias(input)
      end
      def create_connection_alias(input : Types::CreateConnectionAliasRequest) : Types::CreateConnectionAliasResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTION_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectionAliasResult, "CreateConnectionAlias")
      end

      # Creates an IP access control group. An IP access control group provides you with the ability to
      # control the IP addresses from which users are allowed to access their WorkSpaces. To specify the
      # CIDR address ranges, add rules to your IP access control group and then associate the group with
      # your directory. You can add rules when you create the group or at any time using AuthorizeIpRules .
      # There is a default IP access control group associated with your directory. If you don't associate an
      # IP access control group with your directory, the default group is used. The default group includes a
      # default rule that allows users to access their WorkSpaces from anywhere. You cannot modify the
      # default IP access control group for your directory.
      def create_ip_group(
        group_name : String,
        group_desc : String? = nil,
        tags : Array(Types::Tag)? = nil,
        user_rules : Array(Types::IpRuleItem)? = nil
      ) : Types::CreateIpGroupResult
        input = Types::CreateIpGroupRequest.new(group_name: group_name, group_desc: group_desc, tags: tags, user_rules: user_rules)
        create_ip_group(input)
      end
      def create_ip_group(input : Types::CreateIpGroupRequest) : Types::CreateIpGroupResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_IP_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIpGroupResult, "CreateIpGroup")
      end

      # Creates a standby WorkSpace in a secondary Region.
      def create_standby_workspaces(
        primary_region : String,
        standby_workspaces : Array(Types::StandbyWorkspace)
      ) : Types::CreateStandbyWorkspacesResult
        input = Types::CreateStandbyWorkspacesRequest.new(primary_region: primary_region, standby_workspaces: standby_workspaces)
        create_standby_workspaces(input)
      end
      def create_standby_workspaces(input : Types::CreateStandbyWorkspacesRequest) : Types::CreateStandbyWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_STANDBY_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStandbyWorkspacesResult, "CreateStandbyWorkspaces")
      end

      # Creates the specified tags for the specified WorkSpaces resource.
      def create_tags(
        resource_id : String,
        tags : Array(Types::Tag)
      ) : Types::CreateTagsResult
        input = Types::CreateTagsRequest.new(resource_id: resource_id, tags: tags)
        create_tags(input)
      end
      def create_tags(input : Types::CreateTagsRequest) : Types::CreateTagsResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTagsResult, "CreateTags")
      end

      # Creates a new updated WorkSpace image based on the specified source image. The new updated WorkSpace
      # image has the latest drivers and other updates required by the Amazon WorkSpaces components. To
      # determine which WorkSpace images need to be updated with the latest Amazon WorkSpaces requirements,
      # use DescribeWorkspaceImages . Only Windows 10, Windows Server 2016, and Windows Server 2019
      # WorkSpace images can be programmatically updated at this time. Microsoft Windows updates and other
      # application updates are not included in the update process. The source WorkSpace image is not
      # deleted. You can delete the source image after you've verified your new updated image and created a
      # new bundle.
      def create_updated_workspace_image(
        description : String,
        name : String,
        source_image_id : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateUpdatedWorkspaceImageResult
        input = Types::CreateUpdatedWorkspaceImageRequest.new(description: description, name: name, source_image_id: source_image_id, tags: tags)
        create_updated_workspace_image(input)
      end
      def create_updated_workspace_image(input : Types::CreateUpdatedWorkspaceImageRequest) : Types::CreateUpdatedWorkspaceImageResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_UPDATED_WORKSPACE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUpdatedWorkspaceImageResult, "CreateUpdatedWorkspaceImage")
      end

      # Creates the specified WorkSpace bundle. For more information about creating WorkSpace bundles, see
      # Create a Custom WorkSpaces Image and Bundle .
      def create_workspace_bundle(
        bundle_description : String,
        bundle_name : String,
        compute_type : Types::ComputeType,
        image_id : String,
        user_storage : Types::UserStorage,
        root_storage : Types::RootStorage? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateWorkspaceBundleResult
        input = Types::CreateWorkspaceBundleRequest.new(bundle_description: bundle_description, bundle_name: bundle_name, compute_type: compute_type, image_id: image_id, user_storage: user_storage, root_storage: root_storage, tags: tags)
        create_workspace_bundle(input)
      end
      def create_workspace_bundle(input : Types::CreateWorkspaceBundleRequest) : Types::CreateWorkspaceBundleResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKSPACE_BUNDLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkspaceBundleResult, "CreateWorkspaceBundle")
      end

      # Creates a new WorkSpace image from an existing WorkSpace.
      def create_workspace_image(
        description : String,
        name : String,
        workspace_id : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateWorkspaceImageResult
        input = Types::CreateWorkspaceImageRequest.new(description: description, name: name, workspace_id: workspace_id, tags: tags)
        create_workspace_image(input)
      end
      def create_workspace_image(input : Types::CreateWorkspaceImageRequest) : Types::CreateWorkspaceImageResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKSPACE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkspaceImageResult, "CreateWorkspaceImage")
      end

      # Creates one or more WorkSpaces. This operation is asynchronous and returns before the WorkSpaces are
      # created. The MANUAL running mode value is only supported by Amazon WorkSpaces Core. Contact your
      # account team to be allow-listed to use this value. For more information, see Amazon WorkSpaces Core
      # . You don't need to specify the PCOIP protocol for Linux bundles because DCV (formerly WSP) is the
      # default protocol for those bundles. User-decoupled WorkSpaces are only supported by Amazon
      # WorkSpaces Core. Review your running mode to ensure you are using one that is optimal for your needs
      # and budget. For more information on switching running modes, see Can I switch between hourly and
      # monthly billing?
      def create_workspaces(
        workspaces : Array(Types::WorkspaceRequest)
      ) : Types::CreateWorkspacesResult
        input = Types::CreateWorkspacesRequest.new(workspaces: workspaces)
        create_workspaces(input)
      end
      def create_workspaces(input : Types::CreateWorkspacesRequest) : Types::CreateWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkspacesResult, "CreateWorkspaces")
      end

      # Creates a pool of WorkSpaces.
      def create_workspaces_pool(
        bundle_id : String,
        capacity : Types::Capacity,
        description : String,
        directory_id : String,
        pool_name : String,
        application_settings : Types::ApplicationSettingsRequest? = nil,
        running_mode : String? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout_settings : Types::TimeoutSettings? = nil
      ) : Types::CreateWorkspacesPoolResult
        input = Types::CreateWorkspacesPoolRequest.new(bundle_id: bundle_id, capacity: capacity, description: description, directory_id: directory_id, pool_name: pool_name, application_settings: application_settings, running_mode: running_mode, tags: tags, timeout_settings: timeout_settings)
        create_workspaces_pool(input)
      end
      def create_workspaces_pool(input : Types::CreateWorkspacesPoolRequest) : Types::CreateWorkspacesPoolResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKSPACES_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkspacesPoolResult, "CreateWorkspacesPool")
      end

      # Deletes the account link invitation.
      def delete_account_link_invitation(
        link_id : String,
        client_token : String? = nil
      ) : Types::DeleteAccountLinkInvitationResult
        input = Types::DeleteAccountLinkInvitationRequest.new(link_id: link_id, client_token: client_token)
        delete_account_link_invitation(input)
      end
      def delete_account_link_invitation(input : Types::DeleteAccountLinkInvitationRequest) : Types::DeleteAccountLinkInvitationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCOUNT_LINK_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAccountLinkInvitationResult, "DeleteAccountLinkInvitation")
      end

      # Deletes customized client branding. Client branding allows you to customize your WorkSpace's client
      # login portal. You can tailor your login portal company logo, the support email address, support
      # link, link to reset password, and a custom message for users trying to sign in. After you delete
      # your customized client branding, your login portal reverts to the default client branding.
      def delete_client_branding(
        platforms : Array(String),
        resource_id : String
      ) : Types::DeleteClientBrandingResult
        input = Types::DeleteClientBrandingRequest.new(platforms: platforms, resource_id: resource_id)
        delete_client_branding(input)
      end
      def delete_client_branding(input : Types::DeleteClientBrandingRequest) : Types::DeleteClientBrandingResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLIENT_BRANDING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClientBrandingResult, "DeleteClientBranding")
      end

      # Deletes a client-add-in for Amazon Connect that is configured within a directory.
      def delete_connect_client_add_in(
        add_in_id : String,
        resource_id : String
      ) : Types::DeleteConnectClientAddInResult
        input = Types::DeleteConnectClientAddInRequest.new(add_in_id: add_in_id, resource_id: resource_id)
        delete_connect_client_add_in(input)
      end
      def delete_connect_client_add_in(input : Types::DeleteConnectClientAddInRequest) : Types::DeleteConnectClientAddInResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECT_CLIENT_ADD_IN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConnectClientAddInResult, "DeleteConnectClientAddIn")
      end

      # Deletes the specified connection alias. For more information, see Cross-Region Redirection for
      # Amazon WorkSpaces . If you will no longer be using a fully qualified domain name (FQDN) as the
      # registration code for your WorkSpaces users, you must take certain precautions to prevent potential
      # security issues. For more information, see Security Considerations if You Stop Using Cross-Region
      # Redirection . To delete a connection alias that has been shared, the shared account must first
      # disassociate the connection alias from any directories it has been associated with. Then you must
      # unshare the connection alias from the account it has been shared with. You can delete a connection
      # alias only after it is no longer shared with any accounts or associated with any directories.
      def delete_connection_alias(
        alias_id : String
      ) : Types::DeleteConnectionAliasResult
        input = Types::DeleteConnectionAliasRequest.new(alias_id: alias_id)
        delete_connection_alias(input)
      end
      def delete_connection_alias(input : Types::DeleteConnectionAliasRequest) : Types::DeleteConnectionAliasResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTION_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConnectionAliasResult, "DeleteConnectionAlias")
      end

      # Deletes the specified IP access control group. You cannot delete an IP access control group that is
      # associated with a directory.
      def delete_ip_group(
        group_id : String
      ) : Types::DeleteIpGroupResult
        input = Types::DeleteIpGroupRequest.new(group_id: group_id)
        delete_ip_group(input)
      end
      def delete_ip_group(input : Types::DeleteIpGroupRequest) : Types::DeleteIpGroupResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_IP_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIpGroupResult, "DeleteIpGroup")
      end

      # Deletes the specified tags from the specified WorkSpaces resource.
      def delete_tags(
        resource_id : String,
        tag_keys : Array(String)
      ) : Types::DeleteTagsResult
        input = Types::DeleteTagsRequest.new(resource_id: resource_id, tag_keys: tag_keys)
        delete_tags(input)
      end
      def delete_tags(input : Types::DeleteTagsRequest) : Types::DeleteTagsResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTagsResult, "DeleteTags")
      end

      # Deletes the specified WorkSpace bundle. For more information about deleting WorkSpace bundles, see
      # Delete a Custom WorkSpaces Bundle or Image .
      def delete_workspace_bundle(
        bundle_id : String? = nil
      ) : Types::DeleteWorkspaceBundleResult
        input = Types::DeleteWorkspaceBundleRequest.new(bundle_id: bundle_id)
        delete_workspace_bundle(input)
      end
      def delete_workspace_bundle(input : Types::DeleteWorkspaceBundleRequest) : Types::DeleteWorkspaceBundleResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKSPACE_BUNDLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkspaceBundleResult, "DeleteWorkspaceBundle")
      end

      # Deletes the specified image from your account. To delete an image, you must first delete any bundles
      # that are associated with the image and unshare the image if it is shared with other accounts.
      def delete_workspace_image(
        image_id : String
      ) : Types::DeleteWorkspaceImageResult
        input = Types::DeleteWorkspaceImageRequest.new(image_id: image_id)
        delete_workspace_image(input)
      end
      def delete_workspace_image(input : Types::DeleteWorkspaceImageRequest) : Types::DeleteWorkspaceImageResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKSPACE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkspaceImageResult, "DeleteWorkspaceImage")
      end

      # Deploys associated applications to the specified WorkSpace
      def deploy_workspace_applications(
        workspace_id : String,
        force : Bool? = nil
      ) : Types::DeployWorkspaceApplicationsResult
        input = Types::DeployWorkspaceApplicationsRequest.new(workspace_id: workspace_id, force: force)
        deploy_workspace_applications(input)
      end
      def deploy_workspace_applications(input : Types::DeployWorkspaceApplicationsRequest) : Types::DeployWorkspaceApplicationsResult
        request = Protocol::JsonRpc.build_request(Model::DEPLOY_WORKSPACE_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeployWorkspaceApplicationsResult, "DeployWorkspaceApplications")
      end

      # Deregisters the specified directory. This operation is asynchronous and returns before the WorkSpace
      # directory is deregistered. If any WorkSpaces are registered to this directory, you must remove them
      # before you can deregister the directory. Simple AD and AD Connector are made available to you free
      # of charge to use with WorkSpaces. If there are no WorkSpaces being used with your Simple AD or AD
      # Connector directory for 30 consecutive days, this directory will be automatically deregistered for
      # use with Amazon WorkSpaces, and you will be charged for this directory as per the Directory Service
      # pricing terms . To delete empty directories, see Delete the Directory for Your WorkSpaces . If you
      # delete your Simple AD or AD Connector directory, you can always create a new one when you want to
      # start using WorkSpaces again.
      def deregister_workspace_directory(
        directory_id : String
      ) : Types::DeregisterWorkspaceDirectoryResult
        input = Types::DeregisterWorkspaceDirectoryRequest.new(directory_id: directory_id)
        deregister_workspace_directory(input)
      end
      def deregister_workspace_directory(input : Types::DeregisterWorkspaceDirectoryRequest) : Types::DeregisterWorkspaceDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_WORKSPACE_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterWorkspaceDirectoryResult, "DeregisterWorkspaceDirectory")
      end

      # Retrieves a list that describes the configuration of Bring Your Own License (BYOL) for the specified
      # account.
      def describe_account : Types::DescribeAccountResult
        input = Types::DescribeAccountRequest.new
        describe_account(input)
      end
      def describe_account(input : Types::DescribeAccountRequest) : Types::DescribeAccountResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountResult, "DescribeAccount")
      end

      # Retrieves a list that describes modifications to the configuration of Bring Your Own License (BYOL)
      # for the specified account.
      def describe_account_modifications(
        next_token : String? = nil
      ) : Types::DescribeAccountModificationsResult
        input = Types::DescribeAccountModificationsRequest.new(next_token: next_token)
        describe_account_modifications(input)
      end
      def describe_account_modifications(input : Types::DescribeAccountModificationsRequest) : Types::DescribeAccountModificationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_MODIFICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountModificationsResult, "DescribeAccountModifications")
      end

      # Describes the associations between the application and the specified associated resources.
      def describe_application_associations(
        application_id : String,
        associated_resource_types : Array(String),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeApplicationAssociationsResult
        input = Types::DescribeApplicationAssociationsRequest.new(application_id: application_id, associated_resource_types: associated_resource_types, max_results: max_results, next_token: next_token)
        describe_application_associations(input)
      end
      def describe_application_associations(input : Types::DescribeApplicationAssociationsRequest) : Types::DescribeApplicationAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationAssociationsResult, "DescribeApplicationAssociations")
      end

      # Describes the specified applications by filtering based on their compute types, license
      # availability, operating systems, and owners.
      def describe_applications(
        application_ids : Array(String)? = nil,
        compute_type_names : Array(String)? = nil,
        license_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        operating_system_names : Array(String)? = nil,
        owner : String? = nil
      ) : Types::DescribeApplicationsResult
        input = Types::DescribeApplicationsRequest.new(application_ids: application_ids, compute_type_names: compute_type_names, license_type: license_type, max_results: max_results, next_token: next_token, operating_system_names: operating_system_names, owner: owner)
        describe_applications(input)
      end
      def describe_applications(input : Types::DescribeApplicationsRequest) : Types::DescribeApplicationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationsResult, "DescribeApplications")
      end

      # Describes the associations between the applications and the specified bundle.
      def describe_bundle_associations(
        associated_resource_types : Array(String),
        bundle_id : String
      ) : Types::DescribeBundleAssociationsResult
        input = Types::DescribeBundleAssociationsRequest.new(associated_resource_types: associated_resource_types, bundle_id: bundle_id)
        describe_bundle_associations(input)
      end
      def describe_bundle_associations(input : Types::DescribeBundleAssociationsRequest) : Types::DescribeBundleAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BUNDLE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBundleAssociationsResult, "DescribeBundleAssociations")
      end

      # Describes the specified client branding. Client branding allows you to customize the log in page of
      # various device types for your users. You can add your company logo, the support email address,
      # support link, link to reset password, and a custom message for users trying to sign in. Only device
      # types that have branding information configured will be shown in the response.
      def describe_client_branding(
        resource_id : String
      ) : Types::DescribeClientBrandingResult
        input = Types::DescribeClientBrandingRequest.new(resource_id: resource_id)
        describe_client_branding(input)
      end
      def describe_client_branding(input : Types::DescribeClientBrandingRequest) : Types::DescribeClientBrandingResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLIENT_BRANDING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClientBrandingResult, "DescribeClientBranding")
      end

      # Retrieves a list that describes one or more specified Amazon WorkSpaces clients.
      def describe_client_properties(
        resource_ids : Array(String)
      ) : Types::DescribeClientPropertiesResult
        input = Types::DescribeClientPropertiesRequest.new(resource_ids: resource_ids)
        describe_client_properties(input)
      end
      def describe_client_properties(input : Types::DescribeClientPropertiesRequest) : Types::DescribeClientPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLIENT_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClientPropertiesResult, "DescribeClientProperties")
      end

      # Retrieves a list of Amazon Connect client add-ins that have been created.
      def describe_connect_client_add_ins(
        resource_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConnectClientAddInsResult
        input = Types::DescribeConnectClientAddInsRequest.new(resource_id: resource_id, max_results: max_results, next_token: next_token)
        describe_connect_client_add_ins(input)
      end
      def describe_connect_client_add_ins(input : Types::DescribeConnectClientAddInsRequest) : Types::DescribeConnectClientAddInsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECT_CLIENT_ADD_INS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectClientAddInsResult, "DescribeConnectClientAddIns")
      end

      # Describes the permissions that the owner of a connection alias has granted to another Amazon Web
      # Services account for the specified connection alias. For more information, see Cross-Region
      # Redirection for Amazon WorkSpaces .
      def describe_connection_alias_permissions(
        alias_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConnectionAliasPermissionsResult
        input = Types::DescribeConnectionAliasPermissionsRequest.new(alias_id: alias_id, max_results: max_results, next_token: next_token)
        describe_connection_alias_permissions(input)
      end
      def describe_connection_alias_permissions(input : Types::DescribeConnectionAliasPermissionsRequest) : Types::DescribeConnectionAliasPermissionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTION_ALIAS_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectionAliasPermissionsResult, "DescribeConnectionAliasPermissions")
      end

      # Retrieves a list that describes the connection aliases used for cross-Region redirection. For more
      # information, see Cross-Region Redirection for Amazon WorkSpaces .
      def describe_connection_aliases(
        alias_ids : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        resource_id : String? = nil
      ) : Types::DescribeConnectionAliasesResult
        input = Types::DescribeConnectionAliasesRequest.new(alias_ids: alias_ids, limit: limit, next_token: next_token, resource_id: resource_id)
        describe_connection_aliases(input)
      end
      def describe_connection_aliases(input : Types::DescribeConnectionAliasesRequest) : Types::DescribeConnectionAliasesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTION_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectionAliasesResult, "DescribeConnectionAliases")
      end

      # Retrieves information about a WorkSpace BYOL image being imported via ImportCustomWorkspaceImage.
      def describe_custom_workspace_image_import(
        image_id : String
      ) : Types::DescribeCustomWorkspaceImageImportResult
        input = Types::DescribeCustomWorkspaceImageImportRequest.new(image_id: image_id)
        describe_custom_workspace_image_import(input)
      end
      def describe_custom_workspace_image_import(input : Types::DescribeCustomWorkspaceImageImportRequest) : Types::DescribeCustomWorkspaceImageImportResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CUSTOM_WORKSPACE_IMAGE_IMPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCustomWorkspaceImageImportResult, "DescribeCustomWorkspaceImageImport")
      end

      # Describes the associations between the applications and the specified image.
      def describe_image_associations(
        associated_resource_types : Array(String),
        image_id : String
      ) : Types::DescribeImageAssociationsResult
        input = Types::DescribeImageAssociationsRequest.new(associated_resource_types: associated_resource_types, image_id: image_id)
        describe_image_associations(input)
      end
      def describe_image_associations(input : Types::DescribeImageAssociationsRequest) : Types::DescribeImageAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageAssociationsResult, "DescribeImageAssociations")
      end

      # Describes one or more of your IP access control groups.
      def describe_ip_groups(
        group_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeIpGroupsResult
        input = Types::DescribeIpGroupsRequest.new(group_ids: group_ids, max_results: max_results, next_token: next_token)
        describe_ip_groups(input)
      end
      def describe_ip_groups(input : Types::DescribeIpGroupsRequest) : Types::DescribeIpGroupsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IP_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeIpGroupsResult, "DescribeIpGroups")
      end

      # Describes the specified tags for the specified WorkSpaces resource.
      def describe_tags(
        resource_id : String
      ) : Types::DescribeTagsResult
        input = Types::DescribeTagsRequest.new(resource_id: resource_id)
        describe_tags(input)
      end
      def describe_tags(input : Types::DescribeTagsRequest) : Types::DescribeTagsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTagsResult, "DescribeTags")
      end

      # Describes the associations betweens applications and the specified WorkSpace.
      def describe_workspace_associations(
        associated_resource_types : Array(String),
        workspace_id : String
      ) : Types::DescribeWorkspaceAssociationsResult
        input = Types::DescribeWorkspaceAssociationsRequest.new(associated_resource_types: associated_resource_types, workspace_id: workspace_id)
        describe_workspace_associations(input)
      end
      def describe_workspace_associations(input : Types::DescribeWorkspaceAssociationsRequest) : Types::DescribeWorkspaceAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspaceAssociationsResult, "DescribeWorkspaceAssociations")
      end

      # Retrieves a list that describes the available WorkSpace bundles. You can filter the results using
      # either bundle ID or owner, but not both.
      def describe_workspace_bundles(
        bundle_ids : Array(String)? = nil,
        next_token : String? = nil,
        owner : String? = nil
      ) : Types::DescribeWorkspaceBundlesResult
        input = Types::DescribeWorkspaceBundlesRequest.new(bundle_ids: bundle_ids, next_token: next_token, owner: owner)
        describe_workspace_bundles(input)
      end
      def describe_workspace_bundles(input : Types::DescribeWorkspaceBundlesRequest) : Types::DescribeWorkspaceBundlesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACE_BUNDLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspaceBundlesResult, "DescribeWorkspaceBundles")
      end

      # Describes the available directories that are registered with Amazon WorkSpaces.
      def describe_workspace_directories(
        directory_ids : Array(String)? = nil,
        filters : Array(Types::DescribeWorkspaceDirectoriesFilter)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        workspace_directory_names : Array(String)? = nil
      ) : Types::DescribeWorkspaceDirectoriesResult
        input = Types::DescribeWorkspaceDirectoriesRequest.new(directory_ids: directory_ids, filters: filters, limit: limit, next_token: next_token, workspace_directory_names: workspace_directory_names)
        describe_workspace_directories(input)
      end
      def describe_workspace_directories(input : Types::DescribeWorkspaceDirectoriesRequest) : Types::DescribeWorkspaceDirectoriesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACE_DIRECTORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspaceDirectoriesResult, "DescribeWorkspaceDirectories")
      end

      # Describes the permissions that the owner of an image has granted to other Amazon Web Services
      # accounts for an image.
      def describe_workspace_image_permissions(
        image_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeWorkspaceImagePermissionsResult
        input = Types::DescribeWorkspaceImagePermissionsRequest.new(image_id: image_id, max_results: max_results, next_token: next_token)
        describe_workspace_image_permissions(input)
      end
      def describe_workspace_image_permissions(input : Types::DescribeWorkspaceImagePermissionsRequest) : Types::DescribeWorkspaceImagePermissionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACE_IMAGE_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspaceImagePermissionsResult, "DescribeWorkspaceImagePermissions")
      end

      # Retrieves a list that describes one or more specified images, if the image identifiers are provided.
      # Otherwise, all images in the account are described.
      def describe_workspace_images(
        image_ids : Array(String)? = nil,
        image_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeWorkspaceImagesResult
        input = Types::DescribeWorkspaceImagesRequest.new(image_ids: image_ids, image_type: image_type, max_results: max_results, next_token: next_token)
        describe_workspace_images(input)
      end
      def describe_workspace_images(input : Types::DescribeWorkspaceImagesRequest) : Types::DescribeWorkspaceImagesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACE_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspaceImagesResult, "DescribeWorkspaceImages")
      end

      # Describes the snapshots for the specified WorkSpace.
      def describe_workspace_snapshots(
        workspace_id : String
      ) : Types::DescribeWorkspaceSnapshotsResult
        input = Types::DescribeWorkspaceSnapshotsRequest.new(workspace_id: workspace_id)
        describe_workspace_snapshots(input)
      end
      def describe_workspace_snapshots(input : Types::DescribeWorkspaceSnapshotsRequest) : Types::DescribeWorkspaceSnapshotsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspaceSnapshotsResult, "DescribeWorkspaceSnapshots")
      end

      # Describes the specified WorkSpaces. You can filter the results by using the bundle identifier,
      # directory identifier, or owner, but you can specify only one filter at a time.
      def describe_workspaces(
        bundle_id : String? = nil,
        directory_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        user_name : String? = nil,
        workspace_ids : Array(String)? = nil,
        workspace_name : String? = nil
      ) : Types::DescribeWorkspacesResult
        input = Types::DescribeWorkspacesRequest.new(bundle_id: bundle_id, directory_id: directory_id, limit: limit, next_token: next_token, user_name: user_name, workspace_ids: workspace_ids, workspace_name: workspace_name)
        describe_workspaces(input)
      end
      def describe_workspaces(input : Types::DescribeWorkspacesRequest) : Types::DescribeWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspacesResult, "DescribeWorkspaces")
      end

      # Describes the connection status of the specified WorkSpaces.
      def describe_workspaces_connection_status(
        next_token : String? = nil,
        workspace_ids : Array(String)? = nil
      ) : Types::DescribeWorkspacesConnectionStatusResult
        input = Types::DescribeWorkspacesConnectionStatusRequest.new(next_token: next_token, workspace_ids: workspace_ids)
        describe_workspaces_connection_status(input)
      end
      def describe_workspaces_connection_status(input : Types::DescribeWorkspacesConnectionStatusRequest) : Types::DescribeWorkspacesConnectionStatusResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACES_CONNECTION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspacesConnectionStatusResult, "DescribeWorkspacesConnectionStatus")
      end

      # Retrieves a list that describes the streaming sessions for a specified pool.
      def describe_workspaces_pool_sessions(
        pool_id : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Types::DescribeWorkspacesPoolSessionsResult
        input = Types::DescribeWorkspacesPoolSessionsRequest.new(pool_id: pool_id, limit: limit, next_token: next_token, user_id: user_id)
        describe_workspaces_pool_sessions(input)
      end
      def describe_workspaces_pool_sessions(input : Types::DescribeWorkspacesPoolSessionsRequest) : Types::DescribeWorkspacesPoolSessionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACES_POOL_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspacesPoolSessionsResult, "DescribeWorkspacesPoolSessions")
      end

      # Describes the specified WorkSpaces Pools.
      def describe_workspaces_pools(
        filters : Array(Types::DescribeWorkspacesPoolsFilter)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        pool_ids : Array(String)? = nil
      ) : Types::DescribeWorkspacesPoolsResult
        input = Types::DescribeWorkspacesPoolsRequest.new(filters: filters, limit: limit, next_token: next_token, pool_ids: pool_ids)
        describe_workspaces_pools(input)
      end
      def describe_workspaces_pools(input : Types::DescribeWorkspacesPoolsRequest) : Types::DescribeWorkspacesPoolsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKSPACES_POOLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkspacesPoolsResult, "DescribeWorkspacesPools")
      end

      # Disassociates a connection alias from a directory. Disassociating a connection alias disables
      # cross-Region redirection between two directories in different Regions. For more information, see
      # Cross-Region Redirection for Amazon WorkSpaces . Before performing this operation, call
      # DescribeConnectionAliases to make sure that the current state of the connection alias is CREATED .
      def disassociate_connection_alias(
        alias_id : String
      ) : Types::DisassociateConnectionAliasResult
        input = Types::DisassociateConnectionAliasRequest.new(alias_id: alias_id)
        disassociate_connection_alias(input)
      end
      def disassociate_connection_alias(input : Types::DisassociateConnectionAliasRequest) : Types::DisassociateConnectionAliasResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_CONNECTION_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateConnectionAliasResult, "DisassociateConnectionAlias")
      end

      # Disassociates the specified IP access control group from the specified directory.
      def disassociate_ip_groups(
        directory_id : String,
        group_ids : Array(String)
      ) : Types::DisassociateIpGroupsResult
        input = Types::DisassociateIpGroupsRequest.new(directory_id: directory_id, group_ids: group_ids)
        disassociate_ip_groups(input)
      end
      def disassociate_ip_groups(input : Types::DisassociateIpGroupsRequest) : Types::DisassociateIpGroupsResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_IP_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateIpGroupsResult, "DisassociateIpGroups")
      end

      # Disassociates the specified application from a WorkSpace.
      def disassociate_workspace_application(
        application_id : String,
        workspace_id : String
      ) : Types::DisassociateWorkspaceApplicationResult
        input = Types::DisassociateWorkspaceApplicationRequest.new(application_id: application_id, workspace_id: workspace_id)
        disassociate_workspace_application(input)
      end
      def disassociate_workspace_application(input : Types::DisassociateWorkspaceApplicationRequest) : Types::DisassociateWorkspaceApplicationResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_WORKSPACE_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateWorkspaceApplicationResult, "DisassociateWorkspaceApplication")
      end

      # Retrieves account link information.
      def get_account_link(
        link_id : String? = nil,
        linked_account_id : String? = nil
      ) : Types::GetAccountLinkResult
        input = Types::GetAccountLinkRequest.new(link_id: link_id, linked_account_id: linked_account_id)
        get_account_link(input)
      end
      def get_account_link(input : Types::GetAccountLinkRequest) : Types::GetAccountLinkResult
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_LINK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountLinkResult, "GetAccountLink")
      end

      # Imports client branding. Client branding allows you to customize your WorkSpace's client login
      # portal. You can tailor your login portal company logo, the support email address, support link, link
      # to reset password, and a custom message for users trying to sign in. After you import client
      # branding, the default branding experience for the specified platform type is replaced with the
      # imported experience You must specify at least one platform type when importing client branding. You
      # can import up to 6 MB of data with each request. If your request exceeds this limit, you can import
      # client branding for different platform types using separate requests. In each platform type, the
      # SupportEmail and SupportLink parameters are mutually exclusive. You can specify only one parameter
      # for each platform type, but not both. Imported data can take up to a minute to appear in the
      # WorkSpaces client.
      def import_client_branding(
        resource_id : String,
        device_type_android : Types::DefaultImportClientBrandingAttributes? = nil,
        device_type_ios : Types::IosImportClientBrandingAttributes? = nil,
        device_type_linux : Types::DefaultImportClientBrandingAttributes? = nil,
        device_type_osx : Types::DefaultImportClientBrandingAttributes? = nil,
        device_type_web : Types::DefaultImportClientBrandingAttributes? = nil,
        device_type_windows : Types::DefaultImportClientBrandingAttributes? = nil
      ) : Types::ImportClientBrandingResult
        input = Types::ImportClientBrandingRequest.new(resource_id: resource_id, device_type_android: device_type_android, device_type_ios: device_type_ios, device_type_linux: device_type_linux, device_type_osx: device_type_osx, device_type_web: device_type_web, device_type_windows: device_type_windows)
        import_client_branding(input)
      end
      def import_client_branding(input : Types::ImportClientBrandingRequest) : Types::ImportClientBrandingResult
        request = Protocol::JsonRpc.build_request(Model::IMPORT_CLIENT_BRANDING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportClientBrandingResult, "ImportClientBranding")
      end

      # Imports the specified Windows 10 or 11 Bring Your Own License (BYOL) image into Amazon WorkSpaces
      # using EC2 Image Builder. The image must be an already licensed image that is in your Amazon Web
      # Services account, and you must own the image. For more information about creating BYOL images, see
      # Bring Your Own Windows Desktop Licenses .
      def import_custom_workspace_image(
        compute_type : String,
        image_description : String,
        image_name : String,
        image_source : Types::ImageSourceIdentifier,
        infrastructure_configuration_arn : String,
        os_version : String,
        platform : String,
        protocol : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportCustomWorkspaceImageResult
        input = Types::ImportCustomWorkspaceImageRequest.new(compute_type: compute_type, image_description: image_description, image_name: image_name, image_source: image_source, infrastructure_configuration_arn: infrastructure_configuration_arn, os_version: os_version, platform: platform, protocol: protocol, tags: tags)
        import_custom_workspace_image(input)
      end
      def import_custom_workspace_image(input : Types::ImportCustomWorkspaceImageRequest) : Types::ImportCustomWorkspaceImageResult
        request = Protocol::JsonRpc.build_request(Model::IMPORT_CUSTOM_WORKSPACE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportCustomWorkspaceImageResult, "ImportCustomWorkspaceImage")
      end

      # Imports the specified Windows 10 or 11 Bring Your Own License (BYOL) image into Amazon WorkSpaces.
      # The image must be an already licensed Amazon EC2 image that is in your Amazon Web Services account,
      # and you must own the image. For more information about creating BYOL images, see Bring Your Own
      # Windows Desktop Licenses .
      def import_workspace_image(
        ec2_image_id : String,
        image_description : String,
        image_name : String,
        ingestion_process : String,
        applications : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportWorkspaceImageResult
        input = Types::ImportWorkspaceImageRequest.new(ec2_image_id: ec2_image_id, image_description: image_description, image_name: image_name, ingestion_process: ingestion_process, applications: applications, tags: tags)
        import_workspace_image(input)
      end
      def import_workspace_image(input : Types::ImportWorkspaceImageRequest) : Types::ImportWorkspaceImageResult
        request = Protocol::JsonRpc.build_request(Model::IMPORT_WORKSPACE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportWorkspaceImageResult, "ImportWorkspaceImage")
      end

      # Lists all account links.
      def list_account_links(
        link_status_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountLinksResult
        input = Types::ListAccountLinksRequest.new(link_status_filter: link_status_filter, max_results: max_results, next_token: next_token)
        list_account_links(input)
      end
      def list_account_links(input : Types::ListAccountLinksRequest) : Types::ListAccountLinksResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNT_LINKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountLinksResult, "ListAccountLinks")
      end

      # Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that you can use for the
      # network management interface when you enable Bring Your Own License (BYOL). This operation can be
      # run only by Amazon Web Services accounts that are enabled for BYOL. If your account isn't enabled
      # for BYOL, you'll receive an AccessDeniedException error. The management network interface is
      # connected to a secure Amazon WorkSpaces management network. It is used for interactive streaming of
      # the WorkSpace desktop to Amazon WorkSpaces clients, and to allow Amazon WorkSpaces to manage the
      # WorkSpace.
      def list_available_management_cidr_ranges(
        management_cidr_range_constraint : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAvailableManagementCidrRangesResult
        input = Types::ListAvailableManagementCidrRangesRequest.new(management_cidr_range_constraint: management_cidr_range_constraint, max_results: max_results, next_token: next_token)
        list_available_management_cidr_ranges(input)
      end
      def list_available_management_cidr_ranges(input : Types::ListAvailableManagementCidrRangesRequest) : Types::ListAvailableManagementCidrRangesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_AVAILABLE_MANAGEMENT_CIDR_RANGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAvailableManagementCidrRangesResult, "ListAvailableManagementCidrRanges")
      end

      # Migrates a WorkSpace from one operating system or bundle type to another, while retaining the data
      # on the user volume. The migration process recreates the WorkSpace by using a new root volume from
      # the target bundle image and the user volume from the last available snapshot of the original
      # WorkSpace. During migration, the original D:\Users\%USERNAME% user profile folder is renamed to
      # D:\Users\%USERNAME%MMddyyTHHmmss%.NotMigrated . A new D:\Users\%USERNAME%\ folder is generated by
      # the new OS. Certain files in the old user profile are moved to the new user profile. For available
      # migration scenarios, details about what happens during migration, and best practices, see Migrate a
      # WorkSpace .
      def migrate_workspace(
        bundle_id : String,
        source_workspace_id : String
      ) : Types::MigrateWorkspaceResult
        input = Types::MigrateWorkspaceRequest.new(bundle_id: bundle_id, source_workspace_id: source_workspace_id)
        migrate_workspace(input)
      end
      def migrate_workspace(input : Types::MigrateWorkspaceRequest) : Types::MigrateWorkspaceResult
        request = Protocol::JsonRpc.build_request(Model::MIGRATE_WORKSPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MigrateWorkspaceResult, "MigrateWorkspace")
      end

      # Modifies the configuration of Bring Your Own License (BYOL) for the specified account.
      def modify_account(
        dedicated_tenancy_management_cidr_range : String? = nil,
        dedicated_tenancy_support : String? = nil
      ) : Types::ModifyAccountResult
        input = Types::ModifyAccountRequest.new(dedicated_tenancy_management_cidr_range: dedicated_tenancy_management_cidr_range, dedicated_tenancy_support: dedicated_tenancy_support)
        modify_account(input)
      end
      def modify_account(input : Types::ModifyAccountRequest) : Types::ModifyAccountResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyAccountResult, "ModifyAccount")
      end

      # Modifies the properties of the certificate-based authentication you want to use with your
      # WorkSpaces.
      def modify_certificate_based_auth_properties(
        resource_id : String,
        certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
        properties_to_delete : Array(String)? = nil
      ) : Types::ModifyCertificateBasedAuthPropertiesResult
        input = Types::ModifyCertificateBasedAuthPropertiesRequest.new(resource_id: resource_id, certificate_based_auth_properties: certificate_based_auth_properties, properties_to_delete: properties_to_delete)
        modify_certificate_based_auth_properties(input)
      end
      def modify_certificate_based_auth_properties(input : Types::ModifyCertificateBasedAuthPropertiesRequest) : Types::ModifyCertificateBasedAuthPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_CERTIFICATE_BASED_AUTH_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyCertificateBasedAuthPropertiesResult, "ModifyCertificateBasedAuthProperties")
      end

      # Modifies the properties of the specified Amazon WorkSpaces clients.
      def modify_client_properties(
        client_properties : Types::ClientProperties,
        resource_id : String
      ) : Types::ModifyClientPropertiesResult
        input = Types::ModifyClientPropertiesRequest.new(client_properties: client_properties, resource_id: resource_id)
        modify_client_properties(input)
      end
      def modify_client_properties(input : Types::ModifyClientPropertiesRequest) : Types::ModifyClientPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_CLIENT_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyClientPropertiesResult, "ModifyClientProperties")
      end

      # Modifies the endpoint encryption mode that allows you to configure the specified directory between
      # Standard TLS and FIPS 140-2 validated mode.
      def modify_endpoint_encryption_mode(
        directory_id : String,
        endpoint_encryption_mode : String
      ) : Types::ModifyEndpointEncryptionModeResponse
        input = Types::ModifyEndpointEncryptionModeRequest.new(directory_id: directory_id, endpoint_encryption_mode: endpoint_encryption_mode)
        modify_endpoint_encryption_mode(input)
      end
      def modify_endpoint_encryption_mode(input : Types::ModifyEndpointEncryptionModeRequest) : Types::ModifyEndpointEncryptionModeResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_ENDPOINT_ENCRYPTION_MODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyEndpointEncryptionModeResponse, "ModifyEndpointEncryptionMode")
      end

      # Modifies multiple properties related to SAML 2.0 authentication, including the enablement status,
      # user access URL, and relay state parameter name that are used for configuring federation with an
      # SAML 2.0 identity provider.
      def modify_saml_properties(
        resource_id : String,
        properties_to_delete : Array(String)? = nil,
        saml_properties : Types::SamlProperties? = nil
      ) : Types::ModifySamlPropertiesResult
        input = Types::ModifySamlPropertiesRequest.new(resource_id: resource_id, properties_to_delete: properties_to_delete, saml_properties: saml_properties)
        modify_saml_properties(input)
      end
      def modify_saml_properties(input : Types::ModifySamlPropertiesRequest) : Types::ModifySamlPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_SAML_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifySamlPropertiesResult, "ModifySamlProperties")
      end

      # Modifies the self-service WorkSpace management capabilities for your users. For more information,
      # see Enable Self-Service WorkSpace Management Capabilities for Your Users .
      def modify_selfservice_permissions(
        resource_id : String,
        selfservice_permissions : Types::SelfservicePermissions
      ) : Types::ModifySelfservicePermissionsResult
        input = Types::ModifySelfservicePermissionsRequest.new(resource_id: resource_id, selfservice_permissions: selfservice_permissions)
        modify_selfservice_permissions(input)
      end
      def modify_selfservice_permissions(input : Types::ModifySelfservicePermissionsRequest) : Types::ModifySelfservicePermissionsResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_SELFSERVICE_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifySelfservicePermissionsResult, "ModifySelfservicePermissions")
      end

      # Modifies the specified streaming properties.
      def modify_streaming_properties(
        resource_id : String,
        streaming_properties : Types::StreamingProperties? = nil
      ) : Types::ModifyStreamingPropertiesResult
        input = Types::ModifyStreamingPropertiesRequest.new(resource_id: resource_id, streaming_properties: streaming_properties)
        modify_streaming_properties(input)
      end
      def modify_streaming_properties(input : Types::ModifyStreamingPropertiesRequest) : Types::ModifyStreamingPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_STREAMING_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyStreamingPropertiesResult, "ModifyStreamingProperties")
      end

      # Specifies which devices and operating systems users can use to access their WorkSpaces. For more
      # information, see Control Device Access .
      def modify_workspace_access_properties(
        resource_id : String,
        workspace_access_properties : Types::WorkspaceAccessProperties
      ) : Types::ModifyWorkspaceAccessPropertiesResult
        input = Types::ModifyWorkspaceAccessPropertiesRequest.new(resource_id: resource_id, workspace_access_properties: workspace_access_properties)
        modify_workspace_access_properties(input)
      end
      def modify_workspace_access_properties(input : Types::ModifyWorkspaceAccessPropertiesRequest) : Types::ModifyWorkspaceAccessPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_WORKSPACE_ACCESS_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyWorkspaceAccessPropertiesResult, "ModifyWorkspaceAccessProperties")
      end

      # Modify the default properties used to create WorkSpaces.
      def modify_workspace_creation_properties(
        resource_id : String,
        workspace_creation_properties : Types::WorkspaceCreationProperties
      ) : Types::ModifyWorkspaceCreationPropertiesResult
        input = Types::ModifyWorkspaceCreationPropertiesRequest.new(resource_id: resource_id, workspace_creation_properties: workspace_creation_properties)
        modify_workspace_creation_properties(input)
      end
      def modify_workspace_creation_properties(input : Types::ModifyWorkspaceCreationPropertiesRequest) : Types::ModifyWorkspaceCreationPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_WORKSPACE_CREATION_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyWorkspaceCreationPropertiesResult, "ModifyWorkspaceCreationProperties")
      end

      # Modifies the specified WorkSpace properties. For important information about how to modify the size
      # of the root and user volumes, see Modify a WorkSpace . The MANUAL running mode value is only
      # supported by Amazon WorkSpaces Core. Contact your account team to be allow-listed to use this value.
      # For more information, see Amazon WorkSpaces Core .
      def modify_workspace_properties(
        workspace_id : String,
        data_replication : String? = nil,
        workspace_properties : Types::WorkspaceProperties? = nil
      ) : Types::ModifyWorkspacePropertiesResult
        input = Types::ModifyWorkspacePropertiesRequest.new(workspace_id: workspace_id, data_replication: data_replication, workspace_properties: workspace_properties)
        modify_workspace_properties(input)
      end
      def modify_workspace_properties(input : Types::ModifyWorkspacePropertiesRequest) : Types::ModifyWorkspacePropertiesResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_WORKSPACE_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyWorkspacePropertiesResult, "ModifyWorkspaceProperties")
      end

      # Sets the state of the specified WorkSpace. To maintain a WorkSpace without being interrupted, set
      # the WorkSpace state to ADMIN_MAINTENANCE . WorkSpaces in this state do not respond to requests to
      # reboot, stop, start, rebuild, or restore. An AutoStop WorkSpace in this state is not stopped. Users
      # cannot log into a WorkSpace in the ADMIN_MAINTENANCE state.
      def modify_workspace_state(
        workspace_id : String,
        workspace_state : String
      ) : Types::ModifyWorkspaceStateResult
        input = Types::ModifyWorkspaceStateRequest.new(workspace_id: workspace_id, workspace_state: workspace_state)
        modify_workspace_state(input)
      end
      def modify_workspace_state(input : Types::ModifyWorkspaceStateRequest) : Types::ModifyWorkspaceStateResult
        request = Protocol::JsonRpc.build_request(Model::MODIFY_WORKSPACE_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyWorkspaceStateResult, "ModifyWorkspaceState")
      end

      # Reboots the specified WorkSpaces. You cannot reboot a WorkSpace unless its state is AVAILABLE ,
      # UNHEALTHY , or REBOOTING . Reboot a WorkSpace in the REBOOTING state only if your WorkSpace has been
      # stuck in the REBOOTING state for over 20 minutes. This operation is asynchronous and returns before
      # the WorkSpaces have rebooted.
      def reboot_workspaces(
        reboot_workspace_requests : Array(Types::RebootRequest)
      ) : Types::RebootWorkspacesResult
        input = Types::RebootWorkspacesRequest.new(reboot_workspace_requests: reboot_workspace_requests)
        reboot_workspaces(input)
      end
      def reboot_workspaces(input : Types::RebootWorkspacesRequest) : Types::RebootWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::REBOOT_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootWorkspacesResult, "RebootWorkspaces")
      end

      # Rebuilds the specified WorkSpace. You cannot rebuild a WorkSpace unless its state is AVAILABLE ,
      # ERROR , UNHEALTHY , STOPPED , or REBOOTING . Rebuilding a WorkSpace is a potentially destructive
      # action that can result in the loss of data. For more information, see Rebuild a WorkSpace . This
      # operation is asynchronous and returns before the WorkSpaces have been completely rebuilt.
      def rebuild_workspaces(
        rebuild_workspace_requests : Array(Types::RebuildRequest)
      ) : Types::RebuildWorkspacesResult
        input = Types::RebuildWorkspacesRequest.new(rebuild_workspace_requests: rebuild_workspace_requests)
        rebuild_workspaces(input)
      end
      def rebuild_workspaces(input : Types::RebuildWorkspacesRequest) : Types::RebuildWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::REBUILD_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebuildWorkspacesResult, "RebuildWorkspaces")
      end

      # Registers the specified directory. This operation is asynchronous and returns before the WorkSpace
      # directory is registered. If this is the first time you are registering a directory, you will need to
      # create the workspaces_DefaultRole role before you can register a directory. For more information,
      # see Creating the workspaces_DefaultRole Role .
      def register_workspace_directory(
        active_directory_config : Types::ActiveDirectoryConfig? = nil,
        directory_id : String? = nil,
        enable_self_service : Bool? = nil,
        idc_instance_arn : String? = nil,
        microsoft_entra_config : Types::MicrosoftEntraConfig? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        tenancy : String? = nil,
        user_identity_type : String? = nil,
        workspace_directory_description : String? = nil,
        workspace_directory_name : String? = nil,
        workspace_type : String? = nil
      ) : Types::RegisterWorkspaceDirectoryResult
        input = Types::RegisterWorkspaceDirectoryRequest.new(active_directory_config: active_directory_config, directory_id: directory_id, enable_self_service: enable_self_service, idc_instance_arn: idc_instance_arn, microsoft_entra_config: microsoft_entra_config, subnet_ids: subnet_ids, tags: tags, tenancy: tenancy, user_identity_type: user_identity_type, workspace_directory_description: workspace_directory_description, workspace_directory_name: workspace_directory_name, workspace_type: workspace_type)
        register_workspace_directory(input)
      end
      def register_workspace_directory(input : Types::RegisterWorkspaceDirectoryRequest) : Types::RegisterWorkspaceDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_WORKSPACE_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterWorkspaceDirectoryResult, "RegisterWorkspaceDirectory")
      end

      # Rejects the account link invitation.
      def reject_account_link_invitation(
        link_id : String,
        client_token : String? = nil
      ) : Types::RejectAccountLinkInvitationResult
        input = Types::RejectAccountLinkInvitationRequest.new(link_id: link_id, client_token: client_token)
        reject_account_link_invitation(input)
      end
      def reject_account_link_invitation(input : Types::RejectAccountLinkInvitationRequest) : Types::RejectAccountLinkInvitationResult
        request = Protocol::JsonRpc.build_request(Model::REJECT_ACCOUNT_LINK_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectAccountLinkInvitationResult, "RejectAccountLinkInvitation")
      end

      # Restores the specified WorkSpace to its last known healthy state. You cannot restore a WorkSpace
      # unless its state is AVAILABLE , ERROR , UNHEALTHY , or STOPPED . Restoring a WorkSpace is a
      # potentially destructive action that can result in the loss of data. For more information, see
      # Restore a WorkSpace . This operation is asynchronous and returns before the WorkSpace is completely
      # restored.
      def restore_workspace(
        workspace_id : String
      ) : Types::RestoreWorkspaceResult
        input = Types::RestoreWorkspaceRequest.new(workspace_id: workspace_id)
        restore_workspace(input)
      end
      def restore_workspace(input : Types::RestoreWorkspaceRequest) : Types::RestoreWorkspaceResult
        request = Protocol::JsonRpc.build_request(Model::RESTORE_WORKSPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreWorkspaceResult, "RestoreWorkspace")
      end

      # Removes one or more rules from the specified IP access control group.
      def revoke_ip_rules(
        group_id : String,
        user_rules : Array(String)
      ) : Types::RevokeIpRulesResult
        input = Types::RevokeIpRulesRequest.new(group_id: group_id, user_rules: user_rules)
        revoke_ip_rules(input)
      end
      def revoke_ip_rules(input : Types::RevokeIpRulesRequest) : Types::RevokeIpRulesResult
        request = Protocol::JsonRpc.build_request(Model::REVOKE_IP_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RevokeIpRulesResult, "RevokeIpRules")
      end

      # Starts the specified WorkSpaces. You cannot start a WorkSpace unless it has a running mode of
      # AutoStop or Manual and a state of STOPPED .
      def start_workspaces(
        start_workspace_requests : Array(Types::StartRequest)
      ) : Types::StartWorkspacesResult
        input = Types::StartWorkspacesRequest.new(start_workspace_requests: start_workspace_requests)
        start_workspaces(input)
      end
      def start_workspaces(input : Types::StartWorkspacesRequest) : Types::StartWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::START_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartWorkspacesResult, "StartWorkspaces")
      end

      # Starts the specified pool. You cannot start a pool unless it has a running mode of AutoStop and a
      # state of STOPPED .
      def start_workspaces_pool(
        pool_id : String
      ) : Types::StartWorkspacesPoolResult
        input = Types::StartWorkspacesPoolRequest.new(pool_id: pool_id)
        start_workspaces_pool(input)
      end
      def start_workspaces_pool(input : Types::StartWorkspacesPoolRequest) : Types::StartWorkspacesPoolResult
        request = Protocol::JsonRpc.build_request(Model::START_WORKSPACES_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartWorkspacesPoolResult, "StartWorkspacesPool")
      end

      # Stops the specified WorkSpaces. You cannot stop a WorkSpace unless it has a running mode of AutoStop
      # or Manual and a state of AVAILABLE , IMPAIRED , UNHEALTHY , or ERROR .
      def stop_workspaces(
        stop_workspace_requests : Array(Types::StopRequest)
      ) : Types::StopWorkspacesResult
        input = Types::StopWorkspacesRequest.new(stop_workspace_requests: stop_workspace_requests)
        stop_workspaces(input)
      end
      def stop_workspaces(input : Types::StopWorkspacesRequest) : Types::StopWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::STOP_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopWorkspacesResult, "StopWorkspaces")
      end

      # Stops the specified pool. You cannot stop a WorkSpace pool unless it has a running mode of AutoStop
      # and a state of AVAILABLE , IMPAIRED , UNHEALTHY , or ERROR .
      def stop_workspaces_pool(
        pool_id : String
      ) : Types::StopWorkspacesPoolResult
        input = Types::StopWorkspacesPoolRequest.new(pool_id: pool_id)
        stop_workspaces_pool(input)
      end
      def stop_workspaces_pool(input : Types::StopWorkspacesPoolRequest) : Types::StopWorkspacesPoolResult
        request = Protocol::JsonRpc.build_request(Model::STOP_WORKSPACES_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopWorkspacesPoolResult, "StopWorkspacesPool")
      end

      # Terminates the specified WorkSpaces. Terminating a WorkSpace is a permanent action and cannot be
      # undone. The user's data is destroyed. If you need to archive any user data, contact Amazon Web
      # Services Support before terminating the WorkSpace. You can terminate a WorkSpace that is in any
      # state except SUSPENDED . This operation is asynchronous and returns before the WorkSpaces have been
      # completely terminated. After a WorkSpace is terminated, the TERMINATED state is returned only
      # briefly before the WorkSpace directory metadata is cleaned up, so this state is rarely returned. To
      # confirm that a WorkSpace is terminated, check for the WorkSpace ID by using DescribeWorkSpaces . If
      # the WorkSpace ID isn't returned, then the WorkSpace has been successfully terminated. Simple AD and
      # AD Connector are made available to you free of charge to use with WorkSpaces. If there are no
      # WorkSpaces being used with your Simple AD or AD Connector directory for 30 consecutive days, this
      # directory will be automatically deregistered for use with Amazon WorkSpaces, and you will be charged
      # for this directory as per the Directory Service pricing terms . To delete empty directories, see
      # Delete the Directory for Your WorkSpaces . If you delete your Simple AD or AD Connector directory,
      # you can always create a new one when you want to start using WorkSpaces again.
      def terminate_workspaces(
        terminate_workspace_requests : Array(Types::TerminateRequest)
      ) : Types::TerminateWorkspacesResult
        input = Types::TerminateWorkspacesRequest.new(terminate_workspace_requests: terminate_workspace_requests)
        terminate_workspaces(input)
      end
      def terminate_workspaces(input : Types::TerminateWorkspacesRequest) : Types::TerminateWorkspacesResult
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_WORKSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateWorkspacesResult, "TerminateWorkspaces")
      end

      # Terminates the specified pool.
      def terminate_workspaces_pool(
        pool_id : String
      ) : Types::TerminateWorkspacesPoolResult
        input = Types::TerminateWorkspacesPoolRequest.new(pool_id: pool_id)
        terminate_workspaces_pool(input)
      end
      def terminate_workspaces_pool(input : Types::TerminateWorkspacesPoolRequest) : Types::TerminateWorkspacesPoolResult
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_WORKSPACES_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateWorkspacesPoolResult, "TerminateWorkspacesPool")
      end

      # Terminates the pool session.
      def terminate_workspaces_pool_session(
        session_id : String
      ) : Types::TerminateWorkspacesPoolSessionResult
        input = Types::TerminateWorkspacesPoolSessionRequest.new(session_id: session_id)
        terminate_workspaces_pool_session(input)
      end
      def terminate_workspaces_pool_session(input : Types::TerminateWorkspacesPoolSessionRequest) : Types::TerminateWorkspacesPoolSessionResult
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_WORKSPACES_POOL_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateWorkspacesPoolSessionResult, "TerminateWorkspacesPoolSession")
      end

      # Updates a Amazon Connect client add-in. Use this action to update the name and endpoint URL of a
      # Amazon Connect client add-in.
      def update_connect_client_add_in(
        add_in_id : String,
        resource_id : String,
        name : String? = nil,
        url : String? = nil
      ) : Types::UpdateConnectClientAddInResult
        input = Types::UpdateConnectClientAddInRequest.new(add_in_id: add_in_id, resource_id: resource_id, name: name, url: url)
        update_connect_client_add_in(input)
      end
      def update_connect_client_add_in(input : Types::UpdateConnectClientAddInRequest) : Types::UpdateConnectClientAddInResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONNECT_CLIENT_ADD_IN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConnectClientAddInResult, "UpdateConnectClientAddIn")
      end

      # Shares or unshares a connection alias with one account by specifying whether that account has
      # permission to associate the connection alias with a directory. If the association permission is
      # granted, the connection alias is shared with that account. If the association permission is revoked,
      # the connection alias is unshared with the account. For more information, see Cross-Region
      # Redirection for Amazon WorkSpaces . Before performing this operation, call DescribeConnectionAliases
      # to make sure that the current state of the connection alias is CREATED . To delete a connection
      # alias that has been shared, the shared account must first disassociate the connection alias from any
      # directories it has been associated with. Then you must unshare the connection alias from the account
      # it has been shared with. You can delete a connection alias only after it is no longer shared with
      # any accounts or associated with any directories.
      def update_connection_alias_permission(
        alias_id : String,
        connection_alias_permission : Types::ConnectionAliasPermission
      ) : Types::UpdateConnectionAliasPermissionResult
        input = Types::UpdateConnectionAliasPermissionRequest.new(alias_id: alias_id, connection_alias_permission: connection_alias_permission)
        update_connection_alias_permission(input)
      end
      def update_connection_alias_permission(input : Types::UpdateConnectionAliasPermissionRequest) : Types::UpdateConnectionAliasPermissionResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONNECTION_ALIAS_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConnectionAliasPermissionResult, "UpdateConnectionAliasPermission")
      end

      # Replaces the current rules of the specified IP access control group with the specified rules.
      def update_rules_of_ip_group(
        group_id : String,
        user_rules : Array(Types::IpRuleItem)
      ) : Types::UpdateRulesOfIpGroupResult
        input = Types::UpdateRulesOfIpGroupRequest.new(group_id: group_id, user_rules: user_rules)
        update_rules_of_ip_group(input)
      end
      def update_rules_of_ip_group(input : Types::UpdateRulesOfIpGroupRequest) : Types::UpdateRulesOfIpGroupResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULES_OF_IP_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRulesOfIpGroupResult, "UpdateRulesOfIpGroup")
      end

      # Updates a WorkSpace bundle with a new image. For more information about updating WorkSpace bundles,
      # see Update a Custom WorkSpaces Bundle . Existing WorkSpaces aren't automatically updated when you
      # update the bundle that they're based on. To update existing WorkSpaces that are based on a bundle
      # that you've updated, you must either rebuild the WorkSpaces or delete and recreate them.
      def update_workspace_bundle(
        bundle_id : String? = nil,
        image_id : String? = nil
      ) : Types::UpdateWorkspaceBundleResult
        input = Types::UpdateWorkspaceBundleRequest.new(bundle_id: bundle_id, image_id: image_id)
        update_workspace_bundle(input)
      end
      def update_workspace_bundle(input : Types::UpdateWorkspaceBundleRequest) : Types::UpdateWorkspaceBundleResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKSPACE_BUNDLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkspaceBundleResult, "UpdateWorkspaceBundle")
      end

      # Shares or unshares an image with one account in the same Amazon Web Services Region by specifying
      # whether that account has permission to copy the image. If the copy image permission is granted, the
      # image is shared with that account. If the copy image permission is revoked, the image is unshared
      # with the account. After an image has been shared, the recipient account can copy the image to other
      # Regions as needed. In the China (Ningxia) Region, you can copy images only within the same Region.
      # In Amazon Web Services GovCloud (US), to copy images to and from other Regions, contact Amazon Web
      # Services Support. For more information about sharing images, see Share or Unshare a Custom
      # WorkSpaces Image . To delete an image that has been shared, you must unshare the image before you
      # delete it. Sharing Bring Your Own License (BYOL) images across Amazon Web Services accounts isn't
      # supported at this time in Amazon Web Services GovCloud (US). To share BYOL images across accounts in
      # Amazon Web Services GovCloud (US), contact Amazon Web Services Support.
      def update_workspace_image_permission(
        allow_copy_image : Bool,
        image_id : String,
        shared_account_id : String
      ) : Types::UpdateWorkspaceImagePermissionResult
        input = Types::UpdateWorkspaceImagePermissionRequest.new(allow_copy_image: allow_copy_image, image_id: image_id, shared_account_id: shared_account_id)
        update_workspace_image_permission(input)
      end
      def update_workspace_image_permission(input : Types::UpdateWorkspaceImagePermissionRequest) : Types::UpdateWorkspaceImagePermissionResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKSPACE_IMAGE_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkspaceImagePermissionResult, "UpdateWorkspaceImagePermission")
      end

      # Updates the specified pool.
      def update_workspaces_pool(
        pool_id : String,
        application_settings : Types::ApplicationSettingsRequest? = nil,
        bundle_id : String? = nil,
        capacity : Types::Capacity? = nil,
        description : String? = nil,
        directory_id : String? = nil,
        running_mode : String? = nil,
        timeout_settings : Types::TimeoutSettings? = nil
      ) : Types::UpdateWorkspacesPoolResult
        input = Types::UpdateWorkspacesPoolRequest.new(pool_id: pool_id, application_settings: application_settings, bundle_id: bundle_id, capacity: capacity, description: description, directory_id: directory_id, running_mode: running_mode, timeout_settings: timeout_settings)
        update_workspaces_pool(input)
      end
      def update_workspaces_pool(input : Types::UpdateWorkspacesPoolRequest) : Types::UpdateWorkspacesPoolResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKSPACES_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkspacesPoolResult, "UpdateWorkspacesPool")
      end
    end
  end
end
