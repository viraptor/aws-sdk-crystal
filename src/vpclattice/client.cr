module Aws
  module VPCLattice
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Updates the listener rules in a batch. You can use this operation to change the priority of listener
      # rules. This can be useful when bulk updating or swapping rule priority. Required permissions:
      # vpc-lattice:UpdateRule For more information, see How Amazon VPC Lattice works with IAM in the Amazon
      # VPC Lattice User Guide .

      def batch_update_rule(
        listener_identifier : String,
        rules : Array(Types::RuleUpdate),
        service_identifier : String
      ) : Protocol::Request
        input = Types::BatchUpdateRuleRequest.new(listener_identifier: listener_identifier, rules: rules, service_identifier: service_identifier)
        batch_update_rule(input)
      end

      def batch_update_rule(input : Types::BatchUpdateRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables access logs to be sent to Amazon CloudWatch, Amazon S3, and Amazon Kinesis Data Firehose.
      # The service network owner can use the access logs to audit the services in the network. The service
      # network owner can only see access logs from clients and services that are associated with their
      # service network. Access log entries represent traffic originated from VPCs associated with that
      # network. For more information, see Access logs in the Amazon VPC Lattice User Guide .

      def create_access_log_subscription(
        destination_arn : String,
        resource_identifier : String,
        client_token : String? = nil,
        service_network_log_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAccessLogSubscriptionRequest.new(destination_arn: destination_arn, resource_identifier: resource_identifier, client_token: client_token, service_network_log_type: service_network_log_type, tags: tags)
        create_access_log_subscription(input)
      end

      def create_access_log_subscription(input : Types::CreateAccessLogSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_LOG_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a listener for a service. Before you start using your Amazon VPC Lattice service, you must
      # add one or more listeners. A listener is a process that checks for connection requests to your
      # services. For more information, see Listeners in the Amazon VPC Lattice User Guide .

      def create_listener(
        default_action : Types::RuleAction,
        name : String,
        protocol : String,
        service_identifier : String,
        client_token : String? = nil,
        port : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateListenerRequest.new(default_action: default_action, name: name, protocol: protocol, service_identifier: service_identifier, client_token: client_token, port: port, tags: tags)
        create_listener(input)
      end

      def create_listener(input : Types::CreateListenerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LISTENER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a resource configuration. A resource configuration defines a specific resource. You can
      # associate a resource configuration with a service network or a VPC endpoint.

      def create_resource_configuration(
        name : String,
        type : String,
        allow_association_to_shareable_service_network : Bool? = nil,
        client_token : String? = nil,
        custom_domain_name : String? = nil,
        domain_verification_identifier : String? = nil,
        group_domain : String? = nil,
        port_ranges : Array(String)? = nil,
        protocol : String? = nil,
        resource_configuration_definition : Types::ResourceConfigurationDefinition? = nil,
        resource_configuration_group_identifier : String? = nil,
        resource_gateway_identifier : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateResourceConfigurationRequest.new(name: name, type: type, allow_association_to_shareable_service_network: allow_association_to_shareable_service_network, client_token: client_token, custom_domain_name: custom_domain_name, domain_verification_identifier: domain_verification_identifier, group_domain: group_domain, port_ranges: port_ranges, protocol: protocol, resource_configuration_definition: resource_configuration_definition, resource_configuration_group_identifier: resource_configuration_group_identifier, resource_gateway_identifier: resource_gateway_identifier, tags: tags)
        create_resource_configuration(input)
      end

      def create_resource_configuration(input : Types::CreateResourceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A resource gateway is a point of ingress into the VPC where a resource resides. It spans multiple
      # Availability Zones. For your resource to be accessible from all Availability Zones, you should
      # create your resource gateways to span as many Availability Zones as possible. A VPC can have
      # multiple resource gateways.

      def create_resource_gateway(
        name : String,
        client_token : String? = nil,
        ip_address_type : String? = nil,
        ipv4_addresses_per_eni : Int32? = nil,
        security_group_ids : Array(String)? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        vpc_identifier : String? = nil
      ) : Protocol::Request
        input = Types::CreateResourceGatewayRequest.new(name: name, client_token: client_token, ip_address_type: ip_address_type, ipv4_addresses_per_eni: ipv4_addresses_per_eni, security_group_ids: security_group_ids, subnet_ids: subnet_ids, tags: tags, vpc_identifier: vpc_identifier)
        create_resource_gateway(input)
      end

      def create_resource_gateway(input : Types::CreateResourceGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a listener rule. Each listener has a default rule for checking connection requests, but you
      # can define additional rules. Each rule consists of a priority, one or more actions, and one or more
      # conditions. For more information, see Listener rules in the Amazon VPC Lattice User Guide .

      def create_rule(
        action : Types::RuleAction,
        listener_identifier : String,
        match : Types::RuleMatch,
        name : String,
        priority : Int32,
        service_identifier : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRuleRequest.new(action: action, listener_identifier: listener_identifier, match: match, name: name, priority: priority, service_identifier: service_identifier, client_token: client_token, tags: tags)
        create_rule(input)
      end

      def create_rule(input : Types::CreateRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a service. A service is any software application that can run on instances containers, or
      # serverless functions within an account or virtual private cloud (VPC). For more information, see
      # Services in the Amazon VPC Lattice User Guide .

      def create_service(
        name : String,
        auth_type : String? = nil,
        certificate_arn : String? = nil,
        client_token : String? = nil,
        custom_domain_name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceRequest.new(name: name, auth_type: auth_type, certificate_arn: certificate_arn, client_token: client_token, custom_domain_name: custom_domain_name, tags: tags)
        create_service(input)
      end

      def create_service(input : Types::CreateServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a service network. A service network is a logical boundary for a collection of services. You
      # can associate services and VPCs with a service network. For more information, see Service networks
      # in the Amazon VPC Lattice User Guide .

      def create_service_network(
        name : String,
        auth_type : String? = nil,
        client_token : String? = nil,
        sharing_config : Types::SharingConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceNetworkRequest.new(name: name, auth_type: auth_type, client_token: client_token, sharing_config: sharing_config, tags: tags)
        create_service_network(input)
      end

      def create_service_network(input : Types::CreateServiceNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified service network with the specified resource configuration. This allows the
      # resource configuration to receive connections through the service network, including through a
      # service network VPC endpoint.

      def create_service_network_resource_association(
        resource_configuration_identifier : String,
        service_network_identifier : String,
        client_token : String? = nil,
        private_dns_enabled : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceNetworkResourceAssociationRequest.new(resource_configuration_identifier: resource_configuration_identifier, service_network_identifier: service_network_identifier, client_token: client_token, private_dns_enabled: private_dns_enabled, tags: tags)
        create_service_network_resource_association(input)
      end

      def create_service_network_resource_association(input : Types::CreateServiceNetworkResourceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_NETWORK_RESOURCE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified service with the specified service network. For more information, see
      # Manage service associations in the Amazon VPC Lattice User Guide . You can't use this operation if
      # the service and service network are already associated or if there is a disassociation or deletion
      # in progress. If the association fails, you can retry the operation by deleting the association and
      # recreating it. You cannot associate a service and service network that are shared with a caller. The
      # caller must own either the service or the service network. As a result of this operation, the
      # association is created in the service network account and the association owner account.

      def create_service_network_service_association(
        service_identifier : String,
        service_network_identifier : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceNetworkServiceAssociationRequest.new(service_identifier: service_identifier, service_network_identifier: service_network_identifier, client_token: client_token, tags: tags)
        create_service_network_service_association(input)
      end

      def create_service_network_service_association(input : Types::CreateServiceNetworkServiceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_NETWORK_SERVICE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a VPC with a service network. When you associate a VPC with the service network, it
      # enables all the resources within that VPC to be clients and communicate with other services in the
      # service network. For more information, see Manage VPC associations in the Amazon VPC Lattice User
      # Guide . You can't use this operation if there is a disassociation in progress. If the association
      # fails, retry by deleting the association and recreating it. As a result of this operation, the
      # association gets created in the service network account and the VPC owner account. If you add a
      # security group to the service network and VPC association, the association must continue to always
      # have at least one security group. You can add or edit security groups at any time. However, to
      # remove all security groups, you must first delete the association and recreate it without security
      # groups.

      def create_service_network_vpc_association(
        service_network_identifier : String,
        vpc_identifier : String,
        client_token : String? = nil,
        dns_options : Types::DnsOptions? = nil,
        private_dns_enabled : Bool? = nil,
        security_group_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceNetworkVpcAssociationRequest.new(service_network_identifier: service_network_identifier, vpc_identifier: vpc_identifier, client_token: client_token, dns_options: dns_options, private_dns_enabled: private_dns_enabled, security_group_ids: security_group_ids, tags: tags)
        create_service_network_vpc_association(input)
      end

      def create_service_network_vpc_association(input : Types::CreateServiceNetworkVpcAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_NETWORK_VPC_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a target group. A target group is a collection of targets, or compute resources, that run
      # your application or service. A target group can only be used by a single service. For more
      # information, see Target groups in the Amazon VPC Lattice User Guide .

      def create_target_group(
        name : String,
        type : String,
        client_token : String? = nil,
        config : Types::TargetGroupConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTargetGroupRequest.new(name: name, type: type, client_token: client_token, config: config, tags: tags)
        create_target_group(input)
      end

      def create_target_group(input : Types::CreateTargetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TARGET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified access log subscription.

      def delete_access_log_subscription(
        access_log_subscription_identifier : String
      ) : Protocol::Request
        input = Types::DeleteAccessLogSubscriptionRequest.new(access_log_subscription_identifier: access_log_subscription_identifier)
        delete_access_log_subscription(input)
      end

      def delete_access_log_subscription(input : Types::DeleteAccessLogSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_LOG_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified auth policy. If an auth is set to AWS_IAM and the auth policy is deleted, all
      # requests are denied. If you are trying to remove the auth policy completely, you must set the auth
      # type to NONE . If auth is enabled on the resource, but no auth policy is set, all requests are
      # denied.

      def delete_auth_policy(
        resource_identifier : String
      ) : Protocol::Request
        input = Types::DeleteAuthPolicyRequest.new(resource_identifier: resource_identifier)
        delete_auth_policy(input)
      end

      def delete_auth_policy(input : Types::DeleteAuthPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTH_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified domain verification.

      def delete_domain_verification(
        domain_verification_identifier : String
      ) : Protocol::Request
        input = Types::DeleteDomainVerificationRequest.new(domain_verification_identifier: domain_verification_identifier)
        delete_domain_verification(input)
      end

      def delete_domain_verification(input : Types::DeleteDomainVerificationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_VERIFICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified listener.

      def delete_listener(
        listener_identifier : String,
        service_identifier : String
      ) : Protocol::Request
        input = Types::DeleteListenerRequest.new(listener_identifier: listener_identifier, service_identifier: service_identifier)
        delete_listener(input)
      end

      def delete_listener(input : Types::DeleteListenerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LISTENER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified resource configuration.

      def delete_resource_configuration(
        resource_configuration_identifier : String
      ) : Protocol::Request
        input = Types::DeleteResourceConfigurationRequest.new(resource_configuration_identifier: resource_configuration_identifier)
        delete_resource_configuration(input)
      end

      def delete_resource_configuration(input : Types::DeleteResourceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the resource configuration from the resource VPC endpoint.

      def delete_resource_endpoint_association(
        resource_endpoint_association_identifier : String
      ) : Protocol::Request
        input = Types::DeleteResourceEndpointAssociationRequest.new(resource_endpoint_association_identifier: resource_endpoint_association_identifier)
        delete_resource_endpoint_association(input)
      end

      def delete_resource_endpoint_association(input : Types::DeleteResourceEndpointAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_ENDPOINT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified resource gateway.

      def delete_resource_gateway(
        resource_gateway_identifier : String
      ) : Protocol::Request
        input = Types::DeleteResourceGatewayRequest.new(resource_gateway_identifier: resource_gateway_identifier)
        delete_resource_gateway(input)
      end

      def delete_resource_gateway(input : Types::DeleteResourceGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified resource policy.

      def delete_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a listener rule. Each listener has a default rule for checking connection requests, but you
      # can define additional rules. Each rule consists of a priority, one or more actions, and one or more
      # conditions. You can delete additional listener rules, but you cannot delete the default rule. For
      # more information, see Listener rules in the Amazon VPC Lattice User Guide .

      def delete_rule(
        listener_identifier : String,
        rule_identifier : String,
        service_identifier : String
      ) : Protocol::Request
        input = Types::DeleteRuleRequest.new(listener_identifier: listener_identifier, rule_identifier: rule_identifier, service_identifier: service_identifier)
        delete_rule(input)
      end

      def delete_rule(input : Types::DeleteRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a service. A service can't be deleted if it's associated with a service network. If you
      # delete a service, all resources related to the service, such as the resource policy, auth policy,
      # listeners, listener rules, and access log subscriptions, are also deleted. For more information, see
      # Delete a service in the Amazon VPC Lattice User Guide .

      def delete_service(
        service_identifier : String
      ) : Protocol::Request
        input = Types::DeleteServiceRequest.new(service_identifier: service_identifier)
        delete_service(input)
      end

      def delete_service(input : Types::DeleteServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a service network. You can only delete the service network if there is no service or VPC
      # associated with it. If you delete a service network, all resources related to the service network,
      # such as the resource policy, auth policy, and access log subscriptions, are also deleted. For more
      # information, see Delete a service network in the Amazon VPC Lattice User Guide .

      def delete_service_network(
        service_network_identifier : String
      ) : Protocol::Request
        input = Types::DeleteServiceNetworkRequest.new(service_network_identifier: service_network_identifier)
        delete_service_network(input)
      end

      def delete_service_network(input : Types::DeleteServiceNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the association between a service network and a resource configuration.

      def delete_service_network_resource_association(
        service_network_resource_association_identifier : String
      ) : Protocol::Request
        input = Types::DeleteServiceNetworkResourceAssociationRequest.new(service_network_resource_association_identifier: service_network_resource_association_identifier)
        delete_service_network_resource_association(input)
      end

      def delete_service_network_resource_association(input : Types::DeleteServiceNetworkResourceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_NETWORK_RESOURCE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the association between a service and a service network. This operation fails if an
      # association is still in progress.

      def delete_service_network_service_association(
        service_network_service_association_identifier : String
      ) : Protocol::Request
        input = Types::DeleteServiceNetworkServiceAssociationRequest.new(service_network_service_association_identifier: service_network_service_association_identifier)
        delete_service_network_service_association(input)
      end

      def delete_service_network_service_association(input : Types::DeleteServiceNetworkServiceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_NETWORK_SERVICE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the VPC from the service network. You can't disassociate the VPC if there is a create
      # or update association in progress.

      def delete_service_network_vpc_association(
        service_network_vpc_association_identifier : String
      ) : Protocol::Request
        input = Types::DeleteServiceNetworkVpcAssociationRequest.new(service_network_vpc_association_identifier: service_network_vpc_association_identifier)
        delete_service_network_vpc_association(input)
      end

      def delete_service_network_vpc_association(input : Types::DeleteServiceNetworkVpcAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_NETWORK_VPC_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a target group. You can't delete a target group if it is used in a listener rule or if the
      # target group creation is in progress.

      def delete_target_group(
        target_group_identifier : String
      ) : Protocol::Request
        input = Types::DeleteTargetGroupRequest.new(target_group_identifier: target_group_identifier)
        delete_target_group(input)
      end

      def delete_target_group(input : Types::DeleteTargetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TARGET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters the specified targets from the specified target group.

      def deregister_targets(
        target_group_identifier : String,
        targets : Array(Types::Target)
      ) : Protocol::Request
        input = Types::DeregisterTargetsRequest.new(target_group_identifier: target_group_identifier, targets: targets)
        deregister_targets(input)
      end

      def deregister_targets(input : Types::DeregisterTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified access log subscription.

      def get_access_log_subscription(
        access_log_subscription_identifier : String
      ) : Protocol::Request
        input = Types::GetAccessLogSubscriptionRequest.new(access_log_subscription_identifier: access_log_subscription_identifier)
        get_access_log_subscription(input)
      end

      def get_access_log_subscription(input : Types::GetAccessLogSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCESS_LOG_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the auth policy for the specified service or service network.

      def get_auth_policy(
        resource_identifier : String
      ) : Protocol::Request
        input = Types::GetAuthPolicyRequest.new(resource_identifier: resource_identifier)
        get_auth_policy(input)
      end

      def get_auth_policy(input : Types::GetAuthPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTH_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a domain verification.ß

      def get_domain_verification(
        domain_verification_identifier : String
      ) : Protocol::Request
        input = Types::GetDomainVerificationRequest.new(domain_verification_identifier: domain_verification_identifier)
        get_domain_verification(input)
      end

      def get_domain_verification(input : Types::GetDomainVerificationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_VERIFICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified listener for the specified service.

      def get_listener(
        listener_identifier : String,
        service_identifier : String
      ) : Protocol::Request
        input = Types::GetListenerRequest.new(listener_identifier: listener_identifier, service_identifier: service_identifier)
        get_listener(input)
      end

      def get_listener(input : Types::GetListenerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LISTENER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified resource configuration.

      def get_resource_configuration(
        resource_configuration_identifier : String
      ) : Protocol::Request
        input = Types::GetResourceConfigurationRequest.new(resource_configuration_identifier: resource_configuration_identifier)
        get_resource_configuration(input)
      end

      def get_resource_configuration(input : Types::GetResourceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified resource gateway.

      def get_resource_gateway(
        resource_gateway_identifier : String
      ) : Protocol::Request
        input = Types::GetResourceGatewayRequest.new(resource_gateway_identifier: resource_gateway_identifier)
        get_resource_gateway(input)
      end

      def get_resource_gateway(input : Types::GetResourceGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified resource policy. The resource policy is an IAM policy
      # created on behalf of the resource owner when they share a resource.

      def get_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified listener rules. You can also retrieve information about
      # the default listener rule. For more information, see Listener rules in the Amazon VPC Lattice User
      # Guide .

      def get_rule(
        listener_identifier : String,
        rule_identifier : String,
        service_identifier : String
      ) : Protocol::Request
        input = Types::GetRuleRequest.new(listener_identifier: listener_identifier, rule_identifier: rule_identifier, service_identifier: service_identifier)
        get_rule(input)
      end

      def get_rule(input : Types::GetRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified service.

      def get_service(
        service_identifier : String
      ) : Protocol::Request
        input = Types::GetServiceRequest.new(service_identifier: service_identifier)
        get_service(input)
      end

      def get_service(input : Types::GetServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified service network.

      def get_service_network(
        service_network_identifier : String
      ) : Protocol::Request
        input = Types::GetServiceNetworkRequest.new(service_network_identifier: service_network_identifier)
        get_service_network(input)
      end

      def get_service_network(input : Types::GetServiceNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified association between a service network and a resource
      # configuration.

      def get_service_network_resource_association(
        service_network_resource_association_identifier : String
      ) : Protocol::Request
        input = Types::GetServiceNetworkResourceAssociationRequest.new(service_network_resource_association_identifier: service_network_resource_association_identifier)
        get_service_network_resource_association(input)
      end

      def get_service_network_resource_association(input : Types::GetServiceNetworkResourceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_NETWORK_RESOURCE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified association between a service network and a service.

      def get_service_network_service_association(
        service_network_service_association_identifier : String
      ) : Protocol::Request
        input = Types::GetServiceNetworkServiceAssociationRequest.new(service_network_service_association_identifier: service_network_service_association_identifier)
        get_service_network_service_association(input)
      end

      def get_service_network_service_association(input : Types::GetServiceNetworkServiceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_NETWORK_SERVICE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified association between a service network and a VPC.

      def get_service_network_vpc_association(
        service_network_vpc_association_identifier : String
      ) : Protocol::Request
        input = Types::GetServiceNetworkVpcAssociationRequest.new(service_network_vpc_association_identifier: service_network_vpc_association_identifier)
        get_service_network_vpc_association(input)
      end

      def get_service_network_vpc_association(input : Types::GetServiceNetworkVpcAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_NETWORK_VPC_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified target group.

      def get_target_group(
        target_group_identifier : String
      ) : Protocol::Request
        input = Types::GetTargetGroupRequest.new(target_group_identifier: target_group_identifier)
        get_target_group(input)
      end

      def get_target_group(input : Types::GetTargetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TARGET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the access log subscriptions for the specified service network or service.

      def list_access_log_subscriptions(
        resource_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessLogSubscriptionsRequest.new(resource_identifier: resource_identifier, max_results: max_results, next_token: next_token)
        list_access_log_subscriptions(input)
      end

      def list_access_log_subscriptions(input : Types::ListAccessLogSubscriptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_LOG_SUBSCRIPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the domain verifications.

      def list_domain_verifications(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainVerificationsRequest.new(max_results: max_results, next_token: next_token)
        list_domain_verifications(input)
      end

      def list_domain_verifications(input : Types::ListDomainVerificationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_VERIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the listeners for the specified service.

      def list_listeners(
        service_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListListenersRequest.new(service_identifier: service_identifier, max_results: max_results, next_token: next_token)
        list_listeners(input)
      end

      def list_listeners(input : Types::ListListenersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LISTENERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resource configurations owned by or shared with this account.

      def list_resource_configurations(
        domain_verification_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_configuration_group_identifier : String? = nil,
        resource_gateway_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceConfigurationsRequest.new(domain_verification_identifier: domain_verification_identifier, max_results: max_results, next_token: next_token, resource_configuration_group_identifier: resource_configuration_group_identifier, resource_gateway_identifier: resource_gateway_identifier)
        list_resource_configurations(input)
      end

      def list_resource_configurations(input : Types::ListResourceConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the associations for the specified VPC endpoint.

      def list_resource_endpoint_associations(
        resource_configuration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_endpoint_association_identifier : String? = nil,
        vpc_endpoint_id : String? = nil,
        vpc_endpoint_owner : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceEndpointAssociationsRequest.new(resource_configuration_identifier: resource_configuration_identifier, max_results: max_results, next_token: next_token, resource_endpoint_association_identifier: resource_endpoint_association_identifier, vpc_endpoint_id: vpc_endpoint_id, vpc_endpoint_owner: vpc_endpoint_owner)
        list_resource_endpoint_associations(input)
      end

      def list_resource_endpoint_associations(input : Types::ListResourceEndpointAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_ENDPOINT_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resource gateways that you own or that were shared with you.

      def list_resource_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceGatewaysRequest.new(max_results: max_results, next_token: next_token)
        list_resource_gateways(input)
      end

      def list_resource_gateways(input : Types::ListResourceGatewaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the rules for the specified listener.

      def list_rules(
        listener_identifier : String,
        service_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRulesRequest.new(listener_identifier: listener_identifier, service_identifier: service_identifier, max_results: max_results, next_token: next_token)
        list_rules(input)
      end

      def list_rules(input : Types::ListRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the associations between a service network and a resource configuration.

      def list_service_network_resource_associations(
        include_children : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_configuration_identifier : String? = nil,
        service_network_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceNetworkResourceAssociationsRequest.new(include_children: include_children, max_results: max_results, next_token: next_token, resource_configuration_identifier: resource_configuration_identifier, service_network_identifier: service_network_identifier)
        list_service_network_resource_associations(input)
      end

      def list_service_network_resource_associations(input : Types::ListServiceNetworkResourceAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_NETWORK_RESOURCE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the associations between a service network and a service. You can filter the list either by
      # service or service network. You must provide either the service network identifier or the service
      # identifier. Every association in Amazon VPC Lattice has a unique Amazon Resource Name (ARN), such as
      # when a service network is associated with a VPC or when a service is associated with a service
      # network. If the association is for a resource is shared with another account, the association
      # includes the local account ID as the prefix in the ARN.

      def list_service_network_service_associations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_identifier : String? = nil,
        service_network_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceNetworkServiceAssociationsRequest.new(max_results: max_results, next_token: next_token, service_identifier: service_identifier, service_network_identifier: service_network_identifier)
        list_service_network_service_associations(input)
      end

      def list_service_network_service_associations(input : Types::ListServiceNetworkServiceAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_NETWORK_SERVICE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the associations between a service network and a VPC. You can filter the list either by VPC or
      # service network. You must provide either the ID of the service network identifier or the ID of the
      # VPC.

      def list_service_network_vpc_associations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_network_identifier : String? = nil,
        vpc_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceNetworkVpcAssociationsRequest.new(max_results: max_results, next_token: next_token, service_network_identifier: service_network_identifier, vpc_identifier: vpc_identifier)
        list_service_network_vpc_associations(input)
      end

      def list_service_network_vpc_associations(input : Types::ListServiceNetworkVpcAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_NETWORK_VPC_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the associations between a service network and a VPC endpoint.

      def list_service_network_vpc_endpoint_associations(
        service_network_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceNetworkVpcEndpointAssociationsRequest.new(service_network_identifier: service_network_identifier, max_results: max_results, next_token: next_token)
        list_service_network_vpc_endpoint_associations(input)
      end

      def list_service_network_vpc_endpoint_associations(input : Types::ListServiceNetworkVpcEndpointAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_NETWORK_VPC_ENDPOINT_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the service networks owned by or shared with this account. The account ID in the ARN shows
      # which account owns the service network.

      def list_service_networks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceNetworksRequest.new(max_results: max_results, next_token: next_token)
        list_service_networks(input)
      end

      def list_service_networks(input : Types::ListServiceNetworksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_NETWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the services owned by the caller account or shared with the caller account.

      def list_services(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServicesRequest.new(max_results: max_results, next_token: next_token)
        list_services(input)
      end

      def list_services(input : Types::ListServicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.

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

      # Lists your target groups. You can narrow your search by using the filters below in your request.

      def list_target_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        target_group_type : String? = nil,
        vpc_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListTargetGroupsRequest.new(max_results: max_results, next_token: next_token, target_group_type: target_group_type, vpc_identifier: vpc_identifier)
        list_target_groups(input)
      end

      def list_target_groups(input : Types::ListTargetGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TARGET_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the targets for the target group. By default, all targets are included. You can use this API
      # to check the health status of targets. You can also ﬁlter the results by target.

      def list_targets(
        target_group_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        targets : Array(Types::Target)? = nil
      ) : Protocol::Request
        input = Types::ListTargetsRequest.new(target_group_identifier: target_group_identifier, max_results: max_results, next_token: next_token, targets: targets)
        list_targets(input)
      end

      def list_targets(input : Types::ListTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates the auth policy. The policy string in JSON must not contain newlines or blank
      # lines. For more information, see Auth policies in the Amazon VPC Lattice User Guide .

      def put_auth_policy(
        policy : String,
        resource_identifier : String
      ) : Protocol::Request
        input = Types::PutAuthPolicyRequest.new(policy: policy, resource_identifier: resource_identifier)
        put_auth_policy(input)
      end

      def put_auth_policy(input : Types::PutAuthPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_AUTH_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a resource-based permission policy to a service or service network. The policy must contain
      # the same actions and condition statements as the Amazon Web Services Resource Access Manager
      # permission for sharing services and service networks.

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers the targets with the target group. If it's a Lambda target, you can only have one target
      # in a target group.

      def register_targets(
        target_group_identifier : String,
        targets : Array(Types::Target)
      ) : Protocol::Request
        input = Types::RegisterTargetsRequest.new(target_group_identifier: target_group_identifier, targets: targets)
        register_targets(input)
      end

      def register_targets(input : Types::RegisterTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the domain verification process for a custom domain name.

      def start_domain_verification(
        domain_name : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartDomainVerificationRequest.new(domain_name: domain_name, client_token: client_token, tags: tags)
        start_domain_verification(input)
      end

      def start_domain_verification(input : Types::StartDomainVerificationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DOMAIN_VERIFICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the specified resource.

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

      # Removes the specified tags from the specified resource.

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

      # Updates the specified access log subscription.

      def update_access_log_subscription(
        access_log_subscription_identifier : String,
        destination_arn : String
      ) : Protocol::Request
        input = Types::UpdateAccessLogSubscriptionRequest.new(access_log_subscription_identifier: access_log_subscription_identifier, destination_arn: destination_arn)
        update_access_log_subscription(input)
      end

      def update_access_log_subscription(input : Types::UpdateAccessLogSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCESS_LOG_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified listener for the specified service.

      def update_listener(
        default_action : Types::RuleAction,
        listener_identifier : String,
        service_identifier : String
      ) : Protocol::Request
        input = Types::UpdateListenerRequest.new(default_action: default_action, listener_identifier: listener_identifier, service_identifier: service_identifier)
        update_listener(input)
      end

      def update_listener(input : Types::UpdateListenerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LISTENER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified resource configuration.

      def update_resource_configuration(
        resource_configuration_identifier : String,
        allow_association_to_shareable_service_network : Bool? = nil,
        port_ranges : Array(String)? = nil,
        resource_configuration_definition : Types::ResourceConfigurationDefinition? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceConfigurationRequest.new(resource_configuration_identifier: resource_configuration_identifier, allow_association_to_shareable_service_network: allow_association_to_shareable_service_network, port_ranges: port_ranges, resource_configuration_definition: resource_configuration_definition)
        update_resource_configuration(input)
      end

      def update_resource_configuration(input : Types::UpdateResourceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified resource gateway.

      def update_resource_gateway(
        resource_gateway_identifier : String,
        security_group_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceGatewayRequest.new(resource_gateway_identifier: resource_gateway_identifier, security_group_ids: security_group_ids)
        update_resource_gateway(input)
      end

      def update_resource_gateway(input : Types::UpdateResourceGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a specified rule for the listener. You can't modify a default listener rule. To modify a
      # default listener rule, use UpdateListener .

      def update_rule(
        listener_identifier : String,
        rule_identifier : String,
        service_identifier : String,
        action : Types::RuleAction? = nil,
        match : Types::RuleMatch? = nil,
        priority : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateRuleRequest.new(listener_identifier: listener_identifier, rule_identifier: rule_identifier, service_identifier: service_identifier, action: action, match: match, priority: priority)
        update_rule(input)
      end

      def update_rule(input : Types::UpdateRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified service.

      def update_service(
        service_identifier : String,
        auth_type : String? = nil,
        certificate_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateServiceRequest.new(service_identifier: service_identifier, auth_type: auth_type, certificate_arn: certificate_arn)
        update_service(input)
      end

      def update_service(input : Types::UpdateServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified service network.

      def update_service_network(
        auth_type : String,
        service_network_identifier : String
      ) : Protocol::Request
        input = Types::UpdateServiceNetworkRequest.new(auth_type: auth_type, service_network_identifier: service_network_identifier)
        update_service_network(input)
      end

      def update_service_network(input : Types::UpdateServiceNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the service network and VPC association. If you add a security group to the service network
      # and VPC association, the association must continue to have at least one security group. You can add
      # or edit security groups at any time. However, to remove all security groups, you must first delete
      # the association and then recreate it without security groups.

      def update_service_network_vpc_association(
        security_group_ids : Array(String),
        service_network_vpc_association_identifier : String
      ) : Protocol::Request
        input = Types::UpdateServiceNetworkVpcAssociationRequest.new(security_group_ids: security_group_ids, service_network_vpc_association_identifier: service_network_vpc_association_identifier)
        update_service_network_vpc_association(input)
      end

      def update_service_network_vpc_association(input : Types::UpdateServiceNetworkVpcAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE_NETWORK_VPC_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified target group.

      def update_target_group(
        health_check : Types::HealthCheckConfig,
        target_group_identifier : String
      ) : Protocol::Request
        input = Types::UpdateTargetGroupRequest.new(health_check: health_check, target_group_identifier: target_group_identifier)
        update_target_group(input)
      end

      def update_target_group(input : Types::UpdateTargetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TARGET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
