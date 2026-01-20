module Aws
  module FMS
    module Model
      API_VERSION = "2018-01-01"
      TARGET_PREFIX = "AWSFMS_20180101"
      SIGNING_NAME = "fms"
      ENDPOINT_PREFIX = "fms"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fms-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fms-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fms.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://fms.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ADMIN_ACCOUNT = OperationModel.new(
        name: "AssociateAdminAccount",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_THIRD_PARTY_FIREWALL = OperationModel.new(
        name: "AssociateThirdPartyFirewall",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_ASSOCIATE_RESOURCE = OperationModel.new(
        name: "BatchAssociateResource",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DISASSOCIATE_RESOURCE = OperationModel.new(
        name: "BatchDisassociateResource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPS_LIST = OperationModel.new(
        name: "DeleteAppsList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NOTIFICATION_CHANNEL = OperationModel.new(
        name: "DeleteNotificationChannel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROTOCOLS_LIST = OperationModel.new(
        name: "DeleteProtocolsList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_SET = OperationModel.new(
        name: "DeleteResourceSet",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ADMIN_ACCOUNT = OperationModel.new(
        name: "DisassociateAdminAccount",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_THIRD_PARTY_FIREWALL = OperationModel.new(
        name: "DisassociateThirdPartyFirewall",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADMIN_ACCOUNT = OperationModel.new(
        name: "GetAdminAccount",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADMIN_SCOPE = OperationModel.new(
        name: "GetAdminScope",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPS_LIST = OperationModel.new(
        name: "GetAppsList",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMPLIANCE_DETAIL = OperationModel.new(
        name: "GetComplianceDetail",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NOTIFICATION_CHANNEL = OperationModel.new(
        name: "GetNotificationChannel",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROTECTION_STATUS = OperationModel.new(
        name: "GetProtectionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROTOCOLS_LIST = OperationModel.new(
        name: "GetProtocolsList",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_SET = OperationModel.new(
        name: "GetResourceSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_THIRD_PARTY_FIREWALL_ASSOCIATION_STATUS = OperationModel.new(
        name: "GetThirdPartyFirewallAssociationStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VIOLATION_DETAILS = OperationModel.new(
        name: "GetViolationDetails",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADMIN_ACCOUNTS_FOR_ORGANIZATION = OperationModel.new(
        name: "ListAdminAccountsForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADMINS_MANAGING_ACCOUNT = OperationModel.new(
        name: "ListAdminsManagingAccount",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPS_LISTS = OperationModel.new(
        name: "ListAppsLists",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPLIANCE_STATUS = OperationModel.new(
        name: "ListComplianceStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DISCOVERED_RESOURCES = OperationModel.new(
        name: "ListDiscoveredResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MEMBER_ACCOUNTS = OperationModel.new(
        name: "ListMemberAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICIES = OperationModel.new(
        name: "ListPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROTOCOLS_LISTS = OperationModel.new(
        name: "ListProtocolsLists",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SET_RESOURCES = OperationModel.new(
        name: "ListResourceSetResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SETS = OperationModel.new(
        name: "ListResourceSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_THIRD_PARTY_FIREWALL_FIREWALL_POLICIES = OperationModel.new(
        name: "ListThirdPartyFirewallFirewallPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ADMIN_ACCOUNT = OperationModel.new(
        name: "PutAdminAccount",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_APPS_LIST = OperationModel.new(
        name: "PutAppsList",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_NOTIFICATION_CHANNEL = OperationModel.new(
        name: "PutNotificationChannel",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_POLICY = OperationModel.new(
        name: "PutPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PROTOCOLS_LIST = OperationModel.new(
        name: "PutProtocolsList",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_SET = OperationModel.new(
        name: "PutResourceSet",
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
    end
  end
end
