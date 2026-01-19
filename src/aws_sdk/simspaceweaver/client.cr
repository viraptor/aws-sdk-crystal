module AwsSdk
  module SimSpaceWeaver
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

      # Creates a snapshot of the specified simulation. A snapshot is a file that contains simulation state
      # data at a specific time. The state data saved in a snapshot includes entity data from the State
      # Fabric, the simulation configuration specified in the schema, and the clock tick number. You can use
      # the snapshot to initialize a new simulation. For more information about snapshots, see Snapshots in
      # the SimSpace Weaver User Guide . You specify a Destination when you create a snapshot. The
      # Destination is the name of an Amazon S3 bucket and an optional ObjectKeyPrefix . The ObjectKeyPrefix
      # is usually the name of a folder in the bucket. SimSpace Weaver creates a snapshot folder inside the
      # Destination and places the snapshot file there. The snapshot file is an Amazon S3 object. It has an
      # object key with the form: object-key-prefix /snapshot/ simulation-name - YYMMdd - HHmm - ss .zip ,
      # where: YY is the 2-digit year MM is the 2-digit month dd is the 2-digit day of the month HH is the
      # 2-digit hour (24-hour clock) mm is the 2-digit minutes ss is the 2-digit seconds
      def create_snapshot(
        destination : Types::S3Destination,
        simulation : String
      ) : Protocol::Request
        input = Types::CreateSnapshotInput.new(destination: destination, simulation: simulation)
        create_snapshot(input)
      end
      def create_snapshot(input : Types::CreateSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the instance of the given custom app.
      def delete_app(
        app : String,
        domain : String,
        simulation : String
      ) : Protocol::Request
        input = Types::DeleteAppInput.new(app: app, domain: domain, simulation: simulation)
        delete_app(input)
      end
      def delete_app(input : Types::DeleteAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all SimSpace Weaver resources assigned to the given simulation. Your simulation uses
      # resources in other Amazon Web Services. This API operation doesn't delete resources in other Amazon
      # Web Services.
      def delete_simulation(
        simulation : String
      ) : Protocol::Request
        input = Types::DeleteSimulationInput.new(simulation: simulation)
        delete_simulation(input)
      end
      def delete_simulation(input : Types::DeleteSimulationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SIMULATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the state of the given custom app.
      def describe_app(
        app : String,
        domain : String,
        simulation : String
      ) : Protocol::Request
        input = Types::DescribeAppInput.new(app: app, domain: domain, simulation: simulation)
        describe_app(input)
      end
      def describe_app(input : Types::DescribeAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current state of the given simulation.
      def describe_simulation(
        simulation : String
      ) : Protocol::Request
        input = Types::DescribeSimulationInput.new(simulation: simulation)
        describe_simulation(input)
      end
      def describe_simulation(input : Types::DescribeSimulationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SIMULATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all custom apps or service apps for the given simulation and domain.
      def list_apps(
        simulation : String,
        domain : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppsInput.new(simulation: simulation, domain: domain, max_results: max_results, next_token: next_token)
        list_apps(input)
      end
      def list_apps(input : Types::ListAppsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the SimSpace Weaver simulations in the Amazon Web Services account used to make the API call.
      def list_simulations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSimulationsInput.new(max_results: max_results, next_token: next_token)
        list_simulations(input)
      end
      def list_simulations(input : Types::ListSimulationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIMULATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags on a SimSpace Weaver resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a custom app with the configuration specified in the simulation schema.
      def start_app(
        domain : String,
        name : String,
        simulation : String,
        client_token : String? = nil,
        description : String? = nil,
        launch_overrides : Types::LaunchOverrides? = nil
      ) : Protocol::Request
        input = Types::StartAppInput.new(domain: domain, name: name, simulation: simulation, client_token: client_token, description: description, launch_overrides: launch_overrides)
        start_app(input)
      end
      def start_app(input : Types::StartAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the simulation clock.
      def start_clock(
        simulation : String
      ) : Protocol::Request
        input = Types::StartClockInput.new(simulation: simulation)
        start_clock(input)
      end
      def start_clock(input : Types::StartClockInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CLOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a simulation with the given name. You must choose to start your simulation from a schema or
      # from a snapshot. For more information about the schema, see the schema reference in the SimSpace
      # Weaver User Guide . For more information about snapshots, see Snapshots in the SimSpace Weaver User
      # Guide .
      def start_simulation(
        name : String,
        role_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        maximum_duration : String? = nil,
        schema_s3_location : Types::S3Location? = nil,
        snapshot_s3_location : Types::S3Location? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartSimulationInput.new(name: name, role_arn: role_arn, client_token: client_token, description: description, maximum_duration: maximum_duration, schema_s3_location: schema_s3_location, snapshot_s3_location: snapshot_s3_location, tags: tags)
        start_simulation(input)
      end
      def start_simulation(input : Types::StartSimulationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SIMULATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the given custom app and shuts down all of its allocated compute resources.
      def stop_app(
        app : String,
        domain : String,
        simulation : String
      ) : Protocol::Request
        input = Types::StopAppInput.new(app: app, domain: domain, simulation: simulation)
        stop_app(input)
      end
      def stop_app(input : Types::StopAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the simulation clock.
      def stop_clock(
        simulation : String
      ) : Protocol::Request
        input = Types::StopClockInput.new(simulation: simulation)
        stop_clock(input)
      end
      def stop_clock(input : Types::StopClockInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CLOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the given simulation. You can't restart a simulation after you stop it. If you want to restart
      # a simulation, then you must stop it, delete it, and start a new instance of it.
      def stop_simulation(
        simulation : String
      ) : Protocol::Request
        input = Types::StopSimulationInput.new(simulation: simulation)
        stop_simulation(input)
      end
      def stop_simulation(input : Types::StopSimulationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_SIMULATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a SimSpace Weaver resource. For more information about tags, see Tagging Amazon Web
      # Services resources in the Amazon Web Services General Reference .
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a SimSpace Weaver resource. For more information about tags, see Tagging Amazon
      # Web Services resources in the Amazon Web Services General Reference .
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
