module Aws
  module IoT
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

      # Accepts a pending certificate transfer. The default state of the certificate is INACTIVE. To check
      # for pending certificate transfers, call ListCertificates to enumerate your certificates. Requires
      # permission to access the AcceptCertificateTransfer action.

      def accept_certificate_transfer(
        certificate_id : String,
        set_as_active : Bool? = nil
      ) : Protocol::Request
        input = Types::AcceptCertificateTransferRequest.new(certificate_id: certificate_id, set_as_active: set_as_active)
        accept_certificate_transfer(input)
      end

      def accept_certificate_transfer(input : Types::AcceptCertificateTransferRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_CERTIFICATE_TRANSFER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a thing to a billing group. Requires permission to access the AddThingToBillingGroup action.

      def add_thing_to_billing_group(
        billing_group_arn : String? = nil,
        billing_group_name : String? = nil,
        thing_arn : String? = nil,
        thing_name : String? = nil
      ) : Protocol::Request
        input = Types::AddThingToBillingGroupRequest.new(billing_group_arn: billing_group_arn, billing_group_name: billing_group_name, thing_arn: thing_arn, thing_name: thing_name)
        add_thing_to_billing_group(input)
      end

      def add_thing_to_billing_group(input : Types::AddThingToBillingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_THING_TO_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a thing to a thing group. Requires permission to access the AddThingToThingGroup action.

      def add_thing_to_thing_group(
        override_dynamic_groups : Bool? = nil,
        thing_arn : String? = nil,
        thing_group_arn : String? = nil,
        thing_group_name : String? = nil,
        thing_name : String? = nil
      ) : Protocol::Request
        input = Types::AddThingToThingGroupRequest.new(override_dynamic_groups: override_dynamic_groups, thing_arn: thing_arn, thing_group_arn: thing_group_arn, thing_group_name: thing_group_name, thing_name: thing_name)
        add_thing_to_thing_group(input)
      end

      def add_thing_to_thing_group(input : Types::AddThingToThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_THING_TO_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the selected software bill of materials (SBOM) with a specific software package version.
      # Requires permission to access the AssociateSbomWithPackageVersion action.

      def associate_sbom_with_package_version(
        package_name : String,
        sbom : Types::Sbom,
        version_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateSbomWithPackageVersionRequest.new(package_name: package_name, sbom: sbom, version_name: version_name, client_token: client_token)
        associate_sbom_with_package_version(input)
      end

      def associate_sbom_with_package_version(input : Types::AssociateSbomWithPackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SBOM_WITH_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a group with a continuous job. The following criteria must be met: The job must have been
      # created with the targetSelection field set to "CONTINUOUS". The job status must currently be
      # "IN_PROGRESS". The total number of targets associated with a job must not exceed 100. Requires
      # permission to access the AssociateTargetsWithJob action.

      def associate_targets_with_job(
        job_id : String,
        targets : Array(String),
        comment : String? = nil,
        namespace_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateTargetsWithJobRequest.new(job_id: job_id, targets: targets, comment: comment, namespace_id: namespace_id)
        associate_targets_with_job(input)
      end

      def associate_targets_with_job(input : Types::AssociateTargetsWithJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_TARGETS_WITH_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches the specified policy to the specified principal (certificate or other credential). Requires
      # permission to access the AttachPolicy action.

      def attach_policy(
        policy_name : String,
        target : String
      ) : Protocol::Request
        input = Types::AttachPolicyRequest.new(policy_name: policy_name, target: target)
        attach_policy(input)
      end

      def attach_policy(input : Types::AttachPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches the specified policy to the specified principal (certificate or other credential). Note:
      # This action is deprecated and works as expected for backward compatibility, but we won't add
      # enhancements. Use AttachPolicy instead. Requires permission to access the AttachPrincipalPolicy
      # action.

      def attach_principal_policy(
        policy_name : String,
        principal : String
      ) : Protocol::Request
        input = Types::AttachPrincipalPolicyRequest.new(policy_name: policy_name, principal: principal)
        attach_principal_policy(input)
      end

      def attach_principal_policy(input : Types::AttachPrincipalPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_PRINCIPAL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a Device Defender security profile with a thing group or this account. Each thing group
      # or account can have up to five security profiles associated with it. Requires permission to access
      # the AttachSecurityProfile action.

      def attach_security_profile(
        security_profile_name : String,
        security_profile_target_arn : String
      ) : Protocol::Request
        input = Types::AttachSecurityProfileRequest.new(security_profile_name: security_profile_name, security_profile_target_arn: security_profile_target_arn)
        attach_security_profile(input)
      end

      def attach_security_profile(input : Types::AttachSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches the specified principal to the specified thing. A principal can be X.509 certificates,
      # Amazon Cognito identities or federated identities. Requires permission to access the
      # AttachThingPrincipal action.

      def attach_thing_principal(
        principal : String,
        thing_name : String,
        thing_principal_type : String? = nil
      ) : Protocol::Request
        input = Types::AttachThingPrincipalRequest.new(principal: principal, thing_name: thing_name, thing_principal_type: thing_principal_type)
        attach_thing_principal(input)
      end

      def attach_thing_principal(input : Types::AttachThingPrincipalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_THING_PRINCIPAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a mitigation action task that is in progress. If the task is not in progress, an
      # InvalidRequestException occurs. Requires permission to access the CancelAuditMitigationActionsTask
      # action.

      def cancel_audit_mitigation_actions_task(
        task_id : String
      ) : Protocol::Request
        input = Types::CancelAuditMitigationActionsTaskRequest.new(task_id: task_id)
        cancel_audit_mitigation_actions_task(input)
      end

      def cancel_audit_mitigation_actions_task(input : Types::CancelAuditMitigationActionsTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_AUDIT_MITIGATION_ACTIONS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels an audit that is in progress. The audit can be either scheduled or on demand. If the audit
      # isn't in progress, an "InvalidRequestException" occurs. Requires permission to access the
      # CancelAuditTask action.

      def cancel_audit_task(
        task_id : String
      ) : Protocol::Request
        input = Types::CancelAuditTaskRequest.new(task_id: task_id)
        cancel_audit_task(input)
      end

      def cancel_audit_task(input : Types::CancelAuditTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_AUDIT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a pending transfer for the specified certificate. Note Only the transfer source account can
      # use this operation to cancel a transfer. (Transfer destinations can use RejectCertificateTransfer
      # instead.) After transfer, IoT returns the certificate to the source account in the INACTIVE state.
      # After the destination account has accepted the transfer, the transfer cannot be cancelled. After a
      # certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to
      # INACTIVE. Requires permission to access the CancelCertificateTransfer action.

      def cancel_certificate_transfer(
        certificate_id : String
      ) : Protocol::Request
        input = Types::CancelCertificateTransferRequest.new(certificate_id: certificate_id)
        cancel_certificate_transfer(input)
      end

      def cancel_certificate_transfer(input : Types::CancelCertificateTransferRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_CERTIFICATE_TRANSFER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a Device Defender ML Detect mitigation action. Requires permission to access the
      # CancelDetectMitigationActionsTask action.

      def cancel_detect_mitigation_actions_task(
        task_id : String
      ) : Protocol::Request
        input = Types::CancelDetectMitigationActionsTaskRequest.new(task_id: task_id)
        cancel_detect_mitigation_actions_task(input)
      end

      def cancel_detect_mitigation_actions_task(input : Types::CancelDetectMitigationActionsTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_DETECT_MITIGATION_ACTIONS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a job. Requires permission to access the CancelJob action.

      def cancel_job(
        job_id : String,
        comment : String? = nil,
        force : Bool? = nil,
        reason_code : String? = nil
      ) : Protocol::Request
        input = Types::CancelJobRequest.new(job_id: job_id, comment: comment, force: force, reason_code: reason_code)
        cancel_job(input)
      end

      def cancel_job(input : Types::CancelJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the execution of a job for a given thing. Requires permission to access the
      # CancelJobExecution action.

      def cancel_job_execution(
        job_id : String,
        thing_name : String,
        expected_version : Int64? = nil,
        force : Bool? = nil,
        status_details : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CancelJobExecutionRequest.new(job_id: job_id, thing_name: thing_name, expected_version: expected_version, force: force, status_details: status_details)
        cancel_job_execution(input)
      end

      def cancel_job_execution(input : Types::CancelJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Clears the default authorizer. Requires permission to access the ClearDefaultAuthorizer action.

      def clear_default_authorizer : Protocol::Request
        input = Types::ClearDefaultAuthorizerRequest.new
        clear_default_authorizer(input)
      end

      def clear_default_authorizer(input : Types::ClearDefaultAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CLEAR_DEFAULT_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Confirms a topic rule destination. When you create a rule requiring a destination, IoT sends a
      # confirmation message to the endpoint or base address you specify. The message includes a token which
      # you pass back when calling ConfirmTopicRuleDestination to confirm that you own or have access to the
      # endpoint. Requires permission to access the ConfirmTopicRuleDestination action.

      def confirm_topic_rule_destination(
        confirmation_token : String
      ) : Protocol::Request
        input = Types::ConfirmTopicRuleDestinationRequest.new(confirmation_token: confirmation_token)
        confirm_topic_rule_destination(input)
      end

      def confirm_topic_rule_destination(input : Types::ConfirmTopicRuleDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONFIRM_TOPIC_RULE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Device Defender audit suppression. Requires permission to access the
      # CreateAuditSuppression action.

      def create_audit_suppression(
        check_name : String,
        client_request_token : String,
        resource_identifier : Types::ResourceIdentifier,
        description : String? = nil,
        expiration_date : Time? = nil,
        suppress_indefinitely : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateAuditSuppressionRequest.new(check_name: check_name, client_request_token: client_request_token, resource_identifier: resource_identifier, description: description, expiration_date: expiration_date, suppress_indefinitely: suppress_indefinitely)
        create_audit_suppression(input)
      end

      def create_audit_suppression(input : Types::CreateAuditSuppressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUDIT_SUPPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an authorizer. Requires permission to access the CreateAuthorizer action.

      def create_authorizer(
        authorizer_function_arn : String,
        authorizer_name : String,
        enable_caching_for_http : Bool? = nil,
        signing_disabled : Bool? = nil,
        status : String? = nil,
        tags : Array(Types::Tag)? = nil,
        token_key_name : String? = nil,
        token_signing_public_keys : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAuthorizerRequest.new(authorizer_function_arn: authorizer_function_arn, authorizer_name: authorizer_name, enable_caching_for_http: enable_caching_for_http, signing_disabled: signing_disabled, status: status, tags: tags, token_key_name: token_key_name, token_signing_public_keys: token_signing_public_keys)
        create_authorizer(input)
      end

      def create_authorizer(input : Types::CreateAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a billing group. If this call is made multiple times using the same billing group name and
      # configuration, the call will succeed. If this call is made with the same billing group name but
      # different configuration a ResourceAlreadyExistsException is thrown. Requires permission to access
      # the CreateBillingGroup action.

      def create_billing_group(
        billing_group_name : String,
        billing_group_properties : Types::BillingGroupProperties? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateBillingGroupRequest.new(billing_group_name: billing_group_name, billing_group_properties: billing_group_properties, tags: tags)
        create_billing_group(input)
      end

      def create_billing_group(input : Types::CreateBillingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an X.509 certificate using the specified certificate signing request. Requires permission to
      # access the CreateCertificateFromCsr action. The CSR must include a public key that is either an RSA
      # key with a length of at least 2048 bits or an ECC key from NIST P-256, NIST P-384, or NIST P-521
      # curves. For supported certificates, consult Certificate signing algorithms supported by IoT .
      # Reusing the same certificate signing request (CSR) results in a distinct certificate. You can create
      # multiple certificates in a batch by creating a directory, copying multiple .csr files into that
      # directory, and then specifying that directory on the command line. The following commands show how
      # to create a batch of certificates given a batch of CSRs. In the following commands, we assume that a
      # set of CSRs are located inside of the directory my-csr-directory: On Linux and OS X, the command is:
      # $ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr
      # --certificate-signing-request file://my-csr-directory/{} This command lists all of the CSRs in
      # my-csr-directory and pipes each CSR file name to the aws iot create-certificate-from-csr Amazon Web
      # Services CLI command to create a certificate for the corresponding CSR. You can also run the aws iot
      # create-certificate-from-csr part of the command in parallel to speed up the certificate creation
      # process: $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr
      # --certificate-signing-request file://my-csr-directory/{} On Windows PowerShell, the command to
      # create certificates for all CSRs in my-csr-directory is: &gt; ls -Name my-csr-directory | %{aws iot
      # create-certificate-from-csr --certificate-signing-request file://my-csr-directory/$_} On a Windows
      # command prompt, the command to create certificates for all CSRs in my-csr-directory is: &gt;
      # forfiles /p my-csr-directory /c "cmd /c aws iot create-certificate-from-csr
      # --certificate-signing-request file://@path"

      def create_certificate_from_csr(
        certificate_signing_request : String,
        set_as_active : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateCertificateFromCsrRequest.new(certificate_signing_request: certificate_signing_request, set_as_active: set_as_active)
        create_certificate_from_csr(input)
      end

      def create_certificate_from_csr(input : Types::CreateCertificateFromCsrRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CERTIFICATE_FROM_CSR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services IoT Core certificate provider. You can use Amazon Web Services IoT
      # Core certificate provider to customize how to sign a certificate signing request (CSR) in IoT fleet
      # provisioning. For more information, see Customizing certificate signing using Amazon Web Services
      # IoT Core certificate provider from Amazon Web Services IoT Core Developer Guide . Requires
      # permission to access the CreateCertificateProvider action. After you create a certificate provider,
      # the behavior of CreateCertificateFromCsr API for fleet provisioning will change and all API calls to
      # CreateCertificateFromCsr will invoke the certificate provider to create the certificates. It can
      # take up to a few minutes for this behavior to change after a certificate provider is created.

      def create_certificate_provider(
        account_default_for_operations : Array(String),
        certificate_provider_name : String,
        lambda_function_arn : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCertificateProviderRequest.new(account_default_for_operations: account_default_for_operations, certificate_provider_name: certificate_provider_name, lambda_function_arn: lambda_function_arn, client_token: client_token, tags: tags)
        create_certificate_provider(input)
      end

      def create_certificate_provider(input : Types::CreateCertificateProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CERTIFICATE_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a command. A command contains reusable configurations that can be applied before they are
      # sent to the devices.

      def create_command(
        command_id : String,
        description : String? = nil,
        display_name : String? = nil,
        mandatory_parameters : Array(Types::CommandParameter)? = nil,
        namespace : String? = nil,
        payload : Types::CommandPayload? = nil,
        payload_template : String? = nil,
        preprocessor : Types::CommandPreprocessor? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCommandRequest.new(command_id: command_id, description: description, display_name: display_name, mandatory_parameters: mandatory_parameters, namespace: namespace, payload: payload, payload_template: payload_template, preprocessor: preprocessor, role_arn: role_arn, tags: tags)
        create_command(input)
      end

      def create_command(input : Types::CreateCommandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMMAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this API to define a Custom Metric published by your devices to Device Defender. Requires
      # permission to access the CreateCustomMetric action.

      def create_custom_metric(
        client_request_token : String,
        metric_name : String,
        metric_type : String,
        display_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomMetricRequest.new(client_request_token: client_request_token, metric_name: metric_name, metric_type: metric_type, display_name: display_name, tags: tags)
        create_custom_metric(input)
      end

      def create_custom_metric(input : Types::CreateCustomMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a dimension that you can use to limit the scope of a metric used in a security profile for
      # IoT Device Defender. For example, using a TOPIC_FILTER dimension, you can narrow down the scope of
      # the metric only to MQTT topics whose name match the pattern specified in the dimension. Requires
      # permission to access the CreateDimension action.

      def create_dimension(
        client_request_token : String,
        name : String,
        string_values : Array(String),
        type : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDimensionRequest.new(client_request_token: client_request_token, name: name, string_values: string_values, type: type, tags: tags)
        create_dimension(input)
      end

      def create_dimension(input : Types::CreateDimensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DIMENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a domain configuration. Requires permission to access the CreateDomainConfiguration action.

      def create_domain_configuration(
        domain_configuration_name : String,
        application_protocol : String? = nil,
        authentication_type : String? = nil,
        authorizer_config : Types::AuthorizerConfig? = nil,
        client_certificate_config : Types::ClientCertificateConfig? = nil,
        domain_name : String? = nil,
        server_certificate_arns : Array(String)? = nil,
        server_certificate_config : Types::ServerCertificateConfig? = nil,
        service_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tls_config : Types::TlsConfig? = nil,
        validation_certificate_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateDomainConfigurationRequest.new(domain_configuration_name: domain_configuration_name, application_protocol: application_protocol, authentication_type: authentication_type, authorizer_config: authorizer_config, client_certificate_config: client_certificate_config, domain_name: domain_name, server_certificate_arns: server_certificate_arns, server_certificate_config: server_certificate_config, service_type: service_type, tags: tags, tls_config: tls_config, validation_certificate_arn: validation_certificate_arn)
        create_domain_configuration(input)
      end

      def create_domain_configuration(input : Types::CreateDomainConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a dynamic thing group. Requires permission to access the CreateDynamicThingGroup action.

      def create_dynamic_thing_group(
        query_string : String,
        thing_group_name : String,
        index_name : String? = nil,
        query_version : String? = nil,
        tags : Array(Types::Tag)? = nil,
        thing_group_properties : Types::ThingGroupProperties? = nil
      ) : Protocol::Request
        input = Types::CreateDynamicThingGroupRequest.new(query_string: query_string, thing_group_name: thing_group_name, index_name: index_name, query_version: query_version, tags: tags, thing_group_properties: thing_group_properties)
        create_dynamic_thing_group(input)
      end

      def create_dynamic_thing_group(input : Types::CreateDynamicThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DYNAMIC_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a fleet metric. Requires permission to access the CreateFleetMetric action.

      def create_fleet_metric(
        aggregation_field : String,
        aggregation_type : Types::AggregationType,
        metric_name : String,
        period : Int32,
        query_string : String,
        description : String? = nil,
        index_name : String? = nil,
        query_version : String? = nil,
        tags : Array(Types::Tag)? = nil,
        unit : String? = nil
      ) : Protocol::Request
        input = Types::CreateFleetMetricRequest.new(aggregation_field: aggregation_field, aggregation_type: aggregation_type, metric_name: metric_name, period: period, query_string: query_string, description: description, index_name: index_name, query_version: query_version, tags: tags, unit: unit)
        create_fleet_metric(input)
      end

      def create_fleet_metric(input : Types::CreateFleetMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FLEET_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a job. Requires permission to access the CreateJob action.

      def create_job(
        job_id : String,
        targets : Array(String),
        abort_config : Types::AbortConfig? = nil,
        description : String? = nil,
        destination_package_versions : Array(String)? = nil,
        document : String? = nil,
        document_parameters : Hash(String, String)? = nil,
        document_source : String? = nil,
        job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
        job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
        job_template_arn : String? = nil,
        namespace_id : String? = nil,
        presigned_url_config : Types::PresignedUrlConfig? = nil,
        scheduling_config : Types::SchedulingConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        target_selection : String? = nil,
        timeout_config : Types::TimeoutConfig? = nil
      ) : Protocol::Request
        input = Types::CreateJobRequest.new(job_id: job_id, targets: targets, abort_config: abort_config, description: description, destination_package_versions: destination_package_versions, document: document, document_parameters: document_parameters, document_source: document_source, job_executions_retry_config: job_executions_retry_config, job_executions_rollout_config: job_executions_rollout_config, job_template_arn: job_template_arn, namespace_id: namespace_id, presigned_url_config: presigned_url_config, scheduling_config: scheduling_config, tags: tags, target_selection: target_selection, timeout_config: timeout_config)
        create_job(input)
      end

      def create_job(input : Types::CreateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a job template. Requires permission to access the CreateJobTemplate action.

      def create_job_template(
        description : String,
        job_template_id : String,
        abort_config : Types::AbortConfig? = nil,
        destination_package_versions : Array(String)? = nil,
        document : String? = nil,
        document_source : String? = nil,
        job_arn : String? = nil,
        job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
        job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
        maintenance_windows : Array(Types::MaintenanceWindow)? = nil,
        presigned_url_config : Types::PresignedUrlConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        timeout_config : Types::TimeoutConfig? = nil
      ) : Protocol::Request
        input = Types::CreateJobTemplateRequest.new(description: description, job_template_id: job_template_id, abort_config: abort_config, destination_package_versions: destination_package_versions, document: document, document_source: document_source, job_arn: job_arn, job_executions_retry_config: job_executions_retry_config, job_executions_rollout_config: job_executions_rollout_config, maintenance_windows: maintenance_windows, presigned_url_config: presigned_url_config, tags: tags, timeout_config: timeout_config)
        create_job_template(input)
      end

      def create_job_template(input : Types::CreateJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a 2048-bit RSA key pair and issues an X.509 certificate using the issued public key. You can
      # also call CreateKeysAndCertificate over MQTT from a device, for more information, see Provisioning
      # MQTT API . Note This is the only time IoT issues the private key for this certificate, so it is
      # important to keep it in a secure location. Requires permission to access the
      # CreateKeysAndCertificate action.

      def create_keys_and_certificate(
        set_as_active : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateKeysAndCertificateRequest.new(set_as_active: set_as_active)
        create_keys_and_certificate(input)
      end

      def create_keys_and_certificate(input : Types::CreateKeysAndCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KEYS_AND_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines an action that can be applied to audit findings by using StartAuditMitigationActionsTask.
      # Only certain types of mitigation actions can be applied to specific check names. For more
      # information, see Mitigation actions . Each mitigation action can apply only one type of change.
      # Requires permission to access the CreateMitigationAction action.

      def create_mitigation_action(
        action_name : String,
        action_params : Types::MitigationActionParams,
        role_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMitigationActionRequest.new(action_name: action_name, action_params: action_params, role_arn: role_arn, tags: tags)
        create_mitigation_action(input)
      end

      def create_mitigation_action(input : Types::CreateMitigationActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MITIGATION_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IoT OTA update on a target group of things or groups. Requires permission to access the
      # CreateOTAUpdate action.

      def create_ota_update(
        files : Array(Types::OTAUpdateFile),
        ota_update_id : String,
        role_arn : String,
        targets : Array(String),
        additional_parameters : Hash(String, String)? = nil,
        aws_job_abort_config : Types::AwsJobAbortConfig? = nil,
        aws_job_executions_rollout_config : Types::AwsJobExecutionsRolloutConfig? = nil,
        aws_job_presigned_url_config : Types::AwsJobPresignedUrlConfig? = nil,
        aws_job_timeout_config : Types::AwsJobTimeoutConfig? = nil,
        description : String? = nil,
        protocols : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        target_selection : String? = nil
      ) : Protocol::Request
        input = Types::CreateOTAUpdateRequest.new(files: files, ota_update_id: ota_update_id, role_arn: role_arn, targets: targets, additional_parameters: additional_parameters, aws_job_abort_config: aws_job_abort_config, aws_job_executions_rollout_config: aws_job_executions_rollout_config, aws_job_presigned_url_config: aws_job_presigned_url_config, aws_job_timeout_config: aws_job_timeout_config, description: description, protocols: protocols, tags: tags, target_selection: target_selection)
        create_ota_update(input)
      end

      def create_ota_update(input : Types::CreateOTAUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OTA_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IoT software package that can be deployed to your fleet. Requires permission to access
      # the CreatePackage and GetIndexingConfiguration actions.

      def create_package(
        package_name : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePackageRequest.new(package_name: package_name, client_token: client_token, description: description, tags: tags)
        create_package(input)
      end

      def create_package(input : Types::CreatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version for an existing IoT software package. Requires permission to access the
      # CreatePackageVersion and GetIndexingConfiguration actions.

      def create_package_version(
        package_name : String,
        version_name : String,
        artifact : Types::PackageVersionArtifact? = nil,
        attributes : Hash(String, String)? = nil,
        client_token : String? = nil,
        description : String? = nil,
        recipe : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePackageVersionRequest.new(package_name: package_name, version_name: version_name, artifact: artifact, attributes: attributes, client_token: client_token, description: description, recipe: recipe, tags: tags)
        create_package_version(input)
      end

      def create_package_version(input : Types::CreatePackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IoT policy. The created policy is the default version for the policy. This operation
      # creates a policy version with a version identifier of 1 and sets 1 as the policy's default version.
      # Requires permission to access the CreatePolicy action.

      def create_policy(
        policy_document : String,
        policy_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreatePolicyRequest.new(policy_document: policy_document, policy_name: policy_name, tags: tags)
        create_policy(input)
      end

      def create_policy(input : Types::CreatePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of the specified IoT policy. To update a policy, create a new policy version.
      # A managed policy can have up to five versions. If the policy has five versions, you must use
      # DeletePolicyVersion to delete an existing version before you create a new one. Optionally, you can
      # set the new version as the policy's default version. The default version is the operative version
      # (that is, the version that is in effect for the certificates to which the policy is attached).
      # Requires permission to access the CreatePolicyVersion action.

      def create_policy_version(
        policy_document : String,
        policy_name : String,
        set_as_default : Bool? = nil
      ) : Protocol::Request
        input = Types::CreatePolicyVersionRequest.new(policy_document: policy_document, policy_name: policy_name, set_as_default: set_as_default)
        create_policy_version(input)
      end

      def create_policy_version(input : Types::CreatePolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a provisioning claim. Requires permission to access the CreateProvisioningClaim action.

      def create_provisioning_claim(
        template_name : String
      ) : Protocol::Request
        input = Types::CreateProvisioningClaimRequest.new(template_name: template_name)
        create_provisioning_claim(input)
      end

      def create_provisioning_claim(input : Types::CreateProvisioningClaimRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROVISIONING_CLAIM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a provisioning template. Requires permission to access the CreateProvisioningTemplate
      # action.

      def create_provisioning_template(
        provisioning_role_arn : String,
        template_body : String,
        template_name : String,
        description : String? = nil,
        enabled : Bool? = nil,
        pre_provisioning_hook : Types::ProvisioningHook? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::CreateProvisioningTemplateRequest.new(provisioning_role_arn: provisioning_role_arn, template_body: template_body, template_name: template_name, description: description, enabled: enabled, pre_provisioning_hook: pre_provisioning_hook, tags: tags, type: type)
        create_provisioning_template(input)
      end

      def create_provisioning_template(input : Types::CreateProvisioningTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROVISIONING_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new version of a provisioning template. Requires permission to access the
      # CreateProvisioningTemplateVersion action.

      def create_provisioning_template_version(
        template_body : String,
        template_name : String,
        set_as_default : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateProvisioningTemplateVersionRequest.new(template_body: template_body, template_name: template_name, set_as_default: set_as_default)
        create_provisioning_template_version(input)
      end

      def create_provisioning_template_version(input : Types::CreateProvisioningTemplateVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROVISIONING_TEMPLATE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a role alias. Requires permission to access the CreateRoleAlias action. The value of
      # credentialDurationSeconds must be less than or equal to the maximum session duration of the IAM role
      # that the role alias references. For more information, see Modifying a role maximum session duration
      # (Amazon Web Services API) from the Amazon Web Services Identity and Access Management User Guide.

      def create_role_alias(
        role_alias : String,
        role_arn : String,
        credential_duration_seconds : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateRoleAliasRequest.new(role_alias: role_alias, role_arn: role_arn, credential_duration_seconds: credential_duration_seconds, tags: tags)
        create_role_alias(input)
      end

      def create_role_alias(input : Types::CreateRoleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROLE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a scheduled audit that is run at a specified time interval. Requires permission to access
      # the CreateScheduledAudit action.

      def create_scheduled_audit(
        frequency : String,
        scheduled_audit_name : String,
        target_check_names : Array(String),
        day_of_month : String? = nil,
        day_of_week : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateScheduledAuditRequest.new(frequency: frequency, scheduled_audit_name: scheduled_audit_name, target_check_names: target_check_names, day_of_month: day_of_month, day_of_week: day_of_week, tags: tags)
        create_scheduled_audit(input)
      end

      def create_scheduled_audit(input : Types::CreateScheduledAuditRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEDULED_AUDIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Device Defender security profile. Requires permission to access the CreateSecurityProfile
      # action.

      def create_security_profile(
        security_profile_name : String,
        additional_metrics_to_retain : Array(String)? = nil,
        additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)? = nil,
        alert_targets : Hash(String, Types::AlertTarget)? = nil,
        behaviors : Array(Types::Behavior)? = nil,
        metrics_export_config : Types::MetricsExportConfig? = nil,
        security_profile_description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSecurityProfileRequest.new(security_profile_name: security_profile_name, additional_metrics_to_retain: additional_metrics_to_retain, additional_metrics_to_retain_v2: additional_metrics_to_retain_v2, alert_targets: alert_targets, behaviors: behaviors, metrics_export_config: metrics_export_config, security_profile_description: security_profile_description, tags: tags)
        create_security_profile(input)
      end

      def create_security_profile(input : Types::CreateSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a stream for delivering one or more large files in chunks over MQTT. A stream transports
      # data bytes in chunks or blocks packaged as MQTT messages from a source like S3. You can have one or
      # more files associated with a stream. Requires permission to access the CreateStream action.

      def create_stream(
        files : Array(Types::StreamFile),
        role_arn : String,
        stream_id : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateStreamRequest.new(files: files, role_arn: role_arn, stream_id: stream_id, description: description, tags: tags)
        create_stream(input)
      end

      def create_stream(input : Types::CreateStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a thing record in the registry. If this call is made multiple times using the same thing
      # name and configuration, the call will succeed. If this call is made with the same thing name but
      # different configuration a ResourceAlreadyExistsException is thrown. This is a control plane
      # operation. See Authorization for information about authorizing control plane actions. Requires
      # permission to access the CreateThing action.

      def create_thing(
        thing_name : String,
        attribute_payload : Types::AttributePayload? = nil,
        billing_group_name : String? = nil,
        thing_type_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateThingRequest.new(thing_name: thing_name, attribute_payload: attribute_payload, billing_group_name: billing_group_name, thing_type_name: thing_type_name)
        create_thing(input)
      end

      def create_thing(input : Types::CreateThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a thing group. This is a control plane operation. See Authorization for information about
      # authorizing control plane actions. If the ThingGroup that you create has the exact same attributes
      # as an existing ThingGroup , you will get a 200 success response. Requires permission to access the
      # CreateThingGroup action.

      def create_thing_group(
        thing_group_name : String,
        parent_group_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        thing_group_properties : Types::ThingGroupProperties? = nil
      ) : Protocol::Request
        input = Types::CreateThingGroupRequest.new(thing_group_name: thing_group_name, parent_group_name: parent_group_name, tags: tags, thing_group_properties: thing_group_properties)
        create_thing_group(input)
      end

      def create_thing_group(input : Types::CreateThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new thing type. If this call is made multiple times using the same thing type name and
      # configuration, the call will succeed. If this call is made with the same thing type name but
      # different configuration a ResourceAlreadyExistsException is thrown. Requires permission to access
      # the CreateThingType action.

      def create_thing_type(
        thing_type_name : String,
        tags : Array(Types::Tag)? = nil,
        thing_type_properties : Types::ThingTypeProperties? = nil
      ) : Protocol::Request
        input = Types::CreateThingTypeRequest.new(thing_type_name: thing_type_name, tags: tags, thing_type_properties: thing_type_properties)
        create_thing_type(input)
      end

      def create_thing_type(input : Types::CreateThingTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THING_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a rule. Creating rules is an administrator-level action. Any user who has permission to
      # create rules will be able to access data processed by the rule. Requires permission to access the
      # CreateTopicRule action.

      def create_topic_rule(
        rule_name : String,
        topic_rule_payload : Types::TopicRulePayload,
        tags : String? = nil
      ) : Protocol::Request
        input = Types::CreateTopicRuleRequest.new(rule_name: rule_name, topic_rule_payload: topic_rule_payload, tags: tags)
        create_topic_rule(input)
      end

      def create_topic_rule(input : Types::CreateTopicRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TOPIC_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a topic rule destination. The destination must be confirmed prior to use. Requires
      # permission to access the CreateTopicRuleDestination action.

      def create_topic_rule_destination(
        destination_configuration : Types::TopicRuleDestinationConfiguration
      ) : Protocol::Request
        input = Types::CreateTopicRuleDestinationRequest.new(destination_configuration: destination_configuration)
        create_topic_rule_destination(input)
      end

      def create_topic_rule_destination(input : Types::CreateTopicRuleDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TOPIC_RULE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restores the default settings for Device Defender audits for this account. Any configuration data
      # you entered is deleted and all audit checks are reset to disabled. Requires permission to access the
      # DeleteAccountAuditConfiguration action.

      def delete_account_audit_configuration(
        delete_scheduled_audits : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAccountAuditConfigurationRequest.new(delete_scheduled_audits: delete_scheduled_audits)
        delete_account_audit_configuration(input)
      end

      def delete_account_audit_configuration(input : Types::DeleteAccountAuditConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT_AUDIT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Device Defender audit suppression. Requires permission to access the
      # DeleteAuditSuppression action.

      def delete_audit_suppression(
        check_name : String,
        resource_identifier : Types::ResourceIdentifier
      ) : Protocol::Request
        input = Types::DeleteAuditSuppressionRequest.new(check_name: check_name, resource_identifier: resource_identifier)
        delete_audit_suppression(input)
      end

      def delete_audit_suppression(input : Types::DeleteAuditSuppressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUDIT_SUPPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an authorizer. Requires permission to access the DeleteAuthorizer action.

      def delete_authorizer(
        authorizer_name : String
      ) : Protocol::Request
        input = Types::DeleteAuthorizerRequest.new(authorizer_name: authorizer_name)
        delete_authorizer(input)
      end

      def delete_authorizer(input : Types::DeleteAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the billing group. Requires permission to access the DeleteBillingGroup action.

      def delete_billing_group(
        billing_group_name : String,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteBillingGroupRequest.new(billing_group_name: billing_group_name, expected_version: expected_version)
        delete_billing_group(input)
      end

      def delete_billing_group(input : Types::DeleteBillingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a registered CA certificate. Requires permission to access the DeleteCACertificate action.

      def delete_ca_certificate(
        certificate_id : String
      ) : Protocol::Request
        input = Types::DeleteCACertificateRequest.new(certificate_id: certificate_id)
        delete_ca_certificate(input)
      end

      def delete_ca_certificate(input : Types::DeleteCACertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CA_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified certificate. A certificate cannot be deleted if it has a policy or IoT thing
      # attached to it or if its status is set to ACTIVE. To delete a certificate, first use the
      # DetachPolicy action to detach all policies. Next, use the UpdateCertificate action to set the
      # certificate to the INACTIVE status. Requires permission to access the DeleteCertificate action.

      def delete_certificate(
        certificate_id : String,
        force_delete : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteCertificateRequest.new(certificate_id: certificate_id, force_delete: force_delete)
        delete_certificate(input)
      end

      def delete_certificate(input : Types::DeleteCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a certificate provider. Requires permission to access the DeleteCertificateProvider action.
      # If you delete the certificate provider resource, the behavior of CreateCertificateFromCsr will
      # resume, and IoT will create certificates signed by IoT from a certificate signing request (CSR).

      def delete_certificate_provider(
        certificate_provider_name : String
      ) : Protocol::Request
        input = Types::DeleteCertificateProviderRequest.new(certificate_provider_name: certificate_provider_name)
        delete_certificate_provider(input)
      end

      def delete_certificate_provider(input : Types::DeleteCertificateProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CERTIFICATE_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a command resource.

      def delete_command(
        command_id : String
      ) : Protocol::Request
        input = Types::DeleteCommandRequest.new(command_id: command_id)
        delete_command(input)
      end

      def delete_command(input : Types::DeleteCommandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMMAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a command execution. Only command executions that enter a terminal state can be deleted from
      # your account.

      def delete_command_execution(
        execution_id : String,
        target_arn : String
      ) : Protocol::Request
        input = Types::DeleteCommandExecutionRequest.new(execution_id: execution_id, target_arn: target_arn)
        delete_command_execution(input)
      end

      def delete_command_execution(input : Types::DeleteCommandExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMMAND_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Device Defender detect custom metric. Requires permission to access the DeleteCustomMetric
      # action. Before you can delete a custom metric, you must first remove the custom metric from all
      # security profiles it's a part of. The security profile associated with the custom metric can be
      # found using the ListSecurityProfiles API with metricName set to your custom metric name.

      def delete_custom_metric(
        metric_name : String
      ) : Protocol::Request
        input = Types::DeleteCustomMetricRequest.new(metric_name: metric_name)
        delete_custom_metric(input)
      end

      def delete_custom_metric(input : Types::DeleteCustomMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified dimension from your Amazon Web Services accounts. Requires permission to
      # access the DeleteDimension action.

      def delete_dimension(
        name : String
      ) : Protocol::Request
        input = Types::DeleteDimensionRequest.new(name: name)
        delete_dimension(input)
      end

      def delete_dimension(input : Types::DeleteDimensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DIMENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified domain configuration. Requires permission to access the
      # DeleteDomainConfiguration action.

      def delete_domain_configuration(
        domain_configuration_name : String
      ) : Protocol::Request
        input = Types::DeleteDomainConfigurationRequest.new(domain_configuration_name: domain_configuration_name)
        delete_domain_configuration(input)
      end

      def delete_domain_configuration(input : Types::DeleteDomainConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a dynamic thing group. Requires permission to access the DeleteDynamicThingGroup action.

      def delete_dynamic_thing_group(
        thing_group_name : String,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteDynamicThingGroupRequest.new(thing_group_name: thing_group_name, expected_version: expected_version)
        delete_dynamic_thing_group(input)
      end

      def delete_dynamic_thing_group(input : Types::DeleteDynamicThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DYNAMIC_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified fleet metric. Returns successfully with no error if the deletion is successful
      # or you specify a fleet metric that doesn't exist. Requires permission to access the
      # DeleteFleetMetric action.

      def delete_fleet_metric(
        metric_name : String,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteFleetMetricRequest.new(metric_name: metric_name, expected_version: expected_version)
        delete_fleet_metric(input)
      end

      def delete_fleet_metric(input : Types::DeleteFleetMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FLEET_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a job and its related job executions. Deleting a job may take time, depending on the number
      # of job executions created for the job and various other factors. While the job is being deleted, the
      # status of the job will be shown as "DELETION_IN_PROGRESS". Attempting to delete or cancel a job
      # whose status is already "DELETION_IN_PROGRESS" will result in an error. Only 10 jobs may have status
      # "DELETION_IN_PROGRESS" at the same time, or a LimitExceededException will occur. Requires permission
      # to access the DeleteJob action.

      def delete_job(
        job_id : String,
        force : Bool? = nil,
        namespace_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteJobRequest.new(job_id: job_id, force: force, namespace_id: namespace_id)
        delete_job(input)
      end

      def delete_job(input : Types::DeleteJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a job execution. Requires permission to access the DeleteJobExecution action.

      def delete_job_execution(
        execution_number : Int64,
        job_id : String,
        thing_name : String,
        force : Bool? = nil,
        namespace_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteJobExecutionRequest.new(execution_number: execution_number, job_id: job_id, thing_name: thing_name, force: force, namespace_id: namespace_id)
        delete_job_execution(input)
      end

      def delete_job_execution(input : Types::DeleteJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified job template.

      def delete_job_template(
        job_template_id : String
      ) : Protocol::Request
        input = Types::DeleteJobTemplateRequest.new(job_template_id: job_template_id)
        delete_job_template(input)
      end

      def delete_job_template(input : Types::DeleteJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a defined mitigation action from your Amazon Web Services accounts. Requires permission to
      # access the DeleteMitigationAction action.

      def delete_mitigation_action(
        action_name : String
      ) : Protocol::Request
        input = Types::DeleteMitigationActionRequest.new(action_name: action_name)
        delete_mitigation_action(input)
      end

      def delete_mitigation_action(input : Types::DeleteMitigationActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MITIGATION_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an OTA update. Requires permission to access the DeleteOTAUpdate action.

      def delete_ota_update(
        ota_update_id : String,
        delete_stream : Bool? = nil,
        force_delete_aws_job : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteOTAUpdateRequest.new(ota_update_id: ota_update_id, delete_stream: delete_stream, force_delete_aws_job: force_delete_aws_job)
        delete_ota_update(input)
      end

      def delete_ota_update(input : Types::DeleteOTAUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OTA_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific version from a software package. Note: All package versions must be deleted
      # before deleting the software package. Requires permission to access the DeletePackageVersion action.

      def delete_package(
        package_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeletePackageRequest.new(package_name: package_name, client_token: client_token)
        delete_package(input)
      end

      def delete_package(input : Types::DeletePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific version from a software package. Note: If a package version is designated as
      # default, you must remove the designation from the software package using the UpdatePackage action.

      def delete_package_version(
        package_name : String,
        version_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeletePackageVersionRequest.new(package_name: package_name, version_name: version_name, client_token: client_token)
        delete_package_version(input)
      end

      def delete_package_version(input : Types::DeletePackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified policy. A policy cannot be deleted if it has non-default versions or it is
      # attached to any certificate. To delete a policy, use the DeletePolicyVersion action to delete all
      # non-default versions of the policy; use the DetachPolicy action to detach the policy from any
      # certificate; and then use the DeletePolicy action to delete the policy. When a policy is deleted
      # using DeletePolicy, its default version is deleted with it. Because of the distributed nature of
      # Amazon Web Services, it can take up to five minutes after a policy is detached before it's ready to
      # be deleted. Requires permission to access the DeletePolicy action.

      def delete_policy(
        policy_name : String
      ) : Protocol::Request
        input = Types::DeletePolicyRequest.new(policy_name: policy_name)
        delete_policy(input)
      end

      def delete_policy(input : Types::DeletePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified version of the specified policy. You cannot delete the default version of a
      # policy using this action. To delete the default version of a policy, use DeletePolicy . To find out
      # which version of a policy is marked as the default version, use ListPolicyVersions. Requires
      # permission to access the DeletePolicyVersion action.

      def delete_policy_version(
        policy_name : String,
        policy_version_id : String
      ) : Protocol::Request
        input = Types::DeletePolicyVersionRequest.new(policy_name: policy_name, policy_version_id: policy_version_id)
        delete_policy_version(input)
      end

      def delete_policy_version(input : Types::DeletePolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a provisioning template. Requires permission to access the DeleteProvisioningTemplate
      # action.

      def delete_provisioning_template(
        template_name : String
      ) : Protocol::Request
        input = Types::DeleteProvisioningTemplateRequest.new(template_name: template_name)
        delete_provisioning_template(input)
      end

      def delete_provisioning_template(input : Types::DeleteProvisioningTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROVISIONING_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a provisioning template version. Requires permission to access the
      # DeleteProvisioningTemplateVersion action.

      def delete_provisioning_template_version(
        template_name : String,
        version_id : Int32
      ) : Protocol::Request
        input = Types::DeleteProvisioningTemplateVersionRequest.new(template_name: template_name, version_id: version_id)
        delete_provisioning_template_version(input)
      end

      def delete_provisioning_template_version(input : Types::DeleteProvisioningTemplateVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROVISIONING_TEMPLATE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a CA certificate registration code. Requires permission to access the DeleteRegistrationCode
      # action.

      def delete_registration_code : Protocol::Request
        input = Types::DeleteRegistrationCodeRequest.new
        delete_registration_code(input)
      end

      def delete_registration_code(input : Types::DeleteRegistrationCodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REGISTRATION_CODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a role alias Requires permission to access the DeleteRoleAlias action.

      def delete_role_alias(
        role_alias : String
      ) : Protocol::Request
        input = Types::DeleteRoleAliasRequest.new(role_alias: role_alias)
        delete_role_alias(input)
      end

      def delete_role_alias(input : Types::DeleteRoleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROLE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a scheduled audit. Requires permission to access the DeleteScheduledAudit action.

      def delete_scheduled_audit(
        scheduled_audit_name : String
      ) : Protocol::Request
        input = Types::DeleteScheduledAuditRequest.new(scheduled_audit_name: scheduled_audit_name)
        delete_scheduled_audit(input)
      end

      def delete_scheduled_audit(input : Types::DeleteScheduledAuditRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEDULED_AUDIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Device Defender security profile. Requires permission to access the DeleteSecurityProfile
      # action.

      def delete_security_profile(
        security_profile_name : String,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteSecurityProfileRequest.new(security_profile_name: security_profile_name, expected_version: expected_version)
        delete_security_profile(input)
      end

      def delete_security_profile(input : Types::DeleteSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a stream. Requires permission to access the DeleteStream action.

      def delete_stream(
        stream_id : String
      ) : Protocol::Request
        input = Types::DeleteStreamRequest.new(stream_id: stream_id)
        delete_stream(input)
      end

      def delete_stream(input : Types::DeleteStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified thing. Returns successfully with no error if the deletion is successful or you
      # specify a thing that doesn't exist. Requires permission to access the DeleteThing action.

      def delete_thing(
        thing_name : String,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteThingRequest.new(thing_name: thing_name, expected_version: expected_version)
        delete_thing(input)
      end

      def delete_thing(input : Types::DeleteThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a thing group. Requires permission to access the DeleteThingGroup action.

      def delete_thing_group(
        thing_group_name : String,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteThingGroupRequest.new(thing_group_name: thing_group_name, expected_version: expected_version)
        delete_thing_group(input)
      end

      def delete_thing_group(input : Types::DeleteThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified thing type. You cannot delete a thing type if it has things associated with
      # it. To delete a thing type, first mark it as deprecated by calling DeprecateThingType , then remove
      # any associated things by calling UpdateThing to change the thing type on any associated thing, and
      # finally use DeleteThingType to delete the thing type. Requires permission to access the
      # DeleteThingType action.

      def delete_thing_type(
        thing_type_name : String
      ) : Protocol::Request
        input = Types::DeleteThingTypeRequest.new(thing_type_name: thing_type_name)
        delete_thing_type(input)
      end

      def delete_thing_type(input : Types::DeleteThingTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THING_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the rule. Requires permission to access the DeleteTopicRule action.

      def delete_topic_rule(
        rule_name : String
      ) : Protocol::Request
        input = Types::DeleteTopicRuleRequest.new(rule_name: rule_name)
        delete_topic_rule(input)
      end

      def delete_topic_rule(input : Types::DeleteTopicRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TOPIC_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a topic rule destination. Requires permission to access the DeleteTopicRuleDestination
      # action.

      def delete_topic_rule_destination(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteTopicRuleDestinationRequest.new(arn: arn)
        delete_topic_rule_destination(input)
      end

      def delete_topic_rule_destination(input : Types::DeleteTopicRuleDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TOPIC_RULE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a logging level. Requires permission to access the DeleteV2LoggingLevel action.

      def delete_v2_logging_level(
        target_name : String,
        target_type : String
      ) : Protocol::Request
        input = Types::DeleteV2LoggingLevelRequest.new(target_name: target_name, target_type: target_type)
        delete_v2_logging_level(input)
      end

      def delete_v2_logging_level(input : Types::DeleteV2LoggingLevelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_V2_LOGGING_LEVEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deprecates a thing type. You can not associate new things with deprecated thing type. Requires
      # permission to access the DeprecateThingType action.

      def deprecate_thing_type(
        thing_type_name : String,
        undo_deprecate : Bool? = nil
      ) : Protocol::Request
        input = Types::DeprecateThingTypeRequest.new(thing_type_name: thing_type_name, undo_deprecate: undo_deprecate)
        deprecate_thing_type(input)
      end

      def deprecate_thing_type(input : Types::DeprecateThingTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEPRECATE_THING_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the Device Defender audit settings for this account. Settings include how
      # audit notifications are sent and which audit checks are enabled or disabled. Requires permission to
      # access the DescribeAccountAuditConfiguration action.

      def describe_account_audit_configuration : Protocol::Request
        input = Types::DescribeAccountAuditConfigurationRequest.new
        describe_account_audit_configuration(input)
      end

      def describe_account_audit_configuration(input : Types::DescribeAccountAuditConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_AUDIT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a single audit finding. Properties include the reason for noncompliance, the
      # severity of the issue, and the start time when the audit that returned the finding. Requires
      # permission to access the DescribeAuditFinding action.

      def describe_audit_finding(
        finding_id : String
      ) : Protocol::Request
        input = Types::DescribeAuditFindingRequest.new(finding_id: finding_id)
        describe_audit_finding(input)
      end

      def describe_audit_finding(input : Types::DescribeAuditFindingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_AUDIT_FINDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an audit mitigation task that is used to apply mitigation actions to a set of
      # audit findings. Properties include the actions being applied, the audit checks to which they're
      # being applied, the task status, and aggregated task statistics.

      def describe_audit_mitigation_actions_task(
        task_id : String
      ) : Protocol::Request
        input = Types::DescribeAuditMitigationActionsTaskRequest.new(task_id: task_id)
        describe_audit_mitigation_actions_task(input)
      end

      def describe_audit_mitigation_actions_task(input : Types::DescribeAuditMitigationActionsTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_AUDIT_MITIGATION_ACTIONS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Device Defender audit suppression.

      def describe_audit_suppression(
        check_name : String,
        resource_identifier : Types::ResourceIdentifier
      ) : Protocol::Request
        input = Types::DescribeAuditSuppressionRequest.new(check_name: check_name, resource_identifier: resource_identifier)
        describe_audit_suppression(input)
      end

      def describe_audit_suppression(input : Types::DescribeAuditSuppressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_AUDIT_SUPPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Device Defender audit. Requires permission to access the DescribeAuditTask
      # action.

      def describe_audit_task(
        task_id : String
      ) : Protocol::Request
        input = Types::DescribeAuditTaskRequest.new(task_id: task_id)
        describe_audit_task(input)
      end

      def describe_audit_task(input : Types::DescribeAuditTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_AUDIT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an authorizer. Requires permission to access the DescribeAuthorizer action.

      def describe_authorizer(
        authorizer_name : String
      ) : Protocol::Request
        input = Types::DescribeAuthorizerRequest.new(authorizer_name: authorizer_name)
        describe_authorizer(input)
      end

      def describe_authorizer(input : Types::DescribeAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a billing group. Requires permission to access the DescribeBillingGroup
      # action.

      def describe_billing_group(
        billing_group_name : String
      ) : Protocol::Request
        input = Types::DescribeBillingGroupRequest.new(billing_group_name: billing_group_name)
        describe_billing_group(input)
      end

      def describe_billing_group(input : Types::DescribeBillingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a registered CA certificate. Requires permission to access the DescribeCACertificate
      # action.

      def describe_ca_certificate(
        certificate_id : String
      ) : Protocol::Request
        input = Types::DescribeCACertificateRequest.new(certificate_id: certificate_id)
        describe_ca_certificate(input)
      end

      def describe_ca_certificate(input : Types::DescribeCACertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CA_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified certificate. Requires permission to access the
      # DescribeCertificate action.

      def describe_certificate(
        certificate_id : String
      ) : Protocol::Request
        input = Types::DescribeCertificateRequest.new(certificate_id: certificate_id)
        describe_certificate(input)
      end

      def describe_certificate(input : Types::DescribeCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a certificate provider. Requires permission to access the DescribeCertificateProvider
      # action.

      def describe_certificate_provider(
        certificate_provider_name : String
      ) : Protocol::Request
        input = Types::DescribeCertificateProviderRequest.new(certificate_provider_name: certificate_provider_name)
        describe_certificate_provider(input)
      end

      def describe_certificate_provider(input : Types::DescribeCertificateProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CERTIFICATE_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Device Defender detect custom metric. Requires permission to access the
      # DescribeCustomMetric action.

      def describe_custom_metric(
        metric_name : String
      ) : Protocol::Request
        input = Types::DescribeCustomMetricRequest.new(metric_name: metric_name)
        describe_custom_metric(input)
      end

      def describe_custom_metric(input : Types::DescribeCustomMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CUSTOM_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the default authorizer. Requires permission to access the DescribeDefaultAuthorizer
      # action.

      def describe_default_authorizer : Protocol::Request
        input = Types::DescribeDefaultAuthorizerRequest.new
        describe_default_authorizer(input)
      end

      def describe_default_authorizer(input : Types::DescribeDefaultAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DEFAULT_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Device Defender ML Detect mitigation action. Requires permission to access
      # the DescribeDetectMitigationActionsTask action.

      def describe_detect_mitigation_actions_task(
        task_id : String
      ) : Protocol::Request
        input = Types::DescribeDetectMitigationActionsTaskRequest.new(task_id: task_id)
        describe_detect_mitigation_actions_task(input)
      end

      def describe_detect_mitigation_actions_task(input : Types::DescribeDetectMitigationActionsTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DETECT_MITIGATION_ACTIONS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides details about a dimension that is defined in your Amazon Web Services accounts. Requires
      # permission to access the DescribeDimension action.

      def describe_dimension(
        name : String
      ) : Protocol::Request
        input = Types::DescribeDimensionRequest.new(name: name)
        describe_dimension(input)
      end

      def describe_dimension(input : Types::DescribeDimensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DIMENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about a domain configuration. Requires permission to access the
      # DescribeDomainConfiguration action.

      def describe_domain_configuration(
        domain_configuration_name : String
      ) : Protocol::Request
        input = Types::DescribeDomainConfigurationRequest.new(domain_configuration_name: domain_configuration_name)
        describe_domain_configuration(input)
      end

      def describe_domain_configuration(input : Types::DescribeDomainConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOMAIN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the encryption configuration for resources and data of your Amazon Web Services account in
      # Amazon Web Services IoT Core. For more information, see Data encryption at rest in the Amazon Web
      # Services IoT Core Developer Guide .

      def describe_encryption_configuration : Protocol::Request
        input = Types::DescribeEncryptionConfigurationRequest.new
        describe_encryption_configuration(input)
      end

      def describe_encryption_configuration(input : Types::DescribeEncryptionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ENCRYPTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns or creates a unique endpoint specific to the Amazon Web Services account making the call.
      # The first time DescribeEndpoint is called, an endpoint is created. All subsequent calls to
      # DescribeEndpoint return the same endpoint. Requires permission to access the DescribeEndpoint
      # action.

      def describe_endpoint(
        endpoint_type : String? = nil
      ) : Protocol::Request
        input = Types::DescribeEndpointRequest.new(endpoint_type: endpoint_type)
        describe_endpoint(input)
      end

      def describe_endpoint(input : Types::DescribeEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes event configurations. Requires permission to access the DescribeEventConfigurations
      # action.

      def describe_event_configurations : Protocol::Request
        input = Types::DescribeEventConfigurationsRequest.new
        describe_event_configurations(input)
      end

      def describe_event_configurations(input : Types::DescribeEventConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EVENT_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified fleet metric. Requires permission to access the
      # DescribeFleetMetric action.

      def describe_fleet_metric(
        metric_name : String
      ) : Protocol::Request
        input = Types::DescribeFleetMetricRequest.new(metric_name: metric_name)
        describe_fleet_metric(input)
      end

      def describe_fleet_metric(input : Types::DescribeFleetMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FLEET_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a search index. Requires permission to access the DescribeIndex action.

      def describe_index(
        index_name : String
      ) : Protocol::Request
        input = Types::DescribeIndexRequest.new(index_name: index_name)
        describe_index(input)
      end

      def describe_index(input : Types::DescribeIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a job. Requires permission to access the DescribeJob action.

      def describe_job(
        job_id : String,
        before_substitution : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeJobRequest.new(job_id: job_id, before_substitution: before_substitution)
        describe_job(input)
      end

      def describe_job(input : Types::DescribeJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a job execution. Requires permission to access the DescribeJobExecution action.

      def describe_job_execution(
        job_id : String,
        thing_name : String,
        execution_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DescribeJobExecutionRequest.new(job_id: job_id, thing_name: thing_name, execution_number: execution_number)
        describe_job_execution(input)
      end

      def describe_job_execution(input : Types::DescribeJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a job template.

      def describe_job_template(
        job_template_id : String
      ) : Protocol::Request
        input = Types::DescribeJobTemplateRequest.new(job_template_id: job_template_id)
        describe_job_template(input)
      end

      def describe_job_template(input : Types::DescribeJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # View details of a managed job template.

      def describe_managed_job_template(
        template_name : String,
        template_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeManagedJobTemplateRequest.new(template_name: template_name, template_version: template_version)
        describe_managed_job_template(input)
      end

      def describe_managed_job_template(input : Types::DescribeManagedJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MANAGED_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a mitigation action. Requires permission to access the
      # DescribeMitigationAction action.

      def describe_mitigation_action(
        action_name : String
      ) : Protocol::Request
        input = Types::DescribeMitigationActionRequest.new(action_name: action_name)
        describe_mitigation_action(input)
      end

      def describe_mitigation_action(input : Types::DescribeMitigationActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MITIGATION_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a provisioning template. Requires permission to access the
      # DescribeProvisioningTemplate action.

      def describe_provisioning_template(
        template_name : String
      ) : Protocol::Request
        input = Types::DescribeProvisioningTemplateRequest.new(template_name: template_name)
        describe_provisioning_template(input)
      end

      def describe_provisioning_template(input : Types::DescribeProvisioningTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROVISIONING_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a provisioning template version. Requires permission to access the
      # DescribeProvisioningTemplateVersion action.

      def describe_provisioning_template_version(
        template_name : String,
        version_id : Int32
      ) : Protocol::Request
        input = Types::DescribeProvisioningTemplateVersionRequest.new(template_name: template_name, version_id: version_id)
        describe_provisioning_template_version(input)
      end

      def describe_provisioning_template_version(input : Types::DescribeProvisioningTemplateVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROVISIONING_TEMPLATE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a role alias. Requires permission to access the DescribeRoleAlias action.

      def describe_role_alias(
        role_alias : String
      ) : Protocol::Request
        input = Types::DescribeRoleAliasRequest.new(role_alias: role_alias)
        describe_role_alias(input)
      end

      def describe_role_alias(input : Types::DescribeRoleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ROLE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a scheduled audit. Requires permission to access the DescribeScheduledAudit
      # action.

      def describe_scheduled_audit(
        scheduled_audit_name : String
      ) : Protocol::Request
        input = Types::DescribeScheduledAuditRequest.new(scheduled_audit_name: scheduled_audit_name)
        describe_scheduled_audit(input)
      end

      def describe_scheduled_audit(input : Types::DescribeScheduledAuditRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCHEDULED_AUDIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Device Defender security profile. Requires permission to access the
      # DescribeSecurityProfile action.

      def describe_security_profile(
        security_profile_name : String
      ) : Protocol::Request
        input = Types::DescribeSecurityProfileRequest.new(security_profile_name: security_profile_name)
        describe_security_profile(input)
      end

      def describe_security_profile(input : Types::DescribeSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a stream. Requires permission to access the DescribeStream action.

      def describe_stream(
        stream_id : String
      ) : Protocol::Request
        input = Types::DescribeStreamRequest.new(stream_id: stream_id)
        describe_stream(input)
      end

      def describe_stream(input : Types::DescribeStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified thing. Requires permission to access the DescribeThing action.

      def describe_thing(
        thing_name : String
      ) : Protocol::Request
        input = Types::DescribeThingRequest.new(thing_name: thing_name)
        describe_thing(input)
      end

      def describe_thing(input : Types::DescribeThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe a thing group. Requires permission to access the DescribeThingGroup action.

      def describe_thing_group(
        thing_group_name : String
      ) : Protocol::Request
        input = Types::DescribeThingGroupRequest.new(thing_group_name: thing_group_name)
        describe_thing_group(input)
      end

      def describe_thing_group(input : Types::DescribeThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a bulk thing provisioning task. Requires permission to access the
      # DescribeThingRegistrationTask action.

      def describe_thing_registration_task(
        task_id : String
      ) : Protocol::Request
        input = Types::DescribeThingRegistrationTaskRequest.new(task_id: task_id)
        describe_thing_registration_task(input)
      end

      def describe_thing_registration_task(input : Types::DescribeThingRegistrationTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THING_REGISTRATION_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified thing type. Requires permission to access the DescribeThingType
      # action.

      def describe_thing_type(
        thing_type_name : String
      ) : Protocol::Request
        input = Types::DescribeThingTypeRequest.new(thing_type_name: thing_type_name)
        describe_thing_type(input)
      end

      def describe_thing_type(input : Types::DescribeThingTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THING_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches a policy from the specified target. Because of the distributed nature of Amazon Web
      # Services, it can take up to five minutes after a policy is detached before it's ready to be deleted.
      # Requires permission to access the DetachPolicy action.

      def detach_policy(
        policy_name : String,
        target : String
      ) : Protocol::Request
        input = Types::DetachPolicyRequest.new(policy_name: policy_name, target: target)
        detach_policy(input)
      end

      def detach_policy(input : Types::DetachPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified policy from the specified certificate. Note: This action is deprecated and
      # works as expected for backward compatibility, but we won't add enhancements. Use DetachPolicy
      # instead. Requires permission to access the DetachPrincipalPolicy action.

      def detach_principal_policy(
        policy_name : String,
        principal : String
      ) : Protocol::Request
        input = Types::DetachPrincipalPolicyRequest.new(policy_name: policy_name, principal: principal)
        detach_principal_policy(input)
      end

      def detach_principal_policy(input : Types::DetachPrincipalPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_PRINCIPAL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a Device Defender security profile from a thing group or from this account. Requires
      # permission to access the DetachSecurityProfile action.

      def detach_security_profile(
        security_profile_name : String,
        security_profile_target_arn : String
      ) : Protocol::Request
        input = Types::DetachSecurityProfileRequest.new(security_profile_name: security_profile_name, security_profile_target_arn: security_profile_target_arn)
        detach_security_profile(input)
      end

      def detach_security_profile(input : Types::DetachSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches the specified principal from the specified thing. A principal can be X.509 certificates,
      # IAM users, groups, and roles, Amazon Cognito identities or federated identities. This call is
      # asynchronous. It might take several seconds for the detachment to propagate. Requires permission to
      # access the DetachThingPrincipal action.

      def detach_thing_principal(
        principal : String,
        thing_name : String
      ) : Protocol::Request
        input = Types::DetachThingPrincipalRequest.new(principal: principal, thing_name: thing_name)
        detach_thing_principal(input)
      end

      def detach_thing_principal(input : Types::DetachThingPrincipalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_THING_PRINCIPAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the rule. Requires permission to access the DisableTopicRule action.

      def disable_topic_rule(
        rule_name : String
      ) : Protocol::Request
        input = Types::DisableTopicRuleRequest.new(rule_name: rule_name)
        disable_topic_rule(input)
      end

      def disable_topic_rule(input : Types::DisableTopicRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_TOPIC_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the selected software bill of materials (SBOM) from a specific software package
      # version. Requires permission to access the DisassociateSbomWithPackageVersion action.

      def disassociate_sbom_from_package_version(
        package_name : String,
        version_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateSbomFromPackageVersionRequest.new(package_name: package_name, version_name: version_name, client_token: client_token)
        disassociate_sbom_from_package_version(input)
      end

      def disassociate_sbom_from_package_version(input : Types::DisassociateSbomFromPackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SBOM_FROM_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the rule. Requires permission to access the EnableTopicRule action.

      def enable_topic_rule(
        rule_name : String
      ) : Protocol::Request
        input = Types::EnableTopicRuleRequest.new(rule_name: rule_name)
        enable_topic_rule(input)
      end

      def enable_topic_rule(input : Types::EnableTopicRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_TOPIC_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a Device Defender's ML Detect Security Profile training model's status. Requires permission
      # to access the GetBehaviorModelTrainingSummaries action.

      def get_behavior_model_training_summaries(
        max_results : Int32? = nil,
        next_token : String? = nil,
        security_profile_name : String? = nil
      ) : Protocol::Request
        input = Types::GetBehaviorModelTrainingSummariesRequest.new(max_results: max_results, next_token: next_token, security_profile_name: security_profile_name)
        get_behavior_model_training_summaries(input)
      end

      def get_behavior_model_training_summaries(input : Types::GetBehaviorModelTrainingSummariesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BEHAVIOR_MODEL_TRAINING_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Aggregates on indexed data with search queries pertaining to particular fields. Requires permission
      # to access the GetBucketsAggregation action.

      def get_buckets_aggregation(
        aggregation_field : String,
        buckets_aggregation_type : Types::BucketsAggregationType,
        query_string : String,
        index_name : String? = nil,
        query_version : String? = nil
      ) : Protocol::Request
        input = Types::GetBucketsAggregationRequest.new(aggregation_field: aggregation_field, buckets_aggregation_type: buckets_aggregation_type, query_string: query_string, index_name: index_name, query_version: query_version)
        get_buckets_aggregation(input)
      end

      def get_buckets_aggregation(input : Types::GetBucketsAggregationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BUCKETS_AGGREGATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the approximate count of unique values that match the query. Requires permission to access
      # the GetCardinality action.

      def get_cardinality(
        query_string : String,
        aggregation_field : String? = nil,
        index_name : String? = nil,
        query_version : String? = nil
      ) : Protocol::Request
        input = Types::GetCardinalityRequest.new(query_string: query_string, aggregation_field: aggregation_field, index_name: index_name, query_version: query_version)
        get_cardinality(input)
      end

      def get_cardinality(input : Types::GetCardinalityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CARDINALITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified command.

      def get_command(
        command_id : String
      ) : Protocol::Request
        input = Types::GetCommandRequest.new(command_id: command_id)
        get_command(input)
      end

      def get_command(input : Types::GetCommandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMMAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specific command execution on a single device.

      def get_command_execution(
        execution_id : String,
        target_arn : String,
        include_result : Bool? = nil
      ) : Protocol::Request
        input = Types::GetCommandExecutionRequest.new(execution_id: execution_id, target_arn: target_arn, include_result: include_result)
        get_command_execution(input)
      end

      def get_command_execution(input : Types::GetCommandExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMMAND_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of the policies that have an effect on the authorization behavior of the specified
      # device when it connects to the IoT device gateway. Requires permission to access the
      # GetEffectivePolicies action.

      def get_effective_policies(
        cognito_identity_pool_id : String? = nil,
        principal : String? = nil,
        thing_name : String? = nil
      ) : Protocol::Request
        input = Types::GetEffectivePoliciesRequest.new(cognito_identity_pool_id: cognito_identity_pool_id, principal: principal, thing_name: thing_name)
        get_effective_policies(input)
      end

      def get_effective_policies(input : Types::GetEffectivePoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EFFECTIVE_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the indexing configuration. Requires permission to access the GetIndexingConfiguration action.

      def get_indexing_configuration : Protocol::Request
        input = Types::GetIndexingConfigurationRequest.new
        get_indexing_configuration(input)
      end

      def get_indexing_configuration(input : Types::GetIndexingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INDEXING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a job document. Requires permission to access the GetJobDocument action.

      def get_job_document(
        job_id : String,
        before_substitution : Bool? = nil
      ) : Protocol::Request
        input = Types::GetJobDocumentRequest.new(job_id: job_id, before_substitution: before_substitution)
        get_job_document(input)
      end

      def get_job_document(input : Types::GetJobDocumentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the logging options. NOTE: use of this command is not recommended. Use GetV2LoggingOptions
      # instead. Requires permission to access the GetLoggingOptions action.

      def get_logging_options : Protocol::Request
        input = Types::GetLoggingOptionsRequest.new
        get_logging_options(input)
      end

      def get_logging_options(input : Types::GetLoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an OTA update. Requires permission to access the GetOTAUpdate action.

      def get_ota_update(
        ota_update_id : String
      ) : Protocol::Request
        input = Types::GetOTAUpdateRequest.new(ota_update_id: ota_update_id)
        get_ota_update(input)
      end

      def get_ota_update(input : Types::GetOTAUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OTA_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified software package. Requires permission to access the GetPackage
      # action.

      def get_package(
        package_name : String
      ) : Protocol::Request
        input = Types::GetPackageRequest.new(package_name: package_name)
        get_package(input)
      end

      def get_package(input : Types::GetPackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified software package's configuration. Requires permission to access
      # the GetPackageConfiguration action.

      def get_package_configuration : Protocol::Request
        input = Types::GetPackageConfigurationRequest.new
        get_package_configuration(input)
      end

      def get_package_configuration(input : Types::GetPackageConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PACKAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified package version. Requires permission to access the
      # GetPackageVersion action.

      def get_package_version(
        package_name : String,
        version_name : String
      ) : Protocol::Request
        input = Types::GetPackageVersionRequest.new(package_name: package_name, version_name: version_name)
        get_package_version(input)
      end

      def get_package_version(input : Types::GetPackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Groups the aggregated values that match the query into percentile groupings. The default percentile
      # groupings are: 1,5,25,50,75,95,99, although you can specify your own when you call GetPercentiles .
      # This function returns a value for each percentile group specified (or the default percentile
      # groupings). The percentile group "1" contains the aggregated field value that occurs in
      # approximately one percent of the values that match the query. The percentile group "5" contains the
      # aggregated field value that occurs in approximately five percent of the values that match the query,
      # and so on. The result is an approximation, the more values that match the query, the more accurate
      # the percentile values. Requires permission to access the GetPercentiles action.

      def get_percentiles(
        query_string : String,
        aggregation_field : String? = nil,
        index_name : String? = nil,
        percents : Array(Float64)? = nil,
        query_version : String? = nil
      ) : Protocol::Request
        input = Types::GetPercentilesRequest.new(query_string: query_string, aggregation_field: aggregation_field, index_name: index_name, percents: percents, query_version: query_version)
        get_percentiles(input)
      end

      def get_percentiles(input : Types::GetPercentilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PERCENTILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified policy with the policy document of the default version.
      # Requires permission to access the GetPolicy action.

      def get_policy(
        policy_name : String
      ) : Protocol::Request
        input = Types::GetPolicyRequest.new(policy_name: policy_name)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified policy version. Requires permission to access the
      # GetPolicyVersion action.

      def get_policy_version(
        policy_name : String,
        policy_version_id : String
      ) : Protocol::Request
        input = Types::GetPolicyVersionRequest.new(policy_name: policy_name, policy_version_id: policy_version_id)
        get_policy_version(input)
      end

      def get_policy_version(input : Types::GetPolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a registration code used to register a CA certificate with IoT. IoT will create a registration
      # code as part of this API call if the registration code doesn't exist or has been deleted. If you
      # already have a registration code, this API call will return the same registration code. Requires
      # permission to access the GetRegistrationCode action.

      def get_registration_code : Protocol::Request
        input = Types::GetRegistrationCodeRequest.new
        get_registration_code(input)
      end

      def get_registration_code(input : Types::GetRegistrationCodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REGISTRATION_CODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the count, average, sum, minimum, maximum, sum of squares, variance, and standard deviation
      # for the specified aggregated field. If the aggregation field is of type String , only the count
      # statistic is returned. Requires permission to access the GetStatistics action.

      def get_statistics(
        query_string : String,
        aggregation_field : String? = nil,
        index_name : String? = nil,
        query_version : String? = nil
      ) : Protocol::Request
        input = Types::GetStatisticsRequest.new(query_string: query_string, aggregation_field: aggregation_field, index_name: index_name, query_version: query_version)
        get_statistics(input)
      end

      def get_statistics(input : Types::GetStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the live connectivity status per device.

      def get_thing_connectivity_data(
        thing_name : String
      ) : Protocol::Request
        input = Types::GetThingConnectivityDataRequest.new(thing_name: thing_name)
        get_thing_connectivity_data(input)
      end

      def get_thing_connectivity_data(input : Types::GetThingConnectivityDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_THING_CONNECTIVITY_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the rule. Requires permission to access the GetTopicRule action.

      def get_topic_rule(
        rule_name : String
      ) : Protocol::Request
        input = Types::GetTopicRuleRequest.new(rule_name: rule_name)
        get_topic_rule(input)
      end

      def get_topic_rule(input : Types::GetTopicRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TOPIC_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a topic rule destination. Requires permission to access the
      # GetTopicRuleDestination action.

      def get_topic_rule_destination(
        arn : String
      ) : Protocol::Request
        input = Types::GetTopicRuleDestinationRequest.new(arn: arn)
        get_topic_rule_destination(input)
      end

      def get_topic_rule_destination(input : Types::GetTopicRuleDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TOPIC_RULE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the fine grained logging options. Requires permission to access the GetV2LoggingOptions action.

      def get_v2_logging_options(
        verbose : Bool? = nil
      ) : Protocol::Request
        input = Types::GetV2LoggingOptionsRequest.new(verbose: verbose)
        get_v2_logging_options(input)
      end

      def get_v2_logging_options(input : Types::GetV2LoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_V2_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the active violations for a given Device Defender security profile. Requires permission to
      # access the ListActiveViolations action.

      def list_active_violations(
        behavior_criteria_type : String? = nil,
        list_suppressed_alerts : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        security_profile_name : String? = nil,
        thing_name : String? = nil,
        verification_state : String? = nil
      ) : Protocol::Request
        input = Types::ListActiveViolationsRequest.new(behavior_criteria_type: behavior_criteria_type, list_suppressed_alerts: list_suppressed_alerts, max_results: max_results, next_token: next_token, security_profile_name: security_profile_name, thing_name: thing_name, verification_state: verification_state)
        list_active_violations(input)
      end

      def list_active_violations(input : Types::ListActiveViolationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACTIVE_VIOLATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the policies attached to the specified thing group. Requires permission to access the
      # ListAttachedPolicies action.

      def list_attached_policies(
        target : String,
        marker : String? = nil,
        page_size : Int32? = nil,
        recursive : Bool? = nil
      ) : Protocol::Request
        input = Types::ListAttachedPoliciesRequest.new(target: target, marker: marker, page_size: page_size, recursive: recursive)
        list_attached_policies(input)
      end

      def list_attached_policies(input : Types::ListAttachedPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTACHED_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the findings (results) of a Device Defender audit or of the audits performed during a
      # specified time period. (Findings are retained for 90 days.) Requires permission to access the
      # ListAuditFindings action.

      def list_audit_findings(
        check_name : String? = nil,
        end_time : Time? = nil,
        list_suppressed_findings : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier : Types::ResourceIdentifier? = nil,
        start_time : Time? = nil,
        task_id : String? = nil
      ) : Protocol::Request
        input = Types::ListAuditFindingsRequest.new(check_name: check_name, end_time: end_time, list_suppressed_findings: list_suppressed_findings, max_results: max_results, next_token: next_token, resource_identifier: resource_identifier, start_time: start_time, task_id: task_id)
        list_audit_findings(input)
      end

      def list_audit_findings(input : Types::ListAuditFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIT_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the status of audit mitigation action tasks that were executed. Requires permission to access
      # the ListAuditMitigationActionsExecutions action.

      def list_audit_mitigation_actions_executions(
        finding_id : String,
        task_id : String,
        action_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAuditMitigationActionsExecutionsRequest.new(finding_id: finding_id, task_id: task_id, action_status: action_status, max_results: max_results, next_token: next_token)
        list_audit_mitigation_actions_executions(input)
      end

      def list_audit_mitigation_actions_executions(input : Types::ListAuditMitigationActionsExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIT_MITIGATION_ACTIONS_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of audit mitigation action tasks that match the specified filters. Requires permission
      # to access the ListAuditMitigationActionsTasks action.

      def list_audit_mitigation_actions_tasks(
        end_time : Time,
        start_time : Time,
        audit_task_id : String? = nil,
        finding_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        task_status : String? = nil
      ) : Protocol::Request
        input = Types::ListAuditMitigationActionsTasksRequest.new(end_time: end_time, start_time: start_time, audit_task_id: audit_task_id, finding_id: finding_id, max_results: max_results, next_token: next_token, task_status: task_status)
        list_audit_mitigation_actions_tasks(input)
      end

      def list_audit_mitigation_actions_tasks(input : Types::ListAuditMitigationActionsTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIT_MITIGATION_ACTIONS_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your Device Defender audit listings. Requires permission to access the ListAuditSuppressions
      # action.

      def list_audit_suppressions(
        ascending_order : Bool? = nil,
        check_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier : Types::ResourceIdentifier? = nil
      ) : Protocol::Request
        input = Types::ListAuditSuppressionsRequest.new(ascending_order: ascending_order, check_name: check_name, max_results: max_results, next_token: next_token, resource_identifier: resource_identifier)
        list_audit_suppressions(input)
      end

      def list_audit_suppressions(input : Types::ListAuditSuppressionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIT_SUPPRESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Device Defender audits that have been performed during a given time period. Requires
      # permission to access the ListAuditTasks action.

      def list_audit_tasks(
        end_time : Time,
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil,
        task_status : String? = nil,
        task_type : String? = nil
      ) : Protocol::Request
        input = Types::ListAuditTasksRequest.new(end_time: end_time, start_time: start_time, max_results: max_results, next_token: next_token, task_status: task_status, task_type: task_type)
        list_audit_tasks(input)
      end

      def list_audit_tasks(input : Types::ListAuditTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIT_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the authorizers registered in your account. Requires permission to access the ListAuthorizers
      # action.

      def list_authorizers(
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListAuthorizersRequest.new(ascending_order: ascending_order, marker: marker, page_size: page_size, status: status)
        list_authorizers(input)
      end

      def list_authorizers(input : Types::ListAuthorizersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTHORIZERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the billing groups you have created. Requires permission to access the ListBillingGroups
      # action.

      def list_billing_groups(
        max_results : Int32? = nil,
        name_prefix_filter : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBillingGroupsRequest.new(max_results: max_results, name_prefix_filter: name_prefix_filter, next_token: next_token)
        list_billing_groups(input)
      end

      def list_billing_groups(input : Types::ListBillingGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BILLING_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the CA certificates registered for your Amazon Web Services account. The results are paginated
      # with a default page size of 25. You can use the returned marker to retrieve additional results.
      # Requires permission to access the ListCACertificates action.

      def list_ca_certificates(
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil,
        template_name : String? = nil
      ) : Protocol::Request
        input = Types::ListCACertificatesRequest.new(ascending_order: ascending_order, marker: marker, page_size: page_size, template_name: template_name)
        list_ca_certificates(input)
      end

      def list_ca_certificates(input : Types::ListCACertificatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CA_CERTIFICATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all your certificate providers in your Amazon Web Services account. Requires permission to
      # access the ListCertificateProviders action.

      def list_certificate_providers(
        ascending_order : Bool? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCertificateProvidersRequest.new(ascending_order: ascending_order, next_token: next_token)
        list_certificate_providers(input)
      end

      def list_certificate_providers(input : Types::ListCertificateProvidersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CERTIFICATE_PROVIDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the certificates registered in your Amazon Web Services account. The results are paginated
      # with a default page size of 25. You can use the returned marker to retrieve additional results.
      # Requires permission to access the ListCertificates action.

      def list_certificates(
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListCertificatesRequest.new(ascending_order: ascending_order, marker: marker, page_size: page_size)
        list_certificates(input)
      end

      def list_certificates(input : Types::ListCertificatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CERTIFICATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the device certificates signed by the specified CA certificate. Requires permission to access
      # the ListCertificatesByCA action.

      def list_certificates_by_ca(
        ca_certificate_id : String,
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListCertificatesByCARequest.new(ca_certificate_id: ca_certificate_id, ascending_order: ascending_order, marker: marker, page_size: page_size)
        list_certificates_by_ca(input)
      end

      def list_certificates_by_ca(input : Types::ListCertificatesByCARequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CERTIFICATES_BY_CA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all command executions. You must provide only the startedTimeFilter or the completedTimeFilter
      # information. If you provide both time filters, the API will generate an error. You can use this
      # information to retrieve a list of command executions within a specific timeframe. You must provide
      # only the commandArn or the thingArn information depending on whether you want to list executions for
      # a specific command or an IoT thing. If you provide both fields, the API will generate an error. For
      # more information about considerations for using this API, see List command executions in your
      # account (CLI) .

      def list_command_executions(
        command_arn : String? = nil,
        completed_time_filter : Types::TimeFilter? = nil,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil,
        sort_order : String? = nil,
        started_time_filter : Types::TimeFilter? = nil,
        status : String? = nil,
        target_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListCommandExecutionsRequest.new(command_arn: command_arn, completed_time_filter: completed_time_filter, max_results: max_results, namespace: namespace, next_token: next_token, sort_order: sort_order, started_time_filter: started_time_filter, status: status, target_arn: target_arn)
        list_command_executions(input)
      end

      def list_command_executions(input : Types::ListCommandExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMMAND_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all commands in your account.

      def list_commands(
        command_parameter_name : String? = nil,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListCommandsRequest.new(command_parameter_name: command_parameter_name, max_results: max_results, namespace: namespace, next_token: next_token, sort_order: sort_order)
        list_commands(input)
      end

      def list_commands(input : Types::ListCommandsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMMANDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your Device Defender detect custom metrics. Requires permission to access the
      # ListCustomMetrics action.

      def list_custom_metrics(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomMetricsRequest.new(max_results: max_results, next_token: next_token)
        list_custom_metrics(input)
      end

      def list_custom_metrics(input : Types::ListCustomMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists mitigation actions executions for a Device Defender ML Detect Security Profile. Requires
      # permission to access the ListDetectMitigationActionsExecutions action.

      def list_detect_mitigation_actions_executions(
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil,
        task_id : String? = nil,
        thing_name : String? = nil,
        violation_id : String? = nil
      ) : Protocol::Request
        input = Types::ListDetectMitigationActionsExecutionsRequest.new(end_time: end_time, max_results: max_results, next_token: next_token, start_time: start_time, task_id: task_id, thing_name: thing_name, violation_id: violation_id)
        list_detect_mitigation_actions_executions(input)
      end

      def list_detect_mitigation_actions_executions(input : Types::ListDetectMitigationActionsExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DETECT_MITIGATION_ACTIONS_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List of Device Defender ML Detect mitigation actions tasks. Requires permission to access the
      # ListDetectMitigationActionsTasks action.

      def list_detect_mitigation_actions_tasks(
        end_time : Time,
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDetectMitigationActionsTasksRequest.new(end_time: end_time, start_time: start_time, max_results: max_results, next_token: next_token)
        list_detect_mitigation_actions_tasks(input)
      end

      def list_detect_mitigation_actions_tasks(input : Types::ListDetectMitigationActionsTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DETECT_MITIGATION_ACTIONS_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the set of dimensions that are defined for your Amazon Web Services accounts. Requires
      # permission to access the ListDimensions action.

      def list_dimensions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDimensionsRequest.new(max_results: max_results, next_token: next_token)
        list_dimensions(input)
      end

      def list_dimensions(input : Types::ListDimensionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DIMENSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of domain configurations for the user. This list is sorted alphabetically by domain
      # configuration name. Requires permission to access the ListDomainConfigurations action.

      def list_domain_configurations(
        marker : String? = nil,
        page_size : Int32? = nil,
        service_type : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainConfigurationsRequest.new(marker: marker, page_size: page_size, service_type: service_type)
        list_domain_configurations(input)
      end

      def list_domain_configurations(input : Types::ListDomainConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all your fleet metrics. Requires permission to access the ListFleetMetrics action.

      def list_fleet_metrics(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFleetMetricsRequest.new(max_results: max_results, next_token: next_token)
        list_fleet_metrics(input)
      end

      def list_fleet_metrics(input : Types::ListFleetMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLEET_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the search indices. Requires permission to access the ListIndices action.

      def list_indices(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIndicesRequest.new(max_results: max_results, next_token: next_token)
        list_indices(input)
      end

      def list_indices(input : Types::ListIndicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the job executions for a job. Requires permission to access the ListJobExecutionsForJob
      # action.

      def list_job_executions_for_job(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListJobExecutionsForJobRequest.new(job_id: job_id, max_results: max_results, next_token: next_token, status: status)
        list_job_executions_for_job(input)
      end

      def list_job_executions_for_job(input : Types::ListJobExecutionsForJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_EXECUTIONS_FOR_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the job executions for the specified thing. Requires permission to access the
      # ListJobExecutionsForThing action.

      def list_job_executions_for_thing(
        thing_name : String,
        job_id : String? = nil,
        max_results : Int32? = nil,
        namespace_id : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListJobExecutionsForThingRequest.new(thing_name: thing_name, job_id: job_id, max_results: max_results, namespace_id: namespace_id, next_token: next_token, status: status)
        list_job_executions_for_thing(input)
      end

      def list_job_executions_for_thing(input : Types::ListJobExecutionsForThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_EXECUTIONS_FOR_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of job templates. Requires permission to access the ListJobTemplates action.

      def list_job_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobTemplatesRequest.new(max_results: max_results, next_token: next_token)
        list_job_templates(input)
      end

      def list_job_templates(input : Types::ListJobTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists jobs. Requires permission to access the ListJobs action.

      def list_jobs(
        max_results : Int32? = nil,
        namespace_id : String? = nil,
        next_token : String? = nil,
        status : String? = nil,
        target_selection : String? = nil,
        thing_group_id : String? = nil,
        thing_group_name : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsRequest.new(max_results: max_results, namespace_id: namespace_id, next_token: next_token, status: status, target_selection: target_selection, thing_group_id: thing_group_id, thing_group_name: thing_group_name)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of managed job templates.

      def list_managed_job_templates(
        max_results : Int32? = nil,
        next_token : String? = nil,
        template_name : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedJobTemplatesRequest.new(max_results: max_results, next_token: next_token, template_name: template_name)
        list_managed_job_templates(input)
      end

      def list_managed_job_templates(input : Types::ListManagedJobTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_JOB_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the values reported for an IoT Device Defender metric (device-side metric, cloud-side metric,
      # or custom metric) by the given thing during the specified time period.

      def list_metric_values(
        end_time : Time,
        metric_name : String,
        start_time : Time,
        thing_name : String,
        dimension_name : String? = nil,
        dimension_value_operator : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMetricValuesRequest.new(end_time: end_time, metric_name: metric_name, start_time: start_time, thing_name: thing_name, dimension_name: dimension_name, dimension_value_operator: dimension_value_operator, max_results: max_results, next_token: next_token)
        list_metric_values(input)
      end

      def list_metric_values(input : Types::ListMetricValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_METRIC_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of all mitigation actions that match the specified filter criteria. Requires permission
      # to access the ListMitigationActions action.

      def list_mitigation_actions(
        action_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMitigationActionsRequest.new(action_type: action_type, max_results: max_results, next_token: next_token)
        list_mitigation_actions(input)
      end

      def list_mitigation_actions(input : Types::ListMitigationActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MITIGATION_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists OTA updates. Requires permission to access the ListOTAUpdates action.

      def list_ota_updates(
        max_results : Int32? = nil,
        next_token : String? = nil,
        ota_update_status : String? = nil
      ) : Protocol::Request
        input = Types::ListOTAUpdatesRequest.new(max_results: max_results, next_token: next_token, ota_update_status: ota_update_status)
        list_ota_updates(input)
      end

      def list_ota_updates(input : Types::ListOTAUpdatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OTA_UPDATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists certificates that are being transferred but not yet accepted. Requires permission to access
      # the ListOutgoingCertificates action.

      def list_outgoing_certificates(
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListOutgoingCertificatesRequest.new(ascending_order: ascending_order, marker: marker, page_size: page_size)
        list_outgoing_certificates(input)
      end

      def list_outgoing_certificates(input : Types::ListOutgoingCertificatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OUTGOING_CERTIFICATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the software package versions associated to the account. Requires permission to access the
      # ListPackageVersions action.

      def list_package_versions(
        package_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListPackageVersionsRequest.new(package_name: package_name, max_results: max_results, next_token: next_token, status: status)
        list_package_versions(input)
      end

      def list_package_versions(input : Types::ListPackageVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the software packages associated to the account. Requires permission to access the
      # ListPackages action.

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

      # Lists your policies. Requires permission to access the ListPolicies action.

      def list_policies(
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListPoliciesRequest.new(ascending_order: ascending_order, marker: marker, page_size: page_size)
        list_policies(input)
      end

      def list_policies(input : Types::ListPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the principals associated with the specified policy. Note: This action is deprecated and works
      # as expected for backward compatibility, but we won't add enhancements. Use ListTargetsForPolicy
      # instead. Requires permission to access the ListPolicyPrincipals action.

      def list_policy_principals(
        policy_name : String,
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListPolicyPrincipalsRequest.new(policy_name: policy_name, ascending_order: ascending_order, marker: marker, page_size: page_size)
        list_policy_principals(input)
      end

      def list_policy_principals(input : Types::ListPolicyPrincipalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_PRINCIPALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of the specified policy and identifies the default version. Requires permission
      # to access the ListPolicyVersions action.

      def list_policy_versions(
        policy_name : String
      ) : Protocol::Request
        input = Types::ListPolicyVersionsRequest.new(policy_name: policy_name)
        list_policy_versions(input)
      end

      def list_policy_versions(input : Types::ListPolicyVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the policies attached to the specified principal. If you use an Cognito identity, the ID must
      # be in AmazonCognito Identity format . Note: This action is deprecated and works as expected for
      # backward compatibility, but we won't add enhancements. Use ListAttachedPolicies instead. Requires
      # permission to access the ListPrincipalPolicies action.

      def list_principal_policies(
        principal : String,
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListPrincipalPoliciesRequest.new(principal: principal, ascending_order: ascending_order, marker: marker, page_size: page_size)
        list_principal_policies(input)
      end

      def list_principal_policies(input : Types::ListPrincipalPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRINCIPAL_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the things associated with the specified principal. A principal can be X.509 certificates, IAM
      # users, groups, and roles, Amazon Cognito identities or federated identities. Requires permission to
      # access the ListPrincipalThings action.

      def list_principal_things(
        principal : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPrincipalThingsRequest.new(principal: principal, max_results: max_results, next_token: next_token)
        list_principal_things(input)
      end

      def list_principal_things(input : Types::ListPrincipalThingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRINCIPAL_THINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the things associated with the specified principal. A principal can be an X.509 certificate or
      # an Amazon Cognito ID. Requires permission to access the ListPrincipalThings action.

      def list_principal_things_v2(
        principal : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        thing_principal_type : String? = nil
      ) : Protocol::Request
        input = Types::ListPrincipalThingsV2Request.new(principal: principal, max_results: max_results, next_token: next_token, thing_principal_type: thing_principal_type)
        list_principal_things_v2(input)
      end

      def list_principal_things_v2(input : Types::ListPrincipalThingsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRINCIPAL_THINGS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of provisioning template versions. Requires permission to access the
      # ListProvisioningTemplateVersions action.

      def list_provisioning_template_versions(
        template_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProvisioningTemplateVersionsRequest.new(template_name: template_name, max_results: max_results, next_token: next_token)
        list_provisioning_template_versions(input)
      end

      def list_provisioning_template_versions(input : Types::ListProvisioningTemplateVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROVISIONING_TEMPLATE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the provisioning templates in your Amazon Web Services account. Requires permission to access
      # the ListProvisioningTemplates action.

      def list_provisioning_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProvisioningTemplatesRequest.new(max_results: max_results, next_token: next_token)
        list_provisioning_templates(input)
      end

      def list_provisioning_templates(input : Types::ListProvisioningTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROVISIONING_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The related resources of an Audit finding. The following resources can be returned from calling this
      # API: DEVICE_CERTIFICATE CA_CERTIFICATE IOT_POLICY COGNITO_IDENTITY_POOL CLIENT_ID ACCOUNT_SETTINGS
      # ROLE_ALIAS IAM_ROLE ISSUER_CERTIFICATE This API is similar to DescribeAuditFinding's
      # RelatedResources but provides pagination and is not limited to 10 resources. When calling
      # DescribeAuditFinding for the intermediate CA revoked for active device certificates check,
      # RelatedResources will not be populated. You must use this API, ListRelatedResourcesForAuditFinding,
      # to list the certificates.

      def list_related_resources_for_audit_finding(
        finding_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRelatedResourcesForAuditFindingRequest.new(finding_id: finding_id, max_results: max_results, next_token: next_token)
        list_related_resources_for_audit_finding(input)
      end

      def list_related_resources_for_audit_finding(input : Types::ListRelatedResourcesForAuditFindingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RELATED_RESOURCES_FOR_AUDIT_FINDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the role aliases registered in your account. Requires permission to access the ListRoleAliases
      # action.

      def list_role_aliases(
        ascending_order : Bool? = nil,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListRoleAliasesRequest.new(ascending_order: ascending_order, marker: marker, page_size: page_size)
        list_role_aliases(input)
      end

      def list_role_aliases(input : Types::ListRoleAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROLE_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The validation results for all software bill of materials (SBOM) attached to a specific software
      # package version. Requires permission to access the ListSbomValidationResults action.

      def list_sbom_validation_results(
        package_name : String,
        version_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        validation_result : String? = nil
      ) : Protocol::Request
        input = Types::ListSbomValidationResultsRequest.new(package_name: package_name, version_name: version_name, max_results: max_results, next_token: next_token, validation_result: validation_result)
        list_sbom_validation_results(input)
      end

      def list_sbom_validation_results(input : Types::ListSbomValidationResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SBOM_VALIDATION_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of your scheduled audits. Requires permission to access the ListScheduledAudits action.

      def list_scheduled_audits(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScheduledAuditsRequest.new(max_results: max_results, next_token: next_token)
        list_scheduled_audits(input)
      end

      def list_scheduled_audits(input : Types::ListScheduledAuditsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEDULED_AUDITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Device Defender security profiles you've created. You can filter security profiles by
      # dimension or custom metric. Requires permission to access the ListSecurityProfiles action.
      # dimensionName and metricName cannot be used in the same request.

      def list_security_profiles(
        dimension_name : String? = nil,
        max_results : Int32? = nil,
        metric_name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityProfilesRequest.new(dimension_name: dimension_name, max_results: max_results, metric_name: metric_name, next_token: next_token)
        list_security_profiles(input)
      end

      def list_security_profiles(input : Types::ListSecurityProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Device Defender security profiles attached to a target (thing group). Requires permission
      # to access the ListSecurityProfilesForTarget action.

      def list_security_profiles_for_target(
        security_profile_target_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        recursive : Bool? = nil
      ) : Protocol::Request
        input = Types::ListSecurityProfilesForTargetRequest.new(security_profile_target_arn: security_profile_target_arn, max_results: max_results, next_token: next_token, recursive: recursive)
        list_security_profiles_for_target(input)
      end

      def list_security_profiles_for_target(input : Types::ListSecurityProfilesForTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_PROFILES_FOR_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the streams in your Amazon Web Services account. Requires permission to access the
      # ListStreams action.

      def list_streams(
        ascending_order : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamsRequest.new(ascending_order: ascending_order, max_results: max_results, next_token: next_token)
        list_streams(input)
      end

      def list_streams(input : Types::ListStreamsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags (metadata) you have assigned to the resource. Requires permission to access the
      # ListTagsForResource action.

      def list_tags_for_resource(
        resource_arn : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List targets for the specified policy. Requires permission to access the ListTargetsForPolicy
      # action.

      def list_targets_for_policy(
        policy_name : String,
        marker : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListTargetsForPolicyRequest.new(policy_name: policy_name, marker: marker, page_size: page_size)
        list_targets_for_policy(input)
      end

      def list_targets_for_policy(input : Types::ListTargetsForPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TARGETS_FOR_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the targets (thing groups) associated with a given Device Defender security profile. Requires
      # permission to access the ListTargetsForSecurityProfile action.

      def list_targets_for_security_profile(
        security_profile_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTargetsForSecurityProfileRequest.new(security_profile_name: security_profile_name, max_results: max_results, next_token: next_token)
        list_targets_for_security_profile(input)
      end

      def list_targets_for_security_profile(input : Types::ListTargetsForSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TARGETS_FOR_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the thing groups in your account. Requires permission to access the ListThingGroups action.

      def list_thing_groups(
        max_results : Int32? = nil,
        name_prefix_filter : String? = nil,
        next_token : String? = nil,
        parent_group : String? = nil,
        recursive : Bool? = nil
      ) : Protocol::Request
        input = Types::ListThingGroupsRequest.new(max_results: max_results, name_prefix_filter: name_prefix_filter, next_token: next_token, parent_group: parent_group, recursive: recursive)
        list_thing_groups(input)
      end

      def list_thing_groups(input : Types::ListThingGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THING_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the thing groups to which the specified thing belongs. Requires permission to access the
      # ListThingGroupsForThing action.

      def list_thing_groups_for_thing(
        thing_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThingGroupsForThingRequest.new(thing_name: thing_name, max_results: max_results, next_token: next_token)
        list_thing_groups_for_thing(input)
      end

      def list_thing_groups_for_thing(input : Types::ListThingGroupsForThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THING_GROUPS_FOR_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the principals associated with the specified thing. A principal can be X.509 certificates, IAM
      # users, groups, and roles, Amazon Cognito identities or federated identities. Requires permission to
      # access the ListThingPrincipals action.

      def list_thing_principals(
        thing_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThingPrincipalsRequest.new(thing_name: thing_name, max_results: max_results, next_token: next_token)
        list_thing_principals(input)
      end

      def list_thing_principals(input : Types::ListThingPrincipalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THING_PRINCIPALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the principals associated with the specified thing. A principal can be an X.509 certificate or
      # an Amazon Cognito ID. Requires permission to access the ListThingPrincipals action.

      def list_thing_principals_v2(
        thing_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        thing_principal_type : String? = nil
      ) : Protocol::Request
        input = Types::ListThingPrincipalsV2Request.new(thing_name: thing_name, max_results: max_results, next_token: next_token, thing_principal_type: thing_principal_type)
        list_thing_principals_v2(input)
      end

      def list_thing_principals_v2(input : Types::ListThingPrincipalsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THING_PRINCIPALS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Information about the thing registration tasks.

      def list_thing_registration_task_reports(
        report_type : String,
        task_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThingRegistrationTaskReportsRequest.new(report_type: report_type, task_id: task_id, max_results: max_results, next_token: next_token)
        list_thing_registration_task_reports(input)
      end

      def list_thing_registration_task_reports(input : Types::ListThingRegistrationTaskReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THING_REGISTRATION_TASK_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List bulk thing provisioning tasks. Requires permission to access the ListThingRegistrationTasks
      # action.

      def list_thing_registration_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListThingRegistrationTasksRequest.new(max_results: max_results, next_token: next_token, status: status)
        list_thing_registration_tasks(input)
      end

      def list_thing_registration_tasks(input : Types::ListThingRegistrationTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THING_REGISTRATION_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the existing thing types. Requires permission to access the ListThingTypes action.

      def list_thing_types(
        max_results : Int32? = nil,
        next_token : String? = nil,
        thing_type_name : String? = nil
      ) : Protocol::Request
        input = Types::ListThingTypesRequest.new(max_results: max_results, next_token: next_token, thing_type_name: thing_type_name)
        list_thing_types(input)
      end

      def list_thing_types(input : Types::ListThingTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THING_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your things. Use the attributeName and attributeValue parameters to filter your things. For
      # example, calling ListThings with attributeName=Color and attributeValue=Red retrieves all things in
      # the registry that contain an attribute Color with the value Red . For more information, see List
      # Things from the Amazon Web Services IoT Core Developer Guide . Requires permission to access the
      # ListThings action. You will not be charged for calling this API if an Access denied error is
      # returned. You will also not be charged if no attributes or pagination token was provided in request
      # and no pagination token and no results were returned.

      def list_things(
        attribute_name : String? = nil,
        attribute_value : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        thing_type_name : String? = nil,
        use_prefix_attribute_value : Bool? = nil
      ) : Protocol::Request
        input = Types::ListThingsRequest.new(attribute_name: attribute_name, attribute_value: attribute_value, max_results: max_results, next_token: next_token, thing_type_name: thing_type_name, use_prefix_attribute_value: use_prefix_attribute_value)
        list_things(input)
      end

      def list_things(input : Types::ListThingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the things you have added to the given billing group. Requires permission to access the
      # ListThingsInBillingGroup action.

      def list_things_in_billing_group(
        billing_group_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThingsInBillingGroupRequest.new(billing_group_name: billing_group_name, max_results: max_results, next_token: next_token)
        list_things_in_billing_group(input)
      end

      def list_things_in_billing_group(input : Types::ListThingsInBillingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THINGS_IN_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the things in the specified group. Requires permission to access the ListThingsInThingGroup
      # action.

      def list_things_in_thing_group(
        thing_group_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        recursive : Bool? = nil
      ) : Protocol::Request
        input = Types::ListThingsInThingGroupRequest.new(thing_group_name: thing_group_name, max_results: max_results, next_token: next_token, recursive: recursive)
        list_things_in_thing_group(input)
      end

      def list_things_in_thing_group(input : Types::ListThingsInThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THINGS_IN_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the topic rule destinations in your Amazon Web Services account. Requires permission to
      # access the ListTopicRuleDestinations action.

      def list_topic_rule_destinations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTopicRuleDestinationsRequest.new(max_results: max_results, next_token: next_token)
        list_topic_rule_destinations(input)
      end

      def list_topic_rule_destinations(input : Types::ListTopicRuleDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TOPIC_RULE_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the rules for the specific topic. Requires permission to access the ListTopicRules action.

      def list_topic_rules(
        max_results : Int32? = nil,
        next_token : String? = nil,
        rule_disabled : Bool? = nil,
        topic : String? = nil
      ) : Protocol::Request
        input = Types::ListTopicRulesRequest.new(max_results: max_results, next_token: next_token, rule_disabled: rule_disabled, topic: topic)
        list_topic_rules(input)
      end

      def list_topic_rules(input : Types::ListTopicRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TOPIC_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists logging levels. Requires permission to access the ListV2LoggingLevels action.

      def list_v2_logging_levels(
        max_results : Int32? = nil,
        next_token : String? = nil,
        target_type : String? = nil
      ) : Protocol::Request
        input = Types::ListV2LoggingLevelsRequest.new(max_results: max_results, next_token: next_token, target_type: target_type)
        list_v2_logging_levels(input)
      end

      def list_v2_logging_levels(input : Types::ListV2LoggingLevelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_V2_LOGGING_LEVELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Device Defender security profile violations discovered during the given time period. You
      # can use filters to limit the results to those alerts issued for a particular security profile,
      # behavior, or thing (device). Requires permission to access the ListViolationEvents action.

      def list_violation_events(
        end_time : Time,
        start_time : Time,
        behavior_criteria_type : String? = nil,
        list_suppressed_alerts : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        security_profile_name : String? = nil,
        thing_name : String? = nil,
        verification_state : String? = nil
      ) : Protocol::Request
        input = Types::ListViolationEventsRequest.new(end_time: end_time, start_time: start_time, behavior_criteria_type: behavior_criteria_type, list_suppressed_alerts: list_suppressed_alerts, max_results: max_results, next_token: next_token, security_profile_name: security_profile_name, thing_name: thing_name, verification_state: verification_state)
        list_violation_events(input)
      end

      def list_violation_events(input : Types::ListViolationEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIOLATION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Set a verification state and provide a description of that verification state on a violation (detect
      # alarm).

      def put_verification_state_on_violation(
        verification_state : String,
        violation_id : String,
        verification_state_description : String? = nil
      ) : Protocol::Request
        input = Types::PutVerificationStateOnViolationRequest.new(verification_state: verification_state, violation_id: violation_id, verification_state_description: verification_state_description)
        put_verification_state_on_violation(input)
      end

      def put_verification_state_on_violation(input : Types::PutVerificationStateOnViolationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_VERIFICATION_STATE_ON_VIOLATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers a CA certificate with Amazon Web Services IoT Core. There is no limit to the number of CA
      # certificates you can register in your Amazon Web Services account. You can register up to 10 CA
      # certificates with the same CA subject field per Amazon Web Services account. Requires permission to
      # access the RegisterCACertificate action.

      def register_ca_certificate(
        ca_certificate : String,
        allow_auto_registration : Bool? = nil,
        certificate_mode : String? = nil,
        registration_config : Types::RegistrationConfig? = nil,
        set_as_active : Bool? = nil,
        tags : Array(Types::Tag)? = nil,
        verification_certificate : String? = nil
      ) : Protocol::Request
        input = Types::RegisterCACertificateRequest.new(ca_certificate: ca_certificate, allow_auto_registration: allow_auto_registration, certificate_mode: certificate_mode, registration_config: registration_config, set_as_active: set_as_active, tags: tags, verification_certificate: verification_certificate)
        register_ca_certificate(input)
      end

      def register_ca_certificate(input : Types::RegisterCACertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CA_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers a device certificate with IoT in the same certificate mode as the signing CA. If you have
      # more than one CA certificate that has the same subject field, you must specify the CA certificate
      # that was used to sign the device certificate being registered. Requires permission to access the
      # RegisterCertificate action.

      def register_certificate(
        certificate_pem : String,
        ca_certificate_pem : String? = nil,
        set_as_active : Bool? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::RegisterCertificateRequest.new(certificate_pem: certificate_pem, ca_certificate_pem: ca_certificate_pem, set_as_active: set_as_active, status: status)
        register_certificate(input)
      end

      def register_certificate(input : Types::RegisterCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Register a certificate that does not have a certificate authority (CA). For supported certificates,
      # consult Certificate signing algorithms supported by IoT .

      def register_certificate_without_ca(
        certificate_pem : String,
        status : String? = nil
      ) : Protocol::Request
        input = Types::RegisterCertificateWithoutCARequest.new(certificate_pem: certificate_pem, status: status)
        register_certificate_without_ca(input)
      end

      def register_certificate_without_ca(input : Types::RegisterCertificateWithoutCARequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CERTIFICATE_WITHOUT_CA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provisions a thing in the device registry. RegisterThing calls other IoT control plane APIs. These
      # calls might exceed your account level IoT Throttling Limits and cause throttle errors. Please
      # contact Amazon Web Services Customer Support to raise your throttling limits if necessary. Requires
      # permission to access the RegisterThing action.

      def register_thing(
        template_body : String,
        parameters : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::RegisterThingRequest.new(template_body: template_body, parameters: parameters)
        register_thing(input)
      end

      def register_thing(input : Types::RegisterThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rejects a pending certificate transfer. After IoT rejects a certificate transfer, the certificate
      # status changes from PENDING_TRANSFER to INACTIVE . To check for pending certificate transfers, call
      # ListCertificates to enumerate your certificates. This operation can only be called by the transfer
      # destination. After it is called, the certificate will be returned to the source's account in the
      # INACTIVE state. Requires permission to access the RejectCertificateTransfer action.

      def reject_certificate_transfer(
        certificate_id : String,
        reject_reason : String? = nil
      ) : Protocol::Request
        input = Types::RejectCertificateTransferRequest.new(certificate_id: certificate_id, reject_reason: reject_reason)
        reject_certificate_transfer(input)
      end

      def reject_certificate_transfer(input : Types::RejectCertificateTransferRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_CERTIFICATE_TRANSFER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the given thing from the billing group. Requires permission to access the
      # RemoveThingFromBillingGroup action. This call is asynchronous. It might take several seconds for the
      # detachment to propagate.

      def remove_thing_from_billing_group(
        billing_group_arn : String? = nil,
        billing_group_name : String? = nil,
        thing_arn : String? = nil,
        thing_name : String? = nil
      ) : Protocol::Request
        input = Types::RemoveThingFromBillingGroupRequest.new(billing_group_arn: billing_group_arn, billing_group_name: billing_group_name, thing_arn: thing_arn, thing_name: thing_name)
        remove_thing_from_billing_group(input)
      end

      def remove_thing_from_billing_group(input : Types::RemoveThingFromBillingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_THING_FROM_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove the specified thing from the specified group. You must specify either a thingGroupArn or a
      # thingGroupName to identify the thing group and either a thingArn or a thingName to identify the
      # thing to remove from the thing group. Requires permission to access the RemoveThingFromThingGroup
      # action.

      def remove_thing_from_thing_group(
        thing_arn : String? = nil,
        thing_group_arn : String? = nil,
        thing_group_name : String? = nil,
        thing_name : String? = nil
      ) : Protocol::Request
        input = Types::RemoveThingFromThingGroupRequest.new(thing_arn: thing_arn, thing_group_arn: thing_group_arn, thing_group_name: thing_group_name, thing_name: thing_name)
        remove_thing_from_thing_group(input)
      end

      def remove_thing_from_thing_group(input : Types::RemoveThingFromThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_THING_FROM_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Replaces the rule. You must specify all parameters for the new rule. Creating rules is an
      # administrator-level action. Any user who has permission to create rules will be able to access data
      # processed by the rule. Requires permission to access the ReplaceTopicRule action.

      def replace_topic_rule(
        rule_name : String,
        topic_rule_payload : Types::TopicRulePayload
      ) : Protocol::Request
        input = Types::ReplaceTopicRuleRequest.new(rule_name: rule_name, topic_rule_payload: topic_rule_payload)
        replace_topic_rule(input)
      end

      def replace_topic_rule(input : Types::ReplaceTopicRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REPLACE_TOPIC_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The query search index. Requires permission to access the SearchIndex action.

      def search_index(
        query_string : String,
        index_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        query_version : String? = nil
      ) : Protocol::Request
        input = Types::SearchIndexRequest.new(query_string: query_string, index_name: index_name, max_results: max_results, next_token: next_token, query_version: query_version)
        search_index(input)
      end

      def search_index(input : Types::SearchIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the default authorizer. This will be used if a websocket connection is made without specifying
      # an authorizer. Requires permission to access the SetDefaultAuthorizer action.

      def set_default_authorizer(
        authorizer_name : String
      ) : Protocol::Request
        input = Types::SetDefaultAuthorizerRequest.new(authorizer_name: authorizer_name)
        set_default_authorizer(input)
      end

      def set_default_authorizer(input : Types::SetDefaultAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_DEFAULT_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the specified version of the specified policy as the policy's default (operative) version. This
      # action affects all certificates to which the policy is attached. To list the principals the policy
      # is attached to, use the ListPrincipalPolicies action. Requires permission to access the
      # SetDefaultPolicyVersion action.

      def set_default_policy_version(
        policy_name : String,
        policy_version_id : String
      ) : Protocol::Request
        input = Types::SetDefaultPolicyVersionRequest.new(policy_name: policy_name, policy_version_id: policy_version_id)
        set_default_policy_version(input)
      end

      def set_default_policy_version(input : Types::SetDefaultPolicyVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_DEFAULT_POLICY_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the logging options. NOTE: use of this command is not recommended. Use SetV2LoggingOptions
      # instead. Requires permission to access the SetLoggingOptions action.

      def set_logging_options(
        logging_options_payload : Types::LoggingOptionsPayload
      ) : Protocol::Request
        input = Types::SetLoggingOptionsRequest.new(logging_options_payload: logging_options_payload)
        set_logging_options(input)
      end

      def set_logging_options(input : Types::SetLoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the logging level. Requires permission to access the SetV2LoggingLevel action.

      def set_v2_logging_level(
        log_level : String,
        log_target : Types::LogTarget
      ) : Protocol::Request
        input = Types::SetV2LoggingLevelRequest.new(log_level: log_level, log_target: log_target)
        set_v2_logging_level(input)
      end

      def set_v2_logging_level(input : Types::SetV2LoggingLevelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_V2_LOGGING_LEVEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the logging options for the V2 logging service. Requires permission to access the
      # SetV2LoggingOptions action.

      def set_v2_logging_options(
        default_log_level : String? = nil,
        disable_all_logs : Bool? = nil,
        event_configurations : Array(Types::LogEventConfiguration)? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::SetV2LoggingOptionsRequest.new(default_log_level: default_log_level, disable_all_logs: disable_all_logs, event_configurations: event_configurations, role_arn: role_arn)
        set_v2_logging_options(input)
      end

      def set_v2_logging_options(input : Types::SetV2LoggingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_V2_LOGGING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a task that applies a set of mitigation actions to the specified target. Requires permission
      # to access the StartAuditMitigationActionsTask action.

      def start_audit_mitigation_actions_task(
        audit_check_to_actions_mapping : Hash(String, Array(String)),
        client_request_token : String,
        target : Types::AuditMitigationActionsTaskTarget,
        task_id : String
      ) : Protocol::Request
        input = Types::StartAuditMitigationActionsTaskRequest.new(audit_check_to_actions_mapping: audit_check_to_actions_mapping, client_request_token: client_request_token, target: target, task_id: task_id)
        start_audit_mitigation_actions_task(input)
      end

      def start_audit_mitigation_actions_task(input : Types::StartAuditMitigationActionsTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_AUDIT_MITIGATION_ACTIONS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a Device Defender ML Detect mitigation actions task. Requires permission to access the
      # StartDetectMitigationActionsTask action.

      def start_detect_mitigation_actions_task(
        actions : Array(String),
        client_request_token : String,
        target : Types::DetectMitigationActionsTaskTarget,
        task_id : String,
        include_only_active_violations : Bool? = nil,
        include_suppressed_alerts : Bool? = nil,
        violation_event_occurrence_range : Types::ViolationEventOccurrenceRange? = nil
      ) : Protocol::Request
        input = Types::StartDetectMitigationActionsTaskRequest.new(actions: actions, client_request_token: client_request_token, target: target, task_id: task_id, include_only_active_violations: include_only_active_violations, include_suppressed_alerts: include_suppressed_alerts, violation_event_occurrence_range: violation_event_occurrence_range)
        start_detect_mitigation_actions_task(input)
      end

      def start_detect_mitigation_actions_task(input : Types::StartDetectMitigationActionsTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DETECT_MITIGATION_ACTIONS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an on-demand Device Defender audit. Requires permission to access the StartOnDemandAuditTask
      # action.

      def start_on_demand_audit_task(
        target_check_names : Array(String)
      ) : Protocol::Request
        input = Types::StartOnDemandAuditTaskRequest.new(target_check_names: target_check_names)
        start_on_demand_audit_task(input)
      end

      def start_on_demand_audit_task(input : Types::StartOnDemandAuditTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ON_DEMAND_AUDIT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a bulk thing provisioning task. Requires permission to access the StartThingRegistrationTask
      # action.

      def start_thing_registration_task(
        input_file_bucket : String,
        input_file_key : String,
        role_arn : String,
        template_body : String
      ) : Protocol::Request
        input = Types::StartThingRegistrationTaskRequest.new(input_file_bucket: input_file_bucket, input_file_key: input_file_key, role_arn: role_arn, template_body: template_body)
        start_thing_registration_task(input)
      end

      def start_thing_registration_task(input : Types::StartThingRegistrationTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_THING_REGISTRATION_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a bulk thing provisioning task. Requires permission to access the StopThingRegistrationTask
      # action.

      def stop_thing_registration_task(
        task_id : String
      ) : Protocol::Request
        input = Types::StopThingRegistrationTaskRequest.new(task_id: task_id)
        stop_thing_registration_task(input)
      end

      def stop_thing_registration_task(input : Types::StopThingRegistrationTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_THING_REGISTRATION_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds to or modifies the tags of the given resource. Tags are metadata which can be used to manage a
      # resource. Requires permission to access the TagResource action.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tests if a specified principal is authorized to perform an IoT action on a specified resource. Use
      # this to test and debug the authorization behavior of devices that connect to the IoT device gateway.
      # Requires permission to access the TestAuthorization action.

      def test_authorization(
        auth_infos : Array(Types::AuthInfo),
        client_id : String? = nil,
        cognito_identity_pool_id : String? = nil,
        policy_names_to_add : Array(String)? = nil,
        policy_names_to_skip : Array(String)? = nil,
        principal : String? = nil
      ) : Protocol::Request
        input = Types::TestAuthorizationRequest.new(auth_infos: auth_infos, client_id: client_id, cognito_identity_pool_id: cognito_identity_pool_id, policy_names_to_add: policy_names_to_add, policy_names_to_skip: policy_names_to_skip, principal: principal)
        test_authorization(input)
      end

      def test_authorization(input : Types::TestAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tests a custom authorization behavior by invoking a specified custom authorizer. Use this to test
      # and debug the custom authorization behavior of devices that connect to the IoT device gateway.
      # Requires permission to access the TestInvokeAuthorizer action.

      def test_invoke_authorizer(
        authorizer_name : String,
        http_context : Types::HttpContext? = nil,
        mqtt_context : Types::MqttContext? = nil,
        tls_context : Types::TlsContext? = nil,
        token : String? = nil,
        token_signature : String? = nil
      ) : Protocol::Request
        input = Types::TestInvokeAuthorizerRequest.new(authorizer_name: authorizer_name, http_context: http_context, mqtt_context: mqtt_context, tls_context: tls_context, token: token, token_signature: token_signature)
        test_invoke_authorizer(input)
      end

      def test_invoke_authorizer(input : Types::TestInvokeAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_INVOKE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Transfers the specified certificate to the specified Amazon Web Services account. Requires
      # permission to access the TransferCertificate action. You can cancel the transfer until it is
      # accepted by the recipient. No notification is sent to the transfer destination's account. The caller
      # is responsible for notifying the transfer target. The certificate being transferred must not be in
      # the ACTIVE state. You can use the UpdateCertificate action to deactivate it. The certificate must
      # not have any policies attached to it. You can use the DetachPolicy action to detach them. Customer
      # managed key behavior: When you use a customer managed key to encrypt your data and then transfer the
      # certificate to a customer in a different account using the TransferCertificate operation, the
      # certificates will no longer be encrypted by their customer managed key configuration. During the
      # transfer process, certificates are encrypted using Amazon Web Services IoT Core owned keys. While a
      # certificate is in the PENDING_TRANSFER state, it's always protected by Amazon Web Services IoT Core
      # owned keys, regardless of the customer managed key configuration of either the source or destination
      # account. Once the transfer is completed through AcceptCertificateTransfer ,
      # RejectCertificateTransfer , or CancelCertificateTransfer , the certificate will be protected by the
      # customer managed key configuration of the account that owns the certificate after the transfer
      # operation: If the transfer is accepted: The certificate is encrypted by the target account's
      # customer managed key configuration. If the transfer is rejected or cancelled: The certificate is
      # protected by the source account's customer managed key configuration.

      def transfer_certificate(
        certificate_id : String,
        target_aws_account : String,
        transfer_message : String? = nil
      ) : Protocol::Request
        input = Types::TransferCertificateRequest.new(certificate_id: certificate_id, target_aws_account: target_aws_account, transfer_message: transfer_message)
        transfer_certificate(input)
      end

      def transfer_certificate(input : Types::TransferCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TRANSFER_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the given tags (metadata) from the resource. Requires permission to access the UntagResource
      # action.

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

      # Configures or reconfigures the Device Defender audit settings for this account. Settings include how
      # audit notifications are sent and which audit checks are enabled or disabled. Requires permission to
      # access the UpdateAccountAuditConfiguration action.

      def update_account_audit_configuration(
        audit_check_configurations : Hash(String, Types::AuditCheckConfiguration)? = nil,
        audit_notification_target_configurations : Hash(String, Types::AuditNotificationTarget)? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountAuditConfigurationRequest.new(audit_check_configurations: audit_check_configurations, audit_notification_target_configurations: audit_notification_target_configurations, role_arn: role_arn)
        update_account_audit_configuration(input)
      end

      def update_account_audit_configuration(input : Types::UpdateAccountAuditConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_AUDIT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Device Defender audit suppression.

      def update_audit_suppression(
        check_name : String,
        resource_identifier : Types::ResourceIdentifier,
        description : String? = nil,
        expiration_date : Time? = nil,
        suppress_indefinitely : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateAuditSuppressionRequest.new(check_name: check_name, resource_identifier: resource_identifier, description: description, expiration_date: expiration_date, suppress_indefinitely: suppress_indefinitely)
        update_audit_suppression(input)
      end

      def update_audit_suppression(input : Types::UpdateAuditSuppressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUDIT_SUPPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an authorizer. Requires permission to access the UpdateAuthorizer action.

      def update_authorizer(
        authorizer_name : String,
        authorizer_function_arn : String? = nil,
        enable_caching_for_http : Bool? = nil,
        status : String? = nil,
        token_key_name : String? = nil,
        token_signing_public_keys : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateAuthorizerRequest.new(authorizer_name: authorizer_name, authorizer_function_arn: authorizer_function_arn, enable_caching_for_http: enable_caching_for_http, status: status, token_key_name: token_key_name, token_signing_public_keys: token_signing_public_keys)
        update_authorizer(input)
      end

      def update_authorizer(input : Types::UpdateAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates information about the billing group. Requires permission to access the UpdateBillingGroup
      # action.

      def update_billing_group(
        billing_group_name : String,
        billing_group_properties : Types::BillingGroupProperties,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateBillingGroupRequest.new(billing_group_name: billing_group_name, billing_group_properties: billing_group_properties, expected_version: expected_version)
        update_billing_group(input)
      end

      def update_billing_group(input : Types::UpdateBillingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BILLING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a registered CA certificate. Requires permission to access the UpdateCACertificate action.

      def update_ca_certificate(
        certificate_id : String,
        new_auto_registration_status : String? = nil,
        new_status : String? = nil,
        registration_config : Types::RegistrationConfig? = nil,
        remove_auto_registration : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateCACertificateRequest.new(certificate_id: certificate_id, new_auto_registration_status: new_auto_registration_status, new_status: new_status, registration_config: registration_config, remove_auto_registration: remove_auto_registration)
        update_ca_certificate(input)
      end

      def update_ca_certificate(input : Types::UpdateCACertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CA_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of the specified certificate. This operation is idempotent. Requires permission
      # to access the UpdateCertificate action. Certificates must be in the ACTIVE state to authenticate
      # devices that use a certificate to connect to IoT. Within a few minutes of updating a certificate
      # from the ACTIVE state to any other state, IoT disconnects all devices that used that certificate to
      # connect. Devices cannot use a certificate that is not in the ACTIVE state to reconnect.

      def update_certificate(
        certificate_id : String,
        new_status : String
      ) : Protocol::Request
        input = Types::UpdateCertificateRequest.new(certificate_id: certificate_id, new_status: new_status)
        update_certificate(input)
      end

      def update_certificate(input : Types::UpdateCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a certificate provider. Requires permission to access the UpdateCertificateProvider action.

      def update_certificate_provider(
        certificate_provider_name : String,
        account_default_for_operations : Array(String)? = nil,
        lambda_function_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCertificateProviderRequest.new(certificate_provider_name: certificate_provider_name, account_default_for_operations: account_default_for_operations, lambda_function_arn: lambda_function_arn)
        update_certificate_provider(input)
      end

      def update_certificate_provider(input : Types::UpdateCertificateProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CERTIFICATE_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update information about a command or mark a command for deprecation.

      def update_command(
        command_id : String,
        deprecated : Bool? = nil,
        description : String? = nil,
        display_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCommandRequest.new(command_id: command_id, deprecated: deprecated, description: description, display_name: display_name)
        update_command(input)
      end

      def update_command(input : Types::UpdateCommandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_COMMAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Device Defender detect custom metric. Requires permission to access the UpdateCustomMetric
      # action.

      def update_custom_metric(
        display_name : String,
        metric_name : String
      ) : Protocol::Request
        input = Types::UpdateCustomMetricRequest.new(display_name: display_name, metric_name: metric_name)
        update_custom_metric(input)
      end

      def update_custom_metric(input : Types::UpdateCustomMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CUSTOM_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the definition for a dimension. You cannot change the type of a dimension after it is
      # created (you can delete it and recreate it). Requires permission to access the UpdateDimension
      # action.

      def update_dimension(
        name : String,
        string_values : Array(String)
      ) : Protocol::Request
        input = Types::UpdateDimensionRequest.new(name: name, string_values: string_values)
        update_dimension(input)
      end

      def update_dimension(input : Types::UpdateDimensionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DIMENSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates values stored in the domain configuration. Domain configurations for default endpoints can't
      # be updated. Requires permission to access the UpdateDomainConfiguration action.

      def update_domain_configuration(
        domain_configuration_name : String,
        application_protocol : String? = nil,
        authentication_type : String? = nil,
        authorizer_config : Types::AuthorizerConfig? = nil,
        client_certificate_config : Types::ClientCertificateConfig? = nil,
        domain_configuration_status : String? = nil,
        remove_authorizer_config : Bool? = nil,
        server_certificate_config : Types::ServerCertificateConfig? = nil,
        tls_config : Types::TlsConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainConfigurationRequest.new(domain_configuration_name: domain_configuration_name, application_protocol: application_protocol, authentication_type: authentication_type, authorizer_config: authorizer_config, client_certificate_config: client_certificate_config, domain_configuration_status: domain_configuration_status, remove_authorizer_config: remove_authorizer_config, server_certificate_config: server_certificate_config, tls_config: tls_config)
        update_domain_configuration(input)
      end

      def update_domain_configuration(input : Types::UpdateDomainConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a dynamic thing group. Requires permission to access the UpdateDynamicThingGroup action.

      def update_dynamic_thing_group(
        thing_group_name : String,
        thing_group_properties : Types::ThingGroupProperties,
        expected_version : Int64? = nil,
        index_name : String? = nil,
        query_string : String? = nil,
        query_version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDynamicThingGroupRequest.new(thing_group_name: thing_group_name, thing_group_properties: thing_group_properties, expected_version: expected_version, index_name: index_name, query_string: query_string, query_version: query_version)
        update_dynamic_thing_group(input)
      end

      def update_dynamic_thing_group(input : Types::UpdateDynamicThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DYNAMIC_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the encryption configuration. By default, Amazon Web Services IoT Core encrypts your data at
      # rest using Amazon Web Services owned keys. Amazon Web Services IoT Core also supports symmetric
      # customer managed keys from Key Management Service (KMS). With customer managed keys, you create,
      # own, and manage the KMS keys in your Amazon Web Services account. Before using this API, you must
      # set up permissions for Amazon Web Services IoT Core to access KMS. For more information, see Data
      # encryption at rest in the Amazon Web Services IoT Core Developer Guide .

      def update_encryption_configuration(
        encryption_type : String,
        kms_access_role_arn : String? = nil,
        kms_key_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEncryptionConfigurationRequest.new(encryption_type: encryption_type, kms_access_role_arn: kms_access_role_arn, kms_key_arn: kms_key_arn)
        update_encryption_configuration(input)
      end

      def update_encryption_configuration(input : Types::UpdateEncryptionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENCRYPTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the event configurations. Requires permission to access the UpdateEventConfigurations
      # action.

      def update_event_configurations(
        event_configurations : Hash(String, Types::Configuration)? = nil
      ) : Protocol::Request
        input = Types::UpdateEventConfigurationsRequest.new(event_configurations: event_configurations)
        update_event_configurations(input)
      end

      def update_event_configurations(input : Types::UpdateEventConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the data for a fleet metric. Requires permission to access the UpdateFleetMetric action.

      def update_fleet_metric(
        index_name : String,
        metric_name : String,
        aggregation_field : String? = nil,
        aggregation_type : Types::AggregationType? = nil,
        description : String? = nil,
        expected_version : Int64? = nil,
        period : Int32? = nil,
        query_string : String? = nil,
        query_version : String? = nil,
        unit : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFleetMetricRequest.new(index_name: index_name, metric_name: metric_name, aggregation_field: aggregation_field, aggregation_type: aggregation_type, description: description, expected_version: expected_version, period: period, query_string: query_string, query_version: query_version, unit: unit)
        update_fleet_metric(input)
      end

      def update_fleet_metric(input : Types::UpdateFleetMetricRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLEET_METRIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the search configuration. Requires permission to access the UpdateIndexingConfiguration
      # action.

      def update_indexing_configuration(
        thing_group_indexing_configuration : Types::ThingGroupIndexingConfiguration? = nil,
        thing_indexing_configuration : Types::ThingIndexingConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateIndexingConfigurationRequest.new(thing_group_indexing_configuration: thing_group_indexing_configuration, thing_indexing_configuration: thing_indexing_configuration)
        update_indexing_configuration(input)
      end

      def update_indexing_configuration(input : Types::UpdateIndexingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INDEXING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates supported fields of the specified job. Requires permission to access the UpdateJob action.

      def update_job(
        job_id : String,
        abort_config : Types::AbortConfig? = nil,
        description : String? = nil,
        job_executions_retry_config : Types::JobExecutionsRetryConfig? = nil,
        job_executions_rollout_config : Types::JobExecutionsRolloutConfig? = nil,
        namespace_id : String? = nil,
        presigned_url_config : Types::PresignedUrlConfig? = nil,
        timeout_config : Types::TimeoutConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateJobRequest.new(job_id: job_id, abort_config: abort_config, description: description, job_executions_retry_config: job_executions_retry_config, job_executions_rollout_config: job_executions_rollout_config, namespace_id: namespace_id, presigned_url_config: presigned_url_config, timeout_config: timeout_config)
        update_job(input)
      end

      def update_job(input : Types::UpdateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the definition for the specified mitigation action. Requires permission to access the
      # UpdateMitigationAction action.

      def update_mitigation_action(
        action_name : String,
        action_params : Types::MitigationActionParams? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMitigationActionRequest.new(action_name: action_name, action_params: action_params, role_arn: role_arn)
        update_mitigation_action(input)
      end

      def update_mitigation_action(input : Types::UpdateMitigationActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MITIGATION_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the supported fields for a specific software package. Requires permission to access the
      # UpdatePackage and GetIndexingConfiguration actions.

      def update_package(
        package_name : String,
        client_token : String? = nil,
        default_version_name : String? = nil,
        description : String? = nil,
        unset_default_version : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageRequest.new(package_name: package_name, client_token: client_token, default_version_name: default_version_name, description: description, unset_default_version: unset_default_version)
        update_package(input)
      end

      def update_package(input : Types::UpdatePackageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the software package configuration. Requires permission to access the
      # UpdatePackageConfiguration and iam:PassRole actions.

      def update_package_configuration(
        client_token : String? = nil,
        version_update_by_jobs_config : Types::VersionUpdateByJobsConfig? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageConfigurationRequest.new(client_token: client_token, version_update_by_jobs_config: version_update_by_jobs_config)
        update_package_configuration(input)
      end

      def update_package_configuration(input : Types::UpdatePackageConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the supported fields for a specific package version. Requires permission to access the
      # UpdatePackageVersion and GetIndexingConfiguration actions.

      def update_package_version(
        package_name : String,
        version_name : String,
        action : String? = nil,
        artifact : Types::PackageVersionArtifact? = nil,
        attributes : Hash(String, String)? = nil,
        client_token : String? = nil,
        description : String? = nil,
        recipe : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePackageVersionRequest.new(package_name: package_name, version_name: version_name, action: action, artifact: artifact, attributes: attributes, client_token: client_token, description: description, recipe: recipe)
        update_package_version(input)
      end

      def update_package_version(input : Types::UpdatePackageVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a provisioning template. Requires permission to access the UpdateProvisioningTemplate
      # action.

      def update_provisioning_template(
        template_name : String,
        default_version_id : Int32? = nil,
        description : String? = nil,
        enabled : Bool? = nil,
        pre_provisioning_hook : Types::ProvisioningHook? = nil,
        provisioning_role_arn : String? = nil,
        remove_pre_provisioning_hook : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateProvisioningTemplateRequest.new(template_name: template_name, default_version_id: default_version_id, description: description, enabled: enabled, pre_provisioning_hook: pre_provisioning_hook, provisioning_role_arn: provisioning_role_arn, remove_pre_provisioning_hook: remove_pre_provisioning_hook)
        update_provisioning_template(input)
      end

      def update_provisioning_template(input : Types::UpdateProvisioningTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROVISIONING_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a role alias. Requires permission to access the UpdateRoleAlias action. The value of
      # credentialDurationSeconds must be less than or equal to the maximum session duration of the IAM role
      # that the role alias references. For more information, see Modifying a role maximum session duration
      # (Amazon Web Services API) from the Amazon Web Services Identity and Access Management User Guide.

      def update_role_alias(
        role_alias : String,
        credential_duration_seconds : Int32? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRoleAliasRequest.new(role_alias: role_alias, credential_duration_seconds: credential_duration_seconds, role_arn: role_arn)
        update_role_alias(input)
      end

      def update_role_alias(input : Types::UpdateRoleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROLE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a scheduled audit, including which checks are performed and how often the audit takes place.
      # Requires permission to access the UpdateScheduledAudit action.

      def update_scheduled_audit(
        scheduled_audit_name : String,
        day_of_month : String? = nil,
        day_of_week : String? = nil,
        frequency : String? = nil,
        target_check_names : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateScheduledAuditRequest.new(scheduled_audit_name: scheduled_audit_name, day_of_month: day_of_month, day_of_week: day_of_week, frequency: frequency, target_check_names: target_check_names)
        update_scheduled_audit(input)
      end

      def update_scheduled_audit(input : Types::UpdateScheduledAuditRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEDULED_AUDIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Device Defender security profile. Requires permission to access the UpdateSecurityProfile
      # action.

      def update_security_profile(
        security_profile_name : String,
        additional_metrics_to_retain : Array(String)? = nil,
        additional_metrics_to_retain_v2 : Array(Types::MetricToRetain)? = nil,
        alert_targets : Hash(String, Types::AlertTarget)? = nil,
        behaviors : Array(Types::Behavior)? = nil,
        delete_additional_metrics_to_retain : Bool? = nil,
        delete_alert_targets : Bool? = nil,
        delete_behaviors : Bool? = nil,
        delete_metrics_export_config : Bool? = nil,
        expected_version : Int64? = nil,
        metrics_export_config : Types::MetricsExportConfig? = nil,
        security_profile_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSecurityProfileRequest.new(security_profile_name: security_profile_name, additional_metrics_to_retain: additional_metrics_to_retain, additional_metrics_to_retain_v2: additional_metrics_to_retain_v2, alert_targets: alert_targets, behaviors: behaviors, delete_additional_metrics_to_retain: delete_additional_metrics_to_retain, delete_alert_targets: delete_alert_targets, delete_behaviors: delete_behaviors, delete_metrics_export_config: delete_metrics_export_config, expected_version: expected_version, metrics_export_config: metrics_export_config, security_profile_description: security_profile_description)
        update_security_profile(input)
      end

      def update_security_profile(input : Types::UpdateSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing stream. The stream version will be incremented by one. Requires permission to
      # access the UpdateStream action.

      def update_stream(
        stream_id : String,
        description : String? = nil,
        files : Array(Types::StreamFile)? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateStreamRequest.new(stream_id: stream_id, description: description, files: files, role_arn: role_arn)
        update_stream(input)
      end

      def update_stream(input : Types::UpdateStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the data for a thing. Requires permission to access the UpdateThing action.

      def update_thing(
        thing_name : String,
        attribute_payload : Types::AttributePayload? = nil,
        expected_version : Int64? = nil,
        remove_thing_type : Bool? = nil,
        thing_type_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateThingRequest.new(thing_name: thing_name, attribute_payload: attribute_payload, expected_version: expected_version, remove_thing_type: remove_thing_type, thing_type_name: thing_type_name)
        update_thing(input)
      end

      def update_thing(input : Types::UpdateThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a thing group. Requires permission to access the UpdateThingGroup action.

      def update_thing_group(
        thing_group_name : String,
        thing_group_properties : Types::ThingGroupProperties,
        expected_version : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateThingGroupRequest.new(thing_group_name: thing_group_name, thing_group_properties: thing_group_properties, expected_version: expected_version)
        update_thing_group(input)
      end

      def update_thing_group(input : Types::UpdateThingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the groups to which the thing belongs. Requires permission to access the
      # UpdateThingGroupsForThing action.

      def update_thing_groups_for_thing(
        override_dynamic_groups : Bool? = nil,
        thing_groups_to_add : Array(String)? = nil,
        thing_groups_to_remove : Array(String)? = nil,
        thing_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateThingGroupsForThingRequest.new(override_dynamic_groups: override_dynamic_groups, thing_groups_to_add: thing_groups_to_add, thing_groups_to_remove: thing_groups_to_remove, thing_name: thing_name)
        update_thing_groups_for_thing(input)
      end

      def update_thing_groups_for_thing(input : Types::UpdateThingGroupsForThingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THING_GROUPS_FOR_THING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a thing type.

      def update_thing_type(
        thing_type_name : String,
        thing_type_properties : Types::ThingTypeProperties? = nil
      ) : Protocol::Request
        input = Types::UpdateThingTypeRequest.new(thing_type_name: thing_type_name, thing_type_properties: thing_type_properties)
        update_thing_type(input)
      end

      def update_thing_type(input : Types::UpdateThingTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THING_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a topic rule destination. You use this to change the status, endpoint URL, or confirmation
      # URL of the destination. Requires permission to access the UpdateTopicRuleDestination action.

      def update_topic_rule_destination(
        arn : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateTopicRuleDestinationRequest.new(arn: arn, status: status)
        update_topic_rule_destination(input)
      end

      def update_topic_rule_destination(input : Types::UpdateTopicRuleDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TOPIC_RULE_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Validates a Device Defender security profile behaviors specification. Requires permission to access
      # the ValidateSecurityProfileBehaviors action.

      def validate_security_profile_behaviors(
        behaviors : Array(Types::Behavior)
      ) : Protocol::Request
        input = Types::ValidateSecurityProfileBehaviorsRequest.new(behaviors: behaviors)
        validate_security_profile_behaviors(input)
      end

      def validate_security_profile_behaviors(input : Types::ValidateSecurityProfileBehaviorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_SECURITY_PROFILE_BEHAVIORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
