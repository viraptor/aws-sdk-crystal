module Aws
  module RedshiftServerless
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

      # Converts a recovery point to a snapshot. For more information about recovery points and snapshots,
      # see Working with snapshots and recovery points .

      def convert_recovery_point_to_snapshot(
        recovery_point_id : String,
        snapshot_name : String,
        retention_period : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ConvertRecoveryPointToSnapshotResponse

        input = Types::ConvertRecoveryPointToSnapshotRequest.new(recovery_point_id: recovery_point_id, snapshot_name: snapshot_name, retention_period: retention_period, tags: tags)
        convert_recovery_point_to_snapshot(input)
      end

      def convert_recovery_point_to_snapshot(input : Types::ConvertRecoveryPointToSnapshotRequest) : Types::ConvertRecoveryPointToSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::CONVERT_RECOVERY_POINT_TO_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ConvertRecoveryPointToSnapshotResponse, "ConvertRecoveryPointToSnapshot")
      end

      # Creates a custom domain association for Amazon Redshift Serverless.

      def create_custom_domain_association(
        custom_domain_certificate_arn : String,
        custom_domain_name : String,
        workgroup_name : String
      ) : Types::CreateCustomDomainAssociationResponse

        input = Types::CreateCustomDomainAssociationRequest.new(custom_domain_certificate_arn: custom_domain_certificate_arn, custom_domain_name: custom_domain_name, workgroup_name: workgroup_name)
        create_custom_domain_association(input)
      end

      def create_custom_domain_association(input : Types::CreateCustomDomainAssociationRequest) : Types::CreateCustomDomainAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CUSTOM_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCustomDomainAssociationResponse, "CreateCustomDomainAssociation")
      end

      # Creates an Amazon Redshift Serverless managed VPC endpoint.

      def create_endpoint_access(
        endpoint_name : String,
        subnet_ids : Array(String),
        workgroup_name : String,
        owner_account : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateEndpointAccessResponse

        input = Types::CreateEndpointAccessRequest.new(endpoint_name: endpoint_name, subnet_ids: subnet_ids, workgroup_name: workgroup_name, owner_account: owner_account, vpc_security_group_ids: vpc_security_group_ids)
        create_endpoint_access(input)
      end

      def create_endpoint_access(input : Types::CreateEndpointAccessRequest) : Types::CreateEndpointAccessResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEndpointAccessResponse, "CreateEndpointAccess")
      end

      # Creates a namespace in Amazon Redshift Serverless.

      def create_namespace(
        namespace_name : String,
        admin_password_secret_kms_key_id : String? = nil,
        admin_user_password : String? = nil,
        admin_username : String? = nil,
        db_name : String? = nil,
        default_iam_role_arn : String? = nil,
        iam_roles : Array(String)? = nil,
        kms_key_id : String? = nil,
        log_exports : Array(String)? = nil,
        manage_admin_password : Bool? = nil,
        redshift_idc_application_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateNamespaceResponse

        input = Types::CreateNamespaceRequest.new(namespace_name: namespace_name, admin_password_secret_kms_key_id: admin_password_secret_kms_key_id, admin_user_password: admin_user_password, admin_username: admin_username, db_name: db_name, default_iam_role_arn: default_iam_role_arn, iam_roles: iam_roles, kms_key_id: kms_key_id, log_exports: log_exports, manage_admin_password: manage_admin_password, redshift_idc_application_arn: redshift_idc_application_arn, tags: tags)
        create_namespace(input)
      end

      def create_namespace(input : Types::CreateNamespaceRequest) : Types::CreateNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNamespaceResponse, "CreateNamespace")
      end

      # Creates an Amazon Redshift Serverless reservation, which gives you the option to commit to a
      # specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless
      # on-demand (OD) rates.

      def create_reservation(
        capacity : Int32,
        offering_id : String,
        client_token : String? = nil
      ) : Types::CreateReservationResponse

        input = Types::CreateReservationRequest.new(capacity: capacity, offering_id: offering_id, client_token: client_token)
        create_reservation(input)
      end

      def create_reservation(input : Types::CreateReservationRequest) : Types::CreateReservationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateReservationResponse, "CreateReservation")
      end

      # Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API
      # action. For example, you can create a schedule of when to run the CreateSnapshot API operation.

      def create_scheduled_action(
        namespace_name : String,
        role_arn : String,
        schedule : Types::Schedule,
        scheduled_action_name : String,
        target_action : Types::TargetAction,
        enabled : Bool? = nil,
        end_time : Time? = nil,
        scheduled_action_description : String? = nil,
        start_time : Time? = nil
      ) : Types::CreateScheduledActionResponse

        input = Types::CreateScheduledActionRequest.new(namespace_name: namespace_name, role_arn: role_arn, schedule: schedule, scheduled_action_name: scheduled_action_name, target_action: target_action, enabled: enabled, end_time: end_time, scheduled_action_description: scheduled_action_description, start_time: start_time)
        create_scheduled_action(input)
      end

      def create_scheduled_action(input : Types::CreateScheduledActionRequest) : Types::CreateScheduledActionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateScheduledActionResponse, "CreateScheduledAction")
      end

      # Creates a snapshot of all databases in a namespace. For more information about snapshots, see
      # Working with snapshots and recovery points .

      def create_snapshot(
        namespace_name : String,
        snapshot_name : String,
        retention_period : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSnapshotResponse

        input = Types::CreateSnapshotRequest.new(namespace_name: namespace_name, snapshot_name: snapshot_name, retention_period: retention_period, tags: tags)
        create_snapshot(input)
      end

      def create_snapshot(input : Types::CreateSnapshotRequest) : Types::CreateSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSnapshotResponse, "CreateSnapshot")
      end

      # Creates a snapshot copy configuration that lets you copy snapshots to another Amazon Web Services
      # Region.

      def create_snapshot_copy_configuration(
        destination_region : String,
        namespace_name : String,
        destination_kms_key_id : String? = nil,
        snapshot_retention_period : Int32? = nil
      ) : Types::CreateSnapshotCopyConfigurationResponse

        input = Types::CreateSnapshotCopyConfigurationRequest.new(destination_region: destination_region, namespace_name: namespace_name, destination_kms_key_id: destination_kms_key_id, snapshot_retention_period: snapshot_retention_period)
        create_snapshot_copy_configuration(input)
      end

      def create_snapshot_copy_configuration(input : Types::CreateSnapshotCopyConfigurationRequest) : Types::CreateSnapshotCopyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SNAPSHOT_COPY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSnapshotCopyConfigurationResponse, "CreateSnapshotCopyConfiguration")
      end

      # Creates a usage limit for a specified Amazon Redshift Serverless usage type. The usage limit is
      # identified by the returned usage limit identifier.

      def create_usage_limit(
        amount : Int64,
        resource_arn : String,
        usage_type : String,
        breach_action : String? = nil,
        period : String? = nil
      ) : Types::CreateUsageLimitResponse

        input = Types::CreateUsageLimitRequest.new(amount: amount, resource_arn: resource_arn, usage_type: usage_type, breach_action: breach_action, period: period)
        create_usage_limit(input)
      end

      def create_usage_limit(input : Types::CreateUsageLimitRequest) : Types::CreateUsageLimitResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USAGE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUsageLimitResponse, "CreateUsageLimit")
      end

      # Creates an workgroup in Amazon Redshift Serverless. VPC Block Public Access (BPA) enables you to
      # block resources in VPCs and subnets that you own in a Region from reaching or being reached from the
      # internet through internet gateways and egress-only internet gateways. If a workgroup is in an
      # account with VPC BPA turned on, the following capabilities are blocked: Creating a public access
      # workgroup Modifying a private workgroup to public Adding a subnet with VPC BPA turned on to the
      # workgroup when the workgroup is public For more information about VPC BPA, see Block public access
      # to VPCs and subnets in the Amazon VPC User Guide .

      def create_workgroup(
        namespace_name : String,
        workgroup_name : String,
        base_capacity : Int32? = nil,
        config_parameters : Array(Types::ConfigParameter)? = nil,
        enhanced_vpc_routing : Bool? = nil,
        extra_compute_for_automatic_optimization : Bool? = nil,
        ip_address_type : String? = nil,
        max_capacity : Int32? = nil,
        port : Int32? = nil,
        price_performance_target : Types::PerformanceTarget? = nil,
        publicly_accessible : Bool? = nil,
        security_group_ids : Array(String)? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        track_name : String? = nil
      ) : Types::CreateWorkgroupResponse

        input = Types::CreateWorkgroupRequest.new(namespace_name: namespace_name, workgroup_name: workgroup_name, base_capacity: base_capacity, config_parameters: config_parameters, enhanced_vpc_routing: enhanced_vpc_routing, extra_compute_for_automatic_optimization: extra_compute_for_automatic_optimization, ip_address_type: ip_address_type, max_capacity: max_capacity, port: port, price_performance_target: price_performance_target, publicly_accessible: publicly_accessible, security_group_ids: security_group_ids, subnet_ids: subnet_ids, tags: tags, track_name: track_name)
        create_workgroup(input)
      end

      def create_workgroup(input : Types::CreateWorkgroupRequest) : Types::CreateWorkgroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKGROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkgroupResponse, "CreateWorkgroup")
      end

      # Deletes a custom domain association for Amazon Redshift Serverless.

      def delete_custom_domain_association(
        custom_domain_name : String,
        workgroup_name : String
      ) : Types::DeleteCustomDomainAssociationResponse

        input = Types::DeleteCustomDomainAssociationRequest.new(custom_domain_name: custom_domain_name, workgroup_name: workgroup_name)
        delete_custom_domain_association(input)
      end

      def delete_custom_domain_association(input : Types::DeleteCustomDomainAssociationRequest) : Types::DeleteCustomDomainAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CUSTOM_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCustomDomainAssociationResponse, "DeleteCustomDomainAssociation")
      end

      # Deletes an Amazon Redshift Serverless managed VPC endpoint.

      def delete_endpoint_access(
        endpoint_name : String
      ) : Types::DeleteEndpointAccessResponse

        input = Types::DeleteEndpointAccessRequest.new(endpoint_name: endpoint_name)
        delete_endpoint_access(input)
      end

      def delete_endpoint_access(input : Types::DeleteEndpointAccessRequest) : Types::DeleteEndpointAccessResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEndpointAccessResponse, "DeleteEndpointAccess")
      end

      # Deletes a namespace from Amazon Redshift Serverless. Before you delete the namespace, you can create
      # a final snapshot that has all of the data within the namespace.

      def delete_namespace(
        namespace_name : String,
        final_snapshot_name : String? = nil,
        final_snapshot_retention_period : Int32? = nil
      ) : Types::DeleteNamespaceResponse

        input = Types::DeleteNamespaceRequest.new(namespace_name: namespace_name, final_snapshot_name: final_snapshot_name, final_snapshot_retention_period: final_snapshot_retention_period)
        delete_namespace(input)
      end

      def delete_namespace(input : Types::DeleteNamespaceRequest) : Types::DeleteNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNamespaceResponse, "DeleteNamespace")
      end

      # Deletes the specified resource policy.

      def delete_resource_policy(
        resource_arn : String
      ) : Types::DeleteResourcePolicyResponse

        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResponse, "DeleteResourcePolicy")
      end

      # Deletes a scheduled action.

      def delete_scheduled_action(
        scheduled_action_name : String
      ) : Types::DeleteScheduledActionResponse

        input = Types::DeleteScheduledActionRequest.new(scheduled_action_name: scheduled_action_name)
        delete_scheduled_action(input)
      end

      def delete_scheduled_action(input : Types::DeleteScheduledActionRequest) : Types::DeleteScheduledActionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteScheduledActionResponse, "DeleteScheduledAction")
      end

      # Deletes a snapshot from Amazon Redshift Serverless.

      def delete_snapshot(
        snapshot_name : String
      ) : Types::DeleteSnapshotResponse

        input = Types::DeleteSnapshotRequest.new(snapshot_name: snapshot_name)
        delete_snapshot(input)
      end

      def delete_snapshot(input : Types::DeleteSnapshotRequest) : Types::DeleteSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSnapshotResponse, "DeleteSnapshot")
      end

      # Deletes a snapshot copy configuration

      def delete_snapshot_copy_configuration(
        snapshot_copy_configuration_id : String
      ) : Types::DeleteSnapshotCopyConfigurationResponse

        input = Types::DeleteSnapshotCopyConfigurationRequest.new(snapshot_copy_configuration_id: snapshot_copy_configuration_id)
        delete_snapshot_copy_configuration(input)
      end

      def delete_snapshot_copy_configuration(input : Types::DeleteSnapshotCopyConfigurationRequest) : Types::DeleteSnapshotCopyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SNAPSHOT_COPY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSnapshotCopyConfigurationResponse, "DeleteSnapshotCopyConfiguration")
      end

      # Deletes a usage limit from Amazon Redshift Serverless.

      def delete_usage_limit(
        usage_limit_id : String
      ) : Types::DeleteUsageLimitResponse

        input = Types::DeleteUsageLimitRequest.new(usage_limit_id: usage_limit_id)
        delete_usage_limit(input)
      end

      def delete_usage_limit(input : Types::DeleteUsageLimitRequest) : Types::DeleteUsageLimitResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USAGE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUsageLimitResponse, "DeleteUsageLimit")
      end

      # Deletes a workgroup.

      def delete_workgroup(
        workgroup_name : String
      ) : Types::DeleteWorkgroupResponse

        input = Types::DeleteWorkgroupRequest.new(workgroup_name: workgroup_name)
        delete_workgroup(input)
      end

      def delete_workgroup(input : Types::DeleteWorkgroupRequest) : Types::DeleteWorkgroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKGROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkgroupResponse, "DeleteWorkgroup")
      end

      # Returns a database user name and temporary password with temporary authorization to log in to Amazon
      # Redshift Serverless. By default, the temporary credentials expire in 900 seconds. You can optionally
      # specify a duration between 900 seconds (15 minutes) and 3600 seconds (60 minutes). The Identity and
      # Access Management (IAM) user or role that runs GetCredentials must have an IAM policy attached that
      # allows access to all necessary actions and resources. If the DbName parameter is specified, the IAM
      # policy must allow access to the resource dbname for the specified database name.

      def get_credentials(
        custom_domain_name : String? = nil,
        db_name : String? = nil,
        duration_seconds : Int32? = nil,
        workgroup_name : String? = nil
      ) : Types::GetCredentialsResponse

        input = Types::GetCredentialsRequest.new(custom_domain_name: custom_domain_name, db_name: db_name, duration_seconds: duration_seconds, workgroup_name: workgroup_name)
        get_credentials(input)
      end

      def get_credentials(input : Types::GetCredentialsRequest) : Types::GetCredentialsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCredentialsResponse, "GetCredentials")
      end

      # Gets information about a specific custom domain association.

      def get_custom_domain_association(
        custom_domain_name : String,
        workgroup_name : String
      ) : Types::GetCustomDomainAssociationResponse

        input = Types::GetCustomDomainAssociationRequest.new(custom_domain_name: custom_domain_name, workgroup_name: workgroup_name)
        get_custom_domain_association(input)
      end

      def get_custom_domain_association(input : Types::GetCustomDomainAssociationRequest) : Types::GetCustomDomainAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CUSTOM_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCustomDomainAssociationResponse, "GetCustomDomainAssociation")
      end

      # Returns information, such as the name, about a VPC endpoint.

      def get_endpoint_access(
        endpoint_name : String
      ) : Types::GetEndpointAccessResponse

        input = Types::GetEndpointAccessRequest.new(endpoint_name: endpoint_name)
        get_endpoint_access(input)
      end

      def get_endpoint_access(input : Types::GetEndpointAccessRequest) : Types::GetEndpointAccessResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEndpointAccessResponse, "GetEndpointAccess")
      end

      # Returns an Identity Center authentication token for accessing Amazon Redshift Serverless workgroups.
      # The token provides secure access to data within the specified workgroups using Identity Center
      # identity propagation. The token expires after a specified duration and must be refreshed for
      # continued access. The Identity and Access Management (IAM) user or role that runs
      # GetIdentityCenterAuthToken must have appropriate permissions to access the specified workgroups and
      # Identity Center integration must be configured for the workgroups.

      def get_identity_center_auth_token(
        workgroup_names : Array(String)
      ) : Types::GetIdentityCenterAuthTokenResponse

        input = Types::GetIdentityCenterAuthTokenRequest.new(workgroup_names: workgroup_names)
        get_identity_center_auth_token(input)
      end

      def get_identity_center_auth_token(input : Types::GetIdentityCenterAuthTokenRequest) : Types::GetIdentityCenterAuthTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IDENTITY_CENTER_AUTH_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIdentityCenterAuthTokenResponse, "GetIdentityCenterAuthToken")
      end

      # Returns information about a namespace in Amazon Redshift Serverless.

      def get_namespace(
        namespace_name : String
      ) : Types::GetNamespaceResponse

        input = Types::GetNamespaceRequest.new(namespace_name: namespace_name)
        get_namespace(input)
      end

      def get_namespace(input : Types::GetNamespaceRequest) : Types::GetNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetNamespaceResponse, "GetNamespace")
      end

      # Returns information about a recovery point.

      def get_recovery_point(
        recovery_point_id : String
      ) : Types::GetRecoveryPointResponse

        input = Types::GetRecoveryPointRequest.new(recovery_point_id: recovery_point_id)
        get_recovery_point(input)
      end

      def get_recovery_point(input : Types::GetRecoveryPointRequest) : Types::GetRecoveryPointResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RECOVERY_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRecoveryPointResponse, "GetRecoveryPoint")
      end

      # Gets an Amazon Redshift Serverless reservation. A reservation gives you the option to commit to a
      # specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless
      # on-demand (OD) rates.

      def get_reservation(
        reservation_id : String
      ) : Types::GetReservationResponse

        input = Types::GetReservationRequest.new(reservation_id: reservation_id)
        get_reservation(input)
      end

      def get_reservation(input : Types::GetReservationRequest) : Types::GetReservationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESERVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetReservationResponse, "GetReservation")
      end

      # Returns the reservation offering. The offering determines the payment schedule for the reservation.

      def get_reservation_offering(
        offering_id : String
      ) : Types::GetReservationOfferingResponse

        input = Types::GetReservationOfferingRequest.new(offering_id: offering_id)
        get_reservation_offering(input)
      end

      def get_reservation_offering(input : Types::GetReservationOfferingRequest) : Types::GetReservationOfferingResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESERVATION_OFFERING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetReservationOfferingResponse, "GetReservationOffering")
      end

      # Returns a resource policy.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyResponse

        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyResponse, "GetResourcePolicy")
      end

      # Returns information about a scheduled action.

      def get_scheduled_action(
        scheduled_action_name : String
      ) : Types::GetScheduledActionResponse

        input = Types::GetScheduledActionRequest.new(scheduled_action_name: scheduled_action_name)
        get_scheduled_action(input)
      end

      def get_scheduled_action(input : Types::GetScheduledActionRequest) : Types::GetScheduledActionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetScheduledActionResponse, "GetScheduledAction")
      end

      # Returns information about a specific snapshot.

      def get_snapshot(
        owner_account : String? = nil,
        snapshot_arn : String? = nil,
        snapshot_name : String? = nil
      ) : Types::GetSnapshotResponse

        input = Types::GetSnapshotRequest.new(owner_account: owner_account, snapshot_arn: snapshot_arn, snapshot_name: snapshot_name)
        get_snapshot(input)
      end

      def get_snapshot(input : Types::GetSnapshotRequest) : Types::GetSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSnapshotResponse, "GetSnapshot")
      end

      # Returns information about a TableRestoreStatus object.

      def get_table_restore_status(
        table_restore_request_id : String
      ) : Types::GetTableRestoreStatusResponse

        input = Types::GetTableRestoreStatusRequest.new(table_restore_request_id: table_restore_request_id)
        get_table_restore_status(input)
      end

      def get_table_restore_status(input : Types::GetTableRestoreStatusRequest) : Types::GetTableRestoreStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE_RESTORE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableRestoreStatusResponse, "GetTableRestoreStatus")
      end

      # Get the Redshift Serverless version for a specified track.

      def get_track(
        track_name : String
      ) : Types::GetTrackResponse

        input = Types::GetTrackRequest.new(track_name: track_name)
        get_track(input)
      end

      def get_track(input : Types::GetTrackRequest) : Types::GetTrackResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTrackResponse, "GetTrack")
      end

      # Returns information about a usage limit.

      def get_usage_limit(
        usage_limit_id : String
      ) : Types::GetUsageLimitResponse

        input = Types::GetUsageLimitRequest.new(usage_limit_id: usage_limit_id)
        get_usage_limit(input)
      end

      def get_usage_limit(input : Types::GetUsageLimitRequest) : Types::GetUsageLimitResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USAGE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUsageLimitResponse, "GetUsageLimit")
      end

      # Returns information about a specific workgroup.

      def get_workgroup(
        workgroup_name : String
      ) : Types::GetWorkgroupResponse

        input = Types::GetWorkgroupRequest.new(workgroup_name: workgroup_name)
        get_workgroup(input)
      end

      def get_workgroup(input : Types::GetWorkgroupRequest) : Types::GetWorkgroupResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKGROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkgroupResponse, "GetWorkgroup")
      end

      # Lists custom domain associations for Amazon Redshift Serverless.

      def list_custom_domain_associations(
        custom_domain_certificate_arn : String? = nil,
        custom_domain_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomDomainAssociationsResponse

        input = Types::ListCustomDomainAssociationsRequest.new(custom_domain_certificate_arn: custom_domain_certificate_arn, custom_domain_name: custom_domain_name, max_results: max_results, next_token: next_token)
        list_custom_domain_associations(input)
      end

      def list_custom_domain_associations(input : Types::ListCustomDomainAssociationsRequest) : Types::ListCustomDomainAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOM_DOMAIN_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomDomainAssociationsResponse, "ListCustomDomainAssociations")
      end

      # Returns an array of EndpointAccess objects and relevant information.

      def list_endpoint_access(
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner_account : String? = nil,
        vpc_id : String? = nil,
        workgroup_name : String? = nil
      ) : Types::ListEndpointAccessResponse

        input = Types::ListEndpointAccessRequest.new(max_results: max_results, next_token: next_token, owner_account: owner_account, vpc_id: vpc_id, workgroup_name: workgroup_name)
        list_endpoint_access(input)
      end

      def list_endpoint_access(input : Types::ListEndpointAccessRequest) : Types::ListEndpointAccessResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEndpointAccessResponse, "ListEndpointAccess")
      end

      # Returns information about a list of specified managed workgroups in your account.

      def list_managed_workgroups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        source_arn : String? = nil
      ) : Types::ListManagedWorkgroupsResponse

        input = Types::ListManagedWorkgroupsRequest.new(max_results: max_results, next_token: next_token, source_arn: source_arn)
        list_managed_workgroups(input)
      end

      def list_managed_workgroups(input : Types::ListManagedWorkgroupsRequest) : Types::ListManagedWorkgroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MANAGED_WORKGROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListManagedWorkgroupsResponse, "ListManagedWorkgroups")
      end

      # Returns information about a list of specified namespaces.

      def list_namespaces(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListNamespacesResponse

        input = Types::ListNamespacesRequest.new(max_results: max_results, next_token: next_token)
        list_namespaces(input)
      end

      def list_namespaces(input : Types::ListNamespacesRequest) : Types::ListNamespacesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_NAMESPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNamespacesResponse, "ListNamespaces")
      end

      # Returns an array of recovery points.

      def list_recovery_points(
        end_time : Time? = nil,
        max_results : Int32? = nil,
        namespace_arn : String? = nil,
        namespace_name : String? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::ListRecoveryPointsResponse

        input = Types::ListRecoveryPointsRequest.new(end_time: end_time, max_results: max_results, namespace_arn: namespace_arn, namespace_name: namespace_name, next_token: next_token, start_time: start_time)
        list_recovery_points(input)
      end

      def list_recovery_points(input : Types::ListRecoveryPointsRequest) : Types::ListRecoveryPointsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECOVERY_POINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecoveryPointsResponse, "ListRecoveryPoints")
      end

      # Returns the current reservation offerings in your account.

      def list_reservation_offerings(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListReservationOfferingsResponse

        input = Types::ListReservationOfferingsRequest.new(max_results: max_results, next_token: next_token)
        list_reservation_offerings(input)
      end

      def list_reservation_offerings(input : Types::ListReservationOfferingsRequest) : Types::ListReservationOfferingsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESERVATION_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReservationOfferingsResponse, "ListReservationOfferings")
      end

      # Returns a list of Reservation objects.

      def list_reservations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListReservationsResponse

        input = Types::ListReservationsRequest.new(max_results: max_results, next_token: next_token)
        list_reservations(input)
      end

      def list_reservations(input : Types::ListReservationsRequest) : Types::ListReservationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESERVATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReservationsResponse, "ListReservations")
      end

      # Returns a list of scheduled actions. You can use the flags to filter the list of returned scheduled
      # actions.

      def list_scheduled_actions(
        max_results : Int32? = nil,
        namespace_name : String? = nil,
        next_token : String? = nil
      ) : Types::ListScheduledActionsResponse

        input = Types::ListScheduledActionsRequest.new(max_results: max_results, namespace_name: namespace_name, next_token: next_token)
        list_scheduled_actions(input)
      end

      def list_scheduled_actions(input : Types::ListScheduledActionsRequest) : Types::ListScheduledActionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SCHEDULED_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListScheduledActionsResponse, "ListScheduledActions")
      end

      # Returns a list of snapshot copy configurations.

      def list_snapshot_copy_configurations(
        max_results : Int32? = nil,
        namespace_name : String? = nil,
        next_token : String? = nil
      ) : Types::ListSnapshotCopyConfigurationsResponse

        input = Types::ListSnapshotCopyConfigurationsRequest.new(max_results: max_results, namespace_name: namespace_name, next_token: next_token)
        list_snapshot_copy_configurations(input)
      end

      def list_snapshot_copy_configurations(input : Types::ListSnapshotCopyConfigurationsRequest) : Types::ListSnapshotCopyConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SNAPSHOT_COPY_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSnapshotCopyConfigurationsResponse, "ListSnapshotCopyConfigurations")
      end

      # Returns a list of snapshots.

      def list_snapshots(
        end_time : Time? = nil,
        max_results : Int32? = nil,
        namespace_arn : String? = nil,
        namespace_name : String? = nil,
        next_token : String? = nil,
        owner_account : String? = nil,
        start_time : Time? = nil
      ) : Types::ListSnapshotsResponse

        input = Types::ListSnapshotsRequest.new(end_time: end_time, max_results: max_results, namespace_arn: namespace_arn, namespace_name: namespace_name, next_token: next_token, owner_account: owner_account, start_time: start_time)
        list_snapshots(input)
      end

      def list_snapshots(input : Types::ListSnapshotsRequest) : Types::ListSnapshotsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSnapshotsResponse, "ListSnapshots")
      end

      # Returns information about an array of TableRestoreStatus objects.

      def list_table_restore_status(
        max_results : Int32? = nil,
        namespace_name : String? = nil,
        next_token : String? = nil,
        workgroup_name : String? = nil
      ) : Types::ListTableRestoreStatusResponse

        input = Types::ListTableRestoreStatusRequest.new(max_results: max_results, namespace_name: namespace_name, next_token: next_token, workgroup_name: workgroup_name)
        list_table_restore_status(input)
      end

      def list_table_restore_status(input : Types::ListTableRestoreStatusRequest) : Types::ListTableRestoreStatusResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TABLE_RESTORE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTableRestoreStatusResponse, "ListTableRestoreStatus")
      end

      # Lists the tags assigned to a resource.

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

      # List the Amazon Redshift Serverless versions.

      def list_tracks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTracksResponse

        input = Types::ListTracksRequest.new(max_results: max_results, next_token: next_token)
        list_tracks(input)
      end

      def list_tracks(input : Types::ListTracksRequest) : Types::ListTracksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTracksResponse, "ListTracks")
      end

      # Lists all usage limits within Amazon Redshift Serverless.

      def list_usage_limits(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_arn : String? = nil,
        usage_type : String? = nil
      ) : Types::ListUsageLimitsResponse

        input = Types::ListUsageLimitsRequest.new(max_results: max_results, next_token: next_token, resource_arn: resource_arn, usage_type: usage_type)
        list_usage_limits(input)
      end

      def list_usage_limits(input : Types::ListUsageLimitsRequest) : Types::ListUsageLimitsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USAGE_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsageLimitsResponse, "ListUsageLimits")
      end

      # Returns information about a list of specified workgroups.

      def list_workgroups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner_account : String? = nil
      ) : Types::ListWorkgroupsResponse

        input = Types::ListWorkgroupsRequest.new(max_results: max_results, next_token: next_token, owner_account: owner_account)
        list_workgroups(input)
      end

      def list_workgroups(input : Types::ListWorkgroupsRequest) : Types::ListWorkgroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKGROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkgroupsResponse, "ListWorkgroups")
      end

      # Creates or updates a resource policy. Currently, you can use policies to share snapshots across
      # Amazon Web Services accounts.

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Types::PutResourcePolicyResponse

        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Restore the data from a recovery point.

      def restore_from_recovery_point(
        namespace_name : String,
        recovery_point_id : String,
        workgroup_name : String
      ) : Types::RestoreFromRecoveryPointResponse

        input = Types::RestoreFromRecoveryPointRequest.new(namespace_name: namespace_name, recovery_point_id: recovery_point_id, workgroup_name: workgroup_name)
        restore_from_recovery_point(input)
      end

      def restore_from_recovery_point(input : Types::RestoreFromRecoveryPointRequest) : Types::RestoreFromRecoveryPointResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_FROM_RECOVERY_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreFromRecoveryPointResponse, "RestoreFromRecoveryPoint")
      end

      # Restores a namespace from a snapshot.

      def restore_from_snapshot(
        namespace_name : String,
        workgroup_name : String,
        admin_password_secret_kms_key_id : String? = nil,
        manage_admin_password : Bool? = nil,
        owner_account : String? = nil,
        snapshot_arn : String? = nil,
        snapshot_name : String? = nil
      ) : Types::RestoreFromSnapshotResponse

        input = Types::RestoreFromSnapshotRequest.new(namespace_name: namespace_name, workgroup_name: workgroup_name, admin_password_secret_kms_key_id: admin_password_secret_kms_key_id, manage_admin_password: manage_admin_password, owner_account: owner_account, snapshot_arn: snapshot_arn, snapshot_name: snapshot_name)
        restore_from_snapshot(input)
      end

      def restore_from_snapshot(input : Types::RestoreFromSnapshotRequest) : Types::RestoreFromSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreFromSnapshotResponse, "RestoreFromSnapshot")
      end

      # Restores a table from a recovery point to your Amazon Redshift Serverless instance. You can't use
      # this operation to restore tables with interleaved sort keys.

      def restore_table_from_recovery_point(
        namespace_name : String,
        new_table_name : String,
        recovery_point_id : String,
        source_database_name : String,
        source_table_name : String,
        workgroup_name : String,
        activate_case_sensitive_identifier : Bool? = nil,
        source_schema_name : String? = nil,
        target_database_name : String? = nil,
        target_schema_name : String? = nil
      ) : Types::RestoreTableFromRecoveryPointResponse

        input = Types::RestoreTableFromRecoveryPointRequest.new(namespace_name: namespace_name, new_table_name: new_table_name, recovery_point_id: recovery_point_id, source_database_name: source_database_name, source_table_name: source_table_name, workgroup_name: workgroup_name, activate_case_sensitive_identifier: activate_case_sensitive_identifier, source_schema_name: source_schema_name, target_database_name: target_database_name, target_schema_name: target_schema_name)
        restore_table_from_recovery_point(input)
      end

      def restore_table_from_recovery_point(input : Types::RestoreTableFromRecoveryPointRequest) : Types::RestoreTableFromRecoveryPointResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_TABLE_FROM_RECOVERY_POINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreTableFromRecoveryPointResponse, "RestoreTableFromRecoveryPoint")
      end

      # Restores a table from a snapshot to your Amazon Redshift Serverless instance. You can't use this
      # operation to restore tables with interleaved sort keys .

      def restore_table_from_snapshot(
        namespace_name : String,
        new_table_name : String,
        snapshot_name : String,
        source_database_name : String,
        source_table_name : String,
        workgroup_name : String,
        activate_case_sensitive_identifier : Bool? = nil,
        source_schema_name : String? = nil,
        target_database_name : String? = nil,
        target_schema_name : String? = nil
      ) : Types::RestoreTableFromSnapshotResponse

        input = Types::RestoreTableFromSnapshotRequest.new(namespace_name: namespace_name, new_table_name: new_table_name, snapshot_name: snapshot_name, source_database_name: source_database_name, source_table_name: source_table_name, workgroup_name: workgroup_name, activate_case_sensitive_identifier: activate_case_sensitive_identifier, source_schema_name: source_schema_name, target_database_name: target_database_name, target_schema_name: target_schema_name)
        restore_table_from_snapshot(input)
      end

      def restore_table_from_snapshot(input : Types::RestoreTableFromSnapshotRequest) : Types::RestoreTableFromSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_TABLE_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreTableFromSnapshotResponse, "RestoreTableFromSnapshot")
      end

      # Assigns one or more tags to a resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
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

      # Removes a tag or set of tags from a resource.

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

      # Updates an Amazon Redshift Serverless certificate associated with a custom domain.

      def update_custom_domain_association(
        custom_domain_certificate_arn : String,
        custom_domain_name : String,
        workgroup_name : String
      ) : Types::UpdateCustomDomainAssociationResponse

        input = Types::UpdateCustomDomainAssociationRequest.new(custom_domain_certificate_arn: custom_domain_certificate_arn, custom_domain_name: custom_domain_name, workgroup_name: workgroup_name)
        update_custom_domain_association(input)
      end

      def update_custom_domain_association(input : Types::UpdateCustomDomainAssociationRequest) : Types::UpdateCustomDomainAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CUSTOM_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCustomDomainAssociationResponse, "UpdateCustomDomainAssociation")
      end

      # Updates an Amazon Redshift Serverless managed endpoint.

      def update_endpoint_access(
        endpoint_name : String,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::UpdateEndpointAccessResponse

        input = Types::UpdateEndpointAccessRequest.new(endpoint_name: endpoint_name, vpc_security_group_ids: vpc_security_group_ids)
        update_endpoint_access(input)
      end

      def update_endpoint_access(input : Types::UpdateEndpointAccessRequest) : Types::UpdateEndpointAccessResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEndpointAccessResponse, "UpdateEndpointAccess")
      end

      # Modifies the lakehouse configuration for a namespace. This operation allows you to manage Amazon
      # Redshift federated permissions and Amazon Web Services IAM Identity Center trusted identity
      # propagation.

      def update_lakehouse_configuration(
        namespace_name : String,
        catalog_name : String? = nil,
        dry_run : Bool? = nil,
        lakehouse_idc_application_arn : String? = nil,
        lakehouse_idc_registration : String? = nil,
        lakehouse_registration : String? = nil
      ) : Types::UpdateLakehouseConfigurationResponse

        input = Types::UpdateLakehouseConfigurationRequest.new(namespace_name: namespace_name, catalog_name: catalog_name, dry_run: dry_run, lakehouse_idc_application_arn: lakehouse_idc_application_arn, lakehouse_idc_registration: lakehouse_idc_registration, lakehouse_registration: lakehouse_registration)
        update_lakehouse_configuration(input)
      end

      def update_lakehouse_configuration(input : Types::UpdateLakehouseConfigurationRequest) : Types::UpdateLakehouseConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LAKEHOUSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLakehouseConfigurationResponse, "UpdateLakehouseConfiguration")
      end

      # Updates a namespace with the specified settings. Unless required, you can't update multiple
      # parameters in one request. For example, you must specify both adminUsername and adminUserPassword to
      # update either field, but you can't update both kmsKeyId and logExports in a single request.

      def update_namespace(
        namespace_name : String,
        admin_password_secret_kms_key_id : String? = nil,
        admin_user_password : String? = nil,
        admin_username : String? = nil,
        default_iam_role_arn : String? = nil,
        iam_roles : Array(String)? = nil,
        kms_key_id : String? = nil,
        log_exports : Array(String)? = nil,
        manage_admin_password : Bool? = nil
      ) : Types::UpdateNamespaceResponse

        input = Types::UpdateNamespaceRequest.new(namespace_name: namespace_name, admin_password_secret_kms_key_id: admin_password_secret_kms_key_id, admin_user_password: admin_user_password, admin_username: admin_username, default_iam_role_arn: default_iam_role_arn, iam_roles: iam_roles, kms_key_id: kms_key_id, log_exports: log_exports, manage_admin_password: manage_admin_password)
        update_namespace(input)
      end

      def update_namespace(input : Types::UpdateNamespaceRequest) : Types::UpdateNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNamespaceResponse, "UpdateNamespace")
      end

      # Updates a scheduled action.

      def update_scheduled_action(
        scheduled_action_name : String,
        enabled : Bool? = nil,
        end_time : Time? = nil,
        role_arn : String? = nil,
        schedule : Types::Schedule? = nil,
        scheduled_action_description : String? = nil,
        start_time : Time? = nil,
        target_action : Types::TargetAction? = nil
      ) : Types::UpdateScheduledActionResponse

        input = Types::UpdateScheduledActionRequest.new(scheduled_action_name: scheduled_action_name, enabled: enabled, end_time: end_time, role_arn: role_arn, schedule: schedule, scheduled_action_description: scheduled_action_description, start_time: start_time, target_action: target_action)
        update_scheduled_action(input)
      end

      def update_scheduled_action(input : Types::UpdateScheduledActionRequest) : Types::UpdateScheduledActionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateScheduledActionResponse, "UpdateScheduledAction")
      end

      # Updates a snapshot.

      def update_snapshot(
        snapshot_name : String,
        retention_period : Int32? = nil
      ) : Types::UpdateSnapshotResponse

        input = Types::UpdateSnapshotRequest.new(snapshot_name: snapshot_name, retention_period: retention_period)
        update_snapshot(input)
      end

      def update_snapshot(input : Types::UpdateSnapshotRequest) : Types::UpdateSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSnapshotResponse, "UpdateSnapshot")
      end

      # Updates a snapshot copy configuration.

      def update_snapshot_copy_configuration(
        snapshot_copy_configuration_id : String,
        snapshot_retention_period : Int32? = nil
      ) : Types::UpdateSnapshotCopyConfigurationResponse

        input = Types::UpdateSnapshotCopyConfigurationRequest.new(snapshot_copy_configuration_id: snapshot_copy_configuration_id, snapshot_retention_period: snapshot_retention_period)
        update_snapshot_copy_configuration(input)
      end

      def update_snapshot_copy_configuration(input : Types::UpdateSnapshotCopyConfigurationRequest) : Types::UpdateSnapshotCopyConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SNAPSHOT_COPY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSnapshotCopyConfigurationResponse, "UpdateSnapshotCopyConfiguration")
      end

      # Update a usage limit in Amazon Redshift Serverless. You can't update the usage type or period of a
      # usage limit.

      def update_usage_limit(
        usage_limit_id : String,
        amount : Int64? = nil,
        breach_action : String? = nil
      ) : Types::UpdateUsageLimitResponse

        input = Types::UpdateUsageLimitRequest.new(usage_limit_id: usage_limit_id, amount: amount, breach_action: breach_action)
        update_usage_limit(input)
      end

      def update_usage_limit(input : Types::UpdateUsageLimitRequest) : Types::UpdateUsageLimitResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USAGE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUsageLimitResponse, "UpdateUsageLimit")
      end

      # Updates a workgroup with the specified configuration settings. You can't update multiple parameters
      # in one request. For example, you can update baseCapacity or port in a single request, but you can't
      # update both in the same request. VPC Block Public Access (BPA) enables you to block resources in
      # VPCs and subnets that you own in a Region from reaching or being reached from the internet through
      # internet gateways and egress-only internet gateways. If a workgroup is in an account with VPC BPA
      # turned on, the following capabilities are blocked: Creating a public access workgroup Modifying a
      # private workgroup to public Adding a subnet with VPC BPA turned on to the workgroup when the
      # workgroup is public For more information about VPC BPA, see Block public access to VPCs and subnets
      # in the Amazon VPC User Guide .

      def update_workgroup(
        workgroup_name : String,
        base_capacity : Int32? = nil,
        config_parameters : Array(Types::ConfigParameter)? = nil,
        enhanced_vpc_routing : Bool? = nil,
        extra_compute_for_automatic_optimization : Bool? = nil,
        ip_address_type : String? = nil,
        max_capacity : Int32? = nil,
        port : Int32? = nil,
        price_performance_target : Types::PerformanceTarget? = nil,
        publicly_accessible : Bool? = nil,
        security_group_ids : Array(String)? = nil,
        subnet_ids : Array(String)? = nil,
        track_name : String? = nil
      ) : Types::UpdateWorkgroupResponse

        input = Types::UpdateWorkgroupRequest.new(workgroup_name: workgroup_name, base_capacity: base_capacity, config_parameters: config_parameters, enhanced_vpc_routing: enhanced_vpc_routing, extra_compute_for_automatic_optimization: extra_compute_for_automatic_optimization, ip_address_type: ip_address_type, max_capacity: max_capacity, port: port, price_performance_target: price_performance_target, publicly_accessible: publicly_accessible, security_group_ids: security_group_ids, subnet_ids: subnet_ids, track_name: track_name)
        update_workgroup(input)
      end

      def update_workgroup(input : Types::UpdateWorkgroupRequest) : Types::UpdateWorkgroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKGROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkgroupResponse, "UpdateWorkgroup")
      end
    end
  end
end
