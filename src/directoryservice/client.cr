module Aws
  module DirectoryService
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

      # Accepts a directory sharing request that was sent from the directory owner account.

      def accept_shared_directory(
        shared_directory_id : String
      ) : Types::AcceptSharedDirectoryResult

        input = Types::AcceptSharedDirectoryRequest.new(shared_directory_id: shared_directory_id)
        accept_shared_directory(input)
      end

      def accept_shared_directory(input : Types::AcceptSharedDirectoryRequest) : Types::AcceptSharedDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_SHARED_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptSharedDirectoryResult, "AcceptSharedDirectory")
      end

      # If the DNS server for your self-managed domain uses a publicly addressable IP address, you must add
      # a CIDR address block to correctly route traffic to and from your Microsoft AD on Amazon Web
      # Services. AddIpRoutes adds this address block. You can also use AddIpRoutes to facilitate routing
      # traffic that uses public IP ranges from your Microsoft AD on Amazon Web Services to a peer VPC.
      # Before you call AddIpRoutes , ensure that all of the required permissions have been explicitly
      # granted through a policy. For details about what permissions are required to run the AddIpRoutes
      # operation, see Directory Service API Permissions: Actions, Resources, and Conditions Reference .

      def add_ip_routes(
        directory_id : String,
        ip_routes : Array(Types::IpRoute),
        update_security_group_for_directory_controllers : Bool? = nil
      ) : Types::AddIpRoutesResult

        input = Types::AddIpRoutesRequest.new(directory_id: directory_id, ip_routes: ip_routes, update_security_group_for_directory_controllers: update_security_group_for_directory_controllers)
        add_ip_routes(input)
      end

      def add_ip_routes(input : Types::AddIpRoutesRequest) : Types::AddIpRoutesResult
        request = Protocol::JsonRpc.build_request(Model::ADD_IP_ROUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddIpRoutesResult, "AddIpRoutes")
      end

      # Adds two domain controllers in the specified Region for the specified directory.

      def add_region(
        directory_id : String,
        region_name : String,
        vpc_settings : Types::DirectoryVpcSettings
      ) : Types::AddRegionResult

        input = Types::AddRegionRequest.new(directory_id: directory_id, region_name: region_name, vpc_settings: vpc_settings)
        add_region(input)
      end

      def add_region(input : Types::AddRegionRequest) : Types::AddRegionResult
        request = Protocol::JsonRpc.build_request(Model::ADD_REGION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddRegionResult, "AddRegion")
      end

      # Adds or overwrites one or more tags for the specified directory. Each directory can have a maximum
      # of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique to each resource.

      def add_tags_to_resource(
        resource_id : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsToResourceResult

        input = Types::AddTagsToResourceRequest.new(resource_id: resource_id, tags: tags)
        add_tags_to_resource(input)
      end

      def add_tags_to_resource(input : Types::AddTagsToResourceRequest) : Types::AddTagsToResourceResult
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsToResourceResult, "AddTagsToResource")
      end

      # Cancels an in-progress schema extension to a Microsoft AD directory. Once a schema extension has
      # started replicating to all domain controllers, the task can no longer be canceled. A schema
      # extension can be canceled during any of the following states; Initializing , CreatingSnapshot , and
      # UpdatingSchema .

      def cancel_schema_extension(
        directory_id : String,
        schema_extension_id : String
      ) : Types::CancelSchemaExtensionResult

        input = Types::CancelSchemaExtensionRequest.new(directory_id: directory_id, schema_extension_id: schema_extension_id)
        cancel_schema_extension(input)
      end

      def cancel_schema_extension(input : Types::CancelSchemaExtensionRequest) : Types::CancelSchemaExtensionResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_SCHEMA_EXTENSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelSchemaExtensionResult, "CancelSchemaExtension")
      end

      # Creates an AD Connector to connect to a self-managed directory. Before you call ConnectDirectory ,
      # ensure that all of the required permissions have been explicitly granted through a policy. For
      # details about what permissions are required to run the ConnectDirectory operation, see Directory
      # Service API Permissions: Actions, Resources, and Conditions Reference .

      def connect_directory(
        connect_settings : Types::DirectoryConnectSettings,
        name : String,
        password : String,
        size : String,
        description : String? = nil,
        network_type : String? = nil,
        short_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ConnectDirectoryResult

        input = Types::ConnectDirectoryRequest.new(connect_settings: connect_settings, name: name, password: password, size: size, description: description, network_type: network_type, short_name: short_name, tags: tags)
        connect_directory(input)
      end

      def connect_directory(input : Types::ConnectDirectoryRequest) : Types::ConnectDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::CONNECT_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConnectDirectoryResult, "ConnectDirectory")
      end

      # Creates an alias for a directory and assigns the alias to the directory. The alias is used to
      # construct the access URL for the directory, such as http://&lt;alias&gt;.awsapps.com . After an
      # alias has been created, it cannot be deleted or reused, so this operation should only be used when
      # absolutely necessary.

      def create_alias(
        alias_ : String,
        directory_id : String
      ) : Types::CreateAliasResult

        input = Types::CreateAliasRequest.new(alias_: alias_, directory_id: directory_id)
        create_alias(input)
      end

      def create_alias(input : Types::CreateAliasRequest) : Types::CreateAliasResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAliasResult, "CreateAlias")
      end

      # Creates an Active Directory computer object in the specified directory.

      def create_computer(
        computer_name : String,
        directory_id : String,
        password : String,
        computer_attributes : Array(Types::Attribute)? = nil,
        organizational_unit_distinguished_name : String? = nil
      ) : Types::CreateComputerResult

        input = Types::CreateComputerRequest.new(computer_name: computer_name, directory_id: directory_id, password: password, computer_attributes: computer_attributes, organizational_unit_distinguished_name: organizational_unit_distinguished_name)
        create_computer(input)
      end

      def create_computer(input : Types::CreateComputerRequest) : Types::CreateComputerResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_COMPUTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateComputerResult, "CreateComputer")
      end

      # Creates a conditional forwarder associated with your Amazon Web Services directory. Conditional
      # forwarders are required in order to set up a trust relationship with another domain. The conditional
      # forwarder points to the trusted domain.

      def create_conditional_forwarder(
        directory_id : String,
        remote_domain_name : String,
        dns_ip_addrs : Array(String)? = nil,
        dns_ipv6_addrs : Array(String)? = nil
      ) : Types::CreateConditionalForwarderResult

        input = Types::CreateConditionalForwarderRequest.new(directory_id: directory_id, remote_domain_name: remote_domain_name, dns_ip_addrs: dns_ip_addrs, dns_ipv6_addrs: dns_ipv6_addrs)
        create_conditional_forwarder(input)
      end

      def create_conditional_forwarder(input : Types::CreateConditionalForwarderRequest) : Types::CreateConditionalForwarderResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONDITIONAL_FORWARDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConditionalForwarderResult, "CreateConditionalForwarder")
      end

      # Creates a Simple AD directory. For more information, see Simple Active Directory in the Directory
      # Service Admin Guide . Before you call CreateDirectory , ensure that all of the required permissions
      # have been explicitly granted through a policy. For details about what permissions are required to
      # run the CreateDirectory operation, see Directory Service API Permissions: Actions, Resources, and
      # Conditions Reference .

      def create_directory(
        name : String,
        password : String,
        size : String,
        description : String? = nil,
        network_type : String? = nil,
        short_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_settings : Types::DirectoryVpcSettings? = nil
      ) : Types::CreateDirectoryResult

        input = Types::CreateDirectoryRequest.new(name: name, password: password, size: size, description: description, network_type: network_type, short_name: short_name, tags: tags, vpc_settings: vpc_settings)
        create_directory(input)
      end

      def create_directory(input : Types::CreateDirectoryRequest) : Types::CreateDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDirectoryResult, "CreateDirectory")
      end

      # Creates a hybrid directory that connects your self-managed Active Directory (AD) infrastructure and
      # Amazon Web Services. You must have a successful directory assessment using StartADAssessment to
      # validate your environment compatibility before you use this operation. Updates are applied
      # asynchronously. Use DescribeDirectories to monitor the progress of directory creation.

      def create_hybrid_ad(
        assessment_id : String,
        secret_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateHybridADResult

        input = Types::CreateHybridADRequest.new(assessment_id: assessment_id, secret_arn: secret_arn, tags: tags)
        create_hybrid_ad(input)
      end

      def create_hybrid_ad(input : Types::CreateHybridADRequest) : Types::CreateHybridADResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_HYBRID_AD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHybridADResult, "CreateHybridAD")
      end

      # Creates a subscription to forward real-time Directory Service domain controller security logs to the
      # specified Amazon CloudWatch log group in your Amazon Web Services account.

      def create_log_subscription(
        directory_id : String,
        log_group_name : String
      ) : Types::CreateLogSubscriptionResult

        input = Types::CreateLogSubscriptionRequest.new(directory_id: directory_id, log_group_name: log_group_name)
        create_log_subscription(input)
      end

      def create_log_subscription(input : Types::CreateLogSubscriptionRequest) : Types::CreateLogSubscriptionResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOG_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLogSubscriptionResult, "CreateLogSubscription")
      end

      # Creates a Microsoft AD directory in the Amazon Web Services Cloud. For more information, see Managed
      # Microsoft AD in the Directory Service Admin Guide . Before you call CreateMicrosoftAD , ensure that
      # all of the required permissions have been explicitly granted through a policy. For details about
      # what permissions are required to run the CreateMicrosoftAD operation, see Directory Service API
      # Permissions: Actions, Resources, and Conditions Reference .

      def create_microsoft_ad(
        name : String,
        password : String,
        vpc_settings : Types::DirectoryVpcSettings,
        description : String? = nil,
        edition : String? = nil,
        network_type : String? = nil,
        short_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMicrosoftADResult

        input = Types::CreateMicrosoftADRequest.new(name: name, password: password, vpc_settings: vpc_settings, description: description, edition: edition, network_type: network_type, short_name: short_name, tags: tags)
        create_microsoft_ad(input)
      end

      def create_microsoft_ad(input : Types::CreateMicrosoftADRequest) : Types::CreateMicrosoftADResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_MICROSOFT_AD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMicrosoftADResult, "CreateMicrosoftAD")
      end

      # Creates a snapshot of a Simple AD or Microsoft AD directory in the Amazon Web Services cloud. You
      # cannot take snapshots of AD Connector directories.

      def create_snapshot(
        directory_id : String,
        name : String? = nil
      ) : Types::CreateSnapshotResult

        input = Types::CreateSnapshotRequest.new(directory_id: directory_id, name: name)
        create_snapshot(input)
      end

      def create_snapshot(input : Types::CreateSnapshotRequest) : Types::CreateSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSnapshotResult, "CreateSnapshot")
      end

      # Directory Service for Microsoft Active Directory allows you to configure trust relationships. For
      # example, you can establish a trust between your Managed Microsoft AD directory, and your existing
      # self-managed Microsoft Active Directory. This would allow you to provide users and groups access to
      # resources in either domain, with a single set of credentials. This action initiates the creation of
      # the Amazon Web Services side of a trust relationship between an Managed Microsoft AD directory and
      # an external domain. You can create either a forest trust or an external trust.

      def create_trust(
        directory_id : String,
        remote_domain_name : String,
        trust_direction : String,
        trust_password : String,
        conditional_forwarder_ip_addrs : Array(String)? = nil,
        conditional_forwarder_ipv6_addrs : Array(String)? = nil,
        selective_auth : String? = nil,
        trust_type : String? = nil
      ) : Types::CreateTrustResult

        input = Types::CreateTrustRequest.new(directory_id: directory_id, remote_domain_name: remote_domain_name, trust_direction: trust_direction, trust_password: trust_password, conditional_forwarder_ip_addrs: conditional_forwarder_ip_addrs, conditional_forwarder_ipv6_addrs: conditional_forwarder_ipv6_addrs, selective_auth: selective_auth, trust_type: trust_type)
        create_trust(input)
      end

      def create_trust(input : Types::CreateTrustRequest) : Types::CreateTrustResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRUST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrustResult, "CreateTrust")
      end

      # Deletes a directory assessment and all associated data. This operation permanently removes the
      # assessment results, validation reports, and configuration information. You cannot delete
      # system-initiated assessments. You can delete customer-created assessments even if they are in
      # progress.

      def delete_ad_assessment(
        assessment_id : String
      ) : Types::DeleteADAssessmentResult

        input = Types::DeleteADAssessmentRequest.new(assessment_id: assessment_id)
        delete_ad_assessment(input)
      end

      def delete_ad_assessment(input : Types::DeleteADAssessmentRequest) : Types::DeleteADAssessmentResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_AD_ASSESSMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteADAssessmentResult, "DeleteADAssessment")
      end

      # Deletes a conditional forwarder that has been set up for your Amazon Web Services directory.

      def delete_conditional_forwarder(
        directory_id : String,
        remote_domain_name : String
      ) : Types::DeleteConditionalForwarderResult

        input = Types::DeleteConditionalForwarderRequest.new(directory_id: directory_id, remote_domain_name: remote_domain_name)
        delete_conditional_forwarder(input)
      end

      def delete_conditional_forwarder(input : Types::DeleteConditionalForwarderRequest) : Types::DeleteConditionalForwarderResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONDITIONAL_FORWARDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConditionalForwarderResult, "DeleteConditionalForwarder")
      end

      # Deletes an Directory Service directory. Before you call DeleteDirectory , ensure that all of the
      # required permissions have been explicitly granted through a policy. For details about what
      # permissions are required to run the DeleteDirectory operation, see Directory Service API
      # Permissions: Actions, Resources, and Conditions Reference .

      def delete_directory(
        directory_id : String
      ) : Types::DeleteDirectoryResult

        input = Types::DeleteDirectoryRequest.new(directory_id: directory_id)
        delete_directory(input)
      end

      def delete_directory(input : Types::DeleteDirectoryRequest) : Types::DeleteDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDirectoryResult, "DeleteDirectory")
      end

      # Deletes the specified log subscription.

      def delete_log_subscription(
        directory_id : String
      ) : Types::DeleteLogSubscriptionResult

        input = Types::DeleteLogSubscriptionRequest.new(directory_id: directory_id)
        delete_log_subscription(input)
      end

      def delete_log_subscription(input : Types::DeleteLogSubscriptionRequest) : Types::DeleteLogSubscriptionResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOG_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLogSubscriptionResult, "DeleteLogSubscription")
      end

      # Deletes a directory snapshot.

      def delete_snapshot(
        snapshot_id : String
      ) : Types::DeleteSnapshotResult

        input = Types::DeleteSnapshotRequest.new(snapshot_id: snapshot_id)
        delete_snapshot(input)
      end

      def delete_snapshot(input : Types::DeleteSnapshotRequest) : Types::DeleteSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSnapshotResult, "DeleteSnapshot")
      end

      # Deletes an existing trust relationship between your Managed Microsoft AD directory and an external
      # domain.

      def delete_trust(
        trust_id : String,
        delete_associated_conditional_forwarder : Bool? = nil
      ) : Types::DeleteTrustResult

        input = Types::DeleteTrustRequest.new(trust_id: trust_id, delete_associated_conditional_forwarder: delete_associated_conditional_forwarder)
        delete_trust(input)
      end

      def delete_trust(input : Types::DeleteTrustRequest) : Types::DeleteTrustResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRUST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTrustResult, "DeleteTrust")
      end

      # Deletes from the system the certificate that was registered for secure LDAP or client certificate
      # authentication.

      def deregister_certificate(
        certificate_id : String,
        directory_id : String
      ) : Types::DeregisterCertificateResult

        input = Types::DeregisterCertificateRequest.new(certificate_id: certificate_id, directory_id: directory_id)
        deregister_certificate(input)
      end

      def deregister_certificate(input : Types::DeregisterCertificateRequest) : Types::DeregisterCertificateResult
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterCertificateResult, "DeregisterCertificate")
      end

      # Removes the specified directory as a publisher to the specified Amazon SNS topic.

      def deregister_event_topic(
        directory_id : String,
        topic_name : String
      ) : Types::DeregisterEventTopicResult

        input = Types::DeregisterEventTopicRequest.new(directory_id: directory_id, topic_name: topic_name)
        deregister_event_topic(input)
      end

      def deregister_event_topic(input : Types::DeregisterEventTopicRequest) : Types::DeregisterEventTopicResult
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_EVENT_TOPIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterEventTopicResult, "DeregisterEventTopic")
      end

      # Retrieves detailed information about a directory assessment, including its current status,
      # validation results, and configuration details. Use this operation to monitor assessment progress and
      # review results.

      def describe_ad_assessment(
        assessment_id : String
      ) : Types::DescribeADAssessmentResult

        input = Types::DescribeADAssessmentRequest.new(assessment_id: assessment_id)
        describe_ad_assessment(input)
      end

      def describe_ad_assessment(input : Types::DescribeADAssessmentRequest) : Types::DescribeADAssessmentResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AD_ASSESSMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeADAssessmentResult, "DescribeADAssessment")
      end

      # Retrieves detailed information about the certificate authority (CA) enrollment policy for the
      # specified directory. This policy determines how client certificates are automatically enrolled and
      # managed through Amazon Web Services Private Certificate Authority.

      def describe_ca_enrollment_policy(
        directory_id : String
      ) : Types::DescribeCAEnrollmentPolicyResult

        input = Types::DescribeCAEnrollmentPolicyRequest.new(directory_id: directory_id)
        describe_ca_enrollment_policy(input)
      end

      def describe_ca_enrollment_policy(input : Types::DescribeCAEnrollmentPolicyRequest) : Types::DescribeCAEnrollmentPolicyResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CA_ENROLLMENT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCAEnrollmentPolicyResult, "DescribeCAEnrollmentPolicy")
      end

      # Displays information about the certificate registered for secure LDAP or client certificate
      # authentication.

      def describe_certificate(
        certificate_id : String,
        directory_id : String
      ) : Types::DescribeCertificateResult

        input = Types::DescribeCertificateRequest.new(certificate_id: certificate_id, directory_id: directory_id)
        describe_certificate(input)
      end

      def describe_certificate(input : Types::DescribeCertificateRequest) : Types::DescribeCertificateResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCertificateResult, "DescribeCertificate")
      end

      # Retrieves information about the type of client authentication for the specified directory, if the
      # type is specified. If no type is specified, information about all client authentication types that
      # are supported for the specified directory is retrieved. Currently, only SmartCard is supported.

      def describe_client_authentication_settings(
        directory_id : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::DescribeClientAuthenticationSettingsResult

        input = Types::DescribeClientAuthenticationSettingsRequest.new(directory_id: directory_id, limit: limit, next_token: next_token, type: type)
        describe_client_authentication_settings(input)
      end

      def describe_client_authentication_settings(input : Types::DescribeClientAuthenticationSettingsRequest) : Types::DescribeClientAuthenticationSettingsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLIENT_AUTHENTICATION_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClientAuthenticationSettingsResult, "DescribeClientAuthenticationSettings")
      end

      # Obtains information about the conditional forwarders for this account. If no input parameters are
      # provided for RemoteDomainNames, this request describes all conditional forwarders for the specified
      # directory ID.

      def describe_conditional_forwarders(
        directory_id : String,
        remote_domain_names : Array(String)? = nil
      ) : Types::DescribeConditionalForwardersResult

        input = Types::DescribeConditionalForwardersRequest.new(directory_id: directory_id, remote_domain_names: remote_domain_names)
        describe_conditional_forwarders(input)
      end

      def describe_conditional_forwarders(input : Types::DescribeConditionalForwardersRequest) : Types::DescribeConditionalForwardersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONDITIONAL_FORWARDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConditionalForwardersResult, "DescribeConditionalForwarders")
      end

      # Obtains information about the directories that belong to this account. You can retrieve information
      # about specific directories by passing the directory identifiers in the DirectoryIds parameter.
      # Otherwise, all directories that belong to the current account are returned. This operation supports
      # pagination with the use of the NextToken request and response parameters. If more results are
      # available, the DescribeDirectoriesResult.NextToken member contains a token that you pass in the next
      # call to DescribeDirectories to retrieve the next set of items. You can also specify a maximum number
      # of return results with the Limit parameter.

      def describe_directories(
        directory_ids : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDirectoriesResult

        input = Types::DescribeDirectoriesRequest.new(directory_ids: directory_ids, limit: limit, next_token: next_token)
        describe_directories(input)
      end

      def describe_directories(input : Types::DescribeDirectoriesRequest) : Types::DescribeDirectoriesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIRECTORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDirectoriesResult, "DescribeDirectories")
      end

      # Obtains status of directory data access enablement through the Directory Service Data API for the
      # specified directory.

      def describe_directory_data_access(
        directory_id : String
      ) : Types::DescribeDirectoryDataAccessResult

        input = Types::DescribeDirectoryDataAccessRequest.new(directory_id: directory_id)
        describe_directory_data_access(input)
      end

      def describe_directory_data_access(input : Types::DescribeDirectoryDataAccessRequest) : Types::DescribeDirectoryDataAccessResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DIRECTORY_DATA_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDirectoryDataAccessResult, "DescribeDirectoryDataAccess")
      end

      # Provides information about any domain controllers in your directory.

      def describe_domain_controllers(
        directory_id : String,
        domain_controller_ids : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDomainControllersResult

        input = Types::DescribeDomainControllersRequest.new(directory_id: directory_id, domain_controller_ids: domain_controller_ids, limit: limit, next_token: next_token)
        describe_domain_controllers(input)
      end

      def describe_domain_controllers(input : Types::DescribeDomainControllersRequest) : Types::DescribeDomainControllersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOMAIN_CONTROLLERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDomainControllersResult, "DescribeDomainControllers")
      end

      # Obtains information about which Amazon SNS topics receive status messages from the specified
      # directory. If no input parameters are provided, such as DirectoryId or TopicName, this request
      # describes all of the associations in the account.

      def describe_event_topics(
        directory_id : String? = nil,
        topic_names : Array(String)? = nil
      ) : Types::DescribeEventTopicsResult

        input = Types::DescribeEventTopicsRequest.new(directory_id: directory_id, topic_names: topic_names)
        describe_event_topics(input)
      end

      def describe_event_topics(input : Types::DescribeEventTopicsRequest) : Types::DescribeEventTopicsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_TOPICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventTopicsResult, "DescribeEventTopics")
      end

      # Retrieves information about update activities for a hybrid directory. This operation provides
      # details about configuration changes, administrator account updates, and self-managed instance
      # settings (IDs and DNS IPs).

      def describe_hybrid_ad_update(
        directory_id : String,
        next_token : String? = nil,
        update_type : String? = nil
      ) : Types::DescribeHybridADUpdateResult

        input = Types::DescribeHybridADUpdateRequest.new(directory_id: directory_id, next_token: next_token, update_type: update_type)
        describe_hybrid_ad_update(input)
      end

      def describe_hybrid_ad_update(input : Types::DescribeHybridADUpdateRequest) : Types::DescribeHybridADUpdateResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HYBRID_AD_UPDATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHybridADUpdateResult, "DescribeHybridADUpdate")
      end

      # Describes the status of LDAP security for the specified directory.

      def describe_ldaps_settings(
        directory_id : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::DescribeLDAPSSettingsResult

        input = Types::DescribeLDAPSSettingsRequest.new(directory_id: directory_id, limit: limit, next_token: next_token, type: type)
        describe_ldaps_settings(input)
      end

      def describe_ldaps_settings(input : Types::DescribeLDAPSSettingsRequest) : Types::DescribeLDAPSSettingsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LDAPS_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLDAPSSettingsResult, "DescribeLDAPSSettings")
      end

      # Provides information about the Regions that are configured for multi-Region replication.

      def describe_regions(
        directory_id : String,
        next_token : String? = nil,
        region_name : String? = nil
      ) : Types::DescribeRegionsResult

        input = Types::DescribeRegionsRequest.new(directory_id: directory_id, next_token: next_token, region_name: region_name)
        describe_regions(input)
      end

      def describe_regions(input : Types::DescribeRegionsRequest) : Types::DescribeRegionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegionsResult, "DescribeRegions")
      end

      # Retrieves information about the configurable settings for the specified directory.

      def describe_settings(
        directory_id : String,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::DescribeSettingsResult

        input = Types::DescribeSettingsRequest.new(directory_id: directory_id, next_token: next_token, status: status)
        describe_settings(input)
      end

      def describe_settings(input : Types::DescribeSettingsRequest) : Types::DescribeSettingsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSettingsResult, "DescribeSettings")
      end

      # Returns the shared directories in your account.

      def describe_shared_directories(
        owner_directory_id : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        shared_directory_ids : Array(String)? = nil
      ) : Types::DescribeSharedDirectoriesResult

        input = Types::DescribeSharedDirectoriesRequest.new(owner_directory_id: owner_directory_id, limit: limit, next_token: next_token, shared_directory_ids: shared_directory_ids)
        describe_shared_directories(input)
      end

      def describe_shared_directories(input : Types::DescribeSharedDirectoriesRequest) : Types::DescribeSharedDirectoriesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SHARED_DIRECTORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSharedDirectoriesResult, "DescribeSharedDirectories")
      end

      # Obtains information about the directory snapshots that belong to this account. This operation
      # supports pagination with the use of the NextToken request and response parameters. If more results
      # are available, the DescribeSnapshots.NextToken member contains a token that you pass in the next
      # call to DescribeSnapshots to retrieve the next set of items. You can also specify a maximum number
      # of return results with the Limit parameter.

      def describe_snapshots(
        directory_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        snapshot_ids : Array(String)? = nil
      ) : Types::DescribeSnapshotsResult

        input = Types::DescribeSnapshotsRequest.new(directory_id: directory_id, limit: limit, next_token: next_token, snapshot_ids: snapshot_ids)
        describe_snapshots(input)
      end

      def describe_snapshots(input : Types::DescribeSnapshotsRequest) : Types::DescribeSnapshotsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSnapshotsResult, "DescribeSnapshots")
      end

      # Obtains information about the trust relationships for this account. If no input parameters are
      # provided, such as DirectoryId or TrustIds, this request describes all the trust relationships
      # belonging to the account.

      def describe_trusts(
        directory_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        trust_ids : Array(String)? = nil
      ) : Types::DescribeTrustsResult

        input = Types::DescribeTrustsRequest.new(directory_id: directory_id, limit: limit, next_token: next_token, trust_ids: trust_ids)
        describe_trusts(input)
      end

      def describe_trusts(input : Types::DescribeTrustsRequest) : Types::DescribeTrustsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRUSTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrustsResult, "DescribeTrusts")
      end

      # Describes the updates of a directory for a particular update type.

      def describe_update_directory(
        directory_id : String,
        update_type : String,
        next_token : String? = nil,
        region_name : String? = nil
      ) : Types::DescribeUpdateDirectoryResult

        input = Types::DescribeUpdateDirectoryRequest.new(directory_id: directory_id, update_type: update_type, next_token: next_token, region_name: region_name)
        describe_update_directory(input)
      end

      def describe_update_directory(input : Types::DescribeUpdateDirectoryRequest) : Types::DescribeUpdateDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_UPDATE_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUpdateDirectoryResult, "DescribeUpdateDirectory")
      end

      # Disables the certificate authority (CA) enrollment policy for the specified directory. This stops
      # automatic certificate enrollment and management for domain-joined clients, but does not affect
      # existing certificates. Disabling the CA enrollment policy prevents new certificates from being
      # automatically enrolled, but existing certificates remain valid and functional until they expire.

      def disable_ca_enrollment_policy(
        directory_id : String
      ) : Types::DisableCAEnrollmentPolicyResult

        input = Types::DisableCAEnrollmentPolicyRequest.new(directory_id: directory_id)
        disable_ca_enrollment_policy(input)
      end

      def disable_ca_enrollment_policy(input : Types::DisableCAEnrollmentPolicyRequest) : Types::DisableCAEnrollmentPolicyResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_CA_ENROLLMENT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableCAEnrollmentPolicyResult, "DisableCAEnrollmentPolicy")
      end

      # Disables alternative client authentication methods for the specified directory.

      def disable_client_authentication(
        directory_id : String,
        type : String
      ) : Types::DisableClientAuthenticationResult

        input = Types::DisableClientAuthenticationRequest.new(directory_id: directory_id, type: type)
        disable_client_authentication(input)
      end

      def disable_client_authentication(input : Types::DisableClientAuthenticationRequest) : Types::DisableClientAuthenticationResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_CLIENT_AUTHENTICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableClientAuthenticationResult, "DisableClientAuthentication")
      end

      # Deactivates access to directory data via the Directory Service Data API for the specified directory.
      # For more information, see Directory Service Data API Reference .

      def disable_directory_data_access(
        directory_id : String
      ) : Types::DisableDirectoryDataAccessResult

        input = Types::DisableDirectoryDataAccessRequest.new(directory_id: directory_id)
        disable_directory_data_access(input)
      end

      def disable_directory_data_access(input : Types::DisableDirectoryDataAccessRequest) : Types::DisableDirectoryDataAccessResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_DIRECTORY_DATA_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableDirectoryDataAccessResult, "DisableDirectoryDataAccess")
      end

      # Deactivates LDAP secure calls for the specified directory.

      def disable_ldaps(
        directory_id : String,
        type : String
      ) : Types::DisableLDAPSResult

        input = Types::DisableLDAPSRequest.new(directory_id: directory_id, type: type)
        disable_ldaps(input)
      end

      def disable_ldaps(input : Types::DisableLDAPSRequest) : Types::DisableLDAPSResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_LDAPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableLDAPSResult, "DisableLDAPS")
      end

      # Disables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service
      # (RADIUS) server for an AD Connector or Microsoft AD directory.

      def disable_radius(
        directory_id : String
      ) : Types::DisableRadiusResult

        input = Types::DisableRadiusRequest.new(directory_id: directory_id)
        disable_radius(input)
      end

      def disable_radius(input : Types::DisableRadiusRequest) : Types::DisableRadiusResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_RADIUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableRadiusResult, "DisableRadius")
      end

      # Disables single-sign on for a directory.

      def disable_sso(
        directory_id : String,
        password : String? = nil,
        user_name : String? = nil
      ) : Types::DisableSsoResult

        input = Types::DisableSsoRequest.new(directory_id: directory_id, password: password, user_name: user_name)
        disable_sso(input)
      end

      def disable_sso(input : Types::DisableSsoRequest) : Types::DisableSsoResult
        request = Protocol::JsonRpc.build_request(Model::DISABLE_SSO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableSsoResult, "DisableSso")
      end

      # Enables certificate authority (CA) enrollment policy for the specified directory. This allows
      # domain-joined clients to automatically request and receive certificates from the specified Amazon
      # Web Services Private Certificate Authority. Before enabling CA enrollment, ensure that the PCA
      # connector is properly configured and accessible from the directory. The connector must be in an
      # active state and have the necessary permissions.

      def enable_ca_enrollment_policy(
        directory_id : String,
        pca_connector_arn : String
      ) : Types::EnableCAEnrollmentPolicyResult

        input = Types::EnableCAEnrollmentPolicyRequest.new(directory_id: directory_id, pca_connector_arn: pca_connector_arn)
        enable_ca_enrollment_policy(input)
      end

      def enable_ca_enrollment_policy(input : Types::EnableCAEnrollmentPolicyRequest) : Types::EnableCAEnrollmentPolicyResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_CA_ENROLLMENT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableCAEnrollmentPolicyResult, "EnableCAEnrollmentPolicy")
      end

      # Enables alternative client authentication methods for the specified directory.

      def enable_client_authentication(
        directory_id : String,
        type : String
      ) : Types::EnableClientAuthenticationResult

        input = Types::EnableClientAuthenticationRequest.new(directory_id: directory_id, type: type)
        enable_client_authentication(input)
      end

      def enable_client_authentication(input : Types::EnableClientAuthenticationRequest) : Types::EnableClientAuthenticationResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_CLIENT_AUTHENTICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableClientAuthenticationResult, "EnableClientAuthentication")
      end

      # Enables access to directory data via the Directory Service Data API for the specified directory. For
      # more information, see Directory Service Data API Reference .

      def enable_directory_data_access(
        directory_id : String
      ) : Types::EnableDirectoryDataAccessResult

        input = Types::EnableDirectoryDataAccessRequest.new(directory_id: directory_id)
        enable_directory_data_access(input)
      end

      def enable_directory_data_access(input : Types::EnableDirectoryDataAccessRequest) : Types::EnableDirectoryDataAccessResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_DIRECTORY_DATA_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableDirectoryDataAccessResult, "EnableDirectoryDataAccess")
      end

      # Activates the switch for the specific directory to always use LDAP secure calls.

      def enable_ldaps(
        directory_id : String,
        type : String
      ) : Types::EnableLDAPSResult

        input = Types::EnableLDAPSRequest.new(directory_id: directory_id, type: type)
        enable_ldaps(input)
      end

      def enable_ldaps(input : Types::EnableLDAPSRequest) : Types::EnableLDAPSResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_LDAPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableLDAPSResult, "EnableLDAPS")
      end

      # Enables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service
      # (RADIUS) server for an AD Connector or Microsoft AD directory.

      def enable_radius(
        directory_id : String,
        radius_settings : Types::RadiusSettings
      ) : Types::EnableRadiusResult

        input = Types::EnableRadiusRequest.new(directory_id: directory_id, radius_settings: radius_settings)
        enable_radius(input)
      end

      def enable_radius(input : Types::EnableRadiusRequest) : Types::EnableRadiusResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_RADIUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableRadiusResult, "EnableRadius")
      end

      # Enables single sign-on for a directory. Single sign-on allows users in your directory to access
      # certain Amazon Web Services services from a computer joined to the directory without having to enter
      # their credentials separately.

      def enable_sso(
        directory_id : String,
        password : String? = nil,
        user_name : String? = nil
      ) : Types::EnableSsoResult

        input = Types::EnableSsoRequest.new(directory_id: directory_id, password: password, user_name: user_name)
        enable_sso(input)
      end

      def enable_sso(input : Types::EnableSsoRequest) : Types::EnableSsoResult
        request = Protocol::JsonRpc.build_request(Model::ENABLE_SSO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableSsoResult, "EnableSso")
      end

      # Obtains directory limit information for the current Region.

      def get_directory_limits : Types::GetDirectoryLimitsResult
        input = Types::GetDirectoryLimitsRequest.new
        get_directory_limits(input)
      end

      def get_directory_limits(input : Types::GetDirectoryLimitsRequest) : Types::GetDirectoryLimitsResult
        request = Protocol::JsonRpc.build_request(Model::GET_DIRECTORY_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDirectoryLimitsResult, "GetDirectoryLimits")
      end

      # Obtains the manual snapshot limits for a directory.

      def get_snapshot_limits(
        directory_id : String
      ) : Types::GetSnapshotLimitsResult

        input = Types::GetSnapshotLimitsRequest.new(directory_id: directory_id)
        get_snapshot_limits(input)
      end

      def get_snapshot_limits(input : Types::GetSnapshotLimitsRequest) : Types::GetSnapshotLimitsResult
        request = Protocol::JsonRpc.build_request(Model::GET_SNAPSHOT_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSnapshotLimitsResult, "GetSnapshotLimits")
      end

      # Retrieves a list of directory assessments for the specified directory or all assessments in your
      # account. Use this operation to monitor assessment status and manage multiple assessments.

      def list_ad_assessments(
        directory_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListADAssessmentsResult

        input = Types::ListADAssessmentsRequest.new(directory_id: directory_id, limit: limit, next_token: next_token)
        list_ad_assessments(input)
      end

      def list_ad_assessments(input : Types::ListADAssessmentsRequest) : Types::ListADAssessmentsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_AD_ASSESSMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListADAssessmentsResult, "ListADAssessments")
      end

      # For the specified directory, lists all the certificates registered for a secure LDAP or client
      # certificate authentication.

      def list_certificates(
        directory_id : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCertificatesResult

        input = Types::ListCertificatesRequest.new(directory_id: directory_id, limit: limit, next_token: next_token)
        list_certificates(input)
      end

      def list_certificates(input : Types::ListCertificatesRequest) : Types::ListCertificatesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCertificatesResult, "ListCertificates")
      end

      # Lists the address blocks that you have added to a directory.

      def list_ip_routes(
        directory_id : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListIpRoutesResult

        input = Types::ListIpRoutesRequest.new(directory_id: directory_id, limit: limit, next_token: next_token)
        list_ip_routes(input)
      end

      def list_ip_routes(input : Types::ListIpRoutesRequest) : Types::ListIpRoutesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_IP_ROUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIpRoutesResult, "ListIpRoutes")
      end

      # Lists the active log subscriptions for the Amazon Web Services account.

      def list_log_subscriptions(
        directory_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLogSubscriptionsResult

        input = Types::ListLogSubscriptionsRequest.new(directory_id: directory_id, limit: limit, next_token: next_token)
        list_log_subscriptions(input)
      end

      def list_log_subscriptions(input : Types::ListLogSubscriptionsRequest) : Types::ListLogSubscriptionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_LOG_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLogSubscriptionsResult, "ListLogSubscriptions")
      end

      # Lists all schema extensions applied to a Microsoft AD Directory.

      def list_schema_extensions(
        directory_id : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSchemaExtensionsResult

        input = Types::ListSchemaExtensionsRequest.new(directory_id: directory_id, limit: limit, next_token: next_token)
        list_schema_extensions(input)
      end

      def list_schema_extensions(input : Types::ListSchemaExtensionsRequest) : Types::ListSchemaExtensionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_SCHEMA_EXTENSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSchemaExtensionsResult, "ListSchemaExtensions")
      end

      # Lists all tags on a directory.

      def list_tags_for_resource(
        resource_id : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResult

        input = Types::ListTagsForResourceRequest.new(resource_id: resource_id, limit: limit, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResult, "ListTagsForResource")
      end

      # Registers a certificate for a secure LDAP or client certificate authentication.

      def register_certificate(
        certificate_data : String,
        directory_id : String,
        client_cert_auth_settings : Types::ClientCertAuthSettings? = nil,
        type : String? = nil
      ) : Types::RegisterCertificateResult

        input = Types::RegisterCertificateRequest.new(certificate_data: certificate_data, directory_id: directory_id, client_cert_auth_settings: client_cert_auth_settings, type: type)
        register_certificate(input)
      end

      def register_certificate(input : Types::RegisterCertificateRequest) : Types::RegisterCertificateResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterCertificateResult, "RegisterCertificate")
      end

      # Associates a directory with an Amazon SNS topic. This establishes the directory as a publisher to
      # the specified Amazon SNS topic. You can then receive email or text (SMS) messages when the status of
      # your directory changes. You get notified if your directory goes from an Active status to an Impaired
      # or Inoperable status. You also receive a notification when the directory returns to an Active
      # status.

      def register_event_topic(
        directory_id : String,
        topic_name : String
      ) : Types::RegisterEventTopicResult

        input = Types::RegisterEventTopicRequest.new(directory_id: directory_id, topic_name: topic_name)
        register_event_topic(input)
      end

      def register_event_topic(input : Types::RegisterEventTopicRequest) : Types::RegisterEventTopicResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_EVENT_TOPIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterEventTopicResult, "RegisterEventTopic")
      end

      # Rejects a directory sharing request that was sent from the directory owner account.

      def reject_shared_directory(
        shared_directory_id : String
      ) : Types::RejectSharedDirectoryResult

        input = Types::RejectSharedDirectoryRequest.new(shared_directory_id: shared_directory_id)
        reject_shared_directory(input)
      end

      def reject_shared_directory(input : Types::RejectSharedDirectoryRequest) : Types::RejectSharedDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::REJECT_SHARED_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectSharedDirectoryResult, "RejectSharedDirectory")
      end

      # Removes IP address blocks from a directory.

      def remove_ip_routes(
        directory_id : String,
        cidr_ips : Array(String)? = nil,
        cidr_ipv6s : Array(String)? = nil
      ) : Types::RemoveIpRoutesResult

        input = Types::RemoveIpRoutesRequest.new(directory_id: directory_id, cidr_ips: cidr_ips, cidr_ipv6s: cidr_ipv6s)
        remove_ip_routes(input)
      end

      def remove_ip_routes(input : Types::RemoveIpRoutesRequest) : Types::RemoveIpRoutesResult
        request = Protocol::JsonRpc.build_request(Model::REMOVE_IP_ROUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveIpRoutesResult, "RemoveIpRoutes")
      end

      # Stops all replication and removes the domain controllers from the specified Region. You cannot
      # remove the primary Region with this operation. Instead, use the DeleteDirectory API.

      def remove_region(
        directory_id : String
      ) : Types::RemoveRegionResult

        input = Types::RemoveRegionRequest.new(directory_id: directory_id)
        remove_region(input)
      end

      def remove_region(input : Types::RemoveRegionRequest) : Types::RemoveRegionResult
        request = Protocol::JsonRpc.build_request(Model::REMOVE_REGION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveRegionResult, "RemoveRegion")
      end

      # Removes tags from a directory.

      def remove_tags_from_resource(
        resource_id : String,
        tag_keys : Array(String)
      ) : Types::RemoveTagsFromResourceResult

        input = Types::RemoveTagsFromResourceRequest.new(resource_id: resource_id, tag_keys: tag_keys)
        remove_tags_from_resource(input)
      end

      def remove_tags_from_resource(input : Types::RemoveTagsFromResourceRequest) : Types::RemoveTagsFromResourceResult
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsFromResourceResult, "RemoveTagsFromResource")
      end

      # Resets the password for any user in your Managed Microsoft AD or Simple AD directory. Disabled users
      # will become enabled and can be authenticated following the API call. You can reset the password for
      # any user in your directory with the following exceptions: For Simple AD, you cannot reset the
      # password for any user that is a member of either the Domain Admins or Enterprise Admins group except
      # for the administrator user. For Managed Microsoft AD, you can only reset the password for a user
      # that is in an OU based off of the NetBIOS name that you typed when you created your directory. For
      # example, you cannot reset the password for a user in the Amazon Web Services Reserved OU. For more
      # information about the OU structure for an Managed Microsoft AD directory, see What Gets Created in
      # the Directory Service Administration Guide .

      def reset_user_password(
        directory_id : String,
        new_password : String,
        user_name : String
      ) : Types::ResetUserPasswordResult

        input = Types::ResetUserPasswordRequest.new(directory_id: directory_id, new_password: new_password, user_name: user_name)
        reset_user_password(input)
      end

      def reset_user_password(input : Types::ResetUserPasswordRequest) : Types::ResetUserPasswordResult
        request = Protocol::JsonRpc.build_request(Model::RESET_USER_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResetUserPasswordResult, "ResetUserPassword")
      end

      # Restores a directory using an existing directory snapshot. When you restore a directory from a
      # snapshot, any changes made to the directory after the snapshot date are overwritten. This action
      # returns as soon as the restore operation is initiated. You can monitor the progress of the restore
      # operation by calling the DescribeDirectories operation with the directory identifier. When the
      # DirectoryDescription.Stage value changes to Active , the restore operation is complete.

      def restore_from_snapshot(
        snapshot_id : String
      ) : Types::RestoreFromSnapshotResult

        input = Types::RestoreFromSnapshotRequest.new(snapshot_id: snapshot_id)
        restore_from_snapshot(input)
      end

      def restore_from_snapshot(input : Types::RestoreFromSnapshotRequest) : Types::RestoreFromSnapshotResult
        request = Protocol::JsonRpc.build_request(Model::RESTORE_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreFromSnapshotResult, "RestoreFromSnapshot")
      end

      # Shares a specified directory ( DirectoryId ) in your Amazon Web Services account (directory owner)
      # with another Amazon Web Services account (directory consumer). With this operation you can use your
      # directory from any Amazon Web Services account and from any Amazon VPC within an Amazon Web Services
      # Region. When you share your Managed Microsoft AD directory, Directory Service creates a shared
      # directory in the directory consumer account. This shared directory contains the metadata to provide
      # access to the directory within the directory owner account. The shared directory is visible in all
      # VPCs in the directory consumer account. The ShareMethod parameter determines whether the specified
      # directory can be shared between Amazon Web Services accounts inside the same Amazon Web Services
      # organization ( ORGANIZATIONS ). It also determines whether you can share the directory with any
      # other Amazon Web Services account either inside or outside of the organization ( HANDSHAKE ). The
      # ShareNotes parameter is only used when HANDSHAKE is called, which sends a directory sharing request
      # to the directory consumer.

      def share_directory(
        directory_id : String,
        share_method : String,
        share_target : Types::ShareTarget,
        share_notes : String? = nil
      ) : Types::ShareDirectoryResult

        input = Types::ShareDirectoryRequest.new(directory_id: directory_id, share_method: share_method, share_target: share_target, share_notes: share_notes)
        share_directory(input)
      end

      def share_directory(input : Types::ShareDirectoryRequest) : Types::ShareDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::SHARE_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ShareDirectoryResult, "ShareDirectory")
      end

      # Initiates a directory assessment to validate your self-managed AD environment for hybrid domain
      # join. The assessment checks compatibility and connectivity of the self-managed AD environment. A
      # directory assessment is automatically created when you create a hybrid directory. There are two
      # types of assessments: CUSTOMER and SYSTEM . Your Amazon Web Services account has a limit of 100
      # CUSTOMER directory assessments. The assessment process typically takes 30 minutes or more to
      # complete. The assessment process is asynchronous and you can monitor it with DescribeADAssessment .
      # The InstanceIds must have a one-to-one correspondence with CustomerDnsIps , meaning that if the IP
      # address for instance i-10243410 is 10.24.34.100 and the IP address for instance i-10243420 is
      # 10.24.34.200, then the input arrays must maintain the same order relationship, either [10.24.34.100,
      # 10.24.34.200] paired with [i-10243410, i-10243420] or [10.24.34.200, 10.24.34.100] paired with
      # [i-10243420, i-10243410]. Note: You must provide exactly one DirectoryId or AssessmentConfiguration
      # .

      def start_ad_assessment(
        assessment_configuration : Types::AssessmentConfiguration? = nil,
        directory_id : String? = nil
      ) : Types::StartADAssessmentResult

        input = Types::StartADAssessmentRequest.new(assessment_configuration: assessment_configuration, directory_id: directory_id)
        start_ad_assessment(input)
      end

      def start_ad_assessment(input : Types::StartADAssessmentRequest) : Types::StartADAssessmentResult
        request = Protocol::JsonRpc.build_request(Model::START_AD_ASSESSMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartADAssessmentResult, "StartADAssessment")
      end

      # Applies a schema extension to a Microsoft AD directory.

      def start_schema_extension(
        create_snapshot_before_schema_extension : Bool,
        description : String,
        directory_id : String,
        ldif_content : String
      ) : Types::StartSchemaExtensionResult

        input = Types::StartSchemaExtensionRequest.new(create_snapshot_before_schema_extension: create_snapshot_before_schema_extension, description: description, directory_id: directory_id, ldif_content: ldif_content)
        start_schema_extension(input)
      end

      def start_schema_extension(input : Types::StartSchemaExtensionRequest) : Types::StartSchemaExtensionResult
        request = Protocol::JsonRpc.build_request(Model::START_SCHEMA_EXTENSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSchemaExtensionResult, "StartSchemaExtension")
      end

      # Stops the directory sharing between the directory owner and consumer accounts.

      def unshare_directory(
        directory_id : String,
        unshare_target : Types::UnshareTarget
      ) : Types::UnshareDirectoryResult

        input = Types::UnshareDirectoryRequest.new(directory_id: directory_id, unshare_target: unshare_target)
        unshare_directory(input)
      end

      def unshare_directory(input : Types::UnshareDirectoryRequest) : Types::UnshareDirectoryResult
        request = Protocol::JsonRpc.build_request(Model::UNSHARE_DIRECTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UnshareDirectoryResult, "UnshareDirectory")
      end

      # Updates a conditional forwarder that has been set up for your Amazon Web Services directory.

      def update_conditional_forwarder(
        directory_id : String,
        remote_domain_name : String,
        dns_ip_addrs : Array(String)? = nil,
        dns_ipv6_addrs : Array(String)? = nil
      ) : Types::UpdateConditionalForwarderResult

        input = Types::UpdateConditionalForwarderRequest.new(directory_id: directory_id, remote_domain_name: remote_domain_name, dns_ip_addrs: dns_ip_addrs, dns_ipv6_addrs: dns_ipv6_addrs)
        update_conditional_forwarder(input)
      end

      def update_conditional_forwarder(input : Types::UpdateConditionalForwarderRequest) : Types::UpdateConditionalForwarderResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONDITIONAL_FORWARDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConditionalForwarderResult, "UpdateConditionalForwarder")
      end

      # Updates directory configuration for the specified update type.

      def update_directory_setup(
        directory_id : String,
        update_type : String,
        create_snapshot_before_update : Bool? = nil,
        directory_size_update_settings : Types::DirectorySizeUpdateSettings? = nil,
        network_update_settings : Types::NetworkUpdateSettings? = nil,
        os_update_settings : Types::OSUpdateSettings? = nil
      ) : Types::UpdateDirectorySetupResult

        input = Types::UpdateDirectorySetupRequest.new(directory_id: directory_id, update_type: update_type, create_snapshot_before_update: create_snapshot_before_update, directory_size_update_settings: directory_size_update_settings, network_update_settings: network_update_settings, os_update_settings: os_update_settings)
        update_directory_setup(input)
      end

      def update_directory_setup(input : Types::UpdateDirectorySetupRequest) : Types::UpdateDirectorySetupResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DIRECTORY_SETUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDirectorySetupResult, "UpdateDirectorySetup")
      end

      # Updates the configuration of an existing hybrid directory. You can recover hybrid directory
      # administrator account or modify self-managed instance settings. Updates are applied asynchronously.
      # Use DescribeHybridADUpdate to monitor the progress of configuration changes. The InstanceIds must
      # have a one-to-one correspondence with CustomerDnsIps , meaning that if the IP address for instance
      # i-10243410 is 10.24.34.100 and the IP address for instance i-10243420 is 10.24.34.200, then the
      # input arrays must maintain the same order relationship, either [10.24.34.100, 10.24.34.200] paired
      # with [i-10243410, i-10243420] or [10.24.34.200, 10.24.34.100] paired with [i-10243420, i-10243410].
      # You must provide at least one update to UpdateHybridADRequest$HybridAdministratorAccountUpdate or
      # UpdateHybridADRequest$SelfManagedInstancesSettings .

      def update_hybrid_ad(
        directory_id : String,
        hybrid_administrator_account_update : Types::HybridAdministratorAccountUpdate? = nil,
        self_managed_instances_settings : Types::HybridCustomerInstancesSettings? = nil
      ) : Types::UpdateHybridADResult

        input = Types::UpdateHybridADRequest.new(directory_id: directory_id, hybrid_administrator_account_update: hybrid_administrator_account_update, self_managed_instances_settings: self_managed_instances_settings)
        update_hybrid_ad(input)
      end

      def update_hybrid_ad(input : Types::UpdateHybridADRequest) : Types::UpdateHybridADResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HYBRID_AD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHybridADResult, "UpdateHybridAD")
      end

      # Adds or removes domain controllers to or from the directory. Based on the difference between current
      # value and new value (provided through this API call), domain controllers will be added or removed.
      # It may take up to 45 minutes for any new domain controllers to become fully active once the
      # requested number of domain controllers is updated. During this time, you cannot make another update
      # request.

      def update_number_of_domain_controllers(
        desired_number : Int32,
        directory_id : String
      ) : Types::UpdateNumberOfDomainControllersResult

        input = Types::UpdateNumberOfDomainControllersRequest.new(desired_number: desired_number, directory_id: directory_id)
        update_number_of_domain_controllers(input)
      end

      def update_number_of_domain_controllers(input : Types::UpdateNumberOfDomainControllersRequest) : Types::UpdateNumberOfDomainControllersResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NUMBER_OF_DOMAIN_CONTROLLERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNumberOfDomainControllersResult, "UpdateNumberOfDomainControllers")
      end

      # Updates the Remote Authentication Dial In User Service (RADIUS) server information for an AD
      # Connector or Microsoft AD directory.

      def update_radius(
        directory_id : String,
        radius_settings : Types::RadiusSettings
      ) : Types::UpdateRadiusResult

        input = Types::UpdateRadiusRequest.new(directory_id: directory_id, radius_settings: radius_settings)
        update_radius(input)
      end

      def update_radius(input : Types::UpdateRadiusRequest) : Types::UpdateRadiusResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RADIUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRadiusResult, "UpdateRadius")
      end

      # Updates the configurable settings for the specified directory.

      def update_settings(
        directory_id : String,
        settings : Array(Types::Setting)
      ) : Types::UpdateSettingsResult

        input = Types::UpdateSettingsRequest.new(directory_id: directory_id, settings: settings)
        update_settings(input)
      end

      def update_settings(input : Types::UpdateSettingsRequest) : Types::UpdateSettingsResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSettingsResult, "UpdateSettings")
      end

      # Updates the trust that has been set up between your Managed Microsoft AD directory and an
      # self-managed Active Directory.

      def update_trust(
        trust_id : String,
        selective_auth : String? = nil
      ) : Types::UpdateTrustResult

        input = Types::UpdateTrustRequest.new(trust_id: trust_id, selective_auth: selective_auth)
        update_trust(input)
      end

      def update_trust(input : Types::UpdateTrustRequest) : Types::UpdateTrustResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRUST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTrustResult, "UpdateTrust")
      end

      # Directory Service for Microsoft Active Directory allows you to configure and verify trust
      # relationships. This action verifies a trust relationship between your Managed Microsoft AD directory
      # and an external domain.

      def verify_trust(
        trust_id : String
      ) : Types::VerifyTrustResult

        input = Types::VerifyTrustRequest.new(trust_id: trust_id)
        verify_trust(input)
      end

      def verify_trust(input : Types::VerifyTrustRequest) : Types::VerifyTrustResult
        request = Protocol::JsonRpc.build_request(Model::VERIFY_TRUST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VerifyTrustResult, "VerifyTrust")
      end
    end
  end
end
