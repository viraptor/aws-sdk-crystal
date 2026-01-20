module Aws
  module Tnb
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

      # Cancels a network operation. A network operation is any operation that is done to your network, such
      # as network instance instantiation or termination.

      def cancel_sol_network_operation(
        ns_lcm_op_occ_id : String
      ) : Protocol::Request
        input = Types::CancelSolNetworkOperationInput.new(ns_lcm_op_occ_id: ns_lcm_op_occ_id)
        cancel_sol_network_operation(input)
      end

      def cancel_sol_network_operation(input : Types::CancelSolNetworkOperationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_SOL_NETWORK_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a function package. A function package is a .zip file in CSAR (Cloud Service Archive) format
      # that contains a network function (an ETSI standard telecommunication application) and function
      # package descriptor that uses the TOSCA standard to describe how the network functions should run on
      # your network. For more information, see Function packages in the Amazon Web Services Telco Network
      # Builder User Guide . Creating a function package is the first step for creating a network in AWS
      # TNB. This request creates an empty container with an ID. The next step is to upload the actual CSAR
      # zip file into that empty container. To upload function package content, see
      # PutSolFunctionPackageContent .

      def create_sol_function_package(
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSolFunctionPackageInput.new(tags: tags)
        create_sol_function_package(input)
      end

      def create_sol_function_package(input : Types::CreateSolFunctionPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOL_FUNCTION_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a network instance. A network instance is a single network created in Amazon Web Services
      # TNB that can be deployed and on which life-cycle operations (like terminate, update, and delete) can
      # be performed. Creating a network instance is the third step after creating a network package. For
      # more information about network instances, Network instances in the Amazon Web Services Telco Network
      # Builder User Guide . Once you create a network instance, you can instantiate it. To instantiate a
      # network, see InstantiateSolNetworkInstance .

      def create_sol_network_instance(
        ns_name : String,
        nsd_info_id : String,
        ns_description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSolNetworkInstanceInput.new(ns_name: ns_name, nsd_info_id: nsd_info_id, ns_description: ns_description, tags: tags)
        create_sol_network_instance(input)
      end

      def create_sol_network_instance(input : Types::CreateSolNetworkInstanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOL_NETWORK_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a network package. A network package is a .zip file in CSAR (Cloud Service Archive) format
      # defines the function packages you want to deploy and the Amazon Web Services infrastructure you want
      # to deploy them on. For more information, see Network instances in the Amazon Web Services Telco
      # Network Builder User Guide . A network package consists of a network service descriptor (NSD) file
      # (required) and any additional files (optional), such as scripts specific to your needs. For example,
      # if you have multiple function packages in your network package, you can use the NSD to define which
      # network functions should run in certain VPCs, subnets, or EKS clusters. This request creates an
      # empty network package container with an ID. Once you create a network package, you can upload the
      # network package content using PutSolNetworkPackageContent .

      def create_sol_network_package(
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSolNetworkPackageInput.new(tags: tags)
        create_sol_network_package(input)
      end

      def create_sol_network_package(input : Types::CreateSolNetworkPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SOL_NETWORK_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a function package. A function package is a .zip file in CSAR (Cloud Service Archive) format
      # that contains a network function (an ETSI standard telecommunication application) and function
      # package descriptor that uses the TOSCA standard to describe how the network functions should run on
      # your network. To delete a function package, the package must be in a disabled state. To disable a
      # function package, see UpdateSolFunctionPackage .

      def delete_sol_function_package(
        vnf_pkg_id : String
      ) : Protocol::Request
        input = Types::DeleteSolFunctionPackageInput.new(vnf_pkg_id: vnf_pkg_id)
        delete_sol_function_package(input)
      end

      def delete_sol_function_package(input : Types::DeleteSolFunctionPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOL_FUNCTION_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a network instance. A network instance is a single network created in Amazon Web Services
      # TNB that can be deployed and on which life-cycle operations (like terminate, update, and delete) can
      # be performed. To delete a network instance, the instance must be in a stopped or terminated state.
      # To terminate a network instance, see TerminateSolNetworkInstance .

      def delete_sol_network_instance(
        ns_instance_id : String
      ) : Protocol::Request
        input = Types::DeleteSolNetworkInstanceInput.new(ns_instance_id: ns_instance_id)
        delete_sol_network_instance(input)
      end

      def delete_sol_network_instance(input : Types::DeleteSolNetworkInstanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOL_NETWORK_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes network package. A network package is a .zip file in CSAR (Cloud Service Archive) format
      # defines the function packages you want to deploy and the Amazon Web Services infrastructure you want
      # to deploy them on. To delete a network package, the package must be in a disable state. To disable a
      # network package, see UpdateSolNetworkPackage .

      def delete_sol_network_package(
        nsd_info_id : String
      ) : Protocol::Request
        input = Types::DeleteSolNetworkPackageInput.new(nsd_info_id: nsd_info_id)
        delete_sol_network_package(input)
      end

      def delete_sol_network_package(input : Types::DeleteSolNetworkPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SOL_NETWORK_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a network function instance, including the instantiation state and metadata from
      # the function package descriptor in the network function package. A network function instance is a
      # function in a function package .

      def get_sol_function_instance(
        vnf_instance_id : String
      ) : Protocol::Request
        input = Types::GetSolFunctionInstanceInput.new(vnf_instance_id: vnf_instance_id)
        get_sol_function_instance(input)
      end

      def get_sol_function_instance(input : Types::GetSolFunctionInstanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_FUNCTION_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of an individual function package, such as the operational state and whether the
      # package is in use. A function package is a .zip file in CSAR (Cloud Service Archive) format that
      # contains a network function (an ETSI standard telecommunication application) and function package
      # descriptor that uses the TOSCA standard to describe how the network functions should run on your
      # network..

      def get_sol_function_package(
        vnf_pkg_id : String
      ) : Protocol::Request
        input = Types::GetSolFunctionPackageInput.new(vnf_pkg_id: vnf_pkg_id)
        get_sol_function_package(input)
      end

      def get_sol_function_package(input : Types::GetSolFunctionPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_FUNCTION_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the contents of a function package. A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.

      def get_sol_function_package_content(
        accept : String,
        vnf_pkg_id : String
      ) : Protocol::Request
        input = Types::GetSolFunctionPackageContentInput.new(accept: accept, vnf_pkg_id: vnf_pkg_id)
        get_sol_function_package_content(input)
      end

      def get_sol_function_package_content(input : Types::GetSolFunctionPackageContentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_FUNCTION_PACKAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a function package descriptor in a function package. A function package descriptor is a .yaml
      # file in a function package that uses the TOSCA standard to describe how the network function in the
      # function package should run on your network. A function package is a .zip file in CSAR (Cloud
      # Service Archive) format that contains a network function (an ETSI standard telecommunication
      # application) and function package descriptor that uses the TOSCA standard to describe how the
      # network functions should run on your network.

      def get_sol_function_package_descriptor(
        accept : String,
        vnf_pkg_id : String
      ) : Protocol::Request
        input = Types::GetSolFunctionPackageDescriptorInput.new(accept: accept, vnf_pkg_id: vnf_pkg_id)
        get_sol_function_package_descriptor(input)
      end

      def get_sol_function_package_descriptor(input : Types::GetSolFunctionPackageDescriptorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_FUNCTION_PACKAGE_DESCRIPTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of the network instance. A network instance is a single network created in Amazon
      # Web Services TNB that can be deployed and on which life-cycle operations (like terminate, update,
      # and delete) can be performed.

      def get_sol_network_instance(
        ns_instance_id : String
      ) : Protocol::Request
        input = Types::GetSolNetworkInstanceInput.new(ns_instance_id: ns_instance_id)
        get_sol_network_instance(input)
      end

      def get_sol_network_instance(input : Types::GetSolNetworkInstanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_NETWORK_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a network operation, including the tasks involved in the network operation and
      # the status of the tasks. A network operation is any operation that is done to your network, such as
      # network instance instantiation or termination.

      def get_sol_network_operation(
        ns_lcm_op_occ_id : String
      ) : Protocol::Request
        input = Types::GetSolNetworkOperationInput.new(ns_lcm_op_occ_id: ns_lcm_op_occ_id)
        get_sol_network_operation(input)
      end

      def get_sol_network_operation(input : Types::GetSolNetworkOperationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_NETWORK_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a network package. A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.

      def get_sol_network_package(
        nsd_info_id : String
      ) : Protocol::Request
        input = Types::GetSolNetworkPackageInput.new(nsd_info_id: nsd_info_id)
        get_sol_network_package(input)
      end

      def get_sol_network_package(input : Types::GetSolNetworkPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_NETWORK_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the contents of a network package. A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.

      def get_sol_network_package_content(
        accept : String,
        nsd_info_id : String
      ) : Protocol::Request
        input = Types::GetSolNetworkPackageContentInput.new(accept: accept, nsd_info_id: nsd_info_id)
        get_sol_network_package_content(input)
      end

      def get_sol_network_package_content(input : Types::GetSolNetworkPackageContentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_NETWORK_PACKAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the content of the network service descriptor. A network service descriptor is a .yaml file in
      # a network package that uses the TOSCA standard to describe the network functions you want to deploy
      # and the Amazon Web Services infrastructure you want to deploy the network functions on.

      def get_sol_network_package_descriptor(
        nsd_info_id : String
      ) : Protocol::Request
        input = Types::GetSolNetworkPackageDescriptorInput.new(nsd_info_id: nsd_info_id)
        get_sol_network_package_descriptor(input)
      end

      def get_sol_network_package_descriptor(input : Types::GetSolNetworkPackageDescriptorInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOL_NETWORK_PACKAGE_DESCRIPTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Instantiates a network instance. A network instance is a single network created in Amazon Web
      # Services TNB that can be deployed and on which life-cycle operations (like terminate, update, and
      # delete) can be performed. Before you can instantiate a network instance, you have to create a
      # network instance. For more information, see CreateSolNetworkInstance .

      def instantiate_sol_network_instance(
        ns_instance_id : String,
        additional_params_for_ns : Types::Document? = nil,
        dry_run : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::InstantiateSolNetworkInstanceInput.new(ns_instance_id: ns_instance_id, additional_params_for_ns: additional_params_for_ns, dry_run: dry_run, tags: tags)
        instantiate_sol_network_instance(input)
      end

      def instantiate_sol_network_instance(input : Types::InstantiateSolNetworkInstanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INSTANTIATE_SOL_NETWORK_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists network function instances. A network function instance is a function in a function package .

      def list_sol_function_instances(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSolFunctionInstancesInput.new(max_results: max_results, next_token: next_token)
        list_sol_function_instances(input)
      end

      def list_sol_function_instances(input : Types::ListSolFunctionInstancesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOL_FUNCTION_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about function packages. A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.

      def list_sol_function_packages(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSolFunctionPackagesInput.new(max_results: max_results, next_token: next_token)
        list_sol_function_packages(input)
      end

      def list_sol_function_packages(input : Types::ListSolFunctionPackagesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOL_FUNCTION_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your network instances. A network instance is a single network created in Amazon Web Services
      # TNB that can be deployed and on which life-cycle operations (like terminate, update, and delete) can
      # be performed.

      def list_sol_network_instances(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSolNetworkInstancesInput.new(max_results: max_results, next_token: next_token)
        list_sol_network_instances(input)
      end

      def list_sol_network_instances(input : Types::ListSolNetworkInstancesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOL_NETWORK_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists details for a network operation, including when the operation started and the status of the
      # operation. A network operation is any operation that is done to your network, such as network
      # instance instantiation or termination.

      def list_sol_network_operations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        ns_instance_id : String? = nil
      ) : Protocol::Request
        input = Types::ListSolNetworkOperationsInput.new(max_results: max_results, next_token: next_token, ns_instance_id: ns_instance_id)
        list_sol_network_operations(input)
      end

      def list_sol_network_operations(input : Types::ListSolNetworkOperationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOL_NETWORK_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists network packages. A network package is a .zip file in CSAR (Cloud Service Archive) format
      # defines the function packages you want to deploy and the Amazon Web Services infrastructure you want
      # to deploy them on.

      def list_sol_network_packages(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSolNetworkPackagesInput.new(max_results: max_results, next_token: next_token)
        list_sol_network_packages(input)
      end

      def list_sol_network_packages(input : Types::ListSolNetworkPackagesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOL_NETWORK_PACKAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tags for AWS TNB resources.

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

      # Uploads the contents of a function package. A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.

      def put_sol_function_package_content(
        file : Bytes,
        vnf_pkg_id : String,
        content_type : String? = nil
      ) : Protocol::Request
        input = Types::PutSolFunctionPackageContentInput.new(file: file, vnf_pkg_id: vnf_pkg_id, content_type: content_type)
        put_sol_function_package_content(input)
      end

      def put_sol_function_package_content(input : Types::PutSolFunctionPackageContentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SOL_FUNCTION_PACKAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads the contents of a network package. A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.

      def put_sol_network_package_content(
        file : Bytes,
        nsd_info_id : String,
        content_type : String? = nil
      ) : Protocol::Request
        input = Types::PutSolNetworkPackageContentInput.new(file: file, nsd_info_id: nsd_info_id, content_type: content_type)
        put_sol_network_package_content(input)
      end

      def put_sol_network_package_content(input : Types::PutSolNetworkPackageContentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SOL_NETWORK_PACKAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags an AWS TNB resource. A tag is a label that you assign to an Amazon Web Services resource. Each
      # tag consists of a key and an optional value. You can use tags to search and filter your resources or
      # track your Amazon Web Services costs.

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

      # Terminates a network instance. A network instance is a single network created in Amazon Web Services
      # TNB that can be deployed and on which life-cycle operations (like terminate, update, and delete) can
      # be performed. You must terminate a network instance before you can delete it.

      def terminate_sol_network_instance(
        ns_instance_id : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TerminateSolNetworkInstanceInput.new(ns_instance_id: ns_instance_id, tags: tags)
        terminate_sol_network_instance(input)
      end

      def terminate_sol_network_instance(input : Types::TerminateSolNetworkInstanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TERMINATE_SOL_NETWORK_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Untags an AWS TNB resource. A tag is a label that you assign to an Amazon Web Services resource.
      # Each tag consists of a key and an optional value. You can use tags to search and filter your
      # resources or track your Amazon Web Services costs.

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

      # Updates the operational state of function package. A function package is a .zip file in CSAR (Cloud
      # Service Archive) format that contains a network function (an ETSI standard telecommunication
      # application) and function package descriptor that uses the TOSCA standard to describe how the
      # network functions should run on your network.

      def update_sol_function_package(
        operational_state : String,
        vnf_pkg_id : String
      ) : Protocol::Request
        input = Types::UpdateSolFunctionPackageInput.new(operational_state: operational_state, vnf_pkg_id: vnf_pkg_id)
        update_sol_function_package(input)
      end

      def update_sol_function_package(input : Types::UpdateSolFunctionPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOL_FUNCTION_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a network instance. A network instance is a single network created in Amazon Web Services TNB
      # that can be deployed and on which life-cycle operations (like terminate, update, and delete) can be
      # performed. Choose the updateType parameter to target the necessary update of the network instance.

      def update_sol_network_instance(
        ns_instance_id : String,
        update_type : String,
        modify_vnf_info_data : Types::UpdateSolNetworkModify? = nil,
        tags : Hash(String, String)? = nil,
        update_ns : Types::UpdateSolNetworkServiceData? = nil
      ) : Protocol::Request
        input = Types::UpdateSolNetworkInstanceInput.new(ns_instance_id: ns_instance_id, update_type: update_type, modify_vnf_info_data: modify_vnf_info_data, tags: tags, update_ns: update_ns)
        update_sol_network_instance(input)
      end

      def update_sol_network_instance(input : Types::UpdateSolNetworkInstanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOL_NETWORK_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the operational state of a network package. A network package is a .zip file in CSAR (Cloud
      # Service Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on. A network service descriptor is a .yaml file in a network
      # package that uses the TOSCA standard to describe the network functions you want to deploy and the
      # Amazon Web Services infrastructure you want to deploy the network functions on.

      def update_sol_network_package(
        nsd_info_id : String,
        nsd_operational_state : String
      ) : Protocol::Request
        input = Types::UpdateSolNetworkPackageInput.new(nsd_info_id: nsd_info_id, nsd_operational_state: nsd_operational_state)
        update_sol_network_package(input)
      end

      def update_sol_network_package(input : Types::UpdateSolNetworkPackageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOL_NETWORK_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Validates function package content. This can be used as a dry run before uploading function package
      # content with PutSolFunctionPackageContent . A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.

      def validate_sol_function_package_content(
        file : Bytes,
        vnf_pkg_id : String,
        content_type : String? = nil
      ) : Protocol::Request
        input = Types::ValidateSolFunctionPackageContentInput.new(file: file, vnf_pkg_id: vnf_pkg_id, content_type: content_type)
        validate_sol_function_package_content(input)
      end

      def validate_sol_function_package_content(input : Types::ValidateSolFunctionPackageContentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_SOL_FUNCTION_PACKAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Validates network package content. This can be used as a dry run before uploading network package
      # content with PutSolNetworkPackageContent . A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.

      def validate_sol_network_package_content(
        file : Bytes,
        nsd_info_id : String,
        content_type : String? = nil
      ) : Protocol::Request
        input = Types::ValidateSolNetworkPackageContentInput.new(file: file, nsd_info_id: nsd_info_id, content_type: content_type)
        validate_sol_network_package_content(input)
      end

      def validate_sol_network_package_content(input : Types::ValidateSolNetworkPackageContentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_SOL_NETWORK_PACKAGE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
