module AwsSdk
  module Redshift
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

      # Exchanges a DC1 Reserved Node for a DC2 Reserved Node with no changes to the configuration (term,
      # payment type, or number of nodes) and no additional costs.
      def accept_reserved_node_exchange(
        reserved_node_id : String,
        target_reserved_node_offering_id : String
      ) : Types::AcceptReservedNodeExchangeOutputMessage
        input = Types::AcceptReservedNodeExchangeInputMessage.new(reserved_node_id: reserved_node_id, target_reserved_node_offering_id: target_reserved_node_offering_id)
        accept_reserved_node_exchange(input)
      end
      def accept_reserved_node_exchange(input : Types::AcceptReservedNodeExchangeInputMessage) : Types::AcceptReservedNodeExchangeOutputMessage
        request = Protocol::Query.build_request(Model::ACCEPT_RESERVED_NODE_EXCHANGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AcceptReservedNodeExchangeOutputMessage, "AcceptReservedNodeExchange")
      end

      # Adds a partner integration to a cluster. This operation authorizes a partner to push status updates
      # for the specified database. To complete the integration, you also set up the integration on the
      # partner website.
      def add_partner(
        account_id : String,
        cluster_identifier : String,
        database_name : String,
        partner_name : String
      ) : Types::PartnerIntegrationOutputMessage
        input = Types::PartnerIntegrationInputMessage.new(account_id: account_id, cluster_identifier: cluster_identifier, database_name: database_name, partner_name: partner_name)
        add_partner(input)
      end
      def add_partner(input : Types::PartnerIntegrationInputMessage) : Types::PartnerIntegrationOutputMessage
        request = Protocol::Query.build_request(Model::ADD_PARTNER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PartnerIntegrationOutputMessage, "AddPartner")
      end

      # From a datashare consumer account, associates a datashare with the account (AssociateEntireAccount)
      # or the specified namespace (ConsumerArn). If you make this association, the consumer can consume the
      # datashare.
      def associate_data_share_consumer(
        data_share_arn : String,
        allow_writes : Bool? = nil,
        associate_entire_account : Bool? = nil,
        consumer_arn : String? = nil,
        consumer_region : String? = nil
      ) : Types::DataShare
        input = Types::AssociateDataShareConsumerMessage.new(data_share_arn: data_share_arn, allow_writes: allow_writes, associate_entire_account: associate_entire_account, consumer_arn: consumer_arn, consumer_region: consumer_region)
        associate_data_share_consumer(input)
      end
      def associate_data_share_consumer(input : Types::AssociateDataShareConsumerMessage) : Types::DataShare
        request = Protocol::Query.build_request(Model::ASSOCIATE_DATA_SHARE_CONSUMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DataShare, "AssociateDataShareConsumer")
      end

      # Adds an inbound (ingress) rule to an Amazon Redshift security group. Depending on whether the
      # application accessing your cluster is running on the Internet or an Amazon EC2 instance, you can
      # authorize inbound access to either a Classless Interdomain Routing (CIDR)/Internet Protocol (IP)
      # range or to an Amazon EC2 security group. You can add as many as 20 ingress rules to an Amazon
      # Redshift security group. If you authorize access to an Amazon EC2 security group, specify
      # EC2SecurityGroupName and EC2SecurityGroupOwnerId . The Amazon EC2 security group and Amazon Redshift
      # cluster must be in the same Amazon Web Services Region. If you authorize access to a CIDR/IP address
      # range, specify CIDRIP . For an overview of CIDR blocks, see the Wikipedia article on Classless
      # Inter-Domain Routing . You must also associate the security group with a cluster so that clients
      # running on these IP addresses or the EC2 instance are authorized to connect to the cluster. For
      # information about managing security groups, go to Working with Security Groups in the Amazon
      # Redshift Cluster Management Guide .
      def authorize_cluster_security_group_ingress(
        cluster_security_group_name : String,
        cidrip : String? = nil,
        ec2_security_group_name : String? = nil,
        ec2_security_group_owner_id : String? = nil
      ) : Types::AuthorizeClusterSecurityGroupIngressResult
        input = Types::AuthorizeClusterSecurityGroupIngressMessage.new(cluster_security_group_name: cluster_security_group_name, cidrip: cidrip, ec2_security_group_name: ec2_security_group_name, ec2_security_group_owner_id: ec2_security_group_owner_id)
        authorize_cluster_security_group_ingress(input)
      end
      def authorize_cluster_security_group_ingress(input : Types::AuthorizeClusterSecurityGroupIngressMessage) : Types::AuthorizeClusterSecurityGroupIngressResult
        request = Protocol::Query.build_request(Model::AUTHORIZE_CLUSTER_SECURITY_GROUP_INGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AuthorizeClusterSecurityGroupIngressResult, "AuthorizeClusterSecurityGroupIngress")
      end

      # From a data producer account, authorizes the sharing of a datashare with one or more consumer
      # accounts or managing entities. To authorize a datashare for a data consumer, the producer account
      # must have the correct access permissions.
      def authorize_data_share(
        consumer_identifier : String,
        data_share_arn : String,
        allow_writes : Bool? = nil
      ) : Types::DataShare
        input = Types::AuthorizeDataShareMessage.new(consumer_identifier: consumer_identifier, data_share_arn: data_share_arn, allow_writes: allow_writes)
        authorize_data_share(input)
      end
      def authorize_data_share(input : Types::AuthorizeDataShareMessage) : Types::DataShare
        request = Protocol::Query.build_request(Model::AUTHORIZE_DATA_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DataShare, "AuthorizeDataShare")
      end

      # Grants access to a cluster.
      def authorize_endpoint_access(
        account : String,
        cluster_identifier : String? = nil,
        vpc_ids : Array(String)? = nil
      ) : Types::EndpointAuthorization
        input = Types::AuthorizeEndpointAccessMessage.new(account: account, cluster_identifier: cluster_identifier, vpc_ids: vpc_ids)
        authorize_endpoint_access(input)
      end
      def authorize_endpoint_access(input : Types::AuthorizeEndpointAccessMessage) : Types::EndpointAuthorization
        request = Protocol::Query.build_request(Model::AUTHORIZE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EndpointAuthorization, "AuthorizeEndpointAccess")
      end

      # Authorizes the specified Amazon Web Services account to restore the specified snapshot. For more
      # information about working with snapshots, go to Amazon Redshift Snapshots in the Amazon Redshift
      # Cluster Management Guide .
      def authorize_snapshot_access(
        account_with_restore_access : String,
        snapshot_arn : String? = nil,
        snapshot_cluster_identifier : String? = nil,
        snapshot_identifier : String? = nil
      ) : Types::AuthorizeSnapshotAccessResult
        input = Types::AuthorizeSnapshotAccessMessage.new(account_with_restore_access: account_with_restore_access, snapshot_arn: snapshot_arn, snapshot_cluster_identifier: snapshot_cluster_identifier, snapshot_identifier: snapshot_identifier)
        authorize_snapshot_access(input)
      end
      def authorize_snapshot_access(input : Types::AuthorizeSnapshotAccessMessage) : Types::AuthorizeSnapshotAccessResult
        request = Protocol::Query.build_request(Model::AUTHORIZE_SNAPSHOT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AuthorizeSnapshotAccessResult, "AuthorizeSnapshotAccess")
      end

      # Deletes a set of cluster snapshots.
      def batch_delete_cluster_snapshots(
        identifiers : Array(Types::DeleteClusterSnapshotMessage)
      ) : Types::BatchDeleteClusterSnapshotsResult
        input = Types::BatchDeleteClusterSnapshotsRequest.new(identifiers: identifiers)
        batch_delete_cluster_snapshots(input)
      end
      def batch_delete_cluster_snapshots(input : Types::BatchDeleteClusterSnapshotsRequest) : Types::BatchDeleteClusterSnapshotsResult
        request = Protocol::Query.build_request(Model::BATCH_DELETE_CLUSTER_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::BatchDeleteClusterSnapshotsResult, "BatchDeleteClusterSnapshots")
      end

      # Modifies the settings for a set of cluster snapshots.
      def batch_modify_cluster_snapshots(
        snapshot_identifier_list : Array(String),
        force : Bool? = nil,
        manual_snapshot_retention_period : Int32? = nil
      ) : Types::BatchModifyClusterSnapshotsOutputMessage
        input = Types::BatchModifyClusterSnapshotsMessage.new(snapshot_identifier_list: snapshot_identifier_list, force: force, manual_snapshot_retention_period: manual_snapshot_retention_period)
        batch_modify_cluster_snapshots(input)
      end
      def batch_modify_cluster_snapshots(input : Types::BatchModifyClusterSnapshotsMessage) : Types::BatchModifyClusterSnapshotsOutputMessage
        request = Protocol::Query.build_request(Model::BATCH_MODIFY_CLUSTER_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::BatchModifyClusterSnapshotsOutputMessage, "BatchModifyClusterSnapshots")
      end

      # Cancels a resize operation for a cluster.
      def cancel_resize(
        cluster_identifier : String
      ) : Types::ResizeProgressMessage
        input = Types::CancelResizeMessage.new(cluster_identifier: cluster_identifier)
        cancel_resize(input)
      end
      def cancel_resize(input : Types::CancelResizeMessage) : Types::ResizeProgressMessage
        request = Protocol::Query.build_request(Model::CANCEL_RESIZE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ResizeProgressMessage, "CancelResize")
      end

      # Copies the specified automated cluster snapshot to a new manual cluster snapshot. The source must be
      # an automated snapshot and it must be in the available state. When you delete a cluster, Amazon
      # Redshift deletes any automated snapshots of the cluster. Also, when the retention period of the
      # snapshot expires, Amazon Redshift automatically deletes it. If you want to keep an automated
      # snapshot for a longer period, you can make a manual copy of the snapshot. Manual snapshots are
      # retained until you delete them. For more information about working with snapshots, go to Amazon
      # Redshift Snapshots in the Amazon Redshift Cluster Management Guide .
      def copy_cluster_snapshot(
        source_snapshot_identifier : String,
        target_snapshot_identifier : String,
        manual_snapshot_retention_period : Int32? = nil,
        source_snapshot_cluster_identifier : String? = nil
      ) : Types::CopyClusterSnapshotResult
        input = Types::CopyClusterSnapshotMessage.new(source_snapshot_identifier: source_snapshot_identifier, target_snapshot_identifier: target_snapshot_identifier, manual_snapshot_retention_period: manual_snapshot_retention_period, source_snapshot_cluster_identifier: source_snapshot_cluster_identifier)
        copy_cluster_snapshot(input)
      end
      def copy_cluster_snapshot(input : Types::CopyClusterSnapshotMessage) : Types::CopyClusterSnapshotResult
        request = Protocol::Query.build_request(Model::COPY_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopyClusterSnapshotResult, "CopyClusterSnapshot")
      end

      # Creates an authentication profile with the specified parameters.
      def create_authentication_profile(
        authentication_profile_content : String,
        authentication_profile_name : String
      ) : Types::CreateAuthenticationProfileResult
        input = Types::CreateAuthenticationProfileMessage.new(authentication_profile_content: authentication_profile_content, authentication_profile_name: authentication_profile_name)
        create_authentication_profile(input)
      end
      def create_authentication_profile(input : Types::CreateAuthenticationProfileMessage) : Types::CreateAuthenticationProfileResult
        request = Protocol::Query.build_request(Model::CREATE_AUTHENTICATION_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateAuthenticationProfileResult, "CreateAuthenticationProfile")
      end

      # Creates a new cluster with the specified parameters. To create a cluster in Virtual Private Cloud
      # (VPC), you must provide a cluster subnet group name. The cluster subnet group identifies the subnets
      # of your VPC that Amazon Redshift uses when creating the cluster. For more information about managing
      # clusters, go to Amazon Redshift Clusters in the Amazon Redshift Cluster Management Guide . VPC Block
      # Public Access (BPA) enables you to block resources in VPCs and subnets that you own in a Region from
      # reaching or being reached from the internet through internet gateways and egress-only internet
      # gateways. If a subnet group for a provisioned cluster is in an account with VPC BPA turned on, the
      # following capabilities are blocked: Creating a public cluster Restoring a public cluster Modifying a
      # private cluster to be public Adding a subnet with VPC BPA turned on to the subnet group when there's
      # at least one public cluster within the group For more information about VPC BPA, see Block public
      # access to VPCs and subnets in the Amazon VPC User Guide .
      def create_cluster(
        cluster_identifier : String,
        master_username : String,
        node_type : String,
        additional_info : String? = nil,
        allow_version_upgrade : Bool? = nil,
        aqua_configuration_status : String? = nil,
        automated_snapshot_retention_period : Int32? = nil,
        availability_zone : String? = nil,
        availability_zone_relocation : Bool? = nil,
        catalog_name : String? = nil,
        cluster_parameter_group_name : String? = nil,
        cluster_security_groups : Array(String)? = nil,
        cluster_subnet_group_name : String? = nil,
        cluster_type : String? = nil,
        cluster_version : String? = nil,
        db_name : String? = nil,
        default_iam_role_arn : String? = nil,
        elastic_ip : String? = nil,
        encrypted : Bool? = nil,
        enhanced_vpc_routing : Bool? = nil,
        extra_compute_for_automatic_optimization : Bool? = nil,
        hsm_client_certificate_identifier : String? = nil,
        hsm_configuration_identifier : String? = nil,
        iam_roles : Array(String)? = nil,
        ip_address_type : String? = nil,
        kms_key_id : String? = nil,
        load_sample_data : String? = nil,
        maintenance_track_name : String? = nil,
        manage_master_password : Bool? = nil,
        manual_snapshot_retention_period : Int32? = nil,
        master_password_secret_kms_key_id : String? = nil,
        master_user_password : String? = nil,
        multi_az : Bool? = nil,
        number_of_nodes : Int32? = nil,
        port : Int32? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        redshift_idc_application_arn : String? = nil,
        snapshot_schedule_identifier : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateClusterResult
        input = Types::CreateClusterMessage.new(cluster_identifier: cluster_identifier, master_username: master_username, node_type: node_type, additional_info: additional_info, allow_version_upgrade: allow_version_upgrade, aqua_configuration_status: aqua_configuration_status, automated_snapshot_retention_period: automated_snapshot_retention_period, availability_zone: availability_zone, availability_zone_relocation: availability_zone_relocation, catalog_name: catalog_name, cluster_parameter_group_name: cluster_parameter_group_name, cluster_security_groups: cluster_security_groups, cluster_subnet_group_name: cluster_subnet_group_name, cluster_type: cluster_type, cluster_version: cluster_version, db_name: db_name, default_iam_role_arn: default_iam_role_arn, elastic_ip: elastic_ip, encrypted: encrypted, enhanced_vpc_routing: enhanced_vpc_routing, extra_compute_for_automatic_optimization: extra_compute_for_automatic_optimization, hsm_client_certificate_identifier: hsm_client_certificate_identifier, hsm_configuration_identifier: hsm_configuration_identifier, iam_roles: iam_roles, ip_address_type: ip_address_type, kms_key_id: kms_key_id, load_sample_data: load_sample_data, maintenance_track_name: maintenance_track_name, manage_master_password: manage_master_password, manual_snapshot_retention_period: manual_snapshot_retention_period, master_password_secret_kms_key_id: master_password_secret_kms_key_id, master_user_password: master_user_password, multi_az: multi_az, number_of_nodes: number_of_nodes, port: port, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, redshift_idc_application_arn: redshift_idc_application_arn, snapshot_schedule_identifier: snapshot_schedule_identifier, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        create_cluster(input)
      end
      def create_cluster(input : Types::CreateClusterMessage) : Types::CreateClusterResult
        request = Protocol::Query.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateClusterResult, "CreateCluster")
      end

      # Creates an Amazon Redshift parameter group. Creating parameter groups is independent of creating
      # clusters. You can associate a cluster with a parameter group when you create the cluster. You can
      # also associate an existing cluster with a parameter group after the cluster is created by using
      # ModifyCluster . Parameters in the parameter group define specific behavior that applies to the
      # databases you create on the cluster. For more information about parameters and parameter groups, go
      # to Amazon Redshift Parameter Groups in the Amazon Redshift Cluster Management Guide .
      def create_cluster_parameter_group(
        description : String,
        parameter_group_family : String,
        parameter_group_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterParameterGroupResult
        input = Types::CreateClusterParameterGroupMessage.new(description: description, parameter_group_family: parameter_group_family, parameter_group_name: parameter_group_name, tags: tags)
        create_cluster_parameter_group(input)
      end
      def create_cluster_parameter_group(input : Types::CreateClusterParameterGroupMessage) : Types::CreateClusterParameterGroupResult
        request = Protocol::Query.build_request(Model::CREATE_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateClusterParameterGroupResult, "CreateClusterParameterGroup")
      end

      # Creates a new Amazon Redshift security group. You use security groups to control access to non-VPC
      # clusters. For information about managing security groups, go to Amazon Redshift Cluster Security
      # Groups in the Amazon Redshift Cluster Management Guide .
      def create_cluster_security_group(
        cluster_security_group_name : String,
        description : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterSecurityGroupResult
        input = Types::CreateClusterSecurityGroupMessage.new(cluster_security_group_name: cluster_security_group_name, description: description, tags: tags)
        create_cluster_security_group(input)
      end
      def create_cluster_security_group(input : Types::CreateClusterSecurityGroupMessage) : Types::CreateClusterSecurityGroupResult
        request = Protocol::Query.build_request(Model::CREATE_CLUSTER_SECURITY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateClusterSecurityGroupResult, "CreateClusterSecurityGroup")
      end

      # Creates a manual snapshot of the specified cluster. The cluster must be in the available state. For
      # more information about working with snapshots, go to Amazon Redshift Snapshots in the Amazon
      # Redshift Cluster Management Guide .
      def create_cluster_snapshot(
        cluster_identifier : String,
        snapshot_identifier : String,
        manual_snapshot_retention_period : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterSnapshotResult
        input = Types::CreateClusterSnapshotMessage.new(cluster_identifier: cluster_identifier, snapshot_identifier: snapshot_identifier, manual_snapshot_retention_period: manual_snapshot_retention_period, tags: tags)
        create_cluster_snapshot(input)
      end
      def create_cluster_snapshot(input : Types::CreateClusterSnapshotMessage) : Types::CreateClusterSnapshotResult
        request = Protocol::Query.build_request(Model::CREATE_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateClusterSnapshotResult, "CreateClusterSnapshot")
      end

      # Creates a new Amazon Redshift subnet group. You must provide a list of one or more subnets in your
      # existing Amazon Virtual Private Cloud (Amazon VPC) when creating Amazon Redshift subnet group. For
      # information about subnet groups, go to Amazon Redshift Cluster Subnet Groups in the Amazon Redshift
      # Cluster Management Guide .
      def create_cluster_subnet_group(
        cluster_subnet_group_name : String,
        description : String,
        subnet_ids : Array(String),
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterSubnetGroupResult
        input = Types::CreateClusterSubnetGroupMessage.new(cluster_subnet_group_name: cluster_subnet_group_name, description: description, subnet_ids: subnet_ids, tags: tags)
        create_cluster_subnet_group(input)
      end
      def create_cluster_subnet_group(input : Types::CreateClusterSubnetGroupMessage) : Types::CreateClusterSubnetGroupResult
        request = Protocol::Query.build_request(Model::CREATE_CLUSTER_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateClusterSubnetGroupResult, "CreateClusterSubnetGroup")
      end

      # Used to create a custom domain name for a cluster. Properties include the custom domain name, the
      # cluster the custom domain is associated with, and the certificate Amazon Resource Name (ARN).
      def create_custom_domain_association(
        cluster_identifier : String,
        custom_domain_certificate_arn : String,
        custom_domain_name : String
      ) : Types::CreateCustomDomainAssociationResult
        input = Types::CreateCustomDomainAssociationMessage.new(cluster_identifier: cluster_identifier, custom_domain_certificate_arn: custom_domain_certificate_arn, custom_domain_name: custom_domain_name)
        create_custom_domain_association(input)
      end
      def create_custom_domain_association(input : Types::CreateCustomDomainAssociationMessage) : Types::CreateCustomDomainAssociationResult
        request = Protocol::Query.build_request(Model::CREATE_CUSTOM_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateCustomDomainAssociationResult, "CreateCustomDomainAssociation")
      end

      # Creates a Redshift-managed VPC endpoint.
      def create_endpoint_access(
        endpoint_name : String,
        subnet_group_name : String,
        cluster_identifier : String? = nil,
        resource_owner : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::EndpointAccess
        input = Types::CreateEndpointAccessMessage.new(endpoint_name: endpoint_name, subnet_group_name: subnet_group_name, cluster_identifier: cluster_identifier, resource_owner: resource_owner, vpc_security_group_ids: vpc_security_group_ids)
        create_endpoint_access(input)
      end
      def create_endpoint_access(input : Types::CreateEndpointAccessMessage) : Types::EndpointAccess
        request = Protocol::Query.build_request(Model::CREATE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EndpointAccess, "CreateEndpointAccess")
      end

      # Creates an Amazon Redshift event notification subscription. This action requires an ARN (Amazon
      # Resource Name) of an Amazon SNS topic created by either the Amazon Redshift console, the Amazon SNS
      # console, or the Amazon SNS API. To obtain an ARN with Amazon SNS, you must create a topic in Amazon
      # SNS and subscribe to the topic. The ARN is displayed in the SNS console. You can specify the source
      # type, and lists of Amazon Redshift source IDs, event categories, and event severities. Notifications
      # will be sent for all events you want that match those criteria. For example, you can specify source
      # type = cluster, source ID = my-cluster-1 and mycluster2, event categories = Availability, Backup,
      # and severity = ERROR. The subscription will only send notifications for those ERROR events in the
      # Availability and Backup categories for the specified clusters. If you specify both the source type
      # and source IDs, such as source type = cluster and source identifier = my-cluster-1, notifications
      # will be sent for all the cluster events for my-cluster-1. If you specify a source type but do not
      # specify a source identifier, you will receive notice of the events for the objects of that type in
      # your Amazon Web Services account. If you do not specify either the SourceType nor the
      # SourceIdentifier, you will be notified of events generated from all Amazon Redshift sources
      # belonging to your Amazon Web Services account. You must specify a source type if you specify a
      # source ID.
      def create_event_subscription(
        sns_topic_arn : String,
        subscription_name : String,
        enabled : Bool? = nil,
        event_categories : Array(String)? = nil,
        severity : String? = nil,
        source_ids : Array(String)? = nil,
        source_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEventSubscriptionResult
        input = Types::CreateEventSubscriptionMessage.new(sns_topic_arn: sns_topic_arn, subscription_name: subscription_name, enabled: enabled, event_categories: event_categories, severity: severity, source_ids: source_ids, source_type: source_type, tags: tags)
        create_event_subscription(input)
      end
      def create_event_subscription(input : Types::CreateEventSubscriptionMessage) : Types::CreateEventSubscriptionResult
        request = Protocol::Query.build_request(Model::CREATE_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateEventSubscriptionResult, "CreateEventSubscription")
      end

      # Creates an HSM client certificate that an Amazon Redshift cluster will use to connect to the
      # client's HSM in order to store and retrieve the keys used to encrypt the cluster databases. The
      # command returns a public key, which you must store in the HSM. In addition to creating the HSM
      # certificate, you must create an Amazon Redshift HSM configuration that provides a cluster the
      # information needed to store and use encryption keys in the HSM. For more information, go to Hardware
      # Security Modules in the Amazon Redshift Cluster Management Guide .
      def create_hsm_client_certificate(
        hsm_client_certificate_identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateHsmClientCertificateResult
        input = Types::CreateHsmClientCertificateMessage.new(hsm_client_certificate_identifier: hsm_client_certificate_identifier, tags: tags)
        create_hsm_client_certificate(input)
      end
      def create_hsm_client_certificate(input : Types::CreateHsmClientCertificateMessage) : Types::CreateHsmClientCertificateResult
        request = Protocol::Query.build_request(Model::CREATE_HSM_CLIENT_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateHsmClientCertificateResult, "CreateHsmClientCertificate")
      end

      # Creates an HSM configuration that contains the information required by an Amazon Redshift cluster to
      # store and use database encryption keys in a Hardware Security Module (HSM). After creating the HSM
      # configuration, you can specify it as a parameter when creating a cluster. The cluster will then
      # store its encryption keys in the HSM. In addition to creating an HSM configuration, you must also
      # create an HSM client certificate. For more information, go to Hardware Security Modules in the
      # Amazon Redshift Cluster Management Guide.
      def create_hsm_configuration(
        description : String,
        hsm_configuration_identifier : String,
        hsm_ip_address : String,
        hsm_partition_name : String,
        hsm_partition_password : String,
        hsm_server_public_certificate : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateHsmConfigurationResult
        input = Types::CreateHsmConfigurationMessage.new(description: description, hsm_configuration_identifier: hsm_configuration_identifier, hsm_ip_address: hsm_ip_address, hsm_partition_name: hsm_partition_name, hsm_partition_password: hsm_partition_password, hsm_server_public_certificate: hsm_server_public_certificate, tags: tags)
        create_hsm_configuration(input)
      end
      def create_hsm_configuration(input : Types::CreateHsmConfigurationMessage) : Types::CreateHsmConfigurationResult
        request = Protocol::Query.build_request(Model::CREATE_HSM_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateHsmConfigurationResult, "CreateHsmConfiguration")
      end

      # Creates a zero-ETL integration or S3 event integration with Amazon Redshift.
      def create_integration(
        integration_name : String,
        source_arn : String,
        target_arn : String,
        additional_encryption_context : Hash(String, String)? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        tag_list : Array(Types::Tag)? = nil
      ) : Types::Integration
        input = Types::CreateIntegrationMessage.new(integration_name: integration_name, source_arn: source_arn, target_arn: target_arn, additional_encryption_context: additional_encryption_context, description: description, kms_key_id: kms_key_id, tag_list: tag_list)
        create_integration(input)
      end
      def create_integration(input : Types::CreateIntegrationMessage) : Types::Integration
        request = Protocol::Query.build_request(Model::CREATE_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::Integration, "CreateIntegration")
      end

      # Creates an Amazon Redshift application for use with IAM Identity Center.
      def create_redshift_idc_application(
        iam_role_arn : String,
        idc_display_name : String,
        idc_instance_arn : String,
        redshift_idc_application_name : String,
        application_type : String? = nil,
        authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)? = nil,
        identity_namespace : String? = nil,
        service_integrations : Array(Types::ServiceIntegrationsUnion)? = nil,
        sso_tag_keys : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRedshiftIdcApplicationResult
        input = Types::CreateRedshiftIdcApplicationMessage.new(iam_role_arn: iam_role_arn, idc_display_name: idc_display_name, idc_instance_arn: idc_instance_arn, redshift_idc_application_name: redshift_idc_application_name, application_type: application_type, authorized_token_issuer_list: authorized_token_issuer_list, identity_namespace: identity_namespace, service_integrations: service_integrations, sso_tag_keys: sso_tag_keys, tags: tags)
        create_redshift_idc_application(input)
      end
      def create_redshift_idc_application(input : Types::CreateRedshiftIdcApplicationMessage) : Types::CreateRedshiftIdcApplicationResult
        request = Protocol::Query.build_request(Model::CREATE_REDSHIFT_IDC_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateRedshiftIdcApplicationResult, "CreateRedshiftIdcApplication")
      end

      # Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API
      # action. For example, you can create a schedule of when to run the ResizeCluster API operation.
      def create_scheduled_action(
        iam_role : String,
        schedule : String,
        scheduled_action_name : String,
        target_action : Types::ScheduledActionType,
        enable : Bool? = nil,
        end_time : Time? = nil,
        scheduled_action_description : String? = nil,
        start_time : Time? = nil
      ) : Types::ScheduledAction
        input = Types::CreateScheduledActionMessage.new(iam_role: iam_role, schedule: schedule, scheduled_action_name: scheduled_action_name, target_action: target_action, enable: enable, end_time: end_time, scheduled_action_description: scheduled_action_description, start_time: start_time)
        create_scheduled_action(input)
      end
      def create_scheduled_action(input : Types::CreateScheduledActionMessage) : Types::ScheduledAction
        request = Protocol::Query.build_request(Model::CREATE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ScheduledAction, "CreateScheduledAction")
      end

      # Creates a snapshot copy grant that permits Amazon Redshift to use an encrypted symmetric key from
      # Key Management Service (KMS) to encrypt copied snapshots in a destination region. For more
      # information about managing snapshot copy grants, go to Amazon Redshift Database Encryption in the
      # Amazon Redshift Cluster Management Guide .
      def create_snapshot_copy_grant(
        snapshot_copy_grant_name : String,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSnapshotCopyGrantResult
        input = Types::CreateSnapshotCopyGrantMessage.new(snapshot_copy_grant_name: snapshot_copy_grant_name, kms_key_id: kms_key_id, tags: tags)
        create_snapshot_copy_grant(input)
      end
      def create_snapshot_copy_grant(input : Types::CreateSnapshotCopyGrantMessage) : Types::CreateSnapshotCopyGrantResult
        request = Protocol::Query.build_request(Model::CREATE_SNAPSHOT_COPY_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateSnapshotCopyGrantResult, "CreateSnapshotCopyGrant")
      end

      # Create a snapshot schedule that can be associated to a cluster and which overrides the default
      # system backup schedule.
      def create_snapshot_schedule(
        dry_run : Bool? = nil,
        next_invocations : Int32? = nil,
        schedule_definitions : Array(String)? = nil,
        schedule_description : String? = nil,
        schedule_identifier : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::SnapshotSchedule
        input = Types::CreateSnapshotScheduleMessage.new(dry_run: dry_run, next_invocations: next_invocations, schedule_definitions: schedule_definitions, schedule_description: schedule_description, schedule_identifier: schedule_identifier, tags: tags)
        create_snapshot_schedule(input)
      end
      def create_snapshot_schedule(input : Types::CreateSnapshotScheduleMessage) : Types::SnapshotSchedule
        request = Protocol::Query.build_request(Model::CREATE_SNAPSHOT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SnapshotSchedule, "CreateSnapshotSchedule")
      end

      # Adds tags to a cluster. A resource can have up to 50 tags. If you try to create more than 50 tags
      # for a resource, you will receive an error and the attempt will fail. If you specify a key that
      # already exists for the resource, the value for that key will be updated with the new value.
      def create_tags(
        resource_name : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::CreateTagsMessage.new(resource_name: resource_name, tags: tags)
        create_tags(input)
      end
      def create_tags(input : Types::CreateTagsMessage) : Nil
        request = Protocol::Query.build_request(Model::CREATE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a usage limit for a specified Amazon Redshift feature on a cluster. The usage limit is
      # identified by the returned usage limit identifier.
      def create_usage_limit(
        amount : Int64,
        cluster_identifier : String,
        feature_type : String,
        limit_type : String,
        breach_action : String? = nil,
        period : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::UsageLimit
        input = Types::CreateUsageLimitMessage.new(amount: amount, cluster_identifier: cluster_identifier, feature_type: feature_type, limit_type: limit_type, breach_action: breach_action, period: period, tags: tags)
        create_usage_limit(input)
      end
      def create_usage_limit(input : Types::CreateUsageLimitMessage) : Types::UsageLimit
        request = Protocol::Query.build_request(Model::CREATE_USAGE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UsageLimit, "CreateUsageLimit")
      end

      # From a datashare producer account, removes authorization from the specified datashare.
      def deauthorize_data_share(
        consumer_identifier : String,
        data_share_arn : String
      ) : Types::DataShare
        input = Types::DeauthorizeDataShareMessage.new(consumer_identifier: consumer_identifier, data_share_arn: data_share_arn)
        deauthorize_data_share(input)
      end
      def deauthorize_data_share(input : Types::DeauthorizeDataShareMessage) : Types::DataShare
        request = Protocol::Query.build_request(Model::DEAUTHORIZE_DATA_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DataShare, "DeauthorizeDataShare")
      end

      # Deletes an authentication profile.
      def delete_authentication_profile(
        authentication_profile_name : String
      ) : Types::DeleteAuthenticationProfileResult
        input = Types::DeleteAuthenticationProfileMessage.new(authentication_profile_name: authentication_profile_name)
        delete_authentication_profile(input)
      end
      def delete_authentication_profile(input : Types::DeleteAuthenticationProfileMessage) : Types::DeleteAuthenticationProfileResult
        request = Protocol::Query.build_request(Model::DELETE_AUTHENTICATION_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteAuthenticationProfileResult, "DeleteAuthenticationProfile")
      end

      # Deletes a previously provisioned cluster without its final snapshot being created. A successful
      # response from the web service indicates that the request was received correctly. Use
      # DescribeClusters to monitor the status of the deletion. The delete operation cannot be canceled or
      # reverted once submitted. For more information about managing clusters, go to Amazon Redshift
      # Clusters in the Amazon Redshift Cluster Management Guide . If you want to shut down the cluster and
      # retain it for future use, set SkipFinalClusterSnapshot to false and specify a name for
      # FinalClusterSnapshotIdentifier . You can later restore this snapshot to resume using the cluster. If
      # a final cluster snapshot is requested, the status of the cluster will be "final-snapshot" while the
      # snapshot is being taken, then it's "deleting" once Amazon Redshift begins deleting the cluster. For
      # more information about managing clusters, go to Amazon Redshift Clusters in the Amazon Redshift
      # Cluster Management Guide .
      def delete_cluster(
        cluster_identifier : String,
        final_cluster_snapshot_identifier : String? = nil,
        final_cluster_snapshot_retention_period : Int32? = nil,
        skip_final_cluster_snapshot : Bool? = nil
      ) : Types::DeleteClusterResult
        input = Types::DeleteClusterMessage.new(cluster_identifier: cluster_identifier, final_cluster_snapshot_identifier: final_cluster_snapshot_identifier, final_cluster_snapshot_retention_period: final_cluster_snapshot_retention_period, skip_final_cluster_snapshot: skip_final_cluster_snapshot)
        delete_cluster(input)
      end
      def delete_cluster(input : Types::DeleteClusterMessage) : Types::DeleteClusterResult
        request = Protocol::Query.build_request(Model::DELETE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteClusterResult, "DeleteCluster")
      end

      # Deletes a specified Amazon Redshift parameter group. You cannot delete a parameter group if it is
      # associated with a cluster.
      def delete_cluster_parameter_group(
        parameter_group_name : String
      ) : Nil
        input = Types::DeleteClusterParameterGroupMessage.new(parameter_group_name: parameter_group_name)
        delete_cluster_parameter_group(input)
      end
      def delete_cluster_parameter_group(input : Types::DeleteClusterParameterGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Amazon Redshift security group. You cannot delete a security group that is associated
      # with any clusters. You cannot delete the default security group. For information about managing
      # security groups, go to Amazon Redshift Cluster Security Groups in the Amazon Redshift Cluster
      # Management Guide .
      def delete_cluster_security_group(
        cluster_security_group_name : String
      ) : Nil
        input = Types::DeleteClusterSecurityGroupMessage.new(cluster_security_group_name: cluster_security_group_name)
        delete_cluster_security_group(input)
      end
      def delete_cluster_security_group(input : Types::DeleteClusterSecurityGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CLUSTER_SECURITY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified manual snapshot. The snapshot must be in the available state, with no other
      # users authorized to access the snapshot. Unlike automated snapshots, manual snapshots are retained
      # even after you delete your cluster. Amazon Redshift does not delete your manual snapshots. You must
      # delete manual snapshot explicitly to avoid getting charged. If other accounts are authorized to
      # access the snapshot, you must revoke all of the authorizations before you can delete the snapshot.
      def delete_cluster_snapshot(
        snapshot_identifier : String,
        snapshot_cluster_identifier : String? = nil
      ) : Types::DeleteClusterSnapshotResult
        input = Types::DeleteClusterSnapshotMessage.new(snapshot_identifier: snapshot_identifier, snapshot_cluster_identifier: snapshot_cluster_identifier)
        delete_cluster_snapshot(input)
      end
      def delete_cluster_snapshot(input : Types::DeleteClusterSnapshotMessage) : Types::DeleteClusterSnapshotResult
        request = Protocol::Query.build_request(Model::DELETE_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteClusterSnapshotResult, "DeleteClusterSnapshot")
      end

      # Deletes the specified cluster subnet group.
      def delete_cluster_subnet_group(
        cluster_subnet_group_name : String
      ) : Nil
        input = Types::DeleteClusterSubnetGroupMessage.new(cluster_subnet_group_name: cluster_subnet_group_name)
        delete_cluster_subnet_group(input)
      end
      def delete_cluster_subnet_group(input : Types::DeleteClusterSubnetGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CLUSTER_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Contains information about deleting a custom domain association for a cluster.
      def delete_custom_domain_association(
        cluster_identifier : String,
        custom_domain_name : String
      ) : Nil
        input = Types::DeleteCustomDomainAssociationMessage.new(cluster_identifier: cluster_identifier, custom_domain_name: custom_domain_name)
        delete_custom_domain_association(input)
      end
      def delete_custom_domain_association(input : Types::DeleteCustomDomainAssociationMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CUSTOM_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a Redshift-managed VPC endpoint.
      def delete_endpoint_access(
        endpoint_name : String
      ) : Types::EndpointAccess
        input = Types::DeleteEndpointAccessMessage.new(endpoint_name: endpoint_name)
        delete_endpoint_access(input)
      end
      def delete_endpoint_access(input : Types::DeleteEndpointAccessMessage) : Types::EndpointAccess
        request = Protocol::Query.build_request(Model::DELETE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EndpointAccess, "DeleteEndpointAccess")
      end

      # Deletes an Amazon Redshift event notification subscription.
      def delete_event_subscription(
        subscription_name : String
      ) : Nil
        input = Types::DeleteEventSubscriptionMessage.new(subscription_name: subscription_name)
        delete_event_subscription(input)
      end
      def delete_event_subscription(input : Types::DeleteEventSubscriptionMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified HSM client certificate.
      def delete_hsm_client_certificate(
        hsm_client_certificate_identifier : String
      ) : Nil
        input = Types::DeleteHsmClientCertificateMessage.new(hsm_client_certificate_identifier: hsm_client_certificate_identifier)
        delete_hsm_client_certificate(input)
      end
      def delete_hsm_client_certificate(input : Types::DeleteHsmClientCertificateMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_HSM_CLIENT_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified Amazon Redshift HSM configuration.
      def delete_hsm_configuration(
        hsm_configuration_identifier : String
      ) : Nil
        input = Types::DeleteHsmConfigurationMessage.new(hsm_configuration_identifier: hsm_configuration_identifier)
        delete_hsm_configuration(input)
      end
      def delete_hsm_configuration(input : Types::DeleteHsmConfigurationMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_HSM_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a zero-ETL integration or S3 event integration with Amazon Redshift.
      def delete_integration(
        integration_arn : String
      ) : Types::Integration
        input = Types::DeleteIntegrationMessage.new(integration_arn: integration_arn)
        delete_integration(input)
      end
      def delete_integration(input : Types::DeleteIntegrationMessage) : Types::Integration
        request = Protocol::Query.build_request(Model::DELETE_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::Integration, "DeleteIntegration")
      end

      # Deletes a partner integration from a cluster. Data can still flow to the cluster until the
      # integration is deleted at the partner's website.
      def delete_partner(
        account_id : String,
        cluster_identifier : String,
        database_name : String,
        partner_name : String
      ) : Types::PartnerIntegrationOutputMessage
        input = Types::PartnerIntegrationInputMessage.new(account_id: account_id, cluster_identifier: cluster_identifier, database_name: database_name, partner_name: partner_name)
        delete_partner(input)
      end
      def delete_partner(input : Types::PartnerIntegrationInputMessage) : Types::PartnerIntegrationOutputMessage
        request = Protocol::Query.build_request(Model::DELETE_PARTNER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PartnerIntegrationOutputMessage, "DeletePartner")
      end

      # Deletes an Amazon Redshift IAM Identity Center application.
      def delete_redshift_idc_application(
        redshift_idc_application_arn : String
      ) : Nil
        input = Types::DeleteRedshiftIdcApplicationMessage.new(redshift_idc_application_arn: redshift_idc_application_arn)
        delete_redshift_idc_application(input)
      end
      def delete_redshift_idc_application(input : Types::DeleteRedshiftIdcApplicationMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_REDSHIFT_IDC_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the resource policy for a specified resource.
      def delete_resource_policy(
        resource_arn : String
      ) : Nil
        input = Types::DeleteResourcePolicyMessage.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end
      def delete_resource_policy(input : Types::DeleteResourcePolicyMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a scheduled action.
      def delete_scheduled_action(
        scheduled_action_name : String
      ) : Nil
        input = Types::DeleteScheduledActionMessage.new(scheduled_action_name: scheduled_action_name)
        delete_scheduled_action(input)
      end
      def delete_scheduled_action(input : Types::DeleteScheduledActionMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified snapshot copy grant.
      def delete_snapshot_copy_grant(
        snapshot_copy_grant_name : String
      ) : Nil
        input = Types::DeleteSnapshotCopyGrantMessage.new(snapshot_copy_grant_name: snapshot_copy_grant_name)
        delete_snapshot_copy_grant(input)
      end
      def delete_snapshot_copy_grant(input : Types::DeleteSnapshotCopyGrantMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SNAPSHOT_COPY_GRANT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a snapshot schedule.
      def delete_snapshot_schedule(
        schedule_identifier : String
      ) : Nil
        input = Types::DeleteSnapshotScheduleMessage.new(schedule_identifier: schedule_identifier)
        delete_snapshot_schedule(input)
      end
      def delete_snapshot_schedule(input : Types::DeleteSnapshotScheduleMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_SNAPSHOT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes tags from a resource. You must provide the ARN of the resource from which you want to delete
      # the tag or tags.
      def delete_tags(
        resource_name : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::DeleteTagsMessage.new(resource_name: resource_name, tag_keys: tag_keys)
        delete_tags(input)
      end
      def delete_tags(input : Types::DeleteTagsMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a usage limit from a cluster.
      def delete_usage_limit(
        usage_limit_id : String
      ) : Nil
        input = Types::DeleteUsageLimitMessage.new(usage_limit_id: usage_limit_id)
        delete_usage_limit(input)
      end
      def delete_usage_limit(input : Types::DeleteUsageLimitMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_USAGE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deregisters a cluster or serverless namespace from the Amazon Web Services Glue Data Catalog.
      def deregister_namespace(
        consumer_identifiers : Array(String),
        namespace_identifier : Types::NamespaceIdentifierUnion
      ) : Types::DeregisterNamespaceOutputMessage
        input = Types::DeregisterNamespaceInputMessage.new(consumer_identifiers: consumer_identifiers, namespace_identifier: namespace_identifier)
        deregister_namespace(input)
      end
      def deregister_namespace(input : Types::DeregisterNamespaceInputMessage) : Types::DeregisterNamespaceOutputMessage
        request = Protocol::Query.build_request(Model::DEREGISTER_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeregisterNamespaceOutputMessage, "DeregisterNamespace")
      end

      # Returns a list of attributes attached to an account
      def describe_account_attributes(
        attribute_names : Array(String)? = nil
      ) : Types::AccountAttributeList
        input = Types::DescribeAccountAttributesMessage.new(attribute_names: attribute_names)
        describe_account_attributes(input)
      end
      def describe_account_attributes(input : Types::DescribeAccountAttributesMessage) : Types::AccountAttributeList
        request = Protocol::Query.build_request(Model::DESCRIBE_ACCOUNT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AccountAttributeList, "DescribeAccountAttributes")
      end

      # Describes an authentication profile.
      def describe_authentication_profiles(
        authentication_profile_name : String? = nil
      ) : Types::DescribeAuthenticationProfilesResult
        input = Types::DescribeAuthenticationProfilesMessage.new(authentication_profile_name: authentication_profile_name)
        describe_authentication_profiles(input)
      end
      def describe_authentication_profiles(input : Types::DescribeAuthenticationProfilesMessage) : Types::DescribeAuthenticationProfilesResult
        request = Protocol::Query.build_request(Model::DESCRIBE_AUTHENTICATION_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAuthenticationProfilesResult, "DescribeAuthenticationProfiles")
      end

      # Returns an array of ClusterDbRevision objects.
      def describe_cluster_db_revisions(
        cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::ClusterDbRevisionsMessage
        input = Types::DescribeClusterDbRevisionsMessage.new(cluster_identifier: cluster_identifier, marker: marker, max_records: max_records)
        describe_cluster_db_revisions(input)
      end
      def describe_cluster_db_revisions(input : Types::DescribeClusterDbRevisionsMessage) : Types::ClusterDbRevisionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_DB_REVISIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterDbRevisionsMessage, "DescribeClusterDbRevisions")
      end

      # Returns a list of Amazon Redshift parameter groups, including parameter groups you created and the
      # default parameter group. For each parameter group, the response includes the parameter group name,
      # description, and parameter group family name. You can optionally specify a name to retrieve the
      # description of a specific parameter group. For more information about parameters and parameter
      # groups, go to Amazon Redshift Parameter Groups in the Amazon Redshift Cluster Management Guide . If
      # you specify both tag keys and tag values in the same request, Amazon Redshift returns all parameter
      # groups that match any combination of the specified keys and values. For example, if you have owner
      # and environment for tag keys, and admin and test for tag values, all parameter groups that have any
      # combination of those values are returned. If both tag keys and values are omitted from the request,
      # parameter groups are returned regardless of whether they have tag keys or values associated with
      # them.
      def describe_cluster_parameter_groups(
        marker : String? = nil,
        max_records : Int32? = nil,
        parameter_group_name : String? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::ClusterParameterGroupsMessage
        input = Types::DescribeClusterParameterGroupsMessage.new(marker: marker, max_records: max_records, parameter_group_name: parameter_group_name, tag_keys: tag_keys, tag_values: tag_values)
        describe_cluster_parameter_groups(input)
      end
      def describe_cluster_parameter_groups(input : Types::DescribeClusterParameterGroupsMessage) : Types::ClusterParameterGroupsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_PARAMETER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterParameterGroupsMessage, "DescribeClusterParameterGroups")
      end

      # Returns a detailed list of parameters contained within the specified Amazon Redshift parameter
      # group. For each parameter the response includes information such as parameter name, description,
      # data type, value, whether the parameter value is modifiable, and so on. You can specify source
      # filter to retrieve parameters of only specific type. For example, to retrieve parameters that were
      # modified by a user action such as from ModifyClusterParameterGroup , you can specify source equal to
      # user . For more information about parameters and parameter groups, go to Amazon Redshift Parameter
      # Groups in the Amazon Redshift Cluster Management Guide .
      def describe_cluster_parameters(
        parameter_group_name : String,
        marker : String? = nil,
        max_records : Int32? = nil,
        source : String? = nil
      ) : Types::ClusterParameterGroupDetails
        input = Types::DescribeClusterParametersMessage.new(parameter_group_name: parameter_group_name, marker: marker, max_records: max_records, source: source)
        describe_cluster_parameters(input)
      end
      def describe_cluster_parameters(input : Types::DescribeClusterParametersMessage) : Types::ClusterParameterGroupDetails
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterParameterGroupDetails, "DescribeClusterParameters")
      end

      # Returns information about Amazon Redshift security groups. If the name of a security group is
      # specified, the response will contain only information about only that security group. For
      # information about managing security groups, go to Amazon Redshift Cluster Security Groups in the
      # Amazon Redshift Cluster Management Guide . If you specify both tag keys and tag values in the same
      # request, Amazon Redshift returns all security groups that match any combination of the specified
      # keys and values. For example, if you have owner and environment for tag keys, and admin and test for
      # tag values, all security groups that have any combination of those values are returned. If both tag
      # keys and values are omitted from the request, security groups are returned regardless of whether
      # they have tag keys or values associated with them.
      def describe_cluster_security_groups(
        cluster_security_group_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::ClusterSecurityGroupMessage
        input = Types::DescribeClusterSecurityGroupsMessage.new(cluster_security_group_name: cluster_security_group_name, marker: marker, max_records: max_records, tag_keys: tag_keys, tag_values: tag_values)
        describe_cluster_security_groups(input)
      end
      def describe_cluster_security_groups(input : Types::DescribeClusterSecurityGroupsMessage) : Types::ClusterSecurityGroupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_SECURITY_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterSecurityGroupMessage, "DescribeClusterSecurityGroups")
      end

      # Returns one or more snapshot objects, which contain metadata about your cluster snapshots. By
      # default, this operation returns information about all snapshots of all clusters that are owned by
      # your Amazon Web Services account. No information is returned for snapshots owned by inactive Amazon
      # Web Services accounts. If you specify both tag keys and tag values in the same request, Amazon
      # Redshift returns all snapshots that match any combination of the specified keys and values. For
      # example, if you have owner and environment for tag keys, and admin and test for tag values, all
      # snapshots that have any combination of those values are returned. Only snapshots that you own are
      # returned in the response; shared snapshots are not returned with the tag key and tag value request
      # parameters. If both tag keys and values are omitted from the request, snapshots are returned
      # regardless of whether they have tag keys or values associated with them.
      def describe_cluster_snapshots(
        cluster_exists : Bool? = nil,
        cluster_identifier : String? = nil,
        end_time : Time? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        owner_account : String? = nil,
        snapshot_arn : String? = nil,
        snapshot_identifier : String? = nil,
        snapshot_type : String? = nil,
        sorting_entities : Array(Types::SnapshotSortingEntity)? = nil,
        start_time : Time? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::SnapshotMessage
        input = Types::DescribeClusterSnapshotsMessage.new(cluster_exists: cluster_exists, cluster_identifier: cluster_identifier, end_time: end_time, marker: marker, max_records: max_records, owner_account: owner_account, snapshot_arn: snapshot_arn, snapshot_identifier: snapshot_identifier, snapshot_type: snapshot_type, sorting_entities: sorting_entities, start_time: start_time, tag_keys: tag_keys, tag_values: tag_values)
        describe_cluster_snapshots(input)
      end
      def describe_cluster_snapshots(input : Types::DescribeClusterSnapshotsMessage) : Types::SnapshotMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SnapshotMessage, "DescribeClusterSnapshots")
      end

      # Returns one or more cluster subnet group objects, which contain metadata about your cluster subnet
      # groups. By default, this operation returns information about all cluster subnet groups that are
      # defined in your Amazon Web Services account. If you specify both tag keys and tag values in the same
      # request, Amazon Redshift returns all subnet groups that match any combination of the specified keys
      # and values. For example, if you have owner and environment for tag keys, and admin and test for tag
      # values, all subnet groups that have any combination of those values are returned. If both tag keys
      # and values are omitted from the request, subnet groups are returned regardless of whether they have
      # tag keys or values associated with them.
      def describe_cluster_subnet_groups(
        cluster_subnet_group_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::ClusterSubnetGroupMessage
        input = Types::DescribeClusterSubnetGroupsMessage.new(cluster_subnet_group_name: cluster_subnet_group_name, marker: marker, max_records: max_records, tag_keys: tag_keys, tag_values: tag_values)
        describe_cluster_subnet_groups(input)
      end
      def describe_cluster_subnet_groups(input : Types::DescribeClusterSubnetGroupsMessage) : Types::ClusterSubnetGroupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_SUBNET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterSubnetGroupMessage, "DescribeClusterSubnetGroups")
      end

      # Returns a list of all the available maintenance tracks.
      def describe_cluster_tracks(
        maintenance_track_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::TrackListMessage
        input = Types::DescribeClusterTracksMessage.new(maintenance_track_name: maintenance_track_name, marker: marker, max_records: max_records)
        describe_cluster_tracks(input)
      end
      def describe_cluster_tracks(input : Types::DescribeClusterTracksMessage) : Types::TrackListMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_TRACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TrackListMessage, "DescribeClusterTracks")
      end

      # Returns descriptions of the available Amazon Redshift cluster versions. You can call this operation
      # even before creating any clusters to learn more about the Amazon Redshift versions. For more
      # information about managing clusters, go to Amazon Redshift Clusters in the Amazon Redshift Cluster
      # Management Guide .
      def describe_cluster_versions(
        cluster_parameter_group_family : String? = nil,
        cluster_version : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::ClusterVersionsMessage
        input = Types::DescribeClusterVersionsMessage.new(cluster_parameter_group_family: cluster_parameter_group_family, cluster_version: cluster_version, marker: marker, max_records: max_records)
        describe_cluster_versions(input)
      end
      def describe_cluster_versions(input : Types::DescribeClusterVersionsMessage) : Types::ClusterVersionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTER_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterVersionsMessage, "DescribeClusterVersions")
      end

      # Returns properties of provisioned clusters including general cluster properties, cluster database
      # properties, maintenance and backup properties, and security and access properties. This operation
      # supports pagination. For more information about managing clusters, go to Amazon Redshift Clusters in
      # the Amazon Redshift Cluster Management Guide . If you specify both tag keys and tag values in the
      # same request, Amazon Redshift returns all clusters that match any combination of the specified keys
      # and values. For example, if you have owner and environment for tag keys, and admin and test for tag
      # values, all clusters that have any combination of those values are returned. If both tag keys and
      # values are omitted from the request, clusters are returned regardless of whether they have tag keys
      # or values associated with them.
      def describe_clusters(
        cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::ClustersMessage
        input = Types::DescribeClustersMessage.new(cluster_identifier: cluster_identifier, marker: marker, max_records: max_records, tag_keys: tag_keys, tag_values: tag_values)
        describe_clusters(input)
      end
      def describe_clusters(input : Types::DescribeClustersMessage) : Types::ClustersMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClustersMessage, "DescribeClusters")
      end

      # Contains information about custom domain associations for a cluster.
      def describe_custom_domain_associations(
        custom_domain_certificate_arn : String? = nil,
        custom_domain_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::CustomDomainAssociationsMessage
        input = Types::DescribeCustomDomainAssociationsMessage.new(custom_domain_certificate_arn: custom_domain_certificate_arn, custom_domain_name: custom_domain_name, marker: marker, max_records: max_records)
        describe_custom_domain_associations(input)
      end
      def describe_custom_domain_associations(input : Types::DescribeCustomDomainAssociationsMessage) : Types::CustomDomainAssociationsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CUSTOM_DOMAIN_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CustomDomainAssociationsMessage, "DescribeCustomDomainAssociations")
      end

      # Shows the status of any inbound or outbound datashares available in the specified account.
      def describe_data_shares(
        data_share_arn : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDataSharesResult
        input = Types::DescribeDataSharesMessage.new(data_share_arn: data_share_arn, marker: marker, max_records: max_records)
        describe_data_shares(input)
      end
      def describe_data_shares(input : Types::DescribeDataSharesMessage) : Types::DescribeDataSharesResult
        request = Protocol::Query.build_request(Model::DESCRIBE_DATA_SHARES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDataSharesResult, "DescribeDataShares")
      end

      # Returns a list of datashares where the account identifier being called is a consumer account
      # identifier.
      def describe_data_shares_for_consumer(
        consumer_arn : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        status : String? = nil
      ) : Types::DescribeDataSharesForConsumerResult
        input = Types::DescribeDataSharesForConsumerMessage.new(consumer_arn: consumer_arn, marker: marker, max_records: max_records, status: status)
        describe_data_shares_for_consumer(input)
      end
      def describe_data_shares_for_consumer(input : Types::DescribeDataSharesForConsumerMessage) : Types::DescribeDataSharesForConsumerResult
        request = Protocol::Query.build_request(Model::DESCRIBE_DATA_SHARES_FOR_CONSUMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDataSharesForConsumerResult, "DescribeDataSharesForConsumer")
      end

      # Returns a list of datashares when the account identifier being called is a producer account
      # identifier.
      def describe_data_shares_for_producer(
        marker : String? = nil,
        max_records : Int32? = nil,
        producer_arn : String? = nil,
        status : String? = nil
      ) : Types::DescribeDataSharesForProducerResult
        input = Types::DescribeDataSharesForProducerMessage.new(marker: marker, max_records: max_records, producer_arn: producer_arn, status: status)
        describe_data_shares_for_producer(input)
      end
      def describe_data_shares_for_producer(input : Types::DescribeDataSharesForProducerMessage) : Types::DescribeDataSharesForProducerResult
        request = Protocol::Query.build_request(Model::DESCRIBE_DATA_SHARES_FOR_PRODUCER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDataSharesForProducerResult, "DescribeDataSharesForProducer")
      end

      # Returns a list of parameter settings for the specified parameter group family. For more information
      # about parameters and parameter groups, go to Amazon Redshift Parameter Groups in the Amazon Redshift
      # Cluster Management Guide .
      def describe_default_cluster_parameters(
        parameter_group_family : String,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDefaultClusterParametersResult
        input = Types::DescribeDefaultClusterParametersMessage.new(parameter_group_family: parameter_group_family, marker: marker, max_records: max_records)
        describe_default_cluster_parameters(input)
      end
      def describe_default_cluster_parameters(input : Types::DescribeDefaultClusterParametersMessage) : Types::DescribeDefaultClusterParametersResult
        request = Protocol::Query.build_request(Model::DESCRIBE_DEFAULT_CLUSTER_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDefaultClusterParametersResult, "DescribeDefaultClusterParameters")
      end

      # Describes a Redshift-managed VPC endpoint.
      def describe_endpoint_access(
        cluster_identifier : String? = nil,
        endpoint_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        resource_owner : String? = nil,
        vpc_id : String? = nil
      ) : Types::EndpointAccessList
        input = Types::DescribeEndpointAccessMessage.new(cluster_identifier: cluster_identifier, endpoint_name: endpoint_name, marker: marker, max_records: max_records, resource_owner: resource_owner, vpc_id: vpc_id)
        describe_endpoint_access(input)
      end
      def describe_endpoint_access(input : Types::DescribeEndpointAccessMessage) : Types::EndpointAccessList
        request = Protocol::Query.build_request(Model::DESCRIBE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EndpointAccessList, "DescribeEndpointAccess")
      end

      # Describes an endpoint authorization.
      def describe_endpoint_authorization(
        account : String? = nil,
        cluster_identifier : String? = nil,
        grantee : Bool? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::EndpointAuthorizationList
        input = Types::DescribeEndpointAuthorizationMessage.new(account: account, cluster_identifier: cluster_identifier, grantee: grantee, marker: marker, max_records: max_records)
        describe_endpoint_authorization(input)
      end
      def describe_endpoint_authorization(input : Types::DescribeEndpointAuthorizationMessage) : Types::EndpointAuthorizationList
        request = Protocol::Query.build_request(Model::DESCRIBE_ENDPOINT_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EndpointAuthorizationList, "DescribeEndpointAuthorization")
      end

      # Displays a list of event categories for all event source types, or for a specified source type. For
      # a list of the event categories and source types, go to Amazon Redshift Event Notifications .
      def describe_event_categories(
        source_type : String? = nil
      ) : Types::EventCategoriesMessage
        input = Types::DescribeEventCategoriesMessage.new(source_type: source_type)
        describe_event_categories(input)
      end
      def describe_event_categories(input : Types::DescribeEventCategoriesMessage) : Types::EventCategoriesMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENT_CATEGORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventCategoriesMessage, "DescribeEventCategories")
      end

      # Lists descriptions of all the Amazon Redshift event notification subscriptions for a customer
      # account. If you specify a subscription name, lists the description for that subscription. If you
      # specify both tag keys and tag values in the same request, Amazon Redshift returns all event
      # notification subscriptions that match any combination of the specified keys and values. For example,
      # if you have owner and environment for tag keys, and admin and test for tag values, all subscriptions
      # that have any combination of those values are returned. If both tag keys and values are omitted from
      # the request, subscriptions are returned regardless of whether they have tag keys or values
      # associated with them.
      def describe_event_subscriptions(
        marker : String? = nil,
        max_records : Int32? = nil,
        subscription_name : String? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::EventSubscriptionsMessage
        input = Types::DescribeEventSubscriptionsMessage.new(marker: marker, max_records: max_records, subscription_name: subscription_name, tag_keys: tag_keys, tag_values: tag_values)
        describe_event_subscriptions(input)
      end
      def describe_event_subscriptions(input : Types::DescribeEventSubscriptionsMessage) : Types::EventSubscriptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENT_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventSubscriptionsMessage, "DescribeEventSubscriptions")
      end

      # Returns events related to clusters, security groups, snapshots, and parameter groups for the past 14
      # days. Events specific to a particular cluster, security group, snapshot or parameter group can be
      # obtained by providing the name as a parameter. By default, the past hour of events are returned.
      def describe_events(
        duration : Int32? = nil,
        end_time : Time? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        source_identifier : String? = nil,
        source_type : String? = nil,
        start_time : Time? = nil
      ) : Types::EventsMessage
        input = Types::DescribeEventsMessage.new(duration: duration, end_time: end_time, marker: marker, max_records: max_records, source_identifier: source_identifier, source_type: source_type, start_time: start_time)
        describe_events(input)
      end
      def describe_events(input : Types::DescribeEventsMessage) : Types::EventsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventsMessage, "DescribeEvents")
      end

      # Returns information about the specified HSM client certificate. If no certificate ID is specified,
      # returns information about all the HSM certificates owned by your Amazon Web Services account. If you
      # specify both tag keys and tag values in the same request, Amazon Redshift returns all HSM client
      # certificates that match any combination of the specified keys and values. For example, if you have
      # owner and environment for tag keys, and admin and test for tag values, all HSM client certificates
      # that have any combination of those values are returned. If both tag keys and values are omitted from
      # the request, HSM client certificates are returned regardless of whether they have tag keys or values
      # associated with them.
      def describe_hsm_client_certificates(
        hsm_client_certificate_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::HsmClientCertificateMessage
        input = Types::DescribeHsmClientCertificatesMessage.new(hsm_client_certificate_identifier: hsm_client_certificate_identifier, marker: marker, max_records: max_records, tag_keys: tag_keys, tag_values: tag_values)
        describe_hsm_client_certificates(input)
      end
      def describe_hsm_client_certificates(input : Types::DescribeHsmClientCertificatesMessage) : Types::HsmClientCertificateMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_HSM_CLIENT_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::HsmClientCertificateMessage, "DescribeHsmClientCertificates")
      end

      # Returns information about the specified Amazon Redshift HSM configuration. If no configuration ID is
      # specified, returns information about all the HSM configurations owned by your Amazon Web Services
      # account. If you specify both tag keys and tag values in the same request, Amazon Redshift returns
      # all HSM connections that match any combination of the specified keys and values. For example, if you
      # have owner and environment for tag keys, and admin and test for tag values, all HSM connections that
      # have any combination of those values are returned. If both tag keys and values are omitted from the
      # request, HSM connections are returned regardless of whether they have tag keys or values associated
      # with them.
      def describe_hsm_configurations(
        hsm_configuration_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::HsmConfigurationMessage
        input = Types::DescribeHsmConfigurationsMessage.new(hsm_configuration_identifier: hsm_configuration_identifier, marker: marker, max_records: max_records, tag_keys: tag_keys, tag_values: tag_values)
        describe_hsm_configurations(input)
      end
      def describe_hsm_configurations(input : Types::DescribeHsmConfigurationsMessage) : Types::HsmConfigurationMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_HSM_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::HsmConfigurationMessage, "DescribeHsmConfigurations")
      end

      # Returns a list of inbound integrations.
      def describe_inbound_integrations(
        integration_arn : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        target_arn : String? = nil
      ) : Types::InboundIntegrationsMessage
        input = Types::DescribeInboundIntegrationsMessage.new(integration_arn: integration_arn, marker: marker, max_records: max_records, target_arn: target_arn)
        describe_inbound_integrations(input)
      end
      def describe_inbound_integrations(input : Types::DescribeInboundIntegrationsMessage) : Types::InboundIntegrationsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_INBOUND_INTEGRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::InboundIntegrationsMessage, "DescribeInboundIntegrations")
      end

      # Describes one or more zero-ETL or S3 event integrations with Amazon Redshift.
      def describe_integrations(
        filters : Array(Types::DescribeIntegrationsFilter)? = nil,
        integration_arn : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::IntegrationsMessage
        input = Types::DescribeIntegrationsMessage.new(filters: filters, integration_arn: integration_arn, marker: marker, max_records: max_records)
        describe_integrations(input)
      end
      def describe_integrations(input : Types::DescribeIntegrationsMessage) : Types::IntegrationsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_INTEGRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::IntegrationsMessage, "DescribeIntegrations")
      end

      # Describes whether information, such as queries and connection attempts, is being logged for the
      # specified Amazon Redshift cluster.
      def describe_logging_status(
        cluster_identifier : String
      ) : Types::LoggingStatus
        input = Types::DescribeLoggingStatusMessage.new(cluster_identifier: cluster_identifier)
        describe_logging_status(input)
      end
      def describe_logging_status(input : Types::DescribeLoggingStatusMessage) : Types::LoggingStatus
        request = Protocol::Query.build_request(Model::DESCRIBE_LOGGING_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::LoggingStatus, "DescribeLoggingStatus")
      end

      # Returns properties of possible node configurations such as node type, number of nodes, and disk
      # usage for the specified action type.
      def describe_node_configuration_options(
        action_type : String,
        cluster_identifier : String? = nil,
        filters : Array(Types::NodeConfigurationOptionsFilter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        owner_account : String? = nil,
        snapshot_arn : String? = nil,
        snapshot_identifier : String? = nil
      ) : Types::NodeConfigurationOptionsMessage
        input = Types::DescribeNodeConfigurationOptionsMessage.new(action_type: action_type, cluster_identifier: cluster_identifier, filters: filters, marker: marker, max_records: max_records, owner_account: owner_account, snapshot_arn: snapshot_arn, snapshot_identifier: snapshot_identifier)
        describe_node_configuration_options(input)
      end
      def describe_node_configuration_options(input : Types::DescribeNodeConfigurationOptionsMessage) : Types::NodeConfigurationOptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_NODE_CONFIGURATION_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::NodeConfigurationOptionsMessage, "DescribeNodeConfigurationOptions")
      end

      # Returns a list of orderable cluster options. Before you create a new cluster you can use this
      # operation to find what options are available, such as the EC2 Availability Zones (AZ) in the
      # specific Amazon Web Services Region that you can specify, and the node types you can request. The
      # node types differ by available storage, memory, CPU and price. With the cost involved you might want
      # to obtain a list of cluster options in the specific region and specify values when creating a
      # cluster. For more information about managing clusters, go to Amazon Redshift Clusters in the Amazon
      # Redshift Cluster Management Guide .
      def describe_orderable_cluster_options(
        cluster_version : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        node_type : String? = nil
      ) : Types::OrderableClusterOptionsMessage
        input = Types::DescribeOrderableClusterOptionsMessage.new(cluster_version: cluster_version, marker: marker, max_records: max_records, node_type: node_type)
        describe_orderable_cluster_options(input)
      end
      def describe_orderable_cluster_options(input : Types::DescribeOrderableClusterOptionsMessage) : Types::OrderableClusterOptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_ORDERABLE_CLUSTER_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::OrderableClusterOptionsMessage, "DescribeOrderableClusterOptions")
      end

      # Returns information about the partner integrations defined for a cluster.
      def describe_partners(
        account_id : String,
        cluster_identifier : String,
        database_name : String? = nil,
        partner_name : String? = nil
      ) : Types::DescribePartnersOutputMessage
        input = Types::DescribePartnersInputMessage.new(account_id: account_id, cluster_identifier: cluster_identifier, database_name: database_name, partner_name: partner_name)
        describe_partners(input)
      end
      def describe_partners(input : Types::DescribePartnersInputMessage) : Types::DescribePartnersOutputMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_PARTNERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribePartnersOutputMessage, "DescribePartners")
      end

      # Lists the Amazon Redshift IAM Identity Center applications.
      def describe_redshift_idc_applications(
        marker : String? = nil,
        max_records : Int32? = nil,
        redshift_idc_application_arn : String? = nil
      ) : Types::DescribeRedshiftIdcApplicationsResult
        input = Types::DescribeRedshiftIdcApplicationsMessage.new(marker: marker, max_records: max_records, redshift_idc_application_arn: redshift_idc_application_arn)
        describe_redshift_idc_applications(input)
      end
      def describe_redshift_idc_applications(input : Types::DescribeRedshiftIdcApplicationsMessage) : Types::DescribeRedshiftIdcApplicationsResult
        request = Protocol::Query.build_request(Model::DESCRIBE_REDSHIFT_IDC_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeRedshiftIdcApplicationsResult, "DescribeRedshiftIdcApplications")
      end

      # Returns exchange status details and associated metadata for a reserved-node exchange. Statuses
      # include such values as in progress and requested.
      def describe_reserved_node_exchange_status(
        marker : String? = nil,
        max_records : Int32? = nil,
        reserved_node_exchange_request_id : String? = nil,
        reserved_node_id : String? = nil
      ) : Types::DescribeReservedNodeExchangeStatusOutputMessage
        input = Types::DescribeReservedNodeExchangeStatusInputMessage.new(marker: marker, max_records: max_records, reserved_node_exchange_request_id: reserved_node_exchange_request_id, reserved_node_id: reserved_node_id)
        describe_reserved_node_exchange_status(input)
      end
      def describe_reserved_node_exchange_status(input : Types::DescribeReservedNodeExchangeStatusInputMessage) : Types::DescribeReservedNodeExchangeStatusOutputMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESERVED_NODE_EXCHANGE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeReservedNodeExchangeStatusOutputMessage, "DescribeReservedNodeExchangeStatus")
      end

      # Returns a list of the available reserved node offerings by Amazon Redshift with their descriptions
      # including the node type, the fixed and recurring costs of reserving the node and duration the node
      # will be reserved for you. These descriptions help you determine which reserve node offering you want
      # to purchase. You then use the unique offering ID in you call to PurchaseReservedNodeOffering to
      # reserve one or more nodes for your Amazon Redshift cluster. For more information about reserved node
      # offerings, go to Purchasing Reserved Nodes in the Amazon Redshift Cluster Management Guide .
      def describe_reserved_node_offerings(
        marker : String? = nil,
        max_records : Int32? = nil,
        reserved_node_offering_id : String? = nil
      ) : Types::ReservedNodeOfferingsMessage
        input = Types::DescribeReservedNodeOfferingsMessage.new(marker: marker, max_records: max_records, reserved_node_offering_id: reserved_node_offering_id)
        describe_reserved_node_offerings(input)
      end
      def describe_reserved_node_offerings(input : Types::DescribeReservedNodeOfferingsMessage) : Types::ReservedNodeOfferingsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESERVED_NODE_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReservedNodeOfferingsMessage, "DescribeReservedNodeOfferings")
      end

      # Returns the descriptions of the reserved nodes.
      def describe_reserved_nodes(
        marker : String? = nil,
        max_records : Int32? = nil,
        reserved_node_id : String? = nil
      ) : Types::ReservedNodesMessage
        input = Types::DescribeReservedNodesMessage.new(marker: marker, max_records: max_records, reserved_node_id: reserved_node_id)
        describe_reserved_nodes(input)
      end
      def describe_reserved_nodes(input : Types::DescribeReservedNodesMessage) : Types::ReservedNodesMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESERVED_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReservedNodesMessage, "DescribeReservedNodes")
      end

      # Returns information about the last resize operation for the specified cluster. If no resize
      # operation has ever been initiated for the specified cluster, a HTTP 404 error is returned. If a
      # resize operation was initiated and completed, the status of the resize remains as SUCCEEDED until
      # the next resize. A resize operation can be requested using ModifyCluster and specifying a different
      # number or type of nodes for the cluster.
      def describe_resize(
        cluster_identifier : String
      ) : Types::ResizeProgressMessage
        input = Types::DescribeResizeMessage.new(cluster_identifier: cluster_identifier)
        describe_resize(input)
      end
      def describe_resize(input : Types::DescribeResizeMessage) : Types::ResizeProgressMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESIZE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ResizeProgressMessage, "DescribeResize")
      end

      # Describes properties of scheduled actions.
      def describe_scheduled_actions(
        active : Bool? = nil,
        end_time : Time? = nil,
        filters : Array(Types::ScheduledActionFilter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        scheduled_action_name : String? = nil,
        start_time : Time? = nil,
        target_action_type : String? = nil
      ) : Types::ScheduledActionsMessage
        input = Types::DescribeScheduledActionsMessage.new(active: active, end_time: end_time, filters: filters, marker: marker, max_records: max_records, scheduled_action_name: scheduled_action_name, start_time: start_time, target_action_type: target_action_type)
        describe_scheduled_actions(input)
      end
      def describe_scheduled_actions(input : Types::DescribeScheduledActionsMessage) : Types::ScheduledActionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_SCHEDULED_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ScheduledActionsMessage, "DescribeScheduledActions")
      end

      # Returns a list of snapshot copy grants owned by the Amazon Web Services account in the destination
      # region. For more information about managing snapshot copy grants, go to Amazon Redshift Database
      # Encryption in the Amazon Redshift Cluster Management Guide .
      def describe_snapshot_copy_grants(
        marker : String? = nil,
        max_records : Int32? = nil,
        snapshot_copy_grant_name : String? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::SnapshotCopyGrantMessage
        input = Types::DescribeSnapshotCopyGrantsMessage.new(marker: marker, max_records: max_records, snapshot_copy_grant_name: snapshot_copy_grant_name, tag_keys: tag_keys, tag_values: tag_values)
        describe_snapshot_copy_grants(input)
      end
      def describe_snapshot_copy_grants(input : Types::DescribeSnapshotCopyGrantsMessage) : Types::SnapshotCopyGrantMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_SNAPSHOT_COPY_GRANTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SnapshotCopyGrantMessage, "DescribeSnapshotCopyGrants")
      end

      # Returns a list of snapshot schedules.
      def describe_snapshot_schedules(
        cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        schedule_identifier : String? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::DescribeSnapshotSchedulesOutputMessage
        input = Types::DescribeSnapshotSchedulesMessage.new(cluster_identifier: cluster_identifier, marker: marker, max_records: max_records, schedule_identifier: schedule_identifier, tag_keys: tag_keys, tag_values: tag_values)
        describe_snapshot_schedules(input)
      end
      def describe_snapshot_schedules(input : Types::DescribeSnapshotSchedulesMessage) : Types::DescribeSnapshotSchedulesOutputMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_SNAPSHOT_SCHEDULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeSnapshotSchedulesOutputMessage, "DescribeSnapshotSchedules")
      end

      # Returns account level backups storage size and provisional storage.
      def describe_storage : Types::CustomerStorageMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_STORAGE, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CustomerStorageMessage, "DescribeStorage")
      end

      # Lists the status of one or more table restore requests made using the
      # RestoreTableFromClusterSnapshot API action. If you don't specify a value for the
      # TableRestoreRequestId parameter, then DescribeTableRestoreStatus returns the status of all table
      # restore requests ordered by the date and time of the request in ascending order. Otherwise
      # DescribeTableRestoreStatus returns the status of the table specified by TableRestoreRequestId .
      def describe_table_restore_status(
        cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        table_restore_request_id : String? = nil
      ) : Types::TableRestoreStatusMessage
        input = Types::DescribeTableRestoreStatusMessage.new(cluster_identifier: cluster_identifier, marker: marker, max_records: max_records, table_restore_request_id: table_restore_request_id)
        describe_table_restore_status(input)
      end
      def describe_table_restore_status(input : Types::DescribeTableRestoreStatusMessage) : Types::TableRestoreStatusMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_TABLE_RESTORE_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TableRestoreStatusMessage, "DescribeTableRestoreStatus")
      end

      # Returns a list of tags. You can return tags from a specific resource by specifying an ARN, or you
      # can return all tags for a given type of resource, such as clusters, snapshots, and so on. The
      # following are limitations for DescribeTags : You cannot specify an ARN and a resource-type value
      # together in the same request. You cannot use the MaxRecords and Marker parameters together with the
      # ARN parameter. The MaxRecords parameter can be a range from 10 to 50 results to return in a request.
      # If you specify both tag keys and tag values in the same request, Amazon Redshift returns all
      # resources that match any combination of the specified keys and values. For example, if you have
      # owner and environment for tag keys, and admin and test for tag values, all resources that have any
      # combination of those values are returned. If both tag keys and values are omitted from the request,
      # resources are returned regardless of whether they have tag keys or values associated with them.
      def describe_tags(
        marker : String? = nil,
        max_records : Int32? = nil,
        resource_name : String? = nil,
        resource_type : String? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil
      ) : Types::TaggedResourceListMessage
        input = Types::DescribeTagsMessage.new(marker: marker, max_records: max_records, resource_name: resource_name, resource_type: resource_type, tag_keys: tag_keys, tag_values: tag_values)
        describe_tags(input)
      end
      def describe_tags(input : Types::DescribeTagsMessage) : Types::TaggedResourceListMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TaggedResourceListMessage, "DescribeTags")
      end

      # Shows usage limits on a cluster. Results are filtered based on the combination of input usage limit
      # identifier, cluster identifier, and feature type parameters: If usage limit identifier, cluster
      # identifier, and feature type are not provided, then all usage limit objects for the current account
      # in the current region are returned. If usage limit identifier is provided, then the corresponding
      # usage limit object is returned. If cluster identifier is provided, then all usage limit objects for
      # the specified cluster are returned. If cluster identifier and feature type are provided, then all
      # usage limit objects for the combination of cluster and feature are returned.
      def describe_usage_limits(
        cluster_identifier : String? = nil,
        feature_type : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        tag_keys : Array(String)? = nil,
        tag_values : Array(String)? = nil,
        usage_limit_id : String? = nil
      ) : Types::UsageLimitList
        input = Types::DescribeUsageLimitsMessage.new(cluster_identifier: cluster_identifier, feature_type: feature_type, marker: marker, max_records: max_records, tag_keys: tag_keys, tag_values: tag_values, usage_limit_id: usage_limit_id)
        describe_usage_limits(input)
      end
      def describe_usage_limits(input : Types::DescribeUsageLimitsMessage) : Types::UsageLimitList
        request = Protocol::Query.build_request(Model::DESCRIBE_USAGE_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UsageLimitList, "DescribeUsageLimits")
      end

      # Stops logging information, such as queries and connection attempts, for the specified Amazon
      # Redshift cluster.
      def disable_logging(
        cluster_identifier : String
      ) : Types::LoggingStatus
        input = Types::DisableLoggingMessage.new(cluster_identifier: cluster_identifier)
        disable_logging(input)
      end
      def disable_logging(input : Types::DisableLoggingMessage) : Types::LoggingStatus
        request = Protocol::Query.build_request(Model::DISABLE_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::LoggingStatus, "DisableLogging")
      end

      # Disables the automatic copying of snapshots from one region to another region for a specified
      # cluster. If your cluster and its snapshots are encrypted using an encrypted symmetric key from Key
      # Management Service, use DeleteSnapshotCopyGrant to delete the grant that grants Amazon Redshift
      # permission to the key in the destination region.
      def disable_snapshot_copy(
        cluster_identifier : String
      ) : Types::DisableSnapshotCopyResult
        input = Types::DisableSnapshotCopyMessage.new(cluster_identifier: cluster_identifier)
        disable_snapshot_copy(input)
      end
      def disable_snapshot_copy(input : Types::DisableSnapshotCopyMessage) : Types::DisableSnapshotCopyResult
        request = Protocol::Query.build_request(Model::DISABLE_SNAPSHOT_COPY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DisableSnapshotCopyResult, "DisableSnapshotCopy")
      end

      # From a datashare consumer account, remove association for the specified datashare.
      def disassociate_data_share_consumer(
        data_share_arn : String,
        consumer_arn : String? = nil,
        consumer_region : String? = nil,
        disassociate_entire_account : Bool? = nil
      ) : Types::DataShare
        input = Types::DisassociateDataShareConsumerMessage.new(data_share_arn: data_share_arn, consumer_arn: consumer_arn, consumer_region: consumer_region, disassociate_entire_account: disassociate_entire_account)
        disassociate_data_share_consumer(input)
      end
      def disassociate_data_share_consumer(input : Types::DisassociateDataShareConsumerMessage) : Types::DataShare
        request = Protocol::Query.build_request(Model::DISASSOCIATE_DATA_SHARE_CONSUMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DataShare, "DisassociateDataShareConsumer")
      end

      # Starts logging information, such as queries and connection attempts, for the specified Amazon
      # Redshift cluster.
      def enable_logging(
        cluster_identifier : String,
        bucket_name : String? = nil,
        log_destination_type : String? = nil,
        log_exports : Array(String)? = nil,
        s3_key_prefix : String? = nil
      ) : Types::LoggingStatus
        input = Types::EnableLoggingMessage.new(cluster_identifier: cluster_identifier, bucket_name: bucket_name, log_destination_type: log_destination_type, log_exports: log_exports, s3_key_prefix: s3_key_prefix)
        enable_logging(input)
      end
      def enable_logging(input : Types::EnableLoggingMessage) : Types::LoggingStatus
        request = Protocol::Query.build_request(Model::ENABLE_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::LoggingStatus, "EnableLogging")
      end

      # Enables the automatic copy of snapshots from one region to another region for a specified cluster.
      def enable_snapshot_copy(
        cluster_identifier : String,
        destination_region : String,
        manual_snapshot_retention_period : Int32? = nil,
        retention_period : Int32? = nil,
        snapshot_copy_grant_name : String? = nil
      ) : Types::EnableSnapshotCopyResult
        input = Types::EnableSnapshotCopyMessage.new(cluster_identifier: cluster_identifier, destination_region: destination_region, manual_snapshot_retention_period: manual_snapshot_retention_period, retention_period: retention_period, snapshot_copy_grant_name: snapshot_copy_grant_name)
        enable_snapshot_copy(input)
      end
      def enable_snapshot_copy(input : Types::EnableSnapshotCopyMessage) : Types::EnableSnapshotCopyResult
        request = Protocol::Query.build_request(Model::ENABLE_SNAPSHOT_COPY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnableSnapshotCopyResult, "EnableSnapshotCopy")
      end

      # Fails over the primary compute unit of the specified Multi-AZ cluster to another Availability Zone.
      def failover_primary_compute(
        cluster_identifier : String
      ) : Types::FailoverPrimaryComputeResult
        input = Types::FailoverPrimaryComputeInputMessage.new(cluster_identifier: cluster_identifier)
        failover_primary_compute(input)
      end
      def failover_primary_compute(input : Types::FailoverPrimaryComputeInputMessage) : Types::FailoverPrimaryComputeResult
        request = Protocol::Query.build_request(Model::FAILOVER_PRIMARY_COMPUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::FailoverPrimaryComputeResult, "FailoverPrimaryCompute")
      end

      # Returns a database user name and temporary password with temporary authorization to log on to an
      # Amazon Redshift database. The action returns the database user name prefixed with IAM: if AutoCreate
      # is False or IAMA: if AutoCreate is True . You can optionally specify one or more database user
      # groups that the user will join at log on. By default, the temporary credentials expire in 900
      # seconds. You can optionally specify a duration between 900 seconds (15 minutes) and 3600 seconds (60
      # minutes). For more information, see Using IAM Authentication to Generate Database User Credentials
      # in the Amazon Redshift Cluster Management Guide. The Identity and Access Management (IAM) user or
      # role that runs GetClusterCredentials must have an IAM policy attached that allows access to all
      # necessary actions and resources. For more information about permissions, see Resource Policies for
      # GetClusterCredentials in the Amazon Redshift Cluster Management Guide. If the DbGroups parameter is
      # specified, the IAM policy must allow the redshift:JoinGroup action with access to the listed
      # dbgroups . In addition, if the AutoCreate parameter is set to True , then the policy must include
      # the redshift:CreateClusterUser permission. If the DbName parameter is specified, the IAM policy must
      # allow access to the resource dbname for the specified database name.
      def get_cluster_credentials(
        db_user : String,
        auto_create : Bool? = nil,
        cluster_identifier : String? = nil,
        custom_domain_name : String? = nil,
        db_groups : Array(String)? = nil,
        db_name : String? = nil,
        duration_seconds : Int32? = nil
      ) : Types::ClusterCredentials
        input = Types::GetClusterCredentialsMessage.new(db_user: db_user, auto_create: auto_create, cluster_identifier: cluster_identifier, custom_domain_name: custom_domain_name, db_groups: db_groups, db_name: db_name, duration_seconds: duration_seconds)
        get_cluster_credentials(input)
      end
      def get_cluster_credentials(input : Types::GetClusterCredentialsMessage) : Types::ClusterCredentials
        request = Protocol::Query.build_request(Model::GET_CLUSTER_CREDENTIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterCredentials, "GetClusterCredentials")
      end

      # Returns a database user name and temporary password with temporary authorization to log in to an
      # Amazon Redshift database. The database user is mapped 1:1 to the source Identity and Access
      # Management (IAM) identity. For more information about IAM identities, see IAM Identities (users,
      # user groups, and roles) in the Amazon Web Services Identity and Access Management User Guide. The
      # Identity and Access Management (IAM) identity that runs this operation must have an IAM policy
      # attached that allows access to all necessary actions and resources. For more information about
      # permissions, see Using identity-based policies (IAM policies) in the Amazon Redshift Cluster
      # Management Guide.
      def get_cluster_credentials_with_iam(
        cluster_identifier : String? = nil,
        custom_domain_name : String? = nil,
        db_name : String? = nil,
        duration_seconds : Int32? = nil
      ) : Types::ClusterExtendedCredentials
        input = Types::GetClusterCredentialsWithIAMMessage.new(cluster_identifier: cluster_identifier, custom_domain_name: custom_domain_name, db_name: db_name, duration_seconds: duration_seconds)
        get_cluster_credentials_with_iam(input)
      end
      def get_cluster_credentials_with_iam(input : Types::GetClusterCredentialsWithIAMMessage) : Types::ClusterExtendedCredentials
        request = Protocol::Query.build_request(Model::GET_CLUSTER_CREDENTIALS_WITH_IAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterExtendedCredentials, "GetClusterCredentialsWithIAM")
      end

      # Generates an encrypted authentication token that propagates the caller's Amazon Web Services IAM
      # Identity Center identity to Amazon Redshift clusters. This API extracts the Amazon Web Services IAM
      # Identity Center identity from enhanced credentials and creates a secure token that Amazon Redshift
      # drivers can use for authentication. The token is encrypted using Key Management Service (KMS) and
      # can only be decrypted by the specified Amazon Redshift clusters. The token contains the caller's
      # Amazon Web Services IAM Identity Center identity information and is valid for a limited time period.
      # This API is exclusively for use with Amazon Web Services IAM Identity Center enhanced credentials.
      # If the caller is not using enhanced credentials with embedded Amazon Web Services IAM Identity
      # Center identity, the API will return an error.
      def get_identity_center_auth_token(
        cluster_ids : Array(String)
      ) : Types::GetIdentityCenterAuthTokenResponse
        input = Types::GetIdentityCenterAuthTokenRequest.new(cluster_ids: cluster_ids)
        get_identity_center_auth_token(input)
      end
      def get_identity_center_auth_token(input : Types::GetIdentityCenterAuthTokenRequest) : Types::GetIdentityCenterAuthTokenResponse
        request = Protocol::Query.build_request(Model::GET_IDENTITY_CENTER_AUTH_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetIdentityCenterAuthTokenResponse, "GetIdentityCenterAuthToken")
      end

      # Gets the configuration options for the reserved-node exchange. These options include information
      # about the source reserved node and target reserved node offering. Details include the node type, the
      # price, the node count, and the offering type.
      def get_reserved_node_exchange_configuration_options(
        action_type : String,
        cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        snapshot_identifier : String? = nil
      ) : Types::GetReservedNodeExchangeConfigurationOptionsOutputMessage
        input = Types::GetReservedNodeExchangeConfigurationOptionsInputMessage.new(action_type: action_type, cluster_identifier: cluster_identifier, marker: marker, max_records: max_records, snapshot_identifier: snapshot_identifier)
        get_reserved_node_exchange_configuration_options(input)
      end
      def get_reserved_node_exchange_configuration_options(input : Types::GetReservedNodeExchangeConfigurationOptionsInputMessage) : Types::GetReservedNodeExchangeConfigurationOptionsOutputMessage
        request = Protocol::Query.build_request(Model::GET_RESERVED_NODE_EXCHANGE_CONFIGURATION_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetReservedNodeExchangeConfigurationOptionsOutputMessage, "GetReservedNodeExchangeConfigurationOptions")
      end

      # Returns an array of DC2 ReservedNodeOfferings that matches the payment type, term, and usage price
      # of the given DC1 reserved node.
      def get_reserved_node_exchange_offerings(
        reserved_node_id : String,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::GetReservedNodeExchangeOfferingsOutputMessage
        input = Types::GetReservedNodeExchangeOfferingsInputMessage.new(reserved_node_id: reserved_node_id, marker: marker, max_records: max_records)
        get_reserved_node_exchange_offerings(input)
      end
      def get_reserved_node_exchange_offerings(input : Types::GetReservedNodeExchangeOfferingsInputMessage) : Types::GetReservedNodeExchangeOfferingsOutputMessage
        request = Protocol::Query.build_request(Model::GET_RESERVED_NODE_EXCHANGE_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetReservedNodeExchangeOfferingsOutputMessage, "GetReservedNodeExchangeOfferings")
      end

      # Get the resource policy for a specified resource.
      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyResult
        input = Types::GetResourcePolicyMessage.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end
      def get_resource_policy(input : Types::GetResourcePolicyMessage) : Types::GetResourcePolicyResult
        request = Protocol::Query.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetResourcePolicyResult, "GetResourcePolicy")
      end

      # List the Amazon Redshift Advisor recommendations for one or multiple Amazon Redshift clusters in an
      # Amazon Web Services account.
      def list_recommendations(
        cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        namespace_arn : String? = nil
      ) : Types::ListRecommendationsResult
        input = Types::ListRecommendationsMessage.new(cluster_identifier: cluster_identifier, marker: marker, max_records: max_records, namespace_arn: namespace_arn)
        list_recommendations(input)
      end
      def list_recommendations(input : Types::ListRecommendationsMessage) : Types::ListRecommendationsResult
        request = Protocol::Query.build_request(Model::LIST_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListRecommendationsResult, "ListRecommendations")
      end

      # This operation is retired. Calling this operation does not change AQUA configuration. Amazon
      # Redshift automatically determines whether to use AQUA (Advanced Query Accelerator).
      def modify_aqua_configuration(
        cluster_identifier : String,
        aqua_configuration_status : String? = nil
      ) : Types::ModifyAquaOutputMessage
        input = Types::ModifyAquaInputMessage.new(cluster_identifier: cluster_identifier, aqua_configuration_status: aqua_configuration_status)
        modify_aqua_configuration(input)
      end
      def modify_aqua_configuration(input : Types::ModifyAquaInputMessage) : Types::ModifyAquaOutputMessage
        request = Protocol::Query.build_request(Model::MODIFY_AQUA_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyAquaOutputMessage, "ModifyAquaConfiguration")
      end

      # Modifies an authentication profile.
      def modify_authentication_profile(
        authentication_profile_content : String,
        authentication_profile_name : String
      ) : Types::ModifyAuthenticationProfileResult
        input = Types::ModifyAuthenticationProfileMessage.new(authentication_profile_content: authentication_profile_content, authentication_profile_name: authentication_profile_name)
        modify_authentication_profile(input)
      end
      def modify_authentication_profile(input : Types::ModifyAuthenticationProfileMessage) : Types::ModifyAuthenticationProfileResult
        request = Protocol::Query.build_request(Model::MODIFY_AUTHENTICATION_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyAuthenticationProfileResult, "ModifyAuthenticationProfile")
      end

      # Modifies the settings for a cluster. You can also change node type and the number of nodes to scale
      # up or down the cluster. When resizing a cluster, you must specify both the number of nodes and the
      # node type even if one of the parameters does not change. You can add another security or parameter
      # group, or change the admin user password. Resetting a cluster password or modifying the security
      # groups associated with a cluster do not need a reboot. However, modifying a parameter group requires
      # a reboot for parameters to take effect. For more information about managing clusters, go to Amazon
      # Redshift Clusters in the Amazon Redshift Cluster Management Guide . VPC Block Public Access (BPA)
      # enables you to block resources in VPCs and subnets that you own in a Region from reaching or being
      # reached from the internet through internet gateways and egress-only internet gateways. If a subnet
      # group for a provisioned cluster is in an account with VPC BPA turned on, the following capabilities
      # are blocked: Creating a public cluster Restoring a public cluster Modifying a private cluster to be
      # public Adding a subnet with VPC BPA turned on to the subnet group when there's at least one public
      # cluster within the group For more information about VPC BPA, see Block public access to VPCs and
      # subnets in the Amazon VPC User Guide .
      def modify_cluster(
        cluster_identifier : String,
        allow_version_upgrade : Bool? = nil,
        automated_snapshot_retention_period : Int32? = nil,
        availability_zone : String? = nil,
        availability_zone_relocation : Bool? = nil,
        cluster_parameter_group_name : String? = nil,
        cluster_security_groups : Array(String)? = nil,
        cluster_type : String? = nil,
        cluster_version : String? = nil,
        elastic_ip : String? = nil,
        encrypted : Bool? = nil,
        enhanced_vpc_routing : Bool? = nil,
        extra_compute_for_automatic_optimization : Bool? = nil,
        hsm_client_certificate_identifier : String? = nil,
        hsm_configuration_identifier : String? = nil,
        ip_address_type : String? = nil,
        kms_key_id : String? = nil,
        maintenance_track_name : String? = nil,
        manage_master_password : Bool? = nil,
        manual_snapshot_retention_period : Int32? = nil,
        master_password_secret_kms_key_id : String? = nil,
        master_user_password : String? = nil,
        multi_az : Bool? = nil,
        new_cluster_identifier : String? = nil,
        node_type : String? = nil,
        number_of_nodes : Int32? = nil,
        port : Int32? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyClusterResult
        input = Types::ModifyClusterMessage.new(cluster_identifier: cluster_identifier, allow_version_upgrade: allow_version_upgrade, automated_snapshot_retention_period: automated_snapshot_retention_period, availability_zone: availability_zone, availability_zone_relocation: availability_zone_relocation, cluster_parameter_group_name: cluster_parameter_group_name, cluster_security_groups: cluster_security_groups, cluster_type: cluster_type, cluster_version: cluster_version, elastic_ip: elastic_ip, encrypted: encrypted, enhanced_vpc_routing: enhanced_vpc_routing, extra_compute_for_automatic_optimization: extra_compute_for_automatic_optimization, hsm_client_certificate_identifier: hsm_client_certificate_identifier, hsm_configuration_identifier: hsm_configuration_identifier, ip_address_type: ip_address_type, kms_key_id: kms_key_id, maintenance_track_name: maintenance_track_name, manage_master_password: manage_master_password, manual_snapshot_retention_period: manual_snapshot_retention_period, master_password_secret_kms_key_id: master_password_secret_kms_key_id, master_user_password: master_user_password, multi_az: multi_az, new_cluster_identifier: new_cluster_identifier, node_type: node_type, number_of_nodes: number_of_nodes, port: port, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, vpc_security_group_ids: vpc_security_group_ids)
        modify_cluster(input)
      end
      def modify_cluster(input : Types::ModifyClusterMessage) : Types::ModifyClusterResult
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyClusterResult, "ModifyCluster")
      end

      # Modifies the database revision of a cluster. The database revision is a unique revision of the
      # database running in a cluster.
      def modify_cluster_db_revision(
        cluster_identifier : String,
        revision_target : String
      ) : Types::ModifyClusterDbRevisionResult
        input = Types::ModifyClusterDbRevisionMessage.new(cluster_identifier: cluster_identifier, revision_target: revision_target)
        modify_cluster_db_revision(input)
      end
      def modify_cluster_db_revision(input : Types::ModifyClusterDbRevisionMessage) : Types::ModifyClusterDbRevisionResult
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER_DB_REVISION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyClusterDbRevisionResult, "ModifyClusterDbRevision")
      end

      # Modifies the list of Identity and Access Management (IAM) roles that can be used by the cluster to
      # access other Amazon Web Services services. The maximum number of IAM roles that you can associate is
      # subject to a quota. For more information, go to Quotas and limits in the Amazon Redshift Cluster
      # Management Guide .
      def modify_cluster_iam_roles(
        cluster_identifier : String,
        add_iam_roles : Array(String)? = nil,
        default_iam_role_arn : String? = nil,
        remove_iam_roles : Array(String)? = nil
      ) : Types::ModifyClusterIamRolesResult
        input = Types::ModifyClusterIamRolesMessage.new(cluster_identifier: cluster_identifier, add_iam_roles: add_iam_roles, default_iam_role_arn: default_iam_role_arn, remove_iam_roles: remove_iam_roles)
        modify_cluster_iam_roles(input)
      end
      def modify_cluster_iam_roles(input : Types::ModifyClusterIamRolesMessage) : Types::ModifyClusterIamRolesResult
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER_IAM_ROLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyClusterIamRolesResult, "ModifyClusterIamRoles")
      end

      # Modifies the maintenance settings of a cluster.
      def modify_cluster_maintenance(
        cluster_identifier : String,
        defer_maintenance : Bool? = nil,
        defer_maintenance_duration : Int32? = nil,
        defer_maintenance_end_time : Time? = nil,
        defer_maintenance_identifier : String? = nil,
        defer_maintenance_start_time : Time? = nil
      ) : Types::ModifyClusterMaintenanceResult
        input = Types::ModifyClusterMaintenanceMessage.new(cluster_identifier: cluster_identifier, defer_maintenance: defer_maintenance, defer_maintenance_duration: defer_maintenance_duration, defer_maintenance_end_time: defer_maintenance_end_time, defer_maintenance_identifier: defer_maintenance_identifier, defer_maintenance_start_time: defer_maintenance_start_time)
        modify_cluster_maintenance(input)
      end
      def modify_cluster_maintenance(input : Types::ModifyClusterMaintenanceMessage) : Types::ModifyClusterMaintenanceResult
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER_MAINTENANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyClusterMaintenanceResult, "ModifyClusterMaintenance")
      end

      # Modifies the parameters of a parameter group. For the parameters parameter, it can't contain ASCII
      # characters. For more information about parameters and parameter groups, go to Amazon Redshift
      # Parameter Groups in the Amazon Redshift Cluster Management Guide .
      def modify_cluster_parameter_group(
        parameter_group_name : String,
        parameters : Array(Types::Parameter)
      ) : Types::ClusterParameterGroupNameMessage
        input = Types::ModifyClusterParameterGroupMessage.new(parameter_group_name: parameter_group_name, parameters: parameters)
        modify_cluster_parameter_group(input)
      end
      def modify_cluster_parameter_group(input : Types::ModifyClusterParameterGroupMessage) : Types::ClusterParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterParameterGroupNameMessage, "ModifyClusterParameterGroup")
      end

      # Modifies the settings for a snapshot. This exanmple modifies the manual retention period setting for
      # a cluster snapshot.
      def modify_cluster_snapshot(
        snapshot_identifier : String,
        force : Bool? = nil,
        manual_snapshot_retention_period : Int32? = nil
      ) : Types::ModifyClusterSnapshotResult
        input = Types::ModifyClusterSnapshotMessage.new(snapshot_identifier: snapshot_identifier, force: force, manual_snapshot_retention_period: manual_snapshot_retention_period)
        modify_cluster_snapshot(input)
      end
      def modify_cluster_snapshot(input : Types::ModifyClusterSnapshotMessage) : Types::ModifyClusterSnapshotResult
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyClusterSnapshotResult, "ModifyClusterSnapshot")
      end

      # Modifies a snapshot schedule for a cluster.
      def modify_cluster_snapshot_schedule(
        cluster_identifier : String,
        disassociate_schedule : Bool? = nil,
        schedule_identifier : String? = nil
      ) : Nil
        input = Types::ModifyClusterSnapshotScheduleMessage.new(cluster_identifier: cluster_identifier, disassociate_schedule: disassociate_schedule, schedule_identifier: schedule_identifier)
        modify_cluster_snapshot_schedule(input)
      end
      def modify_cluster_snapshot_schedule(input : Types::ModifyClusterSnapshotScheduleMessage) : Nil
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER_SNAPSHOT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Modifies a cluster subnet group to include the specified list of VPC subnets. The operation replaces
      # the existing list of subnets with the new list of subnets. VPC Block Public Access (BPA) enables you
      # to block resources in VPCs and subnets that you own in a Region from reaching or being reached from
      # the internet through internet gateways and egress-only internet gateways. If a subnet group for a
      # provisioned cluster is in an account with VPC BPA turned on, the following capabilities are blocked:
      # Creating a public cluster Restoring a public cluster Modifying a private cluster to be public Adding
      # a subnet with VPC BPA turned on to the subnet group when there's at least one public cluster within
      # the group For more information about VPC BPA, see Block public access to VPCs and subnets in the
      # Amazon VPC User Guide .
      def modify_cluster_subnet_group(
        cluster_subnet_group_name : String,
        subnet_ids : Array(String),
        description : String? = nil
      ) : Types::ModifyClusterSubnetGroupResult
        input = Types::ModifyClusterSubnetGroupMessage.new(cluster_subnet_group_name: cluster_subnet_group_name, subnet_ids: subnet_ids, description: description)
        modify_cluster_subnet_group(input)
      end
      def modify_cluster_subnet_group(input : Types::ModifyClusterSubnetGroupMessage) : Types::ModifyClusterSubnetGroupResult
        request = Protocol::Query.build_request(Model::MODIFY_CLUSTER_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyClusterSubnetGroupResult, "ModifyClusterSubnetGroup")
      end

      # Contains information for changing a custom domain association.
      def modify_custom_domain_association(
        cluster_identifier : String,
        custom_domain_certificate_arn : String,
        custom_domain_name : String
      ) : Types::ModifyCustomDomainAssociationResult
        input = Types::ModifyCustomDomainAssociationMessage.new(cluster_identifier: cluster_identifier, custom_domain_certificate_arn: custom_domain_certificate_arn, custom_domain_name: custom_domain_name)
        modify_custom_domain_association(input)
      end
      def modify_custom_domain_association(input : Types::ModifyCustomDomainAssociationMessage) : Types::ModifyCustomDomainAssociationResult
        request = Protocol::Query.build_request(Model::MODIFY_CUSTOM_DOMAIN_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyCustomDomainAssociationResult, "ModifyCustomDomainAssociation")
      end

      # Modifies a Redshift-managed VPC endpoint.
      def modify_endpoint_access(
        endpoint_name : String,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::EndpointAccess
        input = Types::ModifyEndpointAccessMessage.new(endpoint_name: endpoint_name, vpc_security_group_ids: vpc_security_group_ids)
        modify_endpoint_access(input)
      end
      def modify_endpoint_access(input : Types::ModifyEndpointAccessMessage) : Types::EndpointAccess
        request = Protocol::Query.build_request(Model::MODIFY_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EndpointAccess, "ModifyEndpointAccess")
      end

      # Modifies an existing Amazon Redshift event notification subscription.
      def modify_event_subscription(
        subscription_name : String,
        enabled : Bool? = nil,
        event_categories : Array(String)? = nil,
        severity : String? = nil,
        sns_topic_arn : String? = nil,
        source_ids : Array(String)? = nil,
        source_type : String? = nil
      ) : Types::ModifyEventSubscriptionResult
        input = Types::ModifyEventSubscriptionMessage.new(subscription_name: subscription_name, enabled: enabled, event_categories: event_categories, severity: severity, sns_topic_arn: sns_topic_arn, source_ids: source_ids, source_type: source_type)
        modify_event_subscription(input)
      end
      def modify_event_subscription(input : Types::ModifyEventSubscriptionMessage) : Types::ModifyEventSubscriptionResult
        request = Protocol::Query.build_request(Model::MODIFY_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyEventSubscriptionResult, "ModifyEventSubscription")
      end

      # Modifies a zero-ETL integration or S3 event integration with Amazon Redshift.
      def modify_integration(
        integration_arn : String,
        description : String? = nil,
        integration_name : String? = nil
      ) : Types::Integration
        input = Types::ModifyIntegrationMessage.new(integration_arn: integration_arn, description: description, integration_name: integration_name)
        modify_integration(input)
      end
      def modify_integration(input : Types::ModifyIntegrationMessage) : Types::Integration
        request = Protocol::Query.build_request(Model::MODIFY_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::Integration, "ModifyIntegration")
      end

      # Modifies the lakehouse configuration for a cluster. This operation allows you to manage Amazon
      # Redshift federated permissions and Amazon Web Services IAM Identity Center trusted identity
      # propagation.
      def modify_lakehouse_configuration(
        cluster_identifier : String,
        catalog_name : String? = nil,
        dry_run : Bool? = nil,
        lakehouse_idc_application_arn : String? = nil,
        lakehouse_idc_registration : String? = nil,
        lakehouse_registration : String? = nil
      ) : Types::LakehouseConfiguration
        input = Types::ModifyLakehouseConfigurationMessage.new(cluster_identifier: cluster_identifier, catalog_name: catalog_name, dry_run: dry_run, lakehouse_idc_application_arn: lakehouse_idc_application_arn, lakehouse_idc_registration: lakehouse_idc_registration, lakehouse_registration: lakehouse_registration)
        modify_lakehouse_configuration(input)
      end
      def modify_lakehouse_configuration(input : Types::ModifyLakehouseConfigurationMessage) : Types::LakehouseConfiguration
        request = Protocol::Query.build_request(Model::MODIFY_LAKEHOUSE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::LakehouseConfiguration, "ModifyLakehouseConfiguration")
      end

      # Changes an existing Amazon Redshift IAM Identity Center application.
      def modify_redshift_idc_application(
        redshift_idc_application_arn : String,
        authorized_token_issuer_list : Array(Types::AuthorizedTokenIssuer)? = nil,
        iam_role_arn : String? = nil,
        idc_display_name : String? = nil,
        identity_namespace : String? = nil,
        service_integrations : Array(Types::ServiceIntegrationsUnion)? = nil
      ) : Types::ModifyRedshiftIdcApplicationResult
        input = Types::ModifyRedshiftIdcApplicationMessage.new(redshift_idc_application_arn: redshift_idc_application_arn, authorized_token_issuer_list: authorized_token_issuer_list, iam_role_arn: iam_role_arn, idc_display_name: idc_display_name, identity_namespace: identity_namespace, service_integrations: service_integrations)
        modify_redshift_idc_application(input)
      end
      def modify_redshift_idc_application(input : Types::ModifyRedshiftIdcApplicationMessage) : Types::ModifyRedshiftIdcApplicationResult
        request = Protocol::Query.build_request(Model::MODIFY_REDSHIFT_IDC_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyRedshiftIdcApplicationResult, "ModifyRedshiftIdcApplication")
      end

      # Modifies a scheduled action.
      def modify_scheduled_action(
        scheduled_action_name : String,
        enable : Bool? = nil,
        end_time : Time? = nil,
        iam_role : String? = nil,
        schedule : String? = nil,
        scheduled_action_description : String? = nil,
        start_time : Time? = nil,
        target_action : Types::ScheduledActionType? = nil
      ) : Types::ScheduledAction
        input = Types::ModifyScheduledActionMessage.new(scheduled_action_name: scheduled_action_name, enable: enable, end_time: end_time, iam_role: iam_role, schedule: schedule, scheduled_action_description: scheduled_action_description, start_time: start_time, target_action: target_action)
        modify_scheduled_action(input)
      end
      def modify_scheduled_action(input : Types::ModifyScheduledActionMessage) : Types::ScheduledAction
        request = Protocol::Query.build_request(Model::MODIFY_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ScheduledAction, "ModifyScheduledAction")
      end

      # Modifies the number of days to retain snapshots in the destination Amazon Web Services Region after
      # they are copied from the source Amazon Web Services Region. By default, this operation only changes
      # the retention period of copied automated snapshots. The retention periods for both new and existing
      # copied automated snapshots are updated with the new retention period. You can set the manual option
      # to change only the retention periods of copied manual snapshots. If you set this option, only newly
      # copied manual snapshots have the new retention period.
      def modify_snapshot_copy_retention_period(
        cluster_identifier : String,
        retention_period : Int32,
        manual : Bool? = nil
      ) : Types::ModifySnapshotCopyRetentionPeriodResult
        input = Types::ModifySnapshotCopyRetentionPeriodMessage.new(cluster_identifier: cluster_identifier, retention_period: retention_period, manual: manual)
        modify_snapshot_copy_retention_period(input)
      end
      def modify_snapshot_copy_retention_period(input : Types::ModifySnapshotCopyRetentionPeriodMessage) : Types::ModifySnapshotCopyRetentionPeriodResult
        request = Protocol::Query.build_request(Model::MODIFY_SNAPSHOT_COPY_RETENTION_PERIOD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifySnapshotCopyRetentionPeriodResult, "ModifySnapshotCopyRetentionPeriod")
      end

      # Modifies a snapshot schedule. Any schedule associated with a cluster is modified asynchronously.
      def modify_snapshot_schedule(
        schedule_definitions : Array(String),
        schedule_identifier : String
      ) : Types::SnapshotSchedule
        input = Types::ModifySnapshotScheduleMessage.new(schedule_definitions: schedule_definitions, schedule_identifier: schedule_identifier)
        modify_snapshot_schedule(input)
      end
      def modify_snapshot_schedule(input : Types::ModifySnapshotScheduleMessage) : Types::SnapshotSchedule
        request = Protocol::Query.build_request(Model::MODIFY_SNAPSHOT_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SnapshotSchedule, "ModifySnapshotSchedule")
      end

      # Modifies a usage limit in a cluster. You can't modify the feature type or period of a usage limit.
      def modify_usage_limit(
        usage_limit_id : String,
        amount : Int64? = nil,
        breach_action : String? = nil
      ) : Types::UsageLimit
        input = Types::ModifyUsageLimitMessage.new(usage_limit_id: usage_limit_id, amount: amount, breach_action: breach_action)
        modify_usage_limit(input)
      end
      def modify_usage_limit(input : Types::ModifyUsageLimitMessage) : Types::UsageLimit
        request = Protocol::Query.build_request(Model::MODIFY_USAGE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UsageLimit, "ModifyUsageLimit")
      end

      # Pauses a cluster.
      def pause_cluster(
        cluster_identifier : String
      ) : Types::PauseClusterResult
        input = Types::PauseClusterMessage.new(cluster_identifier: cluster_identifier)
        pause_cluster(input)
      end
      def pause_cluster(input : Types::PauseClusterMessage) : Types::PauseClusterResult
        request = Protocol::Query.build_request(Model::PAUSE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PauseClusterResult, "PauseCluster")
      end

      # Allows you to purchase reserved nodes. Amazon Redshift offers a predefined set of reserved node
      # offerings. You can purchase one or more of the offerings. You can call the
      # DescribeReservedNodeOfferings API to obtain the available reserved node offerings. You can call this
      # API by providing a specific reserved node offering and the number of nodes you want to reserve. For
      # more information about reserved node offerings, go to Purchasing Reserved Nodes in the Amazon
      # Redshift Cluster Management Guide .
      def purchase_reserved_node_offering(
        reserved_node_offering_id : String,
        node_count : Int32? = nil
      ) : Types::PurchaseReservedNodeOfferingResult
        input = Types::PurchaseReservedNodeOfferingMessage.new(reserved_node_offering_id: reserved_node_offering_id, node_count: node_count)
        purchase_reserved_node_offering(input)
      end
      def purchase_reserved_node_offering(input : Types::PurchaseReservedNodeOfferingMessage) : Types::PurchaseReservedNodeOfferingResult
        request = Protocol::Query.build_request(Model::PURCHASE_RESERVED_NODE_OFFERING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PurchaseReservedNodeOfferingResult, "PurchaseReservedNodeOffering")
      end

      # Updates the resource policy for a specified resource.
      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Types::PutResourcePolicyResult
        input = Types::PutResourcePolicyMessage.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyMessage) : Types::PutResourcePolicyResult
        request = Protocol::Query.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PutResourcePolicyResult, "PutResourcePolicy")
      end

      # Reboots a cluster. This action is taken as soon as possible. It results in a momentary outage to the
      # cluster, during which the cluster status is set to rebooting . A cluster event is created when the
      # reboot is completed. Any pending cluster modifications (see ModifyCluster ) are applied at this
      # reboot. For more information about managing clusters, go to Amazon Redshift Clusters in the Amazon
      # Redshift Cluster Management Guide .
      def reboot_cluster(
        cluster_identifier : String
      ) : Types::RebootClusterResult
        input = Types::RebootClusterMessage.new(cluster_identifier: cluster_identifier)
        reboot_cluster(input)
      end
      def reboot_cluster(input : Types::RebootClusterMessage) : Types::RebootClusterResult
        request = Protocol::Query.build_request(Model::REBOOT_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RebootClusterResult, "RebootCluster")
      end

      # Registers a cluster or serverless namespace to the Amazon Web Services Glue Data Catalog.
      def register_namespace(
        consumer_identifiers : Array(String),
        namespace_identifier : Types::NamespaceIdentifierUnion
      ) : Types::RegisterNamespaceOutputMessage
        input = Types::RegisterNamespaceInputMessage.new(consumer_identifiers: consumer_identifiers, namespace_identifier: namespace_identifier)
        register_namespace(input)
      end
      def register_namespace(input : Types::RegisterNamespaceInputMessage) : Types::RegisterNamespaceOutputMessage
        request = Protocol::Query.build_request(Model::REGISTER_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RegisterNamespaceOutputMessage, "RegisterNamespace")
      end

      # From a datashare consumer account, rejects the specified datashare.
      def reject_data_share(
        data_share_arn : String
      ) : Types::DataShare
        input = Types::RejectDataShareMessage.new(data_share_arn: data_share_arn)
        reject_data_share(input)
      end
      def reject_data_share(input : Types::RejectDataShareMessage) : Types::DataShare
        request = Protocol::Query.build_request(Model::REJECT_DATA_SHARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DataShare, "RejectDataShare")
      end

      # Sets one or more parameters of the specified parameter group to their default values and sets the
      # source values of the parameters to "engine-default". To reset the entire parameter group specify the
      # ResetAllParameters parameter. For parameter changes to take effect you must reboot any associated
      # clusters.
      def reset_cluster_parameter_group(
        parameter_group_name : String,
        parameters : Array(Types::Parameter)? = nil,
        reset_all_parameters : Bool? = nil
      ) : Types::ClusterParameterGroupNameMessage
        input = Types::ResetClusterParameterGroupMessage.new(parameter_group_name: parameter_group_name, parameters: parameters, reset_all_parameters: reset_all_parameters)
        reset_cluster_parameter_group(input)
      end
      def reset_cluster_parameter_group(input : Types::ResetClusterParameterGroupMessage) : Types::ClusterParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::RESET_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ClusterParameterGroupNameMessage, "ResetClusterParameterGroup")
      end

      # Changes the size of the cluster. You can change the cluster's type, or change the number or type of
      # nodes. The default behavior is to use the elastic resize method. With an elastic resize, your
      # cluster is available for read and write operations more quickly than with the classic resize method.
      # Elastic resize operations have the following restrictions: You can only resize clusters of the
      # following types: dc2.large dc2.8xlarge ra3.large ra3.xlplus ra3.4xlarge ra3.16xlarge The type of
      # nodes that you add must match the node type for the cluster.
      def resize_cluster(
        cluster_identifier : String,
        classic : Bool? = nil,
        cluster_type : String? = nil,
        node_type : String? = nil,
        number_of_nodes : Int32? = nil,
        reserved_node_id : String? = nil,
        target_reserved_node_offering_id : String? = nil
      ) : Types::ResizeClusterResult
        input = Types::ResizeClusterMessage.new(cluster_identifier: cluster_identifier, classic: classic, cluster_type: cluster_type, node_type: node_type, number_of_nodes: number_of_nodes, reserved_node_id: reserved_node_id, target_reserved_node_offering_id: target_reserved_node_offering_id)
        resize_cluster(input)
      end
      def resize_cluster(input : Types::ResizeClusterMessage) : Types::ResizeClusterResult
        request = Protocol::Query.build_request(Model::RESIZE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ResizeClusterResult, "ResizeCluster")
      end

      # Creates a new cluster from a snapshot. By default, Amazon Redshift creates the resulting cluster
      # with the same configuration as the original cluster from which the snapshot was created, except that
      # the new cluster is created with the default cluster security and parameter groups. After Amazon
      # Redshift creates the cluster, you can use the ModifyCluster API to associate a different security
      # group and different parameter group with the restored cluster. If you are using a DS node type, you
      # can also choose to change to another DS node type of the same size during restore. If you restore a
      # cluster into a VPC, you must provide a cluster subnet group where you want the cluster restored. VPC
      # Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own in a
      # Region from reaching or being reached from the internet through internet gateways and egress-only
      # internet gateways. If a subnet group for a provisioned cluster is in an account with VPC BPA turned
      # on, the following capabilities are blocked: Creating a public cluster Restoring a public cluster
      # Modifying a private cluster to be public Adding a subnet with VPC BPA turned on to the subnet group
      # when there's at least one public cluster within the group For more information about VPC BPA, see
      # Block public access to VPCs and subnets in the Amazon VPC User Guide . For more information about
      # working with snapshots, go to Amazon Redshift Snapshots in the Amazon Redshift Cluster Management
      # Guide .
      def restore_from_cluster_snapshot(
        cluster_identifier : String,
        additional_info : String? = nil,
        allow_version_upgrade : Bool? = nil,
        aqua_configuration_status : String? = nil,
        automated_snapshot_retention_period : Int32? = nil,
        availability_zone : String? = nil,
        availability_zone_relocation : Bool? = nil,
        catalog_name : String? = nil,
        cluster_parameter_group_name : String? = nil,
        cluster_security_groups : Array(String)? = nil,
        cluster_subnet_group_name : String? = nil,
        default_iam_role_arn : String? = nil,
        elastic_ip : String? = nil,
        encrypted : Bool? = nil,
        enhanced_vpc_routing : Bool? = nil,
        hsm_client_certificate_identifier : String? = nil,
        hsm_configuration_identifier : String? = nil,
        iam_roles : Array(String)? = nil,
        ip_address_type : String? = nil,
        kms_key_id : String? = nil,
        maintenance_track_name : String? = nil,
        manage_master_password : Bool? = nil,
        manual_snapshot_retention_period : Int32? = nil,
        master_password_secret_kms_key_id : String? = nil,
        multi_az : Bool? = nil,
        node_type : String? = nil,
        number_of_nodes : Int32? = nil,
        owner_account : String? = nil,
        port : Int32? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        redshift_idc_application_arn : String? = nil,
        reserved_node_id : String? = nil,
        snapshot_arn : String? = nil,
        snapshot_cluster_identifier : String? = nil,
        snapshot_identifier : String? = nil,
        snapshot_schedule_identifier : String? = nil,
        target_reserved_node_offering_id : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreFromClusterSnapshotResult
        input = Types::RestoreFromClusterSnapshotMessage.new(cluster_identifier: cluster_identifier, additional_info: additional_info, allow_version_upgrade: allow_version_upgrade, aqua_configuration_status: aqua_configuration_status, automated_snapshot_retention_period: automated_snapshot_retention_period, availability_zone: availability_zone, availability_zone_relocation: availability_zone_relocation, catalog_name: catalog_name, cluster_parameter_group_name: cluster_parameter_group_name, cluster_security_groups: cluster_security_groups, cluster_subnet_group_name: cluster_subnet_group_name, default_iam_role_arn: default_iam_role_arn, elastic_ip: elastic_ip, encrypted: encrypted, enhanced_vpc_routing: enhanced_vpc_routing, hsm_client_certificate_identifier: hsm_client_certificate_identifier, hsm_configuration_identifier: hsm_configuration_identifier, iam_roles: iam_roles, ip_address_type: ip_address_type, kms_key_id: kms_key_id, maintenance_track_name: maintenance_track_name, manage_master_password: manage_master_password, manual_snapshot_retention_period: manual_snapshot_retention_period, master_password_secret_kms_key_id: master_password_secret_kms_key_id, multi_az: multi_az, node_type: node_type, number_of_nodes: number_of_nodes, owner_account: owner_account, port: port, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, redshift_idc_application_arn: redshift_idc_application_arn, reserved_node_id: reserved_node_id, snapshot_arn: snapshot_arn, snapshot_cluster_identifier: snapshot_cluster_identifier, snapshot_identifier: snapshot_identifier, snapshot_schedule_identifier: snapshot_schedule_identifier, target_reserved_node_offering_id: target_reserved_node_offering_id, vpc_security_group_ids: vpc_security_group_ids)
        restore_from_cluster_snapshot(input)
      end
      def restore_from_cluster_snapshot(input : Types::RestoreFromClusterSnapshotMessage) : Types::RestoreFromClusterSnapshotResult
        request = Protocol::Query.build_request(Model::RESTORE_FROM_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreFromClusterSnapshotResult, "RestoreFromClusterSnapshot")
      end

      # Creates a new table from a table in an Amazon Redshift cluster snapshot. You must create the new
      # table within the Amazon Redshift cluster that the snapshot was taken from. You cannot use
      # RestoreTableFromClusterSnapshot to restore a table with the same name as an existing table in an
      # Amazon Redshift cluster. That is, you cannot overwrite an existing table in a cluster with a
      # restored table. If you want to replace your original table with a new, restored table, then rename
      # or drop your original table before you call RestoreTableFromClusterSnapshot . When you have renamed
      # your original table, then you can pass the original name of the table as the NewTableName parameter
      # value in the call to RestoreTableFromClusterSnapshot . This way, you can replace the original table
      # with the table created from the snapshot. You can't use this operation to restore tables with
      # interleaved sort keys .
      def restore_table_from_cluster_snapshot(
        cluster_identifier : String,
        new_table_name : String,
        snapshot_identifier : String,
        source_database_name : String,
        source_table_name : String,
        enable_case_sensitive_identifier : Bool? = nil,
        source_schema_name : String? = nil,
        target_database_name : String? = nil,
        target_schema_name : String? = nil
      ) : Types::RestoreTableFromClusterSnapshotResult
        input = Types::RestoreTableFromClusterSnapshotMessage.new(cluster_identifier: cluster_identifier, new_table_name: new_table_name, snapshot_identifier: snapshot_identifier, source_database_name: source_database_name, source_table_name: source_table_name, enable_case_sensitive_identifier: enable_case_sensitive_identifier, source_schema_name: source_schema_name, target_database_name: target_database_name, target_schema_name: target_schema_name)
        restore_table_from_cluster_snapshot(input)
      end
      def restore_table_from_cluster_snapshot(input : Types::RestoreTableFromClusterSnapshotMessage) : Types::RestoreTableFromClusterSnapshotResult
        request = Protocol::Query.build_request(Model::RESTORE_TABLE_FROM_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreTableFromClusterSnapshotResult, "RestoreTableFromClusterSnapshot")
      end

      # Resumes a paused cluster.
      def resume_cluster(
        cluster_identifier : String
      ) : Types::ResumeClusterResult
        input = Types::ResumeClusterMessage.new(cluster_identifier: cluster_identifier)
        resume_cluster(input)
      end
      def resume_cluster(input : Types::ResumeClusterMessage) : Types::ResumeClusterResult
        request = Protocol::Query.build_request(Model::RESUME_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ResumeClusterResult, "ResumeCluster")
      end

      # Revokes an ingress rule in an Amazon Redshift security group for a previously authorized IP range or
      # Amazon EC2 security group. To add an ingress rule, see AuthorizeClusterSecurityGroupIngress . For
      # information about managing security groups, go to Amazon Redshift Cluster Security Groups in the
      # Amazon Redshift Cluster Management Guide .
      def revoke_cluster_security_group_ingress(
        cluster_security_group_name : String,
        cidrip : String? = nil,
        ec2_security_group_name : String? = nil,
        ec2_security_group_owner_id : String? = nil
      ) : Types::RevokeClusterSecurityGroupIngressResult
        input = Types::RevokeClusterSecurityGroupIngressMessage.new(cluster_security_group_name: cluster_security_group_name, cidrip: cidrip, ec2_security_group_name: ec2_security_group_name, ec2_security_group_owner_id: ec2_security_group_owner_id)
        revoke_cluster_security_group_ingress(input)
      end
      def revoke_cluster_security_group_ingress(input : Types::RevokeClusterSecurityGroupIngressMessage) : Types::RevokeClusterSecurityGroupIngressResult
        request = Protocol::Query.build_request(Model::REVOKE_CLUSTER_SECURITY_GROUP_INGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RevokeClusterSecurityGroupIngressResult, "RevokeClusterSecurityGroupIngress")
      end

      # Revokes access to a cluster.
      def revoke_endpoint_access(
        account : String? = nil,
        cluster_identifier : String? = nil,
        force : Bool? = nil,
        vpc_ids : Array(String)? = nil
      ) : Types::EndpointAuthorization
        input = Types::RevokeEndpointAccessMessage.new(account: account, cluster_identifier: cluster_identifier, force: force, vpc_ids: vpc_ids)
        revoke_endpoint_access(input)
      end
      def revoke_endpoint_access(input : Types::RevokeEndpointAccessMessage) : Types::EndpointAuthorization
        request = Protocol::Query.build_request(Model::REVOKE_ENDPOINT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EndpointAuthorization, "RevokeEndpointAccess")
      end

      # Removes the ability of the specified Amazon Web Services account to restore the specified snapshot.
      # If the account is currently restoring the snapshot, the restore will run to completion. For more
      # information about working with snapshots, go to Amazon Redshift Snapshots in the Amazon Redshift
      # Cluster Management Guide .
      def revoke_snapshot_access(
        account_with_restore_access : String,
        snapshot_arn : String? = nil,
        snapshot_cluster_identifier : String? = nil,
        snapshot_identifier : String? = nil
      ) : Types::RevokeSnapshotAccessResult
        input = Types::RevokeSnapshotAccessMessage.new(account_with_restore_access: account_with_restore_access, snapshot_arn: snapshot_arn, snapshot_cluster_identifier: snapshot_cluster_identifier, snapshot_identifier: snapshot_identifier)
        revoke_snapshot_access(input)
      end
      def revoke_snapshot_access(input : Types::RevokeSnapshotAccessMessage) : Types::RevokeSnapshotAccessResult
        request = Protocol::Query.build_request(Model::REVOKE_SNAPSHOT_ACCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RevokeSnapshotAccessResult, "RevokeSnapshotAccess")
      end

      # Rotates the encryption keys for a cluster.
      def rotate_encryption_key(
        cluster_identifier : String
      ) : Types::RotateEncryptionKeyResult
        input = Types::RotateEncryptionKeyMessage.new(cluster_identifier: cluster_identifier)
        rotate_encryption_key(input)
      end
      def rotate_encryption_key(input : Types::RotateEncryptionKeyMessage) : Types::RotateEncryptionKeyResult
        request = Protocol::Query.build_request(Model::ROTATE_ENCRYPTION_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RotateEncryptionKeyResult, "RotateEncryptionKey")
      end

      # Updates the status of a partner integration.
      def update_partner_status(
        account_id : String,
        cluster_identifier : String,
        database_name : String,
        partner_name : String,
        status : String,
        status_message : String? = nil
      ) : Types::PartnerIntegrationOutputMessage
        input = Types::UpdatePartnerStatusInputMessage.new(account_id: account_id, cluster_identifier: cluster_identifier, database_name: database_name, partner_name: partner_name, status: status, status_message: status_message)
        update_partner_status(input)
      end
      def update_partner_status(input : Types::UpdatePartnerStatusInputMessage) : Types::PartnerIntegrationOutputMessage
        request = Protocol::Query.build_request(Model::UPDATE_PARTNER_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PartnerIntegrationOutputMessage, "UpdatePartnerStatus")
      end
    end
  end
end
