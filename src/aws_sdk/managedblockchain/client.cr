module AwsSdk
  module ManagedBlockchain
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

      # Creates a new accessor for use with Amazon Managed Blockchain service that supports token based
      # access. The accessor contains information required for token based access.
      def create_accessor(
        accessor_type : String,
        client_request_token : String,
        network_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAccessorInput.new(accessor_type: accessor_type, client_request_token: client_request_token, network_type: network_type, tags: tags)
        create_accessor(input)
      end
      def create_accessor(input : Types::CreateAccessorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESSOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a member within a Managed Blockchain network. Applies only to Hyperledger Fabric.
      def create_member(
        client_request_token : String,
        invitation_id : String,
        member_configuration : Types::MemberConfiguration,
        network_id : String
      ) : Protocol::Request
        input = Types::CreateMemberInput.new(client_request_token: client_request_token, invitation_id: invitation_id, member_configuration: member_configuration, network_id: network_id)
        create_member(input)
      end
      def create_member(input : Types::CreateMemberInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new blockchain network using Amazon Managed Blockchain. Applies only to Hyperledger
      # Fabric.
      def create_network(
        client_request_token : String,
        framework : String,
        framework_version : String,
        member_configuration : Types::MemberConfiguration,
        name : String,
        voting_policy : Types::VotingPolicy,
        description : String? = nil,
        framework_configuration : Types::NetworkFrameworkConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateNetworkInput.new(client_request_token: client_request_token, framework: framework, framework_version: framework_version, member_configuration: member_configuration, name: name, voting_policy: voting_policy, description: description, framework_configuration: framework_configuration, tags: tags)
        create_network(input)
      end
      def create_network(input : Types::CreateNetworkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a node on the specified blockchain network. Applies to Hyperledger Fabric and Ethereum.
      def create_node(
        client_request_token : String,
        network_id : String,
        node_configuration : Types::NodeConfiguration,
        member_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateNodeInput.new(client_request_token: client_request_token, network_id: network_id, node_configuration: node_configuration, member_id: member_id, tags: tags)
        create_node(input)
      end
      def create_node(input : Types::CreateNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a proposal for a change to the network that other members of the network can vote on, for
      # example, a proposal to add a new member to the network. Any member can create a proposal. Applies
      # only to Hyperledger Fabric.
      def create_proposal(
        actions : Types::ProposalActions,
        client_request_token : String,
        member_id : String,
        network_id : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProposalInput.new(actions: actions, client_request_token: client_request_token, member_id: member_id, network_id: network_id, description: description, tags: tags)
        create_proposal(input)
      end
      def create_proposal(input : Types::CreateProposalInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROPOSAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an accessor that your Amazon Web Services account owns. An accessor object is a container
      # that has the information required for token based access to your Ethereum nodes including, the
      # BILLING_TOKEN . After an accessor is deleted, the status of the accessor changes from AVAILABLE to
      # PENDING_DELETION . An accessor in the PENDING_DELETION state can’t be used for new WebSocket
      # requests or HTTP requests. However, WebSocket connections that were initiated while the accessor was
      # in the AVAILABLE state remain open until they expire (up to 2 hours).
      def delete_accessor(
        accessor_id : String
      ) : Protocol::Request
        input = Types::DeleteAccessorInput.new(accessor_id: accessor_id)
        delete_accessor(input)
      end
      def delete_accessor(input : Types::DeleteAccessorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESSOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a member. Deleting a member removes the member and all associated resources from the
      # network. DeleteMember can only be called for a specified MemberId if the principal performing the
      # action is associated with the Amazon Web Services account that owns the member. In all other cases,
      # the DeleteMember action is carried out as the result of an approved proposal to remove a member. If
      # MemberId is the last member in a network specified by the last Amazon Web Services account, the
      # network is deleted also. Applies only to Hyperledger Fabric.
      def delete_member(
        member_id : String,
        network_id : String
      ) : Protocol::Request
        input = Types::DeleteMemberInput.new(member_id: member_id, network_id: network_id)
        delete_member(input)
      end
      def delete_member(input : Types::DeleteMemberInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a node that your Amazon Web Services account owns. All data on the node is lost and cannot
      # be recovered. Applies to Hyperledger Fabric and Ethereum.
      def delete_node(
        network_id : String,
        node_id : String,
        member_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteNodeInput.new(network_id: network_id, node_id: node_id, member_id: member_id)
        delete_node(input)
      end
      def delete_node(input : Types::DeleteNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about an accessor. An accessor object is a container that has the
      # information required for token based access to your Ethereum nodes.
      def get_accessor(
        accessor_id : String
      ) : Protocol::Request
        input = Types::GetAccessorInput.new(accessor_id: accessor_id)
        get_accessor(input)
      end
      def get_accessor(input : Types::GetAccessorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCESSOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about a member. Applies only to Hyperledger Fabric.
      def get_member(
        member_id : String,
        network_id : String
      ) : Protocol::Request
        input = Types::GetMemberInput.new(member_id: member_id, network_id: network_id)
        get_member(input)
      end
      def get_member(input : Types::GetMemberInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about a network. Applies to Hyperledger Fabric and Ethereum.
      def get_network(
        network_id : String
      ) : Protocol::Request
        input = Types::GetNetworkInput.new(network_id: network_id)
        get_network(input)
      end
      def get_network(input : Types::GetNetworkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about a node. Applies to Hyperledger Fabric and Ethereum.
      def get_node(
        network_id : String,
        node_id : String,
        member_id : String? = nil
      ) : Protocol::Request
        input = Types::GetNodeInput.new(network_id: network_id, node_id: node_id, member_id: member_id)
        get_node(input)
      end
      def get_node(input : Types::GetNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about a proposal. Applies only to Hyperledger Fabric.
      def get_proposal(
        network_id : String,
        proposal_id : String
      ) : Protocol::Request
        input = Types::GetProposalInput.new(network_id: network_id, proposal_id: proposal_id)
        get_proposal(input)
      end
      def get_proposal(input : Types::GetProposalInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROPOSAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the accessors and their properties. Accessor objects are containers that have the
      # information required for token based access to your Ethereum nodes.
      def list_accessors(
        max_results : Int32? = nil,
        network_type : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessorsInput.new(max_results: max_results, network_type: network_type, next_token: next_token)
        list_accessors(input)
      end
      def list_accessors(input : Types::ListAccessorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESSORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all invitations for the current Amazon Web Services account. Applies only to
      # Hyperledger Fabric.
      def list_invitations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvitationsInput.new(max_results: max_results, next_token: next_token)
        list_invitations(input)
      end
      def list_invitations(input : Types::ListInvitationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the members in a network and properties of their configurations. Applies only to
      # Hyperledger Fabric.
      def list_members(
        network_id : String,
        is_owned : Bool? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListMembersInput.new(network_id: network_id, is_owned: is_owned, max_results: max_results, name: name, next_token: next_token, status: status)
        list_members(input)
      end
      def list_members(input : Types::ListMembersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the networks in which the current Amazon Web Services account
      # participates. Applies to Hyperledger Fabric and Ethereum.
      def list_networks(
        framework : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListNetworksInput.new(framework: framework, max_results: max_results, name: name, next_token: next_token, status: status)
        list_networks(input)
      end
      def list_networks(input : Types::ListNetworksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NETWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the nodes within a network. Applies to Hyperledger Fabric and Ethereum.
      def list_nodes(
        network_id : String,
        max_results : Int32? = nil,
        member_id : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListNodesInput.new(network_id: network_id, max_results: max_results, member_id: member_id, next_token: next_token, status: status)
        list_nodes(input)
      end
      def list_nodes(input : Types::ListNodesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NODES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of votes for a specified proposal, including the value of each vote and the unique
      # identifier of the member that cast the vote. Applies only to Hyperledger Fabric.
      def list_proposal_votes(
        network_id : String,
        proposal_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProposalVotesInput.new(network_id: network_id, proposal_id: proposal_id, max_results: max_results, next_token: next_token)
        list_proposal_votes(input)
      end
      def list_proposal_votes(input : Types::ListProposalVotesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROPOSAL_VOTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of proposals for the network. Applies only to Hyperledger Fabric.
      def list_proposals(
        network_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProposalsInput.new(network_id: network_id, max_results: max_results, next_token: next_token)
        list_proposals(input)
      end
      def list_proposals(input : Types::ListProposalsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROPOSALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for the specified resource. Each tag consists of a key and optional value.
      # For more information about tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum
      # Developer Guide , or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer
      # Guide .
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

      # Rejects an invitation to join a network. This action can be called by a principal in an Amazon Web
      # Services account that has received an invitation to create a member and join a network. Applies only
      # to Hyperledger Fabric.
      def reject_invitation(
        invitation_id : String
      ) : Protocol::Request
        input = Types::RejectInvitationInput.new(invitation_id: invitation_id)
        reject_invitation(input)
      end
      def reject_invitation(input : Types::RejectInvitationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or overwrites the specified tags for the specified Amazon Managed Blockchain resource. Each tag
      # consists of a key and optional value. When you specify a tag key that already exists, the tag value
      # is overwritten with the new value. Use UntagResource to remove tag keys. A resource can have up to
      # 50 tags. If you try to create more than 50 tags for a resource, your request fails and returns an
      # error. For more information about tags, see Tagging Resources in the Amazon Managed Blockchain
      # Ethereum Developer Guide , or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric
      # Developer Guide .
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

      # Removes the specified tags from the Amazon Managed Blockchain resource. For more information about
      # tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide , or Tagging
      # Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide .
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

      # Updates a member configuration with new parameters. Applies only to Hyperledger Fabric.
      def update_member(
        member_id : String,
        network_id : String,
        log_publishing_configuration : Types::MemberLogPublishingConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateMemberInput.new(member_id: member_id, network_id: network_id, log_publishing_configuration: log_publishing_configuration)
        update_member(input)
      end
      def update_member(input : Types::UpdateMemberInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a node configuration with new parameters. Applies only to Hyperledger Fabric.
      def update_node(
        network_id : String,
        node_id : String,
        log_publishing_configuration : Types::NodeLogPublishingConfiguration? = nil,
        member_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateNodeInput.new(network_id: network_id, node_id: node_id, log_publishing_configuration: log_publishing_configuration, member_id: member_id)
        update_node(input)
      end
      def update_node(input : Types::UpdateNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Casts a vote for a specified ProposalId on behalf of a member. The member to vote as, specified by
      # VoterMemberId , must be in the same Amazon Web Services account as the principal that calls the
      # action. Applies only to Hyperledger Fabric.
      def vote_on_proposal(
        network_id : String,
        proposal_id : String,
        vote : String,
        voter_member_id : String
      ) : Protocol::Request
        input = Types::VoteOnProposalInput.new(network_id: network_id, proposal_id: proposal_id, vote: vote, voter_member_id: voter_member_id)
        vote_on_proposal(input)
      end
      def vote_on_proposal(input : Types::VoteOnProposalInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VOTE_ON_PROPOSAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
