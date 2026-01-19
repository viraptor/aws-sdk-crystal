module AwsSdk
  module GroundStation
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

      # Cancels a contact with a specified contact ID.
      def cancel_contact(
        contact_id : String
      ) : Protocol::Request
        input = Types::CancelContactRequest.new(contact_id: contact_id)
        cancel_contact(input)
      end
      def cancel_contact(input : Types::CancelContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Config with the specified configData parameters. Only one type of configData can be
      # specified.
      def create_config(
        config_data : Types::ConfigTypeData,
        name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfigRequest.new(config_data: config_data, name: name, tags: tags)
        create_config(input)
      end
      def create_config(input : Types::CreateConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a DataflowEndpoint group containing the specified list of DataflowEndpoint objects. The name
      # field in each endpoint is used in your mission profile DataflowEndpointConfig to specify which
      # endpoints to use during a contact. When a contact uses multiple DataflowEndpointConfig objects, each
      # Config must match a DataflowEndpoint in the same group.
      def create_dataflow_endpoint_group(
        endpoint_details : Array(Types::EndpointDetails),
        contact_post_pass_duration_seconds : Int32? = nil,
        contact_pre_pass_duration_seconds : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataflowEndpointGroupRequest.new(endpoint_details: endpoint_details, contact_post_pass_duration_seconds: contact_post_pass_duration_seconds, contact_pre_pass_duration_seconds: contact_pre_pass_duration_seconds, tags: tags)
        create_dataflow_endpoint_group(input)
      end
      def create_dataflow_endpoint_group(input : Types::CreateDataflowEndpointGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATAFLOW_ENDPOINT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a DataflowEndpointGroupV2 containing the specified list of DataflowEndpoint objects. The
      # name field in each endpoint is used in your mission profile DataflowEndpointConfig to specify which
      # endpoints to use during a contact. When a contact uses multiple DataflowEndpointConfig objects, each
      # Config must match a DataflowEndpoint in the same group.
      def create_dataflow_endpoint_group_v2(
        endpoints : Array(Types::CreateEndpointDetails),
        contact_post_pass_duration_seconds : Int32? = nil,
        contact_pre_pass_duration_seconds : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataflowEndpointGroupV2Request.new(endpoints: endpoints, contact_post_pass_duration_seconds: contact_post_pass_duration_seconds, contact_pre_pass_duration_seconds: contact_pre_pass_duration_seconds, tags: tags)
        create_dataflow_endpoint_group_v2(input)
      end
      def create_dataflow_endpoint_group_v2(input : Types::CreateDataflowEndpointGroupV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATAFLOW_ENDPOINT_GROUP_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an ephemeris with your specified EphemerisData .
      def create_ephemeris(
        name : String,
        enabled : Bool? = nil,
        ephemeris : Types::EphemerisData? = nil,
        expiration_time : Time? = nil,
        kms_key_arn : String? = nil,
        priority : Int32? = nil,
        satellite_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEphemerisRequest.new(name: name, enabled: enabled, ephemeris: ephemeris, expiration_time: expiration_time, kms_key_arn: kms_key_arn, priority: priority, satellite_id: satellite_id, tags: tags)
        create_ephemeris(input)
      end
      def create_ephemeris(input : Types::CreateEphemerisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EPHEMERIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a mission profile. dataflowEdges is a list of lists of strings. Each lower level list of
      # strings has two elements: a from ARN and a to ARN.
      def create_mission_profile(
        dataflow_edges : Array(Array(String)),
        minimum_viable_contact_duration_seconds : Int32,
        name : String,
        tracking_config_arn : String,
        contact_post_pass_duration_seconds : Int32? = nil,
        contact_pre_pass_duration_seconds : Int32? = nil,
        streams_kms_key : Types::KmsKey? = nil,
        streams_kms_role : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMissionProfileRequest.new(dataflow_edges: dataflow_edges, minimum_viable_contact_duration_seconds: minimum_viable_contact_duration_seconds, name: name, tracking_config_arn: tracking_config_arn, contact_post_pass_duration_seconds: contact_post_pass_duration_seconds, contact_pre_pass_duration_seconds: contact_pre_pass_duration_seconds, streams_kms_key: streams_kms_key, streams_kms_role: streams_kms_role, tags: tags)
        create_mission_profile(input)
      end
      def create_mission_profile(input : Types::CreateMissionProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MISSION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Config .
      def delete_config(
        config_id : String,
        config_type : String
      ) : Protocol::Request
        input = Types::DeleteConfigRequest.new(config_id: config_id, config_type: config_type)
        delete_config(input)
      end
      def delete_config(input : Types::DeleteConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a dataflow endpoint group.
      def delete_dataflow_endpoint_group(
        dataflow_endpoint_group_id : String
      ) : Protocol::Request
        input = Types::DeleteDataflowEndpointGroupRequest.new(dataflow_endpoint_group_id: dataflow_endpoint_group_id)
        delete_dataflow_endpoint_group(input)
      end
      def delete_dataflow_endpoint_group(input : Types::DeleteDataflowEndpointGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATAFLOW_ENDPOINT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an ephemeris.
      def delete_ephemeris(
        ephemeris_id : String
      ) : Protocol::Request
        input = Types::DeleteEphemerisRequest.new(ephemeris_id: ephemeris_id)
        delete_ephemeris(input)
      end
      def delete_ephemeris(input : Types::DeleteEphemerisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EPHEMERIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a mission profile.
      def delete_mission_profile(
        mission_profile_id : String
      ) : Protocol::Request
        input = Types::DeleteMissionProfileRequest.new(mission_profile_id: mission_profile_id)
        delete_mission_profile(input)
      end
      def delete_mission_profile(input : Types::DeleteMissionProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MISSION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing contact.
      def describe_contact(
        contact_id : String
      ) : Protocol::Request
        input = Types::DescribeContactRequest.new(contact_id: contact_id)
        describe_contact(input)
      end
      def describe_contact(input : Types::DescribeContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve information about an existing ephemeris.
      def describe_ephemeris(
        ephemeris_id : String
      ) : Protocol::Request
        input = Types::DescribeEphemerisRequest.new(ephemeris_id: ephemeris_id)
        describe_ephemeris(input)
      end
      def describe_ephemeris(input : Types::DescribeEphemerisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EPHEMERIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # For use by AWS Ground Station Agent and shouldn't be called directly. Gets the latest configuration
      # information for a registered agent.
      def get_agent_configuration(
        agent_id : String
      ) : Protocol::Request
        input = Types::GetAgentConfigurationRequest.new(agent_id: agent_id)
        get_agent_configuration(input)
      end
      def get_agent_configuration(input : Types::GetAgentConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # For use by AWS Ground Station Agent and shouldn't be called directly. Gets a presigned URL for
      # uploading agent task response logs.
      def get_agent_task_response_url(
        agent_id : String,
        task_id : String
      ) : Protocol::Request
        input = Types::GetAgentTaskResponseUrlRequest.new(agent_id: agent_id, task_id: task_id)
        get_agent_task_response_url(input)
      end
      def get_agent_task_response_url(input : Types::GetAgentTaskResponseUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_TASK_RESPONSE_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns Config information. Only one Config response can be returned.
      def get_config(
        config_id : String,
        config_type : String
      ) : Protocol::Request
        input = Types::GetConfigRequest.new(config_id: config_id, config_type: config_type)
        get_config(input)
      end
      def get_config(input : Types::GetConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the dataflow endpoint group.
      def get_dataflow_endpoint_group(
        dataflow_endpoint_group_id : String
      ) : Protocol::Request
        input = Types::GetDataflowEndpointGroupRequest.new(dataflow_endpoint_group_id: dataflow_endpoint_group_id)
        get_dataflow_endpoint_group(input)
      end
      def get_dataflow_endpoint_group(input : Types::GetDataflowEndpointGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATAFLOW_ENDPOINT_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the number of reserved minutes used by account.
      def get_minute_usage(
        month : Int32,
        year : Int32
      ) : Protocol::Request
        input = Types::GetMinuteUsageRequest.new(month: month, year: year)
        get_minute_usage(input)
      end
      def get_minute_usage(input : Types::GetMinuteUsageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MINUTE_USAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a mission profile.
      def get_mission_profile(
        mission_profile_id : String
      ) : Protocol::Request
        input = Types::GetMissionProfileRequest.new(mission_profile_id: mission_profile_id)
        get_mission_profile(input)
      end
      def get_mission_profile(input : Types::GetMissionProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MISSION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a satellite.
      def get_satellite(
        satellite_id : String
      ) : Protocol::Request
        input = Types::GetSatelliteRequest.new(satellite_id: satellite_id)
        get_satellite(input)
      end
      def get_satellite(input : Types::GetSatelliteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SATELLITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Config objects.
      def list_configs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigsRequest.new(max_results: max_results, next_token: next_token)
        list_configs(input)
      end
      def list_configs(input : Types::ListConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of contacts. If statusList contains AVAILABLE, the request must include groundStation
      # , missionprofileArn , and satelliteArn .
      def list_contacts(
        end_time : Time,
        start_time : Time,
        status_list : Array(String),
        ephemeris : Types::EphemerisFilter? = nil,
        ground_station : String? = nil,
        max_results : Int32? = nil,
        mission_profile_arn : String? = nil,
        next_token : String? = nil,
        satellite_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListContactsRequest.new(end_time: end_time, start_time: start_time, status_list: status_list, ephemeris: ephemeris, ground_station: ground_station, max_results: max_results, mission_profile_arn: mission_profile_arn, next_token: next_token, satellite_arn: satellite_arn)
        list_contacts(input)
      end
      def list_contacts(input : Types::ListContactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of DataflowEndpoint groups.
      def list_dataflow_endpoint_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataflowEndpointGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_dataflow_endpoint_groups(input)
      end
      def list_dataflow_endpoint_groups(input : Types::ListDataflowEndpointGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATAFLOW_ENDPOINT_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List your existing ephemerides.
      def list_ephemerides(
        end_time : Time,
        start_time : Time,
        ephemeris_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        satellite_id : String? = nil,
        status_list : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListEphemeridesRequest.new(end_time: end_time, start_time: start_time, ephemeris_type: ephemeris_type, max_results: max_results, next_token: next_token, satellite_id: satellite_id, status_list: status_list)
        list_ephemerides(input)
      end
      def list_ephemerides(input : Types::ListEphemeridesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EPHEMERIDES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of ground stations.
      def list_ground_stations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        satellite_id : String? = nil
      ) : Protocol::Request
        input = Types::ListGroundStationsRequest.new(max_results: max_results, next_token: next_token, satellite_id: satellite_id)
        list_ground_stations(input)
      end
      def list_ground_stations(input : Types::ListGroundStationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUND_STATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of mission profiles.
      def list_mission_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMissionProfilesRequest.new(max_results: max_results, next_token: next_token)
        list_mission_profiles(input)
      end
      def list_mission_profiles(input : Types::ListMissionProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MISSION_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of satellites.
      def list_satellites(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSatellitesRequest.new(max_results: max_results, next_token: next_token)
        list_satellites(input)
      end
      def list_satellites(input : Types::ListSatellitesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SATELLITES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for a specified resource.
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

      # For use by AWS Ground Station Agent and shouldn't be called directly. Registers a new agent with AWS
      # Ground Station.
      def register_agent(
        agent_details : Types::AgentDetails,
        discovery_data : Types::DiscoveryData,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::RegisterAgentRequest.new(agent_details: agent_details, discovery_data: discovery_data, tags: tags)
        register_agent(input)
      end
      def register_agent(input : Types::RegisterAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Reserves a contact using specified parameters.
      def reserve_contact(
        end_time : Time,
        ground_station : String,
        mission_profile_arn : String,
        start_time : Time,
        satellite_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        tracking_overrides : Types::TrackingOverrides? = nil
      ) : Protocol::Request
        input = Types::ReserveContactRequest.new(end_time: end_time, ground_station: ground_station, mission_profile_arn: mission_profile_arn, start_time: start_time, satellite_arn: satellite_arn, tags: tags, tracking_overrides: tracking_overrides)
        reserve_contact(input)
      end
      def reserve_contact(input : Types::ReserveContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESERVE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns a tag to a resource.
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

      # Deassigns a resource tag.
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

      # For use by AWS Ground Station Agent and shouldn't be called directly. Update the status of the
      # agent.
      def update_agent_status(
        agent_id : String,
        aggregate_status : Types::AggregateStatus,
        component_statuses : Array(Types::ComponentStatusData),
        task_id : String
      ) : Protocol::Request
        input = Types::UpdateAgentStatusRequest.new(agent_id: agent_id, aggregate_status: aggregate_status, component_statuses: component_statuses, task_id: task_id)
        update_agent_status(input)
      end
      def update_agent_status(input : Types::UpdateAgentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Config used when scheduling contacts. Updating a Config will not update the execution
      # parameters for existing future contacts scheduled with this Config .
      def update_config(
        config_data : Types::ConfigTypeData,
        config_id : String,
        config_type : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateConfigRequest.new(config_data: config_data, config_id: config_id, config_type: config_type, name: name)
        update_config(input)
      end
      def update_config(input : Types::UpdateConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an existing ephemeris.
      def update_ephemeris(
        enabled : Bool,
        ephemeris_id : String,
        name : String? = nil,
        priority : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateEphemerisRequest.new(enabled: enabled, ephemeris_id: ephemeris_id, name: name, priority: priority)
        update_ephemeris(input)
      end
      def update_ephemeris(input : Types::UpdateEphemerisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EPHEMERIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a mission profile. Updating a mission profile will not update the execution parameters for
      # existing future contacts.
      def update_mission_profile(
        mission_profile_id : String,
        contact_post_pass_duration_seconds : Int32? = nil,
        contact_pre_pass_duration_seconds : Int32? = nil,
        dataflow_edges : Array(Array(String))? = nil,
        minimum_viable_contact_duration_seconds : Int32? = nil,
        name : String? = nil,
        streams_kms_key : Types::KmsKey? = nil,
        streams_kms_role : String? = nil,
        tracking_config_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMissionProfileRequest.new(mission_profile_id: mission_profile_id, contact_post_pass_duration_seconds: contact_post_pass_duration_seconds, contact_pre_pass_duration_seconds: contact_pre_pass_duration_seconds, dataflow_edges: dataflow_edges, minimum_viable_contact_duration_seconds: minimum_viable_contact_duration_seconds, name: name, streams_kms_key: streams_kms_key, streams_kms_role: streams_kms_role, tracking_config_arn: tracking_config_arn)
        update_mission_profile(input)
      end
      def update_mission_profile(input : Types::UpdateMissionProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MISSION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
