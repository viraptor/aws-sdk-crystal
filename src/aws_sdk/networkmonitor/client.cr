module AwsSdk
  module NetworkMonitor
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

      # Creates a monitor between a source subnet and destination IP address. Within a monitor you'll create
      # one or more probes that monitor network traffic between your source Amazon Web Services VPC subnets
      # and your destination IP addresses. Each probe then aggregates and sends metrics to Amazon
      # CloudWatch. You can also create a monitor with probes using this command. For each probe, you define
      # the following: source —The subnet IDs where the probes will be created. destination — The target
      # destination IP address for the probe. destinationPort —Required only if the protocol is TCP .
      # protocol —The communication protocol between the source and destination. This will be either TCP or
      # ICMP . packetSize —The size of the packets. This must be a number between 56 and 8500 . (Optional)
      # tags —Key-value pairs created and assigned to the probe.
      def create_monitor(
        monitor_name : String,
        aggregation_period : Int64? = nil,
        client_token : String? = nil,
        probes : Array(Types::CreateMonitorProbeInput)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMonitorInput.new(monitor_name: monitor_name, aggregation_period: aggregation_period, client_token: client_token, probes: probes, tags: tags)
        create_monitor(input)
      end
      def create_monitor(input : Types::CreateMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a probe within a monitor. Once you create a probe, and it begins monitoring your network
      # traffic, you'll incur billing charges for that probe. This action requires the monitorName
      # parameter. Run ListMonitors to get a list of monitor names. Note the name of the monitorName you
      # want to create the probe for.
      def create_probe(
        monitor_name : String,
        probe : Types::ProbeInput,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProbeInput.new(monitor_name: monitor_name, probe: probe, client_token: client_token, tags: tags)
        create_probe(input)
      end
      def create_probe(input : Types::CreateProbeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROBE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified monitor. This action requires the monitorName parameter. Run ListMonitors to get
      # a list of monitor names.
      def delete_monitor(
        monitor_name : String
      ) : Protocol::Request
        input = Types::DeleteMonitorInput.new(monitor_name: monitor_name)
        delete_monitor(input)
      end
      def delete_monitor(input : Types::DeleteMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified probe. Once a probe is deleted you'll no longer incur any billing fees for
      # that probe. This action requires both the monitorName and probeId parameters. Run ListMonitors to
      # get a list of monitor names. Run GetMonitor to get a list of probes and probe IDs. You can only
      # delete a single probe at a time using this action.
      def delete_probe(
        monitor_name : String,
        probe_id : String
      ) : Protocol::Request
        input = Types::DeleteProbeInput.new(monitor_name: monitor_name, probe_id: probe_id)
        delete_probe(input)
      end
      def delete_probe(input : Types::DeleteProbeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROBE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about a specific monitor. This action requires the monitorName parameter. Run
      # ListMonitors to get a list of monitor names.
      def get_monitor(
        monitor_name : String
      ) : Protocol::Request
        input = Types::GetMonitorInput.new(monitor_name: monitor_name)
        get_monitor(input)
      end
      def get_monitor(input : Types::GetMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details about a probe. This action requires both the monitorName and probeId parameters.
      # Run ListMonitors to get a list of monitor names. Run GetMonitor to get a list of probes and probe
      # IDs.
      def get_probe(
        monitor_name : String,
        probe_id : String
      ) : Protocol::Request
        input = Types::GetProbeInput.new(monitor_name: monitor_name, probe_id: probe_id)
        get_probe(input)
      end
      def get_probe(input : Types::GetProbeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROBE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all of your monitors.
      def list_monitors(
        max_results : Int32? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListMonitorsInput.new(max_results: max_results, next_token: next_token, state: state)
        list_monitors(input)
      end
      def list_monitors(input : Types::ListMonitorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MONITORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags assigned to this resource.
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

      # Adds key-value pairs to a monitor or probe.
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

      # Removes a key-value pair from a monitor or probe.
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

      # Updates the aggregationPeriod for a monitor. Monitors support an aggregationPeriod of either 30 or
      # 60 seconds. This action requires the monitorName and probeId parameter. Run ListMonitors to get a
      # list of monitor names.
      def update_monitor(
        aggregation_period : Int64,
        monitor_name : String
      ) : Protocol::Request
        input = Types::UpdateMonitorInput.new(aggregation_period: aggregation_period, monitor_name: monitor_name)
        update_monitor(input)
      end
      def update_monitor(input : Types::UpdateMonitorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a monitor probe. This action requires both the monitorName and probeId parameters. Run
      # ListMonitors to get a list of monitor names. Run GetMonitor to get a list of probes and probe IDs.
      # You can update the following para create a monitor with probes using this command. For each probe,
      # you define the following: state —The state of the probe. destination — The target destination IP
      # address for the probe. destinationPort —Required only if the protocol is TCP . protocol —The
      # communication protocol between the source and destination. This will be either TCP or ICMP .
      # packetSize —The size of the packets. This must be a number between 56 and 8500 . (Optional) tags
      # —Key-value pairs created and assigned to the probe.
      def update_probe(
        monitor_name : String,
        probe_id : String,
        destination : String? = nil,
        destination_port : Int32? = nil,
        packet_size : Int32? = nil,
        protocol : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProbeInput.new(monitor_name: monitor_name, probe_id: probe_id, destination: destination, destination_port: destination_port, packet_size: packet_size, protocol: protocol, state: state)
        update_probe(input)
      end
      def update_probe(input : Types::UpdateProbeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROBE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
