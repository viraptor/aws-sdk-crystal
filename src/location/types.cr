require "json"
require "time"

module Aws
  module Location
    module Types

      # The request was denied because of insufficient access or permissions. Check with an administrator to
      # verify your permissions.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Unique identifying information for an Android app. Consists of a package name and a 20 byte SHA-1
      # certificate fingerprint.

      struct AndroidApp
        include JSON::Serializable

        # 20 byte SHA-1 certificate fingerprint associated with the Android app signing certificate.

        @[JSON::Field(key: "CertificateFingerprint")]
        getter certificate_fingerprint : String

        # Unique package name for an Android app.

        @[JSON::Field(key: "Package")]
        getter package : String

        def initialize(
          @certificate_fingerprint : String,
          @package : String
        )
        end
      end

      # Options for filtering API keys.

      struct ApiKeyFilter
        include JSON::Serializable

        # Filter on Active or Expired API keys.

        @[JSON::Field(key: "KeyStatus")]
        getter key_status : String?

        def initialize(
          @key_status : String? = nil
        )
        end
      end

      # API Restrictions on the allowed actions, resources, and referers for an API key resource.

      struct ApiKeyRestrictions
        include JSON::Serializable

        # A list of allowed actions that an API key resource grants permissions to perform. You must have at
        # least one action for each type of resource. For example, if you have a place resource, you must
        # include at least one place action. The following are valid values for the actions. Map actions
        # geo:GetMap* - Allows all actions needed for map rendering. geo-maps:GetTile - Allows retrieving map
        # tiles. geo-maps:GetStaticMap - Allows retrieving static map images. geo-maps:* - Allows all actions
        # related to map functionalities. Place actions geo:SearchPlaceIndexForText - Allows geocoding.
        # geo:SearchPlaceIndexForPosition - Allows reverse geocoding. geo:SearchPlaceIndexForSuggestions -
        # Allows generating suggestions from text. GetPlace - Allows finding a place by place ID.
        # geo-places:Geocode - Allows geocoding using place information. geo-places:ReverseGeocode - Allows
        # reverse geocoding from location coordinates. geo-places:SearchNearby - Allows searching for places
        # near a location. geo-places:SearchText - Allows searching for places based on text input.
        # geo-places:Autocomplete - Allows auto-completion of place names based on text input.
        # geo-places:Suggest - Allows generating suggestions for places based on partial input.
        # geo-places:GetPlace - Allows finding a place by its ID. geo-places:* - Allows all actions related to
        # place services. Route actions geo:CalculateRoute - Allows point to point routing.
        # geo:CalculateRouteMatrix - Allows calculating a matrix of routes. geo-routes:CalculateRoutes -
        # Allows calculating multiple routes between points. geo-routes:CalculateRouteMatrix - Allows
        # calculating a matrix of routes between points. geo-routes:CalculateIsolines - Allows calculating
        # isolines for a given area. geo-routes:OptimizeWaypoints - Allows optimizing the order of waypoints
        # in a route. geo-routes:SnapToRoads - Allows snapping a route to the nearest roads. geo-routes:* -
        # Allows all actions related to routing functionalities. You must use these strings exactly. For
        # example, to provide access to map rendering, the only valid action is geo:GetMap* as an input to the
        # list. ["geo:GetMap*"] is valid but ["geo:GetMapTile"] is not. Similarly, you cannot use
        # ["geo:SearchPlaceIndexFor*"] - you must list each of the Place actions separately.

        @[JSON::Field(key: "AllowActions")]
        getter allow_actions : Array(String)

        # A list of allowed resource ARNs that a API key bearer can perform actions on. The ARN must be the
        # correct ARN for a map, place, or route ARN. You may include wildcards in the resource-id to match
        # multiple resources of the same type. The resources must be in the same partition , region , and
        # account-id as the key that is being created. Other than wildcards, you must include the full ARN,
        # including the arn , partition , service , region , account-id and resource-id delimited by colons
        # (:). No spaces allowed, even with wildcards. For example, arn:aws:geo:region: account-id
        # :map/ExampleMap* . For more information about ARN format, see Amazon Resource Names (ARNs) .

        @[JSON::Field(key: "AllowResources")]
        getter allow_resources : Array(String)

        # An optional list of allowed Android applications for which requests must originate from. Requests
        # using this API key from other sources will not be allowed.

        @[JSON::Field(key: "AllowAndroidApps")]
        getter allow_android_apps : Array(Types::AndroidApp)?

        # An optional list of allowed Apple applications for which requests must originate from. Requests
        # using this API key from other sources will not be allowed.

        @[JSON::Field(key: "AllowAppleApps")]
        getter allow_apple_apps : Array(Types::AppleApp)?

        # An optional list of allowed HTTP referers for which requests must originate from. Requests using
        # this API key from other domains will not be allowed. Requirements: Contain only alphanumeric
        # characters (A–Z, a–z, 0–9) or any symbols in this list $\-._+!*`(),;/?:@=&amp; May contain a percent
        # (%) if followed by 2 hexadecimal digits (A-F, a-f, 0-9); this is used for URL encoding purposes. May
        # contain wildcard characters question mark (?) and asterisk (*). Question mark (?) will replace any
        # single character (including hexadecimal digits). Asterisk (*) will replace any multiple characters
        # (including multiple hexadecimal digits). No spaces allowed. For example, https://example.com .

        @[JSON::Field(key: "AllowReferers")]
        getter allow_referers : Array(String)?

        def initialize(
          @allow_actions : Array(String),
          @allow_resources : Array(String),
          @allow_android_apps : Array(Types::AndroidApp)? = nil,
          @allow_apple_apps : Array(Types::AppleApp)? = nil,
          @allow_referers : Array(String)? = nil
        )
        end
      end

      # Unique identifying information for an Apple app (iOS, macOS, tvOS and watchOS). Consists of an Apple
      # Bundle ID.

      struct AppleApp
        include JSON::Serializable

        # The unique identifier of the app across all Apple platforms (iOS, macOS, tvOS, watchOS, etc.)

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String

        def initialize(
          @bundle_id : String
        )
        end
      end


      struct AssociateTrackerConsumerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the geofence collection to be associated to tracker resource.
        # Used when you need to specify a resource across all Amazon Web Services. Format example:
        # arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer

        @[JSON::Field(key: "ConsumerArn")]
        getter consumer_arn : String

        # The name of the tracker resource to be associated with a geofence collection.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @consumer_arn : String,
          @tracker_name : String
        )
        end
      end


      struct AssociateTrackerConsumerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the tracker resource details.

      struct BatchDeleteDevicePositionHistoryError
        include JSON::Serializable

        # The ID of the device for this position.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String


        @[JSON::Field(key: "Error")]
        getter error : Types::BatchItemError

        def initialize(
          @device_id : String,
          @error : Types::BatchItemError
        )
        end
      end


      struct BatchDeleteDevicePositionHistoryRequest
        include JSON::Serializable

        # Devices whose position history you want to delete. For example, for two devices: “DeviceIds” :
        # [DeviceId1,DeviceId2]

        @[JSON::Field(key: "DeviceIds")]
        getter device_ids : Array(String)

        # The name of the tracker resource to delete the device position history from.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @device_ids : Array(String),
          @tracker_name : String
        )
        end
      end


      struct BatchDeleteDevicePositionHistoryResponse
        include JSON::Serializable

        # Contains error details for each device history that failed to delete.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchDeleteDevicePositionHistoryError)

        def initialize(
          @errors : Array(Types::BatchDeleteDevicePositionHistoryError)
        )
        end
      end

      # Contains error details for each geofence that failed to delete from the geofence collection.

      struct BatchDeleteGeofenceError
        include JSON::Serializable

        # Contains details associated to the batch error.

        @[JSON::Field(key: "Error")]
        getter error : Types::BatchItemError

        # The geofence associated with the error message.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        def initialize(
          @error : Types::BatchItemError,
          @geofence_id : String
        )
        end
      end


      struct BatchDeleteGeofenceRequest
        include JSON::Serializable

        # The geofence collection storing the geofences to be deleted.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # The batch of geofences to be deleted.

        @[JSON::Field(key: "GeofenceIds")]
        getter geofence_ids : Array(String)

        def initialize(
          @collection_name : String,
          @geofence_ids : Array(String)
        )
        end
      end


      struct BatchDeleteGeofenceResponse
        include JSON::Serializable

        # Contains error details for each geofence that failed to delete.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchDeleteGeofenceError)

        def initialize(
          @errors : Array(Types::BatchDeleteGeofenceError)
        )
        end
      end

      # Contains error details for each device that failed to evaluate its position against the geofences in
      # a given geofence collection.

      struct BatchEvaluateGeofencesError
        include JSON::Serializable

        # The device associated with the position evaluation error.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # Contains details associated to the batch error.

        @[JSON::Field(key: "Error")]
        getter error : Types::BatchItemError

        # Specifies a timestamp for when the error occurred in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time

        def initialize(
          @device_id : String,
          @error : Types::BatchItemError,
          @sample_time : Time
        )
        end
      end


      struct BatchEvaluateGeofencesRequest
        include JSON::Serializable

        # The geofence collection used in evaluating the position of devices against its geofences.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # Contains device details for each device to be evaluated against the given geofence collection.

        @[JSON::Field(key: "DevicePositionUpdates")]
        getter device_position_updates : Array(Types::DevicePositionUpdate)

        def initialize(
          @collection_name : String,
          @device_position_updates : Array(Types::DevicePositionUpdate)
        )
        end
      end


      struct BatchEvaluateGeofencesResponse
        include JSON::Serializable

        # Contains error details for each device that failed to evaluate its position against the given
        # geofence collection.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchEvaluateGeofencesError)

        def initialize(
          @errors : Array(Types::BatchEvaluateGeofencesError)
        )
        end
      end

      # Contains error details for each device that didn't return a position.

      struct BatchGetDevicePositionError
        include JSON::Serializable

        # The ID of the device that didn't return a position.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # Contains details related to the error code.

        @[JSON::Field(key: "Error")]
        getter error : Types::BatchItemError

        def initialize(
          @device_id : String,
          @error : Types::BatchItemError
        )
        end
      end


      struct BatchGetDevicePositionRequest
        include JSON::Serializable

        # Devices whose position you want to retrieve. For example, for two devices:
        # device-ids=DeviceId1&amp;device-ids=DeviceId2

        @[JSON::Field(key: "DeviceIds")]
        getter device_ids : Array(String)

        # The tracker resource retrieving the device position.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @device_ids : Array(String),
          @tracker_name : String
        )
        end
      end


      struct BatchGetDevicePositionResponse
        include JSON::Serializable

        # Contains device position details such as the device ID, position, and timestamps for when the
        # position was received and sampled.

        @[JSON::Field(key: "DevicePositions")]
        getter device_positions : Array(Types::DevicePosition)

        # Contains error details for each device that failed to send its position to the tracker resource.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchGetDevicePositionError)

        def initialize(
          @device_positions : Array(Types::DevicePosition),
          @errors : Array(Types::BatchGetDevicePositionError)
        )
        end
      end

      # Contains the batch request error details associated with the request.

      struct BatchItemError
        include JSON::Serializable

        # The error code associated with the batch request error.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # A message with the reason for the batch request error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Contains error details for each geofence that failed to be stored in a given geofence collection.

      struct BatchPutGeofenceError
        include JSON::Serializable

        # Contains details associated to the batch error.

        @[JSON::Field(key: "Error")]
        getter error : Types::BatchItemError

        # The geofence associated with the error message.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        def initialize(
          @error : Types::BatchItemError,
          @geofence_id : String
        )
        end
      end


      struct BatchPutGeofenceRequest
        include JSON::Serializable

        # The geofence collection storing the geofences.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # The batch of geofences to be stored in a geofence collection.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::BatchPutGeofenceRequestEntry)

        def initialize(
          @collection_name : String,
          @entries : Array(Types::BatchPutGeofenceRequestEntry)
        )
        end
      end

      # Contains geofence geometry details.

      struct BatchPutGeofenceRequestEntry
        include JSON::Serializable

        # The identifier for the geofence to be stored in a given geofence collection.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        # Contains the details to specify the position of the geofence. Can be a circle, a polygon, or a
        # multipolygon. Polygon and MultiPolygon geometries can be defined using their respective parameters,
        # or encoded in Geobuf format using the Geobuf parameter. Including multiple geometry types in the
        # same request will return a validation error. The geofence Polygon and MultiPolygon formats support a
        # maximum of 1,000 total vertices. The Geobuf format supports a maximum of 100,000 vertices.

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::GeofenceGeometry

        # Associates one of more properties with the geofence. A property is a key-value pair stored with the
        # geofence and added to any geofence event triggered with that geofence. Format: "key" : "value"

        @[JSON::Field(key: "GeofenceProperties")]
        getter geofence_properties : Hash(String, String)?

        def initialize(
          @geofence_id : String,
          @geometry : Types::GeofenceGeometry,
          @geofence_properties : Hash(String, String)? = nil
        )
        end
      end


      struct BatchPutGeofenceResponse
        include JSON::Serializable

        # Contains additional error details for each geofence that failed to be stored in a geofence
        # collection.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchPutGeofenceError)

        # Contains each geofence that was successfully stored in a geofence collection.

        @[JSON::Field(key: "Successes")]
        getter successes : Array(Types::BatchPutGeofenceSuccess)

        def initialize(
          @errors : Array(Types::BatchPutGeofenceError),
          @successes : Array(Types::BatchPutGeofenceSuccess)
        )
        end
      end

      # Contains a summary of each geofence that was successfully stored in a given geofence collection.

      struct BatchPutGeofenceSuccess
        include JSON::Serializable

        # The timestamp for when the geofence was stored in a geofence collection in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The geofence successfully stored in a geofence collection.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        # The timestamp for when the geofence was last updated in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @create_time : Time,
          @geofence_id : String,
          @update_time : Time
        )
        end
      end

      # Contains error details for each device that failed to update its position.

      struct BatchUpdateDevicePositionError
        include JSON::Serializable

        # The device associated with the failed location update.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # Contains details related to the error code such as the error code and error message.

        @[JSON::Field(key: "Error")]
        getter error : Types::BatchItemError

        # The timestamp at which the device position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time

        def initialize(
          @device_id : String,
          @error : Types::BatchItemError,
          @sample_time : Time
        )
        end
      end


      struct BatchUpdateDevicePositionRequest
        include JSON::Serializable

        # The name of the tracker resource to update.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # Contains the position update details for each device, up to 10 devices.

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::DevicePositionUpdate)

        def initialize(
          @tracker_name : String,
          @updates : Array(Types::DevicePositionUpdate)
        )
        end
      end


      struct BatchUpdateDevicePositionResponse
        include JSON::Serializable

        # Contains error details for each device that failed to update its position.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchUpdateDevicePositionError)

        def initialize(
          @errors : Array(Types::BatchUpdateDevicePositionError)
        )
        end
      end

      # Contains details about additional route preferences for requests that specify TravelMode as Car .

      struct CalculateRouteCarModeOptions
        include JSON::Serializable

        # Avoids ferries when calculating routes. Default Value: false Valid Values: false | true

        @[JSON::Field(key: "AvoidFerries")]
        getter avoid_ferries : Bool?

        # Avoids tolls when calculating routes. Default Value: false Valid Values: false | true

        @[JSON::Field(key: "AvoidTolls")]
        getter avoid_tolls : Bool?

        def initialize(
          @avoid_ferries : Bool? = nil,
          @avoid_tolls : Bool? = nil
        )
        end
      end


      struct CalculateRouteMatrixRequest
        include JSON::Serializable

        # The name of the route calculator resource that you want to use to calculate the route matrix.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # The list of departure (origin) positions for the route matrix. An array of points, each of which is
        # itself a 2-value array defined in WGS 84 format: [longitude, latitude] . For example, [-123.115,
        # 49.285] . Depending on the data provider selected in the route calculator resource there may be
        # additional restrictions on the inputs you can choose. See Position restrictions in the Amazon
        # Location Service Developer Guide . For route calculators that use Esri as the data provider, if you
        # specify a departure that's not located on a road, Amazon Location moves the position to the nearest
        # road . The snapped value is available in the result in SnappedDeparturePositions . Valid Values:
        # [-180 to 180,-90 to 90]

        @[JSON::Field(key: "DeparturePositions")]
        getter departure_positions : Array(Array(Float64))

        # The list of destination positions for the route matrix. An array of points, each of which is itself
        # a 2-value array defined in WGS 84 format: [longitude, latitude] . For example, [-122.339, 47.615]
        # Depending on the data provider selected in the route calculator resource there may be additional
        # restrictions on the inputs you can choose. See Position restrictions in the Amazon Location Service
        # Developer Guide . For route calculators that use Esri as the data provider, if you specify a
        # destination that's not located on a road, Amazon Location moves the position to the nearest road .
        # The snapped value is available in the result in SnappedDestinationPositions . Valid Values: [-180 to
        # 180,-90 to 90]

        @[JSON::Field(key: "DestinationPositions")]
        getter destination_positions : Array(Array(Float64))

        # Specifies route preferences when traveling by Car , such as avoiding routes that use ferries or
        # tolls. Requirements: TravelMode must be specified as Car .

        @[JSON::Field(key: "CarModeOptions")]
        getter car_mode_options : Types::CalculateRouteCarModeOptions?

        # Sets the time of departure as the current time. Uses the current time to calculate the route matrix.
        # You can't set both DepartureTime and DepartNow . If neither is set, the best time of day to travel
        # with the best traffic conditions is used to calculate the route matrix. Default Value: false Valid
        # Values: false | true

        @[JSON::Field(key: "DepartNow")]
        getter depart_now : Bool?

        # Specifies the desired time of departure. Uses the given time to calculate the route matrix. You
        # can't set both DepartureTime and DepartNow . If neither is set, the best time of day to travel with
        # the best traffic conditions is used to calculate the route matrix. Setting a departure time in the
        # past returns a 400 ValidationException error. In ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ . For
        # example, 2020–07-2T12:15:20.000Z+01:00

        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : Time?

        # Set the unit system to specify the distance. Default Value: Kilometers

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String?

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. The TravelMode you specify also determines how you specify route preferences: If
        # traveling by Car use the CarModeOptions parameter. If traveling by Truck use the TruckModeOptions
        # parameter. Bicycle or Motorcycle are only valid when using Grab as a data provider, and only within
        # Southeast Asia. Truck is not available for Grab. For more information about using Grab as a data
        # provider, see GrabMaps in the Amazon Location Service Developer Guide . Default Value: Car

        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String?

        # Specifies route preferences when traveling by Truck , such as avoiding routes that use ferries or
        # tolls, and truck specifications to consider when choosing an optimal road. Requirements: TravelMode
        # must be specified as Truck .

        @[JSON::Field(key: "TruckModeOptions")]
        getter truck_mode_options : Types::CalculateRouteTruckModeOptions?

        def initialize(
          @calculator_name : String,
          @departure_positions : Array(Array(Float64)),
          @destination_positions : Array(Array(Float64)),
          @car_mode_options : Types::CalculateRouteCarModeOptions? = nil,
          @depart_now : Bool? = nil,
          @departure_time : Time? = nil,
          @distance_unit : String? = nil,
          @key : String? = nil,
          @travel_mode : String? = nil,
          @truck_mode_options : Types::CalculateRouteTruckModeOptions? = nil
        )
        end
      end

      # Returns the result of the route matrix calculation.

      struct CalculateRouteMatrixResponse
        include JSON::Serializable

        # The calculated route matrix containing the results for all pairs of DeparturePositions to
        # DestinationPositions . Each row corresponds to one entry in DeparturePositions . Each entry in the
        # row corresponds to the route from that entry in DeparturePositions to an entry in
        # DestinationPositions .

        @[JSON::Field(key: "RouteMatrix")]
        getter route_matrix : Array(Array(Types::RouteMatrixEntry))

        # Contains information about the route matrix, DataSource , DistanceUnit , RouteCount and ErrorCount .

        @[JSON::Field(key: "Summary")]
        getter summary : Types::CalculateRouteMatrixSummary

        # For routes calculated using an Esri route calculator resource, departure positions are snapped to
        # the closest road. For Esri route calculator resources, this returns the list of departure/origin
        # positions used for calculation of the RouteMatrix .

        @[JSON::Field(key: "SnappedDeparturePositions")]
        getter snapped_departure_positions : Array(Array(Float64))?

        # The list of destination positions for the route matrix used for calculation of the RouteMatrix .

        @[JSON::Field(key: "SnappedDestinationPositions")]
        getter snapped_destination_positions : Array(Array(Float64))?

        def initialize(
          @route_matrix : Array(Array(Types::RouteMatrixEntry)),
          @summary : Types::CalculateRouteMatrixSummary,
          @snapped_departure_positions : Array(Array(Float64))? = nil,
          @snapped_destination_positions : Array(Array(Float64))? = nil
        )
        end
      end

      # A summary of the calculated route matrix.

      struct CalculateRouteMatrixSummary
        include JSON::Serializable

        # The data provider of traffic and road network data used to calculate the routes. Indicates one of
        # the available providers: Esri Grab Here For more information about data providers, see Amazon
        # Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The unit of measurement for route distances.

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String

        # The count of error results in the route matrix. If this number is 0, all routes were calculated
        # successfully.

        @[JSON::Field(key: "ErrorCount")]
        getter error_count : Int32

        # The count of cells in the route matrix. Equal to the number of DeparturePositions multiplied by the
        # number of DestinationPositions .

        @[JSON::Field(key: "RouteCount")]
        getter route_count : Int32

        def initialize(
          @data_source : String,
          @distance_unit : String,
          @error_count : Int32,
          @route_count : Int32
        )
        end
      end


      struct CalculateRouteRequest
        include JSON::Serializable

        # The name of the route calculator resource that you want to use to calculate the route.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # The start position for the route. Defined in World Geodetic System (WGS 84) format: [longitude,
        # latitude] . For example, [-123.115, 49.285] If you specify a departure that's not located on a road,
        # Amazon Location moves the position to the nearest road . If Esri is the provider for your route
        # calculator, specifying a route that is longer than 400 km returns a 400 RoutesValidationException
        # error. Valid Values: [-180 to 180,-90 to 90]

        @[JSON::Field(key: "DeparturePosition")]
        getter departure_position : Array(Float64)

        # The finish position for the route. Defined in World Geodetic System (WGS 84) format: [longitude,
        # latitude] . For example, [-122.339, 47.615] If you specify a destination that's not located on a
        # road, Amazon Location moves the position to the nearest road . Valid Values: [-180 to 180,-90 to 90]

        @[JSON::Field(key: "DestinationPosition")]
        getter destination_position : Array(Float64)

        # Specifies the desired time of arrival. Uses the given time to calculate the route. Otherwise, the
        # best time of day to travel with the best traffic conditions is used to calculate the route.
        # ArrivalTime is not supported Esri.

        @[JSON::Field(key: "ArrivalTime")]
        getter arrival_time : Time?

        # Specifies route preferences when traveling by Car , such as avoiding routes that use ferries or
        # tolls. Requirements: TravelMode must be specified as Car .

        @[JSON::Field(key: "CarModeOptions")]
        getter car_mode_options : Types::CalculateRouteCarModeOptions?

        # Sets the time of departure as the current time. Uses the current time to calculate a route.
        # Otherwise, the best time of day to travel with the best traffic conditions is used to calculate the
        # route. Default Value: false Valid Values: false | true

        @[JSON::Field(key: "DepartNow")]
        getter depart_now : Bool?

        # Specifies the desired time of departure. Uses the given time to calculate the route. Otherwise, the
        # best time of day to travel with the best traffic conditions is used to calculate the route. In ISO
        # 8601 format: YYYY-MM-DDThh:mm:ss.sssZ . For example, 2020–07-2T12:15:20.000Z+01:00

        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : Time?

        # Set the unit system to specify the distance. Default Value: Kilometers

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String?

        # Set to include the geometry details in the result for each path between a pair of positions. Default
        # Value: false Valid Values: false | true

        @[JSON::Field(key: "IncludeLegGeometry")]
        getter include_leg_geometry : Bool?

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # Specifies the distance to optimize for when calculating a route.

        @[JSON::Field(key: "OptimizeFor")]
        getter optimize_for : String?

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. You can choose Car , Truck , Walking , Bicycle or Motorcycle as options for the
        # TravelMode . Bicycle and Motorcycle are only valid when using Grab as a data provider, and only
        # within Southeast Asia. Truck is not available for Grab. For more details on the using Grab for
        # routing, including areas of coverage, see GrabMaps in the Amazon Location Service Developer Guide .
        # The TravelMode you specify also determines how you specify route preferences: If traveling by Car
        # use the CarModeOptions parameter. If traveling by Truck use the TruckModeOptions parameter. Default
        # Value: Car

        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String?

        # Specifies route preferences when traveling by Truck , such as avoiding routes that use ferries or
        # tolls, and truck specifications to consider when choosing an optimal road. Requirements: TravelMode
        # must be specified as Truck .

        @[JSON::Field(key: "TruckModeOptions")]
        getter truck_mode_options : Types::CalculateRouteTruckModeOptions?

        # Specifies an ordered list of up to 23 intermediate positions to include along a route between the
        # departure position and destination position. For example, from the DeparturePosition [-123.115,
        # 49.285] , the route follows the order that the waypoint positions are given [[-122.757,
        # 49.0021],[-122.349, 47.620]] If you specify a waypoint position that's not located on a road, Amazon
        # Location moves the position to the nearest road . Specifying more than 23 waypoints returns a 400
        # ValidationException error. If Esri is the provider for your route calculator, specifying a route
        # that is longer than 400 km returns a 400 RoutesValidationException error. Valid Values: [-180 to
        # 180,-90 to 90]

        @[JSON::Field(key: "WaypointPositions")]
        getter waypoint_positions : Array(Array(Float64))?

        def initialize(
          @calculator_name : String,
          @departure_position : Array(Float64),
          @destination_position : Array(Float64),
          @arrival_time : Time? = nil,
          @car_mode_options : Types::CalculateRouteCarModeOptions? = nil,
          @depart_now : Bool? = nil,
          @departure_time : Time? = nil,
          @distance_unit : String? = nil,
          @include_leg_geometry : Bool? = nil,
          @key : String? = nil,
          @optimize_for : String? = nil,
          @travel_mode : String? = nil,
          @truck_mode_options : Types::CalculateRouteTruckModeOptions? = nil,
          @waypoint_positions : Array(Array(Float64))? = nil
        )
        end
      end

      # Returns the result of the route calculation. Metadata includes legs and route summary.

      struct CalculateRouteResponse
        include JSON::Serializable

        # Contains details about each path between a pair of positions included along a route such as:
        # StartPosition , EndPosition , Distance , DurationSeconds , Geometry , and Steps . The number of legs
        # returned corresponds to one fewer than the total number of positions in the request. For example, a
        # route with a departure position and destination position returns one leg with the positions snapped
        # to a nearby road : The StartPosition is the departure position. The EndPosition is the destination
        # position. A route with a waypoint between the departure and destination position returns two legs
        # with the positions snapped to a nearby road: Leg 1: The StartPosition is the departure position .
        # The EndPosition is the waypoint positon. Leg 2: The StartPosition is the waypoint position. The
        # EndPosition is the destination position.

        @[JSON::Field(key: "Legs")]
        getter legs : Array(Types::Leg)

        # Contains information about the whole route, such as: RouteBBox , DataSource , Distance ,
        # DistanceUnit , and DurationSeconds .

        @[JSON::Field(key: "Summary")]
        getter summary : Types::CalculateRouteSummary

        def initialize(
          @legs : Array(Types::Leg),
          @summary : Types::CalculateRouteSummary
        )
        end
      end

      # A summary of the calculated route.

      struct CalculateRouteSummary
        include JSON::Serializable

        # The data provider of traffic and road network data used to calculate the route. Indicates one of the
        # available providers: Esri Grab Here For more information about data providers, see Amazon Location
        # Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The total distance covered by the route. The sum of the distance travelled between every stop on the
        # route. If Esri is the data source for the route calculator, the route distance can’t be greater than
        # 400 km. If the route exceeds 400 km, the response is a 400 RoutesValidationException error.

        @[JSON::Field(key: "Distance")]
        getter distance : Float64

        # The unit of measurement for route distances.

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String

        # The total travel time for the route measured in seconds. The sum of the travel time between every
        # stop on the route.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Float64

        # Specifies a geographical box surrounding a route. Used to zoom into a route when displaying it in a
        # map. For example, [min x, min y, max x, max y] . The first 2 bbox parameters describe the lower
        # southwest corner: The first bbox position is the X coordinate or longitude of the lower southwest
        # corner. The second bbox position is the Y coordinate or latitude of the lower southwest corner. The
        # next 2 bbox parameters describe the upper northeast corner: The third bbox position is the X
        # coordinate, or longitude of the upper northeast corner. The fourth bbox position is the Y
        # coordinate, or latitude of the upper northeast corner.

        @[JSON::Field(key: "RouteBBox")]
        getter route_b_box : Array(Float64)

        def initialize(
          @data_source : String,
          @distance : Float64,
          @distance_unit : String,
          @duration_seconds : Float64,
          @route_b_box : Array(Float64)
        )
        end
      end

      # Contains details about additional route preferences for requests that specify TravelMode as Truck .

      struct CalculateRouteTruckModeOptions
        include JSON::Serializable

        # Avoids ferries when calculating routes. Default Value: false Valid Values: false | true

        @[JSON::Field(key: "AvoidFerries")]
        getter avoid_ferries : Bool?

        # Avoids tolls when calculating routes. Default Value: false Valid Values: false | true

        @[JSON::Field(key: "AvoidTolls")]
        getter avoid_tolls : Bool?

        # Specifies the truck's dimension specifications including length, height, width, and unit of
        # measurement. Used to avoid roads that can't support the truck's dimensions.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::TruckDimensions?

        # Specifies the truck's weight specifications including total weight and unit of measurement. Used to
        # avoid roads that can't support the truck's weight.

        @[JSON::Field(key: "Weight")]
        getter weight : Types::TruckWeight?

        def initialize(
          @avoid_ferries : Bool? = nil,
          @avoid_tolls : Bool? = nil,
          @dimensions : Types::TruckDimensions? = nil,
          @weight : Types::TruckWeight? = nil
        )
        end
      end

      # The cellular network communication infrastructure that the device uses.

      struct CellSignals
        include JSON::Serializable

        # Information about the Long-Term Evolution (LTE) network the device is connected to.

        @[JSON::Field(key: "LteCellDetails")]
        getter lte_cell_details : Array(Types::LteCellDetails)

        def initialize(
          @lte_cell_details : Array(Types::LteCellDetails)
        )
        end
      end

      # A circle on the earth, as defined by a center point and a radius.

      struct Circle
        include JSON::Serializable

        # A single point geometry, specifying the center of the circle, using WGS 84 coordinates, in the form
        # [longitude, latitude] .

        @[JSON::Field(key: "Center")]
        getter center : Array(Float64)

        # The radius of the circle in meters. Must be greater than zero and no larger than 100,000 (100
        # kilometers).

        @[JSON::Field(key: "Radius")]
        getter radius : Float64

        def initialize(
          @center : Array(Float64),
          @radius : Float64
        )
        end
      end

      # The request was unsuccessful because of a conflict.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateGeofenceCollectionRequest
        include JSON::Serializable

        # A custom name for the geofence collection. Requirements: Contain only alphanumeric characters (A–Z,
        # a–z, 0–9), hyphens (-), periods (.), and underscores (_). Must be a unique geofence collection name.
        # No spaces allowed. For example, ExampleGeofenceCollection .

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # An optional description for the geofence collection.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A key identifier for an Amazon Web Services KMS customer managed key . Enter a key ID, key ARN,
        # alias name, or alias ARN.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        # Applies one or more tags to the geofence collection. A tag is a key-value pair helps manage,
        # identify, search, and filter your resources by labelling them. Format: "key" : "value" Restrictions:
        # Maximum 50 tags per resource Each resource tag must be unique with a maximum of one value. Maximum
        # key length: 128 Unicode characters in UTF-8 Maximum value length: 256 Unicode characters in UTF-8
        # Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @.
        # Cannot use "aws:" as a prefix for a key.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @collection_name : String,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateGeofenceCollectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a
        # resource across all Amazon Web Services. Format example:
        # arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection

        @[JSON::Field(key: "CollectionArn")]
        getter collection_arn : String

        # The name for the geofence collection.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # The timestamp for when the geofence collection was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        def initialize(
          @collection_arn : String,
          @collection_name : String,
          @create_time : Time
        )
        end
      end


      struct CreateKeyRequest
        include JSON::Serializable

        # A custom name for the API key resource. Requirements: Contain only alphanumeric characters (A–Z,
        # a–z, 0–9), hyphens (-), periods (.), and underscores (_). Must be a unique API key name. No spaces
        # allowed. For example, ExampleAPIKey .

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # The API key restrictions for the API key resource.

        @[JSON::Field(key: "Restrictions")]
        getter restrictions : Types::ApiKeyRestrictions

        # An optional description for the API key resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The optional timestamp for when the API key resource will expire in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ . One of NoExpiry or ExpireTime must be set.

        @[JSON::Field(key: "ExpireTime")]
        getter expire_time : Time?

        # Optionally set to true to set no expiration time for the API key. One of NoExpiry or ExpireTime must
        # be set.

        @[JSON::Field(key: "NoExpiry")]
        getter no_expiry : Bool?

        # Applies one or more tags to the map resource. A tag is a key-value pair that helps manage, identify,
        # search, and filter your resources by labelling them. Format: "key" : "value" Restrictions: Maximum
        # 50 tags per resource Each resource tag must be unique with a maximum of one value. Maximum key
        # length: 128 Unicode characters in UTF-8 Maximum value length: 256 Unicode characters in UTF-8 Can
        # use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. Cannot
        # use "aws:" as a prefix for a key.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @key_name : String,
          @restrictions : Types::ApiKeyRestrictions,
          @description : String? = nil,
          @expire_time : Time? = nil,
          @no_expiry : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateKeyResponse
        include JSON::Serializable

        # The timestamp for when the API key resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ
        # .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The key value/string of an API key. This value is used when making API calls to authorize the call.
        # For example, see GetMapGlyphs .

        @[JSON::Field(key: "Key")]
        getter key : String

        # The Amazon Resource Name (ARN) for the API key resource. Used when you need to specify a resource
        # across all Amazon Web Services. Format example: arn:aws:geo:region:account-id:key/ExampleKey

        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The name of the API key resource.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        def initialize(
          @create_time : Time,
          @key : String,
          @key_arn : String,
          @key_name : String
        )
        end
      end


      struct CreateMapRequest
        include JSON::Serializable

        # Specifies the MapConfiguration , including the map style, for the map resource that you create. The
        # map style defines the look of maps and the data provider for your map resource.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::MapConfiguration

        # The name for the map resource. Requirements: Must contain only alphanumeric characters (A–Z, a–z,
        # 0–9), hyphens (-), periods (.), and underscores (_). Must be a unique map resource name. No spaces
        # allowed. For example, ExampleMap .

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # An optional description for the map resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # Applies one or more tags to the map resource. A tag is a key-value pair helps manage, identify,
        # search, and filter your resources by labelling them. Format: "key" : "value" Restrictions: Maximum
        # 50 tags per resource Each resource tag must be unique with a maximum of one value. Maximum key
        # length: 128 Unicode characters in UTF-8 Maximum value length: 256 Unicode characters in UTF-8 Can
        # use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. Cannot
        # use "aws:" as a prefix for a key.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::MapConfiguration,
          @map_name : String,
          @description : String? = nil,
          @pricing_plan : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMapResponse
        include JSON::Serializable

        # The timestamp for when the map resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The Amazon Resource Name (ARN) for the map resource. Used to specify a resource across all Amazon
        # Web Services. Format example: arn:aws:geo:region:account-id:map/ExampleMap

        @[JSON::Field(key: "MapArn")]
        getter map_arn : String

        # The name of the map resource.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        def initialize(
          @create_time : Time,
          @map_arn : String,
          @map_name : String
        )
        end
      end


      struct CreatePlaceIndexRequest
        include JSON::Serializable

        # Specifies the geospatial data provider for the new place index. This field is case-sensitive. Enter
        # the valid values as shown. For example, entering HERE returns an error. Valid values include: Esri –
        # For additional information about Esri 's coverage in your region of interest, see Esri details on
        # geocoding coverage . Grab – Grab provides place index functionality for Southeast Asia. For
        # additional information about GrabMaps ' coverage, see GrabMaps countries and areas covered . Here –
        # For additional information about HERE Technologies ' coverage in your region of interest, see HERE
        # details on goecoding coverage . If you specify HERE Technologies ( Here ) as the data provider, you
        # may not store results for locations in Japan. For more information, see the Amazon Web Services
        # service terms for Amazon Location Service. For additional information , see Data providers on the
        # Amazon Location Service developer guide .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The name of the place index resource. Requirements: Contain only alphanumeric characters (A–Z, a–z,
        # 0–9), hyphens (-), periods (.), and underscores (_). Must be a unique place index resource name. No
        # spaces allowed. For example, ExamplePlaceIndex .

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # Specifies the data storage option requesting Places.

        @[JSON::Field(key: "DataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration?

        # The optional description for the place index resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # Applies one or more tags to the place index resource. A tag is a key-value pair that helps you
        # manage, identify, search, and filter your resources. Format: "key" : "value" Restrictions: Maximum
        # 50 tags per resource. Each tag key must be unique and must have exactly one associated value.
        # Maximum key length: 128 Unicode characters in UTF-8. Maximum value length: 256 Unicode characters in
        # UTF-8. Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : /
        # @ Cannot use "aws:" as a prefix for a key.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @data_source : String,
          @index_name : String,
          @data_source_configuration : Types::DataSourceConfiguration? = nil,
          @description : String? = nil,
          @pricing_plan : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePlaceIndexResponse
        include JSON::Serializable

        # The timestamp for when the place index resource was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across
        # Amazon Web Services. Format example: arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex

        @[JSON::Field(key: "IndexArn")]
        getter index_arn : String

        # The name for the place index resource.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        def initialize(
          @create_time : Time,
          @index_arn : String,
          @index_name : String
        )
        end
      end


      struct CreateRouteCalculatorRequest
        include JSON::Serializable

        # The name of the route calculator resource. Requirements: Can use alphanumeric characters (A–Z, a–z,
        # 0–9) , hyphens (-), periods (.), and underscores (_). Must be a unique Route calculator resource
        # name. No spaces allowed. For example, ExampleRouteCalculator .

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # Specifies the data provider of traffic and road network data. This field is case-sensitive. Enter
        # the valid values as shown. For example, entering HERE returns an error. Valid values include: Esri –
        # For additional information about Esri 's coverage in your region of interest, see Esri details on
        # street networks and traffic coverage . Route calculators that use Esri as a data source only
        # calculate routes that are shorter than 400 km. Grab – Grab provides routing functionality for
        # Southeast Asia. For additional information about GrabMaps ' coverage, see GrabMaps countries and
        # areas covered . Here – For additional information about HERE Technologies ' coverage in your region
        # of interest, see HERE car routing coverage and HERE truck routing coverage . For additional
        # information , see Data providers on the Amazon Location Service Developer Guide .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The optional description for the route calculator resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # Applies one or more tags to the route calculator resource. A tag is a key-value pair helps manage,
        # identify, search, and filter your resources by labelling them. For example: { "tag1" : "value1" ,
        # "tag2" : "value2" } Format: "key" : "value" Restrictions: Maximum 50 tags per resource Each resource
        # tag must be unique with a maximum of one value. Maximum key length: 128 Unicode characters in UTF-8
        # Maximum value length: 256 Unicode characters in UTF-8 Can use alphanumeric characters (A–Z, a–z,
        # 0–9), and the following characters: + - = . _ : / @. Cannot use "aws:" as a prefix for a key.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @calculator_name : String,
          @data_source : String,
          @description : String? = nil,
          @pricing_plan : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRouteCalculatorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the route calculator resource. Use the ARN when you specify a
        # resource across all Amazon Web Services. Format example:
        # arn:aws:geo:region:account-id:route-calculator/ExampleCalculator

        @[JSON::Field(key: "CalculatorArn")]
        getter calculator_arn : String

        # The name of the route calculator resource. For example, ExampleRouteCalculator .

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # The timestamp when the route calculator resource was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ . For example, 2020–07-2T12:15:20.000Z+01:00

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        def initialize(
          @calculator_arn : String,
          @calculator_name : String,
          @create_time : Time
        )
        end
      end


      struct CreateTrackerRequest
        include JSON::Serializable

        # The name for the tracker resource. Requirements: Contain only alphanumeric characters (A-Z, a-z,
        # 0-9) , hyphens (-), periods (.), and underscores (_). Must be a unique tracker resource name. No
        # spaces allowed. For example, ExampleTracker .

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # An optional description for the tracker resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Whether to enable position UPDATE events from this tracker to be sent to EventBridge. You do not
        # need enable this feature to get ENTER and EXIT events for geofences with this tracker. Those events
        # are always sent to EventBridge.

        @[JSON::Field(key: "EventBridgeEnabled")]
        getter event_bridge_enabled : Bool?

        # Enables GeospatialQueries for a tracker that uses a Amazon Web Services KMS customer managed key .
        # This parameter is only used if you are using a KMS customer managed key. If you wish to encrypt your
        # data using your own KMS customer managed key, then the Bounding Polygon Queries feature will be
        # disabled by default. This is because by using this feature, a representation of your device
        # positions will not be encrypted using the your KMS managed key. The exact device position, however;
        # is still encrypted using your managed key. You can choose to opt-in to the Bounding Polygon Quseries
        # feature. This is done by setting the KmsKeyEnableGeospatialQueries parameter to true when creating
        # or updating a Tracker.

        @[JSON::Field(key: "KmsKeyEnableGeospatialQueries")]
        getter kms_key_enable_geospatial_queries : Bool?

        # A key identifier for an Amazon Web Services KMS customer managed key . Enter a key ID, key ARN,
        # alias name, or alias ARN.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the position filtering for the tracker resource. Valid values: TimeBased - Location
        # updates are evaluated against linked geofence collections, but not every location update is stored.
        # If your update frequency is more often than 30 seconds, only one update per 30 seconds is stored for
        # each unique device ID. DistanceBased - If the device has moved less than 30 m (98.4 ft), location
        # updates are ignored. Location updates within this area are neither evaluated against linked geofence
        # collections, nor stored. This helps control costs by reducing the number of geofence evaluations and
        # historical device positions to paginate through. Distance-based filtering can also reduce the
        # effects of GPS noise when displaying device trajectories on a map. AccuracyBased - If the device has
        # moved less than the measured accuracy, location updates are ignored. For example, if two consecutive
        # updates from a device have a horizontal accuracy of 5 m and 10 m, the second update is ignored if
        # the device has moved less than 15 m. Ignored location updates are neither evaluated against linked
        # geofence collections, nor stored. This can reduce the effects of GPS noise when displaying device
        # trajectories on a map, and can help control your costs by reducing the number of geofence
        # evaluations. This field is optional. If not specified, the default value is TimeBased .

        @[JSON::Field(key: "PositionFiltering")]
        getter position_filtering : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        # Applies one or more tags to the tracker resource. A tag is a key-value pair helps manage, identify,
        # search, and filter your resources by labelling them. Format: "key" : "value" Restrictions: Maximum
        # 50 tags per resource Each resource tag must be unique with a maximum of one value. Maximum key
        # length: 128 Unicode characters in UTF-8 Maximum value length: 256 Unicode characters in UTF-8 Can
        # use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. Cannot
        # use "aws:" as a prefix for a key.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tracker_name : String,
          @description : String? = nil,
          @event_bridge_enabled : Bool? = nil,
          @kms_key_enable_geospatial_queries : Bool? = nil,
          @kms_key_id : String? = nil,
          @position_filtering : String? = nil,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateTrackerResponse
        include JSON::Serializable

        # The timestamp for when the tracker resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ
        # .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource
        # across all Amazon Web Services. Format example: arn:aws:geo:region:account-id:tracker/ExampleTracker

        @[JSON::Field(key: "TrackerArn")]
        getter tracker_arn : String

        # The name of the tracker resource.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @create_time : Time,
          @tracker_arn : String,
          @tracker_name : String
        )
        end
      end

      # Specifies the data storage option chosen for requesting Places. When using Amazon Location Places:
      # If using HERE Technologies as a data provider, you can't store results for locations in Japan by
      # setting IntendedUse to Storage . parameter. Under the MobileAssetTracking or MobilAssetManagement
      # pricing plan, you can't store results from your place index resources by setting IntendedUse to
      # Storage . This returns a validation exception error. For more information, see the AWS Service Terms
      # for Amazon Location Service.

      struct DataSourceConfiguration
        include JSON::Serializable

        # Specifies how the results of an operation will be stored by the caller. Valid values include:
        # SingleUse specifies that the results won't be stored. Storage specifies that the result can be
        # cached or stored in a database. Default value: SingleUse

        @[JSON::Field(key: "IntendedUse")]
        getter intended_use : String?

        def initialize(
          @intended_use : String? = nil
        )
        end
      end


      struct DeleteGeofenceCollectionRequest
        include JSON::Serializable

        # The name of the geofence collection to be deleted.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        def initialize(
          @collection_name : String
        )
        end
      end


      struct DeleteGeofenceCollectionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteKeyRequest
        include JSON::Serializable

        # The name of the API key to delete.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # ForceDelete bypasses an API key's expiry conditions and deletes the key. Set the parameter true to
        # delete the key or to false to not preemptively delete the API key. Valid values: true , or false .
        # Required: No This action is irreversible. Only use ForceDelete if you are certain the key is no
        # longer in use.

        @[JSON::Field(key: "forceDelete")]
        getter force_delete : Bool?

        def initialize(
          @key_name : String,
          @force_delete : Bool? = nil
        )
        end
      end


      struct DeleteKeyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMapRequest
        include JSON::Serializable

        # The name of the map resource to be deleted.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        def initialize(
          @map_name : String
        )
        end
      end


      struct DeleteMapResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePlaceIndexRequest
        include JSON::Serializable

        # The name of the place index resource to be deleted.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        def initialize(
          @index_name : String
        )
        end
      end


      struct DeletePlaceIndexResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRouteCalculatorRequest
        include JSON::Serializable

        # The name of the route calculator resource to be deleted.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        def initialize(
          @calculator_name : String
        )
        end
      end


      struct DeleteRouteCalculatorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTrackerRequest
        include JSON::Serializable

        # The name of the tracker resource to be deleted.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @tracker_name : String
        )
        end
      end


      struct DeleteTrackerResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeGeofenceCollectionRequest
        include JSON::Serializable

        # The name of the geofence collection.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        def initialize(
          @collection_name : String
        )
        end
      end


      struct DescribeGeofenceCollectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a
        # resource across all Amazon Web Services. Format example:
        # arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection

        @[JSON::Field(key: "CollectionArn")]
        getter collection_arn : String

        # The name of the geofence collection.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # The timestamp for when the geofence resource was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The optional description for the geofence collection.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The timestamp for when the geofence collection was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # The number of geofences in the geofence collection.

        @[JSON::Field(key: "GeofenceCount")]
        getter geofence_count : Int32?

        # A key identifier for an Amazon Web Services KMS customer managed key assigned to the Amazon Location
        # resource

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # No longer used. Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # No longer used. Always returns an empty string.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        # Displays the key, value pairs of tags associated with this resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @collection_arn : String,
          @collection_name : String,
          @create_time : Time,
          @description : String,
          @update_time : Time,
          @geofence_count : Int32? = nil,
          @kms_key_id : String? = nil,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeKeyRequest
        include JSON::Serializable

        # The name of the API key resource.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        def initialize(
          @key_name : String
        )
        end
      end


      struct DescribeKeyResponse
        include JSON::Serializable

        # The timestamp for when the API key resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ
        # .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The timestamp for when the API key resource will expire in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ
        # .

        @[JSON::Field(key: "ExpireTime")]
        getter expire_time : Time

        # The key value/string of an API key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The Amazon Resource Name (ARN) for the API key resource. Used when you need to specify a resource
        # across all Amazon Web Services. Format example: arn:aws:geo:region:account-id:key/ExampleKey

        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The name of the API key resource.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String


        @[JSON::Field(key: "Restrictions")]
        getter restrictions : Types::ApiKeyRestrictions

        # The timestamp for when the API key resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # The optional description for the API key resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags associated with the API key resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @create_time : Time,
          @expire_time : Time,
          @key : String,
          @key_arn : String,
          @key_name : String,
          @restrictions : Types::ApiKeyRestrictions,
          @update_time : Time,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeMapRequest
        include JSON::Serializable

        # The name of the map resource.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        def initialize(
          @map_name : String
        )
        end
      end


      struct DescribeMapResponse
        include JSON::Serializable

        # Specifies the map tile style selected from a partner data provider.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::MapConfiguration

        # The timestamp for when the map resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # Specifies the data provider for the associated map tiles.

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The optional description for the map resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The Amazon Resource Name (ARN) for the map resource. Used to specify a resource across all Amazon
        # Web Services. Format example: arn:aws:geo:region:account-id:map/ExampleMap

        @[JSON::Field(key: "MapArn")]
        getter map_arn : String

        # The map style selected from an available provider.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # The timestamp for when the map resource was last update in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ
        # .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # No longer used. Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # Tags associated with the map resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::MapConfiguration,
          @create_time : Time,
          @data_source : String,
          @description : String,
          @map_arn : String,
          @map_name : String,
          @update_time : Time,
          @pricing_plan : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribePlaceIndexRequest
        include JSON::Serializable

        # The name of the place index resource.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        def initialize(
          @index_name : String
        )
        end
      end


      struct DescribePlaceIndexResponse
        include JSON::Serializable

        # The timestamp for when the place index resource was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The data provider of geospatial data. Values can be one of the following: Esri Grab Here For more
        # information about data providers, see Amazon Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The specified data storage option for requesting Places.

        @[JSON::Field(key: "DataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration

        # The optional description for the place index resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across
        # Amazon Web Services. Format example: arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex

        @[JSON::Field(key: "IndexArn")]
        getter index_arn : String

        # The name of the place index resource being described.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The timestamp for when the place index resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # No longer used. Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # Tags associated with place index resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @create_time : Time,
          @data_source : String,
          @data_source_configuration : Types::DataSourceConfiguration,
          @description : String,
          @index_arn : String,
          @index_name : String,
          @update_time : Time,
          @pricing_plan : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeRouteCalculatorRequest
        include JSON::Serializable

        # The name of the route calculator resource.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        def initialize(
          @calculator_name : String
        )
        end
      end


      struct DescribeRouteCalculatorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Route calculator resource. Use the ARN when you specify a
        # resource across Amazon Web Services. Format example:
        # arn:aws:geo:region:account-id:route-calculator/ExampleCalculator

        @[JSON::Field(key: "CalculatorArn")]
        getter calculator_arn : String

        # The name of the route calculator resource being described.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # The timestamp when the route calculator resource was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ . For example, 2020–07-2T12:15:20.000Z+01:00

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The data provider of traffic and road network data. Indicates one of the available providers: Esri
        # Grab Here For more information about data providers, see Amazon Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The optional description of the route calculator resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The timestamp when the route calculator resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ . For example, 2020–07-2T12:15:20.000Z+01:00

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # Tags associated with route calculator resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @calculator_arn : String,
          @calculator_name : String,
          @create_time : Time,
          @data_source : String,
          @description : String,
          @update_time : Time,
          @pricing_plan : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeTrackerRequest
        include JSON::Serializable

        # The name of the tracker resource.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @tracker_name : String
        )
        end
      end


      struct DescribeTrackerResponse
        include JSON::Serializable

        # The timestamp for when the tracker resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ
        # .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The optional description for the tracker resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource
        # across all Amazon Web Services. Format example: arn:aws:geo:region:account-id:tracker/ExampleTracker

        @[JSON::Field(key: "TrackerArn")]
        getter tracker_arn : String

        # The name of the tracker resource.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # The timestamp for when the tracker resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # Whether UPDATE events from this tracker in EventBridge are enabled. If set to true these events will
        # be sent to EventBridge.

        @[JSON::Field(key: "EventBridgeEnabled")]
        getter event_bridge_enabled : Bool?

        # Enables GeospatialQueries for a tracker that uses a Amazon Web Services KMS customer managed key .
        # This parameter is only used if you are using a KMS customer managed key. If you wish to encrypt your
        # data using your own KMS customer managed key, then the Bounding Polygon Queries feature will be
        # disabled by default. This is because by using this feature, a representation of your device
        # positions will not be encrypted using the your KMS managed key. The exact device position, however;
        # is still encrypted using your managed key. You can choose to opt-in to the Bounding Polygon Quseries
        # feature. This is done by setting the KmsKeyEnableGeospatialQueries parameter to true when creating
        # or updating a Tracker.

        @[JSON::Field(key: "KmsKeyEnableGeospatialQueries")]
        getter kms_key_enable_geospatial_queries : Bool?

        # A key identifier for an Amazon Web Services KMS customer managed key assigned to the Amazon Location
        # resource.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The position filtering method of the tracker resource.

        @[JSON::Field(key: "PositionFiltering")]
        getter position_filtering : String?

        # Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # No longer used. Always returns an empty string.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        # The tags associated with the tracker resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @create_time : Time,
          @description : String,
          @tracker_arn : String,
          @tracker_name : String,
          @update_time : Time,
          @event_bridge_enabled : Bool? = nil,
          @kms_key_enable_geospatial_queries : Bool? = nil,
          @kms_key_id : String? = nil,
          @position_filtering : String? = nil,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains the device position details.

      struct DevicePosition
        include JSON::Serializable

        # The last known device position.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The timestamp for when the tracker resource received the device position in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "ReceivedTime")]
        getter received_time : Time

        # The timestamp at which the device's position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time

        # The accuracy of the device position.

        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Types::PositionalAccuracy?

        # The device whose position you retrieved.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The properties associated with the position.

        @[JSON::Field(key: "PositionProperties")]
        getter position_properties : Hash(String, String)?

        def initialize(
          @position : Array(Float64),
          @received_time : Time,
          @sample_time : Time,
          @accuracy : Types::PositionalAccuracy? = nil,
          @device_id : String? = nil,
          @position_properties : Hash(String, String)? = nil
        )
        end
      end

      # Contains the position update details for a device.

      struct DevicePositionUpdate
        include JSON::Serializable

        # The device associated to the position update.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The latest device position defined in WGS 84 format: [X or longitude, Y or latitude] .

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The timestamp at which the device's position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time

        # The accuracy of the device position.

        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Types::PositionalAccuracy?

        # Associates one of more properties with the position update. A property is a key-value pair stored
        # with the position update and added to any geofence event the update may trigger. Format: "key" :
        # "value"

        @[JSON::Field(key: "PositionProperties")]
        getter position_properties : Hash(String, String)?

        def initialize(
          @device_id : String,
          @position : Array(Float64),
          @sample_time : Time,
          @accuracy : Types::PositionalAccuracy? = nil,
          @position_properties : Hash(String, String)? = nil
        )
        end
      end

      # The device's position, IP address, and Wi-Fi access points.

      struct DeviceState
        include JSON::Serializable

        # The device identifier.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The last known device position.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The timestamp at which the device's position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time


        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Types::PositionalAccuracy?

        # The cellular network infrastructure that the device is connected to.

        @[JSON::Field(key: "CellSignals")]
        getter cell_signals : Types::CellSignals?

        # The device's Ipv4 address.

        @[JSON::Field(key: "Ipv4Address")]
        getter ipv4_address : String?

        # The Wi-Fi access points the device is using.

        @[JSON::Field(key: "WiFiAccessPoints")]
        getter wi_fi_access_points : Array(Types::WiFiAccessPoint)?

        def initialize(
          @device_id : String,
          @position : Array(Float64),
          @sample_time : Time,
          @accuracy : Types::PositionalAccuracy? = nil,
          @cell_signals : Types::CellSignals? = nil,
          @ipv4_address : String? = nil,
          @wi_fi_access_points : Array(Types::WiFiAccessPoint)? = nil
        )
        end
      end


      struct DisassociateTrackerConsumerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the geofence collection to be disassociated from the tracker
        # resource. Used when you need to specify a resource across all Amazon Web Services. Format example:
        # arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer

        @[JSON::Field(key: "ConsumerArn")]
        getter consumer_arn : String

        # The name of the tracker resource to be dissociated from the consumer.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @consumer_arn : String,
          @tracker_name : String
        )
        end
      end


      struct DisassociateTrackerConsumerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The device's position and speed.

      struct ForecastGeofenceEventsDeviceState
        include JSON::Serializable

        # The device's position.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The device's speed.

        @[JSON::Field(key: "Speed")]
        getter speed : Float64?

        def initialize(
          @position : Array(Float64),
          @speed : Float64? = nil
        )
        end
      end


      struct ForecastGeofenceEventsRequest
        include JSON::Serializable

        # The name of the geofence collection.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # Represents the device's state, including its current position and speed. When speed is omitted, this
        # API performs a containment check . The containment check operation returns IDLE events for geofences
        # where the device is currently inside of, but no other events.

        @[JSON::Field(key: "DeviceState")]
        getter device_state : Types::ForecastGeofenceEventsDeviceState

        # The distance unit used for the NearestDistance property returned in a forecasted event. The
        # measurement system must match for DistanceUnit and SpeedUnit ; if Kilometers is specified for
        # DistanceUnit , then SpeedUnit must be KilometersPerHour . Default Value: Kilometers

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String?

        # An optional limit for the number of resources returned in a single call. Default value: 20

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The speed unit for the device captured by the device state. The measurement system must match for
        # DistanceUnit and SpeedUnit ; if Kilometers is specified for DistanceUnit , then SpeedUnit must be
        # KilometersPerHour . Default Value: KilometersPerHour .

        @[JSON::Field(key: "SpeedUnit")]
        getter speed_unit : String?

        # The forward-looking time window for forecasting, specified in minutes. The API only returns events
        # that are predicted to occur within this time horizon. When no value is specified, this API performs
        # a containment check . The containment check operation returns IDLE events for geofences where the
        # device is currently inside of, but no other events.

        @[JSON::Field(key: "TimeHorizonMinutes")]
        getter time_horizon_minutes : Float64?

        def initialize(
          @collection_name : String,
          @device_state : Types::ForecastGeofenceEventsDeviceState,
          @distance_unit : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @speed_unit : String? = nil,
          @time_horizon_minutes : Float64? = nil
        )
        end
      end


      struct ForecastGeofenceEventsResponse
        include JSON::Serializable

        # The distance unit for the forecasted events.

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String

        # The list of forecasted events.

        @[JSON::Field(key: "ForecastedEvents")]
        getter forecasted_events : Array(Types::ForecastedEvent)

        # The speed unit for the forecasted events.

        @[JSON::Field(key: "SpeedUnit")]
        getter speed_unit : String

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @distance_unit : String,
          @forecasted_events : Array(Types::ForecastedEvent),
          @speed_unit : String,
          @next_token : String? = nil
        )
        end
      end

      # A forecasted event represents a geofence event in relation to the requested device state, that may
      # occur given the provided device state and time horizon.

      struct ForecastedEvent
        include JSON::Serializable

        # The forecasted event identifier.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The event type, forecasting three states for which a device can be in relative to a geofence: ENTER
        # : If a device is outside of a geofence, but would breach the fence if the device is moving at its
        # current speed within time horizon window. EXIT : If a device is inside of a geofence, but would
        # breach the fence if the device is moving at its current speed within time horizon window. IDLE : If
        # a device is inside of a geofence, and the device is not moving.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The geofence identifier pertaining to the forecasted event.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        # Indicates if the device is located within the geofence.

        @[JSON::Field(key: "IsDeviceInGeofence")]
        getter is_device_in_geofence : Bool

        # The closest distance from the device's position to the geofence.

        @[JSON::Field(key: "NearestDistance")]
        getter nearest_distance : Float64

        # The forecasted time the device will breach the geofence in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "ForecastedBreachTime")]
        getter forecasted_breach_time : Time?

        # The geofence properties.

        @[JSON::Field(key: "GeofenceProperties")]
        getter geofence_properties : Hash(String, String)?

        def initialize(
          @event_id : String,
          @event_type : String,
          @geofence_id : String,
          @is_device_in_geofence : Bool,
          @nearest_distance : Float64,
          @forecasted_breach_time : Time? = nil,
          @geofence_properties : Hash(String, String)? = nil
        )
        end
      end

      # Contains the geofence geometry details. A geofence geometry can be a circle, a polygon, or a
      # multipolygon. Polygon and MultiPolygon geometries can be defined using their respective parameters,
      # or encoded in Geobuf format using the Geobuf parameter. Including multiple geometry types in the
      # same request will return a validation error. Amazon Location doesn't currently support polygons that
      # cross the antimeridian.

      struct GeofenceGeometry
        include JSON::Serializable

        # A circle on the earth, as defined by a center point and a radius.

        @[JSON::Field(key: "Circle")]
        getter circle : Types::Circle?

        # Geobuf is a compact binary encoding for geographic data that provides lossless compression of
        # GeoJSON polygons. The Geobuf must be Base64-encoded. This parameter can contain a Geobuf-encoded
        # GeoJSON geometry object of type Polygon OR MultiPolygon . For more information and specific
        # configuration requirements for these object types, see Polygon and MultiPolygon . The following
        # limitations apply specifically to geometries defined using the Geobuf parameter, and supercede the
        # corresponding limitations of the Polygon and MultiPolygon parameters: A Polygon in Geobuf format can
        # have up to 25,000 rings and up to 100,000 total vertices, including all vertices from all component
        # rings. A MultiPolygon in Geobuf format can contain up to 10,000 Polygons and up to 100,000 total
        # vertices, including all vertices from all component Polygons .

        @[JSON::Field(key: "Geobuf")]
        getter geobuf : Bytes?

        # A MultiPolygon is a list of up to 250 Polygon elements which represent the shape of a geofence. The
        # Polygon components of a MultiPolygon geometry can define separate geographical areas that are
        # considered part of the same geofence, perimeters of larger exterior areas with smaller interior
        # spaces that are excluded from the geofence, or some combination of these use cases to form complex
        # geofence boundaries. For more information and specific configuration requirements for the Polygon
        # components that form a MultiPolygon , see Polygon . The following additional requirements and
        # limitations apply to geometries defined using the MultiPolygon parameter: The entire MultiPolygon
        # must consist of no more than 1,000 vertices, including all vertices from all component Polygons .
        # Each edge of a component Polygon must intersect no more than 5 edges from other Polygons . Parallel
        # edges that are shared but do not cross are not counted toward this limit. The total number of
        # intersecting edges of component Polygons must be no more than 100,000. Parallel edges that are
        # shared but do not cross are not counted toward this limit.

        @[JSON::Field(key: "MultiPolygon")]
        getter multi_polygon : Array(Array(Array(Array(Float64))))?

        # A Polygon is a list of up to 250 linear rings which represent the shape of a geofence. This list
        # must include 1 exterior ring (representing the outer perimeter of the geofence), and can optionally
        # include up to 249 interior rings (representing polygonal spaces within the perimeter, which are
        # excluded from the geofence area). A linear ring is an array of 4 or more vertices, where the first
        # and last vertex are the same (to form a closed boundary). Each vertex is a 2-dimensional point
        # represented as an array of doubles of length 2: [longitude, latitude] . Each linear ring is
        # represented as an array of arrays of doubles ( [[longitude, latitude], [longitude, latitude], ...]
        # ). The vertices for the exterior ring must be listed in counter-clockwise sequence. Vertices for all
        # interior rings must be listed in clockwise sequence. The list of linear rings that describe the
        # entire Polygon is represented as an array of arrays of arrays of doubles ( [[[longitude, latitude],
        # [longitude, latitude], ...], [[longitude, latitude], [longitude, latitude], ...], ...] ). The
        # exterior ring must be listed first, before any interior rings. The following additional requirements
        # and limitations apply to geometries defined using the Polygon parameter: The entire Polygon must
        # consist of no more than 1,000 vertices, including all vertices from the exterior ring and all
        # interior rings. Rings must not touch or cross each other. All interior rings must be fully contained
        # within the exterior ring. Interior rings must not contain other interior rings. No ring is permitted
        # to intersect itself.

        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Array(Array(Float64)))?

        def initialize(
          @circle : Types::Circle? = nil,
          @geobuf : Bytes? = nil,
          @multi_polygon : Array(Array(Array(Array(Float64))))? = nil,
          @polygon : Array(Array(Array(Float64)))? = nil
        )
        end
      end


      struct GetDevicePositionHistoryRequest
        include JSON::Serializable

        # The device whose position history you want to retrieve.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The tracker resource receiving the request for the device position history.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # Specify the end time for the position history in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ . By
        # default, the value will be the time that the request is made. Requirement: The time specified for
        # EndTimeExclusive must be after the time for StartTimeInclusive .

        @[JSON::Field(key: "EndTimeExclusive")]
        getter end_time_exclusive : Time?

        # An optional limit for the number of device positions returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specify the start time for the position history in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ . By
        # default, the value will be 24 hours prior to the time that the request is made. Requirement: The
        # time specified for StartTimeInclusive must be before EndTimeExclusive .

        @[JSON::Field(key: "StartTimeInclusive")]
        getter start_time_inclusive : Time?

        def initialize(
          @device_id : String,
          @tracker_name : String,
          @end_time_exclusive : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time_inclusive : Time? = nil
        )
        end
      end


      struct GetDevicePositionHistoryResponse
        include JSON::Serializable

        # Contains the position history details for the requested device.

        @[JSON::Field(key: "DevicePositions")]
        getter device_positions : Array(Types::DevicePosition)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @device_positions : Array(Types::DevicePosition),
          @next_token : String? = nil
        )
        end
      end


      struct GetDevicePositionRequest
        include JSON::Serializable

        # The device whose position you want to retrieve.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The tracker resource receiving the position update.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        def initialize(
          @device_id : String,
          @tracker_name : String
        )
        end
      end


      struct GetDevicePositionResponse
        include JSON::Serializable

        # The last known device position.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The timestamp for when the tracker resource received the device position. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "ReceivedTime")]
        getter received_time : Time

        # The timestamp at which the device's position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time

        # The accuracy of the device position.

        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Types::PositionalAccuracy?

        # The device whose position you retrieved.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The properties associated with the position.

        @[JSON::Field(key: "PositionProperties")]
        getter position_properties : Hash(String, String)?

        def initialize(
          @position : Array(Float64),
          @received_time : Time,
          @sample_time : Time,
          @accuracy : Types::PositionalAccuracy? = nil,
          @device_id : String? = nil,
          @position_properties : Hash(String, String)? = nil
        )
        end
      end


      struct GetGeofenceRequest
        include JSON::Serializable

        # The geofence collection storing the target geofence.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # The geofence you're retrieving details for.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        def initialize(
          @collection_name : String,
          @geofence_id : String
        )
        end
      end


      struct GetGeofenceResponse
        include JSON::Serializable

        # The timestamp for when the geofence collection was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The geofence identifier.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        # Contains the geofence geometry details describing the position of the geofence. Can be a circle, a
        # polygon, or a multipolygon.

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::GeofenceGeometry

        # Identifies the state of the geofence. A geofence will hold one of the following states: ACTIVE — The
        # geofence has been indexed by the system. PENDING — The geofence is being processed by the system.
        # FAILED — The geofence failed to be indexed by the system. DELETED — The geofence has been deleted
        # from the system index. DELETING — The geofence is being deleted from the system index.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp for when the geofence collection was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # User defined properties of the geofence. A property is a key-value pair stored with the geofence and
        # added to any geofence event triggered with that geofence. Format: "key" : "value"

        @[JSON::Field(key: "GeofenceProperties")]
        getter geofence_properties : Hash(String, String)?

        def initialize(
          @create_time : Time,
          @geofence_id : String,
          @geometry : Types::GeofenceGeometry,
          @status : String,
          @update_time : Time,
          @geofence_properties : Hash(String, String)? = nil
        )
        end
      end


      struct GetMapGlyphsRequest
        include JSON::Serializable

        # A comma-separated list of fonts to load glyphs from in order of preference. For example, Noto Sans
        # Regular, Arial Unicode . Valid font stacks for Esri styles: VectorEsriDarkGrayCanvas – Ubuntu Medium
        # Italic | Ubuntu Medium | Ubuntu Italic | Ubuntu Regular | Ubuntu Bold VectorEsriLightGrayCanvas –
        # Ubuntu Italic | Ubuntu Regular | Ubuntu Light | Ubuntu Bold VectorEsriTopographic – Noto Sans Italic
        # | Noto Sans Regular | Noto Sans Bold | Noto Serif Regular | Roboto Condensed Light Italic
        # VectorEsriStreets – Arial Regular | Arial Italic | Arial Bold VectorEsriNavigation – Arial Regular |
        # Arial Italic | Arial Bold Valid font stacks for HERE Technologies styles: VectorHereContrast – Fira
        # GO Regular | Fira GO Bold VectorHereExplore, VectorHereExploreTruck, HybridHereExploreSatellite –
        # Fira GO Italic | Fira GO Map | Fira GO Map Bold | Noto Sans CJK JP Bold | Noto Sans CJK JP Light |
        # Noto Sans CJK JP Regular Valid font stacks for GrabMaps styles: VectorGrabStandardLight,
        # VectorGrabStandardDark – Noto Sans Regular | Noto Sans Medium | Noto Sans Bold Valid font stacks for
        # Open Data styles: VectorOpenDataStandardLight, VectorOpenDataStandardDark,
        # VectorOpenDataVisualizationLight, VectorOpenDataVisualizationDark – Amazon Ember Regular,Noto Sans
        # Regular | Amazon Ember Bold,Noto Sans Bold | Amazon Ember Medium,Noto Sans Medium | Amazon Ember
        # Regular Italic,Noto Sans Italic | Amazon Ember Condensed RC Regular,Noto Sans Regular | Amazon Ember
        # Condensed RC Bold,Noto Sans Bold | Amazon Ember Regular,Noto Sans Regular,Noto Sans Arabic Regular |
        # Amazon Ember Condensed RC Bold,Noto Sans Bold,Noto Sans Arabic Condensed Bold | Amazon Ember
        # Bold,Noto Sans Bold,Noto Sans Arabic Bold | Amazon Ember Regular Italic,Noto Sans Italic,Noto Sans
        # Arabic Regular | Amazon Ember Condensed RC Regular,Noto Sans Regular,Noto Sans Arabic Condensed
        # Regular | Amazon Ember Medium,Noto Sans Medium,Noto Sans Arabic Medium The fonts used by the Open
        # Data map styles are combined fonts that use Amazon Ember for most glyphs but Noto Sans for glyphs
        # unsupported by Amazon Ember .

        @[JSON::Field(key: "FontStack")]
        getter font_stack : String

        # A Unicode range of characters to download glyphs for. Each response will contain 256 characters. For
        # example, 0–255 includes all characters from range U+0000 to 00FF . Must be aligned to multiples of
        # 256.

        @[JSON::Field(key: "FontUnicodeRange")]
        getter font_unicode_range : String

        # The map resource associated with the glyph ﬁle.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @font_stack : String,
          @font_unicode_range : String,
          @map_name : String,
          @key : String? = nil
        )
        end
      end


      struct GetMapGlyphsResponse
        include JSON::Serializable

        # The glyph, as binary blob.

        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # The HTTP Cache-Control directive for the value.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The map glyph content type. For example, application/octet-stream .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil
        )
        end
      end


      struct GetMapSpritesRequest
        include JSON::Serializable

        # The name of the sprite ﬁle. Use the following ﬁle names for the sprite sheet: sprites.png
        # sprites@2x.png for high pixel density displays For the JSON document containing image offsets. Use
        # the following ﬁle names: sprites.json sprites@2x.json for high pixel density displays

        @[JSON::Field(key: "FileName")]
        getter file_name : String

        # The map resource associated with the sprite ﬁle.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @file_name : String,
          @map_name : String,
          @key : String? = nil
        )
        end
      end


      struct GetMapSpritesResponse
        include JSON::Serializable

        # Contains the body of the sprite sheet or JSON offset ﬁle.

        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # The HTTP Cache-Control directive for the value.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The content type of the sprite sheet and offsets. For example, the sprite sheet content type is
        # image/png , and the sprite offset JSON document is application/json .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil
        )
        end
      end


      struct GetMapStyleDescriptorRequest
        include JSON::Serializable

        # The map resource to retrieve the style descriptor from.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @map_name : String,
          @key : String? = nil
        )
        end
      end


      struct GetMapStyleDescriptorResponse
        include JSON::Serializable

        # Contains the body of the style descriptor.

        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # The HTTP Cache-Control directive for the value.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The style descriptor's content type. For example, application/json .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil
        )
        end
      end


      struct GetMapTileRequest
        include JSON::Serializable

        # The map resource to retrieve the map tiles from.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # The X axis value for the map tile.

        @[JSON::Field(key: "X")]
        getter x : String

        # The Y axis value for the map tile.

        @[JSON::Field(key: "Y")]
        getter y : String

        # The zoom value for the map tile.

        @[JSON::Field(key: "Z")]
        getter z : String

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @map_name : String,
          @x : String,
          @y : String,
          @z : String,
          @key : String? = nil
        )
        end
      end


      struct GetMapTileResponse
        include JSON::Serializable

        # Contains Mapbox Vector Tile (MVT) data.

        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # The HTTP Cache-Control directive for the value.

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # The map tile's content type. For example, application/vnd.mapbox-vector-tile .

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil
        )
        end
      end


      struct GetPlaceRequest
        include JSON::Serializable

        # The name of the place index resource that you want to use for the search.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The identifier of the place to find.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The preferred language used to return results. The value must be a valid BCP 47 language tag, for
        # example, en for English. This setting affects the languages used in the results, but not the results
        # themselves. If no language is specified, or not supported for a particular result, the partner
        # automatically chooses a language for the result. For an example, we'll use the Greek language. You
        # search for a location around Athens, Greece, with the language parameter set to en . The city in the
        # results will most likely be returned as Athens . If you set the language parameter to el , for
        # Greek, then the city in the results will more likely be returned as Αθήνα . If the data provider
        # does not have a value for Greek, the result will be in a language that the provider does support.

        @[JSON::Field(key: "language")]
        getter language : String?

        def initialize(
          @index_name : String,
          @place_id : String,
          @key : String? = nil,
          @language : String? = nil
        )
        end
      end


      struct GetPlaceResponse
        include JSON::Serializable

        # Details about the result, such as its address and position.

        @[JSON::Field(key: "Place")]
        getter place : Types::Place

        def initialize(
          @place : Types::Place
        )
        end
      end

      # The inferred state of the device, given the provided position, IP address, cellular signals, and
      # Wi-Fi- access points.

      struct InferredState
        include JSON::Serializable

        # Indicates if a proxy was used.

        @[JSON::Field(key: "ProxyDetected")]
        getter proxy_detected : Bool

        # The level of certainty of the inferred position.

        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Types::PositionalAccuracy?

        # The distance between the inferred position and the device's self-reported position.

        @[JSON::Field(key: "DeviationDistance")]
        getter deviation_distance : Float64?

        # The device position inferred by the provided position, IP address, cellular signals, and Wi-Fi-
        # access points.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        def initialize(
          @proxy_detected : Bool,
          @accuracy : Types::PositionalAccuracy? = nil,
          @deviation_distance : Float64? = nil,
          @position : Array(Float64)? = nil
        )
        end
      end

      # The request has failed to process because of an unknown server error, exception, or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains the calculated route's details for each path between a pair of positions. The number of
      # legs returned corresponds to one fewer than the total number of positions in the request. For
      # example, a route with a departure position and destination position returns one leg with the
      # positions snapped to a nearby road : The StartPosition is the departure position. The EndPosition is
      # the destination position. A route with a waypoint between the departure and destination position
      # returns two legs with the positions snapped to a nearby road: Leg 1: The StartPosition is the
      # departure position . The EndPosition is the waypoint positon. Leg 2: The StartPosition is the
      # waypoint position. The EndPosition is the destination position.

      struct Leg
        include JSON::Serializable

        # The distance between the leg's StartPosition and EndPosition along a calculated route. The default
        # measurement is Kilometers unless the request specifies a DistanceUnit of Miles .

        @[JSON::Field(key: "Distance")]
        getter distance : Float64

        # The estimated travel time between the leg's StartPosition and EndPosition . The travel mode and
        # departure time that you specify in the request determines the calculated time.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Float64

        # The terminating position of the leg. Follows the format [longitude,latitude] . If the EndPosition
        # isn't located on a road, it's snapped to a nearby road .

        @[JSON::Field(key: "EndPosition")]
        getter end_position : Array(Float64)

        # The starting position of the leg. Follows the format [longitude,latitude] . If the StartPosition
        # isn't located on a road, it's snapped to a nearby road .

        @[JSON::Field(key: "StartPosition")]
        getter start_position : Array(Float64)

        # Contains a list of steps, which represent subsections of a leg. Each step provides instructions for
        # how to move to the next step in the leg such as the step's start position, end position, travel
        # distance, travel duration, and geometry offset.

        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::Step)

        # Contains the calculated route's path as a linestring geometry.

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::LegGeometry?

        def initialize(
          @distance : Float64,
          @duration_seconds : Float64,
          @end_position : Array(Float64),
          @start_position : Array(Float64),
          @steps : Array(Types::Step),
          @geometry : Types::LegGeometry? = nil
        )
        end
      end

      # Contains the geometry details for each path between a pair of positions. Used in plotting a route
      # leg on a map.

      struct LegGeometry
        include JSON::Serializable

        # An ordered list of positions used to plot a route on a map. The first position is closest to the
        # start position for the leg, and the last position is the closest to the end position for the leg.
        # For example, [[-123.117, 49.284],[-123.115, 49.285],[-123.115, 49.285]]

        @[JSON::Field(key: "LineString")]
        getter line_string : Array(Array(Float64))?

        def initialize(
          @line_string : Array(Array(Float64))? = nil
        )
        end
      end


      struct ListDevicePositionsRequest
        include JSON::Serializable

        # The tracker resource containing the requested devices.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # The geometry used to filter device positions.

        @[JSON::Field(key: "FilterGeometry")]
        getter filter_geometry : Types::TrackingFilterGeometry?

        # An optional limit for the number of entries returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @tracker_name : String,
          @filter_geometry : Types::TrackingFilterGeometry? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDevicePositionsResponse
        include JSON::Serializable

        # Contains details about each device's last known position.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListDevicePositionsResponseEntry)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListDevicePositionsResponseEntry),
          @next_token : String? = nil
        )
        end
      end

      # Contains the tracker resource details.

      struct ListDevicePositionsResponseEntry
        include JSON::Serializable

        # The ID of the device for this position.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The last known device position. Empty if no positions currently stored.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The timestamp at which the device position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time

        # The accuracy of the device position.

        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Types::PositionalAccuracy?

        # The properties associated with the position.

        @[JSON::Field(key: "PositionProperties")]
        getter position_properties : Hash(String, String)?

        def initialize(
          @device_id : String,
          @position : Array(Float64),
          @sample_time : Time,
          @accuracy : Types::PositionalAccuracy? = nil,
          @position_properties : Hash(String, String)? = nil
        )
        end
      end


      struct ListGeofenceCollectionsRequest
        include JSON::Serializable

        # An optional limit for the number of resources returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGeofenceCollectionsResponse
        include JSON::Serializable

        # Lists the geofence collections that exist in your Amazon Web Services account.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListGeofenceCollectionsResponseEntry)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListGeofenceCollectionsResponseEntry),
          @next_token : String? = nil
        )
        end
      end

      # Contains the geofence collection details. The returned geometry will always match the geometry
      # format used when the geofence was created.

      struct ListGeofenceCollectionsResponseEntry
        include JSON::Serializable

        # The name of the geofence collection.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # The timestamp for when the geofence collection was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The description for the geofence collection

        @[JSON::Field(key: "Description")]
        getter description : String

        # Specifies a timestamp for when the resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # No longer used. Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # No longer used. Always returns an empty string.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        def initialize(
          @collection_name : String,
          @create_time : Time,
          @description : String,
          @update_time : Time,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil
        )
        end
      end

      # Contains a list of geofences stored in a given geofence collection. The returned geometry will
      # always match the geometry format used when the geofence was created.

      struct ListGeofenceResponseEntry
        include JSON::Serializable

        # The timestamp for when the geofence was stored in a geofence collection in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The geofence identifier.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        # Contains the geofence geometry details describing the position of the geofence. Can be a circle, a
        # polygon, or a multipolygon.

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::GeofenceGeometry

        # Identifies the state of the geofence. A geofence will hold one of the following states: ACTIVE — The
        # geofence has been indexed by the system. PENDING — The geofence is being processed by the system.
        # FAILED — The geofence failed to be indexed by the system. DELETED — The geofence has been deleted
        # from the system index. DELETING — The geofence is being deleted from the system index.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp for when the geofence was last updated in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # User defined properties of the geofence. A property is a key-value pair stored with the geofence and
        # added to any geofence event triggered with that geofence. Format: "key" : "value"

        @[JSON::Field(key: "GeofenceProperties")]
        getter geofence_properties : Hash(String, String)?

        def initialize(
          @create_time : Time,
          @geofence_id : String,
          @geometry : Types::GeofenceGeometry,
          @status : String,
          @update_time : Time,
          @geofence_properties : Hash(String, String)? = nil
        )
        end
      end


      struct ListGeofencesRequest
        include JSON::Serializable

        # The name of the geofence collection storing the list of geofences.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # An optional limit for the number of geofences returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @collection_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGeofencesResponse
        include JSON::Serializable

        # Contains a list of geofences stored in the geofence collection.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListGeofenceResponseEntry)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListGeofenceResponseEntry),
          @next_token : String? = nil
        )
        end
      end


      struct ListKeysRequest
        include JSON::Serializable

        # Optionally filter the list to only Active or Expired API keys.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ApiKeyFilter?

        # An optional limit for the number of resources returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ApiKeyFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListKeysResponse
        include JSON::Serializable

        # Contains API key resources in your Amazon Web Services account. Details include API key name,
        # allowed referers and timestamp for when the API key will expire.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListKeysResponseEntry)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListKeysResponseEntry),
          @next_token : String? = nil
        )
        end
      end

      # An API key resource listed in your Amazon Web Services account.

      struct ListKeysResponseEntry
        include JSON::Serializable

        # The timestamp of when the API key was created, in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The timestamp for when the API key resource will expire, in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "ExpireTime")]
        getter expire_time : Time

        # The name of the API key resource.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String


        @[JSON::Field(key: "Restrictions")]
        getter restrictions : Types::ApiKeyRestrictions

        # The timestamp of when the API key was last updated, in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # The optional description for the API key resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @create_time : Time,
          @expire_time : Time,
          @key_name : String,
          @restrictions : Types::ApiKeyRestrictions,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end


      struct ListMapsRequest
        include JSON::Serializable

        # An optional limit for the number of resources returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMapsResponse
        include JSON::Serializable

        # Contains a list of maps in your Amazon Web Services account

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListMapsResponseEntry)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListMapsResponseEntry),
          @next_token : String? = nil
        )
        end
      end

      # Contains details of an existing map resource in your Amazon Web Services account.

      struct ListMapsResponseEntry
        include JSON::Serializable

        # The timestamp for when the map resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # Specifies the data provider for the associated map tiles.

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The description for the map resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the associated map resource.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # The timestamp for when the map resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # No longer used. Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        def initialize(
          @create_time : Time,
          @data_source : String,
          @description : String,
          @map_name : String,
          @update_time : Time,
          @pricing_plan : String? = nil
        )
        end
      end


      struct ListPlaceIndexesRequest
        include JSON::Serializable

        # An optional limit for the maximum number of results returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPlaceIndexesResponse
        include JSON::Serializable

        # Lists the place index resources that exist in your Amazon Web Services account

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListPlaceIndexesResponseEntry)

        # A pagination token indicating that there are additional pages available. You can use the token in a
        # new request to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListPlaceIndexesResponseEntry),
          @next_token : String? = nil
        )
        end
      end

      # A place index resource listed in your Amazon Web Services account.

      struct ListPlaceIndexesResponseEntry
        include JSON::Serializable

        # The timestamp for when the place index resource was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The data provider of geospatial data. Values can be one of the following: Esri Grab Here For more
        # information about data providers, see Amazon Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The optional description for the place index resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the place index resource.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The timestamp for when the place index resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # No longer used. Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        def initialize(
          @create_time : Time,
          @data_source : String,
          @description : String,
          @index_name : String,
          @update_time : Time,
          @pricing_plan : String? = nil
        )
        end
      end


      struct ListRouteCalculatorsRequest
        include JSON::Serializable

        # An optional maximum number of results returned in a single call. Default Value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default Value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRouteCalculatorsResponse
        include JSON::Serializable

        # Lists the route calculator resources that exist in your Amazon Web Services account

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListRouteCalculatorsResponseEntry)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # subsequent request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListRouteCalculatorsResponseEntry),
          @next_token : String? = nil
        )
        end
      end

      # A route calculator resource listed in your Amazon Web Services account.

      struct ListRouteCalculatorsResponseEntry
        include JSON::Serializable

        # The name of the route calculator resource.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # The timestamp when the route calculator resource was created in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ . For example, 2020–07-2T12:15:20.000Z+01:00

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The data provider of traffic and road network data. Indicates one of the available providers: Esri
        # Grab Here For more information about data providers, see Amazon Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The optional description of the route calculator resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The timestamp when the route calculator resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ . For example, 2020–07-2T12:15:20.000Z+01:00

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        def initialize(
          @calculator_name : String,
          @create_time : Time,
          @data_source : String,
          @description : String,
          @update_time : Time,
          @pricing_plan : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve. Format example:
        # arn:aws:geo:region:account-id:resourcetype/ExampleResource

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Tags that have been applied to the specified resource. Tags are mapped from the tag key to the tag
        # value: "TagKey" : "TagValue" . Format example: {"tag1" : "value1", "tag2" : "value2"}

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTrackerConsumersRequest
        include JSON::Serializable

        # The tracker resource whose associated geofence collections you want to list.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # An optional limit for the number of resources returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @tracker_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTrackerConsumersResponse
        include JSON::Serializable

        # Contains the list of geofence collection ARNs associated to the tracker resource.

        @[JSON::Field(key: "ConsumerArns")]
        getter consumer_arns : Array(String)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @consumer_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListTrackersRequest
        include JSON::Serializable

        # An optional limit for the number of resources returned in a single call. Default value: 100

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token specifying which page of results to return in the response. If no token is
        # provided, the default page is the first page. Default value: null

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTrackersResponse
        include JSON::Serializable

        # Contains tracker resources in your Amazon Web Services account. Details include tracker name,
        # description and timestamps for when the tracker was created and last updated.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ListTrackersResponseEntry)

        # A pagination token indicating there are additional pages available. You can use the token in a
        # following request to fetch the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entries : Array(Types::ListTrackersResponseEntry),
          @next_token : String? = nil
        )
        end
      end

      # Contains the tracker resource details.

      struct ListTrackersResponseEntry
        include JSON::Serializable

        # The timestamp for when the tracker resource was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ
        # .

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The description for the tracker resource.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the tracker resource.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # The timestamp at which the device's position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        # Always returns RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # No longer used. Always returns an empty string.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        def initialize(
          @create_time : Time,
          @description : String,
          @tracker_name : String,
          @update_time : Time,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil
        )
        end
      end

      # Details about the Long-Term Evolution (LTE) network.

      struct LteCellDetails
        include JSON::Serializable

        # The E-UTRAN Cell Identifier (ECI).

        @[JSON::Field(key: "CellId")]
        getter cell_id : Int32

        # The Mobile Country Code (MCC).

        @[JSON::Field(key: "Mcc")]
        getter mcc : Int32

        # The Mobile Network Code (MNC)

        @[JSON::Field(key: "Mnc")]
        getter mnc : Int32

        # The LTE local identification information (local ID).

        @[JSON::Field(key: "LocalId")]
        getter local_id : Types::LteLocalId?

        # The network measurements.

        @[JSON::Field(key: "NetworkMeasurements")]
        getter network_measurements : Array(Types::LteNetworkMeasurements)?

        # Indicates whether the LTE object is capable of supporting NR (new radio).

        @[JSON::Field(key: "NrCapable")]
        getter nr_capable : Bool?

        # Signal power of the reference signal received, measured in decibel-milliwatts (dBm).

        @[JSON::Field(key: "Rsrp")]
        getter rsrp : Int32?

        # Signal quality of the reference Signal received, measured in decibels (dB).

        @[JSON::Field(key: "Rsrq")]
        getter rsrq : Float64?

        # LTE Tracking Area Code (TAC).

        @[JSON::Field(key: "Tac")]
        getter tac : Int32?

        # Timing Advance (TA).

        @[JSON::Field(key: "TimingAdvance")]
        getter timing_advance : Int32?

        def initialize(
          @cell_id : Int32,
          @mcc : Int32,
          @mnc : Int32,
          @local_id : Types::LteLocalId? = nil,
          @network_measurements : Array(Types::LteNetworkMeasurements)? = nil,
          @nr_capable : Bool? = nil,
          @rsrp : Int32? = nil,
          @rsrq : Float64? = nil,
          @tac : Int32? = nil,
          @timing_advance : Int32? = nil
        )
        end
      end

      # LTE local identification information (local ID).

      struct LteLocalId
        include JSON::Serializable

        # E-UTRA (Evolved Universal Terrestrial Radio Access) absolute radio frequency channel number
        # (EARFCN).

        @[JSON::Field(key: "Earfcn")]
        getter earfcn : Int32

        # Physical Cell ID (PCI).

        @[JSON::Field(key: "Pci")]
        getter pci : Int32

        def initialize(
          @earfcn : Int32,
          @pci : Int32
        )
        end
      end

      # LTE network measurements.

      struct LteNetworkMeasurements
        include JSON::Serializable

        # E-UTRAN Cell Identifier (ECI).

        @[JSON::Field(key: "CellId")]
        getter cell_id : Int32

        # E-UTRA (Evolved Universal Terrestrial Radio Access) absolute radio frequency channel number
        # (EARFCN).

        @[JSON::Field(key: "Earfcn")]
        getter earfcn : Int32

        # Physical Cell ID (PCI).

        @[JSON::Field(key: "Pci")]
        getter pci : Int32

        # Signal power of the reference signal received, measured in dBm (decibel-milliwatts).

        @[JSON::Field(key: "Rsrp")]
        getter rsrp : Int32?

        # Signal quality of the reference Signal received, measured in decibels (dB).

        @[JSON::Field(key: "Rsrq")]
        getter rsrq : Float64?

        def initialize(
          @cell_id : Int32,
          @earfcn : Int32,
          @pci : Int32,
          @rsrp : Int32? = nil,
          @rsrq : Float64? = nil
        )
        end
      end

      # Specifies the map tile style selected from an available provider.

      struct MapConfiguration
        include JSON::Serializable

        # Specifies the map style selected from an available data provider. Valid Esri map styles :
        # VectorEsriDarkGrayCanvas – The Esri Dark Gray Canvas map style. A vector basemap with a dark gray,
        # neutral background with minimal colors, labels, and features that's designed to draw attention to
        # your thematic content. RasterEsriImagery – The Esri Imagery map style. A raster basemap that
        # provides one meter or better satellite and aerial imagery in many parts of the world and lower
        # resolution satellite imagery worldwide. VectorEsriLightGrayCanvas – The Esri Light Gray Canvas map
        # style, which provides a detailed vector basemap with a light gray, neutral background style with
        # minimal colors, labels, and features that's designed to draw attention to your thematic content.
        # VectorEsriTopographic – The Esri Light map style, which provides a detailed vector basemap with a
        # classic Esri map style. VectorEsriStreets – The Esri Street Map style, which provides a detailed
        # vector basemap for the world symbolized with a classic Esri street map style. The vector tile layer
        # is similar in content and style to the World Street Map raster map. VectorEsriNavigation – The Esri
        # Navigation map style, which provides a detailed basemap for the world symbolized with a custom
        # navigation map style that's designed for use during the day in mobile devices. Valid HERE
        # Technologies map styles : VectorHereContrast – The HERE Contrast (Berlin) map style is a high
        # contrast detailed base map of the world that blends 3D and 2D rendering. The VectorHereContrast
        # style has been renamed from VectorHereBerlin . VectorHereBerlin has been deprecated, but will
        # continue to work in applications that use it. VectorHereExplore – A default HERE map style
        # containing a neutral, global map and its features including roads, buildings, landmarks, and water
        # features. It also now includes a fully designed map of Japan. VectorHereExploreTruck – A global map
        # containing truck restrictions and attributes (e.g. width / height / HAZMAT) symbolized with
        # highlighted segments and icons on top of HERE Explore to support use cases within transport and
        # logistics. RasterHereExploreSatellite – A global map containing high resolution satellite imagery.
        # HybridHereExploreSatellite – A global map displaying the road network, street names, and city labels
        # over satellite imagery. This style will automatically retrieve both raster and vector tiles, and
        # your charges will be based on total tiles retrieved. Hybrid styles use both vector and raster tiles
        # when rendering the map that you see. This means that more tiles are retrieved than when using either
        # vector or raster tiles alone. Your charges will include all tiles retrieved. Valid GrabMaps map
        # styles : VectorGrabStandardLight – The Grab Standard Light map style provides a basemap with
        # detailed land use coloring, area names, roads, landmarks, and points of interest covering Southeast
        # Asia. VectorGrabStandardDark – The Grab Standard Dark map style provides a dark variation of the
        # standard basemap covering Southeast Asia. Grab provides maps only for countries in Southeast Asia,
        # and is only available in the Asia Pacific (Singapore) Region ( ap-southeast-1 ). For more
        # information, see GrabMaps countries and area covered . Valid Open Data map styles :
        # VectorOpenDataStandardLight – The Open Data Standard Light map style provides a detailed basemap for
        # the world suitable for website and mobile application use. The map includes highways major roads,
        # minor roads, railways, water features, cities, parks, landmarks, building footprints, and
        # administrative boundaries. VectorOpenDataStandardDark – Open Data Standard Dark is a dark-themed map
        # style that provides a detailed basemap for the world suitable for website and mobile application
        # use. The map includes highways major roads, minor roads, railways, water features, cities, parks,
        # landmarks, building footprints, and administrative boundaries. VectorOpenDataVisualizationLight –
        # The Open Data Visualization Light map style is a light-themed style with muted colors and fewer
        # features that aids in understanding overlaid data. VectorOpenDataVisualizationDark – The Open Data
        # Visualization Dark map style is a dark-themed style with muted colors and fewer features that aids
        # in understanding overlaid data.

        @[JSON::Field(key: "Style")]
        getter style : String

        # Specifies the custom layers for the style. Leave unset to not enable any custom layer, or, for
        # styles that support custom layers, you can enable layer(s), such as POI layer for the
        # VectorEsriNavigation style. Default is unset . Not all map resources or styles support custom
        # layers. See Custom Layers for more information.

        @[JSON::Field(key: "CustomLayers")]
        getter custom_layers : Array(String)?

        # Specifies the political view for the style. Leave unset to not use a political view, or, for styles
        # that support specific political views, you can choose a view, such as IND for the Indian view.
        # Default is unset. Not all map resources or styles support political view styles. See Political views
        # for more information.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        def initialize(
          @style : String,
          @custom_layers : Array(String)? = nil,
          @political_view : String? = nil
        )
        end
      end

      # Specifies the political view for the style.

      struct MapConfigurationUpdate
        include JSON::Serializable

        # Specifies the custom layers for the style. Leave unset to not enable any custom layer, or, for
        # styles that support custom layers, you can enable layer(s), such as POI layer for the
        # VectorEsriNavigation style. Default is unset . Not all map resources or styles support custom
        # layers. See Custom Layers for more information.

        @[JSON::Field(key: "CustomLayers")]
        getter custom_layers : Array(String)?

        # Specifies the political view for the style. Set to an empty string to not use a political view, or,
        # for styles that support specific political views, you can choose a view, such as IND for the Indian
        # view. Not all map resources or styles support political view styles. See Political views for more
        # information.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        def initialize(
          @custom_layers : Array(String)? = nil,
          @political_view : String? = nil
        )
        end
      end

      # Contains details about addresses or points of interest that match the search criteria. Not all
      # details are included with all responses. Some details may only be returned by specific data
      # partners.

      struct Place
        include JSON::Serializable


        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::PlaceGeometry

        # The numerical portion of an address, such as a building number.

        @[JSON::Field(key: "AddressNumber")]
        getter address_number : String?

        # The Amazon Location categories that describe this Place. For more information about using
        # categories, including a list of Amazon Location categories, see Categories and filtering , in the
        # Amazon Location Service developer guide .

        @[JSON::Field(key: "Categories")]
        getter categories : Array(String)?

        # A country/region specified using ISO 3166 3-digit country/region code. For example, CAN .

        @[JSON::Field(key: "Country")]
        getter country : String?

        # True if the result is interpolated from other known places. False if the Place is a known place. Not
        # returned when the partner does not provide the information. For example, returns False for an
        # address location that is found in the partner data, but returns True if an address does not exist in
        # the partner data and its location is calculated by interpolating between other known addresses.

        @[JSON::Field(key: "Interpolated")]
        getter interpolated : Bool?

        # The full name and address of the point of interest such as a city, region, or country. For example,
        # 123 Any Street, Any Town, USA .

        @[JSON::Field(key: "Label")]
        getter label : String?

        # A name for a local area, such as a city or town name. For example, Toronto .

        @[JSON::Field(key: "Municipality")]
        getter municipality : String?

        # The name of a community district. For example, Downtown .

        @[JSON::Field(key: "Neighborhood")]
        getter neighborhood : String?

        # A group of numbers and letters in a country-specific format, which accompanies the address for the
        # purpose of identifying a location.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # A name for an area or geographical division, such as a province or state name. For example, British
        # Columbia .

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The name for a street or a road to identify a location. For example, Main Street .

        @[JSON::Field(key: "Street")]
        getter street : String?

        # An area that's part of a larger municipality. For example, Blissville is a submunicipality in the
        # Queen County in New York. This property supported by Esri and OpenData. The Esri property is
        # district , and the OpenData property is borough .

        @[JSON::Field(key: "SubMunicipality")]
        getter sub_municipality : String?

        # A county, or an area that's part of a larger region. For example, Metro Vancouver .

        @[JSON::Field(key: "SubRegion")]
        getter sub_region : String?

        # Categories from the data provider that describe the Place that are not mapped to any Amazon Location
        # categories.

        @[JSON::Field(key: "SupplementalCategories")]
        getter supplemental_categories : Array(String)?

        # The time zone in which the Place is located. Returned only when using HERE or Grab as the selected
        # partner.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : Types::TimeZone?

        # For addresses with multiple units, the unit identifier. Can include numbers and letters, for example
        # 3B or Unit 123 . Returned only for a place index that uses Esri or Grab as a data provider. Is not
        # returned for SearchPlaceIndexForPosition .

        @[JSON::Field(key: "UnitNumber")]
        getter unit_number : String?

        # For addresses with a UnitNumber , the type of unit. For example, Apartment . Returned only for a
        # place index that uses Esri as a data provider.

        @[JSON::Field(key: "UnitType")]
        getter unit_type : String?

        def initialize(
          @geometry : Types::PlaceGeometry,
          @address_number : String? = nil,
          @categories : Array(String)? = nil,
          @country : String? = nil,
          @interpolated : Bool? = nil,
          @label : String? = nil,
          @municipality : String? = nil,
          @neighborhood : String? = nil,
          @postal_code : String? = nil,
          @region : String? = nil,
          @street : String? = nil,
          @sub_municipality : String? = nil,
          @sub_region : String? = nil,
          @supplemental_categories : Array(String)? = nil,
          @time_zone : Types::TimeZone? = nil,
          @unit_number : String? = nil,
          @unit_type : String? = nil
        )
        end
      end

      # Places uses a point geometry to specify a location or a Place.

      struct PlaceGeometry
        include JSON::Serializable

        # A single point geometry specifies a location for a Place using WGS 84 coordinates: x — Specifies the
        # x coordinate or longitude. y — Specifies the y coordinate or latitude.

        @[JSON::Field(key: "Point")]
        getter point : Array(Float64)?

        def initialize(
          @point : Array(Float64)? = nil
        )
        end
      end

      # Defines the level of certainty of the position.

      struct PositionalAccuracy
        include JSON::Serializable

        # Estimated maximum distance, in meters, between the measured position and the true position of a
        # device, along the Earth's surface.

        @[JSON::Field(key: "Horizontal")]
        getter horizontal : Float64

        def initialize(
          @horizontal : Float64
        )
        end
      end


      struct PutGeofenceRequest
        include JSON::Serializable

        # The geofence collection to store the geofence in.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # An identifier for the geofence. For example, ExampleGeofence-1 .

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        # Contains the details to specify the position of the geofence. Can be a circle, a polygon, or a
        # multipolygon. Polygon and MultiPolygon geometries can be defined using their respective parameters,
        # or encoded in Geobuf format using the Geobuf parameter. Including multiple geometry types in the
        # same request will return a validation error. The geofence Polygon and MultiPolygon formats support a
        # maximum of 1,000 total vertices. The Geobuf format supports a maximum of 100,000 vertices.

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::GeofenceGeometry

        # Associates one of more properties with the geofence. A property is a key-value pair stored with the
        # geofence and added to any geofence event triggered with that geofence. Format: "key" : "value"

        @[JSON::Field(key: "GeofenceProperties")]
        getter geofence_properties : Hash(String, String)?

        def initialize(
          @collection_name : String,
          @geofence_id : String,
          @geometry : Types::GeofenceGeometry,
          @geofence_properties : Hash(String, String)? = nil
        )
        end
      end


      struct PutGeofenceResponse
        include JSON::Serializable

        # The timestamp for when the geofence was created in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time

        # The geofence identifier entered in the request.

        @[JSON::Field(key: "GeofenceId")]
        getter geofence_id : String

        # The timestamp for when the geofence was last updated in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @create_time : Time,
          @geofence_id : String,
          @update_time : Time
        )
        end
      end

      # The resource that you've entered was not found in your AWS account.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The result for the calculated route of one DeparturePosition DestinationPosition pair.

      struct RouteMatrixEntry
        include JSON::Serializable

        # The total distance of travel for the route.

        @[JSON::Field(key: "Distance")]
        getter distance : Float64?

        # The expected duration of travel for the route.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Float64?

        # An error corresponding to the calculation of a route between the DeparturePosition and
        # DestinationPosition .

        @[JSON::Field(key: "Error")]
        getter error : Types::RouteMatrixEntryError?

        def initialize(
          @distance : Float64? = nil,
          @duration_seconds : Float64? = nil,
          @error : Types::RouteMatrixEntryError? = nil
        )
        end
      end

      # An error corresponding to the calculation of a route between the DeparturePosition and
      # DestinationPosition . The error code can be one of the following: RouteNotFound - Unable to find a
      # valid route with the given parameters. RouteTooLong - Route calculation went beyond the maximum size
      # of a route and was terminated before completion. PositionsNotFound - One or more of the input
      # positions were not found on the route network. DestinationPositionNotFound - The destination
      # position was not found on the route network. DeparturePositionNotFound - The departure position was
      # not found on the route network. OtherValidationError - The given inputs were not valid or a route
      # was not found. More information is given in the error Message

      struct RouteMatrixEntryError
        include JSON::Serializable

        # The type of error which occurred for the route calculation.

        @[JSON::Field(key: "Code")]
        getter code : String

        # A message about the error that occurred for the route calculation.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String,
          @message : String? = nil
        )
        end
      end

      # Contains a search result from a position search query that is run on a place index resource.

      struct SearchForPositionResult
        include JSON::Serializable

        # The distance in meters of a great-circle arc between the query position and the result. A
        # great-circle arc is the shortest path on a sphere, in this case the Earth. This returns the shortest
        # distance between two locations.

        @[JSON::Field(key: "Distance")]
        getter distance : Float64

        # Details about the search result, such as its address and position.

        @[JSON::Field(key: "Place")]
        getter place : Types::Place

        # The unique identifier of the place. You can use this with the GetPlace operation to find the place
        # again later. For SearchPlaceIndexForPosition operations, the PlaceId is returned only by place
        # indexes that use HERE or Grab as a data provider.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String?

        def initialize(
          @distance : Float64,
          @place : Types::Place,
          @place_id : String? = nil
        )
        end
      end

      # Contains a place suggestion resulting from a place suggestion query that is run on a place index
      # resource.

      struct SearchForSuggestionsResult
        include JSON::Serializable

        # The text of the place suggestion, typically formatted as an address string.

        @[JSON::Field(key: "Text")]
        getter text : String

        # The Amazon Location categories that describe the Place. For more information about using categories,
        # including a list of Amazon Location categories, see Categories and filtering , in the Amazon
        # Location Service developer guide .

        @[JSON::Field(key: "Categories")]
        getter categories : Array(String)?

        # The unique identifier of the Place. You can use this with the GetPlace operation to find the place
        # again later, or to get full information for the Place. The GetPlace request must use the same
        # PlaceIndex resource as the SearchPlaceIndexForSuggestions that generated the Place ID. For
        # SearchPlaceIndexForSuggestions operations, the PlaceId is returned by place indexes that use Esri,
        # Grab, or HERE as data providers.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String?

        # Categories from the data provider that describe the Place that are not mapped to any Amazon Location
        # categories.

        @[JSON::Field(key: "SupplementalCategories")]
        getter supplemental_categories : Array(String)?

        def initialize(
          @text : String,
          @categories : Array(String)? = nil,
          @place_id : String? = nil,
          @supplemental_categories : Array(String)? = nil
        )
        end
      end

      # Contains a search result from a text search query that is run on a place index resource.

      struct SearchForTextResult
        include JSON::Serializable

        # Details about the search result, such as its address and position.

        @[JSON::Field(key: "Place")]
        getter place : Types::Place

        # The distance in meters of a great-circle arc between the bias position specified and the result.
        # Distance will be returned only if a bias position was specified in the query. A great-circle arc is
        # the shortest path on a sphere, in this case the Earth. This returns the shortest distance between
        # two locations.

        @[JSON::Field(key: "Distance")]
        getter distance : Float64?

        # The unique identifier of the place. You can use this with the GetPlace operation to find the place
        # again later. For SearchPlaceIndexForText operations, the PlaceId is returned only by place indexes
        # that use HERE or Grab as a data provider.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String?

        # The relative confidence in the match for a result among the results returned. For example, if more
        # fields for an address match (including house number, street, city, country/region, and postal code),
        # the relevance score is closer to 1. Returned only when the partner selected is Esri or Grab.

        @[JSON::Field(key: "Relevance")]
        getter relevance : Float64?

        def initialize(
          @place : Types::Place,
          @distance : Float64? = nil,
          @place_id : String? = nil,
          @relevance : Float64? = nil
        )
        end
      end


      struct SearchPlaceIndexForPositionRequest
        include JSON::Serializable

        # The name of the place index resource you want to use for the search.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # Specifies the longitude and latitude of the position to query. This parameter must contain a pair of
        # numbers. The first number represents the X coordinate, or longitude; the second number represents
        # the Y coordinate, or latitude. For example, [-123.1174, 49.2847] represents a position with
        # longitude -123.1174 and latitude 49.2847 .

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The preferred language used to return results. The value must be a valid BCP 47 language tag, for
        # example, en for English. This setting affects the languages used in the results, but not the results
        # themselves. If no language is specified, or not supported for a particular result, the partner
        # automatically chooses a language for the result. For an example, we'll use the Greek language. You
        # search for a location around Athens, Greece, with the language parameter set to en . The city in the
        # results will most likely be returned as Athens . If you set the language parameter to el , for
        # Greek, then the city in the results will more likely be returned as Αθήνα . If the data provider
        # does not have a value for Greek, the result will be in a language that the provider does support.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional parameter. The maximum number of results returned per request. Default value: 50

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @index_name : String,
          @position : Array(Float64),
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil
        )
        end
      end


      struct SearchPlaceIndexForPositionResponse
        include JSON::Serializable

        # Returns a list of Places closest to the specified position. Each result contains additional
        # information about the Places returned.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::SearchForPositionResult)

        # Contains a summary of the request. Echoes the input values for Position , Language , MaxResults ,
        # and the DataSource of the place index.

        @[JSON::Field(key: "Summary")]
        getter summary : Types::SearchPlaceIndexForPositionSummary

        def initialize(
          @results : Array(Types::SearchForPositionResult),
          @summary : Types::SearchPlaceIndexForPositionSummary
        )
        end
      end

      # A summary of the request sent by using SearchPlaceIndexForPosition .

      struct SearchPlaceIndexForPositionSummary
        include JSON::Serializable

        # The geospatial data provider attached to the place index resource specified in the request. Values
        # can be one of the following: Esri Grab Here For more information about data providers, see Amazon
        # Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The position specified in the request.

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The preferred language used to return results. Matches the language in the request. The value is a
        # valid BCP 47 language tag, for example, en for English.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # Contains the optional result count limit that is specified in the request. Default value: 50

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @data_source : String,
          @position : Array(Float64),
          @language : String? = nil,
          @max_results : Int32? = nil
        )
        end
      end


      struct SearchPlaceIndexForSuggestionsRequest
        include JSON::Serializable

        # The name of the place index resource you want to use for the search.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The free-form partial text to use to generate place suggestions. For example, eiffel tow .

        @[JSON::Field(key: "Text")]
        getter text : String

        # An optional parameter that indicates a preference for place suggestions that are closer to a
        # specified position. If provided, this parameter must contain a pair of numbers. The first number
        # represents the X coordinate, or longitude; the second number represents the Y coordinate, or
        # latitude. For example, [-123.1174, 49.2847] represents the position with longitude -123.1174 and
        # latitude 49.2847 . BiasPosition and FilterBBox are mutually exclusive. Specifying both options
        # results in an error.

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # An optional parameter that limits the search results by returning only suggestions within a
        # specified bounding box. If provided, this parameter must contain a total of four consecutive numbers
        # in two pairs. The first pair of numbers represents the X and Y coordinates (longitude and latitude,
        # respectively) of the southwest corner of the bounding box; the second pair of numbers represents the
        # X and Y coordinates (longitude and latitude, respectively) of the northeast corner of the bounding
        # box. For example, [-12.7935, -37.4835, -12.0684, -36.9542] represents a bounding box where the
        # southwest corner has longitude -12.7935 and latitude -37.4835 , and the northeast corner has
        # longitude -12.0684 and latitude -36.9542 . FilterBBox and BiasPosition are mutually exclusive.
        # Specifying both options results in an error.

        @[JSON::Field(key: "FilterBBox")]
        getter filter_b_box : Array(Float64)?

        # A list of one or more Amazon Location categories to filter the returned places. If you include more
        # than one category, the results will include results that match any of the categories listed. For
        # more information about using categories, including a list of Amazon Location categories, see
        # Categories and filtering , in the Amazon Location Service developer guide .

        @[JSON::Field(key: "FilterCategories")]
        getter filter_categories : Array(String)?

        # An optional parameter that limits the search results by returning only suggestions within the
        # provided list of countries. Use the ISO 3166 3-digit country code. For example, Australia uses three
        # upper-case characters: AUS .

        @[JSON::Field(key: "FilterCountries")]
        getter filter_countries : Array(String)?

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The preferred language used to return results. The value must be a valid BCP 47 language tag, for
        # example, en for English. This setting affects the languages used in the results. If no language is
        # specified, or not supported for a particular result, the partner automatically chooses a language
        # for the result. For an example, we'll use the Greek language. You search for Athens, Gr to get
        # suggestions with the language parameter set to en . The results found will most likely be returned
        # as Athens, Greece . If you set the language parameter to el , for Greek, then the result found will
        # more likely be returned as Αθήνα, Ελλάδα . If the data provider does not have a value for Greek, the
        # result will be in a language that the provider does support.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional parameter. The maximum number of results returned per request. The default: 5

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @index_name : String,
          @text : String,
          @bias_position : Array(Float64)? = nil,
          @filter_b_box : Array(Float64)? = nil,
          @filter_categories : Array(String)? = nil,
          @filter_countries : Array(String)? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil
        )
        end
      end


      struct SearchPlaceIndexForSuggestionsResponse
        include JSON::Serializable

        # A list of place suggestions that best match the search text.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::SearchForSuggestionsResult)

        # Contains a summary of the request. Echoes the input values for BiasPosition , FilterBBox ,
        # FilterCountries , Language , MaxResults , and Text . Also includes the DataSource of the place
        # index.

        @[JSON::Field(key: "Summary")]
        getter summary : Types::SearchPlaceIndexForSuggestionsSummary

        def initialize(
          @results : Array(Types::SearchForSuggestionsResult),
          @summary : Types::SearchPlaceIndexForSuggestionsSummary
        )
        end
      end

      # A summary of the request sent by using SearchPlaceIndexForSuggestions .

      struct SearchPlaceIndexForSuggestionsSummary
        include JSON::Serializable

        # The geospatial data provider attached to the place index resource specified in the request. Values
        # can be one of the following: Esri Grab Here For more information about data providers, see Amazon
        # Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The free-form partial text input specified in the request.

        @[JSON::Field(key: "Text")]
        getter text : String

        # Contains the coordinates for the optional bias position specified in the request. This parameter
        # contains a pair of numbers. The first number represents the X coordinate, or longitude; the second
        # number represents the Y coordinate, or latitude. For example, [-123.1174, 49.2847] represents the
        # position with longitude -123.1174 and latitude 49.2847 .

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # Contains the coordinates for the optional bounding box specified in the request.

        @[JSON::Field(key: "FilterBBox")]
        getter filter_b_box : Array(Float64)?

        # The optional category filter specified in the request.

        @[JSON::Field(key: "FilterCategories")]
        getter filter_categories : Array(String)?

        # Contains the optional country filter specified in the request.

        @[JSON::Field(key: "FilterCountries")]
        getter filter_countries : Array(String)?

        # The preferred language used to return results. Matches the language in the request. The value is a
        # valid BCP 47 language tag, for example, en for English.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # Contains the optional result count limit specified in the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @data_source : String,
          @text : String,
          @bias_position : Array(Float64)? = nil,
          @filter_b_box : Array(Float64)? = nil,
          @filter_categories : Array(String)? = nil,
          @filter_countries : Array(String)? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil
        )
        end
      end


      struct SearchPlaceIndexForTextRequest
        include JSON::Serializable

        # The name of the place index resource you want to use for the search.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The address, name, city, or region to be used in the search in free-form text format. For example,
        # 123 Any Street .

        @[JSON::Field(key: "Text")]
        getter text : String

        # An optional parameter that indicates a preference for places that are closer to a specified
        # position. If provided, this parameter must contain a pair of numbers. The first number represents
        # the X coordinate, or longitude; the second number represents the Y coordinate, or latitude. For
        # example, [-123.1174, 49.2847] represents the position with longitude -123.1174 and latitude 49.2847
        # . BiasPosition and FilterBBox are mutually exclusive. Specifying both options results in an error.

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # An optional parameter that limits the search results by returning only places that are within the
        # provided bounding box. If provided, this parameter must contain a total of four consecutive numbers
        # in two pairs. The first pair of numbers represents the X and Y coordinates (longitude and latitude,
        # respectively) of the southwest corner of the bounding box; the second pair of numbers represents the
        # X and Y coordinates (longitude and latitude, respectively) of the northeast corner of the bounding
        # box. For example, [-12.7935, -37.4835, -12.0684, -36.9542] represents a bounding box where the
        # southwest corner has longitude -12.7935 and latitude -37.4835 , and the northeast corner has
        # longitude -12.0684 and latitude -36.9542 . FilterBBox and BiasPosition are mutually exclusive.
        # Specifying both options results in an error.

        @[JSON::Field(key: "FilterBBox")]
        getter filter_b_box : Array(Float64)?

        # A list of one or more Amazon Location categories to filter the returned places. If you include more
        # than one category, the results will include results that match any of the categories listed. For
        # more information about using categories, including a list of Amazon Location categories, see
        # Categories and filtering , in the Amazon Location Service developer guide .

        @[JSON::Field(key: "FilterCategories")]
        getter filter_categories : Array(String)?

        # An optional parameter that limits the search results by returning only places that are in a
        # specified list of countries. Valid values include ISO 3166 3-digit country codes. For example,
        # Australia uses three upper-case characters: AUS .

        @[JSON::Field(key: "FilterCountries")]
        getter filter_countries : Array(String)?

        # The optional API key to authorize the request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The preferred language used to return results. The value must be a valid BCP 47 language tag, for
        # example, en for English. This setting affects the languages used in the results, but not the results
        # themselves. If no language is specified, or not supported for a particular result, the partner
        # automatically chooses a language for the result. For an example, we'll use the Greek language. You
        # search for Athens, Greece , with the language parameter set to en . The result found will most
        # likely be returned as Athens . If you set the language parameter to el , for Greek, then the result
        # found will more likely be returned as Αθήνα . If the data provider does not have a value for Greek,
        # the result will be in a language that the provider does support.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional parameter. The maximum number of results returned per request. The default: 50

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @index_name : String,
          @text : String,
          @bias_position : Array(Float64)? = nil,
          @filter_b_box : Array(Float64)? = nil,
          @filter_categories : Array(String)? = nil,
          @filter_countries : Array(String)? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil
        )
        end
      end


      struct SearchPlaceIndexForTextResponse
        include JSON::Serializable

        # A list of Places matching the input text. Each result contains additional information about the
        # specific point of interest. Not all response properties are included with all responses. Some
        # properties may only be returned by specific data partners.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::SearchForTextResult)

        # Contains a summary of the request. Echoes the input values for BiasPosition , FilterBBox ,
        # FilterCountries , Language , MaxResults , and Text . Also includes the DataSource of the place index
        # and the bounding box, ResultBBox , which surrounds the search results.

        @[JSON::Field(key: "Summary")]
        getter summary : Types::SearchPlaceIndexForTextSummary

        def initialize(
          @results : Array(Types::SearchForTextResult),
          @summary : Types::SearchPlaceIndexForTextSummary
        )
        end
      end

      # A summary of the request sent by using SearchPlaceIndexForText .

      struct SearchPlaceIndexForTextSummary
        include JSON::Serializable

        # The geospatial data provider attached to the place index resource specified in the request. Values
        # can be one of the following: Esri Grab Here For more information about data providers, see Amazon
        # Location Service data providers .

        @[JSON::Field(key: "DataSource")]
        getter data_source : String

        # The search text specified in the request.

        @[JSON::Field(key: "Text")]
        getter text : String

        # Contains the coordinates for the optional bias position specified in the request. This parameter
        # contains a pair of numbers. The first number represents the X coordinate, or longitude; the second
        # number represents the Y coordinate, or latitude. For example, [-123.1174, 49.2847] represents the
        # position with longitude -123.1174 and latitude 49.2847 .

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # Contains the coordinates for the optional bounding box specified in the request.

        @[JSON::Field(key: "FilterBBox")]
        getter filter_b_box : Array(Float64)?

        # The optional category filter specified in the request.

        @[JSON::Field(key: "FilterCategories")]
        getter filter_categories : Array(String)?

        # Contains the optional country filter specified in the request.

        @[JSON::Field(key: "FilterCountries")]
        getter filter_countries : Array(String)?

        # The preferred language used to return results. Matches the language in the request. The value is a
        # valid BCP 47 language tag, for example, en for English.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # Contains the optional result count limit specified in the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The bounding box that fully contains all search results. If you specified the optional FilterBBox
        # parameter in the request, ResultBBox is contained within FilterBBox .

        @[JSON::Field(key: "ResultBBox")]
        getter result_b_box : Array(Float64)?

        def initialize(
          @data_source : String,
          @text : String,
          @bias_position : Array(Float64)? = nil,
          @filter_b_box : Array(Float64)? = nil,
          @filter_categories : Array(String)? = nil,
          @filter_countries : Array(String)? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @result_b_box : Array(Float64)? = nil
        )
        end
      end

      # The operation was denied because the request would exceed the maximum quota set for Amazon Location
      # Service.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # A message with the reason for the service quota exceeded exception error.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Represents an element of a leg within a route. A step contains instructions for how to move to the
      # next step in the leg.

      struct Step
        include JSON::Serializable

        # The travel distance between the step's StartPosition and EndPosition .

        @[JSON::Field(key: "Distance")]
        getter distance : Float64

        # The estimated travel time, in seconds, from the step's StartPosition to the EndPosition . . The
        # travel mode and departure time that you specify in the request determines the calculated time.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Float64

        # The end position of a step. If the position the last step in the leg, this position is the same as
        # the end position of the leg.

        @[JSON::Field(key: "EndPosition")]
        getter end_position : Array(Float64)

        # The starting position of a step. If the position is the first step in the leg, this position is the
        # same as the start position of the leg.

        @[JSON::Field(key: "StartPosition")]
        getter start_position : Array(Float64)

        # Represents the start position, or index, in a sequence of steps within the leg's line string
        # geometry. For example, the index of the first step in a leg geometry is 0 . Included in the response
        # for queries that set IncludeLegGeometry to True .

        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        def initialize(
          @distance : Float64,
          @duration_seconds : Float64,
          @end_position : Array(Float64),
          @start_position : Array(Float64),
          @geometry_offset : Int32? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags you want to update. Format example:
        # arn:aws:geo:region:account-id:resourcetype/ExampleResource

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Applies one or more tags to specific resource. A tag is a key-value pair that helps you manage,
        # identify, search, and filter your resources. Format: "key" : "value" Restrictions: Maximum 50 tags
        # per resource. Each tag key must be unique and must have exactly one associated value. Maximum key
        # length: 128 Unicode characters in UTF-8. Maximum value length: 256 Unicode characters in UTF-8. Can
        # use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @ Cannot
        # use "aws:" as a prefix for a key.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied because of request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Information about a time zone. Includes the name of the time zone and the offset from UTC in
      # seconds.

      struct TimeZone
        include JSON::Serializable

        # The name of the time zone, following the IANA time zone standard . For example, America/Los_Angeles
        # .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The time zone's offset, in seconds, from UTC.

        @[JSON::Field(key: "Offset")]
        getter offset : Int32?

        def initialize(
          @name : String,
          @offset : Int32? = nil
        )
        end
      end

      # The geomerty used to filter device positions.

      struct TrackingFilterGeometry
        include JSON::Serializable

        # The set of arrays which define the polygon. A polygon can have between 4 and 1000 vertices.

        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Array(Array(Float64)))?

        def initialize(
          @polygon : Array(Array(Array(Float64)))? = nil
        )
        end
      end

      # Contains details about the truck dimensions in the unit of measurement that you specify. Used to
      # filter out roads that can't support or allow the specified dimensions for requests that specify
      # TravelMode as Truck .

      struct TruckDimensions
        include JSON::Serializable

        # The height of the truck. For example, 4.5 . For routes calculated with a HERE resource, this value
        # must be between 0 and 50 meters.

        @[JSON::Field(key: "Height")]
        getter height : Float64?

        # The length of the truck. For example, 15.5 . For routes calculated with a HERE resource, this value
        # must be between 0 and 300 meters.

        @[JSON::Field(key: "Length")]
        getter length : Float64?

        # Specifies the unit of measurement for the truck dimensions. Default Value: Meters

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # The width of the truck. For example, 4.5 . For routes calculated with a HERE resource, this value
        # must be between 0 and 50 meters.

        @[JSON::Field(key: "Width")]
        getter width : Float64?

        def initialize(
          @height : Float64? = nil,
          @length : Float64? = nil,
          @unit : String? = nil,
          @width : Float64? = nil
        )
        end
      end

      # Contains details about the truck's weight specifications. Used to avoid roads that can't support or
      # allow the total weight for requests that specify TravelMode as Truck .

      struct TruckWeight
        include JSON::Serializable

        # The total weight of the truck. For example, 3500 .

        @[JSON::Field(key: "Total")]
        getter total : Float64?

        # The unit of measurement to use for the truck weight. Default Value: Kilograms

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @total : Float64? = nil,
          @unit : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which you want to remove tags. Format example:
        # arn:aws:geo:region:account-id:resourcetype/ExampleResource

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the specified resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateGeofenceCollectionRequest
        include JSON::Serializable

        # The name of the geofence collection to update.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # Updates the description for the geofence collection.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        def initialize(
          @collection_name : String,
          @description : String? = nil,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil
        )
        end
      end


      struct UpdateGeofenceCollectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated geofence collection. Used to specify a resource across
        # Amazon Web Services. Format example:
        # arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection

        @[JSON::Field(key: "CollectionArn")]
        getter collection_arn : String

        # The name of the updated geofence collection.

        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String

        # The time when the geofence collection was last updated in ISO 8601 format: YYYY-MM-DDThh:mm:ss.sssZ

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @collection_arn : String,
          @collection_name : String,
          @update_time : Time
        )
        end
      end


      struct UpdateKeyRequest
        include JSON::Serializable

        # The name of the API key resource to update.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # Updates the description for the API key resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Updates the timestamp for when the API key resource will expire in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "ExpireTime")]
        getter expire_time : Time?

        # The boolean flag to be included for updating ExpireTime or Restrictions details. Must be set to true
        # to update an API key resource that has been used in the past 7 days. False if force update is not
        # preferred Default value: False

        @[JSON::Field(key: "ForceUpdate")]
        getter force_update : Bool?

        # Whether the API key should expire. Set to true to set the API key to have no expiration time.

        @[JSON::Field(key: "NoExpiry")]
        getter no_expiry : Bool?

        # Updates the API key restrictions for the API key resource.

        @[JSON::Field(key: "Restrictions")]
        getter restrictions : Types::ApiKeyRestrictions?

        def initialize(
          @key_name : String,
          @description : String? = nil,
          @expire_time : Time? = nil,
          @force_update : Bool? = nil,
          @no_expiry : Bool? = nil,
          @restrictions : Types::ApiKeyRestrictions? = nil
        )
        end
      end


      struct UpdateKeyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the API key resource. Used when you need to specify a resource
        # across all Amazon Web Services. Format example: arn:aws:geo:region:account-id:key/ExampleKey

        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The name of the API key resource.

        @[JSON::Field(key: "KeyName")]
        getter key_name : String

        # The timestamp for when the API key resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @key_arn : String,
          @key_name : String,
          @update_time : Time
        )
        end
      end


      struct UpdateMapRequest
        include JSON::Serializable

        # The name of the map resource to update.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # Updates the parts of the map configuration that can be updated, including the political view.

        @[JSON::Field(key: "ConfigurationUpdate")]
        getter configuration_update : Types::MapConfigurationUpdate?

        # Updates the description for the map resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        def initialize(
          @map_name : String,
          @configuration_update : Types::MapConfigurationUpdate? = nil,
          @description : String? = nil,
          @pricing_plan : String? = nil
        )
        end
      end


      struct UpdateMapResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated map resource. Used to specify a resource across AWS.
        # Format example: arn:aws:geo:region:account-id:map/ExampleMap

        @[JSON::Field(key: "MapArn")]
        getter map_arn : String

        # The name of the updated map resource.

        @[JSON::Field(key: "MapName")]
        getter map_name : String

        # The timestamp for when the map resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @map_arn : String,
          @map_name : String,
          @update_time : Time
        )
        end
      end


      struct UpdatePlaceIndexRequest
        include JSON::Serializable

        # The name of the place index resource to update.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # Updates the data storage option for the place index resource.

        @[JSON::Field(key: "DataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration?

        # Updates the description for the place index resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        def initialize(
          @index_name : String,
          @data_source_configuration : Types::DataSourceConfiguration? = nil,
          @description : String? = nil,
          @pricing_plan : String? = nil
        )
        end
      end


      struct UpdatePlaceIndexResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the upated place index resource. Used to specify a resource across
        # Amazon Web Services. Format example: arn:aws:geo:region:account-id:place- index/ExamplePlaceIndex

        @[JSON::Field(key: "IndexArn")]
        getter index_arn : String

        # The name of the updated place index resource.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The timestamp for when the place index resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @index_arn : String,
          @index_name : String,
          @update_time : Time
        )
        end
      end


      struct UpdateRouteCalculatorRequest
        include JSON::Serializable

        # The name of the route calculator resource to update.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # Updates the description for the route calculator resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        def initialize(
          @calculator_name : String,
          @description : String? = nil,
          @pricing_plan : String? = nil
        )
        end
      end


      struct UpdateRouteCalculatorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated route calculator resource. Used to specify a resource
        # across AWS. Format example: arn:aws:geo:region:account-id:route- calculator/ExampleCalculator

        @[JSON::Field(key: "CalculatorArn")]
        getter calculator_arn : String

        # The name of the updated route calculator resource.

        @[JSON::Field(key: "CalculatorName")]
        getter calculator_name : String

        # The timestamp for when the route calculator was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @calculator_arn : String,
          @calculator_name : String,
          @update_time : Time
        )
        end
      end


      struct UpdateTrackerRequest
        include JSON::Serializable

        # The name of the tracker resource to update.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # Updates the description for the tracker resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Whether to enable position UPDATE events from this tracker to be sent to EventBridge. You do not
        # need enable this feature to get ENTER and EXIT events for geofences with this tracker. Those events
        # are always sent to EventBridge.

        @[JSON::Field(key: "EventBridgeEnabled")]
        getter event_bridge_enabled : Bool?

        # Enables GeospatialQueries for a tracker that uses a Amazon Web Services KMS customer managed key .
        # This parameter is only used if you are using a KMS customer managed key.

        @[JSON::Field(key: "KmsKeyEnableGeospatialQueries")]
        getter kms_key_enable_geospatial_queries : Bool?

        # Updates the position filtering for the tracker resource. Valid values: TimeBased - Location updates
        # are evaluated against linked geofence collections, but not every location update is stored. If your
        # update frequency is more often than 30 seconds, only one update per 30 seconds is stored for each
        # unique device ID. DistanceBased - If the device has moved less than 30 m (98.4 ft), location updates
        # are ignored. Location updates within this distance are neither evaluated against linked geofence
        # collections, nor stored. This helps control costs by reducing the number of geofence evaluations and
        # historical device positions to paginate through. Distance-based filtering can also reduce the
        # effects of GPS noise when displaying device trajectories on a map. AccuracyBased - If the device has
        # moved less than the measured accuracy, location updates are ignored. For example, if two consecutive
        # updates from a device have a horizontal accuracy of 5 m and 10 m, the second update is ignored if
        # the device has moved less than 15 m. Ignored location updates are neither evaluated against linked
        # geofence collections, nor stored. This helps educe the effects of GPS noise when displaying device
        # trajectories on a map, and can help control costs by reducing the number of geofence evaluations.

        @[JSON::Field(key: "PositionFiltering")]
        getter position_filtering : String?

        # No longer used. If included, the only allowed value is RequestBasedUsage .

        @[JSON::Field(key: "PricingPlan")]
        getter pricing_plan : String?

        # This parameter is no longer used.

        @[JSON::Field(key: "PricingPlanDataSource")]
        getter pricing_plan_data_source : String?

        def initialize(
          @tracker_name : String,
          @description : String? = nil,
          @event_bridge_enabled : Bool? = nil,
          @kms_key_enable_geospatial_queries : Bool? = nil,
          @position_filtering : String? = nil,
          @pricing_plan : String? = nil,
          @pricing_plan_data_source : String? = nil
        )
        end
      end


      struct UpdateTrackerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated tracker resource. Used to specify a resource across
        # AWS. Format example: arn:aws:geo:region:account-id:tracker/ExampleTracker

        @[JSON::Field(key: "TrackerArn")]
        getter tracker_arn : String

        # The name of the updated tracker resource.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # The timestamp for when the tracker resource was last updated in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @tracker_arn : String,
          @tracker_name : String,
          @update_time : Time
        )
        end
      end

      # The input failed to meet the constraints specified by the AWS service.

      struct ValidationException
        include JSON::Serializable

        # The field where the invalid entry was detected.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)


        @[JSON::Field(key: "message")]
        getter message : String

        # A message with the reason for the validation exception error.

        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @field_list : Array(Types::ValidationExceptionField),
          @message : String,
          @reason : String
        )
        end
      end

      # The input failed to meet the constraints specified by the AWS service in a specified field.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message with the reason for the validation exception error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The field name where the invalid entry was detected.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end


      struct VerifyDevicePositionRequest
        include JSON::Serializable

        # The device's state, including position, IP address, cell signals and Wi-Fi access points.

        @[JSON::Field(key: "DeviceState")]
        getter device_state : Types::DeviceState

        # The name of the tracker resource to be associated with verification request.

        @[JSON::Field(key: "TrackerName")]
        getter tracker_name : String

        # The distance unit for the verification request. Default Value: Kilometers

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String?

        def initialize(
          @device_state : Types::DeviceState,
          @tracker_name : String,
          @distance_unit : String? = nil
        )
        end
      end


      struct VerifyDevicePositionResponse
        include JSON::Serializable

        # The device identifier.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The distance unit for the verification response.

        @[JSON::Field(key: "DistanceUnit")]
        getter distance_unit : String

        # The inferred state of the device, given the provided position, IP address, cellular signals, and
        # Wi-Fi- access points.

        @[JSON::Field(key: "InferredState")]
        getter inferred_state : Types::InferredState

        # The timestamp for when the tracker resource received the device position in ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "ReceivedTime")]
        getter received_time : Time

        # The timestamp at which the device's position was determined. Uses ISO 8601 format:
        # YYYY-MM-DDThh:mm:ss.sssZ .

        @[JSON::Field(key: "SampleTime")]
        getter sample_time : Time

        def initialize(
          @device_id : String,
          @distance_unit : String,
          @inferred_state : Types::InferredState,
          @received_time : Time,
          @sample_time : Time
        )
        end
      end

      # Wi-Fi access point.

      struct WiFiAccessPoint
        include JSON::Serializable

        # Medium access control address (Mac).

        @[JSON::Field(key: "MacAddress")]
        getter mac_address : String

        # Received signal strength (dBm) of the WLAN measurement data.

        @[JSON::Field(key: "Rss")]
        getter rss : Int32

        def initialize(
          @mac_address : String,
          @rss : Int32
        )
        end
      end
    end
  end
end
