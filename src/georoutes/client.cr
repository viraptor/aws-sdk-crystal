module Aws
  module GeoRoutes
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Use the CalculateIsolines action to find service areas that can be reached in a given threshold of
      # time, distance.

      def calculate_isolines(
        thresholds : Types::IsolineThresholds,
        allow : Types::IsolineAllowOptions? = nil,
        arrival_time : String? = nil,
        avoid : Types::IsolineAvoidanceOptions? = nil,
        depart_now : Bool? = nil,
        departure_time : String? = nil,
        destination : Array(Float64)? = nil,
        destination_options : Types::IsolineDestinationOptions? = nil,
        isoline_geometry_format : String? = nil,
        isoline_granularity : Types::IsolineGranularityOptions? = nil,
        key : String? = nil,
        optimize_isoline_for : String? = nil,
        optimize_routing_for : String? = nil,
        origin : Array(Float64)? = nil,
        origin_options : Types::IsolineOriginOptions? = nil,
        traffic : Types::IsolineTrafficOptions? = nil,
        travel_mode : String? = nil,
        travel_mode_options : Types::IsolineTravelModeOptions? = nil
      ) : Protocol::Request
        input = Types::CalculateIsolinesRequest.new(thresholds: thresholds, allow: allow, arrival_time: arrival_time, avoid: avoid, depart_now: depart_now, departure_time: departure_time, destination: destination, destination_options: destination_options, isoline_geometry_format: isoline_geometry_format, isoline_granularity: isoline_granularity, key: key, optimize_isoline_for: optimize_isoline_for, optimize_routing_for: optimize_routing_for, origin: origin, origin_options: origin_options, traffic: traffic, travel_mode: travel_mode, travel_mode_options: travel_mode_options)
        calculate_isolines(input)
      end

      def calculate_isolines(input : Types::CalculateIsolinesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CALCULATE_ISOLINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use CalculateRouteMatrix to compute results for all pairs of Origins to Destinations. Each row
      # corresponds to one entry in Origins. Each entry in the row corresponds to the route from that entry
      # in Origins to an entry in Destinations positions.

      def calculate_route_matrix(
        destinations : Array(Types::RouteMatrixDestination),
        origins : Array(Types::RouteMatrixOrigin),
        routing_boundary : Types::RouteMatrixBoundary,
        allow : Types::RouteMatrixAllowOptions? = nil,
        avoid : Types::RouteMatrixAvoidanceOptions? = nil,
        depart_now : Bool? = nil,
        departure_time : String? = nil,
        exclude : Types::RouteMatrixExclusionOptions? = nil,
        key : String? = nil,
        optimize_routing_for : String? = nil,
        traffic : Types::RouteMatrixTrafficOptions? = nil,
        travel_mode : String? = nil,
        travel_mode_options : Types::RouteMatrixTravelModeOptions? = nil
      ) : Protocol::Request
        input = Types::CalculateRouteMatrixRequest.new(destinations: destinations, origins: origins, routing_boundary: routing_boundary, allow: allow, avoid: avoid, depart_now: depart_now, departure_time: departure_time, exclude: exclude, key: key, optimize_routing_for: optimize_routing_for, traffic: traffic, travel_mode: travel_mode, travel_mode_options: travel_mode_options)
        calculate_route_matrix(input)
      end

      def calculate_route_matrix(input : Types::CalculateRouteMatrixRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CALCULATE_ROUTE_MATRIX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # CalculateRoutes computes routes given the following required parameters: Origin and Destination .

      def calculate_routes(
        destination : Array(Float64),
        origin : Array(Float64),
        allow : Types::RouteAllowOptions? = nil,
        arrival_time : String? = nil,
        avoid : Types::RouteAvoidanceOptions? = nil,
        depart_now : Bool? = nil,
        departure_time : String? = nil,
        destination_options : Types::RouteDestinationOptions? = nil,
        driver : Types::RouteDriverOptions? = nil,
        exclude : Types::RouteExclusionOptions? = nil,
        instructions_measurement_system : String? = nil,
        key : String? = nil,
        languages : Array(String)? = nil,
        leg_additional_features : Array(String)? = nil,
        leg_geometry_format : String? = nil,
        max_alternatives : Int32? = nil,
        optimize_routing_for : String? = nil,
        origin_options : Types::RouteOriginOptions? = nil,
        span_additional_features : Array(String)? = nil,
        tolls : Types::RouteTollOptions? = nil,
        traffic : Types::RouteTrafficOptions? = nil,
        travel_mode : String? = nil,
        travel_mode_options : Types::RouteTravelModeOptions? = nil,
        travel_step_type : String? = nil,
        waypoints : Array(Types::RouteWaypoint)? = nil
      ) : Protocol::Request
        input = Types::CalculateRoutesRequest.new(destination: destination, origin: origin, allow: allow, arrival_time: arrival_time, avoid: avoid, depart_now: depart_now, departure_time: departure_time, destination_options: destination_options, driver: driver, exclude: exclude, instructions_measurement_system: instructions_measurement_system, key: key, languages: languages, leg_additional_features: leg_additional_features, leg_geometry_format: leg_geometry_format, max_alternatives: max_alternatives, optimize_routing_for: optimize_routing_for, origin_options: origin_options, span_additional_features: span_additional_features, tolls: tolls, traffic: traffic, travel_mode: travel_mode, travel_mode_options: travel_mode_options, travel_step_type: travel_step_type, waypoints: waypoints)
        calculate_routes(input)
      end

      def calculate_routes(input : Types::CalculateRoutesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CALCULATE_ROUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # OptimizeWaypoints calculates the optimal order to travel between a set of waypoints to minimize
      # either the travel time or the distance travelled during the journey, based on road network
      # restrictions and the traffic pattern data.

      def optimize_waypoints(
        origin : Array(Float64),
        avoid : Types::WaypointOptimizationAvoidanceOptions? = nil,
        clustering : Types::WaypointOptimizationClusteringOptions? = nil,
        departure_time : String? = nil,
        destination : Array(Float64)? = nil,
        destination_options : Types::WaypointOptimizationDestinationOptions? = nil,
        driver : Types::WaypointOptimizationDriverOptions? = nil,
        exclude : Types::WaypointOptimizationExclusionOptions? = nil,
        key : String? = nil,
        optimize_sequencing_for : String? = nil,
        origin_options : Types::WaypointOptimizationOriginOptions? = nil,
        traffic : Types::WaypointOptimizationTrafficOptions? = nil,
        travel_mode : String? = nil,
        travel_mode_options : Types::WaypointOptimizationTravelModeOptions? = nil,
        waypoints : Array(Types::WaypointOptimizationWaypoint)? = nil
      ) : Protocol::Request
        input = Types::OptimizeWaypointsRequest.new(origin: origin, avoid: avoid, clustering: clustering, departure_time: departure_time, destination: destination, destination_options: destination_options, driver: driver, exclude: exclude, key: key, optimize_sequencing_for: optimize_sequencing_for, origin_options: origin_options, traffic: traffic, travel_mode: travel_mode, travel_mode_options: travel_mode_options, waypoints: waypoints)
        optimize_waypoints(input)
      end

      def optimize_waypoints(input : Types::OptimizeWaypointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::OPTIMIZE_WAYPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # SnapToRoads matches GPS trace to roads most likely traveled on.

      def snap_to_roads(
        trace_points : Array(Types::RoadSnapTracePoint),
        key : String? = nil,
        snap_radius : Int64? = nil,
        snapped_geometry_format : String? = nil,
        travel_mode : String? = nil,
        travel_mode_options : Types::RoadSnapTravelModeOptions? = nil
      ) : Protocol::Request
        input = Types::SnapToRoadsRequest.new(trace_points: trace_points, key: key, snap_radius: snap_radius, snapped_geometry_format: snapped_geometry_format, travel_mode: travel_mode, travel_mode_options: travel_mode_options)
        snap_to_roads(input)
      end

      def snap_to_roads(input : Types::SnapToRoadsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SNAP_TO_ROADS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
