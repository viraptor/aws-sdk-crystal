module AwsSdk
  module WorkspacesInstances
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

      # Attaches a volume to a WorkSpace Instance.

      def associate_volume(
        device : String,
        volume_id : String,
        workspace_instance_id : String
      ) : Types::AssociateVolumeResponse

        input = Types::AssociateVolumeRequest.new(device: device, volume_id: volume_id, workspace_instance_id: workspace_instance_id)
        associate_volume(input)
      end

      def associate_volume(input : Types::AssociateVolumeRequest) : Types::AssociateVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateVolumeResponse, "AssociateVolume")
      end

      # Creates a new volume for WorkSpace Instances.

      def create_volume(
        availability_zone : String,
        client_token : String? = nil,
        encrypted : Bool? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        size_in_gb : Int32? = nil,
        snapshot_id : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        throughput : Int32? = nil,
        volume_type : String? = nil
      ) : Types::CreateVolumeResponse

        input = Types::CreateVolumeRequest.new(availability_zone: availability_zone, client_token: client_token, encrypted: encrypted, iops: iops, kms_key_id: kms_key_id, size_in_gb: size_in_gb, snapshot_id: snapshot_id, tag_specifications: tag_specifications, throughput: throughput, volume_type: volume_type)
        create_volume(input)
      end

      def create_volume(input : Types::CreateVolumeRequest) : Types::CreateVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVolumeResponse, "CreateVolume")
      end

      # Launches a new WorkSpace Instance with specified configuration parameters, enabling programmatic
      # workspace deployment.

      def create_workspace_instance(
        managed_instance : Types::ManagedInstanceRequest,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateWorkspaceInstanceResponse

        input = Types::CreateWorkspaceInstanceRequest.new(managed_instance: managed_instance, client_token: client_token, tags: tags)
        create_workspace_instance(input)
      end

      def create_workspace_instance(input : Types::CreateWorkspaceInstanceRequest) : Types::CreateWorkspaceInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKSPACE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkspaceInstanceResponse, "CreateWorkspaceInstance")
      end

      # Deletes a specified volume.

      def delete_volume(
        volume_id : String
      ) : Types::DeleteVolumeResponse

        input = Types::DeleteVolumeRequest.new(volume_id: volume_id)
        delete_volume(input)
      end

      def delete_volume(input : Types::DeleteVolumeRequest) : Types::DeleteVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVolumeResponse, "DeleteVolume")
      end

      # Deletes the specified WorkSpace

      def delete_workspace_instance(
        workspace_instance_id : String
      ) : Types::DeleteWorkspaceInstanceResponse

        input = Types::DeleteWorkspaceInstanceRequest.new(workspace_instance_id: workspace_instance_id)
        delete_workspace_instance(input)
      end

      def delete_workspace_instance(input : Types::DeleteWorkspaceInstanceRequest) : Types::DeleteWorkspaceInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKSPACE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkspaceInstanceResponse, "DeleteWorkspaceInstance")
      end

      # Detaches a volume from a WorkSpace Instance.

      def disassociate_volume(
        volume_id : String,
        workspace_instance_id : String,
        device : String? = nil,
        disassociate_mode : String? = nil
      ) : Types::DisassociateVolumeResponse

        input = Types::DisassociateVolumeRequest.new(volume_id: volume_id, workspace_instance_id: workspace_instance_id, device: device, disassociate_mode: disassociate_mode)
        disassociate_volume(input)
      end

      def disassociate_volume(input : Types::DisassociateVolumeRequest) : Types::DisassociateVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateVolumeResponse, "DisassociateVolume")
      end

      # Retrieves detailed information about a specific WorkSpace Instance.

      def get_workspace_instance(
        workspace_instance_id : String
      ) : Types::GetWorkspaceInstanceResponse

        input = Types::GetWorkspaceInstanceRequest.new(workspace_instance_id: workspace_instance_id)
        get_workspace_instance(input)
      end

      def get_workspace_instance(input : Types::GetWorkspaceInstanceRequest) : Types::GetWorkspaceInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKSPACE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkspaceInstanceResponse, "GetWorkspaceInstance")
      end

      # Retrieves a list of instance types supported by Amazon WorkSpaces Instances, enabling precise
      # workspace infrastructure configuration.

      def list_instance_types(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInstanceTypesResponse

        input = Types::ListInstanceTypesRequest.new(max_results: max_results, next_token: next_token)
        list_instance_types(input)
      end

      def list_instance_types(input : Types::ListInstanceTypesRequest) : Types::ListInstanceTypesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INSTANCE_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInstanceTypesResponse, "ListInstanceTypes")
      end

      # Retrieves a list of AWS regions supported by Amazon WorkSpaces Instances, enabling region discovery
      # for workspace deployments.

      def list_regions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRegionsResponse

        input = Types::ListRegionsRequest.new(max_results: max_results, next_token: next_token)
        list_regions(input)
      end

      def list_regions(input : Types::ListRegionsRequest) : Types::ListRegionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRegionsResponse, "ListRegions")
      end

      # Retrieves tags for a WorkSpace Instance.

      def list_tags_for_resource(
        workspace_instance_id : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(workspace_instance_id: workspace_instance_id)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Retrieves a collection of WorkSpaces Instances based on specified filters.

      def list_workspace_instances(
        max_results : Int32? = nil,
        next_token : String? = nil,
        provision_states : Array(String)? = nil
      ) : Types::ListWorkspaceInstancesResponse

        input = Types::ListWorkspaceInstancesRequest.new(max_results: max_results, next_token: next_token, provision_states: provision_states)
        list_workspace_instances(input)
      end

      def list_workspace_instances(input : Types::ListWorkspaceInstancesRequest) : Types::ListWorkspaceInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKSPACE_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkspaceInstancesResponse, "ListWorkspaceInstances")
      end

      # Adds tags to a WorkSpace Instance.

      def tag_resource(
        tags : Array(Types::Tag),
        workspace_instance_id : String
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(tags: tags, workspace_instance_id: workspace_instance_id)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes tags from a WorkSpace Instance.

      def untag_resource(
        tag_keys : Array(String),
        workspace_instance_id : String
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(tag_keys: tag_keys, workspace_instance_id: workspace_instance_id)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end
    end
  end
end
