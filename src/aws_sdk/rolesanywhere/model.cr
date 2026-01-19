module AwsSdk
  module RolesAnywhere
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "rolesanywhere"
      ENDPOINT_PREFIX = "rolesanywhere"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rolesanywhere-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rolesanywhere-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rolesanywhere.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://rolesanywhere.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_PROFILE = OperationModel.new(
        name: "CreateProfile",
        http_method: "POST",
        request_uri: "/profiles"
      )

      CREATE_TRUST_ANCHOR = OperationModel.new(
        name: "CreateTrustAnchor",
        http_method: "POST",
        request_uri: "/trustanchors"
      )

      DELETE_ATTRIBUTE_MAPPING = OperationModel.new(
        name: "DeleteAttributeMapping",
        http_method: "DELETE",
        request_uri: "/profiles/{profileId}/mappings"
      )

      DELETE_CRL = OperationModel.new(
        name: "DeleteCrl",
        http_method: "DELETE",
        request_uri: "/crl/{crlId}"
      )

      DELETE_PROFILE = OperationModel.new(
        name: "DeleteProfile",
        http_method: "DELETE",
        request_uri: "/profile/{profileId}"
      )

      DELETE_TRUST_ANCHOR = OperationModel.new(
        name: "DeleteTrustAnchor",
        http_method: "DELETE",
        request_uri: "/trustanchor/{trustAnchorId}"
      )

      DISABLE_CRL = OperationModel.new(
        name: "DisableCrl",
        http_method: "POST",
        request_uri: "/crl/{crlId}/disable"
      )

      DISABLE_PROFILE = OperationModel.new(
        name: "DisableProfile",
        http_method: "POST",
        request_uri: "/profile/{profileId}/disable"
      )

      DISABLE_TRUST_ANCHOR = OperationModel.new(
        name: "DisableTrustAnchor",
        http_method: "POST",
        request_uri: "/trustanchor/{trustAnchorId}/disable"
      )

      ENABLE_CRL = OperationModel.new(
        name: "EnableCrl",
        http_method: "POST",
        request_uri: "/crl/{crlId}/enable"
      )

      ENABLE_PROFILE = OperationModel.new(
        name: "EnableProfile",
        http_method: "POST",
        request_uri: "/profile/{profileId}/enable"
      )

      ENABLE_TRUST_ANCHOR = OperationModel.new(
        name: "EnableTrustAnchor",
        http_method: "POST",
        request_uri: "/trustanchor/{trustAnchorId}/enable"
      )

      GET_CRL = OperationModel.new(
        name: "GetCrl",
        http_method: "GET",
        request_uri: "/crl/{crlId}"
      )

      GET_PROFILE = OperationModel.new(
        name: "GetProfile",
        http_method: "GET",
        request_uri: "/profile/{profileId}"
      )

      GET_SUBJECT = OperationModel.new(
        name: "GetSubject",
        http_method: "GET",
        request_uri: "/subject/{subjectId}"
      )

      GET_TRUST_ANCHOR = OperationModel.new(
        name: "GetTrustAnchor",
        http_method: "GET",
        request_uri: "/trustanchor/{trustAnchorId}"
      )

      IMPORT_CRL = OperationModel.new(
        name: "ImportCrl",
        http_method: "POST",
        request_uri: "/crls"
      )

      LIST_CRLS = OperationModel.new(
        name: "ListCrls",
        http_method: "GET",
        request_uri: "/crls"
      )

      LIST_PROFILES = OperationModel.new(
        name: "ListProfiles",
        http_method: "GET",
        request_uri: "/profiles"
      )

      LIST_SUBJECTS = OperationModel.new(
        name: "ListSubjects",
        http_method: "GET",
        request_uri: "/subjects"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/ListTagsForResource"
      )

      LIST_TRUST_ANCHORS = OperationModel.new(
        name: "ListTrustAnchors",
        http_method: "GET",
        request_uri: "/trustanchors"
      )

      PUT_ATTRIBUTE_MAPPING = OperationModel.new(
        name: "PutAttributeMapping",
        http_method: "PUT",
        request_uri: "/profiles/{profileId}/mappings"
      )

      PUT_NOTIFICATION_SETTINGS = OperationModel.new(
        name: "PutNotificationSettings",
        http_method: "PATCH",
        request_uri: "/put-notifications-settings"
      )

      RESET_NOTIFICATION_SETTINGS = OperationModel.new(
        name: "ResetNotificationSettings",
        http_method: "PATCH",
        request_uri: "/reset-notifications-settings"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/TagResource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/UntagResource"
      )

      UPDATE_CRL = OperationModel.new(
        name: "UpdateCrl",
        http_method: "PATCH",
        request_uri: "/crl/{crlId}"
      )

      UPDATE_PROFILE = OperationModel.new(
        name: "UpdateProfile",
        http_method: "PATCH",
        request_uri: "/profile/{profileId}"
      )

      UPDATE_TRUST_ANCHOR = OperationModel.new(
        name: "UpdateTrustAnchor",
        http_method: "PATCH",
        request_uri: "/trustanchor/{trustAnchorId}"
      )
    end
  end
end
