require "json"
require "time"

module Aws
  module NeptuneGraph
    module Types

      # Raised in case of an authentication or authorization failure.

      struct AccessDeniedException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CancelExportTaskInput
        include JSON::Serializable

        # The unique identifier of the export task.

        @[JSON::Field(key: "taskIdentifier")]
        getter task_identifier : String

        def initialize(
          @task_identifier : String
        )
        end
      end


      struct CancelExportTaskOutput
        include JSON::Serializable

        # The Amazon S3 URI of the cancelled export task where data will be exported to.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The format of the cancelled export task.

        @[JSON::Field(key: "format")]
        getter format : String

        # The source graph identifier of the cancelled export task.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String

        # The KMS key identifier of the cancelled export task.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String

        # The ARN of the IAM role that will allow the exporting of data to the destination.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The current status of the export task. The status is CANCELLING when the export task is cancelled.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the export task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The parquet type of the cancelled export task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        # The reason that the export task has this status value.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @destination : String,
          @format : String,
          @graph_id : String,
          @kms_key_identifier : String,
          @role_arn : String,
          @status : String,
          @task_id : String,
          @parquet_type : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct CancelImportTaskInput
        include JSON::Serializable

        # The unique identifier of the import task.

        @[JSON::Field(key: "taskIdentifier")]
        getter task_identifier : String

        def initialize(
          @task_identifier : String
        )
        end
      end


      struct CancelImportTaskOutput
        include JSON::Serializable

        # The ARN of the IAM role that will allow access to the data that is to be imported.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A URL identifying to the location of the data to be imported. This can be an Amazon S3 path, or can
        # point to a Neptune database endpoint or snapshot.

        @[JSON::Field(key: "source")]
        getter source : String

        # Current status of the task. Status is CANCELLING when the import task is cancelled.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the import task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # Specifies the format of S3 data to be imported. Valid values are CSV , which identifies the Gremlin
        # CSV format or OPENCYPHER , which identies the openCypher load format .

        @[JSON::Field(key: "format")]
        getter format : String?

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String?

        # The parquet type of the cancelled import task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        def initialize(
          @role_arn : String,
          @source : String,
          @status : String,
          @task_id : String,
          @format : String? = nil,
          @graph_id : String? = nil,
          @parquet_type : String? = nil
        )
        end
      end


      struct CancelQueryInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The unique identifier of the query to cancel.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @graph_identifier : String,
          @query_id : String
        )
        end
      end

      # Raised when a conflict is encountered.

      struct ConflictException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the conflict exception.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @reason : String? = nil
        )
        end
      end


      struct CreateGraphInput
        include JSON::Serializable

        # A name for the new Neptune Analytics graph to be created. The name must contain from 1 to 63
        # letters, numbers, or hyphens, and its first character must be a letter. It cannot end with a hyphen
        # or contain two consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "graphName")]
        getter graph_name : String

        # The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use for the graph. Min = 16

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32

        # Indicates whether or not to enable deletion protection on the graph. The graph can’t be deleted when
        # deletion protection is enabled. ( true or false ).

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # Specifies a KMS key to use to encrypt data in the new graph.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # Specifies whether or not the graph can be reachable over the internet. All access to graphs is IAM
        # authenticated. ( true to enable, or false to disable.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas in other AZs. Min =0, Max = 2, Default = 1. Additional charges equivalent to
        # the m-NCUs selected for the graph apply for each replica.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # Adds metadata tags to the new graph. These tags can also be used with cost allocation reporting, or
        # used in a Condition statement in an IAM policy.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies the number of dimensions for vector embeddings that will be loaded into the graph. The
        # value is specified as dimension= value. Max = 65,535

        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @graph_name : String,
          @provisioned_memory : Int32,
          @deletion_protection : Bool? = nil,
          @kms_key_identifier : String? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end


      struct CreateGraphOutput
        include JSON::Serializable

        # The ARN of the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The graph name. For example: my-graph-1 . The name must contain from 1 to 63 letters, numbers, or
        # hyphens, and its first character must be a letter. It cannot end with a hyphen or contain two
        # consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number of the graph software.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time when the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # A value that indicates whether the graph has deletion protection enabled. The graph can't be deleted
        # when deletion protection is enabled.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # Specifies the KMS key used to encrypt data in the new graph.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use for the graph. Min = 16

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # Specifies whether or not the graph can be reachable over the internet. All access to graphs is IAM
        # authenticated. If enabling public connectivity for the first time, there will be a delay while it is
        # enabled.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas in other AZs. Default: If not specified, the default value is 1.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the source graph.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The current status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason the status was given.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The vector-search configuration for the graph, which specifies the vector dimension to use in the
        # vector index, if any.

        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end


      struct CreateGraphSnapshotInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The snapshot name. For example: my-snapshot-1 . The name must contain from 1 to 63 letters, numbers,
        # or hyphens, and its first character must be a letter. It cannot end with a hyphen or contain two
        # consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "snapshotName")]
        getter snapshot_name : String

        # Adds metadata tags to the new graph. These tags can also be used with cost allocation reporting, or
        # used in a Condition statement in an IAM policy.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @graph_identifier : String,
          @snapshot_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateGraphSnapshotOutput
        include JSON::Serializable

        # The ARN of the snapshot created.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the snapshot created.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the snapshot created.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The snapshot creation time

        @[JSON::Field(key: "snapshotCreateTime")]
        getter snapshot_create_time : Time?

        # The Id of the Neptune Analytics graph from which the snapshot is created.

        @[JSON::Field(key: "sourceGraphId")]
        getter source_graph_id : String?

        # The current state of the snapshot.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @kms_key_identifier : String? = nil,
          @snapshot_create_time : Time? = nil,
          @source_graph_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateGraphUsingImportTaskInput
        include JSON::Serializable

        # A name for the new Neptune Analytics graph to be created. The name must contain from 1 to 63
        # letters, numbers, or hyphens, and its first character must be a letter. It cannot end with a hyphen
        # or contain two consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "graphName")]
        getter graph_name : String

        # The ARN of the IAM role that will allow access to the data that is to be imported.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A URL identifying to the location of the data to be imported. This can be an Amazon S3 path, or can
        # point to a Neptune database endpoint or snapshot.

        @[JSON::Field(key: "source")]
        getter source : String

        # The method to handle blank nodes in the dataset. Currently, only convertToIri is supported, meaning
        # blank nodes are converted to unique IRIs at load time. Must be provided when format is ntriples .
        # For more information, see Handling RDF values .

        @[JSON::Field(key: "blankNodeHandling")]
        getter blank_node_handling : String?

        # Indicates whether or not to enable deletion protection on the graph. The graph can’t be deleted when
        # deletion protection is enabled. ( true or false ).

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # If set to true , the task halts when an import error is encountered. If set to false , the task
        # skips the data that caused the error and continues if possible.

        @[JSON::Field(key: "failOnError")]
        getter fail_on_error : Bool?

        # Specifies the format of S3 data to be imported. Valid values are CSV , which identifies the Gremlin
        # CSV format , OPEN_CYPHER , which identifies the openCypher load format , or ntriples , which
        # identifies the RDF n-triples format.

        @[JSON::Field(key: "format")]
        getter format : String?

        # Contains options for controlling the import process. For example, if the failOnError key is set to
        # false , the import skips problem data and attempts to continue (whereas if set to true , the
        # default, or if omitted, the import operation halts immediately when an error is encountered.

        @[JSON::Field(key: "importOptions")]
        getter import_options : Types::ImportOptions?

        # Specifies a KMS key to use to encrypt data imported into the new graph.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The maximum provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use for the graph.
        # Default: 1024, or the approved upper limit for your account. If both the minimum and maximum values
        # are specified, the final provisioned-memory will be chosen per the actual size of your imported
        # data. If neither value is specified, 128 m-NCUs are used.

        @[JSON::Field(key: "maxProvisionedMemory")]
        getter max_provisioned_memory : Int32?

        # The minimum provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use for the graph.
        # Default: 16

        @[JSON::Field(key: "minProvisionedMemory")]
        getter min_provisioned_memory : Int32?

        # The parquet type of the import task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        # Specifies whether or not the graph can be reachable over the internet. All access to graphs is IAM
        # authenticated. ( true to enable, or false to disable).

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas in other AZs to provision on the new graph after import. Default = 0, Min =
        # 0, Max = 2. Additional charges equivalent to the m-NCUs selected for the graph apply for each
        # replica.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # Adds metadata tags to the new graph. These tags can also be used with cost allocation reporting, or
        # used in a Condition statement in an IAM policy.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies the number of dimensions for vector embeddings that will be loaded into the graph. The
        # value is specified as dimension= value. Max = 65,535

        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @graph_name : String,
          @role_arn : String,
          @source : String,
          @blank_node_handling : String? = nil,
          @deletion_protection : Bool? = nil,
          @fail_on_error : Bool? = nil,
          @format : String? = nil,
          @import_options : Types::ImportOptions? = nil,
          @kms_key_identifier : String? = nil,
          @max_provisioned_memory : Int32? = nil,
          @min_provisioned_memory : Int32? = nil,
          @parquet_type : String? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end


      struct CreateGraphUsingImportTaskOutput
        include JSON::Serializable

        # The ARN of the IAM role that will allow access to the data that is to be imported.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A URL identifying to the location of the data to be imported. This can be an Amazon S3 path, or can
        # point to a Neptune database endpoint or snapshot.

        @[JSON::Field(key: "source")]
        getter source : String

        # The status of the import task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the import task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # Specifies the format of S3 data to be imported. Valid values are CSV , which identifies the Gremlin
        # CSV format , OPENCYPHER , which identifies the openCypher load format , or ntriples , which
        # identifies the RDF n-triples format.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String?

        # Contains options for controlling the import process. For example, if the failOnError key is set to
        # false , the import skips problem data and attempts to continue (whereas if set to true , the
        # default, or if omitted, the import operation halts immediately when an error is encountered.

        @[JSON::Field(key: "importOptions")]
        getter import_options : Types::ImportOptions?

        # The parquet type of the import task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        def initialize(
          @role_arn : String,
          @source : String,
          @status : String,
          @task_id : String,
          @format : String? = nil,
          @graph_id : String? = nil,
          @import_options : Types::ImportOptions? = nil,
          @parquet_type : String? = nil
        )
        end
      end


      struct CreatePrivateGraphEndpointInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # Subnets in which private graph endpoint ENIs are created.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The VPC in which the private graph endpoint needs to be created.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        # Security groups to be attached to the private graph endpoint..

        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @graph_identifier : String,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end


      struct CreatePrivateGraphEndpointOutput
        include JSON::Serializable

        # Status of the private graph endpoint.

        @[JSON::Field(key: "status")]
        getter status : String

        # Subnets in which the private graph endpoint ENIs are created.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # VPC in which the private graph endpoint is created.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # Endpoint ID of the prviate grpah endpoint.

        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @status : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @vpc_endpoint_id : String? = nil
        )
        end
      end


      struct DeleteGraphInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # Determines whether a final graph snapshot is created before the graph is deleted. If true is
        # specified, no graph snapshot is created. If false is specified, a graph snapshot is created before
        # the graph is deleted.

        @[JSON::Field(key: "skipSnapshot")]
        getter skip_snapshot : Bool

        def initialize(
          @graph_identifier : String,
          @skip_snapshot : Bool
        )
        end
      end


      struct DeleteGraphOutput
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number associated with the graph.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time at which the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # If true , deletion protection was enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true , the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the snapshot from which the graph was created, if the graph was recovered from a snapshot.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason for the status of the graph.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?


        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end


      struct DeleteGraphSnapshotInput
        include JSON::Serializable

        # ID of the graph snapshot to be deleted.

        @[JSON::Field(key: "snapshotIdentifier")]
        getter snapshot_identifier : String

        def initialize(
          @snapshot_identifier : String
        )
        end
      end


      struct DeleteGraphSnapshotOutput
        include JSON::Serializable

        # The ARN of the graph snapshot.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph snapshot.

        @[JSON::Field(key: "id")]
        getter id : String

        # The snapshot name. For example: my-snapshot-1 . The name must contain from 1 to 63 letters, numbers,
        # or hyphens, and its first character must be a letter. It cannot end with a hyphen or contain two
        # consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the KMS key used to encrypt and decrypt the snapshot.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The time when the snapshot was created.

        @[JSON::Field(key: "snapshotCreateTime")]
        getter snapshot_create_time : Time?

        # The graph identifier for the graph from which the snapshot was created.

        @[JSON::Field(key: "sourceGraphId")]
        getter source_graph_id : String?

        # The status of the graph snapshot.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @kms_key_identifier : String? = nil,
          @snapshot_create_time : Time? = nil,
          @source_graph_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeletePrivateGraphEndpointInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The ID of the VPC where the private endpoint is located.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        def initialize(
          @graph_identifier : String,
          @vpc_id : String
        )
        end
      end


      struct DeletePrivateGraphEndpointOutput
        include JSON::Serializable

        # The status of the delete operation.

        @[JSON::Field(key: "status")]
        getter status : String

        # The subnet IDs involved.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the VPC where the private endpoint was deleted.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The ID of the VPC endpoint that was deleted.

        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @status : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @vpc_endpoint_id : String? = nil
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about an edge in a Neptune Analytics graph.

      struct EdgeStructure
        include JSON::Serializable

        # The number of instances of the edge in the graph.

        @[JSON::Field(key: "count")]
        getter count : Int64?

        # A list of the properties associated with the edge.

        @[JSON::Field(key: "edgeProperties")]
        getter edge_properties : Array(String)?

        def initialize(
          @count : Int64? = nil,
          @edge_properties : Array(String)? = nil
        )
        end
      end


      struct ExecuteQueryInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The query language the query is written in. Currently only openCypher is supported.

        @[JSON::Field(key: "language")]
        getter language : String

        # The query string to be executed.

        @[JSON::Field(key: "query")]
        getter query_string : String

        # The explain mode parameter returns a query explain instead of the actual query results. A query
        # explain can be used to gather insights about the query execution such as planning decisions, time
        # spent on each operator, solutions flowing etc.

        @[JSON::Field(key: "explain")]
        getter explain_mode : String?

        # The data parameters the query can use in JSON format. For example: {"name": "john", "age": 20}.
        # (optional)

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::Document)?

        # Query plan cache is a feature that saves the query plan and reuses it on successive executions of
        # the same query. This reduces query latency, and works for both READ and UPDATE queries. The plan
        # cache is an LRU cache with a 5 minute TTL and a capacity of 1000.

        @[JSON::Field(key: "planCache")]
        getter plan_cache : String?

        # Specifies the query timeout duration, in milliseconds. (optional)

        @[JSON::Field(key: "queryTimeoutMilliseconds")]
        getter query_timeout_milliseconds : Int32?

        def initialize(
          @graph_identifier : String,
          @language : String,
          @query_string : String,
          @explain_mode : String? = nil,
          @parameters : Hash(String, Types::Document)? = nil,
          @plan_cache : String? = nil,
          @query_timeout_milliseconds : Int32? = nil
        )
        end
      end


      struct ExecuteQueryOutput
        include JSON::Serializable

        # The query results.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        def initialize(
          @payload : Bytes
        )
        end
      end

      # This is the top-level field for specifying vertex or edge filters. If the ExportFilter is not
      # provided, then all properties for all labels will be exported. If the ExportFilter is provided but
      # is an empty object, then no data will be exported.

      struct ExportFilter
        include JSON::Serializable

        # Used to specify filters on a per-label basis for edges. This allows you to control which edge labels
        # and properties are included in the export.

        @[JSON::Field(key: "edgeFilter")]
        getter edge_filter : Hash(String, Types::ExportFilterElement)?

        # Used to specify filters on a per-label basis for vertices. This allows you to control which vertex
        # labels and properties are included in the export.

        @[JSON::Field(key: "vertexFilter")]
        getter vertex_filter : Hash(String, Types::ExportFilterElement)?

        def initialize(
          @edge_filter : Hash(String, Types::ExportFilterElement)? = nil,
          @vertex_filter : Hash(String, Types::ExportFilterElement)? = nil
        )
        end
      end

      # Specifies whihc properties of that label should be included in the export.

      struct ExportFilterElement
        include JSON::Serializable

        # Each property is defined by a key-value pair, where the key is the desired output property name
        # (e.g. "name"), and the value is an object.

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::ExportFilterPropertyAttributes)?

        def initialize(
          @properties : Hash(String, Types::ExportFilterPropertyAttributes)? = nil
        )
        end
      end

      # A structure representing a property's attributes. It is a map object of outputType,
      # sourcePropertyName and multiValueHandling.

      struct ExportFilterPropertyAttributes
        include JSON::Serializable

        # Specifies how to handle properties that have multiple values. Can be either TO_LIST to export all
        # values as a list, or PICK_FIRST to export the first value encountered. If not specified, the default
        # value is PICK_FIRST .

        @[JSON::Field(key: "multiValueHandling")]
        getter multi_value_handling : String?

        # Specifies the data type to use for the property in the exported data (e.g. "String", "Int",
        # "Float"). If a type is not provided, the export process will determine the type. If a given property
        # is present as multiple types (e.g. one vertex has "height" stored as a double, and another edge has
        # it stored as a string), the type will be of Any type, otherwise, it will be the type of the property
        # as present in vertices.

        @[JSON::Field(key: "outputType")]
        getter output_type : String?

        # The name of the property as it exists in the original graph data. If not provided, it is assumed
        # that the key matches the desired sourcePropertyName.

        @[JSON::Field(key: "sourcePropertyName")]
        getter source_property_name : String?

        def initialize(
          @multi_value_handling : String? = nil,
          @output_type : String? = nil,
          @source_property_name : String? = nil
        )
        end
      end

      # Contains details about the specified export task.

      struct ExportTaskDetails
        include JSON::Serializable

        # The number of progress percentage of the export task.

        @[JSON::Field(key: "progressPercentage")]
        getter progress_percentage : Int32

        # The start time of the export task.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The time elapsed, in seconds, since the start time of the export task.

        @[JSON::Field(key: "timeElapsedSeconds")]
        getter time_elapsed_seconds : Int64

        # The number of exported edges.

        @[JSON::Field(key: "numEdgesWritten")]
        getter num_edges_written : Int64?

        # The number of exported vertices.

        @[JSON::Field(key: "numVerticesWritten")]
        getter num_vertices_written : Int64?

        def initialize(
          @progress_percentage : Int32,
          @start_time : Time,
          @time_elapsed_seconds : Int64,
          @num_edges_written : Int64? = nil,
          @num_vertices_written : Int64? = nil
        )
        end
      end

      # Provides details about an export task.

      struct ExportTaskSummary
        include JSON::Serializable

        # The Amazon S3 URI of the export task where data will be exported to.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The format of the export task.

        @[JSON::Field(key: "format")]
        getter format : String

        # The source graph identifier of the export task.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String

        # The KMS key identifier of the export task.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String

        # The ARN of the IAM role that will allow the data to be exported to the destination.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The current status of the export task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the export task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The parquet type of the export task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        # The reason that the export task has this status value.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @destination : String,
          @format : String,
          @graph_id : String,
          @kms_key_identifier : String,
          @role_arn : String,
          @status : String,
          @task_id : String,
          @parquet_type : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetExportTaskInput
        include JSON::Serializable

        # The unique identifier of the export task.

        @[JSON::Field(key: "taskIdentifier")]
        getter task_identifier : String

        def initialize(
          @task_identifier : String
        )
        end
      end


      struct GetExportTaskOutput
        include JSON::Serializable

        # The Amazon S3 URI of the export task where data will be exported.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The format of the export task.

        @[JSON::Field(key: "format")]
        getter format : String

        # The source graph identifier of the export task.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String

        # The KMS key identifier of the export task.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String

        # The ARN of the IAM role that will allow data to be exported to the destination.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The current status of the export task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the export task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The export filter of the export task.

        @[JSON::Field(key: "exportFilter")]
        getter export_filter : Types::ExportFilter?

        # The details of the export task.

        @[JSON::Field(key: "exportTaskDetails")]
        getter export_task_details : Types::ExportTaskDetails?

        # The parquet type of the export task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        # The reason that the export task has this status value.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @destination : String,
          @format : String,
          @graph_id : String,
          @kms_key_identifier : String,
          @role_arn : String,
          @status : String,
          @task_id : String,
          @export_filter : Types::ExportFilter? = nil,
          @export_task_details : Types::ExportTaskDetails? = nil,
          @parquet_type : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetGraphInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        def initialize(
          @graph_identifier : String
        )
        end
      end


      struct GetGraphOutput
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number of the graph.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time at which the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # If true , deletion protection is enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true , the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the snapshot from which the graph was created, if it was created from a snapshot.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason that the graph has this status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?


        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end


      struct GetGraphSnapshotInput
        include JSON::Serializable

        # The ID of the snapshot to retrieve.

        @[JSON::Field(key: "snapshotIdentifier")]
        getter snapshot_identifier : String

        def initialize(
          @snapshot_identifier : String
        )
        end
      end


      struct GetGraphSnapshotOutput
        include JSON::Serializable

        # The ARN of the graph snapshot.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph snapshot.

        @[JSON::Field(key: "id")]
        getter id : String

        # The snapshot name. For example: my-snapshot-1 . The name must contain from 1 to 63 letters, numbers,
        # or hyphens, and its first character must be a letter. It cannot end with a hyphen or contain two
        # consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the KMS key used to encrypt and decrypt the snapshot.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The time when the snapshot was created.

        @[JSON::Field(key: "snapshotCreateTime")]
        getter snapshot_create_time : Time?

        # The graph identifier for the graph for which a snapshot is to be created.

        @[JSON::Field(key: "sourceGraphId")]
        getter source_graph_id : String?

        # The status of the graph snapshot.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @kms_key_identifier : String? = nil,
          @snapshot_create_time : Time? = nil,
          @source_graph_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetGraphSummaryInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The summary mode can take one of two values: basic (the default), and detailed .

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @graph_identifier : String,
          @mode : String? = nil
        )
        end
      end


      struct GetGraphSummaryOutput
        include JSON::Serializable

        # The graph summary.

        @[JSON::Field(key: "graphSummary")]
        getter graph_summary : Types::GraphDataSummary?

        # The timestamp, in ISO 8601 format, of the time at which Neptune Analytics last computed statistics.

        @[JSON::Field(key: "lastStatisticsComputationTime")]
        getter last_statistics_computation_time : Time?

        # Display the version of this tool.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @graph_summary : Types::GraphDataSummary? = nil,
          @last_statistics_computation_time : Time? = nil,
          @version : String? = nil
        )
        end
      end


      struct GetImportTaskInput
        include JSON::Serializable

        # The unique identifier of the import task.

        @[JSON::Field(key: "taskIdentifier")]
        getter task_identifier : String

        def initialize(
          @task_identifier : String
        )
        end
      end


      struct GetImportTaskOutput
        include JSON::Serializable

        # The ARN of the IAM role that will allow access to the data that is to be imported.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A URL identifying to the location of the data to be imported. This can be an Amazon S3 path, or can
        # point to a Neptune database endpoint or snapshot

        @[JSON::Field(key: "source")]
        getter source : String

        # The status of the import task: INITIALIZING – The necessary resources needed to create the graph are
        # being prepared. ANALYZING_DATA – The data is being analyzed to determine the optimal infrastructure
        # configuration for the new graph. RE_PROVISIONING – The data did not fit into the provisioned graph,
        # so it is being re-provisioned with more capacity. IMPORTING – The data is being loaded.
        # ERROR_ENCOUNTERED – An error has been encountered while trying to create the graph and import the
        # data. ERROR_ENCOUNTERED_ROLLING_BACK – Because of the error that was encountered, the graph is being
        # rolled back and all its resources released. SUCCEEDED – Graph creation and data loading succeeded.
        # FAILED – Graph creation or data loading failed. When the status is FAILED , you can use get-graphs
        # to get more information about the state of the graph. CANCELLING – Because you cancelled the import
        # task, cancellation is in progress. CANCELLED – You have successfully cancelled the import task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the import task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The number of the current attempts to execute the import task.

        @[JSON::Field(key: "attemptNumber")]
        getter attempt_number : Int32?

        # Specifies the format of S3 data to be imported. Valid values are CSV , which identifies the Gremlin
        # CSV format or OPENCYPHER , which identies the openCypher load format .

        @[JSON::Field(key: "format")]
        getter format : String?

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String?

        # Contains options for controlling the import process. For example, if the failOnError key is set to
        # false , the import skips problem data and attempts to continue (whereas if set to true , the
        # default, or if omitted, the import operation halts immediately when an error is encountered.

        @[JSON::Field(key: "importOptions")]
        getter import_options : Types::ImportOptions?

        # Contains details about the specified import task.

        @[JSON::Field(key: "importTaskDetails")]
        getter import_task_details : Types::ImportTaskDetails?

        # The parquet type of the import task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        # The reason that the import task has this status value.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @role_arn : String,
          @source : String,
          @status : String,
          @task_id : String,
          @attempt_number : Int32? = nil,
          @format : String? = nil,
          @graph_id : String? = nil,
          @import_options : Types::ImportOptions? = nil,
          @import_task_details : Types::ImportTaskDetails? = nil,
          @parquet_type : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetPrivateGraphEndpointInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The ID of the VPC where the private endpoint is located.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        def initialize(
          @graph_identifier : String,
          @vpc_id : String
        )
        end
      end


      struct GetPrivateGraphEndpointOutput
        include JSON::Serializable

        # The current status of the private endpoint.

        @[JSON::Field(key: "status")]
        getter status : String

        # The subnet IDs involved.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the VPC where the private endpoint is located.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The ID of the private endpoint.

        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @status : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @vpc_endpoint_id : String? = nil
        )
        end
      end


      struct GetQueryInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The ID of the query in question.

        @[JSON::Field(key: "queryId")]
        getter query_id : String

        def initialize(
          @graph_identifier : String,
          @query_id : String
        )
        end
      end


      struct GetQueryOutput
        include JSON::Serializable

        # The number of milliseconds the query has been running.

        @[JSON::Field(key: "elapsed")]
        getter elapsed : Int32?

        # The ID of the query in question.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The query in question.

        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        # State of the query.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Indicates how long the query waited, in milliseconds.

        @[JSON::Field(key: "waited")]
        getter waited : Int32?

        def initialize(
          @elapsed : Int32? = nil,
          @id : String? = nil,
          @query_string : String? = nil,
          @state : String? = nil,
          @waited : Int32? = nil
        )
        end
      end

      # Summary information about the graph.

      struct GraphDataSummary
        include JSON::Serializable

        # A list of the edge labels in the graph.

        @[JSON::Field(key: "edgeLabels")]
        getter edge_labels : Array(String)?

        # A list of the distinct edge properties in the graph, along with the count of edges where each
        # property is used.

        @[JSON::Field(key: "edgeProperties")]
        getter edge_properties : Array(Hash(String, Int64))?

        # This field is only present when the requested mode is DETAILED. It contains a list of edge
        # structures.

        @[JSON::Field(key: "edgeStructures")]
        getter edge_structures : Array(Types::EdgeStructure)?

        # A list of distinct node labels in the graph.

        @[JSON::Field(key: "nodeLabels")]
        getter node_labels : Array(String)?

        # A list of the distinct node properties in the graph, along with the count of nodes where each
        # property is used.

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Array(Hash(String, Int64))?

        # This field is only present when the requested mode is DETAILED. It contains a list of node
        # structures.

        @[JSON::Field(key: "nodeStructures")]
        getter node_structures : Array(Types::NodeStructure)?

        # The number of unique edge labels in the graph.

        @[JSON::Field(key: "numEdgeLabels")]
        getter num_edge_labels : Int64?

        # The number of edge properties in the graph.

        @[JSON::Field(key: "numEdgeProperties")]
        getter num_edge_properties : Int64?

        # The number of edges in the graph.

        @[JSON::Field(key: "numEdges")]
        getter num_edges : Int64?

        # The number of distinct node labels in the graph.

        @[JSON::Field(key: "numNodeLabels")]
        getter num_node_labels : Int64?

        # The number of distinct node properties in the graph.

        @[JSON::Field(key: "numNodeProperties")]
        getter num_node_properties : Int64?

        # The number of nodes in the graph.

        @[JSON::Field(key: "numNodes")]
        getter num_nodes : Int64?

        # The total number of usages of all edge properties.

        @[JSON::Field(key: "totalEdgePropertyValues")]
        getter total_edge_property_values : Int64?

        # The total number of usages of all node properties.

        @[JSON::Field(key: "totalNodePropertyValues")]
        getter total_node_property_values : Int64?

        def initialize(
          @edge_labels : Array(String)? = nil,
          @edge_properties : Array(Hash(String, Int64))? = nil,
          @edge_structures : Array(Types::EdgeStructure)? = nil,
          @node_labels : Array(String)? = nil,
          @node_properties : Array(Hash(String, Int64))? = nil,
          @node_structures : Array(Types::NodeStructure)? = nil,
          @num_edge_labels : Int64? = nil,
          @num_edge_properties : Int64? = nil,
          @num_edges : Int64? = nil,
          @num_node_labels : Int64? = nil,
          @num_node_properties : Int64? = nil,
          @num_nodes : Int64? = nil,
          @total_edge_property_values : Int64? = nil,
          @total_node_property_values : Int64? = nil
        )
        end
      end

      # Details about a graph snapshot.

      struct GraphSnapshotSummary
        include JSON::Serializable

        # The ARN of the graph snapshot.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph snapshot.

        @[JSON::Field(key: "id")]
        getter id : String

        # The snapshot name. For example: my-snapshot-1 . The name must contain from 1 to 63 letters, numbers,
        # or hyphens, and its first character must be a letter. It cannot end with a hyphen or contain two
        # consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the KMS key used to encrypt and decrypt the snapshot.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The time when the snapshot was created.

        @[JSON::Field(key: "snapshotCreateTime")]
        getter snapshot_create_time : Time?

        # The graph identifier for the graph for which a snapshot is to be created.

        @[JSON::Field(key: "sourceGraphId")]
        getter source_graph_id : String?

        # The status of the graph snapshot.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @kms_key_identifier : String? = nil,
          @snapshot_create_time : Time? = nil,
          @source_graph_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Summary details about a graph.

      struct GraphSummary
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # If true , deletion protection is enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true , the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Options for how to perform an import.

      struct ImportOptions
        include JSON::Serializable

        # Options for importing data from a Neptune database.

        @[JSON::Field(key: "neptune")]
        getter neptune : Types::NeptuneImportOptions?

        def initialize(
          @neptune : Types::NeptuneImportOptions? = nil
        )
        end
      end

      # Contains details about an import task.

      struct ImportTaskDetails
        include JSON::Serializable

        # The number of dictionary entries in the import task.

        @[JSON::Field(key: "dictionaryEntryCount")]
        getter dictionary_entry_count : Int64

        # The number of errors encountered so far.

        @[JSON::Field(key: "errorCount")]
        getter error_count : Int32

        # The percentage progress so far.

        @[JSON::Field(key: "progressPercentage")]
        getter progress_percentage : Int32

        # Time at which the import task started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The number of statements in the import task.

        @[JSON::Field(key: "statementCount")]
        getter statement_count : Int64

        # Status of the import task.

        @[JSON::Field(key: "status")]
        getter status : String

        # Seconds elapsed since the import task started.

        @[JSON::Field(key: "timeElapsedSeconds")]
        getter time_elapsed_seconds : Int64

        # Details about the errors that have been encountered.

        @[JSON::Field(key: "errorDetails")]
        getter error_details : String?

        def initialize(
          @dictionary_entry_count : Int64,
          @error_count : Int32,
          @progress_percentage : Int32,
          @start_time : Time,
          @statement_count : Int64,
          @status : String,
          @time_elapsed_seconds : Int64,
          @error_details : String? = nil
        )
        end
      end

      # Details about an import task.

      struct ImportTaskSummary
        include JSON::Serializable

        # The ARN of the IAM role that will allow access to the data that is to be imported.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A URL identifying to the location of the data to be imported. This can be an Amazon S3 path, or can
        # point to a Neptune database endpoint or snapshot

        @[JSON::Field(key: "source")]
        getter source : String

        # Status of the import task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the import task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # Specifies the format of S3 data to be imported. Valid values are CSV , which identifies the Gremlin
        # CSV format or OPENCYPHER , which identies the openCypher load format .

        @[JSON::Field(key: "format")]
        getter format : String?

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String?

        # The parquet type of the import task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        def initialize(
          @role_arn : String,
          @source : String,
          @status : String,
          @task_id : String,
          @format : String? = nil,
          @graph_id : String? = nil,
          @parquet_type : String? = nil
        )
        end
      end

      # A failure occurred on the server.

      struct InternalServerException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListExportTasksInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String?

        # The maximum number of export tasks to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token used to paginate input.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @graph_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExportTasksOutput
        include JSON::Serializable

        # The requested list of export tasks.

        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::ExportTaskSummary)

        # Pagination token used to paginate output.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @tasks : Array(Types::ExportTaskSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListGraphSnapshotsInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String?

        # The total number of records to return in the command's output. If the total number of records
        # available is more than the value specified, nextToken is provided in the command's output. To resume
        # pagination, provide the nextToken output value in the nextToken argument of a subsequent command. Do
        # not use the nextToken response element directly outside of the Amazon CLI.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @graph_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGraphSnapshotsOutput
        include JSON::Serializable

        # The requested list of snapshots.

        @[JSON::Field(key: "graphSnapshots")]
        getter graph_snapshots : Array(Types::GraphSnapshotSummary)

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @graph_snapshots : Array(Types::GraphSnapshotSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListGraphsInput
        include JSON::Serializable

        # The total number of records to return in the command's output. If the total number of records
        # available is more than the value specified, nextToken is provided in the command's output. To resume
        # pagination, provide the nextToken output value in the nextToken argument of a subsequent command. Do
        # not use the nextToken response element directly outside of the Amazon CLI.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGraphsOutput
        include JSON::Serializable

        # A list of the graphs.

        @[JSON::Field(key: "graphs")]
        getter graphs : Array(Types::GraphSummary)

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @graphs : Array(Types::GraphSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListImportTasksInput
        include JSON::Serializable

        # The total number of records to return in the command's output. If the total number of records
        # available is more than the value specified, nextToken is provided in the command's output. To resume
        # pagination, provide the nextToken output value in the nextToken argument of a subsequent command. Do
        # not use the nextToken response element directly outside of the Amazon CLI.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportTasksOutput
        include JSON::Serializable

        # The requested list of import tasks.

        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::ImportTaskSummary)

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @tasks : Array(Types::ImportTaskSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPrivateGraphEndpointsInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The total number of records to return in the command's output. If the total number of records
        # available is more than the value specified, nextToken is provided in the command's output. To resume
        # pagination, provide the nextToken output value in the nextToken argument of a subsequent command. Do
        # not use the nextToken response element directly outside of the Amazon CLI.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @graph_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPrivateGraphEndpointsOutput
        include JSON::Serializable

        # A list of private endpoints for the specified Neptune Analytics graph.

        @[JSON::Field(key: "privateGraphEndpoints")]
        getter private_graph_endpoints : Array(Types::PrivateGraphEndpointSummary)

        # Pagination token used to paginate output. When this value is provided as input, the service returns
        # results from where the previous response left off. When this value is present in output, it
        # indicates that there are more results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @private_graph_endpoints : Array(Types::PrivateGraphEndpointSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListQueriesInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The maximum number of results to be fetched by the API.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # Filtered list of queries based on state.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @graph_identifier : String,
          @max_results : Int32,
          @state : String? = nil
        )
        end
      end


      struct ListQueriesOutput
        include JSON::Serializable

        # A list of current openCypher queries.

        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::QuerySummary)

        def initialize(
          @queries : Array(Types::QuerySummary)
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of metadata tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Options for how to import Neptune data.

      struct NeptuneImportOptions
        include JSON::Serializable

        # The KMS key to use to encrypt data in the S3 bucket where the graph data is exported

        @[JSON::Field(key: "s3ExportKmsKeyId")]
        getter s3_export_kms_key_id : String

        # The path to an S3 bucket from which to import data.

        @[JSON::Field(key: "s3ExportPath")]
        getter s3_export_path : String

        # Neptune Analytics supports label-less vertices and no labels are assigned unless one is explicitly
        # provided. Neptune assigns default labels when none is explicitly provided. When importing the data
        # into Neptune Analytics, the default vertex labels can be omitted by setting
        # preserveDefaultVertexLabels to false. Note that if the vertex only has default labels, and has no
        # other properties or edges, then the vertex will effectively not get imported into Neptune Analytics
        # when preserveDefaultVertexLabels is set to false.

        @[JSON::Field(key: "preserveDefaultVertexLabels")]
        getter preserve_default_vertex_labels : Bool?

        # Neptune Analytics currently does not support user defined edge ids. The edge ids are not imported by
        # default. They are imported if preserveEdgeIds is set to true, and ids are stored as properties on
        # the relationships with the property name neptuneEdgeId .

        @[JSON::Field(key: "preserveEdgeIds")]
        getter preserve_edge_ids : Bool?

        def initialize(
          @s3_export_kms_key_id : String,
          @s3_export_path : String,
          @preserve_default_vertex_labels : Bool? = nil,
          @preserve_edge_ids : Bool? = nil
        )
        end
      end

      # Information about a node.

      struct NodeStructure
        include JSON::Serializable

        # The number of instances of this node.

        @[JSON::Field(key: "count")]
        getter count : Int64?

        # The outgoing edge labels associated with this node.

        @[JSON::Field(key: "distinctOutgoingEdgeLabels")]
        getter distinct_outgoing_edge_labels : Array(String)?

        # Properties associated with this node.

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Array(String)?

        def initialize(
          @count : Int64? = nil,
          @distinct_outgoing_edge_labels : Array(String)? = nil,
          @node_properties : Array(String)? = nil
        )
        end
      end

      # Details about a private graph endpoint.

      struct PrivateGraphEndpointSummary
        include JSON::Serializable

        # The status of the private graph endpoint.

        @[JSON::Field(key: "status")]
        getter status : String

        # The subnet IDs associated with the private graph endpoint.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the VPC in which the private graph endpoint is located.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The ID of the VPC endpoint.

        @[JSON::Field(key: "vpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @status : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      # Details of the query listed.

      struct QuerySummary
        include JSON::Serializable

        # The running time of the query, in milliseconds.

        @[JSON::Field(key: "elapsed")]
        getter elapsed : Int32?

        # A string representation of the id of the query.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The actual query text. The queryString may be truncated if the actual query string is too long.

        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        # State of the query.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The amount of time, in milliseconds, the query has waited in the queue before being picked up by a
        # worker thread.

        @[JSON::Field(key: "waited")]
        getter waited : Int32?

        def initialize(
          @elapsed : Int32? = nil,
          @id : String? = nil,
          @query_string : String? = nil,
          @state : String? = nil,
          @waited : Int32? = nil
        )
        end
      end


      struct ResetGraphInput
        include JSON::Serializable

        # ID of the graph to reset.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # Determines whether a final graph snapshot is created before the graph data is deleted. If set to
        # true , no graph snapshot is created. If set to false , a graph snapshot is created before the data
        # is deleted.

        @[JSON::Field(key: "skipSnapshot")]
        getter skip_snapshot : Bool

        def initialize(
          @graph_identifier : String,
          @skip_snapshot : Bool
        )
        end
      end


      struct ResetGraphOutput
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number of the graph.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time at which the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # If true , deletion protection is enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true , the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the snapshot from which the graph was created, if any.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason that the graph has this status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?


        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end

      # A specified resource could not be located.

      struct ResourceNotFoundException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct RestoreGraphFromSnapshotInput
        include JSON::Serializable

        # A name for the new Neptune Analytics graph to be created from the snapshot. The name must contain
        # from 1 to 63 letters, numbers, or hyphens, and its first character must be a letter. It cannot end
        # with a hyphen or contain two consecutive hyphens. Only lowercase letters are allowed.

        @[JSON::Field(key: "graphName")]
        getter graph_name : String

        # The ID of the snapshot in question.

        @[JSON::Field(key: "snapshotIdentifier")]
        getter snapshot_identifier : String

        # A value that indicates whether the graph has deletion protection enabled. The graph can't be deleted
        # when deletion protection is enabled.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use for the graph. Min = 16

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # Specifies whether or not the graph can be reachable over the internet. All access to graphs is IAM
        # authenticated. ( true to enable, or false to disable).

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas in other AZs. Min =0, Max = 2, Default =1 Additional charges equivalent to
        # the m-NCUs selected for the graph apply for each replica.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # Adds metadata tags to the snapshot. These tags can also be used with cost allocation reporting, or
        # used in a Condition statement in an IAM policy.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @graph_name : String,
          @snapshot_identifier : String,
          @deletion_protection : Bool? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RestoreGraphFromSnapshotOutput
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number of the graph.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time at which the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # If true , deletion protection is enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true , the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the snapshot from which the graph was created, if any.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason that the graph has this status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?


        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end

      # A service quota was exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Service quota code of the resource for which quota was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The identifier of the resource that exceeded quota.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that exceeded quota. Ex: Graph, Snapshot

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The service code that exceeded quota.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct StartExportTaskInput
        include JSON::Serializable

        # The Amazon S3 URI where data will be exported to.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The format of the export task.

        @[JSON::Field(key: "format")]
        getter format : String

        # The source graph identifier of the export task.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The KMS key identifier of the export task.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String

        # The ARN of the IAM role that will allow data to be exported to the destination.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The export filter of the export task.

        @[JSON::Field(key: "exportFilter")]
        getter export_filter : Types::ExportFilter?

        # The parquet type of the export task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        # Tags to be applied to the export task.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination : String,
          @format : String,
          @graph_identifier : String,
          @kms_key_identifier : String,
          @role_arn : String,
          @export_filter : Types::ExportFilter? = nil,
          @parquet_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartExportTaskOutput
        include JSON::Serializable

        # The Amazon S3 URI of the export task where data will be exported to.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The format of the export task.

        @[JSON::Field(key: "format")]
        getter format : String

        # The source graph identifier of the export task.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String

        # The KMS key identifier of the export task.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String

        # The ARN of the IAM role that will allow data to be exported to the destination.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The current status of the export task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the export task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The export filter of the export task.

        @[JSON::Field(key: "exportFilter")]
        getter export_filter : Types::ExportFilter?

        # The parquet type of the export task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        # The reason that the export task has this status value.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @destination : String,
          @format : String,
          @graph_id : String,
          @kms_key_identifier : String,
          @role_arn : String,
          @status : String,
          @task_id : String,
          @export_filter : Types::ExportFilter? = nil,
          @parquet_type : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct StartGraphInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        def initialize(
          @graph_identifier : String
        )
        end
      end


      struct StartGraphOutput
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number of the graph.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time at which the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # If true , deletion protection is enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true , the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the snapshot from which the graph was created, if it was created from a snapshot.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason that the graph has this status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?


        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end


      struct StartImportTaskInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # The ARN of the IAM role that will allow access to the data that is to be imported.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A URL identifying the location of the data to be imported. This can be an Amazon S3 path, or can
        # point to a Neptune database endpoint or snapshot.

        @[JSON::Field(key: "source")]
        getter source : String

        # The method to handle blank nodes in the dataset. Currently, only convertToIri is supported, meaning
        # blank nodes are converted to unique IRIs at load time. Must be provided when format is ntriples .
        # For more information, see Handling RDF values .

        @[JSON::Field(key: "blankNodeHandling")]
        getter blank_node_handling : String?

        # If set to true, the task halts when an import error is encountered. If set to false, the task skips
        # the data that caused the error and continues if possible.

        @[JSON::Field(key: "failOnError")]
        getter fail_on_error : Bool?

        # Specifies the format of Amazon S3 data to be imported. Valid values are CSV, which identifies the
        # Gremlin CSV format or OPENCYPHER, which identies the openCypher load format.

        @[JSON::Field(key: "format")]
        getter format : String?


        @[JSON::Field(key: "importOptions")]
        getter import_options : Types::ImportOptions?

        # The parquet type of the import task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        def initialize(
          @graph_identifier : String,
          @role_arn : String,
          @source : String,
          @blank_node_handling : String? = nil,
          @fail_on_error : Bool? = nil,
          @format : String? = nil,
          @import_options : Types::ImportOptions? = nil,
          @parquet_type : String? = nil
        )
        end
      end


      struct StartImportTaskOutput
        include JSON::Serializable

        # The ARN of the IAM role that will allow access to the data that is to be imported.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A URL identifying the location of the data to be imported. This can be an Amazon S3 path, or can
        # point to a Neptune database endpoint or snapshot.

        @[JSON::Field(key: "source")]
        getter source : String

        # The status of the import task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the import task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # Specifies the format of Amazon S3 data to be imported. Valid values are CSV, which identifies the
        # Gremlin CSV format or OPENCYPHER, which identies the openCypher load format.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphId")]
        getter graph_id : String?


        @[JSON::Field(key: "importOptions")]
        getter import_options : Types::ImportOptions?

        # The parquet type of the import task.

        @[JSON::Field(key: "parquetType")]
        getter parquet_type : String?

        def initialize(
          @role_arn : String,
          @source : String,
          @status : String,
          @task_id : String,
          @format : String? = nil,
          @graph_id : String? = nil,
          @import_options : Types::ImportOptions? = nil,
          @parquet_type : String? = nil
        )
        end
      end


      struct StopGraphInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        def initialize(
          @graph_identifier : String
        )
        end
      end


      struct StopGraphOutput
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number of the graph.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time at which the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # If true , deletion protection is enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true, the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the snapshot from which the graph was created, if it was created from a snapshot.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason that the graph has this status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?


        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # ARN of the resource for which tags need to be added.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to be assigned to the Neptune Analytics resource. The tags are metadata that are specified
        # as a list of key-value pairs: Key (string) – A key is the required name of the tag. The string value
        # can be from 1 to 128 Unicode characters in length. It can't be prefixed with aws: and can only
        # contain the set of Unicode characters specified by this Java regular expression:
        # "^([\p{L}\p{Z}\p{N}_.:/=+\-]*)$") . Value (string) – A value is the optional value of the tag. The
        # string value can be from 1 to 256 Unicode characters in length. It can't be prefixed with aws: and
        # can only contain the set of Unicode characters specified by this Java regular expression:
        # "^([\p{L}\p{Z}\p{N}_.:/=+\-]*)$") .

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

      # The exception was interrupted by throttling.

      struct ThrottlingException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Request cannot be processed due to known reasons. Eg. partition full.

      struct UnprocessableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the unprocessable exception.

        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # ARN of the resource whose tag needs to be removed.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tag keys for the tags to be removed.

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


      struct UpdateGraphInput
        include JSON::Serializable

        # The unique identifier of the Neptune Analytics graph.

        @[JSON::Field(key: "graphIdentifier")]
        getter graph_identifier : String

        # A value that indicates whether the graph has deletion protection enabled. The graph can't be deleted
        # when deletion protection is enabled.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use for the graph. Min = 16

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # Specifies whether or not the graph can be reachable over the internet. All access to graphs is IAM
        # authenticated. ( true to enable, or false to disable.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        def initialize(
          @graph_identifier : String,
          @deletion_protection : Bool? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil
        )
        end
      end


      struct UpdateGraphOutput
        include JSON::Serializable

        # The ARN associated with the graph.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique identifier of the graph.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the graph.

        @[JSON::Field(key: "name")]
        getter name : String

        # The build number of the graph.

        @[JSON::Field(key: "buildNumber")]
        getter build_number : String?

        # The time at which the graph was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # If true , deletion protection is enabled for the graph.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The graph endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The ID of the KMS key used to encrypt and decrypt graph data.

        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to the graph.

        @[JSON::Field(key: "provisionedMemory")]
        getter provisioned_memory : Int32?

        # If true , the graph has a public endpoint, otherwise not.

        @[JSON::Field(key: "publicConnectivity")]
        getter public_connectivity : Bool?

        # The number of replicas for the graph.

        @[JSON::Field(key: "replicaCount")]
        getter replica_count : Int32?

        # The ID of the snapshot from which the graph was created, if any.

        @[JSON::Field(key: "sourceSnapshotId")]
        getter source_snapshot_id : String?

        # The status of the graph.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason that the graph has this status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?


        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::VectorSearchConfiguration?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @build_number : String? = nil,
          @create_time : Time? = nil,
          @deletion_protection : Bool? = nil,
          @endpoint : String? = nil,
          @kms_key_identifier : String? = nil,
          @provisioned_memory : Int32? = nil,
          @public_connectivity : Bool? = nil,
          @replica_count : Int32? = nil,
          @source_snapshot_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @vector_search_configuration : Types::VectorSearchConfiguration? = nil
        )
        end
      end

      # A resource could not be validated.

      struct ValidationException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason that the resource could not be validated.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @reason : String? = nil
        )
        end
      end

      # Specifies the number of dimensions for vector embeddings loaded into the graph. Max = 65535

      struct VectorSearchConfiguration
        include JSON::Serializable

        # The number of dimensions.

        @[JSON::Field(key: "dimension")]
        getter dimension : Int32

        def initialize(
          @dimension : Int32
        )
        end
      end
    end
  end
end
