module AwsSdk
  module Panorama
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

      # Creates an application instance and deploys it to a device.

      def create_application_instance(
        default_runtime_context_device : String,
        manifest_payload : Types::ManifestPayload,
        application_instance_id_to_replace : String? = nil,
        description : String? = nil,
        manifest_overrides_payload : Types::ManifestOverridesPayload? = nil,
        name : String? = nil,
        runtime_role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationInstanceRequest.new(default_runtime_context_device: default_runtime_context_device, manifest_payload: manifest_payload, application_instance_id_to_replace: application_instance_id_to_replace, description: description, manifest_overrides_payload: manifest_overrides_payload, name: name, runtime_role_arn: runtime_role_arn, tags: tags)
        create_application_instance(input)
      end

      def create_application_instance(input : Types::CreateApplicationInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a job to run on a device. A job can update a device's software or reboot it.

      def create_job_for_devices(
        device_ids : Array(String),
        job_type : String,
        device_job_config : Types::DeviceJobConfig? = nil
      ) : Protocol::Request
        input = Types::CreateJobForDevicesRequest.new(device_ids: device_ids, job_type: job_type, device_job_config: device_job_config)
        create_job_for_devices(input)
      end

      def create_job_for_devices(input : Types::CreateJobForDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB_FOR_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a camera stream node.

      def create_node_from_template_job(
        node_name : String,
        output_package_name : String,
        output_package_version : String,
        template_parameters : Hash(String, String),
        template_type : String,
        job_tags : Array(Types::JobResourceTags)? = nil,
        node_description : String? = nil
      ) : Protocol::Request
        input = Types::CreateNodeFromTemplateJobRequest.new(node_name: node_name, output_package_name: output_package_name, output_package_version: output_package_version, template_parameters: template_parameters, template_type: template_type, job_tags: job_tags, node_description: node_description)
        create_node_from_template_job(input)
      end

      def create_node_from_template_job(input : Types::CreateNodeFromTemplateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NODE_FROM_TEMPLATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a package and storage location in an Amazon S3 access point.

      def create_package(
        package_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePackageRequest.new(package_name: package_name, tags: tags)
        create_package(input)
      end

      def create_package(input : Types::CreatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports a node package.

      def create_package_import_job(
        client_token : String,
        input_config : Types::PackageImportJobInputConfig,
        job_type : String,
        output_config : Types::PackageImportJobOutputConfig,
        job_tags : Array(Types::JobResourceTags)? = nil
      ) : Protocol::Request
        input = Types::CreatePackageImportJobRequest.new(client_token: client_token, input_config: input_config, job_type: job_type, output_config: output_config, job_tags: job_tags)
        create_package_import_job(input)
      end

      def create_package_import_job(input : Types::CreatePackageImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a device.

      def delete_device(
        device_id : String
      ) : Protocol::Request
        input = Types::DeleteDeviceRequest.new(device_id: device_id)
        delete_device(input)
      end

      def delete_device(input : Types::DeleteDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a package. To delete a package, you need permission to call s3:DeleteObject in addition to
      # permissions for the AWS Panorama API.

      def delete_package(
        package_id : String,
        force_delete : Bool? = nil
      ) : Protocol::Request
        input = Types::DeletePackageRequest.new(package_id: package_id, force_delete: force_delete)
        delete_package(input)
      end

      def delete_package(input : Types::DeletePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters a package version.

      def deregister_package_version(
        package_id : String,
        package_version : String,
        patch_version : String,
        owner_account : String? = nil,
        updated_latest_patch_version : String? = nil
      ) : Protocol::Request
        input = Types::DeregisterPackageVersionRequest.new(package_id: package_id, package_version: package_version, patch_version: patch_version, owner_account: owner_account, updated_latest_patch_version: updated_latest_patch_version)
        deregister_package_version(input)
      end

      def deregister_package_version(input : Types::DeregisterPackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an application instance on a device.

      def describe_application_instance(
        application_instance_id : String
      ) : Protocol::Request
        input = Types::DescribeApplicationInstanceRequest.new(application_instance_id: application_instance_id)
        describe_application_instance(input)
      end

      def describe_application_instance(input : Types::DescribeApplicationInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APPLICATION_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an application instance's configuration manifest.

      def describe_application_instance_details(
        application_instance_id : String
      ) : Protocol::Request
        input = Types::DescribeApplicationInstanceDetailsRequest.new(application_instance_id: application_instance_id)
        describe_application_instance_details(input)
      end

      def describe_application_instance_details(input : Types::DescribeApplicationInstanceDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APPLICATION_INSTANCE_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a device.

      def describe_device(
        device_id : String
      ) : Protocol::Request
        input = Types::DescribeDeviceRequest.new(device_id: device_id)
        describe_device(input)
      end

      def describe_device(input : Types::DescribeDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a device job.

      def describe_device_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DescribeDeviceJobRequest.new(job_id: job_id)
        describe_device_job(input)
      end

      def describe_device_job(input : Types::DescribeDeviceJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DEVICE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a node.

      def describe_node(
        node_id : String,
        owner_account : String? = nil
      ) : Protocol::Request
        input = Types::DescribeNodeRequest.new(node_id: node_id, owner_account: owner_account)
        describe_node(input)
      end

      def describe_node(input : Types::DescribeNodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a job to create a camera stream node.

      def describe_node_from_template_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DescribeNodeFromTemplateJobRequest.new(job_id: job_id)
        describe_node_from_template_job(input)
      end

      def describe_node_from_template_job(input : Types::DescribeNodeFromTemplateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NODE_FROM_TEMPLATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a package.

      def describe_package(
        package_id : String
      ) : Protocol::Request
        input = Types::DescribePackageRequest.new(package_id: package_id)
        describe_package(input)
      end

      def describe_package(input : Types::DescribePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a package import job.

      def describe_package_import_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DescribePackageImportJobRequest.new(job_id: job_id)
        describe_package_import_job(input)
      end

      def describe_package_import_job(input : Types::DescribePackageImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a package version.

      def describe_package_version(
        package_id : String,
        package_version : String,
        owner_account : String? = nil,
        patch_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribePackageVersionRequest.new(package_id: package_id, package_version: package_version, owner_account: owner_account, patch_version: patch_version)
        describe_package_version(input)
      end

      def describe_package_version(input : Types::DescribePackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of application instance dependencies.

      def list_application_instance_dependencies(
        application_instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationInstanceDependenciesRequest.new(application_instance_id: application_instance_id, max_results: max_results, next_token: next_token)
        list_application_instance_dependencies(input)
      end

      def list_application_instance_dependencies(input : Types::ListApplicationInstanceDependenciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_INSTANCE_DEPENDENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of application node instances.

      def list_application_instance_node_instances(
        application_instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationInstanceNodeInstancesRequest.new(application_instance_id: application_instance_id, max_results: max_results, next_token: next_token)
        list_application_instance_node_instances(input)
      end

      def list_application_instance_node_instances(input : Types::ListApplicationInstanceNodeInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_INSTANCE_NODE_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of application instances.

      def list_application_instances(
        device_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationInstancesRequest.new(device_id: device_id, max_results: max_results, next_token: next_token, status_filter: status_filter)
        list_application_instances(input)
      end

      def list_application_instances(input : Types::ListApplicationInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of devices.

      def list_devices(
        device_aggregated_status_filter : String? = nil,
        max_results : Int32? = nil,
        name_filter : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListDevicesRequest.new(device_aggregated_status_filter: device_aggregated_status_filter, max_results: max_results, name_filter: name_filter, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_devices(input)
      end

      def list_devices(input : Types::ListDevicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of jobs.

      def list_devices_jobs(
        device_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDevicesJobsRequest.new(device_id: device_id, max_results: max_results, next_token: next_token)
        list_devices_jobs(input)
      end

      def list_devices_jobs(input : Types::ListDevicesJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICES_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of camera stream node jobs.

      def list_node_from_template_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNodeFromTemplateJobsRequest.new(max_results: max_results, next_token: next_token)
        list_node_from_template_jobs(input)
      end

      def list_node_from_template_jobs(input : Types::ListNodeFromTemplateJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NODE_FROM_TEMPLATE_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of nodes.

      def list_nodes(
        category : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner_account : String? = nil,
        package_name : String? = nil,
        package_version : String? = nil,
        patch_version : String? = nil
      ) : Protocol::Request
        input = Types::ListNodesRequest.new(category: category, max_results: max_results, next_token: next_token, owner_account: owner_account, package_name: package_name, package_version: package_version, patch_version: patch_version)
        list_nodes(input)
      end

      def list_nodes(input : Types::ListNodesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NODES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of package import jobs.

      def list_package_import_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPackageImportJobsRequest.new(max_results: max_results, next_token: next_token)
        list_package_import_jobs(input)
      end

      def list_package_import_jobs(input : Types::ListPackageImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGE_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of packages.

      def list_packages(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPackagesRequest.new(max_results: max_results, next_token: next_token)
        list_packages(input)
      end

      def list_packages(input : Types::ListPackagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGES, input, endpoint)
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

      # Creates a device and returns a configuration archive. The configuration archive is a ZIP file that
      # contains a provisioning certificate that is valid for 5 minutes. Name the configuration archive
      # certificates-omni_ device-name .zip and transfer it to the device within 5 minutes. Use the included
      # USB storage device and connect it to the USB 3.0 port next to the HDMI output.

      def provision_device(
        name : String,
        description : String? = nil,
        networking_configuration : Types::NetworkPayload? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ProvisionDeviceRequest.new(name: name, description: description, networking_configuration: networking_configuration, tags: tags)
        provision_device(input)
      end

      def provision_device(input : Types::ProvisionDeviceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PROVISION_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers a package version.

      def register_package_version(
        package_id : String,
        package_version : String,
        patch_version : String,
        mark_latest : Bool? = nil,
        owner_account : String? = nil
      ) : Protocol::Request
        input = Types::RegisterPackageVersionRequest.new(package_id: package_id, package_version: package_version, patch_version: patch_version, mark_latest: mark_latest, owner_account: owner_account)
        register_package_version(input)
      end

      def register_package_version(input : Types::RegisterPackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an application instance.

      def remove_application_instance(
        application_instance_id : String
      ) : Protocol::Request
        input = Types::RemoveApplicationInstanceRequest.new(application_instance_id: application_instance_id)
        remove_application_instance(input)
      end

      def remove_application_instance(input : Types::RemoveApplicationInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_APPLICATION_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Signal camera nodes to stop or resume.

      def signal_application_instance_node_instances(
        application_instance_id : String,
        node_signals : Array(Types::NodeSignal)
      ) : Protocol::Request
        input = Types::SignalApplicationInstanceNodeInstancesRequest.new(application_instance_id: application_instance_id, node_signals: node_signals)
        signal_application_instance_node_instances(input)
      end

      def signal_application_instance_node_instances(input : Types::SignalApplicationInstanceNodeInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SIGNAL_APPLICATION_INSTANCE_NODE_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource.

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

      # Removes tags from a resource.

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

      # Updates a device's metadata.

      def update_device_metadata(
        device_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeviceMetadataRequest.new(device_id: device_id, description: description)
        update_device_metadata(input)
      end

      def update_device_metadata(input : Types::UpdateDeviceMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEVICE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
