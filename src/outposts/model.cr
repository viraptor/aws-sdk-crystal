module Aws
  module Outposts
    module Model
      API_VERSION = "2019-12-03"
      TARGET_PREFIX = ""
      SIGNING_NAME = "outposts"
      ENDPOINT_PREFIX = "outposts"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://outposts-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://outposts.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://outposts-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://outposts.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://outposts.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_CAPACITY_TASK = OperationModel.new(
        name: "CancelCapacityTask",
        http_method: "POST",
        request_uri: "/outposts/{OutpostId}/capacity/{CapacityTaskId}"
      )

      CANCEL_ORDER = OperationModel.new(
        name: "CancelOrder",
        http_method: "POST",
        request_uri: "/orders/{OrderId}/cancel"
      )

      CREATE_ORDER = OperationModel.new(
        name: "CreateOrder",
        http_method: "POST",
        request_uri: "/orders"
      )

      CREATE_OUTPOST = OperationModel.new(
        name: "CreateOutpost",
        http_method: "POST",
        request_uri: "/outposts"
      )

      CREATE_SITE = OperationModel.new(
        name: "CreateSite",
        http_method: "POST",
        request_uri: "/sites"
      )

      DELETE_OUTPOST = OperationModel.new(
        name: "DeleteOutpost",
        http_method: "DELETE",
        request_uri: "/outposts/{OutpostId}"
      )

      DELETE_SITE = OperationModel.new(
        name: "DeleteSite",
        http_method: "DELETE",
        request_uri: "/sites/{SiteId}"
      )

      GET_CAPACITY_TASK = OperationModel.new(
        name: "GetCapacityTask",
        http_method: "GET",
        request_uri: "/outposts/{OutpostId}/capacity/{CapacityTaskId}"
      )

      GET_CATALOG_ITEM = OperationModel.new(
        name: "GetCatalogItem",
        http_method: "GET",
        request_uri: "/catalog/item/{CatalogItemId}"
      )

      GET_CONNECTION = OperationModel.new(
        name: "GetConnection",
        http_method: "GET",
        request_uri: "/connections/{ConnectionId}"
      )

      GET_ORDER = OperationModel.new(
        name: "GetOrder",
        http_method: "GET",
        request_uri: "/orders/{OrderId}"
      )

      GET_OUTPOST = OperationModel.new(
        name: "GetOutpost",
        http_method: "GET",
        request_uri: "/outposts/{OutpostId}"
      )

      GET_OUTPOST_BILLING_INFORMATION = OperationModel.new(
        name: "GetOutpostBillingInformation",
        http_method: "GET",
        request_uri: "/outpost/{OutpostIdentifier}/billing-information"
      )

      GET_OUTPOST_INSTANCE_TYPES = OperationModel.new(
        name: "GetOutpostInstanceTypes",
        http_method: "GET",
        request_uri: "/outposts/{OutpostId}/instanceTypes"
      )

      GET_OUTPOST_SUPPORTED_INSTANCE_TYPES = OperationModel.new(
        name: "GetOutpostSupportedInstanceTypes",
        http_method: "GET",
        request_uri: "/outposts/{OutpostId}/supportedInstanceTypes"
      )

      GET_SITE = OperationModel.new(
        name: "GetSite",
        http_method: "GET",
        request_uri: "/sites/{SiteId}"
      )

      GET_SITE_ADDRESS = OperationModel.new(
        name: "GetSiteAddress",
        http_method: "GET",
        request_uri: "/sites/{SiteId}/address"
      )

      LIST_ASSET_INSTANCES = OperationModel.new(
        name: "ListAssetInstances",
        http_method: "GET",
        request_uri: "/outposts/{OutpostId}/assetInstances"
      )

      LIST_ASSETS = OperationModel.new(
        name: "ListAssets",
        http_method: "GET",
        request_uri: "/outposts/{OutpostId}/assets"
      )

      LIST_BLOCKING_INSTANCES_FOR_CAPACITY_TASK = OperationModel.new(
        name: "ListBlockingInstancesForCapacityTask",
        http_method: "GET",
        request_uri: "/outposts/{OutpostId}/capacity/{CapacityTaskId}/blockingInstances"
      )

      LIST_CAPACITY_TASKS = OperationModel.new(
        name: "ListCapacityTasks",
        http_method: "GET",
        request_uri: "/capacity/tasks"
      )

      LIST_CATALOG_ITEMS = OperationModel.new(
        name: "ListCatalogItems",
        http_method: "GET",
        request_uri: "/catalog/items"
      )

      LIST_ORDERS = OperationModel.new(
        name: "ListOrders",
        http_method: "GET",
        request_uri: "/list-orders"
      )

      LIST_OUTPOSTS = OperationModel.new(
        name: "ListOutposts",
        http_method: "GET",
        request_uri: "/outposts"
      )

      LIST_SITES = OperationModel.new(
        name: "ListSites",
        http_method: "GET",
        request_uri: "/sites"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      START_CAPACITY_TASK = OperationModel.new(
        name: "StartCapacityTask",
        http_method: "POST",
        request_uri: "/outposts/{OutpostId}/capacity"
      )

      START_CONNECTION = OperationModel.new(
        name: "StartConnection",
        http_method: "POST",
        request_uri: "/connections"
      )

      START_OUTPOST_DECOMMISSION = OperationModel.new(
        name: "StartOutpostDecommission",
        http_method: "POST",
        request_uri: "/outposts/{OutpostId}/decommission"
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

      UPDATE_OUTPOST = OperationModel.new(
        name: "UpdateOutpost",
        http_method: "PATCH",
        request_uri: "/outposts/{OutpostId}"
      )

      UPDATE_SITE = OperationModel.new(
        name: "UpdateSite",
        http_method: "PATCH",
        request_uri: "/sites/{SiteId}"
      )

      UPDATE_SITE_ADDRESS = OperationModel.new(
        name: "UpdateSiteAddress",
        http_method: "PUT",
        request_uri: "/sites/{SiteId}/address"
      )

      UPDATE_SITE_RACK_PHYSICAL_PROPERTIES = OperationModel.new(
        name: "UpdateSiteRackPhysicalProperties",
        http_method: "PATCH",
        request_uri: "/sites/{SiteId}/rackPhysicalProperties"
      )
    end
  end
end
