module AwsSdk
  module DeviceFarm
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

      # Creates a device pool.

      def create_device_pool(
        name : String,
        project_arn : String,
        rules : Array(Types::Rule),
        description : String? = nil,
        max_devices : Int32? = nil
      ) : Types::CreateDevicePoolResult

        input = Types::CreateDevicePoolRequest.new(name: name, project_arn: project_arn, rules: rules, description: description, max_devices: max_devices)
        create_device_pool(input)
      end

      def create_device_pool(input : Types::CreateDevicePoolRequest) : Types::CreateDevicePoolResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DEVICE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDevicePoolResult, "CreateDevicePool")
      end

      # Creates a profile that can be applied to one or more private fleet device instances.

      def create_instance_profile(
        name : String,
        description : String? = nil,
        exclude_app_packages_from_cleanup : Array(String)? = nil,
        package_cleanup : Bool? = nil,
        reboot_after_use : Bool? = nil
      ) : Types::CreateInstanceProfileResult

        input = Types::CreateInstanceProfileRequest.new(name: name, description: description, exclude_app_packages_from_cleanup: exclude_app_packages_from_cleanup, package_cleanup: package_cleanup, reboot_after_use: reboot_after_use)
        create_instance_profile(input)
      end

      def create_instance_profile(input : Types::CreateInstanceProfileRequest) : Types::CreateInstanceProfileResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInstanceProfileResult, "CreateInstanceProfile")
      end

      # Creates a network profile.

      def create_network_profile(
        name : String,
        project_arn : String,
        description : String? = nil,
        downlink_bandwidth_bits : Int64? = nil,
        downlink_delay_ms : Int64? = nil,
        downlink_jitter_ms : Int64? = nil,
        downlink_loss_percent : Int32? = nil,
        type : String? = nil,
        uplink_bandwidth_bits : Int64? = nil,
        uplink_delay_ms : Int64? = nil,
        uplink_jitter_ms : Int64? = nil,
        uplink_loss_percent : Int32? = nil
      ) : Types::CreateNetworkProfileResult

        input = Types::CreateNetworkProfileRequest.new(name: name, project_arn: project_arn, description: description, downlink_bandwidth_bits: downlink_bandwidth_bits, downlink_delay_ms: downlink_delay_ms, downlink_jitter_ms: downlink_jitter_ms, downlink_loss_percent: downlink_loss_percent, type: type, uplink_bandwidth_bits: uplink_bandwidth_bits, uplink_delay_ms: uplink_delay_ms, uplink_jitter_ms: uplink_jitter_ms, uplink_loss_percent: uplink_loss_percent)
        create_network_profile(input)
      end

      def create_network_profile(input : Types::CreateNetworkProfileRequest) : Types::CreateNetworkProfileResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_NETWORK_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNetworkProfileResult, "CreateNetworkProfile")
      end

      # Creates a project.

      def create_project(
        name : String,
        default_job_timeout_minutes : Int32? = nil,
        environment_variables : Array(Types::EnvironmentVariable)? = nil,
        execution_role_arn : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateProjectResult

        input = Types::CreateProjectRequest.new(name: name, default_job_timeout_minutes: default_job_timeout_minutes, environment_variables: environment_variables, execution_role_arn: execution_role_arn, vpc_config: vpc_config)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectRequest) : Types::CreateProjectResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProjectResult, "CreateProject")
      end

      # Specifies and starts a remote access session.

      def create_remote_access_session(
        device_arn : String,
        project_arn : String,
        app_arn : String? = nil,
        configuration : Types::CreateRemoteAccessSessionConfiguration? = nil,
        instance_arn : String? = nil,
        interaction_mode : String? = nil,
        name : String? = nil,
        skip_app_resign : Bool? = nil
      ) : Types::CreateRemoteAccessSessionResult

        input = Types::CreateRemoteAccessSessionRequest.new(device_arn: device_arn, project_arn: project_arn, app_arn: app_arn, configuration: configuration, instance_arn: instance_arn, interaction_mode: interaction_mode, name: name, skip_app_resign: skip_app_resign)
        create_remote_access_session(input)
      end

      def create_remote_access_session(input : Types::CreateRemoteAccessSessionRequest) : Types::CreateRemoteAccessSessionResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_REMOTE_ACCESS_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRemoteAccessSessionResult, "CreateRemoteAccessSession")
      end

      # Creates a Selenium testing project. Projects are used to track TestGridSession instances.

      def create_test_grid_project(
        name : String,
        description : String? = nil,
        vpc_config : Types::TestGridVpcConfig? = nil
      ) : Types::CreateTestGridProjectResult

        input = Types::CreateTestGridProjectRequest.new(name: name, description: description, vpc_config: vpc_config)
        create_test_grid_project(input)
      end

      def create_test_grid_project(input : Types::CreateTestGridProjectRequest) : Types::CreateTestGridProjectResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_TEST_GRID_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTestGridProjectResult, "CreateTestGridProject")
      end

      # Creates a signed, short-term URL that can be passed to a Selenium RemoteWebDriver constructor.

      def create_test_grid_url(
        expires_in_seconds : Int32,
        project_arn : String
      ) : Types::CreateTestGridUrlResult

        input = Types::CreateTestGridUrlRequest.new(expires_in_seconds: expires_in_seconds, project_arn: project_arn)
        create_test_grid_url(input)
      end

      def create_test_grid_url(input : Types::CreateTestGridUrlRequest) : Types::CreateTestGridUrlResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_TEST_GRID_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTestGridUrlResult, "CreateTestGridUrl")
      end

      # Uploads an app or test scripts.

      def create_upload(
        name : String,
        project_arn : String,
        type : String,
        content_type : String? = nil
      ) : Types::CreateUploadResult

        input = Types::CreateUploadRequest.new(name: name, project_arn: project_arn, type: type, content_type: content_type)
        create_upload(input)
      end

      def create_upload(input : Types::CreateUploadRequest) : Types::CreateUploadResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUploadResult, "CreateUpload")
      end

      # Creates a configuration record in Device Farm for your Amazon Virtual Private Cloud (VPC) endpoint.

      def create_vpce_configuration(
        service_dns_name : String,
        vpce_configuration_name : String,
        vpce_service_name : String,
        vpce_configuration_description : String? = nil
      ) : Types::CreateVPCEConfigurationResult

        input = Types::CreateVPCEConfigurationRequest.new(service_dns_name: service_dns_name, vpce_configuration_name: vpce_configuration_name, vpce_service_name: vpce_service_name, vpce_configuration_description: vpce_configuration_description)
        create_vpce_configuration(input)
      end

      def create_vpce_configuration(input : Types::CreateVPCEConfigurationRequest) : Types::CreateVPCEConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_VPCE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVPCEConfigurationResult, "CreateVPCEConfiguration")
      end

      # Deletes a device pool given the pool ARN. Does not allow deletion of curated pools owned by the
      # system.

      def delete_device_pool(
        arn : String
      ) : Types::DeleteDevicePoolResult

        input = Types::DeleteDevicePoolRequest.new(arn: arn)
        delete_device_pool(input)
      end

      def delete_device_pool(input : Types::DeleteDevicePoolRequest) : Types::DeleteDevicePoolResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEVICE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDevicePoolResult, "DeleteDevicePool")
      end

      # Deletes a profile that can be applied to one or more private device instances.

      def delete_instance_profile(
        arn : String
      ) : Types::DeleteInstanceProfileResult

        input = Types::DeleteInstanceProfileRequest.new(arn: arn)
        delete_instance_profile(input)
      end

      def delete_instance_profile(input : Types::DeleteInstanceProfileRequest) : Types::DeleteInstanceProfileResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInstanceProfileResult, "DeleteInstanceProfile")
      end

      # Deletes a network profile.

      def delete_network_profile(
        arn : String
      ) : Types::DeleteNetworkProfileResult

        input = Types::DeleteNetworkProfileRequest.new(arn: arn)
        delete_network_profile(input)
      end

      def delete_network_profile(input : Types::DeleteNetworkProfileRequest) : Types::DeleteNetworkProfileResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_NETWORK_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNetworkProfileResult, "DeleteNetworkProfile")
      end

      # Deletes an AWS Device Farm project, given the project ARN. You cannot delete a project if it has an
      # active run or session. You cannot undo this operation.

      def delete_project(
        arn : String
      ) : Types::DeleteProjectResult

        input = Types::DeleteProjectRequest.new(arn: arn)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectRequest) : Types::DeleteProjectResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProjectResult, "DeleteProject")
      end

      # Deletes a completed remote access session and its results. You cannot delete a remote access session
      # if it is still active. You cannot undo this operation.

      def delete_remote_access_session(
        arn : String
      ) : Types::DeleteRemoteAccessSessionResult

        input = Types::DeleteRemoteAccessSessionRequest.new(arn: arn)
        delete_remote_access_session(input)
      end

      def delete_remote_access_session(input : Types::DeleteRemoteAccessSessionRequest) : Types::DeleteRemoteAccessSessionResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_REMOTE_ACCESS_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRemoteAccessSessionResult, "DeleteRemoteAccessSession")
      end

      # Deletes the run, given the run ARN. You cannot delete a run if it is still active. You cannot undo
      # this operation.

      def delete_run(
        arn : String
      ) : Types::DeleteRunResult

        input = Types::DeleteRunRequest.new(arn: arn)
        delete_run(input)
      end

      def delete_run(input : Types::DeleteRunRequest) : Types::DeleteRunResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRunResult, "DeleteRun")
      end

      # Deletes a Selenium testing project and all content generated under it. You cannot delete a project
      # if it has active sessions. You cannot undo this operation.

      def delete_test_grid_project(
        project_arn : String
      ) : Types::DeleteTestGridProjectResult

        input = Types::DeleteTestGridProjectRequest.new(project_arn: project_arn)
        delete_test_grid_project(input)
      end

      def delete_test_grid_project(input : Types::DeleteTestGridProjectRequest) : Types::DeleteTestGridProjectResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_TEST_GRID_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTestGridProjectResult, "DeleteTestGridProject")
      end

      # Deletes an upload given the upload ARN.

      def delete_upload(
        arn : String
      ) : Types::DeleteUploadResult

        input = Types::DeleteUploadRequest.new(arn: arn)
        delete_upload(input)
      end

      def delete_upload(input : Types::DeleteUploadRequest) : Types::DeleteUploadResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUploadResult, "DeleteUpload")
      end

      # Deletes a configuration for your Amazon Virtual Private Cloud (VPC) endpoint.

      def delete_vpce_configuration(
        arn : String
      ) : Types::DeleteVPCEConfigurationResult

        input = Types::DeleteVPCEConfigurationRequest.new(arn: arn)
        delete_vpce_configuration(input)
      end

      def delete_vpce_configuration(input : Types::DeleteVPCEConfigurationRequest) : Types::DeleteVPCEConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_VPCE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVPCEConfigurationResult, "DeleteVPCEConfiguration")
      end

      # Returns the number of unmetered iOS or unmetered Android devices that have been purchased by the
      # account.

      def get_account_settings : Types::GetAccountSettingsResult
        input = Types::GetAccountSettingsRequest.new
        get_account_settings(input)
      end

      def get_account_settings(input : Types::GetAccountSettingsRequest) : Types::GetAccountSettingsResult
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountSettingsResult, "GetAccountSettings")
      end

      # Gets information about a unique device type.

      def get_device(
        arn : String
      ) : Types::GetDeviceResult

        input = Types::GetDeviceRequest.new(arn: arn)
        get_device(input)
      end

      def get_device(input : Types::GetDeviceRequest) : Types::GetDeviceResult
        request = Protocol::JsonRpc.build_request(Model::GET_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeviceResult, "GetDevice")
      end

      # Returns information about a device instance that belongs to a private device fleet.

      def get_device_instance(
        arn : String
      ) : Types::GetDeviceInstanceResult

        input = Types::GetDeviceInstanceRequest.new(arn: arn)
        get_device_instance(input)
      end

      def get_device_instance(input : Types::GetDeviceInstanceRequest) : Types::GetDeviceInstanceResult
        request = Protocol::JsonRpc.build_request(Model::GET_DEVICE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeviceInstanceResult, "GetDeviceInstance")
      end

      # Gets information about a device pool.

      def get_device_pool(
        arn : String
      ) : Types::GetDevicePoolResult

        input = Types::GetDevicePoolRequest.new(arn: arn)
        get_device_pool(input)
      end

      def get_device_pool(input : Types::GetDevicePoolRequest) : Types::GetDevicePoolResult
        request = Protocol::JsonRpc.build_request(Model::GET_DEVICE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDevicePoolResult, "GetDevicePool")
      end

      # Gets information about compatibility with a device pool.

      def get_device_pool_compatibility(
        device_pool_arn : String,
        app_arn : String? = nil,
        configuration : Types::ScheduleRunConfiguration? = nil,
        project_arn : String? = nil,
        test : Types::ScheduleRunTest? = nil,
        test_type : String? = nil
      ) : Types::GetDevicePoolCompatibilityResult

        input = Types::GetDevicePoolCompatibilityRequest.new(device_pool_arn: device_pool_arn, app_arn: app_arn, configuration: configuration, project_arn: project_arn, test: test, test_type: test_type)
        get_device_pool_compatibility(input)
      end

      def get_device_pool_compatibility(input : Types::GetDevicePoolCompatibilityRequest) : Types::GetDevicePoolCompatibilityResult
        request = Protocol::JsonRpc.build_request(Model::GET_DEVICE_POOL_COMPATIBILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDevicePoolCompatibilityResult, "GetDevicePoolCompatibility")
      end

      # Returns information about the specified instance profile.

      def get_instance_profile(
        arn : String
      ) : Types::GetInstanceProfileResult

        input = Types::GetInstanceProfileRequest.new(arn: arn)
        get_instance_profile(input)
      end

      def get_instance_profile(input : Types::GetInstanceProfileRequest) : Types::GetInstanceProfileResult
        request = Protocol::JsonRpc.build_request(Model::GET_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInstanceProfileResult, "GetInstanceProfile")
      end

      # Gets information about a job.

      def get_job(
        arn : String
      ) : Types::GetJobResult

        input = Types::GetJobRequest.new(arn: arn)
        get_job(input)
      end

      def get_job(input : Types::GetJobRequest) : Types::GetJobResult
        request = Protocol::JsonRpc.build_request(Model::GET_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobResult, "GetJob")
      end

      # Returns information about a network profile.

      def get_network_profile(
        arn : String
      ) : Types::GetNetworkProfileResult

        input = Types::GetNetworkProfileRequest.new(arn: arn)
        get_network_profile(input)
      end

      def get_network_profile(input : Types::GetNetworkProfileRequest) : Types::GetNetworkProfileResult
        request = Protocol::JsonRpc.build_request(Model::GET_NETWORK_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetNetworkProfileResult, "GetNetworkProfile")
      end

      # Gets the current status and future status of all offerings purchased by an AWS account. The response
      # indicates how many offerings are currently available and the offerings that will be available in the
      # next period. The API returns a NotEligible error if the user is not permitted to invoke the
      # operation. If you must be able to invoke this operation, contact aws-devicefarm-support@amazon.com .

      def get_offering_status(
        next_token : String? = nil
      ) : Types::GetOfferingStatusResult

        input = Types::GetOfferingStatusRequest.new(next_token: next_token)
        get_offering_status(input)
      end

      def get_offering_status(input : Types::GetOfferingStatusRequest) : Types::GetOfferingStatusResult
        request = Protocol::JsonRpc.build_request(Model::GET_OFFERING_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOfferingStatusResult, "GetOfferingStatus")
      end

      # Gets information about a project.

      def get_project(
        arn : String
      ) : Types::GetProjectResult

        input = Types::GetProjectRequest.new(arn: arn)
        get_project(input)
      end

      def get_project(input : Types::GetProjectRequest) : Types::GetProjectResult
        request = Protocol::JsonRpc.build_request(Model::GET_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProjectResult, "GetProject")
      end

      # Returns a link to a currently running remote access session.

      def get_remote_access_session(
        arn : String
      ) : Types::GetRemoteAccessSessionResult

        input = Types::GetRemoteAccessSessionRequest.new(arn: arn)
        get_remote_access_session(input)
      end

      def get_remote_access_session(input : Types::GetRemoteAccessSessionRequest) : Types::GetRemoteAccessSessionResult
        request = Protocol::JsonRpc.build_request(Model::GET_REMOTE_ACCESS_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRemoteAccessSessionResult, "GetRemoteAccessSession")
      end

      # Gets information about a run.

      def get_run(
        arn : String
      ) : Types::GetRunResult

        input = Types::GetRunRequest.new(arn: arn)
        get_run(input)
      end

      def get_run(input : Types::GetRunRequest) : Types::GetRunResult
        request = Protocol::JsonRpc.build_request(Model::GET_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRunResult, "GetRun")
      end

      # Gets information about a suite.

      def get_suite(
        arn : String
      ) : Types::GetSuiteResult

        input = Types::GetSuiteRequest.new(arn: arn)
        get_suite(input)
      end

      def get_suite(input : Types::GetSuiteRequest) : Types::GetSuiteResult
        request = Protocol::JsonRpc.build_request(Model::GET_SUITE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSuiteResult, "GetSuite")
      end

      # Gets information about a test.

      def get_test(
        arn : String
      ) : Types::GetTestResult

        input = Types::GetTestRequest.new(arn: arn)
        get_test(input)
      end

      def get_test(input : Types::GetTestRequest) : Types::GetTestResult
        request = Protocol::JsonRpc.build_request(Model::GET_TEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTestResult, "GetTest")
      end

      # Retrieves information about a Selenium testing project.

      def get_test_grid_project(
        project_arn : String
      ) : Types::GetTestGridProjectResult

        input = Types::GetTestGridProjectRequest.new(project_arn: project_arn)
        get_test_grid_project(input)
      end

      def get_test_grid_project(input : Types::GetTestGridProjectRequest) : Types::GetTestGridProjectResult
        request = Protocol::JsonRpc.build_request(Model::GET_TEST_GRID_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTestGridProjectResult, "GetTestGridProject")
      end

      # A session is an instance of a browser created through a RemoteWebDriver with the URL from
      # CreateTestGridUrlResult$url . You can use the following to look up sessions: The session ARN (
      # GetTestGridSessionRequest$sessionArn ). The project ARN and a session ID (
      # GetTestGridSessionRequest$projectArn and GetTestGridSessionRequest$sessionId ).

      def get_test_grid_session(
        project_arn : String? = nil,
        session_arn : String? = nil,
        session_id : String? = nil
      ) : Types::GetTestGridSessionResult

        input = Types::GetTestGridSessionRequest.new(project_arn: project_arn, session_arn: session_arn, session_id: session_id)
        get_test_grid_session(input)
      end

      def get_test_grid_session(input : Types::GetTestGridSessionRequest) : Types::GetTestGridSessionResult
        request = Protocol::JsonRpc.build_request(Model::GET_TEST_GRID_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTestGridSessionResult, "GetTestGridSession")
      end

      # Gets information about an upload.

      def get_upload(
        arn : String
      ) : Types::GetUploadResult

        input = Types::GetUploadRequest.new(arn: arn)
        get_upload(input)
      end

      def get_upload(input : Types::GetUploadRequest) : Types::GetUploadResult
        request = Protocol::JsonRpc.build_request(Model::GET_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUploadResult, "GetUpload")
      end

      # Returns information about the configuration settings for your Amazon Virtual Private Cloud (VPC)
      # endpoint.

      def get_vpce_configuration(
        arn : String
      ) : Types::GetVPCEConfigurationResult

        input = Types::GetVPCEConfigurationRequest.new(arn: arn)
        get_vpce_configuration(input)
      end

      def get_vpce_configuration(input : Types::GetVPCEConfigurationRequest) : Types::GetVPCEConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::GET_VPCE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVPCEConfigurationResult, "GetVPCEConfiguration")
      end

      # Installs an application to the device in a remote access session. For Android applications, the file
      # must be in .apk format. For iOS applications, the file must be in .ipa format.

      def install_to_remote_access_session(
        app_arn : String,
        remote_access_session_arn : String
      ) : Types::InstallToRemoteAccessSessionResult

        input = Types::InstallToRemoteAccessSessionRequest.new(app_arn: app_arn, remote_access_session_arn: remote_access_session_arn)
        install_to_remote_access_session(input)
      end

      def install_to_remote_access_session(input : Types::InstallToRemoteAccessSessionRequest) : Types::InstallToRemoteAccessSessionResult
        request = Protocol::JsonRpc.build_request(Model::INSTALL_TO_REMOTE_ACCESS_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InstallToRemoteAccessSessionResult, "InstallToRemoteAccessSession")
      end

      # Gets information about artifacts.

      def list_artifacts(
        arn : String,
        type : String,
        next_token : String? = nil
      ) : Types::ListArtifactsResult

        input = Types::ListArtifactsRequest.new(arn: arn, type: type, next_token: next_token)
        list_artifacts(input)
      end

      def list_artifacts(input : Types::ListArtifactsRequest) : Types::ListArtifactsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ARTIFACTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListArtifactsResult, "ListArtifacts")
      end

      # Returns information about the private device instances associated with one or more AWS accounts.

      def list_device_instances(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDeviceInstancesResult

        input = Types::ListDeviceInstancesRequest.new(max_results: max_results, next_token: next_token)
        list_device_instances(input)
      end

      def list_device_instances(input : Types::ListDeviceInstancesRequest) : Types::ListDeviceInstancesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_DEVICE_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeviceInstancesResult, "ListDeviceInstances")
      end

      # Gets information about device pools.

      def list_device_pools(
        arn : String,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::ListDevicePoolsResult

        input = Types::ListDevicePoolsRequest.new(arn: arn, next_token: next_token, type: type)
        list_device_pools(input)
      end

      def list_device_pools(input : Types::ListDevicePoolsRequest) : Types::ListDevicePoolsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_DEVICE_POOLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDevicePoolsResult, "ListDevicePools")
      end

      # Gets information about unique device types.

      def list_devices(
        arn : String? = nil,
        filters : Array(Types::DeviceFilter)? = nil,
        next_token : String? = nil
      ) : Types::ListDevicesResult

        input = Types::ListDevicesRequest.new(arn: arn, filters: filters, next_token: next_token)
        list_devices(input)
      end

      def list_devices(input : Types::ListDevicesRequest) : Types::ListDevicesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDevicesResult, "ListDevices")
      end

      # Returns information about all the instance profiles in an AWS account.

      def list_instance_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInstanceProfilesResult

        input = Types::ListInstanceProfilesRequest.new(max_results: max_results, next_token: next_token)
        list_instance_profiles(input)
      end

      def list_instance_profiles(input : Types::ListInstanceProfilesRequest) : Types::ListInstanceProfilesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_INSTANCE_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInstanceProfilesResult, "ListInstanceProfiles")
      end

      # Gets information about jobs for a given test run.

      def list_jobs(
        arn : String,
        next_token : String? = nil
      ) : Types::ListJobsResult

        input = Types::ListJobsRequest.new(arn: arn, next_token: next_token)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Types::ListJobsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListJobsResult, "ListJobs")
      end

      # Returns the list of available network profiles.

      def list_network_profiles(
        arn : String,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::ListNetworkProfilesResult

        input = Types::ListNetworkProfilesRequest.new(arn: arn, next_token: next_token, type: type)
        list_network_profiles(input)
      end

      def list_network_profiles(input : Types::ListNetworkProfilesRequest) : Types::ListNetworkProfilesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_NETWORK_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNetworkProfilesResult, "ListNetworkProfiles")
      end

      # Returns a list of offering promotions. Each offering promotion record contains the ID and
      # description of the promotion. The API returns a NotEligible error if the caller is not permitted to
      # invoke the operation. Contact aws-devicefarm-support@amazon.com if you must be able to invoke this
      # operation.

      def list_offering_promotions(
        next_token : String? = nil
      ) : Types::ListOfferingPromotionsResult

        input = Types::ListOfferingPromotionsRequest.new(next_token: next_token)
        list_offering_promotions(input)
      end

      def list_offering_promotions(input : Types::ListOfferingPromotionsRequest) : Types::ListOfferingPromotionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_OFFERING_PROMOTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOfferingPromotionsResult, "ListOfferingPromotions")
      end

      # Returns a list of all historical purchases, renewals, and system renewal transactions for an AWS
      # account. The list is paginated and ordered by a descending timestamp (most recent transactions are
      # first). The API returns a NotEligible error if the user is not permitted to invoke the operation. If
      # you must be able to invoke this operation, contact aws-devicefarm-support@amazon.com .

      def list_offering_transactions(
        next_token : String? = nil
      ) : Types::ListOfferingTransactionsResult

        input = Types::ListOfferingTransactionsRequest.new(next_token: next_token)
        list_offering_transactions(input)
      end

      def list_offering_transactions(input : Types::ListOfferingTransactionsRequest) : Types::ListOfferingTransactionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_OFFERING_TRANSACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOfferingTransactionsResult, "ListOfferingTransactions")
      end

      # Returns a list of products or offerings that the user can manage through the API. Each offering
      # record indicates the recurring price per unit and the frequency for that offering. The API returns a
      # NotEligible error if the user is not permitted to invoke the operation. If you must be able to
      # invoke this operation, contact aws-devicefarm-support@amazon.com .

      def list_offerings(
        next_token : String? = nil
      ) : Types::ListOfferingsResult

        input = Types::ListOfferingsRequest.new(next_token: next_token)
        list_offerings(input)
      end

      def list_offerings(input : Types::ListOfferingsRequest) : Types::ListOfferingsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOfferingsResult, "ListOfferings")
      end

      # Gets information about projects.

      def list_projects(
        arn : String? = nil,
        next_token : String? = nil
      ) : Types::ListProjectsResult

        input = Types::ListProjectsRequest.new(arn: arn, next_token: next_token)
        list_projects(input)
      end

      def list_projects(input : Types::ListProjectsRequest) : Types::ListProjectsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProjectsResult, "ListProjects")
      end

      # Returns a list of all currently running remote access sessions.

      def list_remote_access_sessions(
        arn : String,
        next_token : String? = nil
      ) : Types::ListRemoteAccessSessionsResult

        input = Types::ListRemoteAccessSessionsRequest.new(arn: arn, next_token: next_token)
        list_remote_access_sessions(input)
      end

      def list_remote_access_sessions(input : Types::ListRemoteAccessSessionsRequest) : Types::ListRemoteAccessSessionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_REMOTE_ACCESS_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRemoteAccessSessionsResult, "ListRemoteAccessSessions")
      end

      # Gets information about runs, given an AWS Device Farm project ARN.

      def list_runs(
        arn : String,
        next_token : String? = nil
      ) : Types::ListRunsResult

        input = Types::ListRunsRequest.new(arn: arn, next_token: next_token)
        list_runs(input)
      end

      def list_runs(input : Types::ListRunsRequest) : Types::ListRunsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRunsResult, "ListRuns")
      end

      # Gets information about samples, given an AWS Device Farm job ARN.

      def list_samples(
        arn : String,
        next_token : String? = nil
      ) : Types::ListSamplesResult

        input = Types::ListSamplesRequest.new(arn: arn, next_token: next_token)
        list_samples(input)
      end

      def list_samples(input : Types::ListSamplesRequest) : Types::ListSamplesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_SAMPLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSamplesResult, "ListSamples")
      end

      # Gets information about test suites for a given job.

      def list_suites(
        arn : String,
        next_token : String? = nil
      ) : Types::ListSuitesResult

        input = Types::ListSuitesRequest.new(arn: arn, next_token: next_token)
        list_suites(input)
      end

      def list_suites(input : Types::ListSuitesRequest) : Types::ListSuitesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_SUITES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSuitesResult, "ListSuites")
      end

      # List the tags for an AWS Device Farm resource.

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

      # Gets a list of all Selenium testing projects in your account.

      def list_test_grid_projects(
        max_result : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTestGridProjectsResult

        input = Types::ListTestGridProjectsRequest.new(max_result: max_result, next_token: next_token)
        list_test_grid_projects(input)
      end

      def list_test_grid_projects(input : Types::ListTestGridProjectsRequest) : Types::ListTestGridProjectsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TEST_GRID_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTestGridProjectsResult, "ListTestGridProjects")
      end

      # Returns a list of the actions taken in a TestGridSession .

      def list_test_grid_session_actions(
        session_arn : String,
        max_result : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTestGridSessionActionsResult

        input = Types::ListTestGridSessionActionsRequest.new(session_arn: session_arn, max_result: max_result, next_token: next_token)
        list_test_grid_session_actions(input)
      end

      def list_test_grid_session_actions(input : Types::ListTestGridSessionActionsRequest) : Types::ListTestGridSessionActionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TEST_GRID_SESSION_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTestGridSessionActionsResult, "ListTestGridSessionActions")
      end

      # Retrieves a list of artifacts created during the session.

      def list_test_grid_session_artifacts(
        session_arn : String,
        max_result : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::ListTestGridSessionArtifactsResult

        input = Types::ListTestGridSessionArtifactsRequest.new(session_arn: session_arn, max_result: max_result, next_token: next_token, type: type)
        list_test_grid_session_artifacts(input)
      end

      def list_test_grid_session_artifacts(input : Types::ListTestGridSessionArtifactsRequest) : Types::ListTestGridSessionArtifactsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TEST_GRID_SESSION_ARTIFACTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTestGridSessionArtifactsResult, "ListTestGridSessionArtifacts")
      end

      # Retrieves a list of sessions for a TestGridProject .

      def list_test_grid_sessions(
        project_arn : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        end_time_after : Time? = nil,
        end_time_before : Time? = nil,
        max_result : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListTestGridSessionsResult

        input = Types::ListTestGridSessionsRequest.new(project_arn: project_arn, creation_time_after: creation_time_after, creation_time_before: creation_time_before, end_time_after: end_time_after, end_time_before: end_time_before, max_result: max_result, next_token: next_token, status: status)
        list_test_grid_sessions(input)
      end

      def list_test_grid_sessions(input : Types::ListTestGridSessionsRequest) : Types::ListTestGridSessionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TEST_GRID_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTestGridSessionsResult, "ListTestGridSessions")
      end

      # Gets information about tests in a given test suite.

      def list_tests(
        arn : String,
        next_token : String? = nil
      ) : Types::ListTestsResult

        input = Types::ListTestsRequest.new(arn: arn, next_token: next_token)
        list_tests(input)
      end

      def list_tests(input : Types::ListTestsRequest) : Types::ListTestsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTestsResult, "ListTests")
      end

      # Gets information about unique problems, such as exceptions or crashes. Unique problems are defined
      # as a single instance of an error across a run, job, or suite. For example, if a call in your
      # application consistently raises an exception ( OutOfBoundsException in MyActivity.java:386 ),
      # ListUniqueProblems returns a single entry instead of many individual entries for that exception.

      def list_unique_problems(
        arn : String,
        next_token : String? = nil
      ) : Types::ListUniqueProblemsResult

        input = Types::ListUniqueProblemsRequest.new(arn: arn, next_token: next_token)
        list_unique_problems(input)
      end

      def list_unique_problems(input : Types::ListUniqueProblemsRequest) : Types::ListUniqueProblemsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_UNIQUE_PROBLEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUniqueProblemsResult, "ListUniqueProblems")
      end

      # Gets information about uploads, given an AWS Device Farm project ARN.

      def list_uploads(
        arn : String,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::ListUploadsResult

        input = Types::ListUploadsRequest.new(arn: arn, next_token: next_token, type: type)
        list_uploads(input)
      end

      def list_uploads(input : Types::ListUploadsRequest) : Types::ListUploadsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_UPLOADS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUploadsResult, "ListUploads")
      end

      # Returns information about all Amazon Virtual Private Cloud (VPC) endpoint configurations in the AWS
      # account.

      def list_vpce_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListVPCEConfigurationsResult

        input = Types::ListVPCEConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_vpce_configurations(input)
      end

      def list_vpce_configurations(input : Types::ListVPCEConfigurationsRequest) : Types::ListVPCEConfigurationsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_VPCE_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVPCEConfigurationsResult, "ListVPCEConfigurations")
      end

      # Immediately purchases offerings for an AWS account. Offerings renew with the latest total purchased
      # quantity for an offering, unless the renewal was overridden. The API returns a NotEligible error if
      # the user is not permitted to invoke the operation. If you must be able to invoke this operation,
      # contact aws-devicefarm-support@amazon.com .

      def purchase_offering(
        offering_id : String,
        quantity : Int32,
        offering_promotion_id : String? = nil
      ) : Types::PurchaseOfferingResult

        input = Types::PurchaseOfferingRequest.new(offering_id: offering_id, quantity: quantity, offering_promotion_id: offering_promotion_id)
        purchase_offering(input)
      end

      def purchase_offering(input : Types::PurchaseOfferingRequest) : Types::PurchaseOfferingResult
        request = Protocol::JsonRpc.build_request(Model::PURCHASE_OFFERING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PurchaseOfferingResult, "PurchaseOffering")
      end

      # Explicitly sets the quantity of devices to renew for an offering, starting from the effectiveDate of
      # the next period. The API returns a NotEligible error if the user is not permitted to invoke the
      # operation. If you must be able to invoke this operation, contact aws-devicefarm-support@amazon.com .

      def renew_offering(
        offering_id : String,
        quantity : Int32
      ) : Types::RenewOfferingResult

        input = Types::RenewOfferingRequest.new(offering_id: offering_id, quantity: quantity)
        renew_offering(input)
      end

      def renew_offering(input : Types::RenewOfferingRequest) : Types::RenewOfferingResult
        request = Protocol::JsonRpc.build_request(Model::RENEW_OFFERING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RenewOfferingResult, "RenewOffering")
      end

      # Schedules a run.

      def schedule_run(
        project_arn : String,
        test : Types::ScheduleRunTest,
        app_arn : String? = nil,
        configuration : Types::ScheduleRunConfiguration? = nil,
        device_pool_arn : String? = nil,
        device_selection_configuration : Types::DeviceSelectionConfiguration? = nil,
        execution_configuration : Types::ExecutionConfiguration? = nil,
        name : String? = nil
      ) : Types::ScheduleRunResult

        input = Types::ScheduleRunRequest.new(project_arn: project_arn, test: test, app_arn: app_arn, configuration: configuration, device_pool_arn: device_pool_arn, device_selection_configuration: device_selection_configuration, execution_configuration: execution_configuration, name: name)
        schedule_run(input)
      end

      def schedule_run(input : Types::ScheduleRunRequest) : Types::ScheduleRunResult
        request = Protocol::JsonRpc.build_request(Model::SCHEDULE_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ScheduleRunResult, "ScheduleRun")
      end

      # Initiates a stop request for the current job. AWS Device Farm immediately stops the job on the
      # device where tests have not started. You are not billed for this device. On the device where tests
      # have started, setup suite and teardown suite tests run to completion on the device. You are billed
      # for setup, teardown, and any tests that were in progress or already completed.

      def stop_job(
        arn : String
      ) : Types::StopJobResult

        input = Types::StopJobRequest.new(arn: arn)
        stop_job(input)
      end

      def stop_job(input : Types::StopJobRequest) : Types::StopJobResult
        request = Protocol::JsonRpc.build_request(Model::STOP_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopJobResult, "StopJob")
      end

      # Ends a specified remote access session.

      def stop_remote_access_session(
        arn : String
      ) : Types::StopRemoteAccessSessionResult

        input = Types::StopRemoteAccessSessionRequest.new(arn: arn)
        stop_remote_access_session(input)
      end

      def stop_remote_access_session(input : Types::StopRemoteAccessSessionRequest) : Types::StopRemoteAccessSessionResult
        request = Protocol::JsonRpc.build_request(Model::STOP_REMOTE_ACCESS_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopRemoteAccessSessionResult, "StopRemoteAccessSession")
      end

      # Initiates a stop request for the current test run. AWS Device Farm immediately stops the run on
      # devices where tests have not started. You are not billed for these devices. On devices where tests
      # have started executing, setup suite and teardown suite tests run to completion on those devices. You
      # are billed for setup, teardown, and any tests that were in progress or already completed.

      def stop_run(
        arn : String
      ) : Types::StopRunResult

        input = Types::StopRunRequest.new(arn: arn)
        stop_run(input)
      end

      def stop_run(input : Types::StopRunRequest) : Types::StopRunResult
        request = Protocol::JsonRpc.build_request(Model::STOP_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopRunResult, "StopRun")
      end

      # Associates the specified tags to a resource with the specified resourceArn . If existing tags on a
      # resource are not specified in the request parameters, they are not changed. When a resource is
      # deleted, the tags associated with that resource are also deleted.

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

      # Deletes the specified tags from a resource.

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

      # Updates information about a private device instance.

      def update_device_instance(
        arn : String,
        labels : Array(String)? = nil,
        profile_arn : String? = nil
      ) : Types::UpdateDeviceInstanceResult

        input = Types::UpdateDeviceInstanceRequest.new(arn: arn, labels: labels, profile_arn: profile_arn)
        update_device_instance(input)
      end

      def update_device_instance(input : Types::UpdateDeviceInstanceRequest) : Types::UpdateDeviceInstanceResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEVICE_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDeviceInstanceResult, "UpdateDeviceInstance")
      end

      # Modifies the name, description, and rules in a device pool given the attributes and the pool ARN.
      # Rule updates are all-or-nothing, meaning they can only be updated as a whole (or not at all).

      def update_device_pool(
        arn : String,
        clear_max_devices : Bool? = nil,
        description : String? = nil,
        max_devices : Int32? = nil,
        name : String? = nil,
        rules : Array(Types::Rule)? = nil
      ) : Types::UpdateDevicePoolResult

        input = Types::UpdateDevicePoolRequest.new(arn: arn, clear_max_devices: clear_max_devices, description: description, max_devices: max_devices, name: name, rules: rules)
        update_device_pool(input)
      end

      def update_device_pool(input : Types::UpdateDevicePoolRequest) : Types::UpdateDevicePoolResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEVICE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDevicePoolResult, "UpdateDevicePool")
      end

      # Updates information about an existing private device instance profile.

      def update_instance_profile(
        arn : String,
        description : String? = nil,
        exclude_app_packages_from_cleanup : Array(String)? = nil,
        name : String? = nil,
        package_cleanup : Bool? = nil,
        reboot_after_use : Bool? = nil
      ) : Types::UpdateInstanceProfileResult

        input = Types::UpdateInstanceProfileRequest.new(arn: arn, description: description, exclude_app_packages_from_cleanup: exclude_app_packages_from_cleanup, name: name, package_cleanup: package_cleanup, reboot_after_use: reboot_after_use)
        update_instance_profile(input)
      end

      def update_instance_profile(input : Types::UpdateInstanceProfileRequest) : Types::UpdateInstanceProfileResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInstanceProfileResult, "UpdateInstanceProfile")
      end

      # Updates the network profile.

      def update_network_profile(
        arn : String,
        description : String? = nil,
        downlink_bandwidth_bits : Int64? = nil,
        downlink_delay_ms : Int64? = nil,
        downlink_jitter_ms : Int64? = nil,
        downlink_loss_percent : Int32? = nil,
        name : String? = nil,
        type : String? = nil,
        uplink_bandwidth_bits : Int64? = nil,
        uplink_delay_ms : Int64? = nil,
        uplink_jitter_ms : Int64? = nil,
        uplink_loss_percent : Int32? = nil
      ) : Types::UpdateNetworkProfileResult

        input = Types::UpdateNetworkProfileRequest.new(arn: arn, description: description, downlink_bandwidth_bits: downlink_bandwidth_bits, downlink_delay_ms: downlink_delay_ms, downlink_jitter_ms: downlink_jitter_ms, downlink_loss_percent: downlink_loss_percent, name: name, type: type, uplink_bandwidth_bits: uplink_bandwidth_bits, uplink_delay_ms: uplink_delay_ms, uplink_jitter_ms: uplink_jitter_ms, uplink_loss_percent: uplink_loss_percent)
        update_network_profile(input)
      end

      def update_network_profile(input : Types::UpdateNetworkProfileRequest) : Types::UpdateNetworkProfileResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NETWORK_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNetworkProfileResult, "UpdateNetworkProfile")
      end

      # Modifies the specified project name, given the project ARN and a new name.

      def update_project(
        arn : String,
        default_job_timeout_minutes : Int32? = nil,
        environment_variables : Array(Types::EnvironmentVariable)? = nil,
        execution_role_arn : String? = nil,
        name : String? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::UpdateProjectResult

        input = Types::UpdateProjectRequest.new(arn: arn, default_job_timeout_minutes: default_job_timeout_minutes, environment_variables: environment_variables, execution_role_arn: execution_role_arn, name: name, vpc_config: vpc_config)
        update_project(input)
      end

      def update_project(input : Types::UpdateProjectRequest) : Types::UpdateProjectResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProjectResult, "UpdateProject")
      end

      # Change details of a project.

      def update_test_grid_project(
        project_arn : String,
        description : String? = nil,
        name : String? = nil,
        vpc_config : Types::TestGridVpcConfig? = nil
      ) : Types::UpdateTestGridProjectResult

        input = Types::UpdateTestGridProjectRequest.new(project_arn: project_arn, description: description, name: name, vpc_config: vpc_config)
        update_test_grid_project(input)
      end

      def update_test_grid_project(input : Types::UpdateTestGridProjectRequest) : Types::UpdateTestGridProjectResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TEST_GRID_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTestGridProjectResult, "UpdateTestGridProject")
      end

      # Updates an uploaded test spec.

      def update_upload(
        arn : String,
        content_type : String? = nil,
        edit_content : Bool? = nil,
        name : String? = nil
      ) : Types::UpdateUploadResult

        input = Types::UpdateUploadRequest.new(arn: arn, content_type: content_type, edit_content: edit_content, name: name)
        update_upload(input)
      end

      def update_upload(input : Types::UpdateUploadRequest) : Types::UpdateUploadResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUploadResult, "UpdateUpload")
      end

      # Updates information about an Amazon Virtual Private Cloud (VPC) endpoint configuration.

      def update_vpce_configuration(
        arn : String,
        service_dns_name : String? = nil,
        vpce_configuration_description : String? = nil,
        vpce_configuration_name : String? = nil,
        vpce_service_name : String? = nil
      ) : Types::UpdateVPCEConfigurationResult

        input = Types::UpdateVPCEConfigurationRequest.new(arn: arn, service_dns_name: service_dns_name, vpce_configuration_description: vpce_configuration_description, vpce_configuration_name: vpce_configuration_name, vpce_service_name: vpce_service_name)
        update_vpce_configuration(input)
      end

      def update_vpce_configuration(input : Types::UpdateVPCEConfigurationRequest) : Types::UpdateVPCEConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VPCE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVPCEConfigurationResult, "UpdateVPCEConfiguration")
      end
    end
  end
end
