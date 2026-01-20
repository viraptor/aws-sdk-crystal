module AwsSdk
  module Transfer
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

      # Used by administrators to choose which groups in the directory should have access to upload and
      # download files over the enabled protocols using Transfer Family. For example, a Microsoft Active
      # Directory might contain 50,000 users, but only a small fraction might need the ability to transfer
      # files to the server. An administrator can use CreateAccess to limit the access to the correct set of
      # users who need this ability.

      def create_access(
        external_id : String,
        role : String,
        server_id : String,
        home_directory : String? = nil,
        home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
        home_directory_type : String? = nil,
        policy : String? = nil,
        posix_profile : Types::PosixProfile? = nil
      ) : Types::CreateAccessResponse

        input = Types::CreateAccessRequest.new(external_id: external_id, role: role, server_id: server_id, home_directory: home_directory, home_directory_mappings: home_directory_mappings, home_directory_type: home_directory_type, policy: policy, posix_profile: posix_profile)
        create_access(input)
      end

      def create_access(input : Types::CreateAccessRequest) : Types::CreateAccessResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAccessResponse, "CreateAccess")
      end

      # Creates an agreement. An agreement is a bilateral trading partner agreement, or partnership, between
      # an Transfer Family server and an AS2 process. The agreement defines the file and message transfer
      # relationship between the server and the AS2 process. To define an agreement, Transfer Family
      # combines a server, local profile, partner profile, certificate, and other attributes. The partner is
      # identified with the PartnerProfileId , and the AS2 process is identified with the LocalProfileId .
      # Specify either BaseDirectory or CustomDirectories , but not both. Specifying both causes the command
      # to fail.

      def create_agreement(
        access_role : String,
        local_profile_id : String,
        partner_profile_id : String,
        server_id : String,
        base_directory : String? = nil,
        custom_directories : Types::CustomDirectoriesType? = nil,
        description : String? = nil,
        enforce_message_signing : String? = nil,
        preserve_filename : String? = nil,
        status : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAgreementResponse

        input = Types::CreateAgreementRequest.new(access_role: access_role, local_profile_id: local_profile_id, partner_profile_id: partner_profile_id, server_id: server_id, base_directory: base_directory, custom_directories: custom_directories, description: description, enforce_message_signing: enforce_message_signing, preserve_filename: preserve_filename, status: status, tags: tags)
        create_agreement(input)
      end

      def create_agreement(input : Types::CreateAgreementRequest) : Types::CreateAgreementResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AGREEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAgreementResponse, "CreateAgreement")
      end

      # Creates the connector, which captures the parameters for a connection for the AS2 or SFTP protocol.
      # For AS2, the connector is required for sending files to an externally hosted AS2 server. For SFTP,
      # the connector is required when sending files to an SFTP server or receiving files from an SFTP
      # server. For more details about connectors, see Configure AS2 connectors and Create SFTP connectors .
      # You must specify exactly one configuration object: either for AS2 ( As2Config ) or SFTP ( SftpConfig
      # ).

      def create_connector(
        access_role : String,
        as2_config : Types::As2ConnectorConfig? = nil,
        egress_config : Types::ConnectorEgressConfig? = nil,
        logging_role : String? = nil,
        security_policy_name : String? = nil,
        sftp_config : Types::SftpConnectorConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        url : String? = nil
      ) : Types::CreateConnectorResponse

        input = Types::CreateConnectorRequest.new(access_role: access_role, as2_config: as2_config, egress_config: egress_config, logging_role: logging_role, security_policy_name: security_policy_name, sftp_config: sftp_config, tags: tags, url: url)
        create_connector(input)
      end

      def create_connector(input : Types::CreateConnectorRequest) : Types::CreateConnectorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectorResponse, "CreateConnector")
      end

      # Creates the local or partner profile to use for AS2 transfers.

      def create_profile(
        as2_id : String,
        profile_type : String,
        certificate_ids : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProfileResponse

        input = Types::CreateProfileRequest.new(as2_id: as2_id, profile_type: profile_type, certificate_ids: certificate_ids, tags: tags)
        create_profile(input)
      end

      def create_profile(input : Types::CreateProfileRequest) : Types::CreateProfileResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProfileResponse, "CreateProfile")
      end

      # Instantiates an auto-scaling virtual server based on the selected file transfer protocol in Amazon
      # Web Services. When you make updates to your file transfer protocol-enabled server or when you work
      # with users, use the service-generated ServerId property that is assigned to the newly created
      # server.

      def create_server(
        certificate : String? = nil,
        domain : String? = nil,
        endpoint_details : Types::EndpointDetails? = nil,
        endpoint_type : String? = nil,
        host_key : String? = nil,
        identity_provider_details : Types::IdentityProviderDetails? = nil,
        identity_provider_type : String? = nil,
        ip_address_type : String? = nil,
        logging_role : String? = nil,
        post_authentication_login_banner : String? = nil,
        pre_authentication_login_banner : String? = nil,
        protocol_details : Types::ProtocolDetails? = nil,
        protocols : Array(String)? = nil,
        s3_storage_options : Types::S3StorageOptions? = nil,
        security_policy_name : String? = nil,
        structured_log_destinations : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        workflow_details : Types::WorkflowDetails? = nil
      ) : Types::CreateServerResponse

        input = Types::CreateServerRequest.new(certificate: certificate, domain: domain, endpoint_details: endpoint_details, endpoint_type: endpoint_type, host_key: host_key, identity_provider_details: identity_provider_details, identity_provider_type: identity_provider_type, ip_address_type: ip_address_type, logging_role: logging_role, post_authentication_login_banner: post_authentication_login_banner, pre_authentication_login_banner: pre_authentication_login_banner, protocol_details: protocol_details, protocols: protocols, s3_storage_options: s3_storage_options, security_policy_name: security_policy_name, structured_log_destinations: structured_log_destinations, tags: tags, workflow_details: workflow_details)
        create_server(input)
      end

      def create_server(input : Types::CreateServerRequest) : Types::CreateServerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateServerResponse, "CreateServer")
      end

      # Creates a user and associates them with an existing file transfer protocol-enabled server. You can
      # only create and associate users with servers that have the IdentityProviderType set to
      # SERVICE_MANAGED . Using parameters for CreateUser , you can specify the user name, set the home
      # directory, store the user's public key, and assign the user's Identity and Access Management (IAM)
      # role. You can also optionally add a session policy, and assign metadata with tags that can be used
      # to group and search for users.

      def create_user(
        role : String,
        server_id : String,
        user_name : String,
        home_directory : String? = nil,
        home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
        home_directory_type : String? = nil,
        policy : String? = nil,
        posix_profile : Types::PosixProfile? = nil,
        ssh_public_key_body : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateUserResponse

        input = Types::CreateUserRequest.new(role: role, server_id: server_id, user_name: user_name, home_directory: home_directory, home_directory_mappings: home_directory_mappings, home_directory_type: home_directory_type, policy: policy, posix_profile: posix_profile, ssh_public_key_body: ssh_public_key_body, tags: tags)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Types::CreateUserResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserResponse, "CreateUser")
      end

      # Creates a web app based on specified parameters, and returns the ID for the new web app. You can
      # configure the web app to be publicly accessible or hosted within a VPC. For more information about
      # using VPC endpoints with Transfer Family, see Create a Transfer Family web app in a VPC .

      def create_web_app(
        identity_provider_details : Types::WebAppIdentityProviderDetails,
        access_endpoint : String? = nil,
        endpoint_details : Types::WebAppEndpointDetails? = nil,
        tags : Array(Types::Tag)? = nil,
        web_app_endpoint_policy : String? = nil,
        web_app_units : Types::WebAppUnits? = nil
      ) : Types::CreateWebAppResponse

        input = Types::CreateWebAppRequest.new(identity_provider_details: identity_provider_details, access_endpoint: access_endpoint, endpoint_details: endpoint_details, tags: tags, web_app_endpoint_policy: web_app_endpoint_policy, web_app_units: web_app_units)
        create_web_app(input)
      end

      def create_web_app(input : Types::CreateWebAppRequest) : Types::CreateWebAppResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WEB_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWebAppResponse, "CreateWebApp")
      end

      # Allows you to create a workflow with specified steps and step details the workflow invokes after
      # file transfer completes. After creating a workflow, you can associate the workflow created with any
      # transfer servers by specifying the workflow-details field in CreateServer and UpdateServer
      # operations.

      def create_workflow(
        steps : Array(Types::WorkflowStep),
        description : String? = nil,
        on_exception_steps : Array(Types::WorkflowStep)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateWorkflowResponse

        input = Types::CreateWorkflowRequest.new(steps: steps, description: description, on_exception_steps: on_exception_steps, tags: tags)
        create_workflow(input)
      end

      def create_workflow(input : Types::CreateWorkflowRequest) : Types::CreateWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkflowResponse, "CreateWorkflow")
      end

      # Allows you to delete the access specified in the ServerID and ExternalID parameters.

      def delete_access(
        external_id : String,
        server_id : String
      ) : Nil

        input = Types::DeleteAccessRequest.new(external_id: external_id, server_id: server_id)
        delete_access(input)
      end

      def delete_access(input : Types::DeleteAccessRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete the agreement that's specified in the provided AgreementId .

      def delete_agreement(
        agreement_id : String,
        server_id : String
      ) : Nil

        input = Types::DeleteAgreementRequest.new(agreement_id: agreement_id, server_id: server_id)
        delete_agreement(input)
      end

      def delete_agreement(input : Types::DeleteAgreementRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_AGREEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the certificate that's specified in the CertificateId parameter.

      def delete_certificate(
        certificate_id : String
      ) : Nil

        input = Types::DeleteCertificateRequest.new(certificate_id: certificate_id)
        delete_certificate(input)
      end

      def delete_certificate(input : Types::DeleteCertificateRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the connector that's specified in the provided ConnectorId .

      def delete_connector(
        connector_id : String
      ) : Nil

        input = Types::DeleteConnectorRequest.new(connector_id: connector_id)
        delete_connector(input)
      end

      def delete_connector(input : Types::DeleteConnectorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the host key that's specified in the HostKeyId parameter.

      def delete_host_key(
        host_key_id : String,
        server_id : String
      ) : Nil

        input = Types::DeleteHostKeyRequest.new(host_key_id: host_key_id, server_id: server_id)
        delete_host_key(input)
      end

      def delete_host_key(input : Types::DeleteHostKeyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_HOST_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the profile that's specified in the ProfileId parameter.

      def delete_profile(
        profile_id : String
      ) : Nil

        input = Types::DeleteProfileRequest.new(profile_id: profile_id)
        delete_profile(input)
      end

      def delete_profile(input : Types::DeleteProfileRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the file transfer protocol-enabled server that you specify. No response returns from this
      # operation.

      def delete_server(
        server_id : String
      ) : Nil

        input = Types::DeleteServerRequest.new(server_id: server_id)
        delete_server(input)
      end

      def delete_server(input : Types::DeleteServerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a user's Secure Shell (SSH) public key.

      def delete_ssh_public_key(
        server_id : String,
        ssh_public_key_id : String,
        user_name : String
      ) : Nil

        input = Types::DeleteSshPublicKeyRequest.new(server_id: server_id, ssh_public_key_id: ssh_public_key_id, user_name: user_name)
        delete_ssh_public_key(input)
      end

      def delete_ssh_public_key(input : Types::DeleteSshPublicKeyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the user belonging to a file transfer protocol-enabled server you specify. No response
      # returns from this operation. When you delete a user from a server, the user's information is lost.

      def delete_user(
        server_id : String,
        user_name : String
      ) : Nil

        input = Types::DeleteUserRequest.new(server_id: server_id, user_name: user_name)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified web app.

      def delete_web_app(
        web_app_id : String
      ) : Nil

        input = Types::DeleteWebAppRequest.new(web_app_id: web_app_id)
        delete_web_app(input)
      end

      def delete_web_app(input : Types::DeleteWebAppRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WEB_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the WebAppCustomization object that corresponds to the web app ID specified.

      def delete_web_app_customization(
        web_app_id : String
      ) : Nil

        input = Types::DeleteWebAppCustomizationRequest.new(web_app_id: web_app_id)
        delete_web_app_customization(input)
      end

      def delete_web_app_customization(input : Types::DeleteWebAppCustomizationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WEB_APP_CUSTOMIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified workflow.

      def delete_workflow(
        workflow_id : String
      ) : Nil

        input = Types::DeleteWorkflowRequest.new(workflow_id: workflow_id)
        delete_workflow(input)
      end

      def delete_workflow(input : Types::DeleteWorkflowRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Describes the access that is assigned to the specific file transfer protocol-enabled server, as
      # identified by its ServerId property and its ExternalId . The response from this call returns the
      # properties of the access that is associated with the ServerId value that was specified.

      def describe_access(
        external_id : String,
        server_id : String
      ) : Types::DescribeAccessResponse

        input = Types::DescribeAccessRequest.new(external_id: external_id, server_id: server_id)
        describe_access(input)
      end

      def describe_access(input : Types::DescribeAccessRequest) : Types::DescribeAccessResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccessResponse, "DescribeAccess")
      end

      # Describes the agreement that's identified by the AgreementId .

      def describe_agreement(
        agreement_id : String,
        server_id : String
      ) : Types::DescribeAgreementResponse

        input = Types::DescribeAgreementRequest.new(agreement_id: agreement_id, server_id: server_id)
        describe_agreement(input)
      end

      def describe_agreement(input : Types::DescribeAgreementRequest) : Types::DescribeAgreementResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AGREEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAgreementResponse, "DescribeAgreement")
      end

      # Describes the certificate that's identified by the CertificateId . Transfer Family automatically
      # publishes a Amazon CloudWatch metric called DaysUntilExpiry for imported certificates. This metric
      # tracks the number of days until the certificate expires based on the InactiveDate . The metric is
      # available in the AWS/Transfer namespace and includes the CertificateId as a dimension.

      def describe_certificate(
        certificate_id : String
      ) : Types::DescribeCertificateResponse

        input = Types::DescribeCertificateRequest.new(certificate_id: certificate_id)
        describe_certificate(input)
      end

      def describe_certificate(input : Types::DescribeCertificateRequest) : Types::DescribeCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCertificateResponse, "DescribeCertificate")
      end

      # Describes the connector that's identified by the ConnectorId.

      def describe_connector(
        connector_id : String
      ) : Types::DescribeConnectorResponse

        input = Types::DescribeConnectorRequest.new(connector_id: connector_id)
        describe_connector(input)
      end

      def describe_connector(input : Types::DescribeConnectorRequest) : Types::DescribeConnectorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectorResponse, "DescribeConnector")
      end

      # You can use DescribeExecution to check the details of the execution of the specified workflow. This
      # API call only returns details for in-progress workflows. If you provide an ID for an execution that
      # is not in progress, or if the execution doesn't match the specified workflow ID, you receive a
      # ResourceNotFound exception.

      def describe_execution(
        execution_id : String,
        workflow_id : String
      ) : Types::DescribeExecutionResponse

        input = Types::DescribeExecutionRequest.new(execution_id: execution_id, workflow_id: workflow_id)
        describe_execution(input)
      end

      def describe_execution(input : Types::DescribeExecutionRequest) : Types::DescribeExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExecutionResponse, "DescribeExecution")
      end

      # Returns the details of the host key that's specified by the HostKeyId and ServerId .

      def describe_host_key(
        host_key_id : String,
        server_id : String
      ) : Types::DescribeHostKeyResponse

        input = Types::DescribeHostKeyRequest.new(host_key_id: host_key_id, server_id: server_id)
        describe_host_key(input)
      end

      def describe_host_key(input : Types::DescribeHostKeyRequest) : Types::DescribeHostKeyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HOST_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHostKeyResponse, "DescribeHostKey")
      end

      # Returns the details of the profile that's specified by the ProfileId .

      def describe_profile(
        profile_id : String
      ) : Types::DescribeProfileResponse

        input = Types::DescribeProfileRequest.new(profile_id: profile_id)
        describe_profile(input)
      end

      def describe_profile(input : Types::DescribeProfileRequest) : Types::DescribeProfileResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProfileResponse, "DescribeProfile")
      end

      # Describes the security policy that is attached to your server or SFTP connector. The response
      # contains a description of the security policy's properties. For more information about security
      # policies, see Working with security policies for servers or Working with security policies for SFTP
      # connectors .

      def describe_security_policy(
        security_policy_name : String
      ) : Types::DescribeSecurityPolicyResponse

        input = Types::DescribeSecurityPolicyRequest.new(security_policy_name: security_policy_name)
        describe_security_policy(input)
      end

      def describe_security_policy(input : Types::DescribeSecurityPolicyRequest) : Types::DescribeSecurityPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SECURITY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSecurityPolicyResponse, "DescribeSecurityPolicy")
      end

      # Describes a file transfer protocol-enabled server that you specify by passing the ServerId
      # parameter. The response contains a description of a server's properties. When you set EndpointType
      # to VPC, the response will contain the EndpointDetails .

      def describe_server(
        server_id : String
      ) : Types::DescribeServerResponse

        input = Types::DescribeServerRequest.new(server_id: server_id)
        describe_server(input)
      end

      def describe_server(input : Types::DescribeServerRequest) : Types::DescribeServerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServerResponse, "DescribeServer")
      end

      # Describes the user assigned to the specific file transfer protocol-enabled server, as identified by
      # its ServerId property. The response from this call returns the properties of the user associated
      # with the ServerId value that was specified.

      def describe_user(
        server_id : String,
        user_name : String
      ) : Types::DescribeUserResponse

        input = Types::DescribeUserRequest.new(server_id: server_id, user_name: user_name)
        describe_user(input)
      end

      def describe_user(input : Types::DescribeUserRequest) : Types::DescribeUserResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserResponse, "DescribeUser")
      end

      # Describes the web app that's identified by WebAppId . The response includes endpoint configuration
      # details such as whether the web app is publicly accessible or VPC hosted. For more information about
      # using VPC endpoints with Transfer Family, see Create a Transfer Family web app in a VPC .

      def describe_web_app(
        web_app_id : String
      ) : Types::DescribeWebAppResponse

        input = Types::DescribeWebAppRequest.new(web_app_id: web_app_id)
        describe_web_app(input)
      end

      def describe_web_app(input : Types::DescribeWebAppRequest) : Types::DescribeWebAppResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WEB_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWebAppResponse, "DescribeWebApp")
      end

      # Describes the web app customization object that's identified by WebAppId .

      def describe_web_app_customization(
        web_app_id : String
      ) : Types::DescribeWebAppCustomizationResponse

        input = Types::DescribeWebAppCustomizationRequest.new(web_app_id: web_app_id)
        describe_web_app_customization(input)
      end

      def describe_web_app_customization(input : Types::DescribeWebAppCustomizationRequest) : Types::DescribeWebAppCustomizationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WEB_APP_CUSTOMIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWebAppCustomizationResponse, "DescribeWebAppCustomization")
      end

      # Describes the specified workflow.

      def describe_workflow(
        workflow_id : String
      ) : Types::DescribeWorkflowResponse

        input = Types::DescribeWorkflowRequest.new(workflow_id: workflow_id)
        describe_workflow(input)
      end

      def describe_workflow(input : Types::DescribeWorkflowRequest) : Types::DescribeWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkflowResponse, "DescribeWorkflow")
      end

      # Imports the signing and encryption certificates that you need to create local (AS2) profiles and
      # partner profiles. You can import both the certificate and its chain in the Certificate parameter.
      # After importing a certificate, Transfer Family automatically creates a Amazon CloudWatch metric
      # called DaysUntilExpiry that tracks the number of days until the certificate expires. The metric is
      # based on the InactiveDate parameter and is published daily in the AWS/Transfer namespace. It can
      # take up to a full day after importing a certificate for Transfer Family to emit the DaysUntilExpiry
      # metric to your account. If you use the Certificate parameter to upload both the certificate and its
      # chain, don't use the CertificateChain parameter. CloudWatch monitoring The DaysUntilExpiry metric
      # includes the following specifications: Units: Count (days) Dimensions: CertificateId (always
      # present), Description (if provided during certificate import) Statistics: Minimum, Maximum, Average
      # Frequency: Published daily

      def import_certificate(
        certificate : String,
        usage : String,
        active_date : Time? = nil,
        certificate_chain : String? = nil,
        description : String? = nil,
        inactive_date : Time? = nil,
        private_key : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportCertificateResponse

        input = Types::ImportCertificateRequest.new(certificate: certificate, usage: usage, active_date: active_date, certificate_chain: certificate_chain, description: description, inactive_date: inactive_date, private_key: private_key, tags: tags)
        import_certificate(input)
      end

      def import_certificate(input : Types::ImportCertificateRequest) : Types::ImportCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportCertificateResponse, "ImportCertificate")
      end

      # Adds a host key to the server that's specified by the ServerId parameter.

      def import_host_key(
        host_key_body : String,
        server_id : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportHostKeyResponse

        input = Types::ImportHostKeyRequest.new(host_key_body: host_key_body, server_id: server_id, description: description, tags: tags)
        import_host_key(input)
      end

      def import_host_key(input : Types::ImportHostKeyRequest) : Types::ImportHostKeyResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_HOST_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportHostKeyResponse, "ImportHostKey")
      end

      # Adds a Secure Shell (SSH) public key to a Transfer Family user identified by a UserName value
      # assigned to the specific file transfer protocol-enabled server, identified by ServerId . The
      # response returns the UserName value, the ServerId value, and the name of the SshPublicKeyId .

      def import_ssh_public_key(
        server_id : String,
        ssh_public_key_body : String,
        user_name : String
      ) : Types::ImportSshPublicKeyResponse

        input = Types::ImportSshPublicKeyRequest.new(server_id: server_id, ssh_public_key_body: ssh_public_key_body, user_name: user_name)
        import_ssh_public_key(input)
      end

      def import_ssh_public_key(input : Types::ImportSshPublicKeyRequest) : Types::ImportSshPublicKeyResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportSshPublicKeyResponse, "ImportSshPublicKey")
      end

      # Lists the details for all the accesses you have on your server.

      def list_accesses(
        server_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccessesResponse

        input = Types::ListAccessesRequest.new(server_id: server_id, max_results: max_results, next_token: next_token)
        list_accesses(input)
      end

      def list_accesses(input : Types::ListAccessesRequest) : Types::ListAccessesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCESSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccessesResponse, "ListAccesses")
      end

      # Returns a list of the agreements for the server that's identified by the ServerId that you supply.
      # If you want to limit the results to a certain number, supply a value for the MaxResults parameter.
      # If you ran the command previously and received a value for NextToken , you can supply that value to
      # continue listing agreements from where you left off.

      def list_agreements(
        server_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAgreementsResponse

        input = Types::ListAgreementsRequest.new(server_id: server_id, max_results: max_results, next_token: next_token)
        list_agreements(input)
      end

      def list_agreements(input : Types::ListAgreementsRequest) : Types::ListAgreementsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AGREEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAgreementsResponse, "ListAgreements")
      end

      # Returns a list of the current certificates that have been imported into Transfer Family. If you want
      # to limit the results to a certain number, supply a value for the MaxResults parameter. If you ran
      # the command previously and received a value for the NextToken parameter, you can supply that value
      # to continue listing certificates from where you left off.

      def list_certificates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCertificatesResponse

        input = Types::ListCertificatesRequest.new(max_results: max_results, next_token: next_token)
        list_certificates(input)
      end

      def list_certificates(input : Types::ListCertificatesRequest) : Types::ListCertificatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCertificatesResponse, "ListCertificates")
      end

      # Lists the connectors for the specified Region.

      def list_connectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListConnectorsResponse

        input = Types::ListConnectorsRequest.new(max_results: max_results, next_token: next_token)
        list_connectors(input)
      end

      def list_connectors(input : Types::ListConnectorsRequest) : Types::ListConnectorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONNECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConnectorsResponse, "ListConnectors")
      end

      # Lists all in-progress executions for the specified workflow. If the specified workflow ID cannot be
      # found, ListExecutions returns a ResourceNotFound exception.

      def list_executions(
        workflow_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExecutionsResponse

        input = Types::ListExecutionsRequest.new(workflow_id: workflow_id, max_results: max_results, next_token: next_token)
        list_executions(input)
      end

      def list_executions(input : Types::ListExecutionsRequest) : Types::ListExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExecutionsResponse, "ListExecutions")
      end

      # Returns real-time updates and detailed information on the status of each individual file being
      # transferred in a specific file transfer operation. You specify the file transfer by providing its
      # ConnectorId and its TransferId . File transfer results are available up to 7 days after an operation
      # has been requested.

      def list_file_transfer_results(
        connector_id : String,
        transfer_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFileTransferResultsResponse

        input = Types::ListFileTransferResultsRequest.new(connector_id: connector_id, transfer_id: transfer_id, max_results: max_results, next_token: next_token)
        list_file_transfer_results(input)
      end

      def list_file_transfer_results(input : Types::ListFileTransferResultsRequest) : Types::ListFileTransferResultsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FILE_TRANSFER_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFileTransferResultsResponse, "ListFileTransferResults")
      end

      # Returns a list of host keys for the server that's specified by the ServerId parameter.

      def list_host_keys(
        server_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListHostKeysResponse

        input = Types::ListHostKeysRequest.new(server_id: server_id, max_results: max_results, next_token: next_token)
        list_host_keys(input)
      end

      def list_host_keys(input : Types::ListHostKeysRequest) : Types::ListHostKeysResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HOST_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHostKeysResponse, "ListHostKeys")
      end

      # Returns a list of the profiles for your system. If you want to limit the results to a certain
      # number, supply a value for the MaxResults parameter. If you ran the command previously and received
      # a value for NextToken , you can supply that value to continue listing profiles from where you left
      # off.

      def list_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil,
        profile_type : String? = nil
      ) : Types::ListProfilesResponse

        input = Types::ListProfilesRequest.new(max_results: max_results, next_token: next_token, profile_type: profile_type)
        list_profiles(input)
      end

      def list_profiles(input : Types::ListProfilesRequest) : Types::ListProfilesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProfilesResponse, "ListProfiles")
      end

      # Lists the security policies that are attached to your servers and SFTP connectors. For more
      # information about security policies, see Working with security policies for servers or Working with
      # security policies for SFTP connectors .

      def list_security_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSecurityPoliciesResponse

        input = Types::ListSecurityPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_security_policies(input)
      end

      def list_security_policies(input : Types::ListSecurityPoliciesRequest) : Types::ListSecurityPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SECURITY_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSecurityPoliciesResponse, "ListSecurityPolicies")
      end

      # Lists the file transfer protocol-enabled servers that are associated with your Amazon Web Services
      # account.

      def list_servers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServersResponse

        input = Types::ListServersRequest.new(max_results: max_results, next_token: next_token)
        list_servers(input)
      end

      def list_servers(input : Types::ListServersRequest) : Types::ListServersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServersResponse, "ListServers")
      end

      # Lists all of the tags associated with the Amazon Resource Name (ARN) that you specify. The resource
      # can be a user, server, or role.

      def list_tags_for_resource(
        arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(arn: arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists the users for a file transfer protocol-enabled server that you specify by passing the ServerId
      # parameter.

      def list_users(
        server_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUsersResponse

        input = Types::ListUsersRequest.new(server_id: server_id, max_results: max_results, next_token: next_token)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Types::ListUsersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsersResponse, "ListUsers")
      end

      # Lists all web apps associated with your Amazon Web Services account for your current region. The
      # response includes the endpoint type for each web app, showing whether it is publicly accessible or
      # VPC hosted. For more information about using VPC endpoints with Transfer Family, see Create a
      # Transfer Family web app in a VPC .

      def list_web_apps(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWebAppsResponse

        input = Types::ListWebAppsRequest.new(max_results: max_results, next_token: next_token)
        list_web_apps(input)
      end

      def list_web_apps(input : Types::ListWebAppsRequest) : Types::ListWebAppsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WEB_APPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWebAppsResponse, "ListWebApps")
      end

      # Lists all workflows associated with your Amazon Web Services account for your current region.

      def list_workflows(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkflowsResponse

        input = Types::ListWorkflowsRequest.new(max_results: max_results, next_token: next_token)
        list_workflows(input)
      end

      def list_workflows(input : Types::ListWorkflowsRequest) : Types::ListWorkflowsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKFLOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkflowsResponse, "ListWorkflows")
      end

      # Sends a callback for asynchronous custom steps. The ExecutionId , WorkflowId , and Token are passed
      # to the target resource during execution of a custom step of a workflow. You must include those with
      # their callback as well as providing a status.

      def send_workflow_step_state(
        execution_id : String,
        status : String,
        token : String,
        workflow_id : String
      ) : Types::SendWorkflowStepStateResponse

        input = Types::SendWorkflowStepStateRequest.new(execution_id: execution_id, status: status, token: token, workflow_id: workflow_id)
        send_workflow_step_state(input)
      end

      def send_workflow_step_state(input : Types::SendWorkflowStepStateRequest) : Types::SendWorkflowStepStateResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_WORKFLOW_STEP_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendWorkflowStepStateResponse, "SendWorkflowStepState")
      end

      # Retrieves a list of the contents of a directory from a remote SFTP server. You specify the connector
      # ID, the output path, and the remote directory path. You can also specify the optional MaxItems value
      # to control the maximum number of items that are listed from the remote directory. This API returns a
      # list of all files and directories in the remote directory (up to the maximum value), but does not
      # return files or folders in sub-directories. That is, it only returns a list of files and directories
      # one-level deep. After you receive the listing file, you can provide the files that you want to
      # transfer to the RetrieveFilePaths parameter of the StartFileTransfer API call. The naming convention
      # for the output file is connector-ID - listing-ID .json . The output file contains the following
      # information: filePath : the complete path of a remote file, relative to the directory of the listing
      # request for your SFTP connector on the remote server. modifiedTimestamp : the last time the file was
      # modified, in UTC time format. This field is optional. If the remote file attributes don't contain a
      # timestamp, it is omitted from the file listing. size : the size of the file, in bytes. This field is
      # optional. If the remote file attributes don't contain a file size, it is omitted from the file
      # listing. path : the complete path of a remote directory, relative to the directory of the listing
      # request for your SFTP connector on the remote server. truncated : a flag indicating whether the list
      # output contains all of the items contained in the remote directory or not. If your Truncated output
      # value is true, you can increase the value provided in the optional max-items input attribute to be
      # able to list more items (up to the maximum allowed list size of 10,000 items).

      def start_directory_listing(
        connector_id : String,
        output_directory_path : String,
        remote_directory_path : String,
        max_items : Int32? = nil
      ) : Types::StartDirectoryListingResponse

        input = Types::StartDirectoryListingRequest.new(connector_id: connector_id, output_directory_path: output_directory_path, remote_directory_path: remote_directory_path, max_items: max_items)
        start_directory_listing(input)
      end

      def start_directory_listing(input : Types::StartDirectoryListingRequest) : Types::StartDirectoryListingResponse
        request = Protocol::JsonRpc.build_request(Model::START_DIRECTORY_LISTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDirectoryListingResponse, "StartDirectoryListing")
      end

      # Begins a file transfer between local Amazon Web Services storage and a remote AS2 or SFTP server.
      # For an AS2 connector, you specify the ConnectorId and one or more SendFilePaths to identify the
      # files you want to transfer. For an SFTP connector, the file transfer can be either outbound or
      # inbound. In both cases, you specify the ConnectorId . Depending on the direction of the transfer,
      # you also specify the following items: If you are transferring file from a partner's SFTP server to
      # Amazon Web Services storage, you specify one or more RetrieveFilePaths to identify the files you
      # want to transfer, and a LocalDirectoryPath to specify the destination folder. If you are
      # transferring file to a partner's SFTP server from Amazon Web Services storage, you specify one or
      # more SendFilePaths to identify the files you want to transfer, and a RemoteDirectoryPath to specify
      # the destination folder.

      def start_file_transfer(
        connector_id : String,
        local_directory_path : String? = nil,
        remote_directory_path : String? = nil,
        retrieve_file_paths : Array(String)? = nil,
        send_file_paths : Array(String)? = nil
      ) : Types::StartFileTransferResponse

        input = Types::StartFileTransferRequest.new(connector_id: connector_id, local_directory_path: local_directory_path, remote_directory_path: remote_directory_path, retrieve_file_paths: retrieve_file_paths, send_file_paths: send_file_paths)
        start_file_transfer(input)
      end

      def start_file_transfer(input : Types::StartFileTransferRequest) : Types::StartFileTransferResponse
        request = Protocol::JsonRpc.build_request(Model::START_FILE_TRANSFER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFileTransferResponse, "StartFileTransfer")
      end

      # Deletes a file or directory on the remote SFTP server.

      def start_remote_delete(
        connector_id : String,
        delete_path : String
      ) : Types::StartRemoteDeleteResponse

        input = Types::StartRemoteDeleteRequest.new(connector_id: connector_id, delete_path: delete_path)
        start_remote_delete(input)
      end

      def start_remote_delete(input : Types::StartRemoteDeleteRequest) : Types::StartRemoteDeleteResponse
        request = Protocol::JsonRpc.build_request(Model::START_REMOTE_DELETE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartRemoteDeleteResponse, "StartRemoteDelete")
      end

      # Moves or renames a file or directory on the remote SFTP server.

      def start_remote_move(
        connector_id : String,
        source_path : String,
        target_path : String
      ) : Types::StartRemoteMoveResponse

        input = Types::StartRemoteMoveRequest.new(connector_id: connector_id, source_path: source_path, target_path: target_path)
        start_remote_move(input)
      end

      def start_remote_move(input : Types::StartRemoteMoveRequest) : Types::StartRemoteMoveResponse
        request = Protocol::JsonRpc.build_request(Model::START_REMOTE_MOVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartRemoteMoveResponse, "StartRemoteMove")
      end

      # Changes the state of a file transfer protocol-enabled server from OFFLINE to ONLINE . It has no
      # impact on a server that is already ONLINE . An ONLINE server can accept and process file transfer
      # jobs. The state of STARTING indicates that the server is in an intermediate state, either not fully
      # able to respond, or not fully online. The values of START_FAILED can indicate an error condition. No
      # response is returned from this call.

      def start_server(
        server_id : String
      ) : Nil

        input = Types::StartServerRequest.new(server_id: server_id)
        start_server(input)
      end

      def start_server(input : Types::StartServerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Changes the state of a file transfer protocol-enabled server from ONLINE to OFFLINE . An OFFLINE
      # server cannot accept and process file transfer jobs. Information tied to your server, such as server
      # and user properties, are not affected by stopping your server. Stopping the server does not reduce
      # or impact your file transfer protocol endpoint billing; you must delete the server to stop being
      # billed. The state of STOPPING indicates that the server is in an intermediate state, either not
      # fully able to respond, or not fully offline. The values of STOP_FAILED can indicate an error
      # condition. No response is returned from this call.

      def stop_server(
        server_id : String
      ) : Nil

        input = Types::StopServerRequest.new(server_id: server_id)
        stop_server(input)
      end

      def stop_server(input : Types::StopServerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Resources
      # are users, servers, roles, and other entities. There is no response returned from this call.

      def tag_resource(
        arn : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::TagResourceRequest.new(arn: arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Tests whether your SFTP connector is set up successfully. We highly recommend that you call this
      # operation to test your ability to transfer files between local Amazon Web Services storage and a
      # trading partner's SFTP server.

      def test_connection(
        connector_id : String
      ) : Types::TestConnectionResponse

        input = Types::TestConnectionRequest.new(connector_id: connector_id)
        test_connection(input)
      end

      def test_connection(input : Types::TestConnectionRequest) : Types::TestConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestConnectionResponse, "TestConnection")
      end

      # If the IdentityProviderType of a file transfer protocol-enabled server is AWS_DIRECTORY_SERVICE or
      # API_Gateway , tests whether your identity provider is set up successfully. We highly recommend that
      # you call this operation to test your authentication method as soon as you create your server. By
      # doing so, you can troubleshoot issues with the identity provider integration to ensure that your
      # users can successfully use the service. The ServerId and UserName parameters are required. The
      # ServerProtocol , SourceIp , and UserPassword are all optional. Note the following: You cannot use
      # TestIdentityProvider if the IdentityProviderType of your server is SERVICE_MANAGED .
      # TestIdentityProvider does not work with keys: it only accepts passwords. TestIdentityProvider can
      # test the password operation for a custom Identity Provider that handles keys and passwords. If you
      # provide any incorrect values for any parameters, the Response field is empty. If you provide a
      # server ID for a server that uses service-managed users, you get an error: An error occurred
      # (InvalidRequestException) when calling the TestIdentityProvider operation: s- server-ID not
      # configured for external auth If you enter a Server ID for the --server-id parameter that does not
      # identify an actual Transfer server, you receive the following error: An error occurred
      # (ResourceNotFoundException) when calling the TestIdentityProvider operation: Unknown server . It is
      # possible your sever is in a different region. You can specify a region by adding the following:
      # --region region-code , such as --region us-east-2 to specify a server in US East (Ohio) .

      def test_identity_provider(
        server_id : String,
        user_name : String,
        server_protocol : String? = nil,
        source_ip : String? = nil,
        user_password : String? = nil
      ) : Types::TestIdentityProviderResponse

        input = Types::TestIdentityProviderRequest.new(server_id: server_id, user_name: user_name, server_protocol: server_protocol, source_ip: source_ip, user_password: user_password)
        test_identity_provider(input)
      end

      def test_identity_provider(input : Types::TestIdentityProviderRequest) : Types::TestIdentityProviderResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_IDENTITY_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestIdentityProviderResponse, "TestIdentityProvider")
      end

      # Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN).
      # Resources are users, servers, roles, and other entities. No response is returned from this call.

      def untag_resource(
        arn : String,
        tag_keys : Array(String)
      ) : Nil

        input = Types::UntagResourceRequest.new(arn: arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Allows you to update parameters for the access specified in the ServerID and ExternalID parameters.

      def update_access(
        external_id : String,
        server_id : String,
        home_directory : String? = nil,
        home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
        home_directory_type : String? = nil,
        policy : String? = nil,
        posix_profile : Types::PosixProfile? = nil,
        role : String? = nil
      ) : Types::UpdateAccessResponse

        input = Types::UpdateAccessRequest.new(external_id: external_id, server_id: server_id, home_directory: home_directory, home_directory_mappings: home_directory_mappings, home_directory_type: home_directory_type, policy: policy, posix_profile: posix_profile, role: role)
        update_access(input)
      end

      def update_access(input : Types::UpdateAccessRequest) : Types::UpdateAccessResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAccessResponse, "UpdateAccess")
      end

      # Updates some of the parameters for an existing agreement. Provide the AgreementId and the ServerId
      # for the agreement that you want to update, along with the new values for the parameters to update.
      # Specify either BaseDirectory or CustomDirectories , but not both. Specifying both causes the command
      # to fail. If you update an agreement from using base directory to custom directories, the base
      # directory is no longer used. Similarly, if you change from custom directories to a base directory,
      # the custom directories are no longer used.

      def update_agreement(
        agreement_id : String,
        server_id : String,
        access_role : String? = nil,
        base_directory : String? = nil,
        custom_directories : Types::CustomDirectoriesType? = nil,
        description : String? = nil,
        enforce_message_signing : String? = nil,
        local_profile_id : String? = nil,
        partner_profile_id : String? = nil,
        preserve_filename : String? = nil,
        status : String? = nil
      ) : Types::UpdateAgreementResponse

        input = Types::UpdateAgreementRequest.new(agreement_id: agreement_id, server_id: server_id, access_role: access_role, base_directory: base_directory, custom_directories: custom_directories, description: description, enforce_message_signing: enforce_message_signing, local_profile_id: local_profile_id, partner_profile_id: partner_profile_id, preserve_filename: preserve_filename, status: status)
        update_agreement(input)
      end

      def update_agreement(input : Types::UpdateAgreementRequest) : Types::UpdateAgreementResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AGREEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAgreementResponse, "UpdateAgreement")
      end

      # Updates the active and inactive dates for a certificate.

      def update_certificate(
        certificate_id : String,
        active_date : Time? = nil,
        description : String? = nil,
        inactive_date : Time? = nil
      ) : Types::UpdateCertificateResponse

        input = Types::UpdateCertificateRequest.new(certificate_id: certificate_id, active_date: active_date, description: description, inactive_date: inactive_date)
        update_certificate(input)
      end

      def update_certificate(input : Types::UpdateCertificateRequest) : Types::UpdateCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCertificateResponse, "UpdateCertificate")
      end

      # Updates some of the parameters for an existing connector. Provide the ConnectorId for the connector
      # that you want to update, along with the new values for the parameters to update.

      def update_connector(
        connector_id : String,
        access_role : String? = nil,
        as2_config : Types::As2ConnectorConfig? = nil,
        egress_config : Types::UpdateConnectorEgressConfig? = nil,
        logging_role : String? = nil,
        security_policy_name : String? = nil,
        sftp_config : Types::SftpConnectorConfig? = nil,
        url : String? = nil
      ) : Types::UpdateConnectorResponse

        input = Types::UpdateConnectorRequest.new(connector_id: connector_id, access_role: access_role, as2_config: as2_config, egress_config: egress_config, logging_role: logging_role, security_policy_name: security_policy_name, sftp_config: sftp_config, url: url)
        update_connector(input)
      end

      def update_connector(input : Types::UpdateConnectorRequest) : Types::UpdateConnectorResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONNECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConnectorResponse, "UpdateConnector")
      end

      # Updates the description for the host key that's specified by the ServerId and HostKeyId parameters.

      def update_host_key(
        description : String,
        host_key_id : String,
        server_id : String
      ) : Types::UpdateHostKeyResponse

        input = Types::UpdateHostKeyRequest.new(description: description, host_key_id: host_key_id, server_id: server_id)
        update_host_key(input)
      end

      def update_host_key(input : Types::UpdateHostKeyRequest) : Types::UpdateHostKeyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HOST_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHostKeyResponse, "UpdateHostKey")
      end

      # Updates some of the parameters for an existing profile. Provide the ProfileId for the profile that
      # you want to update, along with the new values for the parameters to update.

      def update_profile(
        profile_id : String,
        certificate_ids : Array(String)? = nil
      ) : Types::UpdateProfileResponse

        input = Types::UpdateProfileRequest.new(profile_id: profile_id, certificate_ids: certificate_ids)
        update_profile(input)
      end

      def update_profile(input : Types::UpdateProfileRequest) : Types::UpdateProfileResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProfileResponse, "UpdateProfile")
      end

      # Updates the file transfer protocol-enabled server's properties after that server has been created.
      # The UpdateServer call returns the ServerId of the server you updated.

      def update_server(
        server_id : String,
        certificate : String? = nil,
        endpoint_details : Types::EndpointDetails? = nil,
        endpoint_type : String? = nil,
        host_key : String? = nil,
        identity_provider_details : Types::IdentityProviderDetails? = nil,
        identity_provider_type : String? = nil,
        ip_address_type : String? = nil,
        logging_role : String? = nil,
        post_authentication_login_banner : String? = nil,
        pre_authentication_login_banner : String? = nil,
        protocol_details : Types::ProtocolDetails? = nil,
        protocols : Array(String)? = nil,
        s3_storage_options : Types::S3StorageOptions? = nil,
        security_policy_name : String? = nil,
        structured_log_destinations : Array(String)? = nil,
        workflow_details : Types::WorkflowDetails? = nil
      ) : Types::UpdateServerResponse

        input = Types::UpdateServerRequest.new(server_id: server_id, certificate: certificate, endpoint_details: endpoint_details, endpoint_type: endpoint_type, host_key: host_key, identity_provider_details: identity_provider_details, identity_provider_type: identity_provider_type, ip_address_type: ip_address_type, logging_role: logging_role, post_authentication_login_banner: post_authentication_login_banner, pre_authentication_login_banner: pre_authentication_login_banner, protocol_details: protocol_details, protocols: protocols, s3_storage_options: s3_storage_options, security_policy_name: security_policy_name, structured_log_destinations: structured_log_destinations, workflow_details: workflow_details)
        update_server(input)
      end

      def update_server(input : Types::UpdateServerRequest) : Types::UpdateServerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServerResponse, "UpdateServer")
      end

      # Assigns new properties to a user. Parameters you pass modify any or all of the following: the home
      # directory, role, and policy for the UserName and ServerId you specify. The response returns the
      # ServerId and the UserName for the updated user. In the console, you can select Restricted when you
      # create or update a user. This ensures that the user can't access anything outside of their home
      # directory. The programmatic way to configure this behavior is to update the user. Set their
      # HomeDirectoryType to LOGICAL , and specify HomeDirectoryMappings with Entry as root ( / ) and Target
      # as their home directory. For example, if the user's home directory is /test/admin-user , the
      # following command updates the user so that their configuration in the console shows the Restricted
      # flag as selected. aws transfer update-user --server-id &lt;server-id&gt; --user-name admin-user
      # --home-directory-type LOGICAL --home-directory-mappings "[{\"Entry\":\"/\",
      # \"Target\":\"/test/admin-user\"}]"

      def update_user(
        server_id : String,
        user_name : String,
        home_directory : String? = nil,
        home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
        home_directory_type : String? = nil,
        policy : String? = nil,
        posix_profile : Types::PosixProfile? = nil,
        role : String? = nil
      ) : Types::UpdateUserResponse

        input = Types::UpdateUserRequest.new(server_id: server_id, user_name: user_name, home_directory: home_directory, home_directory_mappings: home_directory_mappings, home_directory_type: home_directory_type, policy: policy, posix_profile: posix_profile, role: role)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Types::UpdateUserResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserResponse, "UpdateUser")
      end

      # Assigns new properties to a web app. You can modify the access point, identity provider details,
      # endpoint configuration, and the web app units. For more information about using VPC endpoints with
      # Transfer Family, see Create a Transfer Family web app in a VPC .

      def update_web_app(
        web_app_id : String,
        access_endpoint : String? = nil,
        endpoint_details : Types::UpdateWebAppEndpointDetails? = nil,
        identity_provider_details : Types::UpdateWebAppIdentityProviderDetails? = nil,
        web_app_units : Types::WebAppUnits? = nil
      ) : Types::UpdateWebAppResponse

        input = Types::UpdateWebAppRequest.new(web_app_id: web_app_id, access_endpoint: access_endpoint, endpoint_details: endpoint_details, identity_provider_details: identity_provider_details, web_app_units: web_app_units)
        update_web_app(input)
      end

      def update_web_app(input : Types::UpdateWebAppRequest) : Types::UpdateWebAppResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WEB_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWebAppResponse, "UpdateWebApp")
      end

      # Assigns new customization properties to a web app. You can modify the icon file, logo file, and
      # title.

      def update_web_app_customization(
        web_app_id : String,
        favicon_file : Bytes? = nil,
        logo_file : Bytes? = nil,
        title : String? = nil
      ) : Types::UpdateWebAppCustomizationResponse

        input = Types::UpdateWebAppCustomizationRequest.new(web_app_id: web_app_id, favicon_file: favicon_file, logo_file: logo_file, title: title)
        update_web_app_customization(input)
      end

      def update_web_app_customization(input : Types::UpdateWebAppCustomizationRequest) : Types::UpdateWebAppCustomizationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WEB_APP_CUSTOMIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWebAppCustomizationResponse, "UpdateWebAppCustomization")
      end
    end
  end
end
