module Aws
  module SSMContacts
    module Model
      API_VERSION = "2021-05-03"
      TARGET_PREFIX = "SSMContacts"
      SIGNING_NAME = "ssm-contacts"
      ENDPOINT_PREFIX = "ssm-contacts"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-contacts-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-contacts-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ssm-contacts.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ssm-contacts.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_PAGE = OperationModel.new(
        name: "AcceptPage",
        http_method: "POST",
        request_uri: "/"
      )

      ACTIVATE_CONTACT_CHANNEL = OperationModel.new(
        name: "ActivateContactChannel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTACT = OperationModel.new(
        name: "CreateContact",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTACT_CHANNEL = OperationModel.new(
        name: "CreateContactChannel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROTATION = OperationModel.new(
        name: "CreateRotation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROTATION_OVERRIDE = OperationModel.new(
        name: "CreateRotationOverride",
        http_method: "POST",
        request_uri: "/"
      )

      DEACTIVATE_CONTACT_CHANNEL = OperationModel.new(
        name: "DeactivateContactChannel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTACT = OperationModel.new(
        name: "DeleteContact",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTACT_CHANNEL = OperationModel.new(
        name: "DeleteContactChannel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROTATION = OperationModel.new(
        name: "DeleteRotation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROTATION_OVERRIDE = OperationModel.new(
        name: "DeleteRotationOverride",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENGAGEMENT = OperationModel.new(
        name: "DescribeEngagement",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PAGE = OperationModel.new(
        name: "DescribePage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTACT = OperationModel.new(
        name: "GetContact",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTACT_CHANNEL = OperationModel.new(
        name: "GetContactChannel",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTACT_POLICY = OperationModel.new(
        name: "GetContactPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ROTATION = OperationModel.new(
        name: "GetRotation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ROTATION_OVERRIDE = OperationModel.new(
        name: "GetRotationOverride",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTACT_CHANNELS = OperationModel.new(
        name: "ListContactChannels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTACTS = OperationModel.new(
        name: "ListContacts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGAGEMENTS = OperationModel.new(
        name: "ListEngagements",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PAGE_RECEIPTS = OperationModel.new(
        name: "ListPageReceipts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PAGE_RESOLUTIONS = OperationModel.new(
        name: "ListPageResolutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PAGES_BY_CONTACT = OperationModel.new(
        name: "ListPagesByContact",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PAGES_BY_ENGAGEMENT = OperationModel.new(
        name: "ListPagesByEngagement",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PREVIEW_ROTATION_SHIFTS = OperationModel.new(
        name: "ListPreviewRotationShifts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ROTATION_OVERRIDES = OperationModel.new(
        name: "ListRotationOverrides",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ROTATION_SHIFTS = OperationModel.new(
        name: "ListRotationShifts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ROTATIONS = OperationModel.new(
        name: "ListRotations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CONTACT_POLICY = OperationModel.new(
        name: "PutContactPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_ACTIVATION_CODE = OperationModel.new(
        name: "SendActivationCode",
        http_method: "POST",
        request_uri: "/"
      )

      START_ENGAGEMENT = OperationModel.new(
        name: "StartEngagement",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ENGAGEMENT = OperationModel.new(
        name: "StopEngagement",
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

      UPDATE_CONTACT = OperationModel.new(
        name: "UpdateContact",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTACT_CHANNEL = OperationModel.new(
        name: "UpdateContactChannel",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ROTATION = OperationModel.new(
        name: "UpdateRotation",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
