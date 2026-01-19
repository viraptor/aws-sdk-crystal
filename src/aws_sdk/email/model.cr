module AwsSdk
  module SESv2
    module Model
      API_VERSION = "2019-09-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ses"
      ENDPOINT_PREFIX = "email"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"EndpointId":{"required":false,"documentation":"Operation parameter for EndpointId","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"EndpointId"}]},{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"ref":"EndpointId"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"endpoint":{"url":{"ref":"Endpoint"},"properties":{"authSchemes":[{"name":"sigv4a","signingName":"ses","signingRegionSet":["*"]}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{EndpointId}.endpoints.email.global.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4a","signingName":"ses","signingRegionSet":["*"]}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://{EndpointId}.endpoints.email.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4a","signingName":"ses","signingRegionSet":["*"]}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: FIPS is not supported with multi-region endpoints","type":"error"}],"type":"tree"},{"conditions":[],"error":"EndpointId must be a valid host label","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://email-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://email-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://email.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://email.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_METRIC_DATA = OperationModel.new(
        name: "BatchGetMetricData",
        http_method: "POST",
        request_uri: "/v2/email/metrics/batch"
      )

      CANCEL_EXPORT_JOB = OperationModel.new(
        name: "CancelExportJob",
        http_method: "PUT",
        request_uri: "/v2/email/export-jobs/{JobId}/cancel"
      )

      CREATE_CONFIGURATION_SET = OperationModel.new(
        name: "CreateConfigurationSet",
        http_method: "POST",
        request_uri: "/v2/email/configuration-sets"
      )

      CREATE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "CreateConfigurationSetEventDestination",
        http_method: "POST",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations"
      )

      CREATE_CONTACT = OperationModel.new(
        name: "CreateContact",
        http_method: "POST",
        request_uri: "/v2/email/contact-lists/{ContactListName}/contacts"
      )

      CREATE_CONTACT_LIST = OperationModel.new(
        name: "CreateContactList",
        http_method: "POST",
        request_uri: "/v2/email/contact-lists"
      )

      CREATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "CreateCustomVerificationEmailTemplate",
        http_method: "POST",
        request_uri: "/v2/email/custom-verification-email-templates"
      )

      CREATE_DEDICATED_IP_POOL = OperationModel.new(
        name: "CreateDedicatedIpPool",
        http_method: "POST",
        request_uri: "/v2/email/dedicated-ip-pools"
      )

      CREATE_DELIVERABILITY_TEST_REPORT = OperationModel.new(
        name: "CreateDeliverabilityTestReport",
        http_method: "POST",
        request_uri: "/v2/email/deliverability-dashboard/test"
      )

      CREATE_EMAIL_IDENTITY = OperationModel.new(
        name: "CreateEmailIdentity",
        http_method: "POST",
        request_uri: "/v2/email/identities"
      )

      CREATE_EMAIL_IDENTITY_POLICY = OperationModel.new(
        name: "CreateEmailIdentityPolicy",
        http_method: "POST",
        request_uri: "/v2/email/identities/{EmailIdentity}/policies/{PolicyName}"
      )

      CREATE_EMAIL_TEMPLATE = OperationModel.new(
        name: "CreateEmailTemplate",
        http_method: "POST",
        request_uri: "/v2/email/templates"
      )

      CREATE_EXPORT_JOB = OperationModel.new(
        name: "CreateExportJob",
        http_method: "POST",
        request_uri: "/v2/email/export-jobs"
      )

      CREATE_IMPORT_JOB = OperationModel.new(
        name: "CreateImportJob",
        http_method: "POST",
        request_uri: "/v2/email/import-jobs"
      )

      CREATE_MULTI_REGION_ENDPOINT = OperationModel.new(
        name: "CreateMultiRegionEndpoint",
        http_method: "POST",
        request_uri: "/v2/email/multi-region-endpoints"
      )

      CREATE_TENANT = OperationModel.new(
        name: "CreateTenant",
        http_method: "POST",
        request_uri: "/v2/email/tenants"
      )

      CREATE_TENANT_RESOURCE_ASSOCIATION = OperationModel.new(
        name: "CreateTenantResourceAssociation",
        http_method: "POST",
        request_uri: "/v2/email/tenants/resources"
      )

      DELETE_CONFIGURATION_SET = OperationModel.new(
        name: "DeleteConfigurationSet",
        http_method: "DELETE",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}"
      )

      DELETE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "DeleteConfigurationSetEventDestination",
        http_method: "DELETE",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}"
      )

      DELETE_CONTACT = OperationModel.new(
        name: "DeleteContact",
        http_method: "DELETE",
        request_uri: "/v2/email/contact-lists/{ContactListName}/contacts/{EmailAddress}"
      )

      DELETE_CONTACT_LIST = OperationModel.new(
        name: "DeleteContactList",
        http_method: "DELETE",
        request_uri: "/v2/email/contact-lists/{ContactListName}"
      )

      DELETE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "DeleteCustomVerificationEmailTemplate",
        http_method: "DELETE",
        request_uri: "/v2/email/custom-verification-email-templates/{TemplateName}"
      )

      DELETE_DEDICATED_IP_POOL = OperationModel.new(
        name: "DeleteDedicatedIpPool",
        http_method: "DELETE",
        request_uri: "/v2/email/dedicated-ip-pools/{PoolName}"
      )

      DELETE_EMAIL_IDENTITY = OperationModel.new(
        name: "DeleteEmailIdentity",
        http_method: "DELETE",
        request_uri: "/v2/email/identities/{EmailIdentity}"
      )

      DELETE_EMAIL_IDENTITY_POLICY = OperationModel.new(
        name: "DeleteEmailIdentityPolicy",
        http_method: "DELETE",
        request_uri: "/v2/email/identities/{EmailIdentity}/policies/{PolicyName}"
      )

      DELETE_EMAIL_TEMPLATE = OperationModel.new(
        name: "DeleteEmailTemplate",
        http_method: "DELETE",
        request_uri: "/v2/email/templates/{TemplateName}"
      )

      DELETE_MULTI_REGION_ENDPOINT = OperationModel.new(
        name: "DeleteMultiRegionEndpoint",
        http_method: "DELETE",
        request_uri: "/v2/email/multi-region-endpoints/{EndpointName}"
      )

      DELETE_SUPPRESSED_DESTINATION = OperationModel.new(
        name: "DeleteSuppressedDestination",
        http_method: "DELETE",
        request_uri: "/v2/email/suppression/addresses/{EmailAddress}"
      )

      DELETE_TENANT = OperationModel.new(
        name: "DeleteTenant",
        http_method: "POST",
        request_uri: "/v2/email/tenants/delete"
      )

      DELETE_TENANT_RESOURCE_ASSOCIATION = OperationModel.new(
        name: "DeleteTenantResourceAssociation",
        http_method: "POST",
        request_uri: "/v2/email/tenants/resources/delete"
      )

      GET_ACCOUNT = OperationModel.new(
        name: "GetAccount",
        http_method: "GET",
        request_uri: "/v2/email/account"
      )

      GET_BLACKLIST_REPORTS = OperationModel.new(
        name: "GetBlacklistReports",
        http_method: "GET",
        request_uri: "/v2/email/deliverability-dashboard/blacklist-report"
      )

      GET_CONFIGURATION_SET = OperationModel.new(
        name: "GetConfigurationSet",
        http_method: "GET",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}"
      )

      GET_CONFIGURATION_SET_EVENT_DESTINATIONS = OperationModel.new(
        name: "GetConfigurationSetEventDestinations",
        http_method: "GET",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations"
      )

      GET_CONTACT = OperationModel.new(
        name: "GetContact",
        http_method: "GET",
        request_uri: "/v2/email/contact-lists/{ContactListName}/contacts/{EmailAddress}"
      )

      GET_CONTACT_LIST = OperationModel.new(
        name: "GetContactList",
        http_method: "GET",
        request_uri: "/v2/email/contact-lists/{ContactListName}"
      )

      GET_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "GetCustomVerificationEmailTemplate",
        http_method: "GET",
        request_uri: "/v2/email/custom-verification-email-templates/{TemplateName}"
      )

      GET_DEDICATED_IP = OperationModel.new(
        name: "GetDedicatedIp",
        http_method: "GET",
        request_uri: "/v2/email/dedicated-ips/{IP}"
      )

      GET_DEDICATED_IP_POOL = OperationModel.new(
        name: "GetDedicatedIpPool",
        http_method: "GET",
        request_uri: "/v2/email/dedicated-ip-pools/{PoolName}"
      )

      GET_DEDICATED_IPS = OperationModel.new(
        name: "GetDedicatedIps",
        http_method: "GET",
        request_uri: "/v2/email/dedicated-ips"
      )

      GET_DELIVERABILITY_DASHBOARD_OPTIONS = OperationModel.new(
        name: "GetDeliverabilityDashboardOptions",
        http_method: "GET",
        request_uri: "/v2/email/deliverability-dashboard"
      )

      GET_DELIVERABILITY_TEST_REPORT = OperationModel.new(
        name: "GetDeliverabilityTestReport",
        http_method: "GET",
        request_uri: "/v2/email/deliverability-dashboard/test-reports/{ReportId}"
      )

      GET_DOMAIN_DELIVERABILITY_CAMPAIGN = OperationModel.new(
        name: "GetDomainDeliverabilityCampaign",
        http_method: "GET",
        request_uri: "/v2/email/deliverability-dashboard/campaigns/{CampaignId}"
      )

      GET_DOMAIN_STATISTICS_REPORT = OperationModel.new(
        name: "GetDomainStatisticsReport",
        http_method: "GET",
        request_uri: "/v2/email/deliverability-dashboard/statistics-report/{Domain}"
      )

      GET_EMAIL_ADDRESS_INSIGHTS = OperationModel.new(
        name: "GetEmailAddressInsights",
        http_method: "POST",
        request_uri: "/v2/email/email-address-insights/"
      )

      GET_EMAIL_IDENTITY = OperationModel.new(
        name: "GetEmailIdentity",
        http_method: "GET",
        request_uri: "/v2/email/identities/{EmailIdentity}"
      )

      GET_EMAIL_IDENTITY_POLICIES = OperationModel.new(
        name: "GetEmailIdentityPolicies",
        http_method: "GET",
        request_uri: "/v2/email/identities/{EmailIdentity}/policies"
      )

      GET_EMAIL_TEMPLATE = OperationModel.new(
        name: "GetEmailTemplate",
        http_method: "GET",
        request_uri: "/v2/email/templates/{TemplateName}"
      )

      GET_EXPORT_JOB = OperationModel.new(
        name: "GetExportJob",
        http_method: "GET",
        request_uri: "/v2/email/export-jobs/{JobId}"
      )

      GET_IMPORT_JOB = OperationModel.new(
        name: "GetImportJob",
        http_method: "GET",
        request_uri: "/v2/email/import-jobs/{JobId}"
      )

      GET_MESSAGE_INSIGHTS = OperationModel.new(
        name: "GetMessageInsights",
        http_method: "GET",
        request_uri: "/v2/email/insights/{MessageId}/"
      )

      GET_MULTI_REGION_ENDPOINT = OperationModel.new(
        name: "GetMultiRegionEndpoint",
        http_method: "GET",
        request_uri: "/v2/email/multi-region-endpoints/{EndpointName}"
      )

      GET_REPUTATION_ENTITY = OperationModel.new(
        name: "GetReputationEntity",
        http_method: "GET",
        request_uri: "/v2/email/reputation/entities/{ReputationEntityType}/{ReputationEntityReference}"
      )

      GET_SUPPRESSED_DESTINATION = OperationModel.new(
        name: "GetSuppressedDestination",
        http_method: "GET",
        request_uri: "/v2/email/suppression/addresses/{EmailAddress}"
      )

      GET_TENANT = OperationModel.new(
        name: "GetTenant",
        http_method: "POST",
        request_uri: "/v2/email/tenants/get"
      )

      LIST_CONFIGURATION_SETS = OperationModel.new(
        name: "ListConfigurationSets",
        http_method: "GET",
        request_uri: "/v2/email/configuration-sets"
      )

      LIST_CONTACT_LISTS = OperationModel.new(
        name: "ListContactLists",
        http_method: "GET",
        request_uri: "/v2/email/contact-lists"
      )

      LIST_CONTACTS = OperationModel.new(
        name: "ListContacts",
        http_method: "POST",
        request_uri: "/v2/email/contact-lists/{ContactListName}/contacts/list"
      )

      LIST_CUSTOM_VERIFICATION_EMAIL_TEMPLATES = OperationModel.new(
        name: "ListCustomVerificationEmailTemplates",
        http_method: "GET",
        request_uri: "/v2/email/custom-verification-email-templates"
      )

      LIST_DEDICATED_IP_POOLS = OperationModel.new(
        name: "ListDedicatedIpPools",
        http_method: "GET",
        request_uri: "/v2/email/dedicated-ip-pools"
      )

      LIST_DELIVERABILITY_TEST_REPORTS = OperationModel.new(
        name: "ListDeliverabilityTestReports",
        http_method: "GET",
        request_uri: "/v2/email/deliverability-dashboard/test-reports"
      )

      LIST_DOMAIN_DELIVERABILITY_CAMPAIGNS = OperationModel.new(
        name: "ListDomainDeliverabilityCampaigns",
        http_method: "GET",
        request_uri: "/v2/email/deliverability-dashboard/domains/{SubscribedDomain}/campaigns"
      )

      LIST_EMAIL_IDENTITIES = OperationModel.new(
        name: "ListEmailIdentities",
        http_method: "GET",
        request_uri: "/v2/email/identities"
      )

      LIST_EMAIL_TEMPLATES = OperationModel.new(
        name: "ListEmailTemplates",
        http_method: "GET",
        request_uri: "/v2/email/templates"
      )

      LIST_EXPORT_JOBS = OperationModel.new(
        name: "ListExportJobs",
        http_method: "POST",
        request_uri: "/v2/email/list-export-jobs"
      )

      LIST_IMPORT_JOBS = OperationModel.new(
        name: "ListImportJobs",
        http_method: "POST",
        request_uri: "/v2/email/import-jobs/list"
      )

      LIST_MULTI_REGION_ENDPOINTS = OperationModel.new(
        name: "ListMultiRegionEndpoints",
        http_method: "GET",
        request_uri: "/v2/email/multi-region-endpoints"
      )

      LIST_RECOMMENDATIONS = OperationModel.new(
        name: "ListRecommendations",
        http_method: "POST",
        request_uri: "/v2/email/vdm/recommendations"
      )

      LIST_REPUTATION_ENTITIES = OperationModel.new(
        name: "ListReputationEntities",
        http_method: "POST",
        request_uri: "/v2/email/reputation/entities"
      )

      LIST_RESOURCE_TENANTS = OperationModel.new(
        name: "ListResourceTenants",
        http_method: "POST",
        request_uri: "/v2/email/resources/tenants/list"
      )

      LIST_SUPPRESSED_DESTINATIONS = OperationModel.new(
        name: "ListSuppressedDestinations",
        http_method: "GET",
        request_uri: "/v2/email/suppression/addresses"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v2/email/tags"
      )

      LIST_TENANT_RESOURCES = OperationModel.new(
        name: "ListTenantResources",
        http_method: "POST",
        request_uri: "/v2/email/tenants/resources/list"
      )

      LIST_TENANTS = OperationModel.new(
        name: "ListTenants",
        http_method: "POST",
        request_uri: "/v2/email/tenants/list"
      )

      PUT_ACCOUNT_DEDICATED_IP_WARMUP_ATTRIBUTES = OperationModel.new(
        name: "PutAccountDedicatedIpWarmupAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/account/dedicated-ips/warmup"
      )

      PUT_ACCOUNT_DETAILS = OperationModel.new(
        name: "PutAccountDetails",
        http_method: "POST",
        request_uri: "/v2/email/account/details"
      )

      PUT_ACCOUNT_SENDING_ATTRIBUTES = OperationModel.new(
        name: "PutAccountSendingAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/account/sending"
      )

      PUT_ACCOUNT_SUPPRESSION_ATTRIBUTES = OperationModel.new(
        name: "PutAccountSuppressionAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/account/suppression"
      )

      PUT_ACCOUNT_VDM_ATTRIBUTES = OperationModel.new(
        name: "PutAccountVdmAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/account/vdm"
      )

      PUT_CONFIGURATION_SET_ARCHIVING_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetArchivingOptions",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/archiving-options"
      )

      PUT_CONFIGURATION_SET_DELIVERY_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetDeliveryOptions",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/delivery-options"
      )

      PUT_CONFIGURATION_SET_REPUTATION_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetReputationOptions",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/reputation-options"
      )

      PUT_CONFIGURATION_SET_SENDING_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetSendingOptions",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/sending"
      )

      PUT_CONFIGURATION_SET_SUPPRESSION_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetSuppressionOptions",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/suppression-options"
      )

      PUT_CONFIGURATION_SET_TRACKING_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetTrackingOptions",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/tracking-options"
      )

      PUT_CONFIGURATION_SET_VDM_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetVdmOptions",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/vdm-options"
      )

      PUT_DEDICATED_IP_IN_POOL = OperationModel.new(
        name: "PutDedicatedIpInPool",
        http_method: "PUT",
        request_uri: "/v2/email/dedicated-ips/{IP}/pool"
      )

      PUT_DEDICATED_IP_POOL_SCALING_ATTRIBUTES = OperationModel.new(
        name: "PutDedicatedIpPoolScalingAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/dedicated-ip-pools/{PoolName}/scaling"
      )

      PUT_DEDICATED_IP_WARMUP_ATTRIBUTES = OperationModel.new(
        name: "PutDedicatedIpWarmupAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/dedicated-ips/{IP}/warmup"
      )

      PUT_DELIVERABILITY_DASHBOARD_OPTION = OperationModel.new(
        name: "PutDeliverabilityDashboardOption",
        http_method: "PUT",
        request_uri: "/v2/email/deliverability-dashboard"
      )

      PUT_EMAIL_IDENTITY_CONFIGURATION_SET_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityConfigurationSetAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/identities/{EmailIdentity}/configuration-set"
      )

      PUT_EMAIL_IDENTITY_DKIM_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityDkimAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/identities/{EmailIdentity}/dkim"
      )

      PUT_EMAIL_IDENTITY_DKIM_SIGNING_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityDkimSigningAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/identities/{EmailIdentity}/dkim/signing"
      )

      PUT_EMAIL_IDENTITY_FEEDBACK_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityFeedbackAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/identities/{EmailIdentity}/feedback"
      )

      PUT_EMAIL_IDENTITY_MAIL_FROM_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityMailFromAttributes",
        http_method: "PUT",
        request_uri: "/v2/email/identities/{EmailIdentity}/mail-from"
      )

      PUT_SUPPRESSED_DESTINATION = OperationModel.new(
        name: "PutSuppressedDestination",
        http_method: "PUT",
        request_uri: "/v2/email/suppression/addresses"
      )

      SEND_BULK_EMAIL = OperationModel.new(
        name: "SendBulkEmail",
        http_method: "POST",
        request_uri: "/v2/email/outbound-bulk-emails"
      )

      SEND_CUSTOM_VERIFICATION_EMAIL = OperationModel.new(
        name: "SendCustomVerificationEmail",
        http_method: "POST",
        request_uri: "/v2/email/outbound-custom-verification-emails"
      )

      SEND_EMAIL = OperationModel.new(
        name: "SendEmail",
        http_method: "POST",
        request_uri: "/v2/email/outbound-emails"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v2/email/tags"
      )

      TEST_RENDER_EMAIL_TEMPLATE = OperationModel.new(
        name: "TestRenderEmailTemplate",
        http_method: "POST",
        request_uri: "/v2/email/templates/{TemplateName}/render"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v2/email/tags"
      )

      UPDATE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "UpdateConfigurationSetEventDestination",
        http_method: "PUT",
        request_uri: "/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}"
      )

      UPDATE_CONTACT = OperationModel.new(
        name: "UpdateContact",
        http_method: "PUT",
        request_uri: "/v2/email/contact-lists/{ContactListName}/contacts/{EmailAddress}"
      )

      UPDATE_CONTACT_LIST = OperationModel.new(
        name: "UpdateContactList",
        http_method: "PUT",
        request_uri: "/v2/email/contact-lists/{ContactListName}"
      )

      UPDATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "UpdateCustomVerificationEmailTemplate",
        http_method: "PUT",
        request_uri: "/v2/email/custom-verification-email-templates/{TemplateName}"
      )

      UPDATE_EMAIL_IDENTITY_POLICY = OperationModel.new(
        name: "UpdateEmailIdentityPolicy",
        http_method: "PUT",
        request_uri: "/v2/email/identities/{EmailIdentity}/policies/{PolicyName}"
      )

      UPDATE_EMAIL_TEMPLATE = OperationModel.new(
        name: "UpdateEmailTemplate",
        http_method: "PUT",
        request_uri: "/v2/email/templates/{TemplateName}"
      )

      UPDATE_REPUTATION_ENTITY_CUSTOMER_MANAGED_STATUS = OperationModel.new(
        name: "UpdateReputationEntityCustomerManagedStatus",
        http_method: "PUT",
        request_uri: "/v2/email/reputation/entities/{ReputationEntityType}/{ReputationEntityReference}/customer-managed-status"
      )

      UPDATE_REPUTATION_ENTITY_POLICY = OperationModel.new(
        name: "UpdateReputationEntityPolicy",
        http_method: "PUT",
        request_uri: "/v2/email/reputation/entities/{ReputationEntityType}/{ReputationEntityReference}/policy"
      )
    end
  end
end
