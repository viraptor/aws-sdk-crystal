module AwsSdk
  module PinpointSMSVoiceV2
    module Model
      API_VERSION = "2022-03-31"
      TARGET_PREFIX = "PinpointSMSVoiceV2"
      SIGNING_NAME = "sms-voice"
      ENDPOINT_PREFIX = "sms-voice"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sms-voice-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sms-voice-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sms-voice.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://sms-voice.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ORIGINATION_IDENTITY = OperationModel.new(
        name: "AssociateOriginationIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_PROTECT_CONFIGURATION = OperationModel.new(
        name: "AssociateProtectConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CARRIER_LOOKUP = OperationModel.new(
        name: "CarrierLookup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONFIGURATION_SET = OperationModel.new(
        name: "CreateConfigurationSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EVENT_DESTINATION = OperationModel.new(
        name: "CreateEventDestination",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OPT_OUT_LIST = OperationModel.new(
        name: "CreateOptOutList",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_POOL = OperationModel.new(
        name: "CreatePool",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROTECT_CONFIGURATION = OperationModel.new(
        name: "CreateProtectConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGISTRATION = OperationModel.new(
        name: "CreateRegistration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGISTRATION_ASSOCIATION = OperationModel.new(
        name: "CreateRegistrationAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGISTRATION_ATTACHMENT = OperationModel.new(
        name: "CreateRegistrationAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGISTRATION_VERSION = OperationModel.new(
        name: "CreateRegistrationVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VERIFIED_DESTINATION_NUMBER = OperationModel.new(
        name: "CreateVerifiedDestinationNumber",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCOUNT_DEFAULT_PROTECT_CONFIGURATION = OperationModel.new(
        name: "DeleteAccountDefaultProtectConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIGURATION_SET = OperationModel.new(
        name: "DeleteConfigurationSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEFAULT_MESSAGE_TYPE = OperationModel.new(
        name: "DeleteDefaultMessageType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEFAULT_SENDER_ID = OperationModel.new(
        name: "DeleteDefaultSenderId",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENT_DESTINATION = OperationModel.new(
        name: "DeleteEventDestination",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_KEYWORD = OperationModel.new(
        name: "DeleteKeyword",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MEDIA_MESSAGE_SPEND_LIMIT_OVERRIDE = OperationModel.new(
        name: "DeleteMediaMessageSpendLimitOverride",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OPT_OUT_LIST = OperationModel.new(
        name: "DeleteOptOutList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OPTED_OUT_NUMBER = OperationModel.new(
        name: "DeleteOptedOutNumber",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POOL = OperationModel.new(
        name: "DeletePool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROTECT_CONFIGURATION = OperationModel.new(
        name: "DeleteProtectConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROTECT_CONFIGURATION_RULE_SET_NUMBER_OVERRIDE = OperationModel.new(
        name: "DeleteProtectConfigurationRuleSetNumberOverride",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGISTRATION = OperationModel.new(
        name: "DeleteRegistration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGISTRATION_ATTACHMENT = OperationModel.new(
        name: "DeleteRegistrationAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGISTRATION_FIELD_VALUE = OperationModel.new(
        name: "DeleteRegistrationFieldValue",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TEXT_MESSAGE_SPEND_LIMIT_OVERRIDE = OperationModel.new(
        name: "DeleteTextMessageSpendLimitOverride",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VERIFIED_DESTINATION_NUMBER = OperationModel.new(
        name: "DeleteVerifiedDestinationNumber",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VOICE_MESSAGE_SPEND_LIMIT_OVERRIDE = OperationModel.new(
        name: "DeleteVoiceMessageSpendLimitOverride",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_ATTRIBUTES = OperationModel.new(
        name: "DescribeAccountAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_LIMITS = OperationModel.new(
        name: "DescribeAccountLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_SETS = OperationModel.new(
        name: "DescribeConfigurationSets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_KEYWORDS = OperationModel.new(
        name: "DescribeKeywords",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OPT_OUT_LISTS = OperationModel.new(
        name: "DescribeOptOutLists",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OPTED_OUT_NUMBERS = OperationModel.new(
        name: "DescribeOptedOutNumbers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PHONE_NUMBERS = OperationModel.new(
        name: "DescribePhoneNumbers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_POOLS = OperationModel.new(
        name: "DescribePools",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROTECT_CONFIGURATIONS = OperationModel.new(
        name: "DescribeProtectConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRATION_ATTACHMENTS = OperationModel.new(
        name: "DescribeRegistrationAttachments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRATION_FIELD_DEFINITIONS = OperationModel.new(
        name: "DescribeRegistrationFieldDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRATION_FIELD_VALUES = OperationModel.new(
        name: "DescribeRegistrationFieldValues",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRATION_SECTION_DEFINITIONS = OperationModel.new(
        name: "DescribeRegistrationSectionDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRATION_TYPE_DEFINITIONS = OperationModel.new(
        name: "DescribeRegistrationTypeDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRATION_VERSIONS = OperationModel.new(
        name: "DescribeRegistrationVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRATIONS = OperationModel.new(
        name: "DescribeRegistrations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SENDER_IDS = OperationModel.new(
        name: "DescribeSenderIds",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPEND_LIMITS = OperationModel.new(
        name: "DescribeSpendLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VERIFIED_DESTINATION_NUMBERS = OperationModel.new(
        name: "DescribeVerifiedDestinationNumbers",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ORIGINATION_IDENTITY = OperationModel.new(
        name: "DisassociateOriginationIdentity",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_PROTECT_CONFIGURATION = OperationModel.new(
        name: "DisassociateProtectConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DISCARD_REGISTRATION_VERSION = OperationModel.new(
        name: "DiscardRegistrationVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROTECT_CONFIGURATION_COUNTRY_RULE_SET = OperationModel.new(
        name: "GetProtectConfigurationCountryRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_POOL_ORIGINATION_IDENTITIES = OperationModel.new(
        name: "ListPoolOriginationIdentities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROTECT_CONFIGURATION_RULE_SET_NUMBER_OVERRIDES = OperationModel.new(
        name: "ListProtectConfigurationRuleSetNumberOverrides",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REGISTRATION_ASSOCIATIONS = OperationModel.new(
        name: "ListRegistrationAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_KEYWORD = OperationModel.new(
        name: "PutKeyword",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_MESSAGE_FEEDBACK = OperationModel.new(
        name: "PutMessageFeedback",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_OPTED_OUT_NUMBER = OperationModel.new(
        name: "PutOptedOutNumber",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PROTECT_CONFIGURATION_RULE_SET_NUMBER_OVERRIDE = OperationModel.new(
        name: "PutProtectConfigurationRuleSetNumberOverride",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REGISTRATION_FIELD_VALUE = OperationModel.new(
        name: "PutRegistrationFieldValue",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      RELEASE_PHONE_NUMBER = OperationModel.new(
        name: "ReleasePhoneNumber",
        http_method: "POST",
        request_uri: "/"
      )

      RELEASE_SENDER_ID = OperationModel.new(
        name: "ReleaseSenderId",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_PHONE_NUMBER = OperationModel.new(
        name: "RequestPhoneNumber",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_SENDER_ID = OperationModel.new(
        name: "RequestSenderId",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_DESTINATION_NUMBER_VERIFICATION_CODE = OperationModel.new(
        name: "SendDestinationNumberVerificationCode",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_MEDIA_MESSAGE = OperationModel.new(
        name: "SendMediaMessage",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_TEXT_MESSAGE = OperationModel.new(
        name: "SendTextMessage",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_VOICE_MESSAGE = OperationModel.new(
        name: "SendVoiceMessage",
        http_method: "POST",
        request_uri: "/"
      )

      SET_ACCOUNT_DEFAULT_PROTECT_CONFIGURATION = OperationModel.new(
        name: "SetAccountDefaultProtectConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      SET_DEFAULT_MESSAGE_FEEDBACK_ENABLED = OperationModel.new(
        name: "SetDefaultMessageFeedbackEnabled",
        http_method: "POST",
        request_uri: "/"
      )

      SET_DEFAULT_MESSAGE_TYPE = OperationModel.new(
        name: "SetDefaultMessageType",
        http_method: "POST",
        request_uri: "/"
      )

      SET_DEFAULT_SENDER_ID = OperationModel.new(
        name: "SetDefaultSenderId",
        http_method: "POST",
        request_uri: "/"
      )

      SET_MEDIA_MESSAGE_SPEND_LIMIT_OVERRIDE = OperationModel.new(
        name: "SetMediaMessageSpendLimitOverride",
        http_method: "POST",
        request_uri: "/"
      )

      SET_TEXT_MESSAGE_SPEND_LIMIT_OVERRIDE = OperationModel.new(
        name: "SetTextMessageSpendLimitOverride",
        http_method: "POST",
        request_uri: "/"
      )

      SET_VOICE_MESSAGE_SPEND_LIMIT_OVERRIDE = OperationModel.new(
        name: "SetVoiceMessageSpendLimitOverride",
        http_method: "POST",
        request_uri: "/"
      )

      SUBMIT_REGISTRATION_VERSION = OperationModel.new(
        name: "SubmitRegistrationVersion",
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

      UPDATE_EVENT_DESTINATION = OperationModel.new(
        name: "UpdateEventDestination",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PHONE_NUMBER = OperationModel.new(
        name: "UpdatePhoneNumber",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_POOL = OperationModel.new(
        name: "UpdatePool",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROTECT_CONFIGURATION = OperationModel.new(
        name: "UpdateProtectConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROTECT_CONFIGURATION_COUNTRY_RULE_SET = OperationModel.new(
        name: "UpdateProtectConfigurationCountryRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SENDER_ID = OperationModel.new(
        name: "UpdateSenderId",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_DESTINATION_NUMBER = OperationModel.new(
        name: "VerifyDestinationNumber",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
