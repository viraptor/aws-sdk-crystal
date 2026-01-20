require "json"
require "time"

module AwsSdk
  module NetworkFlowMonitor
    module Types

      # You don't have sufficient permission to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested resource is in use.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateMonitorInput
        include JSON::Serializable

        # The local resources to monitor. A local resource in a workload is the location of the host, or
        # hosts, where the Network Flow Monitor agent is installed. For example, if a workload consists of an
        # interaction between a web service and a backend database (for example, Amazon Dynamo DB), the subnet
        # with the EC2 instance that hosts the web service, which also runs the agent, is the local resource.
        # Be aware that all local resources must belong to the current Region.

        @[JSON::Field(key: "localResources")]
        getter local_resources : Array(Types::MonitorLocalResource)

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The Amazon Resource Name (ARN) of the scope for the monitor.

        @[JSON::Field(key: "scopeArn")]
        getter scope_arn : String

        # A unique, case-sensitive string of up to 64 ASCII characters that you specify to make an idempotent
        # API request. Don't reuse the same client token for other API requests.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The remote resources to monitor. A remote resource is the other endpoint in the bi-directional flow
        # of a workload, with a local resource. For example, Amazon Dynamo DB can be a remote resource. When
        # you specify remote resources, be aware that specific combinations of resources are allowed and
        # others are not, including the following constraints: All remote resources that you specify must all
        # belong to a single Region. If you specify Amazon Web Services services as remote resources, any
        # other remote resources that you specify must be in the current Region. When you specify a remote
        # resource for another Region, you can only specify the Region resource type. You cannot specify a
        # subnet, VPC, or Availability Zone in another Region. If you leave the RemoteResources parameter
        # empty, the monitor will include all network flows that terminate in the current Region.

        @[JSON::Field(key: "remoteResources")]
        getter remote_resources : Array(Types::MonitorRemoteResource)?

        # The tags for a monitor. You can add a maximum of 200 tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @local_resources : Array(Types::MonitorLocalResource),
          @monitor_name : String,
          @scope_arn : String,
          @client_token : String? = nil,
          @remote_resources : Array(Types::MonitorRemoteResource)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMonitorOutput
        include JSON::Serializable

        # The date and time when the monitor was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The local resources to monitor. A local resource in a workload is the location of hosts where the
        # Network Flow Monitor agent is installed.

        @[JSON::Field(key: "localResources")]
        getter local_resources : Array(Types::MonitorLocalResource)

        # The last date and time that the monitor was modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The status of a monitor. The status can be one of the following PENDING : The monitor is in the
        # process of being created. ACTIVE : The monitor is active. INACTIVE : The monitor is inactive. ERROR
        # : Monitor creation failed due to an error. DELETING : The monitor is in the process of being
        # deleted.

        @[JSON::Field(key: "monitorStatus")]
        getter monitor_status : String

        # The remote resources to monitor. A remote resource is the other endpoint specified for the network
        # flow of a workload, with a local resource. For example, Amazon Dynamo DB can be a remote resource.

        @[JSON::Field(key: "remoteResources")]
        getter remote_resources : Array(Types::MonitorRemoteResource)

        # The tags for a monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @local_resources : Array(Types::MonitorLocalResource),
          @modified_at : Time,
          @monitor_arn : String,
          @monitor_name : String,
          @monitor_status : String,
          @remote_resources : Array(Types::MonitorRemoteResource),
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateScopeInput
        include JSON::Serializable

        # The targets to define the scope to be monitored. A target is an array of targetResources, which are
        # currently Region-account pairs, defined by targetResource constructs.

        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::TargetResource)

        # A unique, case-sensitive string of up to 64 ASCII characters that you specify to make an idempotent
        # API request. Don't reuse the same client token for other API requests.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags for a scope. You can add a maximum of 200 tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @targets : Array(Types::TargetResource),
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateScopeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scope.

        @[JSON::Field(key: "scopeArn")]
        getter scope_arn : String

        # The identifier for the scope that includes the resources you want to get metrics for. A scope ID is
        # an internally-generated identifier that includes all the resources for a specific root account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The status for a scope. The status can be one of the following: SUCCEEDED , IN_PROGRESS , FAILED ,
        # DEACTIVATING , or DEACTIVATED . A status of DEACTIVATING means that you've requested a scope to be
        # deactivated and Network Flow Monitor is in the process of deactivating the scope. A status of
        # DEACTIVATED means that the deactivating process is complete.

        @[JSON::Field(key: "status")]
        getter status : String

        # The tags for a scope.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @scope_arn : String,
          @scope_id : String,
          @status : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DeleteMonitorInput
        include JSON::Serializable

        # The name of the monitor to delete.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        def initialize(
          @monitor_name : String
        )
        end
      end


      struct DeleteMonitorOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteScopeInput
        include JSON::Serializable

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        def initialize(
          @scope_id : String
        )
        end
      end


      struct DeleteScopeOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetMonitorInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        def initialize(
          @monitor_name : String
        )
        end
      end


      struct GetMonitorOutput
        include JSON::Serializable

        # The date and time when the monitor was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The local resources to monitor. A local resource in a workload is the location of the hosts where
        # the Network Flow Monitor agent is installed.

        @[JSON::Field(key: "localResources")]
        getter local_resources : Array(Types::MonitorLocalResource)

        # The date and time when the monitor was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The status of a monitor. The status can be one of the following PENDING : The monitor is in the
        # process of being created. ACTIVE : The monitor is active. INACTIVE : The monitor is inactive. ERROR
        # : Monitor creation failed due to an error. DELETING : The monitor is in the process of being
        # deleted.

        @[JSON::Field(key: "monitorStatus")]
        getter monitor_status : String

        # The remote resources to monitor. A remote resource is the other endpoint specified for the network
        # flow of a workload, with a local resource. For example, Amazon Dynamo DB can be a remote resource.

        @[JSON::Field(key: "remoteResources")]
        getter remote_resources : Array(Types::MonitorRemoteResource)

        # The tags for a monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @local_resources : Array(Types::MonitorLocalResource),
          @modified_at : Time,
          @monitor_arn : String,
          @monitor_name : String,
          @monitor_status : String,
          @remote_resources : Array(Types::MonitorRemoteResource),
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetQueryResultsMonitorTopContributorsInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to create a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # The number of query results that you want to return with this call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @monitor_name : String,
          @query_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetQueryResultsMonitorTopContributorsOutput
        include JSON::Serializable

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The top contributor network flows overall for a specific metric type, for example, the number of
        # retransmissions.

        @[JSON::Field(key: "topContributors")]
        getter top_contributors : Array(Types::MonitorTopContributorsRow)?

        # The units for a metric returned by the query.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @next_token : String? = nil,
          @top_contributors : Array(Types::MonitorTopContributorsRow)? = nil,
          @unit : String? = nil
        )
        end
      end


      struct GetQueryResultsWorkloadInsightsTopContributorsDataInput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to create a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The number of query results that you want to return with this call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @query_id : String,
          @scope_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetQueryResultsWorkloadInsightsTopContributorsDataOutput
        include JSON::Serializable

        # The datapoints returned by the query.

        @[JSON::Field(key: "datapoints")]
        getter datapoints : Array(Types::WorkloadInsightsTopContributorsDataPoint)

        # The units for a metric returned by the query.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datapoints : Array(Types::WorkloadInsightsTopContributorsDataPoint),
          @unit : String,
          @next_token : String? = nil
        )
        end
      end


      struct GetQueryResultsWorkloadInsightsTopContributorsInput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to create a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The number of query results that you want to return with this call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @query_id : String,
          @scope_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetQueryResultsWorkloadInsightsTopContributorsOutput
        include JSON::Serializable

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The top contributor network flows overall for a specific metric type, for example, the number of
        # retransmissions.

        @[JSON::Field(key: "topContributors")]
        getter top_contributors : Array(Types::WorkloadInsightsTopContributorsRow)?

        def initialize(
          @next_token : String? = nil,
          @top_contributors : Array(Types::WorkloadInsightsTopContributorsRow)? = nil
        )
        end
      end


      struct GetQueryStatusMonitorTopContributorsInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to start a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @monitor_name : String,
          @query_id : String
        )
        end
      end


      struct GetQueryStatusMonitorTopContributorsOutput
        include JSON::Serializable

        # When you run a query, use this call to check the status of the query to make sure that the query has
        # SUCCEEDED before you review the results. QUEUED : The query is scheduled to run. RUNNING : The query
        # is in progress but not complete. SUCCEEDED : The query completed sucessfully. FAILED : The query
        # failed due to an error. CANCELED : The query was canceled.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end


      struct GetQueryStatusWorkloadInsightsTopContributorsDataInput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to start a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account. A scope ID is returned from a CreateScope API call.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        def initialize(
          @query_id : String,
          @scope_id : String
        )
        end
      end


      struct GetQueryStatusWorkloadInsightsTopContributorsDataOutput
        include JSON::Serializable

        # The status of a query for top contributors data. QUEUED : The query is scheduled to run. RUNNING :
        # The query is in progress but not complete. SUCCEEDED : The query completed sucessfully. FAILED : The
        # query failed due to an error. CANCELED : The query was canceled.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end


      struct GetQueryStatusWorkloadInsightsTopContributorsInput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to start a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        def initialize(
          @query_id : String,
          @scope_id : String
        )
        end
      end


      struct GetQueryStatusWorkloadInsightsTopContributorsOutput
        include JSON::Serializable

        # When you run a query, use this call to check the status of the query to make sure that the query has
        # SUCCEEDED before you review the results. QUEUED : The query is scheduled to run. RUNNING : The query
        # is in progress but not complete. SUCCEEDED : The query completed sucessfully. FAILED : The query
        # failed due to an error. CANCELED : The query was canceled.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end


      struct GetScopeInput
        include JSON::Serializable

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account. A scope ID is returned from a CreateScope API call.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        def initialize(
          @scope_id : String
        )
        end
      end


      struct GetScopeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scope.

        @[JSON::Field(key: "scopeArn")]
        getter scope_arn : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account. A scope ID is returned from a CreateScope API call.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The status for a scope. The status can be one of the following: SUCCEEDED , IN_PROGRESS , FAILED ,
        # DEACTIVATING , or DEACTIVATED . A status of DEACTIVATING means that you've requested a scope to be
        # deactivated and Network Flow Monitor is in the process of deactivating the scope. A status of
        # DEACTIVATED means that the deactivating process is complete.

        @[JSON::Field(key: "status")]
        getter status : String

        # The targets to define the scope to be monitored. A target is an array of targetResources, which are
        # currently Region-account pairs, defined by targetResource constructs.

        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::TargetResource)

        # The tags for a scope.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @scope_arn : String,
          @scope_id : String,
          @status : String,
          @targets : Array(Types::TargetResource),
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An internal error occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Meta data about Kubernetes resources.

      struct KubernetesMetadata
        include JSON::Serializable

        # The name of the pod for a local resource.

        @[JSON::Field(key: "localPodName")]
        getter local_pod_name : String?

        # The namespace of the pod for a local resource.

        @[JSON::Field(key: "localPodNamespace")]
        getter local_pod_namespace : String?

        # The service name for a local resource.

        @[JSON::Field(key: "localServiceName")]
        getter local_service_name : String?

        # The name of the pod for a remote resource.

        @[JSON::Field(key: "remotePodName")]
        getter remote_pod_name : String?

        # The namespace of the pod for a remote resource.

        @[JSON::Field(key: "remotePodNamespace")]
        getter remote_pod_namespace : String?

        # The service name for a remote resource.

        @[JSON::Field(key: "remoteServiceName")]
        getter remote_service_name : String?

        def initialize(
          @local_pod_name : String? = nil,
          @local_pod_namespace : String? = nil,
          @local_service_name : String? = nil,
          @remote_pod_name : String? = nil,
          @remote_pod_namespace : String? = nil,
          @remote_service_name : String? = nil
        )
        end
      end


      struct ListMonitorsInput
        include JSON::Serializable

        # The number of query results that you want to return with this call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The status of a monitor. The status can be one of the following PENDING : The monitor is in the
        # process of being created. ACTIVE : The monitor is active. INACTIVE : The monitor is inactive. ERROR
        # : Monitor creation failed due to an error. DELETING : The monitor is in the process of being
        # deleted.

        @[JSON::Field(key: "monitorStatus")]
        getter monitor_status : String?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @monitor_status : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMonitorsOutput
        include JSON::Serializable

        # The monitors that are in an account.

        @[JSON::Field(key: "monitors")]
        getter monitors : Array(Types::MonitorSummary)

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @monitors : Array(Types::MonitorSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListScopesInput
        include JSON::Serializable

        # The number of query results that you want to return with this call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListScopesOutput
        include JSON::Serializable

        # The scopes returned by the call.

        @[JSON::Field(key: "scopes")]
        getter scopes : Array(Types::ScopeSummary)

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @scopes : Array(Types::ScopeSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The tags for a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A local resource is the host where the agent is installed. Local resources can be a a subnet, a VPC,
      # an Availability Zone, an EKS cluster or an Amazon Web Services Region.

      struct MonitorLocalResource
        include JSON::Serializable

        # The identifier of the local resource. The values you can specify are the following: For a VPC,
        # subnet or EKS cluster, this identifier is the VPC Amazon Resource Name (ARN), subnet ARN or cluster
        # ARN. For an Availability Zone, this identifier is the AZ name, for example, us-west-2b. For a
        # Region, this identifier is the Region name, for example, us-west-2.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The type of the local resource. Valid values are AWS::EC2::VPC AWS::AvailabilityZone ,
        # AWS::EC2::Subnet , AWS::EKS::Cluster , or AWS::Region .

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @identifier : String,
          @type : String
        )
        end
      end

      # A remote resource is the other endpoint in a network flow. That is, one endpoint is the local
      # resource and the other is the remote resource. The values you can specify are the following: For a
      # VPC or subnet, this identifier is the VPC Amazon Resource Name (ARN) or subnet ARN. For a service,
      # this identifier is one of the following strings: S3 or DynamoDB . For an Availability Zone, this
      # identifier is the AZ name, for example, us-west-2b. For a Region, this identifier is the Region
      # name, for example, us-west-2. When a remote resource is an Amazon Web Services Region, Network Flow
      # Monitor provides network performance measurements up to the edge of the Region that you specify.

      struct MonitorRemoteResource
        include JSON::Serializable

        # The identifier of the remote resource. For a VPC or subnet, this identifier is the VPC Amazon
        # Resource Name (ARN) or subnet ARN. For an Availability Zone, this identifier is the AZ name, for
        # example, us-west-2b. For an Amazon Web Services Region , this identifier is the Region name, for
        # example, us-west-2.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The type of the remote resource. Valid values are AWS::EC2::VPC AWS::AvailabilityZone ,
        # AWS::EC2::Subnet , AWS::AWSService , or AWS::Region .

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @identifier : String,
          @type : String
        )
        end
      end

      # A summary of information about a monitor, including the ARN, the name, and the status.

      struct MonitorSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The status of a monitor. The status can be one of the following PENDING : The monitor is in the
        # process of being created. ACTIVE : The monitor is active. INACTIVE : The monitor is inactive. ERROR
        # : Monitor creation failed due to an error. DELETING : The monitor is in the process of being
        # deleted.

        @[JSON::Field(key: "monitorStatus")]
        getter monitor_status : String

        def initialize(
          @monitor_arn : String,
          @monitor_name : String,
          @monitor_status : String
        )
        end
      end

      # A set of information for a top contributor network flow in a monitor. In a monitor, Network Flow
      # Monitor returns information about the network flows for top contributors for each metric. Top
      # contributors are network flows with the top values for each metric type.

      struct MonitorTopContributorsRow
        include JSON::Serializable

        # The destination category for a top contributors row. Destination categories can be one of the
        # following: INTRA_AZ : Top contributor network flows within a single Availability Zone INTER_AZ : Top
        # contributor network flows between Availability Zones INTER_REGION : Top contributor network flows
        # between Regions (to the edge of another Region) INTER_VPC : Top contributor network flows between
        # VPCs AWS_SERVICES : Top contributor network flows to or from Amazon Web Services services
        # UNCLASSIFIED : Top contributor network flows that do not have a bucket classification

        @[JSON::Field(key: "destinationCategory")]
        getter destination_category : String?

        # The destination network address translation (DNAT) IP address for a top contributor network flow.

        @[JSON::Field(key: "dnatIp")]
        getter dnat_ip : String?

        # Meta data about Kubernetes resources.

        @[JSON::Field(key: "kubernetesMetadata")]
        getter kubernetes_metadata : Types::KubernetesMetadata?

        # The Availability Zone for the local resource for a top contributor network flow.

        @[JSON::Field(key: "localAz")]
        getter local_az : String?

        # The Amazon Resource Name (ARN) of a local resource.

        @[JSON::Field(key: "localInstanceArn")]
        getter local_instance_arn : String?

        # The instance identifier for the local resource for a top contributor network flow.

        @[JSON::Field(key: "localInstanceId")]
        getter local_instance_id : String?

        # The IP address of the local resource for a top contributor network flow.

        @[JSON::Field(key: "localIp")]
        getter local_ip : String?

        # The Amazon Web Services Region for the local resource for a top contributor network flow.

        @[JSON::Field(key: "localRegion")]
        getter local_region : String?

        # The Amazon Resource Name (ARN) of a local subnet.

        @[JSON::Field(key: "localSubnetArn")]
        getter local_subnet_arn : String?

        # The subnet ID for the local resource for a top contributor network flow.

        @[JSON::Field(key: "localSubnetId")]
        getter local_subnet_id : String?

        # The Amazon Resource Name (ARN) of a local VPC.

        @[JSON::Field(key: "localVpcArn")]
        getter local_vpc_arn : String?

        # The VPC ID for a top contributor network flow for the local resource.

        @[JSON::Field(key: "localVpcId")]
        getter local_vpc_id : String?

        # The Availability Zone for the remote resource for a top contributor network flow.

        @[JSON::Field(key: "remoteAz")]
        getter remote_az : String?

        # The Amazon Resource Name (ARN) of a remote resource.

        @[JSON::Field(key: "remoteInstanceArn")]
        getter remote_instance_arn : String?

        # The instance identifier for the remote resource for a top contributor network flow.

        @[JSON::Field(key: "remoteInstanceId")]
        getter remote_instance_id : String?

        # The IP address of the remote resource for a top contributor network flow.

        @[JSON::Field(key: "remoteIp")]
        getter remote_ip : String?

        # The Amazon Web Services Region for the remote resource for a top contributor network flow.

        @[JSON::Field(key: "remoteRegion")]
        getter remote_region : String?

        # The Amazon Resource Name (ARN) of a remote subnet.

        @[JSON::Field(key: "remoteSubnetArn")]
        getter remote_subnet_arn : String?

        # The subnet ID for the remote resource for a top contributor network flow.

        @[JSON::Field(key: "remoteSubnetId")]
        getter remote_subnet_id : String?

        # The Amazon Resource Name (ARN) of a remote VPC.

        @[JSON::Field(key: "remoteVpcArn")]
        getter remote_vpc_arn : String?

        # The VPC ID for a top contributor network flow for the remote resource.

        @[JSON::Field(key: "remoteVpcId")]
        getter remote_vpc_id : String?

        # The secure network address translation (SNAT) IP address for a top contributor network flow.

        @[JSON::Field(key: "snatIp")]
        getter snat_ip : String?

        # The target port.

        @[JSON::Field(key: "targetPort")]
        getter target_port : Int32?

        # The constructs traversed by a network flow.

        @[JSON::Field(key: "traversedConstructs")]
        getter traversed_constructs : Array(Types::TraversedComponent)?

        # The value of the metric for a top contributor network flow.

        @[JSON::Field(key: "value")]
        getter value : Int64?

        def initialize(
          @destination_category : String? = nil,
          @dnat_ip : String? = nil,
          @kubernetes_metadata : Types::KubernetesMetadata? = nil,
          @local_az : String? = nil,
          @local_instance_arn : String? = nil,
          @local_instance_id : String? = nil,
          @local_ip : String? = nil,
          @local_region : String? = nil,
          @local_subnet_arn : String? = nil,
          @local_subnet_id : String? = nil,
          @local_vpc_arn : String? = nil,
          @local_vpc_id : String? = nil,
          @remote_az : String? = nil,
          @remote_instance_arn : String? = nil,
          @remote_instance_id : String? = nil,
          @remote_ip : String? = nil,
          @remote_region : String? = nil,
          @remote_subnet_arn : String? = nil,
          @remote_subnet_id : String? = nil,
          @remote_vpc_arn : String? = nil,
          @remote_vpc_id : String? = nil,
          @snat_ip : String? = nil,
          @target_port : Int32? = nil,
          @traversed_constructs : Array(Types::TraversedComponent)? = nil,
          @value : Int64? = nil
        )
        end
      end

      # The request specifies a resource that doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A summary of information about a scope, including the ARN, target ID, and Amazon Web Services
      # Region.

      struct ScopeSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scope.

        @[JSON::Field(key: "scopeArn")]
        getter scope_arn : String

        # The identifier for the scope that includes the resources that you want to get data results for. A
        # scope ID is an internally-generated identifier that includes all the resources for the accounts in a
        # scope.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The status for a scope. The status can be one of the following: SUCCEEDED , IN_PROGRESS , FAILED ,
        # DEACTIVATING , or DEACTIVATED . A status of DEACTIVATING means that you've requested a scope to be
        # deactivated and Network Flow Monitor is in the process of deactivating the scope. A status of
        # DEACTIVATED means that the deactivating process is complete.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @scope_arn : String,
          @scope_id : String,
          @status : String
        )
        end
      end

      # The request exceeded a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartQueryMonitorTopContributorsInput
        include JSON::Serializable

        # The category that you want to query top contributors for, for a specific monitor. Destination
        # categories can be one of the following: INTRA_AZ : Top contributor network flows within a single
        # Availability Zone INTER_AZ : Top contributor network flows between Availability Zones INTER_REGION :
        # Top contributor network flows between Regions (to the edge of another Region) INTER_VPC : Top
        # contributor network flows between VPCs AMAZON_S3 : Top contributor network flows to or from Amazon
        # S3 AMAZON_DYNAMODB : Top contributor network flows to or from Amazon Dynamo DB UNCLASSIFIED : Top
        # contributor network flows that do not have a bucket classification

        @[JSON::Field(key: "destinationCategory")]
        getter destination_category : String

        # The timestamp that is the date and time end of the period that you want to retrieve results for with
        # your query.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The metric that you want to query top contributors for. That is, you can specify a metric with this
        # call and return the top contributor network flows, for that type of metric, for a monitor and
        # (optionally) within a specific category, such as network flows between Availability Zones.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The timestamp that is the date and time that is the beginning of the period that you want to
        # retrieve results for with your query.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The maximum number of top contributors to return.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        def initialize(
          @destination_category : String,
          @end_time : Time,
          @metric_name : String,
          @monitor_name : String,
          @start_time : Time,
          @limit : Int32? = nil
        )
        end
      end


      struct StartQueryMonitorTopContributorsOutput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to start a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct StartQueryWorkloadInsightsTopContributorsDataInput
        include JSON::Serializable

        # The destination category for a top contributors. Destination categories can be one of the following:
        # INTRA_AZ : Top contributor network flows within a single Availability Zone INTER_AZ : Top
        # contributor network flows between Availability Zones INTER_REGION : Top contributor network flows
        # between Regions (to the edge of another Region) INTER_VPC : Top contributor network flows between
        # VPCs AWS_SERVICES : Top contributor network flows to or from Amazon Web Services services
        # UNCLASSIFIED : Top contributor network flows that do not have a bucket classification

        @[JSON::Field(key: "destinationCategory")]
        getter destination_category : String

        # The timestamp that is the date and time end of the period that you want to retrieve results for with
        # your query.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The metric that you want to query top contributors for. That is, you can specify this metric to
        # return the top contributor network flows, for this type of metric, for a monitor and (optionally)
        # within a specific category, such as network flows between Availability Zones.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The timestamp that is the date and time that is the beginning of the period that you want to
        # retrieve results for with your query.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        def initialize(
          @destination_category : String,
          @end_time : Time,
          @metric_name : String,
          @scope_id : String,
          @start_time : Time
        )
        end
      end


      struct StartQueryWorkloadInsightsTopContributorsDataOutput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to start a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct StartQueryWorkloadInsightsTopContributorsInput
        include JSON::Serializable

        # The destination category for a top contributors row. Destination categories can be one of the
        # following: INTRA_AZ : Top contributor network flows within a single Availability Zone INTER_AZ : Top
        # contributor network flows between Availability Zones INTER_REGION : Top contributor network flows
        # between Regions (to the edge of another Region) INTER_VPC : Top contributor network flows between
        # VPCs AWS_SERVICES : Top contributor network flows to or from Amazon Web Services services
        # UNCLASSIFIED : Top contributor network flows that do not have a bucket classification

        @[JSON::Field(key: "destinationCategory")]
        getter destination_category : String

        # The timestamp that is the date and time end of the period that you want to retrieve results for with
        # your query.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The metric that you want to query top contributors for. That is, you can specify this metric to
        # return the top contributor network flows, for this type of metric, for a monitor and (optionally)
        # within a specific category, such as network flows between Availability Zones.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account. A scope ID is returned from a CreateScope API call.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The timestamp that is the date and time that is the beginning of the period that you want to
        # retrieve results for with your query.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The maximum number of top contributors to return.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        def initialize(
          @destination_category : String,
          @end_time : Time,
          @metric_name : String,
          @scope_id : String,
          @start_time : Time,
          @limit : Int32? = nil
        )
        end
      end


      struct StartQueryWorkloadInsightsTopContributorsOutput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to start a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct StopQueryMonitorTopContributorsInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to create a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @monitor_name : String,
          @query_id : String
        )
        end
      end


      struct StopQueryMonitorTopContributorsOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct StopQueryWorkloadInsightsTopContributorsDataInput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to create a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        def initialize(
          @query_id : String,
          @scope_id : String
        )
        end
      end


      struct StopQueryWorkloadInsightsTopContributorsDataOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct StopQueryWorkloadInsightsTopContributorsInput
        include JSON::Serializable

        # The identifier for the query. A query ID is an internally-generated identifier for a specific query
        # returned from an API call to create a query.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        def initialize(
          @query_id : String,
          @scope_id : String
        )
        end
      end


      struct StopQueryWorkloadInsightsTopContributorsOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags for a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A target ID is an internally-generated identifier for a target. A target allows you to identify all
      # the resources in a Network Flow Monitor scope. Currently, a target is always an Amazon Web Services
      # account.

      struct TargetId
        include JSON::Serializable

        # The identifier for the account for a target.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end

      # A target identifier is a pair of identifying information for a scope that is included in a target. A
      # target identifier is made up of a target ID and a target type. Currently the target ID is always an
      # account ID and the target type is always ACCOUNT.

      struct TargetIdentifier
        include JSON::Serializable

        # The identifier for a target, which is currently always an account ID .

        @[JSON::Field(key: "targetId")]
        getter target_id : Types::TargetId

        # The type of a target. A target type is currently always ACCOUNT .

        @[JSON::Field(key: "targetType")]
        getter target_type : String

        def initialize(
          @target_id : Types::TargetId,
          @target_type : String
        )
        end
      end

      # A target resource in a scope. The resource is identified by a Region and an account, defined by a
      # target identifier. A target identifier is made up of a target ID (currently always an account ID)
      # and a target type (currently always ACCOUNT ).

      struct TargetResource
        include JSON::Serializable

        # The Amazon Web Services Region for the scope.

        @[JSON::Field(key: "region")]
        getter region : String

        # A target identifier is a pair of identifying information for a scope. A target identifier is made up
        # of a targetID (currently always an account ID) and a targetType (currently always an account).

        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : Types::TargetIdentifier

        def initialize(
          @region : String,
          @target_identifier : Types::TargetIdentifier
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A section of the network that a network flow has traveled through.

      struct TraversedComponent
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a traversed component.

        @[JSON::Field(key: "componentArn")]
        getter component_arn : String?

        # The identifier for the traversed component.

        @[JSON::Field(key: "componentId")]
        getter component_id : String?

        # The type of component that was traversed.

        @[JSON::Field(key: "componentType")]
        getter component_type : String?

        # The service name for the traversed component.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @component_arn : String? = nil,
          @component_id : String? = nil,
          @component_type : String? = nil,
          @service_name : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Keys that you specified when you tagged a resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateMonitorInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # A unique, case-sensitive string of up to 64 ASCII characters that you specify to make an idempotent
        # API request. Don't reuse the same client token for other API requests.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Additional local resources to specify network flows for a monitor, as an array of resources with
        # identifiers and types. A local resource in a workload is the location of hosts where the Network
        # Flow Monitor agent is installed.

        @[JSON::Field(key: "localResourcesToAdd")]
        getter local_resources_to_add : Array(Types::MonitorLocalResource)?

        # The local resources to remove, as an array of resources with identifiers and types.

        @[JSON::Field(key: "localResourcesToRemove")]
        getter local_resources_to_remove : Array(Types::MonitorLocalResource)?

        # The remote resources to add, as an array of resources with identifiers and types. A remote resource
        # is the other endpoint in the flow of a workload, with a local resource. For example, Amazon Dynamo
        # DB can be a remote resource.

        @[JSON::Field(key: "remoteResourcesToAdd")]
        getter remote_resources_to_add : Array(Types::MonitorRemoteResource)?

        # The remote resources to remove, as an array of resources with identifiers and types. A remote
        # resource is the other endpoint specified for the network flow of a workload, with a local resource.
        # For example, Amazon Dynamo DB can be a remote resource.

        @[JSON::Field(key: "remoteResourcesToRemove")]
        getter remote_resources_to_remove : Array(Types::MonitorRemoteResource)?

        def initialize(
          @monitor_name : String,
          @client_token : String? = nil,
          @local_resources_to_add : Array(Types::MonitorLocalResource)? = nil,
          @local_resources_to_remove : Array(Types::MonitorLocalResource)? = nil,
          @remote_resources_to_add : Array(Types::MonitorRemoteResource)? = nil,
          @remote_resources_to_remove : Array(Types::MonitorRemoteResource)? = nil
        )
        end
      end


      struct UpdateMonitorOutput
        include JSON::Serializable

        # The date and time when the monitor was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The local resources to monitor. A local resource in a workload is the location of hosts where the
        # Network Flow Monitor agent is installed.

        @[JSON::Field(key: "localResources")]
        getter local_resources : Array(Types::MonitorLocalResource)

        # The last date and time that the monitor was modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The status of a monitor. The status can be one of the following PENDING : The monitor is in the
        # process of being created. ACTIVE : The monitor is active. INACTIVE : The monitor is inactive. ERROR
        # : Monitor creation failed due to an error. DELETING : The monitor is in the process of being
        # deleted.

        @[JSON::Field(key: "monitorStatus")]
        getter monitor_status : String

        # The remote resources updated for a monitor, as an array of resources with identifiers and types. A
        # remote resource is the other endpoint specified for the network flow of a workload, with a local
        # resource. For example, Amazon Dynamo DB can be a remote resource.

        @[JSON::Field(key: "remoteResources")]
        getter remote_resources : Array(Types::MonitorRemoteResource)

        # The tags for a monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @local_resources : Array(Types::MonitorLocalResource),
          @modified_at : Time,
          @monitor_arn : String,
          @monitor_name : String,
          @monitor_status : String,
          @remote_resources : Array(Types::MonitorRemoteResource),
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateScopeInput
        include JSON::Serializable

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # A list of resources to add to a scope.

        @[JSON::Field(key: "resourcesToAdd")]
        getter resources_to_add : Array(Types::TargetResource)?

        # A list of resources to delete from a scope.

        @[JSON::Field(key: "resourcesToDelete")]
        getter resources_to_delete : Array(Types::TargetResource)?

        def initialize(
          @scope_id : String,
          @resources_to_add : Array(Types::TargetResource)? = nil,
          @resources_to_delete : Array(Types::TargetResource)? = nil
        )
        end
      end


      struct UpdateScopeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scope.

        @[JSON::Field(key: "scopeArn")]
        getter scope_arn : String

        # The identifier for the scope that includes the resources you want to get data results for. A scope
        # ID is an internally-generated identifier that includes all the resources for a specific root
        # account.

        @[JSON::Field(key: "scopeId")]
        getter scope_id : String

        # The status for a scope. The status can be one of the following: SUCCEEDED , IN_PROGRESS , FAILED ,
        # DEACTIVATING , or DEACTIVATED . A status of DEACTIVATING means that you've requested a scope to be
        # deactivated and Network Flow Monitor is in the process of deactivating the scope. A status of
        # DEACTIVATED means that the deactivating process is complete.

        @[JSON::Field(key: "status")]
        getter status : String

        # The tags for a scope.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @scope_arn : String,
          @scope_id : String,
          @status : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Invalid request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A data point for a top contributor network flow in a scope. Network Flow Monitor returns information
      # about the network flows with the top values for each metric type, which are called top contributors.

      struct WorkloadInsightsTopContributorsDataPoint
        include JSON::Serializable

        # The label identifying the data point.

        @[JSON::Field(key: "label")]
        getter label : String

        # An array of the timestamps for the data point.

        @[JSON::Field(key: "timestamps")]
        getter timestamps : Array(Time)

        # The values for the data point.

        @[JSON::Field(key: "values")]
        getter values : Array(Float64)

        def initialize(
          @label : String,
          @timestamps : Array(Time),
          @values : Array(Float64)
        )
        end
      end

      # A row for a top contributor for a scope.

      struct WorkloadInsightsTopContributorsRow
        include JSON::Serializable

        # The account ID for a specific row of data.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The identifier for the Availability Zone where the local resource is located.

        @[JSON::Field(key: "localAz")]
        getter local_az : String?

        # The Amazon Web Services Region where the local resource is located.

        @[JSON::Field(key: "localRegion")]
        getter local_region : String?

        # The Amazon Resource Name (ARN) of a local subnet.

        @[JSON::Field(key: "localSubnetArn")]
        getter local_subnet_arn : String?

        # The subnet identifier for the local resource.

        @[JSON::Field(key: "localSubnetId")]
        getter local_subnet_id : String?

        # The Amazon Resource Name (ARN) of a local VPC.

        @[JSON::Field(key: "localVpcArn")]
        getter local_vpc_arn : String?

        # The identifier for the VPC for the local resource.

        @[JSON::Field(key: "localVpcId")]
        getter local_vpc_id : String?

        # The identifier of a remote resource. For a VPC or subnet, this identifier is the VPC Amazon Resource
        # Name (ARN) or subnet ARN. For an Availability Zone, this identifier is the AZ name, for example,
        # us-west-2b. For an Amazon Web Services Region , this identifier is the Region name, for example,
        # us-west-2.

        @[JSON::Field(key: "remoteIdentifier")]
        getter remote_identifier : String?

        # The value for a metric.

        @[JSON::Field(key: "value")]
        getter value : Int64?

        def initialize(
          @account_id : String? = nil,
          @local_az : String? = nil,
          @local_region : String? = nil,
          @local_subnet_arn : String? = nil,
          @local_subnet_id : String? = nil,
          @local_vpc_arn : String? = nil,
          @local_vpc_id : String? = nil,
          @remote_identifier : String? = nil,
          @value : Int64? = nil
        )
        end
      end
    end
  end
end
