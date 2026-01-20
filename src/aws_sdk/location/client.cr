module AwsSdk
  module Location
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
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates an association between a geofence collection and a tracker resource. This allows the tracker
      # resource to communicate location data to the linked geofence collection. You can associate up to
      # five geofence collections to each tracker resource. Currently not supported — Cross-account
      # configurations, such as creating associations between a tracker resource in one account and a
      # geofence collection in another account.

      def associate_tracker_consumer(
        consumer_arn : String,
        tracker_name : String
      ) : Protocol::Request
        input = Types::AssociateTrackerConsumerRequest.new(consumer_arn: consumer_arn, tracker_name: tracker_name)
        associate_tracker_consumer(input)
      end

      def associate_tracker_consumer(input : Types::AssociateTrackerConsumerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_TRACKER_CONSUMER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the position history of one or more devices from a tracker resource.

      def batch_delete_device_position_history(
        device_ids : Array(String),
        tracker_name : String
      ) : Protocol::Request
        input = Types::BatchDeleteDevicePositionHistoryRequest.new(device_ids: device_ids, tracker_name: tracker_name)
        batch_delete_device_position_history(input)
      end

      def batch_delete_device_position_history(input : Types::BatchDeleteDevicePositionHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_DEVICE_POSITION_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a batch of geofences from a geofence collection. This operation deletes the resource
      # permanently.

      def batch_delete_geofence(
        collection_name : String,
        geofence_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeleteGeofenceRequest.new(collection_name: collection_name, geofence_ids: geofence_ids)
        batch_delete_geofence(input)
      end

      def batch_delete_geofence(input : Types::BatchDeleteGeofenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_GEOFENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Evaluates device positions against the geofence geometries from a given geofence collection. This
      # operation always returns an empty response because geofences are asynchronously evaluated. The
      # evaluation determines if the device has entered or exited a geofenced area, and then publishes one
      # of the following events to Amazon EventBridge: ENTER if Amazon Location determines that the tracked
      # device has entered a geofenced area. EXIT if Amazon Location determines that the tracked device has
      # exited a geofenced area. The last geofence that a device was observed within is tracked for 30 days
      # after the most recent device position update. Geofence evaluation uses the given device position. It
      # does not account for the optional Accuracy of a DevicePositionUpdate . The DeviceID is used as a
      # string to represent the device. You do not need to have a Tracker associated with the DeviceID .

      def batch_evaluate_geofences(
        collection_name : String,
        device_position_updates : Array(Types::DevicePositionUpdate)
      ) : Protocol::Request
        input = Types::BatchEvaluateGeofencesRequest.new(collection_name: collection_name, device_position_updates: device_position_updates)
        batch_evaluate_geofences(input)
      end

      def batch_evaluate_geofences(input : Types::BatchEvaluateGeofencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_EVALUATE_GEOFENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the latest device positions for requested devices.

      def batch_get_device_position(
        device_ids : Array(String),
        tracker_name : String
      ) : Protocol::Request
        input = Types::BatchGetDevicePositionRequest.new(device_ids: device_ids, tracker_name: tracker_name)
        batch_get_device_position(input)
      end

      def batch_get_device_position(input : Types::BatchGetDevicePositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_DEVICE_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A batch request for storing geofence geometries into a given geofence collection, or updates the
      # geometry of an existing geofence if a geofence ID is included in the request.

      def batch_put_geofence(
        collection_name : String,
        entries : Array(Types::BatchPutGeofenceRequestEntry)
      ) : Protocol::Request
        input = Types::BatchPutGeofenceRequest.new(collection_name: collection_name, entries: entries)
        batch_put_geofence(input)
      end

      def batch_put_geofence(input : Types::BatchPutGeofenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_GEOFENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads position update data for one or more devices to a tracker resource (up to 10 devices per
      # batch). Amazon Location uses the data when it reports the last known device position and position
      # history. Amazon Location retains location data for 30 days. Position updates are handled based on
      # the PositionFiltering property of the tracker. When PositionFiltering is set to TimeBased , updates
      # are evaluated against linked geofence collections, and location data is stored at a maximum of one
      # position per 30 second interval. If your update frequency is more often than every 30 seconds, only
      # one update per 30 seconds is stored for each unique device ID. When PositionFiltering is set to
      # DistanceBased filtering, location data is stored and evaluated against linked geofence collections
      # only if the device has moved more than 30 m (98.4 ft). When PositionFiltering is set to
      # AccuracyBased filtering, location data is stored and evaluated against linked geofence collections
      # only if the device has moved more than the measured accuracy. For example, if two consecutive
      # updates from a device have a horizontal accuracy of 5 m and 10 m, the second update is neither
      # stored or evaluated if the device has moved less than 15 m. If PositionFiltering is set to
      # AccuracyBased filtering, Amazon Location uses the default value { "Horizontal": 0} when accuracy is
      # not provided on a DevicePositionUpdate .

      def batch_update_device_position(
        tracker_name : String,
        updates : Array(Types::DevicePositionUpdate)
      ) : Protocol::Request
        input = Types::BatchUpdateDevicePositionRequest.new(tracker_name: tracker_name, updates: updates)
        batch_update_device_position(input)
      end

      def batch_update_device_position(input : Types::BatchUpdateDevicePositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_DEVICE_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # CalculateRoutes or CalculateIsolines unless you require Grab data. CalculateRoute is part of a
      # previous Amazon Location Service Routes API (version 1) which has been superseded by a more
      # intuitive, powerful, and complete API (version 2). The version 2 CalculateRoutes operation gives
      # better results for point-to-point routing, while the version 2 CalculateIsolines operation adds
      # support for calculating service areas and travel time envelopes. If you are using an Amazon Web
      # Services SDK or the Amazon Web Services CLI, note that the Routes API version 2 is found under
      # geo-routes or geo_routes , not under location . Since Grab is not yet fully supported in Routes API
      # version 2, we recommend you continue using API version 1 when using Grab. Calculates a route given
      # the following required parameters: DeparturePosition and DestinationPosition . Requires that you
      # first create a route calculator resource . By default, a request that doesn't specify a departure
      # time uses the best time of day to travel with the best traffic conditions when calculating the
      # route. Additional options include: Specifying a departure time using either DepartureTime or
      # DepartNow . This calculates a route based on predictive traffic data at the given time. You can't
      # specify both DepartureTime and DepartNow in a single request. Specifying both parameters returns a
      # validation error. Specifying a travel mode using TravelMode sets the transportation mode used to
      # calculate the routes. This also lets you specify additional route preferences in CarModeOptions if
      # traveling by Car , or TruckModeOptions if traveling by Truck . If you specify walking for the travel
      # mode and your data provider is Esri, the start and destination must be within 40km.

      def calculate_route(
        calculator_name : String,
        departure_position : Array(Float64),
        destination_position : Array(Float64),
        arrival_time : Time? = nil,
        car_mode_options : Types::CalculateRouteCarModeOptions? = nil,
        depart_now : Bool? = nil,
        departure_time : Time? = nil,
        distance_unit : String? = nil,
        include_leg_geometry : Bool? = nil,
        key : String? = nil,
        optimize_for : String? = nil,
        travel_mode : String? = nil,
        truck_mode_options : Types::CalculateRouteTruckModeOptions? = nil,
        waypoint_positions : Array(Array(Float64))? = nil
      ) : Protocol::Request
        input = Types::CalculateRouteRequest.new(calculator_name: calculator_name, departure_position: departure_position, destination_position: destination_position, arrival_time: arrival_time, car_mode_options: car_mode_options, depart_now: depart_now, departure_time: departure_time, distance_unit: distance_unit, include_leg_geometry: include_leg_geometry, key: key, optimize_for: optimize_for, travel_mode: travel_mode, truck_mode_options: truck_mode_options, waypoint_positions: waypoint_positions)
        calculate_route(input)
      end

      def calculate_route(input : Types::CalculateRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CALCULATE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the V2 CalculateRouteMatrix unless you require Grab data. This version of CalculateRouteMatrix is
      # part of a previous Amazon Location Service Routes API (version 1) which has been superseded by a
      # more intuitive, powerful, and complete API (version 2). The version 2 CalculateRouteMatrix operation
      # gives better results for matrix routing calculations. If you are using an Amazon Web Services SDK or
      # the Amazon Web Services CLI, note that the Routes API version 2 is found under geo-routes or
      # geo_routes , not under location . Since Grab is not yet fully supported in Routes API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Routes V2 API Reference or the Developer Guide . Calculates a route matrix given the following
      # required parameters: DeparturePositions and DestinationPositions . CalculateRouteMatrix calculates
      # routes and returns the travel time and travel distance from each departure position to each
      # destination position in the request. For example, given departure positions A and B, and destination
      # positions X and Y, CalculateRouteMatrix will return time and distance for routes from A to X, A to
      # Y, B to X, and B to Y (in that order). The number of results returned (and routes calculated) will
      # be the number of DeparturePositions times the number of DestinationPositions . Your account is
      # charged for each route calculated, not the number of requests. Requires that you first create a
      # route calculator resource . By default, a request that doesn't specify a departure time uses the
      # best time of day to travel with the best traffic conditions when calculating routes. Additional
      # options include: Specifying a departure time using either DepartureTime or DepartNow . This
      # calculates routes based on predictive traffic data at the given time. You can't specify both
      # DepartureTime and DepartNow in a single request. Specifying both parameters returns a validation
      # error. Specifying a travel mode using TravelMode sets the transportation mode used to calculate the
      # routes. This also lets you specify additional route preferences in CarModeOptions if traveling by
      # Car , or TruckModeOptions if traveling by Truck .

      def calculate_route_matrix(
        calculator_name : String,
        departure_positions : Array(Array(Float64)),
        destination_positions : Array(Array(Float64)),
        car_mode_options : Types::CalculateRouteCarModeOptions? = nil,
        depart_now : Bool? = nil,
        departure_time : Time? = nil,
        distance_unit : String? = nil,
        key : String? = nil,
        travel_mode : String? = nil,
        truck_mode_options : Types::CalculateRouteTruckModeOptions? = nil
      ) : Protocol::Request
        input = Types::CalculateRouteMatrixRequest.new(calculator_name: calculator_name, departure_positions: departure_positions, destination_positions: destination_positions, car_mode_options: car_mode_options, depart_now: depart_now, departure_time: departure_time, distance_unit: distance_unit, key: key, travel_mode: travel_mode, truck_mode_options: truck_mode_options)
        calculate_route_matrix(input)
      end

      def calculate_route_matrix(input : Types::CalculateRouteMatrixRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CALCULATE_ROUTE_MATRIX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a geofence collection, which manages and stores geofences.

      def create_geofence_collection(
        collection_name : String,
        description : String? = nil,
        kms_key_id : String? = nil,
        pricing_plan : String? = nil,
        pricing_plan_data_source : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGeofenceCollectionRequest.new(collection_name: collection_name, description: description, kms_key_id: kms_key_id, pricing_plan: pricing_plan, pricing_plan_data_source: pricing_plan_data_source, tags: tags)
        create_geofence_collection(input)
      end

      def create_geofence_collection(input : Types::CreateGeofenceCollectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GEOFENCE_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an API key resource in your Amazon Web Services account, which lets you grant actions for
      # Amazon Location resources to the API key bearer. For more information, see Use API keys to
      # authenticate in the Amazon Location Service Developer Guide .

      def create_key(
        key_name : String,
        restrictions : Types::ApiKeyRestrictions,
        description : String? = nil,
        expire_time : Time? = nil,
        no_expiry : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKeyRequest.new(key_name: key_name, restrictions: restrictions, description: description, expire_time: expire_time, no_expiry: no_expiry, tags: tags)
        create_key(input)
      end

      def create_key(input : Types::CreateKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # the Maps API V2 unless you require Grab data. CreateMap is part of a previous Amazon Location
      # Service Maps API (version 1) which has been superseded by a more intuitive, powerful, and complete
      # API (version 2). The Maps API version 2 has a simplified interface that can be used without creating
      # or managing map resources. If you are using an AWS SDK or the AWS CLI, note that the Maps API
      # version 2 is found under geo-maps or geo_maps , not under location . Since Grab is not yet fully
      # supported in Maps API version 2, we recommend you continue using API version 1 when using Grab .
      # Start your version 2 API journey with the Maps V2 API Reference or the Developer Guide . Creates a
      # map resource in your Amazon Web Services account, which provides map tiles of different styles
      # sourced from global location data providers. If your application is tracking or routing assets you
      # use in your business, such as delivery vehicles or employees, you must not use Esri as your
      # geolocation provider. See section 82 of the Amazon Web Services service terms for more details.

      def create_map(
        configuration : Types::MapConfiguration,
        map_name : String,
        description : String? = nil,
        pricing_plan : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMapRequest.new(configuration: configuration, map_name: map_name, description: description, pricing_plan: pricing_plan, tags: tags)
        create_map(input)
      end

      def create_map(input : Types::CreateMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Places API V2 unless you require Grab data. CreatePlaceIndex is part of a previous Amazon
      # Location Service Places API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Places API version 2 has a simplified interface that can be used
      # without creating or managing place index resources. If you are using an Amazon Web Services SDK or
      # the Amazon Web Services CLI, note that the Places API version 2 is found under geo-places or
      # geo_places , not under location . Since Grab is not yet fully supported in Places API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Places V2 API Reference or the Developer Guide . Creates a place index resource in your Amazon
      # Web Services account. Use a place index resource to geocode addresses and other text queries by
      # using the SearchPlaceIndexForText operation, and reverse geocode coordinates by using the
      # SearchPlaceIndexForPosition operation, and enable autosuggestions by using the
      # SearchPlaceIndexForSuggestions operation. If your application is tracking or routing assets you use
      # in your business, such as delivery vehicles or employees, you must not use Esri as your geolocation
      # provider. See section 82 of the Amazon Web Services service terms for more details.

      def create_place_index(
        data_source : String,
        index_name : String,
        data_source_configuration : Types::DataSourceConfiguration? = nil,
        description : String? = nil,
        pricing_plan : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePlaceIndexRequest.new(data_source: data_source, index_name: index_name, data_source_configuration: data_source_configuration, description: description, pricing_plan: pricing_plan, tags: tags)
        create_place_index(input)
      end

      def create_place_index(input : Types::CreatePlaceIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PLACE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Routes API V2 unless you require Grab data. CreateRouteCalculator is part of a previous Amazon
      # Location Service Routes API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Routes API version 2 has a simplified interface that can be used
      # without creating or managing route calculator resources. If you are using an Amazon Web Services SDK
      # or the Amazon Web Services CLI, note that the Routes API version 2 is found under geo-routes or
      # geo_routes , not under location . Since Grab is not yet fully supported in Routes API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Routes V2 API Reference or the Developer Guide . Creates a route calculator resource in your
      # Amazon Web Services account. You can send requests to a route calculator resource to estimate travel
      # time, distance, and get directions. A route calculator sources traffic and road network data from
      # your chosen data provider. If your application is tracking or routing assets you use in your
      # business, such as delivery vehicles or employees, you must not use Esri as your geolocation
      # provider. See section 82 of the Amazon Web Services service terms for more details.

      def create_route_calculator(
        calculator_name : String,
        data_source : String,
        description : String? = nil,
        pricing_plan : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRouteCalculatorRequest.new(calculator_name: calculator_name, data_source: data_source, description: description, pricing_plan: pricing_plan, tags: tags)
        create_route_calculator(input)
      end

      def create_route_calculator(input : Types::CreateRouteCalculatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTE_CALCULATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a tracker resource in your Amazon Web Services account, which lets you retrieve current and
      # historical location of devices.

      def create_tracker(
        tracker_name : String,
        description : String? = nil,
        event_bridge_enabled : Bool? = nil,
        kms_key_enable_geospatial_queries : Bool? = nil,
        kms_key_id : String? = nil,
        position_filtering : String? = nil,
        pricing_plan : String? = nil,
        pricing_plan_data_source : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTrackerRequest.new(tracker_name: tracker_name, description: description, event_bridge_enabled: event_bridge_enabled, kms_key_enable_geospatial_queries: kms_key_enable_geospatial_queries, kms_key_id: kms_key_id, position_filtering: position_filtering, pricing_plan: pricing_plan, pricing_plan_data_source: pricing_plan_data_source, tags: tags)
        create_tracker(input)
      end

      def create_tracker(input : Types::CreateTrackerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRACKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a geofence collection from your Amazon Web Services account. This operation deletes the
      # resource permanently. If the geofence collection is the target of a tracker resource, the devices
      # will no longer be monitored.

      def delete_geofence_collection(
        collection_name : String
      ) : Protocol::Request
        input = Types::DeleteGeofenceCollectionRequest.new(collection_name: collection_name)
        delete_geofence_collection(input)
      end

      def delete_geofence_collection(input : Types::DeleteGeofenceCollectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GEOFENCE_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified API key. The API key must have been deactivated more than 90 days previously.
      # For more information, see Use API keys to authenticate in the Amazon Location Service Developer
      # Guide .

      def delete_key(
        key_name : String,
        force_delete : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteKeyRequest.new(key_name: key_name, force_delete: force_delete)
        delete_key(input)
      end

      def delete_key(input : Types::DeleteKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # the Maps API V2 unless you require Grab data. DeleteMap is part of a previous Amazon Location
      # Service Maps API (version 1) which has been superseded by a more intuitive, powerful, and complete
      # API (version 2). The Maps API version 2 has a simplified interface that can be used without creating
      # or managing map resources. If you are using an AWS SDK or the AWS CLI, note that the Maps API
      # version 2 is found under geo-maps or geo_maps , not under location . Since Grab is not yet fully
      # supported in Maps API version 2, we recommend you continue using API version 1 when using Grab .
      # Start your version 2 API journey with the Maps V2 API Reference or the Developer Guide . Deletes a
      # map resource from your Amazon Web Services account. This operation deletes the resource permanently.
      # If the map is being used in an application, the map may not render.

      def delete_map(
        map_name : String
      ) : Protocol::Request
        input = Types::DeleteMapRequest.new(map_name: map_name)
        delete_map(input)
      end

      def delete_map(input : Types::DeleteMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Places API V2 unless you require Grab data. DeletePlaceIndex is part of a previous Amazon
      # Location Service Places API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Places API version 2 has a simplified interface that can be used
      # without creating or managing place index resources. If you are using an Amazon Web Services SDK or
      # the Amazon Web Services CLI, note that the Places API version 2 is found under geo-places or
      # geo_places , not under location . Since Grab is not yet fully supported in Places API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Places V2 API Reference or the Developer Guide . Deletes a place index resource from your Amazon
      # Web Services account. This operation deletes the resource permanently.

      def delete_place_index(
        index_name : String
      ) : Protocol::Request
        input = Types::DeletePlaceIndexRequest.new(index_name: index_name)
        delete_place_index(input)
      end

      def delete_place_index(input : Types::DeletePlaceIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PLACE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Routes API V2 unless you require Grab data. DeleteRouteCalculator is part of a previous Amazon
      # Location Service Routes API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Routes API version 2 has a simplified interface that can be used
      # without creating or managing route calculator resources. If you are using an Amazon Web Services SDK
      # or the Amazon Web Services CLI, note that the Routes API version 2 is found under geo-routes or
      # geo_routes , not under location . Since Grab is not yet fully supported in Routes API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Routes V2 API Reference or the Developer Guide . Deletes a route calculator resource from your
      # Amazon Web Services account. This operation deletes the resource permanently.

      def delete_route_calculator(
        calculator_name : String
      ) : Protocol::Request
        input = Types::DeleteRouteCalculatorRequest.new(calculator_name: calculator_name)
        delete_route_calculator(input)
      end

      def delete_route_calculator(input : Types::DeleteRouteCalculatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTE_CALCULATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a tracker resource from your Amazon Web Services account. This operation deletes the
      # resource permanently. If the tracker resource is in use, you may encounter an error. Make sure that
      # the target resource isn't a dependency for your applications.

      def delete_tracker(
        tracker_name : String
      ) : Protocol::Request
        input = Types::DeleteTrackerRequest.new(tracker_name: tracker_name)
        delete_tracker(input)
      end

      def delete_tracker(input : Types::DeleteTrackerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TRACKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the geofence collection details.

      def describe_geofence_collection(
        collection_name : String
      ) : Protocol::Request
        input = Types::DescribeGeofenceCollectionRequest.new(collection_name: collection_name)
        describe_geofence_collection(input)
      end

      def describe_geofence_collection(input : Types::DescribeGeofenceCollectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GEOFENCE_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the API key resource details. For more information, see Use API keys to authenticate in
      # the Amazon Location Service Developer Guide .

      def describe_key(
        key_name : String
      ) : Protocol::Request
        input = Types::DescribeKeyRequest.new(key_name: key_name)
        describe_key(input)
      end

      def describe_key(input : Types::DescribeKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # the Maps API V2 unless you require Grab data. DescribeMap is part of a previous Amazon Location
      # Service Maps API (version 1) which has been superseded by a more intuitive, powerful, and complete
      # API (version 2). The Maps API version 2 has a simplified interface that can be used without creating
      # or managing map resources. If you are using an AWS SDK or the AWS CLI, note that the Maps API
      # version 2 is found under geo-maps or geo_maps , not under location . Since Grab is not yet fully
      # supported in Maps API version 2, we recommend you continue using API version 1 when using Grab .
      # Start your version 2 API journey with the Maps V2 API Reference or the Developer Guide . Retrieves
      # the map resource details.

      def describe_map(
        map_name : String
      ) : Protocol::Request
        input = Types::DescribeMapRequest.new(map_name: map_name)
        describe_map(input)
      end

      def describe_map(input : Types::DescribeMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Places API V2 unless you require Grab data. DescribePlaceIndex is part of a previous Amazon
      # Location Service Places API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Places API version 2 has a simplified interface that can be used
      # without creating or managing place index resources. If you are using an Amazon Web Services SDK or
      # the Amazon Web Services CLI, note that the Places API version 2 is found under geo-places or
      # geo_places , not under location . Since Grab is not yet fully supported in Places API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Places V2 API Reference or the Developer Guide . Retrieves the place index resource details.

      def describe_place_index(
        index_name : String
      ) : Protocol::Request
        input = Types::DescribePlaceIndexRequest.new(index_name: index_name)
        describe_place_index(input)
      end

      def describe_place_index(input : Types::DescribePlaceIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PLACE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Routes API V2 unless you require Grab data. DescribeRouteCalculator is part of a previous Amazon
      # Location Service Routes API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Routes API version 2 has a simplified interface that can be used
      # without creating or managing route calculator resources. If you are using an Amazon Web Services SDK
      # or the Amazon Web Services CLI, note that the Routes API version 2 is found under geo-routes or
      # geo_routes , not under location . Since Grab is not yet fully supported in Routes API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Routes V2 API Reference or the Developer Guide . Retrieves the route calculator resource
      # details.

      def describe_route_calculator(
        calculator_name : String
      ) : Protocol::Request
        input = Types::DescribeRouteCalculatorRequest.new(calculator_name: calculator_name)
        describe_route_calculator(input)
      end

      def describe_route_calculator(input : Types::DescribeRouteCalculatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ROUTE_CALCULATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the tracker resource details.

      def describe_tracker(
        tracker_name : String
      ) : Protocol::Request
        input = Types::DescribeTrackerRequest.new(tracker_name: tracker_name)
        describe_tracker(input)
      end

      def describe_tracker(input : Types::DescribeTrackerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TRACKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between a tracker resource and a geofence collection. Once you unlink a
      # tracker resource from a geofence collection, the tracker positions will no longer be automatically
      # evaluated against geofences.

      def disassociate_tracker_consumer(
        consumer_arn : String,
        tracker_name : String
      ) : Protocol::Request
        input = Types::DisassociateTrackerConsumerRequest.new(consumer_arn: consumer_arn, tracker_name: tracker_name)
        disassociate_tracker_consumer(input)
      end

      def disassociate_tracker_consumer(input : Types::DisassociateTrackerConsumerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_TRACKER_CONSUMER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action forecasts future geofence events that are likely to occur within a specified time
      # horizon if a device continues moving at its current speed. Each forecasted event is associated with
      # a geofence from a provided geofence collection. A forecast event can have one of the following
      # states: ENTER : The device position is outside the referenced geofence, but the device may cross
      # into the geofence during the forecasting time horizon if it maintains its current speed. EXIT : The
      # device position is inside the referenced geofence, but the device may leave the geofence during the
      # forecasted time horizon if the device maintains it's current speed. IDLE :The device is inside the
      # geofence, and it will remain inside the geofence through the end of the time horizon if the device
      # maintains it's current speed. Heading direction is not considered in the current version. The API
      # takes a conservative approach and includes events that can occur for any heading.

      def forecast_geofence_events(
        collection_name : String,
        device_state : Types::ForecastGeofenceEventsDeviceState,
        distance_unit : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        speed_unit : String? = nil,
        time_horizon_minutes : Float64? = nil
      ) : Protocol::Request
        input = Types::ForecastGeofenceEventsRequest.new(collection_name: collection_name, device_state: device_state, distance_unit: distance_unit, max_results: max_results, next_token: next_token, speed_unit: speed_unit, time_horizon_minutes: time_horizon_minutes)
        forecast_geofence_events(input)
      end

      def forecast_geofence_events(input : Types::ForecastGeofenceEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::FORECAST_GEOFENCE_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a device's most recent position according to its sample time. Device positions are deleted
      # after 30 days.

      def get_device_position(
        device_id : String,
        tracker_name : String
      ) : Protocol::Request
        input = Types::GetDevicePositionRequest.new(device_id: device_id, tracker_name: tracker_name)
        get_device_position(input)
      end

      def get_device_position(input : Types::GetDevicePositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the device position history from a tracker resource within a specified range of time.
      # Device positions are deleted after 30 days.

      def get_device_position_history(
        device_id : String,
        tracker_name : String,
        end_time_exclusive : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time_inclusive : Time? = nil
      ) : Protocol::Request
        input = Types::GetDevicePositionHistoryRequest.new(device_id: device_id, tracker_name: tracker_name, end_time_exclusive: end_time_exclusive, max_results: max_results, next_token: next_token, start_time_inclusive: start_time_inclusive)
        get_device_position_history(input)
      end

      def get_device_position_history(input : Types::GetDevicePositionHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE_POSITION_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the geofence details from a geofence collection. The returned geometry will always match
      # the geometry format used when the geofence was created.

      def get_geofence(
        collection_name : String,
        geofence_id : String
      ) : Protocol::Request
        input = Types::GetGeofenceRequest.new(collection_name: collection_name, geofence_id: geofence_id)
        get_geofence(input)
      end

      def get_geofence(input : Types::GetGeofenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GEOFENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # GetGlyphs unless you require Grab data. GetMapGlyphs is part of a previous Amazon Location Service
      # Maps API (version 1) which has been superseded by a more intuitive, powerful, and complete API
      # (version 2). The version 2 GetGlyphs operation gives a better user experience and is compatible with
      # the remainder of the V2 Maps API. If you are using an AWS SDK or the AWS CLI, note that the Maps API
      # version 2 is found under geo-maps or geo_maps , not under location . Since Grab is not yet fully
      # supported in Maps API version 2, we recommend you continue using API version 1 when using Grab .
      # Start your version 2 API journey with the Maps V2 API Reference or the Developer Guide . Retrieves
      # glyphs used to display labels on a map.

      def get_map_glyphs(
        font_stack : String,
        font_unicode_range : String,
        map_name : String,
        key : String? = nil
      ) : Protocol::Request
        input = Types::GetMapGlyphsRequest.new(font_stack: font_stack, font_unicode_range: font_unicode_range, map_name: map_name, key: key)
        get_map_glyphs(input)
      end

      def get_map_glyphs(input : Types::GetMapGlyphsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MAP_GLYPHS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # GetSprites unless you require Grab data. GetMapSprites is part of a previous Amazon Location Service
      # Maps API (version 1) which has been superseded by a more intuitive, powerful, and complete API
      # (version 2). The version 2 GetSprites operation gives a better user experience and is compatible
      # with the remainder of the V2 Maps API. If you are using an AWS SDK or the AWS CLI, note that the
      # Maps API version 2 is found under geo-maps or geo_maps , not under location . Since Grab is not yet
      # fully supported in Maps API version 2, we recommend you continue using API version 1 when using Grab
      # . Start your version 2 API journey with the Maps V2 API Reference or the Developer Guide . Retrieves
      # the sprite sheet corresponding to a map resource. The sprite sheet is a PNG image paired with a JSON
      # document describing the offsets of individual icons that will be displayed on a rendered map.

      def get_map_sprites(
        file_name : String,
        map_name : String,
        key : String? = nil
      ) : Protocol::Request
        input = Types::GetMapSpritesRequest.new(file_name: file_name, map_name: map_name, key: key)
        get_map_sprites(input)
      end

      def get_map_sprites(input : Types::GetMapSpritesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MAP_SPRITES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # GetStyleDescriptor unless you require Grab data. GetMapStyleDescriptor is part of a previous Amazon
      # Location Service Maps API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The version 2 GetStyleDescriptor operation gives a better user experience
      # and is compatible with the remainder of the V2 Maps API. If you are using an AWS SDK or the AWS CLI,
      # note that the Maps API version 2 is found under geo-maps or geo_maps , not under location . Since
      # Grab is not yet fully supported in Maps API version 2, we recommend you continue using API version 1
      # when using Grab . Start your version 2 API journey with the Maps V2 API Reference or the Developer
      # Guide . Retrieves the map style descriptor from a map resource. The style descriptor contains
      # speciﬁcations on how features render on a map. For example, what data to display, what order to
      # display the data in, and the style for the data. Style descriptors follow the Mapbox Style
      # Specification.

      def get_map_style_descriptor(
        map_name : String,
        key : String? = nil
      ) : Protocol::Request
        input = Types::GetMapStyleDescriptorRequest.new(map_name: map_name, key: key)
        get_map_style_descriptor(input)
      end

      def get_map_style_descriptor(input : Types::GetMapStyleDescriptorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MAP_STYLE_DESCRIPTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # GetTile unless you require Grab data. GetMapTile is part of a previous Amazon Location Service Maps
      # API (version 1) which has been superseded by a more intuitive, powerful, and complete API (version
      # 2). The version 2 GetTile operation gives a better user experience and is compatible with the
      # remainder of the V2 Maps API. If you are using an AWS SDK or the AWS CLI, note that the Maps API
      # version 2 is found under geo-maps or geo_maps , not under location . Since Grab is not yet fully
      # supported in Maps API version 2, we recommend you continue using API version 1 when using Grab .
      # Start your version 2 API journey with the Maps V2 API Reference or the Developer Guide . Retrieves a
      # vector data tile from the map resource. Map tiles are used by clients to render a map. they're
      # addressed using a grid arrangement with an X coordinate, Y coordinate, and Z (zoom) level. The
      # origin (0, 0) is the top left of the map. Increasing the zoom level by 1 doubles both the X and Y
      # dimensions, so a tile containing data for the entire world at (0/0/0) will be split into 4 tiles at
      # zoom 1 (1/0/0, 1/0/1, 1/1/0, 1/1/1).

      def get_map_tile(
        map_name : String,
        x : String,
        y : String,
        z : String,
        key : String? = nil
      ) : Protocol::Request
        input = Types::GetMapTileRequest.new(map_name: map_name, x: x, y: y, z: z, key: key)
        get_map_tile(input)
      end

      def get_map_tile(input : Types::GetMapTileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MAP_TILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the V2 GetPlace operation unless you require Grab data. This version of GetPlace is part of a
      # previous Amazon Location Service Places API (version 1) which has been superseded by a more
      # intuitive, powerful, and complete API (version 2). Version 2 of the GetPlace operation interoperates
      # with the rest of the Places V2 API, while this version does not. If you are using an Amazon Web
      # Services SDK or the Amazon Web Services CLI, note that the Places API version 2 is found under
      # geo-places or geo_places , not under location . Since Grab is not yet fully supported in Places API
      # version 2, we recommend you continue using API version 1 when using Grab. Start your version 2 API
      # journey with the Places V2 API Reference or the Developer Guide . Finds a place by its unique ID. A
      # PlaceId is returned by other search operations. A PlaceId is valid only if all of the following are
      # the same in the original search request and the call to GetPlace . Customer Amazon Web Services
      # account Amazon Web Services Region Data provider specified in the place index resource If your Place
      # index resource is configured with Grab as your geolocation provider and Storage as Intended use, the
      # GetPlace operation is unavailable. For more information, see AWS service terms .

      def get_place(
        index_name : String,
        place_id : String,
        key : String? = nil,
        language : String? = nil
      ) : Protocol::Request
        input = Types::GetPlaceRequest.new(index_name: index_name, place_id: place_id, key: key, language: language)
        get_place(input)
      end

      def get_place(input : Types::GetPlaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PLACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A batch request to retrieve all device positions.

      def list_device_positions(
        tracker_name : String,
        filter_geometry : Types::TrackingFilterGeometry? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDevicePositionsRequest.new(tracker_name: tracker_name, filter_geometry: filter_geometry, max_results: max_results, next_token: next_token)
        list_device_positions(input)
      end

      def list_device_positions(input : Types::ListDevicePositionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICE_POSITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists geofence collections in your Amazon Web Services account.

      def list_geofence_collections(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGeofenceCollectionsRequest.new(max_results: max_results, next_token: next_token)
        list_geofence_collections(input)
      end

      def list_geofence_collections(input : Types::ListGeofenceCollectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GEOFENCE_COLLECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists geofences stored in a given geofence collection.

      def list_geofences(
        collection_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGeofencesRequest.new(collection_name: collection_name, max_results: max_results, next_token: next_token)
        list_geofences(input)
      end

      def list_geofences(input : Types::ListGeofencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GEOFENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists API key resources in your Amazon Web Services account. For more information, see Use API keys
      # to authenticate in the Amazon Location Service Developer Guide .

      def list_keys(
        filter : Types::ApiKeyFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKeysRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_keys(input)
      end

      def list_keys(input : Types::ListKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # the Maps API V2 unless you require Grab data. ListMaps is part of a previous Amazon Location Service
      # Maps API (version 1) which has been superseded by a more intuitive, powerful, and complete API
      # (version 2). The Maps API version 2 has a simplified interface that can be used without creating or
      # managing map resources. If you are using an AWS SDK or the AWS CLI, note that the Maps API version 2
      # is found under geo-maps or geo_maps , not under location . Since Grab is not yet fully supported in
      # Maps API version 2, we recommend you continue using API version 1 when using Grab . Start your
      # version 2 API journey with the Maps V2 API Reference or the Developer Guide . Lists map resources in
      # your Amazon Web Services account.

      def list_maps(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMapsRequest.new(max_results: max_results, next_token: next_token)
        list_maps(input)
      end

      def list_maps(input : Types::ListMapsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MAPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Places API V2 unless you require Grab data. ListPlaceIndexes is part of a previous Amazon
      # Location Service Places API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Places API version 2 has a simplified interface that can be used
      # without creating or managing place index resources. If you are using an Amazon Web Services SDK or
      # the Amazon Web Services CLI, note that the Places API version 2 is found under geo-places or
      # geo_places , not under location . Since Grab is not yet fully supported in Places API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Places V2 API Reference or the Developer Guide . Lists place index resources in your Amazon Web
      # Services account.

      def list_place_indexes(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPlaceIndexesRequest.new(max_results: max_results, next_token: next_token)
        list_place_indexes(input)
      end

      def list_place_indexes(input : Types::ListPlaceIndexesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLACE_INDEXES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Routes API V2 unless you require Grab data. ListRouteCalculators is part of a previous Amazon
      # Location Service Routes API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Routes API version 2 has a simplified interface that can be used
      # without creating or managing route calculator resources. If you are using an Amazon Web Services SDK
      # or the Amazon Web Services CLI, note that the Routes API version 2 is found under geo-routes or
      # geo_routes , not under location . Since Grab is not yet fully supported in Routes API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Routes V2 API Reference or the Developer Guide . Lists route calculator resources in your Amazon
      # Web Services account.

      def list_route_calculators(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRouteCalculatorsRequest.new(max_results: max_results, next_token: next_token)
        list_route_calculators(input)
      end

      def list_route_calculators(input : Types::ListRouteCalculatorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTE_CALCULATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags that are applied to the specified Amazon Location resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists geofence collections currently associated to the given tracker resource.

      def list_tracker_consumers(
        tracker_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrackerConsumersRequest.new(tracker_name: tracker_name, max_results: max_results, next_token: next_token)
        list_tracker_consumers(input)
      end

      def list_tracker_consumers(input : Types::ListTrackerConsumersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRACKER_CONSUMERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tracker resources in your Amazon Web Services account.

      def list_trackers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrackersRequest.new(max_results: max_results, next_token: next_token)
        list_trackers(input)
      end

      def list_trackers(input : Types::ListTrackersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRACKERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stores a geofence geometry in a given geofence collection, or updates the geometry of an existing
      # geofence if a geofence ID is included in the request.

      def put_geofence(
        collection_name : String,
        geofence_id : String,
        geometry : Types::GeofenceGeometry,
        geofence_properties : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::PutGeofenceRequest.new(collection_name: collection_name, geofence_id: geofence_id, geometry: geometry, geofence_properties: geofence_properties)
        put_geofence(input)
      end

      def put_geofence(input : Types::PutGeofenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_GEOFENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # ReverseGeocode or SearchNearby unless you require Grab data. SearchPlaceIndexForPosition is part of
      # a previous Amazon Location Service Places API (version 1) which has been superseded by a more
      # intuitive, powerful, and complete API (version 2). The version 2 ReverseGeocode operation gives
      # better results in the address reverse-geocoding use case, while the version 2 SearchNearby operation
      # gives better results when searching for businesses and points of interest near a specific location.
      # If you are using an Amazon Web Services SDK or the Amazon Web Services CLI, note that the Places API
      # version 2 is found under geo-places or geo_places , not under location . Since Grab is not yet fully
      # supported in Places API version 2, we recommend you continue using API version 1 when using Grab.
      # Reverse geocodes a given coordinate and returns a legible address. Allows you to search for Places
      # or points of interest near a given position.

      def search_place_index_for_position(
        index_name : String,
        position : Array(Float64),
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil
      ) : Protocol::Request
        input = Types::SearchPlaceIndexForPositionRequest.new(index_name: index_name, position: position, key: key, language: language, max_results: max_results)
        search_place_index_for_position(input)
      end

      def search_place_index_for_position(input : Types::SearchPlaceIndexForPositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_PLACE_INDEX_FOR_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # Suggest or Autocomplete unless you require Grab data. SearchPlaceIndexForSuggestions is part of a
      # previous Amazon Location Service Places API (version 1) which has been superseded by a more
      # intuitive, powerful, and complete API (version 2). The version 2 Suggest operation gives better
      # results for typeahead place search suggestions with fuzzy matching, while the version 2 Autocomplete
      # operation gives better results for address completion based on partial input. If you are using an
      # Amazon Web Services SDK or the Amazon Web Services CLI, note that the Places API version 2 is found
      # under geo-places or geo_places , not under location . Since Grab is not yet fully supported in
      # Places API version 2, we recommend you continue using API version 1 when using Grab. Generates
      # suggestions for addresses and points of interest based on partial or misspelled free-form text. This
      # operation is also known as autocomplete, autosuggest, or fuzzy matching. Optional parameters let you
      # narrow your search results by bounding box or country, or bias your search toward a specific
      # position on the globe. You can search for suggested place names near a specified position by using
      # BiasPosition , or filter results within a bounding box by using FilterBBox . These parameters are
      # mutually exclusive; using both BiasPosition and FilterBBox in the same command returns an error.

      def search_place_index_for_suggestions(
        index_name : String,
        text : String,
        bias_position : Array(Float64)? = nil,
        filter_b_box : Array(Float64)? = nil,
        filter_categories : Array(String)? = nil,
        filter_countries : Array(String)? = nil,
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil
      ) : Protocol::Request
        input = Types::SearchPlaceIndexForSuggestionsRequest.new(index_name: index_name, text: text, bias_position: bias_position, filter_b_box: filter_b_box, filter_categories: filter_categories, filter_countries: filter_countries, key: key, language: language, max_results: max_results)
        search_place_index_for_suggestions(input)
      end

      def search_place_index_for_suggestions(input : Types::SearchPlaceIndexForSuggestionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_PLACE_INDEX_FOR_SUGGESTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # Geocode or SearchText unless you require Grab data. SearchPlaceIndexForText is part of a previous
      # Amazon Location Service Places API (version 1) which has been superseded by a more intuitive,
      # powerful, and complete API (version 2). The version 2 Geocode operation gives better results in the
      # address geocoding use case, while the version 2 SearchText operation gives better results when
      # searching for businesses and points of interest. If you are using an Amazon Web Services SDK or the
      # Amazon Web Services CLI, note that the Places API version 2 is found under geo-places or geo_places
      # , not under location . Since Grab is not yet fully supported in Places API version 2, we recommend
      # you continue using API version 1 when using Grab. Geocodes free-form text, such as an address, name,
      # city, or region to allow you to search for Places or points of interest. Optional parameters let you
      # narrow your search results by bounding box or country, or bias your search toward a specific
      # position on the globe. You can search for places near a given position using BiasPosition , or
      # filter results within a bounding box using FilterBBox . Providing both parameters simultaneously
      # returns an error. Search results are returned in order of highest to lowest relevance.

      def search_place_index_for_text(
        index_name : String,
        text : String,
        bias_position : Array(Float64)? = nil,
        filter_b_box : Array(Float64)? = nil,
        filter_categories : Array(String)? = nil,
        filter_countries : Array(String)? = nil,
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil
      ) : Protocol::Request
        input = Types::SearchPlaceIndexForTextRequest.new(index_name: index_name, text: text, bias_position: bias_position, filter_b_box: filter_b_box, filter_categories: filter_categories, filter_countries: filter_countries, key: key, language: language, max_results: max_results)
        search_place_index_for_text(input)
      end

      def search_place_index_for_text(input : Types::SearchPlaceIndexForTextRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_PLACE_INDEX_FOR_TEXT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified Amazon Location Service resource. Tags
      # can help you organize and categorize your resources. You can also use them to scope user
      # permissions, by granting a user permission to access or change only resources with certain tag
      # values. You can use the TagResource operation with an Amazon Location Service resource that already
      # has tags. If you specify a new tag key for the resource, this tag is appended to the tags already
      # associated with the resource. If you specify a tag key that's already associated with the resource,
      # the new tag value that you specify replaces the previous value for that tag. You can associate up to
      # 50 tags with a resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from the specified Amazon Location resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified properties of a given geofence collection.

      def update_geofence_collection(
        collection_name : String,
        description : String? = nil,
        pricing_plan : String? = nil,
        pricing_plan_data_source : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGeofenceCollectionRequest.new(collection_name: collection_name, description: description, pricing_plan: pricing_plan, pricing_plan_data_source: pricing_plan_data_source)
        update_geofence_collection(input)
      end

      def update_geofence_collection(input : Types::UpdateGeofenceCollectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GEOFENCE_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified properties of a given API key resource.

      def update_key(
        key_name : String,
        description : String? = nil,
        expire_time : Time? = nil,
        force_update : Bool? = nil,
        no_expiry : Bool? = nil,
        restrictions : Types::ApiKeyRestrictions? = nil
      ) : Protocol::Request
        input = Types::UpdateKeyRequest.new(key_name: key_name, description: description, expire_time: expire_time, force_update: force_update, no_expiry: no_expiry, restrictions: restrictions)
        update_key(input)
      end

      def update_key(input : Types::UpdateKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend upgrading to
      # the Maps API V2 unless you require Grab data. UpdateMap is part of a previous Amazon Location
      # Service Maps API (version 1) which has been superseded by a more intuitive, powerful, and complete
      # API (version 2). The Maps API version 2 has a simplified interface that can be used without creating
      # or managing map resources. If you are using an AWS SDK or the AWS CLI, note that the Maps API
      # version 2 is found under geo-maps or geo_maps , not under location . Since Grab is not yet fully
      # supported in Maps API version 2, we recommend you continue using API version 1 when using Grab .
      # Start your version 2 API journey with the Maps V2 API Reference or the Developer Guide . Updates the
      # specified properties of a given map resource.

      def update_map(
        map_name : String,
        configuration_update : Types::MapConfigurationUpdate? = nil,
        description : String? = nil,
        pricing_plan : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMapRequest.new(map_name: map_name, configuration_update: configuration_update, description: description, pricing_plan: pricing_plan)
        update_map(input)
      end

      def update_map(input : Types::UpdateMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Places API V2 unless you require Grab data. UpdatePlaceIndex is part of a previous Amazon
      # Location Service Places API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Places API version 2 has a simplified interface that can be used
      # without creating or managing place index resources. If you are using an Amazon Web Services SDK or
      # the Amazon Web Services CLI, note that the Places API version 2 is found under geo-places or
      # geo_places , not under location . Since Grab is not yet fully supported in Places API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Places V2 API Reference or the Developer Guide . Updates the specified properties of a given
      # place index resource.

      def update_place_index(
        index_name : String,
        data_source_configuration : Types::DataSourceConfiguration? = nil,
        description : String? = nil,
        pricing_plan : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePlaceIndexRequest.new(index_name: index_name, data_source_configuration: data_source_configuration, description: description, pricing_plan: pricing_plan)
        update_place_index(input)
      end

      def update_place_index(input : Types::UpdatePlaceIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PLACE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation is no longer current and may be deprecated in the future. We recommend you upgrade to
      # the Routes API V2 unless you require Grab data. UpdateRouteCalculator is part of a previous Amazon
      # Location Service Routes API (version 1) which has been superseded by a more intuitive, powerful, and
      # complete API (version 2). The Routes API version 2 has a simplified interface that can be used
      # without creating or managing route calculator resources. If you are using an Amazon Web Services SDK
      # or the Amazon Web Services CLI, note that the Routes API version 2 is found under geo-routes or
      # geo_routes , not under location . Since Grab is not yet fully supported in Routes API version 2, we
      # recommend you continue using API version 1 when using Grab. Start your version 2 API journey with
      # the Routes V2 API Reference or the Developer Guide . Updates the specified properties for a given
      # route calculator resource.

      def update_route_calculator(
        calculator_name : String,
        description : String? = nil,
        pricing_plan : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRouteCalculatorRequest.new(calculator_name: calculator_name, description: description, pricing_plan: pricing_plan)
        update_route_calculator(input)
      end

      def update_route_calculator(input : Types::UpdateRouteCalculatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTE_CALCULATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified properties of a given tracker resource.

      def update_tracker(
        tracker_name : String,
        description : String? = nil,
        event_bridge_enabled : Bool? = nil,
        kms_key_enable_geospatial_queries : Bool? = nil,
        position_filtering : String? = nil,
        pricing_plan : String? = nil,
        pricing_plan_data_source : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTrackerRequest.new(tracker_name: tracker_name, description: description, event_bridge_enabled: event_bridge_enabled, kms_key_enable_geospatial_queries: kms_key_enable_geospatial_queries, position_filtering: position_filtering, pricing_plan: pricing_plan, pricing_plan_data_source: pricing_plan_data_source)
        update_tracker(input)
      end

      def update_tracker(input : Types::UpdateTrackerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TRACKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies the integrity of the device's position by determining if it was reported behind a proxy,
      # and by comparing it to an inferred position estimated based on the device's state. The Location
      # Integrity SDK provides enhanced features related to device verification, and it is available for use
      # by request. To get access to the SDK, contact Sales Support .

      def verify_device_position(
        device_state : Types::DeviceState,
        tracker_name : String,
        distance_unit : String? = nil
      ) : Protocol::Request
        input = Types::VerifyDevicePositionRequest.new(device_state: device_state, tracker_name: tracker_name, distance_unit: distance_unit)
        verify_device_position(input)
      end

      def verify_device_position(input : Types::VerifyDevicePositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VERIFY_DEVICE_POSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
