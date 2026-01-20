module Aws
  module Repostspace
    module Model
      API_VERSION = "2022-05-13"
      TARGET_PREFIX = ""
      SIGNING_NAME = "repostspace"
      ENDPOINT_PREFIX = "repostspace"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://repostspace-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://repostspace-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://repostspace.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://repostspace.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_ADD_CHANNEL_ROLE_TO_ACCESSORS = OperationModel.new(
        name: "BatchAddChannelRoleToAccessors",
        http_method: "POST",
        request_uri: "/spaces/{spaceId}/channels/{channelId}/roles"
      )

      BATCH_ADD_ROLE = OperationModel.new(
        name: "BatchAddRole",
        http_method: "POST",
        request_uri: "/spaces/{spaceId}/roles"
      )

      BATCH_REMOVE_CHANNEL_ROLE_FROM_ACCESSORS = OperationModel.new(
        name: "BatchRemoveChannelRoleFromAccessors",
        http_method: "PATCH",
        request_uri: "/spaces/{spaceId}/channels/{channelId}/roles"
      )

      BATCH_REMOVE_ROLE = OperationModel.new(
        name: "BatchRemoveRole",
        http_method: "PATCH",
        request_uri: "/spaces/{spaceId}/roles"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/spaces/{spaceId}/channels"
      )

      CREATE_SPACE = OperationModel.new(
        name: "CreateSpace",
        http_method: "POST",
        request_uri: "/spaces"
      )

      DELETE_SPACE = OperationModel.new(
        name: "DeleteSpace",
        http_method: "DELETE",
        request_uri: "/spaces/{spaceId}"
      )

      DEREGISTER_ADMIN = OperationModel.new(
        name: "DeregisterAdmin",
        http_method: "DELETE",
        request_uri: "/spaces/{spaceId}/admins/{adminId}"
      )

      GET_CHANNEL = OperationModel.new(
        name: "GetChannel",
        http_method: "GET",
        request_uri: "/spaces/{spaceId}/channels/{channelId}"
      )

      GET_SPACE = OperationModel.new(
        name: "GetSpace",
        http_method: "GET",
        request_uri: "/spaces/{spaceId}"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/spaces/{spaceId}/channels"
      )

      LIST_SPACES = OperationModel.new(
        name: "ListSpaces",
        http_method: "GET",
        request_uri: "/spaces"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      REGISTER_ADMIN = OperationModel.new(
        name: "RegisterAdmin",
        http_method: "POST",
        request_uri: "/spaces/{spaceId}/admins/{adminId}"
      )

      SEND_INVITES = OperationModel.new(
        name: "SendInvites",
        http_method: "POST",
        request_uri: "/spaces/{spaceId}/invite"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "PUT",
        request_uri: "/spaces/{spaceId}/channels/{channelId}"
      )

      UPDATE_SPACE = OperationModel.new(
        name: "UpdateSpace",
        http_method: "PUT",
        request_uri: "/spaces/{spaceId}"
      )
    end
  end
end
