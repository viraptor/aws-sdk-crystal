module AwsSdk
  module Detective
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
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Accepts an invitation for the member account to contribute data to a behavior graph. This operation
      # can only be called by an invited member account. The request provides the ARN of behavior graph. The
      # member account status in the graph must be INVITED .

      def accept_invitation(
        graph_arn : String
      ) : Protocol::Request
        input = Types::AcceptInvitationRequest.new(graph_arn: graph_arn)
        accept_invitation(input)
      end

      def accept_invitation(input : Types::AcceptInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets data source package information for the behavior graph.

      def batch_get_graph_member_datasources(
        account_ids : Array(String),
        graph_arn : String
      ) : Protocol::Request
        input = Types::BatchGetGraphMemberDatasourcesRequest.new(account_ids: account_ids, graph_arn: graph_arn)
        batch_get_graph_member_datasources(input)
      end

      def batch_get_graph_member_datasources(input : Types::BatchGetGraphMemberDatasourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_GRAPH_MEMBER_DATASOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information on the data source package history for an account.

      def batch_get_membership_datasources(
        graph_arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetMembershipDatasourcesRequest.new(graph_arns: graph_arns)
        batch_get_membership_datasources(input)
      end

      def batch_get_membership_datasources(input : Types::BatchGetMembershipDatasourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_MEMBERSHIP_DATASOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new behavior graph for the calling account, and sets that account as the administrator
      # account. This operation is called by the account that is enabling Detective. The operation also
      # enables Detective for the calling account in the currently selected Region. It returns the ARN of
      # the new behavior graph. CreateGraph triggers a process to create the corresponding data tables for
      # the new behavior graph. An account can only be the administrator account for one behavior graph
      # within a Region. If the same account calls CreateGraph with the same administrator account, it
      # always returns the same behavior graph ARN. It does not create a new behavior graph.

      def create_graph(
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGraphRequest.new(tags: tags)
        create_graph(input)
      end

      def create_graph(input : Types::CreateGraphRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # CreateMembers is used to send invitations to accounts. For the organization behavior graph, the
      # Detective administrator account uses CreateMembers to enable organization accounts as member
      # accounts. For invited accounts, CreateMembers sends a request to invite the specified Amazon Web
      # Services accounts to be member accounts in the behavior graph. This operation can only be called by
      # the administrator account for a behavior graph. CreateMembers verifies the accounts and then invites
      # the verified accounts. The administrator can optionally specify to not send invitation emails to the
      # member accounts. This would be used when the administrator manages their member accounts centrally.
      # For organization accounts in the organization behavior graph, CreateMembers attempts to enable the
      # accounts. The organization accounts do not receive invitations. The request provides the behavior
      # graph ARN and the list of accounts to invite or to enable. The response separates the requested
      # accounts into two lists: The accounts that CreateMembers was able to process. For invited accounts,
      # includes member accounts that are being verified, that have passed verification and are to be
      # invited, and that have failed verification. For organization accounts in the organization behavior
      # graph, includes accounts that can be enabled and that cannot be enabled. The accounts that
      # CreateMembers was unable to process. This list includes accounts that were already invited to be
      # member accounts in the behavior graph.

      def create_members(
        accounts : Array(Types::Account),
        graph_arn : String,
        disable_email_notification : Bool? = nil,
        message : String? = nil
      ) : Protocol::Request
        input = Types::CreateMembersRequest.new(accounts: accounts, graph_arn: graph_arn, disable_email_notification: disable_email_notification, message: message)
        create_members(input)
      end

      def create_members(input : Types::CreateMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the specified behavior graph and queues it to be deleted. This operation removes the
      # behavior graph from each member account's list of behavior graphs. DeleteGraph can only be called by
      # the administrator account for a behavior graph.

      def delete_graph(
        graph_arn : String
      ) : Protocol::Request
        input = Types::DeleteGraphRequest.new(graph_arn: graph_arn)
        delete_graph(input)
      end

      def delete_graph(input : Types::DeleteGraphRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified member accounts from the behavior graph. The removed accounts no longer
      # contribute data to the behavior graph. This operation can only be called by the administrator
      # account for the behavior graph. For invited accounts, the removed accounts are deleted from the list
      # of accounts in the behavior graph. To restore the account, the administrator account must send
      # another invitation. For organization accounts in the organization behavior graph, the Detective
      # administrator account can always enable the organization account again. Organization accounts that
      # are not enabled as member accounts are not included in the ListMembers results for the organization
      # behavior graph. An administrator account cannot use DeleteMembers to remove their own account from
      # the behavior graph. To disable a behavior graph, the administrator account uses the DeleteGraph API
      # method.

      def delete_members(
        account_ids : Array(String),
        graph_arn : String
      ) : Protocol::Request
        input = Types::DeleteMembersRequest.new(account_ids: account_ids, graph_arn: graph_arn)
        delete_members(input)
      end

      def delete_members(input : Types::DeleteMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the configuration for the organization behavior graph. Currently indicates
      # whether to automatically enable new organization accounts as member accounts. Can only be called by
      # the Detective administrator account for the organization.

      def describe_organization_configuration(
        graph_arn : String
      ) : Protocol::Request
        input = Types::DescribeOrganizationConfigurationRequest.new(graph_arn: graph_arn)
        describe_organization_configuration(input)
      end

      def describe_organization_configuration(input : Types::DescribeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the Detective administrator account in the current Region. Deletes the organization behavior
      # graph. Can only be called by the organization management account. Removing the Detective
      # administrator account does not affect the delegated administrator account for Detective in
      # Organizations. To remove the delegated administrator account in Organizations, use the Organizations
      # API. Removing the delegated administrator account also removes the Detective administrator account
      # in all Regions, except for Regions where the Detective administrator account is the organization
      # management account.


      def disable_organization_admin_account : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_ORGANIZATION_ADMIN_ACCOUNT, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the member account from the specified behavior graph. This operation can only be called by
      # an invited member account that has the ENABLED status. DisassociateMembership cannot be called by an
      # organization account in the organization behavior graph. For the organization behavior graph, the
      # Detective administrator account determines which organization accounts to enable or disable as
      # member accounts.

      def disassociate_membership(
        graph_arn : String
      ) : Protocol::Request
        input = Types::DisassociateMembershipRequest.new(graph_arn: graph_arn)
        disassociate_membership(input)
      end

      def disassociate_membership(input : Types::DisassociateMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Designates the Detective administrator account for the organization in the current Region. If the
      # account does not have Detective enabled, then enables Detective for that account and creates a new
      # behavior graph. Can only be called by the organization management account. If the organization has a
      # delegated administrator account in Organizations, then the Detective administrator account must be
      # either the delegated administrator account or the organization management account. If the
      # organization does not have a delegated administrator account in Organizations, then you can choose
      # any account in the organization. If you choose an account other than the organization management
      # account, Detective calls Organizations to make that account the delegated administrator account for
      # Detective. The organization management account cannot be the delegated administrator account.

      def enable_organization_admin_account(
        account_id : String
      ) : Protocol::Request
        input = Types::EnableOrganizationAdminAccountRequest.new(account_id: account_id)
        enable_organization_admin_account(input)
      end

      def enable_organization_admin_account(input : Types::EnableOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detective investigations lets you investigate IAM users and IAM roles using indicators of
      # compromise. An indicator of compromise (IOC) is an artifact observed in or on a network, system, or
      # environment that can (with a high level of confidence) identify malicious activity or a security
      # incident. GetInvestigation returns the investigation results of an investigation for a behavior
      # graph.

      def get_investigation(
        graph_arn : String,
        investigation_id : String
      ) : Protocol::Request
        input = Types::GetInvestigationRequest.new(graph_arn: graph_arn, investigation_id: investigation_id)
        get_investigation(input)
      end

      def get_investigation(input : Types::GetInvestigationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INVESTIGATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the membership details for specified member accounts for a behavior graph.

      def get_members(
        account_ids : Array(String),
        graph_arn : String
      ) : Protocol::Request
        input = Types::GetMembersRequest.new(account_ids: account_ids, graph_arn: graph_arn)
        get_members(input)
      end

      def get_members(input : Types::GetMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists data source packages in the behavior graph.

      def list_datasource_packages(
        graph_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatasourcePackagesRequest.new(graph_arn: graph_arn, max_results: max_results, next_token: next_token)
        list_datasource_packages(input)
      end

      def list_datasource_packages(input : Types::ListDatasourcePackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASOURCE_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of behavior graphs that the calling account is an administrator account of. This
      # operation can only be called by an administrator account. Because an account can currently only be
      # the administrator of one behavior graph within a Region, the results always contain a single
      # behavior graph.

      def list_graphs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGraphsRequest.new(max_results: max_results, next_token: next_token)
        list_graphs(input)
      end

      def list_graphs(input : Types::ListGraphsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GRAPHS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the indicators from an investigation. You can use the information from the indicators to
      # determine if an IAM user and/or IAM role is involved in an unusual activity that could indicate
      # malicious behavior and its impact.

      def list_indicators(
        graph_arn : String,
        investigation_id : String,
        indicator_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIndicatorsRequest.new(graph_arn: graph_arn, investigation_id: investigation_id, indicator_type: indicator_type, max_results: max_results, next_token: next_token)
        list_indicators(input)
      end

      def list_indicators(input : Types::ListIndicatorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDICATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detective investigations lets you investigate IAM users and IAM roles using indicators of
      # compromise. An indicator of compromise (IOC) is an artifact observed in or on a network, system, or
      # environment that can (with a high level of confidence) identify malicious activity or a security
      # incident. ListInvestigations lists all active Detective investigations.

      def list_investigations(
        graph_arn : String,
        filter_criteria : Types::FilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListInvestigationsRequest.new(graph_arn: graph_arn, filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        list_investigations(input)
      end

      def list_investigations(input : Types::ListInvestigationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVESTIGATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of open and accepted behavior graph invitations for the member account. This
      # operation can only be called by an invited member account. Open invitations are invitations that the
      # member account has not responded to. The results do not include behavior graphs for which the member
      # account declined the invitation. The results also do not include behavior graphs that the member
      # account resigned from or was removed from.

      def list_invitations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvitationsRequest.new(max_results: max_results, next_token: next_token)
        list_invitations(input)
      end

      def list_invitations(input : Types::ListInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of member accounts for a behavior graph. For invited accounts, the results do not
      # include member accounts that were removed from the behavior graph. For the organization behavior
      # graph, the results do not include organization accounts that the Detective administrator account has
      # not enabled as member accounts.

      def list_members(
        graph_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMembersRequest.new(graph_arn: graph_arn, max_results: max_results, next_token: next_token)
        list_members(input)
      end

      def list_members(input : Types::ListMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the Detective administrator account for an organization. Can only be
      # called by the organization management account.

      def list_organization_admin_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationAdminAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_organization_admin_accounts(input)
      end

      def list_organization_admin_accounts(input : Types::ListOrganizationAdminAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_ADMIN_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the tag values that are assigned to a behavior graph.

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

      # Rejects an invitation to contribute the account data to a behavior graph. This operation must be
      # called by an invited member account that has the INVITED status. RejectInvitation cannot be called
      # by an organization account in the organization behavior graph. In the organization behavior graph,
      # organization accounts do not receive an invitation.

      def reject_invitation(
        graph_arn : String
      ) : Protocol::Request
        input = Types::RejectInvitationRequest.new(graph_arn: graph_arn)
        reject_invitation(input)
      end

      def reject_invitation(input : Types::RejectInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detective investigations lets you investigate IAM users and IAM roles using indicators of
      # compromise. An indicator of compromise (IOC) is an artifact observed in or on a network, system, or
      # environment that can (with a high level of confidence) identify malicious activity or a security
      # incident. StartInvestigation initiates an investigation on an entity in a behavior graph.

      def start_investigation(
        entity_arn : String,
        graph_arn : String,
        scope_end_time : Time,
        scope_start_time : Time
      ) : Protocol::Request
        input = Types::StartInvestigationRequest.new(entity_arn: entity_arn, graph_arn: graph_arn, scope_end_time: scope_end_time, scope_start_time: scope_start_time)
        start_investigation(input)
      end

      def start_investigation(input : Types::StartInvestigationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INVESTIGATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a request to enable data ingest for a member account that has a status of
      # ACCEPTED_BUT_DISABLED . For valid member accounts, the status is updated as follows. If Detective
      # enabled the member account, then the new status is ENABLED . If Detective cannot enable the member
      # account, the status remains ACCEPTED_BUT_DISABLED .

      def start_monitoring_member(
        account_id : String,
        graph_arn : String
      ) : Protocol::Request
        input = Types::StartMonitoringMemberRequest.new(account_id: account_id, graph_arn: graph_arn)
        start_monitoring_member(input)
      end

      def start_monitoring_member(input : Types::StartMonitoringMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MONITORING_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies tag values to a behavior graph.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a behavior graph.

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

      # Starts a data source package for the Detective behavior graph.

      def update_datasource_packages(
        datasource_packages : Array(String),
        graph_arn : String
      ) : Protocol::Request
        input = Types::UpdateDatasourcePackagesRequest.new(datasource_packages: datasource_packages, graph_arn: graph_arn)
        update_datasource_packages(input)
      end

      def update_datasource_packages(input : Types::UpdateDatasourcePackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATASOURCE_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the state of an investigation.

      def update_investigation_state(
        graph_arn : String,
        investigation_id : String,
        state : String
      ) : Protocol::Request
        input = Types::UpdateInvestigationStateRequest.new(graph_arn: graph_arn, investigation_id: investigation_id, state: state)
        update_investigation_state(input)
      end

      def update_investigation_state(input : Types::UpdateInvestigationStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INVESTIGATION_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration for the Organizations integration in the current Region. Can only be
      # called by the Detective administrator account for the organization.

      def update_organization_configuration(
        graph_arn : String,
        auto_enable : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateOrganizationConfigurationRequest.new(graph_arn: graph_arn, auto_enable: auto_enable)
        update_organization_configuration(input)
      end

      def update_organization_configuration(input : Types::UpdateOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
