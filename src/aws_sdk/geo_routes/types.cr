require "json"

module AwsSdk
  module GeoRoutes
    module Types

      # You don't have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CalculateIsolinesRequest
        include JSON::Serializable

        # Threshold to be used for the isoline calculation. Up to 3 thresholds per provided type can be
        # requested. You incur a calculation charge for each threshold. Using a large amount of thresholds in
        # a request can lead you to incur unexpected charges. See Amazon Location's pricing page for more
        # information.
        @[JSON::Field(key: "Thresholds")]
        getter thresholds : Types::IsolineThresholds

        # Features that are allowed while calculating an isoline.
        @[JSON::Field(key: "Allow")]
        getter allow : Types::IsolineAllowOptions?

        # Time of arrival at the destination. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "ArrivalTime")]
        getter arrival_time : String?

        # Features that are avoided while calculating a route. Avoidance is on a best-case basis. If an
        # avoidance can't be satisfied for a particular case, it violates the avoidance and the returned
        # response produces a notice for the violation.
        @[JSON::Field(key: "Avoid")]
        getter avoid : Types::IsolineAvoidanceOptions?

        # Uses the current time as the time of departure.
        @[JSON::Field(key: "DepartNow")]
        getter depart_now : Bool?

        # Time of departure from thr origin. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : String?

        # The final position for the route. In the World Geodetic System (WGS 84) format: [longitude,
        # latitude] .
        @[JSON::Field(key: "Destination")]
        getter destination : Array(Float64)?

        # Destination related options.
        @[JSON::Field(key: "DestinationOptions")]
        getter destination_options : Types::IsolineDestinationOptions?

        # The format of the returned IsolineGeometry. Default Value: FlexiblePolyline
        @[JSON::Field(key: "IsolineGeometryFormat")]
        getter isoline_geometry_format : String?

        # Defines the granularity of the returned Isoline.
        @[JSON::Field(key: "IsolineGranularity")]
        getter isoline_granularity : Types::IsolineGranularityOptions?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Specifies the optimization criteria for when calculating an isoline. AccurateCalculation generates
        # an isoline of higher granularity that is more precise. FastCalculation generates an isoline faster
        # by reducing the granularity, and in turn the quality of the isoline. BalancedCalculation generates
        # an isoline by balancing between quality and performance. Default Value: BalancedCalculation
        @[JSON::Field(key: "OptimizeIsolineFor")]
        getter optimize_isoline_for : String?

        # Specifies the optimization criteria for calculating a route. Default Value: FastestRoute
        @[JSON::Field(key: "OptimizeRoutingFor")]
        getter optimize_routing_for : String?

        # The start position for the route.
        @[JSON::Field(key: "Origin")]
        getter origin : Array(Float64)?

        # Origin related options.
        @[JSON::Field(key: "OriginOptions")]
        getter origin_options : Types::IsolineOriginOptions?

        # Traffic related options.
        @[JSON::Field(key: "Traffic")]
        getter traffic : Types::IsolineTrafficOptions?

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. The mode Scooter also applies to motorcycles, set to Scooter when wanted to
        # calculate options for motorcycles. Default Value: Car
        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String?

        # Travel mode related options for the provided travel mode.
        @[JSON::Field(key: "TravelModeOptions")]
        getter travel_mode_options : Types::IsolineTravelModeOptions?

        def initialize(
          @thresholds : Types::IsolineThresholds,
          @allow : Types::IsolineAllowOptions? = nil,
          @arrival_time : String? = nil,
          @avoid : Types::IsolineAvoidanceOptions? = nil,
          @depart_now : Bool? = nil,
          @departure_time : String? = nil,
          @destination : Array(Float64)? = nil,
          @destination_options : Types::IsolineDestinationOptions? = nil,
          @isoline_geometry_format : String? = nil,
          @isoline_granularity : Types::IsolineGranularityOptions? = nil,
          @key : String? = nil,
          @optimize_isoline_for : String? = nil,
          @optimize_routing_for : String? = nil,
          @origin : Array(Float64)? = nil,
          @origin_options : Types::IsolineOriginOptions? = nil,
          @traffic : Types::IsolineTrafficOptions? = nil,
          @travel_mode : String? = nil,
          @travel_mode_options : Types::IsolineTravelModeOptions? = nil
        )
        end
      end

      struct CalculateIsolinesResponse
        include JSON::Serializable

        # The format of the returned IsolineGeometry. Default Value: FlexiblePolyline
        @[JSON::Field(key: "IsolineGeometryFormat")]
        getter isoline_geometry_format : String

        # Calculated isolines and associated properties.
        @[JSON::Field(key: "Isolines")]
        getter isolines : Array(Types::Isoline)

        # The pricing bucket for which the query is charged at.
        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # Time of arrival at the destination. This parameter is returned only if the Destination parameters
        # was provided in the request. Time format: YYYY-MM-DDThh:mm:ss.sssZ | YYYY-MM-DDThh:mm:ss.sss+hh:mm
        # Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "ArrivalTime")]
        getter arrival_time : String?

        # Time of departure from thr origin. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : String?

        # Snapped destination that was used for the Isoline calculation.
        @[JSON::Field(key: "SnappedDestination")]
        getter snapped_destination : Array(Float64)?

        # Snapped origin that was used for the Isoline calculation.
        @[JSON::Field(key: "SnappedOrigin")]
        getter snapped_origin : Array(Float64)?

        def initialize(
          @isoline_geometry_format : String,
          @isolines : Array(Types::Isoline),
          @pricing_bucket : String,
          @arrival_time : String? = nil,
          @departure_time : String? = nil,
          @snapped_destination : Array(Float64)? = nil,
          @snapped_origin : Array(Float64)? = nil
        )
        end
      end

      struct CalculateRouteMatrixRequest
        include JSON::Serializable

        # List of destinations for the route. Route calculations are billed for each origin and destination
        # pair. If you use a large matrix of origins and destinations, your costs will increase accordingly.
        # See Amazon Location's pricing page for more information.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::RouteMatrixDestination)

        # The position in longitude and latitude for the origin. Route calculations are billed for each origin
        # and destination pair. Using a large amount of Origins in a request can lead you to incur unexpected
        # charges. See Amazon Location's pricing page for more information.
        @[JSON::Field(key: "Origins")]
        getter origins : Array(Types::RouteMatrixOrigin)

        # Boundary within which the matrix is to be calculated. All data, origins and destinations outside the
        # boundary are considered invalid. When request routing boundary was set as AutoCircle, the response
        # routing boundary will return Circle derived from the AutoCircle settings.
        @[JSON::Field(key: "RoutingBoundary")]
        getter routing_boundary : Types::RouteMatrixBoundary

        # Features that are allowed while calculating a route.
        @[JSON::Field(key: "Allow")]
        getter allow : Types::RouteMatrixAllowOptions?

        # Features that are avoided while calculating a route. Avoidance is on a best-case basis. If an
        # avoidance can't be satisfied for a particular case, it violates the avoidance and the returned
        # response produces a notice for the violation.
        @[JSON::Field(key: "Avoid")]
        getter avoid : Types::RouteMatrixAvoidanceOptions?

        # Uses the current time as the time of departure.
        @[JSON::Field(key: "DepartNow")]
        getter depart_now : Bool?

        # Time of departure from thr origin. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : String?

        # Features to be strictly excluded while calculating the route.
        @[JSON::Field(key: "Exclude")]
        getter exclude : Types::RouteMatrixExclusionOptions?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Specifies the optimization criteria for calculating a route. Default Value: FastestRoute
        @[JSON::Field(key: "OptimizeRoutingFor")]
        getter optimize_routing_for : String?

        # Traffic related options.
        @[JSON::Field(key: "Traffic")]
        getter traffic : Types::RouteMatrixTrafficOptions?

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. Default Value: Car
        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String?

        # Travel mode related options for the provided travel mode.
        @[JSON::Field(key: "TravelModeOptions")]
        getter travel_mode_options : Types::RouteMatrixTravelModeOptions?

        def initialize(
          @destinations : Array(Types::RouteMatrixDestination),
          @origins : Array(Types::RouteMatrixOrigin),
          @routing_boundary : Types::RouteMatrixBoundary,
          @allow : Types::RouteMatrixAllowOptions? = nil,
          @avoid : Types::RouteMatrixAvoidanceOptions? = nil,
          @depart_now : Bool? = nil,
          @departure_time : String? = nil,
          @exclude : Types::RouteMatrixExclusionOptions? = nil,
          @key : String? = nil,
          @optimize_routing_for : String? = nil,
          @traffic : Types::RouteMatrixTrafficOptions? = nil,
          @travel_mode : String? = nil,
          @travel_mode_options : Types::RouteMatrixTravelModeOptions? = nil
        )
        end
      end

      struct CalculateRouteMatrixResponse
        include JSON::Serializable

        # The count of error results in the route matrix. If this number is 0, all routes were calculated
        # successfully.
        @[JSON::Field(key: "ErrorCount")]
        getter error_count : Int32

        # The pricing bucket for which the query is charged at.
        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # The calculated route matrix containing the results for all pairs of Origins to Destination
        # positions. Each row corresponds to one entry in Origins. Each entry in the row corresponds to the
        # route from that entry in Origins to an entry in Destination positions.
        @[JSON::Field(key: "RouteMatrix")]
        getter route_matrix : Array(Array(Types::RouteMatrixEntry))

        # Boundary within which the matrix is to be calculated. All data, origins and destinations outside the
        # boundary are considered invalid. When request routing boundary was set as AutoCircle, the response
        # routing boundary will return Circle derived from the AutoCircle settings.
        @[JSON::Field(key: "RoutingBoundary")]
        getter routing_boundary : Types::RouteMatrixBoundary

        def initialize(
          @error_count : Int32,
          @pricing_bucket : String,
          @route_matrix : Array(Array(Types::RouteMatrixEntry)),
          @routing_boundary : Types::RouteMatrixBoundary
        )
        end
      end

      struct CalculateRoutesRequest
        include JSON::Serializable

        # The final position for the route. In the World Geodetic System (WGS 84) format: [longitude,
        # latitude] .
        @[JSON::Field(key: "Destination")]
        getter destination : Array(Float64)

        # The start position for the route.
        @[JSON::Field(key: "Origin")]
        getter origin : Array(Float64)

        # Features that are allowed while calculating a route.
        @[JSON::Field(key: "Allow")]
        getter allow : Types::RouteAllowOptions?

        # Time of arrival at the destination. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "ArrivalTime")]
        getter arrival_time : String?

        # Features that are avoided while calculating a route. Avoidance is on a best-case basis. If an
        # avoidance can't be satisfied for a particular case, it violates the avoidance and the returned
        # response produces a notice for the violation.
        @[JSON::Field(key: "Avoid")]
        getter avoid : Types::RouteAvoidanceOptions?

        # Uses the current time as the time of departure.
        @[JSON::Field(key: "DepartNow")]
        getter depart_now : Bool?

        # Time of departure from thr origin. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : String?

        # Destination related options.
        @[JSON::Field(key: "DestinationOptions")]
        getter destination_options : Types::RouteDestinationOptions?

        # Driver related options.
        @[JSON::Field(key: "Driver")]
        getter driver : Types::RouteDriverOptions?

        # Features to be strictly excluded while calculating the route.
        @[JSON::Field(key: "Exclude")]
        getter exclude : Types::RouteExclusionOptions?

        # Measurement system to be used for instructions within steps in the response.
        @[JSON::Field(key: "InstructionsMeasurementSystem")]
        getter instructions_measurement_system : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        # List of languages for instructions within steps in the response. Instructions in the requested
        # language are returned only if they are available.
        @[JSON::Field(key: "Languages")]
        getter languages : Array(String)?

        # A list of optional additional parameters such as timezone that can be requested for each result.
        # Elevation : Retrieves the elevation information for each location. Incidents : Provides information
        # on traffic incidents along the route. PassThroughWaypoints : Indicates waypoints that are passed
        # through without stopping. Summary : Returns a summary of the route, including distance and duration.
        # Tolls : Supplies toll cost information along the route. TravelStepInstructions : Provides
        # step-by-step instructions for travel along the route. TruckRoadTypes : Returns information about
        # road types suitable for trucks. TypicalDuration : Gives typical travel duration based on historical
        # data. Zones : Specifies the time zone information for each waypoint.
        @[JSON::Field(key: "LegAdditionalFeatures")]
        getter leg_additional_features : Array(String)?

        # Specifies the format of the geometry returned for each leg of the route. You can choose between two
        # different geometry encoding formats. FlexiblePolyline : A compact and precise encoding format for
        # the leg geometry. For more information on the format, see the GitHub repository for FlexiblePolyline
        # . Simple : A less compact encoding, which is easier to decode but may be less precise and result in
        # larger payloads.
        @[JSON::Field(key: "LegGeometryFormat")]
        getter leg_geometry_format : String?

        # Maximum number of alternative routes to be provided in the response, if available.
        @[JSON::Field(key: "MaxAlternatives")]
        getter max_alternatives : Int32?

        # Specifies the optimization criteria for calculating a route. Default Value: FastestRoute
        @[JSON::Field(key: "OptimizeRoutingFor")]
        getter optimize_routing_for : String?

        # Origin related options.
        @[JSON::Field(key: "OriginOptions")]
        getter origin_options : Types::RouteOriginOptions?

        # A list of optional features such as SpeedLimit that can be requested for a Span. A span is a section
        # of a Leg for which the requested features have the same values.
        @[JSON::Field(key: "SpanAdditionalFeatures")]
        getter span_additional_features : Array(String)?

        # Toll related options.
        @[JSON::Field(key: "Tolls")]
        getter tolls : Types::RouteTollOptions?

        # Traffic related options.
        @[JSON::Field(key: "Traffic")]
        getter traffic : Types::RouteTrafficOptions?

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. Default Value: Car
        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String?

        # Travel mode related options for the provided travel mode.
        @[JSON::Field(key: "TravelModeOptions")]
        getter travel_mode_options : Types::RouteTravelModeOptions?

        # Type of step returned by the response. Default provides basic steps intended for web based
        # applications. TurnByTurn provides detailed instructions with more granularity intended for a turn
        # based navigation system.
        @[JSON::Field(key: "TravelStepType")]
        getter travel_step_type : String?

        # List of waypoints between the Origin and Destination.
        @[JSON::Field(key: "Waypoints")]
        getter waypoints : Array(Types::RouteWaypoint)?

        def initialize(
          @destination : Array(Float64),
          @origin : Array(Float64),
          @allow : Types::RouteAllowOptions? = nil,
          @arrival_time : String? = nil,
          @avoid : Types::RouteAvoidanceOptions? = nil,
          @depart_now : Bool? = nil,
          @departure_time : String? = nil,
          @destination_options : Types::RouteDestinationOptions? = nil,
          @driver : Types::RouteDriverOptions? = nil,
          @exclude : Types::RouteExclusionOptions? = nil,
          @instructions_measurement_system : String? = nil,
          @key : String? = nil,
          @languages : Array(String)? = nil,
          @leg_additional_features : Array(String)? = nil,
          @leg_geometry_format : String? = nil,
          @max_alternatives : Int32? = nil,
          @optimize_routing_for : String? = nil,
          @origin_options : Types::RouteOriginOptions? = nil,
          @span_additional_features : Array(String)? = nil,
          @tolls : Types::RouteTollOptions? = nil,
          @traffic : Types::RouteTrafficOptions? = nil,
          @travel_mode : String? = nil,
          @travel_mode_options : Types::RouteTravelModeOptions? = nil,
          @travel_step_type : String? = nil,
          @waypoints : Array(Types::RouteWaypoint)? = nil
        )
        end
      end

      struct CalculateRoutesResponse
        include JSON::Serializable

        # Specifies the format of the geometry returned for each leg of the route.
        @[JSON::Field(key: "LegGeometryFormat")]
        getter leg_geometry_format : String

        # Notices are additional information returned that indicate issues that occurred during route
        # calculation.
        @[JSON::Field(key: "Notices")]
        getter notices : Array(Types::RouteResponseNotice)

        # The pricing bucket for which the query is charged at.
        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # The path from the origin to the destination.
        @[JSON::Field(key: "Routes")]
        getter routes : Array(Types::Route)

        def initialize(
          @leg_geometry_format : String,
          @notices : Array(Types::RouteResponseNotice),
          @pricing_bucket : String,
          @routes : Array(Types::Route)
        )
        end
      end

      # Geometry defined as a circle. When request routing boundary was set as AutoCircle , the response
      # routing boundary will return Circle derived from the AutoCircle settings.
      struct Circle
        include JSON::Serializable

        # Center of the Circle defined in longitude and latitude coordinates. Example: [-123.1174, 49.2847]
        # represents the position with longitude -123.1174 and latitude 49.2847 .
        @[JSON::Field(key: "Center")]
        getter center : Array(Float64)

        # Radius of the Circle. Unit : meters
        @[JSON::Field(key: "Radius")]
        getter radius : Float64

        def initialize(
          @center : Array(Float64),
          @radius : Float64
        )
        end
      end

      # Geometry defined as a corridor - a LineString with a radius that defines the width of the corridor.
      struct Corridor
        include JSON::Serializable

        # An ordered list of positions used to plot a route on a map. LineString and Polyline are mutually
        # exclusive properties.
        @[JSON::Field(key: "LineString")]
        getter line_string : Array(Array(Float64))

        # Radius that defines the width of the corridor.
        @[JSON::Field(key: "Radius")]
        getter radius : Int32

        def initialize(
          @line_string : Array(Array(Float64)),
          @radius : Int32
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Calculated isolines and associated properties.
      struct Isoline
        include JSON::Serializable

        # Isolines may contain multiple components, if these components are connected by ferry links. These
        # components are returned as separate polygons while the ferry links are returned as connections.
        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::IsolineConnection)

        # Geometries for the Calculated isolines.
        @[JSON::Field(key: "Geometries")]
        getter geometries : Array(Types::IsolineShapeGeometry)

        # Distance threshold corresponding to the calculated Isoline.
        @[JSON::Field(key: "DistanceThreshold")]
        getter distance_threshold : Int64?

        # Time threshold corresponding to the calculated isoline.
        @[JSON::Field(key: "TimeThreshold")]
        getter time_threshold : Int64?

        def initialize(
          @connections : Array(Types::IsolineConnection),
          @geometries : Array(Types::IsolineShapeGeometry),
          @distance_threshold : Int64? = nil,
          @time_threshold : Int64? = nil
        )
        end
      end

      # Features that are allowed while calculating an isoline.
      struct IsolineAllowOptions
        include JSON::Serializable

        # Allow Hot (High Occupancy Toll) lanes while calculating an isoline. Default value: false
        @[JSON::Field(key: "Hot")]
        getter hot : Bool?

        # Allow Hov (High Occupancy vehicle) lanes while calculating an isoline. Default value: false
        @[JSON::Field(key: "Hov")]
        getter hov : Bool?

        def initialize(
          @hot : Bool? = nil,
          @hov : Bool? = nil
        )
        end
      end

      # The area to be avoided.
      struct IsolineAvoidanceArea
        include JSON::Serializable

        # Geometry of the area to be avoided.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::IsolineAvoidanceAreaGeometry

        # Exceptions to the provided avoidance geometry, to be included while calculating an isoline.
        @[JSON::Field(key: "Except")]
        getter except : Array(Types::IsolineAvoidanceAreaGeometry)?

        def initialize(
          @geometry : Types::IsolineAvoidanceAreaGeometry,
          @except : Array(Types::IsolineAvoidanceAreaGeometry)? = nil
        )
        end
      end

      # The avoidance geometry, to be included while calculating an isoline.
      struct IsolineAvoidanceAreaGeometry
        include JSON::Serializable

        # Geometry defined as a bounding box. The first pair represents the X and Y coordinates (longitude and
        # latitude,) of the southwest corner of the bounding box; the second pair represents the X and Y
        # coordinates (longitude and latitude) of the northeast corner.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?

        # Geometry defined as a corridor - a LineString with a radius that defines the width of the corridor.
        @[JSON::Field(key: "Corridor")]
        getter corridor : Types::Corridor?

        # A list of Polygon will be excluded for calculating isolines, the list can only contain 1 polygon.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Array(Array(Float64)))?

        # Geometry defined as an encoded corridor – a polyline with a radius that defines the width of the
        # corridor. For more information on polyline encoding, see
        # https://github.com/heremaps/flexiblepolyline/blob/master/README.md .
        @[JSON::Field(key: "PolylineCorridor")]
        getter polyline_corridor : Types::PolylineCorridor?

        # A list of PolylinePolygon's that are excluded for calculating isolines, the list can only contain 1
        # polygon. For more information on polyline encoding, see
        # https://github.com/heremaps/flexiblepolyline/blob/master/README.md .
        @[JSON::Field(key: "PolylinePolygon")]
        getter polyline_polygon : Array(String)?

        def initialize(
          @bounding_box : Array(Float64)? = nil,
          @corridor : Types::Corridor? = nil,
          @polygon : Array(Array(Array(Float64)))? = nil,
          @polyline_corridor : Types::PolylineCorridor? = nil,
          @polyline_polygon : Array(String)? = nil
        )
        end
      end

      # Features that are avoided while calculating isolines. Avoidance is on a best-case basis. If an
      # avoidance can't be satisfied for a particular case, it violates the avoidance and the returned
      # response produces a notice for the violation.
      struct IsolineAvoidanceOptions
        include JSON::Serializable

        # Areas to be avoided.
        @[JSON::Field(key: "Areas")]
        getter areas : Array(Types::IsolineAvoidanceArea)?

        # Avoid car-shuttle-trains while calculating an isoline.
        @[JSON::Field(key: "CarShuttleTrains")]
        getter car_shuttle_trains : Bool?

        # Avoid controlled access highways while calculating an isoline.
        @[JSON::Field(key: "ControlledAccessHighways")]
        getter controlled_access_highways : Bool?

        # Avoid dirt roads while calculating an isoline.
        @[JSON::Field(key: "DirtRoads")]
        getter dirt_roads : Bool?

        # Avoid ferries while calculating an isoline.
        @[JSON::Field(key: "Ferries")]
        getter ferries : Bool?

        # Avoid roads that have seasonal closure while calculating an isoline.
        @[JSON::Field(key: "SeasonalClosure")]
        getter seasonal_closure : Bool?

        # Avoids roads where the specified toll transponders are the only mode of payment.
        @[JSON::Field(key: "TollRoads")]
        getter toll_roads : Bool?

        # Avoids roads where the specified toll transponders are the only mode of payment.
        @[JSON::Field(key: "TollTransponders")]
        getter toll_transponders : Bool?

        # Truck road type identifiers. BK1 through BK4 apply only to Sweden. A2,A4,B2,B4,C,D,ET2,ET4 apply
        # only to Mexico. There are currently no other supported values as of 26th April 2024.
        @[JSON::Field(key: "TruckRoadTypes")]
        getter truck_road_types : Array(String)?

        # Avoid tunnels while calculating an isoline.
        @[JSON::Field(key: "Tunnels")]
        getter tunnels : Bool?

        # Avoid U-turns for calculation on highways and motorways.
        @[JSON::Field(key: "UTurns")]
        getter u_turns : Bool?

        # Zone categories to be avoided.
        @[JSON::Field(key: "ZoneCategories")]
        getter zone_categories : Array(Types::IsolineAvoidanceZoneCategory)?

        def initialize(
          @areas : Array(Types::IsolineAvoidanceArea)? = nil,
          @car_shuttle_trains : Bool? = nil,
          @controlled_access_highways : Bool? = nil,
          @dirt_roads : Bool? = nil,
          @ferries : Bool? = nil,
          @seasonal_closure : Bool? = nil,
          @toll_roads : Bool? = nil,
          @toll_transponders : Bool? = nil,
          @truck_road_types : Array(String)? = nil,
          @tunnels : Bool? = nil,
          @u_turns : Bool? = nil,
          @zone_categories : Array(Types::IsolineAvoidanceZoneCategory)? = nil
        )
        end
      end

      # Zone category to be avoided.
      struct IsolineAvoidanceZoneCategory
        include JSON::Serializable

        # Zone category to be avoided.
        @[JSON::Field(key: "Category")]
        getter category : String?

        def initialize(
          @category : String? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is Car .
      struct IsolineCarOptions
        include JSON::Serializable

        # Engine type of the vehicle.
        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::IsolineVehicleLicensePlate?

        # Maximum speed. Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        def initialize(
          @engine_type : String? = nil,
          @license_plate : Types::IsolineVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil
        )
        end
      end

      # Isolines may contain multiple components, if these components are connected by ferry links. These
      # components are returned as separate polygons while the ferry links are returned as connections.
      struct IsolineConnection
        include JSON::Serializable

        # Index of the polygon corresponding to the "from" component of the connection. The polygon is
        # available from Isoline[].Geometries .
        @[JSON::Field(key: "FromPolygonIndex")]
        getter from_polygon_index : Int32

        # The isoline geometry.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::IsolineConnectionGeometry

        # Index of the polygon corresponding to the "to" component of the connection. The polygon is available
        # from Isoline[].Geometries .
        @[JSON::Field(key: "ToPolygonIndex")]
        getter to_polygon_index : Int32

        def initialize(
          @from_polygon_index : Int32,
          @geometry : Types::IsolineConnectionGeometry,
          @to_polygon_index : Int32
        )
        end
      end

      # Geometry of the connection between different isoline components.
      struct IsolineConnectionGeometry
        include JSON::Serializable

        # An ordered list of positions used to plot a route on a map. LineString and Polyline are mutually
        # exclusive properties.
        @[JSON::Field(key: "LineString")]
        getter line_string : Array(Array(Float64))?

        # An ordered list of positions used to plot a route on a map in a lossy compression format. LineString
        # and Polyline are mutually exclusive properties.
        @[JSON::Field(key: "Polyline")]
        getter polyline : String?

        def initialize(
          @line_string : Array(Array(Float64))? = nil,
          @polyline : String? = nil
        )
        end
      end

      # Destination related options.
      struct IsolineDestinationOptions
        include JSON::Serializable

        # Avoids actions for the provided distance. This is typically to consider for users in moving vehicles
        # who may not have sufficient time to make an action at an origin or a destination.
        @[JSON::Field(key: "AvoidActionsForDistance")]
        getter avoid_actions_for_distance : Int64?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Options to configure matching the provided position to the road network.
        @[JSON::Field(key: "Matching")]
        getter matching : Types::IsolineMatchingOptions?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::IsolineSideOfStreetOptions?

        def initialize(
          @avoid_actions_for_distance : Int64? = nil,
          @heading : Float64? = nil,
          @matching : Types::IsolineMatchingOptions? = nil,
          @side_of_street : Types::IsolineSideOfStreetOptions? = nil
        )
        end
      end

      # Isoline granularity related options.
      struct IsolineGranularityOptions
        include JSON::Serializable

        # Maximum number of points of returned Isoline.
        @[JSON::Field(key: "MaxPoints")]
        getter max_points : Int32?

        # Maximum resolution of the returned isoline. Unit : meters
        @[JSON::Field(key: "MaxResolution")]
        getter max_resolution : Int64?

        def initialize(
          @max_points : Int32? = nil,
          @max_resolution : Int64? = nil
        )
        end
      end

      # Isoline matching related options.
      struct IsolineMatchingOptions
        include JSON::Serializable

        # Attempts to match the provided position to a road similar to the provided name.
        @[JSON::Field(key: "NameHint")]
        getter name_hint : String?

        # If the distance to a highway/bridge/tunnel/sliproad is within threshold, the waypoint will be
        # snapped to the highway/bridge/tunnel/sliproad. Unit : meters
        @[JSON::Field(key: "OnRoadThreshold")]
        getter on_road_threshold : Int64?

        # Considers all roads within the provided radius to match the provided destination to. The roads that
        # are considered are determined by the provided Strategy. Unit : Meters
        @[JSON::Field(key: "Radius")]
        getter radius : Int64?

        # Strategy that defines matching of the position onto the road network. MatchAny considers all roads
        # possible, whereas MatchMostSignificantRoad matches to the most significant road.
        @[JSON::Field(key: "Strategy")]
        getter strategy : String?

        def initialize(
          @name_hint : String? = nil,
          @on_road_threshold : Int64? = nil,
          @radius : Int64? = nil,
          @strategy : String? = nil
        )
        end
      end

      # Origin related options.
      struct IsolineOriginOptions
        include JSON::Serializable

        # Avoids actions for the provided distance. This is typically to consider for users in moving vehicles
        # who may not have sufficient time to make an action at an origin or a destination.
        @[JSON::Field(key: "AvoidActionsForDistance")]
        getter avoid_actions_for_distance : Int64?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Options to configure matching the provided position to the road network.
        @[JSON::Field(key: "Matching")]
        getter matching : Types::IsolineMatchingOptions?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::IsolineSideOfStreetOptions?

        def initialize(
          @avoid_actions_for_distance : Int64? = nil,
          @heading : Float64? = nil,
          @matching : Types::IsolineMatchingOptions? = nil,
          @side_of_street : Types::IsolineSideOfStreetOptions? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is Scooter
      struct IsolineScooterOptions
        include JSON::Serializable

        # Engine type of the vehicle.
        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::IsolineVehicleLicensePlate?

        # Maximum speed specified. Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        def initialize(
          @engine_type : String? = nil,
          @license_plate : Types::IsolineVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil
        )
        end
      end

      # Geometry of the connection between different Isoline components.
      struct IsolineShapeGeometry
        include JSON::Serializable

        # A list of Isoline Polygons, for each isoline polygon, it contains polygons of the first linear ring
        # (the outer ring) and from 2nd item to the last item (the inner rings).
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Array(Array(Float64)))?

        # A list of Isoline PolylinePolygon, for each isoline PolylinePolygon, it contains PolylinePolygon of
        # the first linear ring (the outer ring) and from 2nd item to the last item (the inner rings). For
        # more information on polyline encoding, see
        # https://github.com/heremaps/flexiblepolyline/blob/master/README.md .
        @[JSON::Field(key: "PolylinePolygon")]
        getter polyline_polygon : Array(String)?

        def initialize(
          @polygon : Array(Array(Array(Float64)))? = nil,
          @polyline_polygon : Array(String)? = nil
        )
        end
      end

      # Options to configure matching the provided position to a side of the street.
      struct IsolineSideOfStreetOptions
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Strategy that defines when the side of street position should be used. AnyStreet will always use the
        # provided position. Default Value: DividedStreetOnly
        @[JSON::Field(key: "UseWith")]
        getter use_with : String?

        def initialize(
          @position : Array(Float64),
          @use_with : String? = nil
        )
        end
      end

      # Threshold to be used for the isoline calculation. Up to 5 thresholds per provided type can be
      # requested.
      struct IsolineThresholds
        include JSON::Serializable

        # Distance to be used for the isoline calculation.
        @[JSON::Field(key: "Distance")]
        getter distance : Array(Int64)?

        # Time to be used for the isoline calculation.
        @[JSON::Field(key: "Time")]
        getter time : Array(Int64)?

        def initialize(
          @distance : Array(Int64)? = nil,
          @time : Array(Int64)? = nil
        )
        end
      end

      # Options related to traffic.
      struct IsolineTrafficOptions
        include JSON::Serializable

        # Duration for which flow traffic is considered valid. For this period, the flow traffic is used over
        # historical traffic data. Flow traffic refers to congestion, which changes very quickly. Duration in
        # seconds for which flow traffic event would be considered valid. While flow traffic event is valid it
        # will be used over the historical traffic data. Unit : seconds
        @[JSON::Field(key: "FlowEventThresholdOverride")]
        getter flow_event_threshold_override : Int64?

        # Determines if traffic should be used or ignored while calculating the route. Default Value:
        # UseTrafficData
        @[JSON::Field(key: "Usage")]
        getter usage : String?

        def initialize(
          @flow_event_threshold_override : Int64? = nil,
          @usage : String? = nil
        )
        end
      end

      # Trailer options corresponding to the vehicle.
      struct IsolineTrailerOptions
        include JSON::Serializable

        # Total number of axles of the vehicle.
        @[JSON::Field(key: "AxleCount")]
        getter axle_count : Int32?

        # Number of trailers attached to the vehicle. Default Value: 0
        @[JSON::Field(key: "TrailerCount")]
        getter trailer_count : Int32?

        def initialize(
          @axle_count : Int32? = nil,
          @trailer_count : Int32? = nil
        )
        end
      end

      # Travel mode related options for the provided travel mode.
      struct IsolineTravelModeOptions
        include JSON::Serializable

        # Travel mode options when the provided travel mode is "Car"
        @[JSON::Field(key: "Car")]
        getter car : Types::IsolineCarOptions?

        # Travel mode options when the provided travel mode is Scooter When travel mode is set to Scooter ,
        # then the avoidance option ControlledAccessHighways defaults to true .
        @[JSON::Field(key: "Scooter")]
        getter scooter : Types::IsolineScooterOptions?

        # Travel mode options when the provided travel mode is "Truck"
        @[JSON::Field(key: "Truck")]
        getter truck : Types::IsolineTruckOptions?

        def initialize(
          @car : Types::IsolineCarOptions? = nil,
          @scooter : Types::IsolineScooterOptions? = nil,
          @truck : Types::IsolineTruckOptions? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is "Truck"
      struct IsolineTruckOptions
        include JSON::Serializable

        # Total number of axles of the vehicle.
        @[JSON::Field(key: "AxleCount")]
        getter axle_count : Int32?

        # Engine type of the vehicle.
        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        # Gross weight of the vehicle including trailers, and goods at capacity. Unit : Kilograms
        @[JSON::Field(key: "GrossWeight")]
        getter gross_weight : Int64?

        # List of Hazardous cargo contained in the vehicle.
        @[JSON::Field(key: "HazardousCargos")]
        getter hazardous_cargos : Array(String)?

        # Height of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Height")]
        getter height : Int64?

        # Height of the vehicle above its first axle. Unit : centimeters
        @[JSON::Field(key: "HeightAboveFirstAxle")]
        getter height_above_first_axle : Int64?

        # Kingpin to rear axle length of the vehicle. Unit : centimeters
        @[JSON::Field(key: "KpraLength")]
        getter kpra_length : Int64?

        # Length of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Length")]
        getter length : Int64?

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::IsolineVehicleLicensePlate?

        # Maximum speed specified. Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        # Payload capacity of the vehicle and trailers attached. Unit : kilograms
        @[JSON::Field(key: "PayloadCapacity")]
        getter payload_capacity : Int64?

        # Number of tires on the vehicle.
        @[JSON::Field(key: "TireCount")]
        getter tire_count : Int32?

        # Trailer options corresponding to the vehicle.
        @[JSON::Field(key: "Trailer")]
        getter trailer : Types::IsolineTrailerOptions?

        # Type of the truck.
        @[JSON::Field(key: "TruckType")]
        getter truck_type : String?

        # The tunnel restriction code. Tunnel categories in this list indicate the restrictions which apply to
        # certain tunnels in Great Britain. They relate to the types of dangerous goods that can be
        # transported through them. Tunnel Category B Risk Level : Limited risk Restrictions : Few
        # restrictions Tunnel Category C Risk Level : Medium risk Restrictions : Some restrictions Tunnel
        # Category D Risk Level : High risk Restrictions : Many restrictions occur Tunnel Category E Risk
        # Level : Very high risk Restrictions : Restricted tunnel
        @[JSON::Field(key: "TunnelRestrictionCode")]
        getter tunnel_restriction_code : String?

        # Heaviest weight per axle irrespective of the axle type or the axle group. Meant for usage in
        # countries where the differences in axle types or axle groups are not distinguished. Unit : Kilograms
        @[JSON::Field(key: "WeightPerAxle")]
        getter weight_per_axle : Int64?

        # Specifies the total weight for the specified axle group. Meant for usage in countries that have
        # different regulations based on the axle group type. Unit : Kilograms
        @[JSON::Field(key: "WeightPerAxleGroup")]
        getter weight_per_axle_group : Types::WeightPerAxleGroup?

        # Width of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Width")]
        getter width : Int64?

        def initialize(
          @axle_count : Int32? = nil,
          @engine_type : String? = nil,
          @gross_weight : Int64? = nil,
          @hazardous_cargos : Array(String)? = nil,
          @height : Int64? = nil,
          @height_above_first_axle : Int64? = nil,
          @kpra_length : Int64? = nil,
          @length : Int64? = nil,
          @license_plate : Types::IsolineVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil,
          @payload_capacity : Int64? = nil,
          @tire_count : Int32? = nil,
          @trailer : Types::IsolineTrailerOptions? = nil,
          @truck_type : String? = nil,
          @tunnel_restriction_code : String? = nil,
          @weight_per_axle : Int64? = nil,
          @weight_per_axle_group : Types::WeightPerAxleGroup? = nil,
          @width : Int64? = nil
        )
        end
      end

      # The vehicle license plate.
      struct IsolineVehicleLicensePlate
        include JSON::Serializable

        # The last character of the License Plate.
        @[JSON::Field(key: "LastCharacter")]
        getter last_character : String?

        def initialize(
          @last_character : String? = nil
        )
        end
      end

      # The localized string.
      struct LocalizedString
        include JSON::Serializable

        # The value of the localized string.
        @[JSON::Field(key: "Value")]
        getter value : String

        # A list of BCP 47 compliant language codes for the results to be rendered in. The request uses the
        # regional default as the fallback if the requested language can't be provided.
        @[JSON::Field(key: "Language")]
        getter language : String?

        def initialize(
          @value : String,
          @language : String? = nil
        )
        end
      end

      struct OptimizeWaypointsRequest
        include JSON::Serializable

        # The start position for the route.
        @[JSON::Field(key: "Origin")]
        getter origin : Array(Float64)

        # Features that are avoided. Avoidance is on a best-case basis. If an avoidance can't be satisfied for
        # a particular case, this setting is ignored.
        @[JSON::Field(key: "Avoid")]
        getter avoid : Types::WaypointOptimizationAvoidanceOptions?

        # Clustering allows you to specify how nearby waypoints can be clustered to improve the optimized
        # sequence.
        @[JSON::Field(key: "Clustering")]
        getter clustering : Types::WaypointOptimizationClusteringOptions?

        # Departure time from the waypoint. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : String?

        # The final position for the route in the World Geodetic System (WGS 84) format: [longitude, latitude]
        # .
        @[JSON::Field(key: "Destination")]
        getter destination : Array(Float64)?

        # Destination related options.
        @[JSON::Field(key: "DestinationOptions")]
        getter destination_options : Types::WaypointOptimizationDestinationOptions?

        # Driver related options.
        @[JSON::Field(key: "Driver")]
        getter driver : Types::WaypointOptimizationDriverOptions?

        # Features to be strictly excluded while calculating the route.
        @[JSON::Field(key: "Exclude")]
        getter exclude : Types::WaypointOptimizationExclusionOptions?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Specifies the optimization criteria for the calculated sequence. Default Value: FastestRoute .
        @[JSON::Field(key: "OptimizeSequencingFor")]
        getter optimize_sequencing_for : String?

        # Origin related options.
        @[JSON::Field(key: "OriginOptions")]
        getter origin_options : Types::WaypointOptimizationOriginOptions?

        # Traffic-related options.
        @[JSON::Field(key: "Traffic")]
        getter traffic : Types::WaypointOptimizationTrafficOptions?

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. Default Value: Car
        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String?

        # Travel mode related options for the provided travel mode.
        @[JSON::Field(key: "TravelModeOptions")]
        getter travel_mode_options : Types::WaypointOptimizationTravelModeOptions?

        # List of waypoints between the Origin and Destination .
        @[JSON::Field(key: "Waypoints")]
        getter waypoints : Array(Types::WaypointOptimizationWaypoint)?

        def initialize(
          @origin : Array(Float64),
          @avoid : Types::WaypointOptimizationAvoidanceOptions? = nil,
          @clustering : Types::WaypointOptimizationClusteringOptions? = nil,
          @departure_time : String? = nil,
          @destination : Array(Float64)? = nil,
          @destination_options : Types::WaypointOptimizationDestinationOptions? = nil,
          @driver : Types::WaypointOptimizationDriverOptions? = nil,
          @exclude : Types::WaypointOptimizationExclusionOptions? = nil,
          @key : String? = nil,
          @optimize_sequencing_for : String? = nil,
          @origin_options : Types::WaypointOptimizationOriginOptions? = nil,
          @traffic : Types::WaypointOptimizationTrafficOptions? = nil,
          @travel_mode : String? = nil,
          @travel_mode_options : Types::WaypointOptimizationTravelModeOptions? = nil,
          @waypoints : Array(Types::WaypointOptimizationWaypoint)? = nil
        )
        end
      end

      struct OptimizeWaypointsResponse
        include JSON::Serializable

        # Details about the connection from one waypoint to the next, within the optimized sequence.
        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::WaypointOptimizationConnection)

        # Overall distance to travel the whole sequence.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64

        # Overall duration to travel the whole sequence. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Returns waypoints that caused the optimization problem to fail, and the constraints that were
        # unsatisfied leading to the failure.
        @[JSON::Field(key: "ImpedingWaypoints")]
        getter impeding_waypoints : Array(Types::WaypointOptimizationImpedingWaypoint)

        # Waypoints in the order of the optimized sequence.
        @[JSON::Field(key: "OptimizedWaypoints")]
        getter optimized_waypoints : Array(Types::WaypointOptimizationOptimizedWaypoint)

        # The pricing bucket for which the query is charged at.
        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # Time breakdown for the sequence.
        @[JSON::Field(key: "TimeBreakdown")]
        getter time_breakdown : Types::WaypointOptimizationTimeBreakdown

        def initialize(
          @connections : Array(Types::WaypointOptimizationConnection),
          @distance : Int64,
          @duration : Int64,
          @impeding_waypoints : Array(Types::WaypointOptimizationImpedingWaypoint),
          @optimized_waypoints : Array(Types::WaypointOptimizationOptimizedWaypoint),
          @pricing_bucket : String,
          @time_breakdown : Types::WaypointOptimizationTimeBreakdown
        )
        end
      end

      # Geometry defined as an encoded corridor - an encoded polyline with a radius that defines the width
      # of the corridor.
      struct PolylineCorridor
        include JSON::Serializable

        # An ordered list of positions used to plot a route on a map in a lossy compression format. LineString
        # and Polyline are mutually exclusive properties.
        @[JSON::Field(key: "Polyline")]
        getter polyline : String

        # Considers all roads within the provided radius to match the provided destination to. The roads that
        # are considered are determined by the provided Strategy. Unit : Meters
        @[JSON::Field(key: "Radius")]
        getter radius : Int32

        def initialize(
          @polyline : String,
          @radius : Int32
        )
        end
      end

      # Notices provide information around factors that may have influenced snapping in a manner atypical to
      # the standard use cases.
      struct RoadSnapNotice
        include JSON::Serializable

        # Code corresponding to the issue.
        @[JSON::Field(key: "Code")]
        getter code : String

        # The notice title.
        @[JSON::Field(key: "Title")]
        getter title : String

        # TracePoint indices for which the provided notice code corresponds to.
        @[JSON::Field(key: "TracePointIndexes")]
        getter trace_point_indexes : Array(Int32)

        def initialize(
          @code : String,
          @title : String,
          @trace_point_indexes : Array(Int32)
        )
        end
      end

      # Interpolated geometry for the snapped route that is overlay-able onto a map.
      struct RoadSnapSnappedGeometry
        include JSON::Serializable

        # An ordered list of positions used to plot a route on a map. LineString and Polyline are mutually
        # exclusive properties.
        @[JSON::Field(key: "LineString")]
        getter line_string : Array(Array(Float64))?

        # An ordered list of positions used to plot a route on a map in a lossy compression format. LineString
        # and Polyline are mutually exclusive properties.
        @[JSON::Field(key: "Polyline")]
        getter polyline : String?

        def initialize(
          @line_string : Array(Array(Float64))? = nil,
          @polyline : String? = nil
        )
        end
      end

      # TracePoints snapped onto the road network.
      struct RoadSnapSnappedTracePoint
        include JSON::Serializable

        # Confidence value for the correctness of this point match.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64

        # Position of the TracePoint provided within the request, at the same index.
        @[JSON::Field(key: "OriginalPosition")]
        getter original_position : Array(Float64)

        # Snapped position of the TracePoint provided within the request, at the same index.
        @[JSON::Field(key: "SnappedPosition")]
        getter snapped_position : Array(Float64)

        def initialize(
          @confidence : Float64,
          @original_position : Array(Float64),
          @snapped_position : Array(Float64)
        )
        end
      end

      # TracePoint indices for which the provided notice code corresponds to.
      struct RoadSnapTracePoint
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Speed at the specified trace point . Unit : KilometersPerHour
        @[JSON::Field(key: "Speed")]
        getter speed : Float64?

        # Timestamp of the event.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : String?

        def initialize(
          @position : Array(Float64),
          @heading : Float64? = nil,
          @speed : Float64? = nil,
          @timestamp : String? = nil
        )
        end
      end

      # Trailer options corresponding to the vehicle.
      struct RoadSnapTrailerOptions
        include JSON::Serializable

        # Number of trailers attached to the vehicle. Default Value: 0
        @[JSON::Field(key: "TrailerCount")]
        getter trailer_count : Int32?

        def initialize(
          @trailer_count : Int32? = nil
        )
        end
      end

      # Travel mode related options for the provided travel mode.
      struct RoadSnapTravelModeOptions
        include JSON::Serializable

        # Travel mode options when the provided travel mode is "Truck".
        @[JSON::Field(key: "Truck")]
        getter truck : Types::RoadSnapTruckOptions?

        def initialize(
          @truck : Types::RoadSnapTruckOptions? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is "Truck".
      struct RoadSnapTruckOptions
        include JSON::Serializable

        # Gross weight of the vehicle including trailers, and goods at capacity. Unit : Kilograms
        @[JSON::Field(key: "GrossWeight")]
        getter gross_weight : Int64?

        # List of Hazardous cargos contained in the vehicle.
        @[JSON::Field(key: "HazardousCargos")]
        getter hazardous_cargos : Array(String)?

        # Height of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Height")]
        getter height : Int64?

        # Length of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Length")]
        getter length : Int64?

        # Trailer options corresponding to the vehicle.
        @[JSON::Field(key: "Trailer")]
        getter trailer : Types::RoadSnapTrailerOptions?

        # The tunnel restriction code. Tunnel categories in this list indicate the restrictions which apply to
        # certain tunnels in Great Britain. They relate to the types of dangerous goods that can be
        # transported through them. Tunnel Category B Risk Level : Limited risk Restrictions : Few
        # restrictions Tunnel Category C Risk Level : Medium risk Restrictions : Some restrictions Tunnel
        # Category D Risk Level : High risk Restrictions : Many restrictions occur Tunnel Category E Risk
        # Level : Very high risk Restrictions : Restricted tunnel
        @[JSON::Field(key: "TunnelRestrictionCode")]
        getter tunnel_restriction_code : String?

        # Width of the vehicle in centimenters.
        @[JSON::Field(key: "Width")]
        getter width : Int64?

        def initialize(
          @gross_weight : Int64? = nil,
          @hazardous_cargos : Array(String)? = nil,
          @height : Int64? = nil,
          @length : Int64? = nil,
          @trailer : Types::RoadSnapTrailerOptions? = nil,
          @tunnel_restriction_code : String? = nil,
          @width : Int64? = nil
        )
        end
      end

      # The route.
      struct Route
        include JSON::Serializable

        # A leg is a section of a route from one waypoint to the next. A leg could be of type Vehicle,
        # Pedestrian or Ferry. Legs of different types could occur together within a single route. For
        # example, a car employing the use of a Ferry will contain Vehicle legs corresponding to journey on
        # land, and Ferry legs corresponding to the journey via Ferry.
        @[JSON::Field(key: "Legs")]
        getter legs : Array(Types::RouteLeg)

        # Important labels including names and route numbers that differentiate the current route from the
        # alternatives presented.
        @[JSON::Field(key: "MajorRoadLabels")]
        getter major_road_labels : Array(Types::RouteMajorRoadLabel)

        # Summarized details of the leg.
        @[JSON::Field(key: "Summary")]
        getter summary : Types::RouteSummary?

        def initialize(
          @legs : Array(Types::RouteLeg),
          @major_road_labels : Array(Types::RouteMajorRoadLabel),
          @summary : Types::RouteSummary? = nil
        )
        end
      end

      # Features that are allowed while calculating a route.
      struct RouteAllowOptions
        include JSON::Serializable

        # Allow Hot (High Occupancy Toll) lanes while calculating the route. Default value: false
        @[JSON::Field(key: "Hot")]
        getter hot : Bool?

        # Allow Hov (High Occupancy vehicle) lanes while calculating the route. Default value: false
        @[JSON::Field(key: "Hov")]
        getter hov : Bool?

        def initialize(
          @hot : Bool? = nil,
          @hov : Bool? = nil
        )
        end
      end

      # Areas to be avoided.
      struct RouteAvoidanceArea
        include JSON::Serializable

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::RouteAvoidanceAreaGeometry

        # Exceptions to the provided avoidance geometry, to be included while calculating the route.
        @[JSON::Field(key: "Except")]
        getter except : Array(Types::RouteAvoidanceAreaGeometry)?

        def initialize(
          @geometry : Types::RouteAvoidanceAreaGeometry,
          @except : Array(Types::RouteAvoidanceAreaGeometry)? = nil
        )
        end
      end

      # Geometry of the area to be avoided.
      struct RouteAvoidanceAreaGeometry
        include JSON::Serializable

        # Geometry defined as a bounding box. The first pair represents the X and Y coordinates (longitude and
        # latitude,) of the southwest corner of the bounding box; the second pair represents the X and Y
        # coordinates (longitude and latitude) of the northeast corner.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?

        # Geometry defined as a corridor - a LineString with a radius that defines the width of the corridor.
        @[JSON::Field(key: "Corridor")]
        getter corridor : Types::Corridor?

        # Geometry defined as a polygon with only one linear ring.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Array(Array(Float64)))?

        # Geometry defined as an encoded corridor - an encoded polyline with a radius that defines the width
        # of the corridor.
        @[JSON::Field(key: "PolylineCorridor")]
        getter polyline_corridor : Types::PolylineCorridor?

        # A list of Isoline PolylinePolygon, for each isoline PolylinePolygon, it contains PolylinePolygon of
        # the first linear ring (the outer ring) and from 2nd item to the last item (the inner rings). For
        # more information on polyline encoding, see
        # https://github.com/heremaps/flexiblepolyline/blob/master/README.md .
        @[JSON::Field(key: "PolylinePolygon")]
        getter polyline_polygon : Array(String)?

        def initialize(
          @bounding_box : Array(Float64)? = nil,
          @corridor : Types::Corridor? = nil,
          @polygon : Array(Array(Array(Float64)))? = nil,
          @polyline_corridor : Types::PolylineCorridor? = nil,
          @polyline_polygon : Array(String)? = nil
        )
        end
      end

      # Specifies options for areas to avoid when calculating the route. This is a best-effort avoidance
      # setting, meaning the router will try to honor the avoidance preferences but may still include
      # restricted areas if no feasible alternative route exists. If avoidance options are not followed, the
      # response will indicate that the avoidance criteria were violated.
      struct RouteAvoidanceOptions
        include JSON::Serializable

        # Areas to be avoided.
        @[JSON::Field(key: "Areas")]
        getter areas : Array(Types::RouteAvoidanceArea)?

        # Avoid car-shuttle-trains while calculating the route.
        @[JSON::Field(key: "CarShuttleTrains")]
        getter car_shuttle_trains : Bool?

        # Avoid controlled access highways while calculating the route.
        @[JSON::Field(key: "ControlledAccessHighways")]
        getter controlled_access_highways : Bool?

        # Avoid dirt roads while calculating the route.
        @[JSON::Field(key: "DirtRoads")]
        getter dirt_roads : Bool?

        # Avoid ferries while calculating the route.
        @[JSON::Field(key: "Ferries")]
        getter ferries : Bool?

        # Avoid roads that have seasonal closure while calculating the route.
        @[JSON::Field(key: "SeasonalClosure")]
        getter seasonal_closure : Bool?

        # Avoids roads where the specified toll transponders are the only mode of payment.
        @[JSON::Field(key: "TollRoads")]
        getter toll_roads : Bool?

        # Avoids roads where the specified toll transponders are the only mode of payment.
        @[JSON::Field(key: "TollTransponders")]
        getter toll_transponders : Bool?

        # Truck road type identifiers. BK1 through BK4 apply only to Sweden. A2,A4,B2,B4,C,D,ET2,ET4 apply
        # only to Mexico. There are currently no other supported values as of 26th April 2024.
        @[JSON::Field(key: "TruckRoadTypes")]
        getter truck_road_types : Array(String)?

        # Avoid tunnels while calculating the route.
        @[JSON::Field(key: "Tunnels")]
        getter tunnels : Bool?

        # Avoid U-turns for calculation on highways and motorways.
        @[JSON::Field(key: "UTurns")]
        getter u_turns : Bool?

        # Zone categories to be avoided.
        @[JSON::Field(key: "ZoneCategories")]
        getter zone_categories : Array(Types::RouteAvoidanceZoneCategory)?

        def initialize(
          @areas : Array(Types::RouteAvoidanceArea)? = nil,
          @car_shuttle_trains : Bool? = nil,
          @controlled_access_highways : Bool? = nil,
          @dirt_roads : Bool? = nil,
          @ferries : Bool? = nil,
          @seasonal_closure : Bool? = nil,
          @toll_roads : Bool? = nil,
          @toll_transponders : Bool? = nil,
          @truck_road_types : Array(String)? = nil,
          @tunnels : Bool? = nil,
          @u_turns : Bool? = nil,
          @zone_categories : Array(Types::RouteAvoidanceZoneCategory)? = nil
        )
        end
      end

      # Zone categories to be avoided.
      struct RouteAvoidanceZoneCategory
        include JSON::Serializable

        # Zone category to be avoided.
        @[JSON::Field(key: "Category")]
        getter category : String

        def initialize(
          @category : String
        )
        end
      end

      # Travel mode options when the provided travel mode is Car .
      struct RouteCarOptions
        include JSON::Serializable

        # Engine type of the vehicle.
        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::RouteVehicleLicensePlate?

        # Maximum speed specified. Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        def initialize(
          @engine_type : String? = nil,
          @license_plate : Types::RouteVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil
        )
        end
      end

      # Details related to the continue highway step.
      struct RouteContinueHighwayStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Details related to the continue step.
      struct RouteContinueStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        def initialize(
          @intersection : Array(Types::LocalizedString)
        )
        end
      end

      # Options related to the destination.
      struct RouteDestinationOptions
        include JSON::Serializable

        # Avoids actions for the provided distance. This is typically to consider for users in moving vehicles
        # who may not have sufficient time to make an action at an origin or a destination.
        @[JSON::Field(key: "AvoidActionsForDistance")]
        getter avoid_actions_for_distance : Int64?

        # Avoid U-turns for calculation on highways and motorways.
        @[JSON::Field(key: "AvoidUTurns")]
        getter avoid_u_turns : Bool?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Options to configure matching the provided position to the road network.
        @[JSON::Field(key: "Matching")]
        getter matching : Types::RouteMatchingOptions?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::RouteSideOfStreetOptions?

        # Duration of the stop. Unit : seconds
        @[JSON::Field(key: "StopDuration")]
        getter stop_duration : Int64?

        def initialize(
          @avoid_actions_for_distance : Int64? = nil,
          @avoid_u_turns : Bool? = nil,
          @heading : Float64? = nil,
          @matching : Types::RouteMatchingOptions? = nil,
          @side_of_street : Types::RouteSideOfStreetOptions? = nil,
          @stop_duration : Int64? = nil
        )
        end
      end

      # Driver related options.
      struct RouteDriverOptions
        include JSON::Serializable

        # Driver work-rest schedule. Stops are added to fulfil the provided rest schedule.
        @[JSON::Field(key: "Schedule")]
        getter schedule : Array(Types::RouteDriverScheduleInterval)?

        def initialize(
          @schedule : Array(Types::RouteDriverScheduleInterval)? = nil
        )
        end
      end

      # Interval of the driver work-rest schedule. Stops are added to fulfil the provided rest schedule.
      struct RouteDriverScheduleInterval
        include JSON::Serializable

        # Maximum allowed driving time before stopping to rest. Unit : seconds
        @[JSON::Field(key: "DriveDuration")]
        getter drive_duration : Int64

        # Resting time before the driver can continue driving. Unit : seconds
        @[JSON::Field(key: "RestDuration")]
        getter rest_duration : Int64

        def initialize(
          @drive_duration : Int64,
          @rest_duration : Int64
        )
        end
      end

      # Type of the emission. Valid values : Euro1, Euro2, Euro3, Euro4, Euro5, Euro6, EuroEev
      struct RouteEmissionType
        include JSON::Serializable

        # Type of the emission. Valid values : Euro1, Euro2, Euro3, Euro4, Euro5, Euro6, EuroEev
        @[JSON::Field(key: "Type")]
        getter type : String

        # The CO 2 emission classes.
        @[JSON::Field(key: "Co2EmissionClass")]
        getter co2_emission_class : String?

        def initialize(
          @type : String,
          @co2_emission_class : String? = nil
        )
        end
      end

      # Details related to the enter highway step.
      struct RouteEnterHighwayStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Specifies strict exclusion options for the route calculation. This setting mandates that the router
      # will avoid any routes that include the specified options, rather than merely attempting to minimize
      # them.
      struct RouteExclusionOptions
        include JSON::Serializable

        # List of countries to be avoided defined by two-letter or three-letter country codes.
        @[JSON::Field(key: "Countries")]
        getter countries : Array(String)

        def initialize(
          @countries : Array(String)
        )
        end
      end

      # Details related to the exit step.
      struct RouteExitStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Exit to be taken.
        @[JSON::Field(key: "RelativeExit")]
        getter relative_exit : Int32?

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @relative_exit : Int32? = nil,
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Steps of a leg that must be performed after the travel portion of the leg.
      struct RouteFerryAfterTravelStep
        include JSON::Serializable

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Type of the step.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Brief description of the step in the requested language. Only available when the TravelStepType is
        # Default.
        @[JSON::Field(key: "Instruction")]
        getter instruction : String?

        def initialize(
          @duration : Int64,
          @type : String,
          @instruction : String? = nil
        )
        end
      end

      # Details corresponding to the arrival for the leg.
      struct RouteFerryArrival
        include JSON::Serializable

        # The place details.
        @[JSON::Field(key: "Place")]
        getter place : Types::RouteFerryPlace

        # The time.
        @[JSON::Field(key: "Time")]
        getter time : String?

        def initialize(
          @place : Types::RouteFerryPlace,
          @time : String? = nil
        )
        end
      end

      # Steps of a leg that must be performed before the travel portion of the leg.
      struct RouteFerryBeforeTravelStep
        include JSON::Serializable

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Type of the step.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Brief description of the step in the requested language. Only available when the TravelStepType is
        # Default.
        @[JSON::Field(key: "Instruction")]
        getter instruction : String?

        def initialize(
          @duration : Int64,
          @type : String,
          @instruction : String? = nil
        )
        end
      end

      # Details corresponding to the departure for the leg.
      struct RouteFerryDeparture
        include JSON::Serializable

        # The place details.
        @[JSON::Field(key: "Place")]
        getter place : Types::RouteFerryPlace

        # The time.
        @[JSON::Field(key: "Time")]
        getter time : String?

        def initialize(
          @place : Types::RouteFerryPlace,
          @time : String? = nil
        )
        end
      end

      # FerryLegDetails is populated when the Leg type is Ferry, and provides additional information that is
      # specific
      struct RouteFerryLegDetails
        include JSON::Serializable

        # Steps of a leg that must be performed after the travel portion of the leg.
        @[JSON::Field(key: "AfterTravelSteps")]
        getter after_travel_steps : Array(Types::RouteFerryAfterTravelStep)

        # Details corresponding to the arrival for the leg.
        @[JSON::Field(key: "Arrival")]
        getter arrival : Types::RouteFerryArrival

        # Steps of a leg that must be performed before the travel portion of the leg.
        @[JSON::Field(key: "BeforeTravelSteps")]
        getter before_travel_steps : Array(Types::RouteFerryBeforeTravelStep)

        # Details corresponding to the departure for the leg.
        @[JSON::Field(key: "Departure")]
        getter departure : Types::RouteFerryDeparture

        # Notices are additional information returned that indicate issues that occurred during route
        # calculation.
        @[JSON::Field(key: "Notices")]
        getter notices : Array(Types::RouteFerryNotice)

        # Waypoints that were passed through during the leg. This includes the waypoints that were configured
        # with the PassThrough option.
        @[JSON::Field(key: "PassThroughWaypoints")]
        getter pass_through_waypoints : Array(Types::RoutePassThroughWaypoint)

        # Spans that were computed for the requested SpanAdditionalFeatures.
        @[JSON::Field(key: "Spans")]
        getter spans : Array(Types::RouteFerrySpan)

        # Steps of a leg that must be performed before the travel portion of the leg.
        @[JSON::Field(key: "TravelSteps")]
        getter travel_steps : Array(Types::RouteFerryTravelStep)

        # Route name of the ferry line.
        @[JSON::Field(key: "RouteName")]
        getter route_name : String?

        # Summarized details of the leg.
        @[JSON::Field(key: "Summary")]
        getter summary : Types::RouteFerrySummary?

        def initialize(
          @after_travel_steps : Array(Types::RouteFerryAfterTravelStep),
          @arrival : Types::RouteFerryArrival,
          @before_travel_steps : Array(Types::RouteFerryBeforeTravelStep),
          @departure : Types::RouteFerryDeparture,
          @notices : Array(Types::RouteFerryNotice),
          @pass_through_waypoints : Array(Types::RoutePassThroughWaypoint),
          @spans : Array(Types::RouteFerrySpan),
          @travel_steps : Array(Types::RouteFerryTravelStep),
          @route_name : String? = nil,
          @summary : Types::RouteFerrySummary? = nil
        )
        end
      end

      # Notices are additional information returned that indicate issues that occurred during route
      # calculation.
      struct RouteFerryNotice
        include JSON::Serializable

        # Code corresponding to the issue.
        @[JSON::Field(key: "Code")]
        getter code : String

        # Impact corresponding to the issue. While Low impact notices can be safely ignored, High impact
        # notices must be evaluated further to determine the impact.
        @[JSON::Field(key: "Impact")]
        getter impact : String?

        def initialize(
          @code : String,
          @impact : String? = nil
        )
        end
      end

      # Summarized details of the leg.
      struct RouteFerryOverviewSummary
        include JSON::Serializable

        # Distance of the step.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        def initialize(
          @distance : Int64,
          @duration : Int64
        )
        end
      end

      # Position provided in the request.
      struct RouteFerryPlace
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The name of the place.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Position provided in the request.
        @[JSON::Field(key: "OriginalPosition")]
        getter original_position : Array(Float64)?

        # Index of the waypoint in the request.
        @[JSON::Field(key: "WaypointIndex")]
        getter waypoint_index : Int32?

        def initialize(
          @position : Array(Float64),
          @name : String? = nil,
          @original_position : Array(Float64)? = nil,
          @waypoint_index : Int32? = nil
        )
        end
      end

      # Span computed for the requested SpanAdditionalFeatures.
      struct RouteFerrySpan
        include JSON::Serializable

        # 3 letter Country code corresponding to the Span.
        @[JSON::Field(key: "Country")]
        getter country : String?

        # Distance of the computed span. This feature doesn't split a span, but is always computed on a span
        # split by other properties. Unit : meters
        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Duration of the computed span. This feature doesn't split a span, but is always computed on a span
        # split by other properties. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64?

        # Offset in the leg geometry corresponding to the start of this span.
        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        # Provides an array of names of the ferry span in available languages.
        @[JSON::Field(key: "Names")]
        getter names : Array(Types::LocalizedString)?

        # 2-3 letter Region code corresponding to the Span. This is either a province or a state.
        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @country : String? = nil,
          @distance : Int64? = nil,
          @duration : Int64? = nil,
          @geometry_offset : Int32? = nil,
          @names : Array(Types::LocalizedString)? = nil,
          @region : String? = nil
        )
        end
      end

      # Summarized details for the leg including travel steps only. The Distance for the travel only portion
      # of the journey is the same as the Distance within the Overview summary.
      struct RouteFerrySummary
        include JSON::Serializable

        # Summarized details for the leg including before travel, travel and after travel steps.
        @[JSON::Field(key: "Overview")]
        getter overview : Types::RouteFerryOverviewSummary?

        # Summarized details for the leg including travel steps only. The Distance for the travel only portion
        # of the journey is in meters
        @[JSON::Field(key: "TravelOnly")]
        getter travel_only : Types::RouteFerryTravelOnlySummary?

        def initialize(
          @overview : Types::RouteFerryOverviewSummary? = nil,
          @travel_only : Types::RouteFerryTravelOnlySummary? = nil
        )
        end
      end

      # Summarized details for the leg including travel steps only. The Distance for the travel only portion
      # of the journey is the same as the Distance within the Overview summary.
      struct RouteFerryTravelOnlySummary
        include JSON::Serializable

        # Total duration in free flowing traffic, which is the best case or shortest duration possible to
        # cover the leg. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        def initialize(
          @duration : Int64
        )
        end
      end

      # Steps of a leg that must be performed during the travel portion of the leg.
      struct RouteFerryTravelStep
        include JSON::Serializable

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Type of the step.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Distance of the step.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Offset in the leg geometry corresponding to the start of this step.
        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        # Brief description of the step in the requested language. Only available when the TravelStepType is
        # Default.
        @[JSON::Field(key: "Instruction")]
        getter instruction : String?

        def initialize(
          @duration : Int64,
          @type : String,
          @distance : Int64? = nil,
          @geometry_offset : Int32? = nil,
          @instruction : String? = nil
        )
        end
      end

      # Details that are specific to a Keep step.
      struct RouteKeepStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # A leg is a section of a route from one waypoint to the next. A leg could be of type Vehicle,
      # Pedestrian or Ferry. Legs of different types could occur together within a single route. For
      # example, a car employing the use of a Ferry will contain Vehicle legs corresponding to journey on
      # land, and Ferry legs corresponding to the journey via Ferry.
      struct RouteLeg
        include JSON::Serializable

        # Geometry of the area to be avoided.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::RouteLegGeometry

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. Default Value: Car
        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String

        # Type of the leg.
        @[JSON::Field(key: "Type")]
        getter type : String

        # FerryLegDetails is populated when the Leg type is Ferry, and provides additional information that is
        # specific
        @[JSON::Field(key: "FerryLegDetails")]
        getter ferry_leg_details : Types::RouteFerryLegDetails?

        # List of languages for instructions within steps in the response.
        @[JSON::Field(key: "Language")]
        getter language : String?

        # Details related to the pedestrian leg.
        @[JSON::Field(key: "PedestrianLegDetails")]
        getter pedestrian_leg_details : Types::RoutePedestrianLegDetails?

        # Details related to the vehicle leg.
        @[JSON::Field(key: "VehicleLegDetails")]
        getter vehicle_leg_details : Types::RouteVehicleLegDetails?

        def initialize(
          @geometry : Types::RouteLegGeometry,
          @travel_mode : String,
          @type : String,
          @ferry_leg_details : Types::RouteFerryLegDetails? = nil,
          @language : String? = nil,
          @pedestrian_leg_details : Types::RoutePedestrianLegDetails? = nil,
          @vehicle_leg_details : Types::RouteVehicleLegDetails? = nil
        )
        end
      end

      # The returned Route leg geometry.
      struct RouteLegGeometry
        include JSON::Serializable

        # An ordered list of positions used to plot a route on a map. LineString and Polyline are mutually
        # exclusive properties.
        @[JSON::Field(key: "LineString")]
        getter line_string : Array(Array(Float64))?

        # An ordered list of positions used to plot a route on a map in a lossy compression format. LineString
        # and Polyline are mutually exclusive properties.
        @[JSON::Field(key: "Polyline")]
        getter polyline : String?

        def initialize(
          @line_string : Array(Array(Float64))? = nil,
          @polyline : String? = nil
        )
        end
      end

      # Important labels including names and route numbers that differentiate the current route from the
      # alternatives presented.
      struct RouteMajorRoadLabel
        include JSON::Serializable

        # Name of the road (localized).
        @[JSON::Field(key: "RoadName")]
        getter road_name : Types::LocalizedString?

        # Route number of the road.
        @[JSON::Field(key: "RouteNumber")]
        getter route_number : Types::RouteNumber?

        def initialize(
          @road_name : Types::LocalizedString? = nil,
          @route_number : Types::RouteNumber? = nil
        )
        end
      end

      # Options related to route matching.
      struct RouteMatchingOptions
        include JSON::Serializable

        # Attempts to match the provided position to a road similar to the provided name.
        @[JSON::Field(key: "NameHint")]
        getter name_hint : String?

        # If the distance to a highway/bridge/tunnel/sliproad is within threshold, the waypoint will be
        # snapped to the highway/bridge/tunnel/sliproad. Unit : meters
        @[JSON::Field(key: "OnRoadThreshold")]
        getter on_road_threshold : Int64?

        # Considers all roads within the provided radius to match the provided destination to. The roads that
        # are considered are determined by the provided Strategy. Unit : Meters
        @[JSON::Field(key: "Radius")]
        getter radius : Int64?

        # Strategy that defines matching of the position onto the road network. MatchAny considers all roads
        # possible, whereas MatchMostSignificantRoad matches to the most significant road.
        @[JSON::Field(key: "Strategy")]
        getter strategy : String?

        def initialize(
          @name_hint : String? = nil,
          @on_road_threshold : Int64? = nil,
          @radius : Int64? = nil,
          @strategy : String? = nil
        )
        end
      end

      # Allow Options related to the route matrix.
      struct RouteMatrixAllowOptions
        include JSON::Serializable

        # Allow Hot (High Occupancy Toll) lanes while calculating the route. Default value: false
        @[JSON::Field(key: "Hot")]
        getter hot : Bool?

        # Allow Hov (High Occupancy vehicle) lanes while calculating the route. Default value: false
        @[JSON::Field(key: "Hov")]
        getter hov : Bool?

        def initialize(
          @hot : Bool? = nil,
          @hov : Bool? = nil
        )
        end
      end

      # Provides the circle that was used while calculating the route.
      struct RouteMatrixAutoCircle
        include JSON::Serializable

        # The margin provided for the calculation.
        @[JSON::Field(key: "Margin")]
        getter margin : Int64?

        # The maximum size of the radius provided for the calculation.
        @[JSON::Field(key: "MaxRadius")]
        getter max_radius : Int64?

        def initialize(
          @margin : Int64? = nil,
          @max_radius : Int64? = nil
        )
        end
      end

      # Area to be avoided.
      struct RouteMatrixAvoidanceArea
        include JSON::Serializable

        # Geometry of the area to be avoided.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::RouteMatrixAvoidanceAreaGeometry

        def initialize(
          @geometry : Types::RouteMatrixAvoidanceAreaGeometry
        )
        end
      end

      # Geometry of the area to be avoided.
      struct RouteMatrixAvoidanceAreaGeometry
        include JSON::Serializable

        # Geometry defined as a bounding box. The first pair represents the X and Y coordinates (longitude and
        # latitude,) of the southwest corner of the bounding box; the second pair represents the X and Y
        # coordinates (longitude and latitude) of the northeast corner.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?

        # Geometry defined as a polygon with only one linear ring.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Array(Array(Float64)))?

        # A list of Isoline PolylinePolygon, for each isoline PolylinePolygon, it contains PolylinePolygon of
        # the first linear ring (the outer ring) and from second item to the last item (the inner rings). For
        # more information on polyline encoding, see
        # https://github.com/heremaps/flexiblepolyline/blob/master/README.md .
        @[JSON::Field(key: "PolylinePolygon")]
        getter polyline_polygon : Array(String)?

        def initialize(
          @bounding_box : Array(Float64)? = nil,
          @polygon : Array(Array(Array(Float64)))? = nil,
          @polyline_polygon : Array(String)? = nil
        )
        end
      end

      # Specifies options for areas to avoid when calculating the route. This is a best-effort avoidance
      # setting, meaning the router will try to honor the avoidance preferences but may still include
      # restricted areas if no feasible alternative route exists. If avoidance options are not followed, the
      # response will indicate that the avoidance criteria were violated.
      struct RouteMatrixAvoidanceOptions
        include JSON::Serializable

        # Areas to be avoided.
        @[JSON::Field(key: "Areas")]
        getter areas : Array(Types::RouteMatrixAvoidanceArea)?

        # Avoid car-shuttle-trains while calculating the route.
        @[JSON::Field(key: "CarShuttleTrains")]
        getter car_shuttle_trains : Bool?

        # Avoid controlled access highways while calculating the route.
        @[JSON::Field(key: "ControlledAccessHighways")]
        getter controlled_access_highways : Bool?

        # Avoid dirt roads while calculating the route.
        @[JSON::Field(key: "DirtRoads")]
        getter dirt_roads : Bool?

        # Avoid ferries while calculating the route.
        @[JSON::Field(key: "Ferries")]
        getter ferries : Bool?

        # Avoids roads where the specified toll transponders are the only mode of payment.
        @[JSON::Field(key: "TollRoads")]
        getter toll_roads : Bool?

        # Avoids roads where the specified toll transponders are the only mode of payment.
        @[JSON::Field(key: "TollTransponders")]
        getter toll_transponders : Bool?

        # Truck road type identifiers. BK1 through BK4 apply only to Sweden. A2,A4,B2,B4,C,D,ET2,ET4 apply
        # only to Mexico. There are currently no other supported values as of 26th April 2024.
        @[JSON::Field(key: "TruckRoadTypes")]
        getter truck_road_types : Array(String)?

        # Avoid tunnels while calculating the route.
        @[JSON::Field(key: "Tunnels")]
        getter tunnels : Bool?

        # Avoid U-turns for calculation on highways and motorways.
        @[JSON::Field(key: "UTurns")]
        getter u_turns : Bool?

        # Zone categories to be avoided.
        @[JSON::Field(key: "ZoneCategories")]
        getter zone_categories : Array(Types::RouteMatrixAvoidanceZoneCategory)?

        def initialize(
          @areas : Array(Types::RouteMatrixAvoidanceArea)? = nil,
          @car_shuttle_trains : Bool? = nil,
          @controlled_access_highways : Bool? = nil,
          @dirt_roads : Bool? = nil,
          @ferries : Bool? = nil,
          @toll_roads : Bool? = nil,
          @toll_transponders : Bool? = nil,
          @truck_road_types : Array(String)? = nil,
          @tunnels : Bool? = nil,
          @u_turns : Bool? = nil,
          @zone_categories : Array(Types::RouteMatrixAvoidanceZoneCategory)? = nil
        )
        end
      end

      # Zone categories to be avoided.
      struct RouteMatrixAvoidanceZoneCategory
        include JSON::Serializable

        # Zone category to be avoided.
        @[JSON::Field(key: "Category")]
        getter category : String?

        def initialize(
          @category : String? = nil
        )
        end
      end

      # Boundary within which the matrix is to be calculated. All data, origins and destinations outside the
      # boundary are considered invalid.
      struct RouteMatrixBoundary
        include JSON::Serializable

        # Geometry of the area to be avoided.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::RouteMatrixBoundaryGeometry?

        # No restrictions in terms of a routing boundary, and is typically used for longer routes.
        @[JSON::Field(key: "Unbounded")]
        getter unbounded : Bool?

        def initialize(
          @geometry : Types::RouteMatrixBoundaryGeometry? = nil,
          @unbounded : Bool? = nil
        )
        end
      end

      # Geometry of the routing boundary.
      struct RouteMatrixBoundaryGeometry
        include JSON::Serializable

        # Provides the circle that was used while calculating the route.
        @[JSON::Field(key: "AutoCircle")]
        getter auto_circle : Types::RouteMatrixAutoCircle?

        # Geometry defined as a bounding box. The first pair represents the X and Y coordinates (longitude and
        # latitude,) of the southwest corner of the bounding box; the second pair represents the X and Y
        # coordinates (longitude and latitude) of the northeast corner.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?

        # Geometry defined as a circle. When request routing boundary was set as AutoCircle , the response
        # routing boundary will return Circle derived from the AutoCircle settings.
        @[JSON::Field(key: "Circle")]
        getter circle : Types::Circle?

        # Geometry defined as a polygon with only one linear ring.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Array(Array(Float64)))?

        def initialize(
          @auto_circle : Types::RouteMatrixAutoCircle? = nil,
          @bounding_box : Array(Float64)? = nil,
          @circle : Types::Circle? = nil,
          @polygon : Array(Array(Array(Float64)))? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is Car .
      struct RouteMatrixCarOptions
        include JSON::Serializable

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::RouteMatrixVehicleLicensePlate?

        # Maximum speed Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        def initialize(
          @license_plate : Types::RouteMatrixVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil
        )
        end
      end

      # The route destination.
      struct RouteMatrixDestination
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Destination related options.
        @[JSON::Field(key: "Options")]
        getter options : Types::RouteMatrixDestinationOptions?

        def initialize(
          @position : Array(Float64),
          @options : Types::RouteMatrixDestinationOptions? = nil
        )
        end
      end

      # Options related to the destination.
      struct RouteMatrixDestinationOptions
        include JSON::Serializable

        # Avoids actions for the provided distance. This is typically to consider for users in moving vehicles
        # who may not have sufficient time to make an action at an origin or a destination.
        @[JSON::Field(key: "AvoidActionsForDistance")]
        getter avoid_actions_for_distance : Int64?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Options to configure matching the provided position to the road network.
        @[JSON::Field(key: "Matching")]
        getter matching : Types::RouteMatrixMatchingOptions?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::RouteMatrixSideOfStreetOptions?

        def initialize(
          @avoid_actions_for_distance : Int64? = nil,
          @heading : Float64? = nil,
          @matching : Types::RouteMatrixMatchingOptions? = nil,
          @side_of_street : Types::RouteMatrixSideOfStreetOptions? = nil
        )
        end
      end

      # The calculated route matrix containing the results for all pairs of Origins to Destination
      # positions. Each row corresponds to one entry in Origins. Each entry in the row corresponds to the
      # route from that entry in Origins to an entry in Destination positions.
      struct RouteMatrixEntry
        include JSON::Serializable

        # The total distance of travel for the route.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64

        # The expected duration of travel for the route. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Error code that occurred during calculation of the route.
        @[JSON::Field(key: "Error")]
        getter error : String?

        def initialize(
          @distance : Int64,
          @duration : Int64,
          @error : String? = nil
        )
        end
      end

      # Specifies strict exclusion options for the route calculation. This setting mandates that the router
      # will avoid any routes that include the specified options, rather than merely attempting to minimize
      # them.
      struct RouteMatrixExclusionOptions
        include JSON::Serializable

        # List of countries to be avoided defined by two-letter or three-letter country codes.
        @[JSON::Field(key: "Countries")]
        getter countries : Array(String)

        def initialize(
          @countries : Array(String)
        )
        end
      end

      # Matching options.
      struct RouteMatrixMatchingOptions
        include JSON::Serializable

        # Attempts to match the provided position to a road similar to the provided name.
        @[JSON::Field(key: "NameHint")]
        getter name_hint : String?

        # If the distance to a highway/bridge/tunnel/sliproad is within threshold, the waypoint will be
        # snapped to the highway/bridge/tunnel/sliproad. Unit : meters
        @[JSON::Field(key: "OnRoadThreshold")]
        getter on_road_threshold : Int64?

        # Considers all roads within the provided radius to match the provided destination to. The roads that
        # are considered are determined by the provided Strategy. Unit : Meters
        @[JSON::Field(key: "Radius")]
        getter radius : Int64?

        # Strategy that defines matching of the position onto the road network. MatchAny considers all roads
        # possible, whereas MatchMostSignificantRoad matches to the most significant road.
        @[JSON::Field(key: "Strategy")]
        getter strategy : String?

        def initialize(
          @name_hint : String? = nil,
          @on_road_threshold : Int64? = nil,
          @radius : Int64? = nil,
          @strategy : String? = nil
        )
        end
      end

      # The start position for the route.
      struct RouteMatrixOrigin
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Origin related options.
        @[JSON::Field(key: "Options")]
        getter options : Types::RouteMatrixOriginOptions?

        def initialize(
          @position : Array(Float64),
          @options : Types::RouteMatrixOriginOptions? = nil
        )
        end
      end

      # Origin related options.
      struct RouteMatrixOriginOptions
        include JSON::Serializable

        # Avoids actions for the provided distance. This is typically to consider for users in moving vehicles
        # who may not have sufficient time to make an action at an origin or a destination.
        @[JSON::Field(key: "AvoidActionsForDistance")]
        getter avoid_actions_for_distance : Int64?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Options to configure matching the provided position to the road network.
        @[JSON::Field(key: "Matching")]
        getter matching : Types::RouteMatrixMatchingOptions?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::RouteMatrixSideOfStreetOptions?

        def initialize(
          @avoid_actions_for_distance : Int64? = nil,
          @heading : Float64? = nil,
          @matching : Types::RouteMatrixMatchingOptions? = nil,
          @side_of_street : Types::RouteMatrixSideOfStreetOptions? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is Scooter
      struct RouteMatrixScooterOptions
        include JSON::Serializable

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::RouteMatrixVehicleLicensePlate?

        # Maximum speed. Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        def initialize(
          @license_plate : Types::RouteMatrixVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil
        )
        end
      end

      # Options to configure matching the provided position to a side of the street.
      struct RouteMatrixSideOfStreetOptions
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Strategy that defines when the side of street position should be used. AnyStreet will always use the
        # provided position. Default Value: DividedStreetOnly
        @[JSON::Field(key: "UseWith")]
        getter use_with : String?

        def initialize(
          @position : Array(Float64),
          @use_with : String? = nil
        )
        end
      end

      # Traffic related options.
      struct RouteMatrixTrafficOptions
        include JSON::Serializable

        # Duration for which flow traffic is considered valid. For this period, the flow traffic is used over
        # historical traffic data. Flow traffic refers to congestion, which changes very quickly. Duration in
        # seconds for which flow traffic event would be considered valid. While flow traffic event is valid it
        # will be used over the historical traffic data.
        @[JSON::Field(key: "FlowEventThresholdOverride")]
        getter flow_event_threshold_override : Int64?

        # Determines if traffic should be used or ignored while calculating the route. Default Value:
        # UseTrafficData
        @[JSON::Field(key: "Usage")]
        getter usage : String?

        def initialize(
          @flow_event_threshold_override : Int64? = nil,
          @usage : String? = nil
        )
        end
      end

      # Trailer options corresponding to the vehicle.
      struct RouteMatrixTrailerOptions
        include JSON::Serializable

        # Number of trailers attached to the vehicle. Default Value: 0
        @[JSON::Field(key: "TrailerCount")]
        getter trailer_count : Int32?

        def initialize(
          @trailer_count : Int32? = nil
        )
        end
      end

      # Travel mode related options for the provided travel mode.
      struct RouteMatrixTravelModeOptions
        include JSON::Serializable

        # Travel mode options when the provided travel mode is "Car"
        @[JSON::Field(key: "Car")]
        getter car : Types::RouteMatrixCarOptions?

        # Travel mode options when the provided travel mode is Scooter When travel mode is set to Scooter ,
        # then the avoidance option ControlledAccessHighways defaults to true .
        @[JSON::Field(key: "Scooter")]
        getter scooter : Types::RouteMatrixScooterOptions?

        # Travel mode options when the provided travel mode is "Truck"
        @[JSON::Field(key: "Truck")]
        getter truck : Types::RouteMatrixTruckOptions?

        def initialize(
          @car : Types::RouteMatrixCarOptions? = nil,
          @scooter : Types::RouteMatrixScooterOptions? = nil,
          @truck : Types::RouteMatrixTruckOptions? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is "Truck"
      struct RouteMatrixTruckOptions
        include JSON::Serializable

        # Total number of axles of the vehicle.
        @[JSON::Field(key: "AxleCount")]
        getter axle_count : Int32?

        # Gross weight of the vehicle including trailers, and goods at capacity. Unit : Kilograms
        @[JSON::Field(key: "GrossWeight")]
        getter gross_weight : Int64?

        # List of Hazardous cargo contained in the vehicle.
        @[JSON::Field(key: "HazardousCargos")]
        getter hazardous_cargos : Array(String)?

        # Height of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Height")]
        getter height : Int64?

        # Kingpin to rear axle length of the vehicle Unit : centimeters
        @[JSON::Field(key: "KpraLength")]
        getter kpra_length : Int64?

        # Length of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Length")]
        getter length : Int64?

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::RouteMatrixVehicleLicensePlate?

        # Maximum speed Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        # Payload capacity of the vehicle and trailers attached. Unit : kilograms
        @[JSON::Field(key: "PayloadCapacity")]
        getter payload_capacity : Int64?

        # Trailer options corresponding to the vehicle.
        @[JSON::Field(key: "Trailer")]
        getter trailer : Types::RouteMatrixTrailerOptions?

        # Type of the truck.
        @[JSON::Field(key: "TruckType")]
        getter truck_type : String?

        # The tunnel restriction code. Tunnel categories in this list indicate the restrictions which apply to
        # certain tunnels in Great Britain. They relate to the types of dangerous goods that can be
        # transported through them. Tunnel Category B Risk Level : Limited risk Restrictions : Few
        # restrictions Tunnel Category C Risk Level : Medium risk Restrictions : Some restrictions Tunnel
        # Category D Risk Level : High risk Restrictions : Many restrictions occur Tunnel Category E Risk
        # Level : Very high risk Restrictions : Restricted tunnel
        @[JSON::Field(key: "TunnelRestrictionCode")]
        getter tunnel_restriction_code : String?

        # Heaviest weight per axle irrespective of the axle type or the axle group. Meant for usage in
        # countries where the differences in axle types or axle groups are not distinguished. Unit : Kilograms
        @[JSON::Field(key: "WeightPerAxle")]
        getter weight_per_axle : Int64?

        # Specifies the total weight for the specified axle group. Meant for usage in countries that have
        # different regulations based on the axle group type.
        @[JSON::Field(key: "WeightPerAxleGroup")]
        getter weight_per_axle_group : Types::WeightPerAxleGroup?

        # Width of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Width")]
        getter width : Int64?

        def initialize(
          @axle_count : Int32? = nil,
          @gross_weight : Int64? = nil,
          @hazardous_cargos : Array(String)? = nil,
          @height : Int64? = nil,
          @kpra_length : Int64? = nil,
          @length : Int64? = nil,
          @license_plate : Types::RouteMatrixVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil,
          @payload_capacity : Int64? = nil,
          @trailer : Types::RouteMatrixTrailerOptions? = nil,
          @truck_type : String? = nil,
          @tunnel_restriction_code : String? = nil,
          @weight_per_axle : Int64? = nil,
          @weight_per_axle_group : Types::WeightPerAxleGroup? = nil,
          @width : Int64? = nil
        )
        end
      end

      # The vehicle License Plate.
      struct RouteMatrixVehicleLicensePlate
        include JSON::Serializable

        # The last character of the License Plate.
        @[JSON::Field(key: "LastCharacter")]
        getter last_character : String?

        def initialize(
          @last_character : String? = nil
        )
        end
      end

      # Notice Detail that is a range.
      struct RouteNoticeDetailRange
        include JSON::Serializable

        # Maximum value for the range.
        @[JSON::Field(key: "Max")]
        getter max : Int32?

        # Minimum value for the range.
        @[JSON::Field(key: "Min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # The route number.
      struct RouteNumber
        include JSON::Serializable

        # The route number.
        @[JSON::Field(key: "Value")]
        getter value : String

        # Directional identifier of the route.
        @[JSON::Field(key: "Direction")]
        getter direction : String?

        # List of languages for instructions corresponding to the route number.
        @[JSON::Field(key: "Language")]
        getter language : String?

        def initialize(
          @value : String,
          @direction : String? = nil,
          @language : String? = nil
        )
        end
      end

      # Origin related options.
      struct RouteOriginOptions
        include JSON::Serializable

        # Avoids actions for the provided distance. This is typically to consider for users in moving vehicles
        # who may not have sufficient time to make an action at an origin or a destination.
        @[JSON::Field(key: "AvoidActionsForDistance")]
        getter avoid_actions_for_distance : Int64?

        # Avoid U-turns for calculation on highways and motorways.
        @[JSON::Field(key: "AvoidUTurns")]
        getter avoid_u_turns : Bool?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Options to configure matching the provided position to the road network.
        @[JSON::Field(key: "Matching")]
        getter matching : Types::RouteMatchingOptions?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::RouteSideOfStreetOptions?

        def initialize(
          @avoid_actions_for_distance : Int64? = nil,
          @avoid_u_turns : Bool? = nil,
          @heading : Float64? = nil,
          @matching : Types::RouteMatchingOptions? = nil,
          @side_of_street : Types::RouteSideOfStreetOptions? = nil
        )
        end
      end

      # The place where the waypoint is passed through and not treated as a stop.
      struct RoutePassThroughPlace
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Position provided in the request.
        @[JSON::Field(key: "OriginalPosition")]
        getter original_position : Array(Float64)?

        # Index of the waypoint in the request.
        @[JSON::Field(key: "WaypointIndex")]
        getter waypoint_index : Int32?

        def initialize(
          @position : Array(Float64),
          @original_position : Array(Float64)? = nil,
          @waypoint_index : Int32? = nil
        )
        end
      end

      # If the waypoint should be treated as a stop. If yes, the route is split up into different legs
      # around the stop.
      struct RoutePassThroughWaypoint
        include JSON::Serializable

        # The place details.
        @[JSON::Field(key: "Place")]
        getter place : Types::RoutePassThroughPlace

        # Offset in the leg geometry corresponding to the start of this step.
        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        def initialize(
          @place : Types::RoutePassThroughPlace,
          @geometry_offset : Int32? = nil
        )
        end
      end

      # Details corresponding to the arrival for a leg. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
      # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
      struct RoutePedestrianArrival
        include JSON::Serializable

        # The place details.
        @[JSON::Field(key: "Place")]
        getter place : Types::RoutePedestrianPlace

        # The time.
        @[JSON::Field(key: "Time")]
        getter time : String?

        def initialize(
          @place : Types::RoutePedestrianPlace,
          @time : String? = nil
        )
        end
      end

      # Details corresponding to the departure for a leg. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
      # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
      struct RoutePedestrianDeparture
        include JSON::Serializable

        # The place details.
        @[JSON::Field(key: "Place")]
        getter place : Types::RoutePedestrianPlace

        # The time.
        @[JSON::Field(key: "Time")]
        getter time : String?

        def initialize(
          @place : Types::RoutePedestrianPlace,
          @time : String? = nil
        )
        end
      end

      # Details that are specific to a pedestrian leg.
      struct RoutePedestrianLegDetails
        include JSON::Serializable

        # Details corresponding to the arrival for the leg.
        @[JSON::Field(key: "Arrival")]
        getter arrival : Types::RoutePedestrianArrival

        # Details corresponding to the departure for the leg.
        @[JSON::Field(key: "Departure")]
        getter departure : Types::RoutePedestrianDeparture

        # Notices are additional information returned that indicate issues that occurred during route
        # calculation.
        @[JSON::Field(key: "Notices")]
        getter notices : Array(Types::RoutePedestrianNotice)

        # Waypoints that were passed through during the leg. This includes the waypoints that were configured
        # with the PassThrough option.
        @[JSON::Field(key: "PassThroughWaypoints")]
        getter pass_through_waypoints : Array(Types::RoutePassThroughWaypoint)

        # Spans that were computed for the requested SpanAdditionalFeatures.
        @[JSON::Field(key: "Spans")]
        getter spans : Array(Types::RoutePedestrianSpan)

        # Steps of a leg that must be performed before the travel portion of the leg.
        @[JSON::Field(key: "TravelSteps")]
        getter travel_steps : Array(Types::RoutePedestrianTravelStep)

        # Summarized details of the leg.
        @[JSON::Field(key: "Summary")]
        getter summary : Types::RoutePedestrianSummary?

        def initialize(
          @arrival : Types::RoutePedestrianArrival,
          @departure : Types::RoutePedestrianDeparture,
          @notices : Array(Types::RoutePedestrianNotice),
          @pass_through_waypoints : Array(Types::RoutePassThroughWaypoint),
          @spans : Array(Types::RoutePedestrianSpan),
          @travel_steps : Array(Types::RoutePedestrianTravelStep),
          @summary : Types::RoutePedestrianSummary? = nil
        )
        end
      end

      # Notices are additional information returned that indicate issues that occurred during route
      # calculation.
      struct RoutePedestrianNotice
        include JSON::Serializable

        # Code corresponding to the issue.
        @[JSON::Field(key: "Code")]
        getter code : String

        # Impact corresponding to the issue. While Low impact notices can be safely ignored, High impact
        # notices must be evaluated further to determine the impact.
        @[JSON::Field(key: "Impact")]
        getter impact : String?

        def initialize(
          @code : String,
          @impact : String? = nil
        )
        end
      end

      # Options related to the pedestrian.
      struct RoutePedestrianOptions
        include JSON::Serializable

        # Walking speed in Kilometers per hour.
        @[JSON::Field(key: "Speed")]
        getter speed : Float64?

        def initialize(
          @speed : Float64? = nil
        )
        end
      end

      # Provides a summary of a pedestrian route step.
      struct RoutePedestrianOverviewSummary
        include JSON::Serializable

        # Distance of the step.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64

        # Duration of the step.
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        def initialize(
          @distance : Int64,
          @duration : Int64
        )
        end
      end

      # Place details corresponding to the arrival or departure.
      struct RoutePedestrianPlace
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The name of the place.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Position provided in the request.
        @[JSON::Field(key: "OriginalPosition")]
        getter original_position : Array(Float64)?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : String?

        # Index of the waypoint in the request.
        @[JSON::Field(key: "WaypointIndex")]
        getter waypoint_index : Int32?

        def initialize(
          @position : Array(Float64),
          @name : String? = nil,
          @original_position : Array(Float64)? = nil,
          @side_of_street : String? = nil,
          @waypoint_index : Int32? = nil
        )
        end
      end

      # Span computed for the requested SpanAdditionalFeatures.
      struct RoutePedestrianSpan
        include JSON::Serializable

        # Duration of the computed span without traffic congestion. Unit : seconds
        @[JSON::Field(key: "BestCaseDuration")]
        getter best_case_duration : Int64?

        # 3 letter Country code corresponding to the Span.
        @[JSON::Field(key: "Country")]
        getter country : String?

        # Distance of the computed span. This feature doesn't split a span, but is always computed on a span
        # split by other properties.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Duration of the computed span. This feature doesn't split a span, but is always computed on a span
        # split by other properties. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64?

        # Dynamic speed details corresponding to the span. Unit : KilometersPerHour
        @[JSON::Field(key: "DynamicSpeed")]
        getter dynamic_speed : Types::RouteSpanDynamicSpeedDetails?

        # Functional classification of the road segment corresponding to the span.
        @[JSON::Field(key: "FunctionalClassification")]
        getter functional_classification : Int32?

        # Offset in the leg geometry corresponding to the start of this span.
        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        # Incidents corresponding to the span. These index into the Incidents in the parent Leg.
        @[JSON::Field(key: "Incidents")]
        getter incidents : Array(Int32)?

        # Provides an array of names of the pedestrian span in available languages.
        @[JSON::Field(key: "Names")]
        getter names : Array(Types::LocalizedString)?

        # Access attributes for a pedestrian corresponding to the span.
        @[JSON::Field(key: "PedestrianAccess")]
        getter pedestrian_access : Array(String)?

        # 2-3 letter Region code corresponding to the Span. This is either a province or a state.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # Attributes for the road segment corresponding to the span.
        @[JSON::Field(key: "RoadAttributes")]
        getter road_attributes : Array(String)?

        # Designated route name or number corresponding to the span.
        @[JSON::Field(key: "RouteNumbers")]
        getter route_numbers : Array(Types::RouteNumber)?

        # Speed limit details corresponding to the span. Unit : KilometersPerHour
        @[JSON::Field(key: "SpeedLimit")]
        getter speed_limit : Types::RouteSpanSpeedLimitDetails?

        # Duration of the computed span under typical traffic congestion. Unit : seconds
        @[JSON::Field(key: "TypicalDuration")]
        getter typical_duration : Int64?

        def initialize(
          @best_case_duration : Int64? = nil,
          @country : String? = nil,
          @distance : Int64? = nil,
          @duration : Int64? = nil,
          @dynamic_speed : Types::RouteSpanDynamicSpeedDetails? = nil,
          @functional_classification : Int32? = nil,
          @geometry_offset : Int32? = nil,
          @incidents : Array(Int32)? = nil,
          @names : Array(Types::LocalizedString)? = nil,
          @pedestrian_access : Array(String)? = nil,
          @region : String? = nil,
          @road_attributes : Array(String)? = nil,
          @route_numbers : Array(Types::RouteNumber)? = nil,
          @speed_limit : Types::RouteSpanSpeedLimitDetails? = nil,
          @typical_duration : Int64? = nil
        )
        end
      end

      # Summarized details for the leg including before travel, travel and after travel steps.
      struct RoutePedestrianSummary
        include JSON::Serializable

        # Summarized details for the leg including before travel, travel and after travel steps.
        @[JSON::Field(key: "Overview")]
        getter overview : Types::RoutePedestrianOverviewSummary?

        # Summarized details for the leg including travel steps only. The Distance for the travel only portion
        # of the journey is in meters
        @[JSON::Field(key: "TravelOnly")]
        getter travel_only : Types::RoutePedestrianTravelOnlySummary?

        def initialize(
          @overview : Types::RoutePedestrianOverviewSummary? = nil,
          @travel_only : Types::RoutePedestrianTravelOnlySummary? = nil
        )
        end
      end

      # Summarized details for the leg including travel steps.
      struct RoutePedestrianTravelOnlySummary
        include JSON::Serializable

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        def initialize(
          @duration : Int64
        )
        end
      end

      # Steps of a leg that must be performed during the travel portion of the leg.
      struct RoutePedestrianTravelStep
        include JSON::Serializable

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Type of the step.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Details related to the continue step.
        @[JSON::Field(key: "ContinueStepDetails")]
        getter continue_step_details : Types::RouteContinueStepDetails?

        # Details of the current road. See RouteRoad for details of sub-attributes.
        @[JSON::Field(key: "CurrentRoad")]
        getter current_road : Types::RouteRoad?

        # Distance of the step.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Exit number of the road exit, if applicable.
        @[JSON::Field(key: "ExitNumber")]
        getter exit_number : Array(Types::LocalizedString)?

        # Offset in the leg geometry corresponding to the start of this step.
        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        # Brief description of the step in the requested language. Only available when the TravelStepType is
        # Default.
        @[JSON::Field(key: "Instruction")]
        getter instruction : String?

        # Details that are specific to a Keep step.
        @[JSON::Field(key: "KeepStepDetails")]
        getter keep_step_details : Types::RouteKeepStepDetails?

        # Details of the next road. See RouteRoad for details of sub-attributes.
        @[JSON::Field(key: "NextRoad")]
        getter next_road : Types::RouteRoad?

        # Details that are specific to a Roundabout Enter step.
        @[JSON::Field(key: "RoundaboutEnterStepDetails")]
        getter roundabout_enter_step_details : Types::RouteRoundaboutEnterStepDetails?

        # Details that are specific to a Roundabout Exit step.
        @[JSON::Field(key: "RoundaboutExitStepDetails")]
        getter roundabout_exit_step_details : Types::RouteRoundaboutExitStepDetails?

        # Details that are specific to a Roundabout Pass step.
        @[JSON::Field(key: "RoundaboutPassStepDetails")]
        getter roundabout_pass_step_details : Types::RouteRoundaboutPassStepDetails?

        # Sign post information of the action, applicable only for TurnByTurn steps. See RouteSignpost for
        # details of sub-attributes.
        @[JSON::Field(key: "Signpost")]
        getter signpost : Types::RouteSignpost?

        # Details that are specific to a turn step.
        @[JSON::Field(key: "TurnStepDetails")]
        getter turn_step_details : Types::RouteTurnStepDetails?

        def initialize(
          @duration : Int64,
          @type : String,
          @continue_step_details : Types::RouteContinueStepDetails? = nil,
          @current_road : Types::RouteRoad? = nil,
          @distance : Int64? = nil,
          @exit_number : Array(Types::LocalizedString)? = nil,
          @geometry_offset : Int32? = nil,
          @instruction : String? = nil,
          @keep_step_details : Types::RouteKeepStepDetails? = nil,
          @next_road : Types::RouteRoad? = nil,
          @roundabout_enter_step_details : Types::RouteRoundaboutEnterStepDetails? = nil,
          @roundabout_exit_step_details : Types::RouteRoundaboutExitStepDetails? = nil,
          @roundabout_pass_step_details : Types::RouteRoundaboutPassStepDetails? = nil,
          @signpost : Types::RouteSignpost? = nil,
          @turn_step_details : Types::RouteTurnStepDetails? = nil
        )
        end
      end

      # Details that are specific to a ramp step.
      struct RouteRampStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Notices are additional information returned that indicate issues that occurred during route
      # calculation.
      struct RouteResponseNotice
        include JSON::Serializable

        # Code corresponding to the issue.
        @[JSON::Field(key: "Code")]
        getter code : String

        # Impact corresponding to the issue. While Low impact notices can be safely ignored, High impact
        # notices must be evaluated further to determine the impact.
        @[JSON::Field(key: "Impact")]
        getter impact : String?

        def initialize(
          @code : String,
          @impact : String? = nil
        )
        end
      end

      # The road on the route.
      struct RouteRoad
        include JSON::Serializable

        # Name of the road (localized).
        @[JSON::Field(key: "RoadName")]
        getter road_name : Array(Types::LocalizedString)

        # Route number of the road.
        @[JSON::Field(key: "RouteNumber")]
        getter route_number : Array(Types::RouteNumber)

        # Names of destinations that can be reached when traveling on the road.
        @[JSON::Field(key: "Towards")]
        getter towards : Array(Types::LocalizedString)

        # The type of road.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @road_name : Array(Types::LocalizedString),
          @route_number : Array(Types::RouteNumber),
          @towards : Array(Types::LocalizedString),
          @type : String? = nil
        )
        end
      end

      # Details about the roundabout leg.
      struct RouteRoundaboutEnterStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Details about the roundabout step.
      struct RouteRoundaboutExitStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Exit to be taken.
        @[JSON::Field(key: "RelativeExit")]
        getter relative_exit : Int32?

        # Angle of the roundabout.
        @[JSON::Field(key: "RoundaboutAngle")]
        getter roundabout_angle : Float64?

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @relative_exit : Int32? = nil,
          @roundabout_angle : Float64? = nil,
          @steering_direction : String? = nil
        )
        end
      end

      # Details about the step.
      struct RouteRoundaboutPassStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is Scooter
      struct RouteScooterOptions
        include JSON::Serializable

        # Engine type of the vehicle.
        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::RouteVehicleLicensePlate?

        # Maximum speed Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        def initialize(
          @engine_type : String? = nil,
          @license_plate : Types::RouteVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil
        )
        end
      end

      # Options to configure matching the provided position to a side of the street.
      struct RouteSideOfStreetOptions
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Strategy that defines when the side of street position should be used. Default Value:
        # DividedStreetOnly
        @[JSON::Field(key: "UseWith")]
        getter use_with : String?

        def initialize(
          @position : Array(Float64),
          @use_with : String? = nil
        )
        end
      end

      # Sign post information of the action, applicable only for TurnByTurn steps. See RouteSignpost for
      # details of sub-attributes.
      struct RouteSignpost
        include JSON::Serializable

        # Labels present on the sign post.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(Types::RouteSignpostLabel)

        def initialize(
          @labels : Array(Types::RouteSignpostLabel)
        )
        end
      end

      # Labels presented on the sign post.
      struct RouteSignpostLabel
        include JSON::Serializable

        # Route number of the road.
        @[JSON::Field(key: "RouteNumber")]
        getter route_number : Types::RouteNumber?

        # The Signpost text.
        @[JSON::Field(key: "Text")]
        getter text : Types::LocalizedString?

        def initialize(
          @route_number : Types::RouteNumber? = nil,
          @text : Types::LocalizedString? = nil
        )
        end
      end

      # Details about the dynamic speed. Unit : KilometersPerHour
      struct RouteSpanDynamicSpeedDetails
        include JSON::Serializable

        # Estimated speed while traversing the span without traffic congestion. Unit : KilometersPerHour
        @[JSON::Field(key: "BestCaseSpeed")]
        getter best_case_speed : Float64?

        # Estimated time to turn from this span into the next. Unit : seconds
        @[JSON::Field(key: "TurnDuration")]
        getter turn_duration : Int64?

        # Estimated speed while traversing the span under typical traffic congestion. Unit : KilometersPerHour
        @[JSON::Field(key: "TypicalSpeed")]
        getter typical_speed : Float64?

        def initialize(
          @best_case_speed : Float64? = nil,
          @turn_duration : Int64? = nil,
          @typical_speed : Float64? = nil
        )
        end
      end

      # Details about the speed limit corresponding to the span. Unit : KilometersPerHour
      struct RouteSpanSpeedLimitDetails
        include JSON::Serializable

        # Maximum speed. Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # If the span doesn't have a speed limit like the Autobahn.
        @[JSON::Field(key: "Unlimited")]
        getter unlimited : Bool?

        def initialize(
          @max_speed : Float64? = nil,
          @unlimited : Bool? = nil
        )
        end
      end

      # Summarized details for the leg including travel steps only. The Distance for the travel only portion
      # of the journey is the same as the Distance within the Overview summary.
      struct RouteSummary
        include JSON::Serializable

        # Distance of the route.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Duration of the route. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64?

        # Toll summary for the complete route.
        @[JSON::Field(key: "Tolls")]
        getter tolls : Types::RouteTollSummary?

        def initialize(
          @distance : Int64? = nil,
          @duration : Int64? = nil,
          @tolls : Types::RouteTollSummary? = nil
        )
        end
      end

      # Provides details about toll information along a route, including the payment sites, applicable toll
      # rates, toll systems, and the country associated with the toll collection.
      struct RouteToll
        include JSON::Serializable

        # Locations or sites where the toll fare is collected.
        @[JSON::Field(key: "PaymentSites")]
        getter payment_sites : Array(Types::RouteTollPaymentSite)

        # Toll rates that need to be paid to travel this leg of the route.
        @[JSON::Field(key: "Rates")]
        getter rates : Array(Types::RouteTollRate)

        # Toll systems are authorities that collect payments for the toll.
        @[JSON::Field(key: "Systems")]
        getter systems : Array(Int32)

        # The alpha-2 or alpha-3 character code for the country.
        @[JSON::Field(key: "Country")]
        getter country : String?

        def initialize(
          @payment_sites : Array(Types::RouteTollPaymentSite),
          @rates : Array(Types::RouteTollRate),
          @systems : Array(Int32),
          @country : String? = nil
        )
        end
      end

      # Options related to Tolls on a route.
      struct RouteTollOptions
        include JSON::Serializable

        # Specifies if the user has valid transponder with access to all toll systems. This impacts toll
        # calculation, and if true the price with transponders is used.
        @[JSON::Field(key: "AllTransponders")]
        getter all_transponders : Bool?

        # Specifies if the user has valid vignettes with access for all toll roads. If a user has a vignette
        # for a toll road, then toll cost for that road is omitted since no further payment is necessary.
        @[JSON::Field(key: "AllVignettes")]
        getter all_vignettes : Bool?

        # Currency code corresponding to the price. This is the same as Currency specified in the request.
        @[JSON::Field(key: "Currency")]
        getter currency : String?

        # Emission type of the vehicle for toll cost calculation. Valid values : Euro1, Euro2, Euro3, Euro4,
        # Euro5, Euro6, EuroEev
        @[JSON::Field(key: "EmissionType")]
        getter emission_type : Types::RouteEmissionType?

        # Vehicle category for toll cost calculation.
        @[JSON::Field(key: "VehicleCategory")]
        getter vehicle_category : String?

        def initialize(
          @all_transponders : Bool? = nil,
          @all_vignettes : Bool? = nil,
          @currency : String? = nil,
          @emission_type : Types::RouteEmissionType? = nil,
          @vehicle_category : String? = nil
        )
        end
      end

      # Details if the toll rate can be a pass that supports multiple trips.
      struct RouteTollPass
        include JSON::Serializable

        # If the pass includes the rate for the return leg of the trip.
        @[JSON::Field(key: "IncludesReturnTrip")]
        getter includes_return_trip : Bool?

        # If the pass is only valid for senior persons.
        @[JSON::Field(key: "SeniorPass")]
        getter senior_pass : Bool?

        # If the toll pass can be transferred, and how many times.
        @[JSON::Field(key: "TransferCount")]
        getter transfer_count : Int32?

        # Number of trips the pass is valid for.
        @[JSON::Field(key: "TripCount")]
        getter trip_count : Int32?

        # Period for which the pass is valid.
        @[JSON::Field(key: "ValidityPeriod")]
        getter validity_period : Types::RouteTollPassValidityPeriod?

        def initialize(
          @includes_return_trip : Bool? = nil,
          @senior_pass : Bool? = nil,
          @transfer_count : Int32? = nil,
          @trip_count : Int32? = nil,
          @validity_period : Types::RouteTollPassValidityPeriod? = nil
        )
        end
      end

      # Period for which the pass is valid.
      struct RouteTollPassValidityPeriod
        include JSON::Serializable

        # Validity period.
        @[JSON::Field(key: "Period")]
        getter period : String

        # Counts for the validity period.
        @[JSON::Field(key: "PeriodCount")]
        getter period_count : Int32?

        def initialize(
          @period : String,
          @period_count : Int32? = nil
        )
        end
      end

      # Locations or sites where the toll fare is collected.
      struct RouteTollPaymentSite
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Name of the payment site.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @position : Array(Float64),
          @name : String? = nil
        )
        end
      end

      # The toll price.
      struct RouteTollPrice
        include JSON::Serializable

        # Currency code corresponding to the price. This is the same as Currency specified in the request.
        @[JSON::Field(key: "Currency")]
        getter currency : String

        # If the price is an estimate or an exact value.
        @[JSON::Field(key: "Estimate")]
        getter estimate : Bool

        # If the price is a range or an exact value. If any of the toll fares making up the route is a range,
        # the overall price is also a range.
        @[JSON::Field(key: "Range")]
        getter range : Bool

        # Exact price, if not a range.
        @[JSON::Field(key: "Value")]
        getter value : Float64

        # Duration for which the price corresponds to. Unit : seconds
        @[JSON::Field(key: "PerDuration")]
        getter per_duration : Int64?

        # Price range with a minimum and maximum value, if a range.
        @[JSON::Field(key: "RangeValue")]
        getter range_value : Types::RouteTollPriceValueRange?

        def initialize(
          @currency : String,
          @estimate : Bool,
          @range : Bool,
          @value : Float64,
          @per_duration : Int64? = nil,
          @range_value : Types::RouteTollPriceValueRange? = nil
        )
        end
      end

      # Summary of the route and toll price.
      struct RouteTollPriceSummary
        include JSON::Serializable

        # Currency code corresponding to the price. This is the same as Currency specified in the request.
        @[JSON::Field(key: "Currency")]
        getter currency : String

        # If the price is an estimate or an exact value.
        @[JSON::Field(key: "Estimate")]
        getter estimate : Bool

        # If the price is a range or an exact value. If any of the toll fares making up the route is a range,
        # the overall price is also a range.
        @[JSON::Field(key: "Range")]
        getter range : Bool

        # Exact price, if not a range.
        @[JSON::Field(key: "Value")]
        getter value : Float64

        # Price range with a minimum and maximum value, if a range.
        @[JSON::Field(key: "RangeValue")]
        getter range_value : Types::RouteTollPriceValueRange?

        def initialize(
          @currency : String,
          @estimate : Bool,
          @range : Bool,
          @value : Float64,
          @range_value : Types::RouteTollPriceValueRange? = nil
        )
        end
      end

      # Price range with a minimum and maximum value, if a range.
      struct RouteTollPriceValueRange
        include JSON::Serializable

        # Maximum price.
        @[JSON::Field(key: "Max")]
        getter max : Float64

        # Minimum price.
        @[JSON::Field(key: "Min")]
        getter min : Float64

        def initialize(
          @max : Float64,
          @min : Float64
        )
        end
      end

      # The toll rate.
      struct RouteTollRate
        include JSON::Serializable

        # The Toll rate Id.
        @[JSON::Field(key: "Id")]
        getter id : String

        # Price in the local regional currency.
        @[JSON::Field(key: "LocalPrice")]
        getter local_price : Types::RouteTollPrice

        # The name of the toll.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Accepted payment methods at the toll.
        @[JSON::Field(key: "PaymentMethods")]
        getter payment_methods : Array(String)

        # Transponders for which this toll can be applied.
        @[JSON::Field(key: "Transponders")]
        getter transponders : Array(Types::RouteTransponder)

        # Time when the rate is valid.
        @[JSON::Field(key: "ApplicableTimes")]
        getter applicable_times : String?

        # Price in the converted currency as specified in the request.
        @[JSON::Field(key: "ConvertedPrice")]
        getter converted_price : Types::RouteTollPrice?

        # Details if the toll rate can be a pass that supports multiple trips.
        @[JSON::Field(key: "Pass")]
        getter pass : Types::RouteTollPass?

        def initialize(
          @id : String,
          @local_price : Types::RouteTollPrice,
          @name : String,
          @payment_methods : Array(String),
          @transponders : Array(Types::RouteTransponder),
          @applicable_times : String? = nil,
          @converted_price : Types::RouteTollPrice? = nil,
          @pass : Types::RouteTollPass? = nil
        )
        end
      end

      # The toll summary for the complete route.
      struct RouteTollSummary
        include JSON::Serializable

        # Total toll summary for the complete route. Total is the only summary available today.
        @[JSON::Field(key: "Total")]
        getter total : Types::RouteTollPriceSummary?

        def initialize(
          @total : Types::RouteTollPriceSummary? = nil
        )
        end
      end

      # Toll systems are authorities that collect payments for the toll.
      struct RouteTollSystem
        include JSON::Serializable

        # The toll system name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Traffic options for the route.
      struct RouteTrafficOptions
        include JSON::Serializable

        # Duration for which flow traffic is considered valid. For this period, the flow traffic is used over
        # historical traffic data. Flow traffic refers to congestion, which changes very quickly. Duration in
        # seconds for which flow traffic event would be considered valid. While flow traffic event is valid it
        # will be used over the historical traffic data.
        @[JSON::Field(key: "FlowEventThresholdOverride")]
        getter flow_event_threshold_override : Int64?

        # Determines if traffic should be used or ignored while calculating the route. Default Value:
        # UseTrafficData
        @[JSON::Field(key: "Usage")]
        getter usage : String?

        def initialize(
          @flow_event_threshold_override : Int64? = nil,
          @usage : String? = nil
        )
        end
      end

      # Trailer options corresponding to the vehicle.
      struct RouteTrailerOptions
        include JSON::Serializable

        # Total number of axles of the vehicle.
        @[JSON::Field(key: "AxleCount")]
        getter axle_count : Int32?

        # Number of trailers attached to the vehicle. Default Value: 0
        @[JSON::Field(key: "TrailerCount")]
        getter trailer_count : Int32?

        def initialize(
          @axle_count : Int32? = nil,
          @trailer_count : Int32? = nil
        )
        end
      end

      # Transponders for which this toll can be applied.
      struct RouteTransponder
        include JSON::Serializable

        # Names of the toll system collecting the toll.
        @[JSON::Field(key: "SystemName")]
        getter system_name : String?

        def initialize(
          @system_name : String? = nil
        )
        end
      end

      # Travel mode related options for the provided travel mode.
      struct RouteTravelModeOptions
        include JSON::Serializable

        # Travel mode options when the provided travel mode is "Car"
        @[JSON::Field(key: "Car")]
        getter car : Types::RouteCarOptions?

        # Travel mode options when the provided travel mode is "Pedestrian"
        @[JSON::Field(key: "Pedestrian")]
        getter pedestrian : Types::RoutePedestrianOptions?

        # Travel mode options when the provided travel mode is Scooter When travel mode is set to Scooter ,
        # then the avoidance option ControlledAccessHighways defaults to true .
        @[JSON::Field(key: "Scooter")]
        getter scooter : Types::RouteScooterOptions?

        # Travel mode options when the provided travel mode is "Truck"
        @[JSON::Field(key: "Truck")]
        getter truck : Types::RouteTruckOptions?

        def initialize(
          @car : Types::RouteCarOptions? = nil,
          @pedestrian : Types::RoutePedestrianOptions? = nil,
          @scooter : Types::RouteScooterOptions? = nil,
          @truck : Types::RouteTruckOptions? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is "Truck"
      struct RouteTruckOptions
        include JSON::Serializable

        # Total number of axles of the vehicle.
        @[JSON::Field(key: "AxleCount")]
        getter axle_count : Int32?

        # Engine type of the vehicle.
        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        # Gross weight of the vehicle including trailers, and goods at capacity. Unit : Kilograms
        @[JSON::Field(key: "GrossWeight")]
        getter gross_weight : Int64?

        # List of Hazardous cargo contained in the vehicle.
        @[JSON::Field(key: "HazardousCargos")]
        getter hazardous_cargos : Array(String)?

        # Height of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Height")]
        getter height : Int64?

        # Height of the vehicle above its first axle. Unit : centimeters
        @[JSON::Field(key: "HeightAboveFirstAxle")]
        getter height_above_first_axle : Int64?

        # Kingpin to rear axle length of the vehicle. Unit : centimeters
        @[JSON::Field(key: "KpraLength")]
        getter kpra_length : Int64?

        # Length of the vehicle. Unit : c
        @[JSON::Field(key: "Length")]
        getter length : Int64?

        # The vehicle License Plate.
        @[JSON::Field(key: "LicensePlate")]
        getter license_plate : Types::RouteVehicleLicensePlate?

        # Maximum speed Unit : KilometersPerHour
        @[JSON::Field(key: "MaxSpeed")]
        getter max_speed : Float64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Int32?

        # Payload capacity of the vehicle and trailers attached. Unit : kilograms
        @[JSON::Field(key: "PayloadCapacity")]
        getter payload_capacity : Int64?

        # Number of tires on the vehicle.
        @[JSON::Field(key: "TireCount")]
        getter tire_count : Int32?

        # Trailer options corresponding to the vehicle.
        @[JSON::Field(key: "Trailer")]
        getter trailer : Types::RouteTrailerOptions?

        # Type of the truck.
        @[JSON::Field(key: "TruckType")]
        getter truck_type : String?

        # The tunnel restriction code. Tunnel categories in this list indicate the restrictions which apply to
        # certain tunnels in Great Britain. They relate to the types of dangerous goods that can be
        # transported through them. Tunnel Category B Risk Level : Limited risk Restrictions : Few
        # restrictions Tunnel Category C Risk Level : Medium risk Restrictions : Some restrictions Tunnel
        # Category D Risk Level : High risk Restrictions : Many restrictions occur Tunnel Category E Risk
        # Level : Very high risk Restrictions : Restricted tunnel
        @[JSON::Field(key: "TunnelRestrictionCode")]
        getter tunnel_restriction_code : String?

        # Heaviest weight per axle irrespective of the axle type or the axle group. Meant for usage in
        # countries where the differences in axle types or axle groups are not distinguished. Unit : Kilograms
        @[JSON::Field(key: "WeightPerAxle")]
        getter weight_per_axle : Int64?

        # Specifies the total weight for the specified axle group. Meant for usage in countries that have
        # different regulations based on the axle group type. Unit : Kilograms
        @[JSON::Field(key: "WeightPerAxleGroup")]
        getter weight_per_axle_group : Types::WeightPerAxleGroup?

        # Width of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Width")]
        getter width : Int64?

        def initialize(
          @axle_count : Int32? = nil,
          @engine_type : String? = nil,
          @gross_weight : Int64? = nil,
          @hazardous_cargos : Array(String)? = nil,
          @height : Int64? = nil,
          @height_above_first_axle : Int64? = nil,
          @kpra_length : Int64? = nil,
          @length : Int64? = nil,
          @license_plate : Types::RouteVehicleLicensePlate? = nil,
          @max_speed : Float64? = nil,
          @occupancy : Int32? = nil,
          @payload_capacity : Int64? = nil,
          @tire_count : Int32? = nil,
          @trailer : Types::RouteTrailerOptions? = nil,
          @truck_type : String? = nil,
          @tunnel_restriction_code : String? = nil,
          @weight_per_axle : Int64? = nil,
          @weight_per_axle_group : Types::WeightPerAxleGroup? = nil,
          @width : Int64? = nil
        )
        end
      end

      # Details related to the turn step.
      struct RouteTurnStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Details related to the U-turn step.
      struct RouteUTurnStepDetails
        include JSON::Serializable

        # Name of the intersection, if applicable to the step.
        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Types::LocalizedString)

        # Steering direction for the step.
        @[JSON::Field(key: "SteeringDirection")]
        getter steering_direction : String?

        # Angle of the turn.
        @[JSON::Field(key: "TurnAngle")]
        getter turn_angle : Float64?

        # Intensity of the turn.
        @[JSON::Field(key: "TurnIntensity")]
        getter turn_intensity : String?

        def initialize(
          @intersection : Array(Types::LocalizedString),
          @steering_direction : String? = nil,
          @turn_angle : Float64? = nil,
          @turn_intensity : String? = nil
        )
        end
      end

      # Details corresponding to the arrival for a leg.
      struct RouteVehicleArrival
        include JSON::Serializable

        # The place details.
        @[JSON::Field(key: "Place")]
        getter place : Types::RouteVehiclePlace

        # The time.
        @[JSON::Field(key: "Time")]
        getter time : String?

        def initialize(
          @place : Types::RouteVehiclePlace,
          @time : String? = nil
        )
        end
      end

      # Details corresponding to the departure for the leg.
      struct RouteVehicleDeparture
        include JSON::Serializable

        # The place details.
        @[JSON::Field(key: "Place")]
        getter place : Types::RouteVehiclePlace

        # The departure time.
        @[JSON::Field(key: "Time")]
        getter time : String?

        def initialize(
          @place : Types::RouteVehiclePlace,
          @time : String? = nil
        )
        end
      end

      # Incidents corresponding to this leg of the route.
      struct RouteVehicleIncident
        include JSON::Serializable

        # Brief readable description of the incident.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # End timestamp of the incident.
        @[JSON::Field(key: "EndTime")]
        getter end_time : String?

        # Severity of the incident Critical - The part of the route the incident affects is unusable. Major-
        # Major impact on the leg duration, for example stop and go Minor- Minor impact on the leg duration,
        # for example traffic jam Low - Low on duration, for example slightly increased traffic
        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # Start time of the incident.
        @[JSON::Field(key: "StartTime")]
        getter start_time : String?

        # Type of the incident.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @description : String? = nil,
          @end_time : String? = nil,
          @severity : String? = nil,
          @start_time : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Steps of a leg that correspond to the travel portion of the leg.
      struct RouteVehicleLegDetails
        include JSON::Serializable

        # Details corresponding to the arrival for the leg.
        @[JSON::Field(key: "Arrival")]
        getter arrival : Types::RouteVehicleArrival

        # Details corresponding to the departure for the leg.
        @[JSON::Field(key: "Departure")]
        getter departure : Types::RouteVehicleDeparture

        # Incidents corresponding to this leg of the route.
        @[JSON::Field(key: "Incidents")]
        getter incidents : Array(Types::RouteVehicleIncident)

        # Notices are additional information returned that indicate issues that occurred during route
        # calculation.
        @[JSON::Field(key: "Notices")]
        getter notices : Array(Types::RouteVehicleNotice)

        # Waypoints that were passed through during the leg. This includes the waypoints that were configured
        # with the PassThrough option.
        @[JSON::Field(key: "PassThroughWaypoints")]
        getter pass_through_waypoints : Array(Types::RoutePassThroughWaypoint)

        # Spans that were computed for the requested SpanAdditionalFeatures.
        @[JSON::Field(key: "Spans")]
        getter spans : Array(Types::RouteVehicleSpan)

        # Toll systems are authorities that collect payments for the toll.
        @[JSON::Field(key: "TollSystems")]
        getter toll_systems : Array(Types::RouteTollSystem)

        # Toll related options.
        @[JSON::Field(key: "Tolls")]
        getter tolls : Array(Types::RouteToll)

        # Steps of a leg that must be performed before the travel portion of the leg.
        @[JSON::Field(key: "TravelSteps")]
        getter travel_steps : Array(Types::RouteVehicleTravelStep)

        # Truck road type identifiers. BK1 through BK4 apply only to Sweden. A2,A4,B2,B4,C,D,ET2,ET4 apply
        # only to Mexico. There are currently no other supported values as of 26th April 2024.
        @[JSON::Field(key: "TruckRoadTypes")]
        getter truck_road_types : Array(String)

        # Zones corresponding to this leg of the route.
        @[JSON::Field(key: "Zones")]
        getter zones : Array(Types::RouteZone)

        # Summarized details of the leg.
        @[JSON::Field(key: "Summary")]
        getter summary : Types::RouteVehicleSummary?

        def initialize(
          @arrival : Types::RouteVehicleArrival,
          @departure : Types::RouteVehicleDeparture,
          @incidents : Array(Types::RouteVehicleIncident),
          @notices : Array(Types::RouteVehicleNotice),
          @pass_through_waypoints : Array(Types::RoutePassThroughWaypoint),
          @spans : Array(Types::RouteVehicleSpan),
          @toll_systems : Array(Types::RouteTollSystem),
          @tolls : Array(Types::RouteToll),
          @travel_steps : Array(Types::RouteVehicleTravelStep),
          @truck_road_types : Array(String),
          @zones : Array(Types::RouteZone),
          @summary : Types::RouteVehicleSummary? = nil
        )
        end
      end

      # License plate information of the vehicle. Currently, only the last character is used where license
      # plate based controlled access is enforced.
      struct RouteVehicleLicensePlate
        include JSON::Serializable

        # The last character of the License Plate.
        @[JSON::Field(key: "LastCharacter")]
        getter last_character : String?

        def initialize(
          @last_character : String? = nil
        )
        end
      end

      # Notices are additional information returned that indicate issues that occurred during route
      # calculation.
      struct RouteVehicleNotice
        include JSON::Serializable

        # Code corresponding to the issue.
        @[JSON::Field(key: "Code")]
        getter code : String

        # Additional details of the notice.
        @[JSON::Field(key: "Details")]
        getter details : Array(Types::RouteVehicleNoticeDetail)

        # Impact corresponding to the issue. While Low impact notices can be safely ignored, High impact
        # notices must be evaluated further to determine the impact.
        @[JSON::Field(key: "Impact")]
        getter impact : String?

        def initialize(
          @code : String,
          @details : Array(Types::RouteVehicleNoticeDetail),
          @impact : String? = nil
        )
        end
      end

      # Additional details of the notice.
      struct RouteVehicleNoticeDetail
        include JSON::Serializable

        # The notice title.
        @[JSON::Field(key: "Title")]
        getter title : String?

        # Any violated constraints.
        @[JSON::Field(key: "ViolatedConstraints")]
        getter violated_constraints : Types::RouteViolatedConstraints?

        def initialize(
          @title : String? = nil,
          @violated_constraints : Types::RouteViolatedConstraints? = nil
        )
        end
      end

      # Summarized details of the leg.
      struct RouteVehicleOverviewSummary
        include JSON::Serializable

        # Distance of the step.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Total duration in free flowing traffic, which is the best case or shortest duration possible to
        # cover the leg. Unit : seconds
        @[JSON::Field(key: "BestCaseDuration")]
        getter best_case_duration : Int64?

        # Duration of the computed span under typical traffic congestion. Unit : seconds
        @[JSON::Field(key: "TypicalDuration")]
        getter typical_duration : Int64?

        def initialize(
          @distance : Int64,
          @duration : Int64,
          @best_case_duration : Int64? = nil,
          @typical_duration : Int64? = nil
        )
        end
      end

      # Place details corresponding to the arrival or departure.
      struct RouteVehiclePlace
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # The name of the place.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Position provided in the request.
        @[JSON::Field(key: "OriginalPosition")]
        getter original_position : Array(Float64)?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : String?

        # Index of the waypoint in the request.
        @[JSON::Field(key: "WaypointIndex")]
        getter waypoint_index : Int32?

        def initialize(
          @position : Array(Float64),
          @name : String? = nil,
          @original_position : Array(Float64)? = nil,
          @side_of_street : String? = nil,
          @waypoint_index : Int32? = nil
        )
        end
      end

      # Span computed for the requested SpanAdditionalFeatures.
      struct RouteVehicleSpan
        include JSON::Serializable

        # Duration of the computed span without traffic congestion. Unit : seconds
        @[JSON::Field(key: "BestCaseDuration")]
        getter best_case_duration : Int64?

        # Access attributes for a car corresponding to the span.
        @[JSON::Field(key: "CarAccess")]
        getter car_access : Array(String)?

        # 3 letter Country code corresponding to the Span.
        @[JSON::Field(key: "Country")]
        getter country : String?

        # Distance of the computed span. This feature doesn't split a span, but is always computed on a span
        # split by other properties.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Duration of the computed span. This feature doesn't split a span, but is always computed on a span
        # split by other properties. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64?

        # Dynamic speed details corresponding to the span. Unit : KilometersPerHour
        @[JSON::Field(key: "DynamicSpeed")]
        getter dynamic_speed : Types::RouteSpanDynamicSpeedDetails?

        # Functional classification of the road segment corresponding to the span.
        @[JSON::Field(key: "FunctionalClassification")]
        getter functional_classification : Int32?

        # Attributes corresponding to a gate. The gate is present at the end of the returned span.
        @[JSON::Field(key: "Gate")]
        getter gate : String?

        # Offset in the leg geometry corresponding to the start of this span.
        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        # Incidents corresponding to the span. These index into the Incidents in the parent Leg.
        @[JSON::Field(key: "Incidents")]
        getter incidents : Array(Int32)?

        # Provides an array of names of the vehicle span in available languages.
        @[JSON::Field(key: "Names")]
        getter names : Array(Types::LocalizedString)?

        # Notices are additional information returned that indicate issues that occurred during route
        # calculation.
        @[JSON::Field(key: "Notices")]
        getter notices : Array(Int32)?

        # Attributes corresponding to a railway crossing. The gate is present at the end of the returned span.
        @[JSON::Field(key: "RailwayCrossing")]
        getter railway_crossing : String?

        # 2-3 letter Region code corresponding to the Span. This is either a province or a state.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # Attributes for the road segment corresponding to the span.
        @[JSON::Field(key: "RoadAttributes")]
        getter road_attributes : Array(String)?

        # Designated route name or number corresponding to the span.
        @[JSON::Field(key: "RouteNumbers")]
        getter route_numbers : Array(Types::RouteNumber)?

        # Access attributes for a scooter corresponding to the span.
        @[JSON::Field(key: "ScooterAccess")]
        getter scooter_access : Array(String)?

        # Speed limit details corresponding to the span. Unit : KilometersPerHour
        @[JSON::Field(key: "SpeedLimit")]
        getter speed_limit : Types::RouteSpanSpeedLimitDetails?

        # Toll systems are authorities that collect payments for the toll.
        @[JSON::Field(key: "TollSystems")]
        getter toll_systems : Array(Int32)?

        # Access attributes for a truck corresponding to the span.
        @[JSON::Field(key: "TruckAccess")]
        getter truck_access : Array(String)?

        # Truck road type identifiers. BK1 through BK4 apply only to Sweden. A2,A4,B2,B4,C,D,ET2,ET4 apply
        # only to Mexico. There are currently no other supported values as of 26th April 2024.
        @[JSON::Field(key: "TruckRoadTypes")]
        getter truck_road_types : Array(Int32)?

        # Duration of the computed span under typical traffic congestion. Unit : seconds
        @[JSON::Field(key: "TypicalDuration")]
        getter typical_duration : Int64?

        # Zones corresponding to this leg of the route.
        @[JSON::Field(key: "Zones")]
        getter zones : Array(Int32)?

        def initialize(
          @best_case_duration : Int64? = nil,
          @car_access : Array(String)? = nil,
          @country : String? = nil,
          @distance : Int64? = nil,
          @duration : Int64? = nil,
          @dynamic_speed : Types::RouteSpanDynamicSpeedDetails? = nil,
          @functional_classification : Int32? = nil,
          @gate : String? = nil,
          @geometry_offset : Int32? = nil,
          @incidents : Array(Int32)? = nil,
          @names : Array(Types::LocalizedString)? = nil,
          @notices : Array(Int32)? = nil,
          @railway_crossing : String? = nil,
          @region : String? = nil,
          @road_attributes : Array(String)? = nil,
          @route_numbers : Array(Types::RouteNumber)? = nil,
          @scooter_access : Array(String)? = nil,
          @speed_limit : Types::RouteSpanSpeedLimitDetails? = nil,
          @toll_systems : Array(Int32)? = nil,
          @truck_access : Array(String)? = nil,
          @truck_road_types : Array(Int32)? = nil,
          @typical_duration : Int64? = nil,
          @zones : Array(Int32)? = nil
        )
        end
      end

      # Summarized details of the route.
      struct RouteVehicleSummary
        include JSON::Serializable

        # Summarized details for the leg including before travel, travel and after travel steps.
        @[JSON::Field(key: "Overview")]
        getter overview : Types::RouteVehicleOverviewSummary?

        # Summarized details for the leg including travel steps only. The Distance for the travel only portion
        # of the journey is in meters
        @[JSON::Field(key: "TravelOnly")]
        getter travel_only : Types::RouteVehicleTravelOnlySummary?

        def initialize(
          @overview : Types::RouteVehicleOverviewSummary? = nil,
          @travel_only : Types::RouteVehicleTravelOnlySummary? = nil
        )
        end
      end

      # Summarized details of the route.
      struct RouteVehicleTravelOnlySummary
        include JSON::Serializable

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Total duration in free flowing traffic, which is the best case or shortest duration possible to
        # cover the leg. Unit : seconds
        @[JSON::Field(key: "BestCaseDuration")]
        getter best_case_duration : Int64?

        # Duration of the computed span under typical traffic congestion. Unit : seconds
        @[JSON::Field(key: "TypicalDuration")]
        getter typical_duration : Int64?

        def initialize(
          @duration : Int64,
          @best_case_duration : Int64? = nil,
          @typical_duration : Int64? = nil
        )
        end
      end

      # Steps of a leg that correspond to the travel portion of the leg.
      struct RouteVehicleTravelStep
        include JSON::Serializable

        # Duration of the step. Unit : seconds
        @[JSON::Field(key: "Duration")]
        getter duration : Int64

        # Type of the step.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Details that are specific to a Continue Highway step.
        @[JSON::Field(key: "ContinueHighwayStepDetails")]
        getter continue_highway_step_details : Types::RouteContinueHighwayStepDetails?

        # Details that are specific to a Continue step.
        @[JSON::Field(key: "ContinueStepDetails")]
        getter continue_step_details : Types::RouteContinueStepDetails?

        # Details of the current road.
        @[JSON::Field(key: "CurrentRoad")]
        getter current_road : Types::RouteRoad?

        # Distance of the step.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Details that are specific to a Enter Highway step.
        @[JSON::Field(key: "EnterHighwayStepDetails")]
        getter enter_highway_step_details : Types::RouteEnterHighwayStepDetails?

        # Exit number of the road exit, if applicable.
        @[JSON::Field(key: "ExitNumber")]
        getter exit_number : Array(Types::LocalizedString)?

        # Details that are specific to a Roundabout Exit step.
        @[JSON::Field(key: "ExitStepDetails")]
        getter exit_step_details : Types::RouteExitStepDetails?

        # Offset in the leg geometry corresponding to the start of this step.
        @[JSON::Field(key: "GeometryOffset")]
        getter geometry_offset : Int32?

        # Brief description of the step in the requested language. Only available when the TravelStepType is
        # Default.
        @[JSON::Field(key: "Instruction")]
        getter instruction : String?

        # Details that are specific to a Keep step.
        @[JSON::Field(key: "KeepStepDetails")]
        getter keep_step_details : Types::RouteKeepStepDetails?

        # Details of the next road. See RouteRoad for details of sub-attributes.
        @[JSON::Field(key: "NextRoad")]
        getter next_road : Types::RouteRoad?

        # Details that are specific to a Ramp step.
        @[JSON::Field(key: "RampStepDetails")]
        getter ramp_step_details : Types::RouteRampStepDetails?

        # Details that are specific to a Roundabout Enter step.
        @[JSON::Field(key: "RoundaboutEnterStepDetails")]
        getter roundabout_enter_step_details : Types::RouteRoundaboutEnterStepDetails?

        # Details that are specific to a Roundabout Exit step.
        @[JSON::Field(key: "RoundaboutExitStepDetails")]
        getter roundabout_exit_step_details : Types::RouteRoundaboutExitStepDetails?

        # Details that are specific to a Roundabout Pass step.
        @[JSON::Field(key: "RoundaboutPassStepDetails")]
        getter roundabout_pass_step_details : Types::RouteRoundaboutPassStepDetails?

        # Sign post information of the action, applicable only for TurnByTurn steps. See RouteSignpost for
        # details of sub-attributes.
        @[JSON::Field(key: "Signpost")]
        getter signpost : Types::RouteSignpost?

        # Details that are specific to a Turn step.
        @[JSON::Field(key: "TurnStepDetails")]
        getter turn_step_details : Types::RouteTurnStepDetails?

        # Details that are specific to a Turn step.
        @[JSON::Field(key: "UTurnStepDetails")]
        getter u_turn_step_details : Types::RouteUTurnStepDetails?

        def initialize(
          @duration : Int64,
          @type : String,
          @continue_highway_step_details : Types::RouteContinueHighwayStepDetails? = nil,
          @continue_step_details : Types::RouteContinueStepDetails? = nil,
          @current_road : Types::RouteRoad? = nil,
          @distance : Int64? = nil,
          @enter_highway_step_details : Types::RouteEnterHighwayStepDetails? = nil,
          @exit_number : Array(Types::LocalizedString)? = nil,
          @exit_step_details : Types::RouteExitStepDetails? = nil,
          @geometry_offset : Int32? = nil,
          @instruction : String? = nil,
          @keep_step_details : Types::RouteKeepStepDetails? = nil,
          @next_road : Types::RouteRoad? = nil,
          @ramp_step_details : Types::RouteRampStepDetails? = nil,
          @roundabout_enter_step_details : Types::RouteRoundaboutEnterStepDetails? = nil,
          @roundabout_exit_step_details : Types::RouteRoundaboutExitStepDetails? = nil,
          @roundabout_pass_step_details : Types::RouteRoundaboutPassStepDetails? = nil,
          @signpost : Types::RouteSignpost? = nil,
          @turn_step_details : Types::RouteTurnStepDetails? = nil,
          @u_turn_step_details : Types::RouteUTurnStepDetails? = nil
        )
        end
      end

      # This property contains a summary of violated constraints.
      struct RouteViolatedConstraints
        include JSON::Serializable

        # List of Hazardous cargo contained in the vehicle.
        @[JSON::Field(key: "HazardousCargos")]
        getter hazardous_cargos : Array(String)

        # This restriction applies to truck cargo, where the resulting route excludes roads on which hazardous
        # materials are prohibited from being transported.
        @[JSON::Field(key: "AllHazardsRestricted")]
        getter all_hazards_restricted : Bool?

        # Total number of axles of the vehicle.
        @[JSON::Field(key: "AxleCount")]
        getter axle_count : Types::RouteNoticeDetailRange?

        # The maximum height of the vehicle.
        @[JSON::Field(key: "MaxHeight")]
        getter max_height : Int64?

        # The maximum Kpra length of the vehicle. Unit : centimeters
        @[JSON::Field(key: "MaxKpraLength")]
        getter max_kpra_length : Int64?

        # The maximum length of the vehicle.
        @[JSON::Field(key: "MaxLength")]
        getter max_length : Int64?

        # The maximum load capacity of the vehicle. Unit : kilograms
        @[JSON::Field(key: "MaxPayloadCapacity")]
        getter max_payload_capacity : Int64?

        # The maximum weight of the route. Unit : Kilograms
        @[JSON::Field(key: "MaxWeight")]
        getter max_weight : Types::RouteWeightConstraint?

        # The maximum weight per axle of the vehicle. Unit : Kilograms
        @[JSON::Field(key: "MaxWeightPerAxle")]
        getter max_weight_per_axle : Int64?

        # The maximum weight per axle group of the vehicle. Unit : Kilograms
        @[JSON::Field(key: "MaxWeightPerAxleGroup")]
        getter max_weight_per_axle_group : Types::WeightPerAxleGroup?

        # The maximum width of the vehicle.
        @[JSON::Field(key: "MaxWidth")]
        getter max_width : Int64?

        # The number of occupants in the vehicle. Default Value: 1
        @[JSON::Field(key: "Occupancy")]
        getter occupancy : Types::RouteNoticeDetailRange?

        # Access radius restrictions based on time.
        @[JSON::Field(key: "RestrictedTimes")]
        getter restricted_times : String?

        # The time dependent constraint.
        @[JSON::Field(key: "TimeDependent")]
        getter time_dependent : Bool?

        # Number of trailers attached to the vehicle. Default Value: 0
        @[JSON::Field(key: "TrailerCount")]
        getter trailer_count : Types::RouteNoticeDetailRange?

        # Travel mode corresponding to the leg.
        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : Bool?

        # Truck road type identifiers. BK1 through BK4 apply only to Sweden. A2,A4,B2,B4,C,D,ET2,ET4 apply
        # only to Mexico. There are currently no other supported values as of 26th April 2024.
        @[JSON::Field(key: "TruckRoadType")]
        getter truck_road_type : String?

        # Type of the truck.
        @[JSON::Field(key: "TruckType")]
        getter truck_type : String?

        # The tunnel restriction code. Tunnel categories in this list indicate the restrictions which apply to
        # certain tunnels in Great Britain. They relate to the types of dangerous goods that can be
        # transported through them. Tunnel Category B Risk Level : Limited risk Restrictions : Few
        # restrictions Tunnel Category C Risk Level : Medium risk Restrictions : Some restrictions Tunnel
        # Category D Risk Level : High risk Restrictions : Many restrictions occur Tunnel Category E Risk
        # Level : Very high risk Restrictions : Restricted tunnel
        @[JSON::Field(key: "TunnelRestrictionCode")]
        getter tunnel_restriction_code : String?

        def initialize(
          @hazardous_cargos : Array(String),
          @all_hazards_restricted : Bool? = nil,
          @axle_count : Types::RouteNoticeDetailRange? = nil,
          @max_height : Int64? = nil,
          @max_kpra_length : Int64? = nil,
          @max_length : Int64? = nil,
          @max_payload_capacity : Int64? = nil,
          @max_weight : Types::RouteWeightConstraint? = nil,
          @max_weight_per_axle : Int64? = nil,
          @max_weight_per_axle_group : Types::WeightPerAxleGroup? = nil,
          @max_width : Int64? = nil,
          @occupancy : Types::RouteNoticeDetailRange? = nil,
          @restricted_times : String? = nil,
          @time_dependent : Bool? = nil,
          @trailer_count : Types::RouteNoticeDetailRange? = nil,
          @travel_mode : Bool? = nil,
          @truck_road_type : String? = nil,
          @truck_type : String? = nil,
          @tunnel_restriction_code : String? = nil
        )
        end
      end

      # Waypoint between the Origin and Destination.
      struct RouteWaypoint
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Avoids actions for the provided distance. This is typically to consider for users in moving vehicles
        # who may not have sufficient time to make an action at an origin or a destination.
        @[JSON::Field(key: "AvoidActionsForDistance")]
        getter avoid_actions_for_distance : Int64?

        # Avoid U-turns for calculation on highways and motorways.
        @[JSON::Field(key: "AvoidUTurns")]
        getter avoid_u_turns : Bool?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Options to configure matching the provided position to the road network.
        @[JSON::Field(key: "Matching")]
        getter matching : Types::RouteMatchingOptions?

        # If the waypoint should not be treated as a stop. If yes, the waypoint is passed through and doesn't
        # split the route into different legs.
        @[JSON::Field(key: "PassThrough")]
        getter pass_through : Bool?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::RouteSideOfStreetOptions?

        # Duration of the stop. Unit : seconds
        @[JSON::Field(key: "StopDuration")]
        getter stop_duration : Int64?

        def initialize(
          @position : Array(Float64),
          @avoid_actions_for_distance : Int64? = nil,
          @avoid_u_turns : Bool? = nil,
          @heading : Float64? = nil,
          @matching : Types::RouteMatchingOptions? = nil,
          @pass_through : Bool? = nil,
          @side_of_street : Types::RouteSideOfStreetOptions? = nil,
          @stop_duration : Int64? = nil
        )
        end
      end

      # The weight constraint for the route. Unit : Kilograms
      struct RouteWeightConstraint
        include JSON::Serializable

        # The type of constraint.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The constraint value. Unit : Kilograms
        @[JSON::Field(key: "Value")]
        getter value : Int64

        def initialize(
          @type : String,
          @value : Int64
        )
        end
      end

      # The zone.
      struct RouteZone
        include JSON::Serializable

        # The zone category.
        @[JSON::Field(key: "Category")]
        getter category : String?

        # The name of the zone.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @category : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct SnapToRoadsRequest
        include JSON::Serializable

        # List of trace points to be snapped onto the road network.
        @[JSON::Field(key: "TracePoints")]
        getter trace_points : Array(Types::RoadSnapTracePoint)

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The radius around the provided tracepoint that is considered for snapping. Unit : meters Default
        # value: 300
        @[JSON::Field(key: "SnapRadius")]
        getter snap_radius : Int64?

        # Chooses what the returned SnappedGeometry format should be. Default Value: FlexiblePolyline
        @[JSON::Field(key: "SnappedGeometryFormat")]
        getter snapped_geometry_format : String?

        # Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and
        # road compatibility. Default Value: Car
        @[JSON::Field(key: "TravelMode")]
        getter travel_mode : String?

        # Travel mode related options for the provided travel mode.
        @[JSON::Field(key: "TravelModeOptions")]
        getter travel_mode_options : Types::RoadSnapTravelModeOptions?

        def initialize(
          @trace_points : Array(Types::RoadSnapTracePoint),
          @key : String? = nil,
          @snap_radius : Int64? = nil,
          @snapped_geometry_format : String? = nil,
          @travel_mode : String? = nil,
          @travel_mode_options : Types::RoadSnapTravelModeOptions? = nil
        )
        end
      end

      struct SnapToRoadsResponse
        include JSON::Serializable

        # Notices are additional information returned that indicate issues that occurred during route
        # calculation.
        @[JSON::Field(key: "Notices")]
        getter notices : Array(Types::RoadSnapNotice)

        # The pricing bucket for which the query is charged at.
        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # Specifies the format of the geometry returned for each leg of the route.
        @[JSON::Field(key: "SnappedGeometryFormat")]
        getter snapped_geometry_format : String

        # The trace points snapped onto the road network.
        @[JSON::Field(key: "SnappedTracePoints")]
        getter snapped_trace_points : Array(Types::RoadSnapSnappedTracePoint)

        # The interpolated geometry for the snapped route onto the road network.
        @[JSON::Field(key: "SnappedGeometry")]
        getter snapped_geometry : Types::RoadSnapSnappedGeometry?

        def initialize(
          @notices : Array(Types::RoadSnapNotice),
          @pricing_bucket : String,
          @snapped_geometry_format : String,
          @snapped_trace_points : Array(Types::RoadSnapSnappedTracePoint),
          @snapped_geometry : Types::RoadSnapSnappedGeometry? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.
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

      # The input fails to satisfy the constraints specified by the Amazon Location service.
      struct ValidationExceptionField
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the Validation Exception Field.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Access hours corresponding to when a destination can be visited.
      struct WaypointOptimizationAccessHours
        include JSON::Serializable

        # Contains the ID of the starting waypoint in this connection.
        @[JSON::Field(key: "From")]
        getter from : Types::WaypointOptimizationAccessHoursEntry

        # Contains the ID of the ending waypoint in this connection.
        @[JSON::Field(key: "To")]
        getter to : Types::WaypointOptimizationAccessHoursEntry

        def initialize(
          @from : Types::WaypointOptimizationAccessHoursEntry,
          @to : Types::WaypointOptimizationAccessHoursEntry
        )
        end
      end

      # Hours of entry.
      struct WaypointOptimizationAccessHoursEntry
        include JSON::Serializable

        # Day of the week.
        @[JSON::Field(key: "DayOfWeek")]
        getter day_of_week : String

        # Time of the day.
        @[JSON::Field(key: "TimeOfDay")]
        getter time_of_day : String

        def initialize(
          @day_of_week : String,
          @time_of_day : String
        )
        end
      end

      # The area to be avoided.
      struct WaypointOptimizationAvoidanceArea
        include JSON::Serializable

        # Geometry of the area to be avoided.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::WaypointOptimizationAvoidanceAreaGeometry

        def initialize(
          @geometry : Types::WaypointOptimizationAvoidanceAreaGeometry
        )
        end
      end

      # Geometry of the area to be avoided.
      struct WaypointOptimizationAvoidanceAreaGeometry
        include JSON::Serializable

        # Geometry defined as a bounding box. The first pair represents the X and Y coordinates (longitude and
        # latitude,) of the southwest corner of the bounding box; the second pair represents the X and Y
        # coordinates (longitude and latitude) of the northeast corner.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?

        def initialize(
          @bounding_box : Array(Float64)? = nil
        )
        end
      end

      # Specifies options for areas to avoid. This is a best-effort avoidance setting, meaning the router
      # will try to honor the avoidance preferences but may still include restricted areas if no feasible
      # alternative route exists. If avoidance options are not followed, the response will indicate that the
      # avoidance criteria were violated.
      struct WaypointOptimizationAvoidanceOptions
        include JSON::Serializable

        # Areas to be avoided.
        @[JSON::Field(key: "Areas")]
        getter areas : Array(Types::WaypointOptimizationAvoidanceArea)?

        # Avoidance options for cars-shuttles-trains.
        @[JSON::Field(key: "CarShuttleTrains")]
        getter car_shuttle_trains : Bool?

        # Avoid controlled access highways while calculating the route.
        @[JSON::Field(key: "ControlledAccessHighways")]
        getter controlled_access_highways : Bool?

        # Avoid dirt roads while calculating the route.
        @[JSON::Field(key: "DirtRoads")]
        getter dirt_roads : Bool?

        # Avoidance options for ferries.
        @[JSON::Field(key: "Ferries")]
        getter ferries : Bool?

        # Avoids roads where the specified toll transponders are the only mode of payment.
        @[JSON::Field(key: "TollRoads")]
        getter toll_roads : Bool?

        # Avoid tunnels while calculating the route.
        @[JSON::Field(key: "Tunnels")]
        getter tunnels : Bool?

        # Avoid U-turns for calculation on highways and motorways.
        @[JSON::Field(key: "UTurns")]
        getter u_turns : Bool?

        def initialize(
          @areas : Array(Types::WaypointOptimizationAvoidanceArea)? = nil,
          @car_shuttle_trains : Bool? = nil,
          @controlled_access_highways : Bool? = nil,
          @dirt_roads : Bool? = nil,
          @ferries : Bool? = nil,
          @toll_roads : Bool? = nil,
          @tunnels : Bool? = nil,
          @u_turns : Bool? = nil
        )
        end
      end

      # Options for WaypointOptimizationClustering.
      struct WaypointOptimizationClusteringOptions
        include JSON::Serializable

        # The algorithm to be used. DrivingDistance assigns all the waypoints that are within driving distance
        # of each other into a single cluster. TopologySegment assigns all the waypoints that are within the
        # same topology segment into a single cluster. A Topology segment is a linear stretch of road between
        # two junctions.
        @[JSON::Field(key: "Algorithm")]
        getter algorithm : String

        # Driving distance options to be used when the clustering algorithm is DrivingDistance.
        @[JSON::Field(key: "DrivingDistanceOptions")]
        getter driving_distance_options : Types::WaypointOptimizationDrivingDistanceOptions?

        def initialize(
          @algorithm : String,
          @driving_distance_options : Types::WaypointOptimizationDrivingDistanceOptions? = nil
        )
        end
      end

      # This contains information such as distance and duration from one waypoint to the next waypoint in
      # the sequence.
      struct WaypointOptimizationConnection
        include JSON::Serializable

        # Distance of the step.
        @[JSON::Field(key: "Distance")]
        getter distance : Int64

        # contains the ID of the starting waypoint in this connection.
        @[JSON::Field(key: "From")]
        getter from : String

        # Resting time before the driver can continue driving.
        @[JSON::Field(key: "RestDuration")]
        getter rest_duration : Int64

        # Contains the ID of the ending waypoint in this connection.
        @[JSON::Field(key: "To")]
        getter to : String

        # Total duration. Unit : seconds
        @[JSON::Field(key: "TravelDuration")]
        getter travel_duration : Int64

        # Duration of a wait step. Unit : seconds
        @[JSON::Field(key: "WaitDuration")]
        getter wait_duration : Int64

        def initialize(
          @distance : Int64,
          @from : String,
          @rest_duration : Int64,
          @to : String,
          @travel_duration : Int64,
          @wait_duration : Int64
        )
        end
      end

      # Destination related options.
      struct WaypointOptimizationDestinationOptions
        include JSON::Serializable

        # Access hours corresponding to when a waypoint can be visited.
        @[JSON::Field(key: "AccessHours")]
        getter access_hours : Types::WaypointOptimizationAccessHours?

        # Appointment time at the destination.
        @[JSON::Field(key: "AppointmentTime")]
        getter appointment_time : String?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # The waypoint Id.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Service time spent at the destination. At an appointment, the service time should be the appointment
        # duration. Unit : seconds
        @[JSON::Field(key: "ServiceDuration")]
        getter service_duration : Int64?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::WaypointOptimizationSideOfStreetOptions?

        def initialize(
          @access_hours : Types::WaypointOptimizationAccessHours? = nil,
          @appointment_time : String? = nil,
          @heading : Float64? = nil,
          @id : String? = nil,
          @service_duration : Int64? = nil,
          @side_of_street : Types::WaypointOptimizationSideOfStreetOptions? = nil
        )
        end
      end

      # Driver related options.
      struct WaypointOptimizationDriverOptions
        include JSON::Serializable

        # Driver work-rest schedules defined by a short and long cycle. A rest needs to be taken after the
        # short work duration. The short cycle can be repeated until you hit the long work duration, at which
        # point the long rest duration should be taken before restarting.
        @[JSON::Field(key: "RestCycles")]
        getter rest_cycles : Types::WaypointOptimizationRestCycles?

        # Pre defined rest profiles for a driver schedule. The only currently supported profile is EU.
        @[JSON::Field(key: "RestProfile")]
        getter rest_profile : Types::WaypointOptimizationRestProfile?

        # If the service time provided at a waypoint/destination should be considered as rest or work. This
        # contributes to the total time breakdown returned within the response.
        @[JSON::Field(key: "TreatServiceTimeAs")]
        getter treat_service_time_as : String?

        def initialize(
          @rest_cycles : Types::WaypointOptimizationRestCycles? = nil,
          @rest_profile : Types::WaypointOptimizationRestProfile? = nil,
          @treat_service_time_as : String? = nil
        )
        end
      end

      # Driving distance related options.
      struct WaypointOptimizationDrivingDistanceOptions
        include JSON::Serializable

        # DrivingDistance assigns all the waypoints that are within driving distance of each other into a
        # single cluster.
        @[JSON::Field(key: "DrivingDistance")]
        getter driving_distance : Int64

        def initialize(
          @driving_distance : Int64
        )
        end
      end

      # Specifies strict exclusion options for the route calculation. This setting mandates that the router
      # will avoid any routes that include the specified options, rather than merely attempting to minimize
      # them.
      struct WaypointOptimizationExclusionOptions
        include JSON::Serializable

        # List of countries to be avoided defined by two-letter or three-letter country codes.
        @[JSON::Field(key: "Countries")]
        getter countries : Array(String)

        def initialize(
          @countries : Array(String)
        )
        end
      end

      # The failed constraint.
      struct WaypointOptimizationFailedConstraint
        include JSON::Serializable

        # The failed constraint.
        @[JSON::Field(key: "Constraint")]
        getter constraint : String?

        # Reason for the failed constraint.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @constraint : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The impeding waypoint.
      struct WaypointOptimizationImpedingWaypoint
        include JSON::Serializable

        # Failed constraints for an impeding waypoint.
        @[JSON::Field(key: "FailedConstraints")]
        getter failed_constraints : Array(Types::WaypointOptimizationFailedConstraint)

        # The waypoint Id.
        @[JSON::Field(key: "Id")]
        getter id : String

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        def initialize(
          @failed_constraints : Array(Types::WaypointOptimizationFailedConstraint),
          @id : String,
          @position : Array(Float64)
        )
        end
      end

      # The optimized waypoint.
      struct WaypointOptimizationOptimizedWaypoint
        include JSON::Serializable

        # Estimated time of departure from thr origin. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "DepartureTime")]
        getter departure_time : String

        # The waypoint Id.
        @[JSON::Field(key: "Id")]
        getter id : String

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Estimated time of arrival at the destination. Time format: YYYY-MM-DDThh:mm:ss.sssZ |
        # YYYY-MM-DDThh:mm:ss.sss+hh:mm Examples: 2020-04-22T17:57:24Z 2020-04-22T17:57:24+02:00
        @[JSON::Field(key: "ArrivalTime")]
        getter arrival_time : String?

        # Index of the cluster the waypoint is associated with. The index is included in the response only if
        # clustering was performed while processing the request.
        @[JSON::Field(key: "ClusterIndex")]
        getter cluster_index : Int32?

        def initialize(
          @departure_time : String,
          @id : String,
          @position : Array(Float64),
          @arrival_time : String? = nil,
          @cluster_index : Int32? = nil
        )
        end
      end

      # Origin related options.
      struct WaypointOptimizationOriginOptions
        include JSON::Serializable

        # The Origin Id.
        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Options related to a pedestrian.
      struct WaypointOptimizationPedestrianOptions
        include JSON::Serializable

        # Walking speed. Unit : KilometersPerHour
        @[JSON::Field(key: "Speed")]
        getter speed : Float64?

        def initialize(
          @speed : Float64? = nil
        )
        end
      end

      # Driver work-rest schedules defined by a short and long cycle. A rest needs to be taken after the
      # short work duration. The short cycle can be repeated until you hit the long work duration, at which
      # point the long rest duration should be taken before restarting. Unit : seconds
      struct WaypointOptimizationRestCycleDurations
        include JSON::Serializable

        # Resting phase of the cycle. Unit : seconds
        @[JSON::Field(key: "RestDuration")]
        getter rest_duration : Int64

        # Working phase of the cycle. Unit : seconds
        @[JSON::Field(key: "WorkDuration")]
        getter work_duration : Int64

        def initialize(
          @rest_duration : Int64,
          @work_duration : Int64
        )
        end
      end

      # Resting phase of the cycle.
      struct WaypointOptimizationRestCycles
        include JSON::Serializable

        # Long cycle for a driver work-rest schedule.
        @[JSON::Field(key: "LongCycle")]
        getter long_cycle : Types::WaypointOptimizationRestCycleDurations

        # Short cycle for a driver work-rest schedule
        @[JSON::Field(key: "ShortCycle")]
        getter short_cycle : Types::WaypointOptimizationRestCycleDurations

        def initialize(
          @long_cycle : Types::WaypointOptimizationRestCycleDurations,
          @short_cycle : Types::WaypointOptimizationRestCycleDurations
        )
        end
      end

      # Pre defined rest profiles for a driver schedule. The only currently supported profile is EU.
      struct WaypointOptimizationRestProfile
        include JSON::Serializable

        # Pre defined rest profiles for a driver schedule. The only currently supported profile is EU.
        @[JSON::Field(key: "Profile")]
        getter profile : String

        def initialize(
          @profile : String
        )
        end
      end

      # Options to configure matching the provided position to a side of the street.
      struct WaypointOptimizationSideOfStreetOptions
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Strategy that defines when the side of street position should be used. AnyStreet will always use the
        # provided position. Default Value: DividedStreetOnly
        @[JSON::Field(key: "UseWith")]
        getter use_with : String?

        def initialize(
          @position : Array(Float64),
          @use_with : String? = nil
        )
        end
      end

      # Time breakdown for the sequence.
      struct WaypointOptimizationTimeBreakdown
        include JSON::Serializable

        # Resting phase of the cycle. Unit : seconds
        @[JSON::Field(key: "RestDuration")]
        getter rest_duration : Int64

        # Service time spent at the destination. At an appointment, the service time should be the appointment
        # duration. Unit : seconds
        @[JSON::Field(key: "ServiceDuration")]
        getter service_duration : Int64

        # Traveling phase of the cycle. Unit : seconds
        @[JSON::Field(key: "TravelDuration")]
        getter travel_duration : Int64

        # Waiting phase of the cycle. Unit : seconds
        @[JSON::Field(key: "WaitDuration")]
        getter wait_duration : Int64

        def initialize(
          @rest_duration : Int64,
          @service_duration : Int64,
          @travel_duration : Int64,
          @wait_duration : Int64
        )
        end
      end

      # Options related to traffic.
      struct WaypointOptimizationTrafficOptions
        include JSON::Serializable

        # Determines if traffic should be used or ignored while calculating the route. Default Value:
        # UseTrafficData
        @[JSON::Field(key: "Usage")]
        getter usage : String?

        def initialize(
          @usage : String? = nil
        )
        end
      end

      # Trailer options corresponding to the vehicle.
      struct WaypointOptimizationTrailerOptions
        include JSON::Serializable

        # Number of trailers attached to the vehicle. Default Value: 0
        @[JSON::Field(key: "TrailerCount")]
        getter trailer_count : Int32?

        def initialize(
          @trailer_count : Int32? = nil
        )
        end
      end

      # Travel mode related options for the provided travel mode.
      struct WaypointOptimizationTravelModeOptions
        include JSON::Serializable

        # Travel mode options when the provided travel mode is "Pedestrian"
        @[JSON::Field(key: "Pedestrian")]
        getter pedestrian : Types::WaypointOptimizationPedestrianOptions?

        # Travel mode options when the provided travel mode is "Truck"
        @[JSON::Field(key: "Truck")]
        getter truck : Types::WaypointOptimizationTruckOptions?

        def initialize(
          @pedestrian : Types::WaypointOptimizationPedestrianOptions? = nil,
          @truck : Types::WaypointOptimizationTruckOptions? = nil
        )
        end
      end

      # Travel mode options when the provided travel mode is "Truck"
      struct WaypointOptimizationTruckOptions
        include JSON::Serializable

        # Gross weight of the vehicle including trailers, and goods at capacity. Unit : Kilograms
        @[JSON::Field(key: "GrossWeight")]
        getter gross_weight : Int64?

        # List of Hazardous cargo contained in the vehicle.
        @[JSON::Field(key: "HazardousCargos")]
        getter hazardous_cargos : Array(String)?

        # Height of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Height")]
        getter height : Int64?

        # Length of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Length")]
        getter length : Int64?

        # Trailer options corresponding to the vehicle.
        @[JSON::Field(key: "Trailer")]
        getter trailer : Types::WaypointOptimizationTrailerOptions?

        # Type of the truck.
        @[JSON::Field(key: "TruckType")]
        getter truck_type : String?

        # The tunnel restriction code. Tunnel categories in this list indicate the restrictions which apply to
        # certain tunnels in Great Britain. They relate to the types of dangerous goods that can be
        # transported through them. Tunnel Category B Risk Level : Limited risk Restrictions : Few
        # restrictions Tunnel Category C Risk Level : Medium risk Restrictions : Some restrictions Tunnel
        # Category D Risk Level : High risk Restrictions : Many restrictions occur Tunnel Category E Risk
        # Level : Very high risk Restrictions : Restricted tunnel
        @[JSON::Field(key: "TunnelRestrictionCode")]
        getter tunnel_restriction_code : String?

        # Heaviest weight per axle irrespective of the axle type or the axle group. Meant for usage in
        # countries where the differences in axle types or axle groups are not distinguished. Unit : Kilograms
        @[JSON::Field(key: "WeightPerAxle")]
        getter weight_per_axle : Int64?

        # Width of the vehicle. Unit : centimeters
        @[JSON::Field(key: "Width")]
        getter width : Int64?

        def initialize(
          @gross_weight : Int64? = nil,
          @hazardous_cargos : Array(String)? = nil,
          @height : Int64? = nil,
          @length : Int64? = nil,
          @trailer : Types::WaypointOptimizationTrailerOptions? = nil,
          @truck_type : String? = nil,
          @tunnel_restriction_code : String? = nil,
          @weight_per_axle : Int64? = nil,
          @width : Int64? = nil
        )
        end
      end

      # Waypoint between the Origin and Destination.
      struct WaypointOptimizationWaypoint
        include JSON::Serializable

        # Position defined as [longitude, latitude] .
        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)

        # Access hours corresponding to when a waypoint can be visited.
        @[JSON::Field(key: "AccessHours")]
        getter access_hours : Types::WaypointOptimizationAccessHours?

        # Appointment time at the waypoint.
        @[JSON::Field(key: "AppointmentTime")]
        getter appointment_time : String?

        # Constraint defining what waypoints are to be visited after this waypoint.
        @[JSON::Field(key: "Before")]
        getter before : Array(Int32)?

        # GPS Heading at the position.
        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # The waypoint Id.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Service time spent at the waypoint. At an appointment, the service time should be the appointment
        # duration. Unit : seconds
        @[JSON::Field(key: "ServiceDuration")]
        getter service_duration : Int64?

        # Options to configure matching the provided position to a side of the street.
        @[JSON::Field(key: "SideOfStreet")]
        getter side_of_street : Types::WaypointOptimizationSideOfStreetOptions?

        def initialize(
          @position : Array(Float64),
          @access_hours : Types::WaypointOptimizationAccessHours? = nil,
          @appointment_time : String? = nil,
          @before : Array(Int32)? = nil,
          @heading : Float64? = nil,
          @id : String? = nil,
          @service_duration : Int64? = nil,
          @side_of_street : Types::WaypointOptimizationSideOfStreetOptions? = nil
        )
        end
      end

      # Specifies the total weight for the specified axle group. Meant for usage in countries that have
      # different regulations based on the axle group type. Unit : Kilograms
      struct WeightPerAxleGroup
        include JSON::Serializable

        # Weight for quad axle group. Unit : Kilograms
        @[JSON::Field(key: "Quad")]
        getter quad : Int64?

        # Weight for quad quint group. Unit : Kilograms
        @[JSON::Field(key: "Quint")]
        getter quint : Int64?

        # Weight for single axle group. Unit : Kilograms
        @[JSON::Field(key: "Single")]
        getter single : Int64?

        # Weight for tandem axle group. Unit : Kilograms
        @[JSON::Field(key: "Tandem")]
        getter tandem : Int64?

        # Weight for triple axle group. Unit : Kilograms
        @[JSON::Field(key: "Triple")]
        getter triple : Int64?

        def initialize(
          @quad : Int64? = nil,
          @quint : Int64? = nil,
          @single : Int64? = nil,
          @tandem : Int64? = nil,
          @triple : Int64? = nil
        )
        end
      end
    end
  end
end
