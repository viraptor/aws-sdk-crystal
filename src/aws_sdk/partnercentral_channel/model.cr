module AwsSdk
  module PartnerCentralChannel
    module Model
      API_VERSION = "2024-03-18"
      TARGET_PREFIX = "PartnerCentralChannel"
      SIGNING_NAME = "partnercentral-channel"
      ENDPOINT_PREFIX = "partnercentral-channel"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{"authSchemes":[{"name":"sigv4a","signingRegionSet":["*"]},{"name":"sigv4"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]}],"endpoint":{"url":"https://partnercentral-channel.us-gov.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4a","signingRegionSet":["*"]},{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://partnercentral-channel-fips.us-gov.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4a","signingRegionSet":["*"]},{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://partnercentral-channel-fips.global.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4a","signingRegionSet":["*"]},{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://partnercentral-channel.global.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4a","signingRegionSet":["*"]},{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_CHANNEL_HANDSHAKE = OperationModel.new(
        name: "AcceptChannelHandshake",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CHANNEL_HANDSHAKE = OperationModel.new(
        name: "CancelChannelHandshake",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CHANNEL_HANDSHAKE = OperationModel.new(
        name: "CreateChannelHandshake",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROGRAM_MANAGEMENT_ACCOUNT = OperationModel.new(
        name: "CreateProgramManagementAccount",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RELATIONSHIP = OperationModel.new(
        name: "CreateRelationship",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROGRAM_MANAGEMENT_ACCOUNT = OperationModel.new(
        name: "DeleteProgramManagementAccount",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RELATIONSHIP = OperationModel.new(
        name: "DeleteRelationship",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONSHIP = OperationModel.new(
        name: "GetRelationship",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CHANNEL_HANDSHAKES = OperationModel.new(
        name: "ListChannelHandshakes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROGRAM_MANAGEMENT_ACCOUNTS = OperationModel.new(
        name: "ListProgramManagementAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RELATIONSHIPS = OperationModel.new(
        name: "ListRelationships",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_CHANNEL_HANDSHAKE = OperationModel.new(
        name: "RejectChannelHandshake",
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

      UPDATE_PROGRAM_MANAGEMENT_ACCOUNT = OperationModel.new(
        name: "UpdateProgramManagementAccount",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RELATIONSHIP = OperationModel.new(
        name: "UpdateRelationship",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
