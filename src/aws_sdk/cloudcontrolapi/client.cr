module AwsSdk
  module CloudControl
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

      # Cancels the specified resource operation request. For more information, see Canceling resource
      # operation requests in the Amazon Web Services Cloud Control API User Guide . Only resource
      # operations requests with a status of PENDING or IN_PROGRESS can be canceled.
      def cancel_resource_request(
        request_token : String
      ) : Types::CancelResourceRequestOutput
        input = Types::CancelResourceRequestInput.new(request_token: request_token)
        cancel_resource_request(input)
      end
      def cancel_resource_request(input : Types::CancelResourceRequestInput) : Types::CancelResourceRequestOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_RESOURCE_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelResourceRequestOutput, "CancelResourceRequest")
      end

      # Creates the specified resource. For more information, see Creating a resource in the Amazon Web
      # Services Cloud Control API User Guide . After you have initiated a resource creation request, you
      # can monitor the progress of your request by calling GetResourceRequestStatus using the RequestToken
      # of the ProgressEvent type returned by CreateResource .
      def create_resource(
        desired_state : String,
        type_name : String,
        client_token : String? = nil,
        role_arn : String? = nil,
        type_version_id : String? = nil
      ) : Types::CreateResourceOutput
        input = Types::CreateResourceInput.new(desired_state: desired_state, type_name: type_name, client_token: client_token, role_arn: role_arn, type_version_id: type_version_id)
        create_resource(input)
      end
      def create_resource(input : Types::CreateResourceInput) : Types::CreateResourceOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResourceOutput, "CreateResource")
      end

      # Deletes the specified resource. For details, see Deleting a resource in the Amazon Web Services
      # Cloud Control API User Guide . After you have initiated a resource deletion request, you can monitor
      # the progress of your request by calling GetResourceRequestStatus using the RequestToken of the
      # ProgressEvent returned by DeleteResource .
      def delete_resource(
        identifier : String,
        type_name : String,
        client_token : String? = nil,
        role_arn : String? = nil,
        type_version_id : String? = nil
      ) : Types::DeleteResourceOutput
        input = Types::DeleteResourceInput.new(identifier: identifier, type_name: type_name, client_token: client_token, role_arn: role_arn, type_version_id: type_version_id)
        delete_resource(input)
      end
      def delete_resource(input : Types::DeleteResourceInput) : Types::DeleteResourceOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourceOutput, "DeleteResource")
      end

      # Returns information about the current state of the specified resource. For details, see Reading a
      # resource's current state . You can use this action to return information about an existing resource
      # in your account and Amazon Web Services Region, whether those resources were provisioned using Cloud
      # Control API.
      def get_resource(
        identifier : String,
        type_name : String,
        role_arn : String? = nil,
        type_version_id : String? = nil
      ) : Types::GetResourceOutput
        input = Types::GetResourceInput.new(identifier: identifier, type_name: type_name, role_arn: role_arn, type_version_id: type_version_id)
        get_resource(input)
      end
      def get_resource(input : Types::GetResourceInput) : Types::GetResourceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceOutput, "GetResource")
      end

      # Returns the current status of a resource operation request. For more information, see Tracking the
      # progress of resource operation requests in the Amazon Web Services Cloud Control API User Guide .
      def get_resource_request_status(
        request_token : String
      ) : Types::GetResourceRequestStatusOutput
        input = Types::GetResourceRequestStatusInput.new(request_token: request_token)
        get_resource_request_status(input)
      end
      def get_resource_request_status(input : Types::GetResourceRequestStatusInput) : Types::GetResourceRequestStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_REQUEST_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceRequestStatusOutput, "GetResourceRequestStatus")
      end

      # Returns existing resource operation requests. This includes requests of all status types. For more
      # information, see Listing active resource operation requests in the Amazon Web Services Cloud Control
      # API User Guide . Resource operation requests expire after 7 days.
      def list_resource_requests(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_request_status_filter : Types::ResourceRequestStatusFilter? = nil
      ) : Types::ListResourceRequestsOutput
        input = Types::ListResourceRequestsInput.new(max_results: max_results, next_token: next_token, resource_request_status_filter: resource_request_status_filter)
        list_resource_requests(input)
      end
      def list_resource_requests(input : Types::ListResourceRequestsInput) : Types::ListResourceRequestsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_REQUESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceRequestsOutput, "ListResourceRequests")
      end

      # Returns information about the specified resources. For more information, see Discovering resources
      # in the Amazon Web Services Cloud Control API User Guide . You can use this action to return
      # information about existing resources in your account and Amazon Web Services Region, whether those
      # resources were provisioned using Cloud Control API.
      def list_resources(
        type_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_model : String? = nil,
        role_arn : String? = nil,
        type_version_id : String? = nil
      ) : Types::ListResourcesOutput
        input = Types::ListResourcesInput.new(type_name: type_name, max_results: max_results, next_token: next_token, resource_model: resource_model, role_arn: role_arn, type_version_id: type_version_id)
        list_resources(input)
      end
      def list_resources(input : Types::ListResourcesInput) : Types::ListResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourcesOutput, "ListResources")
      end

      # Updates the specified property values in the resource. You specify your resource property updates as
      # a list of patch operations contained in a JSON patch document that adheres to the RFC 6902 -
      # JavaScript Object Notation (JSON) Patch standard. For details on how Cloud Control API performs
      # resource update operations, see Updating a resource in the Amazon Web Services Cloud Control API
      # User Guide . After you have initiated a resource update request, you can monitor the progress of
      # your request by calling GetResourceRequestStatus using the RequestToken of the ProgressEvent
      # returned by UpdateResource . For more information about the properties of a specific resource, refer
      # to the related topic for the resource in the Resource and property types reference in the
      # CloudFormation Users Guide .
      def update_resource(
        identifier : String,
        patch_document : String,
        type_name : String,
        client_token : String? = nil,
        role_arn : String? = nil,
        type_version_id : String? = nil
      ) : Types::UpdateResourceOutput
        input = Types::UpdateResourceInput.new(identifier: identifier, patch_document: patch_document, type_name: type_name, client_token: client_token, role_arn: role_arn, type_version_id: type_version_id)
        update_resource(input)
      end
      def update_resource(input : Types::UpdateResourceInput) : Types::UpdateResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResourceOutput, "UpdateResource")
      end
    end
  end
end
