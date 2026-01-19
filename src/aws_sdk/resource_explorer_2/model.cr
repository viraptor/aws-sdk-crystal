module AwsSdk
  module ResourceExplorer2
    module Model
      API_VERSION = "2022-07-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "resource-explorer-2"
      ENDPOINT_PREFIX = "resource-explorer-2"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resource-explorer-2-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resource-explorer-2-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resource-explorer-2.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://resource-explorer-2.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_DEFAULT_VIEW = OperationModel.new(
        name: "AssociateDefaultView",
        http_method: "POST",
        request_uri: "/AssociateDefaultView"
      )

      BATCH_GET_VIEW = OperationModel.new(
        name: "BatchGetView",
        http_method: "POST",
        request_uri: "/BatchGetView"
      )

      CREATE_INDEX = OperationModel.new(
        name: "CreateIndex",
        http_method: "POST",
        request_uri: "/CreateIndex"
      )

      CREATE_RESOURCE_EXPLORER_SETUP = OperationModel.new(
        name: "CreateResourceExplorerSetup",
        http_method: "POST",
        request_uri: "/CreateResourceExplorerSetup"
      )

      CREATE_VIEW = OperationModel.new(
        name: "CreateView",
        http_method: "POST",
        request_uri: "/CreateView"
      )

      DELETE_INDEX = OperationModel.new(
        name: "DeleteIndex",
        http_method: "POST",
        request_uri: "/DeleteIndex"
      )

      DELETE_RESOURCE_EXPLORER_SETUP = OperationModel.new(
        name: "DeleteResourceExplorerSetup",
        http_method: "POST",
        request_uri: "/DeleteResourceExplorerSetup"
      )

      DELETE_VIEW = OperationModel.new(
        name: "DeleteView",
        http_method: "POST",
        request_uri: "/DeleteView"
      )

      DISASSOCIATE_DEFAULT_VIEW = OperationModel.new(
        name: "DisassociateDefaultView",
        http_method: "POST",
        request_uri: "/DisassociateDefaultView"
      )

      GET_ACCOUNT_LEVEL_SERVICE_CONFIGURATION = OperationModel.new(
        name: "GetAccountLevelServiceConfiguration",
        http_method: "POST",
        request_uri: "/GetAccountLevelServiceConfiguration"
      )

      GET_DEFAULT_VIEW = OperationModel.new(
        name: "GetDefaultView",
        http_method: "POST",
        request_uri: "/GetDefaultView"
      )

      GET_INDEX = OperationModel.new(
        name: "GetIndex",
        http_method: "POST",
        request_uri: "/GetIndex"
      )

      GET_MANAGED_VIEW = OperationModel.new(
        name: "GetManagedView",
        http_method: "POST",
        request_uri: "/GetManagedView"
      )

      GET_RESOURCE_EXPLORER_SETUP = OperationModel.new(
        name: "GetResourceExplorerSetup",
        http_method: "POST",
        request_uri: "/GetResourceExplorerSetup"
      )

      GET_SERVICE_INDEX = OperationModel.new(
        name: "GetServiceIndex",
        http_method: "POST",
        request_uri: "/GetServiceIndex"
      )

      GET_SERVICE_VIEW = OperationModel.new(
        name: "GetServiceView",
        http_method: "POST",
        request_uri: "/GetServiceView"
      )

      GET_VIEW = OperationModel.new(
        name: "GetView",
        http_method: "POST",
        request_uri: "/GetView"
      )

      LIST_INDEXES = OperationModel.new(
        name: "ListIndexes",
        http_method: "POST",
        request_uri: "/ListIndexes"
      )

      LIST_INDEXES_FOR_MEMBERS = OperationModel.new(
        name: "ListIndexesForMembers",
        http_method: "POST",
        request_uri: "/ListIndexesForMembers"
      )

      LIST_MANAGED_VIEWS = OperationModel.new(
        name: "ListManagedViews",
        http_method: "POST",
        request_uri: "/ListManagedViews"
      )

      LIST_RESOURCES = OperationModel.new(
        name: "ListResources",
        http_method: "POST",
        request_uri: "/ListResources"
      )

      LIST_SERVICE_INDEXES = OperationModel.new(
        name: "ListServiceIndexes",
        http_method: "POST",
        request_uri: "/ListServiceIndexes"
      )

      LIST_SERVICE_VIEWS = OperationModel.new(
        name: "ListServiceViews",
        http_method: "POST",
        request_uri: "/ListServiceViews"
      )

      LIST_STREAMING_ACCESS_FOR_SERVICES = OperationModel.new(
        name: "ListStreamingAccessForServices",
        http_method: "POST",
        request_uri: "/ListStreamingAccessForServices"
      )

      LIST_SUPPORTED_RESOURCE_TYPES = OperationModel.new(
        name: "ListSupportedResourceTypes",
        http_method: "POST",
        request_uri: "/ListSupportedResourceTypes"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_VIEWS = OperationModel.new(
        name: "ListViews",
        http_method: "POST",
        request_uri: "/ListViews"
      )

      SEARCH = OperationModel.new(
        name: "Search",
        http_method: "POST",
        request_uri: "/Search"
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

      UPDATE_INDEX_TYPE = OperationModel.new(
        name: "UpdateIndexType",
        http_method: "POST",
        request_uri: "/UpdateIndexType"
      )

      UPDATE_VIEW = OperationModel.new(
        name: "UpdateView",
        http_method: "POST",
        request_uri: "/UpdateView"
      )
    end
  end
end
