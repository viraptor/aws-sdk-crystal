require "json"
require "time"

module AwsSdk
  module ManagedBlockchain
    module Types

      # You don't have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The properties of the Accessor.
      struct Accessor
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accessor. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The billing token is a property of the Accessor. Use this token to when making calls to the
        # blockchain network. The billing token is used to track your accessor token for billing requests.
        @[JSON::Field(key: "BillingToken")]
        getter billing_token : String?

        # The creation date and time of the accessor.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The unique identifier of the accessor.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The blockchain network that the Accessor token is created for.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The current status of the accessor.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tags assigned to the Accessor. For more information about tags, see Tagging Resources in the
        # Amazon Managed Blockchain Ethereum Developer Guide , or Tagging Resources in the Amazon Managed
        # Blockchain Hyperledger Fabric Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The type of the accessor. Currently, accessor type is restricted to BILLING_TOKEN .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @billing_token : String? = nil,
          @creation_date : Time? = nil,
          @id : String? = nil,
          @network_type : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # A summary of accessor properties.
      struct AccessorSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accessor. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The creation date and time of the accessor.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The unique identifier of the accessor.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The blockchain network that the Accessor token is created for.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The current status of the accessor.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of the accessor. Currently accessor type is restricted to BILLING_TOKEN .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @id : String? = nil,
          @network_type : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A policy type that defines the voting rules for the network. The rules decide if a proposal is
      # approved. Approval may be based on criteria such as the percentage of YES votes and the duration of
      # the proposal. The policy applies to all proposals and is specified when the network is created.
      # Applies only to Hyperledger Fabric.
      struct ApprovalThresholdPolicy
        include JSON::Serializable

        # The duration from the time that a proposal is created until it expires. If members cast neither the
        # required number of YES votes to approve the proposal nor the number of NO votes required to reject
        # it before the duration expires, the proposal is EXPIRED and ProposalActions aren't carried out.
        @[JSON::Field(key: "ProposalDurationInHours")]
        getter proposal_duration_in_hours : Int32?

        # Determines whether the vote percentage must be greater than the ThresholdPercentage or must be
        # greater than or equal to the ThresholdPercentage to be approved.
        @[JSON::Field(key: "ThresholdComparator")]
        getter threshold_comparator : String?

        # The percentage of votes among all members that must be YES for a proposal to be approved. For
        # example, a ThresholdPercentage value of 50 indicates 50%. The ThresholdComparator determines the
        # precise comparison. If a ThresholdPercentage value of 50 is specified on a network with 10 members,
        # along with a ThresholdComparator value of GREATER_THAN , this indicates that 6 YES votes are
        # required for the proposal to be approved.
        @[JSON::Field(key: "ThresholdPercentage")]
        getter threshold_percentage : Int32?

        def initialize(
          @proposal_duration_in_hours : Int32? = nil,
          @threshold_comparator : String? = nil,
          @threshold_percentage : Int32? = nil
        )
        end
      end

      struct CreateAccessorInput
        include JSON::Serializable

        # The type of accessor. Currently, accessor type is restricted to BILLING_TOKEN .
        @[JSON::Field(key: "AccessorType")]
        getter accessor_type : String

        # This is a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # operation. An idempotent operation completes no more than once. This identifier is required only if
        # you make a service request directly using an HTTP client. It is generated automatically if you use
        # an Amazon Web Services SDK or the Amazon Web Services CLI.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The blockchain network that the Accessor token is created for. Use the actual networkType value for
        # the blockchain network that you are creating the Accessor token for. With the shut down of the
        # Ethereum Goerli and Polygon Mumbai Testnet networks the following networkType values are no longer
        # available for selection and use. ETHEREUM_MAINNET_AND_GOERLI ETHEREUM_GOERLI POLYGON_MUMBAI However,
        # your existing Accessor tokens with these networkType values will remain unchanged.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # Tags to assign to the Accessor. Each tag consists of a key and an optional value. You can specify
        # multiple key-value pairs in a single request with an overall maximum of 50 tags allowed per
        # resource. For more information about tags, see Tagging Resources in the Amazon Managed Blockchain
        # Ethereum Developer Guide , or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric
        # Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @accessor_type : String,
          @client_request_token : String,
          @network_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAccessorOutput
        include JSON::Serializable

        # The unique identifier of the accessor.
        @[JSON::Field(key: "AccessorId")]
        getter accessor_id : String?

        # The billing token is a property of the Accessor. Use this token to when making calls to the
        # blockchain network. The billing token is used to track your accessor token for billing requests.
        @[JSON::Field(key: "BillingToken")]
        getter billing_token : String?

        # The blockchain network that the accessor token is created for.
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        def initialize(
          @accessor_id : String? = nil,
          @billing_token : String? = nil,
          @network_type : String? = nil
        )
        end
      end

      struct CreateMemberInput
        include JSON::Serializable

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the operation. An
        # idempotent operation completes no more than one time. This identifier is required only if you make a
        # service request directly using an HTTP client. It is generated automatically if you use an Amazon
        # Web Services SDK or the CLI.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The unique identifier of the invitation that is sent to the member to join the network.
        @[JSON::Field(key: "InvitationId")]
        getter invitation_id : String

        # Member configuration parameters.
        @[JSON::Field(key: "MemberConfiguration")]
        getter member_configuration : Types::MemberConfiguration

        # The unique identifier of the network in which the member is created.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @client_request_token : String,
          @invitation_id : String,
          @member_configuration : Types::MemberConfiguration,
          @network_id : String
        )
        end
      end

      struct CreateMemberOutput
        include JSON::Serializable

        # The unique identifier of the member.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        def initialize(
          @member_id : String? = nil
        )
        end
      end

      struct CreateNetworkInput
        include JSON::Serializable

        # This is a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # operation. An idempotent operation completes no more than once. This identifier is required only if
        # you make a service request directly using an HTTP client. It is generated automatically if you use
        # an Amazon Web Services SDK or the Amazon Web Services CLI.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The blockchain framework that the network uses.
        @[JSON::Field(key: "Framework")]
        getter framework : String

        # The version of the blockchain framework that the network uses.
        @[JSON::Field(key: "FrameworkVersion")]
        getter framework_version : String

        # Configuration properties for the first member within the network.
        @[JSON::Field(key: "MemberConfiguration")]
        getter member_configuration : Types::MemberConfiguration

        # The name of the network.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The voting rules used by the network to determine if a proposal is approved.
        @[JSON::Field(key: "VotingPolicy")]
        getter voting_policy : Types::VotingPolicy

        # An optional description for the network.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Configuration properties of the blockchain framework relevant to the network configuration.
        @[JSON::Field(key: "FrameworkConfiguration")]
        getter framework_configuration : Types::NetworkFrameworkConfiguration?

        # Tags to assign to the network. Each tag consists of a key and an optional value. You can specify
        # multiple key-value pairs in a single request with an overall maximum of 50 tags allowed per
        # resource. For more information about tags, see Tagging Resources in the Amazon Managed Blockchain
        # Ethereum Developer Guide , or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric
        # Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_request_token : String,
          @framework : String,
          @framework_version : String,
          @member_configuration : Types::MemberConfiguration,
          @name : String,
          @voting_policy : Types::VotingPolicy,
          @description : String? = nil,
          @framework_configuration : Types::NetworkFrameworkConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateNetworkOutput
        include JSON::Serializable

        # The unique identifier for the first member within the network.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        # The unique identifier for the network.
        @[JSON::Field(key: "NetworkId")]
        getter network_id : String?

        def initialize(
          @member_id : String? = nil,
          @network_id : String? = nil
        )
        end
      end

      struct CreateNodeInput
        include JSON::Serializable

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the operation. An
        # idempotent operation completes no more than one time. This identifier is required only if you make a
        # service request directly using an HTTP client. It is generated automatically if you use an Amazon
        # Web Services SDK or the CLI.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The unique identifier of the network for the node. Ethereum public networks have the following
        # NetworkId s: n-ethereum-mainnet
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The properties of a node configuration.
        @[JSON::Field(key: "NodeConfiguration")]
        getter node_configuration : Types::NodeConfiguration

        # The unique identifier of the member that owns this node. Applies only to Hyperledger Fabric.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        # Tags to assign to the node. Each tag consists of a key and an optional value. You can specify
        # multiple key-value pairs in a single request with an overall maximum of 50 tags allowed per
        # resource. For more information about tags, see Tagging Resources in the Amazon Managed Blockchain
        # Ethereum Developer Guide , or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric
        # Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_request_token : String,
          @network_id : String,
          @node_configuration : Types::NodeConfiguration,
          @member_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateNodeOutput
        include JSON::Serializable

        # The unique identifier of the node.
        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        def initialize(
          @node_id : String? = nil
        )
        end
      end

      struct CreateProposalInput
        include JSON::Serializable

        # The type of actions proposed, such as inviting a member or removing a member. The types of Actions
        # in a proposal are mutually exclusive. For example, a proposal with Invitations actions cannot also
        # contain Removals actions.
        @[JSON::Field(key: "Actions")]
        getter actions : Types::ProposalActions

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the operation. An
        # idempotent operation completes no more than one time. This identifier is required only if you make a
        # service request directly using an HTTP client. It is generated automatically if you use an Amazon
        # Web Services SDK or the CLI.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The unique identifier of the member that is creating the proposal. This identifier is especially
        # useful for identifying the member making the proposal when multiple members exist in a single Amazon
        # Web Services account.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String

        # The unique identifier of the network for which the proposal is made.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # A description for the proposal that is visible to voting members, for example, "Proposal to add
        # Example Corp. as member."
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags to assign to the proposal. Each tag consists of a key and an optional value. You can specify
        # multiple key-value pairs in a single request with an overall maximum of 50 tags allowed per
        # resource. For more information about tags, see Tagging Resources in the Amazon Managed Blockchain
        # Ethereum Developer Guide , or Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric
        # Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @actions : Types::ProposalActions,
          @client_request_token : String,
          @member_id : String,
          @network_id : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateProposalOutput
        include JSON::Serializable

        # The unique identifier of the proposal.
        @[JSON::Field(key: "ProposalId")]
        getter proposal_id : String?

        def initialize(
          @proposal_id : String? = nil
        )
        end
      end

      struct DeleteAccessorInput
        include JSON::Serializable

        # The unique identifier of the accessor.
        @[JSON::Field(key: "AccessorId")]
        getter accessor_id : String

        def initialize(
          @accessor_id : String
        )
        end
      end

      struct DeleteAccessorOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteMemberInput
        include JSON::Serializable

        # The unique identifier of the member to remove.
        @[JSON::Field(key: "memberId")]
        getter member_id : String

        # The unique identifier of the network from which the member is removed.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @member_id : String,
          @network_id : String
        )
        end
      end

      struct DeleteMemberOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteNodeInput
        include JSON::Serializable

        # The unique identifier of the network that the node is on. Ethereum public networks have the
        # following NetworkId s: n-ethereum-mainnet
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the node.
        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        # The unique identifier of the member that owns this node. Applies only to Hyperledger Fabric and is
        # required for Hyperledger Fabric.
        @[JSON::Field(key: "memberId")]
        getter member_id : String?

        def initialize(
          @network_id : String,
          @node_id : String,
          @member_id : String? = nil
        )
        end
      end

      struct DeleteNodeOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct GetAccessorInput
        include JSON::Serializable

        # The unique identifier of the accessor.
        @[JSON::Field(key: "AccessorId")]
        getter accessor_id : String

        def initialize(
          @accessor_id : String
        )
        end
      end

      struct GetAccessorOutput
        include JSON::Serializable

        # The properties of the accessor.
        @[JSON::Field(key: "Accessor")]
        getter accessor : Types::Accessor?

        def initialize(
          @accessor : Types::Accessor? = nil
        )
        end
      end

      struct GetMemberInput
        include JSON::Serializable

        # The unique identifier of the member.
        @[JSON::Field(key: "memberId")]
        getter member_id : String

        # The unique identifier of the network to which the member belongs.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @member_id : String,
          @network_id : String
        )
        end
      end

      struct GetMemberOutput
        include JSON::Serializable

        # The properties of a member.
        @[JSON::Field(key: "Member")]
        getter member : Types::Member?

        def initialize(
          @member : Types::Member? = nil
        )
        end
      end

      struct GetNetworkInput
        include JSON::Serializable

        # The unique identifier of the network to get information about.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        def initialize(
          @network_id : String
        )
        end
      end

      struct GetNetworkOutput
        include JSON::Serializable

        # An object containing network configuration parameters.
        @[JSON::Field(key: "Network")]
        getter network : Types::Network?

        def initialize(
          @network : Types::Network? = nil
        )
        end
      end

      struct GetNodeInput
        include JSON::Serializable

        # The unique identifier of the network that the node is on.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the node.
        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        # The unique identifier of the member that owns the node. Applies only to Hyperledger Fabric and is
        # required for Hyperledger Fabric.
        @[JSON::Field(key: "memberId")]
        getter member_id : String?

        def initialize(
          @network_id : String,
          @node_id : String,
          @member_id : String? = nil
        )
        end
      end

      struct GetNodeOutput
        include JSON::Serializable

        # Properties of the node configuration.
        @[JSON::Field(key: "Node")]
        getter node : Types::Node?

        def initialize(
          @node : Types::Node? = nil
        )
        end
      end

      struct GetProposalInput
        include JSON::Serializable

        # The unique identifier of the network for which the proposal is made.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the proposal.
        @[JSON::Field(key: "proposalId")]
        getter proposal_id : String

        def initialize(
          @network_id : String,
          @proposal_id : String
        )
        end
      end

      struct GetProposalOutput
        include JSON::Serializable

        # Information about a proposal.
        @[JSON::Field(key: "Proposal")]
        getter proposal : Types::Proposal?

        def initialize(
          @proposal : Types::Proposal? = nil
        )
        end
      end

      struct IllegalActionException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServiceErrorException
        include JSON::Serializable

        def initialize
        end
      end

      # The action or operation requested is invalid. Verify that the action is typed correctly.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An invitation to an Amazon Web Services account to create a member and join the network. Applies
      # only to Hyperledger Fabric.
      struct Invitation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the invitation. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the invitation was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The date and time that the invitation expires. This is the CreationDate plus the
        # ProposalDurationInHours that is specified in the ProposalThresholdPolicy . After this date and time,
        # the invitee can no longer create a member and join the network using this InvitationId .
        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : Time?

        # The unique identifier for the invitation.
        @[JSON::Field(key: "InvitationId")]
        getter invitation_id : String?

        @[JSON::Field(key: "NetworkSummary")]
        getter network_summary : Types::NetworkSummary?

        # The status of the invitation: PENDING - The invitee hasn't created a member to join the network, and
        # the invitation hasn't yet expired. ACCEPTING - The invitee has begun creating a member, and creation
        # hasn't yet completed. ACCEPTED - The invitee created a member and joined the network using the
        # InvitationID . REJECTED - The invitee rejected the invitation. EXPIRED - The invitee neither created
        # a member nor rejected the invitation before the ExpirationDate .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @expiration_date : Time? = nil,
          @invitation_id : String? = nil,
          @network_summary : Types::NetworkSummary? = nil,
          @status : String? = nil
        )
        end
      end

      # An action to invite a specific Amazon Web Services account to create a member and join the network.
      # The InviteAction is carried out when a Proposal is APPROVED . Applies only to Hyperledger Fabric.
      struct InviteAction
        include JSON::Serializable

        # The Amazon Web Services account ID to invite.
        @[JSON::Field(key: "Principal")]
        getter principal : String

        def initialize(
          @principal : String
        )
        end
      end

      struct ListAccessorsInput
        include JSON::Serializable

        # The maximum number of accessors to list.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The blockchain network that the Accessor token is created for. Use the value
        # ETHEREUM_MAINNET_AND_GOERLI for all existing Accessors tokens that were created before the
        # networkType property was introduced.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @network_type : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccessorsOutput
        include JSON::Serializable

        # An array of AccessorSummary objects that contain configuration properties for each accessor.
        @[JSON::Field(key: "Accessors")]
        getter accessors : Array(Types::AccessorSummary)?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accessors : Array(Types::AccessorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInvitationsInput
        include JSON::Serializable

        # The maximum number of invitations to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInvitationsOutput
        include JSON::Serializable

        # The invitations for the network.
        @[JSON::Field(key: "Invitations")]
        getter invitations : Array(Types::Invitation)?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @invitations : Array(Types::Invitation)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMembersInput
        include JSON::Serializable

        # The unique identifier of the network for which to list members.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # An optional Boolean value. If provided, the request is limited either to members that the current
        # Amazon Web Services account owns ( true ) or that other Amazon Web Services accountsn own ( false ).
        # If omitted, all members are listed.
        @[JSON::Field(key: "isOwned")]
        getter is_owned : Bool?

        # The maximum number of members to return in the request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The optional name of the member to list.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional status specifier. If provided, only members currently in this status are listed.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @network_id : String,
          @is_owned : Bool? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListMembersOutput
        include JSON::Serializable

        # An array of MemberSummary objects. Each object contains details about a network member.
        @[JSON::Field(key: "Members")]
        getter members : Array(Types::MemberSummary)?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::MemberSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNetworksInput
        include JSON::Serializable

        # An optional framework specifier. If provided, only networks of this framework type are listed.
        @[JSON::Field(key: "framework")]
        getter framework : String?

        # The maximum number of networks to list.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the network.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional status specifier. If provided, only networks currently in this status are listed.
        # Applies only to Hyperledger Fabric.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @framework : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListNetworksOutput
        include JSON::Serializable

        # An array of NetworkSummary objects that contain configuration properties for each network.
        @[JSON::Field(key: "Networks")]
        getter networks : Array(Types::NetworkSummary)?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @networks : Array(Types::NetworkSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNodesInput
        include JSON::Serializable

        # The unique identifier of the network for which to list nodes.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The maximum number of nodes to list.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The unique identifier of the member who owns the nodes to list. Applies only to Hyperledger Fabric
        # and is required for Hyperledger Fabric.
        @[JSON::Field(key: "memberId")]
        getter member_id : String?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional status specifier. If provided, only nodes currently in this status are listed.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @network_id : String,
          @max_results : Int32? = nil,
          @member_id : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListNodesOutput
        include JSON::Serializable

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of NodeSummary objects that contain configuration properties for each node.
        @[JSON::Field(key: "Nodes")]
        getter nodes : Array(Types::NodeSummary)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::NodeSummary)? = nil
        )
        end
      end

      struct ListProposalVotesInput
        include JSON::Serializable

        # The unique identifier of the network.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the proposal.
        @[JSON::Field(key: "proposalId")]
        getter proposal_id : String

        # The maximum number of votes to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @network_id : String,
          @proposal_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProposalVotesOutput
        include JSON::Serializable

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of votes.
        @[JSON::Field(key: "ProposalVotes")]
        getter proposal_votes : Array(Types::VoteSummary)?

        def initialize(
          @next_token : String? = nil,
          @proposal_votes : Array(Types::VoteSummary)? = nil
        )
        end
      end

      struct ListProposalsInput
        include JSON::Serializable

        # The unique identifier of the network.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The maximum number of proposals to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @network_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProposalsOutput
        include JSON::Serializable

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The summary of each proposal made on the network.
        @[JSON::Field(key: "Proposals")]
        getter proposals : Array(Types::ProposalSummary)?

        def initialize(
          @next_token : String? = nil,
          @proposals : Array(Types::ProposalSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags assigned to the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A configuration for logging events.
      struct LogConfiguration
        include JSON::Serializable

        # Indicates whether logging is enabled.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # A collection of log configurations.
      struct LogConfigurations
        include JSON::Serializable

        # Parameters for publishing logs to Amazon CloudWatch Logs.
        @[JSON::Field(key: "Cloudwatch")]
        getter cloudwatch : Types::LogConfiguration?

        def initialize(
          @cloudwatch : Types::LogConfiguration? = nil
        )
        end
      end

      # Member configuration properties. Applies only to Hyperledger Fabric.
      struct Member
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the member. For more information about ARNs and their format, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the member was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # An optional description for the member.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Attributes relevant to a member for the blockchain framework that the Managed Blockchain network
        # uses.
        @[JSON::Field(key: "FrameworkAttributes")]
        getter framework_attributes : Types::MemberFrameworkAttributes?

        # The unique identifier of the member.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the customer managed key in Key Management Service (KMS) that the
        # member uses for encryption at rest. If the value of this parameter is "AWS Owned KMS Key" , the
        # member uses an Amazon Web Services owned KMS key for encryption. This parameter is inherited by the
        # nodes that this member owns. For more information, see Encryption at Rest in the Amazon Managed
        # Blockchain Hyperledger Fabric Developer Guide .
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # Configuration properties for logging events associated with a member.
        @[JSON::Field(key: "LogPublishingConfiguration")]
        getter log_publishing_configuration : Types::MemberLogPublishingConfiguration?

        # The name of the member.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the network to which the member belongs.
        @[JSON::Field(key: "NetworkId")]
        getter network_id : String?

        # The status of a member. CREATING - The Amazon Web Services account is in the process of creating a
        # member. AVAILABLE - The member has been created and can participate in the network. CREATE_FAILED -
        # The Amazon Web Services account attempted to create a member and creation failed. UPDATING - The
        # member is in the process of being updated. DELETING - The member and all associated resources are in
        # the process of being deleted. Either the Amazon Web Services account that owns the member deleted
        # it, or the member is being deleted as the result of an APPROVED PROPOSAL to remove the member.
        # DELETED - The member can no longer participate on the network and all associated resources are
        # deleted. Either the Amazon Web Services account that owns the member deleted it, or the member is
        # being deleted as the result of an APPROVED PROPOSAL to remove the member.
        # INACCESSIBLE_ENCRYPTION_KEY - The member is impaired and might not function as expected because it
        # cannot access the specified customer managed key in KMS for encryption at rest. Either the KMS key
        # was disabled or deleted, or the grants on the key were revoked. The effect of disabling or deleting
        # a key or of revoking a grant isn't immediate. It might take some time for the member resource to
        # discover that the key is inaccessible. When a resource is in this state, we recommend deleting and
        # recreating the resource.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Tags assigned to the member. Tags consist of a key and optional value. For more information about
        # tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide , or Tagging
        # Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @framework_attributes : Types::MemberFrameworkAttributes? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @log_publishing_configuration : Types::MemberLogPublishingConfiguration? = nil,
          @name : String? = nil,
          @network_id : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration properties of the member. Applies only to Hyperledger Fabric.
      struct MemberConfiguration
        include JSON::Serializable

        # Configuration properties of the blockchain framework relevant to the member.
        @[JSON::Field(key: "FrameworkConfiguration")]
        getter framework_configuration : Types::MemberFrameworkConfiguration

        # The name of the member.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An optional description of the member.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the customer managed key in Key Management Service (KMS) to use
        # for encryption at rest in the member. This parameter is inherited by any nodes that this member
        # creates. For more information, see Encryption at Rest in the Amazon Managed Blockchain Hyperledger
        # Fabric Developer Guide . Use one of the following options to specify this parameter: Undefined or
        # empty string - By default, use an KMS key that is owned and managed by Amazon Web Services on your
        # behalf. A valid symmetric customer managed KMS key - Use the specified KMS key in your account that
        # you create, own, and manage. Amazon Managed Blockchain doesn't support asymmetric keys. For more
        # information, see Using symmetric and asymmetric keys in the Key Management Service Developer Guide .
        # The following is an example of a KMS key ARN:
        # arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # Configuration properties for logging events associated with a member of a Managed Blockchain
        # network.
        @[JSON::Field(key: "LogPublishingConfiguration")]
        getter log_publishing_configuration : Types::MemberLogPublishingConfiguration?

        # Tags assigned to the member. Tags consist of a key and optional value. When specifying tags during
        # creation, you can specify multiple key-value pairs in a single request, with an overall maximum of
        # 50 tags added to each resource. For more information about tags, see Tagging Resources in the Amazon
        # Managed Blockchain Ethereum Developer Guide , or Tagging Resources in the Amazon Managed Blockchain
        # Hyperledger Fabric Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @framework_configuration : Types::MemberFrameworkConfiguration,
          @name : String,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @log_publishing_configuration : Types::MemberLogPublishingConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Attributes of Hyperledger Fabric for a member in a Managed Blockchain network using the Hyperledger
      # Fabric framework.
      struct MemberFabricAttributes
        include JSON::Serializable

        # The user name for the initial administrator user for the member.
        @[JSON::Field(key: "AdminUsername")]
        getter admin_username : String?

        # The endpoint used to access the member's certificate authority.
        @[JSON::Field(key: "CaEndpoint")]
        getter ca_endpoint : String?

        def initialize(
          @admin_username : String? = nil,
          @ca_endpoint : String? = nil
        )
        end
      end

      # Configuration properties for Hyperledger Fabric for a member in a Managed Blockchain network that is
      # using the Hyperledger Fabric framework.
      struct MemberFabricConfiguration
        include JSON::Serializable

        # The password for the member's initial administrative user. The AdminPassword must be at least 8
        # characters long and no more than 32 characters. It must contain at least one uppercase letter, one
        # lowercase letter, and one digit. It cannot have a single quotation mark (‘), a double quotation
        # marks (“), a forward slash(/), a backward slash(\), @, or a space.
        @[JSON::Field(key: "AdminPassword")]
        getter admin_password : String

        # The user name for the member's initial administrative user.
        @[JSON::Field(key: "AdminUsername")]
        getter admin_username : String

        def initialize(
          @admin_password : String,
          @admin_username : String
        )
        end
      end

      # Configuration properties for logging events associated with a member of a Managed Blockchain network
      # using the Hyperledger Fabric framework.
      struct MemberFabricLogPublishingConfiguration
        include JSON::Serializable

        # Configuration properties for logging events associated with a member's Certificate Authority (CA).
        # CA logs help you determine when a member in your account joins the network, or when new peers
        # register with a member CA.
        @[JSON::Field(key: "CaLogs")]
        getter ca_logs : Types::LogConfigurations?

        def initialize(
          @ca_logs : Types::LogConfigurations? = nil
        )
        end
      end

      # Attributes relevant to a member for the blockchain framework that the Managed Blockchain network
      # uses.
      struct MemberFrameworkAttributes
        include JSON::Serializable

        # Attributes of Hyperledger Fabric relevant to a member on a Managed Blockchain network that uses
        # Hyperledger Fabric.
        @[JSON::Field(key: "Fabric")]
        getter fabric : Types::MemberFabricAttributes?

        def initialize(
          @fabric : Types::MemberFabricAttributes? = nil
        )
        end
      end

      # Configuration properties relevant to a member for the blockchain framework that the Managed
      # Blockchain network uses.
      struct MemberFrameworkConfiguration
        include JSON::Serializable

        # Attributes of Hyperledger Fabric for a member on a Managed Blockchain network that uses Hyperledger
        # Fabric.
        @[JSON::Field(key: "Fabric")]
        getter fabric : Types::MemberFabricConfiguration?

        def initialize(
          @fabric : Types::MemberFabricConfiguration? = nil
        )
        end
      end

      # Configuration properties for logging events associated with a member of a Managed Blockchain
      # network.
      struct MemberLogPublishingConfiguration
        include JSON::Serializable

        # Configuration properties for logging events associated with a member of a Managed Blockchain network
        # using the Hyperledger Fabric framework.
        @[JSON::Field(key: "Fabric")]
        getter fabric : Types::MemberFabricLogPublishingConfiguration?

        def initialize(
          @fabric : Types::MemberFabricLogPublishingConfiguration? = nil
        )
        end
      end

      # A summary of configuration properties for a member. Applies only to Hyperledger Fabric.
      struct MemberSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the member. For more information about ARNs and their format, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the member was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # An optional description of the member.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the member.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # An indicator of whether the member is owned by your Amazon Web Services account or a different
        # Amazon Web Services account.
        @[JSON::Field(key: "IsOwned")]
        getter is_owned : Bool?

        # The name of the member.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the member. CREATING - The Amazon Web Services account is in the process of creating a
        # member. AVAILABLE - The member has been created and can participate in the network. CREATE_FAILED -
        # The Amazon Web Services account attempted to create a member and creation failed. UPDATING - The
        # member is in the process of being updated. DELETING - The member and all associated resources are in
        # the process of being deleted. Either the Amazon Web Services account that owns the member deleted
        # it, or the member is being deleted as the result of an APPROVED PROPOSAL to remove the member.
        # DELETED - The member can no longer participate on the network and all associated resources are
        # deleted. Either the Amazon Web Services account that owns the member deleted it, or the member is
        # being deleted as the result of an APPROVED PROPOSAL to remove the member.
        # INACCESSIBLE_ENCRYPTION_KEY - The member is impaired and might not function as expected because it
        # cannot access the specified customer managed key in Key Management Service (KMS) for encryption at
        # rest. Either the KMS key was disabled or deleted, or the grants on the key were revoked. The effect
        # of disabling or deleting a key or of revoking a grant isn't immediate. It might take some time for
        # the member resource to discover that the key is inaccessible. When a resource is in this state, we
        # recommend deleting and recreating the resource.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @is_owned : Bool? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Network configuration properties.
      struct Network
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the network. For more information about ARNs and their format, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the network was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Attributes of the blockchain framework for the network.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The blockchain framework that the network uses.
        @[JSON::Field(key: "Framework")]
        getter framework : String?

        # Attributes of the blockchain framework that the network uses.
        @[JSON::Field(key: "FrameworkAttributes")]
        getter framework_attributes : Types::NetworkFrameworkAttributes?

        # The version of the blockchain framework that the network uses.
        @[JSON::Field(key: "FrameworkVersion")]
        getter framework_version : String?

        # The unique identifier of the network.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the network.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the network.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Tags assigned to the network. Each tag consists of a key and optional value. For more information
        # about tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide , or
        # Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The voting rules that the network uses to decide if a proposal is accepted.
        @[JSON::Field(key: "VotingPolicy")]
        getter voting_policy : Types::VotingPolicy?

        # The VPC endpoint service name of the VPC endpoint service of the network. Members use the VPC
        # endpoint service name to create a VPC endpoint to access network resources.
        @[JSON::Field(key: "VpcEndpointServiceName")]
        getter vpc_endpoint_service_name : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @framework : String? = nil,
          @framework_attributes : Types::NetworkFrameworkAttributes? = nil,
          @framework_version : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @voting_policy : Types::VotingPolicy? = nil,
          @vpc_endpoint_service_name : String? = nil
        )
        end
      end

      # Attributes of Ethereum for a network.
      struct NetworkEthereumAttributes
        include JSON::Serializable

        # The Ethereum CHAIN_ID associated with the Ethereum network. Chain IDs are as follows: mainnet = 1
        @[JSON::Field(key: "ChainId")]
        getter chain_id : String?

        def initialize(
          @chain_id : String? = nil
        )
        end
      end

      # Attributes of Hyperledger Fabric for a network.
      struct NetworkFabricAttributes
        include JSON::Serializable

        # The edition of Amazon Managed Blockchain that Hyperledger Fabric uses. For more information, see
        # Amazon Managed Blockchain Pricing .
        @[JSON::Field(key: "Edition")]
        getter edition : String?

        # The endpoint of the ordering service for the network.
        @[JSON::Field(key: "OrderingServiceEndpoint")]
        getter ordering_service_endpoint : String?

        def initialize(
          @edition : String? = nil,
          @ordering_service_endpoint : String? = nil
        )
        end
      end

      # Hyperledger Fabric configuration properties for the network.
      struct NetworkFabricConfiguration
        include JSON::Serializable

        # The edition of Amazon Managed Blockchain that the network uses. For more information, see Amazon
        # Managed Blockchain Pricing .
        @[JSON::Field(key: "Edition")]
        getter edition : String

        def initialize(
          @edition : String
        )
        end
      end

      # Attributes relevant to the network for the blockchain framework that the network uses.
      struct NetworkFrameworkAttributes
        include JSON::Serializable

        # Attributes of an Ethereum network for Managed Blockchain resources participating in an Ethereum
        # network.
        @[JSON::Field(key: "Ethereum")]
        getter ethereum : Types::NetworkEthereumAttributes?

        # Attributes of Hyperledger Fabric for a Managed Blockchain network that uses Hyperledger Fabric.
        @[JSON::Field(key: "Fabric")]
        getter fabric : Types::NetworkFabricAttributes?

        def initialize(
          @ethereum : Types::NetworkEthereumAttributes? = nil,
          @fabric : Types::NetworkFabricAttributes? = nil
        )
        end
      end

      # Configuration properties relevant to the network for the blockchain framework that the network uses.
      struct NetworkFrameworkConfiguration
        include JSON::Serializable

        # Hyperledger Fabric configuration properties for a Managed Blockchain network that uses Hyperledger
        # Fabric.
        @[JSON::Field(key: "Fabric")]
        getter fabric : Types::NetworkFabricConfiguration?

        def initialize(
          @fabric : Types::NetworkFabricConfiguration? = nil
        )
        end
      end

      # A summary of network configuration properties.
      struct NetworkSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the network. For more information about ARNs and their format, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the network was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # An optional description of the network.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The blockchain framework that the network uses.
        @[JSON::Field(key: "Framework")]
        getter framework : String?

        # The version of the blockchain framework that the network uses.
        @[JSON::Field(key: "FrameworkVersion")]
        getter framework_version : String?

        # The unique identifier of the network.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the network.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the network.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @framework : String? = nil,
          @framework_version : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Configuration properties of a node.
      struct Node
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the node. For more information about ARNs and their format, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Availability Zone in which the node exists. Required for Ethereum nodes.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The date and time that the node was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Attributes of the blockchain framework being used.
        @[JSON::Field(key: "FrameworkAttributes")]
        getter framework_attributes : Types::NodeFrameworkAttributes?

        # The unique identifier of the node.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The instance type of the node.
        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The Amazon Resource Name (ARN) of the customer managed key in Key Management Service (KMS) that the
        # node uses for encryption at rest. If the value of this parameter is "AWS Owned KMS Key" , the node
        # uses an Amazon Web Services owned KMS key for encryption. The node inherits this parameter from the
        # member that it belongs to. For more information, see Encryption at Rest in the Amazon Managed
        # Blockchain Hyperledger Fabric Developer Guide . Applies only to Hyperledger Fabric.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # Configuration properties for logging events associated with a peer node on a Hyperledger Fabric
        # network on Managed Blockchain.
        @[JSON::Field(key: "LogPublishingConfiguration")]
        getter log_publishing_configuration : Types::NodeLogPublishingConfiguration?

        # The unique identifier of the member to which the node belongs. Applies only to Hyperledger Fabric.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        # The unique identifier of the network that the node is on.
        @[JSON::Field(key: "NetworkId")]
        getter network_id : String?

        # The state database that the node uses. Values are LevelDB or CouchDB . Applies only to Hyperledger
        # Fabric.
        @[JSON::Field(key: "StateDB")]
        getter state_db : String?

        # The status of the node. CREATING - The Amazon Web Services account is in the process of creating a
        # node. AVAILABLE - The node has been created and can participate in the network. UNHEALTHY - The node
        # is impaired and might not function as expected. Amazon Managed Blockchain automatically finds nodes
        # in this state and tries to recover them. If a node is recoverable, it returns to AVAILABLE .
        # Otherwise, it moves to FAILED status. CREATE_FAILED - The Amazon Web Services account attempted to
        # create a node and creation failed. UPDATING - The node is in the process of being updated. DELETING
        # - The node is in the process of being deleted. DELETED - The node can no longer participate on the
        # network. FAILED - The node is no longer functional, cannot be recovered, and must be deleted.
        # INACCESSIBLE_ENCRYPTION_KEY - The node is impaired and might not function as expected because it
        # cannot access the specified customer managed key in KMS for encryption at rest. Either the KMS key
        # was disabled or deleted, or the grants on the key were revoked. The effect of disabling or deleting
        # a key or of revoking a grant isn't immediate. It might take some time for the node resource to
        # discover that the key is inaccessible. When a resource is in this state, we recommend deleting and
        # recreating the resource.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Tags assigned to the node. Each tag consists of a key and optional value. For more information about
        # tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide , or Tagging
        # Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @creation_date : Time? = nil,
          @framework_attributes : Types::NodeFrameworkAttributes? = nil,
          @id : String? = nil,
          @instance_type : String? = nil,
          @kms_key_arn : String? = nil,
          @log_publishing_configuration : Types::NodeLogPublishingConfiguration? = nil,
          @member_id : String? = nil,
          @network_id : String? = nil,
          @state_db : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration properties of a node.
      struct NodeConfiguration
        include JSON::Serializable

        # The Amazon Managed Blockchain instance type for the node.
        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # The Availability Zone in which the node exists. Required for Ethereum nodes.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Configuration properties for logging events associated with a peer node on a Hyperledger Fabric
        # network on Managed Blockchain.
        @[JSON::Field(key: "LogPublishingConfiguration")]
        getter log_publishing_configuration : Types::NodeLogPublishingConfiguration?

        # The state database that the node uses. Values are LevelDB or CouchDB . When using an Amazon Managed
        # Blockchain network with Hyperledger Fabric version 1.4 or later, the default is CouchDB . Applies
        # only to Hyperledger Fabric.
        @[JSON::Field(key: "StateDB")]
        getter state_db : String?

        def initialize(
          @instance_type : String,
          @availability_zone : String? = nil,
          @log_publishing_configuration : Types::NodeLogPublishingConfiguration? = nil,
          @state_db : String? = nil
        )
        end
      end

      # Attributes of an Ethereum node.
      struct NodeEthereumAttributes
        include JSON::Serializable

        # The endpoint on which the Ethereum node listens to run Ethereum API methods over HTTP connections
        # from a client. Use this endpoint in client code for smart contracts when using an HTTP connection.
        # Connections to this endpoint are authenticated using Signature Version 4 .
        @[JSON::Field(key: "HttpEndpoint")]
        getter http_endpoint : String?

        # The endpoint on which the Ethereum node listens to run Ethereum JSON-RPC methods over WebSocket
        # connections from a client. Use this endpoint in client code for smart contracts when using a
        # WebSocket connection. Connections to this endpoint are authenticated using Signature Version 4 .
        @[JSON::Field(key: "WebSocketEndpoint")]
        getter web_socket_endpoint : String?

        def initialize(
          @http_endpoint : String? = nil,
          @web_socket_endpoint : String? = nil
        )
        end
      end

      # Attributes of Hyperledger Fabric for a peer node on a Hyperledger Fabric network on Managed
      # Blockchain.
      struct NodeFabricAttributes
        include JSON::Serializable

        # The endpoint that identifies the peer node for all services except peer channel-based event
        # services.
        @[JSON::Field(key: "PeerEndpoint")]
        getter peer_endpoint : String?

        # The endpoint that identifies the peer node for peer channel-based event services.
        @[JSON::Field(key: "PeerEventEndpoint")]
        getter peer_event_endpoint : String?

        def initialize(
          @peer_endpoint : String? = nil,
          @peer_event_endpoint : String? = nil
        )
        end
      end

      # Configuration properties for logging events associated with a peer node owned by a member in a
      # Managed Blockchain network.
      struct NodeFabricLogPublishingConfiguration
        include JSON::Serializable

        # Configuration properties for logging events associated with chaincode execution on a peer node.
        # Chaincode logs contain the results of instantiating, invoking, and querying the chaincode. A peer
        # can run multiple instances of chaincode. When enabled, a log stream is created for all chaincodes,
        # with an individual log stream for each chaincode.
        @[JSON::Field(key: "ChaincodeLogs")]
        getter chaincode_logs : Types::LogConfigurations?

        # Configuration properties for a peer node log. Peer node logs contain messages generated when your
        # client submits transaction proposals to peer nodes, requests to join channels, enrolls an admin
        # peer, and lists the chaincode instances on a peer node.
        @[JSON::Field(key: "PeerLogs")]
        getter peer_logs : Types::LogConfigurations?

        def initialize(
          @chaincode_logs : Types::LogConfigurations? = nil,
          @peer_logs : Types::LogConfigurations? = nil
        )
        end
      end

      # Attributes relevant to a node on a Managed Blockchain network for the blockchain framework that the
      # network uses.
      struct NodeFrameworkAttributes
        include JSON::Serializable

        # Attributes of Ethereum for a node on a Managed Blockchain network that uses Ethereum.
        @[JSON::Field(key: "Ethereum")]
        getter ethereum : Types::NodeEthereumAttributes?

        # Attributes of Hyperledger Fabric for a peer node on a Managed Blockchain network that uses
        # Hyperledger Fabric.
        @[JSON::Field(key: "Fabric")]
        getter fabric : Types::NodeFabricAttributes?

        def initialize(
          @ethereum : Types::NodeEthereumAttributes? = nil,
          @fabric : Types::NodeFabricAttributes? = nil
        )
        end
      end

      # Configuration properties for logging events associated with a peer node on a Hyperledger Fabric
      # network on Managed Blockchain.
      struct NodeLogPublishingConfiguration
        include JSON::Serializable

        # Configuration properties for logging events associated with a node that is owned by a member of a
        # Managed Blockchain network using the Hyperledger Fabric framework.
        @[JSON::Field(key: "Fabric")]
        getter fabric : Types::NodeFabricLogPublishingConfiguration?

        def initialize(
          @fabric : Types::NodeFabricLogPublishingConfiguration? = nil
        )
        end
      end

      # A summary of configuration properties for a node.
      struct NodeSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the node. For more information about ARNs and their format, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Availability Zone in which the node exists.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The date and time that the node was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The unique identifier of the node.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The EC2 instance type for the node.
        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The status of the node.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @creation_date : Time? = nil,
          @id : String? = nil,
          @instance_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Properties of a proposal on a Managed Blockchain network. Applies only to Hyperledger Fabric.
      struct Proposal
        include JSON::Serializable

        # The actions to perform on the network if the proposal is APPROVED .
        @[JSON::Field(key: "Actions")]
        getter actions : Types::ProposalActions?

        # The Amazon Resource Name (ARN) of the proposal. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the proposal was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The description of the proposal.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date and time that the proposal expires. This is the CreationDate plus the
        # ProposalDurationInHours that is specified in the ProposalThresholdPolicy . After this date and time,
        # if members haven't cast enough votes to determine the outcome according to the voting policy, the
        # proposal is EXPIRED and Actions aren't carried out.
        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : Time?

        # The unique identifier of the network for which the proposal is made.
        @[JSON::Field(key: "NetworkId")]
        getter network_id : String?

        # The current total of NO votes cast on the proposal by members.
        @[JSON::Field(key: "NoVoteCount")]
        getter no_vote_count : Int32?

        # The number of votes remaining to be cast on the proposal by members. In other words, the number of
        # members minus the sum of YES votes and NO votes.
        @[JSON::Field(key: "OutstandingVoteCount")]
        getter outstanding_vote_count : Int32?

        # The unique identifier of the proposal.
        @[JSON::Field(key: "ProposalId")]
        getter proposal_id : String?

        # The unique identifier of the member that created the proposal.
        @[JSON::Field(key: "ProposedByMemberId")]
        getter proposed_by_member_id : String?

        # The name of the member that created the proposal.
        @[JSON::Field(key: "ProposedByMemberName")]
        getter proposed_by_member_name : String?

        # The status of the proposal. Values are as follows: IN_PROGRESS - The proposal is active and open for
        # member voting. APPROVED - The proposal was approved with sufficient YES votes among members
        # according to the VotingPolicy specified for the Network . The specified proposal actions are carried
        # out. REJECTED - The proposal was rejected with insufficient YES votes among members according to the
        # VotingPolicy specified for the Network . The specified ProposalActions aren't carried out. EXPIRED -
        # Members didn't cast the number of votes required to determine the proposal outcome before the
        # proposal expired. The specified ProposalActions aren't carried out. ACTION_FAILED - One or more of
        # the specified ProposalActions in a proposal that was approved couldn't be completed because of an
        # error. The ACTION_FAILED status occurs even if only one ProposalAction fails and other actions are
        # successful.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Tags assigned to the proposal. Each tag consists of a key and optional value. For more information
        # about tags, see Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide , or
        # Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The current total of YES votes cast on the proposal by members.
        @[JSON::Field(key: "YesVoteCount")]
        getter yes_vote_count : Int32?

        def initialize(
          @actions : Types::ProposalActions? = nil,
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @network_id : String? = nil,
          @no_vote_count : Int32? = nil,
          @outstanding_vote_count : Int32? = nil,
          @proposal_id : String? = nil,
          @proposed_by_member_id : String? = nil,
          @proposed_by_member_name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @yes_vote_count : Int32? = nil
        )
        end
      end

      # The actions to carry out if a proposal is APPROVED . Applies only to Hyperledger Fabric.
      struct ProposalActions
        include JSON::Serializable

        # The actions to perform for an APPROVED proposal to invite an Amazon Web Services account to create a
        # member and join the network.
        @[JSON::Field(key: "Invitations")]
        getter invitations : Array(Types::InviteAction)?

        # The actions to perform for an APPROVED proposal to remove a member from the network, which deletes
        # the member and all associated member resources from the network.
        @[JSON::Field(key: "Removals")]
        getter removals : Array(Types::RemoveAction)?

        def initialize(
          @invitations : Array(Types::InviteAction)? = nil,
          @removals : Array(Types::RemoveAction)? = nil
        )
        end
      end

      # Properties of a proposal. Applies only to Hyperledger Fabric.
      struct ProposalSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the proposal. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the proposal was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The description of the proposal.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date and time that the proposal expires. This is the CreationDate plus the
        # ProposalDurationInHours that is specified in the ProposalThresholdPolicy . After this date and time,
        # if members haven't cast enough votes to determine the outcome according to the voting policy, the
        # proposal is EXPIRED and Actions aren't carried out.
        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : Time?

        # The unique identifier of the proposal.
        @[JSON::Field(key: "ProposalId")]
        getter proposal_id : String?

        # The unique identifier of the member that created the proposal.
        @[JSON::Field(key: "ProposedByMemberId")]
        getter proposed_by_member_id : String?

        # The name of the member that created the proposal.
        @[JSON::Field(key: "ProposedByMemberName")]
        getter proposed_by_member_name : String?

        # The status of the proposal. Values are as follows: IN_PROGRESS - The proposal is active and open for
        # member voting. APPROVED - The proposal was approved with sufficient YES votes among members
        # according to the VotingPolicy specified for the Network . The specified proposal actions are carried
        # out. REJECTED - The proposal was rejected with insufficient YES votes among members according to the
        # VotingPolicy specified for the Network . The specified ProposalActions aren't carried out. EXPIRED -
        # Members didn't cast the number of votes required to determine the proposal outcome before the
        # proposal expired. The specified ProposalActions aren't carried out. ACTION_FAILED - One or more of
        # the specified ProposalActions in a proposal that was approved couldn't be completed because of an
        # error.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @expiration_date : Time? = nil,
          @proposal_id : String? = nil,
          @proposed_by_member_id : String? = nil,
          @proposed_by_member_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct RejectInvitationInput
        include JSON::Serializable

        # The unique identifier of the invitation to reject.
        @[JSON::Field(key: "invitationId")]
        getter invitation_id : String

        def initialize(
          @invitation_id : String
        )
        end
      end

      struct RejectInvitationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # An action to remove a member from a Managed Blockchain network as the result of a removal proposal
      # that is APPROVED . The member and all associated resources are deleted from the network. Applies
      # only to Hyperledger Fabric.
      struct RemoveAction
        include JSON::Serializable

        # The unique identifier of the member to remove.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String

        def initialize(
          @member_id : String
        )
        end
      end

      # A resource request is issued for a resource that already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of resources of that type already exist. Ensure the resources requested are
      # within the boundaries of the service edition and your account limits.
      struct ResourceLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A requested resource doesn't exist. It may have been deleted or referenced incorrectly.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A requested resource doesn't exist. It may have been deleted or referenced inaccurately.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The requested resource exists but isn't in a status that can complete the operation.
      struct ResourceNotReadyException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to assign to the specified resource. Tag values can be empty, for example, "MyTagKey" : ""
        # . You can specify multiple key-value pairs in a single request, with an overall maximum of 50 tags
        # added to each resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request or operation couldn't be performed because a service is throttling requests. The most
      # common source of throttling errors is creating resources that exceed your service limit for this
      # resource type. Request a limit increase or delete unused resources if possible.
      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end

      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. For more information about ARNs and their format,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateMemberInput
        include JSON::Serializable

        # The unique identifier of the member.
        @[JSON::Field(key: "memberId")]
        getter member_id : String

        # The unique identifier of the Managed Blockchain network to which the member belongs.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # Configuration properties for publishing to Amazon CloudWatch Logs.
        @[JSON::Field(key: "LogPublishingConfiguration")]
        getter log_publishing_configuration : Types::MemberLogPublishingConfiguration?

        def initialize(
          @member_id : String,
          @network_id : String,
          @log_publishing_configuration : Types::MemberLogPublishingConfiguration? = nil
        )
        end
      end

      struct UpdateMemberOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateNodeInput
        include JSON::Serializable

        # The unique identifier of the network that the node is on.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the node.
        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        # Configuration properties for publishing to Amazon CloudWatch Logs.
        @[JSON::Field(key: "LogPublishingConfiguration")]
        getter log_publishing_configuration : Types::NodeLogPublishingConfiguration?

        # The unique identifier of the member that owns the node. Applies only to Hyperledger Fabric.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        def initialize(
          @network_id : String,
          @node_id : String,
          @log_publishing_configuration : Types::NodeLogPublishingConfiguration? = nil,
          @member_id : String? = nil
        )
        end
      end

      struct UpdateNodeOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct VoteOnProposalInput
        include JSON::Serializable

        # The unique identifier of the network.
        @[JSON::Field(key: "networkId")]
        getter network_id : String

        # The unique identifier of the proposal.
        @[JSON::Field(key: "proposalId")]
        getter proposal_id : String

        # The value of the vote.
        @[JSON::Field(key: "Vote")]
        getter vote : String

        # The unique identifier of the member casting the vote.
        @[JSON::Field(key: "VoterMemberId")]
        getter voter_member_id : String

        def initialize(
          @network_id : String,
          @proposal_id : String,
          @vote : String,
          @voter_member_id : String
        )
        end
      end

      struct VoteOnProposalOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Properties of an individual vote that a member cast for a proposal. Applies only to Hyperledger
      # Fabric.
      struct VoteSummary
        include JSON::Serializable

        # The unique identifier of the member that cast the vote.
        @[JSON::Field(key: "MemberId")]
        getter member_id : String?

        # The name of the member that cast the vote.
        @[JSON::Field(key: "MemberName")]
        getter member_name : String?

        # The vote value, either YES or NO .
        @[JSON::Field(key: "Vote")]
        getter vote : String?

        def initialize(
          @member_id : String? = nil,
          @member_name : String? = nil,
          @vote : String? = nil
        )
        end
      end

      # The voting rules for the network to decide if a proposal is accepted Applies only to Hyperledger
      # Fabric.
      struct VotingPolicy
        include JSON::Serializable

        # Defines the rules for the network for voting on proposals, such as the percentage of YES votes
        # required for the proposal to be approved and the duration of the proposal. The policy applies to all
        # proposals and is specified when the network is created.
        @[JSON::Field(key: "ApprovalThresholdPolicy")]
        getter approval_threshold_policy : Types::ApprovalThresholdPolicy?

        def initialize(
          @approval_threshold_policy : Types::ApprovalThresholdPolicy? = nil
        )
        end
      end
    end
  end
end
