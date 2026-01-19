module AwsSdk
  module CloudDirectory
    module Model
      API_VERSION = "2017-01-11"
      TARGET_PREFIX = ""
      SIGNING_NAME = "clouddirectory"
      ENDPOINT_PREFIX = "clouddirectory"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://clouddirectory-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://clouddirectory.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://clouddirectory-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://clouddirectory.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://clouddirectory.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_FACET_TO_OBJECT = OperationModel.new(
        name: "AddFacetToObject",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/object/facets"
      )

      APPLY_SCHEMA = OperationModel.new(
        name: "ApplySchema",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/apply"
      )

      ATTACH_OBJECT = OperationModel.new(
        name: "AttachObject",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/object/attach"
      )

      ATTACH_POLICY = OperationModel.new(
        name: "AttachPolicy",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/policy/attach"
      )

      ATTACH_TO_INDEX = OperationModel.new(
        name: "AttachToIndex",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/index/attach"
      )

      ATTACH_TYPED_LINK = OperationModel.new(
        name: "AttachTypedLink",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/attach"
      )

      BATCH_READ = OperationModel.new(
        name: "BatchRead",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/batchread"
      )

      BATCH_WRITE = OperationModel.new(
        name: "BatchWrite",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/batchwrite"
      )

      CREATE_DIRECTORY = OperationModel.new(
        name: "CreateDirectory",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/directory/create"
      )

      CREATE_FACET = OperationModel.new(
        name: "CreateFacet",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/facet/create"
      )

      CREATE_INDEX = OperationModel.new(
        name: "CreateIndex",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/index"
      )

      CREATE_OBJECT = OperationModel.new(
        name: "CreateObject",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/object"
      )

      CREATE_SCHEMA = OperationModel.new(
        name: "CreateSchema",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/create"
      )

      CREATE_TYPED_LINK_FACET = OperationModel.new(
        name: "CreateTypedLinkFacet",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/facet/create"
      )

      DELETE_DIRECTORY = OperationModel.new(
        name: "DeleteDirectory",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/directory"
      )

      DELETE_FACET = OperationModel.new(
        name: "DeleteFacet",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/facet/delete"
      )

      DELETE_OBJECT = OperationModel.new(
        name: "DeleteObject",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/object/delete"
      )

      DELETE_SCHEMA = OperationModel.new(
        name: "DeleteSchema",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema"
      )

      DELETE_TYPED_LINK_FACET = OperationModel.new(
        name: "DeleteTypedLinkFacet",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/facet/delete"
      )

      DETACH_FROM_INDEX = OperationModel.new(
        name: "DetachFromIndex",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/index/detach"
      )

      DETACH_OBJECT = OperationModel.new(
        name: "DetachObject",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/object/detach"
      )

      DETACH_POLICY = OperationModel.new(
        name: "DetachPolicy",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/policy/detach"
      )

      DETACH_TYPED_LINK = OperationModel.new(
        name: "DetachTypedLink",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/detach"
      )

      DISABLE_DIRECTORY = OperationModel.new(
        name: "DisableDirectory",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/directory/disable"
      )

      ENABLE_DIRECTORY = OperationModel.new(
        name: "EnableDirectory",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/directory/enable"
      )

      GET_APPLIED_SCHEMA_VERSION = OperationModel.new(
        name: "GetAppliedSchemaVersion",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/getappliedschema"
      )

      GET_DIRECTORY = OperationModel.new(
        name: "GetDirectory",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/directory/get"
      )

      GET_FACET = OperationModel.new(
        name: "GetFacet",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/facet"
      )

      GET_LINK_ATTRIBUTES = OperationModel.new(
        name: "GetLinkAttributes",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/attributes/get"
      )

      GET_OBJECT_ATTRIBUTES = OperationModel.new(
        name: "GetObjectAttributes",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/attributes/get"
      )

      GET_OBJECT_INFORMATION = OperationModel.new(
        name: "GetObjectInformation",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/information"
      )

      GET_SCHEMA_AS_JSON = OperationModel.new(
        name: "GetSchemaAsJson",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/json"
      )

      GET_TYPED_LINK_FACET_INFORMATION = OperationModel.new(
        name: "GetTypedLinkFacetInformation",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/facet/get"
      )

      LIST_APPLIED_SCHEMA_ARNS = OperationModel.new(
        name: "ListAppliedSchemaArns",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/applied"
      )

      LIST_ATTACHED_INDICES = OperationModel.new(
        name: "ListAttachedIndices",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/indices"
      )

      LIST_DEVELOPMENT_SCHEMA_ARNS = OperationModel.new(
        name: "ListDevelopmentSchemaArns",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/development"
      )

      LIST_DIRECTORIES = OperationModel.new(
        name: "ListDirectories",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/directory/list"
      )

      LIST_FACET_ATTRIBUTES = OperationModel.new(
        name: "ListFacetAttributes",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/facet/attributes"
      )

      LIST_FACET_NAMES = OperationModel.new(
        name: "ListFacetNames",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/facet/list"
      )

      LIST_INCOMING_TYPED_LINKS = OperationModel.new(
        name: "ListIncomingTypedLinks",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/incoming"
      )

      LIST_INDEX = OperationModel.new(
        name: "ListIndex",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/index/targets"
      )

      LIST_MANAGED_SCHEMA_ARNS = OperationModel.new(
        name: "ListManagedSchemaArns",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/managed"
      )

      LIST_OBJECT_ATTRIBUTES = OperationModel.new(
        name: "ListObjectAttributes",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/attributes"
      )

      LIST_OBJECT_CHILDREN = OperationModel.new(
        name: "ListObjectChildren",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/children"
      )

      LIST_OBJECT_PARENT_PATHS = OperationModel.new(
        name: "ListObjectParentPaths",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/parentpaths"
      )

      LIST_OBJECT_PARENTS = OperationModel.new(
        name: "ListObjectParents",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/parent"
      )

      LIST_OBJECT_POLICIES = OperationModel.new(
        name: "ListObjectPolicies",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/object/policy"
      )

      LIST_OUTGOING_TYPED_LINKS = OperationModel.new(
        name: "ListOutgoingTypedLinks",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/outgoing"
      )

      LIST_POLICY_ATTACHMENTS = OperationModel.new(
        name: "ListPolicyAttachments",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/policy/attachment"
      )

      LIST_PUBLISHED_SCHEMA_ARNS = OperationModel.new(
        name: "ListPublishedSchemaArns",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/published"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/tags"
      )

      LIST_TYPED_LINK_FACET_ATTRIBUTES = OperationModel.new(
        name: "ListTypedLinkFacetAttributes",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/facet/attributes"
      )

      LIST_TYPED_LINK_FACET_NAMES = OperationModel.new(
        name: "ListTypedLinkFacetNames",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/facet/list"
      )

      LOOKUP_POLICY = OperationModel.new(
        name: "LookupPolicy",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/policy/lookup"
      )

      PUBLISH_SCHEMA = OperationModel.new(
        name: "PublishSchema",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/publish"
      )

      PUT_SCHEMA_FROM_JSON = OperationModel.new(
        name: "PutSchemaFromJson",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/json"
      )

      REMOVE_FACET_FROM_OBJECT = OperationModel.new(
        name: "RemoveFacetFromObject",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/object/facets/delete"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/tags/add"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/tags/remove"
      )

      UPDATE_FACET = OperationModel.new(
        name: "UpdateFacet",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/facet"
      )

      UPDATE_LINK_ATTRIBUTES = OperationModel.new(
        name: "UpdateLinkAttributes",
        http_method: "POST",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/attributes/update"
      )

      UPDATE_OBJECT_ATTRIBUTES = OperationModel.new(
        name: "UpdateObjectAttributes",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/object/update"
      )

      UPDATE_SCHEMA = OperationModel.new(
        name: "UpdateSchema",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/update"
      )

      UPDATE_TYPED_LINK_FACET = OperationModel.new(
        name: "UpdateTypedLinkFacet",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/typedlink/facet"
      )

      UPGRADE_APPLIED_SCHEMA = OperationModel.new(
        name: "UpgradeAppliedSchema",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/upgradeapplied"
      )

      UPGRADE_PUBLISHED_SCHEMA = OperationModel.new(
        name: "UpgradePublishedSchema",
        http_method: "PUT",
        request_uri: "/amazonclouddirectory/2017-01-11/schema/upgradepublished"
      )
    end
  end
end
