module Aws
  module PartnerCentralAccount
    module Model
      API_VERSION = "2025-04-04"
      TARGET_PREFIX = "PartnerCentralAccount"
      SIGNING_NAME = "partnercentral-account"
      ENDPOINT_PREFIX = "partnercentral-account"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://partnercentral-account-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://partnercentral-account.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_CONNECTION_INVITATION = OperationModel.new(
        name: "AcceptConnectionInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_AWS_TRAINING_CERTIFICATION_EMAIL_DOMAIN = OperationModel.new(
        name: "AssociateAwsTrainingCertificationEmailDomain",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CONNECTION = OperationModel.new(
        name: "CancelConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CONNECTION_INVITATION = OperationModel.new(
        name: "CancelConnectionInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_PROFILE_UPDATE_TASK = OperationModel.new(
        name: "CancelProfileUpdateTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECTION_INVITATION = OperationModel.new(
        name: "CreateConnectionInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARTNER = OperationModel.new(
        name: "CreatePartner",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_AWS_TRAINING_CERTIFICATION_EMAIL_DOMAIN = OperationModel.new(
        name: "DisassociateAwsTrainingCertificationEmailDomain",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ALLIANCE_LEAD_CONTACT = OperationModel.new(
        name: "GetAllianceLeadContact",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONNECTION = OperationModel.new(
        name: "GetConnection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONNECTION_INVITATION = OperationModel.new(
        name: "GetConnectionInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONNECTION_PREFERENCES = OperationModel.new(
        name: "GetConnectionPreferences",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARTNER = OperationModel.new(
        name: "GetPartner",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROFILE_UPDATE_TASK = OperationModel.new(
        name: "GetProfileUpdateTask",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROFILE_VISIBILITY = OperationModel.new(
        name: "GetProfileVisibility",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VERIFICATION = OperationModel.new(
        name: "GetVerification",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONNECTION_INVITATIONS = OperationModel.new(
        name: "ListConnectionInvitations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONNECTIONS = OperationModel.new(
        name: "ListConnections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PARTNERS = OperationModel.new(
        name: "ListPartners",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ALLIANCE_LEAD_CONTACT = OperationModel.new(
        name: "PutAllianceLeadContact",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PROFILE_VISIBILITY = OperationModel.new(
        name: "PutProfileVisibility",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_CONNECTION_INVITATION = OperationModel.new(
        name: "RejectConnectionInvitation",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_EMAIL_VERIFICATION_CODE = OperationModel.new(
        name: "SendEmailVerificationCode",
        http_method: "POST",
        request_uri: "/"
      )

      START_PROFILE_UPDATE_TASK = OperationModel.new(
        name: "StartProfileUpdateTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_VERIFICATION = OperationModel.new(
        name: "StartVerification",
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

      UPDATE_CONNECTION_PREFERENCES = OperationModel.new(
        name: "UpdateConnectionPreferences",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
