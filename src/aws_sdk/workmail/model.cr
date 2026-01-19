module AwsSdk
  module WorkMail
    module Model
      API_VERSION = "2017-10-01"
      TARGET_PREFIX = "WorkMailService"
      SIGNING_NAME = "workmail"
      ENDPOINT_PREFIX = "workmail"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workmail-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workmail-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workmail.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://workmail.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_DELEGATE_TO_RESOURCE = OperationModel.new(
        name: "AssociateDelegateToResource",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_MEMBER_TO_GROUP = OperationModel.new(
        name: "AssociateMemberToGroup",
        http_method: "POST",
        request_uri: "/"
      )

      ASSUME_IMPERSONATION_ROLE = OperationModel.new(
        name: "AssumeImpersonationRole",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_MAILBOX_EXPORT_JOB = OperationModel.new(
        name: "CancelMailboxExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ALIAS = OperationModel.new(
        name: "CreateAlias",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AVAILABILITY_CONFIGURATION = OperationModel.new(
        name: "CreateAvailabilityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IDENTITY_CENTER_APPLICATION = OperationModel.new(
        name: "CreateIdentityCenterApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMPERSONATION_ROLE = OperationModel.new(
        name: "CreateImpersonationRole",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MOBILE_DEVICE_ACCESS_RULE = OperationModel.new(
        name: "CreateMobileDeviceAccessRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ORGANIZATION = OperationModel.new(
        name: "CreateOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOURCE = OperationModel.new(
        name: "CreateResource",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCESS_CONTROL_RULE = OperationModel.new(
        name: "DeleteAccessControlRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ALIAS = OperationModel.new(
        name: "DeleteAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AVAILABILITY_CONFIGURATION = OperationModel.new(
        name: "DeleteAvailabilityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EMAIL_MONITORING_CONFIGURATION = OperationModel.new(
        name: "DeleteEmailMonitoringConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITY_CENTER_APPLICATION = OperationModel.new(
        name: "DeleteIdentityCenterApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITY_PROVIDER_CONFIGURATION = OperationModel.new(
        name: "DeleteIdentityProviderConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMPERSONATION_ROLE = OperationModel.new(
        name: "DeleteImpersonationRole",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MAILBOX_PERMISSIONS = OperationModel.new(
        name: "DeleteMailboxPermissions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MOBILE_DEVICE_ACCESS_OVERRIDE = OperationModel.new(
        name: "DeleteMobileDeviceAccessOverride",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MOBILE_DEVICE_ACCESS_RULE = OperationModel.new(
        name: "DeleteMobileDeviceAccessRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ORGANIZATION = OperationModel.new(
        name: "DeleteOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PERSONAL_ACCESS_TOKEN = OperationModel.new(
        name: "DeletePersonalAccessToken",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE = OperationModel.new(
        name: "DeleteResource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RETENTION_POLICY = OperationModel.new(
        name: "DeleteRetentionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_FROM_WORK_MAIL = OperationModel.new(
        name: "DeregisterFromWorkMail",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_MAIL_DOMAIN = OperationModel.new(
        name: "DeregisterMailDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EMAIL_MONITORING_CONFIGURATION = OperationModel.new(
        name: "DescribeEmailMonitoringConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENTITY = OperationModel.new(
        name: "DescribeEntity",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GROUP = OperationModel.new(
        name: "DescribeGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IDENTITY_PROVIDER_CONFIGURATION = OperationModel.new(
        name: "DescribeIdentityProviderConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INBOUND_DMARC_SETTINGS = OperationModel.new(
        name: "DescribeInboundDmarcSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAILBOX_EXPORT_JOB = OperationModel.new(
        name: "DescribeMailboxExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORGANIZATION = OperationModel.new(
        name: "DescribeOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE = OperationModel.new(
        name: "DescribeResource",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER = OperationModel.new(
        name: "DescribeUser",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_DELEGATE_FROM_RESOURCE = OperationModel.new(
        name: "DisassociateDelegateFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_MEMBER_FROM_GROUP = OperationModel.new(
        name: "DisassociateMemberFromGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCESS_CONTROL_EFFECT = OperationModel.new(
        name: "GetAccessControlEffect",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEFAULT_RETENTION_POLICY = OperationModel.new(
        name: "GetDefaultRetentionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IMPERSONATION_ROLE = OperationModel.new(
        name: "GetImpersonationRole",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IMPERSONATION_ROLE_EFFECT = OperationModel.new(
        name: "GetImpersonationRoleEffect",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAIL_DOMAIN = OperationModel.new(
        name: "GetMailDomain",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MAILBOX_DETAILS = OperationModel.new(
        name: "GetMailboxDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MOBILE_DEVICE_ACCESS_EFFECT = OperationModel.new(
        name: "GetMobileDeviceAccessEffect",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MOBILE_DEVICE_ACCESS_OVERRIDE = OperationModel.new(
        name: "GetMobileDeviceAccessOverride",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PERSONAL_ACCESS_TOKEN_METADATA = OperationModel.new(
        name: "GetPersonalAccessTokenMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCESS_CONTROL_RULES = OperationModel.new(
        name: "ListAccessControlRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALIASES = OperationModel.new(
        name: "ListAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AVAILABILITY_CONFIGURATIONS = OperationModel.new(
        name: "ListAvailabilityConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUP_MEMBERS = OperationModel.new(
        name: "ListGroupMembers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUPS_FOR_ENTITY = OperationModel.new(
        name: "ListGroupsForEntity",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMPERSONATION_ROLES = OperationModel.new(
        name: "ListImpersonationRoles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MAIL_DOMAINS = OperationModel.new(
        name: "ListMailDomains",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MAILBOX_EXPORT_JOBS = OperationModel.new(
        name: "ListMailboxExportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MAILBOX_PERMISSIONS = OperationModel.new(
        name: "ListMailboxPermissions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MOBILE_DEVICE_ACCESS_OVERRIDES = OperationModel.new(
        name: "ListMobileDeviceAccessOverrides",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MOBILE_DEVICE_ACCESS_RULES = OperationModel.new(
        name: "ListMobileDeviceAccessRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ORGANIZATIONS = OperationModel.new(
        name: "ListOrganizations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PERSONAL_ACCESS_TOKENS = OperationModel.new(
        name: "ListPersonalAccessTokens",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_DELEGATES = OperationModel.new(
        name: "ListResourceDelegates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCES = OperationModel.new(
        name: "ListResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ACCESS_CONTROL_RULE = OperationModel.new(
        name: "PutAccessControlRule",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EMAIL_MONITORING_CONFIGURATION = OperationModel.new(
        name: "PutEmailMonitoringConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_IDENTITY_PROVIDER_CONFIGURATION = OperationModel.new(
        name: "PutIdentityProviderConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_INBOUND_DMARC_SETTINGS = OperationModel.new(
        name: "PutInboundDmarcSettings",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_MAILBOX_PERMISSIONS = OperationModel.new(
        name: "PutMailboxPermissions",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_MOBILE_DEVICE_ACCESS_OVERRIDE = OperationModel.new(
        name: "PutMobileDeviceAccessOverride",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RETENTION_POLICY = OperationModel.new(
        name: "PutRetentionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_MAIL_DOMAIN = OperationModel.new(
        name: "RegisterMailDomain",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TO_WORK_MAIL = OperationModel.new(
        name: "RegisterToWorkMail",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_PASSWORD = OperationModel.new(
        name: "ResetPassword",
        http_method: "POST",
        request_uri: "/"
      )

      START_MAILBOX_EXPORT_JOB = OperationModel.new(
        name: "StartMailboxExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_AVAILABILITY_CONFIGURATION = OperationModel.new(
        name: "TestAvailabilityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_AVAILABILITY_CONFIGURATION = OperationModel.new(
        name: "UpdateAvailabilityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEFAULT_MAIL_DOMAIN = OperationModel.new(
        name: "UpdateDefaultMailDomain",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_IMPERSONATION_ROLE = OperationModel.new(
        name: "UpdateImpersonationRole",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MAILBOX_QUOTA = OperationModel.new(
        name: "UpdateMailboxQuota",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MOBILE_DEVICE_ACCESS_RULE = OperationModel.new(
        name: "UpdateMobileDeviceAccessRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PRIMARY_EMAIL_ADDRESS = OperationModel.new(
        name: "UpdatePrimaryEmailAddress",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESOURCE = OperationModel.new(
        name: "UpdateResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
