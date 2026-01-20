require "json"
require "time"

module AwsSdk
  module ApplicationAutoScaling
    module Types

      # Represents a CloudWatch alarm associated with a scaling policy.

      struct Alarm
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alarm.

        @[JSON::Field(key: "AlarmARN")]
        getter alarm_arn : String

        # The name of the alarm.

        @[JSON::Field(key: "AlarmName")]
        getter alarm_name : String

        def initialize(
          @alarm_arn : String,
          @alarm_name : String
        )
        end
      end

      # A GetPredictiveScalingForecast call returns the capacity forecast for a predictive scaling policy.
      # This structure includes the data points for that capacity forecast, along with the timestamps of
      # those data points.

      struct CapacityForecast
        include JSON::Serializable

        # The timestamps for the data points, in UTC format.

        @[JSON::Field(key: "Timestamps")]
        getter timestamps : Array(Time)

        # The values of the data points.

        @[JSON::Field(key: "Values")]
        getter values : Array(Float64)

        def initialize(
          @timestamps : Array(Time),
          @values : Array(Float64)
        )
        end
      end

      # Concurrent updates caused an exception, for example, if you request an update to an Application Auto
      # Scaling resource that already has a pending update.

      struct ConcurrentUpdateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use with
      # Application Auto Scaling. For information about the available metrics for a service, see Amazon Web
      # Services services that publish CloudWatch metrics in the Amazon CloudWatch User Guide . To create
      # your customized metric specification: Add values for each required parameter from CloudWatch. You
      # can use an existing metric, or a new metric that you create. To use your own metric, you must first
      # publish the metric to CloudWatch. For more information, see Publish custom metrics in the Amazon
      # CloudWatch User Guide . Choose a metric that changes proportionally with capacity. The value of the
      # metric should increase or decrease in inverse proportion to the number of capacity units. That is,
      # the value of the metric should decrease when capacity increases, and increase when capacity
      # decreases. For more information about the CloudWatch terminology below, see Amazon CloudWatch
      # concepts in the Amazon CloudWatch User Guide .

      struct CustomizedMetricSpecification
        include JSON::Serializable

        # The dimensions of the metric. Conditional: If you published your metric with dimensions, you must
        # specify the same dimensions in your scaling policy.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::MetricDimension)?

        # The name of the metric. To get the exact metric name, namespace, and dimensions, inspect the Metric
        # object that's returned by a call to ListMetrics .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The metrics to include in the target tracking scaling policy, as a metric data query. This can
        # include both raw metric and metric math expressions.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(Types::TargetTrackingMetricDataQuery)?

        # The namespace of the metric.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The statistic of the metric.

        @[JSON::Field(key: "Statistic")]
        getter statistic : String?

        # The unit of the metric. For a complete list of the units that CloudWatch supports, see the
        # MetricDatum data type in the Amazon CloudWatch API Reference .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @dimensions : Array(Types::MetricDimension)? = nil,
          @metric_name : String? = nil,
          @metrics : Array(Types::TargetTrackingMetricDataQuery)? = nil,
          @namespace : String? = nil,
          @statistic : String? = nil,
          @unit : String? = nil
        )
        end
      end


      struct DeleteScalingPolicyRequest
        include JSON::Serializable

        # The name of the scaling policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The identifier of the resource associated with the scalable target. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        def initialize(
          @policy_name : String,
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String
        )
        end
      end


      struct DeleteScalingPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteScheduledActionRequest
        include JSON::Serializable

        # The identifier of the resource associated with the scheduled action. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The name of the scheduled action.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        def initialize(
          @resource_id : String,
          @scalable_dimension : String,
          @scheduled_action_name : String,
          @service_namespace : String
        )
        end
      end


      struct DeleteScheduledActionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterScalableTargetRequest
        include JSON::Serializable

        # The identifier of the resource associated with the scalable target. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension associated with the scalable target. This string consists of the service
        # namespace, resource type, and scaling property. ecs:service:DesiredCount - The task count of an ECS
        # service. elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        def initialize(
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String
        )
        end
      end


      struct DeregisterScalableTargetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeScalableTargetsRequest
        include JSON::Serializable

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.
        # If this parameter is used, the operation returns up to MaxResults results at a time, along with a
        # NextToken value. To get the next set of results, include the NextToken value in a subsequent call.
        # If this parameter is not used, the operation returns up to 50 results and a NextToken value, if
        # applicable.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the resource associated with the scalable target. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceIds")]
        getter resource_ids : Array(String)?

        # The scalable dimension associated with the scalable target. This string consists of the service
        # namespace, resource type, and scaling property. If you specify a scalable dimension, you must also
        # specify a resource ID. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String?

        def initialize(
          @service_namespace : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_ids : Array(String)? = nil,
          @scalable_dimension : String? = nil
        )
        end
      end


      struct DescribeScalableTargetsResponse
        include JSON::Serializable

        # The token required to get the next set of results. This value is null if there are no more results
        # to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The scalable targets that match the request parameters.

        @[JSON::Field(key: "ScalableTargets")]
        getter scalable_targets : Array(Types::ScalableTarget)?

        def initialize(
          @next_token : String? = nil,
          @scalable_targets : Array(Types::ScalableTarget)? = nil
        )
        end
      end


      struct DescribeScalingActivitiesRequest
        include JSON::Serializable

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # Specifies whether to include activities that aren't scaled ( not scaled activities ) in the
        # response. Not scaled activities are activities that aren't completed or started for various reasons,
        # such as preventing infinite scaling loops. For help interpreting the not scaled reason details in
        # the response, see Scaling activities for Application Auto Scaling .

        @[JSON::Field(key: "IncludeNotScaledActivities")]
        getter include_not_scaled_activities : Bool?

        # The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.
        # If this parameter is used, the operation returns up to MaxResults results at a time, along with a
        # NextToken value. To get the next set of results, include the NextToken value in a subsequent call.
        # If this parameter is not used, the operation returns up to 50 results and a NextToken value, if
        # applicable.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the resource associated with the scaling activity. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. If you specify a scalable dimension, you must also specify a resource ID.
        # ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String?

        def initialize(
          @service_namespace : String,
          @include_not_scaled_activities : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_id : String? = nil,
          @scalable_dimension : String? = nil
        )
        end
      end


      struct DescribeScalingActivitiesResponse
        include JSON::Serializable

        # The token required to get the next set of results. This value is null if there are no more results
        # to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of scaling activity objects.

        @[JSON::Field(key: "ScalingActivities")]
        getter scaling_activities : Array(Types::ScalingActivity)?

        def initialize(
          @next_token : String? = nil,
          @scaling_activities : Array(Types::ScalingActivity)? = nil
        )
        end
      end


      struct DescribeScalingPoliciesRequest
        include JSON::Serializable

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The maximum number of scalable targets. This value can be between 1 and 10. The default value is 10.
        # If this parameter is used, the operation returns up to MaxResults results at a time, along with a
        # NextToken value. To get the next set of results, include the NextToken value in a subsequent call.
        # If this parameter is not used, the operation returns up to 10 results and a NextToken value, if
        # applicable.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of the scaling policies to describe.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)?

        # The identifier of the resource associated with the scaling policy. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. If you specify a scalable dimension, you must also specify a resource ID.
        # ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String?

        def initialize(
          @service_namespace : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @policy_names : Array(String)? = nil,
          @resource_id : String? = nil,
          @scalable_dimension : String? = nil
        )
        end
      end


      struct DescribeScalingPoliciesResponse
        include JSON::Serializable

        # The token required to get the next set of results. This value is null if there are no more results
        # to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the scaling policies.

        @[JSON::Field(key: "ScalingPolicies")]
        getter scaling_policies : Array(Types::ScalingPolicy)?

        def initialize(
          @next_token : String? = nil,
          @scaling_policies : Array(Types::ScalingPolicy)? = nil
        )
        end
      end


      struct DescribeScheduledActionsRequest
        include JSON::Serializable

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The maximum number of scheduled action results. This value can be between 1 and 50. The default
        # value is 50. If this parameter is used, the operation returns up to MaxResults results at a time,
        # along with a NextToken value. To get the next set of results, include the NextToken value in a
        # subsequent call. If this parameter is not used, the operation returns up to 50 results and a
        # NextToken value, if applicable.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the resource associated with the scheduled action. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. If you specify a scalable dimension, you must also specify a resource ID.
        # ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String?

        # The names of the scheduled actions to describe.

        @[JSON::Field(key: "ScheduledActionNames")]
        getter scheduled_action_names : Array(String)?

        def initialize(
          @service_namespace : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_id : String? = nil,
          @scalable_dimension : String? = nil,
          @scheduled_action_names : Array(String)? = nil
        )
        end
      end


      struct DescribeScheduledActionsResponse
        include JSON::Serializable

        # The token required to get the next set of results. This value is null if there are no more results
        # to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the scheduled actions.

        @[JSON::Field(key: "ScheduledActions")]
        getter scheduled_actions : Array(Types::ScheduledAction)?

        def initialize(
          @next_token : String? = nil,
          @scheduled_actions : Array(Types::ScheduledAction)? = nil
        )
        end
      end

      # Failed access to resources caused an exception. This exception is thrown when Application Auto
      # Scaling is unable to retrieve the alarms associated with a scaling policy due to a client error, for
      # example, if the role ARN specified for a scalable target does not have permission to call the
      # CloudWatch DescribeAlarms on your behalf.

      struct FailedResourceAccessException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetPredictiveScalingForecastRequest
        include JSON::Serializable

        # The exclusive end time of the time range for the forecast data to get. The maximum time duration
        # between the start and end time is 30 days.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The identifier of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The inclusive start time of the time range for the forecast data to get. At most, the date and time
        # can be one year before the current date and time

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @policy_name : String,
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String,
          @start_time : Time
        )
        end
      end


      struct GetPredictiveScalingForecastResponse
        include JSON::Serializable

        # The capacity forecast.

        @[JSON::Field(key: "CapacityForecast")]
        getter capacity_forecast : Types::CapacityForecast?

        # The load forecast.

        @[JSON::Field(key: "LoadForecast")]
        getter load_forecast : Array(Types::LoadForecast)?

        # The time the forecast was made.

        @[JSON::Field(key: "UpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_time : Time?

        def initialize(
          @capacity_forecast : Types::CapacityForecast? = nil,
          @load_forecast : Array(Types::LoadForecast)? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # The service encountered an internal error.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The next token supplied was invalid.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A per-account resource limit is exceeded. For more information, see Application Auto Scaling service
      # quotas .

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Specify the ARN of the scalable target. For example:
        # arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123
        # To get the ARN for a scalable target, use DescribeScalableTargets .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags. Each tag consists of a tag key and a tag value.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A GetPredictiveScalingForecast call returns the load forecast for a predictive scaling policy. This
      # structure includes the data points for that load forecast, along with the timestamps of those data
      # points and the metric specification.

      struct LoadForecast
        include JSON::Serializable

        # The metric specification for the load forecast.

        @[JSON::Field(key: "MetricSpecification")]
        getter metric_specification : Types::PredictiveScalingMetricSpecification

        # The timestamps for the data points, in UTC format.

        @[JSON::Field(key: "Timestamps")]
        getter timestamps : Array(Time)

        # The values of the data points.

        @[JSON::Field(key: "Values")]
        getter values : Array(Float64)

        def initialize(
          @metric_specification : Types::PredictiveScalingMetricSpecification,
          @timestamps : Array(Time),
          @values : Array(Float64)
        )
        end
      end

      # Describes the dimension names and values associated with a metric.

      struct MetricDimension
        include JSON::Serializable

        # The name of the dimension.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the dimension.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Describes the reason for an activity that isn't scaled ( not scaled activity ), in machine-readable
      # format. For help interpreting the not scaled reason details, see Scaling activities for Application
      # Auto Scaling in the Application Auto Scaling User Guide .

      struct NotScaledReason
        include JSON::Serializable

        # A code that represents the reason for not scaling. Valid values: AutoScalingAnticipatedFlapping
        # TargetServicePutResourceAsUnscalable AlreadyAtMaxCapacity AlreadyAtMinCapacity
        # AlreadyAtDesiredCapacity

        @[JSON::Field(key: "Code")]
        getter code : String

        # The current capacity.

        @[JSON::Field(key: "CurrentCapacity")]
        getter current_capacity : Int32?

        # The maximum capacity.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The minimum capacity.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Int32?

        def initialize(
          @code : String,
          @current_capacity : Int32? = nil,
          @max_capacity : Int32? = nil,
          @min_capacity : Int32? = nil
        )
        end
      end

      # The specified object could not be found. For any operation that depends on the existence of a
      # scalable target, this exception is thrown if the scalable target with the specified service
      # namespace, resource ID, and scalable dimension does not exist. For any operation that deletes or
      # deregisters a resource, this exception is thrown if the resource cannot be found.

      struct ObjectNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a predefined metric for a target tracking scaling policy to use with Application Auto
      # Scaling. For more information, Predefined metrics for target tracking scaling policies in the
      # Application Auto Scaling User Guide .

      struct PredefinedMetricSpecification
        include JSON::Serializable

        # The metric type. The ALBRequestCountPerTarget metric type applies only to Spot Fleets and ECS
        # services.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # Identifies the resource associated with the metric type. You can't specify a resource label unless
        # the metric type is ALBRequestCountPerTarget and there is a target group attached to the Spot Fleet
        # or ECS service. You create the resource label by appending the final portion of the load balancer
        # ARN and the final portion of the target group ARN into a single value, separated by a forward slash
        # (/). The format of the resource label is:
        # app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff . Where:
        # app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer
        # ARN targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target
        # group ARN. To find the ARN for an Application Load Balancer, use the DescribeLoadBalancers API
        # operation. To find the ARN for the target group, use the DescribeTargetGroups API operation.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Represents a CloudWatch metric of your choosing for a predictive scaling policy.

      struct PredictiveScalingCustomizedMetricSpecification
        include JSON::Serializable

        # One or more metric data queries to provide data points for a metric specification.

        @[JSON::Field(key: "MetricDataQueries")]
        getter metric_data_queries : Array(Types::PredictiveScalingMetricDataQuery)

        def initialize(
          @metric_data_queries : Array(Types::PredictiveScalingMetricDataQuery)
        )
        end
      end

      # Describes the scaling metric.

      struct PredictiveScalingMetric
        include JSON::Serializable

        # Describes the dimensions of the metric.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::PredictiveScalingMetricDimension)?

        # The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The namespace of the metric.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        def initialize(
          @dimensions : Array(Types::PredictiveScalingMetricDimension)? = nil,
          @metric_name : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # The metric data to return. Also defines whether this call is returning data for one metric only, or
      # whether it is performing a math expression on the values of returned metric statistics to create a
      # new time series. A time series is a series of data points, each of which is associated with a
      # timestamp.

      struct PredictiveScalingMetricDataQuery
        include JSON::Serializable

        # A short name that identifies the object's results in the response. This name must be unique among
        # all MetricDataQuery objects specified for a single scaling policy. If you are performing math
        # expressions on this set of data, this name represents that data and can serve as a variable in the
        # mathematical expression. The valid characters are letters, numbers, and underscores. The first
        # character must be a lowercase letter.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The math expression to perform on the returned data, if this object is performing a math expression.
        # This expression can use the Id of the other metrics to refer to those metrics, and can also use the
        # Id of other expressions to use the result of those expressions. Conditional: Within each
        # MetricDataQuery object, you must specify either Expression or MetricStat , but not both.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # A human-readable label for this metric or expression. This is especially useful if this is a math
        # expression, so that you know what the value represents.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # Information about the metric data to return. Conditional: Within each MetricDataQuery object, you
        # must specify either Expression or MetricStat , but not both.

        @[JSON::Field(key: "MetricStat")]
        getter metric_stat : Types::PredictiveScalingMetricStat?

        # Indicates whether to return the timestamps and raw data values of this metric. If you use any math
        # expressions, specify true for this value for only the final math expression that the metric
        # specification is based on. You must specify false for ReturnData for all the other metrics and
        # expressions used in the metric specification. If you are only retrieving metrics and not performing
        # any math expressions, do not specify anything for ReturnData . This sets it to its default ( true ).

        @[JSON::Field(key: "ReturnData")]
        getter return_data : Bool?

        def initialize(
          @id : String,
          @expression : String? = nil,
          @label : String? = nil,
          @metric_stat : Types::PredictiveScalingMetricStat? = nil,
          @return_data : Bool? = nil
        )
        end
      end

      # Describes the dimension of a metric.

      struct PredictiveScalingMetricDimension
        include JSON::Serializable

        # The name of the dimension.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the dimension.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # This structure specifies the metrics and target utilization settings for a predictive scaling
      # policy. You must specify either a metric pair, or a load metric and a scaling metric individually.
      # Specifying a metric pair instead of individual metrics provides a simpler way to configure metrics
      # for a scaling policy. You choose the metric pair, and the policy automatically knows the correct sum
      # and average statistics to use for the load metric and the scaling metric.

      struct PredictiveScalingMetricSpecification
        include JSON::Serializable

        # Specifies the target utilization.

        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        # The customized capacity metric specification.

        @[JSON::Field(key: "CustomizedCapacityMetricSpecification")]
        getter customized_capacity_metric_specification : Types::PredictiveScalingCustomizedMetricSpecification?

        # The customized load metric specification.

        @[JSON::Field(key: "CustomizedLoadMetricSpecification")]
        getter customized_load_metric_specification : Types::PredictiveScalingCustomizedMetricSpecification?

        # The customized scaling metric specification.

        @[JSON::Field(key: "CustomizedScalingMetricSpecification")]
        getter customized_scaling_metric_specification : Types::PredictiveScalingCustomizedMetricSpecification?

        # The predefined load metric specification.

        @[JSON::Field(key: "PredefinedLoadMetricSpecification")]
        getter predefined_load_metric_specification : Types::PredictiveScalingPredefinedLoadMetricSpecification?

        # The predefined metric pair specification that determines the appropriate scaling metric and load
        # metric to use.

        @[JSON::Field(key: "PredefinedMetricPairSpecification")]
        getter predefined_metric_pair_specification : Types::PredictiveScalingPredefinedMetricPairSpecification?

        # The predefined scaling metric specification.

        @[JSON::Field(key: "PredefinedScalingMetricSpecification")]
        getter predefined_scaling_metric_specification : Types::PredictiveScalingPredefinedScalingMetricSpecification?

        def initialize(
          @target_value : Float64,
          @customized_capacity_metric_specification : Types::PredictiveScalingCustomizedMetricSpecification? = nil,
          @customized_load_metric_specification : Types::PredictiveScalingCustomizedMetricSpecification? = nil,
          @customized_scaling_metric_specification : Types::PredictiveScalingCustomizedMetricSpecification? = nil,
          @predefined_load_metric_specification : Types::PredictiveScalingPredefinedLoadMetricSpecification? = nil,
          @predefined_metric_pair_specification : Types::PredictiveScalingPredefinedMetricPairSpecification? = nil,
          @predefined_scaling_metric_specification : Types::PredictiveScalingPredefinedScalingMetricSpecification? = nil
        )
        end
      end

      # This structure defines the CloudWatch metric to return, along with the statistic and unit.

      struct PredictiveScalingMetricStat
        include JSON::Serializable

        # The CloudWatch metric to return, including the metric name, namespace, and dimensions. To get the
        # exact metric name, namespace, and dimensions, inspect the Metric object that is returned by a call
        # to ListMetrics .

        @[JSON::Field(key: "Metric")]
        getter metric : Types::PredictiveScalingMetric

        # The statistic to return. It can include any CloudWatch statistic or extended statistic. For a list
        # of valid values, see the table in Statistics in the Amazon CloudWatch User Guide . The most commonly
        # used metrics for predictive scaling are Average and Sum .

        @[JSON::Field(key: "Stat")]
        getter stat : String

        # The unit to use for the returned data points. For a complete list of the units that CloudWatch
        # supports, see the MetricDatum data type in the Amazon CloudWatch API Reference .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric : Types::PredictiveScalingMetric,
          @stat : String,
          @unit : String? = nil
        )
        end
      end

      # Represents a predictive scaling policy configuration. Predictive scaling is supported on Amazon ECS
      # services.

      struct PredictiveScalingPolicyConfiguration
        include JSON::Serializable

        # This structure includes the metrics and target utilization to use for predictive scaling. This is an
        # array, but we currently only support a single metric specification. That is, you can specify a
        # target value and a single metric pair, or a target value and one scaling metric and one load metric.

        @[JSON::Field(key: "MetricSpecifications")]
        getter metric_specifications : Array(Types::PredictiveScalingMetricSpecification)

        # Defines the behavior that should be applied if the forecast capacity approaches or exceeds the
        # maximum capacity. Defaults to HonorMaxCapacity if not specified.

        @[JSON::Field(key: "MaxCapacityBreachBehavior")]
        getter max_capacity_breach_behavior : String?

        # The size of the capacity buffer to use when the forecast capacity is close to or exceeds the maximum
        # capacity. The value is specified as a percentage relative to the forecast capacity. For example, if
        # the buffer is 10, this means a 10 percent buffer, such that if the forecast capacity is 50, and the
        # maximum capacity is 40, then the effective maximum capacity is 55. Required if the
        # MaxCapacityBreachBehavior property is set to IncreaseMaxCapacity , and cannot be used otherwise.

        @[JSON::Field(key: "MaxCapacityBuffer")]
        getter max_capacity_buffer : Int32?

        # The predictive scaling mode. Defaults to ForecastOnly if not specified.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The amount of time, in seconds, that the start time can be advanced. The value must be less than the
        # forecast interval duration of 3600 seconds (60 minutes). Defaults to 300 seconds if not specified.

        @[JSON::Field(key: "SchedulingBufferTime")]
        getter scheduling_buffer_time : Int32?

        def initialize(
          @metric_specifications : Array(Types::PredictiveScalingMetricSpecification),
          @max_capacity_breach_behavior : String? = nil,
          @max_capacity_buffer : Int32? = nil,
          @mode : String? = nil,
          @scheduling_buffer_time : Int32? = nil
        )
        end
      end

      # Describes a load metric for a predictive scaling policy. When returned in the output of
      # DescribePolicies , it indicates that a predictive scaling policy uses individually specified load
      # and scaling metrics instead of a metric pair. The following predefined metrics are available for
      # predictive scaling: ECSServiceAverageCPUUtilization ECSServiceAverageMemoryUtilization
      # ECSServiceCPUUtilization ECSServiceMemoryUtilization ECSServiceTotalCPUUtilization
      # ECSServiceTotalMemoryUtilization ALBRequestCount ALBRequestCountPerTarget TotalALBRequestCount

      struct PredictiveScalingPredefinedLoadMetricSpecification
        include JSON::Serializable

        # The metric type.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # A label that uniquely identifies a target group.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Represents a metric pair for a predictive scaling policy. The following predefined metrics are
      # available for predictive scaling: ECSServiceAverageCPUUtilization ECSServiceAverageMemoryUtilization
      # ECSServiceCPUUtilization ECSServiceMemoryUtilization ECSServiceTotalCPUUtilization
      # ECSServiceTotalMemoryUtilization ALBRequestCount ALBRequestCountPerTarget TotalALBRequestCount

      struct PredictiveScalingPredefinedMetricPairSpecification
        include JSON::Serializable

        # Indicates which metrics to use. There are two different types of metrics for each metric type: one
        # is a load metric and one is a scaling metric.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # A label that uniquely identifies a specific target group from which to determine the total and
        # average request count.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end

      # Describes a scaling metric for a predictive scaling policy. When returned in the output of
      # DescribePolicies , it indicates that a predictive scaling policy uses individually specified load
      # and scaling metrics instead of a metric pair. The following predefined metrics are available for
      # predictive scaling: ECSServiceAverageCPUUtilization ECSServiceAverageMemoryUtilization
      # ECSServiceCPUUtilization ECSServiceMemoryUtilization ECSServiceTotalCPUUtilization
      # ECSServiceTotalMemoryUtilization ALBRequestCount ALBRequestCountPerTarget TotalALBRequestCount

      struct PredictiveScalingPredefinedScalingMetricSpecification
        include JSON::Serializable

        # The metric type.

        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # A label that uniquely identifies a specific target group from which to determine the average request
        # count.

        @[JSON::Field(key: "ResourceLabel")]
        getter resource_label : String?

        def initialize(
          @predefined_metric_type : String,
          @resource_label : String? = nil
        )
        end
      end


      struct PutScalingPolicyRequest
        include JSON::Serializable

        # The name of the scaling policy. You cannot change the name of a scaling policy, but you can delete
        # the original scaling policy and create a new scaling policy with the same settings and a different
        # name.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The identifier of the resource associated with the scaling policy. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The scaling policy type. This parameter is required if you are creating a scaling policy. The
        # following policy types are supported: TargetTrackingScaling —Not supported for Amazon EMR.
        # StepScaling —Not supported for DynamoDB, Amazon Comprehend, Lambda, Amazon Keyspaces, Amazon MSK,
        # Amazon ElastiCache, or Neptune. PredictiveScaling —Only supported for Amazon ECS. For more
        # information, see Target tracking scaling policies , Step scaling policies , and Predictive scaling
        # policies in the Application Auto Scaling User Guide .

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # The configuration of the predictive scaling policy.

        @[JSON::Field(key: "PredictiveScalingPolicyConfiguration")]
        getter predictive_scaling_policy_configuration : Types::PredictiveScalingPolicyConfiguration?

        # A step scaling policy. This parameter is required if you are creating a policy and the policy type
        # is StepScaling .

        @[JSON::Field(key: "StepScalingPolicyConfiguration")]
        getter step_scaling_policy_configuration : Types::StepScalingPolicyConfiguration?

        # A target tracking scaling policy. Includes support for predefined or customized metrics. This
        # parameter is required if you are creating a policy and the policy type is TargetTrackingScaling .

        @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
        getter target_tracking_scaling_policy_configuration : Types::TargetTrackingScalingPolicyConfiguration?

        def initialize(
          @policy_name : String,
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String,
          @policy_type : String? = nil,
          @predictive_scaling_policy_configuration : Types::PredictiveScalingPolicyConfiguration? = nil,
          @step_scaling_policy_configuration : Types::StepScalingPolicyConfiguration? = nil,
          @target_tracking_scaling_policy_configuration : Types::TargetTrackingScalingPolicyConfiguration? = nil
        )
        end
      end


      struct PutScalingPolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resulting scaling policy.

        @[JSON::Field(key: "PolicyARN")]
        getter policy_arn : String

        # The CloudWatch alarms created for the target tracking scaling policy.

        @[JSON::Field(key: "Alarms")]
        getter alarms : Array(Types::Alarm)?

        def initialize(
          @policy_arn : String,
          @alarms : Array(Types::Alarm)? = nil
        )
        end
      end


      struct PutScheduledActionRequest
        include JSON::Serializable

        # The identifier of the resource associated with the scheduled action. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The name of the scheduled action. This name must be unique among all other scheduled actions on the
        # specified scalable target.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The date and time for the recurring schedule to end, in UTC.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The new minimum and maximum capacity. You can set both values or just one. At the scheduled time, if
        # the current capacity is below the minimum capacity, Application Auto Scaling scales out to the
        # minimum capacity. If the current capacity is above the maximum capacity, Application Auto Scaling
        # scales in to the maximum capacity.

        @[JSON::Field(key: "ScalableTargetAction")]
        getter scalable_target_action : Types::ScalableTargetAction?

        # The schedule for this action. The following formats are supported: At expressions - " at( yyyy - mm
        # - dd T hh : mm : ss ) " Rate expressions - " rate( value unit ) " Cron expressions - " cron( fields
        # ) " At expressions are useful for one-time schedules. Cron expressions are useful for scheduled
        # actions that run periodically at a specified date and time, and rate expressions are useful for
        # scheduled actions that run at a regular interval. At and cron expressions use Universal Coordinated
        # Time (UTC) by default. The cron format consists of six fields separated by white spaces: [Minutes]
        # [Hours] [Day_of_Month] [Month] [Day_of_Week] [Year]. For rate expressions, value is a positive
        # integer and unit is minute | minutes | hour | hours | day | days . For more information, see
        # Schedule recurring scaling actions using cron expressions in the Application Auto Scaling User Guide
        # .

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The date and time for this scheduled action to start, in UTC.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Specifies the time zone used when setting a scheduled action by using an at or cron expression. If a
        # time zone is not provided, UTC is used by default. Valid values are the canonical names of the IANA
        # time zones supported by Joda-Time (such as Etc/GMT+9 or Pacific/Tahiti ). For more information, see
        # https://www.joda.org/joda-time/timezones.html .

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @resource_id : String,
          @scalable_dimension : String,
          @scheduled_action_name : String,
          @service_namespace : String,
          @end_time : Time? = nil,
          @scalable_target_action : Types::ScalableTargetAction? = nil,
          @schedule : String? = nil,
          @start_time : Time? = nil,
          @timezone : String? = nil
        )
        end
      end


      struct PutScheduledActionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RegisterScalableTargetRequest
        include JSON::Serializable

        # The identifier of the resource that is associated with the scalable target. This string consists of
        # the resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension associated with the scalable target. This string consists of the service
        # namespace, resource type, and scaling property. ecs:service:DesiredCount - The task count of an ECS
        # service. elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource. For a resource provided
        # by your own application or service, use custom-resource instead.

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The maximum value that you plan to scale out to. When a scaling policy is in effect, Application
        # Auto Scaling can scale out (expand) as needed to the maximum capacity limit in response to changing
        # demand. This property is required when registering a new scalable target. Although you can specify a
        # large maximum capacity, note that service quotas might impose lower limits. Each service has its own
        # default quotas for the maximum capacity of the resource. If you want to specify a higher limit, you
        # can request an increase. For more information, consult the documentation for that service. For
        # information about the default quotas for each service, see Service endpoints and quotas in the
        # Amazon Web Services General Reference .

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The minimum value that you plan to scale in to. When a scaling policy is in effect, Application Auto
        # Scaling can scale in (contract) as needed to the minimum capacity limit in response to changing
        # demand. This property is required when registering a new scalable target. For the following
        # resources, the minimum value allowed is 0. AppStream 2.0 fleets Aurora DB clusters ECS services EMR
        # clusters Lambda provisioned concurrency SageMaker endpoint variants SageMaker inference components
        # SageMaker serverless endpoint provisioned concurrency Spot Fleets custom resources It's strongly
        # recommended that you specify a value greater than 0. A value greater than 0 means that data points
        # are continuously reported to CloudWatch that scaling policies can use to scale on a metric like
        # average CPU utilization. For all other resources, the minimum allowed value depends on the type of
        # resource that you are using. If you provide a value that is lower than what a resource can accept,
        # an error occurs. In which case, the error message will provide the minimum value that the resource
        # can accept.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Int32?

        # This parameter is required for services that do not support service-linked roles (such as Amazon
        # EMR), and it must specify the ARN of an IAM role that allows Application Auto Scaling to modify the
        # scalable target on your behalf. If the service supports service-linked roles, Application Auto
        # Scaling uses a service-linked role, which it creates if it does not yet exist. For more information,
        # see How Application Auto Scaling works with IAM .

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # An embedded object that contains attributes and attribute values that are used to suspend and resume
        # automatic scaling. Setting the value of an attribute to true suspends the specified scaling
        # activities. Setting it to false (default) resumes the specified scaling activities. Suspension
        # Outcomes For DynamicScalingInSuspended , while a suspension is in effect, all scale-in activities
        # that are triggered by a scaling policy are suspended. For DynamicScalingOutSuspended , while a
        # suspension is in effect, all scale-out activities that are triggered by a scaling policy are
        # suspended. For ScheduledScalingSuspended , while a suspension is in effect, all scaling activities
        # that involve scheduled actions are suspended. For more information, see Suspend and resume scaling
        # in the Application Auto Scaling User Guide .

        @[JSON::Field(key: "SuspendedState")]
        getter suspended_state : Types::SuspendedState?

        # Assigns one or more tags to the scalable target. Use this parameter to tag the scalable target when
        # it is created. To tag an existing scalable target, use the TagResource operation. Each tag consists
        # of a tag key and a tag value. Both the tag key and the tag value are required. You cannot have more
        # than one tag on a scalable target with the same tag key. Use tags to control access to a scalable
        # target. For more information, see Tagging support for Application Auto Scaling in the Application
        # Auto Scaling User Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String,
          @max_capacity : Int32? = nil,
          @min_capacity : Int32? = nil,
          @role_arn : String? = nil,
          @suspended_state : Types::SuspendedState? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterScalableTargetResponse
        include JSON::Serializable

        # The ARN of the scalable target.

        @[JSON::Field(key: "ScalableTargetARN")]
        getter scalable_target_arn : String?

        def initialize(
          @scalable_target_arn : String? = nil
        )
        end
      end

      # The specified resource doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the Application Auto Scaling resource. This value is an Amazon Resource Name (ARN).

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Represents a scalable target.

      struct ScalableTarget
        include JSON::Serializable

        # The Unix timestamp for when the scalable target was created.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The maximum value to scale to in response to a scale-out activity.

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32

        # The minimum value to scale to in response to a scale-in activity.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Int32

        # The identifier of the resource associated with the scalable target. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The ARN of an IAM role that allows Application Auto Scaling to modify the scalable target on your
        # behalf.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The scalable dimension associated with the scalable target. This string consists of the service
        # namespace, resource type, and scaling property. ecs:service:DesiredCount - The task count of an ECS
        # service. elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource, or a custom-resource .

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The predicted capacity of the scalable target.

        @[JSON::Field(key: "PredictedCapacity")]
        getter predicted_capacity : Int32?

        # The ARN of the scalable target.

        @[JSON::Field(key: "ScalableTargetARN")]
        getter scalable_target_arn : String?

        # Specifies whether the scaling activities for a scalable target are in a suspended state.

        @[JSON::Field(key: "SuspendedState")]
        getter suspended_state : Types::SuspendedState?

        def initialize(
          @creation_time : Time,
          @max_capacity : Int32,
          @min_capacity : Int32,
          @resource_id : String,
          @role_arn : String,
          @scalable_dimension : String,
          @service_namespace : String,
          @predicted_capacity : Int32? = nil,
          @scalable_target_arn : String? = nil,
          @suspended_state : Types::SuspendedState? = nil
        )
        end
      end

      # Represents the minimum and maximum capacity for a scheduled action.

      struct ScalableTargetAction
        include JSON::Serializable

        # The maximum capacity. Although you can specify a large maximum capacity, note that service quotas
        # may impose lower limits. Each service has its own default quotas for the maximum capacity of the
        # resource. If you want to specify a higher limit, you can request an increase. For more information,
        # consult the documentation for that service. For information about the default quotas for each
        # service, see Service endpoints and quotas in the Amazon Web Services General Reference .

        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The minimum capacity. When the scheduled action runs, the resource will have at least this much
        # capacity, but it might have more depending on other settings, such as the target utilization level
        # of a target tracking scaling policy.

        @[JSON::Field(key: "MinCapacity")]
        getter min_capacity : Int32?

        def initialize(
          @max_capacity : Int32? = nil,
          @min_capacity : Int32? = nil
        )
        end
      end

      # Represents a scaling activity.

      struct ScalingActivity
        include JSON::Serializable

        # The unique identifier of the scaling activity.

        @[JSON::Field(key: "ActivityId")]
        getter activity_id : String

        # A simple description of what caused the scaling activity to happen.

        @[JSON::Field(key: "Cause")]
        getter cause : String

        # A simple description of what action the scaling activity intends to accomplish.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The identifier of the resource associated with the scaling activity. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource, or a custom-resource .

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The Unix timestamp for when the scaling activity began.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # Indicates the status of the scaling activity.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String

        # The details about the scaling activity.

        @[JSON::Field(key: "Details")]
        getter details : String?

        # The Unix timestamp for when the scaling activity ended.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Machine-readable data that describes the reason for a not scaled activity. Only available when
        # DescribeScalingActivities includes not scaled activities.

        @[JSON::Field(key: "NotScaledReasons")]
        getter not_scaled_reasons : Array(Types::NotScaledReason)?

        # A simple message about the current status of the scaling activity.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @activity_id : String,
          @cause : String,
          @description : String,
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String,
          @start_time : Time,
          @status_code : String,
          @details : String? = nil,
          @end_time : Time? = nil,
          @not_scaled_reasons : Array(Types::NotScaledReason)? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Represents a scaling policy to use with Application Auto Scaling. For more information about
      # configuring scaling policies for a specific service, see Amazon Web Services services that you can
      # use with Application Auto Scaling in the Application Auto Scaling User Guide .

      struct ScalingPolicy
        include JSON::Serializable

        # The Unix timestamp for when the scaling policy was created.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the scaling policy.

        @[JSON::Field(key: "PolicyARN")]
        getter policy_arn : String

        # The name of the scaling policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The scaling policy type. The following policy types are supported: TargetTrackingScaling —Not
        # supported for Amazon EMR StepScaling —Not supported for DynamoDB, Amazon Comprehend, Lambda, Amazon
        # Keyspaces, Amazon MSK, Amazon ElastiCache, or Neptune. PredictiveScaling —Only supported for Amazon
        # ECS

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # The identifier of the resource associated with the scaling policy. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String

        # The namespace of the Amazon Web Services service that provides the resource, or a custom-resource .

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The CloudWatch alarms associated with the scaling policy.

        @[JSON::Field(key: "Alarms")]
        getter alarms : Array(Types::Alarm)?

        # The predictive scaling policy configuration.

        @[JSON::Field(key: "PredictiveScalingPolicyConfiguration")]
        getter predictive_scaling_policy_configuration : Types::PredictiveScalingPolicyConfiguration?

        # A step scaling policy.

        @[JSON::Field(key: "StepScalingPolicyConfiguration")]
        getter step_scaling_policy_configuration : Types::StepScalingPolicyConfiguration?

        # A target tracking scaling policy.

        @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
        getter target_tracking_scaling_policy_configuration : Types::TargetTrackingScalingPolicyConfiguration?

        def initialize(
          @creation_time : Time,
          @policy_arn : String,
          @policy_name : String,
          @policy_type : String,
          @resource_id : String,
          @scalable_dimension : String,
          @service_namespace : String,
          @alarms : Array(Types::Alarm)? = nil,
          @predictive_scaling_policy_configuration : Types::PredictiveScalingPolicyConfiguration? = nil,
          @step_scaling_policy_configuration : Types::StepScalingPolicyConfiguration? = nil,
          @target_tracking_scaling_policy_configuration : Types::TargetTrackingScalingPolicyConfiguration? = nil
        )
        end
      end

      # Represents a scheduled action.

      struct ScheduledAction
        include JSON::Serializable

        # The date and time that the scheduled action was created.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The identifier of the resource associated with the scaling policy. This string consists of the
        # resource type and unique identifier. ECS service - The resource type is service and the unique
        # identifier is the cluster name and service name. Example: service/my-cluster/my-service . Spot Fleet
        # - The resource type is spot-fleet-request and the unique identifier is the Spot Fleet request ID.
        # Example: spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE . EMR cluster - The resource
        # type is instancegroup and the unique identifier is the cluster ID and instance group ID. Example:
        # instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0 . AppStream 2.0 fleet - The resource type is fleet
        # and the unique identifier is the fleet name. Example: fleet/sample-fleet . DynamoDB table - The
        # resource type is table and the unique identifier is the table name. Example: table/my-table .
        # DynamoDB global secondary index - The resource type is index and the unique identifier is the index
        # name. Example: table/my-table/index/my-table-index . Aurora DB cluster - The resource type is
        # cluster and the unique identifier is the cluster name. Example: cluster:my-db-cluster . SageMaker
        # endpoint variant - The resource type is variant and the unique identifier is the resource ID.
        # Example: endpoint/my-end-point/variant/KMeansClustering . Custom resources are not supported with a
        # resource type. This parameter must specify the OutputValue from the CloudFormation template stack
        # used to access the resources. The unique identifier is defined by the service provider. More
        # information is available in our GitHub repository . Amazon Comprehend document classification
        # endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example:
        # arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE . Amazon Comprehend
        # entity recognizer endpoint - The resource type and unique identifier are specified using the
        # endpoint ARN. Example: arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE
        # . Lambda provisioned concurrency - The resource type is function and the unique identifier is the
        # function name with a function version or alias name suffix that is not $LATEST . Example:
        # function:my-function:prod or function:my-function:1 . Amazon Keyspaces table - The resource type is
        # table and the unique identifier is the table name. Example: keyspace/mykeyspace/table/mytable .
        # Amazon MSK cluster - The resource type and unique identifier are specified using the cluster ARN.
        # Example:
        # arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5 .
        # Amazon ElastiCache replication group - The resource type is replication-group and the unique
        # identifier is the replication group name. Example: replication-group/mycluster . Amazon ElastiCache
        # cache cluster - The resource type is cache-cluster and the unique identifier is the cache cluster
        # name. Example: cache-cluster/mycluster . Neptune cluster - The resource type is cluster and the
        # unique identifier is the cluster name. Example: cluster:mycluster . SageMaker serverless endpoint -
        # The resource type is variant and the unique identifier is the resource ID. Example:
        # endpoint/my-end-point/variant/KMeansClustering . SageMaker inference component - The resource type
        # is inference-component and the unique identifier is the resource ID. Example:
        # inference-component/my-inference-component . Pool of WorkSpaces - The resource type is
        # workspacespool and the unique identifier is the pool ID. Example: workspacespool/wspool-123456 .

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The schedule for this action. The following formats are supported: At expressions - " at( yyyy - mm
        # - dd T hh : mm : ss ) " Rate expressions - " rate( value unit ) " Cron expressions - " cron( fields
        # ) " At expressions are useful for one-time schedules. Cron expressions are useful for scheduled
        # actions that run periodically at a specified date and time, and rate expressions are useful for
        # scheduled actions that run at a regular interval. At and cron expressions use Universal Coordinated
        # Time (UTC) by default. The cron format consists of six fields separated by white spaces: [Minutes]
        # [Hours] [Day_of_Month] [Month] [Day_of_Week] [Year]. For rate expressions, value is a positive
        # integer and unit is minute | minutes | hour | hours | day | days . For more information, see
        # Schedule recurring scaling actions using cron expressions in the Application Auto Scaling User Guide
        # .

        @[JSON::Field(key: "Schedule")]
        getter schedule : String

        # The Amazon Resource Name (ARN) of the scheduled action.

        @[JSON::Field(key: "ScheduledActionARN")]
        getter scheduled_action_arn : String

        # The name of the scheduled action.

        @[JSON::Field(key: "ScheduledActionName")]
        getter scheduled_action_name : String

        # The namespace of the Amazon Web Services service that provides the resource, or a custom-resource .

        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The date and time that the action is scheduled to end, in UTC.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The scalable dimension. This string consists of the service namespace, resource type, and scaling
        # property. ecs:service:DesiredCount - The task count of an ECS service.
        # elasticmapreduce:instancegroup:InstanceCount - The instance count of an EMR Instance Group.
        # ec2:spot-fleet-request:TargetCapacity - The target capacity of a Spot Fleet.
        # appstream:fleet:DesiredCapacity - The capacity of an AppStream 2.0 fleet.
        # dynamodb:table:ReadCapacityUnits - The provisioned read capacity for a DynamoDB table.
        # dynamodb:table:WriteCapacityUnits - The provisioned write capacity for a DynamoDB table.
        # dynamodb:index:ReadCapacityUnits - The provisioned read capacity for a DynamoDB global secondary
        # index. dynamodb:index:WriteCapacityUnits - The provisioned write capacity for a DynamoDB global
        # secondary index. rds:cluster:ReadReplicaCount - The count of Aurora Replicas in an Aurora DB
        # cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.
        # sagemaker:variant:DesiredInstanceCount - The number of EC2 instances for a SageMaker model endpoint
        # variant. custom-resource:ResourceType:Property - The scalable dimension for a custom resource
        # provided by your own application or service.
        # comprehend:document-classifier-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend document classification endpoint.
        # comprehend:entity-recognizer-endpoint:DesiredInferenceUnits - The number of inference units for an
        # Amazon Comprehend entity recognizer endpoint. lambda:function:ProvisionedConcurrency - The
        # provisioned concurrency for a Lambda function. cassandra:table:ReadCapacityUnits - The provisioned
        # read capacity for an Amazon Keyspaces table. cassandra:table:WriteCapacityUnits - The provisioned
        # write capacity for an Amazon Keyspaces table. kafka:broker-storage:VolumeSize - The provisioned
        # volume size (in GiB) for brokers in an Amazon MSK cluster. elasticache:cache-cluster:Nodes - The
        # number of nodes for an Amazon ElastiCache cache cluster. elasticache:replication-group:NodeGroups -
        # The number of node groups for an Amazon ElastiCache replication group.
        # elasticache:replication-group:Replicas - The number of replicas per node group for an Amazon
        # ElastiCache replication group. neptune:cluster:ReadReplicaCount - The count of read replicas in an
        # Amazon Neptune DB cluster. sagemaker:variant:DesiredProvisionedConcurrency - The provisioned
        # concurrency for a SageMaker serverless endpoint. sagemaker:inference-component:DesiredCopyCount -
        # The number of copies across an endpoint for a SageMaker inference component.
        # workspaces:workspacespool:DesiredUserSessions - The number of user sessions for the WorkSpaces in
        # the pool.

        @[JSON::Field(key: "ScalableDimension")]
        getter scalable_dimension : String?

        # The new minimum and maximum capacity. You can set both values or just one. At the scheduled time, if
        # the current capacity is below the minimum capacity, Application Auto Scaling scales out to the
        # minimum capacity. If the current capacity is above the maximum capacity, Application Auto Scaling
        # scales in to the maximum capacity.

        @[JSON::Field(key: "ScalableTargetAction")]
        getter scalable_target_action : Types::ScalableTargetAction?

        # The date and time that the action is scheduled to begin, in UTC.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The time zone used when referring to the date and time of a scheduled action, when the scheduled
        # action uses an at or cron expression.

        @[JSON::Field(key: "Timezone")]
        getter timezone : String?

        def initialize(
          @creation_time : Time,
          @resource_id : String,
          @schedule : String,
          @scheduled_action_arn : String,
          @scheduled_action_name : String,
          @service_namespace : String,
          @end_time : Time? = nil,
          @scalable_dimension : String? = nil,
          @scalable_target_action : Types::ScalableTargetAction? = nil,
          @start_time : Time? = nil,
          @timezone : String? = nil
        )
        end
      end

      # Represents a step adjustment for a StepScalingPolicyConfiguration . Describes an adjustment based on
      # the difference between the value of the aggregated CloudWatch metric and the breach threshold that
      # you've defined for the alarm. For the following examples, suppose that you have an alarm with a
      # breach threshold of 50: To initiate the adjustment when the metric is greater than or equal to 50
      # and less than 60, specify a lower bound of 0 and an upper bound of 10 . To initiate the adjustment
      # when the metric is greater than 40 and less than or equal to 50, specify a lower bound of -10 and an
      # upper bound of 0 . There are a few rules for the step adjustments for your step policy: The ranges
      # of your step adjustments can't overlap or have a gap. At most one step adjustment can have a null
      # lower bound. If one step adjustment has a negative lower bound, then there must be a step adjustment
      # with a null lower bound. At most one step adjustment can have a null upper bound. If one step
      # adjustment has a positive upper bound, then there must be a step adjustment with a null upper bound.
      # The upper and lower bound can't be null in the same step adjustment.

      struct StepAdjustment
        include JSON::Serializable

        # The amount by which to scale, based on the specified adjustment type. A positive value adds to the
        # current capacity while a negative number removes from the current capacity. For exact capacity, you
        # must specify a non-negative value.

        @[JSON::Field(key: "ScalingAdjustment")]
        getter scaling_adjustment : Int32

        # The lower bound for the difference between the alarm threshold and the CloudWatch metric. If the
        # metric value is above the breach threshold, the lower bound is inclusive (the metric must be greater
        # than or equal to the threshold plus the lower bound). Otherwise, it's exclusive (the metric must be
        # greater than the threshold plus the lower bound). A null value indicates negative infinity.

        @[JSON::Field(key: "MetricIntervalLowerBound")]
        getter metric_interval_lower_bound : Float64?

        # The upper bound for the difference between the alarm threshold and the CloudWatch metric. If the
        # metric value is above the breach threshold, the upper bound is exclusive (the metric must be less
        # than the threshold plus the upper bound). Otherwise, it's inclusive (the metric must be less than or
        # equal to the threshold plus the upper bound). A null value indicates positive infinity. The upper
        # bound must be greater than the lower bound.

        @[JSON::Field(key: "MetricIntervalUpperBound")]
        getter metric_interval_upper_bound : Float64?

        def initialize(
          @scaling_adjustment : Int32,
          @metric_interval_lower_bound : Float64? = nil,
          @metric_interval_upper_bound : Float64? = nil
        )
        end
      end

      # Represents a step scaling policy configuration to use with Application Auto Scaling. For more
      # information, see Step scaling policies in the Application Auto Scaling User Guide .

      struct StepScalingPolicyConfiguration
        include JSON::Serializable

        # Specifies how the ScalingAdjustment value in a StepAdjustment is interpreted (for example, an
        # absolute number or a percentage). The valid values are ChangeInCapacity , ExactCapacity , and
        # PercentChangeInCapacity . AdjustmentType is required if you are adding a new step scaling policy
        # configuration.

        @[JSON::Field(key: "AdjustmentType")]
        getter adjustment_type : String?

        # The amount of time, in seconds, to wait for a previous scaling activity to take effect. If not
        # specified, the default value is 300. For more information, see Cooldown period in the Application
        # Auto Scaling User Guide .

        @[JSON::Field(key: "Cooldown")]
        getter cooldown : Int32?

        # The aggregation type for the CloudWatch metrics. Valid values are Minimum , Maximum , and Average .
        # If the aggregation type is null, the value is treated as Average .

        @[JSON::Field(key: "MetricAggregationType")]
        getter metric_aggregation_type : String?

        # The minimum value to scale by when the adjustment type is PercentChangeInCapacity . For example,
        # suppose that you create a step scaling policy to scale out an Amazon ECS service by 25 percent and
        # you specify a MinAdjustmentMagnitude of 2. If the service has 4 tasks and the scaling policy is
        # performed, 25 percent of 4 is 1. However, because you specified a MinAdjustmentMagnitude of 2,
        # Application Auto Scaling scales out the service by 2 tasks.

        @[JSON::Field(key: "MinAdjustmentMagnitude")]
        getter min_adjustment_magnitude : Int32?

        # A set of adjustments that enable you to scale based on the size of the alarm breach. At least one
        # step adjustment is required if you are adding a new step scaling policy configuration.

        @[JSON::Field(key: "StepAdjustments")]
        getter step_adjustments : Array(Types::StepAdjustment)?

        def initialize(
          @adjustment_type : String? = nil,
          @cooldown : Int32? = nil,
          @metric_aggregation_type : String? = nil,
          @min_adjustment_magnitude : Int32? = nil,
          @step_adjustments : Array(Types::StepAdjustment)? = nil
        )
        end
      end

      # Specifies whether the scaling activities for a scalable target are in a suspended state.

      struct SuspendedState
        include JSON::Serializable

        # Whether scale in by a target tracking scaling policy or a step scaling policy is suspended. Set the
        # value to true if you don't want Application Auto Scaling to remove capacity when a scaling policy is
        # triggered. The default is false .

        @[JSON::Field(key: "DynamicScalingInSuspended")]
        getter dynamic_scaling_in_suspended : Bool?

        # Whether scale out by a target tracking scaling policy or a step scaling policy is suspended. Set the
        # value to true if you don't want Application Auto Scaling to add capacity when a scaling policy is
        # triggered. The default is false .

        @[JSON::Field(key: "DynamicScalingOutSuspended")]
        getter dynamic_scaling_out_suspended : Bool?

        # Whether scheduled scaling is suspended. Set the value to true if you don't want Application Auto
        # Scaling to add or remove capacity by initiating scheduled actions. The default is false .

        @[JSON::Field(key: "ScheduledScalingSuspended")]
        getter scheduled_scaling_suspended : Bool?

        def initialize(
          @dynamic_scaling_in_suspended : Bool? = nil,
          @dynamic_scaling_out_suspended : Bool? = nil,
          @scheduled_scaling_suspended : Bool? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # Identifies the Application Auto Scaling scalable target that you want to apply tags to. For example:
        # arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123
        # To get the ARN for a scalable target, use DescribeScalableTargets .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tags assigned to the resource. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a tag key and a tag value. You cannot have more than one tag on an
        # Application Auto Scaling scalable target with the same tag key. If you specify an existing tag key
        # with a different tag value, Application Auto Scaling replaces the current tag value with the
        # specified one. For information about the rules that apply to tag keys and tag values, see
        # User-defined tag restrictions in the Amazon Web Services Billing User Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a specific metric. Metric is a property of the TargetTrackingMetricStat object.

      struct TargetTrackingMetric
        include JSON::Serializable

        # The dimensions for the metric. For the list of available dimensions, see the Amazon Web Services
        # documentation available from the table in Amazon Web Services services that publish CloudWatch
        # metrics in the Amazon CloudWatch User Guide . Conditional: If you published your metric with
        # dimensions, you must specify the same dimensions in your scaling policy.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::TargetTrackingMetricDimension)?

        # The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The namespace of the metric. For more information, see the table in Amazon Web Services services
        # that publish CloudWatch metrics in the Amazon CloudWatch User Guide .

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        def initialize(
          @dimensions : Array(Types::TargetTrackingMetricDimension)? = nil,
          @metric_name : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # The metric data to return. Also defines whether this call is returning data for one metric only, or
      # whether it is performing a math expression on the values of returned metric statistics to create a
      # new time series. A time series is a series of data points, each of which is associated with a
      # timestamp. For more information and examples, see Create a target tracking scaling policy for
      # Application Auto Scaling using metric math in the Application Auto Scaling User Guide .

      struct TargetTrackingMetricDataQuery
        include JSON::Serializable

        # A short name that identifies the object's results in the response. This name must be unique among
        # all MetricDataQuery objects specified for a single scaling policy. If you are performing math
        # expressions on this set of data, this name represents that data and can serve as a variable in the
        # mathematical expression. The valid characters are letters, numbers, and underscores. The first
        # character must be a lowercase letter.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The math expression to perform on the returned data, if this object is performing a math expression.
        # This expression can use the Id of the other metrics to refer to those metrics, and can also use the
        # Id of other expressions to use the result of those expressions. Conditional: Within each
        # TargetTrackingMetricDataQuery object, you must specify either Expression or MetricStat , but not
        # both.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # A human-readable label for this metric or expression. This is especially useful if this is a math
        # expression, so that you know what the value represents.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # Information about the metric data to return. Conditional: Within each MetricDataQuery object, you
        # must specify either Expression or MetricStat , but not both.

        @[JSON::Field(key: "MetricStat")]
        getter metric_stat : Types::TargetTrackingMetricStat?

        # Indicates whether to return the timestamps and raw data values of this metric. If you use any math
        # expressions, specify true for this value for only the final math expression that the metric
        # specification is based on. You must specify false for ReturnData for all the other metrics and
        # expressions used in the metric specification. If you are only retrieving metrics and not performing
        # any math expressions, do not specify anything for ReturnData . This sets it to its default ( true ).

        @[JSON::Field(key: "ReturnData")]
        getter return_data : Bool?

        def initialize(
          @id : String,
          @expression : String? = nil,
          @label : String? = nil,
          @metric_stat : Types::TargetTrackingMetricStat? = nil,
          @return_data : Bool? = nil
        )
        end
      end

      # Describes the dimension of a metric.

      struct TargetTrackingMetricDimension
        include JSON::Serializable

        # The name of the dimension.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the dimension.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # This structure defines the CloudWatch metric to return, along with the statistic and unit. For more
      # information about the CloudWatch terminology below, see Amazon CloudWatch concepts in the Amazon
      # CloudWatch User Guide .

      struct TargetTrackingMetricStat
        include JSON::Serializable

        # The CloudWatch metric to return, including the metric name, namespace, and dimensions. To get the
        # exact metric name, namespace, and dimensions, inspect the Metric object that is returned by a call
        # to ListMetrics .

        @[JSON::Field(key: "Metric")]
        getter metric : Types::TargetTrackingMetric

        # The statistic to return. It can include any CloudWatch statistic or extended statistic. For a list
        # of valid values, see the table in Statistics in the Amazon CloudWatch User Guide . The most commonly
        # used metric for scaling is Average .

        @[JSON::Field(key: "Stat")]
        getter stat : String

        # The unit to use for the returned data points. For a complete list of the units that CloudWatch
        # supports, see the MetricDatum data type in the Amazon CloudWatch API Reference .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric : Types::TargetTrackingMetric,
          @stat : String,
          @unit : String? = nil
        )
        end
      end

      # Represents a target tracking scaling policy configuration to use with Application Auto Scaling. For
      # more information, see Target tracking scaling policies in the Application Auto Scaling User Guide .

      struct TargetTrackingScalingPolicyConfiguration
        include JSON::Serializable

        # The target value for the metric. Although this property accepts numbers of type Double, it won't
        # accept values that are either too small or too large. Values must be in the range of -2^360 to
        # 2^360. The value must be a valid number based on the choice of metric. For example, if the metric is
        # CPU utilization, then the target value is a percent value that represents how much of the CPU can be
        # used before scaling out. If the scaling policy specifies the ALBRequestCountPerTarget predefined
        # metric, specify the target utilization as the optimal average request count per target during any
        # one-minute interval.

        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        # A customized metric. You can specify either a predefined metric or a customized metric.

        @[JSON::Field(key: "CustomizedMetricSpecification")]
        getter customized_metric_specification : Types::CustomizedMetricSpecification?

        # Indicates whether scale in by the target tracking scaling policy is disabled. If the value is true ,
        # scale in is disabled and the target tracking scaling policy won't remove capacity from the scalable
        # target. Otherwise, scale in is enabled and the target tracking scaling policy can remove capacity
        # from the scalable target. The default value is false .

        @[JSON::Field(key: "DisableScaleIn")]
        getter disable_scale_in : Bool?

        # A predefined metric. You can specify either a predefined metric or a customized metric.

        @[JSON::Field(key: "PredefinedMetricSpecification")]
        getter predefined_metric_specification : Types::PredefinedMetricSpecification?

        # The amount of time, in seconds, after a scale-in activity completes before another scale-in activity
        # can start. For more information and for default values, see Define cooldown periods in the
        # Application Auto Scaling User Guide .

        @[JSON::Field(key: "ScaleInCooldown")]
        getter scale_in_cooldown : Int32?

        # The amount of time, in seconds, to wait for a previous scale-out activity to take effect. For more
        # information and for default values, see Define cooldown periods in the Application Auto Scaling User
        # Guide .

        @[JSON::Field(key: "ScaleOutCooldown")]
        getter scale_out_cooldown : Int32?

        def initialize(
          @target_value : Float64,
          @customized_metric_specification : Types::CustomizedMetricSpecification? = nil,
          @disable_scale_in : Bool? = nil,
          @predefined_metric_specification : Types::PredefinedMetricSpecification? = nil,
          @scale_in_cooldown : Int32? = nil,
          @scale_out_cooldown : Int32? = nil
        )
        end
      end

      # The request contains too many tags. Try the request again with fewer tags.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the Application Auto Scaling resource. This value is an Amazon Resource Name (ARN).

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # Identifies the Application Auto Scaling scalable target from which to remove tags. For example:
        # arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123
        # To get the ARN for a scalable target, use DescribeScalableTargets .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # One or more tag keys. Specify only the tag keys, not the tag values.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An exception was thrown for a validation issue. Review the available parameters for the API request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
