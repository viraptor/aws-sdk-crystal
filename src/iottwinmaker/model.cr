module Aws
  module IoTTwinMaker
    module Model
      API_VERSION = "2021-11-29"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iottwinmaker"
      ENDPOINT_PREFIX = "iottwinmaker"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iottwinmaker-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iottwinmaker-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iottwinmaker.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://iottwinmaker.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_PUT_PROPERTY_VALUES = OperationModel.new(
        name: "BatchPutPropertyValues",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/entity-properties"
      )

      CANCEL_METADATA_TRANSFER_JOB = OperationModel.new(
        name: "CancelMetadataTransferJob",
        http_method: "PUT",
        request_uri: "/metadata-transfer-jobs/{metadataTransferJobId}/cancel"
      )

      CREATE_COMPONENT_TYPE = OperationModel.new(
        name: "CreateComponentType",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/component-types/{componentTypeId}"
      )

      CREATE_ENTITY = OperationModel.new(
        name: "CreateEntity",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/entities"
      )

      CREATE_METADATA_TRANSFER_JOB = OperationModel.new(
        name: "CreateMetadataTransferJob",
        http_method: "POST",
        request_uri: "/metadata-transfer-jobs"
      )

      CREATE_SCENE = OperationModel.new(
        name: "CreateScene",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/scenes"
      )

      CREATE_SYNC_JOB = OperationModel.new(
        name: "CreateSyncJob",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/sync-jobs/{syncSource}"
      )

      CREATE_WORKSPACE = OperationModel.new(
        name: "CreateWorkspace",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}"
      )

      DELETE_COMPONENT_TYPE = OperationModel.new(
        name: "DeleteComponentType",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/component-types/{componentTypeId}"
      )

      DELETE_ENTITY = OperationModel.new(
        name: "DeleteEntity",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/entities/{entityId}"
      )

      DELETE_SCENE = OperationModel.new(
        name: "DeleteScene",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/scenes/{sceneId}"
      )

      DELETE_SYNC_JOB = OperationModel.new(
        name: "DeleteSyncJob",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}/sync-jobs/{syncSource}"
      )

      DELETE_WORKSPACE = OperationModel.new(
        name: "DeleteWorkspace",
        http_method: "DELETE",
        request_uri: "/workspaces/{workspaceId}"
      )

      EXECUTE_QUERY = OperationModel.new(
        name: "ExecuteQuery",
        http_method: "POST",
        request_uri: "/queries/execution"
      )

      GET_COMPONENT_TYPE = OperationModel.new(
        name: "GetComponentType",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/component-types/{componentTypeId}"
      )

      GET_ENTITY = OperationModel.new(
        name: "GetEntity",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/entities/{entityId}"
      )

      GET_METADATA_TRANSFER_JOB = OperationModel.new(
        name: "GetMetadataTransferJob",
        http_method: "GET",
        request_uri: "/metadata-transfer-jobs/{metadataTransferJobId}"
      )

      GET_PRICING_PLAN = OperationModel.new(
        name: "GetPricingPlan",
        http_method: "GET",
        request_uri: "/pricingplan"
      )

      GET_PROPERTY_VALUE = OperationModel.new(
        name: "GetPropertyValue",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/entity-properties/value"
      )

      GET_PROPERTY_VALUE_HISTORY = OperationModel.new(
        name: "GetPropertyValueHistory",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/entity-properties/history"
      )

      GET_SCENE = OperationModel.new(
        name: "GetScene",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}/scenes/{sceneId}"
      )

      GET_SYNC_JOB = OperationModel.new(
        name: "GetSyncJob",
        http_method: "GET",
        request_uri: "/sync-jobs/{syncSource}"
      )

      GET_WORKSPACE = OperationModel.new(
        name: "GetWorkspace",
        http_method: "GET",
        request_uri: "/workspaces/{workspaceId}"
      )

      LIST_COMPONENT_TYPES = OperationModel.new(
        name: "ListComponentTypes",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/component-types-list"
      )

      LIST_COMPONENTS = OperationModel.new(
        name: "ListComponents",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/entities/{entityId}/components-list"
      )

      LIST_ENTITIES = OperationModel.new(
        name: "ListEntities",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/entities-list"
      )

      LIST_METADATA_TRANSFER_JOBS = OperationModel.new(
        name: "ListMetadataTransferJobs",
        http_method: "POST",
        request_uri: "/metadata-transfer-jobs-list"
      )

      LIST_PROPERTIES = OperationModel.new(
        name: "ListProperties",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/properties-list"
      )

      LIST_SCENES = OperationModel.new(
        name: "ListScenes",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/scenes-list"
      )

      LIST_SYNC_JOBS = OperationModel.new(
        name: "ListSyncJobs",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/sync-jobs-list"
      )

      LIST_SYNC_RESOURCES = OperationModel.new(
        name: "ListSyncResources",
        http_method: "POST",
        request_uri: "/workspaces/{workspaceId}/sync-jobs/{syncSource}/resources-list"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/tags-list"
      )

      LIST_WORKSPACES = OperationModel.new(
        name: "ListWorkspaces",
        http_method: "POST",
        request_uri: "/workspaces-list"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags"
      )

      UPDATE_COMPONENT_TYPE = OperationModel.new(
        name: "UpdateComponentType",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/component-types/{componentTypeId}"
      )

      UPDATE_ENTITY = OperationModel.new(
        name: "UpdateEntity",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/entities/{entityId}"
      )

      UPDATE_PRICING_PLAN = OperationModel.new(
        name: "UpdatePricingPlan",
        http_method: "POST",
        request_uri: "/pricingplan"
      )

      UPDATE_SCENE = OperationModel.new(
        name: "UpdateScene",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}/scenes/{sceneId}"
      )

      UPDATE_WORKSPACE = OperationModel.new(
        name: "UpdateWorkspace",
        http_method: "PUT",
        request_uri: "/workspaces/{workspaceId}"
      )
    end
  end
end
