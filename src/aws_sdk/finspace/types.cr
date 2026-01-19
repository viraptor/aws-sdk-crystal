require "json"
require "time"

module AwsSdk
  module Finspace
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration based on which FinSpace will scale in or scale out nodes in your cluster.
      struct AutoScalingConfiguration
        include JSON::Serializable

        # The metric your cluster will track in order to scale in and out. For example,
        # CPU_UTILIZATION_PERCENTAGE is the average CPU usage across all the nodes in a cluster.
        @[JSON::Field(key: "autoScalingMetric")]
        getter auto_scaling_metric : String?

        # The highest number of nodes to scale. This value cannot be greater than 5.
        @[JSON::Field(key: "maxNodeCount")]
        getter max_node_count : Int32?

        # The desired value of the chosen autoScalingMetric . When the metric drops below this value, the
        # cluster will scale in. When the metric goes above this value, the cluster will scale out. You can
        # set the target value between 1 and 100 percent.
        @[JSON::Field(key: "metricTarget")]
        getter metric_target : Float64?

        # The lowest number of nodes to scale. This value must be at least 1 and less than the maxNodeCount .
        # If the nodes in a cluster belong to multiple availability zones, then minNodeCount must be at least
        # 3.
        @[JSON::Field(key: "minNodeCount")]
        getter min_node_count : Int32?

        # The duration in seconds that FinSpace will wait after a scale in event before initiating another
        # scaling event.
        @[JSON::Field(key: "scaleInCooldownSeconds")]
        getter scale_in_cooldown_seconds : Float64?

        # The duration in seconds that FinSpace will wait after a scale out event before initiating another
        # scaling event.
        @[JSON::Field(key: "scaleOutCooldownSeconds")]
        getter scale_out_cooldown_seconds : Float64?

        def initialize(
          @auto_scaling_metric : String? = nil,
          @max_node_count : Int32? = nil,
          @metric_target : Float64? = nil,
          @min_node_count : Int32? = nil,
          @scale_in_cooldown_seconds : Float64? = nil,
          @scale_out_cooldown_seconds : Float64? = nil
        )
        end
      end

      # A structure for the metadata of a cluster. It includes information like the CPUs needed, memory of
      # instances, and number of instances.
      struct CapacityConfiguration
        include JSON::Serializable

        # The number of instances running in a cluster.
        @[JSON::Field(key: "nodeCount")]
        getter node_count : Int32?

        # The type that determines the hardware of the host computer used for your cluster instance. Each node
        # type offers different memory and storage capabilities. Choose a node type based on the requirements
        # of the application or software that you plan to run on your instance. You can only specify one of
        # the following values: kx.s.large – The node type with a configuration of 12 GiB memory and 2 vCPUs.
        # kx.s.xlarge – The node type with a configuration of 27 GiB memory and 4 vCPUs. kx.s.2xlarge – The
        # node type with a configuration of 54 GiB memory and 8 vCPUs. kx.s.4xlarge – The node type with a
        # configuration of 108 GiB memory and 16 vCPUs. kx.s.8xlarge – The node type with a configuration of
        # 216 GiB memory and 32 vCPUs. kx.s.16xlarge – The node type with a configuration of 432 GiB memory
        # and 64 vCPUs. kx.s.32xlarge – The node type with a configuration of 864 GiB memory and 128 vCPUs.
        @[JSON::Field(key: "nodeType")]
        getter node_type : String?

        def initialize(
          @node_count : Int32? = nil,
          @node_type : String? = nil
        )
        end
      end

      # A list of change request objects.
      struct ChangeRequest
        include JSON::Serializable

        # Defines the type of change request. A changeType can have the following values: PUT – Adds or
        # updates files in a database. DELETE – Deletes files in a database.
        @[JSON::Field(key: "changeType")]
        getter change_type : String

        # Defines the path within the database directory.
        @[JSON::Field(key: "dbPath")]
        getter db_path : String

        # Defines the S3 path of the source file that is required to add or update files in a database.
        @[JSON::Field(key: "s3Path")]
        getter s3_path : String?

        def initialize(
          @change_type : String,
          @db_path : String,
          @s3_path : String? = nil
        )
        end
      end

      # The structure of the customer code available within the running cluster.
      struct CodeConfiguration
        include JSON::Serializable

        # A unique name for the S3 bucket.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # The full S3 path (excluding bucket) to the .zip file. This file contains the code that is loaded
        # onto the cluster when it's started.
        @[JSON::Field(key: "s3Key")]
        getter s3_key : String?

        # The version of an S3 object.
        @[JSON::Field(key: "s3ObjectVersion")]
        getter s3_object_version : String?

        def initialize(
          @s3_bucket : String? = nil,
          @s3_key : String? = nil,
          @s3_object_version : String? = nil
        )
        end
      end

      # There was a conflict with this action, and it could not be completed.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The reason for the conflict exception.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      struct CreateEnvironmentRequest
        include JSON::Serializable

        # The name of the FinSpace environment to be created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The list of Amazon Resource Names (ARN) of the data bundles to install. Currently supported data
        # bundle ARNs: arn:aws:finspace:${Region}::data-bundle/capital-markets-sample - Contains sample
        # Capital Markets datasets, categories and controlled vocabularies.
        # arn:aws:finspace:${Region}::data-bundle/taq (default) - Contains trades and quotes data in addition
        # to sample Capital Markets data.
        @[JSON::Field(key: "dataBundles")]
        getter data_bundles : Array(String)?

        # The description of the FinSpace environment to be created.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Authentication mode for the environment. FEDERATED - Users access FinSpace through Single Sign On
        # (SSO) via your Identity provider. LOCAL - Users access FinSpace via email and password managed
        # within the FinSpace environment.
        @[JSON::Field(key: "federationMode")]
        getter federation_mode : String?

        # Configuration information when authentication mode is FEDERATED.
        @[JSON::Field(key: "federationParameters")]
        getter federation_parameters : Types::FederationParameters?

        # The KMS key id to encrypt your data in the FinSpace environment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # Configuration information for the superuser.
        @[JSON::Field(key: "superuserParameters")]
        getter superuser_parameters : Types::SuperuserParameters?

        # Add tags to your FinSpace environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @data_bundles : Array(String)? = nil,
          @description : String? = nil,
          @federation_mode : String? = nil,
          @federation_parameters : Types::FederationParameters? = nil,
          @kms_key_id : String? = nil,
          @superuser_parameters : Types::SuperuserParameters? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the FinSpace environment that you created.
        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # The unique identifier for FinSpace environment that you created.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The sign-in URL for the web application of the FinSpace environment you created.
        @[JSON::Field(key: "environmentUrl")]
        getter environment_url : String?

        def initialize(
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @environment_url : String? = nil
        )
        end
      end

      struct CreateKxChangesetRequest
        include JSON::Serializable

        # A list of change request objects that are run in order. A change request object consists of
        # changeType , s3Path , and dbPath . A changeType can have the following values: PUT – Adds or updates
        # files in a database. DELETE – Deletes files in a database. All the change requests require a
        # mandatory dbPath attribute that defines the path within the database directory. All database paths
        # must start with a leading / and end with a trailing /. The s3Path attribute defines the s3 source
        # file path and is required for a PUT change type. The s3path must end with a trailing / if it is a
        # directory and must end without a trailing / if it is a file. Here are few examples of how you can
        # use the change request object: This request adds a single sym file at database root location. {
        # "changeType": "PUT", "s3Path":"s3://bucket/db/sym", "dbPath":"/"} This request adds files in the
        # given s3Path under the 2020.01.02 partition of the database. { "changeType": "PUT",
        # "s3Path":"s3://bucket/db/2020.01.02/", "dbPath":"/2020.01.02/"} This request adds files in the given
        # s3Path under the taq table partition of the database. [ { "changeType": "PUT",
        # "s3Path":"s3://bucket/db/2020.01.02/taq/", "dbPath":"/2020.01.02/taq/"}] This request deletes the
        # 2020.01.02 partition of the database. [{ "changeType": "DELETE", "dbPath": "/2020.01.02/"} ] The
        # DELETE request allows you to delete the existing files under the 2020.01.02 partition of the
        # database, and the PUT request adds a new taq table under it. [ {"changeType": "DELETE",
        # "dbPath":"/2020.01.02/"}, {"changeType": "PUT", "s3Path":"s3://bucket/db/2020.01.02/taq/",
        # "dbPath":"/2020.01.02/taq/"}]
        @[JSON::Field(key: "changeRequests")]
        getter change_requests : Array(Types::ChangeRequest)

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier of the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @change_requests : Array(Types::ChangeRequest),
          @client_token : String,
          @database_name : String,
          @environment_id : String
        )
        end
      end

      struct CreateKxChangesetResponse
        include JSON::Serializable

        # A list of change requests.
        @[JSON::Field(key: "changeRequests")]
        getter change_requests : Array(Types::ChangeRequest)?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the changeset was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The details of the error that you receive when creating a changeset. It consists of the type of
        # error and the error message.
        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::ErrorInfo?

        # The timestamp at which the changeset was updated in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Status of the changeset creation process. Pending – Changeset creation is pending. Processing –
        # Changeset creation is running. Failed – Changeset creation has failed. Complete – Changeset creation
        # has succeeded.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @change_requests : Array(Types::ChangeRequest)? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @database_name : String? = nil,
          @environment_id : String? = nil,
          @error_info : Types::ErrorInfo? = nil,
          @last_modified_timestamp : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateKxClusterRequest
        include JSON::Serializable

        # The number of availability zones you want to assign per cluster. This can be one of the following
        # SINGLE – Assigns one availability zone per cluster. MULTI – Assigns all the availability zones per
        # cluster.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String

        # A unique name for the cluster that you want to create.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # Specifies the type of KDB database that is being created. The following types are available: HDB – A
        # Historical Database. The data is only accessible with read-only permissions from one of the FinSpace
        # managed kdb databases mounted to the cluster. RDB – A Realtime Database. This type of database
        # captures all the data from a ticker plant and stores it in memory until the end of day, after which
        # it writes all of its data to a disk and reloads the HDB. This cluster type requires local storage
        # for temporary storage of data during the savedown process. If you specify this field in your
        # request, you must provide the savedownStorageConfiguration parameter. GATEWAY – A gateway cluster
        # allows you to access data across processes in kdb systems. It allows you to create your own routing
        # logic using the initialization scripts and custom code. This type of cluster does not require a
        # writable local storage. GP – A general purpose cluster allows you to quickly iterate on code during
        # development by granting greater access to system commands and enabling a fast reload of custom code.
        # This cluster type can optionally mount databases including cache and savedown storage. For this
        # cluster type, the node count is fixed at 1. It does not support autoscaling and supports only SINGLE
        # AZ mode. Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers based on IAM
        # permissions. It can publish to RDBs, other Tickerplants, and real-time subscribers (RTS).
        # Tickerplants can persist messages to log, which is readable by any RDB environment. It supports only
        # single-node that is only one kdb process.
        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The version of FinSpace managed kdb to run.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # Configuration details about the network where the Privatelink endpoint of the cluster resides.
        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration

        # The configuration based on which FinSpace will scale in or scale out nodes in your cluster.
        @[JSON::Field(key: "autoScalingConfiguration")]
        getter auto_scaling_configuration : Types::AutoScalingConfiguration?

        # The availability zone identifiers for the requested regions.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The configurations for a read only cache storage associated with a cluster. This cache will be
        # stored as an FSx Lustre that reads from the S3 store.
        @[JSON::Field(key: "cacheStorageConfigurations")]
        getter cache_storage_configurations : Array(Types::KxCacheStorageConfiguration)?

        # A structure for the metadata of a cluster. It includes information like the CPUs needed, memory of
        # instances, and number of instances.
        @[JSON::Field(key: "capacityConfiguration")]
        getter capacity_configuration : Types::CapacityConfiguration?

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the cluster.
        @[JSON::Field(key: "clusterDescription")]
        getter cluster_description : String?

        # The details of the custom code that you want to use inside a cluster when analyzing a data. It
        # consists of the S3 source bucket, location, S3 object version, and the relative path from where the
        # custom code is loaded into the cluster.
        @[JSON::Field(key: "code")]
        getter code : Types::CodeConfiguration?

        # Defines the key-value pairs to make them available inside the cluster.
        @[JSON::Field(key: "commandLineArguments")]
        getter command_line_arguments : Array(Types::KxCommandLineArgument)?

        # A list of databases that will be available for querying.
        @[JSON::Field(key: "databases")]
        getter databases : Array(Types::KxDatabaseConfiguration)?

        # An IAM role that defines a set of permissions associated with a cluster. These permissions are
        # assumed when a cluster attempts to access another cluster.
        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # Specifies a Q program that will be run at launch of a cluster. It is a relative path within .zip
        # file that contains the custom code, which will be loaded on the cluster. It must include the file
        # name itself. For example, somedir/init.q .
        @[JSON::Field(key: "initializationScript")]
        getter initialization_script : String?

        # The size and type of the temporary storage that is used to hold data during the savedown process.
        # This parameter is required when you choose clusterType as RDB. All the data written to this storage
        # space is lost when the cluster node is restarted.
        @[JSON::Field(key: "savedownStorageConfiguration")]
        getter savedown_storage_configuration : Types::KxSavedownStorageConfiguration?

        # The structure that stores the configuration details of a scaling group.
        @[JSON::Field(key: "scalingGroupConfiguration")]
        getter scaling_group_configuration : Types::KxScalingGroupConfiguration?

        # A list of key-value pairs to label the cluster. You can add up to 50 tags to a cluster.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A configuration to store Tickerplant logs. It consists of a list of volumes that will be mounted to
        # your cluster. For the cluster type Tickerplant , the location of the TP volume on the cluster will
        # be available by using the global variable .aws.tp_log_path .
        @[JSON::Field(key: "tickerplantLogConfiguration")]
        getter tickerplant_log_configuration : Types::TickerplantLogConfiguration?

        def initialize(
          @az_mode : String,
          @cluster_name : String,
          @cluster_type : String,
          @environment_id : String,
          @release_label : String,
          @vpc_configuration : Types::VpcConfiguration,
          @auto_scaling_configuration : Types::AutoScalingConfiguration? = nil,
          @availability_zone_id : String? = nil,
          @cache_storage_configurations : Array(Types::KxCacheStorageConfiguration)? = nil,
          @capacity_configuration : Types::CapacityConfiguration? = nil,
          @client_token : String? = nil,
          @cluster_description : String? = nil,
          @code : Types::CodeConfiguration? = nil,
          @command_line_arguments : Array(Types::KxCommandLineArgument)? = nil,
          @databases : Array(Types::KxDatabaseConfiguration)? = nil,
          @execution_role : String? = nil,
          @initialization_script : String? = nil,
          @savedown_storage_configuration : Types::KxSavedownStorageConfiguration? = nil,
          @scaling_group_configuration : Types::KxScalingGroupConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @tickerplant_log_configuration : Types::TickerplantLogConfiguration? = nil
        )
        end
      end

      struct CreateKxClusterResponse
        include JSON::Serializable

        # The configuration based on which FinSpace will scale in or scale out nodes in your cluster.
        @[JSON::Field(key: "autoScalingConfiguration")]
        getter auto_scaling_configuration : Types::AutoScalingConfiguration?

        # The availability zone identifiers for the requested regions.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The number of availability zones you want to assign per cluster. This can be one of the following
        # SINGLE – Assigns one availability zone per cluster. MULTI – Assigns all the availability zones per
        # cluster.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # The configurations for a read only cache storage associated with a cluster. This cache will be
        # stored as an FSx Lustre that reads from the S3 store.
        @[JSON::Field(key: "cacheStorageConfigurations")]
        getter cache_storage_configurations : Array(Types::KxCacheStorageConfiguration)?

        # A structure for the metadata of a cluster. It includes information like the CPUs needed, memory of
        # instances, and number of instances.
        @[JSON::Field(key: "capacityConfiguration")]
        getter capacity_configuration : Types::CapacityConfiguration?

        # A description of the cluster.
        @[JSON::Field(key: "clusterDescription")]
        getter cluster_description : String?

        # A unique name for the cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # Specifies the type of KDB database that is being created. The following types are available: HDB – A
        # Historical Database. The data is only accessible with read-only permissions from one of the FinSpace
        # managed kdb databases mounted to the cluster. RDB – A Realtime Database. This type of database
        # captures all the data from a ticker plant and stores it in memory until the end of day, after which
        # it writes all of its data to a disk and reloads the HDB. This cluster type requires local storage
        # for temporary storage of data during the savedown process. If you specify this field in your
        # request, you must provide the savedownStorageConfiguration parameter. GATEWAY – A gateway cluster
        # allows you to access data across processes in kdb systems. It allows you to create your own routing
        # logic using the initialization scripts and custom code. This type of cluster does not require a
        # writable local storage. GP – A general purpose cluster allows you to quickly iterate on code during
        # development by granting greater access to system commands and enabling a fast reload of custom code.
        # This cluster type can optionally mount databases including cache and savedown storage. For this
        # cluster type, the node count is fixed at 1. It does not support autoscaling and supports only SINGLE
        # AZ mode. Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers based on IAM
        # permissions. It can publish to RDBs, other Tickerplants, and real-time subscribers (RTS).
        # Tickerplants can persist messages to log, which is readable by any RDB environment. It supports only
        # single-node that is only one kdb process.
        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The details of the custom code that you want to use inside a cluster when analyzing a data. It
        # consists of the S3 source bucket, location, S3 object version, and the relative path from where the
        # custom code is loaded into the cluster.
        @[JSON::Field(key: "code")]
        getter code : Types::CodeConfiguration?

        # Defines the key-value pairs to make them available inside the cluster.
        @[JSON::Field(key: "commandLineArguments")]
        getter command_line_arguments : Array(Types::KxCommandLineArgument)?

        # The timestamp at which the cluster was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # A list of databases that will be available for querying.
        @[JSON::Field(key: "databases")]
        getter databases : Array(Types::KxDatabaseConfiguration)?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # An IAM role that defines a set of permissions associated with a cluster. These permissions are
        # assumed when a cluster attempts to access another cluster.
        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # Specifies a Q program that will be run at launch of a cluster. It is a relative path within .zip
        # file that contains the custom code, which will be loaded on the cluster. It must include the file
        # name itself. For example, somedir/init.q .
        @[JSON::Field(key: "initializationScript")]
        getter initialization_script : String?

        # The last time that the cluster was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # A version of the FinSpace managed kdb to run.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String?

        # The size and type of the temporary storage that is used to hold data during the savedown process.
        # This parameter is required when you choose clusterType as RDB. All the data written to this storage
        # space is lost when the cluster node is restarted.
        @[JSON::Field(key: "savedownStorageConfiguration")]
        getter savedown_storage_configuration : Types::KxSavedownStorageConfiguration?

        # The structure that stores the configuration details of a scaling group.
        @[JSON::Field(key: "scalingGroupConfiguration")]
        getter scaling_group_configuration : Types::KxScalingGroupConfiguration?

        # The status of cluster creation. PENDING – The cluster is pending creation. CREATING – The cluster
        # creation process is in progress. CREATE_FAILED – The cluster creation process has failed. RUNNING –
        # The cluster creation process is running. UPDATING – The cluster is in the process of being updated.
        # DELETING – The cluster is in the process of being deleted. DELETED – The cluster has been deleted.
        # DELETE_FAILED – The cluster failed to delete.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        @[JSON::Field(key: "tickerplantLogConfiguration")]
        getter tickerplant_log_configuration : Types::TickerplantLogConfiguration?

        # A list of volumes mounted on the cluster.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        # Configuration details about the network where the Privatelink endpoint of the cluster resides.
        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @auto_scaling_configuration : Types::AutoScalingConfiguration? = nil,
          @availability_zone_id : String? = nil,
          @az_mode : String? = nil,
          @cache_storage_configurations : Array(Types::KxCacheStorageConfiguration)? = nil,
          @capacity_configuration : Types::CapacityConfiguration? = nil,
          @cluster_description : String? = nil,
          @cluster_name : String? = nil,
          @cluster_type : String? = nil,
          @code : Types::CodeConfiguration? = nil,
          @command_line_arguments : Array(Types::KxCommandLineArgument)? = nil,
          @created_timestamp : Time? = nil,
          @databases : Array(Types::KxDatabaseConfiguration)? = nil,
          @environment_id : String? = nil,
          @execution_role : String? = nil,
          @initialization_script : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @release_label : String? = nil,
          @savedown_storage_configuration : Types::KxSavedownStorageConfiguration? = nil,
          @scaling_group_configuration : Types::KxScalingGroupConfiguration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @tickerplant_log_configuration : Types::TickerplantLogConfiguration? = nil,
          @volumes : Array(Types::Volume)? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      struct CreateKxDatabaseRequest
        include JSON::Serializable

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A description of the database.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of key-value pairs to label the kdb database. You can add up to 50 tags to your kdb database
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @database_name : String,
          @environment_id : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateKxDatabaseResponse
        include JSON::Serializable

        # The timestamp at which the database is created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The ARN identifier of the database.
        @[JSON::Field(key: "databaseArn")]
        getter database_arn : String?

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A description of the database.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the database was updated in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @database_arn : String? = nil,
          @database_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil
        )
        end
      end

      struct CreateKxDataviewRequest
        include JSON::Serializable

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the database where you want to create a dataview.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the dataview.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String

        # A unique identifier for the kdb environment, where you want to create the dataview.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The option to specify whether you want to apply all the future additions and corrections
        # automatically to the dataview, when you ingest new changesets. The default value is false.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # A unique identifier of the changeset that you want to use to ingest data.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # A description of the dataview.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The option to specify whether you want to make the dataview writable to perform database
        # maintenance. The following are some considerations related to writable dataviews.&#x2028;&#x2028;
        # You cannot create partial writable dataviews. When you create writeable dataviews you must provide
        # the entire database path. You cannot perform updates on a writeable dataview. Hence, autoUpdate must
        # be set as False if readWrite is True for a dataview. You must also use a unique volume for creating
        # a writeable dataview. So, if you choose a volume that is already in use by another dataview, the
        # dataview creation fails. Once you create a dataview as writeable, you cannot change it to read-only.
        # So, you cannot update the readWrite parameter later.
        @[JSON::Field(key: "readWrite")]
        getter read_write : Bool?

        # The configuration that contains the database path of the data that you want to place on each
        # selected volume. Each segment must have a unique database path for each volume. If you do not
        # explicitly specify any database path for a volume, they are accessible from the cluster through the
        # default S3/object store segment.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        # A list of key-value pairs to label the dataview. You can add up to 50 tags to a dataview.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @az_mode : String,
          @client_token : String,
          @database_name : String,
          @dataview_name : String,
          @environment_id : String,
          @auto_update : Bool? = nil,
          @availability_zone_id : String? = nil,
          @changeset_id : String? = nil,
          @description : String? = nil,
          @read_write : Bool? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateKxDataviewResponse
        include JSON::Serializable

        # The option to select whether you want to apply all the future additions and corrections
        # automatically to the dataview when you ingest new changesets. The default value is false.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the dataview was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The name of the database where you want to create a dataview.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A unique identifier for the dataview.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String?

        # A description of the dataview.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment, where you want to create the dataview.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the dataview was updated in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Returns True if the dataview is created as writeable and False otherwise.
        @[JSON::Field(key: "readWrite")]
        getter read_write : Bool?

        # The configuration that contains the database path of the data that you want to place on each
        # selected volume. Each segment must have a unique database path for each volume. If you do not
        # explicitly specify any database path for a volume, they are accessible from the cluster through the
        # default S3/object store segment.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        # The status of dataview creation. CREATING – The dataview creation is in progress. UPDATING – The
        # dataview is in the process of being updated. ACTIVE – The dataview is active.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @auto_update : Bool? = nil,
          @availability_zone_id : String? = nil,
          @az_mode : String? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @database_name : String? = nil,
          @dataview_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @read_write : Bool? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateKxEnvironmentRequest
        include JSON::Serializable

        # The KMS key ID to encrypt your data in the FinSpace environment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String

        # The name of the kdb environment that you want to create.
        @[JSON::Field(key: "name")]
        getter name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the kdb environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of key-value pairs to label the kdb environment. You can add up to 50 tags to your kdb
        # environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @kms_key_id : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateKxEnvironmentResponse
        include JSON::Serializable

        # The timestamp at which the kdb environment was created in FinSpace.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # A description for the kdb environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN identifier of the environment.
        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The KMS key ID to encrypt your data in the FinSpace environment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the kdb environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the kdb environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_timestamp : Time? = nil,
          @description : String? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateKxScalingGroupRequest
        include JSON::Serializable

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # A unique identifier for the kdb environment, where you want to create the scaling group.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The memory and CPU capabilities of the scaling group host on which FinSpace Managed kdb clusters
        # will be placed. You can add one of the following values: kx.sg.large – The host type with a
        # configuration of 16 GiB memory and 2 vCPUs. kx.sg.xlarge – The host type with a configuration of 32
        # GiB memory and 4 vCPUs. kx.sg.2xlarge – The host type with a configuration of 64 GiB memory and 8
        # vCPUs. kx.sg.4xlarge – The host type with a configuration of 108 GiB memory and 16 vCPUs.
        # kx.sg.8xlarge – The host type with a configuration of 216 GiB memory and 32 vCPUs. kx.sg.16xlarge –
        # The host type with a configuration of 432 GiB memory and 64 vCPUs. kx.sg.32xlarge – The host type
        # with a configuration of 864 GiB memory and 128 vCPUs. kx.sg1.16xlarge – The host type with a
        # configuration of 1949 GiB memory and 64 vCPUs. kx.sg1.24xlarge – The host type with a configuration
        # of 2948 GiB memory and 96 vCPUs.
        @[JSON::Field(key: "hostType")]
        getter host_type : String

        # A unique identifier for the kdb scaling group.
        @[JSON::Field(key: "scalingGroupName")]
        getter scaling_group_name : String

        # A list of key-value pairs to label the scaling group. You can add up to 50 tags to a scaling group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @availability_zone_id : String,
          @client_token : String,
          @environment_id : String,
          @host_type : String,
          @scaling_group_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateKxScalingGroupResponse
        include JSON::Serializable

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The timestamp at which the scaling group was created in FinSpace. The value is determined as epoch
        # time in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is
        # specified as 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # A unique identifier for the kdb environment, where you create the scaling group.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The memory and CPU capabilities of the scaling group host on which FinSpace Managed kdb clusters
        # will be placed.
        @[JSON::Field(key: "hostType")]
        getter host_type : String?

        # The last time that the scaling group was updated in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # A unique identifier for the kdb scaling group.
        @[JSON::Field(key: "scalingGroupName")]
        getter scaling_group_name : String?

        # The status of scaling group. CREATING – The scaling group creation is in progress. CREATE_FAILED –
        # The scaling group creation has failed. ACTIVE – The scaling group is active. UPDATING – The scaling
        # group is in the process of being updated. UPDATE_FAILED – The update action failed. DELETING – The
        # scaling group is in the process of being deleted. DELETE_FAILED – The system failed to delete the
        # scaling group. DELETED – The scaling group is successfully deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @availability_zone_id : String? = nil,
          @created_timestamp : Time? = nil,
          @environment_id : String? = nil,
          @host_type : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @scaling_group_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateKxUserRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment where you want to create a user.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The IAM role ARN that will be associated with the user.
        @[JSON::Field(key: "iamRole")]
        getter iam_role : String

        # A unique identifier for the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of key-value pairs to label the user. You can add up to 50 tags to a user.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @environment_id : String,
          @iam_role : String,
          @user_name : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateKxUserResponse
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The IAM role ARN that will be associated with the user.
        @[JSON::Field(key: "iamRole")]
        getter iam_role : String?

        # The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how to
        # use ARNs in policies, see IAM Identifiers in the IAM User Guide .
        @[JSON::Field(key: "userArn")]
        getter user_arn : String?

        # A unique identifier for the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @environment_id : String? = nil,
          @iam_role : String? = nil,
          @user_arn : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      struct CreateKxVolumeRequest
        include JSON::Serializable

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String

        # A unique identifier for the kdb environment, whose clusters can attach to the volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the volume.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String

        # The type of file system volume. Currently, FinSpace only supports NAS_1 volume type. When you select
        # NAS_1 volume type, you must also provide nas1Configuration .
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the volume.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the configuration for the Network attached storage (NAS_1) file system volume. This
        # parameter is required when you choose volumeType as NAS_1 .
        @[JSON::Field(key: "nas1Configuration")]
        getter nas1_configuration : Types::KxNAS1Configuration?

        # A list of key-value pairs to label the volume. You can add up to 50 tags to a volume.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @availability_zone_ids : Array(String),
          @az_mode : String,
          @environment_id : String,
          @volume_name : String,
          @volume_type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @nas1_configuration : Types::KxNAS1Configuration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateKxVolumeResponse
        include JSON::Serializable

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # The timestamp at which the volume was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # A description of the volume.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment, whose clusters can attach to the volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the configuration for the Network attached storage (NAS_1) file system volume.
        @[JSON::Field(key: "nas1Configuration")]
        getter nas1_configuration : Types::KxNAS1Configuration?

        # The status of volume creation. CREATING – The volume creation is in progress. CREATE_FAILED – The
        # volume creation has failed. ACTIVE – The volume is active. UPDATING – The volume is in the process
        # of being updated. UPDATE_FAILED – The update action failed. UPDATED – The volume is successfully
        # updated. DELETING – The volume is in the process of being deleted. DELETE_FAILED – The system failed
        # to delete the volume. DELETED – The volume is successfully deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The ARN identifier of the volume.
        @[JSON::Field(key: "volumeArn")]
        getter volume_arn : String?

        # A unique identifier for the volume.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String?

        # The type of file system volume. Currently, FinSpace only supports NAS_1 volume type.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @availability_zone_ids : Array(String)? = nil,
          @az_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @nas1_configuration : Types::KxNAS1Configuration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @volume_arn : String? = nil,
          @volume_name : String? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # A list of DNS server name and server IP. This is used to set up Route-53 outbound resolvers.
      struct CustomDNSServer
        include JSON::Serializable

        # The IP address of the DNS server.
        @[JSON::Field(key: "customDNSServerIP")]
        getter custom_dns_server_ip : String

        # The name of the DNS server.
        @[JSON::Field(key: "customDNSServerName")]
        getter custom_dns_server_name : String

        def initialize(
          @custom_dns_server_ip : String,
          @custom_dns_server_name : String
        )
        end
      end

      struct DeleteEnvironmentRequest
        include JSON::Serializable

        # The identifier for the FinSpace environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      struct DeleteEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxClusterNodeRequest
        include JSON::Serializable

        # The name of the cluster, for which you want to delete the nodes.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the node that you want to delete.
        @[JSON::Field(key: "nodeId")]
        getter node_id : String

        def initialize(
          @cluster_name : String,
          @environment_id : String,
          @node_id : String
        )
        end
      end

      struct DeleteKxClusterNodeResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxClusterRequest
        include JSON::Serializable

        # The name of the cluster that you want to delete.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @cluster_name : String,
          @environment_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteKxClusterResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxDatabaseRequest
        include JSON::Serializable

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the kdb database that you want to delete.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @client_token : String,
          @database_name : String,
          @environment_id : String
        )
        end
      end

      struct DeleteKxDatabaseResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxDataviewRequest
        include JSON::Serializable

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the database whose dataview you want to delete.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The name of the dataview that you want to delete.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String

        # A unique identifier for the kdb environment, from where you want to delete the dataview.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @client_token : String,
          @database_name : String,
          @dataview_name : String,
          @environment_id : String
        )
        end
      end

      struct DeleteKxDataviewResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxEnvironmentRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @environment_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteKxEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxScalingGroupRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment, from where you want to delete the dataview.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the kdb scaling group.
        @[JSON::Field(key: "scalingGroupName")]
        getter scaling_group_name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @environment_id : String,
          @scaling_group_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteKxScalingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxUserRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the user that you want to delete.
        @[JSON::Field(key: "userName")]
        getter user_name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @environment_id : String,
          @user_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteKxUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKxVolumeRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment, whose clusters can attach to the volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The name of the volume that you want to delete.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @environment_id : String,
          @volume_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteKxVolumeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents an FinSpace environment.
      struct Environment
        include JSON::Serializable

        # The ID of the AWS account in which the FinSpace environment is created.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The AWS account ID of the dedicated service account associated with your FinSpace environment.
        @[JSON::Field(key: "dedicatedServiceAccountId")]
        getter dedicated_service_account_id : String?

        # The description of the FinSpace environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of your FinSpace environment.
        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # The identifier of the FinSpace environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The sign-in URL for the web application of your FinSpace environment.
        @[JSON::Field(key: "environmentUrl")]
        getter environment_url : String?

        # The authentication mode for the environment.
        @[JSON::Field(key: "federationMode")]
        getter federation_mode : String?

        # Configuration information when authentication mode is FEDERATED.
        @[JSON::Field(key: "federationParameters")]
        getter federation_parameters : Types::FederationParameters?

        # The KMS key id used to encrypt in the FinSpace environment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the FinSpace environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The URL of the integrated FinSpace notebook environment in your web application.
        @[JSON::Field(key: "sageMakerStudioDomainUrl")]
        getter sage_maker_studio_domain_url : String?

        # The current status of creation of the FinSpace environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @aws_account_id : String? = nil,
          @dedicated_service_account_id : String? = nil,
          @description : String? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @environment_url : String? = nil,
          @federation_mode : String? = nil,
          @federation_parameters : Types::FederationParameters? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @sage_maker_studio_domain_url : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides details in the event of a failed flow, including the error type and the related error
      # message.
      struct ErrorInfo
        include JSON::Serializable

        # Specifies the error message that appears if a flow fails.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Specifies the type of error.
        @[JSON::Field(key: "errorType")]
        getter error_type : String?

        def initialize(
          @error_message : String? = nil,
          @error_type : String? = nil
        )
        end
      end

      # Configuration information when authentication mode is FEDERATED.
      struct FederationParameters
        include JSON::Serializable

        # The redirect or sign-in URL that should be entered into the SAML 2.0 compliant identity provider
        # configuration (IdP).
        @[JSON::Field(key: "applicationCallBackURL")]
        getter application_call_back_url : String?

        # SAML attribute name and value. The name must always be Email and the value should be set to the
        # attribute definition in which user email is set. For example, name would be Email and value
        # http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress . Please check your SAML 2.0
        # compliant identity provider (IdP) documentation for details.
        @[JSON::Field(key: "attributeMap")]
        getter attribute_map : Hash(String, String)?

        # Name of the identity provider (IdP).
        @[JSON::Field(key: "federationProviderName")]
        getter federation_provider_name : String?

        # The Uniform Resource Name (URN). Also referred as Service Provider URN or Audience URI or Service
        # Provider Entity ID.
        @[JSON::Field(key: "federationURN")]
        getter federation_urn : String?

        # SAML 2.0 Metadata document from identity provider (IdP).
        @[JSON::Field(key: "samlMetadataDocument")]
        getter saml_metadata_document : String?

        # Provide the metadata URL from your SAML 2.0 compliant identity provider (IdP).
        @[JSON::Field(key: "samlMetadataURL")]
        getter saml_metadata_url : String?

        def initialize(
          @application_call_back_url : String? = nil,
          @attribute_map : Hash(String, String)? = nil,
          @federation_provider_name : String? = nil,
          @federation_urn : String? = nil,
          @saml_metadata_document : String? = nil,
          @saml_metadata_url : String? = nil
        )
        end
      end

      struct GetEnvironmentRequest
        include JSON::Serializable

        # The identifier of the FinSpace environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      struct GetEnvironmentResponse
        include JSON::Serializable

        # The name of the FinSpace environment.
        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end

      struct GetKxChangesetRequest
        include JSON::Serializable

        # A unique identifier of the changeset for which you want to retrieve data.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @changeset_id : String,
          @database_name : String,
          @environment_id : String
        )
        end
      end

      struct GetKxChangesetResponse
        include JSON::Serializable

        # Beginning time from which the changeset is active. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "activeFromTimestamp")]
        getter active_from_timestamp : Time?

        # A list of change request objects that are run in order.
        @[JSON::Field(key: "changeRequests")]
        getter change_requests : Array(Types::ChangeRequest)?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the changeset was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Provides details in the event of a failed flow, including the error type and the related error
        # message.
        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::ErrorInfo?

        # The timestamp at which the changeset was updated in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Status of the changeset creation process. Pending – Changeset creation is pending. Processing –
        # Changeset creation is running. Failed – Changeset creation has failed. Complete – Changeset creation
        # has succeeded.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @active_from_timestamp : Time? = nil,
          @change_requests : Array(Types::ChangeRequest)? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @database_name : String? = nil,
          @environment_id : String? = nil,
          @error_info : Types::ErrorInfo? = nil,
          @last_modified_timestamp : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetKxClusterRequest
        include JSON::Serializable

        # The name of the cluster that you want to retrieve.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @cluster_name : String,
          @environment_id : String
        )
        end
      end

      struct GetKxClusterResponse
        include JSON::Serializable

        # The configuration based on which FinSpace will scale in or scale out nodes in your cluster.
        @[JSON::Field(key: "autoScalingConfiguration")]
        getter auto_scaling_configuration : Types::AutoScalingConfiguration?

        # The availability zone identifiers for the requested regions.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The number of availability zones you want to assign per cluster. This can be one of the following
        # SINGLE – Assigns one availability zone per cluster. MULTI – Assigns all the availability zones per
        # cluster.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # The configurations for a read only cache storage associated with a cluster. This cache will be
        # stored as an FSx Lustre that reads from the S3 store.
        @[JSON::Field(key: "cacheStorageConfigurations")]
        getter cache_storage_configurations : Array(Types::KxCacheStorageConfiguration)?

        # A structure for the metadata of a cluster. It includes information like the CPUs needed, memory of
        # instances, and number of instances.
        @[JSON::Field(key: "capacityConfiguration")]
        getter capacity_configuration : Types::CapacityConfiguration?

        # A description of the cluster.
        @[JSON::Field(key: "clusterDescription")]
        getter cluster_description : String?

        # A unique name for the cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # Specifies the type of KDB database that is being created. The following types are available: HDB – A
        # Historical Database. The data is only accessible with read-only permissions from one of the FinSpace
        # managed kdb databases mounted to the cluster. RDB – A Realtime Database. This type of database
        # captures all the data from a ticker plant and stores it in memory until the end of day, after which
        # it writes all of its data to a disk and reloads the HDB. This cluster type requires local storage
        # for temporary storage of data during the savedown process. If you specify this field in your
        # request, you must provide the savedownStorageConfiguration parameter. GATEWAY – A gateway cluster
        # allows you to access data across processes in kdb systems. It allows you to create your own routing
        # logic using the initialization scripts and custom code. This type of cluster does not require a
        # writable local storage. GP – A general purpose cluster allows you to quickly iterate on code during
        # development by granting greater access to system commands and enabling a fast reload of custom code.
        # This cluster type can optionally mount databases including cache and savedown storage. For this
        # cluster type, the node count is fixed at 1. It does not support autoscaling and supports only SINGLE
        # AZ mode. Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers based on IAM
        # permissions. It can publish to RDBs, other Tickerplants, and real-time subscribers (RTS).
        # Tickerplants can persist messages to log, which is readable by any RDB environment. It supports only
        # single-node that is only one kdb process.
        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The details of the custom code that you want to use inside a cluster when analyzing a data. It
        # consists of the S3 source bucket, location, S3 object version, and the relative path from where the
        # custom code is loaded into the cluster.
        @[JSON::Field(key: "code")]
        getter code : Types::CodeConfiguration?

        # Defines key-value pairs to make them available inside the cluster.
        @[JSON::Field(key: "commandLineArguments")]
        getter command_line_arguments : Array(Types::KxCommandLineArgument)?

        # The timestamp at which the cluster was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # A list of databases mounted on the cluster.
        @[JSON::Field(key: "databases")]
        getter databases : Array(Types::KxDatabaseConfiguration)?

        # An IAM role that defines a set of permissions associated with a cluster. These permissions are
        # assumed when a cluster attempts to access another cluster.
        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # Specifies a Q program that will be run at launch of a cluster. It is a relative path within .zip
        # file that contains the custom code, which will be loaded on the cluster. It must include the file
        # name itself. For example, somedir/init.q .
        @[JSON::Field(key: "initializationScript")]
        getter initialization_script : String?

        # The last time that the cluster was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # The version of FinSpace managed kdb to run.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String?

        # The size and type of the temporary storage that is used to hold data during the savedown process.
        # This parameter is required when you choose clusterType as RDB. All the data written to this storage
        # space is lost when the cluster node is restarted.
        @[JSON::Field(key: "savedownStorageConfiguration")]
        getter savedown_storage_configuration : Types::KxSavedownStorageConfiguration?

        @[JSON::Field(key: "scalingGroupConfiguration")]
        getter scaling_group_configuration : Types::KxScalingGroupConfiguration?

        # The status of cluster creation. PENDING – The cluster is pending creation. CREATING – The cluster
        # creation process is in progress. CREATE_FAILED – The cluster creation process has failed. RUNNING –
        # The cluster creation process is running. UPDATING – The cluster is in the process of being updated.
        # DELETING – The cluster is in the process of being deleted. DELETED – The cluster has been deleted.
        # DELETE_FAILED – The cluster failed to delete.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        @[JSON::Field(key: "tickerplantLogConfiguration")]
        getter tickerplant_log_configuration : Types::TickerplantLogConfiguration?

        # A list of volumes attached to the cluster.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        # Configuration details about the network where the Privatelink endpoint of the cluster resides.
        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @auto_scaling_configuration : Types::AutoScalingConfiguration? = nil,
          @availability_zone_id : String? = nil,
          @az_mode : String? = nil,
          @cache_storage_configurations : Array(Types::KxCacheStorageConfiguration)? = nil,
          @capacity_configuration : Types::CapacityConfiguration? = nil,
          @cluster_description : String? = nil,
          @cluster_name : String? = nil,
          @cluster_type : String? = nil,
          @code : Types::CodeConfiguration? = nil,
          @command_line_arguments : Array(Types::KxCommandLineArgument)? = nil,
          @created_timestamp : Time? = nil,
          @databases : Array(Types::KxDatabaseConfiguration)? = nil,
          @execution_role : String? = nil,
          @initialization_script : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @release_label : String? = nil,
          @savedown_storage_configuration : Types::KxSavedownStorageConfiguration? = nil,
          @scaling_group_configuration : Types::KxScalingGroupConfiguration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @tickerplant_log_configuration : Types::TickerplantLogConfiguration? = nil,
          @volumes : Array(Types::Volume)? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      struct GetKxConnectionStringRequest
        include JSON::Serializable

        # A name of the kdb cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how to
        # use ARNs in policies, see IAM Identifiers in the IAM User Guide .
        @[JSON::Field(key: "userArn")]
        getter user_arn : String

        def initialize(
          @cluster_name : String,
          @environment_id : String,
          @user_arn : String
        )
        end
      end

      struct GetKxConnectionStringResponse
        include JSON::Serializable

        # The signed connection string that you can use to connect to clusters.
        @[JSON::Field(key: "signedConnectionString")]
        getter signed_connection_string : String?

        def initialize(
          @signed_connection_string : String? = nil
        )
        end
      end

      struct GetKxDatabaseRequest
        include JSON::Serializable

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @database_name : String,
          @environment_id : String
        )
        end
      end

      struct GetKxDatabaseResponse
        include JSON::Serializable

        # The timestamp at which the database is created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The ARN identifier of the database.
        @[JSON::Field(key: "databaseArn")]
        getter database_arn : String?

        # The name of the kdb database for which the information is retrieved.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A description of the database.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "lastCompletedChangesetId")]
        getter last_completed_changeset_id : String?

        # The last time that the database was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # The total number of bytes in the database.
        @[JSON::Field(key: "numBytes")]
        getter num_bytes : Int64?

        # The total number of changesets in the database.
        @[JSON::Field(key: "numChangesets")]
        getter num_changesets : Int32?

        # The total number of files in the database.
        @[JSON::Field(key: "numFiles")]
        getter num_files : Int32?

        def initialize(
          @created_timestamp : Time? = nil,
          @database_arn : String? = nil,
          @database_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_completed_changeset_id : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @num_bytes : Int64? = nil,
          @num_changesets : Int32? = nil,
          @num_files : Int32? = nil
        )
        end
      end

      struct GetKxDataviewRequest
        include JSON::Serializable

        # The name of the database where you created the dataview.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the dataview.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String

        # A unique identifier for the kdb environment, from where you want to retrieve the dataview details.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @database_name : String,
          @dataview_name : String,
          @environment_id : String
        )
        end
      end

      struct GetKxDataviewResponse
        include JSON::Serializable

        # The current active changeset versions of the database on the given dataview.
        @[JSON::Field(key: "activeVersions")]
        getter active_versions : Array(Types::KxDataviewActiveVersion)?

        # The option to specify whether you want to apply all the future additions and corrections
        # automatically to the dataview when new changesets are ingested. The default value is false.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # A unique identifier of the changeset that you want to use to ingest data.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the dataview was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The name of the database where you created the dataview.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A unique identifier for the dataview.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String?

        # A description of the dataview.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment, from where you want to retrieve the dataview details.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the dataview was updated in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Returns True if the dataview is created as writeable and False otherwise.
        @[JSON::Field(key: "readWrite")]
        getter read_write : Bool?

        # The configuration that contains the database path of the data that you want to place on each
        # selected volume. Each segment must have a unique database path for each volume. If you do not
        # explicitly specify any database path for a volume, they are accessible from the cluster through the
        # default S3/object store segment.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        # The status of dataview creation. CREATING – The dataview creation is in progress. UPDATING – The
        # dataview is in the process of being updated. ACTIVE – The dataview is active.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @active_versions : Array(Types::KxDataviewActiveVersion)? = nil,
          @auto_update : Bool? = nil,
          @availability_zone_id : String? = nil,
          @az_mode : String? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @database_name : String? = nil,
          @dataview_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @read_write : Bool? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      struct GetKxEnvironmentRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      struct GetKxEnvironmentResponse
        include JSON::Serializable

        # The identifier of the availability zones where subnets for the environment are created.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The unique identifier of the AWS account that is used to create the kdb environment.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Resource Name (ARN) of the certificate authority of the kdb environment.
        @[JSON::Field(key: "certificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The timestamp at which the kdb environment was created in FinSpace.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # A list of DNS server name and server IP. This is used to set up Route-53 outbound resolvers.
        @[JSON::Field(key: "customDNSConfiguration")]
        getter custom_dns_configuration : Array(Types::CustomDNSServer)?

        # A unique identifier for the AWS environment infrastructure account.
        @[JSON::Field(key: "dedicatedServiceAccountId")]
        getter dedicated_service_account_id : String?

        # A description for the kdb environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of DNS configuration.
        @[JSON::Field(key: "dnsStatus")]
        getter dns_status : String?

        # The ARN identifier of the environment.
        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that appears if a flow fails.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The KMS key ID to encrypt your data in the FinSpace environment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the kdb environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the kdb environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status of the network configuration.
        @[JSON::Field(key: "tgwStatus")]
        getter tgw_status : String?

        @[JSON::Field(key: "transitGatewayConfiguration")]
        getter transit_gateway_configuration : Types::TransitGatewayConfiguration?

        # The timestamp at which the kdb environment was updated.
        @[JSON::Field(key: "updateTimestamp")]
        getter update_timestamp : Time?

        def initialize(
          @availability_zone_ids : Array(String)? = nil,
          @aws_account_id : String? = nil,
          @certificate_authority_arn : String? = nil,
          @creation_timestamp : Time? = nil,
          @custom_dns_configuration : Array(Types::CustomDNSServer)? = nil,
          @dedicated_service_account_id : String? = nil,
          @description : String? = nil,
          @dns_status : String? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @error_message : String? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tgw_status : String? = nil,
          @transit_gateway_configuration : Types::TransitGatewayConfiguration? = nil,
          @update_timestamp : Time? = nil
        )
        end
      end

      struct GetKxScalingGroupRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the kdb scaling group.
        @[JSON::Field(key: "scalingGroupName")]
        getter scaling_group_name : String

        def initialize(
          @environment_id : String,
          @scaling_group_name : String
        )
        end
      end

      struct GetKxScalingGroupResponse
        include JSON::Serializable

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The list of Managed kdb clusters that are currently active in the given scaling group.
        @[JSON::Field(key: "clusters")]
        getter clusters : Array(String)?

        # The timestamp at which the scaling group was created in FinSpace. The value is determined as epoch
        # time in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is
        # specified as 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The memory and CPU capabilities of the scaling group host on which FinSpace Managed kdb clusters
        # will be placed. It can have one of the following values: kx.sg.large – The host type with a
        # configuration of 16 GiB memory and 2 vCPUs. kx.sg.xlarge – The host type with a configuration of 32
        # GiB memory and 4 vCPUs. kx.sg.2xlarge – The host type with a configuration of 64 GiB memory and 8
        # vCPUs. kx.sg.4xlarge – The host type with a configuration of 108 GiB memory and 16 vCPUs.
        # kx.sg.8xlarge – The host type with a configuration of 216 GiB memory and 32 vCPUs. kx.sg.16xlarge –
        # The host type with a configuration of 432 GiB memory and 64 vCPUs. kx.sg.32xlarge – The host type
        # with a configuration of 864 GiB memory and 128 vCPUs. kx.sg1.16xlarge – The host type with a
        # configuration of 1949 GiB memory and 64 vCPUs. kx.sg1.24xlarge – The host type with a configuration
        # of 2948 GiB memory and 96 vCPUs.
        @[JSON::Field(key: "hostType")]
        getter host_type : String?

        # The last time that the scaling group was updated in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # The ARN identifier for the scaling group.
        @[JSON::Field(key: "scalingGroupArn")]
        getter scaling_group_arn : String?

        # A unique identifier for the kdb scaling group.
        @[JSON::Field(key: "scalingGroupName")]
        getter scaling_group_name : String?

        # The status of scaling group. CREATING – The scaling group creation is in progress. CREATE_FAILED –
        # The scaling group creation has failed. ACTIVE – The scaling group is active. UPDATING – The scaling
        # group is in the process of being updated. UPDATE_FAILED – The update action failed. DELETING – The
        # scaling group is in the process of being deleted. DELETE_FAILED – The system failed to delete the
        # scaling group. DELETED – The scaling group is successfully deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @availability_zone_id : String? = nil,
          @clusters : Array(String)? = nil,
          @created_timestamp : Time? = nil,
          @host_type : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @scaling_group_arn : String? = nil,
          @scaling_group_name : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      struct GetKxUserRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String

        def initialize(
          @environment_id : String,
          @user_name : String
        )
        end
      end

      struct GetKxUserResponse
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The IAM role ARN that is associated with the user.
        @[JSON::Field(key: "iamRole")]
        getter iam_role : String?

        # The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how to
        # use ARNs in policies, see IAM Identifiers in the IAM User Guide .
        @[JSON::Field(key: "userArn")]
        getter user_arn : String?

        # A unique identifier for the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @environment_id : String? = nil,
          @iam_role : String? = nil,
          @user_arn : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      struct GetKxVolumeRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment, whose clusters can attach to the volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the volume.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String

        def initialize(
          @environment_id : String,
          @volume_name : String
        )
        end
      end

      struct GetKxVolumeResponse
        include JSON::Serializable

        # A list of cluster identifiers that a volume is attached to.
        @[JSON::Field(key: "attachedClusters")]
        getter attached_clusters : Array(Types::KxAttachedCluster)?

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # The timestamp at which the volume was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # A description of the volume.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment, whose clusters can attach to the volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the volume was updated in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Specifies the configuration for the Network attached storage (NAS_1) file system volume.
        @[JSON::Field(key: "nas1Configuration")]
        getter nas1_configuration : Types::KxNAS1Configuration?

        # The status of volume creation. CREATING – The volume creation is in progress. CREATE_FAILED – The
        # volume creation has failed. ACTIVE – The volume is active. UPDATING – The volume is in the process
        # of being updated. UPDATE_FAILED – The update action failed. UPDATED – The volume is successfully
        # updated. DELETING – The volume is in the process of being deleted. DELETE_FAILED – The system failed
        # to delete the volume. DELETED – The volume is successfully deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The ARN identifier of the volume.
        @[JSON::Field(key: "volumeArn")]
        getter volume_arn : String?

        # A unique identifier for the volume.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String?

        # The type of file system volume. Currently, FinSpace only supports NAS_1 volume type.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @attached_clusters : Array(Types::KxAttachedCluster)? = nil,
          @availability_zone_ids : Array(String)? = nil,
          @az_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @nas1_configuration : Types::KxNAS1Configuration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @volume_arn : String? = nil,
          @volume_name : String? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Defines the ICMP protocol that consists of the ICMP type and code.
      struct IcmpTypeCode
        include JSON::Serializable

        # The ICMP code. A value of -1 means all codes for the specified ICMP type.
        @[JSON::Field(key: "code")]
        getter code : Int32

        # The ICMP type. A value of -1 means all types.
        @[JSON::Field(key: "type")]
        getter type : Int32

        def initialize(
          @code : Int32,
          @type : Int32
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is invalid. Something is wrong with the input to the request.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The structure containing the metadata of the attached clusters.
      struct KxAttachedCluster
        include JSON::Serializable

        # A unique name for the attached cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The status of the attached cluster. PENDING – The cluster is pending creation. CREATING – The
        # cluster creation process is in progress. CREATE_FAILED – The cluster creation process has failed.
        # RUNNING – The cluster creation process is running. UPDATING – The cluster is in the process of being
        # updated. DELETING – The cluster is in the process of being deleted. DELETED – The cluster has been
        # deleted. DELETE_FAILED – The cluster failed to delete.
        @[JSON::Field(key: "clusterStatus")]
        getter cluster_status : String?

        # Specifies the type of cluster. The volume for TP and RDB cluster types will be used for TP logs.
        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        def initialize(
          @cluster_name : String? = nil,
          @cluster_status : String? = nil,
          @cluster_type : String? = nil
        )
        end
      end

      # The configuration for read only disk cache associated with a cluster.
      struct KxCacheStorageConfiguration
        include JSON::Serializable

        # The size of cache in Gigabytes.
        @[JSON::Field(key: "size")]
        getter size : Int32

        # The type of cache storage. The valid values are: CACHE_1000 – This type provides at least 1000 MB/s
        # disk access throughput. CACHE_250 – This type provides at least 250 MB/s disk access throughput.
        # CACHE_12 – This type provides at least 12 MB/s disk access throughput. For cache type CACHE_1000 and
        # CACHE_250 you can select cache size as 1200 GB or increments of 2400 GB. For cache type CACHE_12 you
        # can select the cache size in increments of 6000 GB.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @size : Int32,
          @type : String
        )
        end
      end

      # Details of changeset.
      struct KxChangesetListEntry
        include JSON::Serializable

        # Beginning time from which the changeset is active. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "activeFromTimestamp")]
        getter active_from_timestamp : Time?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the changeset was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The timestamp at which the changeset was modified. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Status of the changeset. Pending – Changeset creation is pending. Processing – Changeset creation is
        # running. Failed – Changeset creation has failed. Complete – Changeset creation has succeeded.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @active_from_timestamp : Time? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @last_modified_timestamp : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The details of a kdb cluster.
      struct KxCluster
        include JSON::Serializable

        # The availability zone identifiers for the requested regions.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The number of availability zones assigned per cluster. This can be one of the following: SINGLE –
        # Assigns one availability zone per cluster. MULTI – Assigns all the availability zones per cluster.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # A description of the cluster.
        @[JSON::Field(key: "clusterDescription")]
        getter cluster_description : String?

        # A unique name for the cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # Specifies the type of KDB database that is being created. The following types are available: HDB – A
        # Historical Database. The data is only accessible with read-only permissions from one of the FinSpace
        # managed kdb databases mounted to the cluster. RDB – A Realtime Database. This type of database
        # captures all the data from a ticker plant and stores it in memory until the end of day, after which
        # it writes all of its data to a disk and reloads the HDB. This cluster type requires local storage
        # for temporary storage of data during the savedown process. If you specify this field in your
        # request, you must provide the savedownStorageConfiguration parameter. GATEWAY – A gateway cluster
        # allows you to access data across processes in kdb systems. It allows you to create your own routing
        # logic using the initialization scripts and custom code. This type of cluster does not require a
        # writable local storage. GP – A general purpose cluster allows you to quickly iterate on code during
        # development by granting greater access to system commands and enabling a fast reload of custom code.
        # This cluster type can optionally mount databases including cache and savedown storage. For this
        # cluster type, the node count is fixed at 1. It does not support autoscaling and supports only SINGLE
        # AZ mode. Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers based on IAM
        # permissions. It can publish to RDBs, other Tickerplants, and real-time subscribers (RTS).
        # Tickerplants can persist messages to log, which is readable by any RDB environment. It supports only
        # single-node that is only one kdb process.
        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The timestamp at which the cluster was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # An IAM role that defines a set of permissions associated with a cluster. These permissions are
        # assumed when a cluster attempts to access another cluster.
        @[JSON::Field(key: "executionRole")]
        getter execution_role : String?

        # Specifies a Q program that will be run at launch of a cluster. It is a relative path within .zip
        # file that contains the custom code, which will be loaded on the cluster. It must include the file
        # name itself. For example, somedir/init.q .
        @[JSON::Field(key: "initializationScript")]
        getter initialization_script : String?

        # The last time that the cluster was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # A version of the FinSpace managed kdb to run.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String?

        # The status of a cluster. PENDING – The cluster is pending creation. CREATING –The cluster creation
        # process is in progress. CREATE_FAILED– The cluster creation process has failed. RUNNING – The
        # cluster creation process is running. UPDATING – The cluster is in the process of being updated.
        # DELETING – The cluster is in the process of being deleted. DELETED – The cluster has been deleted.
        # DELETE_FAILED – The cluster failed to delete.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # A list of volumes attached to the cluster.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @availability_zone_id : String? = nil,
          @az_mode : String? = nil,
          @cluster_description : String? = nil,
          @cluster_name : String? = nil,
          @cluster_type : String? = nil,
          @created_timestamp : Time? = nil,
          @execution_role : String? = nil,
          @initialization_script : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @release_label : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # The configuration that allows you to choose how you want to update code on a cluster. Depending on
      # the option you choose, you can reduce the time it takes to update the cluster.
      struct KxClusterCodeDeploymentConfiguration
        include JSON::Serializable

        # The type of deployment that you want on a cluster. ROLLING – This options updates the cluster by
        # stopping the exiting q process and starting a new q process with updated configuration. NO_RESTART –
        # This option updates the cluster without stopping the running q process. It is only available for GP
        # type cluster. This option is quicker as it reduces the turn around time to update configuration on a
        # cluster. With this deployment mode, you cannot update the initializationScript and
        # commandLineArguments parameters. FORCE – This option updates the cluster by immediately stopping all
        # the running processes before starting up new ones with the updated configuration.
        @[JSON::Field(key: "deploymentStrategy")]
        getter deployment_strategy : String

        def initialize(
          @deployment_strategy : String
        )
        end
      end

      # Defines the key-value pairs to make them available inside the cluster.
      struct KxCommandLineArgument
        include JSON::Serializable

        # The name of the key.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The value of the key.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The structure of database cache configuration that is used for mapping database paths to cache types
      # in clusters.
      struct KxDatabaseCacheConfiguration
        include JSON::Serializable

        # The type of disk cache. This parameter is used to map the database path to cache storage. The valid
        # values are: CACHE_1000 – This type provides at least 1000 MB/s disk access throughput.
        @[JSON::Field(key: "cacheType")]
        getter cache_type : String

        # Specifies the portions of database that will be loaded into the cache for access.
        @[JSON::Field(key: "dbPaths")]
        getter db_paths : Array(String)

        # The name of the dataview to be used for caching historical data on disk.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String?

        def initialize(
          @cache_type : String,
          @db_paths : Array(String),
          @dataview_name : String? = nil
        )
        end
      end

      # The configuration of data that is available for querying from this database.
      struct KxDatabaseConfiguration
        include JSON::Serializable

        # The name of the kdb database. When this parameter is specified in the structure, S3 with the whole
        # database is included by default.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # Configuration details for the disk cache used to increase performance reading from a kdb database
        # mounted to the cluster.
        @[JSON::Field(key: "cacheConfigurations")]
        getter cache_configurations : Array(Types::KxDatabaseCacheConfiguration)?

        # A unique identifier of the changeset that is associated with the cluster.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The configuration of the dataview to be used with specified cluster.
        @[JSON::Field(key: "dataviewConfiguration")]
        getter dataview_configuration : Types::KxDataviewConfiguration?

        # The name of the dataview to be used for caching historical data on disk.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String?

        def initialize(
          @database_name : String,
          @cache_configurations : Array(Types::KxDatabaseCacheConfiguration)? = nil,
          @changeset_id : String? = nil,
          @dataview_configuration : Types::KxDataviewConfiguration? = nil,
          @dataview_name : String? = nil
        )
        end
      end

      # Details about a FinSpace managed kdb database
      struct KxDatabaseListEntry
        include JSON::Serializable

        # The timestamp at which the database was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # The last time that the database was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @database_name : String? = nil,
          @last_modified_timestamp : Time? = nil
        )
        end
      end

      # The active version of the dataview that is currently in use by this cluster.
      struct KxDataviewActiveVersion
        include JSON::Serializable

        # The list of clusters that are currently using this dataview.
        @[JSON::Field(key: "attachedClusters")]
        getter attached_clusters : Array(String)?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the dataview version was active. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The configuration that contains the database path of the data that you want to place on each
        # selected volume. Each segment must have a unique database path for each volume. If you do not
        # explicitly specify any database path for a volume, they are accessible from the cluster through the
        # default S3/object store segment.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        # A unique identifier of the active version.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @attached_clusters : Array(String)? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil,
          @version_id : String? = nil
        )
        end
      end

      # The structure that stores the configuration details of a dataview.
      struct KxDataviewConfiguration
        include JSON::Serializable

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The unique identifier of the dataview.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String?

        # The version of the dataview corresponding to a given changeset.
        @[JSON::Field(key: "dataviewVersionId")]
        getter dataview_version_id : String?

        # The db path and volume configuration for the segmented database.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        def initialize(
          @changeset_id : String? = nil,
          @dataview_name : String? = nil,
          @dataview_version_id : String? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil
        )
        end
      end

      # A collection of kdb dataview entries.
      struct KxDataviewListEntry
        include JSON::Serializable

        # The active changeset versions for the given dataview entry.
        @[JSON::Field(key: "activeVersions")]
        getter active_versions : Array(Types::KxDataviewActiveVersion)?

        # The option to specify whether you want to apply all the future additions and corrections
        # automatically to the dataview when you ingest new changesets. The default value is false.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the dataview list entry was created in FinSpace. The value is determined as
        # epoch time in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is
        # specified as 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # A unique identifier of the database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A unique identifier of the dataview.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String?

        # A description for the dataview list entry.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the dataview list was updated in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Returns True if the dataview is created as writeable and False otherwise.
        @[JSON::Field(key: "readWrite")]
        getter read_write : Bool?

        # The configuration that contains the database path of the data that you want to place on each
        # selected volume. Each segment must have a unique database path for each volume. If you do not
        # explicitly specify any database path for a volume, they are accessible from the cluster through the
        # default S3/object store segment.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        # The status of a given dataview entry.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @active_versions : Array(Types::KxDataviewActiveVersion)? = nil,
          @auto_update : Bool? = nil,
          @availability_zone_id : String? = nil,
          @az_mode : String? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @database_name : String? = nil,
          @dataview_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @read_write : Bool? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The configuration that contains the database path of the data that you want to place on each
      # selected volume. Each segment must have a unique database path for each volume. If you do not
      # explicitly specify any database path for a volume, they are accessible from the cluster through the
      # default S3/object store segment.
      struct KxDataviewSegmentConfiguration
        include JSON::Serializable

        # The database path of the data that you want to place on each selected volume for the segment. Each
        # segment must have a unique database path for each volume.
        @[JSON::Field(key: "dbPaths")]
        getter db_paths : Array(String)

        # The name of the volume where you want to add data.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String

        # Enables on-demand caching on the selected database path when a particular file or a column of the
        # database is accessed. When on demand caching is True , dataviews perform minimal loading of files on
        # the filesystem as needed. When it is set to False , everything is cached. The default value is False
        # .
        @[JSON::Field(key: "onDemand")]
        getter on_demand : Bool?

        def initialize(
          @db_paths : Array(String),
          @volume_name : String,
          @on_demand : Bool? = nil
        )
        end
      end

      # The configuration that allows you to choose how you want to update the databases on a cluster.
      # Depending on the option you choose, you can reduce the time it takes to update the cluster.
      struct KxDeploymentConfiguration
        include JSON::Serializable

        # The type of deployment that you want on a cluster. ROLLING – This options updates the cluster by
        # stopping the exiting q process and starting a new q process with updated configuration. NO_RESTART –
        # This option updates the cluster without stopping the running q process. It is only available for HDB
        # type cluster. This option is quicker as it reduces the turn around time to update configuration on a
        # cluster. With this deployment mode, you cannot update the initializationScript and
        # commandLineArguments parameters.
        @[JSON::Field(key: "deploymentStrategy")]
        getter deployment_strategy : String

        def initialize(
          @deployment_strategy : String
        )
        end
      end

      # The details of a kdb environment.
      struct KxEnvironment
        include JSON::Serializable

        # The identifier of the availability zones where subnets for the environment are created.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The unique identifier of the AWS account in which you create the kdb environment.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Resource Name (ARN) of the certificate authority:
        @[JSON::Field(key: "certificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The timestamp at which the kdb environment was created in FinSpace. The value is determined as epoch
        # time in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is
        # specified as 1635768000000.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # A list of DNS server name and server IP. This is used to set up Route-53 outbound resolvers.
        @[JSON::Field(key: "customDNSConfiguration")]
        getter custom_dns_configuration : Array(Types::CustomDNSServer)?

        # A unique identifier for the AWS environment infrastructure account.
        @[JSON::Field(key: "dedicatedServiceAccountId")]
        getter dedicated_service_account_id : String?

        # A description of the kdb environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of DNS configuration.
        @[JSON::Field(key: "dnsStatus")]
        getter dns_status : String?

        # The Amazon Resource Name (ARN) of your kdb environment.
        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that appears if a flow fails.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The unique identifier of the KMS key.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the kdb environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the environment creation. CREATE_REQUESTED – Environment creation has been requested.
        # CREATING – Environment is in the process of being created. FAILED_CREATION – Environment creation
        # has failed. CREATED – Environment is successfully created and is currently active. DELETE REQUESTED
        # – Environment deletion has been requested. DELETING – Environment is in the process of being
        # deleted. RETRY_DELETION – Initial environment deletion failed, system is reattempting delete.
        # DELETED – Environment has been deleted. FAILED_DELETION – Environment deletion has failed.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status of the network configuration.
        @[JSON::Field(key: "tgwStatus")]
        getter tgw_status : String?

        # Specifies the transit gateway and network configuration to connect the kdb environment to an
        # internal network.
        @[JSON::Field(key: "transitGatewayConfiguration")]
        getter transit_gateway_configuration : Types::TransitGatewayConfiguration?

        # The timestamp at which the kdb environment was modified in FinSpace. The value is determined as
        # epoch time in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is
        # specified as 1635768000000.
        @[JSON::Field(key: "updateTimestamp")]
        getter update_timestamp : Time?

        def initialize(
          @availability_zone_ids : Array(String)? = nil,
          @aws_account_id : String? = nil,
          @certificate_authority_arn : String? = nil,
          @creation_timestamp : Time? = nil,
          @custom_dns_configuration : Array(Types::CustomDNSServer)? = nil,
          @dedicated_service_account_id : String? = nil,
          @description : String? = nil,
          @dns_status : String? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @error_message : String? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tgw_status : String? = nil,
          @transit_gateway_configuration : Types::TransitGatewayConfiguration? = nil,
          @update_timestamp : Time? = nil
        )
        end
      end

      # The structure containing the size and type of the network attached storage (NAS_1) file system
      # volume.
      struct KxNAS1Configuration
        include JSON::Serializable

        # The size of the network attached storage. For storage type SSD_1000 and SSD_250 you can select the
        # minimum size as 1200 GB or increments of 2400 GB. For storage type HDD_12 you can select the minimum
        # size as 6000 GB or increments of 6000 GB.
        @[JSON::Field(key: "size")]
        getter size : Int32?

        # The type of the network attached storage.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @size : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # A structure that stores metadata for a kdb node.
      struct KxNode
        include JSON::Serializable

        # The identifier of the availability zones where subnets for the environment are created.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The time when a particular node is started. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "launchTime")]
        getter launch_time : Time?

        # A unique identifier for the node.
        @[JSON::Field(key: "nodeId")]
        getter node_id : String?

        # Specifies the status of the cluster nodes. RUNNING – The node is actively serving. PROVISIONING –
        # The node is being prepared.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @availability_zone_id : String? = nil,
          @launch_time : Time? = nil,
          @node_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The size and type of temporary storage that is used to hold data during the savedown process. All
      # the data written to this storage space is lost when the cluster node is restarted.
      struct KxSavedownStorageConfiguration
        include JSON::Serializable

        # The size of temporary storage in gibibytes.
        @[JSON::Field(key: "size")]
        getter size : Int32?

        # The type of writeable storage space for temporarily storing your savedown data. The valid values
        # are: SDS01 – This type represents 3000 IOPS and io2 ebs volume type.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The name of the kdb volume that you want to use as writeable save-down storage for clusters.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String?

        def initialize(
          @size : Int32? = nil,
          @type : String? = nil,
          @volume_name : String? = nil
        )
        end
      end

      # A structure for storing metadata of scaling group.
      struct KxScalingGroup
        include JSON::Serializable

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The list of clusters currently active in a given scaling group.
        @[JSON::Field(key: "clusters")]
        getter clusters : Array(String)?

        # The timestamp at which the scaling group was created in FinSpace. The value is determined as epoch
        # time in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is
        # specified as 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The memory and CPU capabilities of the scaling group host on which FinSpace Managed kdb clusters
        # will be placed. You can add one of the following values: kx.sg.large – The host type with a
        # configuration of 16 GiB memory and 2 vCPUs. kx.sg.xlarge – The host type with a configuration of 32
        # GiB memory and 4 vCPUs. kx.sg.2xlarge – The host type with a configuration of 64 GiB memory and 8
        # vCPUs. kx.sg.4xlarge – The host type with a configuration of 108 GiB memory and 16 vCPUs.
        # kx.sg.8xlarge – The host type with a configuration of 216 GiB memory and 32 vCPUs. kx.sg.16xlarge –
        # The host type with a configuration of 432 GiB memory and 64 vCPUs. kx.sg.32xlarge – The host type
        # with a configuration of 864 GiB memory and 128 vCPUs. kx.sg1.16xlarge – The host type with a
        # configuration of 1949 GiB memory and 64 vCPUs. kx.sg1.24xlarge – The host type with a configuration
        # of 2948 GiB memory and 96 vCPUs.
        @[JSON::Field(key: "hostType")]
        getter host_type : String?

        # The last time that the scaling group was updated in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # A unique identifier for the kdb scaling group.
        @[JSON::Field(key: "scalingGroupName")]
        getter scaling_group_name : String?

        # The status of scaling groups.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @availability_zone_id : String? = nil,
          @clusters : Array(String)? = nil,
          @created_timestamp : Time? = nil,
          @host_type : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @scaling_group_name : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The structure that stores the capacity configuration details of a scaling group.
      struct KxScalingGroupConfiguration
        include JSON::Serializable

        # A reservation of the minimum amount of memory that should be available on the scaling group for a
        # kdb cluster to be successfully placed in a scaling group.
        @[JSON::Field(key: "memoryReservation")]
        getter memory_reservation : Int32

        # The number of kdb cluster nodes.
        @[JSON::Field(key: "nodeCount")]
        getter node_count : Int32

        # A unique identifier for the kdb scaling group.
        @[JSON::Field(key: "scalingGroupName")]
        getter scaling_group_name : String

        # The number of vCPUs that you want to reserve for each node of this kdb cluster on the scaling group
        # host.
        @[JSON::Field(key: "cpu")]
        getter cpu : Float64?

        # An optional hard limit on the amount of memory a kdb cluster can use.
        @[JSON::Field(key: "memoryLimit")]
        getter memory_limit : Int32?

        def initialize(
          @memory_reservation : Int32,
          @node_count : Int32,
          @scaling_group_name : String,
          @cpu : Float64? = nil,
          @memory_limit : Int32? = nil
        )
        end
      end

      # A structure that stores metadata for a kdb user.
      struct KxUser
        include JSON::Serializable

        # The timestamp at which the kdb user was created.
        @[JSON::Field(key: "createTimestamp")]
        getter create_timestamp : Time?

        # The IAM role ARN that is associated with the user.
        @[JSON::Field(key: "iamRole")]
        getter iam_role : String?

        # The timestamp at which the kdb user was updated.
        @[JSON::Field(key: "updateTimestamp")]
        getter update_timestamp : Time?

        # The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how to
        # use ARNs in policies, see IAM Identifiers in the IAM User Guide .
        @[JSON::Field(key: "userArn")]
        getter user_arn : String?

        # A unique identifier for the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @create_timestamp : Time? = nil,
          @iam_role : String? = nil,
          @update_timestamp : Time? = nil,
          @user_arn : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # The structure that contains the metadata of the volume.
      struct KxVolume
        include JSON::Serializable

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # The timestamp at which the volume was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # A description of the volume.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The last time that the volume was updated in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # The status of volume. CREATING – The volume creation is in progress. CREATE_FAILED – The volume
        # creation has failed. ACTIVE – The volume is active. UPDATING – The volume is in the process of being
        # updated. UPDATE_FAILED – The update action failed. UPDATED – The volume is successfully updated.
        # DELETING – The volume is in the process of being deleted. DELETE_FAILED – The system failed to
        # delete the volume. DELETED – The volume is successfully deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # A unique identifier for the volume.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String?

        # The type of file system volume. Currently, FinSpace only supports NAS_1 volume type.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @availability_zone_ids : Array(String)? = nil,
          @az_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @volume_name : String? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # A service limit or quota is exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListEnvironmentsRequest
        include JSON::Serializable

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token generated by FinSpace that specifies where to continue pagination if a previous request was
        # truncated. To get the next set of pages, pass in the nextToken nextToken value from the response
        # object of the previous page call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentsResponse
        include JSON::Serializable

        # A list of all of your FinSpace environments.
        @[JSON::Field(key: "environments")]
        getter environments : Array(Types::Environment)?

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(Types::Environment)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxChangesetsRequest
        include JSON::Serializable

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @database_name : String,
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxChangesetsResponse
        include JSON::Serializable

        # A list of changesets for a database.
        @[JSON::Field(key: "kxChangesets")]
        getter kx_changesets : Array(Types::KxChangesetListEntry)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @kx_changesets : Array(Types::KxChangesetListEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxClusterNodesRequest
        include JSON::Serializable

        # A unique name for the cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxClusterNodesResponse
        include JSON::Serializable

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of nodes associated with the cluster.
        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::KxNode)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::KxNode)? = nil
        )
        end
      end

      struct ListKxClustersRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # Specifies the type of KDB database that is being created. The following types are available: HDB – A
        # Historical Database. The data is only accessible with read-only permissions from one of the FinSpace
        # managed kdb databases mounted to the cluster. RDB – A Realtime Database. This type of database
        # captures all the data from a ticker plant and stores it in memory until the end of day, after which
        # it writes all of its data to a disk and reloads the HDB. This cluster type requires local storage
        # for temporary storage of data during the savedown process. If you specify this field in your
        # request, you must provide the savedownStorageConfiguration parameter. GATEWAY – A gateway cluster
        # allows you to access data across processes in kdb systems. It allows you to create your own routing
        # logic using the initialization scripts and custom code. This type of cluster does not require a
        # writable local storage. GP – A general purpose cluster allows you to quickly iterate on code during
        # development by granting greater access to system commands and enabling a fast reload of custom code.
        # This cluster type can optionally mount databases including cache and savedown storage. For this
        # cluster type, the node count is fixed at 1. It does not support autoscaling and supports only SINGLE
        # AZ mode. Tickerplant – A tickerplant cluster allows you to subscribe to feed handlers based on IAM
        # permissions. It can publish to RDBs, other Tickerplants, and real-time subscribers (RTS).
        # Tickerplants can persist messages to log, which is readable by any RDB environment. It supports only
        # single-node that is only one kdb process.
        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String,
          @cluster_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxClustersResponse
        include JSON::Serializable

        # Lists the cluster details.
        @[JSON::Field(key: "kxClusterSummaries")]
        getter kx_cluster_summaries : Array(Types::KxCluster)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @kx_cluster_summaries : Array(Types::KxCluster)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxDatabasesRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxDatabasesResponse
        include JSON::Serializable

        # A list of databases in the kdb environment.
        @[JSON::Field(key: "kxDatabases")]
        getter kx_databases : Array(Types::KxDatabaseListEntry)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @kx_databases : Array(Types::KxDatabaseListEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxDataviewsRequest
        include JSON::Serializable

        # The name of the database where the dataviews were created.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the kdb environment, for which you want to retrieve a list of dataviews.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @database_name : String,
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxDataviewsResponse
        include JSON::Serializable

        # The list of kdb dataviews that are currently active for the given database.
        @[JSON::Field(key: "kxDataviews")]
        getter kx_dataviews : Array(Types::KxDataviewListEntry)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @kx_dataviews : Array(Types::KxDataviewListEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxEnvironmentsRequest
        include JSON::Serializable

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxEnvironmentsResponse
        include JSON::Serializable

        # A list of environments in an account.
        @[JSON::Field(key: "environments")]
        getter environments : Array(Types::KxEnvironment)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(Types::KxEnvironment)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxScalingGroupsRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment, for which you want to retrieve a list of scaling
        # groups.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxScalingGroupsResponse
        include JSON::Serializable

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of scaling groups available in a kdb environment.
        @[JSON::Field(key: "scalingGroups")]
        getter scaling_groups : Array(Types::KxScalingGroup)?

        def initialize(
          @next_token : String? = nil,
          @scaling_groups : Array(Types::KxScalingGroup)? = nil
        )
        end
      end

      struct ListKxUsersRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKxUsersResponse
        include JSON::Serializable

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of users in a kdb environment.
        @[JSON::Field(key: "users")]
        getter users : Array(Types::KxUser)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::KxUser)? = nil
        )
        end
      end

      struct ListKxVolumesRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment, whose clusters can attach to the volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of file system volume. Currently, FinSpace only supports NAS_1 volume type.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @environment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @volume_type : String? = nil
        )
        end
      end

      struct ListKxVolumesResponse
        include JSON::Serializable

        # A summary of volumes.
        @[JSON::Field(key: "kxVolumeSummaries")]
        getter kx_volume_summaries : Array(Types::KxVolume)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @kx_volume_summaries : Array(Types::KxVolume)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of all tags for a resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The network access control list (ACL) is an optional layer of security for your VPC that acts as a
      # firewall for controlling traffic in and out of one or more subnets. The entry is a set of numbered
      # ingress and egress rules that determine whether a packet should be allowed in or out of a subnet
      # associated with the ACL. We process the entries in the ACL according to the rule numbers, in
      # ascending order.
      struct NetworkACLEntry
        include JSON::Serializable

        # The IPv4 network range to allow or deny, in CIDR notation. For example, 172.16.0.0/24 . We modify
        # the specified CIDR block to its canonical form. For example, if you specify 100.68.0.18/18 , we
        # modify it to 100.68.0.0/18 .
        @[JSON::Field(key: "cidrBlock")]
        getter cidr_block : String

        # The protocol number. A value of -1 means all the protocols.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # Indicates whether to allow or deny the traffic that matches the rule.
        @[JSON::Field(key: "ruleAction")]
        getter rule_action : String

        # The rule number for the entry. For example 100 . All the network ACL entries are processed in
        # ascending order by rule number.
        @[JSON::Field(key: "ruleNumber")]
        getter rule_number : Int32

        # Defines the ICMP protocol that consists of the ICMP type and code.
        @[JSON::Field(key: "icmpTypeCode")]
        getter icmp_type_code : Types::IcmpTypeCode?

        # The range of ports the rule applies to.
        @[JSON::Field(key: "portRange")]
        getter port_range : Types::PortRange?

        def initialize(
          @cidr_block : String,
          @protocol : String,
          @rule_action : String,
          @rule_number : Int32,
          @icmp_type_code : Types::IcmpTypeCode? = nil,
          @port_range : Types::PortRange? = nil
        )
        end
      end

      # The range of ports the rule applies to.
      struct PortRange
        include JSON::Serializable

        # The first port in the range.
        @[JSON::Field(key: "from")]
        getter from : Int32

        # The last port in the range.
        @[JSON::Field(key: "to")]
        getter to : Int32

        def initialize(
          @from : Int32,
          @to : Int32
        )
        end
      end

      # The specified resource group already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more resources can't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use Service Quotas to request a service quota increase.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration information for the superuser.
      struct SuperuserParameters
        include JSON::Serializable

        # The email address of the superuser.
        @[JSON::Field(key: "emailAddress")]
        getter email_address : String

        # The first name of the superuser.
        @[JSON::Field(key: "firstName")]
        getter first_name : String

        # The last name of the superuser.
        @[JSON::Field(key: "lastName")]
        getter last_name : String

        def initialize(
          @email_address : String,
          @first_name : String,
          @last_name : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # One or more tags to be assigned to the resource.
        @[JSON::Field(key: "tags")]
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

      # A configuration to store the Tickerplant logs. It consists of a list of volumes that will be mounted
      # to your cluster. For the cluster type Tickerplant , the location of the TP volume on the cluster
      # will be available by using the global variable .aws.tp_log_path .
      struct TickerplantLogConfiguration
        include JSON::Serializable

        # The name of the volumes for tickerplant logs.
        @[JSON::Field(key: "tickerplantLogVolumes")]
        getter tickerplant_log_volumes : Array(String)?

        def initialize(
          @tickerplant_log_volumes : Array(String)? = nil
        )
        end
      end

      # The structure of the transit gateway and network configuration that is used to connect the kdb
      # environment to an internal network.
      struct TransitGatewayConfiguration
        include JSON::Serializable

        # The routing CIDR on behalf of kdb environment. It could be any "/26 range in the 100.64.0.0 CIDR
        # space. After providing, it will be added to the customer's transit gateway routing table so that the
        # traffics could be routed to kdb network.
        @[JSON::Field(key: "routableCIDRSpace")]
        getter routable_cidr_space : String

        # The identifier of the transit gateway created by the customer to connect outbound traffics from kdb
        # network to your internal network.
        @[JSON::Field(key: "transitGatewayID")]
        getter transit_gateway_id : String

        # The rules that define how you manage the outbound traffic from kdb network to your internal network.
        @[JSON::Field(key: "attachmentNetworkAclConfiguration")]
        getter attachment_network_acl_configuration : Array(Types::NetworkACLEntry)?

        def initialize(
          @routable_cidr_space : String,
          @transit_gateway_id : String,
          @attachment_network_acl_configuration : Array(Types::NetworkACLEntry)? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # A FinSpace resource from which you want to remove a tag or tags. The value for this parameter is an
        # Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys (names) of one or more tags to be removed.
        @[JSON::Field(key: "tagKeys")]
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

      struct UpdateEnvironmentRequest
        include JSON::Serializable

        # The identifier of the FinSpace environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The description of the environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Authentication mode for the environment. FEDERATED - Users access FinSpace through Single Sign On
        # (SSO) via your Identity provider. LOCAL - Users access FinSpace via email and password managed
        # within the FinSpace environment.
        @[JSON::Field(key: "federationMode")]
        getter federation_mode : String?

        @[JSON::Field(key: "federationParameters")]
        getter federation_parameters : Types::FederationParameters?

        # The name of the environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @environment_id : String,
          @description : String? = nil,
          @federation_mode : String? = nil,
          @federation_parameters : Types::FederationParameters? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateEnvironmentResponse
        include JSON::Serializable

        # Returns the FinSpace environment object.
        @[JSON::Field(key: "environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end

      struct UpdateKxClusterCodeConfigurationRequest
        include JSON::Serializable

        # The name of the cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        @[JSON::Field(key: "code")]
        getter code : Types::CodeConfiguration

        # A unique identifier of the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the key-value pairs to make them available inside the cluster. You cannot update this
        # parameter for a NO_RESTART deployment.
        @[JSON::Field(key: "commandLineArguments")]
        getter command_line_arguments : Array(Types::KxCommandLineArgument)?

        # The configuration that allows you to choose how you want to update the code on a cluster.
        @[JSON::Field(key: "deploymentConfiguration")]
        getter deployment_configuration : Types::KxClusterCodeDeploymentConfiguration?

        # Specifies a Q program that will be run at launch of a cluster. It is a relative path within .zip
        # file that contains the custom code, which will be loaded on the cluster. It must include the file
        # name itself. For example, somedir/init.q . You cannot update this parameter for a NO_RESTART
        # deployment.
        @[JSON::Field(key: "initializationScript")]
        getter initialization_script : String?

        def initialize(
          @cluster_name : String,
          @code : Types::CodeConfiguration,
          @environment_id : String,
          @client_token : String? = nil,
          @command_line_arguments : Array(Types::KxCommandLineArgument)? = nil,
          @deployment_configuration : Types::KxClusterCodeDeploymentConfiguration? = nil,
          @initialization_script : String? = nil
        )
        end
      end

      struct UpdateKxClusterCodeConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateKxClusterDatabasesRequest
        include JSON::Serializable

        # A unique name for the cluster that you want to modify.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The structure of databases mounted on the cluster.
        @[JSON::Field(key: "databases")]
        getter databases : Array(Types::KxDatabaseConfiguration)

        # The unique identifier of a kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration that allows you to choose how you want to update the databases on a cluster.
        @[JSON::Field(key: "deploymentConfiguration")]
        getter deployment_configuration : Types::KxDeploymentConfiguration?

        def initialize(
          @cluster_name : String,
          @databases : Array(Types::KxDatabaseConfiguration),
          @environment_id : String,
          @client_token : String? = nil,
          @deployment_configuration : Types::KxDeploymentConfiguration? = nil
        )
        end
      end

      struct UpdateKxClusterDatabasesResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateKxDatabaseRequest
        include JSON::Serializable

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A description of the database.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @client_token : String,
          @database_name : String,
          @environment_id : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateKxDatabaseResponse
        include JSON::Serializable

        # The name of the kdb database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # A description of the database.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the database was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        def initialize(
          @database_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil
        )
        end
      end

      struct UpdateKxDataviewRequest
        include JSON::Serializable

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The name of the dataview that you want to update.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String

        # A unique identifier for the kdb environment, where you want to update the dataview.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The description for a dataview.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration that contains the database path of the data that you want to place on each
        # selected volume. Each segment must have a unique database path for each volume. If you do not
        # explicitly specify any database path for a volume, they are accessible from the cluster through the
        # default S3/object store segment.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        def initialize(
          @client_token : String,
          @database_name : String,
          @dataview_name : String,
          @environment_id : String,
          @changeset_id : String? = nil,
          @description : String? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil
        )
        end
      end

      struct UpdateKxDataviewResponse
        include JSON::Serializable

        # The current active changeset versions of the database on the given dataview.
        @[JSON::Field(key: "activeVersions")]
        getter active_versions : Array(Types::KxDataviewActiveVersion)?

        # The option to specify whether you want to apply all the future additions and corrections
        # automatically to the dataview when new changesets are ingested. The default value is false.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneId")]
        getter availability_zone_id : String?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # A unique identifier for the changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the dataview was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The name of the database.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # The name of the database under which the dataview was created.
        @[JSON::Field(key: "dataviewName")]
        getter dataview_name : String?

        # A description of the dataview.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment, where you want to update the dataview.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the dataview was updated in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Returns True if the dataview is created as writeable and False otherwise.
        @[JSON::Field(key: "readWrite")]
        getter read_write : Bool?

        # The configuration that contains the database path of the data that you want to place on each
        # selected volume. Each segment must have a unique database path for each volume. If you do not
        # explicitly specify any database path for a volume, they are accessible from the cluster through the
        # default S3/object store segment.
        @[JSON::Field(key: "segmentConfigurations")]
        getter segment_configurations : Array(Types::KxDataviewSegmentConfiguration)?

        # The status of dataview creation. CREATING – The dataview creation is in progress. UPDATING – The
        # dataview is in the process of being updated. ACTIVE – The dataview is active.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @active_versions : Array(Types::KxDataviewActiveVersion)? = nil,
          @auto_update : Bool? = nil,
          @availability_zone_id : String? = nil,
          @az_mode : String? = nil,
          @changeset_id : String? = nil,
          @created_timestamp : Time? = nil,
          @database_name : String? = nil,
          @dataview_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @read_write : Bool? = nil,
          @segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateKxEnvironmentNetworkRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of DNS server name and server IP. This is used to set up Route-53 outbound resolvers.
        @[JSON::Field(key: "customDNSConfiguration")]
        getter custom_dns_configuration : Array(Types::CustomDNSServer)?

        # Specifies the transit gateway and network configuration to connect the kdb environment to an
        # internal network.
        @[JSON::Field(key: "transitGatewayConfiguration")]
        getter transit_gateway_configuration : Types::TransitGatewayConfiguration?

        def initialize(
          @environment_id : String,
          @client_token : String? = nil,
          @custom_dns_configuration : Array(Types::CustomDNSServer)? = nil,
          @transit_gateway_configuration : Types::TransitGatewayConfiguration? = nil
        )
        end
      end

      struct UpdateKxEnvironmentNetworkResponse
        include JSON::Serializable

        # The identifier of the availability zones where subnets for the environment are created.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The unique identifier of the AWS account that is used to create the kdb environment.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The timestamp at which the kdb environment was created in FinSpace.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # A list of DNS server name and server IP. This is used to set up Route-53 outbound resolvers.
        @[JSON::Field(key: "customDNSConfiguration")]
        getter custom_dns_configuration : Array(Types::CustomDNSServer)?

        # A unique identifier for the AWS environment infrastructure account.
        @[JSON::Field(key: "dedicatedServiceAccountId")]
        getter dedicated_service_account_id : String?

        # The description of the environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of DNS configuration.
        @[JSON::Field(key: "dnsStatus")]
        getter dns_status : String?

        # The ARN identifier of the environment.
        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that appears if a flow fails.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The KMS key ID to encrypt your data in the FinSpace environment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the kdb environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the kdb environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status of the network configuration.
        @[JSON::Field(key: "tgwStatus")]
        getter tgw_status : String?

        @[JSON::Field(key: "transitGatewayConfiguration")]
        getter transit_gateway_configuration : Types::TransitGatewayConfiguration?

        # The timestamp at which the kdb environment was updated.
        @[JSON::Field(key: "updateTimestamp")]
        getter update_timestamp : Time?

        def initialize(
          @availability_zone_ids : Array(String)? = nil,
          @aws_account_id : String? = nil,
          @creation_timestamp : Time? = nil,
          @custom_dns_configuration : Array(Types::CustomDNSServer)? = nil,
          @dedicated_service_account_id : String? = nil,
          @description : String? = nil,
          @dns_status : String? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @error_message : String? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tgw_status : String? = nil,
          @transit_gateway_configuration : Types::TransitGatewayConfiguration? = nil,
          @update_timestamp : Time? = nil
        )
        end
      end

      struct UpdateKxEnvironmentRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the kdb environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the kdb environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @environment_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateKxEnvironmentResponse
        include JSON::Serializable

        # The identifier of the availability zones where subnets for the environment are created.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The unique identifier of the AWS account that is used to create the kdb environment.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The timestamp at which the kdb environment was created in FinSpace.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time?

        # A list of DNS server name and server IP. This is used to set up Route-53 outbound resolvers.
        @[JSON::Field(key: "customDNSConfiguration")]
        getter custom_dns_configuration : Array(Types::CustomDNSServer)?

        # A unique identifier for the AWS environment infrastructure account.
        @[JSON::Field(key: "dedicatedServiceAccountId")]
        getter dedicated_service_account_id : String?

        # The description of the environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of DNS configuration.
        @[JSON::Field(key: "dnsStatus")]
        getter dns_status : String?

        # The ARN identifier of the environment.
        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String?

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that appears if a flow fails.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The KMS key ID to encrypt your data in the FinSpace environment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The name of the kdb environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the kdb environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status of the network configuration.
        @[JSON::Field(key: "tgwStatus")]
        getter tgw_status : String?

        @[JSON::Field(key: "transitGatewayConfiguration")]
        getter transit_gateway_configuration : Types::TransitGatewayConfiguration?

        # The timestamp at which the kdb environment was updated.
        @[JSON::Field(key: "updateTimestamp")]
        getter update_timestamp : Time?

        def initialize(
          @availability_zone_ids : Array(String)? = nil,
          @aws_account_id : String? = nil,
          @creation_timestamp : Time? = nil,
          @custom_dns_configuration : Array(Types::CustomDNSServer)? = nil,
          @dedicated_service_account_id : String? = nil,
          @description : String? = nil,
          @dns_status : String? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @error_message : String? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tgw_status : String? = nil,
          @transit_gateway_configuration : Types::TransitGatewayConfiguration? = nil,
          @update_timestamp : Time? = nil
        )
        end
      end

      struct UpdateKxUserRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The IAM role ARN that is associated with the user.
        @[JSON::Field(key: "iamRole")]
        getter iam_role : String

        # A unique identifier for the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @environment_id : String,
          @iam_role : String,
          @user_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateKxUserResponse
        include JSON::Serializable

        # A unique identifier for the kdb environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The IAM role ARN that is associated with the user.
        @[JSON::Field(key: "iamRole")]
        getter iam_role : String?

        # The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how to
        # use ARNs in policies, see IAM Identifiers in the IAM User Guide .
        @[JSON::Field(key: "userArn")]
        getter user_arn : String?

        # A unique identifier for the user.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @environment_id : String? = nil,
          @iam_role : String? = nil,
          @user_arn : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      struct UpdateKxVolumeRequest
        include JSON::Serializable

        # A unique identifier for the kdb environment where you created the storage volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # A unique identifier for the volume.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the volume.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the configuration for the Network attached storage (NAS_1) file system volume.
        @[JSON::Field(key: "nas1Configuration")]
        getter nas1_configuration : Types::KxNAS1Configuration?

        def initialize(
          @environment_id : String,
          @volume_name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @nas1_configuration : Types::KxNAS1Configuration? = nil
        )
        end
      end

      struct UpdateKxVolumeResponse
        include JSON::Serializable

        # Specifies the clusters that a volume is attached to.
        @[JSON::Field(key: "attachedClusters")]
        getter attached_clusters : Array(Types::KxAttachedCluster)?

        # The identifier of the availability zones.
        @[JSON::Field(key: "availabilityZoneIds")]
        getter availability_zone_ids : Array(String)?

        # The number of availability zones you want to assign per volume. Currently, FinSpace only supports
        # SINGLE for volumes. This places dataview in a single AZ.
        @[JSON::Field(key: "azMode")]
        getter az_mode : String?

        # The timestamp at which the volume was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createdTimestamp")]
        getter created_timestamp : Time?

        # The description for the volume.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the kdb environment where you want to update the volume.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The last time that the volume was updated in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "lastModifiedTimestamp")]
        getter last_modified_timestamp : Time?

        # Specifies the configuration for the Network attached storage (NAS_1) file system volume.
        @[JSON::Field(key: "nas1Configuration")]
        getter nas1_configuration : Types::KxNAS1Configuration?

        # The status of the volume. CREATING – The volume creation is in progress. CREATE_FAILED – The volume
        # creation has failed. ACTIVE – The volume is active. UPDATING – The volume is in the process of being
        # updated. UPDATE_FAILED – The update action failed. UPDATED – The volume is successfully updated.
        # DELETING – The volume is in the process of being deleted. DELETE_FAILED – The system failed to
        # delete the volume. DELETED – The volume is successfully deleted.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The error message when a failed state occurs.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The ARN identifier of the volume.
        @[JSON::Field(key: "volumeArn")]
        getter volume_arn : String?

        # A unique identifier for the volume that you want to update.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String?

        # The type of file system volume. Currently, FinSpace only supports NAS_1 volume type.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @attached_clusters : Array(Types::KxAttachedCluster)? = nil,
          @availability_zone_ids : Array(String)? = nil,
          @az_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_modified_timestamp : Time? = nil,
          @nas1_configuration : Types::KxNAS1Configuration? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @volume_arn : String? = nil,
          @volume_name : String? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The structure that consists of name and type of volume.
      struct Volume
        include JSON::Serializable

        # A unique identifier for the volume.
        @[JSON::Field(key: "volumeName")]
        getter volume_name : String?

        # The type of file system volume. Currently, FinSpace only supports NAS_1 volume type.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @volume_name : String? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Configuration details about the network where the Privatelink endpoint of the cluster resides.
      struct VpcConfiguration
        include JSON::Serializable

        # The IP address type for cluster network configuration parameters. The following type is available:
        # IP_V4 – IP address version 4
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The unique identifier of the VPC security group applied to the VPC endpoint ENI for the cluster.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The identifier of the subnet that the Privatelink VPC endpoint uses to connect to the cluster.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the VPC endpoint.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @ip_address_type : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end
    end
  end
end
