module AwsSdk
  module Snowball
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

      # Cancels a cluster job. You can only cancel a cluster job while it's in the AwaitingQuorum status.
      # You'll have at least an hour after creating a cluster job to cancel it.

      def cancel_cluster(
        cluster_id : String
      ) : Types::CancelClusterResult

        input = Types::CancelClusterRequest.new(cluster_id: cluster_id)
        cancel_cluster(input)
      end

      def cancel_cluster(input : Types::CancelClusterRequest) : Types::CancelClusterResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelClusterResult, "CancelCluster")
      end

      # Cancels the specified job. You can only cancel a job before its JobState value changes to
      # PreparingAppliance . Requesting the ListJobs or DescribeJob action returns a job's JobState as part
      # of the response element data returned.

      def cancel_job(
        job_id : String
      ) : Types::CancelJobResult

        input = Types::CancelJobRequest.new(job_id: job_id)
        cancel_job(input)
      end

      def cancel_job(input : Types::CancelJobRequest) : Types::CancelJobResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelJobResult, "CancelJob")
      end

      # Creates an address for a Snow device to be shipped to. In most regions, addresses are validated at
      # the time of creation. The address you provide must be located within the serviceable area of your
      # region. If the address is invalid or unsupported, then an exception is thrown. If providing an
      # address as a JSON file through the cli-input-json option, include the full file path. For example,
      # --cli-input-json file://create-address.json .

      def create_address(
        address : Types::Address
      ) : Types::CreateAddressResult

        input = Types::CreateAddressRequest.new(address: address)
        create_address(input)
      end

      def create_address(input : Types::CreateAddressRequest) : Types::CreateAddressResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADDRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAddressResult, "CreateAddress")
      end

      # Creates an empty cluster. Each cluster supports five nodes. You use the CreateJob action separately
      # to create the jobs for each of these nodes. The cluster does not ship until these five node jobs
      # have been created.

      def create_cluster(
        address_id : String,
        job_type : String,
        shipping_option : String,
        snowball_type : String,
        description : String? = nil,
        force_create_jobs : Bool? = nil,
        forwarding_address_id : String? = nil,
        initial_cluster_size : Int32? = nil,
        kms_key_arn : String? = nil,
        long_term_pricing_ids : Array(String)? = nil,
        notification : Types::Notification? = nil,
        on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
        remote_management : String? = nil,
        resources : Types::JobResource? = nil,
        role_arn : String? = nil,
        snowball_capacity_preference : String? = nil,
        tax_documents : Types::TaxDocuments? = nil
      ) : Types::CreateClusterResult

        input = Types::CreateClusterRequest.new(address_id: address_id, job_type: job_type, shipping_option: shipping_option, snowball_type: snowball_type, description: description, force_create_jobs: force_create_jobs, forwarding_address_id: forwarding_address_id, initial_cluster_size: initial_cluster_size, kms_key_arn: kms_key_arn, long_term_pricing_ids: long_term_pricing_ids, notification: notification, on_device_service_configuration: on_device_service_configuration, remote_management: remote_management, resources: resources, role_arn: role_arn, snowball_capacity_preference: snowball_capacity_preference, tax_documents: tax_documents)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterRequest) : Types::CreateClusterResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterResult, "CreateCluster")
      end

      # Creates a job to import or export data between Amazon S3 and your on-premises data center. Your
      # Amazon Web Services account must have the right trust policies and permissions in place to create a
      # job for a Snow device. If you're creating a job for a node in a cluster, you only need to provide
      # the clusterId value; the other job attributes are inherited from the cluster. Only the Snowball;
      # Edge device type is supported when ordering clustered jobs. The device capacity is optional.
      # Availability of device types differ by Amazon Web Services Region. For more information about Region
      # availability, see Amazon Web Services Regional Services . Snow Family devices and their capacities.
      # Device type: SNC1_SSD Capacity: T14 Description: Snowcone Device type: SNC1_HDD Capacity: T8
      # Description: Snowcone Device type: EDGE_S Capacity: T98 Description: Snowball Edge Storage Optimized
      # for data transfer only Device type: EDGE_CG Capacity: T42 Description: Snowball Edge Compute
      # Optimized with GPU Device type: EDGE_C Capacity: T42 Description: Snowball Edge Compute Optimized
      # without GPU Device type: EDGE Capacity: T100 Description: Snowball Edge Storage Optimized with EC2
      # Compute This device is replaced with T98. Device type: STANDARD Capacity: T50 Description: Original
      # Snowball device This device is only available in the Ningxia, Beijing, and Singapore Amazon Web
      # Services Region Device type: STANDARD Capacity: T80 Description: Original Snowball device This
      # device is only available in the Ningxia, Beijing, and Singapore Amazon Web Services Region. Snow
      # Family device type: RACK_5U_C Capacity: T13 Description: Snowblade. Device type: V3_5S Capacity:
      # T240 Description: Snowball Edge Storage Optimized 210TB

      def create_job(
        address_id : String? = nil,
        cluster_id : String? = nil,
        description : String? = nil,
        device_configuration : Types::DeviceConfiguration? = nil,
        forwarding_address_id : String? = nil,
        impact_level : String? = nil,
        job_type : String? = nil,
        kms_key_arn : String? = nil,
        long_term_pricing_id : String? = nil,
        notification : Types::Notification? = nil,
        on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
        pickup_details : Types::PickupDetails? = nil,
        remote_management : String? = nil,
        resources : Types::JobResource? = nil,
        role_arn : String? = nil,
        shipping_option : String? = nil,
        snowball_capacity_preference : String? = nil,
        snowball_type : String? = nil,
        tax_documents : Types::TaxDocuments? = nil
      ) : Types::CreateJobResult

        input = Types::CreateJobRequest.new(address_id: address_id, cluster_id: cluster_id, description: description, device_configuration: device_configuration, forwarding_address_id: forwarding_address_id, impact_level: impact_level, job_type: job_type, kms_key_arn: kms_key_arn, long_term_pricing_id: long_term_pricing_id, notification: notification, on_device_service_configuration: on_device_service_configuration, pickup_details: pickup_details, remote_management: remote_management, resources: resources, role_arn: role_arn, shipping_option: shipping_option, snowball_capacity_preference: snowball_capacity_preference, snowball_type: snowball_type, tax_documents: tax_documents)
        create_job(input)
      end

      def create_job(input : Types::CreateJobRequest) : Types::CreateJobResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateJobResult, "CreateJob")
      end

      # Creates a job with the long-term usage option for a device. The long-term usage is a 1-year or
      # 3-year long-term pricing type for the device. You are billed upfront, and Amazon Web Services
      # provides discounts for long-term pricing.

      def create_long_term_pricing(
        long_term_pricing_type : String,
        snowball_type : String,
        is_long_term_pricing_auto_renew : Bool? = nil
      ) : Types::CreateLongTermPricingResult

        input = Types::CreateLongTermPricingRequest.new(long_term_pricing_type: long_term_pricing_type, snowball_type: snowball_type, is_long_term_pricing_auto_renew: is_long_term_pricing_auto_renew)
        create_long_term_pricing(input)
      end

      def create_long_term_pricing(input : Types::CreateLongTermPricingRequest) : Types::CreateLongTermPricingResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_LONG_TERM_PRICING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLongTermPricingResult, "CreateLongTermPricing")
      end

      # Creates a shipping label that will be used to return the Snow device to Amazon Web Services.

      def create_return_shipping_label(
        job_id : String,
        shipping_option : String? = nil
      ) : Types::CreateReturnShippingLabelResult

        input = Types::CreateReturnShippingLabelRequest.new(job_id: job_id, shipping_option: shipping_option)
        create_return_shipping_label(input)
      end

      def create_return_shipping_label(input : Types::CreateReturnShippingLabelRequest) : Types::CreateReturnShippingLabelResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_RETURN_SHIPPING_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateReturnShippingLabelResult, "CreateReturnShippingLabel")
      end

      # Takes an AddressId and returns specific details about that address in the form of an Address object.

      def describe_address(
        address_id : String
      ) : Types::DescribeAddressResult

        input = Types::DescribeAddressRequest.new(address_id: address_id)
        describe_address(input)
      end

      def describe_address(input : Types::DescribeAddressRequest) : Types::DescribeAddressResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ADDRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAddressResult, "DescribeAddress")
      end

      # Returns a specified number of ADDRESS objects. Calling this API in one of the US regions will return
      # addresses from the list of all addresses associated with this account in all US regions.

      def describe_addresses(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAddressesResult

        input = Types::DescribeAddressesRequest.new(max_results: max_results, next_token: next_token)
        describe_addresses(input)
      end

      def describe_addresses(input : Types::DescribeAddressesRequest) : Types::DescribeAddressesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ADDRESSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAddressesResult, "DescribeAddresses")
      end

      # Returns information about a specific cluster including shipping information, cluster status, and
      # other important metadata.

      def describe_cluster(
        cluster_id : String
      ) : Types::DescribeClusterResult

        input = Types::DescribeClusterRequest.new(cluster_id: cluster_id)
        describe_cluster(input)
      end

      def describe_cluster(input : Types::DescribeClusterRequest) : Types::DescribeClusterResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClusterResult, "DescribeCluster")
      end

      # Returns information about a specific job including shipping information, job status, and other
      # important metadata.

      def describe_job(
        job_id : String
      ) : Types::DescribeJobResult

        input = Types::DescribeJobRequest.new(job_id: job_id)
        describe_job(input)
      end

      def describe_job(input : Types::DescribeJobRequest) : Types::DescribeJobResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeJobResult, "DescribeJob")
      end

      # Information on the shipping label of a Snow device that is being returned to Amazon Web Services.

      def describe_return_shipping_label(
        job_id : String
      ) : Types::DescribeReturnShippingLabelResult

        input = Types::DescribeReturnShippingLabelRequest.new(job_id: job_id)
        describe_return_shipping_label(input)
      end

      def describe_return_shipping_label(input : Types::DescribeReturnShippingLabelRequest) : Types::DescribeReturnShippingLabelResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RETURN_SHIPPING_LABEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReturnShippingLabelResult, "DescribeReturnShippingLabel")
      end

      # Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified
      # JobId value. You can access the manifest file for up to 60 minutes after this request has been made.
      # To access the manifest file after 60 minutes have passed, you'll have to make another call to the
      # GetJobManifest action. The manifest is an encrypted file that you can download after your job enters
      # the WithCustomer status. This is the only valid status for calling this API as the manifest and
      # UnlockCode code value are used for securing your device and should only be used when you have the
      # device. The manifest is decrypted by using the UnlockCode code value, when you pass both values to
      # the Snow device through the Snowball client when the client is started for the first time. As a best
      # practice, we recommend that you don't save a copy of an UnlockCode value in the same location as the
      # manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining
      # access to the Snow device associated with that job. The credentials of a given job, including its
      # manifest file and unlock code, expire 360 days after the job is created.

      def get_job_manifest(
        job_id : String
      ) : Types::GetJobManifestResult

        input = Types::GetJobManifestRequest.new(job_id: job_id)
        get_job_manifest(input)
      end

      def get_job_manifest(input : Types::GetJobManifestRequest) : Types::GetJobManifestResult
        request = Protocol::JsonRpc.build_request(Model::GET_JOB_MANIFEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobManifestResult, "GetJobManifest")
      end

      # Returns the UnlockCode code value for the specified job. A particular UnlockCode value can be
      # accessed for up to 360 days after the associated job has been created. The UnlockCode value is a
      # 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the
      # manifest file when it is passed along with the manifest to the Snow device through the Snowball
      # client when the client is started for the first time. The only valid status for calling this API is
      # WithCustomer as the manifest and Unlock code values are used for securing your device and should
      # only be used when you have the device. As a best practice, we recommend that you don't save a copy
      # of the UnlockCode in the same location as the manifest file for that job. Saving these separately
      # helps prevent unauthorized parties from gaining access to the Snow device associated with that job.

      def get_job_unlock_code(
        job_id : String
      ) : Types::GetJobUnlockCodeResult

        input = Types::GetJobUnlockCodeRequest.new(job_id: job_id)
        get_job_unlock_code(input)
      end

      def get_job_unlock_code(input : Types::GetJobUnlockCodeRequest) : Types::GetJobUnlockCodeResult
        request = Protocol::JsonRpc.build_request(Model::GET_JOB_UNLOCK_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobUnlockCodeResult, "GetJobUnlockCode")
      end

      # Returns information about the Snow Family service limit for your account, and also the number of
      # Snow devices your account has in use. The default service limit for the number of Snow devices that
      # you can have at one time is 1. If you want to increase your service limit, contact Amazon Web
      # Services Support.

      def get_snowball_usage : Types::GetSnowballUsageResult
        input = Types::GetSnowballUsageRequest.new
        get_snowball_usage(input)
      end

      def get_snowball_usage(input : Types::GetSnowballUsageRequest) : Types::GetSnowballUsageResult
        request = Protocol::JsonRpc.build_request(Model::GET_SNOWBALL_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSnowballUsageResult, "GetSnowballUsage")
      end

      # Returns an Amazon S3 presigned URL for an update file associated with a specified JobId .

      def get_software_updates(
        job_id : String
      ) : Types::GetSoftwareUpdatesResult

        input = Types::GetSoftwareUpdatesRequest.new(job_id: job_id)
        get_software_updates(input)
      end

      def get_software_updates(input : Types::GetSoftwareUpdatesRequest) : Types::GetSoftwareUpdatesResult
        request = Protocol::JsonRpc.build_request(Model::GET_SOFTWARE_UPDATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSoftwareUpdatesResult, "GetSoftwareUpdates")
      end

      # Returns an array of JobListEntry objects of the specified length. Each JobListEntry object is for a
      # job in the specified cluster and contains a job's state, a job's ID, and other information.

      def list_cluster_jobs(
        cluster_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListClusterJobsResult

        input = Types::ListClusterJobsRequest.new(cluster_id: cluster_id, max_results: max_results, next_token: next_token)
        list_cluster_jobs(input)
      end

      def list_cluster_jobs(input : Types::ListClusterJobsRequest) : Types::ListClusterJobsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTER_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClusterJobsResult, "ListClusterJobs")
      end

      # Returns an array of ClusterListEntry objects of the specified length. Each ClusterListEntry object
      # contains a cluster's state, a cluster's ID, and other important status information.

      def list_clusters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListClustersResult

        input = Types::ListClustersRequest.new(max_results: max_results, next_token: next_token)
        list_clusters(input)
      end

      def list_clusters(input : Types::ListClustersRequest) : Types::ListClustersResult
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClustersResult, "ListClusters")
      end

      # This action returns a list of the different Amazon EC2-compatible Amazon Machine Images (AMIs) that
      # are owned by your Amazon Web Services accountthat would be supported for use on a Snow device.
      # Currently, supported AMIs are based on the Amazon Linux-2, Ubuntu 20.04 LTS - Focal, or Ubuntu 22.04
      # LTS - Jammy images, available on the Amazon Web Services Marketplace. Ubuntu 16.04 LTS - Xenial
      # (HVM) images are no longer supported in the Market, but still supported for use on devices through
      # Amazon EC2 VM Import/Export and running locally in AMIs.

      def list_compatible_images(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCompatibleImagesResult

        input = Types::ListCompatibleImagesRequest.new(max_results: max_results, next_token: next_token)
        list_compatible_images(input)
      end

      def list_compatible_images(input : Types::ListCompatibleImagesRequest) : Types::ListCompatibleImagesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPATIBLE_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCompatibleImagesResult, "ListCompatibleImages")
      end

      # Returns an array of JobListEntry objects of the specified length. Each JobListEntry object contains
      # a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of
      # export jobs. Calling this API action in one of the US regions will return jobs from the list of all
      # jobs associated with this account in all US regions.

      def list_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListJobsResult

        input = Types::ListJobsRequest.new(max_results: max_results, next_token: next_token)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Types::ListJobsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListJobsResult, "ListJobs")
      end

      # Lists all long-term pricing types.

      def list_long_term_pricing(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLongTermPricingResult

        input = Types::ListLongTermPricingRequest.new(max_results: max_results, next_token: next_token)
        list_long_term_pricing(input)
      end

      def list_long_term_pricing(input : Types::ListLongTermPricingRequest) : Types::ListLongTermPricingResult
        request = Protocol::JsonRpc.build_request(Model::LIST_LONG_TERM_PRICING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLongTermPricingResult, "ListLongTermPricing")
      end

      # A list of locations from which the customer can choose to pickup a device.

      def list_pickup_locations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPickupLocationsResult

        input = Types::ListPickupLocationsRequest.new(max_results: max_results, next_token: next_token)
        list_pickup_locations(input)
      end

      def list_pickup_locations(input : Types::ListPickupLocationsRequest) : Types::ListPickupLocationsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PICKUP_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPickupLocationsResult, "ListPickupLocations")
      end

      # Lists all supported versions for Snow on-device services. Returns an array of ServiceVersion object
      # containing the supported versions for a particular service.

      def list_service_versions(
        service_name : String,
        dependent_services : Array(Types::DependentService)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServiceVersionsResult

        input = Types::ListServiceVersionsRequest.new(service_name: service_name, dependent_services: dependent_services, max_results: max_results, next_token: next_token)
        list_service_versions(input)
      end

      def list_service_versions(input : Types::ListServiceVersionsRequest) : Types::ListServiceVersionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceVersionsResult, "ListServiceVersions")
      end

      # While a cluster's ClusterState value is in the AwaitingQuorum state, you can update some of the
      # information associated with a cluster. Once the cluster changes to a different job state, usually 60
      # minutes after the cluster being created, this action is no longer available.

      def update_cluster(
        cluster_id : String,
        address_id : String? = nil,
        description : String? = nil,
        forwarding_address_id : String? = nil,
        notification : Types::Notification? = nil,
        on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
        resources : Types::JobResource? = nil,
        role_arn : String? = nil,
        shipping_option : String? = nil
      ) : Types::UpdateClusterResult

        input = Types::UpdateClusterRequest.new(cluster_id: cluster_id, address_id: address_id, description: description, forwarding_address_id: forwarding_address_id, notification: notification, on_device_service_configuration: on_device_service_configuration, resources: resources, role_arn: role_arn, shipping_option: shipping_option)
        update_cluster(input)
      end

      def update_cluster(input : Types::UpdateClusterRequest) : Types::UpdateClusterResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterResult, "UpdateCluster")
      end

      # While a job's JobState value is New , you can update some of the information associated with a job.
      # Once the job changes to a different job state, usually within 60 minutes of the job being created,
      # this action is no longer available.

      def update_job(
        job_id : String,
        address_id : String? = nil,
        description : String? = nil,
        forwarding_address_id : String? = nil,
        notification : Types::Notification? = nil,
        on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
        pickup_details : Types::PickupDetails? = nil,
        resources : Types::JobResource? = nil,
        role_arn : String? = nil,
        shipping_option : String? = nil,
        snowball_capacity_preference : String? = nil
      ) : Types::UpdateJobResult

        input = Types::UpdateJobRequest.new(job_id: job_id, address_id: address_id, description: description, forwarding_address_id: forwarding_address_id, notification: notification, on_device_service_configuration: on_device_service_configuration, pickup_details: pickup_details, resources: resources, role_arn: role_arn, shipping_option: shipping_option, snowball_capacity_preference: snowball_capacity_preference)
        update_job(input)
      end

      def update_job(input : Types::UpdateJobRequest) : Types::UpdateJobResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateJobResult, "UpdateJob")
      end

      # Updates the state when a shipment state changes to a different state.

      def update_job_shipment_state(
        job_id : String,
        shipment_state : String
      ) : Types::UpdateJobShipmentStateResult

        input = Types::UpdateJobShipmentStateRequest.new(job_id: job_id, shipment_state: shipment_state)
        update_job_shipment_state(input)
      end

      def update_job_shipment_state(input : Types::UpdateJobShipmentStateRequest) : Types::UpdateJobShipmentStateResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_JOB_SHIPMENT_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateJobShipmentStateResult, "UpdateJobShipmentState")
      end

      # Updates the long-term pricing type.

      def update_long_term_pricing(
        long_term_pricing_id : String,
        is_long_term_pricing_auto_renew : Bool? = nil,
        replacement_job : String? = nil
      ) : Types::UpdateLongTermPricingResult

        input = Types::UpdateLongTermPricingRequest.new(long_term_pricing_id: long_term_pricing_id, is_long_term_pricing_auto_renew: is_long_term_pricing_auto_renew, replacement_job: replacement_job)
        update_long_term_pricing(input)
      end

      def update_long_term_pricing(input : Types::UpdateLongTermPricingRequest) : Types::UpdateLongTermPricingResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LONG_TERM_PRICING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLongTermPricingResult, "UpdateLongTermPricing")
      end
    end
  end
end
