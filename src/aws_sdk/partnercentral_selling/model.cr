module AwsSdk
  module PartnerCentralSelling
    module Model
      API_VERSION = "2022-07-26"
      TARGET_PREFIX = "AWSPartnerCentralSelling"
      SIGNING_NAME = "partnercentral-selling"
      ENDPOINT_PREFIX = "partnercentral-selling"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://partnercentral-selling-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://partnercentral-selling.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_ENGAGEMENT_INVITATION = OperationModel.new(
        name: "AcceptEngagementInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      ASSIGN_OPPORTUNITY = OperationModel.new(
        name: "AssignOpportunity",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_OPPORTUNITY = OperationModel.new(
        name: "AssociateOpportunity",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENGAGEMENT = OperationModel.new(
        name: "CreateEngagement",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENGAGEMENT_CONTEXT = OperationModel.new(
        name: "CreateEngagementContext",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENGAGEMENT_INVITATION = OperationModel.new(
        name: "CreateEngagementInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OPPORTUNITY = OperationModel.new(
        name: "CreateOpportunity",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOURCE_SNAPSHOT = OperationModel.new(
        name: "CreateResourceSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOURCE_SNAPSHOT_JOB = OperationModel.new(
        name: "CreateResourceSnapshotJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_SNAPSHOT_JOB = OperationModel.new(
        name: "DeleteResourceSnapshotJob",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_OPPORTUNITY = OperationModel.new(
        name: "DisassociateOpportunity",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AWS_OPPORTUNITY_SUMMARY = OperationModel.new(
        name: "GetAwsOpportunitySummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENGAGEMENT = OperationModel.new(
        name: "GetEngagement",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENGAGEMENT_INVITATION = OperationModel.new(
        name: "GetEngagementInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPPORTUNITY = OperationModel.new(
        name: "GetOpportunity",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_SNAPSHOT = OperationModel.new(
        name: "GetResourceSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_SNAPSHOT_JOB = OperationModel.new(
        name: "GetResourceSnapshotJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SELLING_SYSTEM_SETTINGS = OperationModel.new(
        name: "GetSellingSystemSettings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGAGEMENT_BY_ACCEPTING_INVITATION_TASKS = OperationModel.new(
        name: "ListEngagementByAcceptingInvitationTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGAGEMENT_FROM_OPPORTUNITY_TASKS = OperationModel.new(
        name: "ListEngagementFromOpportunityTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGAGEMENT_INVITATIONS = OperationModel.new(
        name: "ListEngagementInvitations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGAGEMENT_MEMBERS = OperationModel.new(
        name: "ListEngagementMembers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGAGEMENT_RESOURCE_ASSOCIATIONS = OperationModel.new(
        name: "ListEngagementResourceAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGAGEMENTS = OperationModel.new(
        name: "ListEngagements",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPPORTUNITIES = OperationModel.new(
        name: "ListOpportunities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPPORTUNITY_FROM_ENGAGEMENT_TASKS = OperationModel.new(
        name: "ListOpportunityFromEngagementTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SNAPSHOT_JOBS = OperationModel.new(
        name: "ListResourceSnapshotJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SNAPSHOTS = OperationModel.new(
        name: "ListResourceSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SOLUTIONS = OperationModel.new(
        name: "ListSolutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SELLING_SYSTEM_SETTINGS = OperationModel.new(
        name: "PutSellingSystemSettings",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_ENGAGEMENT_INVITATION = OperationModel.new(
        name: "RejectEngagementInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      START_ENGAGEMENT_BY_ACCEPTING_INVITATION_TASK = OperationModel.new(
        name: "StartEngagementByAcceptingInvitationTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_ENGAGEMENT_FROM_OPPORTUNITY_TASK = OperationModel.new(
        name: "StartEngagementFromOpportunityTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_OPPORTUNITY_FROM_ENGAGEMENT_TASK = OperationModel.new(
        name: "StartOpportunityFromEngagementTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_RESOURCE_SNAPSHOT_JOB = OperationModel.new(
        name: "StartResourceSnapshotJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_RESOURCE_SNAPSHOT_JOB = OperationModel.new(
        name: "StopResourceSnapshotJob",
        http_method: "POST",
        request_uri: "/"
      )

      SUBMIT_OPPORTUNITY = OperationModel.new(
        name: "SubmitOpportunity",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENGAGEMENT_CONTEXT = OperationModel.new(
        name: "UpdateEngagementContext",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_OPPORTUNITY = OperationModel.new(
        name: "UpdateOpportunity",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
