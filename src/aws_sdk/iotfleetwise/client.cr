module AwsSdk
  module IoTFleetWise
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Adds, or associates, a vehicle with a fleet.

      def associate_vehicle_fleet(
        fleet_id : String,
        vehicle_name : String
      ) : Types::AssociateVehicleFleetResponse

        input = Types::AssociateVehicleFleetRequest.new(fleet_id: fleet_id, vehicle_name: vehicle_name)
        associate_vehicle_fleet(input)
      end

      def associate_vehicle_fleet(input : Types::AssociateVehicleFleetRequest) : Types::AssociateVehicleFleetResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_VEHICLE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateVehicleFleetResponse, "AssociateVehicleFleet")
      end

      # Creates a group, or batch, of vehicles. You must specify a decoder manifest and a vehicle model
      # (model manifest) for each vehicle. For more information, see Create multiple vehicles (AWS CLI) in
      # the Amazon Web Services IoT FleetWise Developer Guide .

      def batch_create_vehicle(
        vehicles : Array(Types::CreateVehicleRequestItem)
      ) : Types::BatchCreateVehicleResponse

        input = Types::BatchCreateVehicleRequest.new(vehicles: vehicles)
        batch_create_vehicle(input)
      end

      def batch_create_vehicle(input : Types::BatchCreateVehicleRequest) : Types::BatchCreateVehicleResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_CREATE_VEHICLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchCreateVehicleResponse, "BatchCreateVehicle")
      end

      # Updates a group, or batch, of vehicles. You must specify a decoder manifest and a vehicle model
      # (model manifest) for each vehicle. For more information, see Update multiple vehicles (AWS CLI) in
      # the Amazon Web Services IoT FleetWise Developer Guide .

      def batch_update_vehicle(
        vehicles : Array(Types::UpdateVehicleRequestItem)
      ) : Types::BatchUpdateVehicleResponse

        input = Types::BatchUpdateVehicleRequest.new(vehicles: vehicles)
        batch_update_vehicle(input)
      end

      def batch_update_vehicle(input : Types::BatchUpdateVehicleRequest) : Types::BatchUpdateVehicleResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_UPDATE_VEHICLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchUpdateVehicleResponse, "BatchUpdateVehicle")
      end

      # Creates an orchestration of data collection rules. The Amazon Web Services IoT FleetWise Edge Agent
      # software running in vehicles uses campaigns to decide how to collect and transfer data to the cloud.
      # You create campaigns in the cloud. After you or your team approve campaigns, Amazon Web Services IoT
      # FleetWise automatically deploys them to vehicles. For more information, see Collect and transfer
      # data with campaigns in the Amazon Web Services IoT FleetWise Developer Guide . Access to certain
      # Amazon Web Services IoT FleetWise features is currently gated. For more information, see Amazon Web
      # Services Region and feature availability in the Amazon Web Services IoT FleetWise Developer Guide .

      def create_campaign(
        collection_scheme : Types::CollectionScheme,
        name : String,
        signal_catalog_arn : String,
        target_arn : String,
        compression : String? = nil,
        data_destination_configs : Array(Types::DataDestinationConfig)? = nil,
        data_extra_dimensions : Array(String)? = nil,
        data_partitions : Array(Types::DataPartition)? = nil,
        description : String? = nil,
        diagnostics_mode : String? = nil,
        expiry_time : Time? = nil,
        post_trigger_collection_duration : Int64? = nil,
        priority : Int32? = nil,
        signals_to_collect : Array(Types::SignalInformation)? = nil,
        signals_to_fetch : Array(Types::SignalFetchInformation)? = nil,
        spooling_mode : String? = nil,
        start_time : Time? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCampaignResponse

        input = Types::CreateCampaignRequest.new(collection_scheme: collection_scheme, name: name, signal_catalog_arn: signal_catalog_arn, target_arn: target_arn, compression: compression, data_destination_configs: data_destination_configs, data_extra_dimensions: data_extra_dimensions, data_partitions: data_partitions, description: description, diagnostics_mode: diagnostics_mode, expiry_time: expiry_time, post_trigger_collection_duration: post_trigger_collection_duration, priority: priority, signals_to_collect: signals_to_collect, signals_to_fetch: signals_to_fetch, spooling_mode: spooling_mode, start_time: start_time, tags: tags)
        create_campaign(input)
      end

      def create_campaign(input : Types::CreateCampaignRequest) : Types::CreateCampaignResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCampaignResponse, "CreateCampaign")
      end

      # Creates the decoder manifest associated with a model manifest. To create a decoder manifest, the
      # following must be true: Every signal decoder has a unique name. Each signal decoder is associated
      # with a network interface. Each network interface has a unique ID. The signal decoders are specified
      # in the model manifest.

      def create_decoder_manifest(
        model_manifest_arn : String,
        name : String,
        default_for_unmapped_signals : String? = nil,
        description : String? = nil,
        network_interfaces : Array(Types::NetworkInterface)? = nil,
        signal_decoders : Array(Types::SignalDecoder)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDecoderManifestResponse

        input = Types::CreateDecoderManifestRequest.new(model_manifest_arn: model_manifest_arn, name: name, default_for_unmapped_signals: default_for_unmapped_signals, description: description, network_interfaces: network_interfaces, signal_decoders: signal_decoders, tags: tags)
        create_decoder_manifest(input)
      end

      def create_decoder_manifest(input : Types::CreateDecoderManifestRequest) : Types::CreateDecoderManifestResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DECODER_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDecoderManifestResponse, "CreateDecoderManifest")
      end

      # Creates a fleet that represents a group of vehicles. You must create both a signal catalog and
      # vehicles before you can create a fleet. For more information, see Fleets in the Amazon Web Services
      # IoT FleetWise Developer Guide .

      def create_fleet(
        fleet_id : String,
        signal_catalog_arn : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFleetResponse

        input = Types::CreateFleetRequest.new(fleet_id: fleet_id, signal_catalog_arn: signal_catalog_arn, description: description, tags: tags)
        create_fleet(input)
      end

      def create_fleet(input : Types::CreateFleetRequest) : Types::CreateFleetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFleetResponse, "CreateFleet")
      end

      # Creates a vehicle model (model manifest) that specifies signals (attributes, branches, sensors, and
      # actuators). For more information, see Vehicle models in the Amazon Web Services IoT FleetWise
      # Developer Guide .

      def create_model_manifest(
        name : String,
        nodes : Array(String),
        signal_catalog_arn : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelManifestResponse

        input = Types::CreateModelManifestRequest.new(name: name, nodes: nodes, signal_catalog_arn: signal_catalog_arn, description: description, tags: tags)
        create_model_manifest(input)
      end

      def create_model_manifest(input : Types::CreateModelManifestRequest) : Types::CreateModelManifestResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelManifestResponse, "CreateModelManifest")
      end

      # Creates a collection of standardized signals that can be reused to create vehicle models.

      def create_signal_catalog(
        name : String,
        description : String? = nil,
        nodes : Array(Types::Node)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSignalCatalogResponse

        input = Types::CreateSignalCatalogRequest.new(name: name, description: description, nodes: nodes, tags: tags)
        create_signal_catalog(input)
      end

      def create_signal_catalog(input : Types::CreateSignalCatalogRequest) : Types::CreateSignalCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SIGNAL_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSignalCatalogResponse, "CreateSignalCatalog")
      end

      # Creates a state template. State templates contain state properties, which are signals that belong to
      # a signal catalog that is synchronized between the Amazon Web Services IoT FleetWise Edge and the
      # Amazon Web Services Cloud. Access to certain Amazon Web Services IoT FleetWise features is currently
      # gated. For more information, see Amazon Web Services Region and feature availability in the Amazon
      # Web Services IoT FleetWise Developer Guide .

      def create_state_template(
        name : String,
        signal_catalog_arn : String,
        state_template_properties : Array(String),
        data_extra_dimensions : Array(String)? = nil,
        description : String? = nil,
        metadata_extra_dimensions : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateStateTemplateResponse

        input = Types::CreateStateTemplateRequest.new(name: name, signal_catalog_arn: signal_catalog_arn, state_template_properties: state_template_properties, data_extra_dimensions: data_extra_dimensions, description: description, metadata_extra_dimensions: metadata_extra_dimensions, tags: tags)
        create_state_template(input)
      end

      def create_state_template(input : Types::CreateStateTemplateRequest) : Types::CreateStateTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_STATE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStateTemplateResponse, "CreateStateTemplate")
      end

      # Creates a vehicle, which is an instance of a vehicle model (model manifest). Vehicles created from
      # the same vehicle model consist of the same signals inherited from the vehicle model. If you have an
      # existing Amazon Web Services IoT thing, you can use Amazon Web Services IoT FleetWise to create a
      # vehicle and collect data from your thing. For more information, see Create a vehicle (AWS CLI) in
      # the Amazon Web Services IoT FleetWise Developer Guide .

      def create_vehicle(
        decoder_manifest_arn : String,
        model_manifest_arn : String,
        vehicle_name : String,
        association_behavior : String? = nil,
        attributes : Hash(String, String)? = nil,
        state_templates : Array(Types::StateTemplateAssociation)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVehicleResponse

        input = Types::CreateVehicleRequest.new(decoder_manifest_arn: decoder_manifest_arn, model_manifest_arn: model_manifest_arn, vehicle_name: vehicle_name, association_behavior: association_behavior, attributes: attributes, state_templates: state_templates, tags: tags)
        create_vehicle(input)
      end

      def create_vehicle(input : Types::CreateVehicleRequest) : Types::CreateVehicleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VEHICLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVehicleResponse, "CreateVehicle")
      end

      # Deletes a data collection campaign. Deleting a campaign suspends all data collection and removes it
      # from any vehicles.

      def delete_campaign(
        name : String
      ) : Types::DeleteCampaignResponse

        input = Types::DeleteCampaignRequest.new(name: name)
        delete_campaign(input)
      end

      def delete_campaign(input : Types::DeleteCampaignRequest) : Types::DeleteCampaignResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCampaignResponse, "DeleteCampaign")
      end

      # Deletes a decoder manifest. You can't delete a decoder manifest if it has vehicles associated with
      # it.

      def delete_decoder_manifest(
        name : String
      ) : Types::DeleteDecoderManifestResponse

        input = Types::DeleteDecoderManifestRequest.new(name: name)
        delete_decoder_manifest(input)
      end

      def delete_decoder_manifest(input : Types::DeleteDecoderManifestRequest) : Types::DeleteDecoderManifestResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DECODER_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDecoderManifestResponse, "DeleteDecoderManifest")
      end

      # Deletes a fleet. Before you delete a fleet, all vehicles must be dissociated from the fleet. For
      # more information, see Delete a fleet (AWS CLI) in the Amazon Web Services IoT FleetWise Developer
      # Guide .

      def delete_fleet(
        fleet_id : String
      ) : Types::DeleteFleetResponse

        input = Types::DeleteFleetRequest.new(fleet_id: fleet_id)
        delete_fleet(input)
      end

      def delete_fleet(input : Types::DeleteFleetRequest) : Types::DeleteFleetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFleetResponse, "DeleteFleet")
      end

      # Deletes a vehicle model (model manifest).

      def delete_model_manifest(
        name : String
      ) : Types::DeleteModelManifestResponse

        input = Types::DeleteModelManifestRequest.new(name: name)
        delete_model_manifest(input)
      end

      def delete_model_manifest(input : Types::DeleteModelManifestRequest) : Types::DeleteModelManifestResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteModelManifestResponse, "DeleteModelManifest")
      end

      # Deletes a signal catalog.

      def delete_signal_catalog(
        name : String
      ) : Types::DeleteSignalCatalogResponse

        input = Types::DeleteSignalCatalogRequest.new(name: name)
        delete_signal_catalog(input)
      end

      def delete_signal_catalog(input : Types::DeleteSignalCatalogRequest) : Types::DeleteSignalCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SIGNAL_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSignalCatalogResponse, "DeleteSignalCatalog")
      end

      # Deletes a state template.

      def delete_state_template(
        identifier : String
      ) : Types::DeleteStateTemplateResponse

        input = Types::DeleteStateTemplateRequest.new(identifier: identifier)
        delete_state_template(input)
      end

      def delete_state_template(input : Types::DeleteStateTemplateRequest) : Types::DeleteStateTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_STATE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStateTemplateResponse, "DeleteStateTemplate")
      end

      # Deletes a vehicle and removes it from any campaigns.

      def delete_vehicle(
        vehicle_name : String
      ) : Types::DeleteVehicleResponse

        input = Types::DeleteVehicleRequest.new(vehicle_name: vehicle_name)
        delete_vehicle(input)
      end

      def delete_vehicle(input : Types::DeleteVehicleRequest) : Types::DeleteVehicleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VEHICLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVehicleResponse, "DeleteVehicle")
      end

      # Removes, or disassociates, a vehicle from a fleet. Disassociating a vehicle from a fleet doesn't
      # delete the vehicle.

      def disassociate_vehicle_fleet(
        fleet_id : String,
        vehicle_name : String
      ) : Types::DisassociateVehicleFleetResponse

        input = Types::DisassociateVehicleFleetRequest.new(fleet_id: fleet_id, vehicle_name: vehicle_name)
        disassociate_vehicle_fleet(input)
      end

      def disassociate_vehicle_fleet(input : Types::DisassociateVehicleFleetRequest) : Types::DisassociateVehicleFleetResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_VEHICLE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateVehicleFleetResponse, "DisassociateVehicleFleet")
      end

      # Retrieves information about a campaign. Access to certain Amazon Web Services IoT FleetWise features
      # is currently gated. For more information, see Amazon Web Services Region and feature availability in
      # the Amazon Web Services IoT FleetWise Developer Guide .

      def get_campaign(
        name : String
      ) : Types::GetCampaignResponse

        input = Types::GetCampaignRequest.new(name: name)
        get_campaign(input)
      end

      def get_campaign(input : Types::GetCampaignRequest) : Types::GetCampaignResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCampaignResponse, "GetCampaign")
      end

      # Retrieves information about a created decoder manifest.

      def get_decoder_manifest(
        name : String
      ) : Types::GetDecoderManifestResponse

        input = Types::GetDecoderManifestRequest.new(name: name)
        get_decoder_manifest(input)
      end

      def get_decoder_manifest(input : Types::GetDecoderManifestRequest) : Types::GetDecoderManifestResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DECODER_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDecoderManifestResponse, "GetDecoderManifest")
      end

      # Retrieves the encryption configuration for resources and data in Amazon Web Services IoT FleetWise.

      def get_encryption_configuration : Types::GetEncryptionConfigurationResponse
        input = Types::GetEncryptionConfigurationRequest.new
        get_encryption_configuration(input)
      end

      def get_encryption_configuration(input : Types::GetEncryptionConfigurationRequest) : Types::GetEncryptionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENCRYPTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEncryptionConfigurationResponse, "GetEncryptionConfiguration")
      end

      # Retrieves information about a fleet.

      def get_fleet(
        fleet_id : String
      ) : Types::GetFleetResponse

        input = Types::GetFleetRequest.new(fleet_id: fleet_id)
        get_fleet(input)
      end

      def get_fleet(input : Types::GetFleetRequest) : Types::GetFleetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFleetResponse, "GetFleet")
      end

      # Retrieves the logging options.

      def get_logging_options : Types::GetLoggingOptionsResponse
        input = Types::GetLoggingOptionsRequest.new
        get_logging_options(input)
      end

      def get_logging_options(input : Types::GetLoggingOptionsRequest) : Types::GetLoggingOptionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LOGGING_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoggingOptionsResponse, "GetLoggingOptions")
      end

      # Retrieves information about a vehicle model (model manifest).

      def get_model_manifest(
        name : String
      ) : Types::GetModelManifestResponse

        input = Types::GetModelManifestRequest.new(name: name)
        get_model_manifest(input)
      end

      def get_model_manifest(input : Types::GetModelManifestRequest) : Types::GetModelManifestResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MODEL_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetModelManifestResponse, "GetModelManifest")
      end

      # Retrieves information about the status of registering your Amazon Web Services account, IAM, and
      # Amazon Timestream resources so that Amazon Web Services IoT FleetWise can transfer your vehicle data
      # to the Amazon Web Services Cloud. For more information, including step-by-step procedures, see
      # Setting up Amazon Web Services IoT FleetWise . This API operation doesn't require input parameters.

      def get_register_account_status : Types::GetRegisterAccountStatusResponse
        input = Types::GetRegisterAccountStatusRequest.new
        get_register_account_status(input)
      end

      def get_register_account_status(input : Types::GetRegisterAccountStatusRequest) : Types::GetRegisterAccountStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGISTER_ACCOUNT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegisterAccountStatusResponse, "GetRegisterAccountStatus")
      end

      # Retrieves information about a signal catalog.

      def get_signal_catalog(
        name : String
      ) : Types::GetSignalCatalogResponse

        input = Types::GetSignalCatalogRequest.new(name: name)
        get_signal_catalog(input)
      end

      def get_signal_catalog(input : Types::GetSignalCatalogRequest) : Types::GetSignalCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SIGNAL_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSignalCatalogResponse, "GetSignalCatalog")
      end

      # Retrieves information about a state template. Access to certain Amazon Web Services IoT FleetWise
      # features is currently gated. For more information, see Amazon Web Services Region and feature
      # availability in the Amazon Web Services IoT FleetWise Developer Guide .

      def get_state_template(
        identifier : String
      ) : Types::GetStateTemplateResponse

        input = Types::GetStateTemplateRequest.new(identifier: identifier)
        get_state_template(input)
      end

      def get_state_template(input : Types::GetStateTemplateRequest) : Types::GetStateTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_STATE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStateTemplateResponse, "GetStateTemplate")
      end

      # Retrieves information about a vehicle.

      def get_vehicle(
        vehicle_name : String
      ) : Types::GetVehicleResponse

        input = Types::GetVehicleRequest.new(vehicle_name: vehicle_name)
        get_vehicle(input)
      end

      def get_vehicle(input : Types::GetVehicleRequest) : Types::GetVehicleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_VEHICLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVehicleResponse, "GetVehicle")
      end

      # Retrieves information about the status of campaigns, decoder manifests, or state templates
      # associated with a vehicle.

      def get_vehicle_status(
        vehicle_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetVehicleStatusResponse

        input = Types::GetVehicleStatusRequest.new(vehicle_name: vehicle_name, max_results: max_results, next_token: next_token)
        get_vehicle_status(input)
      end

      def get_vehicle_status(input : Types::GetVehicleStatusRequest) : Types::GetVehicleStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_VEHICLE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVehicleStatusResponse, "GetVehicleStatus")
      end

      # Creates a decoder manifest using your existing CAN DBC file from your local device. The CAN signal
      # name must be unique and not repeated across CAN message definitions in a .dbc file.

      def import_decoder_manifest(
        name : String,
        network_file_definitions : Array(Types::NetworkFileDefinition)
      ) : Types::ImportDecoderManifestResponse

        input = Types::ImportDecoderManifestRequest.new(name: name, network_file_definitions: network_file_definitions)
        import_decoder_manifest(input)
      end

      def import_decoder_manifest(input : Types::ImportDecoderManifestRequest) : Types::ImportDecoderManifestResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_DECODER_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportDecoderManifestResponse, "ImportDecoderManifest")
      end

      # Creates a signal catalog using your existing VSS formatted content from your local device.

      def import_signal_catalog(
        name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vss : Types::FormattedVss? = nil
      ) : Types::ImportSignalCatalogResponse

        input = Types::ImportSignalCatalogRequest.new(name: name, description: description, tags: tags, vss: vss)
        import_signal_catalog(input)
      end

      def import_signal_catalog(input : Types::ImportSignalCatalogRequest) : Types::ImportSignalCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_SIGNAL_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportSignalCatalogResponse, "ImportSignalCatalog")
      end

      # Lists information about created campaigns. This API operation uses pagination. Specify the nextToken
      # parameter in the request to return more results.

      def list_campaigns(
        list_response_scope : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListCampaignsResponse

        input = Types::ListCampaignsRequest.new(list_response_scope: list_response_scope, max_results: max_results, next_token: next_token, status: status)
        list_campaigns(input)
      end

      def list_campaigns(input : Types::ListCampaignsRequest) : Types::ListCampaignsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CAMPAIGNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCampaignsResponse, "ListCampaigns")
      end

      # Lists the network interfaces specified in a decoder manifest. This API operation uses pagination.
      # Specify the nextToken parameter in the request to return more results.

      def list_decoder_manifest_network_interfaces(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDecoderManifestNetworkInterfacesResponse

        input = Types::ListDecoderManifestNetworkInterfacesRequest.new(name: name, max_results: max_results, next_token: next_token)
        list_decoder_manifest_network_interfaces(input)
      end

      def list_decoder_manifest_network_interfaces(input : Types::ListDecoderManifestNetworkInterfacesRequest) : Types::ListDecoderManifestNetworkInterfacesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DECODER_MANIFEST_NETWORK_INTERFACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDecoderManifestNetworkInterfacesResponse, "ListDecoderManifestNetworkInterfaces")
      end

      # A list of information about signal decoders specified in a decoder manifest. This API operation uses
      # pagination. Specify the nextToken parameter in the request to return more results.

      def list_decoder_manifest_signals(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDecoderManifestSignalsResponse

        input = Types::ListDecoderManifestSignalsRequest.new(name: name, max_results: max_results, next_token: next_token)
        list_decoder_manifest_signals(input)
      end

      def list_decoder_manifest_signals(input : Types::ListDecoderManifestSignalsRequest) : Types::ListDecoderManifestSignalsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DECODER_MANIFEST_SIGNALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDecoderManifestSignalsResponse, "ListDecoderManifestSignals")
      end

      # Lists decoder manifests. This API operation uses pagination. Specify the nextToken parameter in the
      # request to return more results.

      def list_decoder_manifests(
        list_response_scope : String? = nil,
        max_results : Int32? = nil,
        model_manifest_arn : String? = nil,
        next_token : String? = nil
      ) : Types::ListDecoderManifestsResponse

        input = Types::ListDecoderManifestsRequest.new(list_response_scope: list_response_scope, max_results: max_results, model_manifest_arn: model_manifest_arn, next_token: next_token)
        list_decoder_manifests(input)
      end

      def list_decoder_manifests(input : Types::ListDecoderManifestsRequest) : Types::ListDecoderManifestsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DECODER_MANIFESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDecoderManifestsResponse, "ListDecoderManifests")
      end

      # Retrieves information for each created fleet in an Amazon Web Services account. This API operation
      # uses pagination. Specify the nextToken parameter in the request to return more results.

      def list_fleets(
        list_response_scope : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFleetsResponse

        input = Types::ListFleetsRequest.new(list_response_scope: list_response_scope, max_results: max_results, next_token: next_token)
        list_fleets(input)
      end

      def list_fleets(input : Types::ListFleetsRequest) : Types::ListFleetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFleetsResponse, "ListFleets")
      end

      # Retrieves a list of IDs for all fleets that the vehicle is associated with. This API operation uses
      # pagination. Specify the nextToken parameter in the request to return more results.

      def list_fleets_for_vehicle(
        vehicle_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFleetsForVehicleResponse

        input = Types::ListFleetsForVehicleRequest.new(vehicle_name: vehicle_name, max_results: max_results, next_token: next_token)
        list_fleets_for_vehicle(input)
      end

      def list_fleets_for_vehicle(input : Types::ListFleetsForVehicleRequest) : Types::ListFleetsForVehicleResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLEETS_FOR_VEHICLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFleetsForVehicleResponse, "ListFleetsForVehicle")
      end

      # Lists information about nodes specified in a vehicle model (model manifest). This API operation uses
      # pagination. Specify the nextToken parameter in the request to return more results.

      def list_model_manifest_nodes(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListModelManifestNodesResponse

        input = Types::ListModelManifestNodesRequest.new(name: name, max_results: max_results, next_token: next_token)
        list_model_manifest_nodes(input)
      end

      def list_model_manifest_nodes(input : Types::ListModelManifestNodesRequest) : Types::ListModelManifestNodesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_MANIFEST_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelManifestNodesResponse, "ListModelManifestNodes")
      end

      # Retrieves a list of vehicle models (model manifests). This API operation uses pagination. Specify
      # the nextToken parameter in the request to return more results.

      def list_model_manifests(
        list_response_scope : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        signal_catalog_arn : String? = nil
      ) : Types::ListModelManifestsResponse

        input = Types::ListModelManifestsRequest.new(list_response_scope: list_response_scope, max_results: max_results, next_token: next_token, signal_catalog_arn: signal_catalog_arn)
        list_model_manifests(input)
      end

      def list_model_manifests(input : Types::ListModelManifestsRequest) : Types::ListModelManifestsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_MANIFESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelManifestsResponse, "ListModelManifests")
      end

      # Lists of information about the signals (nodes) specified in a signal catalog. This API operation
      # uses pagination. Specify the nextToken parameter in the request to return more results.

      def list_signal_catalog_nodes(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        signal_node_type : String? = nil
      ) : Types::ListSignalCatalogNodesResponse

        input = Types::ListSignalCatalogNodesRequest.new(name: name, max_results: max_results, next_token: next_token, signal_node_type: signal_node_type)
        list_signal_catalog_nodes(input)
      end

      def list_signal_catalog_nodes(input : Types::ListSignalCatalogNodesRequest) : Types::ListSignalCatalogNodesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SIGNAL_CATALOG_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSignalCatalogNodesResponse, "ListSignalCatalogNodes")
      end

      # Lists all the created signal catalogs in an Amazon Web Services account. You can use to list
      # information about each signal (node) specified in a signal catalog. This API operation uses
      # pagination. Specify the nextToken parameter in the request to return more results.

      def list_signal_catalogs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSignalCatalogsResponse

        input = Types::ListSignalCatalogsRequest.new(max_results: max_results, next_token: next_token)
        list_signal_catalogs(input)
      end

      def list_signal_catalogs(input : Types::ListSignalCatalogsRequest) : Types::ListSignalCatalogsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SIGNAL_CATALOGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSignalCatalogsResponse, "ListSignalCatalogs")
      end

      # Lists information about created state templates. Access to certain Amazon Web Services IoT FleetWise
      # features is currently gated. For more information, see Amazon Web Services Region and feature
      # availability in the Amazon Web Services IoT FleetWise Developer Guide .

      def list_state_templates(
        list_response_scope : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStateTemplatesResponse

        input = Types::ListStateTemplatesRequest.new(list_response_scope: list_response_scope, max_results: max_results, next_token: next_token)
        list_state_templates(input)
      end

      def list_state_templates(input : Types::ListStateTemplatesRequest) : Types::ListStateTemplatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_STATE_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStateTemplatesResponse, "ListStateTemplates")
      end

      # Lists the tags (metadata) you have assigned to the resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Retrieves a list of summaries of created vehicles. This API operation uses pagination. Specify the
      # nextToken parameter in the request to return more results.

      def list_vehicles(
        attribute_names : Array(String)? = nil,
        attribute_values : Array(String)? = nil,
        list_response_scope : String? = nil,
        max_results : Int32? = nil,
        model_manifest_arn : String? = nil,
        next_token : String? = nil
      ) : Types::ListVehiclesResponse

        input = Types::ListVehiclesRequest.new(attribute_names: attribute_names, attribute_values: attribute_values, list_response_scope: list_response_scope, max_results: max_results, model_manifest_arn: model_manifest_arn, next_token: next_token)
        list_vehicles(input)
      end

      def list_vehicles(input : Types::ListVehiclesRequest) : Types::ListVehiclesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VEHICLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVehiclesResponse, "ListVehicles")
      end

      # Retrieves a list of summaries of all vehicles associated with a fleet. This API operation uses
      # pagination. Specify the nextToken parameter in the request to return more results.

      def list_vehicles_in_fleet(
        fleet_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListVehiclesInFleetResponse

        input = Types::ListVehiclesInFleetRequest.new(fleet_id: fleet_id, max_results: max_results, next_token: next_token)
        list_vehicles_in_fleet(input)
      end

      def list_vehicles_in_fleet(input : Types::ListVehiclesInFleetRequest) : Types::ListVehiclesInFleetResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VEHICLES_IN_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVehiclesInFleetResponse, "ListVehiclesInFleet")
      end

      # Creates or updates the encryption configuration. Amazon Web Services IoT FleetWise can encrypt your
      # data and resources using an Amazon Web Services managed key. Or, you can use a KMS key that you own
      # and manage. For more information, see Data encryption in the Amazon Web Services IoT FleetWise
      # Developer Guide .

      def put_encryption_configuration(
        encryption_type : String,
        kms_key_id : String? = nil
      ) : Types::PutEncryptionConfigurationResponse

        input = Types::PutEncryptionConfigurationRequest.new(encryption_type: encryption_type, kms_key_id: kms_key_id)
        put_encryption_configuration(input)
      end

      def put_encryption_configuration(input : Types::PutEncryptionConfigurationRequest) : Types::PutEncryptionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ENCRYPTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEncryptionConfigurationResponse, "PutEncryptionConfiguration")
      end

      # Creates or updates the logging option.

      def put_logging_options(
        cloud_watch_log_delivery : Types::CloudWatchLogDeliveryOptions
      ) : Types::PutLoggingOptionsResponse

        input = Types::PutLoggingOptionsRequest.new(cloud_watch_log_delivery: cloud_watch_log_delivery)
        put_logging_options(input)
      end

      def put_logging_options(input : Types::PutLoggingOptionsRequest) : Types::PutLoggingOptionsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_LOGGING_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutLoggingOptionsResponse, "PutLoggingOptions")
      end

      # This API operation contains deprecated parameters. Register your account again without the
      # Timestream resources parameter so that Amazon Web Services IoT FleetWise can remove the Timestream
      # metadata stored. You should then pass the data destination into the CreateCampaign API operation.
      # You must delete any existing campaigns that include an empty data destination before you register
      # your account again. For more information, see the DeleteCampaign API operation. If you want to
      # delete the Timestream inline policy from the service-linked role, such as to mitigate an overly
      # permissive policy, you must first delete any existing campaigns. Then delete the service-linked role
      # and register your account again to enable CloudWatch metrics. For more information, see
      # DeleteServiceLinkedRole in the Identity and Access Management API Reference . Registers your Amazon
      # Web Services account, IAM, and Amazon Timestream resources so Amazon Web Services IoT FleetWise can
      # transfer your vehicle data to the Amazon Web Services Cloud. For more information, including
      # step-by-step procedures, see Setting up Amazon Web Services IoT FleetWise . An Amazon Web Services
      # account is not the same thing as a "user." An Amazon Web Services user is an identity that you
      # create using Identity and Access Management (IAM) and takes the form of either an IAM user or an IAM
      # role, both with credentials . A single Amazon Web Services account can, and typically does, contain
      # many users and roles.

      def register_account(
        iam_resources : Types::IamResources? = nil,
        timestream_resources : Types::TimestreamResources? = nil
      ) : Types::RegisterAccountResponse

        input = Types::RegisterAccountRequest.new(iam_resources: iam_resources, timestream_resources: timestream_resources)
        register_account(input)
      end

      def register_account(input : Types::RegisterAccountRequest) : Types::RegisterAccountResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterAccountResponse, "RegisterAccount")
      end

      # Adds to or modifies the tags of the given resource. Tags are metadata which can be used to manage a
      # resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes the given tags (metadata) from the resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates a campaign.

      def update_campaign(
        action : String,
        name : String,
        data_extra_dimensions : Array(String)? = nil,
        description : String? = nil
      ) : Types::UpdateCampaignResponse

        input = Types::UpdateCampaignRequest.new(action: action, name: name, data_extra_dimensions: data_extra_dimensions, description: description)
        update_campaign(input)
      end

      def update_campaign(input : Types::UpdateCampaignRequest) : Types::UpdateCampaignResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CAMPAIGN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCampaignResponse, "UpdateCampaign")
      end

      # Updates a decoder manifest. A decoder manifest can only be updated when the status is DRAFT . Only
      # ACTIVE decoder manifests can be associated with vehicles.

      def update_decoder_manifest(
        name : String,
        default_for_unmapped_signals : String? = nil,
        description : String? = nil,
        network_interfaces_to_add : Array(Types::NetworkInterface)? = nil,
        network_interfaces_to_remove : Array(String)? = nil,
        network_interfaces_to_update : Array(Types::NetworkInterface)? = nil,
        signal_decoders_to_add : Array(Types::SignalDecoder)? = nil,
        signal_decoders_to_remove : Array(String)? = nil,
        signal_decoders_to_update : Array(Types::SignalDecoder)? = nil,
        status : String? = nil
      ) : Types::UpdateDecoderManifestResponse

        input = Types::UpdateDecoderManifestRequest.new(name: name, default_for_unmapped_signals: default_for_unmapped_signals, description: description, network_interfaces_to_add: network_interfaces_to_add, network_interfaces_to_remove: network_interfaces_to_remove, network_interfaces_to_update: network_interfaces_to_update, signal_decoders_to_add: signal_decoders_to_add, signal_decoders_to_remove: signal_decoders_to_remove, signal_decoders_to_update: signal_decoders_to_update, status: status)
        update_decoder_manifest(input)
      end

      def update_decoder_manifest(input : Types::UpdateDecoderManifestRequest) : Types::UpdateDecoderManifestResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DECODER_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDecoderManifestResponse, "UpdateDecoderManifest")
      end

      # Updates the description of an existing fleet.

      def update_fleet(
        fleet_id : String,
        description : String? = nil
      ) : Types::UpdateFleetResponse

        input = Types::UpdateFleetRequest.new(fleet_id: fleet_id, description: description)
        update_fleet(input)
      end

      def update_fleet(input : Types::UpdateFleetRequest) : Types::UpdateFleetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFleetResponse, "UpdateFleet")
      end

      # Updates a vehicle model (model manifest). If created vehicles are associated with a vehicle model,
      # it can't be updated.

      def update_model_manifest(
        name : String,
        description : String? = nil,
        nodes_to_add : Array(String)? = nil,
        nodes_to_remove : Array(String)? = nil,
        status : String? = nil
      ) : Types::UpdateModelManifestResponse

        input = Types::UpdateModelManifestRequest.new(name: name, description: description, nodes_to_add: nodes_to_add, nodes_to_remove: nodes_to_remove, status: status)
        update_model_manifest(input)
      end

      def update_model_manifest(input : Types::UpdateModelManifestRequest) : Types::UpdateModelManifestResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MODEL_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateModelManifestResponse, "UpdateModelManifest")
      end

      # Updates a signal catalog.

      def update_signal_catalog(
        name : String,
        description : String? = nil,
        nodes_to_add : Array(Types::Node)? = nil,
        nodes_to_remove : Array(String)? = nil,
        nodes_to_update : Array(Types::Node)? = nil
      ) : Types::UpdateSignalCatalogResponse

        input = Types::UpdateSignalCatalogRequest.new(name: name, description: description, nodes_to_add: nodes_to_add, nodes_to_remove: nodes_to_remove, nodes_to_update: nodes_to_update)
        update_signal_catalog(input)
      end

      def update_signal_catalog(input : Types::UpdateSignalCatalogRequest) : Types::UpdateSignalCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SIGNAL_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSignalCatalogResponse, "UpdateSignalCatalog")
      end

      # Updates a state template. Access to certain Amazon Web Services IoT FleetWise features is currently
      # gated. For more information, see Amazon Web Services Region and feature availability in the Amazon
      # Web Services IoT FleetWise Developer Guide .

      def update_state_template(
        identifier : String,
        data_extra_dimensions : Array(String)? = nil,
        description : String? = nil,
        metadata_extra_dimensions : Array(String)? = nil,
        state_template_properties_to_add : Array(String)? = nil,
        state_template_properties_to_remove : Array(String)? = nil
      ) : Types::UpdateStateTemplateResponse

        input = Types::UpdateStateTemplateRequest.new(identifier: identifier, data_extra_dimensions: data_extra_dimensions, description: description, metadata_extra_dimensions: metadata_extra_dimensions, state_template_properties_to_add: state_template_properties_to_add, state_template_properties_to_remove: state_template_properties_to_remove)
        update_state_template(input)
      end

      def update_state_template(input : Types::UpdateStateTemplateRequest) : Types::UpdateStateTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STATE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateStateTemplateResponse, "UpdateStateTemplate")
      end

      # Updates a vehicle. Access to certain Amazon Web Services IoT FleetWise features is currently gated.
      # For more information, see Amazon Web Services Region and feature availability in the Amazon Web
      # Services IoT FleetWise Developer Guide .

      def update_vehicle(
        vehicle_name : String,
        attribute_update_mode : String? = nil,
        attributes : Hash(String, String)? = nil,
        decoder_manifest_arn : String? = nil,
        model_manifest_arn : String? = nil,
        state_templates_to_add : Array(Types::StateTemplateAssociation)? = nil,
        state_templates_to_remove : Array(String)? = nil,
        state_templates_to_update : Array(Types::StateTemplateAssociation)? = nil
      ) : Types::UpdateVehicleResponse

        input = Types::UpdateVehicleRequest.new(vehicle_name: vehicle_name, attribute_update_mode: attribute_update_mode, attributes: attributes, decoder_manifest_arn: decoder_manifest_arn, model_manifest_arn: model_manifest_arn, state_templates_to_add: state_templates_to_add, state_templates_to_remove: state_templates_to_remove, state_templates_to_update: state_templates_to_update)
        update_vehicle(input)
      end

      def update_vehicle(input : Types::UpdateVehicleRequest) : Types::UpdateVehicleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VEHICLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVehicleResponse, "UpdateVehicle")
      end
    end
  end
end
