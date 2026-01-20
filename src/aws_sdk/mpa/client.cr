module AwsSdk
  module MPA
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

      # Cancels an approval session. For more information, see Session in the Multi-party approval User
      # Guide .

      def cancel_session(
        session_arn : String
      ) : Protocol::Request
        input = Types::CancelSessionRequest.new(session_arn: session_arn)
        cancel_session(input)
      end

      def cancel_session(input : Types::CancelSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new approval team. For more information, see Approval team in the Multi-party approval
      # User Guide .

      def create_approval_team(
        approval_strategy : Types::ApprovalStrategy,
        approvers : Array(Types::ApprovalTeamRequestApprover),
        description : String,
        name : String,
        policies : Array(Types::PolicyReference),
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApprovalTeamRequest.new(approval_strategy: approval_strategy, approvers: approvers, description: description, name: name, policies: policies, client_token: client_token, tags: tags)
        create_approval_team(input)
      end

      def create_approval_team(input : Types::CreateApprovalTeamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPROVAL_TEAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new identity source. For more information, see Identity Source in the Multi-party approval
      # User Guide .

      def create_identity_source(
        identity_source_parameters : Types::IdentitySourceParameters,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIdentitySourceRequest.new(identity_source_parameters: identity_source_parameters, client_token: client_token, tags: tags)
        create_identity_source(input)
      end

      def create_identity_source(input : Types::CreateIdentitySourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IDENTITY_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an identity source. For more information, see Identity Source in the Multi-party approval
      # User Guide .

      def delete_identity_source(
        identity_source_arn : String
      ) : Protocol::Request
        input = Types::DeleteIdentitySourceRequest.new(identity_source_arn: identity_source_arn)
        delete_identity_source(input)
      end

      def delete_identity_source(input : Types::DeleteIdentitySourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IDENTITY_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an inactive approval team. For more information, see Team health in the Multi-party approval
      # User Guide . You can also use this operation to delete a team draft. For more information, see
      # Interacting with drafts in the Multi-party approval User Guide .

      def delete_inactive_approval_team_version(
        arn : String,
        version_id : String
      ) : Protocol::Request
        input = Types::DeleteInactiveApprovalTeamVersionRequest.new(arn: arn, version_id: version_id)
        delete_inactive_approval_team_version(input)
      end

      def delete_inactive_approval_team_version(input : Types::DeleteInactiveApprovalTeamVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INACTIVE_APPROVAL_TEAM_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details for an approval team.

      def get_approval_team(
        arn : String
      ) : Protocol::Request
        input = Types::GetApprovalTeamRequest.new(arn: arn)
        get_approval_team(input)
      end

      def get_approval_team(input : Types::GetApprovalTeamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPROVAL_TEAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details for an identity source. For more information, see Identity Source in the Multi-party
      # approval User Guide .

      def get_identity_source(
        identity_source_arn : String
      ) : Protocol::Request
        input = Types::GetIdentitySourceRequest.new(identity_source_arn: identity_source_arn)
        get_identity_source(input)
      end

      def get_identity_source(input : Types::GetIdentitySourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IDENTITY_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details for the version of a policy. Policies define the permissions for team resources. The
      # protected operation for a service integration might require specific permissions. For more
      # information, see How other services work with Multi-party approval in the Multi-party approval User
      # Guide .

      def get_policy_version(
        policy_version_arn : String
      ) : Protocol::Request
        input = Types::GetPolicyVersionRequest.new(policy_version_arn: policy_version_arn)
        get_policy_version(input)
      end

      def get_policy_version(input : Types::GetPolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about a policy for a resource.

      def get_resource_policy(
        policy_name : String,
        policy_type : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(policy_name: policy_name, policy_type: policy_type, resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details for an approval session. For more information, see Session in the Multi-party
      # approval User Guide .

      def get_session(
        session_arn : String
      ) : Protocol::Request
        input = Types::GetSessionRequest.new(session_arn: session_arn)
        get_session(input)
      end

      def get_session(input : Types::GetSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of approval teams.

      def list_approval_teams(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApprovalTeamsRequest.new(max_results: max_results, next_token: next_token)
        list_approval_teams(input)
      end

      def list_approval_teams(input : Types::ListApprovalTeamsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPROVAL_TEAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of identity sources. For more information, see Identity Source in the Multi-party
      # approval User Guide .

      def list_identity_sources(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdentitySourcesRequest.new(max_results: max_results, next_token: next_token)
        list_identity_sources(input)
      end

      def list_identity_sources(input : Types::ListIdentitySourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IDENTITY_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of policies. Policies define the permissions for team resources. The protected
      # operation for a service integration might require specific permissions. For more information, see
      # How other services work with Multi-party approval in the Multi-party approval User Guide .

      def list_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_policies(input)
      end

      def list_policies(input : Types::ListPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the versions for policies. Policies define the permissions for team resources. The
      # protected operation for a service integration might require specific permissions. For more
      # information, see How other services work with Multi-party approval in the Multi-party approval User
      # Guide .

      def list_policy_versions(
        policy_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPolicyVersionsRequest.new(policy_arn: policy_arn, max_results: max_results, next_token: next_token)
        list_policy_versions(input)
      end

      def list_policy_versions(input : Types::ListPolicyVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of policies for a resource.

      def list_resource_policies(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourcePoliciesRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_resource_policies(input)
      end

      def list_resource_policies(input : Types::ListResourcePoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of approval sessions. For more information, see Session in the Multi-party approval
      # User Guide .

      def list_sessions(
        approval_team_arn : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionsRequest.new(approval_team_arn: approval_team_arn, filters: filters, max_results: max_results, next_token: next_token)
        list_sessions(input)
      end

      def list_sessions(input : Types::ListSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags for a resource.

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

      # Starts the deletion process for an active approval team. Deletions require team approval Requests to
      # delete an active team must be approved by the team.

      def start_active_approval_team_deletion(
        arn : String,
        pending_window_days : Int32? = nil
      ) : Protocol::Request
        input = Types::StartActiveApprovalTeamDeletionRequest.new(arn: arn, pending_window_days: pending_window_days)
        start_active_approval_team_deletion(input)
      end

      def start_active_approval_team_deletion(input : Types::StartActiveApprovalTeamDeletionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ACTIVE_APPROVAL_TEAM_DELETION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates a resource tag. Each tag is a label consisting of a user-defined key and value.
      # Tags can help you manage, identify, organize, search for, and filter resources.

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

      # Removes a resource tag. Each tag is a label consisting of a user-defined key and value. Tags can
      # help you manage, identify, organize, search for, and filter resources.

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

      # Updates an approval team. You can request to update the team description, approval threshold, and
      # approvers in the team. Updates require team approval Updates to an active team must be approved by
      # the team.

      def update_approval_team(
        arn : String,
        approval_strategy : Types::ApprovalStrategy? = nil,
        approvers : Array(Types::ApprovalTeamRequestApprover)? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApprovalTeamRequest.new(arn: arn, approval_strategy: approval_strategy, approvers: approvers, description: description)
        update_approval_team(input)
      end

      def update_approval_team(input : Types::UpdateApprovalTeamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPROVAL_TEAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
