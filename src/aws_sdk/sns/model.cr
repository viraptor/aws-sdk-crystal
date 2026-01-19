module AwsSdk
  module SNS
    module Model
      API_VERSION = "2010-03-31"
      TARGET_PREFIX = ""
      SIGNING_NAME = "sns"
      ENDPOINT_PREFIX = "sns"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sns-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://sns.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://sns.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://sns-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sns.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://sns.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_PERMISSION = OperationModel.new(
        name: "AddPermission",
        http_method: "POST",
        request_uri: "/"
      )

      CHECK_IF_PHONE_NUMBER_IS_OPTED_OUT = OperationModel.new(
        name: "CheckIfPhoneNumberIsOptedOut",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_SUBSCRIPTION = OperationModel.new(
        name: "ConfirmSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PLATFORM_APPLICATION = OperationModel.new(
        name: "CreatePlatformApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PLATFORM_ENDPOINT = OperationModel.new(
        name: "CreatePlatformEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SMS_SANDBOX_PHONE_NUMBER = OperationModel.new(
        name: "CreateSMSSandboxPhoneNumber",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TOPIC = OperationModel.new(
        name: "CreateTopic",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENDPOINT = OperationModel.new(
        name: "DeleteEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PLATFORM_APPLICATION = OperationModel.new(
        name: "DeletePlatformApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SMS_SANDBOX_PHONE_NUMBER = OperationModel.new(
        name: "DeleteSMSSandboxPhoneNumber",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TOPIC = OperationModel.new(
        name: "DeleteTopic",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_PROTECTION_POLICY = OperationModel.new(
        name: "GetDataProtectionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENDPOINT_ATTRIBUTES = OperationModel.new(
        name: "GetEndpointAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PLATFORM_APPLICATION_ATTRIBUTES = OperationModel.new(
        name: "GetPlatformApplicationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SMS_ATTRIBUTES = OperationModel.new(
        name: "GetSMSAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SMS_SANDBOX_ACCOUNT_STATUS = OperationModel.new(
        name: "GetSMSSandboxAccountStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SUBSCRIPTION_ATTRIBUTES = OperationModel.new(
        name: "GetSubscriptionAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TOPIC_ATTRIBUTES = OperationModel.new(
        name: "GetTopicAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENDPOINTS_BY_PLATFORM_APPLICATION = OperationModel.new(
        name: "ListEndpointsByPlatformApplication",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ORIGINATION_NUMBERS = OperationModel.new(
        name: "ListOriginationNumbers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PHONE_NUMBERS_OPTED_OUT = OperationModel.new(
        name: "ListPhoneNumbersOptedOut",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PLATFORM_APPLICATIONS = OperationModel.new(
        name: "ListPlatformApplications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SMS_SANDBOX_PHONE_NUMBERS = OperationModel.new(
        name: "ListSMSSandboxPhoneNumbers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SUBSCRIPTIONS = OperationModel.new(
        name: "ListSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SUBSCRIPTIONS_BY_TOPIC = OperationModel.new(
        name: "ListSubscriptionsByTopic",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TOPICS = OperationModel.new(
        name: "ListTopics",
        http_method: "POST",
        request_uri: "/"
      )

      OPT_IN_PHONE_NUMBER = OperationModel.new(
        name: "OptInPhoneNumber",
        http_method: "POST",
        request_uri: "/"
      )

      PUBLISH = OperationModel.new(
        name: "Publish",
        http_method: "POST",
        request_uri: "/"
      )

      PUBLISH_BATCH = OperationModel.new(
        name: "PublishBatch",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_DATA_PROTECTION_POLICY = OperationModel.new(
        name: "PutDataProtectionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_PERMISSION = OperationModel.new(
        name: "RemovePermission",
        http_method: "POST",
        request_uri: "/"
      )

      SET_ENDPOINT_ATTRIBUTES = OperationModel.new(
        name: "SetEndpointAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      SET_PLATFORM_APPLICATION_ATTRIBUTES = OperationModel.new(
        name: "SetPlatformApplicationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      SET_SMS_ATTRIBUTES = OperationModel.new(
        name: "SetSMSAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      SET_SUBSCRIPTION_ATTRIBUTES = OperationModel.new(
        name: "SetSubscriptionAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      SET_TOPIC_ATTRIBUTES = OperationModel.new(
        name: "SetTopicAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      SUBSCRIBE = OperationModel.new(
        name: "Subscribe",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNSUBSCRIBE = OperationModel.new(
        name: "Unsubscribe",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_SMS_SANDBOX_PHONE_NUMBER = OperationModel.new(
        name: "VerifySMSSandboxPhoneNumber",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
