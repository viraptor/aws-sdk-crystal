module AwsSdk
  module WorkSpacesThinClient
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

      # Creates an environment for your thin client devices.

      def create_environment(
        desktop_arn : String,
        client_token : String? = nil,
        desired_software_set_id : String? = nil,
        desktop_endpoint : String? = nil,
        device_creation_tags : Hash(String, String)? = nil,
        kms_key_arn : String? = nil,
        maintenance_window : Types::MaintenanceWindow? = nil,
        name : String? = nil,
        software_set_update_mode : String? = nil,
        software_set_update_schedule : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentRequest.new(desktop_arn: desktop_arn, client_token: client_token, desired_software_set_id: desired_software_set_id, desktop_endpoint: desktop_endpoint, device_creation_tags: device_creation_tags, kms_key_arn: kms_key_arn, maintenance_window: maintenance_window, name: name, software_set_update_mode: software_set_update_mode, software_set_update_schedule: software_set_update_schedule, tags: tags)
        create_environment(input)
      end

      def create_environment(input : Types::CreateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a thin client device.

      def delete_device(
        id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDeviceRequest.new(id: id, client_token: client_token)
        delete_device(input)
      end

      def delete_device(input : Types::DeleteDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an environment.

      def delete_environment(
        id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteEnvironmentRequest.new(id: id, client_token: client_token)
        delete_environment(input)
      end

      def delete_environment(input : Types::DeleteEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters a thin client device.

      def deregister_device(
        id : String,
        client_token : String? = nil,
        target_device_status : String? = nil
      ) : Protocol::Request
        input = Types::DeregisterDeviceRequest.new(id: id, client_token: client_token, target_device_status: target_device_status)
        deregister_device(input)
      end

      def deregister_device(input : Types::DeregisterDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information for a thin client device.

      def get_device(
        id : String
      ) : Protocol::Request
        input = Types::GetDeviceRequest.new(id: id)
        get_device(input)
      end

      def get_device(input : Types::GetDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information for an environment.

      def get_environment(
        id : String
      ) : Protocol::Request
        input = Types::GetEnvironmentRequest.new(id: id)
        get_environment(input)
      end

      def get_environment(input : Types::GetEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information for a software set.

      def get_software_set(
        id : String
      ) : Protocol::Request
        input = Types::GetSoftwareSetRequest.new(id: id)
        get_software_set(input)
      end

      def get_software_set(input : Types::GetSoftwareSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOFTWARE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of thin client devices.

      def list_devices(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDevicesRequest.new(max_results: max_results, next_token: next_token)
        list_devices(input)
      end

      def list_devices(input : Types::ListDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of environments.

      def list_environments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentsRequest.new(max_results: max_results, next_token: next_token)
        list_environments(input)
      end

      def list_environments(input : Types::ListEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of software sets.

      def list_software_sets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSoftwareSetsRequest.new(max_results: max_results, next_token: next_token)
        list_software_sets(input)
      end

      def list_software_sets(input : Types::ListSoftwareSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOFTWARE_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for a resource.

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

      # Assigns one or more tags (key-value pairs) to the specified resource.

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

      # Removes a tag or tags from a resource.

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

      # Updates a thin client device.

      def update_device(
        id : String,
        desired_software_set_id : String? = nil,
        name : String? = nil,
        software_set_update_schedule : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeviceRequest.new(id: id, desired_software_set_id: desired_software_set_id, name: name, software_set_update_schedule: software_set_update_schedule)
        update_device(input)
      end

      def update_device(input : Types::UpdateDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an environment.

      def update_environment(
        id : String,
        desired_software_set_id : String? = nil,
        desktop_arn : String? = nil,
        desktop_endpoint : String? = nil,
        device_creation_tags : Hash(String, String)? = nil,
        maintenance_window : Types::MaintenanceWindow? = nil,
        name : String? = nil,
        software_set_update_mode : String? = nil,
        software_set_update_schedule : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentRequest.new(id: id, desired_software_set_id: desired_software_set_id, desktop_arn: desktop_arn, desktop_endpoint: desktop_endpoint, device_creation_tags: device_creation_tags, maintenance_window: maintenance_window, name: name, software_set_update_mode: software_set_update_mode, software_set_update_schedule: software_set_update_schedule)
        update_environment(input)
      end

      def update_environment(input : Types::UpdateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a software set.

      def update_software_set(
        id : String,
        validation_status : String
      ) : Protocol::Request
        input = Types::UpdateSoftwareSetRequest.new(id: id, validation_status: validation_status)
        update_software_set(input)
      end

      def update_software_set(input : Types::UpdateSoftwareSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOFTWARE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
