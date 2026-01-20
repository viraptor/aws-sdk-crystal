module Aws
  module Organizations
    module Model
      API_VERSION = "2016-11-28"
      TARGET_PREFIX = "AWSOrganizationsV20161128"
      SIGNING_NAME = "organizations"
      ENDPOINT_PREFIX = "organizations"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations.us-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations-fips.us-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations.cn-northwest-1.amazonaws.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations.us-gov-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations.us-gov-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations.us-iso-east-1.c2s.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"us-iso-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations.us-isob-east-1.sc2s.sgov.gov","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"us-isob-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://organizations.us-isof-south-1.csp.hci.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingName":"organizations","signingRegion":"us-isof-south-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://organizations-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://organizations-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://organizations.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://organizations.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_HANDSHAKE = OperationModel.new(
        name: "AcceptHandshake",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_POLICY = OperationModel.new(
        name: "AttachPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_HANDSHAKE = OperationModel.new(
        name: "CancelHandshake",
        http_method: "POST",
        request_uri: "/"
      )

      CLOSE_ACCOUNT = OperationModel.new(
        name: "CloseAccount",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCOUNT = OperationModel.new(
        name: "CreateAccount",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GOV_CLOUD_ACCOUNT = OperationModel.new(
        name: "CreateGovCloudAccount",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ORGANIZATION = OperationModel.new(
        name: "CreateOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ORGANIZATIONAL_UNIT = OperationModel.new(
        name: "CreateOrganizationalUnit",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_POLICY = OperationModel.new(
        name: "CreatePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DECLINE_HANDSHAKE = OperationModel.new(
        name: "DeclineHandshake",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ORGANIZATION = OperationModel.new(
        name: "DeleteOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ORGANIZATIONAL_UNIT = OperationModel.new(
        name: "DeleteOrganizationalUnit",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_DELEGATED_ADMINISTRATOR = OperationModel.new(
        name: "DeregisterDelegatedAdministrator",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT = OperationModel.new(
        name: "DescribeAccount",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CREATE_ACCOUNT_STATUS = OperationModel.new(
        name: "DescribeCreateAccountStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EFFECTIVE_POLICY = OperationModel.new(
        name: "DescribeEffectivePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HANDSHAKE = OperationModel.new(
        name: "DescribeHandshake",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATION = OperationModel.new(
        name: "DescribeOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATIONAL_UNIT = OperationModel.new(
        name: "DescribeOrganizationalUnit",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_POLICY = OperationModel.new(
        name: "DescribePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_POLICY = OperationModel.new(
        name: "DescribeResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESPONSIBILITY_TRANSFER = OperationModel.new(
        name: "DescribeResponsibilityTransfer",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_POLICY = OperationModel.new(
        name: "DetachPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_AWS_SERVICE_ACCESS = OperationModel.new(
        name: "DisableAWSServiceAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_POLICY_TYPE = OperationModel.new(
        name: "DisablePolicyType",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_AWS_SERVICE_ACCESS = OperationModel.new(
        name: "EnableAWSServiceAccess",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ALL_FEATURES = OperationModel.new(
        name: "EnableAllFeatures",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_POLICY_TYPE = OperationModel.new(
        name: "EnablePolicyType",
        http_method: "POST",
        request_uri: "/"
      )

      INVITE_ACCOUNT_TO_ORGANIZATION = OperationModel.new(
        name: "InviteAccountToOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      INVITE_ORGANIZATION_TO_TRANSFER_RESPONSIBILITY = OperationModel.new(
        name: "InviteOrganizationToTransferResponsibility",
        http_method: "POST",
        request_uri: "/"
      )

      LEAVE_ORGANIZATION = OperationModel.new(
        name: "LeaveOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AWS_SERVICE_ACCESS_FOR_ORGANIZATION = OperationModel.new(
        name: "ListAWSServiceAccessForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNTS = OperationModel.new(
        name: "ListAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNTS_FOR_PARENT = OperationModel.new(
        name: "ListAccountsForParent",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNTS_WITH_INVALID_EFFECTIVE_POLICY = OperationModel.new(
        name: "ListAccountsWithInvalidEffectivePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CHILDREN = OperationModel.new(
        name: "ListChildren",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CREATE_ACCOUNT_STATUS = OperationModel.new(
        name: "ListCreateAccountStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DELEGATED_ADMINISTRATORS = OperationModel.new(
        name: "ListDelegatedAdministrators",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DELEGATED_SERVICES_FOR_ACCOUNT = OperationModel.new(
        name: "ListDelegatedServicesForAccount",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EFFECTIVE_POLICY_VALIDATION_ERRORS = OperationModel.new(
        name: "ListEffectivePolicyValidationErrors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HANDSHAKES_FOR_ACCOUNT = OperationModel.new(
        name: "ListHandshakesForAccount",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HANDSHAKES_FOR_ORGANIZATION = OperationModel.new(
        name: "ListHandshakesForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INBOUND_RESPONSIBILITY_TRANSFERS = OperationModel.new(
        name: "ListInboundResponsibilityTransfers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ORGANIZATIONAL_UNITS_FOR_PARENT = OperationModel.new(
        name: "ListOrganizationalUnitsForParent",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OUTBOUND_RESPONSIBILITY_TRANSFERS = OperationModel.new(
        name: "ListOutboundResponsibilityTransfers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PARENTS = OperationModel.new(
        name: "ListParents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICIES = OperationModel.new(
        name: "ListPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICIES_FOR_TARGET = OperationModel.new(
        name: "ListPoliciesForTarget",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ROOTS = OperationModel.new(
        name: "ListRoots",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TARGETS_FOR_POLICY = OperationModel.new(
        name: "ListTargetsForPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      MOVE_ACCOUNT = OperationModel.new(
        name: "MoveAccount",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_DELEGATED_ADMINISTRATOR = OperationModel.new(
        name: "RegisterDelegatedAdministrator",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_ACCOUNT_FROM_ORGANIZATION = OperationModel.new(
        name: "RemoveAccountFromOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_RESPONSIBILITY_TRANSFER = OperationModel.new(
        name: "TerminateResponsibilityTransfer",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ORGANIZATIONAL_UNIT = OperationModel.new(
        name: "UpdateOrganizationalUnit",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_POLICY = OperationModel.new(
        name: "UpdatePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESPONSIBILITY_TRANSFER = OperationModel.new(
        name: "UpdateResponsibilityTransfer",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
