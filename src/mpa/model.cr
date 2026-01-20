module Aws
  module MPA
    module Model
      API_VERSION = "2022-07-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mpa"
      ENDPOINT_PREFIX = "mpa"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://mpa-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://mpa.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_SESSION = OperationModel.new(
        name: "CancelSession",
        http_method: "PUT",
        request_uri: "/sessions/{SessionArn}"
      )

      CREATE_APPROVAL_TEAM = OperationModel.new(
        name: "CreateApprovalTeam",
        http_method: "POST",
        request_uri: "/approval-teams"
      )

      CREATE_IDENTITY_SOURCE = OperationModel.new(
        name: "CreateIdentitySource",
        http_method: "POST",
        request_uri: "/identity-sources"
      )

      DELETE_IDENTITY_SOURCE = OperationModel.new(
        name: "DeleteIdentitySource",
        http_method: "DELETE",
        request_uri: "/identity-sources/{IdentitySourceArn}"
      )

      DELETE_INACTIVE_APPROVAL_TEAM_VERSION = OperationModel.new(
        name: "DeleteInactiveApprovalTeamVersion",
        http_method: "DELETE",
        request_uri: "/approval-teams/{Arn}/{VersionId}"
      )

      GET_APPROVAL_TEAM = OperationModel.new(
        name: "GetApprovalTeam",
        http_method: "GET",
        request_uri: "/approval-teams/{Arn}"
      )

      GET_IDENTITY_SOURCE = OperationModel.new(
        name: "GetIdentitySource",
        http_method: "GET",
        request_uri: "/identity-sources/{IdentitySourceArn}"
      )

      GET_POLICY_VERSION = OperationModel.new(
        name: "GetPolicyVersion",
        http_method: "GET",
        request_uri: "/policy-versions/{PolicyVersionArn}"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/GetResourcePolicy"
      )

      GET_SESSION = OperationModel.new(
        name: "GetSession",
        http_method: "GET",
        request_uri: "/sessions/{SessionArn}"
      )

      LIST_APPROVAL_TEAMS = OperationModel.new(
        name: "ListApprovalTeams",
        http_method: "POST",
        request_uri: "/approval-teams/?List"
      )

      LIST_IDENTITY_SOURCES = OperationModel.new(
        name: "ListIdentitySources",
        http_method: "POST",
        request_uri: "/identity-sources/?List"
      )

      LIST_POLICIES = OperationModel.new(
        name: "ListPolicies",
        http_method: "POST",
        request_uri: "/policies/?List"
      )

      LIST_POLICY_VERSIONS = OperationModel.new(
        name: "ListPolicyVersions",
        http_method: "POST",
        request_uri: "/policies/{PolicyArn}/?List"
      )

      LIST_RESOURCE_POLICIES = OperationModel.new(
        name: "ListResourcePolicies",
        http_method: "POST",
        request_uri: "/resource-policies/{ResourceArn}/?List"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "POST",
        request_uri: "/approval-teams/{ApprovalTeamArn}/sessions/?List"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      START_ACTIVE_APPROVAL_TEAM_DELETION = OperationModel.new(
        name: "StartActiveApprovalTeamDeletion",
        http_method: "POST",
        request_uri: "/approval-teams/{Arn}?Delete"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "PUT",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_APPROVAL_TEAM = OperationModel.new(
        name: "UpdateApprovalTeam",
        http_method: "PATCH",
        request_uri: "/approval-teams/{Arn}"
      )
    end
  end
end
