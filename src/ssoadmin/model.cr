module Aws
  module SSOAdmin
    module Model
      API_VERSION = "2020-07-20"
      TARGET_PREFIX = "SWBExternalService"
      SIGNING_NAME = "sso"
      ENDPOINT_PREFIX = "sso"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sso-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://sso.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://sso-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sso.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://sso.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ATTACH_CUSTOMER_MANAGED_POLICY_REFERENCE_TO_PERMISSION_SET = OperationModel.new(
        name: "AttachCustomerManagedPolicyReferenceToPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_MANAGED_POLICY_TO_PERMISSION_SET = OperationModel.new(
        name: "AttachManagedPolicyToPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCOUNT_ASSIGNMENT = OperationModel.new(
        name: "CreateAccountAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION_ASSIGNMENT = OperationModel.new(
        name: "CreateApplicationAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE = OperationModel.new(
        name: "CreateInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION = OperationModel.new(
        name: "CreateInstanceAccessControlAttributeConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PERMISSION_SET = OperationModel.new(
        name: "CreatePermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRUSTED_TOKEN_ISSUER = OperationModel.new(
        name: "CreateTrustedTokenIssuer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCOUNT_ASSIGNMENT = OperationModel.new(
        name: "DeleteAccountAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_ACCESS_SCOPE = OperationModel.new(
        name: "DeleteApplicationAccessScope",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_ASSIGNMENT = OperationModel.new(
        name: "DeleteApplicationAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_AUTHENTICATION_METHOD = OperationModel.new(
        name: "DeleteApplicationAuthenticationMethod",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_GRANT = OperationModel.new(
        name: "DeleteApplicationGrant",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INLINE_POLICY_FROM_PERMISSION_SET = OperationModel.new(
        name: "DeleteInlinePolicyFromPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE = OperationModel.new(
        name: "DeleteInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION = OperationModel.new(
        name: "DeleteInstanceAccessControlAttributeConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PERMISSION_SET = OperationModel.new(
        name: "DeletePermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PERMISSIONS_BOUNDARY_FROM_PERMISSION_SET = OperationModel.new(
        name: "DeletePermissionsBoundaryFromPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRUSTED_TOKEN_ISSUER = OperationModel.new(
        name: "DeleteTrustedTokenIssuer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_ASSIGNMENT_CREATION_STATUS = OperationModel.new(
        name: "DescribeAccountAssignmentCreationStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_ASSIGNMENT_DELETION_STATUS = OperationModel.new(
        name: "DescribeAccountAssignmentDeletionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION = OperationModel.new(
        name: "DescribeApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_ASSIGNMENT = OperationModel.new(
        name: "DescribeApplicationAssignment",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_PROVIDER = OperationModel.new(
        name: "DescribeApplicationProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE = OperationModel.new(
        name: "DescribeInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION = OperationModel.new(
        name: "DescribeInstanceAccessControlAttributeConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PERMISSION_SET = OperationModel.new(
        name: "DescribePermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PERMISSION_SET_PROVISIONING_STATUS = OperationModel.new(
        name: "DescribePermissionSetProvisioningStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUSTED_TOKEN_ISSUER = OperationModel.new(
        name: "DescribeTrustedTokenIssuer",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_CUSTOMER_MANAGED_POLICY_REFERENCE_FROM_PERMISSION_SET = OperationModel.new(
        name: "DetachCustomerManagedPolicyReferenceFromPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_MANAGED_POLICY_FROM_PERMISSION_SET = OperationModel.new(
        name: "DetachManagedPolicyFromPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPLICATION_ACCESS_SCOPE = OperationModel.new(
        name: "GetApplicationAccessScope",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPLICATION_ASSIGNMENT_CONFIGURATION = OperationModel.new(
        name: "GetApplicationAssignmentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPLICATION_AUTHENTICATION_METHOD = OperationModel.new(
        name: "GetApplicationAuthenticationMethod",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPLICATION_GRANT = OperationModel.new(
        name: "GetApplicationGrant",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPLICATION_SESSION_CONFIGURATION = OperationModel.new(
        name: "GetApplicationSessionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INLINE_POLICY_FOR_PERMISSION_SET = OperationModel.new(
        name: "GetInlinePolicyForPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PERMISSIONS_BOUNDARY_FOR_PERMISSION_SET = OperationModel.new(
        name: "GetPermissionsBoundaryForPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_ASSIGNMENT_CREATION_STATUS = OperationModel.new(
        name: "ListAccountAssignmentCreationStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_ASSIGNMENT_DELETION_STATUS = OperationModel.new(
        name: "ListAccountAssignmentDeletionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_ASSIGNMENTS = OperationModel.new(
        name: "ListAccountAssignments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_ASSIGNMENTS_FOR_PRINCIPAL = OperationModel.new(
        name: "ListAccountAssignmentsForPrincipal",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNTS_FOR_PROVISIONED_PERMISSION_SET = OperationModel.new(
        name: "ListAccountsForProvisionedPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_ACCESS_SCOPES = OperationModel.new(
        name: "ListApplicationAccessScopes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_ASSIGNMENTS = OperationModel.new(
        name: "ListApplicationAssignments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_ASSIGNMENTS_FOR_PRINCIPAL = OperationModel.new(
        name: "ListApplicationAssignmentsForPrincipal",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_AUTHENTICATION_METHODS = OperationModel.new(
        name: "ListApplicationAuthenticationMethods",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_GRANTS = OperationModel.new(
        name: "ListApplicationGrants",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_PROVIDERS = OperationModel.new(
        name: "ListApplicationProviders",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOMER_MANAGED_POLICY_REFERENCES_IN_PERMISSION_SET = OperationModel.new(
        name: "ListCustomerManagedPolicyReferencesInPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCES = OperationModel.new(
        name: "ListInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MANAGED_POLICIES_IN_PERMISSION_SET = OperationModel.new(
        name: "ListManagedPoliciesInPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PERMISSION_SET_PROVISIONING_STATUS = OperationModel.new(
        name: "ListPermissionSetProvisioningStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PERMISSION_SETS = OperationModel.new(
        name: "ListPermissionSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PERMISSION_SETS_PROVISIONED_TO_ACCOUNT = OperationModel.new(
        name: "ListPermissionSetsProvisionedToAccount",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRUSTED_TOKEN_ISSUERS = OperationModel.new(
        name: "ListTrustedTokenIssuers",
        http_method: "POST",
        request_uri: "/"
      )

      PROVISION_PERMISSION_SET = OperationModel.new(
        name: "ProvisionPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_APPLICATION_ACCESS_SCOPE = OperationModel.new(
        name: "PutApplicationAccessScope",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_APPLICATION_ASSIGNMENT_CONFIGURATION = OperationModel.new(
        name: "PutApplicationAssignmentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_APPLICATION_AUTHENTICATION_METHOD = OperationModel.new(
        name: "PutApplicationAuthenticationMethod",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_APPLICATION_GRANT = OperationModel.new(
        name: "PutApplicationGrant",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_APPLICATION_SESSION_CONFIGURATION = OperationModel.new(
        name: "PutApplicationSessionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_INLINE_POLICY_TO_PERMISSION_SET = OperationModel.new(
        name: "PutInlinePolicyToPermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PERMISSIONS_BOUNDARY_TO_PERMISSION_SET = OperationModel.new(
        name: "PutPermissionsBoundaryToPermissionSet",
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

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INSTANCE = OperationModel.new(
        name: "UpdateInstance",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INSTANCE_ACCESS_CONTROL_ATTRIBUTE_CONFIGURATION = OperationModel.new(
        name: "UpdateInstanceAccessControlAttributeConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PERMISSION_SET = OperationModel.new(
        name: "UpdatePermissionSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRUSTED_TOKEN_ISSUER = OperationModel.new(
        name: "UpdateTrustedTokenIssuer",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
