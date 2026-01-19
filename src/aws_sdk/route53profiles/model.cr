module AwsSdk
  module Route53Profiles
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "route53profiles"
      ENDPOINT_PREFIX = "route53profiles"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://route53profiles-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://route53profiles-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://route53profiles.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://route53profiles.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_PROFILE = OperationModel.new(
        name: "AssociateProfile",
        http_method: "POST",
        request_uri: "/profileassociation"
      )

      ASSOCIATE_RESOURCE_TO_PROFILE = OperationModel.new(
        name: "AssociateResourceToProfile",
        http_method: "POST",
        request_uri: "/profileresourceassociation"
      )

      CREATE_PROFILE = OperationModel.new(
        name: "CreateProfile",
        http_method: "POST",
        request_uri: "/profile"
      )

      DELETE_PROFILE = OperationModel.new(
        name: "DeleteProfile",
        http_method: "DELETE",
        request_uri: "/profile/{ProfileId}"
      )

      DISASSOCIATE_PROFILE = OperationModel.new(
        name: "DisassociateProfile",
        http_method: "DELETE",
        request_uri: "/profileassociation/Profileid/{ProfileId}/resourceid/{ResourceId}"
      )

      DISASSOCIATE_RESOURCE_FROM_PROFILE = OperationModel.new(
        name: "DisassociateResourceFromProfile",
        http_method: "DELETE",
        request_uri: "/profileresourceassociation/profileid/{ProfileId}/resourcearn/{ResourceArn}"
      )

      GET_PROFILE = OperationModel.new(
        name: "GetProfile",
        http_method: "GET",
        request_uri: "/profile/{ProfileId}"
      )

      GET_PROFILE_ASSOCIATION = OperationModel.new(
        name: "GetProfileAssociation",
        http_method: "GET",
        request_uri: "/profileassociation/{ProfileAssociationId}"
      )

      GET_PROFILE_RESOURCE_ASSOCIATION = OperationModel.new(
        name: "GetProfileResourceAssociation",
        http_method: "GET",
        request_uri: "/profileresourceassociation/{ProfileResourceAssociationId}"
      )

      LIST_PROFILE_ASSOCIATIONS = OperationModel.new(
        name: "ListProfileAssociations",
        http_method: "GET",
        request_uri: "/profileassociations"
      )

      LIST_PROFILE_RESOURCE_ASSOCIATIONS = OperationModel.new(
        name: "ListProfileResourceAssociations",
        http_method: "GET",
        request_uri: "/profileresourceassociations/profileid/{ProfileId}"
      )

      LIST_PROFILES = OperationModel.new(
        name: "ListProfiles",
        http_method: "GET",
        request_uri: "/profiles"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_PROFILE_RESOURCE_ASSOCIATION = OperationModel.new(
        name: "UpdateProfileResourceAssociation",
        http_method: "PATCH",
        request_uri: "/profileresourceassociation/{ProfileResourceAssociationId}"
      )
    end
  end
end
