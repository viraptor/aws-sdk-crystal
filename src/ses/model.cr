module Aws
  module SES
    module Model
      API_VERSION = "2010-12-01"
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

      CLONE_RECEIPT_RULE_SET = OperationModel.new(
        name: "CloneReceiptRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONFIGURATION_SET = OperationModel.new(
        name: "CreateConfigurationSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "CreateConfigurationSetEventDestination",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONFIGURATION_SET_TRACKING_OPTIONS = OperationModel.new(
        name: "CreateConfigurationSetTrackingOptions",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "CreateCustomVerificationEmailTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RECEIPT_FILTER = OperationModel.new(
        name: "CreateReceiptFilter",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RECEIPT_RULE = OperationModel.new(
        name: "CreateReceiptRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RECEIPT_RULE_SET = OperationModel.new(
        name: "CreateReceiptRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TEMPLATE = OperationModel.new(
        name: "CreateTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIGURATION_SET = OperationModel.new(
        name: "DeleteConfigurationSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "DeleteConfigurationSetEventDestination",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIGURATION_SET_TRACKING_OPTIONS = OperationModel.new(
        name: "DeleteConfigurationSetTrackingOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "DeleteCustomVerificationEmailTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITY = OperationModel.new(
        name: "DeleteIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IDENTITY_POLICY = OperationModel.new(
        name: "DeleteIdentityPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RECEIPT_FILTER = OperationModel.new(
        name: "DeleteReceiptFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RECEIPT_RULE = OperationModel.new(
        name: "DeleteReceiptRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RECEIPT_RULE_SET = OperationModel.new(
        name: "DeleteReceiptRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TEMPLATE = OperationModel.new(
        name: "DeleteTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VERIFIED_EMAIL_ADDRESS = OperationModel.new(
        name: "DeleteVerifiedEmailAddress",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACTIVE_RECEIPT_RULE_SET = OperationModel.new(
        name: "DescribeActiveReceiptRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_SET = OperationModel.new(
        name: "DescribeConfigurationSet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECEIPT_RULE = OperationModel.new(
        name: "DescribeReceiptRule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECEIPT_RULE_SET = OperationModel.new(
        name: "DescribeReceiptRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_SENDING_ENABLED = OperationModel.new(
        name: "GetAccountSendingEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "GetCustomVerificationEmailTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_DKIM_ATTRIBUTES = OperationModel.new(
        name: "GetIdentityDkimAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_MAIL_FROM_DOMAIN_ATTRIBUTES = OperationModel.new(
        name: "GetIdentityMailFromDomainAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_NOTIFICATION_ATTRIBUTES = OperationModel.new(
        name: "GetIdentityNotificationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_POLICIES = OperationModel.new(
        name: "GetIdentityPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_VERIFICATION_ATTRIBUTES = OperationModel.new(
        name: "GetIdentityVerificationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SEND_QUOTA = OperationModel.new(
        name: "GetSendQuota",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SEND_STATISTICS = OperationModel.new(
        name: "GetSendStatistics",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEMPLATE = OperationModel.new(
        name: "GetTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONFIGURATION_SETS = OperationModel.new(
        name: "ListConfigurationSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_VERIFICATION_EMAIL_TEMPLATES = OperationModel.new(
        name: "ListCustomVerificationEmailTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IDENTITIES = OperationModel.new(
        name: "ListIdentities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IDENTITY_POLICIES = OperationModel.new(
        name: "ListIdentityPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECEIPT_FILTERS = OperationModel.new(
        name: "ListReceiptFilters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECEIPT_RULE_SETS = OperationModel.new(
        name: "ListReceiptRuleSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TEMPLATES = OperationModel.new(
        name: "ListTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VERIFIED_EMAIL_ADDRESSES = OperationModel.new(
        name: "ListVerifiedEmailAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CONFIGURATION_SET_DELIVERY_OPTIONS = OperationModel.new(
        name: "PutConfigurationSetDeliveryOptions",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_IDENTITY_POLICY = OperationModel.new(
        name: "PutIdentityPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REORDER_RECEIPT_RULE_SET = OperationModel.new(
        name: "ReorderReceiptRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_BOUNCE = OperationModel.new(
        name: "SendBounce",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_BULK_TEMPLATED_EMAIL = OperationModel.new(
        name: "SendBulkTemplatedEmail",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_CUSTOM_VERIFICATION_EMAIL = OperationModel.new(
        name: "SendCustomVerificationEmail",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_EMAIL = OperationModel.new(
        name: "SendEmail",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_RAW_EMAIL = OperationModel.new(
        name: "SendRawEmail",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_TEMPLATED_EMAIL = OperationModel.new(
        name: "SendTemplatedEmail",
        http_method: "POST",
        request_uri: "/"
      )

      SET_ACTIVE_RECEIPT_RULE_SET = OperationModel.new(
        name: "SetActiveReceiptRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IDENTITY_DKIM_ENABLED = OperationModel.new(
        name: "SetIdentityDkimEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IDENTITY_FEEDBACK_FORWARDING_ENABLED = OperationModel.new(
        name: "SetIdentityFeedbackForwardingEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IDENTITY_HEADERS_IN_NOTIFICATIONS_ENABLED = OperationModel.new(
        name: "SetIdentityHeadersInNotificationsEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IDENTITY_MAIL_FROM_DOMAIN = OperationModel.new(
        name: "SetIdentityMailFromDomain",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IDENTITY_NOTIFICATION_TOPIC = OperationModel.new(
        name: "SetIdentityNotificationTopic",
        http_method: "POST",
        request_uri: "/"
      )

      SET_RECEIPT_RULE_POSITION = OperationModel.new(
        name: "SetReceiptRulePosition",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_RENDER_TEMPLATE = OperationModel.new(
        name: "TestRenderTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCOUNT_SENDING_ENABLED = OperationModel.new(
        name: "UpdateAccountSendingEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONFIGURATION_SET_EVENT_DESTINATION = OperationModel.new(
        name: "UpdateConfigurationSetEventDestination",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONFIGURATION_SET_REPUTATION_METRICS_ENABLED = OperationModel.new(
        name: "UpdateConfigurationSetReputationMetricsEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONFIGURATION_SET_SENDING_ENABLED = OperationModel.new(
        name: "UpdateConfigurationSetSendingEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONFIGURATION_SET_TRACKING_OPTIONS = OperationModel.new(
        name: "UpdateConfigurationSetTrackingOptions",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE = OperationModel.new(
        name: "UpdateCustomVerificationEmailTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RECEIPT_RULE = OperationModel.new(
        name: "UpdateReceiptRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TEMPLATE = OperationModel.new(
        name: "UpdateTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_DOMAIN_DKIM = OperationModel.new(
        name: "VerifyDomainDkim",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_DOMAIN_IDENTITY = OperationModel.new(
        name: "VerifyDomainIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_EMAIL_ADDRESS = OperationModel.new(
        name: "VerifyEmailAddress",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_EMAIL_IDENTITY = OperationModel.new(
        name: "VerifyEmailIdentity",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
