module Aws
  module Evs
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associates an Elastic IP address with a public HCX VLAN. This operation is only allowed for public
      # HCX VLANs at this time.

      def associate_eip_to_vlan(
        allocation_id : String,
        environment_id : String,
        vlan_name : String,
        client_token : String? = nil
      ) : Types::AssociateEipToVlanResponse

        input = Types::AssociateEipToVlanRequest.new(allocation_id: allocation_id, environment_id: environment_id, vlan_name: vlan_name, client_token: client_token)
        associate_eip_to_vlan(input)
      end

      def associate_eip_to_vlan(input : Types::AssociateEipToVlanRequest) : Types::AssociateEipToVlanResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_EIP_TO_VLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateEipToVlanResponse, "AssociateEipToVlan")
      end

      # Creates an Amazon EVS environment that runs VCF software, such as SDDC Manager, NSX Manager, and
      # vCenter Server. During environment creation, Amazon EVS performs validations on DNS settings,
      # provisions VLAN subnets and hosts, and deploys the supplied version of VCF. It can take several
      # hours to create an environment. After the deployment completes, you can configure VCF in the vSphere
      # user interface according to your needs. When creating a new environment, the default ESX version for
      # the selected VCF version will be used, you cannot choose a specific ESX version in CreateEnvironment
      # action. When a host has been added with a specific ESX version, it can only be upgraded using
      # vCenter Lifecycle Manager. You cannot use the dedicatedHostId and placementGroupId parameters
      # together in the same CreateEnvironment action. This results in a ValidationException response.

      def create_environment(
        connectivity_info : Types::ConnectivityInfo,
        hosts : Array(Types::HostInfoForCreate),
        initial_vlans : Types::InitialVlans,
        license_info : Array(Types::LicenseInfo),
        service_access_subnet_id : String,
        site_id : String,
        terms_accepted : Bool,
        vcf_hostnames : Types::VcfHostnames,
        vcf_version : String,
        vpc_id : String,
        client_token : String? = nil,
        environment_name : String? = nil,
        kms_key_id : String? = nil,
        service_access_security_groups : Types::ServiceAccessSecurityGroups? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateEnvironmentResponse

        input = Types::CreateEnvironmentRequest.new(connectivity_info: connectivity_info, hosts: hosts, initial_vlans: initial_vlans, license_info: license_info, service_access_subnet_id: service_access_subnet_id, site_id: site_id, terms_accepted: terms_accepted, vcf_hostnames: vcf_hostnames, vcf_version: vcf_version, vpc_id: vpc_id, client_token: client_token, environment_name: environment_name, kms_key_id: kms_key_id, service_access_security_groups: service_access_security_groups, tags: tags)
        create_environment(input)
      end

      def create_environment(input : Types::CreateEnvironmentRequest) : Types::CreateEnvironmentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentResponse, "CreateEnvironment")
      end

      # Creates an ESX host and adds it to an Amazon EVS environment. Amazon EVS supports 4-16 hosts per
      # environment. This action can only be used after the Amazon EVS environment is deployed. You can use
      # the dedicatedHostId parameter to specify an Amazon EC2 Dedicated Host for ESX host creation. You can
      # use the placementGroupId parameter to specify a cluster or partition placement group to launch EC2
      # instances into. If you don't specify an ESX version when adding hosts using CreateEnvironmentHost
      # action, Amazon EVS automatically uses the default ESX version associated with your environment's VCF
      # version. To find the default ESX version for a particular VCF version, use the GetVersions action.
      # You cannot use the dedicatedHostId and placementGroupId parameters together in the same
      # CreateEnvironmentHost action. This results in a ValidationException response.

      def create_environment_host(
        environment_id : String,
        host : Types::HostInfoForCreate,
        client_token : String? = nil,
        esx_version : String? = nil
      ) : Types::CreateEnvironmentHostResponse

        input = Types::CreateEnvironmentHostRequest.new(environment_id: environment_id, host: host, client_token: client_token, esx_version: esx_version)
        create_environment_host(input)
      end

      def create_environment_host(input : Types::CreateEnvironmentHostRequest) : Types::CreateEnvironmentHostResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT_HOST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentHostResponse, "CreateEnvironmentHost")
      end

      # Deletes an Amazon EVS environment. Amazon EVS environments will only be enabled for deletion once
      # the hosts are deleted. You can delete hosts using the DeleteEnvironmentHost action. Environment
      # deletion also deletes the associated Amazon EVS VLAN subnets and Amazon Web Services Secrets Manager
      # secrets that Amazon EVS created. Amazon Web Services resources that you create are not deleted.
      # These resources may continue to incur costs.

      def delete_environment(
        environment_id : String,
        client_token : String? = nil
      ) : Types::DeleteEnvironmentResponse

        input = Types::DeleteEnvironmentRequest.new(environment_id: environment_id, client_token: client_token)
        delete_environment(input)
      end

      def delete_environment(input : Types::DeleteEnvironmentRequest) : Types::DeleteEnvironmentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentResponse, "DeleteEnvironment")
      end

      # Deletes a host from an Amazon EVS environment. Before deleting a host, you must unassign and
      # decommission the host from within the SDDC Manager user interface. Not doing so could impact the
      # availability of your virtual machines or result in data loss.

      def delete_environment_host(
        environment_id : String,
        host_name : String,
        client_token : String? = nil
      ) : Types::DeleteEnvironmentHostResponse

        input = Types::DeleteEnvironmentHostRequest.new(environment_id: environment_id, host_name: host_name, client_token: client_token)
        delete_environment_host(input)
      end

      def delete_environment_host(input : Types::DeleteEnvironmentHostRequest) : Types::DeleteEnvironmentHostResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT_HOST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentHostResponse, "DeleteEnvironmentHost")
      end

      # Disassociates an Elastic IP address from a public HCX VLAN. This operation is only allowed for
      # public HCX VLANs at this time.

      def disassociate_eip_from_vlan(
        association_id : String,
        environment_id : String,
        vlan_name : String,
        client_token : String? = nil
      ) : Types::DisassociateEipFromVlanResponse

        input = Types::DisassociateEipFromVlanRequest.new(association_id: association_id, environment_id: environment_id, vlan_name: vlan_name, client_token: client_token)
        disassociate_eip_from_vlan(input)
      end

      def disassociate_eip_from_vlan(input : Types::DisassociateEipFromVlanRequest) : Types::DisassociateEipFromVlanResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_EIP_FROM_VLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateEipFromVlanResponse, "DisassociateEipFromVlan")
      end

      # Returns a description of the specified environment.

      def get_environment(
        environment_id : String
      ) : Types::GetEnvironmentResponse

        input = Types::GetEnvironmentRequest.new(environment_id: environment_id)
        get_environment(input)
      end

      def get_environment(input : Types::GetEnvironmentRequest) : Types::GetEnvironmentResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnvironmentResponse, "GetEnvironment")
      end

      # Returns information about VCF versions, ESX versions and EC2 instance types provided by Amazon EVS.
      # For each VCF version, the response also includes the default ESX version and provided EC2 instance
      # types.

      def get_versions : Types::GetVersionsResponse
        input = Types::GetVersionsRequest.new
        get_versions(input)
      end

      def get_versions(input : Types::GetVersionsRequest) : Types::GetVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVersionsResponse, "GetVersions")
      end

      # List the hosts within an environment.

      def list_environment_hosts(
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEnvironmentHostsResponse

        input = Types::ListEnvironmentHostsRequest.new(environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_environment_hosts(input)
      end

      def list_environment_hosts(input : Types::ListEnvironmentHostsRequest) : Types::ListEnvironmentHostsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENT_HOSTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentHostsResponse, "ListEnvironmentHosts")
      end

      # Lists environment VLANs that are associated with the specified environment.

      def list_environment_vlans(
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEnvironmentVlansResponse

        input = Types::ListEnvironmentVlansRequest.new(environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_environment_vlans(input)
      end

      def list_environment_vlans(input : Types::ListEnvironmentVlansRequest) : Types::ListEnvironmentVlansResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENT_VLANS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentVlansResponse, "ListEnvironmentVlans")
      end

      # Lists the Amazon EVS environments in your Amazon Web Services account in the specified Amazon Web
      # Services Region.

      def list_environments(
        max_results : Int32? = nil,
        next_token : String? = nil,
        state : Array(String)? = nil
      ) : Types::ListEnvironmentsResponse

        input = Types::ListEnvironmentsRequest.new(max_results: max_results, next_token: next_token, state: state)
        list_environments(input)
      end

      def list_environments(input : Types::ListEnvironmentsRequest) : Types::ListEnvironmentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentsResponse, "ListEnvironments")
      end

      # Lists the tags for an Amazon EVS resource.

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

      # Associates the specified tags to an Amazon EVS resource with the specified resourceArn . If existing
      # tags on a resource are not specified in the request parameters, they aren't changed. When a resource
      # is deleted, the tags associated with that resource are also deleted. Tags that you create for Amazon
      # EVS resources don't propagate to any other resources associated with the environment. For example,
      # if you tag an environment with this operation, that tag doesn't automatically propagate to the VLAN
      # subnets and hosts associated with the environment.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
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

      # Deletes specified tags from an Amazon EVS resource.

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
    end
  end
end
