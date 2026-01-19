module AwsSdk
  module SocialMessaging
    module Model
      API_VERSION = "2024-01-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "social-messaging"
      ENDPOINT_PREFIX = "social-messaging"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://social-messaging-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://social-messaging-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://social-messaging.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://social-messaging.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_WHATS_APP_BUSINESS_ACCOUNT = OperationModel.new(
        name: "AssociateWhatsAppBusinessAccount",
        http_method: "POST",
        request_uri: "/v1/whatsapp/signup"
      )

      CREATE_WHATS_APP_MESSAGE_TEMPLATE = OperationModel.new(
        name: "CreateWhatsAppMessageTemplate",
        http_method: "POST",
        request_uri: "/v1/whatsapp/template/put"
      )

      CREATE_WHATS_APP_MESSAGE_TEMPLATE_FROM_LIBRARY = OperationModel.new(
        name: "CreateWhatsAppMessageTemplateFromLibrary",
        http_method: "POST",
        request_uri: "/v1/whatsapp/template/create"
      )

      CREATE_WHATS_APP_MESSAGE_TEMPLATE_MEDIA = OperationModel.new(
        name: "CreateWhatsAppMessageTemplateMedia",
        http_method: "POST",
        request_uri: "/v1/whatsapp/template/media"
      )

      DELETE_WHATS_APP_MESSAGE_MEDIA = OperationModel.new(
        name: "DeleteWhatsAppMessageMedia",
        http_method: "DELETE",
        request_uri: "/v1/whatsapp/media"
      )

      DELETE_WHATS_APP_MESSAGE_TEMPLATE = OperationModel.new(
        name: "DeleteWhatsAppMessageTemplate",
        http_method: "DELETE",
        request_uri: "/v1/whatsapp/template"
      )

      DISASSOCIATE_WHATS_APP_BUSINESS_ACCOUNT = OperationModel.new(
        name: "DisassociateWhatsAppBusinessAccount",
        http_method: "DELETE",
        request_uri: "/v1/whatsapp/waba/disassociate"
      )

      GET_LINKED_WHATS_APP_BUSINESS_ACCOUNT = OperationModel.new(
        name: "GetLinkedWhatsAppBusinessAccount",
        http_method: "GET",
        request_uri: "/v1/whatsapp/waba/details"
      )

      GET_LINKED_WHATS_APP_BUSINESS_ACCOUNT_PHONE_NUMBER = OperationModel.new(
        name: "GetLinkedWhatsAppBusinessAccountPhoneNumber",
        http_method: "GET",
        request_uri: "/v1/whatsapp/waba/phone/details"
      )

      GET_WHATS_APP_MESSAGE_MEDIA = OperationModel.new(
        name: "GetWhatsAppMessageMedia",
        http_method: "POST",
        request_uri: "/v1/whatsapp/media/get"
      )

      GET_WHATS_APP_MESSAGE_TEMPLATE = OperationModel.new(
        name: "GetWhatsAppMessageTemplate",
        http_method: "GET",
        request_uri: "/v1/whatsapp/template"
      )

      LIST_LINKED_WHATS_APP_BUSINESS_ACCOUNTS = OperationModel.new(
        name: "ListLinkedWhatsAppBusinessAccounts",
        http_method: "GET",
        request_uri: "/v1/whatsapp/waba/list"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/list"
      )

      LIST_WHATS_APP_MESSAGE_TEMPLATES = OperationModel.new(
        name: "ListWhatsAppMessageTemplates",
        http_method: "GET",
        request_uri: "/v1/whatsapp/template/list"
      )

      LIST_WHATS_APP_TEMPLATE_LIBRARY = OperationModel.new(
        name: "ListWhatsAppTemplateLibrary",
        http_method: "POST",
        request_uri: "/v1/whatsapp/template/library"
      )

      POST_WHATS_APP_MESSAGE_MEDIA = OperationModel.new(
        name: "PostWhatsAppMessageMedia",
        http_method: "POST",
        request_uri: "/v1/whatsapp/media"
      )

      PUT_WHATS_APP_BUSINESS_ACCOUNT_EVENT_DESTINATIONS = OperationModel.new(
        name: "PutWhatsAppBusinessAccountEventDestinations",
        http_method: "PUT",
        request_uri: "/v1/whatsapp/waba/eventdestinations"
      )

      SEND_WHATS_APP_MESSAGE = OperationModel.new(
        name: "SendWhatsAppMessage",
        http_method: "POST",
        request_uri: "/v1/whatsapp/send"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tags/tag-resource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/v1/tags/untag-resource"
      )

      UPDATE_WHATS_APP_MESSAGE_TEMPLATE = OperationModel.new(
        name: "UpdateWhatsAppMessageTemplate",
        http_method: "POST",
        request_uri: "/v1/whatsapp/template"
      )
    end
  end
end
