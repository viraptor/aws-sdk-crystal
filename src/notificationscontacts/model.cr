module Aws
  module NotificationsContacts
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "notifications-contacts"
      ENDPOINT_PREFIX = "notifications-contacts"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://notifications-contacts-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://notifications-contacts.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_EMAIL_CONTACT = OperationModel.new(
        name: "ActivateEmailContact",
        http_method: "PUT",
        request_uri: "/emailcontacts/{arn}/activate/{code}"
      )

      CREATE_EMAIL_CONTACT = OperationModel.new(
        name: "CreateEmailContact",
        http_method: "POST",
        request_uri: "/2022-09-19/emailcontacts"
      )

      DELETE_EMAIL_CONTACT = OperationModel.new(
        name: "DeleteEmailContact",
        http_method: "DELETE",
        request_uri: "/emailcontacts/{arn}"
      )

      GET_EMAIL_CONTACT = OperationModel.new(
        name: "GetEmailContact",
        http_method: "GET",
        request_uri: "/emailcontacts/{arn}"
      )

      LIST_EMAIL_CONTACTS = OperationModel.new(
        name: "ListEmailContacts",
        http_method: "GET",
        request_uri: "/emailcontacts"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{arn}"
      )

      SEND_ACTIVATION_CODE = OperationModel.new(
        name: "SendActivationCode",
        http_method: "POST",
        request_uri: "/2022-10-31/emailcontacts/{arn}/activate/send"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{arn}"
      )
    end
  end
end
