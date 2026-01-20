module Aws
  module ServiceCatalogAppRegistry
    module Model
      API_VERSION = "2020-06-24"
      TARGET_PREFIX = ""
      SIGNING_NAME = "servicecatalog"
      ENDPOINT_PREFIX = "servicecatalog-appregistry"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicecatalog-appregistry-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://servicecatalog-appregistry.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://servicecatalog-appregistry-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicecatalog-appregistry.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://servicecatalog-appregistry.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ATTRIBUTE_GROUP = OperationModel.new(
        name: "AssociateAttributeGroup",
        http_method: "PUT",
        request_uri: "/applications/{application}/attribute-groups/{attributeGroup}"
      )

      ASSOCIATE_RESOURCE = OperationModel.new(
        name: "AssociateResource",
        http_method: "PUT",
        request_uri: "/applications/{application}/resources/{resourceType}/{resource}"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/applications"
      )

      CREATE_ATTRIBUTE_GROUP = OperationModel.new(
        name: "CreateAttributeGroup",
        http_method: "POST",
        request_uri: "/attribute-groups"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "DELETE",
        request_uri: "/applications/{application}"
      )

      DELETE_ATTRIBUTE_GROUP = OperationModel.new(
        name: "DeleteAttributeGroup",
        http_method: "DELETE",
        request_uri: "/attribute-groups/{attributeGroup}"
      )

      DISASSOCIATE_ATTRIBUTE_GROUP = OperationModel.new(
        name: "DisassociateAttributeGroup",
        http_method: "DELETE",
        request_uri: "/applications/{application}/attribute-groups/{attributeGroup}"
      )

      DISASSOCIATE_RESOURCE = OperationModel.new(
        name: "DisassociateResource",
        http_method: "DELETE",
        request_uri: "/applications/{application}/resources/{resourceType}/{resource}"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "GET",
        request_uri: "/applications/{application}"
      )

      GET_ASSOCIATED_RESOURCE = OperationModel.new(
        name: "GetAssociatedResource",
        http_method: "GET",
        request_uri: "/applications/{application}/resources/{resourceType}/{resource}"
      )

      GET_ATTRIBUTE_GROUP = OperationModel.new(
        name: "GetAttributeGroup",
        http_method: "GET",
        request_uri: "/attribute-groups/{attributeGroup}"
      )

      GET_CONFIGURATION = OperationModel.new(
        name: "GetConfiguration",
        http_method: "GET",
        request_uri: "/configuration"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "GET",
        request_uri: "/applications"
      )

      LIST_ASSOCIATED_ATTRIBUTE_GROUPS = OperationModel.new(
        name: "ListAssociatedAttributeGroups",
        http_method: "GET",
        request_uri: "/applications/{application}/attribute-groups"
      )

      LIST_ASSOCIATED_RESOURCES = OperationModel.new(
        name: "ListAssociatedResources",
        http_method: "GET",
        request_uri: "/applications/{application}/resources"
      )

      LIST_ATTRIBUTE_GROUPS = OperationModel.new(
        name: "ListAttributeGroups",
        http_method: "GET",
        request_uri: "/attribute-groups"
      )

      LIST_ATTRIBUTE_GROUPS_FOR_APPLICATION = OperationModel.new(
        name: "ListAttributeGroupsForApplication",
        http_method: "GET",
        request_uri: "/applications/{application}/attribute-group-details"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_CONFIGURATION = OperationModel.new(
        name: "PutConfiguration",
        http_method: "PUT",
        request_uri: "/configuration"
      )

      SYNC_RESOURCE = OperationModel.new(
        name: "SyncResource",
        http_method: "POST",
        request_uri: "/sync/{resourceType}/{resource}"
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

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "PATCH",
        request_uri: "/applications/{application}"
      )

      UPDATE_ATTRIBUTE_GROUP = OperationModel.new(
        name: "UpdateAttributeGroup",
        http_method: "PATCH",
        request_uri: "/attribute-groups/{attributeGroup}"
      )
    end
  end
end
