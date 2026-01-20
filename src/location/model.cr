module Aws
  module Location
    module Model
      API_VERSION = "2020-11-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "geo"
      ENDPOINT_PREFIX = "geo"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://geo-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://geo-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://geo.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://geo.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_TRACKER_CONSUMER = OperationModel.new(
        name: "AssociateTrackerConsumer",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/consumers"
      )

      BATCH_DELETE_DEVICE_POSITION_HISTORY = OperationModel.new(
        name: "BatchDeleteDevicePositionHistory",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/delete-positions"
      )

      BATCH_DELETE_GEOFENCE = OperationModel.new(
        name: "BatchDeleteGeofence",
        http_method: "POST",
        request_uri: "/geofencing/v0/collections/{CollectionName}/delete-geofences"
      )

      BATCH_EVALUATE_GEOFENCES = OperationModel.new(
        name: "BatchEvaluateGeofences",
        http_method: "POST",
        request_uri: "/geofencing/v0/collections/{CollectionName}/positions"
      )

      BATCH_GET_DEVICE_POSITION = OperationModel.new(
        name: "BatchGetDevicePosition",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/get-positions"
      )

      BATCH_PUT_GEOFENCE = OperationModel.new(
        name: "BatchPutGeofence",
        http_method: "POST",
        request_uri: "/geofencing/v0/collections/{CollectionName}/put-geofences"
      )

      BATCH_UPDATE_DEVICE_POSITION = OperationModel.new(
        name: "BatchUpdateDevicePosition",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/positions"
      )

      CALCULATE_ROUTE = OperationModel.new(
        name: "CalculateRoute",
        http_method: "POST",
        request_uri: "/routes/v0/calculators/{CalculatorName}/calculate/route"
      )

      CALCULATE_ROUTE_MATRIX = OperationModel.new(
        name: "CalculateRouteMatrix",
        http_method: "POST",
        request_uri: "/routes/v0/calculators/{CalculatorName}/calculate/route-matrix"
      )

      CREATE_GEOFENCE_COLLECTION = OperationModel.new(
        name: "CreateGeofenceCollection",
        http_method: "POST",
        request_uri: "/geofencing/v0/collections"
      )

      CREATE_KEY = OperationModel.new(
        name: "CreateKey",
        http_method: "POST",
        request_uri: "/metadata/v0/keys"
      )

      CREATE_MAP = OperationModel.new(
        name: "CreateMap",
        http_method: "POST",
        request_uri: "/maps/v0/maps"
      )

      CREATE_PLACE_INDEX = OperationModel.new(
        name: "CreatePlaceIndex",
        http_method: "POST",
        request_uri: "/places/v0/indexes"
      )

      CREATE_ROUTE_CALCULATOR = OperationModel.new(
        name: "CreateRouteCalculator",
        http_method: "POST",
        request_uri: "/routes/v0/calculators"
      )

      CREATE_TRACKER = OperationModel.new(
        name: "CreateTracker",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers"
      )

      DELETE_GEOFENCE_COLLECTION = OperationModel.new(
        name: "DeleteGeofenceCollection",
        http_method: "DELETE",
        request_uri: "/geofencing/v0/collections/{CollectionName}"
      )

      DELETE_KEY = OperationModel.new(
        name: "DeleteKey",
        http_method: "DELETE",
        request_uri: "/metadata/v0/keys/{KeyName}"
      )

      DELETE_MAP = OperationModel.new(
        name: "DeleteMap",
        http_method: "DELETE",
        request_uri: "/maps/v0/maps/{MapName}"
      )

      DELETE_PLACE_INDEX = OperationModel.new(
        name: "DeletePlaceIndex",
        http_method: "DELETE",
        request_uri: "/places/v0/indexes/{IndexName}"
      )

      DELETE_ROUTE_CALCULATOR = OperationModel.new(
        name: "DeleteRouteCalculator",
        http_method: "DELETE",
        request_uri: "/routes/v0/calculators/{CalculatorName}"
      )

      DELETE_TRACKER = OperationModel.new(
        name: "DeleteTracker",
        http_method: "DELETE",
        request_uri: "/tracking/v0/trackers/{TrackerName}"
      )

      DESCRIBE_GEOFENCE_COLLECTION = OperationModel.new(
        name: "DescribeGeofenceCollection",
        http_method: "GET",
        request_uri: "/geofencing/v0/collections/{CollectionName}"
      )

      DESCRIBE_KEY = OperationModel.new(
        name: "DescribeKey",
        http_method: "GET",
        request_uri: "/metadata/v0/keys/{KeyName}"
      )

      DESCRIBE_MAP = OperationModel.new(
        name: "DescribeMap",
        http_method: "GET",
        request_uri: "/maps/v0/maps/{MapName}"
      )

      DESCRIBE_PLACE_INDEX = OperationModel.new(
        name: "DescribePlaceIndex",
        http_method: "GET",
        request_uri: "/places/v0/indexes/{IndexName}"
      )

      DESCRIBE_ROUTE_CALCULATOR = OperationModel.new(
        name: "DescribeRouteCalculator",
        http_method: "GET",
        request_uri: "/routes/v0/calculators/{CalculatorName}"
      )

      DESCRIBE_TRACKER = OperationModel.new(
        name: "DescribeTracker",
        http_method: "GET",
        request_uri: "/tracking/v0/trackers/{TrackerName}"
      )

      DISASSOCIATE_TRACKER_CONSUMER = OperationModel.new(
        name: "DisassociateTrackerConsumer",
        http_method: "DELETE",
        request_uri: "/tracking/v0/trackers/{TrackerName}/consumers/{ConsumerArn}"
      )

      FORECAST_GEOFENCE_EVENTS = OperationModel.new(
        name: "ForecastGeofenceEvents",
        http_method: "POST",
        request_uri: "/geofencing/v0/collections/{CollectionName}/forecast-geofence-events"
      )

      GET_DEVICE_POSITION = OperationModel.new(
        name: "GetDevicePosition",
        http_method: "GET",
        request_uri: "/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/positions/latest"
      )

      GET_DEVICE_POSITION_HISTORY = OperationModel.new(
        name: "GetDevicePositionHistory",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/list-positions"
      )

      GET_GEOFENCE = OperationModel.new(
        name: "GetGeofence",
        http_method: "GET",
        request_uri: "/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}"
      )

      GET_MAP_GLYPHS = OperationModel.new(
        name: "GetMapGlyphs",
        http_method: "GET",
        request_uri: "/maps/v0/maps/{MapName}/glyphs/{FontStack}/{FontUnicodeRange}"
      )

      GET_MAP_SPRITES = OperationModel.new(
        name: "GetMapSprites",
        http_method: "GET",
        request_uri: "/maps/v0/maps/{MapName}/sprites/{FileName}"
      )

      GET_MAP_STYLE_DESCRIPTOR = OperationModel.new(
        name: "GetMapStyleDescriptor",
        http_method: "GET",
        request_uri: "/maps/v0/maps/{MapName}/style-descriptor"
      )

      GET_MAP_TILE = OperationModel.new(
        name: "GetMapTile",
        http_method: "GET",
        request_uri: "/maps/v0/maps/{MapName}/tiles/{Z}/{X}/{Y}"
      )

      GET_PLACE = OperationModel.new(
        name: "GetPlace",
        http_method: "GET",
        request_uri: "/places/v0/indexes/{IndexName}/places/{PlaceId}"
      )

      LIST_DEVICE_POSITIONS = OperationModel.new(
        name: "ListDevicePositions",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/list-positions"
      )

      LIST_GEOFENCE_COLLECTIONS = OperationModel.new(
        name: "ListGeofenceCollections",
        http_method: "POST",
        request_uri: "/geofencing/v0/list-collections"
      )

      LIST_GEOFENCES = OperationModel.new(
        name: "ListGeofences",
        http_method: "POST",
        request_uri: "/geofencing/v0/collections/{CollectionName}/list-geofences"
      )

      LIST_KEYS = OperationModel.new(
        name: "ListKeys",
        http_method: "POST",
        request_uri: "/metadata/v0/list-keys"
      )

      LIST_MAPS = OperationModel.new(
        name: "ListMaps",
        http_method: "POST",
        request_uri: "/maps/v0/list-maps"
      )

      LIST_PLACE_INDEXES = OperationModel.new(
        name: "ListPlaceIndexes",
        http_method: "POST",
        request_uri: "/places/v0/list-indexes"
      )

      LIST_ROUTE_CALCULATORS = OperationModel.new(
        name: "ListRouteCalculators",
        http_method: "POST",
        request_uri: "/routes/v0/list-calculators"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      LIST_TRACKER_CONSUMERS = OperationModel.new(
        name: "ListTrackerConsumers",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/list-consumers"
      )

      LIST_TRACKERS = OperationModel.new(
        name: "ListTrackers",
        http_method: "POST",
        request_uri: "/tracking/v0/list-trackers"
      )

      PUT_GEOFENCE = OperationModel.new(
        name: "PutGeofence",
        http_method: "PUT",
        request_uri: "/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}"
      )

      SEARCH_PLACE_INDEX_FOR_POSITION = OperationModel.new(
        name: "SearchPlaceIndexForPosition",
        http_method: "POST",
        request_uri: "/places/v0/indexes/{IndexName}/search/position"
      )

      SEARCH_PLACE_INDEX_FOR_SUGGESTIONS = OperationModel.new(
        name: "SearchPlaceIndexForSuggestions",
        http_method: "POST",
        request_uri: "/places/v0/indexes/{IndexName}/search/suggestions"
      )

      SEARCH_PLACE_INDEX_FOR_TEXT = OperationModel.new(
        name: "SearchPlaceIndexForText",
        http_method: "POST",
        request_uri: "/places/v0/indexes/{IndexName}/search/text"
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

      UPDATE_GEOFENCE_COLLECTION = OperationModel.new(
        name: "UpdateGeofenceCollection",
        http_method: "PATCH",
        request_uri: "/geofencing/v0/collections/{CollectionName}"
      )

      UPDATE_KEY = OperationModel.new(
        name: "UpdateKey",
        http_method: "PATCH",
        request_uri: "/metadata/v0/keys/{KeyName}"
      )

      UPDATE_MAP = OperationModel.new(
        name: "UpdateMap",
        http_method: "PATCH",
        request_uri: "/maps/v0/maps/{MapName}"
      )

      UPDATE_PLACE_INDEX = OperationModel.new(
        name: "UpdatePlaceIndex",
        http_method: "PATCH",
        request_uri: "/places/v0/indexes/{IndexName}"
      )

      UPDATE_ROUTE_CALCULATOR = OperationModel.new(
        name: "UpdateRouteCalculator",
        http_method: "PATCH",
        request_uri: "/routes/v0/calculators/{CalculatorName}"
      )

      UPDATE_TRACKER = OperationModel.new(
        name: "UpdateTracker",
        http_method: "PATCH",
        request_uri: "/tracking/v0/trackers/{TrackerName}"
      )

      VERIFY_DEVICE_POSITION = OperationModel.new(
        name: "VerifyDevicePosition",
        http_method: "POST",
        request_uri: "/tracking/v0/trackers/{TrackerName}/positions/verify"
      )
    end
  end
end
