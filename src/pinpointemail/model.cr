module Aws
  module PinpointEmail
    module Model
      API_VERSION = "2018-07-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ses"
      ENDPOINT_PREFIX = "email"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://email-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://email-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://email.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://email.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CONFIGURATION_SET = OperationModel.new(
        name: "CreateConfigurationSet",
        http_method: "POST",
        request_uri: "/v1/email/configuration-sets"
      )

      CREATE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "CreateConfigurationSetEventDestination",
        http_method: "POST",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/event-destinations"
      )

      CREATE_DEDICATED_IP_POOL = OperationModel.new(
        name: "CreateDedicatedIpPool",
        http_method: "POST",
        request_uri: "/v1/email/dedicated-ip-pools"
      )

      CREATE_DELIVERABILITY_TEST_REPORT = OperationModel.new(
        name: "CreateDeliverabilityTestReport",
        http_method: "POST",
        request_uri: "/v1/email/deliverability-dashboard/test"
      )

      CREATE_EMAIL_IDENTITY = OperationModel.new(
        name: "CreateEmailIdentity",
        http_method: "POST",
        request_uri: "/v1/email/identities"
      )

      DELETE_CONFIGURATION_SET = OperationModel.new(
        name: "DeleteConfigurationSet",
        http_method: "DELETE",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}"
      )

      DELETE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "DeleteConfigurationSetEventDestination",
        http_method: "DELETE",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}"
      )

      DELETE_DEDICATED_IP_POOL = OperationModel.new(
        name: "DeleteDedicatedIpPool",
        http_method: "DELETE",
        request_uri: "/v1/email/dedicated-ip-pools/{PoolName}"
      )

      DELETE_EMAIL_IDENTITY = OperationModel.new(
        name: "DeleteEmailIdentity",
        http_method: "DELETE",
        request_uri: "/v1/email/identities/{EmailIdentity}"
      )

      GET_ACCOUNT = OperationModel.new(
        name: "GetAccount",
        http_method: "GET",
        request_uri: "/v1/email/account"
      )

      GET_BLACKLIST_REPORTS = OperationModel.new(
        name: "GetBlacklistReports",
        http_method: "GET",
        request_uri: "/v1/email/deliverability-dashboard/blacklist-report"
      )

      GET_CONFIGURATION_SET = OperationModel.new(
        name: "GetConfigurationSet",
        http_method: "GET",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}"
      )

      GET_CONFIGURATION_SET_EVENT_DESTINATIONS = OperationModel.new(
        name: "GetConfigurationSetEventDestinations",
        http_method: "GET",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/event-destinations"
      )

      GET_DEDICATED_IP = OperationModel.new(
        name: "GetDedicatedIp",
        http_method: "GET",
        request_uri: "/v1/email/dedicated-ips/{IP}"
      )

      GET_DEDICATED_IPS = OperationModel.new(
        name: "GetDedicatedIps",
        http_method: "GET",
        request_uri: "/v1/email/dedicated-ips"
      )

      GET_DELIVERABILITY_DASHBOARD_OPTIONS = OperationModel.new(
        name: "GetDeliverabilityDashboardOptions",
        http_method: "GET",
        request_uri: "/v1/email/deliverability-dashboard"
      )

      GET_DELIVERABILITY_TEST_REPORT = OperationModel.new(
        name: "GetDeliverabilityTestReport",
        http_method: "GET",
        request_uri: "/v1/email/deliverability-dashboard/test-reports/{ReportId}"
      )

      GET_DOMAIN_DELIVERABILITY_CAMPAIGN = OperationModel.new(
        name: "GetDomainDeliverabilityCampaign",
        http_method: "GET",
        request_uri: "/v1/email/deliverability-dashboard/campaigns/{CampaignId}"
      )

      GET_DOMAIN_STATISTICS_REPORT = OperationModel.new(
        name: "GetDomainStatisticsReport",
        http_method: "GET",
        request_uri: "/v1/email/deliverability-dashboard/statistics-report/{Domain}"
      )

      GET_EMAIL_IDENTITY = OperationModel.new(
        name: "GetEmailIdentity",
        http_method: "GET",
        request_uri: "/v1/email/identities/{EmailIdentity}"
      )

      LIST_CONFIGURATION_SETS = OperationModel.new(
        name: "ListConfigurationSets",
        http_method: "GET",
        request_uri: "/v1/email/configuration-sets"
      )

      LIST_DEDICATED_IP_POOLS = OperationModel.new(
        name: "ListDedicatedIpPools",
        http_method: "GET",
        request_uri: "/v1/email/dedicated-ip-pools"
      )

      LIST_DELIVERABILITY_TEST_REPORTS = OperationModel.new(
        name: "ListDeliverabilityTestReports",
        http_method: "GET",
        request_uri: "/v1/email/deliverability-dashboard/test-reports"
      )

      LIST_DOMAIN_DELIVERABILITY_CAMPAIGNS = OperationModel.new(
        name: "ListDomainDeliverabilityCampaigns",
        http_method: "GET",
        request_uri: "/v1/email/deliverability-dashboard/domains/{SubscribedDomain}/campaigns"
      )

      LIST_EMAIL_IDENTITIES = OperationModel.new(
        name: "ListEmailIdentities",
        http_method: "GET",
        request_uri: "/v1/email/identities"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/email/tags"
      )

      PUT_ACCOUNT_DEDICATED_IP_WARMUP_ATTRIBUTES = OperationModel.new(
        name: "PutAccountDedicatedIpWarmupAttributes",
        http_method: "PUT",
        request_uri: "/v1/email/account/dedicated-ips/warmup"
      )

      PUT_ACCOUNT_SENDING_ATTRIBUTES = OperationModel.new(
        name: "PutAccountSendingAttributes",
        http_method: "PUT",
        request_uri: "/v1/email/account/sending"
      )

      PUT_CONFIGURATION_SET_DELIVERY_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetDeliveryOptions",
        http_method: "PUT",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/delivery-options"
      )

      PUT_CONFIGURATION_SET_REPUTATION_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetReputationOptions",
        http_method: "PUT",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/reputation-options"
      )

      PUT_CONFIGURATION_SET_SENDING_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetSendingOptions",
        http_method: "PUT",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/sending"
      )

      PUT_CONFIGURATION_SET_TRACKING_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetTrackingOptions",
        http_method: "PUT",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/tracking-options"
      )

      PUT_DEDICATED_IP_IN_POOL = OperationModel.new(
        name: "PutDedicatedIpInPool",
        http_method: "PUT",
        request_uri: "/v1/email/dedicated-ips/{IP}/pool"
      )

      PUT_DEDICATED_IP_WARMUP_ATTRIBUTES = OperationModel.new(
        name: "PutDedicatedIpWarmupAttributes",
        http_method: "PUT",
        request_uri: "/v1/email/dedicated-ips/{IP}/warmup"
      )

      PUT_DELIVERABILITY_DASHBOARD_OPTION = OperationModel.new(
        name: "PutDeliverabilityDashboardOption",
        http_method: "PUT",
        request_uri: "/v1/email/deliverability-dashboard"
      )

      PUT_EMAIL_IDENTITY_DKIM_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityDkimAttributes",
        http_method: "PUT",
        request_uri: "/v1/email/identities/{EmailIdentity}/dkim"
      )

      PUT_EMAIL_IDENTITY_FEEDBACK_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityFeedbackAttributes",
        http_method: "PUT",
        request_uri: "/v1/email/identities/{EmailIdentity}/feedback"
      )

      PUT_EMAIL_IDENTITY_MAIL_FROM_ATTRIBUTES = OperationModel.new(
        name: "PutEmailIdentityMailFromAttributes",
        http_method: "PUT",
        request_uri: "/v1/email/identities/{EmailIdentity}/mail-from"
      )

      SEND_EMAIL = OperationModel.new(
        name: "SendEmail",
        http_method: "POST",
        request_uri: "/v1/email/outbound-emails"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/email/tags"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v1/email/tags"
      )

      UPDATE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "UpdateConfigurationSetEventDestination",
        http_method: "PUT",
        request_uri: "/v1/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}"
      )
    end
  end
end
