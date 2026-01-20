module AwsSdk
  module DataSync
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

      # Stops an DataSync task execution that's in progress. The transfer of some files are abruptly
      # interrupted. File contents that're transferred to the destination might be incomplete or
      # inconsistent with the source files. However, if you start a new task execution using the same task
      # and allow it to finish, file content on the destination will be complete and consistent. This
      # applies to other unexpected failures that interrupt a task execution. In all of these cases,
      # DataSync successfully completes the transfer when you start the next task execution.

      def cancel_task_execution(
        task_execution_arn : String
      ) : Types::CancelTaskExecutionResponse

        input = Types::CancelTaskExecutionRequest.new(task_execution_arn: task_execution_arn)
        cancel_task_execution(input)
      end

      def cancel_task_execution(input : Types::CancelTaskExecutionRequest) : Types::CancelTaskExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_TASK_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelTaskExecutionResponse, "CancelTaskExecution")
      end

      # Activates an DataSync agent that you deploy in your storage environment. The activation process
      # associates the agent with your Amazon Web Services account. If you haven't deployed an agent yet,
      # see Do I need a DataSync agent?

      def create_agent(
        activation_key : String,
        agent_name : String? = nil,
        security_group_arns : Array(String)? = nil,
        subnet_arns : Array(String)? = nil,
        tags : Array(Types::TagListEntry)? = nil,
        vpc_endpoint_id : String? = nil
      ) : Types::CreateAgentResponse

        input = Types::CreateAgentRequest.new(activation_key: activation_key, agent_name: agent_name, security_group_arns: security_group_arns, subnet_arns: subnet_arns, tags: tags, vpc_endpoint_id: vpc_endpoint_id)
        create_agent(input)
      end

      def create_agent(input : Types::CreateAgentRequest) : Types::CreateAgentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AGENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAgentResponse, "CreateAgent")
      end

      # Creates a transfer location for a Microsoft Azure Blob Storage container. DataSync can use this
      # location as a transfer source or destination. You can make transfers with or without a DataSync
      # agent that connects to your container. Before you begin, make sure you know how DataSync accesses
      # Azure Blob Storage and works with access tiers and blob types .

      def create_location_azure_blob(
        authentication_type : String,
        container_url : String,
        access_tier : String? = nil,
        agent_arns : Array(String)? = nil,
        blob_type : String? = nil,
        cmk_secret_config : Types::CmkSecretConfig? = nil,
        custom_secret_config : Types::CustomSecretConfig? = nil,
        sas_configuration : Types::AzureBlobSasConfiguration? = nil,
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationAzureBlobResponse

        input = Types::CreateLocationAzureBlobRequest.new(authentication_type: authentication_type, container_url: container_url, access_tier: access_tier, agent_arns: agent_arns, blob_type: blob_type, cmk_secret_config: cmk_secret_config, custom_secret_config: custom_secret_config, sas_configuration: sas_configuration, subdirectory: subdirectory, tags: tags)
        create_location_azure_blob(input)
      end

      def create_location_azure_blob(input : Types::CreateLocationAzureBlobRequest) : Types::CreateLocationAzureBlobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_AZURE_BLOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationAzureBlobResponse, "CreateLocationAzureBlob")
      end

      # Creates a transfer location for an Amazon EFS file system. DataSync can use this location as a
      # source or destination for transferring data. Before you begin, make sure that you understand how
      # DataSync accesses Amazon EFS file systems .

      def create_location_efs(
        ec2_config : Types::Ec2Config,
        efs_filesystem_arn : String,
        access_point_arn : String? = nil,
        file_system_access_role_arn : String? = nil,
        in_transit_encryption : String? = nil,
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationEfsResponse

        input = Types::CreateLocationEfsRequest.new(ec2_config: ec2_config, efs_filesystem_arn: efs_filesystem_arn, access_point_arn: access_point_arn, file_system_access_role_arn: file_system_access_role_arn, in_transit_encryption: in_transit_encryption, subdirectory: subdirectory, tags: tags)
        create_location_efs(input)
      end

      def create_location_efs(input : Types::CreateLocationEfsRequest) : Types::CreateLocationEfsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_EFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationEfsResponse, "CreateLocationEfs")
      end

      # Creates a transfer location for an Amazon FSx for Lustre file system. DataSync can use this location
      # as a source or destination for transferring data. Before you begin, make sure that you understand
      # how DataSync accesses FSx for Lustre file systems .

      def create_location_fsx_lustre(
        fsx_filesystem_arn : String,
        security_group_arns : Array(String),
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationFsxLustreResponse

        input = Types::CreateLocationFsxLustreRequest.new(fsx_filesystem_arn: fsx_filesystem_arn, security_group_arns: security_group_arns, subdirectory: subdirectory, tags: tags)
        create_location_fsx_lustre(input)
      end

      def create_location_fsx_lustre(input : Types::CreateLocationFsxLustreRequest) : Types::CreateLocationFsxLustreResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_FSX_LUSTRE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationFsxLustreResponse, "CreateLocationFsxLustre")
      end

      # Creates a transfer location for an Amazon FSx for NetApp ONTAP file system. DataSync can use this
      # location as a source or destination for transferring data. Before you begin, make sure that you
      # understand how DataSync accesses FSx for ONTAP file systems .

      def create_location_fsx_ontap(
        protocol : Types::FsxProtocol,
        security_group_arns : Array(String),
        storage_virtual_machine_arn : String,
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationFsxOntapResponse

        input = Types::CreateLocationFsxOntapRequest.new(protocol: protocol, security_group_arns: security_group_arns, storage_virtual_machine_arn: storage_virtual_machine_arn, subdirectory: subdirectory, tags: tags)
        create_location_fsx_ontap(input)
      end

      def create_location_fsx_ontap(input : Types::CreateLocationFsxOntapRequest) : Types::CreateLocationFsxOntapResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_FSX_ONTAP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationFsxOntapResponse, "CreateLocationFsxOntap")
      end

      # Creates a transfer location for an Amazon FSx for OpenZFS file system. DataSync can use this
      # location as a source or destination for transferring data. Before you begin, make sure that you
      # understand how DataSync accesses FSx for OpenZFS file systems . Request parameters related to SMB
      # aren't supported with the CreateLocationFsxOpenZfs operation.

      def create_location_fsx_open_zfs(
        fsx_filesystem_arn : String,
        protocol : Types::FsxProtocol,
        security_group_arns : Array(String),
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationFsxOpenZfsResponse

        input = Types::CreateLocationFsxOpenZfsRequest.new(fsx_filesystem_arn: fsx_filesystem_arn, protocol: protocol, security_group_arns: security_group_arns, subdirectory: subdirectory, tags: tags)
        create_location_fsx_open_zfs(input)
      end

      def create_location_fsx_open_zfs(input : Types::CreateLocationFsxOpenZfsRequest) : Types::CreateLocationFsxOpenZfsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_FSX_OPEN_ZFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationFsxOpenZfsResponse, "CreateLocationFsxOpenZfs")
      end

      # Creates a transfer location for an Amazon FSx for Windows File Server file system. DataSync can use
      # this location as a source or destination for transferring data. Before you begin, make sure that you
      # understand how DataSync accesses FSx for Windows File Server file systems .

      def create_location_fsx_windows(
        fsx_filesystem_arn : String,
        password : String,
        security_group_arns : Array(String),
        user : String,
        domain : String? = nil,
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationFsxWindowsResponse

        input = Types::CreateLocationFsxWindowsRequest.new(fsx_filesystem_arn: fsx_filesystem_arn, password: password, security_group_arns: security_group_arns, user: user, domain: domain, subdirectory: subdirectory, tags: tags)
        create_location_fsx_windows(input)
      end

      def create_location_fsx_windows(input : Types::CreateLocationFsxWindowsRequest) : Types::CreateLocationFsxWindowsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_FSX_WINDOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationFsxWindowsResponse, "CreateLocationFsxWindows")
      end

      # Creates a transfer location for a Hadoop Distributed File System (HDFS). DataSync can use this
      # location as a source or destination for transferring data. Before you begin, make sure that you
      # understand how DataSync accesses HDFS clusters .

      def create_location_hdfs(
        agent_arns : Array(String),
        authentication_type : String,
        name_nodes : Array(Types::HdfsNameNode),
        block_size : Int32? = nil,
        kerberos_keytab : Bytes? = nil,
        kerberos_krb5_conf : Bytes? = nil,
        kerberos_principal : String? = nil,
        kms_key_provider_uri : String? = nil,
        qop_configuration : Types::QopConfiguration? = nil,
        replication_factor : Int32? = nil,
        simple_user : String? = nil,
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationHdfsResponse

        input = Types::CreateLocationHdfsRequest.new(agent_arns: agent_arns, authentication_type: authentication_type, name_nodes: name_nodes, block_size: block_size, kerberos_keytab: kerberos_keytab, kerberos_krb5_conf: kerberos_krb5_conf, kerberos_principal: kerberos_principal, kms_key_provider_uri: kms_key_provider_uri, qop_configuration: qop_configuration, replication_factor: replication_factor, simple_user: simple_user, subdirectory: subdirectory, tags: tags)
        create_location_hdfs(input)
      end

      def create_location_hdfs(input : Types::CreateLocationHdfsRequest) : Types::CreateLocationHdfsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_HDFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationHdfsResponse, "CreateLocationHdfs")
      end

      # Creates a transfer location for a Network File System (NFS) file server. DataSync can use this
      # location as a source or destination for transferring data. Before you begin, make sure that you
      # understand how DataSync accesses NFS file servers .

      def create_location_nfs(
        on_prem_config : Types::OnPremConfig,
        server_hostname : String,
        subdirectory : String,
        mount_options : Types::NfsMountOptions? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationNfsResponse

        input = Types::CreateLocationNfsRequest.new(on_prem_config: on_prem_config, server_hostname: server_hostname, subdirectory: subdirectory, mount_options: mount_options, tags: tags)
        create_location_nfs(input)
      end

      def create_location_nfs(input : Types::CreateLocationNfsRequest) : Types::CreateLocationNfsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_NFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationNfsResponse, "CreateLocationNfs")
      end

      # Creates a transfer location for an object storage system. DataSync can use this location as a source
      # or destination for transferring data. You can make transfers with or without a DataSync agent .
      # Before you begin, make sure that you understand the prerequisites for DataSync to work with object
      # storage systems.

      def create_location_object_storage(
        bucket_name : String,
        server_hostname : String,
        access_key : String? = nil,
        agent_arns : Array(String)? = nil,
        cmk_secret_config : Types::CmkSecretConfig? = nil,
        custom_secret_config : Types::CustomSecretConfig? = nil,
        secret_key : String? = nil,
        server_certificate : Bytes? = nil,
        server_port : Int32? = nil,
        server_protocol : String? = nil,
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationObjectStorageResponse

        input = Types::CreateLocationObjectStorageRequest.new(bucket_name: bucket_name, server_hostname: server_hostname, access_key: access_key, agent_arns: agent_arns, cmk_secret_config: cmk_secret_config, custom_secret_config: custom_secret_config, secret_key: secret_key, server_certificate: server_certificate, server_port: server_port, server_protocol: server_protocol, subdirectory: subdirectory, tags: tags)
        create_location_object_storage(input)
      end

      def create_location_object_storage(input : Types::CreateLocationObjectStorageRequest) : Types::CreateLocationObjectStorageResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_OBJECT_STORAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationObjectStorageResponse, "CreateLocationObjectStorage")
      end

      # Creates a transfer location for an Amazon S3 bucket. DataSync can use this location as a source or
      # destination for transferring data. Before you begin, make sure that you read the following topics:
      # Storage class considerations with Amazon S3 locations Evaluating S3 request costs when using
      # DataSync For more information, see Configuring transfers with Amazon S3 .

      def create_location_s3(
        s3_bucket_arn : String,
        s3_config : Types::S3Config,
        agent_arns : Array(String)? = nil,
        s3_storage_class : String? = nil,
        subdirectory : String? = nil,
        tags : Array(Types::TagListEntry)? = nil
      ) : Types::CreateLocationS3Response

        input = Types::CreateLocationS3Request.new(s3_bucket_arn: s3_bucket_arn, s3_config: s3_config, agent_arns: agent_arns, s3_storage_class: s3_storage_class, subdirectory: subdirectory, tags: tags)
        create_location_s3(input)
      end

      def create_location_s3(input : Types::CreateLocationS3Request) : Types::CreateLocationS3Response
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_S3, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationS3Response, "CreateLocationS3")
      end

      # Creates a transfer location for a Server Message Block (SMB) file server. DataSync can use this
      # location as a source or destination for transferring data. Before you begin, make sure that you
      # understand how DataSync accesses SMB file servers. For more information, see Providing DataSync
      # access to SMB file servers .

      def create_location_smb(
        agent_arns : Array(String),
        server_hostname : String,
        subdirectory : String,
        authentication_type : String? = nil,
        cmk_secret_config : Types::CmkSecretConfig? = nil,
        custom_secret_config : Types::CustomSecretConfig? = nil,
        dns_ip_addresses : Array(String)? = nil,
        domain : String? = nil,
        kerberos_keytab : Bytes? = nil,
        kerberos_krb5_conf : Bytes? = nil,
        kerberos_principal : String? = nil,
        mount_options : Types::SmbMountOptions? = nil,
        password : String? = nil,
        tags : Array(Types::TagListEntry)? = nil,
        user : String? = nil
      ) : Types::CreateLocationSmbResponse

        input = Types::CreateLocationSmbRequest.new(agent_arns: agent_arns, server_hostname: server_hostname, subdirectory: subdirectory, authentication_type: authentication_type, cmk_secret_config: cmk_secret_config, custom_secret_config: custom_secret_config, dns_ip_addresses: dns_ip_addresses, domain: domain, kerberos_keytab: kerberos_keytab, kerberos_krb5_conf: kerberos_krb5_conf, kerberos_principal: kerberos_principal, mount_options: mount_options, password: password, tags: tags, user: user)
        create_location_smb(input)
      end

      def create_location_smb(input : Types::CreateLocationSmbRequest) : Types::CreateLocationSmbResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LOCATION_SMB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLocationSmbResponse, "CreateLocationSmb")
      end

      # Configures a task , which defines where and how DataSync transfers your data. A task includes a
      # source location, destination location, and transfer options (such as bandwidth limits, scheduling,
      # and more). If you're planning to transfer data to or from an Amazon S3 location, review how DataSync
      # can affect your S3 request charges and the DataSync pricing page before you begin.

      def create_task(
        destination_location_arn : String,
        source_location_arn : String,
        cloud_watch_log_group_arn : String? = nil,
        excludes : Array(Types::FilterRule)? = nil,
        includes : Array(Types::FilterRule)? = nil,
        manifest_config : Types::ManifestConfig? = nil,
        name : String? = nil,
        options : Types::Options? = nil,
        schedule : Types::TaskSchedule? = nil,
        tags : Array(Types::TagListEntry)? = nil,
        task_mode : String? = nil,
        task_report_config : Types::TaskReportConfig? = nil
      ) : Types::CreateTaskResponse

        input = Types::CreateTaskRequest.new(destination_location_arn: destination_location_arn, source_location_arn: source_location_arn, cloud_watch_log_group_arn: cloud_watch_log_group_arn, excludes: excludes, includes: includes, manifest_config: manifest_config, name: name, options: options, schedule: schedule, tags: tags, task_mode: task_mode, task_report_config: task_report_config)
        create_task(input)
      end

      def create_task(input : Types::CreateTaskRequest) : Types::CreateTaskResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTaskResponse, "CreateTask")
      end

      # Removes an DataSync agent resource from your Amazon Web Services account. Keep in mind that this
      # operation (which can't be undone) doesn't remove the agent's virtual machine (VM) or Amazon EC2
      # instance from your storage environment. For next steps, you can delete the VM or instance from your
      # storage environment or reuse it to activate a new agent .

      def delete_agent(
        agent_arn : String
      ) : Types::DeleteAgentResponse

        input = Types::DeleteAgentRequest.new(agent_arn: agent_arn)
        delete_agent(input)
      end

      def delete_agent(input : Types::DeleteAgentRequest) : Types::DeleteAgentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_AGENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAgentResponse, "DeleteAgent")
      end

      # Deletes a transfer location resource from DataSync.

      def delete_location(
        location_arn : String
      ) : Types::DeleteLocationResponse

        input = Types::DeleteLocationRequest.new(location_arn: location_arn)
        delete_location(input)
      end

      def delete_location(input : Types::DeleteLocationRequest) : Types::DeleteLocationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLocationResponse, "DeleteLocation")
      end

      # Deletes a transfer task resource from DataSync.

      def delete_task(
        task_arn : String
      ) : Types::DeleteTaskResponse

        input = Types::DeleteTaskRequest.new(task_arn: task_arn)
        delete_task(input)
      end

      def delete_task(input : Types::DeleteTaskRequest) : Types::DeleteTaskResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTaskResponse, "DeleteTask")
      end

      # Returns information about an DataSync agent, such as its name, service endpoint type, and status.

      def describe_agent(
        agent_arn : String
      ) : Types::DescribeAgentResponse

        input = Types::DescribeAgentRequest.new(agent_arn: agent_arn)
        describe_agent(input)
      end

      def describe_agent(input : Types::DescribeAgentRequest) : Types::DescribeAgentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AGENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAgentResponse, "DescribeAgent")
      end

      # Provides details about how an DataSync transfer location for Microsoft Azure Blob Storage is
      # configured.

      def describe_location_azure_blob(
        location_arn : String
      ) : Types::DescribeLocationAzureBlobResponse

        input = Types::DescribeLocationAzureBlobRequest.new(location_arn: location_arn)
        describe_location_azure_blob(input)
      end

      def describe_location_azure_blob(input : Types::DescribeLocationAzureBlobRequest) : Types::DescribeLocationAzureBlobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_AZURE_BLOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationAzureBlobResponse, "DescribeLocationAzureBlob")
      end

      # Provides details about how an DataSync transfer location for an Amazon EFS file system is
      # configured.

      def describe_location_efs(
        location_arn : String
      ) : Types::DescribeLocationEfsResponse

        input = Types::DescribeLocationEfsRequest.new(location_arn: location_arn)
        describe_location_efs(input)
      end

      def describe_location_efs(input : Types::DescribeLocationEfsRequest) : Types::DescribeLocationEfsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_EFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationEfsResponse, "DescribeLocationEfs")
      end

      # Provides details about how an DataSync transfer location for an Amazon FSx for Lustre file system is
      # configured.

      def describe_location_fsx_lustre(
        location_arn : String
      ) : Types::DescribeLocationFsxLustreResponse

        input = Types::DescribeLocationFsxLustreRequest.new(location_arn: location_arn)
        describe_location_fsx_lustre(input)
      end

      def describe_location_fsx_lustre(input : Types::DescribeLocationFsxLustreRequest) : Types::DescribeLocationFsxLustreResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_FSX_LUSTRE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationFsxLustreResponse, "DescribeLocationFsxLustre")
      end

      # Provides details about how an DataSync transfer location for an Amazon FSx for NetApp ONTAP file
      # system is configured. If your location uses SMB, the DescribeLocationFsxOntap operation doesn't
      # actually return a Password .

      def describe_location_fsx_ontap(
        location_arn : String
      ) : Types::DescribeLocationFsxOntapResponse

        input = Types::DescribeLocationFsxOntapRequest.new(location_arn: location_arn)
        describe_location_fsx_ontap(input)
      end

      def describe_location_fsx_ontap(input : Types::DescribeLocationFsxOntapRequest) : Types::DescribeLocationFsxOntapResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_FSX_ONTAP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationFsxOntapResponse, "DescribeLocationFsxOntap")
      end

      # Provides details about how an DataSync transfer location for an Amazon FSx for OpenZFS file system
      # is configured. Response elements related to SMB aren't supported with the DescribeLocationFsxOpenZfs
      # operation.

      def describe_location_fsx_open_zfs(
        location_arn : String
      ) : Types::DescribeLocationFsxOpenZfsResponse

        input = Types::DescribeLocationFsxOpenZfsRequest.new(location_arn: location_arn)
        describe_location_fsx_open_zfs(input)
      end

      def describe_location_fsx_open_zfs(input : Types::DescribeLocationFsxOpenZfsRequest) : Types::DescribeLocationFsxOpenZfsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_FSX_OPEN_ZFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationFsxOpenZfsResponse, "DescribeLocationFsxOpenZfs")
      end

      # Provides details about how an DataSync transfer location for an Amazon FSx for Windows File Server
      # file system is configured.

      def describe_location_fsx_windows(
        location_arn : String
      ) : Types::DescribeLocationFsxWindowsResponse

        input = Types::DescribeLocationFsxWindowsRequest.new(location_arn: location_arn)
        describe_location_fsx_windows(input)
      end

      def describe_location_fsx_windows(input : Types::DescribeLocationFsxWindowsRequest) : Types::DescribeLocationFsxWindowsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_FSX_WINDOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationFsxWindowsResponse, "DescribeLocationFsxWindows")
      end

      # Provides details about how an DataSync transfer location for a Hadoop Distributed File System (HDFS)
      # is configured.

      def describe_location_hdfs(
        location_arn : String
      ) : Types::DescribeLocationHdfsResponse

        input = Types::DescribeLocationHdfsRequest.new(location_arn: location_arn)
        describe_location_hdfs(input)
      end

      def describe_location_hdfs(input : Types::DescribeLocationHdfsRequest) : Types::DescribeLocationHdfsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_HDFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationHdfsResponse, "DescribeLocationHdfs")
      end

      # Provides details about how an DataSync transfer location for a Network File System (NFS) file server
      # is configured.

      def describe_location_nfs(
        location_arn : String
      ) : Types::DescribeLocationNfsResponse

        input = Types::DescribeLocationNfsRequest.new(location_arn: location_arn)
        describe_location_nfs(input)
      end

      def describe_location_nfs(input : Types::DescribeLocationNfsRequest) : Types::DescribeLocationNfsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_NFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationNfsResponse, "DescribeLocationNfs")
      end

      # Provides details about how an DataSync transfer location for an object storage system is configured.

      def describe_location_object_storage(
        location_arn : String
      ) : Types::DescribeLocationObjectStorageResponse

        input = Types::DescribeLocationObjectStorageRequest.new(location_arn: location_arn)
        describe_location_object_storage(input)
      end

      def describe_location_object_storage(input : Types::DescribeLocationObjectStorageRequest) : Types::DescribeLocationObjectStorageResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_OBJECT_STORAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationObjectStorageResponse, "DescribeLocationObjectStorage")
      end

      # Provides details about how an DataSync transfer location for an S3 bucket is configured.

      def describe_location_s3(
        location_arn : String
      ) : Types::DescribeLocationS3Response

        input = Types::DescribeLocationS3Request.new(location_arn: location_arn)
        describe_location_s3(input)
      end

      def describe_location_s3(input : Types::DescribeLocationS3Request) : Types::DescribeLocationS3Response
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_S3, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationS3Response, "DescribeLocationS3")
      end

      # Provides details about how an DataSync transfer location for a Server Message Block (SMB) file
      # server is configured.

      def describe_location_smb(
        location_arn : String
      ) : Types::DescribeLocationSmbResponse

        input = Types::DescribeLocationSmbRequest.new(location_arn: location_arn)
        describe_location_smb(input)
      end

      def describe_location_smb(input : Types::DescribeLocationSmbRequest) : Types::DescribeLocationSmbResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LOCATION_SMB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLocationSmbResponse, "DescribeLocationSmb")
      end

      # Provides information about a task , which defines where and how DataSync transfers your data.

      def describe_task(
        task_arn : String
      ) : Types::DescribeTaskResponse

        input = Types::DescribeTaskRequest.new(task_arn: task_arn)
        describe_task(input)
      end

      def describe_task(input : Types::DescribeTaskRequest) : Types::DescribeTaskResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTaskResponse, "DescribeTask")
      end

      # Provides information about an execution of your DataSync task. You can use this operation to help
      # monitor the progress of an ongoing data transfer or check the results of the transfer. Some
      # DescribeTaskExecution response elements are only relevant to a specific task mode. For information,
      # see Understanding task mode differences and Understanding data transfer performance counters .

      def describe_task_execution(
        task_execution_arn : String
      ) : Types::DescribeTaskExecutionResponse

        input = Types::DescribeTaskExecutionRequest.new(task_execution_arn: task_execution_arn)
        describe_task_execution(input)
      end

      def describe_task_execution(input : Types::DescribeTaskExecutionRequest) : Types::DescribeTaskExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TASK_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTaskExecutionResponse, "DescribeTaskExecution")
      end

      # Returns a list of DataSync agents that belong to an Amazon Web Services account in the Amazon Web
      # Services Region specified in the request. With pagination, you can reduce the number of agents
      # returned in a response. If you get a truncated list of agents in a response, the response contains a
      # marker that you can specify in your next request to fetch the next page of agents. ListAgents is
      # eventually consistent. This means the result of running the operation might not reflect that you
      # just created or deleted an agent. For example, if you create an agent with CreateAgent and then
      # immediately run ListAgents , that agent might not show up in the list right away. In situations like
      # this, you can always confirm whether an agent has been created (or deleted) by using DescribeAgent .

      def list_agents(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAgentsResponse

        input = Types::ListAgentsRequest.new(max_results: max_results, next_token: next_token)
        list_agents(input)
      end

      def list_agents(input : Types::ListAgentsRequest) : Types::ListAgentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AGENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAgentsResponse, "ListAgents")
      end

      # Returns a list of source and destination locations. If you have more locations than are returned in
      # a response (that is, the response returns only a truncated list of your agents), the response
      # contains a token that you can specify in your next request to fetch the next page of locations.

      def list_locations(
        filters : Array(Types::LocationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListLocationsResponse

        input = Types::ListLocationsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_locations(input)
      end

      def list_locations(input : Types::ListLocationsRequest) : Types::ListLocationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLocationsResponse, "ListLocations")
      end

      # Returns all the tags associated with an Amazon Web Services resource.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Returns a list of executions for an DataSync transfer task.

      def list_task_executions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        task_arn : String? = nil
      ) : Types::ListTaskExecutionsResponse

        input = Types::ListTaskExecutionsRequest.new(max_results: max_results, next_token: next_token, task_arn: task_arn)
        list_task_executions(input)
      end

      def list_task_executions(input : Types::ListTaskExecutionsRequest) : Types::ListTaskExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TASK_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTaskExecutionsResponse, "ListTaskExecutions")
      end

      # Returns a list of the DataSync tasks you created.

      def list_tasks(
        filters : Array(Types::TaskFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTasksResponse

        input = Types::ListTasksRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_tasks(input)
      end

      def list_tasks(input : Types::ListTasksRequest) : Types::ListTasksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTasksResponse, "ListTasks")
      end

      # Starts an DataSync transfer task. For each task, you can only run one task execution at a time.
      # There are several steps to a task execution. For more information, see Task execution statuses . If
      # you're planning to transfer data to or from an Amazon S3 location, review how DataSync can affect
      # your S3 request charges and the DataSync pricing page before you begin.

      def start_task_execution(
        task_arn : String,
        excludes : Array(Types::FilterRule)? = nil,
        includes : Array(Types::FilterRule)? = nil,
        manifest_config : Types::ManifestConfig? = nil,
        override_options : Types::Options? = nil,
        tags : Array(Types::TagListEntry)? = nil,
        task_report_config : Types::TaskReportConfig? = nil
      ) : Types::StartTaskExecutionResponse

        input = Types::StartTaskExecutionRequest.new(task_arn: task_arn, excludes: excludes, includes: includes, manifest_config: manifest_config, override_options: override_options, tags: tags, task_report_config: task_report_config)
        start_task_execution(input)
      end

      def start_task_execution(input : Types::StartTaskExecutionRequest) : Types::StartTaskExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::START_TASK_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTaskExecutionResponse, "StartTaskExecution")
      end

      # Applies a tag to an Amazon Web Services resource. Tags are key-value pairs that can help you manage,
      # filter, and search for your resources. These include DataSync resources, such as locations, tasks,
      # and task executions.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::TagListEntry)
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

      # Removes tags from an Amazon Web Services resource.

      def untag_resource(
        keys : Array(String),
        resource_arn : String
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(keys: keys, resource_arn: resource_arn)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates the name of an DataSync agent.

      def update_agent(
        agent_arn : String,
        name : String? = nil
      ) : Types::UpdateAgentResponse

        input = Types::UpdateAgentRequest.new(agent_arn: agent_arn, name: name)
        update_agent(input)
      end

      def update_agent(input : Types::UpdateAgentRequest) : Types::UpdateAgentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AGENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAgentResponse, "UpdateAgent")
      end

      # Modifies the following configurations of the Microsoft Azure Blob Storage transfer location that
      # you're using with DataSync. For more information, see Configuring DataSync transfers with Azure Blob
      # Storage .

      def update_location_azure_blob(
        location_arn : String,
        access_tier : String? = nil,
        agent_arns : Array(String)? = nil,
        authentication_type : String? = nil,
        blob_type : String? = nil,
        cmk_secret_config : Types::CmkSecretConfig? = nil,
        custom_secret_config : Types::CustomSecretConfig? = nil,
        sas_configuration : Types::AzureBlobSasConfiguration? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationAzureBlobResponse

        input = Types::UpdateLocationAzureBlobRequest.new(location_arn: location_arn, access_tier: access_tier, agent_arns: agent_arns, authentication_type: authentication_type, blob_type: blob_type, cmk_secret_config: cmk_secret_config, custom_secret_config: custom_secret_config, sas_configuration: sas_configuration, subdirectory: subdirectory)
        update_location_azure_blob(input)
      end

      def update_location_azure_blob(input : Types::UpdateLocationAzureBlobRequest) : Types::UpdateLocationAzureBlobResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_AZURE_BLOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationAzureBlobResponse, "UpdateLocationAzureBlob")
      end

      # Modifies the following configuration parameters of the Amazon EFS transfer location that you're
      # using with DataSync. For more information, see Configuring DataSync transfers with Amazon EFS .

      def update_location_efs(
        location_arn : String,
        access_point_arn : String? = nil,
        file_system_access_role_arn : String? = nil,
        in_transit_encryption : String? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationEfsResponse

        input = Types::UpdateLocationEfsRequest.new(location_arn: location_arn, access_point_arn: access_point_arn, file_system_access_role_arn: file_system_access_role_arn, in_transit_encryption: in_transit_encryption, subdirectory: subdirectory)
        update_location_efs(input)
      end

      def update_location_efs(input : Types::UpdateLocationEfsRequest) : Types::UpdateLocationEfsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_EFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationEfsResponse, "UpdateLocationEfs")
      end

      # Modifies the following configuration parameters of the Amazon FSx for Lustre transfer location that
      # you're using with DataSync. For more information, see Configuring DataSync transfers with FSx for
      # Lustre .

      def update_location_fsx_lustre(
        location_arn : String,
        subdirectory : String? = nil
      ) : Types::UpdateLocationFsxLustreResponse

        input = Types::UpdateLocationFsxLustreRequest.new(location_arn: location_arn, subdirectory: subdirectory)
        update_location_fsx_lustre(input)
      end

      def update_location_fsx_lustre(input : Types::UpdateLocationFsxLustreRequest) : Types::UpdateLocationFsxLustreResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_FSX_LUSTRE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationFsxLustreResponse, "UpdateLocationFsxLustre")
      end

      # Modifies the following configuration parameters of the Amazon FSx for NetApp ONTAP transfer location
      # that you're using with DataSync. For more information, see Configuring DataSync transfers with FSx
      # for ONTAP .

      def update_location_fsx_ontap(
        location_arn : String,
        protocol : Types::FsxUpdateProtocol? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationFsxOntapResponse

        input = Types::UpdateLocationFsxOntapRequest.new(location_arn: location_arn, protocol: protocol, subdirectory: subdirectory)
        update_location_fsx_ontap(input)
      end

      def update_location_fsx_ontap(input : Types::UpdateLocationFsxOntapRequest) : Types::UpdateLocationFsxOntapResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_FSX_ONTAP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationFsxOntapResponse, "UpdateLocationFsxOntap")
      end

      # Modifies the following configuration parameters of the Amazon FSx for OpenZFS transfer location that
      # you're using with DataSync. For more information, see Configuring DataSync transfers with FSx for
      # OpenZFS . Request parameters related to SMB aren't supported with the UpdateLocationFsxOpenZfs
      # operation.

      def update_location_fsx_open_zfs(
        location_arn : String,
        protocol : Types::FsxProtocol? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationFsxOpenZfsResponse

        input = Types::UpdateLocationFsxOpenZfsRequest.new(location_arn: location_arn, protocol: protocol, subdirectory: subdirectory)
        update_location_fsx_open_zfs(input)
      end

      def update_location_fsx_open_zfs(input : Types::UpdateLocationFsxOpenZfsRequest) : Types::UpdateLocationFsxOpenZfsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_FSX_OPEN_ZFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationFsxOpenZfsResponse, "UpdateLocationFsxOpenZfs")
      end

      # Modifies the following configuration parameters of the Amazon FSx for Windows File Server transfer
      # location that you're using with DataSync. For more information, see Configuring DataSync transfers
      # with FSx for Windows File Server .

      def update_location_fsx_windows(
        location_arn : String,
        domain : String? = nil,
        password : String? = nil,
        subdirectory : String? = nil,
        user : String? = nil
      ) : Types::UpdateLocationFsxWindowsResponse

        input = Types::UpdateLocationFsxWindowsRequest.new(location_arn: location_arn, domain: domain, password: password, subdirectory: subdirectory, user: user)
        update_location_fsx_windows(input)
      end

      def update_location_fsx_windows(input : Types::UpdateLocationFsxWindowsRequest) : Types::UpdateLocationFsxWindowsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_FSX_WINDOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationFsxWindowsResponse, "UpdateLocationFsxWindows")
      end

      # Modifies the following configuration parameters of the Hadoop Distributed File System (HDFS)
      # transfer location that you're using with DataSync. For more information, see Configuring DataSync
      # transfers with an HDFS cluster .

      def update_location_hdfs(
        location_arn : String,
        agent_arns : Array(String)? = nil,
        authentication_type : String? = nil,
        block_size : Int32? = nil,
        kerberos_keytab : Bytes? = nil,
        kerberos_krb5_conf : Bytes? = nil,
        kerberos_principal : String? = nil,
        kms_key_provider_uri : String? = nil,
        name_nodes : Array(Types::HdfsNameNode)? = nil,
        qop_configuration : Types::QopConfiguration? = nil,
        replication_factor : Int32? = nil,
        simple_user : String? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationHdfsResponse

        input = Types::UpdateLocationHdfsRequest.new(location_arn: location_arn, agent_arns: agent_arns, authentication_type: authentication_type, block_size: block_size, kerberos_keytab: kerberos_keytab, kerberos_krb5_conf: kerberos_krb5_conf, kerberos_principal: kerberos_principal, kms_key_provider_uri: kms_key_provider_uri, name_nodes: name_nodes, qop_configuration: qop_configuration, replication_factor: replication_factor, simple_user: simple_user, subdirectory: subdirectory)
        update_location_hdfs(input)
      end

      def update_location_hdfs(input : Types::UpdateLocationHdfsRequest) : Types::UpdateLocationHdfsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_HDFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationHdfsResponse, "UpdateLocationHdfs")
      end

      # Modifies the following configuration parameters of the Network File System (NFS) transfer location
      # that you're using with DataSync. For more information, see Configuring transfers with an NFS file
      # server .

      def update_location_nfs(
        location_arn : String,
        mount_options : Types::NfsMountOptions? = nil,
        on_prem_config : Types::OnPremConfig? = nil,
        server_hostname : String? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationNfsResponse

        input = Types::UpdateLocationNfsRequest.new(location_arn: location_arn, mount_options: mount_options, on_prem_config: on_prem_config, server_hostname: server_hostname, subdirectory: subdirectory)
        update_location_nfs(input)
      end

      def update_location_nfs(input : Types::UpdateLocationNfsRequest) : Types::UpdateLocationNfsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_NFS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationNfsResponse, "UpdateLocationNfs")
      end

      # Modifies the following configuration parameters of the object storage transfer location that you're
      # using with DataSync. For more information, see Configuring DataSync transfers with an object storage
      # system .

      def update_location_object_storage(
        location_arn : String,
        access_key : String? = nil,
        agent_arns : Array(String)? = nil,
        cmk_secret_config : Types::CmkSecretConfig? = nil,
        custom_secret_config : Types::CustomSecretConfig? = nil,
        secret_key : String? = nil,
        server_certificate : Bytes? = nil,
        server_hostname : String? = nil,
        server_port : Int32? = nil,
        server_protocol : String? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationObjectStorageResponse

        input = Types::UpdateLocationObjectStorageRequest.new(location_arn: location_arn, access_key: access_key, agent_arns: agent_arns, cmk_secret_config: cmk_secret_config, custom_secret_config: custom_secret_config, secret_key: secret_key, server_certificate: server_certificate, server_hostname: server_hostname, server_port: server_port, server_protocol: server_protocol, subdirectory: subdirectory)
        update_location_object_storage(input)
      end

      def update_location_object_storage(input : Types::UpdateLocationObjectStorageRequest) : Types::UpdateLocationObjectStorageResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_OBJECT_STORAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationObjectStorageResponse, "UpdateLocationObjectStorage")
      end

      # Modifies the following configuration parameters of the Amazon S3 transfer location that you're using
      # with DataSync. Before you begin, make sure that you read the following topics: Storage class
      # considerations with Amazon S3 locations Evaluating S3 request costs when using DataSync

      def update_location_s3(
        location_arn : String,
        s3_config : Types::S3Config? = nil,
        s3_storage_class : String? = nil,
        subdirectory : String? = nil
      ) : Types::UpdateLocationS3Response

        input = Types::UpdateLocationS3Request.new(location_arn: location_arn, s3_config: s3_config, s3_storage_class: s3_storage_class, subdirectory: subdirectory)
        update_location_s3(input)
      end

      def update_location_s3(input : Types::UpdateLocationS3Request) : Types::UpdateLocationS3Response
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_S3, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationS3Response, "UpdateLocationS3")
      end

      # Modifies the following configuration parameters of the Server Message Block (SMB) transfer location
      # that you're using with DataSync. For more information, see Configuring DataSync transfers with an
      # SMB file server .

      def update_location_smb(
        location_arn : String,
        agent_arns : Array(String)? = nil,
        authentication_type : String? = nil,
        cmk_secret_config : Types::CmkSecretConfig? = nil,
        custom_secret_config : Types::CustomSecretConfig? = nil,
        dns_ip_addresses : Array(String)? = nil,
        domain : String? = nil,
        kerberos_keytab : Bytes? = nil,
        kerberos_krb5_conf : Bytes? = nil,
        kerberos_principal : String? = nil,
        mount_options : Types::SmbMountOptions? = nil,
        password : String? = nil,
        server_hostname : String? = nil,
        subdirectory : String? = nil,
        user : String? = nil
      ) : Types::UpdateLocationSmbResponse

        input = Types::UpdateLocationSmbRequest.new(location_arn: location_arn, agent_arns: agent_arns, authentication_type: authentication_type, cmk_secret_config: cmk_secret_config, custom_secret_config: custom_secret_config, dns_ip_addresses: dns_ip_addresses, domain: domain, kerberos_keytab: kerberos_keytab, kerberos_krb5_conf: kerberos_krb5_conf, kerberos_principal: kerberos_principal, mount_options: mount_options, password: password, server_hostname: server_hostname, subdirectory: subdirectory, user: user)
        update_location_smb(input)
      end

      def update_location_smb(input : Types::UpdateLocationSmbRequest) : Types::UpdateLocationSmbResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LOCATION_SMB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLocationSmbResponse, "UpdateLocationSmb")
      end

      # Updates the configuration of a task , which defines where and how DataSync transfers your data.

      def update_task(
        task_arn : String,
        cloud_watch_log_group_arn : String? = nil,
        excludes : Array(Types::FilterRule)? = nil,
        includes : Array(Types::FilterRule)? = nil,
        manifest_config : Types::ManifestConfig? = nil,
        name : String? = nil,
        options : Types::Options? = nil,
        schedule : Types::TaskSchedule? = nil,
        task_report_config : Types::TaskReportConfig? = nil
      ) : Types::UpdateTaskResponse

        input = Types::UpdateTaskRequest.new(task_arn: task_arn, cloud_watch_log_group_arn: cloud_watch_log_group_arn, excludes: excludes, includes: includes, manifest_config: manifest_config, name: name, options: options, schedule: schedule, task_report_config: task_report_config)
        update_task(input)
      end

      def update_task(input : Types::UpdateTaskRequest) : Types::UpdateTaskResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTaskResponse, "UpdateTask")
      end

      # Updates the configuration of a running DataSync task execution. Currently, the only Option that you
      # can modify with UpdateTaskExecution is BytesPerSecond , which throttles bandwidth for a running or
      # queued task execution.

      def update_task_execution(
        options : Types::Options,
        task_execution_arn : String
      ) : Types::UpdateTaskExecutionResponse

        input = Types::UpdateTaskExecutionRequest.new(options: options, task_execution_arn: task_execution_arn)
        update_task_execution(input)
      end

      def update_task_execution(input : Types::UpdateTaskExecutionRequest) : Types::UpdateTaskExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TASK_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTaskExecutionResponse, "UpdateTaskExecution")
      end
    end
  end
end
