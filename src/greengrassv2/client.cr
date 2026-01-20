module Aws
  module GreengrassV2
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

      # Associates a Greengrass service role with IoT Greengrass for your Amazon Web Services account in
      # this Amazon Web Services Region. IoT Greengrass uses this role to verify the identity of client
      # devices and manage core device connectivity information. The role must include the
      # AWSGreengrassResourceAccessRolePolicy managed policy or a custom policy that defines equivalent
      # permissions for the IoT Greengrass features that you use. For more information, see Greengrass
      # service role in the IoT Greengrass Version 2 Developer Guide .

      def associate_service_role_to_account(
        role_arn : String
      ) : Protocol::Request
        input = Types::AssociateServiceRoleToAccountRequest.new(role_arn: role_arn)
        associate_service_role_to_account(input)
      end

      def associate_service_role_to_account(input : Types::AssociateServiceRoleToAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SERVICE_ROLE_TO_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a list of client devices with a core device. Use this API operation to specify which
      # client devices can discover a core device through cloud discovery. With cloud discovery, client
      # devices connect to IoT Greengrass to retrieve associated core devices' connectivity information and
      # certificates. For more information, see Configure cloud discovery in the IoT Greengrass V2 Developer
      # Guide . Client devices are local IoT devices that connect to and communicate with an IoT Greengrass
      # core device over MQTT. You can connect client devices to a core device to sync MQTT messages and
      # data to Amazon Web Services IoT Core and interact with client devices in Greengrass components. For
      # more information, see Interact with local IoT devices in the IoT Greengrass V2 Developer Guide .

      def batch_associate_client_device_with_core_device(
        core_device_thing_name : String,
        entries : Array(Types::AssociateClientDeviceWithCoreDeviceEntry)? = nil
      ) : Protocol::Request
        input = Types::BatchAssociateClientDeviceWithCoreDeviceRequest.new(core_device_thing_name: core_device_thing_name, entries: entries)
        batch_associate_client_device_with_core_device(input)
      end

      def batch_associate_client_device_with_core_device(input : Types::BatchAssociateClientDeviceWithCoreDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ASSOCIATE_CLIENT_DEVICE_WITH_CORE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a list of client devices from a core device. After you disassociate a client device
      # from a core device, the client device won't be able to use cloud discovery to retrieve the core
      # device's connectivity information and certificates.

      def batch_disassociate_client_device_from_core_device(
        core_device_thing_name : String,
        entries : Array(Types::DisassociateClientDeviceFromCoreDeviceEntry)? = nil
      ) : Protocol::Request
        input = Types::BatchDisassociateClientDeviceFromCoreDeviceRequest.new(core_device_thing_name: core_device_thing_name, entries: entries)
        batch_disassociate_client_device_from_core_device(input)
      end

      def batch_disassociate_client_device_from_core_device(input : Types::BatchDisassociateClientDeviceFromCoreDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISASSOCIATE_CLIENT_DEVICE_FROM_CORE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a deployment. This operation cancels the deployment for devices that haven't yet received
      # it. If a device already received the deployment, this operation doesn't change anything for that
      # device.

      def cancel_deployment(
        deployment_id : String
      ) : Protocol::Request
        input = Types::CancelDeploymentRequest.new(deployment_id: deployment_id)
        cancel_deployment(input)
      end

      def cancel_deployment(input : Types::CancelDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a component. Components are software that run on Greengrass core devices. After you develop
      # and test a component on your core device, you can use this operation to upload your component to IoT
      # Greengrass. Then, you can deploy the component to other core devices. You can use this operation to
      # do the following: Create components from recipes Create a component from a recipe, which is a file
      # that defines the component's metadata, parameters, dependencies, lifecycle, artifacts, and platform
      # capability. For more information, see IoT Greengrass component recipe reference in the IoT
      # Greengrass V2 Developer Guide . To create a component from a recipe, specify inlineRecipe when you
      # call this operation. Create components from Lambda functions Create a component from an Lambda
      # function that runs on IoT Greengrass. This creates a recipe and artifacts from the Lambda function's
      # deployment package. You can use this operation to migrate Lambda functions from IoT Greengrass V1 to
      # IoT Greengrass V2. This function accepts Lambda functions in all supported versions of Python,
      # Node.js, and Java runtimes. IoT Greengrass doesn't apply any additional restrictions on deprecated
      # Lambda runtime versions. To create a component from a Lambda function, specify lambdaFunction when
      # you call this operation. IoT Greengrass currently supports Lambda functions on only Linux core
      # devices.

      def create_component_version(
        client_token : String? = nil,
        inline_recipe : Bytes? = nil,
        lambda_function : Types::LambdaFunctionRecipeSource? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateComponentVersionRequest.new(client_token: client_token, inline_recipe: inline_recipe, lambda_function: lambda_function, tags: tags)
        create_component_version(input)
      end

      def create_component_version(input : Types::CreateComponentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMPONENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a continuous deployment for a target, which is a Greengrass core device or group of core
      # devices. When you add a new core device to a group of core devices that has a deployment, IoT
      # Greengrass deploys that group's deployment to the new device. You can define one deployment for each
      # target. When you create a new deployment for a target that has an existing deployment, you replace
      # the previous deployment. IoT Greengrass applies the new deployment to the target devices. Every
      # deployment has a revision number that indicates how many deployment revisions you define for a
      # target. Use this operation to create a new revision of an existing deployment. For more information,
      # see the Create deployments in the IoT Greengrass V2 Developer Guide .

      def create_deployment(
        target_arn : String,
        client_token : String? = nil,
        components : Hash(String, Types::ComponentDeploymentSpecification)? = nil,
        deployment_name : String? = nil,
        deployment_policies : Types::DeploymentPolicies? = nil,
        iot_job_configuration : Types::DeploymentIoTJobConfiguration? = nil,
        parent_target_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentRequest.new(target_arn: target_arn, client_token: client_token, components: components, deployment_name: deployment_name, deployment_policies: deployment_policies, iot_job_configuration: iot_job_configuration, parent_target_arn: parent_target_arn, tags: tags)
        create_deployment(input)
      end

      def create_deployment(input : Types::CreateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a version of a component from IoT Greengrass. This operation deletes the component's recipe
      # and artifacts. As a result, deployments that refer to this component version will fail. If you have
      # deployments that use this component version, you can remove the component from the deployment or
      # update the deployment to use a valid version.

      def delete_component(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteComponentRequest.new(arn: arn)
        delete_component(input)
      end

      def delete_component(input : Types::DeleteComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Greengrass core device, which is an IoT thing. This operation removes the core device from
      # the list of core devices. This operation doesn't delete the IoT thing. For more information about
      # how to delete the IoT thing, see DeleteThing in the IoT API Reference .

      def delete_core_device(
        core_device_thing_name : String
      ) : Protocol::Request
        input = Types::DeleteCoreDeviceRequest.new(core_device_thing_name: core_device_thing_name)
        delete_core_device(input)
      end

      def delete_core_device(input : Types::DeleteCoreDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CORE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a deployment. To delete an active deployment, you must first cancel it. For more
      # information, see CancelDeployment . Deleting a deployment doesn't affect core devices that run that
      # deployment, because core devices store the deployment's configuration on the device. Additionally,
      # core devices can roll back to a previous deployment that has been deleted.

      def delete_deployment(
        deployment_id : String
      ) : Protocol::Request
        input = Types::DeleteDeploymentRequest.new(deployment_id: deployment_id)
        delete_deployment(input)
      end

      def delete_deployment(input : Types::DeleteDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves metadata for a version of a component.

      def describe_component(
        arn : String
      ) : Protocol::Request
        input = Types::DescribeComponentRequest.new(arn: arn)
        describe_component(input)
      end

      def describe_component(input : Types::DescribeComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the Greengrass service role from IoT Greengrass for your Amazon Web Services account
      # in this Amazon Web Services Region. Without a service role, IoT Greengrass can't verify the identity
      # of client devices or manage core device connectivity information. For more information, see
      # Greengrass service role in the IoT Greengrass Version 2 Developer Guide .

      def disassociate_service_role_from_account : Protocol::Request
        input = Types::DisassociateServiceRoleFromAccountRequest.new
        disassociate_service_role_from_account(input)
      end

      def disassociate_service_role_from_account(input : Types::DisassociateServiceRoleFromAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SERVICE_ROLE_FROM_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the recipe for a version of a component.

      def get_component(
        arn : String,
        recipe_output_format : String? = nil
      ) : Protocol::Request
        input = Types::GetComponentRequest.new(arn: arn, recipe_output_format: recipe_output_format)
        get_component(input)
      end

      def get_component(input : Types::GetComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the pre-signed URL to download a public or a Lambda component artifact. Core devices call this
      # operation to identify the URL that they can use to download an artifact to install.

      def get_component_version_artifact(
        arn : String,
        artifact_name : String,
        iot_endpoint_type : String? = nil,
        s3_endpoint_type : String? = nil
      ) : Protocol::Request
        input = Types::GetComponentVersionArtifactRequest.new(arn: arn, artifact_name: artifact_name, iot_endpoint_type: iot_endpoint_type, s3_endpoint_type: s3_endpoint_type)
        get_component_version_artifact(input)
      end

      def get_component_version_artifact(input : Types::GetComponentVersionArtifactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPONENT_VERSION_ARTIFACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves connectivity information for a Greengrass core device. Connectivity information includes
      # endpoints and ports where client devices can connect to an MQTT broker on the core device. When a
      # client device calls the IoT Greengrass discovery API , IoT Greengrass returns connectivity
      # information for all of the core devices where the client device can connect. For more information,
      # see Connect client devices to core devices in the IoT Greengrass Version 2 Developer Guide .

      def get_connectivity_info(
        thing_name : String
      ) : Protocol::Request
        input = Types::GetConnectivityInfoRequest.new(thing_name: thing_name)
        get_connectivity_info(input)
      end

      def get_connectivity_info(input : Types::GetConnectivityInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTIVITY_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves metadata for a Greengrass core device. IoT Greengrass relies on individual devices to send
      # status updates to the Amazon Web Services Cloud. If the IoT Greengrass Core software isn't running
      # on the device, or if device isn't connected to the Amazon Web Services Cloud, then the reported
      # status of that device might not reflect its current status. The status timestamp indicates when the
      # device status was last updated. Core devices send status updates at the following times: When the
      # IoT Greengrass Core software starts When the core device receives a deployment from the Amazon Web
      # Services Cloud When the status of any component on the core device becomes BROKEN At a regular
      # interval that you can configure , which defaults to 24 hours For IoT Greengrass Core v2.7.0, the
      # core device sends status updates upon local deployment and cloud deployment

      def get_core_device(
        core_device_thing_name : String
      ) : Protocol::Request
        input = Types::GetCoreDeviceRequest.new(core_device_thing_name: core_device_thing_name)
        get_core_device(input)
      end

      def get_core_device(input : Types::GetCoreDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CORE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a deployment. Deployments define the components that run on Greengrass core devices.

      def get_deployment(
        deployment_id : String
      ) : Protocol::Request
        input = Types::GetDeploymentRequest.new(deployment_id: deployment_id)
        get_deployment(input)
      end

      def get_deployment(input : Types::GetDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the service role associated with IoT Greengrass for your Amazon Web Services account in this
      # Amazon Web Services Region. IoT Greengrass uses this role to verify the identity of client devices
      # and manage core device connectivity information. For more information, see Greengrass service role
      # in the IoT Greengrass Version 2 Developer Guide .

      def get_service_role_for_account : Protocol::Request
        input = Types::GetServiceRoleForAccountRequest.new
        get_service_role_for_account(input)
      end

      def get_service_role_for_account(input : Types::GetServiceRoleForAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_ROLE_FOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of client devices that are associated with a core device.

      def list_client_devices_associated_with_core_device(
        core_device_thing_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClientDevicesAssociatedWithCoreDeviceRequest.new(core_device_thing_name: core_device_thing_name, max_results: max_results, next_token: next_token)
        list_client_devices_associated_with_core_device(input)
      end

      def list_client_devices_associated_with_core_device(input : Types::ListClientDevicesAssociatedWithCoreDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLIENT_DEVICES_ASSOCIATED_WITH_CORE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of all versions for a component. Greater versions are listed first.

      def list_component_versions(
        arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentVersionsRequest.new(arn: arn, max_results: max_results, next_token: next_token)
        list_component_versions(input)
      end

      def list_component_versions(input : Types::ListComponentVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of component summaries. This list includes components that you have
      # permission to view.

      def list_components(
        max_results : Int32? = nil,
        next_token : String? = nil,
        scope : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentsRequest.new(max_results: max_results, next_token: next_token, scope: scope)
        list_components(input)
      end

      def list_components(input : Types::ListComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of Greengrass core devices. IoT Greengrass relies on individual devices
      # to send status updates to the Amazon Web Services Cloud. If the IoT Greengrass Core software isn't
      # running on the device, or if device isn't connected to the Amazon Web Services Cloud, then the
      # reported status of that device might not reflect its current status. The status timestamp indicates
      # when the device status was last updated. Core devices send status updates at the following times:
      # When the IoT Greengrass Core software starts When the core device receives a deployment from the
      # Amazon Web Services Cloud For Greengrass nucleus 2.12.2 and earlier, the core device sends status
      # updates when the status of any component on the core device becomes ERRORED or BROKEN . For
      # Greengrass nucleus 2.12.3 and later, the core device sends status updates when the status of any
      # component on the core device becomes ERRORED , BROKEN , RUNNING , or FINISHED . At a regular
      # interval that you can configure , which defaults to 24 hours For IoT Greengrass Core v2.7.0, the
      # core device sends status updates upon local deployment and cloud deployment

      def list_core_devices(
        max_results : Int32? = nil,
        next_token : String? = nil,
        runtime : String? = nil,
        status : String? = nil,
        thing_group_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListCoreDevicesRequest.new(max_results: max_results, next_token: next_token, runtime: runtime, status: status, thing_group_arn: thing_group_arn)
        list_core_devices(input)
      end

      def list_core_devices(input : Types::ListCoreDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CORE_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of deployments.

      def list_deployments(
        history_filter : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        parent_target_arn : String? = nil,
        target_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentsRequest.new(history_filter: history_filter, max_results: max_results, next_token: next_token, parent_target_arn: parent_target_arn, target_arn: target_arn)
        list_deployments(input)
      end

      def list_deployments(input : Types::ListDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of deployment jobs that IoT Greengrass sends to Greengrass core devices.

      def list_effective_deployments(
        core_device_thing_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEffectiveDeploymentsRequest.new(core_device_thing_name: core_device_thing_name, max_results: max_results, next_token: next_token)
        list_effective_deployments(input)
      end

      def list_effective_deployments(input : Types::ListEffectiveDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EFFECTIVE_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of the components that a Greengrass core device runs. By default, this
      # list doesn't include components that are deployed as dependencies of other components. To include
      # dependencies in the response, set the topologyFilter parameter to ALL . IoT Greengrass relies on
      # individual devices to send status updates to the Amazon Web Services Cloud. If the IoT Greengrass
      # Core software isn't running on the device, or if device isn't connected to the Amazon Web Services
      # Cloud, then the reported status of that device might not reflect its current status. The status
      # timestamp indicates when the device status was last updated. Core devices send status updates at the
      # following times: When the IoT Greengrass Core software starts When the core device receives a
      # deployment from the Amazon Web Services Cloud When the status of any component on the core device
      # becomes BROKEN At a regular interval that you can configure , which defaults to 24 hours For IoT
      # Greengrass Core v2.7.0, the core device sends status updates upon local deployment and cloud
      # deployment

      def list_installed_components(
        core_device_thing_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        topology_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListInstalledComponentsRequest.new(core_device_thing_name: core_device_thing_name, max_results: max_results, next_token: next_token, topology_filter: topology_filter)
        list_installed_components(input)
      end

      def list_installed_components(input : Types::ListInstalledComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSTALLED_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of tags for an IoT Greengrass resource.

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

      # Retrieves a list of components that meet the component, version, and platform requirements of a
      # deployment. Greengrass core devices call this operation when they receive a deployment to identify
      # the components to install. This operation identifies components that meet all dependency
      # requirements for a deployment. If the requirements conflict, then this operation returns an error
      # and the deployment fails. For example, this occurs if component A requires version &gt;2.0.0 and
      # component B requires version &lt;2.0.0 of a component dependency. When you specify the component
      # candidates to resolve, IoT Greengrass compares each component's digest from the core device with the
      # component's digest in the Amazon Web Services Cloud. If the digests don't match, then IoT Greengrass
      # specifies to use the version from the Amazon Web Services Cloud. To use this operation, you must use
      # the data plane API endpoint and authenticate with an IoT device certificate. For more information,
      # see IoT Greengrass endpoints and quotas .

      def resolve_component_candidates(
        component_candidates : Array(Types::ComponentCandidate)? = nil,
        platform : Types::ComponentPlatform? = nil
      ) : Protocol::Request
        input = Types::ResolveComponentCandidatesRequest.new(component_candidates: component_candidates, platform: platform)
        resolve_component_candidates(input)
      end

      def resolve_component_candidates(input : Types::ResolveComponentCandidatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESOLVE_COMPONENT_CANDIDATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to an IoT Greengrass resource. If a tag already exists for the resource, this operation
      # updates the tag's value.

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

      # Removes a tag from an IoT Greengrass resource.

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

      # Updates connectivity information for a Greengrass core device. Connectivity information includes
      # endpoints and ports where client devices can connect to an MQTT broker on the core device. When a
      # client device calls the IoT Greengrass discovery API , IoT Greengrass returns connectivity
      # information for all of the core devices where the client device can connect. For more information,
      # see Connect client devices to core devices in the IoT Greengrass Version 2 Developer Guide .

      def update_connectivity_info(
        connectivity_info : Array(Types::ConnectivityInfo),
        thing_name : String
      ) : Protocol::Request
        input = Types::UpdateConnectivityInfoRequest.new(connectivity_info: connectivity_info, thing_name: thing_name)
        update_connectivity_info(input)
      end

      def update_connectivity_info(input : Types::UpdateConnectivityInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTIVITY_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
