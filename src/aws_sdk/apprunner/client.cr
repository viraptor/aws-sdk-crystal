module AwsSdk
  module AppRunner
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

      # Associate your own domain name with the App Runner subdomain URL of your App Runner service. After
      # you call AssociateCustomDomain and receive a successful response, use the information in the
      # CustomDomain record that's returned to add CNAME records to your Domain Name System (DNS). For each
      # mapped domain name, add a mapping to the target App Runner subdomain and one or more certificate
      # validation records. App Runner then performs DNS validation to verify that you own or control the
      # domain name that you associated. App Runner tracks domain validity in a certificate stored in AWS
      # Certificate Manager (ACM) .

      def associate_custom_domain(
        domain_name : String,
        service_arn : String,
        enable_www_subdomain : Bool? = nil
      ) : Types::AssociateCustomDomainResponse

        input = Types::AssociateCustomDomainRequest.new(domain_name: domain_name, service_arn: service_arn, enable_www_subdomain: enable_www_subdomain)
        associate_custom_domain(input)
      end

      def associate_custom_domain(input : Types::AssociateCustomDomainRequest) : Types::AssociateCustomDomainResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_CUSTOM_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateCustomDomainResponse, "AssociateCustomDomain")
      end

      # Create an App Runner automatic scaling configuration resource. App Runner requires this resource
      # when you create or update App Runner services and you require non-default auto scaling settings. You
      # can share an auto scaling configuration across multiple services. Create multiple revisions of a
      # configuration by calling this action multiple times using the same AutoScalingConfigurationName .
      # The call returns incremental AutoScalingConfigurationRevision values. When you create a service and
      # configure an auto scaling configuration resource, the service uses the latest active revision of the
      # auto scaling configuration by default. You can optionally configure the service to use a specific
      # revision. Configure a higher MinSize to increase the spread of your App Runner service over more
      # Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.
      # Configure a lower MaxSize to control your cost. The tradeoff is lower responsiveness during peak
      # demand.

      def create_auto_scaling_configuration(
        auto_scaling_configuration_name : String,
        max_concurrency : Int32? = nil,
        max_size : Int32? = nil,
        min_size : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAutoScalingConfigurationResponse

        input = Types::CreateAutoScalingConfigurationRequest.new(auto_scaling_configuration_name: auto_scaling_configuration_name, max_concurrency: max_concurrency, max_size: max_size, min_size: min_size, tags: tags)
        create_auto_scaling_configuration(input)
      end

      def create_auto_scaling_configuration(input : Types::CreateAutoScalingConfigurationRequest) : Types::CreateAutoScalingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AUTO_SCALING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAutoScalingConfigurationResponse, "CreateAutoScalingConfiguration")
      end

      # Create an App Runner connection resource. App Runner requires a connection resource when you create
      # App Runner services that access private repositories from certain third-party providers. You can
      # share a connection across multiple services. A connection resource is needed to access GitHub and
      # Bitbucket repositories. Both require a user interface approval process through the App Runner
      # console before you can use the connection.

      def create_connection(
        connection_name : String,
        provider_type : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateConnectionResponse

        input = Types::CreateConnectionRequest.new(connection_name: connection_name, provider_type: provider_type, tags: tags)
        create_connection(input)
      end

      def create_connection(input : Types::CreateConnectionRequest) : Types::CreateConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectionResponse, "CreateConnection")
      end

      # Create an App Runner observability configuration resource. App Runner requires this resource when
      # you create or update App Runner services and you want to enable non-default observability features.
      # You can share an observability configuration across multiple services. Create multiple revisions of
      # a configuration by calling this action multiple times using the same ObservabilityConfigurationName
      # . The call returns incremental ObservabilityConfigurationRevision values. When you create a service
      # and configure an observability configuration resource, the service uses the latest active revision
      # of the observability configuration by default. You can optionally configure the service to use a
      # specific revision. The observability configuration resource is designed to configure multiple
      # features (currently one feature, tracing). This action takes optional parameters that describe the
      # configuration of these features (currently one parameter, TraceConfiguration ). If you don't specify
      # a feature parameter, App Runner doesn't enable the feature.

      def create_observability_configuration(
        observability_configuration_name : String,
        tags : Array(Types::Tag)? = nil,
        trace_configuration : Types::TraceConfiguration? = nil
      ) : Types::CreateObservabilityConfigurationResponse

        input = Types::CreateObservabilityConfigurationRequest.new(observability_configuration_name: observability_configuration_name, tags: tags, trace_configuration: trace_configuration)
        create_observability_configuration(input)
      end

      def create_observability_configuration(input : Types::CreateObservabilityConfigurationRequest) : Types::CreateObservabilityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_OBSERVABILITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateObservabilityConfigurationResponse, "CreateObservabilityConfiguration")
      end

      # Create an App Runner service. After the service is created, the action also automatically starts a
      # deployment. This is an asynchronous operation. On a successful call, you can use the returned
      # OperationId and the ListOperations call to track the operation's progress.

      def create_service(
        service_name : String,
        source_configuration : Types::SourceConfiguration,
        auto_scaling_configuration_arn : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        health_check_configuration : Types::HealthCheckConfiguration? = nil,
        instance_configuration : Types::InstanceConfiguration? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        observability_configuration : Types::ServiceObservabilityConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateServiceResponse

        input = Types::CreateServiceRequest.new(service_name: service_name, source_configuration: source_configuration, auto_scaling_configuration_arn: auto_scaling_configuration_arn, encryption_configuration: encryption_configuration, health_check_configuration: health_check_configuration, instance_configuration: instance_configuration, network_configuration: network_configuration, observability_configuration: observability_configuration, tags: tags)
        create_service(input)
      end

      def create_service(input : Types::CreateServiceRequest) : Types::CreateServiceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServiceResponse, "CreateService")
      end

      # Create an App Runner VPC connector resource. App Runner requires this resource when you want to
      # associate your App Runner service to a custom Amazon Virtual Private Cloud (Amazon VPC).

      def create_vpc_connector(
        subnets : Array(String),
        vpc_connector_name : String,
        security_groups : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVpcConnectorResponse

        input = Types::CreateVpcConnectorRequest.new(subnets: subnets, vpc_connector_name: vpc_connector_name, security_groups: security_groups, tags: tags)
        create_vpc_connector(input)
      end

      def create_vpc_connector(input : Types::CreateVpcConnectorRequest) : Types::CreateVpcConnectorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VPC_CONNECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVpcConnectorResponse, "CreateVpcConnector")
      end

      # Create an App Runner VPC Ingress Connection resource. App Runner requires this resource when you
      # want to associate your App Runner service with an Amazon VPC endpoint.

      def create_vpc_ingress_connection(
        ingress_vpc_configuration : Types::IngressVpcConfiguration,
        service_arn : String,
        vpc_ingress_connection_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVpcIngressConnectionResponse

        input = Types::CreateVpcIngressConnectionRequest.new(ingress_vpc_configuration: ingress_vpc_configuration, service_arn: service_arn, vpc_ingress_connection_name: vpc_ingress_connection_name, tags: tags)
        create_vpc_ingress_connection(input)
      end

      def create_vpc_ingress_connection(input : Types::CreateVpcIngressConnectionRequest) : Types::CreateVpcIngressConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VPC_INGRESS_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVpcIngressConnectionResponse, "CreateVpcIngressConnection")
      end

      # Delete an App Runner automatic scaling configuration resource. You can delete a top level auto
      # scaling configuration, a specific revision of one, or all revisions associated with the top level
      # configuration. You can't delete the default auto scaling configuration or a configuration that's
      # used by one or more App Runner services.

      def delete_auto_scaling_configuration(
        auto_scaling_configuration_arn : String,
        delete_all_revisions : Bool? = nil
      ) : Types::DeleteAutoScalingConfigurationResponse

        input = Types::DeleteAutoScalingConfigurationRequest.new(auto_scaling_configuration_arn: auto_scaling_configuration_arn, delete_all_revisions: delete_all_revisions)
        delete_auto_scaling_configuration(input)
      end

      def delete_auto_scaling_configuration(input : Types::DeleteAutoScalingConfigurationRequest) : Types::DeleteAutoScalingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_AUTO_SCALING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAutoScalingConfigurationResponse, "DeleteAutoScalingConfiguration")
      end

      # Delete an App Runner connection. You must first ensure that there are no running App Runner services
      # that use this connection. If there are any, the DeleteConnection action fails.

      def delete_connection(
        connection_arn : String
      ) : Types::DeleteConnectionResponse

        input = Types::DeleteConnectionRequest.new(connection_arn: connection_arn)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionRequest) : Types::DeleteConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConnectionResponse, "DeleteConnection")
      end

      # Delete an App Runner observability configuration resource. You can delete a specific revision or the
      # latest active revision. You can't delete a configuration that's used by one or more App Runner
      # services.

      def delete_observability_configuration(
        observability_configuration_arn : String
      ) : Types::DeleteObservabilityConfigurationResponse

        input = Types::DeleteObservabilityConfigurationRequest.new(observability_configuration_arn: observability_configuration_arn)
        delete_observability_configuration(input)
      end

      def delete_observability_configuration(input : Types::DeleteObservabilityConfigurationRequest) : Types::DeleteObservabilityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_OBSERVABILITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteObservabilityConfigurationResponse, "DeleteObservabilityConfiguration")
      end

      # Delete an App Runner service. This is an asynchronous operation. On a successful call, you can use
      # the returned OperationId and the ListOperations call to track the operation's progress. Make sure
      # that you don't have any active VPCIngressConnections associated with the service you want to delete.

      def delete_service(
        service_arn : String
      ) : Types::DeleteServiceResponse

        input = Types::DeleteServiceRequest.new(service_arn: service_arn)
        delete_service(input)
      end

      def delete_service(input : Types::DeleteServiceRequest) : Types::DeleteServiceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceResponse, "DeleteService")
      end

      # Delete an App Runner VPC connector resource. You can't delete a connector that's used by one or more
      # App Runner services.

      def delete_vpc_connector(
        vpc_connector_arn : String
      ) : Types::DeleteVpcConnectorResponse

        input = Types::DeleteVpcConnectorRequest.new(vpc_connector_arn: vpc_connector_arn)
        delete_vpc_connector(input)
      end

      def delete_vpc_connector(input : Types::DeleteVpcConnectorRequest) : Types::DeleteVpcConnectorResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VPC_CONNECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVpcConnectorResponse, "DeleteVpcConnector")
      end

      # Delete an App Runner VPC Ingress Connection resource that's associated with an App Runner service.
      # The VPC Ingress Connection must be in one of the following states to be deleted: AVAILABLE
      # FAILED_CREATION FAILED_UPDATE FAILED_DELETION

      def delete_vpc_ingress_connection(
        vpc_ingress_connection_arn : String
      ) : Types::DeleteVpcIngressConnectionResponse

        input = Types::DeleteVpcIngressConnectionRequest.new(vpc_ingress_connection_arn: vpc_ingress_connection_arn)
        delete_vpc_ingress_connection(input)
      end

      def delete_vpc_ingress_connection(input : Types::DeleteVpcIngressConnectionRequest) : Types::DeleteVpcIngressConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VPC_INGRESS_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVpcIngressConnectionResponse, "DeleteVpcIngressConnection")
      end

      # Return a full description of an App Runner automatic scaling configuration resource.

      def describe_auto_scaling_configuration(
        auto_scaling_configuration_arn : String
      ) : Types::DescribeAutoScalingConfigurationResponse

        input = Types::DescribeAutoScalingConfigurationRequest.new(auto_scaling_configuration_arn: auto_scaling_configuration_arn)
        describe_auto_scaling_configuration(input)
      end

      def describe_auto_scaling_configuration(input : Types::DescribeAutoScalingConfigurationRequest) : Types::DescribeAutoScalingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AUTO_SCALING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAutoScalingConfigurationResponse, "DescribeAutoScalingConfiguration")
      end

      # Return a description of custom domain names that are associated with an App Runner service.

      def describe_custom_domains(
        service_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeCustomDomainsResponse

        input = Types::DescribeCustomDomainsRequest.new(service_arn: service_arn, max_results: max_results, next_token: next_token)
        describe_custom_domains(input)
      end

      def describe_custom_domains(input : Types::DescribeCustomDomainsRequest) : Types::DescribeCustomDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CUSTOM_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCustomDomainsResponse, "DescribeCustomDomains")
      end

      # Return a full description of an App Runner observability configuration resource.

      def describe_observability_configuration(
        observability_configuration_arn : String
      ) : Types::DescribeObservabilityConfigurationResponse

        input = Types::DescribeObservabilityConfigurationRequest.new(observability_configuration_arn: observability_configuration_arn)
        describe_observability_configuration(input)
      end

      def describe_observability_configuration(input : Types::DescribeObservabilityConfigurationRequest) : Types::DescribeObservabilityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_OBSERVABILITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeObservabilityConfigurationResponse, "DescribeObservabilityConfiguration")
      end

      # Return a full description of an App Runner service.

      def describe_service(
        service_arn : String
      ) : Types::DescribeServiceResponse

        input = Types::DescribeServiceRequest.new(service_arn: service_arn)
        describe_service(input)
      end

      def describe_service(input : Types::DescribeServiceRequest) : Types::DescribeServiceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServiceResponse, "DescribeService")
      end

      # Return a description of an App Runner VPC connector resource.

      def describe_vpc_connector(
        vpc_connector_arn : String
      ) : Types::DescribeVpcConnectorResponse

        input = Types::DescribeVpcConnectorRequest.new(vpc_connector_arn: vpc_connector_arn)
        describe_vpc_connector(input)
      end

      def describe_vpc_connector(input : Types::DescribeVpcConnectorRequest) : Types::DescribeVpcConnectorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VPC_CONNECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVpcConnectorResponse, "DescribeVpcConnector")
      end

      # Return a full description of an App Runner VPC Ingress Connection resource.

      def describe_vpc_ingress_connection(
        vpc_ingress_connection_arn : String
      ) : Types::DescribeVpcIngressConnectionResponse

        input = Types::DescribeVpcIngressConnectionRequest.new(vpc_ingress_connection_arn: vpc_ingress_connection_arn)
        describe_vpc_ingress_connection(input)
      end

      def describe_vpc_ingress_connection(input : Types::DescribeVpcIngressConnectionRequest) : Types::DescribeVpcIngressConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VPC_INGRESS_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVpcIngressConnectionResponse, "DescribeVpcIngressConnection")
      end

      # Disassociate a custom domain name from an App Runner service. Certificates tracking domain validity
      # are associated with a custom domain and are stored in AWS Certificate Manager (ACM) . These
      # certificates aren't deleted as part of this action. App Runner delays certificate deletion for 30
      # days after a domain is disassociated from your service.

      def disassociate_custom_domain(
        domain_name : String,
        service_arn : String
      ) : Types::DisassociateCustomDomainResponse

        input = Types::DisassociateCustomDomainRequest.new(domain_name: domain_name, service_arn: service_arn)
        disassociate_custom_domain(input)
      end

      def disassociate_custom_domain(input : Types::DisassociateCustomDomainRequest) : Types::DisassociateCustomDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_CUSTOM_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateCustomDomainResponse, "DisassociateCustomDomain")
      end

      # Returns a list of active App Runner automatic scaling configurations in your Amazon Web Services
      # account. You can query the revisions for a specific configuration name or the revisions for all
      # active configurations in your account. You can optionally query only the latest revision of each
      # requested name. To retrieve a full description of a particular configuration revision, call and
      # provide one of the ARNs returned by ListAutoScalingConfigurations .

      def list_auto_scaling_configurations(
        auto_scaling_configuration_name : String? = nil,
        latest_only : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAutoScalingConfigurationsResponse

        input = Types::ListAutoScalingConfigurationsRequest.new(auto_scaling_configuration_name: auto_scaling_configuration_name, latest_only: latest_only, max_results: max_results, next_token: next_token)
        list_auto_scaling_configurations(input)
      end

      def list_auto_scaling_configurations(input : Types::ListAutoScalingConfigurationsRequest) : Types::ListAutoScalingConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTO_SCALING_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutoScalingConfigurationsResponse, "ListAutoScalingConfigurations")
      end

      # Returns a list of App Runner connections that are associated with your Amazon Web Services account.

      def list_connections(
        connection_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListConnectionsResponse

        input = Types::ListConnectionsRequest.new(connection_name: connection_name, max_results: max_results, next_token: next_token)
        list_connections(input)
      end

      def list_connections(input : Types::ListConnectionsRequest) : Types::ListConnectionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConnectionsResponse, "ListConnections")
      end

      # Returns a list of active App Runner observability configurations in your Amazon Web Services
      # account. You can query the revisions for a specific configuration name or the revisions for all
      # active configurations in your account. You can optionally query only the latest revision of each
      # requested name. To retrieve a full description of a particular configuration revision, call and
      # provide one of the ARNs returned by ListObservabilityConfigurations .

      def list_observability_configurations(
        latest_only : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        observability_configuration_name : String? = nil
      ) : Types::ListObservabilityConfigurationsResponse

        input = Types::ListObservabilityConfigurationsRequest.new(latest_only: latest_only, max_results: max_results, next_token: next_token, observability_configuration_name: observability_configuration_name)
        list_observability_configurations(input)
      end

      def list_observability_configurations(input : Types::ListObservabilityConfigurationsRequest) : Types::ListObservabilityConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OBSERVABILITY_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListObservabilityConfigurationsResponse, "ListObservabilityConfigurations")
      end

      # Return a list of operations that occurred on an App Runner service. The resulting list of
      # OperationSummary objects is sorted in reverse chronological order. The first object on the list
      # represents the last started operation.

      def list_operations(
        service_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOperationsResponse

        input = Types::ListOperationsRequest.new(service_arn: service_arn, max_results: max_results, next_token: next_token)
        list_operations(input)
      end

      def list_operations(input : Types::ListOperationsRequest) : Types::ListOperationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOperationsResponse, "ListOperations")
      end

      # Returns a list of running App Runner services in your Amazon Web Services account.

      def list_services(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServicesResponse

        input = Types::ListServicesRequest.new(max_results: max_results, next_token: next_token)
        list_services(input)
      end

      def list_services(input : Types::ListServicesRequest) : Types::ListServicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicesResponse, "ListServices")
      end

      # Returns a list of the associated App Runner services using an auto scaling configuration.

      def list_services_for_auto_scaling_configuration(
        auto_scaling_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServicesForAutoScalingConfigurationResponse

        input = Types::ListServicesForAutoScalingConfigurationRequest.new(auto_scaling_configuration_arn: auto_scaling_configuration_arn, max_results: max_results, next_token: next_token)
        list_services_for_auto_scaling_configuration(input)
      end

      def list_services_for_auto_scaling_configuration(input : Types::ListServicesForAutoScalingConfigurationRequest) : Types::ListServicesForAutoScalingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICES_FOR_AUTO_SCALING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicesForAutoScalingConfigurationResponse, "ListServicesForAutoScalingConfiguration")
      end

      # List tags that are associated with for an App Runner resource. The response contains a list of tag
      # key-value pairs.

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

      # Returns a list of App Runner VPC connectors in your Amazon Web Services account.

      def list_vpc_connectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListVpcConnectorsResponse

        input = Types::ListVpcConnectorsRequest.new(max_results: max_results, next_token: next_token)
        list_vpc_connectors(input)
      end

      def list_vpc_connectors(input : Types::ListVpcConnectorsRequest) : Types::ListVpcConnectorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VPC_CONNECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVpcConnectorsResponse, "ListVpcConnectors")
      end

      # Return a list of App Runner VPC Ingress Connections in your Amazon Web Services account.

      def list_vpc_ingress_connections(
        filter : Types::ListVpcIngressConnectionsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListVpcIngressConnectionsResponse

        input = Types::ListVpcIngressConnectionsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_vpc_ingress_connections(input)
      end

      def list_vpc_ingress_connections(input : Types::ListVpcIngressConnectionsRequest) : Types::ListVpcIngressConnectionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VPC_INGRESS_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVpcIngressConnectionsResponse, "ListVpcIngressConnections")
      end

      # Pause an active App Runner service. App Runner reduces compute capacity for the service to zero and
      # loses state (for example, ephemeral storage is removed). This is an asynchronous operation. On a
      # successful call, you can use the returned OperationId and the ListOperations call to track the
      # operation's progress.

      def pause_service(
        service_arn : String
      ) : Types::PauseServiceResponse

        input = Types::PauseServiceRequest.new(service_arn: service_arn)
        pause_service(input)
      end

      def pause_service(input : Types::PauseServiceRequest) : Types::PauseServiceResponse
        request = Protocol::JsonRpc.build_request(Model::PAUSE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PauseServiceResponse, "PauseService")
      end

      # Resume an active App Runner service. App Runner provisions compute capacity for the service. This is
      # an asynchronous operation. On a successful call, you can use the returned OperationId and the
      # ListOperations call to track the operation's progress.

      def resume_service(
        service_arn : String
      ) : Types::ResumeServiceResponse

        input = Types::ResumeServiceRequest.new(service_arn: service_arn)
        resume_service(input)
      end

      def resume_service(input : Types::ResumeServiceRequest) : Types::ResumeServiceResponse
        request = Protocol::JsonRpc.build_request(Model::RESUME_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResumeServiceResponse, "ResumeService")
      end

      # Initiate a manual deployment of the latest commit in a source code repository or the latest image in
      # a source image repository to an App Runner service. For a source code repository, App Runner
      # retrieves the commit and builds a Docker image. For a source image repository, App Runner retrieves
      # the latest Docker image. In both cases, App Runner then deploys the new image to your service and
      # starts a new container instance. This is an asynchronous operation. On a successful call, you can
      # use the returned OperationId and the ListOperations call to track the operation's progress.

      def start_deployment(
        service_arn : String
      ) : Types::StartDeploymentResponse

        input = Types::StartDeploymentRequest.new(service_arn: service_arn)
        start_deployment(input)
      end

      def start_deployment(input : Types::StartDeploymentRequest) : Types::StartDeploymentResponse
        request = Protocol::JsonRpc.build_request(Model::START_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDeploymentResponse, "StartDeployment")
      end

      # Add tags to, or update the tag values of, an App Runner resource. A tag is a key-value pair.

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

      # Remove tags from an App Runner resource.

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

      # Update an auto scaling configuration to be the default. The existing default auto scaling
      # configuration will be set to non-default automatically.

      def update_default_auto_scaling_configuration(
        auto_scaling_configuration_arn : String
      ) : Types::UpdateDefaultAutoScalingConfigurationResponse

        input = Types::UpdateDefaultAutoScalingConfigurationRequest.new(auto_scaling_configuration_arn: auto_scaling_configuration_arn)
        update_default_auto_scaling_configuration(input)
      end

      def update_default_auto_scaling_configuration(input : Types::UpdateDefaultAutoScalingConfigurationRequest) : Types::UpdateDefaultAutoScalingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEFAULT_AUTO_SCALING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDefaultAutoScalingConfigurationResponse, "UpdateDefaultAutoScalingConfiguration")
      end

      # Update an App Runner service. You can update the source configuration and instance configuration of
      # the service. You can also update the ARN of the auto scaling configuration resource that's
      # associated with the service. However, you can't change the name or the encryption configuration of
      # the service. These can be set only when you create the service. To update the tags applied to your
      # service, use the separate actions TagResource and UntagResource . This is an asynchronous operation.
      # On a successful call, you can use the returned OperationId and the ListOperations call to track the
      # operation's progress.

      def update_service(
        service_arn : String,
        auto_scaling_configuration_arn : String? = nil,
        health_check_configuration : Types::HealthCheckConfiguration? = nil,
        instance_configuration : Types::InstanceConfiguration? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        observability_configuration : Types::ServiceObservabilityConfiguration? = nil,
        source_configuration : Types::SourceConfiguration? = nil
      ) : Types::UpdateServiceResponse

        input = Types::UpdateServiceRequest.new(service_arn: service_arn, auto_scaling_configuration_arn: auto_scaling_configuration_arn, health_check_configuration: health_check_configuration, instance_configuration: instance_configuration, network_configuration: network_configuration, observability_configuration: observability_configuration, source_configuration: source_configuration)
        update_service(input)
      end

      def update_service(input : Types::UpdateServiceRequest) : Types::UpdateServiceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceResponse, "UpdateService")
      end

      # Update an existing App Runner VPC Ingress Connection resource. The VPC Ingress Connection must be in
      # one of the following states to be updated: AVAILABLE FAILED_CREATION FAILED_UPDATE

      def update_vpc_ingress_connection(
        ingress_vpc_configuration : Types::IngressVpcConfiguration,
        vpc_ingress_connection_arn : String
      ) : Types::UpdateVpcIngressConnectionResponse

        input = Types::UpdateVpcIngressConnectionRequest.new(ingress_vpc_configuration: ingress_vpc_configuration, vpc_ingress_connection_arn: vpc_ingress_connection_arn)
        update_vpc_ingress_connection(input)
      end

      def update_vpc_ingress_connection(input : Types::UpdateVpcIngressConnectionRequest) : Types::UpdateVpcIngressConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VPC_INGRESS_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVpcIngressConnectionResponse, "UpdateVpcIngressConnection")
      end
    end
  end
end
