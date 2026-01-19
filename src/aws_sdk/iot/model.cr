module AwsSdk
  module IoT
    module Model
      API_VERSION = "2015-05-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iot"
      ENDPOINT_PREFIX = "iot"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iot-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iot-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iot.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://iot.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-cn",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://iot.{Region}.amazonaws.com.cn","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://iot.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://iot.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_CERTIFICATE_TRANSFER = OperationModel.new(
        name: "AcceptCertificateTransfer",
        http_method: "PATCH",
        request_uri: "/accept-certificate-transfer/{certificateId}"
      )

      ADD_THING_TO_BILLING_GROUP = OperationModel.new(
        name: "AddThingToBillingGroup",
        http_method: "PUT",
        request_uri: "/billing-groups/addThingToBillingGroup"
      )

      ADD_THING_TO_THING_GROUP = OperationModel.new(
        name: "AddThingToThingGroup",
        http_method: "PUT",
        request_uri: "/thing-groups/addThingToThingGroup"
      )

      ASSOCIATE_SBOM_WITH_PACKAGE_VERSION = OperationModel.new(
        name: "AssociateSbomWithPackageVersion",
        http_method: "PUT",
        request_uri: "/packages/{packageName}/versions/{versionName}/sbom"
      )

      ASSOCIATE_TARGETS_WITH_JOB = OperationModel.new(
        name: "AssociateTargetsWithJob",
        http_method: "POST",
        request_uri: "/jobs/{jobId}/targets"
      )

      ATTACH_POLICY = OperationModel.new(
        name: "AttachPolicy",
        http_method: "PUT",
        request_uri: "/target-policies/{policyName}"
      )

      ATTACH_PRINCIPAL_POLICY = OperationModel.new(
        name: "AttachPrincipalPolicy",
        http_method: "PUT",
        request_uri: "/principal-policies/{policyName}"
      )

      ATTACH_SECURITY_PROFILE = OperationModel.new(
        name: "AttachSecurityProfile",
        http_method: "PUT",
        request_uri: "/security-profiles/{securityProfileName}/targets"
      )

      ATTACH_THING_PRINCIPAL = OperationModel.new(
        name: "AttachThingPrincipal",
        http_method: "PUT",
        request_uri: "/things/{thingName}/principals"
      )

      CANCEL_AUDIT_MITIGATION_ACTIONS_TASK = OperationModel.new(
        name: "CancelAuditMitigationActionsTask",
        http_method: "PUT",
        request_uri: "/audit/mitigationactions/tasks/{taskId}/cancel"
      )

      CANCEL_AUDIT_TASK = OperationModel.new(
        name: "CancelAuditTask",
        http_method: "PUT",
        request_uri: "/audit/tasks/{taskId}/cancel"
      )

      CANCEL_CERTIFICATE_TRANSFER = OperationModel.new(
        name: "CancelCertificateTransfer",
        http_method: "PATCH",
        request_uri: "/cancel-certificate-transfer/{certificateId}"
      )

      CANCEL_DETECT_MITIGATION_ACTIONS_TASK = OperationModel.new(
        name: "CancelDetectMitigationActionsTask",
        http_method: "PUT",
        request_uri: "/detect/mitigationactions/tasks/{taskId}/cancel"
      )

      CANCEL_JOB = OperationModel.new(
        name: "CancelJob",
        http_method: "PUT",
        request_uri: "/jobs/{jobId}/cancel"
      )

      CANCEL_JOB_EXECUTION = OperationModel.new(
        name: "CancelJobExecution",
        http_method: "PUT",
        request_uri: "/things/{thingName}/jobs/{jobId}/cancel"
      )

      CLEAR_DEFAULT_AUTHORIZER = OperationModel.new(
        name: "ClearDefaultAuthorizer",
        http_method: "DELETE",
        request_uri: "/default-authorizer"
      )

      CONFIRM_TOPIC_RULE_DESTINATION = OperationModel.new(
        name: "ConfirmTopicRuleDestination",
        http_method: "GET",
        request_uri: "/confirmdestination/{confirmationToken+}"
      )

      CREATE_AUDIT_SUPPRESSION = OperationModel.new(
        name: "CreateAuditSuppression",
        http_method: "POST",
        request_uri: "/audit/suppressions/create"
      )

      CREATE_AUTHORIZER = OperationModel.new(
        name: "CreateAuthorizer",
        http_method: "POST",
        request_uri: "/authorizer/{authorizerName}"
      )

      CREATE_BILLING_GROUP = OperationModel.new(
        name: "CreateBillingGroup",
        http_method: "POST",
        request_uri: "/billing-groups/{billingGroupName}"
      )

      CREATE_CERTIFICATE_FROM_CSR = OperationModel.new(
        name: "CreateCertificateFromCsr",
        http_method: "POST",
        request_uri: "/certificates"
      )

      CREATE_CERTIFICATE_PROVIDER = OperationModel.new(
        name: "CreateCertificateProvider",
        http_method: "POST",
        request_uri: "/certificate-providers/{certificateProviderName}"
      )

      CREATE_COMMAND = OperationModel.new(
        name: "CreateCommand",
        http_method: "PUT",
        request_uri: "/commands/{commandId}"
      )

      CREATE_CUSTOM_METRIC = OperationModel.new(
        name: "CreateCustomMetric",
        http_method: "POST",
        request_uri: "/custom-metric/{metricName}"
      )

      CREATE_DIMENSION = OperationModel.new(
        name: "CreateDimension",
        http_method: "POST",
        request_uri: "/dimensions/{name}"
      )

      CREATE_DOMAIN_CONFIGURATION = OperationModel.new(
        name: "CreateDomainConfiguration",
        http_method: "POST",
        request_uri: "/domainConfigurations/{domainConfigurationName}"
      )

      CREATE_DYNAMIC_THING_GROUP = OperationModel.new(
        name: "CreateDynamicThingGroup",
        http_method: "POST",
        request_uri: "/dynamic-thing-groups/{thingGroupName}"
      )

      CREATE_FLEET_METRIC = OperationModel.new(
        name: "CreateFleetMetric",
        http_method: "PUT",
        request_uri: "/fleet-metric/{metricName}"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "PUT",
        request_uri: "/jobs/{jobId}"
      )

      CREATE_JOB_TEMPLATE = OperationModel.new(
        name: "CreateJobTemplate",
        http_method: "PUT",
        request_uri: "/job-templates/{jobTemplateId}"
      )

      CREATE_KEYS_AND_CERTIFICATE = OperationModel.new(
        name: "CreateKeysAndCertificate",
        http_method: "POST",
        request_uri: "/keys-and-certificate"
      )

      CREATE_MITIGATION_ACTION = OperationModel.new(
        name: "CreateMitigationAction",
        http_method: "POST",
        request_uri: "/mitigationactions/actions/{actionName}"
      )

      CREATE_OTA_UPDATE = OperationModel.new(
        name: "CreateOTAUpdate",
        http_method: "POST",
        request_uri: "/otaUpdates/{otaUpdateId}"
      )

      CREATE_PACKAGE = OperationModel.new(
        name: "CreatePackage",
        http_method: "PUT",
        request_uri: "/packages/{packageName}"
      )

      CREATE_PACKAGE_VERSION = OperationModel.new(
        name: "CreatePackageVersion",
        http_method: "PUT",
        request_uri: "/packages/{packageName}/versions/{versionName}"
      )

      CREATE_POLICY = OperationModel.new(
        name: "CreatePolicy",
        http_method: "POST",
        request_uri: "/policies/{policyName}"
      )

      CREATE_POLICY_VERSION = OperationModel.new(
        name: "CreatePolicyVersion",
        http_method: "POST",
        request_uri: "/policies/{policyName}/version"
      )

      CREATE_PROVISIONING_CLAIM = OperationModel.new(
        name: "CreateProvisioningClaim",
        http_method: "POST",
        request_uri: "/provisioning-templates/{templateName}/provisioning-claim"
      )

      CREATE_PROVISIONING_TEMPLATE = OperationModel.new(
        name: "CreateProvisioningTemplate",
        http_method: "POST",
        request_uri: "/provisioning-templates"
      )

      CREATE_PROVISIONING_TEMPLATE_VERSION = OperationModel.new(
        name: "CreateProvisioningTemplateVersion",
        http_method: "POST",
        request_uri: "/provisioning-templates/{templateName}/versions"
      )

      CREATE_ROLE_ALIAS = OperationModel.new(
        name: "CreateRoleAlias",
        http_method: "POST",
        request_uri: "/role-aliases/{roleAlias}"
      )

      CREATE_SCHEDULED_AUDIT = OperationModel.new(
        name: "CreateScheduledAudit",
        http_method: "POST",
        request_uri: "/audit/scheduledaudits/{scheduledAuditName}"
      )

      CREATE_SECURITY_PROFILE = OperationModel.new(
        name: "CreateSecurityProfile",
        http_method: "POST",
        request_uri: "/security-profiles/{securityProfileName}"
      )

      CREATE_STREAM = OperationModel.new(
        name: "CreateStream",
        http_method: "POST",
        request_uri: "/streams/{streamId}"
      )

      CREATE_THING = OperationModel.new(
        name: "CreateThing",
        http_method: "POST",
        request_uri: "/things/{thingName}"
      )

      CREATE_THING_GROUP = OperationModel.new(
        name: "CreateThingGroup",
        http_method: "POST",
        request_uri: "/thing-groups/{thingGroupName}"
      )

      CREATE_THING_TYPE = OperationModel.new(
        name: "CreateThingType",
        http_method: "POST",
        request_uri: "/thing-types/{thingTypeName}"
      )

      CREATE_TOPIC_RULE = OperationModel.new(
        name: "CreateTopicRule",
        http_method: "POST",
        request_uri: "/rules/{ruleName}"
      )

      CREATE_TOPIC_RULE_DESTINATION = OperationModel.new(
        name: "CreateTopicRuleDestination",
        http_method: "POST",
        request_uri: "/destinations"
      )

      DELETE_ACCOUNT_AUDIT_CONFIGURATION = OperationModel.new(
        name: "DeleteAccountAuditConfiguration",
        http_method: "DELETE",
        request_uri: "/audit/configuration"
      )

      DELETE_AUDIT_SUPPRESSION = OperationModel.new(
        name: "DeleteAuditSuppression",
        http_method: "POST",
        request_uri: "/audit/suppressions/delete"
      )

      DELETE_AUTHORIZER = OperationModel.new(
        name: "DeleteAuthorizer",
        http_method: "DELETE",
        request_uri: "/authorizer/{authorizerName}"
      )

      DELETE_BILLING_GROUP = OperationModel.new(
        name: "DeleteBillingGroup",
        http_method: "DELETE",
        request_uri: "/billing-groups/{billingGroupName}"
      )

      DELETE_CA_CERTIFICATE = OperationModel.new(
        name: "DeleteCACertificate",
        http_method: "DELETE",
        request_uri: "/cacertificate/{caCertificateId}"
      )

      DELETE_CERTIFICATE = OperationModel.new(
        name: "DeleteCertificate",
        http_method: "DELETE",
        request_uri: "/certificates/{certificateId}"
      )

      DELETE_CERTIFICATE_PROVIDER = OperationModel.new(
        name: "DeleteCertificateProvider",
        http_method: "DELETE",
        request_uri: "/certificate-providers/{certificateProviderName}"
      )

      DELETE_COMMAND = OperationModel.new(
        name: "DeleteCommand",
        http_method: "DELETE",
        request_uri: "/commands/{commandId}"
      )

      DELETE_COMMAND_EXECUTION = OperationModel.new(
        name: "DeleteCommandExecution",
        http_method: "DELETE",
        request_uri: "/command-executions/{executionId}"
      )

      DELETE_CUSTOM_METRIC = OperationModel.new(
        name: "DeleteCustomMetric",
        http_method: "DELETE",
        request_uri: "/custom-metric/{metricName}"
      )

      DELETE_DIMENSION = OperationModel.new(
        name: "DeleteDimension",
        http_method: "DELETE",
        request_uri: "/dimensions/{name}"
      )

      DELETE_DOMAIN_CONFIGURATION = OperationModel.new(
        name: "DeleteDomainConfiguration",
        http_method: "DELETE",
        request_uri: "/domainConfigurations/{domainConfigurationName}"
      )

      DELETE_DYNAMIC_THING_GROUP = OperationModel.new(
        name: "DeleteDynamicThingGroup",
        http_method: "DELETE",
        request_uri: "/dynamic-thing-groups/{thingGroupName}"
      )

      DELETE_FLEET_METRIC = OperationModel.new(
        name: "DeleteFleetMetric",
        http_method: "DELETE",
        request_uri: "/fleet-metric/{metricName}"
      )

      DELETE_JOB = OperationModel.new(
        name: "DeleteJob",
        http_method: "DELETE",
        request_uri: "/jobs/{jobId}"
      )

      DELETE_JOB_EXECUTION = OperationModel.new(
        name: "DeleteJobExecution",
        http_method: "DELETE",
        request_uri: "/things/{thingName}/jobs/{jobId}/executionNumber/{executionNumber}"
      )

      DELETE_JOB_TEMPLATE = OperationModel.new(
        name: "DeleteJobTemplate",
        http_method: "DELETE",
        request_uri: "/job-templates/{jobTemplateId}"
      )

      DELETE_MITIGATION_ACTION = OperationModel.new(
        name: "DeleteMitigationAction",
        http_method: "DELETE",
        request_uri: "/mitigationactions/actions/{actionName}"
      )

      DELETE_OTA_UPDATE = OperationModel.new(
        name: "DeleteOTAUpdate",
        http_method: "DELETE",
        request_uri: "/otaUpdates/{otaUpdateId}"
      )

      DELETE_PACKAGE = OperationModel.new(
        name: "DeletePackage",
        http_method: "DELETE",
        request_uri: "/packages/{packageName}"
      )

      DELETE_PACKAGE_VERSION = OperationModel.new(
        name: "DeletePackageVersion",
        http_method: "DELETE",
        request_uri: "/packages/{packageName}/versions/{versionName}"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "DELETE",
        request_uri: "/policies/{policyName}"
      )

      DELETE_POLICY_VERSION = OperationModel.new(
        name: "DeletePolicyVersion",
        http_method: "DELETE",
        request_uri: "/policies/{policyName}/version/{policyVersionId}"
      )

      DELETE_PROVISIONING_TEMPLATE = OperationModel.new(
        name: "DeleteProvisioningTemplate",
        http_method: "DELETE",
        request_uri: "/provisioning-templates/{templateName}"
      )

      DELETE_PROVISIONING_TEMPLATE_VERSION = OperationModel.new(
        name: "DeleteProvisioningTemplateVersion",
        http_method: "DELETE",
        request_uri: "/provisioning-templates/{templateName}/versions/{versionId}"
      )

      DELETE_REGISTRATION_CODE = OperationModel.new(
        name: "DeleteRegistrationCode",
        http_method: "DELETE",
        request_uri: "/registrationcode"
      )

      DELETE_ROLE_ALIAS = OperationModel.new(
        name: "DeleteRoleAlias",
        http_method: "DELETE",
        request_uri: "/role-aliases/{roleAlias}"
      )

      DELETE_SCHEDULED_AUDIT = OperationModel.new(
        name: "DeleteScheduledAudit",
        http_method: "DELETE",
        request_uri: "/audit/scheduledaudits/{scheduledAuditName}"
      )

      DELETE_SECURITY_PROFILE = OperationModel.new(
        name: "DeleteSecurityProfile",
        http_method: "DELETE",
        request_uri: "/security-profiles/{securityProfileName}"
      )

      DELETE_STREAM = OperationModel.new(
        name: "DeleteStream",
        http_method: "DELETE",
        request_uri: "/streams/{streamId}"
      )

      DELETE_THING = OperationModel.new(
        name: "DeleteThing",
        http_method: "DELETE",
        request_uri: "/things/{thingName}"
      )

      DELETE_THING_GROUP = OperationModel.new(
        name: "DeleteThingGroup",
        http_method: "DELETE",
        request_uri: "/thing-groups/{thingGroupName}"
      )

      DELETE_THING_TYPE = OperationModel.new(
        name: "DeleteThingType",
        http_method: "DELETE",
        request_uri: "/thing-types/{thingTypeName}"
      )

      DELETE_TOPIC_RULE = OperationModel.new(
        name: "DeleteTopicRule",
        http_method: "DELETE",
        request_uri: "/rules/{ruleName}"
      )

      DELETE_TOPIC_RULE_DESTINATION = OperationModel.new(
        name: "DeleteTopicRuleDestination",
        http_method: "DELETE",
        request_uri: "/destinations/{arn+}"
      )

      DELETE_V2_LOGGING_LEVEL = OperationModel.new(
        name: "DeleteV2LoggingLevel",
        http_method: "DELETE",
        request_uri: "/v2LoggingLevel"
      )

      DEPRECATE_THING_TYPE = OperationModel.new(
        name: "DeprecateThingType",
        http_method: "POST",
        request_uri: "/thing-types/{thingTypeName}/deprecate"
      )

      DESCRIBE_ACCOUNT_AUDIT_CONFIGURATION = OperationModel.new(
        name: "DescribeAccountAuditConfiguration",
        http_method: "GET",
        request_uri: "/audit/configuration"
      )

      DESCRIBE_AUDIT_FINDING = OperationModel.new(
        name: "DescribeAuditFinding",
        http_method: "GET",
        request_uri: "/audit/findings/{findingId}"
      )

      DESCRIBE_AUDIT_MITIGATION_ACTIONS_TASK = OperationModel.new(
        name: "DescribeAuditMitigationActionsTask",
        http_method: "GET",
        request_uri: "/audit/mitigationactions/tasks/{taskId}"
      )

      DESCRIBE_AUDIT_SUPPRESSION = OperationModel.new(
        name: "DescribeAuditSuppression",
        http_method: "POST",
        request_uri: "/audit/suppressions/describe"
      )

      DESCRIBE_AUDIT_TASK = OperationModel.new(
        name: "DescribeAuditTask",
        http_method: "GET",
        request_uri: "/audit/tasks/{taskId}"
      )

      DESCRIBE_AUTHORIZER = OperationModel.new(
        name: "DescribeAuthorizer",
        http_method: "GET",
        request_uri: "/authorizer/{authorizerName}"
      )

      DESCRIBE_BILLING_GROUP = OperationModel.new(
        name: "DescribeBillingGroup",
        http_method: "GET",
        request_uri: "/billing-groups/{billingGroupName}"
      )

      DESCRIBE_CA_CERTIFICATE = OperationModel.new(
        name: "DescribeCACertificate",
        http_method: "GET",
        request_uri: "/cacertificate/{caCertificateId}"
      )

      DESCRIBE_CERTIFICATE = OperationModel.new(
        name: "DescribeCertificate",
        http_method: "GET",
        request_uri: "/certificates/{certificateId}"
      )

      DESCRIBE_CERTIFICATE_PROVIDER = OperationModel.new(
        name: "DescribeCertificateProvider",
        http_method: "GET",
        request_uri: "/certificate-providers/{certificateProviderName}"
      )

      DESCRIBE_CUSTOM_METRIC = OperationModel.new(
        name: "DescribeCustomMetric",
        http_method: "GET",
        request_uri: "/custom-metric/{metricName}"
      )

      DESCRIBE_DEFAULT_AUTHORIZER = OperationModel.new(
        name: "DescribeDefaultAuthorizer",
        http_method: "GET",
        request_uri: "/default-authorizer"
      )

      DESCRIBE_DETECT_MITIGATION_ACTIONS_TASK = OperationModel.new(
        name: "DescribeDetectMitigationActionsTask",
        http_method: "GET",
        request_uri: "/detect/mitigationactions/tasks/{taskId}"
      )

      DESCRIBE_DIMENSION = OperationModel.new(
        name: "DescribeDimension",
        http_method: "GET",
        request_uri: "/dimensions/{name}"
      )

      DESCRIBE_DOMAIN_CONFIGURATION = OperationModel.new(
        name: "DescribeDomainConfiguration",
        http_method: "GET",
        request_uri: "/domainConfigurations/{domainConfigurationName}"
      )

      DESCRIBE_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "DescribeEncryptionConfiguration",
        http_method: "GET",
        request_uri: "/encryption-configuration"
      )

      DESCRIBE_ENDPOINT = OperationModel.new(
        name: "DescribeEndpoint",
        http_method: "GET",
        request_uri: "/endpoint"
      )

      DESCRIBE_EVENT_CONFIGURATIONS = OperationModel.new(
        name: "DescribeEventConfigurations",
        http_method: "GET",
        request_uri: "/event-configurations"
      )

      DESCRIBE_FLEET_METRIC = OperationModel.new(
        name: "DescribeFleetMetric",
        http_method: "GET",
        request_uri: "/fleet-metric/{metricName}"
      )

      DESCRIBE_INDEX = OperationModel.new(
        name: "DescribeIndex",
        http_method: "GET",
        request_uri: "/indices/{indexName}"
      )

      DESCRIBE_JOB = OperationModel.new(
        name: "DescribeJob",
        http_method: "GET",
        request_uri: "/jobs/{jobId}"
      )

      DESCRIBE_JOB_EXECUTION = OperationModel.new(
        name: "DescribeJobExecution",
        http_method: "GET",
        request_uri: "/things/{thingName}/jobs/{jobId}"
      )

      DESCRIBE_JOB_TEMPLATE = OperationModel.new(
        name: "DescribeJobTemplate",
        http_method: "GET",
        request_uri: "/job-templates/{jobTemplateId}"
      )

      DESCRIBE_MANAGED_JOB_TEMPLATE = OperationModel.new(
        name: "DescribeManagedJobTemplate",
        http_method: "GET",
        request_uri: "/managed-job-templates/{templateName}"
      )

      DESCRIBE_MITIGATION_ACTION = OperationModel.new(
        name: "DescribeMitigationAction",
        http_method: "GET",
        request_uri: "/mitigationactions/actions/{actionName}"
      )

      DESCRIBE_PROVISIONING_TEMPLATE = OperationModel.new(
        name: "DescribeProvisioningTemplate",
        http_method: "GET",
        request_uri: "/provisioning-templates/{templateName}"
      )

      DESCRIBE_PROVISIONING_TEMPLATE_VERSION = OperationModel.new(
        name: "DescribeProvisioningTemplateVersion",
        http_method: "GET",
        request_uri: "/provisioning-templates/{templateName}/versions/{versionId}"
      )

      DESCRIBE_ROLE_ALIAS = OperationModel.new(
        name: "DescribeRoleAlias",
        http_method: "GET",
        request_uri: "/role-aliases/{roleAlias}"
      )

      DESCRIBE_SCHEDULED_AUDIT = OperationModel.new(
        name: "DescribeScheduledAudit",
        http_method: "GET",
        request_uri: "/audit/scheduledaudits/{scheduledAuditName}"
      )

      DESCRIBE_SECURITY_PROFILE = OperationModel.new(
        name: "DescribeSecurityProfile",
        http_method: "GET",
        request_uri: "/security-profiles/{securityProfileName}"
      )

      DESCRIBE_STREAM = OperationModel.new(
        name: "DescribeStream",
        http_method: "GET",
        request_uri: "/streams/{streamId}"
      )

      DESCRIBE_THING = OperationModel.new(
        name: "DescribeThing",
        http_method: "GET",
        request_uri: "/things/{thingName}"
      )

      DESCRIBE_THING_GROUP = OperationModel.new(
        name: "DescribeThingGroup",
        http_method: "GET",
        request_uri: "/thing-groups/{thingGroupName}"
      )

      DESCRIBE_THING_REGISTRATION_TASK = OperationModel.new(
        name: "DescribeThingRegistrationTask",
        http_method: "GET",
        request_uri: "/thing-registration-tasks/{taskId}"
      )

      DESCRIBE_THING_TYPE = OperationModel.new(
        name: "DescribeThingType",
        http_method: "GET",
        request_uri: "/thing-types/{thingTypeName}"
      )

      DETACH_POLICY = OperationModel.new(
        name: "DetachPolicy",
        http_method: "POST",
        request_uri: "/target-policies/{policyName}"
      )

      DETACH_PRINCIPAL_POLICY = OperationModel.new(
        name: "DetachPrincipalPolicy",
        http_method: "DELETE",
        request_uri: "/principal-policies/{policyName}"
      )

      DETACH_SECURITY_PROFILE = OperationModel.new(
        name: "DetachSecurityProfile",
        http_method: "DELETE",
        request_uri: "/security-profiles/{securityProfileName}/targets"
      )

      DETACH_THING_PRINCIPAL = OperationModel.new(
        name: "DetachThingPrincipal",
        http_method: "DELETE",
        request_uri: "/things/{thingName}/principals"
      )

      DISABLE_TOPIC_RULE = OperationModel.new(
        name: "DisableTopicRule",
        http_method: "POST",
        request_uri: "/rules/{ruleName}/disable"
      )

      DISASSOCIATE_SBOM_FROM_PACKAGE_VERSION = OperationModel.new(
        name: "DisassociateSbomFromPackageVersion",
        http_method: "DELETE",
        request_uri: "/packages/{packageName}/versions/{versionName}/sbom"
      )

      ENABLE_TOPIC_RULE = OperationModel.new(
        name: "EnableTopicRule",
        http_method: "POST",
        request_uri: "/rules/{ruleName}/enable"
      )

      GET_BEHAVIOR_MODEL_TRAINING_SUMMARIES = OperationModel.new(
        name: "GetBehaviorModelTrainingSummaries",
        http_method: "GET",
        request_uri: "/behavior-model-training/summaries"
      )

      GET_BUCKETS_AGGREGATION = OperationModel.new(
        name: "GetBucketsAggregation",
        http_method: "POST",
        request_uri: "/indices/buckets"
      )

      GET_CARDINALITY = OperationModel.new(
        name: "GetCardinality",
        http_method: "POST",
        request_uri: "/indices/cardinality"
      )

      GET_COMMAND = OperationModel.new(
        name: "GetCommand",
        http_method: "GET",
        request_uri: "/commands/{commandId}"
      )

      GET_COMMAND_EXECUTION = OperationModel.new(
        name: "GetCommandExecution",
        http_method: "GET",
        request_uri: "/command-executions/{executionId}"
      )

      GET_EFFECTIVE_POLICIES = OperationModel.new(
        name: "GetEffectivePolicies",
        http_method: "POST",
        request_uri: "/effective-policies"
      )

      GET_INDEXING_CONFIGURATION = OperationModel.new(
        name: "GetIndexingConfiguration",
        http_method: "GET",
        request_uri: "/indexing/config"
      )

      GET_JOB_DOCUMENT = OperationModel.new(
        name: "GetJobDocument",
        http_method: "GET",
        request_uri: "/jobs/{jobId}/job-document"
      )

      GET_LOGGING_OPTIONS = OperationModel.new(
        name: "GetLoggingOptions",
        http_method: "GET",
        request_uri: "/loggingOptions"
      )

      GET_OTA_UPDATE = OperationModel.new(
        name: "GetOTAUpdate",
        http_method: "GET",
        request_uri: "/otaUpdates/{otaUpdateId}"
      )

      GET_PACKAGE = OperationModel.new(
        name: "GetPackage",
        http_method: "GET",
        request_uri: "/packages/{packageName}"
      )

      GET_PACKAGE_CONFIGURATION = OperationModel.new(
        name: "GetPackageConfiguration",
        http_method: "GET",
        request_uri: "/package-configuration"
      )

      GET_PACKAGE_VERSION = OperationModel.new(
        name: "GetPackageVersion",
        http_method: "GET",
        request_uri: "/packages/{packageName}/versions/{versionName}"
      )

      GET_PERCENTILES = OperationModel.new(
        name: "GetPercentiles",
        http_method: "POST",
        request_uri: "/indices/percentiles"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "GET",
        request_uri: "/policies/{policyName}"
      )

      GET_POLICY_VERSION = OperationModel.new(
        name: "GetPolicyVersion",
        http_method: "GET",
        request_uri: "/policies/{policyName}/version/{policyVersionId}"
      )

      GET_REGISTRATION_CODE = OperationModel.new(
        name: "GetRegistrationCode",
        http_method: "GET",
        request_uri: "/registrationcode"
      )

      GET_STATISTICS = OperationModel.new(
        name: "GetStatistics",
        http_method: "POST",
        request_uri: "/indices/statistics"
      )

      GET_THING_CONNECTIVITY_DATA = OperationModel.new(
        name: "GetThingConnectivityData",
        http_method: "POST",
        request_uri: "/things/{thingName}/connectivity-data"
      )

      GET_TOPIC_RULE = OperationModel.new(
        name: "GetTopicRule",
        http_method: "GET",
        request_uri: "/rules/{ruleName}"
      )

      GET_TOPIC_RULE_DESTINATION = OperationModel.new(
        name: "GetTopicRuleDestination",
        http_method: "GET",
        request_uri: "/destinations/{arn+}"
      )

      GET_V2_LOGGING_OPTIONS = OperationModel.new(
        name: "GetV2LoggingOptions",
        http_method: "GET",
        request_uri: "/v2LoggingOptions"
      )

      LIST_ACTIVE_VIOLATIONS = OperationModel.new(
        name: "ListActiveViolations",
        http_method: "GET",
        request_uri: "/active-violations"
      )

      LIST_ATTACHED_POLICIES = OperationModel.new(
        name: "ListAttachedPolicies",
        http_method: "POST",
        request_uri: "/attached-policies/{target}"
      )

      LIST_AUDIT_FINDINGS = OperationModel.new(
        name: "ListAuditFindings",
        http_method: "POST",
        request_uri: "/audit/findings"
      )

      LIST_AUDIT_MITIGATION_ACTIONS_EXECUTIONS = OperationModel.new(
        name: "ListAuditMitigationActionsExecutions",
        http_method: "GET",
        request_uri: "/audit/mitigationactions/executions"
      )

      LIST_AUDIT_MITIGATION_ACTIONS_TASKS = OperationModel.new(
        name: "ListAuditMitigationActionsTasks",
        http_method: "GET",
        request_uri: "/audit/mitigationactions/tasks"
      )

      LIST_AUDIT_SUPPRESSIONS = OperationModel.new(
        name: "ListAuditSuppressions",
        http_method: "POST",
        request_uri: "/audit/suppressions/list"
      )

      LIST_AUDIT_TASKS = OperationModel.new(
        name: "ListAuditTasks",
        http_method: "GET",
        request_uri: "/audit/tasks"
      )

      LIST_AUTHORIZERS = OperationModel.new(
        name: "ListAuthorizers",
        http_method: "GET",
        request_uri: "/authorizers/"
      )

      LIST_BILLING_GROUPS = OperationModel.new(
        name: "ListBillingGroups",
        http_method: "GET",
        request_uri: "/billing-groups"
      )

      LIST_CA_CERTIFICATES = OperationModel.new(
        name: "ListCACertificates",
        http_method: "GET",
        request_uri: "/cacertificates"
      )

      LIST_CERTIFICATE_PROVIDERS = OperationModel.new(
        name: "ListCertificateProviders",
        http_method: "GET",
        request_uri: "/certificate-providers/"
      )

      LIST_CERTIFICATES = OperationModel.new(
        name: "ListCertificates",
        http_method: "GET",
        request_uri: "/certificates"
      )

      LIST_CERTIFICATES_BY_CA = OperationModel.new(
        name: "ListCertificatesByCA",
        http_method: "GET",
        request_uri: "/certificates-by-ca/{caCertificateId}"
      )

      LIST_COMMAND_EXECUTIONS = OperationModel.new(
        name: "ListCommandExecutions",
        http_method: "POST",
        request_uri: "/command-executions"
      )

      LIST_COMMANDS = OperationModel.new(
        name: "ListCommands",
        http_method: "GET",
        request_uri: "/commands"
      )

      LIST_CUSTOM_METRICS = OperationModel.new(
        name: "ListCustomMetrics",
        http_method: "GET",
        request_uri: "/custom-metrics"
      )

      LIST_DETECT_MITIGATION_ACTIONS_EXECUTIONS = OperationModel.new(
        name: "ListDetectMitigationActionsExecutions",
        http_method: "GET",
        request_uri: "/detect/mitigationactions/executions"
      )

      LIST_DETECT_MITIGATION_ACTIONS_TASKS = OperationModel.new(
        name: "ListDetectMitigationActionsTasks",
        http_method: "GET",
        request_uri: "/detect/mitigationactions/tasks"
      )

      LIST_DIMENSIONS = OperationModel.new(
        name: "ListDimensions",
        http_method: "GET",
        request_uri: "/dimensions"
      )

      LIST_DOMAIN_CONFIGURATIONS = OperationModel.new(
        name: "ListDomainConfigurations",
        http_method: "GET",
        request_uri: "/domainConfigurations"
      )

      LIST_FLEET_METRICS = OperationModel.new(
        name: "ListFleetMetrics",
        http_method: "GET",
        request_uri: "/fleet-metrics"
      )

      LIST_INDICES = OperationModel.new(
        name: "ListIndices",
        http_method: "GET",
        request_uri: "/indices"
      )

      LIST_JOB_EXECUTIONS_FOR_JOB = OperationModel.new(
        name: "ListJobExecutionsForJob",
        http_method: "GET",
        request_uri: "/jobs/{jobId}/things"
      )

      LIST_JOB_EXECUTIONS_FOR_THING = OperationModel.new(
        name: "ListJobExecutionsForThing",
        http_method: "GET",
        request_uri: "/things/{thingName}/jobs"
      )

      LIST_JOB_TEMPLATES = OperationModel.new(
        name: "ListJobTemplates",
        http_method: "GET",
        request_uri: "/job-templates"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/jobs"
      )

      LIST_MANAGED_JOB_TEMPLATES = OperationModel.new(
        name: "ListManagedJobTemplates",
        http_method: "GET",
        request_uri: "/managed-job-templates"
      )

      LIST_METRIC_VALUES = OperationModel.new(
        name: "ListMetricValues",
        http_method: "GET",
        request_uri: "/metric-values"
      )

      LIST_MITIGATION_ACTIONS = OperationModel.new(
        name: "ListMitigationActions",
        http_method: "GET",
        request_uri: "/mitigationactions/actions"
      )

      LIST_OTA_UPDATES = OperationModel.new(
        name: "ListOTAUpdates",
        http_method: "GET",
        request_uri: "/otaUpdates"
      )

      LIST_OUTGOING_CERTIFICATES = OperationModel.new(
        name: "ListOutgoingCertificates",
        http_method: "GET",
        request_uri: "/certificates-out-going"
      )

      LIST_PACKAGE_VERSIONS = OperationModel.new(
        name: "ListPackageVersions",
        http_method: "GET",
        request_uri: "/packages/{packageName}/versions"
      )

      LIST_PACKAGES = OperationModel.new(
        name: "ListPackages",
        http_method: "GET",
        request_uri: "/packages"
      )

      LIST_POLICIES = OperationModel.new(
        name: "ListPolicies",
        http_method: "GET",
        request_uri: "/policies"
      )

      LIST_POLICY_PRINCIPALS = OperationModel.new(
        name: "ListPolicyPrincipals",
        http_method: "GET",
        request_uri: "/policy-principals"
      )

      LIST_POLICY_VERSIONS = OperationModel.new(
        name: "ListPolicyVersions",
        http_method: "GET",
        request_uri: "/policies/{policyName}/version"
      )

      LIST_PRINCIPAL_POLICIES = OperationModel.new(
        name: "ListPrincipalPolicies",
        http_method: "GET",
        request_uri: "/principal-policies"
      )

      LIST_PRINCIPAL_THINGS = OperationModel.new(
        name: "ListPrincipalThings",
        http_method: "GET",
        request_uri: "/principals/things"
      )

      LIST_PRINCIPAL_THINGS_V2 = OperationModel.new(
        name: "ListPrincipalThingsV2",
        http_method: "GET",
        request_uri: "/principals/things-v2"
      )

      LIST_PROVISIONING_TEMPLATE_VERSIONS = OperationModel.new(
        name: "ListProvisioningTemplateVersions",
        http_method: "GET",
        request_uri: "/provisioning-templates/{templateName}/versions"
      )

      LIST_PROVISIONING_TEMPLATES = OperationModel.new(
        name: "ListProvisioningTemplates",
        http_method: "GET",
        request_uri: "/provisioning-templates"
      )

      LIST_RELATED_RESOURCES_FOR_AUDIT_FINDING = OperationModel.new(
        name: "ListRelatedResourcesForAuditFinding",
        http_method: "GET",
        request_uri: "/audit/relatedResources"
      )

      LIST_ROLE_ALIASES = OperationModel.new(
        name: "ListRoleAliases",
        http_method: "GET",
        request_uri: "/role-aliases"
      )

      LIST_SBOM_VALIDATION_RESULTS = OperationModel.new(
        name: "ListSbomValidationResults",
        http_method: "GET",
        request_uri: "/packages/{packageName}/versions/{versionName}/sbom-validation-results"
      )

      LIST_SCHEDULED_AUDITS = OperationModel.new(
        name: "ListScheduledAudits",
        http_method: "GET",
        request_uri: "/audit/scheduledaudits"
      )

      LIST_SECURITY_PROFILES = OperationModel.new(
        name: "ListSecurityProfiles",
        http_method: "GET",
        request_uri: "/security-profiles"
      )

      LIST_SECURITY_PROFILES_FOR_TARGET = OperationModel.new(
        name: "ListSecurityProfilesForTarget",
        http_method: "GET",
        request_uri: "/security-profiles-for-target"
      )

      LIST_STREAMS = OperationModel.new(
        name: "ListStreams",
        http_method: "GET",
        request_uri: "/streams"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      LIST_TARGETS_FOR_POLICY = OperationModel.new(
        name: "ListTargetsForPolicy",
        http_method: "POST",
        request_uri: "/policy-targets/{policyName}"
      )

      LIST_TARGETS_FOR_SECURITY_PROFILE = OperationModel.new(
        name: "ListTargetsForSecurityProfile",
        http_method: "GET",
        request_uri: "/security-profiles/{securityProfileName}/targets"
      )

      LIST_THING_GROUPS = OperationModel.new(
        name: "ListThingGroups",
        http_method: "GET",
        request_uri: "/thing-groups"
      )

      LIST_THING_GROUPS_FOR_THING = OperationModel.new(
        name: "ListThingGroupsForThing",
        http_method: "GET",
        request_uri: "/things/{thingName}/thing-groups"
      )

      LIST_THING_PRINCIPALS = OperationModel.new(
        name: "ListThingPrincipals",
        http_method: "GET",
        request_uri: "/things/{thingName}/principals"
      )

      LIST_THING_PRINCIPALS_V2 = OperationModel.new(
        name: "ListThingPrincipalsV2",
        http_method: "GET",
        request_uri: "/things/{thingName}/principals-v2"
      )

      LIST_THING_REGISTRATION_TASK_REPORTS = OperationModel.new(
        name: "ListThingRegistrationTaskReports",
        http_method: "GET",
        request_uri: "/thing-registration-tasks/{taskId}/reports"
      )

      LIST_THING_REGISTRATION_TASKS = OperationModel.new(
        name: "ListThingRegistrationTasks",
        http_method: "GET",
        request_uri: "/thing-registration-tasks"
      )

      LIST_THING_TYPES = OperationModel.new(
        name: "ListThingTypes",
        http_method: "GET",
        request_uri: "/thing-types"
      )

      LIST_THINGS = OperationModel.new(
        name: "ListThings",
        http_method: "GET",
        request_uri: "/things"
      )

      LIST_THINGS_IN_BILLING_GROUP = OperationModel.new(
        name: "ListThingsInBillingGroup",
        http_method: "GET",
        request_uri: "/billing-groups/{billingGroupName}/things"
      )

      LIST_THINGS_IN_THING_GROUP = OperationModel.new(
        name: "ListThingsInThingGroup",
        http_method: "GET",
        request_uri: "/thing-groups/{thingGroupName}/things"
      )

      LIST_TOPIC_RULE_DESTINATIONS = OperationModel.new(
        name: "ListTopicRuleDestinations",
        http_method: "GET",
        request_uri: "/destinations"
      )

      LIST_TOPIC_RULES = OperationModel.new(
        name: "ListTopicRules",
        http_method: "GET",
        request_uri: "/rules"
      )

      LIST_V2_LOGGING_LEVELS = OperationModel.new(
        name: "ListV2LoggingLevels",
        http_method: "GET",
        request_uri: "/v2LoggingLevel"
      )

      LIST_VIOLATION_EVENTS = OperationModel.new(
        name: "ListViolationEvents",
        http_method: "GET",
        request_uri: "/violation-events"
      )

      PUT_VERIFICATION_STATE_ON_VIOLATION = OperationModel.new(
        name: "PutVerificationStateOnViolation",
        http_method: "POST",
        request_uri: "/violations/verification-state/{violationId}"
      )

      REGISTER_CA_CERTIFICATE = OperationModel.new(
        name: "RegisterCACertificate",
        http_method: "POST",
        request_uri: "/cacertificate"
      )

      REGISTER_CERTIFICATE = OperationModel.new(
        name: "RegisterCertificate",
        http_method: "POST",
        request_uri: "/certificate/register"
      )

      REGISTER_CERTIFICATE_WITHOUT_CA = OperationModel.new(
        name: "RegisterCertificateWithoutCA",
        http_method: "POST",
        request_uri: "/certificate/register-no-ca"
      )

      REGISTER_THING = OperationModel.new(
        name: "RegisterThing",
        http_method: "POST",
        request_uri: "/things"
      )

      REJECT_CERTIFICATE_TRANSFER = OperationModel.new(
        name: "RejectCertificateTransfer",
        http_method: "PATCH",
        request_uri: "/reject-certificate-transfer/{certificateId}"
      )

      REMOVE_THING_FROM_BILLING_GROUP = OperationModel.new(
        name: "RemoveThingFromBillingGroup",
        http_method: "PUT",
        request_uri: "/billing-groups/removeThingFromBillingGroup"
      )

      REMOVE_THING_FROM_THING_GROUP = OperationModel.new(
        name: "RemoveThingFromThingGroup",
        http_method: "PUT",
        request_uri: "/thing-groups/removeThingFromThingGroup"
      )

      REPLACE_TOPIC_RULE = OperationModel.new(
        name: "ReplaceTopicRule",
        http_method: "PATCH",
        request_uri: "/rules/{ruleName}"
      )

      SEARCH_INDEX = OperationModel.new(
        name: "SearchIndex",
        http_method: "POST",
        request_uri: "/indices/search"
      )

      SET_DEFAULT_AUTHORIZER = OperationModel.new(
        name: "SetDefaultAuthorizer",
        http_method: "POST",
        request_uri: "/default-authorizer"
      )

      SET_DEFAULT_POLICY_VERSION = OperationModel.new(
        name: "SetDefaultPolicyVersion",
        http_method: "PATCH",
        request_uri: "/policies/{policyName}/version/{policyVersionId}"
      )

      SET_LOGGING_OPTIONS = OperationModel.new(
        name: "SetLoggingOptions",
        http_method: "POST",
        request_uri: "/loggingOptions"
      )

      SET_V2_LOGGING_LEVEL = OperationModel.new(
        name: "SetV2LoggingLevel",
        http_method: "POST",
        request_uri: "/v2LoggingLevel"
      )

      SET_V2_LOGGING_OPTIONS = OperationModel.new(
        name: "SetV2LoggingOptions",
        http_method: "POST",
        request_uri: "/v2LoggingOptions"
      )

      START_AUDIT_MITIGATION_ACTIONS_TASK = OperationModel.new(
        name: "StartAuditMitigationActionsTask",
        http_method: "POST",
        request_uri: "/audit/mitigationactions/tasks/{taskId}"
      )

      START_DETECT_MITIGATION_ACTIONS_TASK = OperationModel.new(
        name: "StartDetectMitigationActionsTask",
        http_method: "PUT",
        request_uri: "/detect/mitigationactions/tasks/{taskId}"
      )

      START_ON_DEMAND_AUDIT_TASK = OperationModel.new(
        name: "StartOnDemandAuditTask",
        http_method: "POST",
        request_uri: "/audit/tasks"
      )

      START_THING_REGISTRATION_TASK = OperationModel.new(
        name: "StartThingRegistrationTask",
        http_method: "POST",
        request_uri: "/thing-registration-tasks"
      )

      STOP_THING_REGISTRATION_TASK = OperationModel.new(
        name: "StopThingRegistrationTask",
        http_method: "PUT",
        request_uri: "/thing-registration-tasks/{taskId}/cancel"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags"
      )

      TEST_AUTHORIZATION = OperationModel.new(
        name: "TestAuthorization",
        http_method: "POST",
        request_uri: "/test-authorization"
      )

      TEST_INVOKE_AUTHORIZER = OperationModel.new(
        name: "TestInvokeAuthorizer",
        http_method: "POST",
        request_uri: "/authorizer/{authorizerName}/test"
      )

      TRANSFER_CERTIFICATE = OperationModel.new(
        name: "TransferCertificate",
        http_method: "PATCH",
        request_uri: "/transfer-certificate/{certificateId}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/untag"
      )

      UPDATE_ACCOUNT_AUDIT_CONFIGURATION = OperationModel.new(
        name: "UpdateAccountAuditConfiguration",
        http_method: "PATCH",
        request_uri: "/audit/configuration"
      )

      UPDATE_AUDIT_SUPPRESSION = OperationModel.new(
        name: "UpdateAuditSuppression",
        http_method: "PATCH",
        request_uri: "/audit/suppressions/update"
      )

      UPDATE_AUTHORIZER = OperationModel.new(
        name: "UpdateAuthorizer",
        http_method: "PUT",
        request_uri: "/authorizer/{authorizerName}"
      )

      UPDATE_BILLING_GROUP = OperationModel.new(
        name: "UpdateBillingGroup",
        http_method: "PATCH",
        request_uri: "/billing-groups/{billingGroupName}"
      )

      UPDATE_CA_CERTIFICATE = OperationModel.new(
        name: "UpdateCACertificate",
        http_method: "PUT",
        request_uri: "/cacertificate/{caCertificateId}"
      )

      UPDATE_CERTIFICATE = OperationModel.new(
        name: "UpdateCertificate",
        http_method: "PUT",
        request_uri: "/certificates/{certificateId}"
      )

      UPDATE_CERTIFICATE_PROVIDER = OperationModel.new(
        name: "UpdateCertificateProvider",
        http_method: "PUT",
        request_uri: "/certificate-providers/{certificateProviderName}"
      )

      UPDATE_COMMAND = OperationModel.new(
        name: "UpdateCommand",
        http_method: "PATCH",
        request_uri: "/commands/{commandId}"
      )

      UPDATE_CUSTOM_METRIC = OperationModel.new(
        name: "UpdateCustomMetric",
        http_method: "PATCH",
        request_uri: "/custom-metric/{metricName}"
      )

      UPDATE_DIMENSION = OperationModel.new(
        name: "UpdateDimension",
        http_method: "PATCH",
        request_uri: "/dimensions/{name}"
      )

      UPDATE_DOMAIN_CONFIGURATION = OperationModel.new(
        name: "UpdateDomainConfiguration",
        http_method: "PUT",
        request_uri: "/domainConfigurations/{domainConfigurationName}"
      )

      UPDATE_DYNAMIC_THING_GROUP = OperationModel.new(
        name: "UpdateDynamicThingGroup",
        http_method: "PATCH",
        request_uri: "/dynamic-thing-groups/{thingGroupName}"
      )

      UPDATE_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "UpdateEncryptionConfiguration",
        http_method: "PATCH",
        request_uri: "/encryption-configuration"
      )

      UPDATE_EVENT_CONFIGURATIONS = OperationModel.new(
        name: "UpdateEventConfigurations",
        http_method: "PATCH",
        request_uri: "/event-configurations"
      )

      UPDATE_FLEET_METRIC = OperationModel.new(
        name: "UpdateFleetMetric",
        http_method: "PATCH",
        request_uri: "/fleet-metric/{metricName}"
      )

      UPDATE_INDEXING_CONFIGURATION = OperationModel.new(
        name: "UpdateIndexingConfiguration",
        http_method: "POST",
        request_uri: "/indexing/config"
      )

      UPDATE_JOB = OperationModel.new(
        name: "UpdateJob",
        http_method: "PATCH",
        request_uri: "/jobs/{jobId}"
      )

      UPDATE_MITIGATION_ACTION = OperationModel.new(
        name: "UpdateMitigationAction",
        http_method: "PATCH",
        request_uri: "/mitigationactions/actions/{actionName}"
      )

      UPDATE_PACKAGE = OperationModel.new(
        name: "UpdatePackage",
        http_method: "PATCH",
        request_uri: "/packages/{packageName}"
      )

      UPDATE_PACKAGE_CONFIGURATION = OperationModel.new(
        name: "UpdatePackageConfiguration",
        http_method: "PATCH",
        request_uri: "/package-configuration"
      )

      UPDATE_PACKAGE_VERSION = OperationModel.new(
        name: "UpdatePackageVersion",
        http_method: "PATCH",
        request_uri: "/packages/{packageName}/versions/{versionName}"
      )

      UPDATE_PROVISIONING_TEMPLATE = OperationModel.new(
        name: "UpdateProvisioningTemplate",
        http_method: "PATCH",
        request_uri: "/provisioning-templates/{templateName}"
      )

      UPDATE_ROLE_ALIAS = OperationModel.new(
        name: "UpdateRoleAlias",
        http_method: "PUT",
        request_uri: "/role-aliases/{roleAlias}"
      )

      UPDATE_SCHEDULED_AUDIT = OperationModel.new(
        name: "UpdateScheduledAudit",
        http_method: "PATCH",
        request_uri: "/audit/scheduledaudits/{scheduledAuditName}"
      )

      UPDATE_SECURITY_PROFILE = OperationModel.new(
        name: "UpdateSecurityProfile",
        http_method: "PATCH",
        request_uri: "/security-profiles/{securityProfileName}"
      )

      UPDATE_STREAM = OperationModel.new(
        name: "UpdateStream",
        http_method: "PUT",
        request_uri: "/streams/{streamId}"
      )

      UPDATE_THING = OperationModel.new(
        name: "UpdateThing",
        http_method: "PATCH",
        request_uri: "/things/{thingName}"
      )

      UPDATE_THING_GROUP = OperationModel.new(
        name: "UpdateThingGroup",
        http_method: "PATCH",
        request_uri: "/thing-groups/{thingGroupName}"
      )

      UPDATE_THING_GROUPS_FOR_THING = OperationModel.new(
        name: "UpdateThingGroupsForThing",
        http_method: "PUT",
        request_uri: "/thing-groups/updateThingGroupsForThing"
      )

      UPDATE_THING_TYPE = OperationModel.new(
        name: "UpdateThingType",
        http_method: "PATCH",
        request_uri: "/thing-types/{thingTypeName}"
      )

      UPDATE_TOPIC_RULE_DESTINATION = OperationModel.new(
        name: "UpdateTopicRuleDestination",
        http_method: "PATCH",
        request_uri: "/destinations"
      )

      VALIDATE_SECURITY_PROFILE_BEHAVIORS = OperationModel.new(
        name: "ValidateSecurityProfileBehaviors",
        http_method: "POST",
        request_uri: "/security-profile-behaviors/validate"
      )
    end
  end
end
