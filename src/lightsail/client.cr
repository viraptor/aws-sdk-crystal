module Aws
  module Lightsail
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

      # Allocates a static IP address.

      def allocate_static_ip(
        static_ip_name : String
      ) : Types::AllocateStaticIpResult

        input = Types::AllocateStaticIpRequest.new(static_ip_name: static_ip_name)
        allocate_static_ip(input)
      end

      def allocate_static_ip(input : Types::AllocateStaticIpRequest) : Types::AllocateStaticIpResult
        request = Protocol::JsonRpc.build_request(Model::ALLOCATE_STATIC_IP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AllocateStaticIpResult, "AllocateStaticIp")
      end

      # Attaches an SSL/TLS certificate to your Amazon Lightsail content delivery network (CDN)
      # distribution. After the certificate is attached, your distribution accepts HTTPS traffic for all of
      # the domains that are associated with the certificate. Use the CreateCertificate action to create a
      # certificate that you can attach to your distribution. Only certificates created in the us-east-1
      # Amazon Web Services Region can be attached to Lightsail distributions. Lightsail distributions are
      # global resources that can reference an origin in any Amazon Web Services Region, and distribute its
      # content globally. However, all distributions are located in the us-east-1 Region.

      def attach_certificate_to_distribution(
        certificate_name : String,
        distribution_name : String
      ) : Types::AttachCertificateToDistributionResult

        input = Types::AttachCertificateToDistributionRequest.new(certificate_name: certificate_name, distribution_name: distribution_name)
        attach_certificate_to_distribution(input)
      end

      def attach_certificate_to_distribution(input : Types::AttachCertificateToDistributionRequest) : Types::AttachCertificateToDistributionResult
        request = Protocol::JsonRpc.build_request(Model::ATTACH_CERTIFICATE_TO_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachCertificateToDistributionResult, "AttachCertificateToDistribution")
      end

      # Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the
      # instance with the specified disk name. The attach disk operation supports tag-based access control
      # via resource tags applied to the resource identified by disk name . For more information, see the
      # Amazon Lightsail Developer Guide .

      def attach_disk(
        disk_name : String,
        disk_path : String,
        instance_name : String,
        auto_mounting : Bool? = nil
      ) : Types::AttachDiskResult

        input = Types::AttachDiskRequest.new(disk_name: disk_name, disk_path: disk_path, instance_name: instance_name, auto_mounting: auto_mounting)
        attach_disk(input)
      end

      def attach_disk(input : Types::AttachDiskRequest) : Types::AttachDiskResult
        request = Protocol::JsonRpc.build_request(Model::ATTACH_DISK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachDiskResult, "AttachDisk")
      end

      # Attaches one or more Lightsail instances to a load balancer. After some time, the instances are
      # attached to the load balancer and the health check status is available. The attach instances to load
      # balancer operation supports tag-based access control via resource tags applied to the resource
      # identified by load balancer name . For more information, see the Lightsail Developer Guide .

      def attach_instances_to_load_balancer(
        instance_names : Array(String),
        load_balancer_name : String
      ) : Types::AttachInstancesToLoadBalancerResult

        input = Types::AttachInstancesToLoadBalancerRequest.new(instance_names: instance_names, load_balancer_name: load_balancer_name)
        attach_instances_to_load_balancer(input)
      end

      def attach_instances_to_load_balancer(input : Types::AttachInstancesToLoadBalancerRequest) : Types::AttachInstancesToLoadBalancerResult
        request = Protocol::JsonRpc.build_request(Model::ATTACH_INSTANCES_TO_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachInstancesToLoadBalancerResult, "AttachInstancesToLoadBalancer")
      end

      # Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated,
      # more secure version of Secure Socket Layer (SSL). Once you create and validate your certificate, you
      # can attach it to your load balancer. You can also use this API to rotate the certificates on your
      # account. Use the AttachLoadBalancerTlsCertificate action with the non-attached certificate, and it
      # will replace the existing one and become the attached certificate. The
      # AttachLoadBalancerTlsCertificate operation supports tag-based access control via resource tags
      # applied to the resource identified by load balancer name . For more information, see the Amazon
      # Lightsail Developer Guide .

      def attach_load_balancer_tls_certificate(
        certificate_name : String,
        load_balancer_name : String
      ) : Types::AttachLoadBalancerTlsCertificateResult

        input = Types::AttachLoadBalancerTlsCertificateRequest.new(certificate_name: certificate_name, load_balancer_name: load_balancer_name)
        attach_load_balancer_tls_certificate(input)
      end

      def attach_load_balancer_tls_certificate(input : Types::AttachLoadBalancerTlsCertificateRequest) : Types::AttachLoadBalancerTlsCertificateResult
        request = Protocol::JsonRpc.build_request(Model::ATTACH_LOAD_BALANCER_TLS_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachLoadBalancerTlsCertificateResult, "AttachLoadBalancerTlsCertificate")
      end

      # Attaches a static IP address to a specific Amazon Lightsail instance.

      def attach_static_ip(
        instance_name : String,
        static_ip_name : String
      ) : Types::AttachStaticIpResult

        input = Types::AttachStaticIpRequest.new(instance_name: instance_name, static_ip_name: static_ip_name)
        attach_static_ip(input)
      end

      def attach_static_ip(input : Types::AttachStaticIpRequest) : Types::AttachStaticIpResult
        request = Protocol::JsonRpc.build_request(Model::ATTACH_STATIC_IP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachStaticIpResult, "AttachStaticIp")
      end

      # Closes ports for a specific Amazon Lightsail instance. The CloseInstancePublicPorts action supports
      # tag-based access control via resource tags applied to the resource identified by instanceName . For
      # more information, see the Amazon Lightsail Developer Guide .

      def close_instance_public_ports(
        instance_name : String,
        port_info : Types::PortInfo
      ) : Types::CloseInstancePublicPortsResult

        input = Types::CloseInstancePublicPortsRequest.new(instance_name: instance_name, port_info: port_info)
        close_instance_public_ports(input)
      end

      def close_instance_public_ports(input : Types::CloseInstancePublicPortsRequest) : Types::CloseInstancePublicPortsResult
        request = Protocol::JsonRpc.build_request(Model::CLOSE_INSTANCE_PUBLIC_PORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CloseInstancePublicPortsResult, "CloseInstancePublicPorts")
      end

      # Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic
      # snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a
      # manual or automatic snapshot of an instance or a disk from one Amazon Web Services Region to another
      # in Amazon Lightsail. When copying a manual snapshot , be sure to define the source region , source
      # snapshot name , and target snapshot name parameters. When copying an automatic snapshot , be sure to
      # define the source region , source resource name , target snapshot name , and either the restore date
      # or the use latest restorable auto snapshot parameters.

      def copy_snapshot(
        source_region : String,
        target_snapshot_name : String,
        restore_date : String? = nil,
        source_resource_name : String? = nil,
        source_snapshot_name : String? = nil,
        use_latest_restorable_auto_snapshot : Bool? = nil
      ) : Types::CopySnapshotResult

        input = Types::CopySnapshotRequest.new(source_region: source_region, target_snapshot_name: target_snapshot_name, restore_date: restore_date, source_resource_name: source_resource_name, source_snapshot_name: source_snapshot_name, use_latest_restorable_auto_snapshot: use_latest_restorable_auto_snapshot)
        copy_snapshot(input)
      end

      def copy_snapshot(input : Types::CopySnapshotRequest) : Types::CopySnapshotResult
        request = Protocol::JsonRpc.build_request(Model::COPY_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopySnapshotResult, "CopySnapshot")
      end

      # Creates an Amazon Lightsail bucket. A bucket is a cloud storage resource available in the Lightsail
      # object storage service. Use buckets to store objects such as data and its descriptive metadata. For
      # more information about buckets, see Buckets in Amazon Lightsail in the Amazon Lightsail Developer
      # Guide .

      def create_bucket(
        bucket_name : String,
        bundle_id : String,
        enable_object_versioning : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateBucketResult

        input = Types::CreateBucketRequest.new(bucket_name: bucket_name, bundle_id: bundle_id, enable_object_versioning: enable_object_versioning, tags: tags)
        create_bucket(input)
      end

      def create_bucket(input : Types::CreateBucketRequest) : Types::CreateBucketResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBucketResult, "CreateBucket")
      end

      # Creates a new access key for the specified Amazon Lightsail bucket. Access keys consist of an access
      # key ID and corresponding secret access key. Access keys grant full programmatic access to the
      # specified bucket and its objects. You can have a maximum of two access keys per bucket. Use the
      # GetBucketAccessKeys action to get a list of current access keys for a specific bucket. For more
      # information about access keys, see Creating access keys for a bucket in Amazon Lightsail in the
      # Amazon Lightsail Developer Guide . The secretAccessKey value is returned only in response to the
      # CreateBucketAccessKey action. You can get a secret access key only when you first create an access
      # key; you cannot get the secret access key later. If you lose the secret access key, you must create
      # a new access key.

      def create_bucket_access_key(
        bucket_name : String
      ) : Types::CreateBucketAccessKeyResult

        input = Types::CreateBucketAccessKeyRequest.new(bucket_name: bucket_name)
        create_bucket_access_key(input)
      end

      def create_bucket_access_key(input : Types::CreateBucketAccessKeyRequest) : Types::CreateBucketAccessKeyResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_BUCKET_ACCESS_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBucketAccessKeyResult, "CreateBucketAccessKey")
      end

      # Creates an SSL/TLS certificate for an Amazon Lightsail content delivery network (CDN) distribution
      # and a container service. After the certificate is valid, use the AttachCertificateToDistribution
      # action to use the certificate and its domains with your distribution. Or use the
      # UpdateContainerService action to use the certificate and its domains with your container service.
      # Only certificates created in the us-east-1 Amazon Web Services Region can be attached to Lightsail
      # distributions. Lightsail distributions are global resources that can reference an origin in any
      # Amazon Web Services Region, and distribute its content globally. However, all distributions are
      # located in the us-east-1 Region.

      def create_certificate(
        certificate_name : String,
        domain_name : String,
        subject_alternative_names : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCertificateResult

        input = Types::CreateCertificateRequest.new(certificate_name: certificate_name, domain_name: domain_name, subject_alternative_names: subject_alternative_names, tags: tags)
        create_certificate(input)
      end

      def create_certificate(input : Types::CreateCertificateRequest) : Types::CreateCertificateResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCertificateResult, "CreateCertificate")
      end

      # Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon
      # Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to
      # track the AWS CloudFormation stack created. Use the get cloud formation stack records operation to
      # get a list of the CloudFormation stacks created. Wait until after your new Amazon EC2 instance is
      # created before running the create cloud formation stack operation again with the same export
      # snapshot record.

      def create_cloud_formation_stack(
        instances : Array(Types::InstanceEntry)
      ) : Types::CreateCloudFormationStackResult

        input = Types::CreateCloudFormationStackRequest.new(instances: instances)
        create_cloud_formation_stack(input)
      end

      def create_cloud_formation_stack(input : Types::CreateCloudFormationStackRequest) : Types::CreateCloudFormationStackResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLOUD_FORMATION_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCloudFormationStackResult, "CreateCloudFormationStack")
      end

      # Creates an email or SMS text message contact method. A contact method is used to send you
      # notifications about your Amazon Lightsail resources. You can add one email address and one mobile
      # phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not
      # supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some
      # countries/regions. For more information, see Notifications in Amazon Lightsail .

      def create_contact_method(
        contact_endpoint : String,
        protocol : String
      ) : Types::CreateContactMethodResult

        input = Types::CreateContactMethodRequest.new(contact_endpoint: contact_endpoint, protocol: protocol)
        create_contact_method(input)
      end

      def create_contact_method(input : Types::CreateContactMethodRequest) : Types::CreateContactMethodResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTACT_METHOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContactMethodResult, "CreateContactMethod")
      end

      # Creates an Amazon Lightsail container service. A Lightsail container service is a compute resource
      # to which you can deploy containers. For more information, see Container services in Amazon Lightsail
      # in the Lightsail Dev Guide .

      def create_container_service(
        power : String,
        scale : Int32,
        service_name : String,
        deployment : Types::ContainerServiceDeploymentRequest? = nil,
        private_registry_access : Types::PrivateRegistryAccessRequest? = nil,
        public_domain_names : Hash(String, Array(String))? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateContainerServiceResult

        input = Types::CreateContainerServiceRequest.new(power: power, scale: scale, service_name: service_name, deployment: deployment, private_registry_access: private_registry_access, public_domain_names: public_domain_names, tags: tags)
        create_container_service(input)
      end

      def create_container_service(input : Types::CreateContainerServiceRequest) : Types::CreateContainerServiceResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTAINER_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContainerServiceResult, "CreateContainerService")
      end

      # Creates a deployment for your Amazon Lightsail container service. A deployment specifies the
      # containers that will be launched on the container service and their settings, such as the ports to
      # open, the environment variables to apply, and the launch command to run. It also specifies the
      # container that will serve as the public endpoint of the deployment and its settings, such as the
      # HTTP or HTTPS port to use, and the health check configuration. You can deploy containers to your
      # container service using container images from a public registry such as Amazon ECR Public, or from
      # your local machine. For more information, see Creating container images for your Amazon Lightsail
      # container services in the Amazon Lightsail Developer Guide .

      def create_container_service_deployment(
        service_name : String,
        containers : Hash(String, Types::Container)? = nil,
        public_endpoint : Types::EndpointRequest? = nil
      ) : Types::CreateContainerServiceDeploymentResult

        input = Types::CreateContainerServiceDeploymentRequest.new(service_name: service_name, containers: containers, public_endpoint: public_endpoint)
        create_container_service_deployment(input)
      end

      def create_container_service_deployment(input : Types::CreateContainerServiceDeploymentRequest) : Types::CreateContainerServiceDeploymentResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTAINER_SERVICE_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContainerServiceDeploymentResult, "CreateContainerServiceDeployment")
      end

      # Creates a temporary set of log in credentials that you can use to log in to the Docker process on
      # your local machine. After you're logged in, you can use the native Docker commands to push your
      # local container images to the container image registry of your Amazon Lightsail account so that you
      # can use them with your Lightsail container service. The log in credentials expire 12 hours after
      # they are created, at which point you will need to create a new set of log in credentials. You can
      # only push container images to the container service registry of your Lightsail account. You cannot
      # pull container images or perform any other container image management actions on the container
      # service registry. After you push your container images to the container image registry of your
      # Lightsail account, use the RegisterContainerImage action to register the pushed images to a specific
      # Lightsail container service. This action is not required if you install and use the Lightsail
      # Control (lightsailctl) plugin to push container images to your Lightsail container service. For more
      # information, see Pushing and managing container images on your Amazon Lightsail container services
      # in the Amazon Lightsail Developer Guide .

      def create_container_service_registry_login : Types::CreateContainerServiceRegistryLoginResult
        input = Types::CreateContainerServiceRegistryLoginRequest.new
        create_container_service_registry_login(input)
      end

      def create_container_service_registry_login(input : Types::CreateContainerServiceRegistryLoginRequest) : Types::CreateContainerServiceRegistryLoginResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTAINER_SERVICE_REGISTRY_LOGIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContainerServiceRegistryLoginResult, "CreateContainerServiceRegistryLogin")
      end

      # Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same
      # Availability Zone ( us-east-2a ). The create disk operation supports tag-based access control via
      # request tags. For more information, see the Amazon Lightsail Developer Guide .

      def create_disk(
        availability_zone : String,
        disk_name : String,
        size_in_gb : Int32,
        add_ons : Array(Types::AddOnRequest)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDiskResult

        input = Types::CreateDiskRequest.new(availability_zone: availability_zone, disk_name: disk_name, size_in_gb: size_in_gb, add_ons: add_ons, tags: tags)
        create_disk(input)
      end

      def create_disk(input : Types::CreateDiskRequest) : Types::CreateDiskResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DISK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDiskResult, "CreateDisk")
      end

      # Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can
      # be attached to an Amazon Lightsail instance in the same Availability Zone ( us-east-2a ). The create
      # disk from snapshot operation supports tag-based access control via request tags and resource tags
      # applied to the resource identified by disk snapshot name . For more information, see the Amazon
      # Lightsail Developer Guide .

      def create_disk_from_snapshot(
        availability_zone : String,
        disk_name : String,
        size_in_gb : Int32,
        add_ons : Array(Types::AddOnRequest)? = nil,
        disk_snapshot_name : String? = nil,
        restore_date : String? = nil,
        source_disk_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        use_latest_restorable_auto_snapshot : Bool? = nil
      ) : Types::CreateDiskFromSnapshotResult

        input = Types::CreateDiskFromSnapshotRequest.new(availability_zone: availability_zone, disk_name: disk_name, size_in_gb: size_in_gb, add_ons: add_ons, disk_snapshot_name: disk_snapshot_name, restore_date: restore_date, source_disk_name: source_disk_name, tags: tags, use_latest_restorable_auto_snapshot: use_latest_restorable_auto_snapshot)
        create_disk_from_snapshot(input)
      end

      def create_disk_from_snapshot(input : Types::CreateDiskFromSnapshotRequest) : Types::CreateDiskFromSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DISK_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDiskFromSnapshotResult, "CreateDiskFromSnapshot")
      end

      # Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of
      # disks, and to save data before shutting down a Lightsail instance. You can take a snapshot of an
      # attached disk that is in use; however, snapshots only capture data that has been written to your
      # disk at the time the snapshot command is issued. This may exclude any data that has been cached by
      # any applications or the operating system. If you can pause any file systems on the disk long enough
      # to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file
      # writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create
      # disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You
      # may remount and use your disk while the snapshot status is pending. You can also use this operation
      # to create a snapshot of an instance's system volume. You might want to do this, for example, to
      # recover data from the system volume of a botched instance or to create a backup of the system volume
      # like you would for a block storage disk. To create a snapshot of a system volume, just define the
      # instance name parameter when issuing the snapshot command, and a snapshot of the defined instance's
      # system volume will be created. After the snapshot is available, you can create a block storage disk
      # from the snapshot and attach it to a running instance to access the data on the disk. The create
      # disk snapshot operation supports tag-based access control via request tags. For more information,
      # see the Amazon Lightsail Developer Guide .

      def create_disk_snapshot(
        disk_snapshot_name : String,
        disk_name : String? = nil,
        instance_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDiskSnapshotResult

        input = Types::CreateDiskSnapshotRequest.new(disk_snapshot_name: disk_snapshot_name, disk_name: disk_name, instance_name: instance_name, tags: tags)
        create_disk_snapshot(input)
      end

      def create_disk_snapshot(input : Types::CreateDiskSnapshotRequest) : Types::CreateDiskSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DISK_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDiskSnapshotResult, "CreateDiskSnapshot")
      end

      # Creates an Amazon Lightsail content delivery network (CDN) distribution. A distribution is a
      # globally distributed network of caching servers that improve the performance of your website or web
      # application hosted on a Lightsail instance. For more information, see Content delivery networks in
      # Amazon Lightsail .

      def create_distribution(
        bundle_id : String,
        default_cache_behavior : Types::CacheBehavior,
        distribution_name : String,
        origin : Types::InputOrigin,
        cache_behavior_settings : Types::CacheSettings? = nil,
        cache_behaviors : Array(Types::CacheBehaviorPerPath)? = nil,
        certificate_name : String? = nil,
        ip_address_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        viewer_minimum_tls_protocol_version : String? = nil
      ) : Types::CreateDistributionResult

        input = Types::CreateDistributionRequest.new(bundle_id: bundle_id, default_cache_behavior: default_cache_behavior, distribution_name: distribution_name, origin: origin, cache_behavior_settings: cache_behavior_settings, cache_behaviors: cache_behaviors, certificate_name: certificate_name, ip_address_type: ip_address_type, tags: tags, viewer_minimum_tls_protocol_version: viewer_minimum_tls_protocol_version)
        create_distribution(input)
      end

      def create_distribution(input : Types::CreateDistributionRequest) : Types::CreateDistributionResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDistributionResult, "CreateDistribution")
      end

      # Creates a domain resource for the specified domain (example.com). The create domain operation
      # supports tag-based access control via request tags. For more information, see the Amazon Lightsail
      # Developer Guide .

      def create_domain(
        domain_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDomainResult

        input = Types::CreateDomainRequest.new(domain_name: domain_name, tags: tags)
        create_domain(input)
      end

      def create_domain(input : Types::CreateDomainRequest) : Types::CreateDomainResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDomainResult, "CreateDomain")
      end

      # Creates one of the following domain name system (DNS) records in a domain DNS zone: Address (A),
      # canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service
      # locator (SRV), or text (TXT). The create domain entry operation supports tag-based access control
      # via resource tags applied to the resource identified by domain name . For more information, see the
      # Amazon Lightsail Developer Guide .

      def create_domain_entry(
        domain_entry : Types::DomainEntry,
        domain_name : String
      ) : Types::CreateDomainEntryResult

        input = Types::CreateDomainEntryRequest.new(domain_entry: domain_entry, domain_name: domain_name)
        create_domain_entry(input)
      end

      def create_domain_entry(input : Types::CreateDomainEntryRequest) : Types::CreateDomainEntryResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DOMAIN_ENTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDomainEntryResult, "CreateDomainEntry")
      end

      # Creates two URLs that are used to access a virtual computer’s graphical user interface (GUI)
      # session. The primary URL initiates a web-based Amazon DCV session to the virtual computer's
      # application. The secondary URL initiates a web-based Amazon DCV session to the virtual computer's
      # operating session. Use StartGUISession to open the session.

      def create_gui_session_access_details(
        resource_name : String
      ) : Types::CreateGUISessionAccessDetailsResult

        input = Types::CreateGUISessionAccessDetailsRequest.new(resource_name: resource_name)
        create_gui_session_access_details(input)
      end

      def create_gui_session_access_details(input : Types::CreateGUISessionAccessDetailsRequest) : Types::CreateGUISessionAccessDetailsResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_GUI_SESSION_ACCESS_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGUISessionAccessDetailsResult, "CreateGUISessionAccessDetails")
      end

      # Creates a snapshot of a specific virtual private server, or instance . You can use a snapshot to
      # create a new instance that is based on that snapshot. The create instance snapshot operation
      # supports tag-based access control via request tags. For more information, see the Amazon Lightsail
      # Developer Guide .

      def create_instance_snapshot(
        instance_name : String,
        instance_snapshot_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateInstanceSnapshotResult

        input = Types::CreateInstanceSnapshotRequest.new(instance_name: instance_name, instance_snapshot_name: instance_snapshot_name, tags: tags)
        create_instance_snapshot(input)
      end

      def create_instance_snapshot(input : Types::CreateInstanceSnapshotRequest) : Types::CreateInstanceSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_INSTANCE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInstanceSnapshotResult, "CreateInstanceSnapshot")
      end

      # Creates one or more Amazon Lightsail instances. The create instances operation supports tag-based
      # access control via request tags. For more information, see the Lightsail Developer Guide .

      def create_instances(
        availability_zone : String,
        blueprint_id : String,
        bundle_id : String,
        instance_names : Array(String),
        add_ons : Array(Types::AddOnRequest)? = nil,
        custom_image_name : String? = nil,
        ip_address_type : String? = nil,
        key_pair_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        user_data : String? = nil
      ) : Types::CreateInstancesResult

        input = Types::CreateInstancesRequest.new(availability_zone: availability_zone, blueprint_id: blueprint_id, bundle_id: bundle_id, instance_names: instance_names, add_ons: add_ons, custom_image_name: custom_image_name, ip_address_type: ip_address_type, key_pair_name: key_pair_name, tags: tags, user_data: user_data)
        create_instances(input)
      end

      def create_instances(input : Types::CreateInstancesRequest) : Types::CreateInstancesResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInstancesResult, "CreateInstances")
      end

      # Creates one or more new instances from a manual or automatic snapshot of an instance. The create
      # instances from snapshot operation supports tag-based access control via request tags and resource
      # tags applied to the resource identified by instance snapshot name . For more information, see the
      # Amazon Lightsail Developer Guide .

      def create_instances_from_snapshot(
        availability_zone : String,
        bundle_id : String,
        instance_names : Array(String),
        add_ons : Array(Types::AddOnRequest)? = nil,
        attached_disk_mapping : Hash(String, Array(Types::DiskMap))? = nil,
        instance_snapshot_name : String? = nil,
        ip_address_type : String? = nil,
        key_pair_name : String? = nil,
        restore_date : String? = nil,
        source_instance_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        use_latest_restorable_auto_snapshot : Bool? = nil,
        user_data : String? = nil
      ) : Types::CreateInstancesFromSnapshotResult

        input = Types::CreateInstancesFromSnapshotRequest.new(availability_zone: availability_zone, bundle_id: bundle_id, instance_names: instance_names, add_ons: add_ons, attached_disk_mapping: attached_disk_mapping, instance_snapshot_name: instance_snapshot_name, ip_address_type: ip_address_type, key_pair_name: key_pair_name, restore_date: restore_date, source_instance_name: source_instance_name, tags: tags, use_latest_restorable_auto_snapshot: use_latest_restorable_auto_snapshot, user_data: user_data)
        create_instances_from_snapshot(input)
      end

      def create_instances_from_snapshot(input : Types::CreateInstancesFromSnapshotRequest) : Types::CreateInstancesFromSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_INSTANCES_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInstancesFromSnapshotResult, "CreateInstancesFromSnapshot")
      end

      # Creates a custom SSH key pair that you can use with an Amazon Lightsail instance. Use the
      # DownloadDefaultKeyPair action to create a Lightsail default key pair in an Amazon Web Services
      # Region where a default key pair does not currently exist. The create key pair operation supports
      # tag-based access control via request tags. For more information, see the Amazon Lightsail Developer
      # Guide .

      def create_key_pair(
        key_pair_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateKeyPairResult

        input = Types::CreateKeyPairRequest.new(key_pair_name: key_pair_name, tags: tags)
        create_key_pair(input)
      end

      def create_key_pair(input : Types::CreateKeyPairRequest) : Types::CreateKeyPairResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_KEY_PAIR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateKeyPairResult, "CreateKeyPair")
      end

      # Creates a Lightsail load balancer. To learn more about deciding whether to load balance your
      # application, see Configure your Lightsail instances for load balancing . You can create up to 10
      # load balancers per AWS Region in your account. When you create a load balancer, you can specify a
      # unique name and port settings. To change additional load balancer settings, use the
      # UpdateLoadBalancerAttribute operation. The create load balancer operation supports tag-based access
      # control via request tags. For more information, see the Amazon Lightsail Developer Guide .

      def create_load_balancer(
        instance_port : Int32,
        load_balancer_name : String,
        certificate_alternative_names : Array(String)? = nil,
        certificate_domain_name : String? = nil,
        certificate_name : String? = nil,
        health_check_path : String? = nil,
        ip_address_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tls_policy_name : String? = nil
      ) : Types::CreateLoadBalancerResult

        input = Types::CreateLoadBalancerRequest.new(instance_port: instance_port, load_balancer_name: load_balancer_name, certificate_alternative_names: certificate_alternative_names, certificate_domain_name: certificate_domain_name, certificate_name: certificate_name, health_check_path: health_check_path, ip_address_type: ip_address_type, tags: tags, tls_policy_name: tls_policy_name)
        create_load_balancer(input)
      end

      def create_load_balancer(input : Types::CreateLoadBalancerRequest) : Types::CreateLoadBalancerResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLoadBalancerResult, "CreateLoadBalancer")
      end

      # Creates an SSL/TLS certificate for an Amazon Lightsail load balancer. TLS is just an updated, more
      # secure version of Secure Socket Layer (SSL). The CreateLoadBalancerTlsCertificate operation supports
      # tag-based access control via resource tags applied to the resource identified by load balancer name
      # . For more information, see the Amazon Lightsail Developer Guide .

      def create_load_balancer_tls_certificate(
        certificate_domain_name : String,
        certificate_name : String,
        load_balancer_name : String,
        certificate_alternative_names : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLoadBalancerTlsCertificateResult

        input = Types::CreateLoadBalancerTlsCertificateRequest.new(certificate_domain_name: certificate_domain_name, certificate_name: certificate_name, load_balancer_name: load_balancer_name, certificate_alternative_names: certificate_alternative_names, tags: tags)
        create_load_balancer_tls_certificate(input)
      end

      def create_load_balancer_tls_certificate(input : Types::CreateLoadBalancerTlsCertificateRequest) : Types::CreateLoadBalancerTlsCertificateResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOAD_BALANCER_TLS_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLoadBalancerTlsCertificateResult, "CreateLoadBalancerTlsCertificate")
      end

      # Creates a new database in Amazon Lightsail. The create relational database operation supports
      # tag-based access control via request tags. For more information, see the Amazon Lightsail Developer
      # Guide .

      def create_relational_database(
        master_database_name : String,
        master_username : String,
        relational_database_blueprint_id : String,
        relational_database_bundle_id : String,
        relational_database_name : String,
        availability_zone : String? = nil,
        master_user_password : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRelationalDatabaseResult

        input = Types::CreateRelationalDatabaseRequest.new(master_database_name: master_database_name, master_username: master_username, relational_database_blueprint_id: relational_database_blueprint_id, relational_database_bundle_id: relational_database_bundle_id, relational_database_name: relational_database_name, availability_zone: availability_zone, master_user_password: master_user_password, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, tags: tags)
        create_relational_database(input)
      end

      def create_relational_database(input : Types::CreateRelationalDatabaseRequest) : Types::CreateRelationalDatabaseResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_RELATIONAL_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRelationalDatabaseResult, "CreateRelationalDatabase")
      end

      # Creates a new database from an existing database snapshot in Amazon Lightsail. You can create a new
      # database from a snapshot in if something goes wrong with your original database, or to change it to
      # a different plan, such as a high availability or standard plan. The create relational database from
      # snapshot operation supports tag-based access control via request tags and resource tags applied to
      # the resource identified by relationalDatabaseSnapshotName. For more information, see the Amazon
      # Lightsail Developer Guide .

      def create_relational_database_from_snapshot(
        relational_database_name : String,
        availability_zone : String? = nil,
        publicly_accessible : Bool? = nil,
        relational_database_bundle_id : String? = nil,
        relational_database_snapshot_name : String? = nil,
        restore_time : Time? = nil,
        source_relational_database_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        use_latest_restorable_time : Bool? = nil
      ) : Types::CreateRelationalDatabaseFromSnapshotResult

        input = Types::CreateRelationalDatabaseFromSnapshotRequest.new(relational_database_name: relational_database_name, availability_zone: availability_zone, publicly_accessible: publicly_accessible, relational_database_bundle_id: relational_database_bundle_id, relational_database_snapshot_name: relational_database_snapshot_name, restore_time: restore_time, source_relational_database_name: source_relational_database_name, tags: tags, use_latest_restorable_time: use_latest_restorable_time)
        create_relational_database_from_snapshot(input)
      end

      def create_relational_database_from_snapshot(input : Types::CreateRelationalDatabaseFromSnapshotRequest) : Types::CreateRelationalDatabaseFromSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_RELATIONAL_DATABASE_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRelationalDatabaseFromSnapshotResult, "CreateRelationalDatabaseFromSnapshot")
      end

      # Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make
      # copies of a database, and to save data before deleting a database. The create relational database
      # snapshot operation supports tag-based access control via request tags. For more information, see the
      # Amazon Lightsail Developer Guide .

      def create_relational_database_snapshot(
        relational_database_name : String,
        relational_database_snapshot_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRelationalDatabaseSnapshotResult

        input = Types::CreateRelationalDatabaseSnapshotRequest.new(relational_database_name: relational_database_name, relational_database_snapshot_name: relational_database_snapshot_name, tags: tags)
        create_relational_database_snapshot(input)
      end

      def create_relational_database_snapshot(input : Types::CreateRelationalDatabaseSnapshotRequest) : Types::CreateRelationalDatabaseSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_RELATIONAL_DATABASE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRelationalDatabaseSnapshotResult, "CreateRelationalDatabaseSnapshot")
      end

      # Deletes an alarm. An alarm is used to monitor a single metric for one of your resources. When a
      # metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed
      # on the Amazon Lightsail console. For more information, see Alarms in Amazon Lightsail .

      def delete_alarm(
        alarm_name : String
      ) : Types::DeleteAlarmResult

        input = Types::DeleteAlarmRequest.new(alarm_name: alarm_name)
        delete_alarm(input)
      end

      def delete_alarm(input : Types::DeleteAlarmRequest) : Types::DeleteAlarmResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ALARM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAlarmResult, "DeleteAlarm")
      end

      # Deletes an automatic snapshot of an instance or disk. For more information, see the Amazon Lightsail
      # Developer Guide .

      def delete_auto_snapshot(
        date : String,
        resource_name : String
      ) : Types::DeleteAutoSnapshotResult

        input = Types::DeleteAutoSnapshotRequest.new(date: date, resource_name: resource_name)
        delete_auto_snapshot(input)
      end

      def delete_auto_snapshot(input : Types::DeleteAutoSnapshotRequest) : Types::DeleteAutoSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_AUTO_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAutoSnapshotResult, "DeleteAutoSnapshot")
      end

      # Deletes a Amazon Lightsail bucket. When you delete your bucket, the bucket name is released and can
      # be reused for a new bucket in your account or another Amazon Web Services account.

      def delete_bucket(
        bucket_name : String,
        force_delete : Bool? = nil
      ) : Types::DeleteBucketResult

        input = Types::DeleteBucketRequest.new(bucket_name: bucket_name, force_delete: force_delete)
        delete_bucket(input)
      end

      def delete_bucket(input : Types::DeleteBucketRequest) : Types::DeleteBucketResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBucketResult, "DeleteBucket")
      end

      # Deletes an access key for the specified Amazon Lightsail bucket. We recommend that you delete an
      # access key if the secret access key is compromised. For more information about access keys, see
      # Creating access keys for a bucket in Amazon Lightsail in the Amazon Lightsail Developer Guide .

      def delete_bucket_access_key(
        access_key_id : String,
        bucket_name : String
      ) : Types::DeleteBucketAccessKeyResult

        input = Types::DeleteBucketAccessKeyRequest.new(access_key_id: access_key_id, bucket_name: bucket_name)
        delete_bucket_access_key(input)
      end

      def delete_bucket_access_key(input : Types::DeleteBucketAccessKeyRequest) : Types::DeleteBucketAccessKeyResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_BUCKET_ACCESS_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBucketAccessKeyResult, "DeleteBucketAccessKey")
      end

      # Deletes an SSL/TLS certificate for your Amazon Lightsail content delivery network (CDN)
      # distribution. Certificates that are currently attached to a distribution cannot be deleted. Use the
      # DetachCertificateFromDistribution action to detach a certificate from a distribution.

      def delete_certificate(
        certificate_name : String
      ) : Types::DeleteCertificateResult

        input = Types::DeleteCertificateRequest.new(certificate_name: certificate_name)
        delete_certificate(input)
      end

      def delete_certificate(input : Types::DeleteCertificateRequest) : Types::DeleteCertificateResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCertificateResult, "DeleteCertificate")
      end

      # Deletes a contact method. A contact method is used to send you notifications about your Amazon
      # Lightsail resources. You can add one email address and one mobile phone number contact method in
      # each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web
      # Services Regions, and SMS text messages cannot be sent to some countries/regions. For more
      # information, see Notifications in Amazon Lightsail .

      def delete_contact_method(
        protocol : String
      ) : Types::DeleteContactMethodResult

        input = Types::DeleteContactMethodRequest.new(protocol: protocol)
        delete_contact_method(input)
      end

      def delete_contact_method(input : Types::DeleteContactMethodRequest) : Types::DeleteContactMethodResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTACT_METHOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContactMethodResult, "DeleteContactMethod")
      end

      # Deletes a container image that is registered to your Amazon Lightsail container service.

      def delete_container_image(
        image : String,
        service_name : String
      ) : Types::DeleteContainerImageResult

        input = Types::DeleteContainerImageRequest.new(image: image, service_name: service_name)
        delete_container_image(input)
      end

      def delete_container_image(input : Types::DeleteContainerImageRequest) : Types::DeleteContainerImageResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTAINER_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContainerImageResult, "DeleteContainerImage")
      end

      # Deletes your Amazon Lightsail container service.

      def delete_container_service(
        service_name : String
      ) : Types::DeleteContainerServiceResult

        input = Types::DeleteContainerServiceRequest.new(service_name: service_name)
        delete_container_service(input)
      end

      def delete_container_service(input : Types::DeleteContainerServiceRequest) : Types::DeleteContainerServiceResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTAINER_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContainerServiceResult, "DeleteContainerService")
      end

      # Deletes the specified block storage disk. The disk must be in the available state (not attached to a
      # Lightsail instance). The disk may remain in the deleting state for several minutes. The delete disk
      # operation supports tag-based access control via resource tags applied to the resource identified by
      # disk name . For more information, see the Amazon Lightsail Developer Guide .

      def delete_disk(
        disk_name : String,
        force_delete_add_ons : Bool? = nil
      ) : Types::DeleteDiskResult

        input = Types::DeleteDiskRequest.new(disk_name: disk_name, force_delete_add_ons: force_delete_add_ons)
        delete_disk(input)
      end

      def delete_disk(input : Types::DeleteDiskRequest) : Types::DeleteDiskResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DISK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDiskResult, "DeleteDisk")
      end

      # Deletes the specified disk snapshot. When you make periodic snapshots of a disk, the snapshots are
      # incremental, and only the blocks on the device that have changed since your last snapshot are saved
      # in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is
      # removed. So regardless of which prior snapshots have been deleted, all active snapshots will have
      # access to all the information needed to restore the disk. The delete disk snapshot operation
      # supports tag-based access control via resource tags applied to the resource identified by disk
      # snapshot name . For more information, see the Amazon Lightsail Developer Guide .

      def delete_disk_snapshot(
        disk_snapshot_name : String
      ) : Types::DeleteDiskSnapshotResult

        input = Types::DeleteDiskSnapshotRequest.new(disk_snapshot_name: disk_snapshot_name)
        delete_disk_snapshot(input)
      end

      def delete_disk_snapshot(input : Types::DeleteDiskSnapshotRequest) : Types::DeleteDiskSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DISK_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDiskSnapshotResult, "DeleteDiskSnapshot")
      end

      # Deletes your Amazon Lightsail content delivery network (CDN) distribution.

      def delete_distribution(
        distribution_name : String? = nil
      ) : Types::DeleteDistributionResult

        input = Types::DeleteDistributionRequest.new(distribution_name: distribution_name)
        delete_distribution(input)
      end

      def delete_distribution(input : Types::DeleteDistributionRequest) : Types::DeleteDistributionResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDistributionResult, "DeleteDistribution")
      end

      # Deletes the specified domain recordset and all of its domain records. The delete domain operation
      # supports tag-based access control via resource tags applied to the resource identified by domain
      # name . For more information, see the Amazon Lightsail Developer Guide .

      def delete_domain(
        domain_name : String
      ) : Types::DeleteDomainResult

        input = Types::DeleteDomainRequest.new(domain_name: domain_name)
        delete_domain(input)
      end

      def delete_domain(input : Types::DeleteDomainRequest) : Types::DeleteDomainResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDomainResult, "DeleteDomain")
      end

      # Deletes a specific domain entry. The delete domain entry operation supports tag-based access control
      # via resource tags applied to the resource identified by domain name . For more information, see the
      # Amazon Lightsail Developer Guide .

      def delete_domain_entry(
        domain_entry : Types::DomainEntry,
        domain_name : String
      ) : Types::DeleteDomainEntryResult

        input = Types::DeleteDomainEntryRequest.new(domain_entry: domain_entry, domain_name: domain_name)
        delete_domain_entry(input)
      end

      def delete_domain_entry(input : Types::DeleteDomainEntryRequest) : Types::DeleteDomainEntryResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DOMAIN_ENTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDomainEntryResult, "DeleteDomainEntry")
      end

      # Deletes an Amazon Lightsail instance. The delete instance operation supports tag-based access
      # control via resource tags applied to the resource identified by instance name . For more
      # information, see the Amazon Lightsail Developer Guide .

      def delete_instance(
        instance_name : String,
        force_delete_add_ons : Bool? = nil
      ) : Types::DeleteInstanceResult

        input = Types::DeleteInstanceRequest.new(instance_name: instance_name, force_delete_add_ons: force_delete_add_ons)
        delete_instance(input)
      end

      def delete_instance(input : Types::DeleteInstanceRequest) : Types::DeleteInstanceResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInstanceResult, "DeleteInstance")
      end

      # Deletes a specific snapshot of a virtual private server (or instance ). The delete instance snapshot
      # operation supports tag-based access control via resource tags applied to the resource identified by
      # instance snapshot name . For more information, see the Amazon Lightsail Developer Guide .

      def delete_instance_snapshot(
        instance_snapshot_name : String
      ) : Types::DeleteInstanceSnapshotResult

        input = Types::DeleteInstanceSnapshotRequest.new(instance_snapshot_name: instance_snapshot_name)
        delete_instance_snapshot(input)
      end

      def delete_instance_snapshot(input : Types::DeleteInstanceSnapshotRequest) : Types::DeleteInstanceSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_INSTANCE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInstanceSnapshotResult, "DeleteInstanceSnapshot")
      end

      # Deletes the specified key pair by removing the public key from Amazon Lightsail. You can delete key
      # pairs that were created using the ImportKeyPair and CreateKeyPair actions, as well as the Lightsail
      # default key pair. A new default key pair will not be created unless you launch an instance without
      # specifying a custom key pair, or you call the DownloadDefaultKeyPair API. The delete key pair
      # operation supports tag-based access control via resource tags applied to the resource identified by
      # key pair name . For more information, see the Amazon Lightsail Developer Guide .

      def delete_key_pair(
        key_pair_name : String,
        expected_fingerprint : String? = nil
      ) : Types::DeleteKeyPairResult

        input = Types::DeleteKeyPairRequest.new(key_pair_name: key_pair_name, expected_fingerprint: expected_fingerprint)
        delete_key_pair(input)
      end

      def delete_key_pair(input : Types::DeleteKeyPairRequest) : Types::DeleteKeyPairResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_KEY_PAIR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteKeyPairResult, "DeleteKeyPair")
      end

      # Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP
      # clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP
      # clients to connect to the instance after a host key mismatch. Perform this operation only if you
      # were expecting the host key or certificate mismatch or if you are familiar with the new host key or
      # certificate on the instance. For more information, see Troubleshooting connection issues when using
      # the Amazon Lightsail browser-based SSH or RDP client .

      def delete_known_host_keys(
        instance_name : String
      ) : Types::DeleteKnownHostKeysResult

        input = Types::DeleteKnownHostKeysRequest.new(instance_name: instance_name)
        delete_known_host_keys(input)
      end

      def delete_known_host_keys(input : Types::DeleteKnownHostKeysRequest) : Types::DeleteKnownHostKeysResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_KNOWN_HOST_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteKnownHostKeysResult, "DeleteKnownHostKeys")
      end

      # Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load
      # balancer is deleted, you will need to create a new load balancer, create a new certificate, and
      # verify domain ownership again. The delete load balancer operation supports tag-based access control
      # via resource tags applied to the resource identified by load balancer name . For more information,
      # see the Amazon Lightsail Developer Guide .

      def delete_load_balancer(
        load_balancer_name : String
      ) : Types::DeleteLoadBalancerResult

        input = Types::DeleteLoadBalancerRequest.new(load_balancer_name: load_balancer_name)
        delete_load_balancer(input)
      end

      def delete_load_balancer(input : Types::DeleteLoadBalancerRequest) : Types::DeleteLoadBalancerResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLoadBalancerResult, "DeleteLoadBalancer")
      end

      # Deletes an SSL/TLS certificate associated with a Lightsail load balancer. The
      # DeleteLoadBalancerTlsCertificate operation supports tag-based access control via resource tags
      # applied to the resource identified by load balancer name . For more information, see the Amazon
      # Lightsail Developer Guide .

      def delete_load_balancer_tls_certificate(
        certificate_name : String,
        load_balancer_name : String,
        force : Bool? = nil
      ) : Types::DeleteLoadBalancerTlsCertificateResult

        input = Types::DeleteLoadBalancerTlsCertificateRequest.new(certificate_name: certificate_name, load_balancer_name: load_balancer_name, force: force)
        delete_load_balancer_tls_certificate(input)
      end

      def delete_load_balancer_tls_certificate(input : Types::DeleteLoadBalancerTlsCertificateRequest) : Types::DeleteLoadBalancerTlsCertificateResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOAD_BALANCER_TLS_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLoadBalancerTlsCertificateResult, "DeleteLoadBalancerTlsCertificate")
      end

      # Deletes a database in Amazon Lightsail. The delete relational database operation supports tag-based
      # access control via resource tags applied to the resource identified by relationalDatabaseName. For
      # more information, see the Amazon Lightsail Developer Guide .

      def delete_relational_database(
        relational_database_name : String,
        final_relational_database_snapshot_name : String? = nil,
        skip_final_snapshot : Bool? = nil
      ) : Types::DeleteRelationalDatabaseResult

        input = Types::DeleteRelationalDatabaseRequest.new(relational_database_name: relational_database_name, final_relational_database_snapshot_name: final_relational_database_snapshot_name, skip_final_snapshot: skip_final_snapshot)
        delete_relational_database(input)
      end

      def delete_relational_database(input : Types::DeleteRelationalDatabaseRequest) : Types::DeleteRelationalDatabaseResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_RELATIONAL_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRelationalDatabaseResult, "DeleteRelationalDatabase")
      end

      # Deletes a database snapshot in Amazon Lightsail. The delete relational database snapshot operation
      # supports tag-based access control via resource tags applied to the resource identified by
      # relationalDatabaseName. For more information, see the Amazon Lightsail Developer Guide .

      def delete_relational_database_snapshot(
        relational_database_snapshot_name : String
      ) : Types::DeleteRelationalDatabaseSnapshotResult

        input = Types::DeleteRelationalDatabaseSnapshotRequest.new(relational_database_snapshot_name: relational_database_snapshot_name)
        delete_relational_database_snapshot(input)
      end

      def delete_relational_database_snapshot(input : Types::DeleteRelationalDatabaseSnapshotRequest) : Types::DeleteRelationalDatabaseSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_RELATIONAL_DATABASE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRelationalDatabaseSnapshotResult, "DeleteRelationalDatabaseSnapshot")
      end

      # Detaches an SSL/TLS certificate from your Amazon Lightsail content delivery network (CDN)
      # distribution. After the certificate is detached, your distribution stops accepting traffic for all
      # of the domains that are associated with the certificate.

      def detach_certificate_from_distribution(
        distribution_name : String
      ) : Types::DetachCertificateFromDistributionResult

        input = Types::DetachCertificateFromDistributionRequest.new(distribution_name: distribution_name)
        detach_certificate_from_distribution(input)
      end

      def detach_certificate_from_distribution(input : Types::DetachCertificateFromDistributionRequest) : Types::DetachCertificateFromDistributionResult
        request = Protocol::JsonRpc.build_request(Model::DETACH_CERTIFICATE_FROM_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachCertificateFromDistributionResult, "DetachCertificateFromDistribution")
      end

      # Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file
      # systems on the device within your operating system before stopping the instance and detaching the
      # disk. The detach disk operation supports tag-based access control via resource tags applied to the
      # resource identified by disk name . For more information, see the Amazon Lightsail Developer Guide .

      def detach_disk(
        disk_name : String
      ) : Types::DetachDiskResult

        input = Types::DetachDiskRequest.new(disk_name: disk_name)
        detach_disk(input)
      end

      def detach_disk(input : Types::DetachDiskRequest) : Types::DetachDiskResult
        request = Protocol::JsonRpc.build_request(Model::DETACH_DISK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachDiskResult, "DetachDisk")
      end

      # Detaches the specified instances from a Lightsail load balancer. This operation waits until the
      # instances are no longer needed before they are detached from the load balancer. The detach instances
      # from load balancer operation supports tag-based access control via resource tags applied to the
      # resource identified by load balancer name . For more information, see the Amazon Lightsail Developer
      # Guide .

      def detach_instances_from_load_balancer(
        instance_names : Array(String),
        load_balancer_name : String
      ) : Types::DetachInstancesFromLoadBalancerResult

        input = Types::DetachInstancesFromLoadBalancerRequest.new(instance_names: instance_names, load_balancer_name: load_balancer_name)
        detach_instances_from_load_balancer(input)
      end

      def detach_instances_from_load_balancer(input : Types::DetachInstancesFromLoadBalancerRequest) : Types::DetachInstancesFromLoadBalancerResult
        request = Protocol::JsonRpc.build_request(Model::DETACH_INSTANCES_FROM_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachInstancesFromLoadBalancerResult, "DetachInstancesFromLoadBalancer")
      end

      # Detaches a static IP from the Amazon Lightsail instance to which it is attached.

      def detach_static_ip(
        static_ip_name : String
      ) : Types::DetachStaticIpResult

        input = Types::DetachStaticIpRequest.new(static_ip_name: static_ip_name)
        detach_static_ip(input)
      end

      def detach_static_ip(input : Types::DetachStaticIpRequest) : Types::DetachStaticIpResult
        request = Protocol::JsonRpc.build_request(Model::DETACH_STATIC_IP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachStaticIpResult, "DetachStaticIp")
      end

      # Disables an add-on for an Amazon Lightsail resource. For more information, see the Amazon Lightsail
      # Developer Guide .

      def disable_add_on(
        add_on_type : String,
        resource_name : String
      ) : Types::DisableAddOnResult

        input = Types::DisableAddOnRequest.new(add_on_type: add_on_type, resource_name: resource_name)
        disable_add_on(input)
      end

      def disable_add_on(input : Types::DisableAddOnRequest) : Types::DisableAddOnResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_ADD_ON, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableAddOnResult, "DisableAddOn")
      end

      # Downloads the regional Amazon Lightsail default key pair. This action also creates a Lightsail
      # default key pair if a default key pair does not currently exist in the Amazon Web Services Region.

      def download_default_key_pair : Types::DownloadDefaultKeyPairResult
        input = Types::DownloadDefaultKeyPairRequest.new
        download_default_key_pair(input)
      end

      def download_default_key_pair(input : Types::DownloadDefaultKeyPairRequest) : Types::DownloadDefaultKeyPairResult
        request = Protocol::JsonRpc.build_request(Model::DOWNLOAD_DEFAULT_KEY_PAIR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DownloadDefaultKeyPairResult, "DownloadDefaultKeyPair")
      end

      # Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the Amazon
      # Lightsail Developer Guide .

      def enable_add_on(
        add_on_request : Types::AddOnRequest,
        resource_name : String
      ) : Types::EnableAddOnResult

        input = Types::EnableAddOnRequest.new(add_on_request: add_on_request, resource_name: resource_name)
        enable_add_on(input)
      end

      def enable_add_on(input : Types::EnableAddOnRequest) : Types::EnableAddOnResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_ADD_ON, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableAddOnResult, "EnableAddOn")
      end

      # Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud
      # (Amazon EC2). This operation results in an export snapshot record that can be used with the create
      # cloud formation stack operation to create new Amazon EC2 instances. Exported instance snapshots
      # appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an
      # Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as
      # Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as
      # the source Lightsail snapshot. The export snapshot operation supports tag-based access control via
      # resource tags applied to the resource identified by source snapshot name . For more information, see
      # the Amazon Lightsail Developer Guide . Use the get instance snapshots or get disk snapshots
      # operations to get a list of snapshots that you can export to Amazon EC2.

      def export_snapshot(
        source_snapshot_name : String
      ) : Types::ExportSnapshotResult

        input = Types::ExportSnapshotRequest.new(source_snapshot_name: source_snapshot_name)
        export_snapshot(input)
      end

      def export_snapshot(input : Types::ExportSnapshotRequest) : Types::ExportSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::EXPORT_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportSnapshotResult, "ExportSnapshot")
      end

      # Returns the names of all active (not deleted) resources.

      def get_active_names(
        page_token : String? = nil
      ) : Types::GetActiveNamesResult

        input = Types::GetActiveNamesRequest.new(page_token: page_token)
        get_active_names(input)
      end

      def get_active_names(input : Types::GetActiveNamesRequest) : Types::GetActiveNamesResult
        request = Protocol::JsonRpc.build_request(Model::GET_ACTIVE_NAMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetActiveNamesResult, "GetActiveNames")
      end

      # Returns information about the configured alarms. Specify an alarm name in your request to return
      # information about a specific alarm, or specify a monitored resource name to return information about
      # all alarms for a specific resource. An alarm is used to monitor a single metric for one of your
      # resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and
      # a banner displayed on the Amazon Lightsail console. For more information, see Alarms in Amazon
      # Lightsail .

      def get_alarms(
        alarm_name : String? = nil,
        monitored_resource_name : String? = nil,
        page_token : String? = nil
      ) : Types::GetAlarmsResult

        input = Types::GetAlarmsRequest.new(alarm_name: alarm_name, monitored_resource_name: monitored_resource_name, page_token: page_token)
        get_alarms(input)
      end

      def get_alarms(input : Types::GetAlarmsRequest) : Types::GetAlarmsResult
        request = Protocol::JsonRpc.build_request(Model::GET_ALARMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAlarmsResult, "GetAlarms")
      end

      # Returns the available automatic snapshots for an instance or disk. For more information, see the
      # Amazon Lightsail Developer Guide .

      def get_auto_snapshots(
        resource_name : String
      ) : Types::GetAutoSnapshotsResult

        input = Types::GetAutoSnapshotsRequest.new(resource_name: resource_name)
        get_auto_snapshots(input)
      end

      def get_auto_snapshots(input : Types::GetAutoSnapshotsRequest) : Types::GetAutoSnapshotsResult
        request = Protocol::JsonRpc.build_request(Model::GET_AUTO_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAutoSnapshotsResult, "GetAutoSnapshots")
      end

      # Returns the list of available instance images, or blueprints . You can use a blueprint to create a
      # new instance already running a specific operating system, as well as a preinstalled app or
      # development stack. The software each instance is running depends on the blueprint image you choose.
      # Use active blueprints when creating new instances. Inactive blueprints are listed to support
      # customers with existing instances and are not necessarily available to create new instances.
      # Blueprints are marked inactive when they become outdated due to operating system updates or new
      # application releases.

      def get_blueprints(
        app_category : String? = nil,
        include_inactive : Bool? = nil,
        page_token : String? = nil
      ) : Types::GetBlueprintsResult

        input = Types::GetBlueprintsRequest.new(app_category: app_category, include_inactive: include_inactive, page_token: page_token)
        get_blueprints(input)
      end

      def get_blueprints(input : Types::GetBlueprintsRequest) : Types::GetBlueprintsResult
        request = Protocol::JsonRpc.build_request(Model::GET_BLUEPRINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBlueprintsResult, "GetBlueprints")
      end

      # Returns the existing access key IDs for the specified Amazon Lightsail bucket. This action does not
      # return the secret access key value of an access key. You can get a secret access key only when you
      # create it from the response of the CreateBucketAccessKey action. If you lose the secret access key,
      # you must create a new access key.

      def get_bucket_access_keys(
        bucket_name : String
      ) : Types::GetBucketAccessKeysResult

        input = Types::GetBucketAccessKeysRequest.new(bucket_name: bucket_name)
        get_bucket_access_keys(input)
      end

      def get_bucket_access_keys(input : Types::GetBucketAccessKeysRequest) : Types::GetBucketAccessKeysResult
        request = Protocol::JsonRpc.build_request(Model::GET_BUCKET_ACCESS_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBucketAccessKeysResult, "GetBucketAccessKeys")
      end

      # Returns the bundles that you can apply to a Amazon Lightsail bucket. The bucket bundle specifies the
      # monthly cost, storage quota, and data transfer quota for a bucket. Use the UpdateBucketBundle action
      # to update the bundle for a bucket.

      def get_bucket_bundles(
        include_inactive : Bool? = nil
      ) : Types::GetBucketBundlesResult

        input = Types::GetBucketBundlesRequest.new(include_inactive: include_inactive)
        get_bucket_bundles(input)
      end

      def get_bucket_bundles(input : Types::GetBucketBundlesRequest) : Types::GetBucketBundlesResult
        request = Protocol::JsonRpc.build_request(Model::GET_BUCKET_BUNDLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBucketBundlesResult, "GetBucketBundles")
      end

      # Returns the data points of a specific metric for an Amazon Lightsail bucket. Metrics report the
      # utilization of a bucket. View and collect metric data regularly to monitor the number of objects
      # stored in a bucket (including object versions) and the storage space used by those objects.

      def get_bucket_metric_data(
        bucket_name : String,
        end_time : Time,
        metric_name : String,
        period : Int32,
        start_time : Time,
        statistics : Array(String),
        unit : String
      ) : Types::GetBucketMetricDataResult

        input = Types::GetBucketMetricDataRequest.new(bucket_name: bucket_name, end_time: end_time, metric_name: metric_name, period: period, start_time: start_time, statistics: statistics, unit: unit)
        get_bucket_metric_data(input)
      end

      def get_bucket_metric_data(input : Types::GetBucketMetricDataRequest) : Types::GetBucketMetricDataResult
        request = Protocol::JsonRpc.build_request(Model::GET_BUCKET_METRIC_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBucketMetricDataResult, "GetBucketMetricData")
      end

      # Returns information about one or more Amazon Lightsail buckets. The information returned includes
      # the synchronization status of the Amazon Simple Storage Service (Amazon S3) account-level block
      # public access feature for your Lightsail buckets. For more information about buckets, see Buckets in
      # Amazon Lightsail in the Amazon Lightsail Developer Guide .

      def get_buckets(
        bucket_name : String? = nil,
        include_connected_resources : Bool? = nil,
        include_cors : Bool? = nil,
        page_token : String? = nil
      ) : Types::GetBucketsResult

        input = Types::GetBucketsRequest.new(bucket_name: bucket_name, include_connected_resources: include_connected_resources, include_cors: include_cors, page_token: page_token)
        get_buckets(input)
      end

      def get_buckets(input : Types::GetBucketsRequest) : Types::GetBucketsResult
        request = Protocol::JsonRpc.build_request(Model::GET_BUCKETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBucketsResult, "GetBuckets")
      end

      # Returns the bundles that you can apply to an Amazon Lightsail instance when you create it. A bundle
      # describes the specifications of an instance, such as the monthly cost, amount of memory, the number
      # of vCPUs, amount of storage space, and monthly network data transfer quota. Bundles are referred to
      # as instance plans in the Lightsail console.

      def get_bundles(
        app_category : String? = nil,
        include_inactive : Bool? = nil,
        page_token : String? = nil
      ) : Types::GetBundlesResult

        input = Types::GetBundlesRequest.new(app_category: app_category, include_inactive: include_inactive, page_token: page_token)
        get_bundles(input)
      end

      def get_bundles(input : Types::GetBundlesRequest) : Types::GetBundlesResult
        request = Protocol::JsonRpc.build_request(Model::GET_BUNDLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBundlesResult, "GetBundles")
      end

      # Returns information about one or more Amazon Lightsail SSL/TLS certificates. To get a summary of a
      # certificate, omit includeCertificateDetails from your request. The response will include only the
      # certificate Amazon Resource Name (ARN), certificate name, domain name, and tags.

      def get_certificates(
        certificate_name : String? = nil,
        certificate_statuses : Array(String)? = nil,
        include_certificate_details : Bool? = nil,
        page_token : String? = nil
      ) : Types::GetCertificatesResult

        input = Types::GetCertificatesRequest.new(certificate_name: certificate_name, certificate_statuses: certificate_statuses, include_certificate_details: include_certificate_details, page_token: page_token)
        get_certificates(input)
      end

      def get_certificates(input : Types::GetCertificatesRequest) : Types::GetCertificatesResult
        request = Protocol::JsonRpc.build_request(Model::GET_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCertificatesResult, "GetCertificates")
      end

      # Returns the CloudFormation stack record created as a result of the create cloud formation stack
      # operation. An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported
      # Lightsail snapshot.

      def get_cloud_formation_stack_records(
        page_token : String? = nil
      ) : Types::GetCloudFormationStackRecordsResult

        input = Types::GetCloudFormationStackRecordsRequest.new(page_token: page_token)
        get_cloud_formation_stack_records(input)
      end

      def get_cloud_formation_stack_records(input : Types::GetCloudFormationStackRecordsRequest) : Types::GetCloudFormationStackRecordsResult
        request = Protocol::JsonRpc.build_request(Model::GET_CLOUD_FORMATION_STACK_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCloudFormationStackRecordsResult, "GetCloudFormationStackRecords")
      end

      # Returns information about the configured contact methods. Specify a protocol in your request to
      # return information about a specific contact method. A contact method is used to send you
      # notifications about your Amazon Lightsail resources. You can add one email address and one mobile
      # phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not
      # supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some
      # countries/regions. For more information, see Notifications in Amazon Lightsail .

      def get_contact_methods(
        protocols : Array(String)? = nil
      ) : Types::GetContactMethodsResult

        input = Types::GetContactMethodsRequest.new(protocols: protocols)
        get_contact_methods(input)
      end

      def get_contact_methods(input : Types::GetContactMethodsRequest) : Types::GetContactMethodsResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTACT_METHODS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContactMethodsResult, "GetContactMethods")
      end

      # Returns information about Amazon Lightsail containers, such as the current version of the Lightsail
      # Control (lightsailctl) plugin.

      def get_container_api_metadata : Types::GetContainerAPIMetadataResult
        input = Types::GetContainerAPIMetadataRequest.new
        get_container_api_metadata(input)
      end

      def get_container_api_metadata(input : Types::GetContainerAPIMetadataRequest) : Types::GetContainerAPIMetadataResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_API_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContainerAPIMetadataResult, "GetContainerAPIMetadata")
      end

      # Returns the container images that are registered to your Amazon Lightsail container service. If you
      # created a deployment on your Lightsail container service that uses container images from a public
      # registry like Docker Hub, those images are not returned as part of this action. Those images are not
      # registered to your Lightsail container service.

      def get_container_images(
        service_name : String
      ) : Types::GetContainerImagesResult

        input = Types::GetContainerImagesRequest.new(service_name: service_name)
        get_container_images(input)
      end

      def get_container_images(input : Types::GetContainerImagesRequest) : Types::GetContainerImagesResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContainerImagesResult, "GetContainerImages")
      end

      # Returns the log events of a container of your Amazon Lightsail container service. If your container
      # service has more than one node (i.e., a scale greater than 1), then the log events that are returned
      # for the specified container are merged from all nodes on your container service. Container logs are
      # retained for a certain amount of time. For more information, see Amazon Lightsail endpoints and
      # quotas in the Amazon Web Services General Reference .

      def get_container_log(
        container_name : String,
        service_name : String,
        end_time : Time? = nil,
        filter_pattern : String? = nil,
        page_token : String? = nil,
        start_time : Time? = nil
      ) : Types::GetContainerLogResult

        input = Types::GetContainerLogRequest.new(container_name: container_name, service_name: service_name, end_time: end_time, filter_pattern: filter_pattern, page_token: page_token, start_time: start_time)
        get_container_log(input)
      end

      def get_container_log(input : Types::GetContainerLogRequest) : Types::GetContainerLogResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_LOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContainerLogResult, "GetContainerLog")
      end

      # Returns the deployments for your Amazon Lightsail container service A deployment specifies the
      # settings, such as the ports and launch command, of containers that are deployed to your container
      # service. The deployments are ordered by version in ascending order. The newest version is listed at
      # the top of the response. A set number of deployments are kept before the oldest one is replaced with
      # the newest one. For more information, see Amazon Lightsail endpoints and quotas in the Amazon Web
      # Services General Reference .

      def get_container_service_deployments(
        service_name : String
      ) : Types::GetContainerServiceDeploymentsResult

        input = Types::GetContainerServiceDeploymentsRequest.new(service_name: service_name)
        get_container_service_deployments(input)
      end

      def get_container_service_deployments(input : Types::GetContainerServiceDeploymentsRequest) : Types::GetContainerServiceDeploymentsResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_SERVICE_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContainerServiceDeploymentsResult, "GetContainerServiceDeployments")
      end

      # Returns the data points of a specific metric of your Amazon Lightsail container service. Metrics
      # report the utilization of your resources. Monitor and collect metric data regularly to maintain the
      # reliability, availability, and performance of your resources.

      def get_container_service_metric_data(
        end_time : Time,
        metric_name : String,
        period : Int32,
        service_name : String,
        start_time : Time,
        statistics : Array(String)
      ) : Types::GetContainerServiceMetricDataResult

        input = Types::GetContainerServiceMetricDataRequest.new(end_time: end_time, metric_name: metric_name, period: period, service_name: service_name, start_time: start_time, statistics: statistics)
        get_container_service_metric_data(input)
      end

      def get_container_service_metric_data(input : Types::GetContainerServiceMetricDataRequest) : Types::GetContainerServiceMetricDataResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_SERVICE_METRIC_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContainerServiceMetricDataResult, "GetContainerServiceMetricData")
      end

      # Returns the list of powers that can be specified for your Amazon Lightsail container services. The
      # power specifies the amount of memory, the number of vCPUs, and the base price of the container
      # service.

      def get_container_service_powers : Types::GetContainerServicePowersResult
        input = Types::GetContainerServicePowersRequest.new
        get_container_service_powers(input)
      end

      def get_container_service_powers(input : Types::GetContainerServicePowersRequest) : Types::GetContainerServicePowersResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_SERVICE_POWERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContainerServicePowersResult, "GetContainerServicePowers")
      end

      # Returns information about one or more of your Amazon Lightsail container services.

      def get_container_services(
        service_name : String? = nil
      ) : Types::ContainerServicesListResult

        input = Types::GetContainerServicesRequest.new(service_name: service_name)
        get_container_services(input)
      end

      def get_container_services(input : Types::GetContainerServicesRequest) : Types::ContainerServicesListResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ContainerServicesListResult, "GetContainerServices")
      end

      # Retrieves information about the cost estimate for a specified resource. A cost estimate will not
      # generate for a resource that has been deleted.

      def get_cost_estimate(
        end_time : Time,
        resource_name : String,
        start_time : Time
      ) : Types::GetCostEstimateResult

        input = Types::GetCostEstimateRequest.new(end_time: end_time, resource_name: resource_name, start_time: start_time)
        get_cost_estimate(input)
      end

      def get_cost_estimate(input : Types::GetCostEstimateRequest) : Types::GetCostEstimateResult
        request = Protocol::JsonRpc.build_request(Model::GET_COST_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCostEstimateResult, "GetCostEstimate")
      end

      # Returns information about a specific block storage disk.

      def get_disk(
        disk_name : String
      ) : Types::GetDiskResult

        input = Types::GetDiskRequest.new(disk_name: disk_name)
        get_disk(input)
      end

      def get_disk(input : Types::GetDiskRequest) : Types::GetDiskResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDiskResult, "GetDisk")
      end

      # Returns information about a specific block storage disk snapshot.

      def get_disk_snapshot(
        disk_snapshot_name : String
      ) : Types::GetDiskSnapshotResult

        input = Types::GetDiskSnapshotRequest.new(disk_snapshot_name: disk_snapshot_name)
        get_disk_snapshot(input)
      end

      def get_disk_snapshot(input : Types::GetDiskSnapshotRequest) : Types::GetDiskSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISK_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDiskSnapshotResult, "GetDiskSnapshot")
      end

      # Returns information about all block storage disk snapshots in your AWS account and region.

      def get_disk_snapshots(
        page_token : String? = nil
      ) : Types::GetDiskSnapshotsResult

        input = Types::GetDiskSnapshotsRequest.new(page_token: page_token)
        get_disk_snapshots(input)
      end

      def get_disk_snapshots(input : Types::GetDiskSnapshotsRequest) : Types::GetDiskSnapshotsResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISK_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDiskSnapshotsResult, "GetDiskSnapshots")
      end

      # Returns information about all block storage disks in your AWS account and region.

      def get_disks(
        page_token : String? = nil
      ) : Types::GetDisksResult

        input = Types::GetDisksRequest.new(page_token: page_token)
        get_disks(input)
      end

      def get_disks(input : Types::GetDisksRequest) : Types::GetDisksResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDisksResult, "GetDisks")
      end

      # Returns the bundles that can be applied to your Amazon Lightsail content delivery network (CDN)
      # distributions. A distribution bundle specifies the monthly network transfer quota and monthly cost
      # of your distribution.

      def get_distribution_bundles : Types::GetDistributionBundlesResult
        input = Types::GetDistributionBundlesRequest.new
        get_distribution_bundles(input)
      end

      def get_distribution_bundles(input : Types::GetDistributionBundlesRequest) : Types::GetDistributionBundlesResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISTRIBUTION_BUNDLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDistributionBundlesResult, "GetDistributionBundles")
      end

      # Returns the timestamp and status of the last cache reset of a specific Amazon Lightsail content
      # delivery network (CDN) distribution.

      def get_distribution_latest_cache_reset(
        distribution_name : String? = nil
      ) : Types::GetDistributionLatestCacheResetResult

        input = Types::GetDistributionLatestCacheResetRequest.new(distribution_name: distribution_name)
        get_distribution_latest_cache_reset(input)
      end

      def get_distribution_latest_cache_reset(input : Types::GetDistributionLatestCacheResetRequest) : Types::GetDistributionLatestCacheResetResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISTRIBUTION_LATEST_CACHE_RESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDistributionLatestCacheResetResult, "GetDistributionLatestCacheReset")
      end

      # Returns the data points of a specific metric for an Amazon Lightsail content delivery network (CDN)
      # distribution. Metrics report the utilization of your resources, and the error counts generated by
      # them. Monitor and collect metric data regularly to maintain the reliability, availability, and
      # performance of your resources.

      def get_distribution_metric_data(
        distribution_name : String,
        end_time : Time,
        metric_name : String,
        period : Int32,
        start_time : Time,
        statistics : Array(String),
        unit : String
      ) : Types::GetDistributionMetricDataResult

        input = Types::GetDistributionMetricDataRequest.new(distribution_name: distribution_name, end_time: end_time, metric_name: metric_name, period: period, start_time: start_time, statistics: statistics, unit: unit)
        get_distribution_metric_data(input)
      end

      def get_distribution_metric_data(input : Types::GetDistributionMetricDataRequest) : Types::GetDistributionMetricDataResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISTRIBUTION_METRIC_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDistributionMetricDataResult, "GetDistributionMetricData")
      end

      # Returns information about one or more of your Amazon Lightsail content delivery network (CDN)
      # distributions.

      def get_distributions(
        distribution_name : String? = nil,
        page_token : String? = nil
      ) : Types::GetDistributionsResult

        input = Types::GetDistributionsRequest.new(distribution_name: distribution_name, page_token: page_token)
        get_distributions(input)
      end

      def get_distributions(input : Types::GetDistributionsRequest) : Types::GetDistributionsResult
        request = Protocol::JsonRpc.build_request(Model::GET_DISTRIBUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDistributionsResult, "GetDistributions")
      end

      # Returns information about a specific domain recordset.

      def get_domain(
        domain_name : String
      ) : Types::GetDomainResult

        input = Types::GetDomainRequest.new(domain_name: domain_name)
        get_domain(input)
      end

      def get_domain(input : Types::GetDomainRequest) : Types::GetDomainResult
        request = Protocol::JsonRpc.build_request(Model::GET_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDomainResult, "GetDomain")
      end

      # Returns a list of all domains in the user's account.

      def get_domains(
        page_token : String? = nil
      ) : Types::GetDomainsResult

        input = Types::GetDomainsRequest.new(page_token: page_token)
        get_domains(input)
      end

      def get_domains(input : Types::GetDomainsRequest) : Types::GetDomainsResult
        request = Protocol::JsonRpc.build_request(Model::GET_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDomainsResult, "GetDomains")
      end

      # Returns all export snapshot records created as a result of the export snapshot operation. An export
      # snapshot record can be used to create a new Amazon EC2 instance and its related resources with the
      # CreateCloudFormationStack action.

      def get_export_snapshot_records(
        page_token : String? = nil
      ) : Types::GetExportSnapshotRecordsResult

        input = Types::GetExportSnapshotRecordsRequest.new(page_token: page_token)
        get_export_snapshot_records(input)
      end

      def get_export_snapshot_records(input : Types::GetExportSnapshotRecordsRequest) : Types::GetExportSnapshotRecordsResult
        request = Protocol::JsonRpc.build_request(Model::GET_EXPORT_SNAPSHOT_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExportSnapshotRecordsResult, "GetExportSnapshotRecords")
      end

      # Returns information about a specific Amazon Lightsail instance, which is a virtual private server.

      def get_instance(
        instance_name : String
      ) : Types::GetInstanceResult

        input = Types::GetInstanceRequest.new(instance_name: instance_name)
        get_instance(input)
      end

      def get_instance(input : Types::GetInstanceRequest) : Types::GetInstanceResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceResult, "GetInstance")
      end

      # Returns temporary SSH keys you can use to connect to a specific virtual private server, or instance
      # . The get instance access details operation supports tag-based access control via resource tags
      # applied to the resource identified by instance name . For more information, see the Amazon Lightsail
      # Developer Guide .

      def get_instance_access_details(
        instance_name : String,
        protocol : String? = nil
      ) : Types::GetInstanceAccessDetailsResult

        input = Types::GetInstanceAccessDetailsRequest.new(instance_name: instance_name, protocol: protocol)
        get_instance_access_details(input)
      end

      def get_instance_access_details(input : Types::GetInstanceAccessDetailsRequest) : Types::GetInstanceAccessDetailsResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_ACCESS_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceAccessDetailsResult, "GetInstanceAccessDetails")
      end

      # Returns the data points for the specified Amazon Lightsail instance metric, given an instance name.
      # Metrics report the utilization of your resources, and the error counts generated by them. Monitor
      # and collect metric data regularly to maintain the reliability, availability, and performance of your
      # resources.

      def get_instance_metric_data(
        end_time : Time,
        instance_name : String,
        metric_name : String,
        period : Int32,
        start_time : Time,
        statistics : Array(String),
        unit : String
      ) : Types::GetInstanceMetricDataResult

        input = Types::GetInstanceMetricDataRequest.new(end_time: end_time, instance_name: instance_name, metric_name: metric_name, period: period, start_time: start_time, statistics: statistics, unit: unit)
        get_instance_metric_data(input)
      end

      def get_instance_metric_data(input : Types::GetInstanceMetricDataRequest) : Types::GetInstanceMetricDataResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_METRIC_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceMetricDataResult, "GetInstanceMetricData")
      end

      # Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed
      # to connect to the instance through the ports, and the protocol.

      def get_instance_port_states(
        instance_name : String
      ) : Types::GetInstancePortStatesResult

        input = Types::GetInstancePortStatesRequest.new(instance_name: instance_name)
        get_instance_port_states(input)
      end

      def get_instance_port_states(input : Types::GetInstancePortStatesRequest) : Types::GetInstancePortStatesResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_PORT_STATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstancePortStatesResult, "GetInstancePortStates")
      end

      # Returns information about a specific instance snapshot.

      def get_instance_snapshot(
        instance_snapshot_name : String
      ) : Types::GetInstanceSnapshotResult

        input = Types::GetInstanceSnapshotRequest.new(instance_snapshot_name: instance_snapshot_name)
        get_instance_snapshot(input)
      end

      def get_instance_snapshot(input : Types::GetInstanceSnapshotRequest) : Types::GetInstanceSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceSnapshotResult, "GetInstanceSnapshot")
      end

      # Returns all instance snapshots for the user's account.

      def get_instance_snapshots(
        page_token : String? = nil
      ) : Types::GetInstanceSnapshotsResult

        input = Types::GetInstanceSnapshotsRequest.new(page_token: page_token)
        get_instance_snapshots(input)
      end

      def get_instance_snapshots(input : Types::GetInstanceSnapshotsRequest) : Types::GetInstanceSnapshotsResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceSnapshotsResult, "GetInstanceSnapshots")
      end

      # Returns the state of a specific instance. Works on one instance at a time.

      def get_instance_state(
        instance_name : String
      ) : Types::GetInstanceStateResult

        input = Types::GetInstanceStateRequest.new(instance_name: instance_name)
        get_instance_state(input)
      end

      def get_instance_state(input : Types::GetInstanceStateRequest) : Types::GetInstanceStateResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceStateResult, "GetInstanceState")
      end

      # Returns information about all Amazon Lightsail virtual private servers, or instances .

      def get_instances(
        page_token : String? = nil
      ) : Types::GetInstancesResult

        input = Types::GetInstancesRequest.new(page_token: page_token)
        get_instances(input)
      end

      def get_instances(input : Types::GetInstancesRequest) : Types::GetInstancesResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstancesResult, "GetInstances")
      end

      # Returns information about a specific key pair.

      def get_key_pair(
        key_pair_name : String
      ) : Types::GetKeyPairResult

        input = Types::GetKeyPairRequest.new(key_pair_name: key_pair_name)
        get_key_pair(input)
      end

      def get_key_pair(input : Types::GetKeyPairRequest) : Types::GetKeyPairResult
        request = Protocol::JsonRpc.build_request(Model::GET_KEY_PAIR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetKeyPairResult, "GetKeyPair")
      end

      # Returns information about all key pairs in the user's account.

      def get_key_pairs(
        include_default_key_pair : Bool? = nil,
        page_token : String? = nil
      ) : Types::GetKeyPairsResult

        input = Types::GetKeyPairsRequest.new(include_default_key_pair: include_default_key_pair, page_token: page_token)
        get_key_pairs(input)
      end

      def get_key_pairs(input : Types::GetKeyPairsRequest) : Types::GetKeyPairsResult
        request = Protocol::JsonRpc.build_request(Model::GET_KEY_PAIRS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetKeyPairsResult, "GetKeyPairs")
      end

      # Returns information about the specified Lightsail load balancer.

      def get_load_balancer(
        load_balancer_name : String
      ) : Types::GetLoadBalancerResult

        input = Types::GetLoadBalancerRequest.new(load_balancer_name: load_balancer_name)
        get_load_balancer(input)
      end

      def get_load_balancer(input : Types::GetLoadBalancerRequest) : Types::GetLoadBalancerResult
        request = Protocol::JsonRpc.build_request(Model::GET_LOAD_BALANCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoadBalancerResult, "GetLoadBalancer")
      end

      # Returns information about health metrics for your Lightsail load balancer. Metrics report the
      # utilization of your resources, and the error counts generated by them. Monitor and collect metric
      # data regularly to maintain the reliability, availability, and performance of your resources.

      def get_load_balancer_metric_data(
        end_time : Time,
        load_balancer_name : String,
        metric_name : String,
        period : Int32,
        start_time : Time,
        statistics : Array(String),
        unit : String
      ) : Types::GetLoadBalancerMetricDataResult

        input = Types::GetLoadBalancerMetricDataRequest.new(end_time: end_time, load_balancer_name: load_balancer_name, metric_name: metric_name, period: period, start_time: start_time, statistics: statistics, unit: unit)
        get_load_balancer_metric_data(input)
      end

      def get_load_balancer_metric_data(input : Types::GetLoadBalancerMetricDataRequest) : Types::GetLoadBalancerMetricDataResult
        request = Protocol::JsonRpc.build_request(Model::GET_LOAD_BALANCER_METRIC_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoadBalancerMetricDataResult, "GetLoadBalancerMetricData")
      end

      # Returns information about the TLS certificates that are associated with the specified Lightsail load
      # balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL). You can have a
      # maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is
      # inactive.

      def get_load_balancer_tls_certificates(
        load_balancer_name : String
      ) : Types::GetLoadBalancerTlsCertificatesResult

        input = Types::GetLoadBalancerTlsCertificatesRequest.new(load_balancer_name: load_balancer_name)
        get_load_balancer_tls_certificates(input)
      end

      def get_load_balancer_tls_certificates(input : Types::GetLoadBalancerTlsCertificatesRequest) : Types::GetLoadBalancerTlsCertificatesResult
        request = Protocol::JsonRpc.build_request(Model::GET_LOAD_BALANCER_TLS_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoadBalancerTlsCertificatesResult, "GetLoadBalancerTlsCertificates")
      end

      # Returns a list of TLS security policies that you can apply to Lightsail load balancers. For more
      # information about load balancer TLS security policies, see Configuring TLS security policies on your
      # Amazon Lightsail load balancers in the Amazon Lightsail Developer Guide .

      def get_load_balancer_tls_policies(
        page_token : String? = nil
      ) : Types::GetLoadBalancerTlsPoliciesResult

        input = Types::GetLoadBalancerTlsPoliciesRequest.new(page_token: page_token)
        get_load_balancer_tls_policies(input)
      end

      def get_load_balancer_tls_policies(input : Types::GetLoadBalancerTlsPoliciesRequest) : Types::GetLoadBalancerTlsPoliciesResult
        request = Protocol::JsonRpc.build_request(Model::GET_LOAD_BALANCER_TLS_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoadBalancerTlsPoliciesResult, "GetLoadBalancerTlsPolicies")
      end

      # Returns information about all load balancers in an account.

      def get_load_balancers(
        page_token : String? = nil
      ) : Types::GetLoadBalancersResult

        input = Types::GetLoadBalancersRequest.new(page_token: page_token)
        get_load_balancers(input)
      end

      def get_load_balancers(input : Types::GetLoadBalancersRequest) : Types::GetLoadBalancersResult
        request = Protocol::JsonRpc.build_request(Model::GET_LOAD_BALANCERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoadBalancersResult, "GetLoadBalancers")
      end

      # Returns information about a specific operation. Operations include events such as when you create an
      # instance, allocate a static IP, attach a static IP, and so on.

      def get_operation(
        operation_id : String
      ) : Types::GetOperationResult

        input = Types::GetOperationRequest.new(operation_id: operation_id)
        get_operation(input)
      end

      def get_operation(input : Types::GetOperationRequest) : Types::GetOperationResult
        request = Protocol::JsonRpc.build_request(Model::GET_OPERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOperationResult, "GetOperation")
      end

      # Returns information about all operations. Results are returned from oldest to newest, up to a
      # maximum of 200. Results can be paged by making each subsequent call to GetOperations use the maximum
      # (last) statusChangedAt value from the previous request.

      def get_operations(
        page_token : String? = nil
      ) : Types::GetOperationsResult

        input = Types::GetOperationsRequest.new(page_token: page_token)
        get_operations(input)
      end

      def get_operations(input : Types::GetOperationsRequest) : Types::GetOperationsResult
        request = Protocol::JsonRpc.build_request(Model::GET_OPERATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOperationsResult, "GetOperations")
      end

      # Gets operations for a specific resource (an instance or a static IP).

      def get_operations_for_resource(
        resource_name : String,
        page_token : String? = nil
      ) : Types::GetOperationsForResourceResult

        input = Types::GetOperationsForResourceRequest.new(resource_name: resource_name, page_token: page_token)
        get_operations_for_resource(input)
      end

      def get_operations_for_resource(input : Types::GetOperationsForResourceRequest) : Types::GetOperationsForResourceResult
        request = Protocol::JsonRpc.build_request(Model::GET_OPERATIONS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOperationsForResourceResult, "GetOperationsForResource")
      end

      # Returns a list of all valid regions for Amazon Lightsail. Use the include availability zones
      # parameter to also return the Availability Zones in a region.

      def get_regions(
        include_availability_zones : Bool? = nil,
        include_relational_database_availability_zones : Bool? = nil
      ) : Types::GetRegionsResult

        input = Types::GetRegionsRequest.new(include_availability_zones: include_availability_zones, include_relational_database_availability_zones: include_relational_database_availability_zones)
        get_regions(input)
      end

      def get_regions(input : Types::GetRegionsRequest) : Types::GetRegionsResult
        request = Protocol::JsonRpc.build_request(Model::GET_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegionsResult, "GetRegions")
      end

      # Returns information about a specific database in Amazon Lightsail.

      def get_relational_database(
        relational_database_name : String
      ) : Types::GetRelationalDatabaseResult

        input = Types::GetRelationalDatabaseRequest.new(relational_database_name: relational_database_name)
        get_relational_database(input)
      end

      def get_relational_database(input : Types::GetRelationalDatabaseRequest) : Types::GetRelationalDatabaseResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseResult, "GetRelationalDatabase")
      end

      # Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major
      # engine version of a database. You can use a blueprint ID to create a new database that runs a
      # specific database engine.

      def get_relational_database_blueprints(
        page_token : String? = nil
      ) : Types::GetRelationalDatabaseBlueprintsResult

        input = Types::GetRelationalDatabaseBlueprintsRequest.new(page_token: page_token)
        get_relational_database_blueprints(input)
      end

      def get_relational_database_blueprints(input : Types::GetRelationalDatabaseBlueprintsRequest) : Types::GetRelationalDatabaseBlueprintsResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_BLUEPRINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseBlueprintsResult, "GetRelationalDatabaseBlueprints")
      end

      # Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the
      # performance specifications for a database. You can use a bundle ID to create a new database with
      # explicit performance specifications.

      def get_relational_database_bundles(
        include_inactive : Bool? = nil,
        page_token : String? = nil
      ) : Types::GetRelationalDatabaseBundlesResult

        input = Types::GetRelationalDatabaseBundlesRequest.new(include_inactive: include_inactive, page_token: page_token)
        get_relational_database_bundles(input)
      end

      def get_relational_database_bundles(input : Types::GetRelationalDatabaseBundlesRequest) : Types::GetRelationalDatabaseBundlesResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_BUNDLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseBundlesResult, "GetRelationalDatabaseBundles")
      end

      # Returns a list of events for a specific database in Amazon Lightsail.

      def get_relational_database_events(
        relational_database_name : String,
        duration_in_minutes : Int32? = nil,
        page_token : String? = nil
      ) : Types::GetRelationalDatabaseEventsResult

        input = Types::GetRelationalDatabaseEventsRequest.new(relational_database_name: relational_database_name, duration_in_minutes: duration_in_minutes, page_token: page_token)
        get_relational_database_events(input)
      end

      def get_relational_database_events(input : Types::GetRelationalDatabaseEventsRequest) : Types::GetRelationalDatabaseEventsResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseEventsResult, "GetRelationalDatabaseEvents")
      end

      # Returns a list of log events for a database in Amazon Lightsail.

      def get_relational_database_log_events(
        log_stream_name : String,
        relational_database_name : String,
        end_time : Time? = nil,
        page_token : String? = nil,
        start_from_head : Bool? = nil,
        start_time : Time? = nil
      ) : Types::GetRelationalDatabaseLogEventsResult

        input = Types::GetRelationalDatabaseLogEventsRequest.new(log_stream_name: log_stream_name, relational_database_name: relational_database_name, end_time: end_time, page_token: page_token, start_from_head: start_from_head, start_time: start_time)
        get_relational_database_log_events(input)
      end

      def get_relational_database_log_events(input : Types::GetRelationalDatabaseLogEventsRequest) : Types::GetRelationalDatabaseLogEventsResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_LOG_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseLogEventsResult, "GetRelationalDatabaseLogEvents")
      end

      # Returns a list of available log streams for a specific database in Amazon Lightsail.

      def get_relational_database_log_streams(
        relational_database_name : String
      ) : Types::GetRelationalDatabaseLogStreamsResult

        input = Types::GetRelationalDatabaseLogStreamsRequest.new(relational_database_name: relational_database_name)
        get_relational_database_log_streams(input)
      end

      def get_relational_database_log_streams(input : Types::GetRelationalDatabaseLogStreamsRequest) : Types::GetRelationalDatabaseLogStreamsResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_LOG_STREAMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseLogStreamsResult, "GetRelationalDatabaseLogStreams")
      end

      # Returns the current, previous, or pending versions of the master user password for a Lightsail
      # database. The GetRelationalDatabaseMasterUserPassword operation supports tag-based access control
      # via resource tags applied to the resource identified by relationalDatabaseName.

      def get_relational_database_master_user_password(
        relational_database_name : String,
        password_version : String? = nil
      ) : Types::GetRelationalDatabaseMasterUserPasswordResult

        input = Types::GetRelationalDatabaseMasterUserPasswordRequest.new(relational_database_name: relational_database_name, password_version: password_version)
        get_relational_database_master_user_password(input)
      end

      def get_relational_database_master_user_password(input : Types::GetRelationalDatabaseMasterUserPasswordRequest) : Types::GetRelationalDatabaseMasterUserPasswordResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_MASTER_USER_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseMasterUserPasswordResult, "GetRelationalDatabaseMasterUserPassword")
      end

      # Returns the data points of the specified metric for a database in Amazon Lightsail. Metrics report
      # the utilization of your resources, and the error counts generated by them. Monitor and collect
      # metric data regularly to maintain the reliability, availability, and performance of your resources.

      def get_relational_database_metric_data(
        end_time : Time,
        metric_name : String,
        period : Int32,
        relational_database_name : String,
        start_time : Time,
        statistics : Array(String),
        unit : String
      ) : Types::GetRelationalDatabaseMetricDataResult

        input = Types::GetRelationalDatabaseMetricDataRequest.new(end_time: end_time, metric_name: metric_name, period: period, relational_database_name: relational_database_name, start_time: start_time, statistics: statistics, unit: unit)
        get_relational_database_metric_data(input)
      end

      def get_relational_database_metric_data(input : Types::GetRelationalDatabaseMetricDataRequest) : Types::GetRelationalDatabaseMetricDataResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_METRIC_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseMetricDataResult, "GetRelationalDatabaseMetricData")
      end

      # Returns all of the runtime parameters offered by the underlying database software, or engine, for a
      # specific database in Amazon Lightsail. In addition to the parameter names and values, this operation
      # returns other information about each parameter. This information includes whether changes require a
      # reboot, whether the parameter is modifiable, the allowed values, and the data types.

      def get_relational_database_parameters(
        relational_database_name : String,
        page_token : String? = nil
      ) : Types::GetRelationalDatabaseParametersResult

        input = Types::GetRelationalDatabaseParametersRequest.new(relational_database_name: relational_database_name, page_token: page_token)
        get_relational_database_parameters(input)
      end

      def get_relational_database_parameters(input : Types::GetRelationalDatabaseParametersRequest) : Types::GetRelationalDatabaseParametersResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseParametersResult, "GetRelationalDatabaseParameters")
      end

      # Returns information about a specific database snapshot in Amazon Lightsail.

      def get_relational_database_snapshot(
        relational_database_snapshot_name : String
      ) : Types::GetRelationalDatabaseSnapshotResult

        input = Types::GetRelationalDatabaseSnapshotRequest.new(relational_database_snapshot_name: relational_database_snapshot_name)
        get_relational_database_snapshot(input)
      end

      def get_relational_database_snapshot(input : Types::GetRelationalDatabaseSnapshotRequest) : Types::GetRelationalDatabaseSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseSnapshotResult, "GetRelationalDatabaseSnapshot")
      end

      # Returns information about all of your database snapshots in Amazon Lightsail.

      def get_relational_database_snapshots(
        page_token : String? = nil
      ) : Types::GetRelationalDatabaseSnapshotsResult

        input = Types::GetRelationalDatabaseSnapshotsRequest.new(page_token: page_token)
        get_relational_database_snapshots(input)
      end

      def get_relational_database_snapshots(input : Types::GetRelationalDatabaseSnapshotsRequest) : Types::GetRelationalDatabaseSnapshotsResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabaseSnapshotsResult, "GetRelationalDatabaseSnapshots")
      end

      # Returns information about all of your databases in Amazon Lightsail.

      def get_relational_databases(
        page_token : String? = nil
      ) : Types::GetRelationalDatabasesResult

        input = Types::GetRelationalDatabasesRequest.new(page_token: page_token)
        get_relational_databases(input)
      end

      def get_relational_databases(input : Types::GetRelationalDatabasesRequest) : Types::GetRelationalDatabasesResult
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONAL_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationalDatabasesResult, "GetRelationalDatabases")
      end

      # Returns detailed information for five of the most recent SetupInstanceHttps requests that were ran
      # on the target instance.

      def get_setup_history(
        resource_name : String,
        page_token : String? = nil
      ) : Types::GetSetupHistoryResult

        input = Types::GetSetupHistoryRequest.new(resource_name: resource_name, page_token: page_token)
        get_setup_history(input)
      end

      def get_setup_history(input : Types::GetSetupHistoryRequest) : Types::GetSetupHistoryResult
        request = Protocol::JsonRpc.build_request(Model::GET_SETUP_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSetupHistoryResult, "GetSetupHistory")
      end

      # Returns information about an Amazon Lightsail static IP.

      def get_static_ip(
        static_ip_name : String
      ) : Types::GetStaticIpResult

        input = Types::GetStaticIpRequest.new(static_ip_name: static_ip_name)
        get_static_ip(input)
      end

      def get_static_ip(input : Types::GetStaticIpRequest) : Types::GetStaticIpResult
        request = Protocol::JsonRpc.build_request(Model::GET_STATIC_IP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStaticIpResult, "GetStaticIp")
      end

      # Returns information about all static IPs in the user's account.

      def get_static_ips(
        page_token : String? = nil
      ) : Types::GetStaticIpsResult

        input = Types::GetStaticIpsRequest.new(page_token: page_token)
        get_static_ips(input)
      end

      def get_static_ips(input : Types::GetStaticIpsRequest) : Types::GetStaticIpsResult
        request = Protocol::JsonRpc.build_request(Model::GET_STATIC_IPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStaticIpsResult, "GetStaticIps")
      end

      # Imports a public SSH key from a specific key pair.

      def import_key_pair(
        key_pair_name : String,
        public_key_base64 : String
      ) : Types::ImportKeyPairResult

        input = Types::ImportKeyPairRequest.new(key_pair_name: key_pair_name, public_key_base64: public_key_base64)
        import_key_pair(input)
      end

      def import_key_pair(input : Types::ImportKeyPairRequest) : Types::ImportKeyPairResult
        request = Protocol::JsonRpc.build_request(Model::IMPORT_KEY_PAIR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportKeyPairResult, "ImportKeyPair")
      end

      # Returns a Boolean value indicating whether your Lightsail VPC is peered.

      def is_vpc_peered : Types::IsVpcPeeredResult
        input = Types::IsVpcPeeredRequest.new
        is_vpc_peered(input)
      end

      def is_vpc_peered(input : Types::IsVpcPeeredRequest) : Types::IsVpcPeeredResult
        request = Protocol::JsonRpc.build_request(Model::IS_VPC_PEERED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IsVpcPeeredResult, "IsVpcPeered")
      end

      # Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to
      # connect to the instance through the ports, and the protocol. The OpenInstancePublicPorts action
      # supports tag-based access control via resource tags applied to the resource identified by
      # instanceName . For more information, see the Amazon Lightsail Developer Guide .

      def open_instance_public_ports(
        instance_name : String,
        port_info : Types::PortInfo
      ) : Types::OpenInstancePublicPortsResult

        input = Types::OpenInstancePublicPortsRequest.new(instance_name: instance_name, port_info: port_info)
        open_instance_public_ports(input)
      end

      def open_instance_public_ports(input : Types::OpenInstancePublicPortsRequest) : Types::OpenInstancePublicPortsResult
        request = Protocol::JsonRpc.build_request(Model::OPEN_INSTANCE_PUBLIC_PORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::OpenInstancePublicPortsResult, "OpenInstancePublicPorts")
      end

      # Peers the Lightsail VPC with the user's default VPC.

      def peer_vpc : Types::PeerVpcResult
        input = Types::PeerVpcRequest.new
        peer_vpc(input)
      end

      def peer_vpc(input : Types::PeerVpcRequest) : Types::PeerVpcResult
        request = Protocol::JsonRpc.build_request(Model::PEER_VPC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PeerVpcResult, "PeerVpc")
      end

      # Creates or updates an alarm, and associates it with the specified metric. An alarm is used to
      # monitor a single metric for one of your resources. When a metric condition is met, the alarm can
      # notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For
      # more information, see Alarms in Amazon Lightsail . When this action creates an alarm, the alarm
      # state is immediately set to INSUFFICIENT_DATA . The alarm is then evaluated and its state is set
      # appropriately. Any actions associated with the new state are then executed. When you update an
      # existing alarm, its state is left unchanged, but the update completely overwrites the previous
      # configuration of the alarm. The alarm is then evaluated with the updated configuration.

      def put_alarm(
        alarm_name : String,
        comparison_operator : String,
        evaluation_periods : Int32,
        metric_name : String,
        monitored_resource_name : String,
        threshold : Float64,
        contact_protocols : Array(String)? = nil,
        datapoints_to_alarm : Int32? = nil,
        notification_enabled : Bool? = nil,
        notification_triggers : Array(String)? = nil,
        treat_missing_data : String? = nil
      ) : Types::PutAlarmResult

        input = Types::PutAlarmRequest.new(alarm_name: alarm_name, comparison_operator: comparison_operator, evaluation_periods: evaluation_periods, metric_name: metric_name, monitored_resource_name: monitored_resource_name, threshold: threshold, contact_protocols: contact_protocols, datapoints_to_alarm: datapoints_to_alarm, notification_enabled: notification_enabled, notification_triggers: notification_triggers, treat_missing_data: treat_missing_data)
        put_alarm(input)
      end

      def put_alarm(input : Types::PutAlarmRequest) : Types::PutAlarmResult
        request = Protocol::JsonRpc.build_request(Model::PUT_ALARM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAlarmResult, "PutAlarm")
      end

      # Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to
      # connect to the instance through the ports, and the protocol. This action also closes all currently
      # open ports that are not included in the request. Include all of the ports and the protocols you want
      # to open in your PutInstancePublicPorts request. Or use the OpenInstancePublicPorts action to open
      # ports without closing currently open ports. The PutInstancePublicPorts action supports tag-based
      # access control via resource tags applied to the resource identified by instanceName . For more
      # information, see the Amazon Lightsail Developer Guide .

      def put_instance_public_ports(
        instance_name : String,
        port_infos : Array(Types::PortInfo)
      ) : Types::PutInstancePublicPortsResult

        input = Types::PutInstancePublicPortsRequest.new(instance_name: instance_name, port_infos: port_infos)
        put_instance_public_ports(input)
      end

      def put_instance_public_ports(input : Types::PutInstancePublicPortsRequest) : Types::PutInstancePublicPortsResult
        request = Protocol::JsonRpc.build_request(Model::PUT_INSTANCE_PUBLIC_PORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutInstancePublicPortsResult, "PutInstancePublicPorts")
      end

      # Restarts a specific instance. The reboot instance operation supports tag-based access control via
      # resource tags applied to the resource identified by instance name . For more information, see the
      # Amazon Lightsail Developer Guide .

      def reboot_instance(
        instance_name : String
      ) : Types::RebootInstanceResult

        input = Types::RebootInstanceRequest.new(instance_name: instance_name)
        reboot_instance(input)
      end

      def reboot_instance(input : Types::RebootInstanceRequest) : Types::RebootInstanceResult
        request = Protocol::JsonRpc.build_request(Model::REBOOT_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootInstanceResult, "RebootInstance")
      end

      # Restarts a specific database in Amazon Lightsail. The reboot relational database operation supports
      # tag-based access control via resource tags applied to the resource identified by
      # relationalDatabaseName. For more information, see the Amazon Lightsail Developer Guide .

      def reboot_relational_database(
        relational_database_name : String
      ) : Types::RebootRelationalDatabaseResult

        input = Types::RebootRelationalDatabaseRequest.new(relational_database_name: relational_database_name)
        reboot_relational_database(input)
      end

      def reboot_relational_database(input : Types::RebootRelationalDatabaseRequest) : Types::RebootRelationalDatabaseResult
        request = Protocol::JsonRpc.build_request(Model::REBOOT_RELATIONAL_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootRelationalDatabaseResult, "RebootRelationalDatabase")
      end

      # Registers a container image to your Amazon Lightsail container service. This action is not required
      # if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your
      # Lightsail container service. For more information, see Pushing and managing container images on your
      # Amazon Lightsail container services in the Amazon Lightsail Developer Guide .

      def register_container_image(
        digest : String,
        label : String,
        service_name : String
      ) : Types::RegisterContainerImageResult

        input = Types::RegisterContainerImageRequest.new(digest: digest, label: label, service_name: service_name)
        register_container_image(input)
      end

      def register_container_image(input : Types::RegisterContainerImageRequest) : Types::RegisterContainerImageResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_CONTAINER_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterContainerImageResult, "RegisterContainerImage")
      end

      # Deletes a specific static IP from your account.

      def release_static_ip(
        static_ip_name : String
      ) : Types::ReleaseStaticIpResult

        input = Types::ReleaseStaticIpRequest.new(static_ip_name: static_ip_name)
        release_static_ip(input)
      end

      def release_static_ip(input : Types::ReleaseStaticIpRequest) : Types::ReleaseStaticIpResult
        request = Protocol::JsonRpc.build_request(Model::RELEASE_STATIC_IP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReleaseStaticIpResult, "ReleaseStaticIp")
      end

      # Deletes currently cached content from your Amazon Lightsail content delivery network (CDN)
      # distribution. After resetting the cache, the next time a content request is made, your distribution
      # pulls, serves, and caches it from the origin.

      def reset_distribution_cache(
        distribution_name : String? = nil
      ) : Types::ResetDistributionCacheResult

        input = Types::ResetDistributionCacheRequest.new(distribution_name: distribution_name)
        reset_distribution_cache(input)
      end

      def reset_distribution_cache(input : Types::ResetDistributionCacheRequest) : Types::ResetDistributionCacheResult
        request = Protocol::JsonRpc.build_request(Model::RESET_DISTRIBUTION_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResetDistributionCacheResult, "ResetDistributionCache")
      end

      # Sends a verification request to an email contact method to ensure it's owned by the requester. SMS
      # contact methods don't need to be verified. A contact method is used to send you notifications about
      # your Amazon Lightsail resources. You can add one email address and one mobile phone number contact
      # method in each Amazon Web Services Region. However, SMS text messaging is not supported in some
      # Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For
      # more information, see Notifications in Amazon Lightsail . A verification request is sent to the
      # contact method when you initially create it. Use this action to send another verification request if
      # a previous verification request was deleted, or has expired. Notifications are not sent to an email
      # contact method until after it is verified, and confirmed as valid.

      def send_contact_method_verification(
        protocol : String
      ) : Types::SendContactMethodVerificationResult

        input = Types::SendContactMethodVerificationRequest.new(protocol: protocol)
        send_contact_method_verification(input)
      end

      def send_contact_method_verification(input : Types::SendContactMethodVerificationRequest) : Types::SendContactMethodVerificationResult
        request = Protocol::JsonRpc.build_request(Model::SEND_CONTACT_METHOD_VERIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendContactMethodVerificationResult, "SendContactMethodVerification")
      end

      # Sets the IP address type for an Amazon Lightsail resource. Use this action to enable dual-stack for
      # a resource, which enables IPv4 and IPv6 for the specified resource. Alternately, you can use this
      # action to disable dual-stack, and enable IPv4 only.

      def set_ip_address_type(
        ip_address_type : String,
        resource_name : String,
        resource_type : String,
        accept_bundle_update : Bool? = nil
      ) : Types::SetIpAddressTypeResult

        input = Types::SetIpAddressTypeRequest.new(ip_address_type: ip_address_type, resource_name: resource_name, resource_type: resource_type, accept_bundle_update: accept_bundle_update)
        set_ip_address_type(input)
      end

      def set_ip_address_type(input : Types::SetIpAddressTypeRequest) : Types::SetIpAddressTypeResult
        request = Protocol::JsonRpc.build_request(Model::SET_IP_ADDRESS_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetIpAddressTypeResult, "SetIpAddressType")
      end

      # Sets the Amazon Lightsail resources that can access the specified Lightsail bucket. Lightsail
      # buckets currently support setting access for Lightsail instances in the same Amazon Web Services
      # Region.

      def set_resource_access_for_bucket(
        access : String,
        bucket_name : String,
        resource_name : String
      ) : Types::SetResourceAccessForBucketResult

        input = Types::SetResourceAccessForBucketRequest.new(access: access, bucket_name: bucket_name, resource_name: resource_name)
        set_resource_access_for_bucket(input)
      end

      def set_resource_access_for_bucket(input : Types::SetResourceAccessForBucketRequest) : Types::SetResourceAccessForBucketResult
        request = Protocol::JsonRpc.build_request(Model::SET_RESOURCE_ACCESS_FOR_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetResourceAccessForBucketResult, "SetResourceAccessForBucket")
      end

      # Creates an SSL/TLS certificate that secures traffic for your website. After the certificate is
      # created, it is installed on the specified Lightsail instance. If you provide more than one domain
      # name in the request, at least one name must be less than or equal to 63 characters in length.

      def setup_instance_https(
        certificate_provider : String,
        domain_names : Array(String),
        email_address : String,
        instance_name : String
      ) : Types::SetupInstanceHttpsResult

        input = Types::SetupInstanceHttpsRequest.new(certificate_provider: certificate_provider, domain_names: domain_names, email_address: email_address, instance_name: instance_name)
        setup_instance_https(input)
      end

      def setup_instance_https(input : Types::SetupInstanceHttpsRequest) : Types::SetupInstanceHttpsResult
        request = Protocol::JsonRpc.build_request(Model::SETUP_INSTANCE_HTTPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetupInstanceHttpsResult, "SetupInstanceHttps")
      end

      # Initiates a graphical user interface (GUI) session that’s used to access a virtual computer’s
      # operating system and application. The session will be active for 1 hour. Use this action to resume
      # the session after it expires.

      def start_gui_session(
        resource_name : String
      ) : Types::StartGUISessionResult

        input = Types::StartGUISessionRequest.new(resource_name: resource_name)
        start_gui_session(input)
      end

      def start_gui_session(input : Types::StartGUISessionRequest) : Types::StartGUISessionResult
        request = Protocol::JsonRpc.build_request(Model::START_GUI_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartGUISessionResult, "StartGUISession")
      end

      # Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the
      # reboot instance operation. When you start a stopped instance, Lightsail assigns a new public IP
      # address to the instance. To use the same IP address after stopping and starting an instance, create
      # a static IP address and attach it to the instance. For more information, see the Amazon Lightsail
      # Developer Guide . The start instance operation supports tag-based access control via resource tags
      # applied to the resource identified by instance name . For more information, see the Amazon Lightsail
      # Developer Guide .

      def start_instance(
        instance_name : String
      ) : Types::StartInstanceResult

        input = Types::StartInstanceRequest.new(instance_name: instance_name)
        start_instance(input)
      end

      def start_instance(input : Types::StartInstanceRequest) : Types::StartInstanceResult
        request = Protocol::JsonRpc.build_request(Model::START_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartInstanceResult, "StartInstance")
      end

      # Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the
      # reboot relational database operation. The start relational database operation supports tag-based
      # access control via resource tags applied to the resource identified by relationalDatabaseName. For
      # more information, see the Amazon Lightsail Developer Guide .

      def start_relational_database(
        relational_database_name : String
      ) : Types::StartRelationalDatabaseResult

        input = Types::StartRelationalDatabaseRequest.new(relational_database_name: relational_database_name)
        start_relational_database(input)
      end

      def start_relational_database(input : Types::StartRelationalDatabaseRequest) : Types::StartRelationalDatabaseResult
        request = Protocol::JsonRpc.build_request(Model::START_RELATIONAL_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartRelationalDatabaseResult, "StartRelationalDatabase")
      end

      # Terminates a web-based Amazon DCV session that’s used to access a virtual computer’s operating
      # system or application. The session will close and any unsaved data will be lost.

      def stop_gui_session(
        resource_name : String
      ) : Types::StopGUISessionResult

        input = Types::StopGUISessionRequest.new(resource_name: resource_name)
        stop_gui_session(input)
      end

      def stop_gui_session(input : Types::StopGUISessionRequest) : Types::StopGUISessionResult
        request = Protocol::JsonRpc.build_request(Model::STOP_GUI_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopGUISessionResult, "StopGUISession")
      end

      # Stops a specific Amazon Lightsail instance that is currently running. When you start a stopped
      # instance, Lightsail assigns a new public IP address to the instance. To use the same IP address
      # after stopping and starting an instance, create a static IP address and attach it to the instance.
      # For more information, see the Amazon Lightsail Developer Guide . The stop instance operation
      # supports tag-based access control via resource tags applied to the resource identified by instance
      # name . For more information, see the Amazon Lightsail Developer Guide .

      def stop_instance(
        instance_name : String,
        force : Bool? = nil
      ) : Types::StopInstanceResult

        input = Types::StopInstanceRequest.new(instance_name: instance_name, force: force)
        stop_instance(input)
      end

      def stop_instance(input : Types::StopInstanceRequest) : Types::StopInstanceResult
        request = Protocol::JsonRpc.build_request(Model::STOP_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopInstanceResult, "StopInstance")
      end

      # Stops a specific database that is currently running in Amazon Lightsail. If you don't manually start
      # your database instance after it has been stopped for seven consecutive days, Amazon Lightsail
      # automatically starts it for you. This action helps ensure that your database instance doesn't fall
      # behind on any required maintenance updates. The stop relational database operation supports
      # tag-based access control via resource tags applied to the resource identified by
      # relationalDatabaseName. For more information, see the Amazon Lightsail Developer Guide .

      def stop_relational_database(
        relational_database_name : String,
        relational_database_snapshot_name : String? = nil
      ) : Types::StopRelationalDatabaseResult

        input = Types::StopRelationalDatabaseRequest.new(relational_database_name: relational_database_name, relational_database_snapshot_name: relational_database_snapshot_name)
        stop_relational_database(input)
      end

      def stop_relational_database(input : Types::StopRelationalDatabaseRequest) : Types::StopRelationalDatabaseResult
        request = Protocol::JsonRpc.build_request(Model::STOP_RELATIONAL_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopRelationalDatabaseResult, "StopRelationalDatabase")
      end

      # Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum
      # of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource.
      # For more information about tags, see the Amazon Lightsail Developer Guide . The tag resource
      # operation supports tag-based access control via request tags and resource tags applied to the
      # resource identified by resource name . For more information, see the Amazon Lightsail Developer
      # Guide .

      def tag_resource(
        resource_name : String,
        tags : Array(Types::Tag),
        resource_arn : String? = nil
      ) : Types::TagResourceResult

        input = Types::TagResourceRequest.new(resource_name: resource_name, tags: tags, resource_arn: resource_arn)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResult
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResult, "TagResource")
      end

      # Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is
      # configured for the specified alarm, the test also sends a notification to the notification protocol
      # ( Email and/or SMS ) configured for the alarm. An alarm is used to monitor a single metric for one
      # of your resources. When a metric condition is met, the alarm can notify you by email, SMS text
      # message, and a banner displayed on the Amazon Lightsail console. For more information, see Alarms in
      # Amazon Lightsail .

      def test_alarm(
        alarm_name : String,
        state : String
      ) : Types::TestAlarmResult

        input = Types::TestAlarmRequest.new(alarm_name: alarm_name, state: state)
        test_alarm(input)
      end

      def test_alarm(input : Types::TestAlarmRequest) : Types::TestAlarmResult
        request = Protocol::JsonRpc.build_request(Model::TEST_ALARM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestAlarmResult, "TestAlarm")
      end

      # Unpeers the Lightsail VPC from the user's default VPC.

      def unpeer_vpc : Types::UnpeerVpcResult
        input = Types::UnpeerVpcRequest.new
        unpeer_vpc(input)
      end

      def unpeer_vpc(input : Types::UnpeerVpcRequest) : Types::UnpeerVpcResult
        request = Protocol::JsonRpc.build_request(Model::UNPEER_VPC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UnpeerVpcResult, "UnpeerVpc")
      end

      # Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource.
      # The untag resource operation supports tag-based access control via request tags and resource tags
      # applied to the resource identified by resource name . For more information, see the Amazon Lightsail
      # Developer Guide .

      def untag_resource(
        resource_name : String,
        tag_keys : Array(String),
        resource_arn : String? = nil
      ) : Types::UntagResourceResult

        input = Types::UntagResourceRequest.new(resource_name: resource_name, tag_keys: tag_keys, resource_arn: resource_arn)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResult
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResult, "UntagResource")
      end

      # Updates an existing Amazon Lightsail bucket. Use this action to update the configuration of an
      # existing bucket, such as versioning, public accessibility, and the Amazon Web Services accounts that
      # can access the bucket.

      def update_bucket(
        bucket_name : String,
        access_log_config : Types::BucketAccessLogConfig? = nil,
        access_rules : Types::AccessRules? = nil,
        cors : Types::BucketCorsConfig? = nil,
        readonly_access_accounts : Array(String)? = nil,
        versioning : String? = nil
      ) : Types::UpdateBucketResult

        input = Types::UpdateBucketRequest.new(bucket_name: bucket_name, access_log_config: access_log_config, access_rules: access_rules, cors: cors, readonly_access_accounts: readonly_access_accounts, versioning: versioning)
        update_bucket(input)
      end

      def update_bucket(input : Types::UpdateBucketRequest) : Types::UpdateBucketResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBucketResult, "UpdateBucket")
      end

      # Updates the bundle, or storage plan, of an existing Amazon Lightsail bucket. A bucket bundle
      # specifies the monthly cost, storage space, and data transfer quota for a bucket. You can update a
      # bucket's bundle only one time within a monthly Amazon Web Services billing cycle. To determine if
      # you can update a bucket's bundle, use the GetBuckets action. The ableToUpdateBundle parameter in the
      # response will indicate whether you can currently update a bucket's bundle. Update a bucket's bundle
      # if it's consistently going over its storage space or data transfer quota, or if a bucket's usage is
      # consistently in the lower range of its storage space or data transfer quota. Due to the
      # unpredictable usage fluctuations that a bucket might experience, we strongly recommend that you
      # update a bucket's bundle only as a long-term strategy, instead of as a short-term, monthly
      # cost-cutting measure. Choose a bucket bundle that will provide the bucket with ample storage space
      # and data transfer for a long time to come.

      def update_bucket_bundle(
        bucket_name : String,
        bundle_id : String
      ) : Types::UpdateBucketBundleResult

        input = Types::UpdateBucketBundleRequest.new(bucket_name: bucket_name, bundle_id: bundle_id)
        update_bucket_bundle(input)
      end

      def update_bucket_bundle(input : Types::UpdateBucketBundleRequest) : Types::UpdateBucketBundleResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BUCKET_BUNDLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBucketBundleResult, "UpdateBucketBundle")
      end

      # Updates the configuration of your Amazon Lightsail container service, such as its power, scale, and
      # public domain names.

      def update_container_service(
        service_name : String,
        is_disabled : Bool? = nil,
        power : String? = nil,
        private_registry_access : Types::PrivateRegistryAccessRequest? = nil,
        public_domain_names : Hash(String, Array(String))? = nil,
        scale : Int32? = nil
      ) : Types::UpdateContainerServiceResult

        input = Types::UpdateContainerServiceRequest.new(service_name: service_name, is_disabled: is_disabled, power: power, private_registry_access: private_registry_access, public_domain_names: public_domain_names, scale: scale)
        update_container_service(input)
      end

      def update_container_service(input : Types::UpdateContainerServiceRequest) : Types::UpdateContainerServiceResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTAINER_SERVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContainerServiceResult, "UpdateContainerService")
      end

      # Updates an existing Amazon Lightsail content delivery network (CDN) distribution. Use this action to
      # update the configuration of your existing distribution.

      def update_distribution(
        distribution_name : String,
        cache_behavior_settings : Types::CacheSettings? = nil,
        cache_behaviors : Array(Types::CacheBehaviorPerPath)? = nil,
        certificate_name : String? = nil,
        default_cache_behavior : Types::CacheBehavior? = nil,
        is_enabled : Bool? = nil,
        origin : Types::InputOrigin? = nil,
        use_default_certificate : Bool? = nil,
        viewer_minimum_tls_protocol_version : String? = nil
      ) : Types::UpdateDistributionResult

        input = Types::UpdateDistributionRequest.new(distribution_name: distribution_name, cache_behavior_settings: cache_behavior_settings, cache_behaviors: cache_behaviors, certificate_name: certificate_name, default_cache_behavior: default_cache_behavior, is_enabled: is_enabled, origin: origin, use_default_certificate: use_default_certificate, viewer_minimum_tls_protocol_version: viewer_minimum_tls_protocol_version)
        update_distribution(input)
      end

      def update_distribution(input : Types::UpdateDistributionRequest) : Types::UpdateDistributionResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DISTRIBUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDistributionResult, "UpdateDistribution")
      end

      # Updates the bundle of your Amazon Lightsail content delivery network (CDN) distribution. A
      # distribution bundle specifies the monthly network transfer quota and monthly cost of your
      # distribution. Update your distribution's bundle if your distribution is going over its monthly
      # network transfer quota and is incurring an overage fee. You can update your distribution's bundle
      # only one time within your monthly Amazon Web Services billing cycle. To determine if you can update
      # your distribution's bundle, use the GetDistributions action. The ableToUpdateBundle parameter in the
      # result will indicate whether you can currently update your distribution's bundle.

      def update_distribution_bundle(
        bundle_id : String? = nil,
        distribution_name : String? = nil
      ) : Types::UpdateDistributionBundleResult

        input = Types::UpdateDistributionBundleRequest.new(bundle_id: bundle_id, distribution_name: distribution_name)
        update_distribution_bundle(input)
      end

      def update_distribution_bundle(input : Types::UpdateDistributionBundleRequest) : Types::UpdateDistributionBundleResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DISTRIBUTION_BUNDLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDistributionBundleResult, "UpdateDistributionBundle")
      end

      # Updates a domain recordset after it is created. The update domain entry operation supports tag-based
      # access control via resource tags applied to the resource identified by domain name . For more
      # information, see the Amazon Lightsail Developer Guide .

      def update_domain_entry(
        domain_entry : Types::DomainEntry,
        domain_name : String
      ) : Types::UpdateDomainEntryResult

        input = Types::UpdateDomainEntryRequest.new(domain_entry: domain_entry, domain_name: domain_name)
        update_domain_entry(input)
      end

      def update_domain_entry(input : Types::UpdateDomainEntryRequest) : Types::UpdateDomainEntryResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOMAIN_ENTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDomainEntryResult, "UpdateDomainEntry")
      end

      # Modifies the Amazon Lightsail instance metadata parameters on a running or stopped instance. When
      # you modify the parameters on a running instance, the GetInstance or GetInstances API operation
      # initially responds with a state of pending . After the parameter modifications are successfully
      # applied, the state changes to applied in subsequent GetInstance or GetInstances API calls. For more
      # information, see Use IMDSv2 with an Amazon Lightsail instance in the Amazon Lightsail Developer
      # Guide .

      def update_instance_metadata_options(
        instance_name : String,
        http_endpoint : String? = nil,
        http_protocol_ipv6 : String? = nil,
        http_put_response_hop_limit : Int32? = nil,
        http_tokens : String? = nil
      ) : Types::UpdateInstanceMetadataOptionsResult

        input = Types::UpdateInstanceMetadataOptionsRequest.new(instance_name: instance_name, http_endpoint: http_endpoint, http_protocol_ipv6: http_protocol_ipv6, http_put_response_hop_limit: http_put_response_hop_limit, http_tokens: http_tokens)
        update_instance_metadata_options(input)
      end

      def update_instance_metadata_options(input : Types::UpdateInstanceMetadataOptionsRequest) : Types::UpdateInstanceMetadataOptionsResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INSTANCE_METADATA_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInstanceMetadataOptionsResult, "UpdateInstanceMetadataOptions")
      end

      # Updates the specified attribute for a load balancer. You can only update one attribute at a time.
      # The update load balancer attribute operation supports tag-based access control via resource tags
      # applied to the resource identified by load balancer name . For more information, see the Amazon
      # Lightsail Developer Guide .

      def update_load_balancer_attribute(
        attribute_name : String,
        attribute_value : String,
        load_balancer_name : String
      ) : Types::UpdateLoadBalancerAttributeResult

        input = Types::UpdateLoadBalancerAttributeRequest.new(attribute_name: attribute_name, attribute_value: attribute_value, load_balancer_name: load_balancer_name)
        update_load_balancer_attribute(input)
      end

      def update_load_balancer_attribute(input : Types::UpdateLoadBalancerAttributeRequest) : Types::UpdateLoadBalancerAttributeResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOAD_BALANCER_ATTRIBUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLoadBalancerAttributeResult, "UpdateLoadBalancerAttribute")
      end

      # Allows the update of one or more attributes of a database in Amazon Lightsail. Updates are applied
      # immediately, or in cases where the updates could result in an outage, are applied during the
      # database's predefined maintenance window. The update relational database operation supports
      # tag-based access control via resource tags applied to the resource identified by
      # relationalDatabaseName. For more information, see the Amazon Lightsail Developer Guide .

      def update_relational_database(
        relational_database_name : String,
        apply_immediately : Bool? = nil,
        ca_certificate_identifier : String? = nil,
        disable_backup_retention : Bool? = nil,
        enable_backup_retention : Bool? = nil,
        master_user_password : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        relational_database_blueprint_id : String? = nil,
        rotate_master_user_password : Bool? = nil
      ) : Types::UpdateRelationalDatabaseResult

        input = Types::UpdateRelationalDatabaseRequest.new(relational_database_name: relational_database_name, apply_immediately: apply_immediately, ca_certificate_identifier: ca_certificate_identifier, disable_backup_retention: disable_backup_retention, enable_backup_retention: enable_backup_retention, master_user_password: master_user_password, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, relational_database_blueprint_id: relational_database_blueprint_id, rotate_master_user_password: rotate_master_user_password)
        update_relational_database(input)
      end

      def update_relational_database(input : Types::UpdateRelationalDatabaseRequest) : Types::UpdateRelationalDatabaseResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RELATIONAL_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRelationalDatabaseResult, "UpdateRelationalDatabase")
      end

      # Allows the update of one or more parameters of a database in Amazon Lightsail. Parameter updates
      # don't cause outages; therefore, their application is not subject to the preferred maintenance
      # window. However, there are two ways in which parameter updates are applied: dynamic or
      # pending-reboot . Parameters marked with a dynamic apply type are applied immediately. Parameters
      # marked with a pending-reboot apply type are applied only after the database is rebooted using the
      # reboot relational database operation. The update relational database parameters operation supports
      # tag-based access control via resource tags applied to the resource identified by
      # relationalDatabaseName. For more information, see the Amazon Lightsail Developer Guide .

      def update_relational_database_parameters(
        parameters : Array(Types::RelationalDatabaseParameter),
        relational_database_name : String
      ) : Types::UpdateRelationalDatabaseParametersResult

        input = Types::UpdateRelationalDatabaseParametersRequest.new(parameters: parameters, relational_database_name: relational_database_name)
        update_relational_database_parameters(input)
      end

      def update_relational_database_parameters(input : Types::UpdateRelationalDatabaseParametersRequest) : Types::UpdateRelationalDatabaseParametersResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RELATIONAL_DATABASE_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRelationalDatabaseParametersResult, "UpdateRelationalDatabaseParameters")
      end
    end
  end
end
