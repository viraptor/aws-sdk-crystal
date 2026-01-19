module AwsSdk
  module ManagedBlockchain
    module Model
      API_VERSION = "2018-09-24"
      TARGET_PREFIX = ""
      SIGNING_NAME = "managedblockchain"
      ENDPOINT_PREFIX = "managedblockchain"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://managedblockchain-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://managedblockchain-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://managedblockchain.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://managedblockchain.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ACCESSOR = OperationModel.new(
        name: "CreateAccessor",
        http_method: "POST",
        request_uri: "/accessors"
      )

      CREATE_MEMBER = OperationModel.new(
        name: "CreateMember",
        http_method: "POST",
        request_uri: "/networks/{networkId}/members"
      )

      CREATE_NETWORK = OperationModel.new(
        name: "CreateNetwork",
        http_method: "POST",
        request_uri: "/networks"
      )

      CREATE_NODE = OperationModel.new(
        name: "CreateNode",
        http_method: "POST",
        request_uri: "/networks/{networkId}/nodes"
      )

      CREATE_PROPOSAL = OperationModel.new(
        name: "CreateProposal",
        http_method: "POST",
        request_uri: "/networks/{networkId}/proposals"
      )

      DELETE_ACCESSOR = OperationModel.new(
        name: "DeleteAccessor",
        http_method: "DELETE",
        request_uri: "/accessors/{AccessorId}"
      )

      DELETE_MEMBER = OperationModel.new(
        name: "DeleteMember",
        http_method: "DELETE",
        request_uri: "/networks/{networkId}/members/{memberId}"
      )

      DELETE_NODE = OperationModel.new(
        name: "DeleteNode",
        http_method: "DELETE",
        request_uri: "/networks/{networkId}/nodes/{nodeId}"
      )

      GET_ACCESSOR = OperationModel.new(
        name: "GetAccessor",
        http_method: "GET",
        request_uri: "/accessors/{AccessorId}"
      )

      GET_MEMBER = OperationModel.new(
        name: "GetMember",
        http_method: "GET",
        request_uri: "/networks/{networkId}/members/{memberId}"
      )

      GET_NETWORK = OperationModel.new(
        name: "GetNetwork",
        http_method: "GET",
        request_uri: "/networks/{networkId}"
      )

      GET_NODE = OperationModel.new(
        name: "GetNode",
        http_method: "GET",
        request_uri: "/networks/{networkId}/nodes/{nodeId}"
      )

      GET_PROPOSAL = OperationModel.new(
        name: "GetProposal",
        http_method: "GET",
        request_uri: "/networks/{networkId}/proposals/{proposalId}"
      )

      LIST_ACCESSORS = OperationModel.new(
        name: "ListAccessors",
        http_method: "GET",
        request_uri: "/accessors"
      )

      LIST_INVITATIONS = OperationModel.new(
        name: "ListInvitations",
        http_method: "GET",
        request_uri: "/invitations"
      )

      LIST_MEMBERS = OperationModel.new(
        name: "ListMembers",
        http_method: "GET",
        request_uri: "/networks/{networkId}/members"
      )

      LIST_NETWORKS = OperationModel.new(
        name: "ListNetworks",
        http_method: "GET",
        request_uri: "/networks"
      )

      LIST_NODES = OperationModel.new(
        name: "ListNodes",
        http_method: "GET",
        request_uri: "/networks/{networkId}/nodes"
      )

      LIST_PROPOSAL_VOTES = OperationModel.new(
        name: "ListProposalVotes",
        http_method: "GET",
        request_uri: "/networks/{networkId}/proposals/{proposalId}/votes"
      )

      LIST_PROPOSALS = OperationModel.new(
        name: "ListProposals",
        http_method: "GET",
        request_uri: "/networks/{networkId}/proposals"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      REJECT_INVITATION = OperationModel.new(
        name: "RejectInvitation",
        http_method: "DELETE",
        request_uri: "/invitations/{invitationId}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_MEMBER = OperationModel.new(
        name: "UpdateMember",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/members/{memberId}"
      )

      UPDATE_NODE = OperationModel.new(
        name: "UpdateNode",
        http_method: "PATCH",
        request_uri: "/networks/{networkId}/nodes/{nodeId}"
      )

      VOTE_ON_PROPOSAL = OperationModel.new(
        name: "VoteOnProposal",
        http_method: "POST",
        request_uri: "/networks/{networkId}/proposals/{proposalId}/votes"
      )
    end
  end
end
