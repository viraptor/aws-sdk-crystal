module Aws
  module IAM
    module Model
      API_VERSION = "2010-05-08"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iam"
      ENDPOINT_PREFIX = "iam"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://iam.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://iam-fips.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://iam.global.api.amazonwebservices.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"cn-north-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.cn-north-1.amazonaws.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"cn-north-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://iam.us-gov.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://iam.us-gov.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.us-gov.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.us-gov.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.us-iso-east-1.c2s.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-iso-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam-fips.us-iso-east-1.c2s.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-iso-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.us-isob-east-1.sc2s.sgov.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isob-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam-fips.us-isob-east-1.sc2s.sgov.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isob-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.eu-isoe-west-1.cloud.adc-e.uk","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eu-isoe-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.us-isof-south-1.csp.hci.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isof-south-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://iam.eusc-de-east-1.amazonaws.eu","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eusc-de-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iam-fips.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iam-fips.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iam.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://iam.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_DELEGATION_REQUEST = OperationModel.new(
        name: "AcceptDelegationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_CLIENT_ID_TO_OPEN_ID_CONNECT_PROVIDER = OperationModel.new(
        name: "AddClientIDToOpenIDConnectProvider",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_ROLE_TO_INSTANCE_PROFILE = OperationModel.new(
        name: "AddRoleToInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_USER_TO_GROUP = OperationModel.new(
        name: "AddUserToGroup",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_DELEGATION_REQUEST = OperationModel.new(
        name: "AssociateDelegationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_GROUP_POLICY = OperationModel.new(
        name: "AttachGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_ROLE_POLICY = OperationModel.new(
        name: "AttachRolePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_USER_POLICY = OperationModel.new(
        name: "AttachUserPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CHANGE_PASSWORD = OperationModel.new(
        name: "ChangePassword",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCESS_KEY = OperationModel.new(
        name: "CreateAccessKey",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCOUNT_ALIAS = OperationModel.new(
        name: "CreateAccountAlias",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DELEGATION_REQUEST = OperationModel.new(
        name: "CreateDelegationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_PROFILE = OperationModel.new(
        name: "CreateInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOGIN_PROFILE = OperationModel.new(
        name: "CreateLoginProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OPEN_ID_CONNECT_PROVIDER = OperationModel.new(
        name: "CreateOpenIDConnectProvider",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_POLICY = OperationModel.new(
        name: "CreatePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_POLICY_VERSION = OperationModel.new(
        name: "CreatePolicyVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROLE = OperationModel.new(
        name: "CreateRole",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SAML_PROVIDER = OperationModel.new(
        name: "CreateSAMLProvider",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE_LINKED_ROLE = OperationModel.new(
        name: "CreateServiceLinkedRole",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE_SPECIFIC_CREDENTIAL = OperationModel.new(
        name: "CreateServiceSpecificCredential",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VIRTUAL_MFA_DEVICE = OperationModel.new(
        name: "CreateVirtualMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      DEACTIVATE_MFA_DEVICE = OperationModel.new(
        name: "DeactivateMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCESS_KEY = OperationModel.new(
        name: "DeleteAccessKey",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCOUNT_ALIAS = OperationModel.new(
        name: "DeleteAccountAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCOUNT_PASSWORD_POLICY = OperationModel.new(
        name: "DeleteAccountPasswordPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GROUP_POLICY = OperationModel.new(
        name: "DeleteGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE_PROFILE = OperationModel.new(
        name: "DeleteInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOGIN_PROFILE = OperationModel.new(
        name: "DeleteLoginProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OPEN_ID_CONNECT_PROVIDER = OperationModel.new(
        name: "DeleteOpenIDConnectProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY_VERSION = OperationModel.new(
        name: "DeletePolicyVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROLE = OperationModel.new(
        name: "DeleteRole",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROLE_PERMISSIONS_BOUNDARY = OperationModel.new(
        name: "DeleteRolePermissionsBoundary",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROLE_POLICY = OperationModel.new(
        name: "DeleteRolePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SAML_PROVIDER = OperationModel.new(
        name: "DeleteSAMLProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SSH_PUBLIC_KEY = OperationModel.new(
        name: "DeleteSSHPublicKey",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVER_CERTIFICATE = OperationModel.new(
        name: "DeleteServerCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_LINKED_ROLE = OperationModel.new(
        name: "DeleteServiceLinkedRole",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_SPECIFIC_CREDENTIAL = OperationModel.new(
        name: "DeleteServiceSpecificCredential",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SIGNING_CERTIFICATE = OperationModel.new(
        name: "DeleteSigningCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_PERMISSIONS_BOUNDARY = OperationModel.new(
        name: "DeleteUserPermissionsBoundary",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_POLICY = OperationModel.new(
        name: "DeleteUserPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VIRTUAL_MFA_DEVICE = OperationModel.new(
        name: "DeleteVirtualMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_GROUP_POLICY = OperationModel.new(
        name: "DetachGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_ROLE_POLICY = OperationModel.new(
        name: "DetachRolePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_USER_POLICY = OperationModel.new(
        name: "DetachUserPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_ORGANIZATIONS_ROOT_CREDENTIALS_MANAGEMENT = OperationModel.new(
        name: "DisableOrganizationsRootCredentialsManagement",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_ORGANIZATIONS_ROOT_SESSIONS = OperationModel.new(
        name: "DisableOrganizationsRootSessions",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_OUTBOUND_WEB_IDENTITY_FEDERATION = OperationModel.new(
        name: "DisableOutboundWebIdentityFederation",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_MFA_DEVICE = OperationModel.new(
        name: "EnableMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ORGANIZATIONS_ROOT_CREDENTIALS_MANAGEMENT = OperationModel.new(
        name: "EnableOrganizationsRootCredentialsManagement",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ORGANIZATIONS_ROOT_SESSIONS = OperationModel.new(
        name: "EnableOrganizationsRootSessions",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_OUTBOUND_WEB_IDENTITY_FEDERATION = OperationModel.new(
        name: "EnableOutboundWebIdentityFederation",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_CREDENTIAL_REPORT = OperationModel.new(
        name: "GenerateCredentialReport",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_ORGANIZATIONS_ACCESS_REPORT = OperationModel.new(
        name: "GenerateOrganizationsAccessReport",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_SERVICE_LAST_ACCESSED_DETAILS = OperationModel.new(
        name: "GenerateServiceLastAccessedDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCESS_KEY_LAST_USED = OperationModel.new(
        name: "GetAccessKeyLastUsed",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_AUTHORIZATION_DETAILS = OperationModel.new(
        name: "GetAccountAuthorizationDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_PASSWORD_POLICY = OperationModel.new(
        name: "GetAccountPasswordPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_SUMMARY = OperationModel.new(
        name: "GetAccountSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTEXT_KEYS_FOR_CUSTOM_POLICY = OperationModel.new(
        name: "GetContextKeysForCustomPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTEXT_KEYS_FOR_PRINCIPAL_POLICY = OperationModel.new(
        name: "GetContextKeysForPrincipalPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CREDENTIAL_REPORT = OperationModel.new(
        name: "GetCredentialReport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DELEGATION_REQUEST = OperationModel.new(
        name: "GetDelegationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GROUP = OperationModel.new(
        name: "GetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GROUP_POLICY = OperationModel.new(
        name: "GetGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_HUMAN_READABLE_SUMMARY = OperationModel.new(
        name: "GetHumanReadableSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_PROFILE = OperationModel.new(
        name: "GetInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOGIN_PROFILE = OperationModel.new(
        name: "GetLoginProfile",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MFA_DEVICE = OperationModel.new(
        name: "GetMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPEN_ID_CONNECT_PROVIDER = OperationModel.new(
        name: "GetOpenIDConnectProvider",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ORGANIZATIONS_ACCESS_REPORT = OperationModel.new(
        name: "GetOrganizationsAccessReport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OUTBOUND_WEB_IDENTITY_FEDERATION_INFO = OperationModel.new(
        name: "GetOutboundWebIdentityFederationInfo",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICY_VERSION = OperationModel.new(
        name: "GetPolicyVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ROLE = OperationModel.new(
        name: "GetRole",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ROLE_POLICY = OperationModel.new(
        name: "GetRolePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAML_PROVIDER = OperationModel.new(
        name: "GetSAMLProvider",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SSH_PUBLIC_KEY = OperationModel.new(
        name: "GetSSHPublicKey",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVER_CERTIFICATE = OperationModel.new(
        name: "GetServerCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_LAST_ACCESSED_DETAILS = OperationModel.new(
        name: "GetServiceLastAccessedDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_LAST_ACCESSED_DETAILS_WITH_ENTITIES = OperationModel.new(
        name: "GetServiceLastAccessedDetailsWithEntities",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_LINKED_ROLE_DELETION_STATUS = OperationModel.new(
        name: "GetServiceLinkedRoleDeletionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER = OperationModel.new(
        name: "GetUser",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER_POLICY = OperationModel.new(
        name: "GetUserPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCESS_KEYS = OperationModel.new(
        name: "ListAccessKeys",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_ALIASES = OperationModel.new(
        name: "ListAccountAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ATTACHED_GROUP_POLICIES = OperationModel.new(
        name: "ListAttachedGroupPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ATTACHED_ROLE_POLICIES = OperationModel.new(
        name: "ListAttachedRolePolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ATTACHED_USER_POLICIES = OperationModel.new(
        name: "ListAttachedUserPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DELEGATION_REQUESTS = OperationModel.new(
        name: "ListDelegationRequests",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITIES_FOR_POLICY = OperationModel.new(
        name: "ListEntitiesForPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUP_POLICIES = OperationModel.new(
        name: "ListGroupPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUPS_FOR_USER = OperationModel.new(
        name: "ListGroupsForUser",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCE_PROFILE_TAGS = OperationModel.new(
        name: "ListInstanceProfileTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCE_PROFILES = OperationModel.new(
        name: "ListInstanceProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCE_PROFILES_FOR_ROLE = OperationModel.new(
        name: "ListInstanceProfilesForRole",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MFA_DEVICE_TAGS = OperationModel.new(
        name: "ListMFADeviceTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MFA_DEVICES = OperationModel.new(
        name: "ListMFADevices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPEN_ID_CONNECT_PROVIDER_TAGS = OperationModel.new(
        name: "ListOpenIDConnectProviderTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPEN_ID_CONNECT_PROVIDERS = OperationModel.new(
        name: "ListOpenIDConnectProviders",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ORGANIZATIONS_FEATURES = OperationModel.new(
        name: "ListOrganizationsFeatures",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICIES = OperationModel.new(
        name: "ListPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICIES_GRANTING_SERVICE_ACCESS = OperationModel.new(
        name: "ListPoliciesGrantingServiceAccess",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICY_TAGS = OperationModel.new(
        name: "ListPolicyTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POLICY_VERSIONS = OperationModel.new(
        name: "ListPolicyVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ROLE_POLICIES = OperationModel.new(
        name: "ListRolePolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ROLE_TAGS = OperationModel.new(
        name: "ListRoleTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ROLES = OperationModel.new(
        name: "ListRoles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SAML_PROVIDER_TAGS = OperationModel.new(
        name: "ListSAMLProviderTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SAML_PROVIDERS = OperationModel.new(
        name: "ListSAMLProviders",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SSH_PUBLIC_KEYS = OperationModel.new(
        name: "ListSSHPublicKeys",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVER_CERTIFICATE_TAGS = OperationModel.new(
        name: "ListServerCertificateTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVER_CERTIFICATES = OperationModel.new(
        name: "ListServerCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_SPECIFIC_CREDENTIALS = OperationModel.new(
        name: "ListServiceSpecificCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SIGNING_CERTIFICATES = OperationModel.new(
        name: "ListSigningCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USER_POLICIES = OperationModel.new(
        name: "ListUserPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USER_TAGS = OperationModel.new(
        name: "ListUserTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VIRTUAL_MFA_DEVICES = OperationModel.new(
        name: "ListVirtualMFADevices",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_GROUP_POLICY = OperationModel.new(
        name: "PutGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ROLE_PERMISSIONS_BOUNDARY = OperationModel.new(
        name: "PutRolePermissionsBoundary",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ROLE_POLICY = OperationModel.new(
        name: "PutRolePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_USER_PERMISSIONS_BOUNDARY = OperationModel.new(
        name: "PutUserPermissionsBoundary",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_USER_POLICY = OperationModel.new(
        name: "PutUserPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_DELEGATION_REQUEST = OperationModel.new(
        name: "RejectDelegationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_CLIENT_ID_FROM_OPEN_ID_CONNECT_PROVIDER = OperationModel.new(
        name: "RemoveClientIDFromOpenIDConnectProvider",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_ROLE_FROM_INSTANCE_PROFILE = OperationModel.new(
        name: "RemoveRoleFromInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_USER_FROM_GROUP = OperationModel.new(
        name: "RemoveUserFromGroup",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_SERVICE_SPECIFIC_CREDENTIAL = OperationModel.new(
        name: "ResetServiceSpecificCredential",
        http_method: "POST",
        request_uri: "/"
      )

      RESYNC_MFA_DEVICE = OperationModel.new(
        name: "ResyncMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_DELEGATION_TOKEN = OperationModel.new(
        name: "SendDelegationToken",
        http_method: "POST",
        request_uri: "/"
      )

      SET_DEFAULT_POLICY_VERSION = OperationModel.new(
        name: "SetDefaultPolicyVersion",
        http_method: "POST",
        request_uri: "/"
      )

      SET_SECURITY_TOKEN_SERVICE_PREFERENCES = OperationModel.new(
        name: "SetSecurityTokenServicePreferences",
        http_method: "POST",
        request_uri: "/"
      )

      SIMULATE_CUSTOM_POLICY = OperationModel.new(
        name: "SimulateCustomPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      SIMULATE_PRINCIPAL_POLICY = OperationModel.new(
        name: "SimulatePrincipalPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_INSTANCE_PROFILE = OperationModel.new(
        name: "TagInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_MFA_DEVICE = OperationModel.new(
        name: "TagMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_OPEN_ID_CONNECT_PROVIDER = OperationModel.new(
        name: "TagOpenIDConnectProvider",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_POLICY = OperationModel.new(
        name: "TagPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_ROLE = OperationModel.new(
        name: "TagRole",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_SAML_PROVIDER = OperationModel.new(
        name: "TagSAMLProvider",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_SERVER_CERTIFICATE = OperationModel.new(
        name: "TagServerCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_USER = OperationModel.new(
        name: "TagUser",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_INSTANCE_PROFILE = OperationModel.new(
        name: "UntagInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_MFA_DEVICE = OperationModel.new(
        name: "UntagMFADevice",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_OPEN_ID_CONNECT_PROVIDER = OperationModel.new(
        name: "UntagOpenIDConnectProvider",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_POLICY = OperationModel.new(
        name: "UntagPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_ROLE = OperationModel.new(
        name: "UntagRole",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_SAML_PROVIDER = OperationModel.new(
        name: "UntagSAMLProvider",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_SERVER_CERTIFICATE = OperationModel.new(
        name: "UntagServerCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_USER = OperationModel.new(
        name: "UntagUser",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCESS_KEY = OperationModel.new(
        name: "UpdateAccessKey",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCOUNT_PASSWORD_POLICY = OperationModel.new(
        name: "UpdateAccountPasswordPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ASSUME_ROLE_POLICY = OperationModel.new(
        name: "UpdateAssumeRolePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DELEGATION_REQUEST = OperationModel.new(
        name: "UpdateDelegationRequest",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOGIN_PROFILE = OperationModel.new(
        name: "UpdateLoginProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_OPEN_ID_CONNECT_PROVIDER_THUMBPRINT = OperationModel.new(
        name: "UpdateOpenIDConnectProviderThumbprint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ROLE = OperationModel.new(
        name: "UpdateRole",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ROLE_DESCRIPTION = OperationModel.new(
        name: "UpdateRoleDescription",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SAML_PROVIDER = OperationModel.new(
        name: "UpdateSAMLProvider",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SSH_PUBLIC_KEY = OperationModel.new(
        name: "UpdateSSHPublicKey",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVER_CERTIFICATE = OperationModel.new(
        name: "UpdateServerCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_SPECIFIC_CREDENTIAL = OperationModel.new(
        name: "UpdateServiceSpecificCredential",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SIGNING_CERTIFICATE = OperationModel.new(
        name: "UpdateSigningCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "POST",
        request_uri: "/"
      )

      UPLOAD_SSH_PUBLIC_KEY = OperationModel.new(
        name: "UploadSSHPublicKey",
        http_method: "POST",
        request_uri: "/"
      )

      UPLOAD_SERVER_CERTIFICATE = OperationModel.new(
        name: "UploadServerCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      UPLOAD_SIGNING_CERTIFICATE = OperationModel.new(
        name: "UploadSigningCertificate",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
