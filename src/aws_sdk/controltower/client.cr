module AwsSdk
  module ControlTower
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

      # Creates a new landing zone. This API call starts an asynchronous operation that creates and
      # configures a landing zone, based on the parameters specified in the manifest JSON file.

      def create_landing_zone(
        version : String,
        manifest : Types::Manifest? = nil,
        remediation_types : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLandingZoneInput.new(version: version, manifest: manifest, remediation_types: remediation_types, tags: tags)
        create_landing_zone(input)
      end

      def create_landing_zone(input : Types::CreateLandingZoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LANDING_ZONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Decommissions a landing zone. This API call starts an asynchronous operation that deletes Amazon Web
      # Services Control Tower resources deployed in accounts managed by Amazon Web Services Control Tower.
      # Decommissioning a landing zone is a process with significant consequences, and it cannot be undone.
      # We strongly recommend that you perform this decommissioning process only if you intend to stop using
      # your landing zone.

      def delete_landing_zone(
        landing_zone_identifier : String
      ) : Protocol::Request
        input = Types::DeleteLandingZoneInput.new(landing_zone_identifier: landing_zone_identifier)
        delete_landing_zone(input)
      end

      def delete_landing_zone(input : Types::DeleteLandingZoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LANDING_ZONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disable an EnabledBaseline resource on the specified Target. This API starts an asynchronous
      # operation to remove all resources deployed as part of the baseline enablement. The resource will
      # vary depending on the enabled baseline. For usage examples, see the Amazon Web Services Control
      # Tower User Guide .

      def disable_baseline(
        enabled_baseline_identifier : String
      ) : Protocol::Request
        input = Types::DisableBaselineInput.new(enabled_baseline_identifier: enabled_baseline_identifier)
        disable_baseline(input)
      end

      def disable_baseline(input : Types::DisableBaselineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_BASELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API call turns off a control. It starts an asynchronous operation that deletes Amazon Web
      # Services resources on the specified organizational unit and the accounts it contains. The resources
      # will vary according to the control that you specify. For usage examples, see the Controls Reference
      # Guide .

      def disable_control(
        control_identifier : String? = nil,
        enabled_control_identifier : String? = nil,
        target_identifier : String? = nil
      ) : Protocol::Request
        input = Types::DisableControlInput.new(control_identifier: control_identifier, enabled_control_identifier: enabled_control_identifier, target_identifier: target_identifier)
        disable_control(input)
      end

      def disable_control(input : Types::DisableControlInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable (apply) a Baseline to a Target. This API starts an asynchronous operation to deploy resources
      # specified by the Baseline to the specified Target. For usage examples, see the Amazon Web Services
      # Control Tower User Guide .

      def enable_baseline(
        baseline_identifier : String,
        baseline_version : String,
        target_identifier : String,
        parameters : Array(Types::EnabledBaselineParameter)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::EnableBaselineInput.new(baseline_identifier: baseline_identifier, baseline_version: baseline_version, target_identifier: target_identifier, parameters: parameters, tags: tags)
        enable_baseline(input)
      end

      def enable_baseline(input : Types::EnableBaselineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_BASELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API call activates a control. It starts an asynchronous operation that creates Amazon Web
      # Services resources on the specified organizational unit and the accounts it contains. The resources
      # created will vary according to the control that you specify. For usage examples, see the Controls
      # Reference Guide .

      def enable_control(
        control_identifier : String,
        target_identifier : String,
        parameters : Array(Types::EnabledControlParameter)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::EnableControlInput.new(control_identifier: control_identifier, target_identifier: target_identifier, parameters: parameters, tags: tags)
        enable_control(input)
      end

      def enable_control(input : Types::EnableControlInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve details about an existing Baseline resource by specifying its identifier. For usage
      # examples, see the Amazon Web Services Control Tower User Guide .

      def get_baseline(
        baseline_identifier : String
      ) : Protocol::Request
        input = Types::GetBaselineInput.new(baseline_identifier: baseline_identifier)
        get_baseline(input)
      end

      def get_baseline(input : Types::GetBaselineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BASELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details of an asynchronous baseline operation, as initiated by any of these APIs:
      # EnableBaseline , DisableBaseline , UpdateEnabledBaseline , ResetEnabledBaseline . A status message
      # is displayed in case of operation failure. For usage examples, see the Amazon Web Services Control
      # Tower User Guide .

      def get_baseline_operation(
        operation_identifier : String
      ) : Protocol::Request
        input = Types::GetBaselineOperationInput.new(operation_identifier: operation_identifier)
        get_baseline_operation(input)
      end

      def get_baseline_operation(input : Types::GetBaselineOperationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BASELINE_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of a particular EnableControl or DisableControl operation. Displays a message in
      # case of error. Details for an operation are available for 90 days. For usage examples, see the
      # Controls Reference Guide .

      def get_control_operation(
        operation_identifier : String
      ) : Protocol::Request
        input = Types::GetControlOperationInput.new(operation_identifier: operation_identifier)
        get_control_operation(input)
      end

      def get_control_operation(input : Types::GetControlOperationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTROL_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve details of an EnabledBaseline resource by specifying its identifier.

      def get_enabled_baseline(
        enabled_baseline_identifier : String
      ) : Protocol::Request
        input = Types::GetEnabledBaselineInput.new(enabled_baseline_identifier: enabled_baseline_identifier)
        get_enabled_baseline(input)
      end

      def get_enabled_baseline(input : Types::GetEnabledBaselineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENABLED_BASELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about an enabled control. For usage examples, see the Controls Reference Guide .

      def get_enabled_control(
        enabled_control_identifier : String
      ) : Protocol::Request
        input = Types::GetEnabledControlInput.new(enabled_control_identifier: enabled_control_identifier)
        get_enabled_control(input)
      end

      def get_enabled_control(input : Types::GetEnabledControlInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENABLED_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about the landing zone. Displays a message in case of error.

      def get_landing_zone(
        landing_zone_identifier : String
      ) : Protocol::Request
        input = Types::GetLandingZoneInput.new(landing_zone_identifier: landing_zone_identifier)
        get_landing_zone(input)
      end

      def get_landing_zone(input : Types::GetLandingZoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LANDING_ZONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of the specified landing zone operation. Details for an operation are available
      # for 90 days.

      def get_landing_zone_operation(
        operation_identifier : String
      ) : Protocol::Request
        input = Types::GetLandingZoneOperationInput.new(operation_identifier: operation_identifier)
        get_landing_zone_operation(input)
      end

      def get_landing_zone_operation(input : Types::GetLandingZoneOperationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LANDING_ZONE_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a summary list of all available baselines. For usage examples, see the Amazon Web Services
      # Control Tower User Guide .

      def list_baselines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBaselinesInput.new(max_results: max_results, next_token: next_token)
        list_baselines(input)
      end

      def list_baselines(input : Types::ListBaselinesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BASELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a list of operations in progress or queued. For usage examples, see ListControlOperation
      # examples .

      def list_control_operations(
        filter : Types::ControlOperationFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlOperationsInput.new(filter: filter, max_results: max_results, next_token: next_token)
        list_control_operations(input)
      end

      def list_control_operations(input : Types::ListControlOperationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROL_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of summaries describing EnabledBaseline resources. You can filter the list by the
      # corresponding Baseline or Target of the EnabledBaseline resources. For usage examples, see the
      # Amazon Web Services Control Tower User Guide .

      def list_enabled_baselines(
        filter : Types::EnabledBaselineFilter? = nil,
        include_children : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnabledBaselinesInput.new(filter: filter, include_children: include_children, max_results: max_results, next_token: next_token)
        list_enabled_baselines(input)
      end

      def list_enabled_baselines(input : Types::ListEnabledBaselinesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENABLED_BASELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the controls enabled by Amazon Web Services Control Tower on the specified organizational unit
      # and the accounts it contains. For usage examples, see the Controls Reference Guide .

      def list_enabled_controls(
        filter : Types::EnabledControlFilter? = nil,
        include_children : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        target_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListEnabledControlsInput.new(filter: filter, include_children: include_children, max_results: max_results, next_token: next_token, target_identifier: target_identifier)
        list_enabled_controls(input)
      end

      def list_enabled_controls(input : Types::ListEnabledControlsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENABLED_CONTROLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all landing zone operations from the past 90 days. Results are sorted by time, with the most
      # recent operation first.

      def list_landing_zone_operations(
        filter : Types::LandingZoneOperationFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLandingZoneOperationsInput.new(filter: filter, max_results: max_results, next_token: next_token)
        list_landing_zone_operations(input)
      end

      def list_landing_zone_operations(input : Types::ListLandingZoneOperationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LANDING_ZONE_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the landing zone ARN for the landing zone deployed in your managed account. This API also
      # creates an ARN for existing accounts that do not yet have a landing zone ARN. Returns one landing
      # zone ARN.

      def list_landing_zones(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLandingZonesInput.new(max_results: max_results, next_token: next_token)
        list_landing_zones(input)
      end

      def list_landing_zones(input : Types::ListLandingZonesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LANDING_ZONES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags associated with the resource. For usage examples, see the Controls Reference
      # Guide .

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

      # Re-enables an EnabledBaseline resource. For example, this API can re-apply the existing Baseline
      # after a new member account is moved to the target OU. For usage examples, see the Amazon Web
      # Services Control Tower User Guide .

      def reset_enabled_baseline(
        enabled_baseline_identifier : String
      ) : Protocol::Request
        input = Types::ResetEnabledBaselineInput.new(enabled_baseline_identifier: enabled_baseline_identifier)
        reset_enabled_baseline(input)
      end

      def reset_enabled_baseline(input : Types::ResetEnabledBaselineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_ENABLED_BASELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets an enabled control. Does not work for controls implemented with SCPs.

      def reset_enabled_control(
        enabled_control_identifier : String
      ) : Protocol::Request
        input = Types::ResetEnabledControlInput.new(enabled_control_identifier: enabled_control_identifier)
        reset_enabled_control(input)
      end

      def reset_enabled_control(input : Types::ResetEnabledControlInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_ENABLED_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API call resets a landing zone. It starts an asynchronous operation that resets the landing
      # zone to the parameters specified in the original configuration, which you specified in the manifest
      # file. Nothing in the manifest file's original landing zone configuration is changed during the reset
      # process, by default. This API is not the same as a rollback of a landing zone version, which is not
      # a supported operation.

      def reset_landing_zone(
        landing_zone_identifier : String
      ) : Protocol::Request
        input = Types::ResetLandingZoneInput.new(landing_zone_identifier: landing_zone_identifier)
        reset_landing_zone(input)
      end

      def reset_landing_zone(input : Types::ResetLandingZoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_LANDING_ZONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies tags to a resource. For usage examples, see the Controls Reference Guide .

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

      # Removes tags from a resource. For usage examples, see the Controls Reference Guide .

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

      # Updates an EnabledBaseline resource's applied parameters or version. For usage examples, see the
      # Amazon Web Services Control Tower User Guide .

      def update_enabled_baseline(
        baseline_version : String,
        enabled_baseline_identifier : String,
        parameters : Array(Types::EnabledBaselineParameter)? = nil
      ) : Protocol::Request
        input = Types::UpdateEnabledBaselineInput.new(baseline_version: baseline_version, enabled_baseline_identifier: enabled_baseline_identifier, parameters: parameters)
        update_enabled_baseline(input)
      end

      def update_enabled_baseline(input : Types::UpdateEnabledBaselineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENABLED_BASELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an already enabled control. If the enabled control shows an
      # EnablementStatus of SUCCEEDED, supply parameters that are different from the currently configured
      # parameters. Otherwise, Amazon Web Services Control Tower will not accept the request. If the enabled
      # control shows an EnablementStatus of FAILED, Amazon Web Services Control Tower updates the control
      # to match any valid parameters that you supply. If the DriftSummary status for the control shows as
      # DRIFTED , you cannot call this API. Instead, you can update the control by calling the
      # ResetEnabledControl API. Alternatively, you can call DisableControl and then call EnableControl
      # again. Also, you can run an extending governance operation to repair drift. For usage examples, see
      # the Controls Reference Guide .

      def update_enabled_control(
        enabled_control_identifier : String,
        parameters : Array(Types::EnabledControlParameter)
      ) : Protocol::Request
        input = Types::UpdateEnabledControlInput.new(enabled_control_identifier: enabled_control_identifier, parameters: parameters)
        update_enabled_control(input)
      end

      def update_enabled_control(input : Types::UpdateEnabledControlInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENABLED_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API call updates the landing zone. It starts an asynchronous operation that updates the landing
      # zone based on the new landing zone version, or on the changed parameters specified in the updated
      # manifest file.

      def update_landing_zone(
        landing_zone_identifier : String,
        version : String,
        manifest : Types::Manifest? = nil,
        remediation_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateLandingZoneInput.new(landing_zone_identifier: landing_zone_identifier, version: version, manifest: manifest, remediation_types: remediation_types)
        update_landing_zone(input)
      end

      def update_landing_zone(input : Types::UpdateLandingZoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LANDING_ZONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
