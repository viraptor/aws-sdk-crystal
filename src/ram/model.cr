module Aws
  module RAM
    module Model
      API_VERSION = "2018-01-04"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ram"
      ENDPOINT_PREFIX = "ram"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ram-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://ram.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://ram-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ram.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ram.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_RESOURCE_SHARE_INVITATION = OperationModel.new(
        name: "AcceptResourceShareInvitation",
        http_method: "POST",
        request_uri: "/acceptresourceshareinvitation"
      )

      ASSOCIATE_RESOURCE_SHARE = OperationModel.new(
        name: "AssociateResourceShare",
        http_method: "POST",
        request_uri: "/associateresourceshare"
      )

      ASSOCIATE_RESOURCE_SHARE_PERMISSION = OperationModel.new(
        name: "AssociateResourceSharePermission",
        http_method: "POST",
        request_uri: "/associateresourcesharepermission"
      )

      CREATE_PERMISSION = OperationModel.new(
        name: "CreatePermission",
        http_method: "POST",
        request_uri: "/createpermission"
      )

      CREATE_PERMISSION_VERSION = OperationModel.new(
        name: "CreatePermissionVersion",
        http_method: "POST",
        request_uri: "/createpermissionversion"
      )

      CREATE_RESOURCE_SHARE = OperationModel.new(
        name: "CreateResourceShare",
        http_method: "POST",
        request_uri: "/createresourceshare"
      )

      DELETE_PERMISSION = OperationModel.new(
        name: "DeletePermission",
        http_method: "DELETE",
        request_uri: "/deletepermission"
      )

      DELETE_PERMISSION_VERSION = OperationModel.new(
        name: "DeletePermissionVersion",
        http_method: "DELETE",
        request_uri: "/deletepermissionversion"
      )

      DELETE_RESOURCE_SHARE = OperationModel.new(
        name: "DeleteResourceShare",
        http_method: "DELETE",
        request_uri: "/deleteresourceshare"
      )

      DISASSOCIATE_RESOURCE_SHARE = OperationModel.new(
        name: "DisassociateResourceShare",
        http_method: "POST",
        request_uri: "/disassociateresourceshare"
      )

      DISASSOCIATE_RESOURCE_SHARE_PERMISSION = OperationModel.new(
        name: "DisassociateResourceSharePermission",
        http_method: "POST",
        request_uri: "/disassociateresourcesharepermission"
      )

      ENABLE_SHARING_WITH_AWS_ORGANIZATION = OperationModel.new(
        name: "EnableSharingWithAwsOrganization",
        http_method: "POST",
        request_uri: "/enablesharingwithawsorganization"
      )

      GET_PERMISSION = OperationModel.new(
        name: "GetPermission",
        http_method: "POST",
        request_uri: "/getpermission"
      )

      GET_RESOURCE_POLICIES = OperationModel.new(
        name: "GetResourcePolicies",
        http_method: "POST",
        request_uri: "/getresourcepolicies"
      )

      GET_RESOURCE_SHARE_ASSOCIATIONS = OperationModel.new(
        name: "GetResourceShareAssociations",
        http_method: "POST",
        request_uri: "/getresourceshareassociations"
      )

      GET_RESOURCE_SHARE_INVITATIONS = OperationModel.new(
        name: "GetResourceShareInvitations",
        http_method: "POST",
        request_uri: "/getresourceshareinvitations"
      )

      GET_RESOURCE_SHARES = OperationModel.new(
        name: "GetResourceShares",
        http_method: "POST",
        request_uri: "/getresourceshares"
      )

      LIST_PENDING_INVITATION_RESOURCES = OperationModel.new(
        name: "ListPendingInvitationResources",
        http_method: "POST",
        request_uri: "/listpendinginvitationresources"
      )

      LIST_PERMISSION_ASSOCIATIONS = OperationModel.new(
        name: "ListPermissionAssociations",
        http_method: "POST",
        request_uri: "/listpermissionassociations"
      )

      LIST_PERMISSION_VERSIONS = OperationModel.new(
        name: "ListPermissionVersions",
        http_method: "POST",
        request_uri: "/listpermissionversions"
      )

      LIST_PERMISSIONS = OperationModel.new(
        name: "ListPermissions",
        http_method: "POST",
        request_uri: "/listpermissions"
      )

      LIST_PRINCIPALS = OperationModel.new(
        name: "ListPrincipals",
        http_method: "POST",
        request_uri: "/listprincipals"
      )

      LIST_REPLACE_PERMISSION_ASSOCIATIONS_WORK = OperationModel.new(
        name: "ListReplacePermissionAssociationsWork",
        http_method: "POST",
        request_uri: "/listreplacepermissionassociationswork"
      )

      LIST_RESOURCE_SHARE_PERMISSIONS = OperationModel.new(
        name: "ListResourceSharePermissions",
        http_method: "POST",
        request_uri: "/listresourcesharepermissions"
      )

      LIST_RESOURCE_TYPES = OperationModel.new(
        name: "ListResourceTypes",
        http_method: "POST",
        request_uri: "/listresourcetypes"
      )

      LIST_RESOURCES = OperationModel.new(
        name: "ListResources",
        http_method: "POST",
        request_uri: "/listresources"
      )

      PROMOTE_PERMISSION_CREATED_FROM_POLICY = OperationModel.new(
        name: "PromotePermissionCreatedFromPolicy",
        http_method: "POST",
        request_uri: "/promotepermissioncreatedfrompolicy"
      )

      PROMOTE_RESOURCE_SHARE_CREATED_FROM_POLICY = OperationModel.new(
        name: "PromoteResourceShareCreatedFromPolicy",
        http_method: "POST",
        request_uri: "/promoteresourcesharecreatedfrompolicy"
      )

      REJECT_RESOURCE_SHARE_INVITATION = OperationModel.new(
        name: "RejectResourceShareInvitation",
        http_method: "POST",
        request_uri: "/rejectresourceshareinvitation"
      )

      REPLACE_PERMISSION_ASSOCIATIONS = OperationModel.new(
        name: "ReplacePermissionAssociations",
        http_method: "POST",
        request_uri: "/replacepermissionassociations"
      )

      SET_DEFAULT_PERMISSION_VERSION = OperationModel.new(
        name: "SetDefaultPermissionVersion",
        http_method: "POST",
        request_uri: "/setdefaultpermissionversion"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tagresource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/untagresource"
      )

      UPDATE_RESOURCE_SHARE = OperationModel.new(
        name: "UpdateResourceShare",
        http_method: "POST",
        request_uri: "/updateresourceshare"
      )
    end
  end
end
