require "json"
require "time"

module Aws
  module DAX
    module Types

      # Contains all of the attributes of a specific DAX cluster.

      struct Cluster
        include JSON::Serializable

        # The number of nodes in the cluster that are active (i.e., capable of serving requests).

        @[JSON::Field(key: "ActiveNodes")]
        getter active_nodes : Int32?

        # The Amazon Resource Name (ARN) that uniquely identifies the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # The endpoint for this DAX cluster, consisting of a DNS name, a port number, and a URL. Applications
        # should use the URL to configure the DAX client to find their cluster.

        @[JSON::Field(key: "ClusterDiscoveryEndpoint")]
        getter cluster_discovery_endpoint : Types::Endpoint?

        # The type of encryption supported by the cluster's endpoint. Values are: NONE for no encryption TLS
        # for Transport Layer Security

        @[JSON::Field(key: "ClusterEndpointEncryptionType")]
        getter cluster_endpoint_encryption_type : String?

        # The name of the DAX cluster.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String?

        # The description of the cluster.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime, DAX will assume this
        # role and use the role's permissions to access DynamoDB on your behalf.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The IP address type of the cluster. Values are: ipv4 - IPv4 addresses only ipv6 - IPv6 addresses
        # only dual_stack - Both IPv4 and IPv6 addresses

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # A list of nodes to be removed from the cluster.

        @[JSON::Field(key: "NodeIdsToRemove")]
        getter node_ids_to_remove : Array(String)?

        # The node type for the nodes in the cluster. (All nodes in a DAX cluster are of the same type.)

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # A list of nodes that are currently in the cluster.

        @[JSON::Field(key: "Nodes")]
        getter nodes : Array(Types::Node)?

        # Describes a notification topic and its status. Notification topics are used for publishing DAX
        # events to subscribers using Amazon Simple Notification Service (SNS).

        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration?

        # The parameter group being used by nodes in the cluster.

        @[JSON::Field(key: "ParameterGroup")]
        getter parameter_group : Types::ParameterGroupStatus?

        # A range of time when maintenance of DAX cluster software will be performed. For example:
        # sun:01:00-sun:09:00 . Cluster maintenance normally takes less than 30 minutes, and is performed
        # automatically within the maintenance window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The description of the server-side encryption status on the specified DAX cluster.

        @[JSON::Field(key: "SSEDescription")]
        getter sse_description : Types::SSEDescription?

        # A list of security groups, and the status of each, for the nodes in the cluster.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(Types::SecurityGroupMembership)?

        # The current status of the cluster.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The subnet group where the DAX cluster is running.

        @[JSON::Field(key: "SubnetGroup")]
        getter subnet_group : String?

        # The total number of nodes in the cluster.

        @[JSON::Field(key: "TotalNodes")]
        getter total_nodes : Int32?

        def initialize(
          @active_nodes : Int32? = nil,
          @cluster_arn : String? = nil,
          @cluster_discovery_endpoint : Types::Endpoint? = nil,
          @cluster_endpoint_encryption_type : String? = nil,
          @cluster_name : String? = nil,
          @description : String? = nil,
          @iam_role_arn : String? = nil,
          @network_type : String? = nil,
          @node_ids_to_remove : Array(String)? = nil,
          @node_type : String? = nil,
          @nodes : Array(Types::Node)? = nil,
          @notification_configuration : Types::NotificationConfiguration? = nil,
          @parameter_group : Types::ParameterGroupStatus? = nil,
          @preferred_maintenance_window : String? = nil,
          @sse_description : Types::SSEDescription? = nil,
          @security_groups : Array(Types::SecurityGroupMembership)? = nil,
          @status : String? = nil,
          @subnet_group : String? = nil,
          @total_nodes : Int32? = nil
        )
        end
      end

      # You already have a DAX cluster with the given identifier.

      struct ClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested cluster ID does not refer to an existing DAX cluster.

      struct ClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have attempted to exceed the maximum number of DAX clusters for your Amazon Web Services
      # account.

      struct ClusterQuotaForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateClusterRequest
        include JSON::Serializable

        # The cluster identifier. This parameter is stored as a lowercase string. Constraints: A name must
        # contain from 1 to 20 alphanumeric characters or hyphens. The first character must be a letter. A
        # name cannot end with a hyphen or contain two consecutive hyphens.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime, DAX will assume this
        # role and use the role's permissions to access DynamoDB on your behalf.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The compute and memory capacity of the nodes in the cluster.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String

        # The number of nodes in the DAX cluster. A replication factor of 1 will create a single-node cluster,
        # without any read replicas. For additional fault tolerance, you can create a multiple node cluster
        # with one or more read replicas. To do this, set ReplicationFactor to a number between 3 (one primary
        # and two read replicas) and 10 (one primary and nine read replicas). If the AvailabilityZones
        # parameter is provided, its length must equal the ReplicationFactor . Amazon Web Services recommends
        # that you have at least two read replicas per cluster.

        @[JSON::Field(key: "ReplicationFactor")]
        getter replication_factor : Int32

        # The Availability Zones (AZs) in which the cluster nodes will reside after the cluster has been
        # created or updated. If provided, the length of this list must equal the ReplicationFactor parameter.
        # If you omit this parameter, DAX will spread the nodes across Availability Zones for the highest
        # availability.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The type of encryption the cluster's endpoint should support. Values are: NONE for no encryption TLS
        # for Transport Layer Security

        @[JSON::Field(key: "ClusterEndpointEncryptionType")]
        getter cluster_endpoint_encryption_type : String?

        # A description of the cluster.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the IP protocol(s) the cluster uses for network communications. Values are: ipv4 - The
        # cluster is accessible only through IPv4 addresses ipv6 - The cluster is accessible only through IPv6
        # addresses dual_stack - The cluster is accessible through both IPv4 and IPv6 addresses. If no
        # explicit NetworkType is provided, the network type is derived based on the subnet group's
        # configuration.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications will be sent. The
        # Amazon SNS topic owner must be same as the DAX cluster owner.

        @[JSON::Field(key: "NotificationTopicArn")]
        getter notification_topic_arn : String?

        # The parameter group to be associated with the DAX cluster.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # Specifies the weekly time range during which maintenance on the DAX cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:05:00-sun:09:00 If you don't specify a preferred maintenance window when you create or modify a
        # cache cluster, DAX assigns a 60-minute maintenance window on a randomly selected day of the week.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Represents the settings used to enable server-side encryption on the cluster.

        @[JSON::Field(key: "SSESpecification")]
        getter sse_specification : Types::SSESpecification?

        # A list of security group IDs to be assigned to each node in the DAX cluster. (Each of the security
        # group ID is system-generated.) If this parameter is not specified, DAX assigns the default VPC
        # security group to each node.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The name of the subnet group to be used for the replication group. DAX clusters can only run in an
        # Amazon VPC environment. All of the subnets that you specify in a subnet group must exist in the same
        # VPC.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String?

        # A set of tags to associate with the DAX cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cluster_name : String,
          @iam_role_arn : String,
          @node_type : String,
          @replication_factor : Int32,
          @availability_zones : Array(String)? = nil,
          @cluster_endpoint_encryption_type : String? = nil,
          @description : String? = nil,
          @network_type : String? = nil,
          @notification_topic_arn : String? = nil,
          @parameter_group_name : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @sse_specification : Types::SSESpecification? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_group_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateClusterResponse
        include JSON::Serializable

        # A description of the DAX cluster that you have created.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct CreateParameterGroupRequest
        include JSON::Serializable

        # The name of the parameter group to apply to all of the clusters in this replication group.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # A description of the parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @parameter_group_name : String,
          @description : String? = nil
        )
        end
      end


      struct CreateParameterGroupResponse
        include JSON::Serializable

        # Represents the output of a CreateParameterGroup action.

        @[JSON::Field(key: "ParameterGroup")]
        getter parameter_group : Types::ParameterGroup?

        def initialize(
          @parameter_group : Types::ParameterGroup? = nil
        )
        end
      end


      struct CreateSubnetGroupRequest
        include JSON::Serializable

        # A name for the subnet group. This value is stored as a lowercase string.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String

        # A list of VPC subnet IDs for the subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A description for the subnet group

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @subnet_group_name : String,
          @subnet_ids : Array(String),
          @description : String? = nil
        )
        end
      end


      struct CreateSubnetGroupResponse
        include JSON::Serializable

        # Represents the output of a CreateSubnetGroup operation.

        @[JSON::Field(key: "SubnetGroup")]
        getter subnet_group : Types::SubnetGroup?

        def initialize(
          @subnet_group : Types::SubnetGroup? = nil
        )
        end
      end


      struct DecreaseReplicationFactorRequest
        include JSON::Serializable

        # The name of the DAX cluster from which you want to remove nodes.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # The new number of nodes for the DAX cluster.

        @[JSON::Field(key: "NewReplicationFactor")]
        getter new_replication_factor : Int32

        # The Availability Zone(s) from which to remove nodes.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The unique identifiers of the nodes to be removed from the cluster.

        @[JSON::Field(key: "NodeIdsToRemove")]
        getter node_ids_to_remove : Array(String)?

        def initialize(
          @cluster_name : String,
          @new_replication_factor : Int32,
          @availability_zones : Array(String)? = nil,
          @node_ids_to_remove : Array(String)? = nil
        )
        end
      end


      struct DecreaseReplicationFactorResponse
        include JSON::Serializable

        # A description of the DAX cluster, after you have decreased its replication factor.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable

        # The name of the cluster to be deleted.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        def initialize(
          @cluster_name : String
        )
        end
      end


      struct DeleteClusterResponse
        include JSON::Serializable

        # A description of the DAX cluster that is being deleted.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DeleteParameterGroupRequest
        include JSON::Serializable

        # The name of the parameter group to delete.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        def initialize(
          @parameter_group_name : String
        )
        end
      end


      struct DeleteParameterGroupResponse
        include JSON::Serializable

        # A user-specified message for this action (i.e., a reason for deleting the parameter group).

        @[JSON::Field(key: "DeletionMessage")]
        getter deletion_message : String?

        def initialize(
          @deletion_message : String? = nil
        )
        end
      end


      struct DeleteSubnetGroupRequest
        include JSON::Serializable

        # The name of the subnet group to delete.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String

        def initialize(
          @subnet_group_name : String
        )
        end
      end


      struct DeleteSubnetGroupResponse
        include JSON::Serializable

        # A user-specified message for this action (i.e., a reason for deleting the subnet group).

        @[JSON::Field(key: "DeletionMessage")]
        getter deletion_message : String?

        def initialize(
          @deletion_message : String? = nil
        )
        end
      end


      struct DescribeClustersRequest
        include JSON::Serializable

        # The names of the DAX clusters being described.

        @[JSON::Field(key: "ClusterNames")]
        getter cluster_names : Array(String)?

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved. The value for MaxResults must be between 20 and 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cluster_names : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeClustersResponse
        include JSON::Serializable

        # The descriptions of your DAX clusters, in response to a DescribeClusters request.

        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(Types::Cluster)?

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::Cluster)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDefaultParametersRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved. The value for MaxResults must be between 20 and 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDefaultParametersResponse
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of parameters. Each element in the list represents one parameter.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @next_token : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct DescribeEventsRequest
        include JSON::Serializable

        # The number of minutes' worth of events to retrieve.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The end of the time interval for which to retrieve events, specified in ISO 8601 format.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved. The value for MaxResults must be between 20 and 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the event source for which events will be returned. If not specified, then all
        # sources are included in the response.

        @[JSON::Field(key: "SourceName")]
        getter source_name : String?

        # The event source to retrieve events for. If no value is specified, all events are returned.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The beginning of the time interval to retrieve events for, specified in ISO 8601 format.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @duration : Int32? = nil,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @source_name : String? = nil,
          @source_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct DescribeEventsResponse
        include JSON::Serializable

        # An array of events. Each element in the array represents one event.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeParameterGroupsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved. The value for MaxResults must be between 20 and 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of the parameter groups.

        @[JSON::Field(key: "ParameterGroupNames")]
        getter parameter_group_names : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @parameter_group_names : Array(String)? = nil
        )
        end
      end


      struct DescribeParameterGroupsResponse
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of parameter groups. Each element in the array represents one parameter group.

        @[JSON::Field(key: "ParameterGroups")]
        getter parameter_groups : Array(Types::ParameterGroup)?

        def initialize(
          @next_token : String? = nil,
          @parameter_groups : Array(Types::ParameterGroup)? = nil
        )
        end
      end


      struct DescribeParametersRequest
        include JSON::Serializable

        # The name of the parameter group.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved. The value for MaxResults must be between 20 and 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # How the parameter is defined. For example, system denotes a system-defined parameter.

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @parameter_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @source : String? = nil
        )
        end
      end


      struct DescribeParametersResponse
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of parameters within a parameter group. Each element in the list represents one parameter.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @next_token : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct DescribeSubnetGroupsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved. The value for MaxResults must be between 20 and 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the subnet group.

        @[JSON::Field(key: "SubnetGroupNames")]
        getter subnet_group_names : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @subnet_group_names : Array(String)? = nil
        )
        end
      end


      struct DescribeSubnetGroupsResponse
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of subnet groups. Each element in the array represents a single subnet group.

        @[JSON::Field(key: "SubnetGroups")]
        getter subnet_groups : Array(Types::SubnetGroup)?

        def initialize(
          @next_token : String? = nil,
          @subnet_groups : Array(Types::SubnetGroup)? = nil
        )
        end
      end

      # Represents the information required for client programs to connect to the endpoint for a DAX
      # cluster.

      struct Endpoint
        include JSON::Serializable

        # The DNS hostname of the endpoint.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # The port number that applications should use to connect to the endpoint.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The URL that applications should use to connect to the endpoint. The default ports are 8111 for the
        # "dax" protocol and 9111 for the "daxs" protocol.

        @[JSON::Field(key: "URL")]
        getter url : String?

        def initialize(
          @address : String? = nil,
          @port : Int32? = nil,
          @url : String? = nil
        )
        end
      end

      # Represents a single occurrence of something interesting within the system. Some examples of events
      # are creating a DAX cluster, adding or removing a node, or rebooting a node.

      struct Event
        include JSON::Serializable

        # The date and time when the event occurred.

        @[JSON::Field(key: "Date", converter: Aws::Runtime::UnixTimestampConverter)]
        getter date : Time?

        # A user-defined message associated with the event.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The source of the event. For example, if the event occurred at the node level, the source would be
        # the node ID.

        @[JSON::Field(key: "SourceName")]
        getter source_name : String?

        # Specifies the origin of this event - a cluster, a parameter group, a node ID, etc.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @date : Time? = nil,
          @message : String? = nil,
          @source_name : String? = nil,
          @source_type : String? = nil
        )
        end
      end


      struct IncreaseReplicationFactorRequest
        include JSON::Serializable

        # The name of the DAX cluster that will receive additional nodes.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # The new number of nodes for the DAX cluster.

        @[JSON::Field(key: "NewReplicationFactor")]
        getter new_replication_factor : Int32

        # The Availability Zones (AZs) in which the cluster nodes will be created. All nodes belonging to the
        # cluster are placed in these Availability Zones. Use this parameter if you want to distribute the
        # nodes across multiple AZs.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        def initialize(
          @cluster_name : String,
          @new_replication_factor : Int32,
          @availability_zones : Array(String)? = nil
        )
        end
      end


      struct IncreaseReplicationFactorResponse
        include JSON::Serializable

        # A description of the DAX cluster, with its new replication factor.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # There are not enough system resources to create the cluster you requested (or to resize an
      # already-existing cluster).

      struct InsufficientClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Resource Name (ARN) supplied in the request is not valid.

      struct InvalidARNFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested DAX cluster is not in the available state.

      struct InvalidClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # Two or more incompatible parameters were specified.

      struct InvalidParameterCombinationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters in a parameter group are in an invalid state.

      struct InvalidParameterGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The value for a parameter is invalid.

      struct InvalidParameterValueException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An invalid subnet identifier was specified.

      struct InvalidSubnet
        include JSON::Serializable

        def initialize
        end
      end

      # The VPC network is in an invalid state.

      struct InvalidVPCNetworkStateFault
        include JSON::Serializable

        def initialize
        end
      end


      struct ListTagsRequest
        include JSON::Serializable

        # The name of the DAX resource to which the tags belong.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsResponse
        include JSON::Serializable

        # If this value is present, there are additional results to be displayed. To retrieve them, call
        # ListTags again, with NextToken set to this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tags currently associated with the DAX cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents an individual node within a DAX cluster.

      struct Node
        include JSON::Serializable

        # The Availability Zone (AZ) in which the node has been deployed.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The endpoint for the node, consisting of a DNS name and a port number. Client applications can
        # connect directly to a node endpoint, if desired (as an alternative to allowing DAX client software
        # to intelligently route requests and responses to nodes in the DAX cluster.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        # The date and time (in UNIX epoch format) when the node was launched.

        @[JSON::Field(key: "NodeCreateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter node_create_time : Time?

        # A system-generated identifier for the node.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        # The current status of the node. For example: available .

        @[JSON::Field(key: "NodeStatus")]
        getter node_status : String?

        # The status of the parameter group associated with this node. For example, in-sync .

        @[JSON::Field(key: "ParameterGroupStatus")]
        getter parameter_group_status : String?

        def initialize(
          @availability_zone : String? = nil,
          @endpoint : Types::Endpoint? = nil,
          @node_create_time : Time? = nil,
          @node_id : String? = nil,
          @node_status : String? = nil,
          @parameter_group_status : String? = nil
        )
        end
      end

      # None of the nodes in the cluster have the given node ID.

      struct NodeNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have attempted to exceed the maximum number of nodes for a DAX cluster.

      struct NodeQuotaForClusterExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have attempted to exceed the maximum number of nodes for your Amazon Web Services account.

      struct NodeQuotaForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a parameter value that is applicable to a particular node type.

      struct NodeTypeSpecificValue
        include JSON::Serializable

        # A node type to which the parameter value applies.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The parameter value for this node type.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @node_type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Describes a notification topic and its status. Notification topics are used for publishing DAX
      # events to subscribers using Amazon Simple Notification Service (SNS).

      struct NotificationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the topic.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        # The current state of the topic. A value of “active” means that notifications will be sent to the
        # topic. A value of “inactive” means that notifications will not be sent to the topic.

        @[JSON::Field(key: "TopicStatus")]
        getter topic_status : String?

        def initialize(
          @topic_arn : String? = nil,
          @topic_status : String? = nil
        )
        end
      end

      # Describes an individual setting that controls some aspect of DAX behavior.

      struct Parameter
        include JSON::Serializable

        # A range of values within which the parameter can be set.

        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # The conditions under which changes to this parameter can be applied. For example, requires-reboot
        # indicates that a new value for this parameter will only take effect if a node is rebooted.

        @[JSON::Field(key: "ChangeType")]
        getter change_type : String?

        # The data type of the parameter. For example, integer :

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # A description of the parameter

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Whether the customer is allowed to modify the parameter.

        @[JSON::Field(key: "IsModifiable")]
        getter is_modifiable : String?

        # A list of node types, and specific parameter values for each node.

        @[JSON::Field(key: "NodeTypeSpecificValues")]
        getter node_type_specific_values : Array(Types::NodeTypeSpecificValue)?

        # The name of the parameter.

        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # Determines whether the parameter can be applied to any nodes, or only nodes of a particular type.

        @[JSON::Field(key: "ParameterType")]
        getter parameter_type : String?

        # The value for the parameter.

        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        # How the parameter is defined. For example, system denotes a system-defined parameter.

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @allowed_values : String? = nil,
          @change_type : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @is_modifiable : String? = nil,
          @node_type_specific_values : Array(Types::NodeTypeSpecificValue)? = nil,
          @parameter_name : String? = nil,
          @parameter_type : String? = nil,
          @parameter_value : String? = nil,
          @source : String? = nil
        )
        end
      end

      # A named set of parameters that are applied to all of the nodes in a DAX cluster.

      struct ParameterGroup
        include JSON::Serializable

        # A description of the parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the parameter group.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        def initialize(
          @description : String? = nil,
          @parameter_group_name : String? = nil
        )
        end
      end

      # The specified parameter group already exists.

      struct ParameterGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified parameter group does not exist.

      struct ParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have attempted to exceed the maximum number of parameter groups.

      struct ParameterGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The status of a parameter group.

      struct ParameterGroupStatus
        include JSON::Serializable

        # The node IDs of one or more nodes to be rebooted.

        @[JSON::Field(key: "NodeIdsToReboot")]
        getter node_ids_to_reboot : Array(String)?

        # The status of parameter updates.

        @[JSON::Field(key: "ParameterApplyStatus")]
        getter parameter_apply_status : String?

        # The name of the parameter group.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        def initialize(
          @node_ids_to_reboot : Array(String)? = nil,
          @parameter_apply_status : String? = nil,
          @parameter_group_name : String? = nil
        )
        end
      end

      # An individual DAX parameter.

      struct ParameterNameValue
        include JSON::Serializable

        # The name of the parameter.

        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # The value of the parameter.

        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        def initialize(
          @parameter_name : String? = nil,
          @parameter_value : String? = nil
        )
        end
      end


      struct RebootNodeRequest
        include JSON::Serializable

        # The name of the DAX cluster containing the node to be rebooted.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # The system-assigned ID of the node to be rebooted.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String

        def initialize(
          @cluster_name : String,
          @node_id : String
        )
        end
      end


      struct RebootNodeResponse
        include JSON::Serializable

        # A description of the DAX cluster after a node has been rebooted.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # The description of the server-side encryption status on the specified DAX cluster.

      struct SSEDescription
        include JSON::Serializable

        # The current state of server-side encryption: ENABLING - Server-side encryption is being enabled.
        # ENABLED - Server-side encryption is enabled. DISABLING - Server-side encryption is being disabled.
        # DISABLED - Server-side encryption is disabled.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Represents the settings used to enable server-side encryption.

      struct SSESpecification
        include JSON::Serializable

        # Indicates whether server-side encryption is enabled (true) or disabled (false) on the cluster.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # An individual VPC security group and its status.

      struct SecurityGroupMembership
        include JSON::Serializable

        # The unique ID for this security group.

        @[JSON::Field(key: "SecurityGroupIdentifier")]
        getter security_group_identifier : String?

        # The status of this security group.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @security_group_identifier : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The specified service linked role (SLR) was not found.

      struct ServiceLinkedRoleNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have reached the maximum number of x509 certificates that can be created for encrypted clusters
      # in a 30 day period. Contact Amazon Web Services customer support to discuss options for continuing
      # to create encrypted clusters.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the subnet associated with a DAX cluster. This parameter refers to subnets defined in
      # Amazon Virtual Private Cloud (Amazon VPC) and used with DAX.

      struct Subnet
        include JSON::Serializable

        # The Availability Zone (AZ) for the subnet.

        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : String?

        # The system-assigned identifier for the subnet.

        @[JSON::Field(key: "SubnetIdentifier")]
        getter subnet_identifier : String?

        # The network types supported by this subnet. Returns an array of strings that can include ipv4 , ipv6
        # , or both, indicating whether the subnet supports IPv4 only, IPv6 only, or dual-stack deployments.

        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        def initialize(
          @subnet_availability_zone : String? = nil,
          @subnet_identifier : String? = nil,
          @supported_network_types : Array(String)? = nil
        )
        end
      end

      # Represents the output of one of the following actions: CreateSubnetGroup ModifySubnetGroup

      struct SubnetGroup
        include JSON::Serializable

        # The description of the subnet group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the subnet group.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String?

        # A list of subnets associated with the subnet group.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(Types::Subnet)?

        # The network types supported by this subnet. Returns an array of strings that can include ipv4 , ipv6
        # , or both, indicating whether the subnet group supports IPv4 only, IPv6 only, or dual-stack
        # deployments.

        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        # The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @description : String? = nil,
          @subnet_group_name : String? = nil,
          @subnets : Array(Types::Subnet)? = nil,
          @supported_network_types : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The specified subnet group already exists.

      struct SubnetGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified subnet group is currently in use.

      struct SubnetGroupInUseFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested subnet group name does not refer to an existing subnet group.

      struct SubnetGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the allowed number of subnets in a subnet
      # group.

      struct SubnetGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested subnet is being used by another subnet group.

      struct SubnetInUse
        include JSON::Serializable

        def initialize
        end
      end

      # The specified subnet can't be used for the requested network type. This error occurs when either
      # there aren't enough subnets of the required network type to create the cluster, or when you try to
      # use a subnet that doesn't support the requested network type (for example, trying to create a
      # dual-stack cluster with a subnet that doesn't have IPv6 CIDR).

      struct SubnetNotAllowedFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the allowed number of subnets in a subnet
      # group.

      struct SubnetQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # A description of a tag. Every tag is a key-value pair. You can add up to 50 tags to a single DAX
      # cluster. Amazon Web Services-assigned tag names and values are automatically assigned the aws:
      # prefix, which the user cannot assign. Amazon Web Services-assigned tag names do not count towards
      # the tag limit of 50. User-assigned tag names have the prefix user: . You cannot backdate the
      # application of a tag.

      struct Tag
        include JSON::Serializable

        # The key for the tag. Tag keys are case sensitive. Every DAX cluster can only have one tag with the
        # same key. If you try to add an existing tag (same key), the existing tag value will be updated to
        # the new value.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the tag. Tag values are case-sensitive and can be null.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The tag does not exist.

      struct TagNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # You have exceeded the maximum number of tags for this DAX cluster.

      struct TagQuotaPerResourceExceeded
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The name of the DAX resource to which tags should be added.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The tags to be assigned to the DAX resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        # The list of tags that are associated with the DAX resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The name of the DAX resource from which the tags should be removed.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # A list of tag keys. If the DAX cluster has any tags with these keys, then the tags are removed from
        # the cluster.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_name : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        # The tag keys that have been removed from the cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct UpdateClusterRequest
        include JSON::Serializable

        # The name of the DAX cluster to be modified.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # A description of the changes being made to the cluster.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) that identifies the topic.

        @[JSON::Field(key: "NotificationTopicArn")]
        getter notification_topic_arn : String?

        # The current state of the topic. A value of “active” means that notifications will be sent to the
        # topic. A value of “inactive” means that notifications will not be sent to the topic.

        @[JSON::Field(key: "NotificationTopicStatus")]
        getter notification_topic_status : String?

        # The name of a parameter group for this cluster.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # A range of time when maintenance of DAX cluster software will be performed. For example:
        # sun:01:00-sun:09:00 . Cluster maintenance normally takes less than 30 minutes, and is performed
        # automatically within the maintenance window.

        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A list of user-specified security group IDs to be assigned to each node in the DAX cluster. If this
        # parameter is not specified, DAX assigns the default VPC security group to each node.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @cluster_name : String,
          @description : String? = nil,
          @notification_topic_arn : String? = nil,
          @notification_topic_status : String? = nil,
          @parameter_group_name : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @security_group_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateClusterResponse
        include JSON::Serializable

        # A description of the DAX cluster, after it has been modified.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct UpdateParameterGroupRequest
        include JSON::Serializable

        # The name of the parameter group.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # An array of name-value pairs for the parameters in the group. Each element in the array represents a
        # single parameter. record-ttl-millis and query-ttl-millis are the only supported parameter names. For
        # more details, see Configuring TTL Settings .

        @[JSON::Field(key: "ParameterNameValues")]
        getter parameter_name_values : Array(Types::ParameterNameValue)

        def initialize(
          @parameter_group_name : String,
          @parameter_name_values : Array(Types::ParameterNameValue)
        )
        end
      end


      struct UpdateParameterGroupResponse
        include JSON::Serializable

        # The parameter group that has been modified.

        @[JSON::Field(key: "ParameterGroup")]
        getter parameter_group : Types::ParameterGroup?

        def initialize(
          @parameter_group : Types::ParameterGroup? = nil
        )
        end
      end


      struct UpdateSubnetGroupRequest
        include JSON::Serializable

        # The name of the subnet group.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String

        # A description of the subnet group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of subnet IDs in the subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @subnet_group_name : String,
          @description : String? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateSubnetGroupResponse
        include JSON::Serializable

        # The subnet group that has been modified.

        @[JSON::Field(key: "SubnetGroup")]
        getter subnet_group : Types::SubnetGroup?

        def initialize(
          @subnet_group : Types::SubnetGroup? = nil
        )
        end
      end
    end
  end
end
