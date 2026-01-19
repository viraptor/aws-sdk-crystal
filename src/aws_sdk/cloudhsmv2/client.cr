module AwsSdk
  module CloudHSMV2
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

      # Copy an CloudHSM cluster backup to a different region. Cross-account use: No. You cannot perform
      # this operation on an CloudHSM backup in a different Amazon Web Services account.
      def copy_backup_to_region(
        backup_id : String,
        destination_region : String,
        tag_list : Array(Types::Tag)? = nil
      ) : Types::CopyBackupToRegionResponse
        input = Types::CopyBackupToRegionRequest.new(backup_id: backup_id, destination_region: destination_region, tag_list: tag_list)
        copy_backup_to_region(input)
      end
      def copy_backup_to_region(input : Types::CopyBackupToRegionRequest) : Types::CopyBackupToRegionResponse
        request = Protocol::JsonRpc.build_request(Model::COPY_BACKUP_TO_REGION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopyBackupToRegionResponse, "CopyBackupToRegion")
      end

      # Creates a new CloudHSM cluster. Cross-account use: Yes. To perform this operation with an CloudHSM
      # backup in a different AWS account, specify the full backup ARN in the value of the SourceBackupId
      # parameter.
      def create_cluster(
        hsm_type : String,
        subnet_ids : Array(String),
        backup_retention_policy : Types::BackupRetentionPolicy? = nil,
        mode : String? = nil,
        network_type : String? = nil,
        source_backup_id : String? = nil,
        tag_list : Array(Types::Tag)? = nil
      ) : Types::CreateClusterResponse
        input = Types::CreateClusterRequest.new(hsm_type: hsm_type, subnet_ids: subnet_ids, backup_retention_policy: backup_retention_policy, mode: mode, network_type: network_type, source_backup_id: source_backup_id, tag_list: tag_list)
        create_cluster(input)
      end
      def create_cluster(input : Types::CreateClusterRequest) : Types::CreateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterResponse, "CreateCluster")
      end

      # Creates a new hardware security module (HSM) in the specified CloudHSM cluster. Cross-account use:
      # No. You cannot perform this operation on an CloudHSM cluster in a different Amazon Web Service
      # account.
      def create_hsm(
        availability_zone : String,
        cluster_id : String,
        ip_address : String? = nil
      ) : Types::CreateHsmResponse
        input = Types::CreateHsmRequest.new(availability_zone: availability_zone, cluster_id: cluster_id, ip_address: ip_address)
        create_hsm(input)
      end
      def create_hsm(input : Types::CreateHsmRequest) : Types::CreateHsmResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HSM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHsmResponse, "CreateHsm")
      end

      # Deletes a specified CloudHSM backup. A backup can be restored up to 7 days after the DeleteBackup
      # request is made. For more information on restoring a backup, see RestoreBackup . Cross-account use:
      # No. You cannot perform this operation on an CloudHSM backup in a different Amazon Web Services
      # account.
      def delete_backup(
        backup_id : String
      ) : Types::DeleteBackupResponse
        input = Types::DeleteBackupRequest.new(backup_id: backup_id)
        delete_backup(input)
      end
      def delete_backup(input : Types::DeleteBackupRequest) : Types::DeleteBackupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBackupResponse, "DeleteBackup")
      end

      # Deletes the specified CloudHSM cluster. Before you can delete a cluster, you must delete all HSMs in
      # the cluster. To see if the cluster contains any HSMs, use DescribeClusters . To delete an HSM, use
      # DeleteHsm . Cross-account use: No. You cannot perform this operation on an CloudHSM cluster in a
      # different Amazon Web Services account.
      def delete_cluster(
        cluster_id : String
      ) : Types::DeleteClusterResponse
        input = Types::DeleteClusterRequest.new(cluster_id: cluster_id)
        delete_cluster(input)
      end
      def delete_cluster(input : Types::DeleteClusterRequest) : Types::DeleteClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClusterResponse, "DeleteCluster")
      end

      # Deletes the specified HSM. To specify an HSM, you can use its identifier (ID), the IP address of the
      # HSM's elastic network interface (ENI), or the ID of the HSM's ENI. You need to specify only one of
      # these values. To find these values, use DescribeClusters . Cross-account use: No. You cannot perform
      # this operation on an CloudHSM hsm in a different Amazon Web Services account.
      def delete_hsm(
        cluster_id : String,
        eni_id : String? = nil,
        eni_ip : String? = nil,
        hsm_id : String? = nil
      ) : Types::DeleteHsmResponse
        input = Types::DeleteHsmRequest.new(cluster_id: cluster_id, eni_id: eni_id, eni_ip: eni_ip, hsm_id: hsm_id)
        delete_hsm(input)
      end
      def delete_hsm(input : Types::DeleteHsmRequest) : Types::DeleteHsmResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_HSM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHsmResponse, "DeleteHsm")
      end

      # Deletes an CloudHSM resource policy. Deleting a resource policy will result in the resource being
      # unshared and removed from any RAM resource shares. Deleting the resource policy attached to a backup
      # will not impact any clusters created from that backup. Cross-account use: No. You cannot perform
      # this operation on an CloudHSM resource in a different Amazon Web Services account.
      def delete_resource_policy(
        resource_arn : String? = nil
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

      # Gets information about backups of CloudHSM clusters. Lists either the backups you own or the backups
      # shared with you when the Shared parameter is true. This is a paginated operation, which means that
      # each response might contain only a subset of all the backups. When the response contains only a
      # subset of backups, it includes a NextToken value. Use this value in a subsequent DescribeBackups
      # request to get more backups. When you receive a response with no NextToken (or an empty or null
      # value), that means there are no more backups to get. Cross-account use: Yes. Customers can describe
      # backups in other Amazon Web Services accounts that are shared with them.
      def describe_backups(
        filters : Hash(String, Array(String))? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shared : Bool? = nil,
        sort_ascending : Bool? = nil
      ) : Types::DescribeBackupsResponse
        input = Types::DescribeBackupsRequest.new(filters: filters, max_results: max_results, next_token: next_token, shared: shared, sort_ascending: sort_ascending)
        describe_backups(input)
      end
      def describe_backups(input : Types::DescribeBackupsRequest) : Types::DescribeBackupsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_BACKUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeBackupsResponse, "DescribeBackups")
      end

      # Gets information about CloudHSM clusters. This is a paginated operation, which means that each
      # response might contain only a subset of all the clusters. When the response contains only a subset
      # of clusters, it includes a NextToken value. Use this value in a subsequent DescribeClusters request
      # to get more clusters. When you receive a response with no NextToken (or an empty or null value),
      # that means there are no more clusters to get. Cross-account use: No. You cannot perform this
      # operation on CloudHSM clusters in a different Amazon Web Services account.
      def describe_clusters(
        filters : Hash(String, Array(String))? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeClustersResponse
        input = Types::DescribeClustersRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_clusters(input)
      end
      def describe_clusters(input : Types::DescribeClustersRequest) : Types::DescribeClustersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClustersResponse, "DescribeClusters")
      end

      # Retrieves the resource policy document attached to a given resource. Cross-account use: No. You
      # cannot perform this operation on an CloudHSM resource in a different Amazon Web Services account.
      def get_resource_policy(
        resource_arn : String? = nil
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

      # Claims an CloudHSM cluster by submitting the cluster certificate issued by your issuing certificate
      # authority (CA) and the CA's root certificate. Before you can claim a cluster, you must sign the
      # cluster's certificate signing request (CSR) with your issuing CA. To get the cluster's CSR, use
      # DescribeClusters . Cross-account use: No. You cannot perform this operation on an CloudHSM cluster
      # in a different Amazon Web Services account.
      def initialize_cluster(
        cluster_id : String,
        signed_cert : String,
        trust_anchor : String
      ) : Types::InitializeClusterResponse
        input = Types::InitializeClusterRequest.new(cluster_id: cluster_id, signed_cert: signed_cert, trust_anchor: trust_anchor)
        initialize_cluster(input)
      end
      def initialize_cluster(input : Types::InitializeClusterRequest) : Types::InitializeClusterResponse
        request = Protocol::JsonRpc.build_request(Model::INITIALIZE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InitializeClusterResponse, "InitializeCluster")
      end

      # Gets a list of tags for the specified CloudHSM cluster. This is a paginated operation, which means
      # that each response might contain only a subset of all the tags. When the response contains only a
      # subset of tags, it includes a NextToken value. Use this value in a subsequent ListTags request to
      # get more tags. When you receive a response with no NextToken (or an empty or null value), that means
      # there are no more tags to get. Cross-account use: No. You cannot perform this operation on an
      # CloudHSM resource in a different Amazon Web Services account.
      def list_tags(
        resource_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsResponse
        input = Types::ListTagsRequest.new(resource_id: resource_id, max_results: max_results, next_token: next_token)
        list_tags(input)
      end
      def list_tags(input : Types::ListTagsRequest) : Types::ListTagsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsResponse, "ListTags")
      end

      # Modifies attributes for CloudHSM backup. Cross-account use: No. You cannot perform this operation on
      # an CloudHSM backup in a different Amazon Web Services account.
      def modify_backup_attributes(
        backup_id : String,
        never_expires : Bool
      ) : Types::ModifyBackupAttributesResponse
        input = Types::ModifyBackupAttributesRequest.new(backup_id: backup_id, never_expires: never_expires)
        modify_backup_attributes(input)
      end
      def modify_backup_attributes(input : Types::ModifyBackupAttributesRequest) : Types::ModifyBackupAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_BACKUP_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyBackupAttributesResponse, "ModifyBackupAttributes")
      end

      # Modifies CloudHSM cluster. Cross-account use: No. You cannot perform this operation on an CloudHSM
      # cluster in a different Amazon Web Services account.
      def modify_cluster(
        cluster_id : String,
        backup_retention_policy : Types::BackupRetentionPolicy? = nil,
        hsm_type : String? = nil
      ) : Types::ModifyClusterResponse
        input = Types::ModifyClusterRequest.new(cluster_id: cluster_id, backup_retention_policy: backup_retention_policy, hsm_type: hsm_type)
        modify_cluster(input)
      end
      def modify_cluster(input : Types::ModifyClusterRequest) : Types::ModifyClusterResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyClusterResponse, "ModifyCluster")
      end

      # Creates or updates an CloudHSM resource policy. A resource policy helps you to define the IAM entity
      # (for example, an Amazon Web Services account) that can manage your CloudHSM resources. The following
      # resources support CloudHSM resource policies: Backup - The resource policy allows you to describe
      # the backup and restore a cluster from the backup in another Amazon Web Services account. In order to
      # share a backup, it must be in a 'READY' state and you must own it. While you can share a backup
      # using the CloudHSM PutResourcePolicy operation, we recommend using Resource Access Manager (RAM)
      # instead. Using RAM provides multiple benefits as it creates the policy for you, allows multiple
      # resources to be shared at one time, and increases the discoverability of shared resources. If you
      # use PutResourcePolicy and want consumers to be able to describe the backups you share with them, you
      # must promote the backup to a standard RAM Resource Share using the RAM
      # PromoteResourceShareCreatedFromPolicy API operation. For more information, see Working with shared
      # backups in the CloudHSM User Guide Cross-account use: No. You cannot perform this operation on an
      # CloudHSM resource in a different Amazon Web Services account.
      def put_resource_policy(
        policy : String? = nil,
        resource_arn : String? = nil
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

      # Restores a specified CloudHSM backup that is in the PENDING_DELETION state. For more information on
      # deleting a backup, see DeleteBackup . Cross-account use: No. You cannot perform this operation on an
      # CloudHSM backup in a different Amazon Web Services account.
      def restore_backup(
        backup_id : String
      ) : Types::RestoreBackupResponse
        input = Types::RestoreBackupRequest.new(backup_id: backup_id)
        restore_backup(input)
      end
      def restore_backup(input : Types::RestoreBackupRequest) : Types::RestoreBackupResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreBackupResponse, "RestoreBackup")
      end

      # Adds or overwrites one or more tags for the specified CloudHSM cluster. Cross-account use: No. You
      # cannot perform this operation on an CloudHSM resource in a different Amazon Web Services account.
      def tag_resource(
        resource_id : String,
        tag_list : Array(Types::Tag)
      ) : Types::TagResourceResponse
        input = Types::TagResourceRequest.new(resource_id: resource_id, tag_list: tag_list)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes the specified tag or tags from the specified CloudHSM cluster. Cross-account use: No. You
      # cannot perform this operation on an CloudHSM resource in a different Amazon Web Services account.
      def untag_resource(
        resource_id : String,
        tag_key_list : Array(String)
      ) : Types::UntagResourceResponse
        input = Types::UntagResourceRequest.new(resource_id: resource_id, tag_key_list: tag_key_list)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end
    end
  end
end
