require "json"

module AwsSdk
  module TimestreamInfluxDB
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request conflicts with an existing resource in Timestream for InfluxDB.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the Timestream for InfluxDB resource associated with the request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of Timestream for InfluxDB resource associated with the request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct CreateDbClusterInput
        include JSON::Serializable

        # The Timestream for InfluxDB DB instance type to run InfluxDB on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String

        # The name that uniquely identifies the DB cluster when interacting with the Amazon Timestream for
        # InfluxDB API and CLI commands. This name will also be a prefix included in the endpoint. DB cluster
        # names must be unique per customer and per region.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of VPC security group IDs to associate with the Timestream for InfluxDB cluster.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)

        # A list of VPC subnet IDs to associate with the DB cluster. Provide at least two VPC subnet IDs in
        # different Availability Zones when deploying with a Multi-AZ standby.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)

        # The amount of storage to allocate for your DB storage type in GiB (gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The name of the initial InfluxDB bucket. All InfluxDB data is stored in a bucket. A bucket combines
        # the concept of a database and a retention period (the duration of time that each data point
        # persists). A bucket belongs to an organization.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The ID of the DB parameter group to assign to your DB cluster. DB parameter groups specify how the
        # database is configured. For example, DB parameter groups can specify the limit for query
        # concurrency.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type to read and write InfluxDB data. You can choose between
        # three different types of provisioned Influx IOPS Included storage according to your workload
        # requirements: Influx I/O Included 3000 IOPS Influx I/O Included 12000 IOPS Influx I/O Included 16000
        # IOPS
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies the type of cluster to create.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # Specifies the behavior of failure recovery when the primary node of the cluster fails.
        @[JSON::Field(key: "failoverMode")]
        getter failover_mode : String?

        # Configuration for sending InfluxDB engine logs to a specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the network type of the Timestream for InfluxDB cluster is IPv4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The name of the initial organization for the initial admin user in InfluxDB. An InfluxDB
        # organization is a workspace for a group of users.
        @[JSON::Field(key: "organization")]
        getter organization : String?

        # The password of the initial admin user created in InfluxDB. This password will allow you to access
        # the InfluxDB UI to perform various administrative tasks and also use the InfluxDB CLI to create an
        # operator token. These attributes will be stored in a secret created in Secrets Manager in your
        # account.
        @[JSON::Field(key: "password")]
        getter password : String?

        # The port number on which InfluxDB accepts connections. Valid Values: 1024-65535 Default: 8086 for
        # InfluxDB v2, 8181 for InfluxDB v3 Constraints: The value can't be 2375-2376, 7788-7799, 8090, or
        # 51678-51680
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Configures the Timestream for InfluxDB cluster with a public IP to facilitate access from outside
        # the VPC.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # A list of key-value pairs to associate with the DB instance.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The username of the initial admin user created in InfluxDB. Must start with a letter and can't end
        # with a hyphen or contain two consecutive hyphens. For example, my-user1. This username will allow
        # you to access the InfluxDB UI to perform various administrative tasks and also use the InfluxDB CLI
        # to create an operator token. These attributes will be stored in a secret created in Secrets Manager
        # in your account.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @db_instance_type : String,
          @name : String,
          @vpc_security_group_ids : Array(String),
          @vpc_subnet_ids : Array(String),
          @allocated_storage : Int32? = nil,
          @bucket : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @failover_mode : String? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @organization : String? = nil,
          @password : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @tags : Hash(String, String)? = nil,
          @username : String? = nil
        )
        end
      end

      struct CreateDbClusterOutput
        include JSON::Serializable

        # A service-generated unique identifier.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String?

        # The status of the DB cluster.
        @[JSON::Field(key: "dbClusterStatus")]
        getter db_cluster_status : String?

        def initialize(
          @db_cluster_id : String? = nil,
          @db_cluster_status : String? = nil
        )
        end
      end

      struct CreateDbInstanceInput
        include JSON::Serializable

        # The amount of storage to allocate for your DB storage type in GiB (gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32

        # The Timestream for InfluxDB DB instance type to run InfluxDB on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String

        # The name that uniquely identifies the DB instance when interacting with the Amazon Timestream for
        # InfluxDB API and CLI commands. This name will also be a prefix included in the endpoint. DB instance
        # names must be unique per customer and per region.
        @[JSON::Field(key: "name")]
        getter name : String

        # The password of the initial admin user created in InfluxDB v2. This password will allow you to
        # access the InfluxDB UI to perform various administrative tasks and also use the InfluxDB CLI to
        # create an operator token. These attributes will be stored in a Secret created in Secrets Manager in
        # your account.
        @[JSON::Field(key: "password")]
        getter password : String

        # A list of VPC security group IDs to associate with the DB instance.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)

        # A list of VPC subnet IDs to associate with the DB instance. Provide at least two VPC subnet IDs in
        # different availability zones when deploying with a Multi-AZ standby.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)

        # The name of the initial InfluxDB bucket. All InfluxDB data is stored in a bucket. A bucket combines
        # the concept of a database and a retention period (the duration of time that each data point
        # persists). A bucket belongs to an organization.
        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The id of the DB parameter group to assign to your DB instance. DB parameter groups specify how the
        # database is configured. For example, DB parameter groups can specify the limit for query
        # concurrency.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type to read and write InfluxDB data. You can choose between
        # 3 different types of provisioned Influx IOPS included storage according to your workloads
        # requirements: Influx IO Included 3000 IOPS Influx IO Included 12000 IOPS Influx IO Included 16000
        # IOPS
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies whether the DB instance will be deployed as a standalone instance or with a Multi-AZ
        # standby for high availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # Configuration for sending InfluxDB engine logs to a specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The name of the initial organization for the initial admin user in InfluxDB. An InfluxDB
        # organization is a workspace for a group of users.
        @[JSON::Field(key: "organization")]
        getter organization : String?

        # The port number on which InfluxDB accepts connections. Valid Values: 1024-65535 Default: 8086
        # Constraints: The value can't be 2375-2376, 7788-7799, 8090, or 51678-51680
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Configures the DB instance with a public IP to facilitate access.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # A list of key-value pairs to associate with the DB instance.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The username of the initial admin user created in InfluxDB. Must start with a letter and can't end
        # with a hyphen or contain two consecutive hyphens. For example, my-user1. This username will allow
        # you to access the InfluxDB UI to perform various administrative tasks and also use the InfluxDB CLI
        # to create an operator token. These attributes will be stored in a Secret created in Amazon Secrets
        # Manager in your account.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @allocated_storage : Int32,
          @db_instance_type : String,
          @name : String,
          @password : String,
          @vpc_security_group_ids : Array(String),
          @vpc_subnet_ids : Array(String),
          @bucket : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @organization : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @tags : Hash(String, String)? = nil,
          @username : String? = nil
        )
        end
      end

      struct CreateDbInstanceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB instance.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # The customer-supplied name that uniquely identifies the DB instance when interacting with the Amazon
        # Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of VPC subnet IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)

        # The amount of storage allocated for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Availability Zone in which the DB instance resides.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # Specifies the DbCluster to which this DbInstance belongs to.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String?

        # The Timestream for InfluxDB instance type that InfluxDB runs on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The id of the DB parameter group assigned to your DB instance.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ Standby for
        # High availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial InfluxDB
        # authorization parameters. The secret value is a JSON formatted key-value pair holding InfluxDB
        # authorization values: organization, bucket, username, and password.
        @[JSON::Field(key: "influxAuthParametersSecretArn")]
        getter influx_auth_parameters_secret_arn : String?

        # Specifies the DbInstance's role in the cluster.
        @[JSON::Field(key: "instanceMode")]
        getter instance_mode : String?

        # Specifies the DbInstance's roles in the cluster.
        @[JSON::Field(key: "instanceModes")]
        getter instance_modes : Array(String)?

        # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections. The default value is 8086.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Indicates if the DB instance has a public IP to facilitate access.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The Availability Zone in which the standby instance is located when deploying with a MultiAZ standby
        # instance.
        @[JSON::Field(key: "secondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # The status of the DB instance.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of VPC security group IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @vpc_subnet_ids : Array(String),
          @allocated_storage : Int32? = nil,
          @availability_zone : String? = nil,
          @db_cluster_id : String? = nil,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @influx_auth_parameters_secret_arn : String? = nil,
          @instance_mode : String? = nil,
          @instance_modes : Array(String)? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @secondary_availability_zone : String? = nil,
          @status : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct CreateDbParameterGroupInput
        include JSON::Serializable

        # The name of the DB parameter group. The name must be unique per customer and per region.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the DB parameter group.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of the parameters that comprise the DB parameter group.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::Parameters?

        # A list of key-value pairs to associate with the DB parameter group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @parameters : Types::Parameters? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDbParameterGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARM) of the DB parameter group.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # The customer-supplied name that uniquely identifies the DB parameter group when interacting with the
        # Amazon Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the DB parameter group.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of the parameters that comprise the DB parameter group.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::Parameters?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @description : String? = nil,
          @parameters : Types::Parameters? = nil
        )
        end
      end

      # Describes a summary of a Timestream for InfluxDB cluster.
      struct DbClusterSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB cluster.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Service-generated unique identifier of the DB cluster to retrieve.
        @[JSON::Field(key: "id")]
        getter id : String

        # Customer supplied name of the Timestream for InfluxDB cluster.
        @[JSON::Field(key: "name")]
        getter name : String

        # The amount of storage allocated for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Timestream for InfluxDB DB instance type that InfluxDB runs on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Deployment type of the DB cluster
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to the Timestream for InfluxDB cluster for write and read operations.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The engine type of your DB cluster.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        # Specifies whether the network type of the Timestream for InfluxDB Cluster is IPv4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The endpoint used to connect to the Timestream for InfluxDB cluster for read-only operations.
        @[JSON::Field(key: "readerEndpoint")]
        getter reader_endpoint : String?

        # The status of the DB cluster.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @allocated_storage : Int32? = nil,
          @db_instance_type : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @engine_type : String? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @reader_endpoint : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains a summary of a DB instance belonging to a DB cluster.
      struct DbInstanceForClusterSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB instance.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The service-generated unique identifier of the DB instance.
        @[JSON::Field(key: "id")]
        getter id : String

        # A service-generated name for the DB instance based on the customer-supplied name for the DB cluster.
        @[JSON::Field(key: "name")]
        getter name : String

        # The amount of storage allocated for your DB storage type in GiB (gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Timestream for InfluxDB instance type to run InfluxDB on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The storage type for your DB instance.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies the deployment type if applicable.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # Specifies the DB instance's role in the cluster.
        @[JSON::Field(key: "instanceMode")]
        getter instance_mode : String?

        # Specifies the DB instance's roles in the cluster.
        @[JSON::Field(key: "instanceModes")]
        getter instance_modes : Array(String)?

        # Specifies whether the network type of the Timestream for InfluxDB instance is IPv4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The status of the DB instance.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @allocated_storage : Int32? = nil,
          @db_instance_type : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @instance_mode : String? = nil,
          @instance_modes : Array(String)? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains a summary of a DB instance.
      struct DbInstanceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB instance.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The service-generated unique identifier of the DB instance.
        @[JSON::Field(key: "id")]
        getter id : String

        # This customer-supplied name uniquely identifies the DB instance when interacting with the Amazon
        # Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # The amount of storage to allocate for your DbStorageType in GiB (gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Timestream for InfluxDB instance type to run InfluxDB on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The storage type for your DB instance.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Single-Instance or with a MultiAZ Standby for High availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The status of the DB instance.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @allocated_storage : Int32? = nil,
          @db_instance_type : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains a summary of a DB parameter group.
      struct DbParameterGroupSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB parameter group.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # This customer-supplied name uniquely identifies the parameter group.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the DB parameter group.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct DeleteDbClusterInput
        include JSON::Serializable

        # Service-generated unique identifier of the DB cluster.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String

        def initialize(
          @db_cluster_id : String
        )
        end
      end

      struct DeleteDbClusterOutput
        include JSON::Serializable

        # The status of the DB cluster.
        @[JSON::Field(key: "dbClusterStatus")]
        getter db_cluster_status : String?

        def initialize(
          @db_cluster_status : String? = nil
        )
        end
      end

      struct DeleteDbInstanceInput
        include JSON::Serializable

        # The id of the DB instance.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteDbInstanceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB instance.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # The customer-supplied name that uniquely identifies the DB instance when interacting with the Amazon
        # Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of VPC subnet IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)

        # The amount of storage allocated for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Availability Zone in which the DB instance resides.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # Specifies the DbCluster to which this DbInstance belongs to.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String?

        # The Timestream for InfluxDB instance type that InfluxDB runs on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The id of the DB parameter group assigned to your DB instance.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ Standby for
        # High availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial InfluxDB
        # authorization parameters. The secret value is a JSON formatted key-value pair holding InfluxDB
        # authorization values: organization, bucket, username, and password.
        @[JSON::Field(key: "influxAuthParametersSecretArn")]
        getter influx_auth_parameters_secret_arn : String?

        # Specifies the DbInstance's role in the cluster.
        @[JSON::Field(key: "instanceMode")]
        getter instance_mode : String?

        # Specifies the DbInstance's roles in the cluster.
        @[JSON::Field(key: "instanceModes")]
        getter instance_modes : Array(String)?

        # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Indicates if the DB instance has a public IP to facilitate access.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The Availability Zone in which the standby instance is located when deploying with a MultiAZ standby
        # instance.
        @[JSON::Field(key: "secondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # The status of the DB instance.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of VPC security group IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @vpc_subnet_ids : Array(String),
          @allocated_storage : Int32? = nil,
          @availability_zone : String? = nil,
          @db_cluster_id : String? = nil,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @influx_auth_parameters_secret_arn : String? = nil,
          @instance_mode : String? = nil,
          @instance_modes : Array(String)? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @secondary_availability_zone : String? = nil,
          @status : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      # Duration for InfluxDB parameters in Timestream for InfluxDB.
      struct Duration
        include JSON::Serializable

        # The type of duration for InfluxDB parameters.
        @[JSON::Field(key: "durationType")]
        getter duration_type : String

        # The value of duration for InfluxDB parameters.
        @[JSON::Field(key: "value")]
        getter value : Int64

        def initialize(
          @duration_type : String,
          @value : Int64
        )
        end
      end

      struct GetDbClusterInput
        include JSON::Serializable

        # Service-generated unique identifier of the DB cluster to retrieve.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String

        def initialize(
          @db_cluster_id : String
        )
        end
      end

      struct GetDbClusterOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB cluster.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Service-generated unique identifier of the DB cluster to retrieve.
        @[JSON::Field(key: "id")]
        getter id : String

        # Customer-supplied name of the Timestream for InfluxDB cluster.
        @[JSON::Field(key: "name")]
        getter name : String

        # The amount of storage allocated for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Timestream for InfluxDB instance type that InfluxDB runs on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The ID of the DB parameter group assigned to your DB cluster.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Deployment type of the DB cluster.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to the Timestream for InfluxDB cluster for write and read operations.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The engine type of your DB cluster.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        # The configured failover mode for the DB cluster.
        @[JSON::Field(key: "failoverMode")]
        getter failover_mode : String?

        # The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial InfluxDB
        # authorization parameters. The secret value is a JSON formatted key-value pair holding InfluxDB
        # authorization values: organization, bucket, username, and password.
        @[JSON::Field(key: "influxAuthParametersSecretArn")]
        getter influx_auth_parameters_secret_arn : String?

        # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the network type of the Timestream for InfluxDB cluster is IPv4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Indicates if the DB cluster has a public IP to facilitate access from outside the VPC.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The endpoint used to connect to the Timestream for InfluxDB cluster for read-only operations.
        @[JSON::Field(key: "readerEndpoint")]
        getter reader_endpoint : String?

        # The status of the DB cluster.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of VPC security group IDs associated with the DB cluster.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        # A list of VPC subnet IDs associated with the DB cluster.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @allocated_storage : Int32? = nil,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @engine_type : String? = nil,
          @failover_mode : String? = nil,
          @influx_auth_parameters_secret_arn : String? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @reader_endpoint : String? = nil,
          @status : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil,
          @vpc_subnet_ids : Array(String)? = nil
        )
        end
      end

      struct GetDbInstanceInput
        include JSON::Serializable

        # The id of the DB instance.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetDbInstanceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB instance.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # The customer-supplied name that uniquely identifies the DB instance when interacting with the Amazon
        # Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of VPC subnet IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)

        # The amount of storage allocated for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Availability Zone in which the DB instance resides.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # Specifies the DbCluster to which this DbInstance belongs to.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String?

        # The Timestream for InfluxDB instance type that InfluxDB runs on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The id of the DB parameter group assigned to your DB instance.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ Standby for
        # High availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial InfluxDB
        # authorization parameters. The secret value is a JSON formatted key-value pair holding InfluxDB
        # authorization values: organization, bucket, username, and password.
        @[JSON::Field(key: "influxAuthParametersSecretArn")]
        getter influx_auth_parameters_secret_arn : String?

        # Specifies the DbInstance's role in the cluster.
        @[JSON::Field(key: "instanceMode")]
        getter instance_mode : String?

        # Specifies the DbInstance's roles in the cluster.
        @[JSON::Field(key: "instanceModes")]
        getter instance_modes : Array(String)?

        # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Indicates if the DB instance has a public IP to facilitate access.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The Availability Zone in which the standby instance is located when deploying with a MultiAZ standby
        # instance.
        @[JSON::Field(key: "secondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # The status of the DB instance.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of VPC security group IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @vpc_subnet_ids : Array(String),
          @allocated_storage : Int32? = nil,
          @availability_zone : String? = nil,
          @db_cluster_id : String? = nil,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @influx_auth_parameters_secret_arn : String? = nil,
          @instance_mode : String? = nil,
          @instance_modes : Array(String)? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @secondary_availability_zone : String? = nil,
          @status : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      struct GetDbParameterGroupInput
        include JSON::Serializable

        # The id of the DB parameter group.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetDbParameterGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB parameter group.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # The customer-supplied name that uniquely identifies the DB parameter group when interacting with the
        # Amazon Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the DB parameter group.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The parameters that comprise the DB parameter group.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::Parameters?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @description : String? = nil,
          @parameters : Types::Parameters? = nil
        )
        end
      end

      # All the customer-modifiable InfluxDB v2 parameters in Timestream for InfluxDB.
      struct InfluxDBv2Parameters
        include JSON::Serializable

        # Include option to show detailed logs for Flux queries. Default: false
        @[JSON::Field(key: "fluxLogEnabled")]
        getter flux_log_enabled : Bool?

        # Maximum duration the server should keep established connections alive while waiting for new
        # requests. Set to 0 for no timeout. Default: 3 minutes
        @[JSON::Field(key: "httpIdleTimeout")]
        getter http_idle_timeout : Types::Duration?

        # Maximum duration the server should try to read HTTP headers for new requests. Set to 0 for no
        # timeout. Default: 10 seconds
        @[JSON::Field(key: "httpReadHeaderTimeout")]
        getter http_read_header_timeout : Types::Duration?

        # Maximum duration the server should try to read the entirety of new requests. Set to 0 for no
        # timeout. Default: 0
        @[JSON::Field(key: "httpReadTimeout")]
        getter http_read_timeout : Types::Duration?

        # Maximum duration the server should spend processing and responding to write requests. Set to 0 for
        # no timeout. Default: 0
        @[JSON::Field(key: "httpWriteTimeout")]
        getter http_write_timeout : Types::Duration?

        # Maximum number of group by time buckets a SELECT statement can create. 0 allows an unlimited number
        # of buckets. Default: 0
        @[JSON::Field(key: "influxqlMaxSelectBuckets")]
        getter influxql_max_select_buckets : Int64?

        # Maximum number of points a SELECT statement can process. 0 allows an unlimited number of points.
        # InfluxDB checks the point count every second (so queries exceeding the maximum aren’t immediately
        # aborted). Default: 0
        @[JSON::Field(key: "influxqlMaxSelectPoint")]
        getter influxql_max_select_point : Int64?

        # Maximum number of series a SELECT statement can return. 0 allows an unlimited number of series.
        # Default: 0
        @[JSON::Field(key: "influxqlMaxSelectSeries")]
        getter influxql_max_select_series : Int64?

        # Log output level. InfluxDB outputs log entries with severity levels greater than or equal to the
        # level specified. Default: info
        @[JSON::Field(key: "logLevel")]
        getter log_level : String?

        # Disable the HTTP /metrics endpoint which exposes internal InfluxDB metrics . Default: false
        @[JSON::Field(key: "metricsDisabled")]
        getter metrics_disabled : Bool?

        # Disable the task scheduler. If problematic tasks prevent InfluxDB from starting, use this option to
        # start InfluxDB without scheduling or executing tasks. Default: false
        @[JSON::Field(key: "noTasks")]
        getter no_tasks : Bool?

        # Disable the /debug/pprof HTTP endpoint. This endpoint provides runtime profiling data and can be
        # helpful when debugging. Default: true
        @[JSON::Field(key: "pprofDisabled")]
        getter pprof_disabled : Bool?

        # Number of queries allowed to execute concurrently. Setting to 0 allows an unlimited number of
        # concurrent queries. Default: 0
        @[JSON::Field(key: "queryConcurrency")]
        getter query_concurrency : Int32?

        # Initial bytes of memory allocated for a query. Default: 0
        @[JSON::Field(key: "queryInitialMemoryBytes")]
        getter query_initial_memory_bytes : Int64?

        # Maximum number of queries allowed in execution queue. When queue limit is reached, new queries are
        # rejected. Setting to 0 allows an unlimited number of queries in the queue. Default: 0
        @[JSON::Field(key: "queryMaxMemoryBytes")]
        getter query_max_memory_bytes : Int64?

        # Maximum bytes of memory allowed for a single query. Must be greater or equal to
        # queryInitialMemoryBytes. Default: 0
        @[JSON::Field(key: "queryMemoryBytes")]
        getter query_memory_bytes : Int64?

        # Maximum number of queries allowed in execution queue. When queue limit is reached, new queries are
        # rejected. Setting to 0 allows an unlimited number of queries in the queue. Default: 0
        @[JSON::Field(key: "queryQueueSize")]
        getter query_queue_size : Int32?

        # Specifies the Time to Live (TTL) in minutes for newly created user sessions. Default: 60
        @[JSON::Field(key: "sessionLength")]
        getter session_length : Int32?

        # Disables automatically extending a user’s session TTL on each request. By default, every request
        # sets the session’s expiration time to five minutes from now. When disabled, sessions expire after
        # the specified session length and the user is redirected to the login page, even if recently active.
        # Default: false
        @[JSON::Field(key: "sessionRenewDisabled")]
        getter session_renew_disabled : Bool?

        # Maximum size (in bytes) a shard’s cache can reach before it starts rejecting writes. Must be greater
        # than storageCacheSnapShotMemorySize and lower than instance’s total memory capacity. We recommend
        # setting it to below 15% of the total memory capacity. Default: 1073741824
        @[JSON::Field(key: "storageCacheMaxMemorySize")]
        getter storage_cache_max_memory_size : Int64?

        # Size (in bytes) at which the storage engine will snapshot the cache and write it to a TSM file to
        # make more memory available. Must not be greater than storageCacheMaxMemorySize. Default: 26214400
        @[JSON::Field(key: "storageCacheSnapshotMemorySize")]
        getter storage_cache_snapshot_memory_size : Int64?

        # Duration at which the storage engine will snapshot the cache and write it to a new TSM file if the
        # shard hasn’t received writes or deletes. Default: 10 minutes
        @[JSON::Field(key: "storageCacheSnapshotWriteColdDuration")]
        getter storage_cache_snapshot_write_cold_duration : Types::Duration?

        # Duration at which the storage engine will compact all TSM files in a shard if it hasn't received
        # writes or deletes. Default: 4 hours
        @[JSON::Field(key: "storageCompactFullWriteColdDuration")]
        getter storage_compact_full_write_cold_duration : Types::Duration?

        # Rate limit (in bytes per second) that TSM compactions can write to disk. Default: 50331648
        @[JSON::Field(key: "storageCompactThroughputBurst")]
        getter storage_compact_throughput_burst : Int64?

        # Maximum number of full and level compactions that can run concurrently. A value of 0 results in 50%
        # of runtime.GOMAXPROCS(0) used at runtime. Any number greater than zero limits compactions to that
        # value. This setting does not apply to cache snapshotting. Default: 0
        @[JSON::Field(key: "storageMaxConcurrentCompactions")]
        getter storage_max_concurrent_compactions : Int32?

        # Size (in bytes) at which an index write-ahead log (WAL) file will compact into an index file. Lower
        # sizes will cause log files to be compacted more quickly and result in lower heap usage at the
        # expense of write throughput. Default: 1048576
        @[JSON::Field(key: "storageMaxIndexLogFileSize")]
        getter storage_max_index_log_file_size : Int64?

        # Skip field size validation on incoming write requests. Default: false
        @[JSON::Field(key: "storageNoValidateFieldSize")]
        getter storage_no_validate_field_size : Bool?

        # Interval of retention policy enforcement checks. Must be greater than 0. Default: 30 minutes
        @[JSON::Field(key: "storageRetentionCheckInterval")]
        getter storage_retention_check_interval : Types::Duration?

        # Maximum number of snapshot compactions that can run concurrently across all series partitions in a
        # database. Default: 0
        @[JSON::Field(key: "storageSeriesFileMaxConcurrentSnapshotCompactions")]
        getter storage_series_file_max_concurrent_snapshot_compactions : Int32?

        # Size of the internal cache used in the TSI index to store previously calculated series results.
        # Cached results are returned quickly rather than needing to be recalculated when a subsequent query
        # with the same tag key/value predicate is executed. Setting this value to 0 will disable the cache
        # and may decrease query performance. Default: 100
        @[JSON::Field(key: "storageSeriesIdSetCacheSize")]
        getter storage_series_id_set_cache_size : Int64?

        # Maximum number writes to the WAL directory to attempt at the same time. Setting this value to 0
        # results in number of processing units available x2. Default: 0
        @[JSON::Field(key: "storageWalMaxConcurrentWrites")]
        getter storage_wal_max_concurrent_writes : Int32?

        # Maximum amount of time a write request to the WAL directory will wait when the maximum number of
        # concurrent active writes to the WAL directory has been met . Set to 0 to disable the timeout.
        # Default: 10 minutes
        @[JSON::Field(key: "storageWalMaxWriteDelay")]
        getter storage_wal_max_write_delay : Types::Duration?

        # Enable tracing in InfluxDB and specifies the tracing type. Tracing is disabled by default.
        @[JSON::Field(key: "tracingType")]
        getter tracing_type : String?

        # Disable the InfluxDB user interface (UI). The UI is enabled by default. Default: false
        @[JSON::Field(key: "uiDisabled")]
        getter ui_disabled : Bool?

        def initialize(
          @flux_log_enabled : Bool? = nil,
          @http_idle_timeout : Types::Duration? = nil,
          @http_read_header_timeout : Types::Duration? = nil,
          @http_read_timeout : Types::Duration? = nil,
          @http_write_timeout : Types::Duration? = nil,
          @influxql_max_select_buckets : Int64? = nil,
          @influxql_max_select_point : Int64? = nil,
          @influxql_max_select_series : Int64? = nil,
          @log_level : String? = nil,
          @metrics_disabled : Bool? = nil,
          @no_tasks : Bool? = nil,
          @pprof_disabled : Bool? = nil,
          @query_concurrency : Int32? = nil,
          @query_initial_memory_bytes : Int64? = nil,
          @query_max_memory_bytes : Int64? = nil,
          @query_memory_bytes : Int64? = nil,
          @query_queue_size : Int32? = nil,
          @session_length : Int32? = nil,
          @session_renew_disabled : Bool? = nil,
          @storage_cache_max_memory_size : Int64? = nil,
          @storage_cache_snapshot_memory_size : Int64? = nil,
          @storage_cache_snapshot_write_cold_duration : Types::Duration? = nil,
          @storage_compact_full_write_cold_duration : Types::Duration? = nil,
          @storage_compact_throughput_burst : Int64? = nil,
          @storage_max_concurrent_compactions : Int32? = nil,
          @storage_max_index_log_file_size : Int64? = nil,
          @storage_no_validate_field_size : Bool? = nil,
          @storage_retention_check_interval : Types::Duration? = nil,
          @storage_series_file_max_concurrent_snapshot_compactions : Int32? = nil,
          @storage_series_id_set_cache_size : Int64? = nil,
          @storage_wal_max_concurrent_writes : Int32? = nil,
          @storage_wal_max_write_delay : Types::Duration? = nil,
          @tracing_type : String? = nil,
          @ui_disabled : Bool? = nil
        )
        end
      end

      # All the customer-modifiable InfluxDB v3 Core parameters in Timestream for InfluxDB.
      struct InfluxDBv3CoreParameters
        include JSON::Serializable

        # Provides custom configuration to DataFusion as a comma-separated list of key:value pairs.
        @[JSON::Field(key: "dataFusionConfig")]
        getter data_fusion_config : String?

        # When multiple parquet files are required in a sorted way (deduplication for example), specifies the
        # maximum fanout. Default: 1000
        @[JSON::Field(key: "dataFusionMaxParquetFanout")]
        getter data_fusion_max_parquet_fanout : Int32?

        # Sets the maximum number of DataFusion runtime threads to use.
        @[JSON::Field(key: "dataFusionNumThreads")]
        getter data_fusion_num_threads : Int32?

        # Disables the LIFO slot of the DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeDisableLifoSlot")]
        getter data_fusion_runtime_disable_lifo_slot : Bool?

        # Sets the number of scheduler ticks after which the scheduler of the DataFusion tokio runtime polls
        # for external events–for example: timers, I/O.
        @[JSON::Field(key: "dataFusionRuntimeEventInterval")]
        getter data_fusion_runtime_event_interval : Int32?

        # Sets the number of scheduler ticks after which the scheduler of the DataFusion runtime polls the
        # global task queue.
        @[JSON::Field(key: "dataFusionRuntimeGlobalQueueInterval")]
        getter data_fusion_runtime_global_queue_interval : Int32?

        # Specifies the limit for additional threads spawned by the DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeMaxBlockingThreads")]
        getter data_fusion_runtime_max_blocking_threads : Int32?

        # Configures the maximum number of events processed per tick by the tokio DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeMaxIoEventsPerTick")]
        getter data_fusion_runtime_max_io_events_per_tick : Int32?

        # Sets a custom timeout for a thread in the blocking pool of the tokio DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeThreadKeepAlive")]
        getter data_fusion_runtime_thread_keep_alive : Types::Duration?

        # Sets the thread priority for tokio DataFusion runtime workers. Default: 10
        @[JSON::Field(key: "dataFusionRuntimeThreadPriority")]
        getter data_fusion_runtime_thread_priority : Int32?

        # Specifies the DataFusion tokio runtime type. Default: multi-thread
        @[JSON::Field(key: "dataFusionRuntimeType")]
        getter data_fusion_runtime_type : String?

        # Uses a cached parquet loader when reading parquet files from the object store.
        @[JSON::Field(key: "dataFusionUseCachedParquetLoader")]
        getter data_fusion_use_cached_parquet_loader : Bool?

        # Specifies the grace period before permanently deleting data. Default: 24h
        @[JSON::Field(key: "deleteGracePeriod")]
        getter delete_grace_period : Types::Duration?

        # Disables the in-memory Parquet cache. By default, the cache is enabled.
        @[JSON::Field(key: "disableParquetMemCache")]
        getter disable_parquet_mem_cache : Bool?

        # Specifies the interval to evict expired entries from the distinct value cache, expressed as a
        # human-readable duration–for example: 20s, 1m, 1h. Default: 10s
        @[JSON::Field(key: "distinctCacheEvictionInterval")]
        getter distinct_cache_eviction_interval : Types::Duration?

        # Specifies the size of memory pool used during query execution. Can be given as absolute value in
        # bytes or as a percentage of the total available memory–for example: 8000000000 or 10%. Default: 20%
        @[JSON::Field(key: "execMemPoolBytes")]
        getter exec_mem_pool_bytes : Types::PercentOrAbsoluteLong?

        # Specifies the threshold for the internal memory buffer. Supports either a percentage (portion of
        # available memory) or absolute value in MB–for example: 70% or 100 Default: 70%
        @[JSON::Field(key: "forceSnapshotMemThreshold")]
        getter force_snapshot_mem_threshold : Types::PercentOrAbsoluteLong?

        # Specifies the duration that Parquet files are arranged into. Data timestamps land each row into a
        # file of this duration. Supported durations are 1m, 5m, and 10m. These files are known as “generation
        # 1” files that the compactor in InfluxDB 3 Enterprise can merge into larger generations. Default: 10m
        @[JSON::Field(key: "gen1Duration")]
        getter gen1_duration : Types::Duration?

        # Specifies how far back to look when creating generation 1 Parquet files. Default: 24h
        @[JSON::Field(key: "gen1LookbackDuration")]
        getter gen1_lookback_duration : Types::Duration?

        # Sets the default duration for hard deletion of data. Default: 90d
        @[JSON::Field(key: "hardDeleteDefaultDuration")]
        getter hard_delete_default_duration : Types::Duration?

        # Specifies the interval to evict expired entries from the Last-N-Value cache, expressed as a
        # human-readable duration–for example: 20s, 1m, 1h. Default: 10s
        @[JSON::Field(key: "lastCacheEvictionInterval")]
        getter last_cache_eviction_interval : Types::Duration?

        # Sets the filter directive for logs.
        @[JSON::Field(key: "logFilter")]
        getter log_filter : String?

        # Defines the message format for logs. Default: full
        @[JSON::Field(key: "logFormat")]
        getter log_format : String?

        # Specifies the maximum size of HTTP requests. Default: 10485760
        @[JSON::Field(key: "maxHttpRequestSize")]
        getter max_http_request_size : Int64?

        # Sets the interval to check if the in-memory Parquet cache needs to be pruned. Default: 1s
        @[JSON::Field(key: "parquetMemCachePruneInterval")]
        getter parquet_mem_cache_prune_interval : Types::Duration?

        # Specifies the percentage of entries to prune during a prune operation on the in-memory Parquet
        # cache. Default: 0.1
        @[JSON::Field(key: "parquetMemCachePrunePercentage")]
        getter parquet_mem_cache_prune_percentage : Float64?

        # Specifies the time window for caching recent Parquet files in memory. Default: 5h
        @[JSON::Field(key: "parquetMemCacheQueryPathDuration")]
        getter parquet_mem_cache_query_path_duration : Types::Duration?

        # Specifies the size of the in-memory Parquet cache in megabytes or percentage of total available
        # memory. Default: 20%
        @[JSON::Field(key: "parquetMemCacheSize")]
        getter parquet_mem_cache_size : Types::PercentOrAbsoluteLong?

        # Specifies the interval to prefetch into the Parquet cache during compaction. Default: 3d
        @[JSON::Field(key: "preemptiveCacheAge")]
        getter preemptive_cache_age : Types::Duration?

        # Limits the number of Parquet files a query can access. If a query attempts to read more than this
        # limit, InfluxDB 3 returns an error. Default: 432
        @[JSON::Field(key: "queryFileLimit")]
        getter query_file_limit : Int32?

        # Defines the size of the query log. Up to this many queries remain in the log before older queries
        # are evicted to make room for new ones. Default: 1000
        @[JSON::Field(key: "queryLogSize")]
        getter query_log_size : Int32?

        # The interval at which retention policies are checked and enforced. Enter as a human-readable
        # time–for example: 30m or 1h. Default: 30m
        @[JSON::Field(key: "retentionCheckInterval")]
        getter retention_check_interval : Types::Duration?

        # Specifies the number of snapshotted WAL files to retain in the object store. Flushing the WAL files
        # does not clear the WAL files immediately; they are deleted when the number of snapshotted WAL files
        # exceeds this number. Default: 300
        @[JSON::Field(key: "snapshottedWalFilesToKeep")]
        getter snapshotted_wal_files_to_keep : Int32?

        # Limits the concurrency level for table index cache operations. Default: 8
        @[JSON::Field(key: "tableIndexCacheConcurrencyLimit")]
        getter table_index_cache_concurrency_limit : Int32?

        # Specifies the maximum number of entries in the table index cache. Default: 1000
        @[JSON::Field(key: "tableIndexCacheMaxEntries")]
        getter table_index_cache_max_entries : Int32?

        # Specifies the maximum number of write requests that can be buffered before a flush must be executed
        # and succeed. Default: 100000
        @[JSON::Field(key: "walMaxWriteBufferSize")]
        getter wal_max_write_buffer_size : Int32?

        # Concurrency limit during WAL replay. Setting this number too high can lead to OOM. The default is
        # dynamically determined. Default: max(num_cpus, 10)
        @[JSON::Field(key: "walReplayConcurrencyLimit")]
        getter wal_replay_concurrency_limit : Int32?

        # Determines whether WAL replay should fail when encountering errors. Default: false
        @[JSON::Field(key: "walReplayFailOnError")]
        getter wal_replay_fail_on_error : Bool?

        # Defines the number of WAL files to attempt to remove in a snapshot. This, multiplied by the
        # interval, determines how often snapshots are taken. Default: 600
        @[JSON::Field(key: "walSnapshotSize")]
        getter wal_snapshot_size : Int32?

        def initialize(
          @data_fusion_config : String? = nil,
          @data_fusion_max_parquet_fanout : Int32? = nil,
          @data_fusion_num_threads : Int32? = nil,
          @data_fusion_runtime_disable_lifo_slot : Bool? = nil,
          @data_fusion_runtime_event_interval : Int32? = nil,
          @data_fusion_runtime_global_queue_interval : Int32? = nil,
          @data_fusion_runtime_max_blocking_threads : Int32? = nil,
          @data_fusion_runtime_max_io_events_per_tick : Int32? = nil,
          @data_fusion_runtime_thread_keep_alive : Types::Duration? = nil,
          @data_fusion_runtime_thread_priority : Int32? = nil,
          @data_fusion_runtime_type : String? = nil,
          @data_fusion_use_cached_parquet_loader : Bool? = nil,
          @delete_grace_period : Types::Duration? = nil,
          @disable_parquet_mem_cache : Bool? = nil,
          @distinct_cache_eviction_interval : Types::Duration? = nil,
          @exec_mem_pool_bytes : Types::PercentOrAbsoluteLong? = nil,
          @force_snapshot_mem_threshold : Types::PercentOrAbsoluteLong? = nil,
          @gen1_duration : Types::Duration? = nil,
          @gen1_lookback_duration : Types::Duration? = nil,
          @hard_delete_default_duration : Types::Duration? = nil,
          @last_cache_eviction_interval : Types::Duration? = nil,
          @log_filter : String? = nil,
          @log_format : String? = nil,
          @max_http_request_size : Int64? = nil,
          @parquet_mem_cache_prune_interval : Types::Duration? = nil,
          @parquet_mem_cache_prune_percentage : Float64? = nil,
          @parquet_mem_cache_query_path_duration : Types::Duration? = nil,
          @parquet_mem_cache_size : Types::PercentOrAbsoluteLong? = nil,
          @preemptive_cache_age : Types::Duration? = nil,
          @query_file_limit : Int32? = nil,
          @query_log_size : Int32? = nil,
          @retention_check_interval : Types::Duration? = nil,
          @snapshotted_wal_files_to_keep : Int32? = nil,
          @table_index_cache_concurrency_limit : Int32? = nil,
          @table_index_cache_max_entries : Int32? = nil,
          @wal_max_write_buffer_size : Int32? = nil,
          @wal_replay_concurrency_limit : Int32? = nil,
          @wal_replay_fail_on_error : Bool? = nil,
          @wal_snapshot_size : Int32? = nil
        )
        end
      end

      # All the customer-modifiable InfluxDB v3 Enterprise parameters in Timestream for InfluxDB.
      struct InfluxDBv3EnterpriseParameters
        include JSON::Serializable

        # Specifies if the compactor instance should be a standalone instance or not.
        @[JSON::Field(key: "dedicatedCompactor")]
        getter dedicated_compactor : Bool

        # Specifies number of instances in the DbCluster which can both ingest and query.
        @[JSON::Field(key: "ingestQueryInstances")]
        getter ingest_query_instances : Int32

        # Specifies number of instances in the DbCluster which can only query.
        @[JSON::Field(key: "queryOnlyInstances")]
        getter query_only_instances : Int32

        # Defines how often the catalog synchronizes across cluster nodes. Default: 10s
        @[JSON::Field(key: "catalogSyncInterval")]
        getter catalog_sync_interval : Types::Duration?

        # Specifies how often the compactor checks for new compaction work to perform. Default: 10s
        @[JSON::Field(key: "compactionCheckInterval")]
        getter compaction_check_interval : Types::Duration?

        # Specifies the amount of time that the compactor waits after finishing a compaction run to delete
        # files marked as needing deletion during that compaction run. Default: 10m
        @[JSON::Field(key: "compactionCleanupWait")]
        getter compaction_cleanup_wait : Types::Duration?

        # Specifies the duration of the first level of compaction (gen2). Later levels of compaction are
        # multiples of this duration. This value should be equal to or greater than the gen1 duration.
        # Default: 20m
        @[JSON::Field(key: "compactionGen2Duration")]
        getter compaction_gen2_duration : Types::Duration?

        # Sets the maximum number of files included in any compaction plan. Default: 500
        @[JSON::Field(key: "compactionMaxNumFilesPerPlan")]
        getter compaction_max_num_files_per_plan : Int32?

        # Specifies a comma-separated list of multiples defining the duration of each level of compaction. The
        # number of elements in the list determines the number of compaction levels. The first element
        # specifies the duration of the first level (gen3); subsequent levels are multiples of the previous
        # level. Default: 3,4,6,5
        @[JSON::Field(key: "compactionMultipliers")]
        getter compaction_multipliers : String?

        # Specifies the soft limit for the number of rows per file that the compactor writes. The compactor
        # may write more rows than this limit. Default: 1000000
        @[JSON::Field(key: "compactionRowLimit")]
        getter compaction_row_limit : Int32?

        # Provides custom configuration to DataFusion as a comma-separated list of key:value pairs.
        @[JSON::Field(key: "dataFusionConfig")]
        getter data_fusion_config : String?

        # When multiple parquet files are required in a sorted way (deduplication for example), specifies the
        # maximum fanout. Default: 1000
        @[JSON::Field(key: "dataFusionMaxParquetFanout")]
        getter data_fusion_max_parquet_fanout : Int32?

        # Sets the maximum number of DataFusion runtime threads to use.
        @[JSON::Field(key: "dataFusionNumThreads")]
        getter data_fusion_num_threads : Int32?

        # Disables the LIFO slot of the DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeDisableLifoSlot")]
        getter data_fusion_runtime_disable_lifo_slot : Bool?

        # Sets the number of scheduler ticks after which the scheduler of the DataFusion tokio runtime polls
        # for external events–for example: timers, I/O.
        @[JSON::Field(key: "dataFusionRuntimeEventInterval")]
        getter data_fusion_runtime_event_interval : Int32?

        # Sets the number of scheduler ticks after which the scheduler of the DataFusion runtime polls the
        # global task queue.
        @[JSON::Field(key: "dataFusionRuntimeGlobalQueueInterval")]
        getter data_fusion_runtime_global_queue_interval : Int32?

        # Specifies the limit for additional threads spawned by the DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeMaxBlockingThreads")]
        getter data_fusion_runtime_max_blocking_threads : Int32?

        # Configures the maximum number of events processed per tick by the tokio DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeMaxIoEventsPerTick")]
        getter data_fusion_runtime_max_io_events_per_tick : Int32?

        # Sets a custom timeout for a thread in the blocking pool of the tokio DataFusion runtime.
        @[JSON::Field(key: "dataFusionRuntimeThreadKeepAlive")]
        getter data_fusion_runtime_thread_keep_alive : Types::Duration?

        # Sets the thread priority for tokio DataFusion runtime workers. Default: 10
        @[JSON::Field(key: "dataFusionRuntimeThreadPriority")]
        getter data_fusion_runtime_thread_priority : Int32?

        # Specifies the DataFusion tokio runtime type. Default: multi-thread
        @[JSON::Field(key: "dataFusionRuntimeType")]
        getter data_fusion_runtime_type : String?

        # Uses a cached parquet loader when reading parquet files from the object store.
        @[JSON::Field(key: "dataFusionUseCachedParquetLoader")]
        getter data_fusion_use_cached_parquet_loader : Bool?

        # Specifies the grace period before permanently deleting data. Default: 24h
        @[JSON::Field(key: "deleteGracePeriod")]
        getter delete_grace_period : Types::Duration?

        # Disables the in-memory Parquet cache. By default, the cache is enabled.
        @[JSON::Field(key: "disableParquetMemCache")]
        getter disable_parquet_mem_cache : Bool?

        # Specifies the interval to evict expired entries from the distinct value cache, expressed as a
        # human-readable duration–for example: 20s, 1m, 1h. Default: 10s
        @[JSON::Field(key: "distinctCacheEvictionInterval")]
        getter distinct_cache_eviction_interval : Types::Duration?

        # Disables populating the distinct value cache from historical data. If disabled, the cache is still
        # populated with data from the write-ahead log (WAL).
        @[JSON::Field(key: "distinctValueCacheDisableFromHistory")]
        getter distinct_value_cache_disable_from_history : Bool?

        # Specifies the size of memory pool used during query execution. Can be given as absolute value in
        # bytes or as a percentage of the total available memory–for example: 8000000000 or 10%. Default: 20%
        @[JSON::Field(key: "execMemPoolBytes")]
        getter exec_mem_pool_bytes : Types::PercentOrAbsoluteLong?

        # Specifies the threshold for the internal memory buffer. Supports either a percentage (portion of
        # available memory) or absolute value in MB–for example: 70% or 100 Default: 70%
        @[JSON::Field(key: "forceSnapshotMemThreshold")]
        getter force_snapshot_mem_threshold : Types::PercentOrAbsoluteLong?

        # Specifies the duration that Parquet files are arranged into. Data timestamps land each row into a
        # file of this duration. Supported durations are 1m, 5m, and 10m. These files are known as “generation
        # 1” files, which the compactor can merge into larger generations. Default: 10m
        @[JSON::Field(key: "gen1Duration")]
        getter gen1_duration : Types::Duration?

        # Specifies how far back to look when creating generation 1 Parquet files. Default: 24h
        @[JSON::Field(key: "gen1LookbackDuration")]
        getter gen1_lookback_duration : Types::Duration?

        # Sets the default duration for hard deletion of data. Default: 90d
        @[JSON::Field(key: "hardDeleteDefaultDuration")]
        getter hard_delete_default_duration : Types::Duration?

        # Specifies the interval to evict expired entries from the Last-N-Value cache, expressed as a
        # human-readable duration–for example: 20s, 1m, 1h. Default: 10s
        @[JSON::Field(key: "lastCacheEvictionInterval")]
        getter last_cache_eviction_interval : Types::Duration?

        # Disables populating the last-N-value cache from historical data. If disabled, the cache is still
        # populated with data from the write-ahead log (WAL).
        @[JSON::Field(key: "lastValueCacheDisableFromHistory")]
        getter last_value_cache_disable_from_history : Bool?

        # Sets the filter directive for logs.
        @[JSON::Field(key: "logFilter")]
        getter log_filter : String?

        # Defines the message format for logs. Default: full
        @[JSON::Field(key: "logFormat")]
        getter log_format : String?

        # Specifies the maximum size of HTTP requests. Default: 10485760
        @[JSON::Field(key: "maxHttpRequestSize")]
        getter max_http_request_size : Int64?

        # Sets the interval to check if the in-memory Parquet cache needs to be pruned. Default: 1s
        @[JSON::Field(key: "parquetMemCachePruneInterval")]
        getter parquet_mem_cache_prune_interval : Types::Duration?

        # Specifies the percentage of entries to prune during a prune operation on the in-memory Parquet
        # cache. Default: 0.1
        @[JSON::Field(key: "parquetMemCachePrunePercentage")]
        getter parquet_mem_cache_prune_percentage : Float64?

        # Specifies the time window for caching recent Parquet files in memory. Default: 5h
        @[JSON::Field(key: "parquetMemCacheQueryPathDuration")]
        getter parquet_mem_cache_query_path_duration : Types::Duration?

        # Specifies the size of the in-memory Parquet cache in megabytes or percentage of total available
        # memory. Default: 20%
        @[JSON::Field(key: "parquetMemCacheSize")]
        getter parquet_mem_cache_size : Types::PercentOrAbsoluteLong?

        # Specifies the interval to prefetch into the Parquet cache during compaction. Default: 3d
        @[JSON::Field(key: "preemptiveCacheAge")]
        getter preemptive_cache_age : Types::Duration?

        # Limits the number of Parquet files a query can access. If a query attempts to read more than this
        # limit, InfluxDB 3 returns an error. Default: 432
        @[JSON::Field(key: "queryFileLimit")]
        getter query_file_limit : Int32?

        # Defines the size of the query log. Up to this many queries remain in the log before older queries
        # are evicted to make room for new ones. Default: 1000
        @[JSON::Field(key: "queryLogSize")]
        getter query_log_size : Int32?

        # Specifies the interval at which data replication occurs between cluster nodes. Default: 250ms
        @[JSON::Field(key: "replicationInterval")]
        getter replication_interval : Types::Duration?

        # The interval at which retention policies are checked and enforced. Enter as a human-readable
        # time–for example: 30m or 1h. Default: 30m
        @[JSON::Field(key: "retentionCheckInterval")]
        getter retention_check_interval : Types::Duration?

        # Specifies the number of snapshotted WAL files to retain in the object store. Flushing the WAL files
        # does not clear the WAL files immediately; they are deleted when the number of snapshotted WAL files
        # exceeds this number. Default: 300
        @[JSON::Field(key: "snapshottedWalFilesToKeep")]
        getter snapshotted_wal_files_to_keep : Int32?

        # Limits the concurrency level for table index cache operations. Default: 8
        @[JSON::Field(key: "tableIndexCacheConcurrencyLimit")]
        getter table_index_cache_concurrency_limit : Int32?

        # Specifies the maximum number of entries in the table index cache. Default: 1000
        @[JSON::Field(key: "tableIndexCacheMaxEntries")]
        getter table_index_cache_max_entries : Int32?

        # Specifies the maximum number of write requests that can be buffered before a flush must be executed
        # and succeed. Default: 100000
        @[JSON::Field(key: "walMaxWriteBufferSize")]
        getter wal_max_write_buffer_size : Int32?

        # Concurrency limit during WAL replay. Setting this number too high can lead to OOM. The default is
        # dynamically determined. Default: max(num_cpus, 10)
        @[JSON::Field(key: "walReplayConcurrencyLimit")]
        getter wal_replay_concurrency_limit : Int32?

        # Determines whether WAL replay should fail when encountering errors. Default: false
        @[JSON::Field(key: "walReplayFailOnError")]
        getter wal_replay_fail_on_error : Bool?

        # Defines the number of WAL files to attempt to remove in a snapshot. This, multiplied by the
        # interval, determines how often snapshots are taken. Default: 600
        @[JSON::Field(key: "walSnapshotSize")]
        getter wal_snapshot_size : Int32?

        def initialize(
          @dedicated_compactor : Bool,
          @ingest_query_instances : Int32,
          @query_only_instances : Int32,
          @catalog_sync_interval : Types::Duration? = nil,
          @compaction_check_interval : Types::Duration? = nil,
          @compaction_cleanup_wait : Types::Duration? = nil,
          @compaction_gen2_duration : Types::Duration? = nil,
          @compaction_max_num_files_per_plan : Int32? = nil,
          @compaction_multipliers : String? = nil,
          @compaction_row_limit : Int32? = nil,
          @data_fusion_config : String? = nil,
          @data_fusion_max_parquet_fanout : Int32? = nil,
          @data_fusion_num_threads : Int32? = nil,
          @data_fusion_runtime_disable_lifo_slot : Bool? = nil,
          @data_fusion_runtime_event_interval : Int32? = nil,
          @data_fusion_runtime_global_queue_interval : Int32? = nil,
          @data_fusion_runtime_max_blocking_threads : Int32? = nil,
          @data_fusion_runtime_max_io_events_per_tick : Int32? = nil,
          @data_fusion_runtime_thread_keep_alive : Types::Duration? = nil,
          @data_fusion_runtime_thread_priority : Int32? = nil,
          @data_fusion_runtime_type : String? = nil,
          @data_fusion_use_cached_parquet_loader : Bool? = nil,
          @delete_grace_period : Types::Duration? = nil,
          @disable_parquet_mem_cache : Bool? = nil,
          @distinct_cache_eviction_interval : Types::Duration? = nil,
          @distinct_value_cache_disable_from_history : Bool? = nil,
          @exec_mem_pool_bytes : Types::PercentOrAbsoluteLong? = nil,
          @force_snapshot_mem_threshold : Types::PercentOrAbsoluteLong? = nil,
          @gen1_duration : Types::Duration? = nil,
          @gen1_lookback_duration : Types::Duration? = nil,
          @hard_delete_default_duration : Types::Duration? = nil,
          @last_cache_eviction_interval : Types::Duration? = nil,
          @last_value_cache_disable_from_history : Bool? = nil,
          @log_filter : String? = nil,
          @log_format : String? = nil,
          @max_http_request_size : Int64? = nil,
          @parquet_mem_cache_prune_interval : Types::Duration? = nil,
          @parquet_mem_cache_prune_percentage : Float64? = nil,
          @parquet_mem_cache_query_path_duration : Types::Duration? = nil,
          @parquet_mem_cache_size : Types::PercentOrAbsoluteLong? = nil,
          @preemptive_cache_age : Types::Duration? = nil,
          @query_file_limit : Int32? = nil,
          @query_log_size : Int32? = nil,
          @replication_interval : Types::Duration? = nil,
          @retention_check_interval : Types::Duration? = nil,
          @snapshotted_wal_files_to_keep : Int32? = nil,
          @table_index_cache_concurrency_limit : Int32? = nil,
          @table_index_cache_max_entries : Int32? = nil,
          @wal_max_write_buffer_size : Int32? = nil,
          @wal_replay_concurrency_limit : Int32? = nil,
          @wal_replay_fail_on_error : Bool? = nil,
          @wal_snapshot_size : Int32? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ListDbClustersInput
        include JSON::Serializable

        # The maximum number of items to return in the output. If the total number of items available is more
        # than the value specified, a nextToken is provided in the output. To resume pagination, provide the
        # nextToken value as an argument of a subsequent API invocation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the nextToken value as an argument of a
        # subsequent API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDbClustersOutput
        include JSON::Serializable

        # A list of Timestream for InfluxDB cluster summaries.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DbClusterSummary)

        # Token from a previous call of the operation. When this value is provided, the service returns
        # results from where the previous response left off.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DbClusterSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDbInstancesForClusterInput
        include JSON::Serializable

        # Service-generated unique identifier of the DB cluster.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String

        # The maximum number of items to return in the output. If the total number of items available is more
        # than the value specified, a nextToken is provided in the output. To resume pagination, provide the
        # nextToken value as an argument of a subsequent API invocation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the nextToken value as an argument of a
        # subsequent API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @db_cluster_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDbInstancesForClusterOutput
        include JSON::Serializable

        # A list of Timestream for InfluxDB instance summaries belonging to the cluster.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DbInstanceForClusterSummary)

        # Token from a previous call of the operation. When this value is provided, the service returns
        # results from where the previous response left off.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DbInstanceForClusterSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDbInstancesInput
        include JSON::Serializable

        # The maximum number of items to return in the output. If the total number of items available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as argument of a subsequent API invocation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the NextToken value as argument of a subsequent
        # API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDbInstancesOutput
        include JSON::Serializable

        # A list of Timestream for InfluxDB DB instance summaries.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DbInstanceSummary)

        # Token from a previous call of the operation. When this value is provided, the service returns
        # results from where the previous response left off.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DbInstanceSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDbParameterGroupsInput
        include JSON::Serializable

        # The maximum number of items to return in the output. If the total number of items available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as argument of a subsequent API invocation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the NextToken value as argument of a subsequent
        # API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDbParameterGroupsOutput
        include JSON::Serializable

        # A list of Timestream for InfluxDB DB parameter group summaries.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DbParameterGroupSummary)

        # Token from a previous call of the operation. When this value is provided, the service returns
        # results from where the previous response left off.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DbParameterGroupSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the tagged resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags used to categorize and track resources.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
      struct LogDeliveryConfiguration
        include JSON::Serializable

        # Configuration for S3 bucket log delivery.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::S3Configuration

        def initialize(
          @s3_configuration : Types::S3Configuration
        )
        end
      end

      # The parameters that comprise the parameter group.
      struct Parameters
        include JSON::Serializable

        # All the customer-modifiable InfluxDB v2 parameters in Timestream for InfluxDB.
        @[JSON::Field(key: "InfluxDBv2")]
        getter influx_d_bv2 : Types::InfluxDBv2Parameters?

        # All the customer-modifiable InfluxDB v3 Core parameters in Timestream for InfluxDB.
        @[JSON::Field(key: "InfluxDBv3Core")]
        getter influx_d_bv3_core : Types::InfluxDBv3CoreParameters?

        # All the customer-modifiable InfluxDB v3 Enterprise parameters in Timestream for InfluxDB.
        @[JSON::Field(key: "InfluxDBv3Enterprise")]
        getter influx_d_bv3_enterprise : Types::InfluxDBv3EnterpriseParameters?

        def initialize(
          @influx_d_bv2 : Types::InfluxDBv2Parameters? = nil,
          @influx_d_bv3_core : Types::InfluxDBv3CoreParameters? = nil,
          @influx_d_bv3_enterprise : Types::InfluxDBv3EnterpriseParameters? = nil
        )
        end
      end

      # Percent or Absolute Long for InfluxDB parameters
      struct PercentOrAbsoluteLong
        include JSON::Serializable

        # Absolute long for InfluxDB parameters.
        @[JSON::Field(key: "absolute")]
        getter absolute : Int64?

        # Percent for InfluxDB parameters.
        @[JSON::Field(key: "percent")]
        getter percent : String?

        def initialize(
          @absolute : Int64? = nil,
          @percent : String? = nil
        )
        end
      end

      struct RebootDbClusterInput
        include JSON::Serializable

        # Service-generated unique identifier of the DB cluster to reboot.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String

        # A list of service-generated unique DB Instance Ids belonging to the DB Cluster to reboot.
        @[JSON::Field(key: "instanceIds")]
        getter instance_ids : Array(String)?

        def initialize(
          @db_cluster_id : String,
          @instance_ids : Array(String)? = nil
        )
        end
      end

      struct RebootDbClusterOutput
        include JSON::Serializable

        # The status of the DB Cluster.
        @[JSON::Field(key: "dbClusterStatus")]
        getter db_cluster_status : String?

        def initialize(
          @db_cluster_status : String? = nil
        )
        end
      end

      struct RebootDbInstanceInput
        include JSON::Serializable

        # The id of the DB instance to reboot.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct RebootDbInstanceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB instance.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # The customer-supplied name that uniquely identifies the DB instance when interacting with the Amazon
        # Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of VPC subnet IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)

        # The amount of storage allocated for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Availability Zone in which the DB instance resides.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # Specifies the DbCluster to which this DbInstance belongs to.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String?

        # The Timestream for InfluxDB instance type that InfluxDB runs on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The id of the DB parameter group assigned to your DB instance.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ Standby for
        # High availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial InfluxDB
        # authorization parameters. The secret value is a JSON formatted key-value pair holding InfluxDB
        # authorization values: organization, bucket, username, and password.
        @[JSON::Field(key: "influxAuthParametersSecretArn")]
        getter influx_auth_parameters_secret_arn : String?

        # Specifies the DbInstance's role in the cluster.
        @[JSON::Field(key: "instanceMode")]
        getter instance_mode : String?

        # Specifies the DbInstance's roles in the cluster.
        @[JSON::Field(key: "instanceModes")]
        getter instance_modes : Array(String)?

        # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Indicates if the DB instance has a public IP to facilitate access.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The Availability Zone in which the standby instance is located when deploying with a MultiAZ standby
        # instance.
        @[JSON::Field(key: "secondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # The status of the DB instance.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of VPC security group IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @vpc_subnet_ids : Array(String),
          @allocated_storage : Int32? = nil,
          @availability_zone : String? = nil,
          @db_cluster_id : String? = nil,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @influx_auth_parameters_secret_arn : String? = nil,
          @instance_mode : String? = nil,
          @instance_modes : Array(String)? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @secondary_availability_zone : String? = nil,
          @status : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      # The requested resource was not found or does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the Timestream for InfluxDB resource associated with the request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of Timestream for InfluxDB resource associated with the request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Configuration for S3 bucket log delivery.
      struct S3Configuration
        include JSON::Serializable

        # The name of the S3 bucket to deliver logs to.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # Indicates whether log delivery to the S3 bucket is enabled.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @bucket_name : String,
          @enabled : Bool
        )
        end
      end

      # The request exceeds the service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the tagged resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tags used to categorize and track resources.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds the caller should wait before retrying.
        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the tagged resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys used to identify the tags.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateDbClusterInput
        include JSON::Serializable

        # Service-generated unique identifier of the DB cluster to update.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String

        # Update the DB cluster to use the specified DB instance Type.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # Update the DB cluster to use the specified DB parameter group.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # Update the DB cluster's failover behavior.
        @[JSON::Field(key: "failoverMode")]
        getter failover_mode : String?

        # The log delivery configuration to apply to the DB cluster.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Update the DB cluster to use the specified port.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @db_cluster_id : String,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @failover_mode : String? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @port : Int32? = nil
        )
        end
      end

      struct UpdateDbClusterOutput
        include JSON::Serializable

        # The status of the DB cluster.
        @[JSON::Field(key: "dbClusterStatus")]
        getter db_cluster_status : String?

        def initialize(
          @db_cluster_status : String? = nil
        )
        end
      end

      struct UpdateDbInstanceInput
        include JSON::Serializable

        # The id of the DB instance.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The amount of storage to allocate for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Timestream for InfluxDB DB instance type to run InfluxDB on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The id of the DB parameter group to assign to your DB instance. DB parameter groups specify how the
        # database is configured. For example, DB parameter groups can specify the limit for query
        # concurrency.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies whether the DB instance will be deployed as a standalone instance or with a Multi-AZ
        # standby for high availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # The port number on which InfluxDB accepts connections. If you change the Port value, your database
        # restarts immediately. Valid Values: 1024-65535 Default: 8086 Constraints: The value can't be
        # 2375-2376, 7788-7799, 8090, or 51678-51680
        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @identifier : String,
          @allocated_storage : Int32? = nil,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @port : Int32? = nil
        )
        end
      end

      struct UpdateDbInstanceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DB instance.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A service-generated unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String

        # This customer-supplied name uniquely identifies the DB instance when interacting with the Amazon
        # Timestream for InfluxDB API and CLI commands.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of VPC subnet IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSubnetIds")]
        getter vpc_subnet_ids : Array(String)

        # The amount of storage allocated for your DB storage type (in gibibytes).
        @[JSON::Field(key: "allocatedStorage")]
        getter allocated_storage : Int32?

        # The Availability Zone in which the DB instance resides.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # Specifies the DbCluster to which this DbInstance belongs to.
        @[JSON::Field(key: "dbClusterId")]
        getter db_cluster_id : String?

        # The Timestream for InfluxDB instance type that InfluxDB runs on.
        @[JSON::Field(key: "dbInstanceType")]
        getter db_instance_type : String?

        # The id of the DB parameter group assigned to your DB instance.
        @[JSON::Field(key: "dbParameterGroupIdentifier")]
        getter db_parameter_group_identifier : String?

        # The Timestream for InfluxDB DB storage type that InfluxDB stores data on.
        @[JSON::Field(key: "dbStorageType")]
        getter db_storage_type : String?

        # Specifies whether the Timestream for InfluxDB is deployed as Single-AZ or with a MultiAZ Standby for
        # High availability.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The endpoint used to connect to InfluxDB. The default InfluxDB port is 8086.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The Amazon Resource Name (ARN) of the Secrets Manager secret containing the initial InfluxDB
        # authorization parameters. The secret value is a JSON formatted key-value pair holding InfluxDB
        # authorization values: organization, bucket, username, and password.
        @[JSON::Field(key: "influxAuthParametersSecretArn")]
        getter influx_auth_parameters_secret_arn : String?

        # Specifies the DbInstance's role in the cluster.
        @[JSON::Field(key: "instanceMode")]
        getter instance_mode : String?

        # Specifies the DbInstance's roles in the cluster.
        @[JSON::Field(key: "instanceModes")]
        getter instance_modes : Array(String)?

        # Configuration for sending InfluxDB engine logs to send to specified S3 bucket.
        @[JSON::Field(key: "logDeliveryConfiguration")]
        getter log_delivery_configuration : Types::LogDeliveryConfiguration?

        # Specifies whether the networkType of the Timestream for InfluxDB instance is IPV4, which can
        # communicate over IPv4 protocol only, or DUAL, which can communicate over both IPv4 and IPv6
        # protocols.
        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The port number on which InfluxDB accepts connections.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Indicates if the DB instance has a public IP to facilitate access.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The Availability Zone in which the standby instance is located when deploying with a MultiAZ standby
        # instance.
        @[JSON::Field(key: "secondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # The status of the DB instance.
        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of VPC security group IDs associated with the DB instance.
        @[JSON::Field(key: "vpcSecurityGroupIds")]
        getter vpc_security_group_ids : Array(String)?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @vpc_subnet_ids : Array(String),
          @allocated_storage : Int32? = nil,
          @availability_zone : String? = nil,
          @db_cluster_id : String? = nil,
          @db_instance_type : String? = nil,
          @db_parameter_group_identifier : String? = nil,
          @db_storage_type : String? = nil,
          @deployment_type : String? = nil,
          @endpoint : String? = nil,
          @influx_auth_parameters_secret_arn : String? = nil,
          @instance_mode : String? = nil,
          @instance_modes : Array(String)? = nil,
          @log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
          @network_type : String? = nil,
          @port : Int32? = nil,
          @publicly_accessible : Bool? = nil,
          @secondary_availability_zone : String? = nil,
          @status : String? = nil,
          @vpc_security_group_ids : Array(String)? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by Timestream for InfluxDB.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason that validation failed.
        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end
    end
  end
end
