module AwsSdk
  module CognitoIdentityProvider
    module Model
      API_VERSION = "2016-04-18"
      TARGET_PREFIX = "AWSCognitoIdentityProviderService"
      SIGNING_NAME = "cognito-idp"
      ENDPOINT_PREFIX = "cognito-idp"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-east-1"]}],"endpoint":{"url":"https://cognito-idp-fips.us-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-east-2"]}],"endpoint":{"url":"https://cognito-idp-fips.us-east-2.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-west-1"]}],"endpoint":{"url":"https://cognito-idp-fips.us-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-west-2"]}],"endpoint":{"url":"https://cognito-idp-fips.us-west-2.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://cognito-idp-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cognito-idp-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://cognito-idp.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://cognito-idp.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cognito-idp.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_CUSTOM_ATTRIBUTES = OperationModel.new(
        name: "AddCustomAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_ADD_USER_TO_GROUP = OperationModel.new(
        name: "AdminAddUserToGroup",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_CONFIRM_SIGN_UP = OperationModel.new(
        name: "AdminConfirmSignUp",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_CREATE_USER = OperationModel.new(
        name: "AdminCreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_DELETE_USER = OperationModel.new(
        name: "AdminDeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_DELETE_USER_ATTRIBUTES = OperationModel.new(
        name: "AdminDeleteUserAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_DISABLE_PROVIDER_FOR_USER = OperationModel.new(
        name: "AdminDisableProviderForUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_DISABLE_USER = OperationModel.new(
        name: "AdminDisableUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_ENABLE_USER = OperationModel.new(
        name: "AdminEnableUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_FORGET_DEVICE = OperationModel.new(
        name: "AdminForgetDevice",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_GET_DEVICE = OperationModel.new(
        name: "AdminGetDevice",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_GET_USER = OperationModel.new(
        name: "AdminGetUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_INITIATE_AUTH = OperationModel.new(
        name: "AdminInitiateAuth",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_LINK_PROVIDER_FOR_USER = OperationModel.new(
        name: "AdminLinkProviderForUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_LIST_DEVICES = OperationModel.new(
        name: "AdminListDevices",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_LIST_GROUPS_FOR_USER = OperationModel.new(
        name: "AdminListGroupsForUser",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_LIST_USER_AUTH_EVENTS = OperationModel.new(
        name: "AdminListUserAuthEvents",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_REMOVE_USER_FROM_GROUP = OperationModel.new(
        name: "AdminRemoveUserFromGroup",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_RESET_USER_PASSWORD = OperationModel.new(
        name: "AdminResetUserPassword",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_RESPOND_TO_AUTH_CHALLENGE = OperationModel.new(
        name: "AdminRespondToAuthChallenge",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_SET_USER_MFA_PREFERENCE = OperationModel.new(
        name: "AdminSetUserMFAPreference",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_SET_USER_PASSWORD = OperationModel.new(
        name: "AdminSetUserPassword",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_SET_USER_SETTINGS = OperationModel.new(
        name: "AdminSetUserSettings",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_UPDATE_AUTH_EVENT_FEEDBACK = OperationModel.new(
        name: "AdminUpdateAuthEventFeedback",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_UPDATE_DEVICE_STATUS = OperationModel.new(
        name: "AdminUpdateDeviceStatus",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_UPDATE_USER_ATTRIBUTES = OperationModel.new(
        name: "AdminUpdateUserAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      ADMIN_USER_GLOBAL_SIGN_OUT = OperationModel.new(
        name: "AdminUserGlobalSignOut",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SOFTWARE_TOKEN = OperationModel.new(
        name: "AssociateSoftwareToken",
        http_method: "POST",
        request_uri: "/"
      )

      CHANGE_PASSWORD = OperationModel.new(
        name: "ChangePassword",
        http_method: "POST",
        request_uri: "/"
      )

      COMPLETE_WEB_AUTHN_REGISTRATION = OperationModel.new(
        name: "CompleteWebAuthnRegistration",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_DEVICE = OperationModel.new(
        name: "ConfirmDevice",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_FORGOT_PASSWORD = OperationModel.new(
        name: "ConfirmForgotPassword",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_SIGN_UP = OperationModel.new(
        name: "ConfirmSignUp",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IDENTITY_PROVIDER = OperationModel.new(
        name: "CreateIdentityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MANAGED_LOGIN_BRANDING = OperationModel.new(
        name: "CreateManagedLoginBranding",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESOURCE_SERVER = OperationModel.new(
        name: "CreateResourceServer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TERMS = OperationModel.new(
        name: "CreateTerms",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER_IMPORT_JOB = OperationModel.new(
        name: "CreateUserImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER_POOL = OperationModel.new(
        name: "CreateUserPool",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER_POOL_CLIENT = OperationModel.new(
        name: "CreateUserPoolClient",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER_POOL_DOMAIN = OperationModel.new(
        name: "CreateUserPoolDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITY_PROVIDER = OperationModel.new(
        name: "DeleteIdentityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MANAGED_LOGIN_BRANDING = OperationModel.new(
        name: "DeleteManagedLoginBranding",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_SERVER = OperationModel.new(
        name: "DeleteResourceServer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TERMS = OperationModel.new(
        name: "DeleteTerms",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_ATTRIBUTES = OperationModel.new(
        name: "DeleteUserAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_POOL = OperationModel.new(
        name: "DeleteUserPool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_POOL_CLIENT = OperationModel.new(
        name: "DeleteUserPoolClient",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_POOL_DOMAIN = OperationModel.new(
        name: "DeleteUserPoolDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WEB_AUTHN_CREDENTIAL = OperationModel.new(
        name: "DeleteWebAuthnCredential",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IDENTITY_PROVIDER = OperationModel.new(
        name: "DescribeIdentityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MANAGED_LOGIN_BRANDING = OperationModel.new(
        name: "DescribeManagedLoginBranding",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MANAGED_LOGIN_BRANDING_BY_CLIENT = OperationModel.new(
        name: "DescribeManagedLoginBrandingByClient",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_SERVER = OperationModel.new(
        name: "DescribeResourceServer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RISK_CONFIGURATION = OperationModel.new(
        name: "DescribeRiskConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TERMS = OperationModel.new(
        name: "DescribeTerms",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER_IMPORT_JOB = OperationModel.new(
        name: "DescribeUserImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER_POOL = OperationModel.new(
        name: "DescribeUserPool",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER_POOL_CLIENT = OperationModel.new(
        name: "DescribeUserPoolClient",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER_POOL_DOMAIN = OperationModel.new(
        name: "DescribeUserPoolDomain",
        http_method: "POST",
        request_uri: "/"
      )

      FORGET_DEVICE = OperationModel.new(
        name: "ForgetDevice",
        http_method: "POST",
        request_uri: "/"
      )

      FORGOT_PASSWORD = OperationModel.new(
        name: "ForgotPassword",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CSV_HEADER = OperationModel.new(
        name: "GetCSVHeader",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEVICE = OperationModel.new(
        name: "GetDevice",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GROUP = OperationModel.new(
        name: "GetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_PROVIDER_BY_IDENTIFIER = OperationModel.new(
        name: "GetIdentityProviderByIdentifier",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOG_DELIVERY_CONFIGURATION = OperationModel.new(
        name: "GetLogDeliveryConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SIGNING_CERTIFICATE = OperationModel.new(
        name: "GetSigningCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TOKENS_FROM_REFRESH_TOKEN = OperationModel.new(
        name: "GetTokensFromRefreshToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_UI_CUSTOMIZATION = OperationModel.new(
        name: "GetUICustomization",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER = OperationModel.new(
        name: "GetUser",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER_ATTRIBUTE_VERIFICATION_CODE = OperationModel.new(
        name: "GetUserAttributeVerificationCode",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER_AUTH_FACTORS = OperationModel.new(
        name: "GetUserAuthFactors",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USER_POOL_MFA_CONFIG = OperationModel.new(
        name: "GetUserPoolMfaConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GLOBAL_SIGN_OUT = OperationModel.new(
        name: "GlobalSignOut",
        http_method: "POST",
        request_uri: "/"
      )

      INITIATE_AUTH = OperationModel.new(
        name: "InitiateAuth",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEVICES = OperationModel.new(
        name: "ListDevices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IDENTITY_PROVIDERS = OperationModel.new(
        name: "ListIdentityProviders",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_SERVERS = OperationModel.new(
        name: "ListResourceServers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TERMS = OperationModel.new(
        name: "ListTerms",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USER_IMPORT_JOBS = OperationModel.new(
        name: "ListUserImportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USER_POOL_CLIENTS = OperationModel.new(
        name: "ListUserPoolClients",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USER_POOLS = OperationModel.new(
        name: "ListUserPools",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USERS_IN_GROUP = OperationModel.new(
        name: "ListUsersInGroup",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WEB_AUTHN_CREDENTIALS = OperationModel.new(
        name: "ListWebAuthnCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      RESEND_CONFIRMATION_CODE = OperationModel.new(
        name: "ResendConfirmationCode",
        http_method: "POST",
        request_uri: "/"
      )

      RESPOND_TO_AUTH_CHALLENGE = OperationModel.new(
        name: "RespondToAuthChallenge",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_TOKEN = OperationModel.new(
        name: "RevokeToken",
        http_method: "POST",
        request_uri: "/"
      )

      SET_LOG_DELIVERY_CONFIGURATION = OperationModel.new(
        name: "SetLogDeliveryConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      SET_RISK_CONFIGURATION = OperationModel.new(
        name: "SetRiskConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      SET_UI_CUSTOMIZATION = OperationModel.new(
        name: "SetUICustomization",
        http_method: "POST",
        request_uri: "/"
      )

      SET_USER_MFA_PREFERENCE = OperationModel.new(
        name: "SetUserMFAPreference",
        http_method: "POST",
        request_uri: "/"
      )

      SET_USER_POOL_MFA_CONFIG = OperationModel.new(
        name: "SetUserPoolMfaConfig",
        http_method: "POST",
        request_uri: "/"
      )

      SET_USER_SETTINGS = OperationModel.new(
        name: "SetUserSettings",
        http_method: "POST",
        request_uri: "/"
      )

      SIGN_UP = OperationModel.new(
        name: "SignUp",
        http_method: "POST",
        request_uri: "/"
      )

      START_USER_IMPORT_JOB = OperationModel.new(
        name: "StartUserImportJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_WEB_AUTHN_REGISTRATION = OperationModel.new(
        name: "StartWebAuthnRegistration",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_USER_IMPORT_JOB = OperationModel.new(
        name: "StopUserImportJob",
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

      UPDATE_AUTH_EVENT_FEEDBACK = OperationModel.new(
        name: "UpdateAuthEventFeedback",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEVICE_STATUS = OperationModel.new(
        name: "UpdateDeviceStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_IDENTITY_PROVIDER = OperationModel.new(
        name: "UpdateIdentityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MANAGED_LOGIN_BRANDING = OperationModel.new(
        name: "UpdateManagedLoginBranding",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RESOURCE_SERVER = OperationModel.new(
        name: "UpdateResourceServer",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TERMS = OperationModel.new(
        name: "UpdateTerms",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER_ATTRIBUTES = OperationModel.new(
        name: "UpdateUserAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER_POOL = OperationModel.new(
        name: "UpdateUserPool",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER_POOL_CLIENT = OperationModel.new(
        name: "UpdateUserPoolClient",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER_POOL_DOMAIN = OperationModel.new(
        name: "UpdateUserPoolDomain",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_SOFTWARE_TOKEN = OperationModel.new(
        name: "VerifySoftwareToken",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_USER_ATTRIBUTE = OperationModel.new(
        name: "VerifyUserAttribute",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
