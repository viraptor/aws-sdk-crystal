module AwsSdk
  module Detective
    module Model
      API_VERSION = "2018-10-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "detective"
      ENDPOINT_PREFIX = "api.detective"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://detective.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://detective-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://detective.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://detective-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.detective-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.detective-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.detective.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://api.detective.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_INVITATION = OperationModel.new(
        name: "AcceptInvitation",
        http_method: "PUT",
        request_uri: "/invitation"
      )

      BATCH_GET_GRAPH_MEMBER_DATASOURCES = OperationModel.new(
        name: "BatchGetGraphMemberDatasources",
        http_method: "POST",
        request_uri: "/graph/datasources/get"
      )

      BATCH_GET_MEMBERSHIP_DATASOURCES = OperationModel.new(
        name: "BatchGetMembershipDatasources",
        http_method: "POST",
        request_uri: "/membership/datasources/get"
      )

      CREATE_GRAPH = OperationModel.new(
        name: "CreateGraph",
        http_method: "POST",
        request_uri: "/graph"
      )

      CREATE_MEMBERS = OperationModel.new(
        name: "CreateMembers",
        http_method: "POST",
        request_uri: "/graph/members"
      )

      DELETE_GRAPH = OperationModel.new(
        name: "DeleteGraph",
        http_method: "POST",
        request_uri: "/graph/removal"
      )

      DELETE_MEMBERS = OperationModel.new(
        name: "DeleteMembers",
        http_method: "POST",
        request_uri: "/graph/members/removal"
      )

      DESCRIBE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "DescribeOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/orgs/describeOrganizationConfiguration"
      )

      DISABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "DisableOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/orgs/disableAdminAccount"
      )

      DISASSOCIATE_MEMBERSHIP = OperationModel.new(
        name: "DisassociateMembership",
        http_method: "POST",
        request_uri: "/membership/removal"
      )

      ENABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "EnableOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/orgs/enableAdminAccount"
      )

      GET_INVESTIGATION = OperationModel.new(
        name: "GetInvestigation",
        http_method: "POST",
        request_uri: "/investigations/getInvestigation"
      )

      GET_MEMBERS = OperationModel.new(
        name: "GetMembers",
        http_method: "POST",
        request_uri: "/graph/members/get"
      )

      LIST_DATASOURCE_PACKAGES = OperationModel.new(
        name: "ListDatasourcePackages",
        http_method: "POST",
        request_uri: "/graph/datasources/list"
      )

      LIST_GRAPHS = OperationModel.new(
        name: "ListGraphs",
        http_method: "POST",
        request_uri: "/graphs/list"
      )

      LIST_INDICATORS = OperationModel.new(
        name: "ListIndicators",
        http_method: "POST",
        request_uri: "/investigations/listIndicators"
      )

      LIST_INVESTIGATIONS = OperationModel.new(
        name: "ListInvestigations",
        http_method: "POST",
        request_uri: "/investigations/listInvestigations"
      )

      LIST_INVITATIONS = OperationModel.new(
        name: "ListInvitations",
        http_method: "POST",
        request_uri: "/invitations/list"
      )

      LIST_MEMBERS = OperationModel.new(
        name: "ListMembers",
        http_method: "POST",
        request_uri: "/graph/members/list"
      )

      LIST_ORGANIZATION_ADMIN_ACCOUNTS = OperationModel.new(
        name: "ListOrganizationAdminAccounts",
        http_method: "POST",
        request_uri: "/orgs/adminAccountslist"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      REJECT_INVITATION = OperationModel.new(
        name: "RejectInvitation",
        http_method: "POST",
        request_uri: "/invitation/removal"
      )

      START_INVESTIGATION = OperationModel.new(
        name: "StartInvestigation",
        http_method: "POST",
        request_uri: "/investigations/startInvestigation"
      )

      START_MONITORING_MEMBER = OperationModel.new(
        name: "StartMonitoringMember",
        http_method: "POST",
        request_uri: "/graph/member/monitoringstate"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_DATASOURCE_PACKAGES = OperationModel.new(
        name: "UpdateDatasourcePackages",
        http_method: "POST",
        request_uri: "/graph/datasources/update"
      )

      UPDATE_INVESTIGATION_STATE = OperationModel.new(
        name: "UpdateInvestigationState",
        http_method: "POST",
        request_uri: "/investigations/updateInvestigationState"
      )

      UPDATE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "UpdateOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/orgs/updateOrganizationConfiguration"
      )
    end
  end
end
