module AwsSdk
  module ServiceDiscovery
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

      # Creates an HTTP namespace. Service instances registered using an HTTP namespace can be discovered
      # using a DiscoverInstances request but can't be discovered using DNS. For the current quota on the
      # number of namespaces that you can create using the same Amazon Web Services account, see Cloud Map
      # quotas in the Cloud Map Developer Guide .
      def create_http_namespace(
        name : String,
        creator_request_id : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateHttpNamespaceResponse
        input = Types::CreateHttpNamespaceRequest.new(name: name, creator_request_id: creator_request_id, description: description, tags: tags)
        create_http_namespace(input)
      end
      def create_http_namespace(input : Types::CreateHttpNamespaceRequest) : Types::CreateHttpNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HTTP_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHttpNamespaceResponse, "CreateHttpNamespace")
      end

      # Creates a private namespace based on DNS, which is visible only inside a specified Amazon VPC. The
      # namespace defines your service naming scheme. For example, if you name your namespace example.com
      # and name your service backend , the resulting DNS name for the service is backend.example.com .
      # Service instances that are registered using a private DNS namespace can be discovered using either a
      # DiscoverInstances request or using DNS. For the current quota on the number of namespaces that you
      # can create using the same Amazon Web Services account, see Cloud Map quotas in the Cloud Map
      # Developer Guide .
      def create_private_dns_namespace(
        name : String,
        vpc : String,
        creator_request_id : String? = nil,
        description : String? = nil,
        properties : Types::PrivateDnsNamespaceProperties? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePrivateDnsNamespaceResponse
        input = Types::CreatePrivateDnsNamespaceRequest.new(name: name, vpc: vpc, creator_request_id: creator_request_id, description: description, properties: properties, tags: tags)
        create_private_dns_namespace(input)
      end
      def create_private_dns_namespace(input : Types::CreatePrivateDnsNamespaceRequest) : Types::CreatePrivateDnsNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRIVATE_DNS_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePrivateDnsNamespaceResponse, "CreatePrivateDnsNamespace")
      end

      # Creates a public namespace based on DNS, which is visible on the internet. The namespace defines
      # your service naming scheme. For example, if you name your namespace example.com and name your
      # service backend , the resulting DNS name for the service is backend.example.com . You can discover
      # instances that were registered with a public DNS namespace by using either a DiscoverInstances
      # request or using DNS. For the current quota on the number of namespaces that you can create using
      # the same Amazon Web Services account, see Cloud Map quotas in the Cloud Map Developer Guide . The
      # CreatePublicDnsNamespace API operation is not supported in the Amazon Web Services GovCloud (US)
      # Regions.
      def create_public_dns_namespace(
        name : String,
        creator_request_id : String? = nil,
        description : String? = nil,
        properties : Types::PublicDnsNamespaceProperties? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePublicDnsNamespaceResponse
        input = Types::CreatePublicDnsNamespaceRequest.new(name: name, creator_request_id: creator_request_id, description: description, properties: properties, tags: tags)
        create_public_dns_namespace(input)
      end
      def create_public_dns_namespace(input : Types::CreatePublicDnsNamespaceRequest) : Types::CreatePublicDnsNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PUBLIC_DNS_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePublicDnsNamespaceResponse, "CreatePublicDnsNamespace")
      end

      # Creates a service. This action defines the configuration for the following entities: For public and
      # private DNS namespaces, one of the following combinations of DNS records in Amazon Route 53: A AAAA
      # A and AAAA SRV CNAME Optionally, a health check After you create the service, you can submit a
      # RegisterInstance request, and Cloud Map uses the values in the configuration to create the specified
      # entities. For the current quota on the number of instances that you can register using the same
      # namespace and using the same service, see Cloud Map quotas in the Cloud Map Developer Guide .
      def create_service(
        name : String,
        creator_request_id : String? = nil,
        description : String? = nil,
        dns_config : Types::DnsConfig? = nil,
        health_check_config : Types::HealthCheckConfig? = nil,
        health_check_custom_config : Types::HealthCheckCustomConfig? = nil,
        namespace_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil
      ) : Types::CreateServiceResponse
        input = Types::CreateServiceRequest.new(name: name, creator_request_id: creator_request_id, description: description, dns_config: dns_config, health_check_config: health_check_config, health_check_custom_config: health_check_custom_config, namespace_id: namespace_id, tags: tags, type: type)
        create_service(input)
      end
      def create_service(input : Types::CreateServiceRequest) : Types::CreateServiceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceResponse, "CreateService")
      end

      # Deletes a namespace from the current account. If the namespace still contains one or more services,
      # the request fails.
      def delete_namespace(
        id : String
      ) : Types::DeleteNamespaceResponse
        input = Types::DeleteNamespaceRequest.new(id: id)
        delete_namespace(input)
      end
      def delete_namespace(input : Types::DeleteNamespaceRequest) : Types::DeleteNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNamespaceResponse, "DeleteNamespace")
      end

      # Deletes a specified service and all associated service attributes. If the service still contains one
      # or more registered instances, the request fails.
      def delete_service(
        id : String
      ) : Types::DeleteServiceResponse
        input = Types::DeleteServiceRequest.new(id: id)
        delete_service(input)
      end
      def delete_service(input : Types::DeleteServiceRequest) : Types::DeleteServiceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceResponse, "DeleteService")
      end

      # Deletes specific attributes associated with a service.
      def delete_service_attributes(
        attributes : Array(String),
        service_id : String
      ) : Types::DeleteServiceAttributesResponse
        input = Types::DeleteServiceAttributesRequest.new(attributes: attributes, service_id: service_id)
        delete_service_attributes(input)
      end
      def delete_service_attributes(input : Types::DeleteServiceAttributesRequest) : Types::DeleteServiceAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceAttributesResponse, "DeleteServiceAttributes")
      end

      # Deletes the Amazon Route 53 DNS records and health check, if any, that Cloud Map created for the
      # specified instance.
      def deregister_instance(
        instance_id : String,
        service_id : String
      ) : Types::DeregisterInstanceResponse
        input = Types::DeregisterInstanceRequest.new(instance_id: instance_id, service_id: service_id)
        deregister_instance(input)
      end
      def deregister_instance(input : Types::DeregisterInstanceRequest) : Types::DeregisterInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterInstanceResponse, "DeregisterInstance")
      end

      # Discovers registered instances for a specified namespace and service. You can use DiscoverInstances
      # to discover instances for any type of namespace. DiscoverInstances returns a randomized list of
      # instances allowing customers to distribute traffic evenly across instances. For public and private
      # DNS namespaces, you can also use DNS queries to discover instances.
      def discover_instances(
        namespace_name : String,
        service_name : String,
        health_status : String? = nil,
        max_results : Int32? = nil,
        optional_parameters : Hash(String, String)? = nil,
        owner_account : String? = nil,
        query_parameters : Hash(String, String)? = nil
      ) : Types::DiscoverInstancesResponse
        input = Types::DiscoverInstancesRequest.new(namespace_name: namespace_name, service_name: service_name, health_status: health_status, max_results: max_results, optional_parameters: optional_parameters, owner_account: owner_account, query_parameters: query_parameters)
        discover_instances(input)
      end
      def discover_instances(input : Types::DiscoverInstancesRequest) : Types::DiscoverInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::DISCOVER_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DiscoverInstancesResponse, "DiscoverInstances")
      end

      # Discovers the increasing revision associated with an instance.
      def discover_instances_revision(
        namespace_name : String,
        service_name : String,
        owner_account : String? = nil
      ) : Types::DiscoverInstancesRevisionResponse
        input = Types::DiscoverInstancesRevisionRequest.new(namespace_name: namespace_name, service_name: service_name, owner_account: owner_account)
        discover_instances_revision(input)
      end
      def discover_instances_revision(input : Types::DiscoverInstancesRevisionRequest) : Types::DiscoverInstancesRevisionResponse
        request = Protocol::JsonRpc.build_request(Model::DISCOVER_INSTANCES_REVISION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DiscoverInstancesRevisionResponse, "DiscoverInstancesRevision")
      end

      # Gets information about a specified instance.
      def get_instance(
        instance_id : String,
        service_id : String
      ) : Types::GetInstanceResponse
        input = Types::GetInstanceRequest.new(instance_id: instance_id, service_id: service_id)
        get_instance(input)
      end
      def get_instance(input : Types::GetInstanceRequest) : Types::GetInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceResponse, "GetInstance")
      end

      # Gets the current health status ( Healthy , Unhealthy , or Unknown ) of one or more instances that
      # are associated with a specified service. There's a brief delay between when you register an instance
      # and when the health status for the instance is available.
      def get_instances_health_status(
        service_id : String,
        instances : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetInstancesHealthStatusResponse
        input = Types::GetInstancesHealthStatusRequest.new(service_id: service_id, instances: instances, max_results: max_results, next_token: next_token)
        get_instances_health_status(input)
      end
      def get_instances_health_status(input : Types::GetInstancesHealthStatusRequest) : Types::GetInstancesHealthStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCES_HEALTH_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstancesHealthStatusResponse, "GetInstancesHealthStatus")
      end

      # Gets information about a namespace.
      def get_namespace(
        id : String
      ) : Types::GetNamespaceResponse
        input = Types::GetNamespaceRequest.new(id: id)
        get_namespace(input)
      end
      def get_namespace(input : Types::GetNamespaceRequest) : Types::GetNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetNamespaceResponse, "GetNamespace")
      end

      # Gets information about any operation that returns an operation ID in the response, such as a
      # CreateHttpNamespace request. To get a list of operations that match specified criteria, see
      # ListOperations .
      def get_operation(
        operation_id : String,
        owner_account : String? = nil
      ) : Types::GetOperationResponse
        input = Types::GetOperationRequest.new(operation_id: operation_id, owner_account: owner_account)
        get_operation(input)
      end
      def get_operation(input : Types::GetOperationRequest) : Types::GetOperationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_OPERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOperationResponse, "GetOperation")
      end

      # Gets the settings for a specified service.
      def get_service(
        id : String
      ) : Types::GetServiceResponse
        input = Types::GetServiceRequest.new(id: id)
        get_service(input)
      end
      def get_service(input : Types::GetServiceRequest) : Types::GetServiceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceResponse, "GetService")
      end

      # Returns the attributes associated with a specified service.
      def get_service_attributes(
        service_id : String
      ) : Types::GetServiceAttributesResponse
        input = Types::GetServiceAttributesRequest.new(service_id: service_id)
        get_service_attributes(input)
      end
      def get_service_attributes(input : Types::GetServiceAttributesRequest) : Types::GetServiceAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceAttributesResponse, "GetServiceAttributes")
      end

      # Lists summary information about the instances that you registered by using a specified service.
      def list_instances(
        service_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInstancesResponse
        input = Types::ListInstancesRequest.new(service_id: service_id, max_results: max_results, next_token: next_token)
        list_instances(input)
      end
      def list_instances(input : Types::ListInstancesRequest) : Types::ListInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInstancesResponse, "ListInstances")
      end

      # Lists summary information about the namespaces that were created by the current Amazon Web Services
      # account and shared with the current Amazon Web Services account.
      def list_namespaces(
        filters : Array(Types::NamespaceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListNamespacesResponse
        input = Types::ListNamespacesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_namespaces(input)
      end
      def list_namespaces(input : Types::ListNamespacesRequest) : Types::ListNamespacesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_NAMESPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNamespacesResponse, "ListNamespaces")
      end

      # Lists operations that match the criteria that you specify.
      def list_operations(
        filters : Array(Types::OperationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOperationsResponse
        input = Types::ListOperationsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_operations(input)
      end
      def list_operations(input : Types::ListOperationsRequest) : Types::ListOperationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOperationsResponse, "ListOperations")
      end

      # Lists summary information for all the services that are associated with one or more namespaces.
      def list_services(
        filters : Array(Types::ServiceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServicesResponse
        input = Types::ListServicesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_services(input)
      end
      def list_services(input : Types::ListServicesRequest) : Types::ListServicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicesResponse, "ListServices")
      end

      # Lists tags for the specified resource.
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

      # Creates or updates one or more records and, optionally, creates a health check based on the settings
      # in a specified service. When you submit a RegisterInstance request, the following occurs: For each
      # DNS record that you define in the service that's specified by ServiceId , a record is created or
      # updated in the hosted zone that's associated with the corresponding namespace. If the service
      # includes HealthCheckConfig , a health check is created based on the settings in the health check
      # configuration. The health check, if any, is associated with each of the new or updated records. One
      # RegisterInstance request must complete before you can submit another request and specify the same
      # service ID and instance ID. For more information, see CreateService . When Cloud Map receives a DNS
      # query for the specified DNS name, it returns the applicable value: If the health check is healthy :
      # returns all the records If the health check is unhealthy : returns the applicable value for the last
      # healthy instance If you didn't specify a health check configuration : returns all the records For
      # the current quota on the number of instances that you can register using the same namespace and
      # using the same service, see Cloud Map quotas in the Cloud Map Developer Guide .
      def register_instance(
        attributes : Hash(String, String),
        instance_id : String,
        service_id : String,
        creator_request_id : String? = nil
      ) : Types::RegisterInstanceResponse
        input = Types::RegisterInstanceRequest.new(attributes: attributes, instance_id: instance_id, service_id: service_id, creator_request_id: creator_request_id)
        register_instance(input)
      end
      def register_instance(input : Types::RegisterInstanceRequest) : Types::RegisterInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterInstanceResponse, "RegisterInstance")
      end

      # Adds one or more tags to the specified resource.
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

      # Removes one or more tags from the specified resource.
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

      # Updates an HTTP namespace.
      def update_http_namespace(
        id : String,
        namespace : Types::HttpNamespaceChange,
        updater_request_id : String? = nil
      ) : Types::UpdateHttpNamespaceResponse
        input = Types::UpdateHttpNamespaceRequest.new(id: id, namespace: namespace, updater_request_id: updater_request_id)
        update_http_namespace(input)
      end
      def update_http_namespace(input : Types::UpdateHttpNamespaceRequest) : Types::UpdateHttpNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HTTP_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHttpNamespaceResponse, "UpdateHttpNamespace")
      end

      # Submits a request to change the health status of a custom health check to healthy or unhealthy. You
      # can use UpdateInstanceCustomHealthStatus to change the status only for custom health checks, which
      # you define using HealthCheckCustomConfig when you create a service. You can't use it to change the
      # status for Route 53 health checks, which you define using HealthCheckConfig . For more information,
      # see HealthCheckCustomConfig .
      def update_instance_custom_health_status(
        instance_id : String,
        service_id : String,
        status : String
      ) : Nil
        input = Types::UpdateInstanceCustomHealthStatusRequest.new(instance_id: instance_id, service_id: service_id, status: status)
        update_instance_custom_health_status(input)
      end
      def update_instance_custom_health_status(input : Types::UpdateInstanceCustomHealthStatusRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INSTANCE_CUSTOM_HEALTH_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a private DNS namespace.
      def update_private_dns_namespace(
        id : String,
        namespace : Types::PrivateDnsNamespaceChange,
        updater_request_id : String? = nil
      ) : Types::UpdatePrivateDnsNamespaceResponse
        input = Types::UpdatePrivateDnsNamespaceRequest.new(id: id, namespace: namespace, updater_request_id: updater_request_id)
        update_private_dns_namespace(input)
      end
      def update_private_dns_namespace(input : Types::UpdatePrivateDnsNamespaceRequest) : Types::UpdatePrivateDnsNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PRIVATE_DNS_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePrivateDnsNamespaceResponse, "UpdatePrivateDnsNamespace")
      end

      # Updates a public DNS namespace.
      def update_public_dns_namespace(
        id : String,
        namespace : Types::PublicDnsNamespaceChange,
        updater_request_id : String? = nil
      ) : Types::UpdatePublicDnsNamespaceResponse
        input = Types::UpdatePublicDnsNamespaceRequest.new(id: id, namespace: namespace, updater_request_id: updater_request_id)
        update_public_dns_namespace(input)
      end
      def update_public_dns_namespace(input : Types::UpdatePublicDnsNamespaceRequest) : Types::UpdatePublicDnsNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PUBLIC_DNS_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePublicDnsNamespaceResponse, "UpdatePublicDnsNamespace")
      end

      # Submits a request to perform the following operations: Update the TTL setting for existing
      # DnsRecords configurations Add, update, or delete HealthCheckConfig for a specified service You can't
      # add, update, or delete a HealthCheckCustomConfig configuration. For public and private DNS
      # namespaces, note the following: If you omit any existing DnsRecords or HealthCheckConfig
      # configurations from an UpdateService request, the configurations are deleted from the service. If
      # you omit an existing HealthCheckCustomConfig configuration from an UpdateService request, the
      # configuration isn't deleted from the service. You can't call UpdateService and update settings in
      # the following scenarios: When the service is associated with an HTTP namespace When the service is
      # associated with a shared namespace and contains instances that were registered by Amazon Web
      # Services accounts other than the account making the UpdateService call When you update settings for
      # a service, Cloud Map also updates the corresponding settings in all the records and health checks
      # that were created by using the specified service.
      def update_service(
        id : String,
        service : Types::ServiceChange
      ) : Types::UpdateServiceResponse
        input = Types::UpdateServiceRequest.new(id: id, service: service)
        update_service(input)
      end
      def update_service(input : Types::UpdateServiceRequest) : Types::UpdateServiceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceResponse, "UpdateService")
      end

      # Submits a request to update a specified service to add service-level attributes.
      def update_service_attributes(
        attributes : Hash(String, String),
        service_id : String
      ) : Types::UpdateServiceAttributesResponse
        input = Types::UpdateServiceAttributesRequest.new(attributes: attributes, service_id: service_id)
        update_service_attributes(input)
      end
      def update_service_attributes(input : Types::UpdateServiceAttributesRequest) : Types::UpdateServiceAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceAttributesResponse, "UpdateServiceAttributes")
      end
    end
  end
end
