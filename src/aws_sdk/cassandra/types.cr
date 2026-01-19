require "json"
require "time"

module AwsSdk
  module Keyspaces
    module Types

      # You don't have sufficient access permissions to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon Keyspaces supports the target tracking auto scaling policy. With this policy, Amazon
      # Keyspaces auto scaling ensures that the table's ratio of consumed to provisioned capacity stays at
      # or near the target value that you specify. You define the target value as a percentage between 20
      # and 90.
      struct AutoScalingPolicy
        include JSON::Serializable

        # Auto scaling scales up capacity automatically when traffic exceeds this target utilization rate, and
        # then back down when it falls below the target. A double between 20 and 90.
        @[JSON::Field(key: "targetTrackingScalingPolicyConfiguration")]
        getter target_tracking_scaling_policy_configuration : Types::TargetTrackingScalingPolicyConfiguration?

        def initialize(
          @target_tracking_scaling_policy_configuration : Types::TargetTrackingScalingPolicyConfiguration? = nil
        )
        end
      end

      # The optional auto scaling settings for a table with provisioned throughput capacity. To turn on auto
      # scaling for a table in throughputMode:PROVISIONED , you must specify the following parameters.
      # Configure the minimum and maximum capacity units. The auto scaling policy ensures that capacity
      # never goes below the minimum or above the maximum range. minimumUnits : The minimum level of
      # throughput the table should always be ready to support. The value must be between 1 and the max
      # throughput per second quota for your account (40,000 by default). maximumUnits : The maximum level
      # of throughput the table should always be ready to support. The value must be between 1 and the max
      # throughput per second quota for your account (40,000 by default). scalingPolicy : Amazon Keyspaces
      # supports the target tracking scaling policy. The auto scaling target is the provisioned capacity of
      # the table. targetTrackingScalingPolicyConfiguration : To define the target tracking policy, you must
      # define the target value. targetValue : The target utilization rate of the table. Amazon Keyspaces
      # auto scaling ensures that the ratio of consumed capacity to provisioned capacity stays at or near
      # this value. You define targetValue as a percentage. A double between 20 and 90. (Required)
      # disableScaleIn : A boolean that specifies if scale-in is disabled or enabled for the table. This
      # parameter is disabled by default. To turn on scale-in , set the boolean value to FALSE . This means
      # that capacity for a table can be automatically scaled down on your behalf. (Optional)
      # scaleInCooldown : A cooldown period in seconds between scaling activities that lets the table
      # stabilize before another scale in activity starts. If no value is provided, the default is 0.
      # (Optional) scaleOutCooldown : A cooldown period in seconds between scaling activities that lets the
      # table stabilize before another scale out activity starts. If no value is provided, the default is 0.
      # (Optional) For more information, see Managing throughput capacity automatically with Amazon
      # Keyspaces auto scaling in the Amazon Keyspaces Developer Guide .
      struct AutoScalingSettings
        include JSON::Serializable

        # This optional parameter enables auto scaling for the table if set to false .
        @[JSON::Field(key: "autoScalingDisabled")]
        getter auto_scaling_disabled : Bool?

        # Manage costs by specifying the maximum amount of throughput to provision. The value must be between
        # 1 and the max throughput per second quota for your account (40,000 by default).
        @[JSON::Field(key: "maximumUnits")]
        getter maximum_units : Int64?

        # The minimum level of throughput the table should always be ready to support. The value must be
        # between 1 and the max throughput per second quota for your account (40,000 by default).
        @[JSON::Field(key: "minimumUnits")]
        getter minimum_units : Int64?

        # Amazon Keyspaces supports the target tracking auto scaling policy. With this policy, Amazon
        # Keyspaces auto scaling ensures that the table's ratio of consumed to provisioned capacity stays at
        # or near the target value that you specify. You define the target value as a percentage between 20
        # and 90.
        @[JSON::Field(key: "scalingPolicy")]
        getter scaling_policy : Types::AutoScalingPolicy?

        def initialize(
          @auto_scaling_disabled : Bool? = nil,
          @maximum_units : Int64? = nil,
          @minimum_units : Int64? = nil,
          @scaling_policy : Types::AutoScalingPolicy? = nil
        )
        end
      end

      # The optional auto scaling capacity settings for a table in provisioned capacity mode.
      struct AutoScalingSpecification
        include JSON::Serializable

        # The auto scaling settings for the table's read capacity.
        @[JSON::Field(key: "readCapacityAutoScaling")]
        getter read_capacity_auto_scaling : Types::AutoScalingSettings?

        # The auto scaling settings for the table's write capacity.
        @[JSON::Field(key: "writeCapacityAutoScaling")]
        getter write_capacity_auto_scaling : Types::AutoScalingSettings?

        def initialize(
          @read_capacity_auto_scaling : Types::AutoScalingSettings? = nil,
          @write_capacity_auto_scaling : Types::AutoScalingSettings? = nil
        )
        end
      end

      # Amazon Keyspaces has two read/write capacity modes for processing reads and writes on your tables:
      # On-demand (default) Provisioned The read/write capacity mode that you choose controls how you are
      # charged for read and write throughput and how table throughput capacity is managed. For more
      # information, see Read/write capacity modes in the Amazon Keyspaces Developer Guide .
      struct CapacitySpecification
        include JSON::Serializable

        # The read/write throughput capacity mode for a table. The options are: throughputMode:PAY_PER_REQUEST
        # and throughputMode:PROVISIONED - Provisioned capacity mode requires readCapacityUnits and
        # writeCapacityUnits as input. The default is throughput_mode:PAY_PER_REQUEST . For more information,
        # see Read/write capacity modes in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "throughputMode")]
        getter throughput_mode : String

        # The throughput capacity specified for read operations defined in read capacity units (RCUs) .
        @[JSON::Field(key: "readCapacityUnits")]
        getter read_capacity_units : Int64?

        # The throughput capacity specified for write operations defined in write capacity units (WCUs) .
        @[JSON::Field(key: "writeCapacityUnits")]
        getter write_capacity_units : Int64?

        def initialize(
          @throughput_mode : String,
          @read_capacity_units : Int64? = nil,
          @write_capacity_units : Int64? = nil
        )
        end
      end

      # The read/write throughput capacity mode for a table. The options are: throughputMode:PAY_PER_REQUEST
      # and throughputMode:PROVISIONED . For more information, see Read/write capacity modes in the Amazon
      # Keyspaces Developer Guide .
      struct CapacitySpecificationSummary
        include JSON::Serializable

        # The read/write throughput capacity mode for a table. The options are: throughputMode:PAY_PER_REQUEST
        # and throughputMode:PROVISIONED - Provisioned capacity mode requires readCapacityUnits and
        # writeCapacityUnits as input. The default is throughput_mode:PAY_PER_REQUEST . For more information,
        # see Read/write capacity modes in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "throughputMode")]
        getter throughput_mode : String

        # The timestamp of the last operation that changed the provisioned throughput capacity of a table.
        @[JSON::Field(key: "lastUpdateToPayPerRequestTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_to_pay_per_request_timestamp : Time?

        # The throughput capacity specified for read operations defined in read capacity units (RCUs) .
        @[JSON::Field(key: "readCapacityUnits")]
        getter read_capacity_units : Int64?

        # The throughput capacity specified for write operations defined in write capacity units (WCUs) .
        @[JSON::Field(key: "writeCapacityUnits")]
        getter write_capacity_units : Int64?

        def initialize(
          @throughput_mode : String,
          @last_update_to_pay_per_request_timestamp : Time? = nil,
          @read_capacity_units : Int64? = nil,
          @write_capacity_units : Int64? = nil
        )
        end
      end

      # The settings for the CDC stream of a table. For more information about CDC streams, see Working with
      # change data capture (CDC) streams in Amazon Keyspaces in the Amazon Keyspaces Developer Guide .
      struct CdcSpecification
        include JSON::Serializable

        # The status of the CDC stream. You can enable or disable a stream for a table.
        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies that the stream inherits the tags from the table.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        # The tags (key-value pairs) that you want to apply to the stream.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The view type specifies the changes Amazon Keyspaces records for each changed row in the stream.
        # After you create the stream, you can't make changes to this selection. The options are:
        # NEW_AND_OLD_IMAGES - both versions of the row, before and after the change. This is the default.
        # NEW_IMAGE - the version of the row after the change. OLD_IMAGE - the version of the row before the
        # change. KEYS_ONLY - the partition and clustering keys of the row that was changed.
        @[JSON::Field(key: "viewType")]
        getter view_type : String?

        def initialize(
          @status : String,
          @propagate_tags : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @view_type : String? = nil
        )
        end
      end

      # The settings of the CDC stream of the table. For more information about CDC streams, see Working
      # with change data capture (CDC) streams in Amazon Keyspaces in the Amazon Keyspaces Developer Guide .
      struct CdcSpecificationSummary
        include JSON::Serializable

        # The status of the CDC stream. Specifies if the table has a CDC stream.
        @[JSON::Field(key: "status")]
        getter status : String

        # The view type specifies the changes Amazon Keyspaces records for each changed row in the stream.
        # This setting can't be changed, after the stream has been created. The options are:
        # NEW_AND_OLD_IMAGES - both versions of the row, before and after the change. This is the default.
        # NEW_IMAGE - the version of the row after the change. OLD_IMAGE - the version of the row before the
        # change. KEYS_ONLY - the partition and clustering keys of the row that was changed.
        @[JSON::Field(key: "viewType")]
        getter view_type : String?

        def initialize(
          @status : String,
          @view_type : String? = nil
        )
        end
      end

      # The client-side timestamp setting of the table. For more information, see How it works: Amazon
      # Keyspaces client-side timestamps in the Amazon Keyspaces Developer Guide .
      struct ClientSideTimestamps
        include JSON::Serializable

        # Shows how to enable client-side timestamps settings for the specified table.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # The optional clustering column portion of your primary key determines how the data is clustered and
      # sorted within each partition.
      struct ClusteringKey
        include JSON::Serializable

        # The name(s) of the clustering column(s).
        @[JSON::Field(key: "name")]
        getter name : String

        # Sets the ascendant ( ASC ) or descendant ( DESC ) order modifier.
        @[JSON::Field(key: "orderBy")]
        getter order_by : String

        def initialize(
          @name : String,
          @order_by : String
        )
        end
      end

      # The names and data types of regular columns.
      struct ColumnDefinition
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "name")]
        getter name : String

        # The data type of the column. For a list of available data types, see Data types in the Amazon
        # Keyspaces Developer Guide .
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # An optional comment that describes the table.
      struct Comment
        include JSON::Serializable

        # An optional description of the table.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Amazon Keyspaces couldn't complete the requested action. This error may occur if you try to perform
      # an action and the same or a different action is already in progress, or if you try to create a
      # resource that already exists.
      struct ConflictException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateKeyspaceRequest
        include JSON::Serializable

        # The name of the keyspace to be created.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The replication specification of the keyspace includes: replicationStrategy - the required value is
        # SINGLE_REGION or MULTI_REGION . regionList - if the replicationStrategy is MULTI_REGION , the
        # regionList requires the current Region and at least one additional Amazon Web Services Region where
        # the keyspace is going to be replicated in.
        @[JSON::Field(key: "replicationSpecification")]
        getter replication_specification : Types::ReplicationSpecification?

        # A list of key-value pair tags to be attached to the keyspace. For more information, see Adding tags
        # and labels to Amazon Keyspaces resources in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @keyspace_name : String,
          @replication_specification : Types::ReplicationSpecification? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateKeyspaceResponse
        include JSON::Serializable

        # The unique identifier of the keyspace in the format of an Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct CreateTableRequest
        include JSON::Serializable

        # The name of the keyspace that the table is going to be created in.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The schemaDefinition consists of the following parameters. For each column to be created: name - The
        # name of the column. type - An Amazon Keyspaces data type. For more information, see Data types in
        # the Amazon Keyspaces Developer Guide . The primary key of the table consists of the following
        # columns: partitionKeys - The partition key can be a single column, or it can be a compound value
        # composed of two or more columns. The partition key portion of the primary key is required and
        # determines how Amazon Keyspaces stores your data. name - The name of each partition key column.
        # clusteringKeys - The optional clustering column portion of your primary key determines how the data
        # is clustered and sorted within each partition. name - The name of the clustering column. orderBy -
        # Sets the ascendant ( ASC ) or descendant ( DESC ) order modifier. To define a column as static use
        # staticColumns - Static columns store values that are shared by all rows in the same partition: name
        # - The name of the column. type - An Amazon Keyspaces data type.
        @[JSON::Field(key: "schemaDefinition")]
        getter schema_definition : Types::SchemaDefinition

        # The name of the table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The optional auto scaling settings for a table in provisioned capacity mode. Specifies if the
        # service can manage throughput capacity automatically on your behalf. Auto scaling helps you
        # provision throughput capacity for variable workloads efficiently by increasing and decreasing your
        # table's read and write capacity automatically in response to application traffic. For more
        # information, see Managing throughput capacity automatically with Amazon Keyspaces auto scaling in
        # the Amazon Keyspaces Developer Guide . By default, auto scaling is disabled for a table.
        @[JSON::Field(key: "autoScalingSpecification")]
        getter auto_scaling_specification : Types::AutoScalingSpecification?

        # Specifies the read/write throughput capacity mode for the table. The options are:
        # throughputMode:PAY_PER_REQUEST and throughputMode:PROVISIONED - Provisioned capacity mode requires
        # readCapacityUnits and writeCapacityUnits as input. The default is throughput_mode:PAY_PER_REQUEST .
        # For more information, see Read/write capacity modes in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "capacitySpecification")]
        getter capacity_specification : Types::CapacitySpecification?

        # The CDC stream settings of the table.
        @[JSON::Field(key: "cdcSpecification")]
        getter cdc_specification : Types::CdcSpecification?

        # Enables client-side timestamps for the table. By default, the setting is disabled. You can enable
        # client-side timestamps with the following option: status: "enabled" Once client-side timestamps are
        # enabled for a table, this setting cannot be disabled.
        @[JSON::Field(key: "clientSideTimestamps")]
        getter client_side_timestamps : Types::ClientSideTimestamps?

        # This parameter allows to enter a description of the table.
        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        # The default Time to Live setting in seconds for the table. For more information, see Setting the
        # default TTL value for a table in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "defaultTimeToLive")]
        getter default_time_to_live : Int32?

        # Specifies how the encryption key for encryption at rest is managed for the table. You can choose one
        # of the following KMS key (KMS key): type:AWS_OWNED_KMS_KEY - This key is owned by Amazon Keyspaces.
        # type:CUSTOMER_MANAGED_KMS_KEY - This key is stored in your account and is created, owned, and
        # managed by you. This option requires the kms_key_identifier of the KMS key in Amazon Resource Name
        # (ARN) format as input. The default is type:AWS_OWNED_KMS_KEY . For more information, see Encryption
        # at rest in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "encryptionSpecification")]
        getter encryption_specification : Types::EncryptionSpecification?

        # Specifies if pointInTimeRecovery is enabled or disabled for the table. The options are:
        # status=ENABLED status=DISABLED If it's not specified, the default is status=DISABLED . For more
        # information, see Point-in-time recovery in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "pointInTimeRecovery")]
        getter point_in_time_recovery : Types::PointInTimeRecovery?

        # The optional Amazon Web Services Region specific settings of a multi-Region table. These settings
        # overwrite the general settings of the table for the specified Region. For a multi-Region table in
        # provisioned capacity mode, you can configure the table's read capacity differently for each Region's
        # replica. The write capacity, however, remains synchronized between all replicas to ensure that
        # there's enough capacity to replicate writes across all Regions. To define the read capacity for a
        # table replica in a specific Region, you can do so by configuring the following parameters. region :
        # The Region where these settings are applied. (Required) readCapacityUnits : The provisioned read
        # capacity units. (Optional) readCapacityAutoScaling : The read capacity auto scaling settings for the
        # table. (Optional)
        @[JSON::Field(key: "replicaSpecifications")]
        getter replica_specifications : Array(Types::ReplicaSpecification)?

        # A list of key-value pair tags to be attached to the resource. For more information, see Adding tags
        # and labels to Amazon Keyspaces resources in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Enables Time to Live custom settings for the table. The options are: status:enabled status:disabled
        # The default is status:disabled . After ttl is enabled, you can't disable it for the table. For more
        # information, see Expiring data by using Amazon Keyspaces Time to Live (TTL) in the Amazon Keyspaces
        # Developer Guide .
        @[JSON::Field(key: "ttl")]
        getter ttl : Types::TimeToLive?

        def initialize(
          @keyspace_name : String,
          @schema_definition : Types::SchemaDefinition,
          @table_name : String,
          @auto_scaling_specification : Types::AutoScalingSpecification? = nil,
          @capacity_specification : Types::CapacitySpecification? = nil,
          @cdc_specification : Types::CdcSpecification? = nil,
          @client_side_timestamps : Types::ClientSideTimestamps? = nil,
          @comment : Types::Comment? = nil,
          @default_time_to_live : Int32? = nil,
          @encryption_specification : Types::EncryptionSpecification? = nil,
          @point_in_time_recovery : Types::PointInTimeRecovery? = nil,
          @replica_specifications : Array(Types::ReplicaSpecification)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @ttl : Types::TimeToLive? = nil
        )
        end
      end

      struct CreateTableResponse
        include JSON::Serializable

        # The unique identifier of the table in the format of an Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct CreateTypeRequest
        include JSON::Serializable

        # The field definitions, consisting of names and types, that define this type.
        @[JSON::Field(key: "fieldDefinitions")]
        getter field_definitions : Array(Types::FieldDefinition)

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The name of the user-defined type. UDT names must contain 48 characters or less, must begin with an
        # alphabetic character, and can only contain alpha-numeric characters and underscores. Amazon
        # Keyspaces converts upper case characters automatically into lower case characters. Alternatively,
        # you can declare a UDT name in double quotes. When declaring a UDT name inside double quotes, Amazon
        # Keyspaces preserves upper casing and allows special characters. You can also use double quotes as
        # part of the name when you create the UDT, but you must escape each double quote character with an
        # additional double quote character.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @field_definitions : Array(Types::FieldDefinition),
          @keyspace_name : String,
          @type_name : String
        )
        end
      end

      struct CreateTypeResponse
        include JSON::Serializable

        # The unique identifier of the keyspace that contains the new type in the format of an Amazon Resource
        # Name (ARN).
        @[JSON::Field(key: "keyspaceArn")]
        getter keyspace_arn : String

        # The formatted name of the user-defined type that was created. Note that Amazon Keyspaces requires
        # the formatted name of the type for other operations, for example GetType .
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @keyspace_arn : String,
          @type_name : String
        )
        end
      end

      struct DeleteKeyspaceRequest
        include JSON::Serializable

        # The name of the keyspace to be deleted.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        def initialize(
          @keyspace_name : String
        )
        end
      end

      struct DeleteKeyspaceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTableRequest
        include JSON::Serializable

        # The name of the keyspace of the to be deleted table.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The name of the table to be deleted.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @keyspace_name : String,
          @table_name : String
        )
        end
      end

      struct DeleteTableResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTypeRequest
        include JSON::Serializable

        # The name of the keyspace of the to be deleted type.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The name of the type to be deleted.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @keyspace_name : String,
          @type_name : String
        )
        end
      end

      struct DeleteTypeResponse
        include JSON::Serializable

        # The unique identifier of the keyspace from which the type was deleted in the format of an Amazon
        # Resource Name (ARN).
        @[JSON::Field(key: "keyspaceArn")]
        getter keyspace_arn : String

        # The name of the type that was deleted.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @keyspace_arn : String,
          @type_name : String
        )
        end
      end

      # Amazon Keyspaces encrypts and decrypts the table data at rest transparently and integrates with Key
      # Management Service for storing and managing the encryption key. You can choose one of the following
      # KMS keys (KMS keys): Amazon Web Services owned key - This is the default encryption type. The key is
      # owned by Amazon Keyspaces (no additional charge). Customer managed key - This key is stored in your
      # account and is created, owned, and managed by you. You have full control over the customer managed
      # key (KMS charges apply). For more information about encryption at rest in Amazon Keyspaces, see
      # Encryption at rest in the Amazon Keyspaces Developer Guide . For more information about KMS, see KMS
      # management service concepts in the Key Management Service Developer Guide .
      struct EncryptionSpecification
        include JSON::Serializable

        # The encryption option specified for the table. You can choose one of the following KMS keys (KMS
        # keys): type:AWS_OWNED_KMS_KEY - This key is owned by Amazon Keyspaces. type:CUSTOMER_MANAGED_KMS_KEY
        # - This key is stored in your account and is created, owned, and managed by you. This option requires
        # the kms_key_identifier of the KMS key in Amazon Resource Name (ARN) format as input. The default is
        # type:AWS_OWNED_KMS_KEY . For more information, see Encryption at rest in the Amazon Keyspaces
        # Developer Guide .
        @[JSON::Field(key: "type")]
        getter type : String

        # The Amazon Resource Name (ARN) of the customer managed KMS key, for example kms_key_identifier:ARN .
        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        def initialize(
          @type : String,
          @kms_key_identifier : String? = nil
        )
        end
      end

      # A field definition consists out of a name and a type.
      struct FieldDefinition
        include JSON::Serializable

        # The identifier.
        @[JSON::Field(key: "name")]
        getter name : String

        # Any supported Cassandra data type, including collections and other user-defined types that are
        # contained in the same keyspace. For more information, see Cassandra data type support in the Amazon
        # Keyspaces Developer Guide .
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      struct GetKeyspaceRequest
        include JSON::Serializable

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        def initialize(
          @keyspace_name : String
        )
        end
      end

      struct GetKeyspaceResponse
        include JSON::Serializable

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # Returns the replication strategy of the keyspace. The options are SINGLE_REGION or MULTI_REGION .
        @[JSON::Field(key: "replicationStrategy")]
        getter replication_strategy : String

        # Returns the ARN of the keyspace.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of all Regions the keyspace is replicated in after the update keyspace operation and their
        # status.
        @[JSON::Field(key: "replicationGroupStatuses")]
        getter replication_group_statuses : Array(Types::ReplicationGroupStatus)?

        # If the replicationStrategy of the keyspace is MULTI_REGION , a list of replication Regions is
        # returned.
        @[JSON::Field(key: "replicationRegions")]
        getter replication_regions : Array(String)?

        def initialize(
          @keyspace_name : String,
          @replication_strategy : String,
          @resource_arn : String,
          @replication_group_statuses : Array(Types::ReplicationGroupStatus)? = nil,
          @replication_regions : Array(String)? = nil
        )
        end
      end

      struct GetTableAutoScalingSettingsRequest
        include JSON::Serializable

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The name of the table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @keyspace_name : String,
          @table_name : String
        )
        end
      end

      struct GetTableAutoScalingSettingsResponse
        include JSON::Serializable

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The Amazon Resource Name (ARN) of the table.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name of the table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The auto scaling settings of the table.
        @[JSON::Field(key: "autoScalingSpecification")]
        getter auto_scaling_specification : Types::AutoScalingSpecification?

        # The Amazon Web Services Region specific settings of a multi-Region table. Returns the settings for
        # all Regions the table is replicated in.
        @[JSON::Field(key: "replicaSpecifications")]
        getter replica_specifications : Array(Types::ReplicaAutoScalingSpecification)?

        def initialize(
          @keyspace_name : String,
          @resource_arn : String,
          @table_name : String,
          @auto_scaling_specification : Types::AutoScalingSpecification? = nil,
          @replica_specifications : Array(Types::ReplicaAutoScalingSpecification)? = nil
        )
        end
      end

      struct GetTableRequest
        include JSON::Serializable

        # The name of the keyspace that the table is stored in.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The name of the table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @keyspace_name : String,
          @table_name : String
        )
        end
      end

      struct GetTableResponse
        include JSON::Serializable

        # The name of the keyspace that the specified table is stored in.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The Amazon Resource Name (ARN) of the specified table.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name of the specified table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The read/write throughput capacity mode for a table. The options are: throughputMode:PAY_PER_REQUEST
        # throughputMode:PROVISIONED
        @[JSON::Field(key: "capacitySpecification")]
        getter capacity_specification : Types::CapacitySpecificationSummary?

        # The CDC stream settings of the table.
        @[JSON::Field(key: "cdcSpecification")]
        getter cdc_specification : Types::CdcSpecificationSummary?

        # The client-side timestamps setting of the table.
        @[JSON::Field(key: "clientSideTimestamps")]
        getter client_side_timestamps : Types::ClientSideTimestamps?

        # The the description of the specified table.
        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        # The creation timestamp of the specified table.
        @[JSON::Field(key: "creationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The default Time to Live settings in seconds of the specified table.
        @[JSON::Field(key: "defaultTimeToLive")]
        getter default_time_to_live : Int32?

        # The encryption settings of the specified table.
        @[JSON::Field(key: "encryptionSpecification")]
        getter encryption_specification : Types::EncryptionSpecification?

        # The Amazon Resource Name (ARN) of the stream.
        @[JSON::Field(key: "latestStreamArn")]
        getter latest_stream_arn : String?

        # The point-in-time recovery status of the specified table.
        @[JSON::Field(key: "pointInTimeRecovery")]
        getter point_in_time_recovery : Types::PointInTimeRecoverySummary?

        # Returns the Amazon Web Services Region specific settings of all Regions a multi-Region table is
        # replicated in.
        @[JSON::Field(key: "replicaSpecifications")]
        getter replica_specifications : Array(Types::ReplicaSpecificationSummary)?

        # The schema definition of the specified table.
        @[JSON::Field(key: "schemaDefinition")]
        getter schema_definition : Types::SchemaDefinition?

        # The current status of the specified table.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The custom Time to Live settings of the specified table.
        @[JSON::Field(key: "ttl")]
        getter ttl : Types::TimeToLive?

        def initialize(
          @keyspace_name : String,
          @resource_arn : String,
          @table_name : String,
          @capacity_specification : Types::CapacitySpecificationSummary? = nil,
          @cdc_specification : Types::CdcSpecificationSummary? = nil,
          @client_side_timestamps : Types::ClientSideTimestamps? = nil,
          @comment : Types::Comment? = nil,
          @creation_timestamp : Time? = nil,
          @default_time_to_live : Int32? = nil,
          @encryption_specification : Types::EncryptionSpecification? = nil,
          @latest_stream_arn : String? = nil,
          @point_in_time_recovery : Types::PointInTimeRecoverySummary? = nil,
          @replica_specifications : Array(Types::ReplicaSpecificationSummary)? = nil,
          @schema_definition : Types::SchemaDefinition? = nil,
          @status : String? = nil,
          @ttl : Types::TimeToLive? = nil
        )
        end
      end

      struct GetTypeRequest
        include JSON::Serializable

        # The name of the keyspace that contains this type.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The formatted name of the type. For example, if the name of the type was created without double
        # quotes, Amazon Keyspaces saved the name in lower-case characters. If the name was created in double
        # quotes, you must use double quotes to specify the type name.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        def initialize(
          @keyspace_name : String,
          @type_name : String
        )
        end
      end

      struct GetTypeResponse
        include JSON::Serializable

        # The unique identifier of the keyspace that contains this type in the format of an Amazon Resource
        # Name (ARN).
        @[JSON::Field(key: "keyspaceArn")]
        getter keyspace_arn : String

        # The name of the keyspace that contains this type.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The name of the type.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The types that use this type.
        @[JSON::Field(key: "directParentTypes")]
        getter direct_parent_types : Array(String)?

        # The tables that use this type.
        @[JSON::Field(key: "directReferringTables")]
        getter direct_referring_tables : Array(String)?

        # The names and types that define this type.
        @[JSON::Field(key: "fieldDefinitions")]
        getter field_definitions : Array(Types::FieldDefinition)?

        # The timestamp that shows when this type was last modified.
        @[JSON::Field(key: "lastModifiedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_timestamp : Time?

        # The level of nesting implemented for this type.
        @[JSON::Field(key: "maxNestingDepth")]
        getter max_nesting_depth : Int32?

        # The status of this type.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @keyspace_arn : String,
          @keyspace_name : String,
          @type_name : String,
          @direct_parent_types : Array(String)? = nil,
          @direct_referring_tables : Array(String)? = nil,
          @field_definitions : Array(Types::FieldDefinition)? = nil,
          @last_modified_timestamp : Time? = nil,
          @max_nesting_depth : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Amazon Keyspaces was unable to fully process this request because of an internal server error.
      struct InternalServerException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the properties of a keyspace.
      struct KeyspaceSummary
        include JSON::Serializable

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # This property specifies if a keyspace is a single Region keyspace or a multi-Region keyspace. The
        # available values are SINGLE_REGION or MULTI_REGION .
        @[JSON::Field(key: "replicationStrategy")]
        getter replication_strategy : String

        # The unique identifier of the keyspace in the format of an Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # If the replicationStrategy of the keyspace is MULTI_REGION , a list of replication Regions is
        # returned.
        @[JSON::Field(key: "replicationRegions")]
        getter replication_regions : Array(String)?

        def initialize(
          @keyspace_name : String,
          @replication_strategy : String,
          @resource_arn : String,
          @replication_regions : Array(String)? = nil
        )
        end
      end

      struct ListKeyspacesRequest
        include JSON::Serializable

        # The total number of keyspaces to return in the output. If the total number of keyspaces available is
        # more than the value specified, a NextToken is provided in the output. To resume pagination, provide
        # the NextToken value as an argument of a subsequent API invocation.
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

      struct ListKeyspacesResponse
        include JSON::Serializable

        # A list of keyspaces.
        @[JSON::Field(key: "keyspaces")]
        getter keyspaces : Array(Types::KeyspaceSummary)

        # A token to specify where to start paginating. This is the NextToken from a previously truncated
        # response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @keyspaces : Array(Types::KeyspaceSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTablesRequest
        include JSON::Serializable

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The total number of tables to return in the output. If the total number of tables available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as an argument of a subsequent API invocation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the NextToken value as an argument of a
        # subsequent API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @keyspace_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTablesResponse
        include JSON::Serializable

        # A token to specify where to start paginating. This is the NextToken from a previously truncated
        # response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of tables.
        @[JSON::Field(key: "tables")]
        getter tables : Array(Types::TableSummary)?

        def initialize(
          @next_token : String? = nil,
          @tables : Array(Types::TableSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Keyspaces resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The total number of tags to return in the output. If the total number of tags available is more than
        # the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as an argument of a subsequent API invocation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the NextToken value as argument of a subsequent
        # API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A token to specify where to start paginating. This is the NextToken from a previously truncated
        # response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of tags.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTypesRequest
        include JSON::Serializable

        # The name of the keyspace that contains the listed types.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The total number of types to return in the output. If the total number of types available is more
        # than the value specified, a NextToken is provided in the output. To resume pagination, provide the
        # NextToken value as an argument of a subsequent API invocation.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token. To resume pagination, provide the NextToken value as an argument of a
        # subsequent API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @keyspace_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTypesResponse
        include JSON::Serializable

        # The list of types contained in the specified keyspace.
        @[JSON::Field(key: "types")]
        getter types : Array(String)

        # The pagination token. To resume pagination, provide the NextToken value as an argument of a
        # subsequent API invocation.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @types : Array(String),
          @next_token : String? = nil
        )
        end
      end

      # The partition key portion of the primary key is required and determines how Amazon Keyspaces stores
      # the data. The partition key can be a single column, or it can be a compound value composed of two or
      # more columns.
      struct PartitionKey
        include JSON::Serializable

        # The name(s) of the partition key column(s).
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Point-in-time recovery (PITR) helps protect your Amazon Keyspaces tables from accidental write or
      # delete operations by providing you continuous backups of your table data. For more information, see
      # Point-in-time recovery in the Amazon Keyspaces Developer Guide .
      struct PointInTimeRecovery
        include JSON::Serializable

        # The options are: status=ENABLED status=DISABLED
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # The point-in-time recovery status of the specified table.
      struct PointInTimeRecoverySummary
        include JSON::Serializable

        # Shows if point-in-time recovery is enabled or disabled for the specified table.
        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies the earliest possible restore point of the table in ISO 8601 format.
        @[JSON::Field(key: "earliestRestorableTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter earliest_restorable_timestamp : Time?

        def initialize(
          @status : String,
          @earliest_restorable_timestamp : Time? = nil
        )
        end
      end

      # The auto scaling settings of a multi-Region table in the specified Amazon Web Services Region.
      struct ReplicaAutoScalingSpecification
        include JSON::Serializable

        # The auto scaling settings for a multi-Region table in the specified Amazon Web Services Region.
        @[JSON::Field(key: "autoScalingSpecification")]
        getter auto_scaling_specification : Types::AutoScalingSpecification?

        # The Amazon Web Services Region.
        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @auto_scaling_specification : Types::AutoScalingSpecification? = nil,
          @region : String? = nil
        )
        end
      end

      # The Amazon Web Services Region specific settings of a multi-Region table. For a multi-Region table,
      # you can configure the table's read capacity differently per Amazon Web Services Region. You can do
      # this by configuring the following parameters. region : The Region where these settings are applied.
      # (Required) readCapacityUnits : The provisioned read capacity units. (Optional)
      # readCapacityAutoScaling : The read capacity auto scaling settings for the table. (Optional)
      struct ReplicaSpecification
        include JSON::Serializable

        # The Amazon Web Services Region.
        @[JSON::Field(key: "region")]
        getter region : String

        # The read capacity auto scaling settings for the multi-Region table in the specified Amazon Web
        # Services Region.
        @[JSON::Field(key: "readCapacityAutoScaling")]
        getter read_capacity_auto_scaling : Types::AutoScalingSettings?

        # The provisioned read capacity units for the multi-Region table in the specified Amazon Web Services
        # Region.
        @[JSON::Field(key: "readCapacityUnits")]
        getter read_capacity_units : Int64?

        def initialize(
          @region : String,
          @read_capacity_auto_scaling : Types::AutoScalingSettings? = nil,
          @read_capacity_units : Int64? = nil
        )
        end
      end

      # The Region-specific settings of a multi-Region table in the specified Amazon Web Services Region. If
      # the multi-Region table is using provisioned capacity and has optional auto scaling policies
      # configured, note that the Region specific summary returns both read and write capacity settings. But
      # only Region specific read capacity settings can be configured for a multi-Region table. In a
      # multi-Region table, your write capacity units will be synced across all Amazon Web Services Regions
      # to ensure that there is enough capacity to replicate write events across Regions.
      struct ReplicaSpecificationSummary
        include JSON::Serializable

        @[JSON::Field(key: "capacitySpecification")]
        getter capacity_specification : Types::CapacitySpecificationSummary?

        # The Amazon Web Services Region.
        @[JSON::Field(key: "region")]
        getter region : String?

        # The status of the multi-Region table in the specified Amazon Web Services Region.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @capacity_specification : Types::CapacitySpecificationSummary? = nil,
          @region : String? = nil,
          @status : String? = nil
        )
        end
      end

      # This shows the summary status of the keyspace after a new Amazon Web Services Region was added.
      struct ReplicationGroupStatus
        include JSON::Serializable

        # The status of the keyspace.
        @[JSON::Field(key: "keyspaceStatus")]
        getter keyspace_status : String

        # The name of the Region that was added to the keyspace.
        @[JSON::Field(key: "region")]
        getter region : String

        # This shows the replication progress of tables in the keyspace. The value is expressed as a
        # percentage of the newly replicated tables with status Active compared to the total number of tables
        # in the keyspace.
        @[JSON::Field(key: "tablesReplicationProgress")]
        getter tables_replication_progress : String?

        def initialize(
          @keyspace_status : String,
          @region : String,
          @tables_replication_progress : String? = nil
        )
        end
      end

      # The replication specification of the keyspace includes: regionList - the Amazon Web Services Regions
      # where the keyspace is replicated in. replicationStrategy - the required value is SINGLE_REGION or
      # MULTI_REGION .
      struct ReplicationSpecification
        include JSON::Serializable

        # The replicationStrategy of a keyspace, the required value is SINGLE_REGION or MULTI_REGION .
        @[JSON::Field(key: "replicationStrategy")]
        getter replication_strategy : String

        # The regionList contains the Amazon Web Services Regions where the keyspace is replicated in.
        @[JSON::Field(key: "regionList")]
        getter region_list : Array(String)?

        def initialize(
          @replication_strategy : String,
          @region_list : Array(String)? = nil
        )
        end
      end

      # The operation tried to access a keyspace, table, or type that doesn't exist. The resource might not
      # be specified correctly, or its status might not be ACTIVE .
      struct ResourceNotFoundException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The unique identifier in the format of Amazon Resource Name (ARN) for the resource couldn’t be
        # found.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @message : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct RestoreTableRequest
        include JSON::Serializable

        # The keyspace name of the source table.
        @[JSON::Field(key: "sourceKeyspaceName")]
        getter source_keyspace_name : String

        # The name of the source table.
        @[JSON::Field(key: "sourceTableName")]
        getter source_table_name : String

        # The name of the target keyspace.
        @[JSON::Field(key: "targetKeyspaceName")]
        getter target_keyspace_name : String

        # The name of the target table.
        @[JSON::Field(key: "targetTableName")]
        getter target_table_name : String

        # The optional auto scaling settings for the restored table in provisioned capacity mode. Specifies if
        # the service can manage throughput capacity of a provisioned table automatically on your behalf.
        # Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads
        # efficiently by increasing and decreasing your table's read and write capacity automatically in
        # response to application traffic. For more information, see Managing throughput capacity
        # automatically with Amazon Keyspaces auto scaling in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "autoScalingSpecification")]
        getter auto_scaling_specification : Types::AutoScalingSpecification?

        # Specifies the read/write throughput capacity mode for the target table. The options are:
        # throughputMode:PAY_PER_REQUEST throughputMode:PROVISIONED - Provisioned capacity mode requires
        # readCapacityUnits and writeCapacityUnits as input. The default is throughput_mode:PAY_PER_REQUEST .
        # For more information, see Read/write capacity modes in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "capacitySpecificationOverride")]
        getter capacity_specification_override : Types::CapacitySpecification?

        # Specifies the encryption settings for the target table. You can choose one of the following KMS key
        # (KMS key): type:AWS_OWNED_KMS_KEY - This key is owned by Amazon Keyspaces.
        # type:CUSTOMER_MANAGED_KMS_KEY - This key is stored in your account and is created, owned, and
        # managed by you. This option requires the kms_key_identifier of the KMS key in Amazon Resource Name
        # (ARN) format as input. The default is type:AWS_OWNED_KMS_KEY . For more information, see Encryption
        # at rest in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "encryptionSpecificationOverride")]
        getter encryption_specification_override : Types::EncryptionSpecification?

        # Specifies the pointInTimeRecovery settings for the target table. The options are: status=ENABLED
        # status=DISABLED If it's not specified, the default is status=DISABLED . For more information, see
        # Point-in-time recovery in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "pointInTimeRecoveryOverride")]
        getter point_in_time_recovery_override : Types::PointInTimeRecovery?

        # The optional Region specific settings of a multi-Regional table.
        @[JSON::Field(key: "replicaSpecifications")]
        getter replica_specifications : Array(Types::ReplicaSpecification)?

        # The restore timestamp in ISO 8601 format.
        @[JSON::Field(key: "restoreTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter restore_timestamp : Time?

        # A list of key-value pair tags to be attached to the restored table. For more information, see Adding
        # tags and labels to Amazon Keyspaces resources in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "tagsOverride")]
        getter tags_override : Array(Types::Tag)?

        def initialize(
          @source_keyspace_name : String,
          @source_table_name : String,
          @target_keyspace_name : String,
          @target_table_name : String,
          @auto_scaling_specification : Types::AutoScalingSpecification? = nil,
          @capacity_specification_override : Types::CapacitySpecification? = nil,
          @encryption_specification_override : Types::EncryptionSpecification? = nil,
          @point_in_time_recovery_override : Types::PointInTimeRecovery? = nil,
          @replica_specifications : Array(Types::ReplicaSpecification)? = nil,
          @restore_timestamp : Time? = nil,
          @tags_override : Array(Types::Tag)? = nil
        )
        end
      end

      struct RestoreTableResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the restored table.
        @[JSON::Field(key: "restoredTableARN")]
        getter restored_table_arn : String

        def initialize(
          @restored_table_arn : String
        )
        end
      end

      # Describes the schema of the table.
      struct SchemaDefinition
        include JSON::Serializable

        # The regular columns of the table.
        @[JSON::Field(key: "allColumns")]
        getter all_columns : Array(Types::ColumnDefinition)

        # The columns that are part of the partition key of the table .
        @[JSON::Field(key: "partitionKeys")]
        getter partition_keys : Array(Types::PartitionKey)

        # The columns that are part of the clustering key of the table.
        @[JSON::Field(key: "clusteringKeys")]
        getter clustering_keys : Array(Types::ClusteringKey)?

        # The columns that have been defined as STATIC . Static columns store values that are shared by all
        # rows in the same partition.
        @[JSON::Field(key: "staticColumns")]
        getter static_columns : Array(Types::StaticColumn)?

        def initialize(
          @all_columns : Array(Types::ColumnDefinition),
          @partition_keys : Array(Types::PartitionKey),
          @clustering_keys : Array(Types::ClusteringKey)? = nil,
          @static_columns : Array(Types::StaticColumn)? = nil
        )
        end
      end

      # The operation exceeded the service quota for this resource. For more information on service quotas,
      # see Quotas in the Amazon Keyspaces Developer Guide .
      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The static columns of the table. Static columns store values that are shared by all rows in the same
      # partition.
      struct StaticColumn
        include JSON::Serializable

        # The name of the static column.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Returns the name of the specified table, the keyspace it is stored in, and the unique identifier in
      # the format of an Amazon Resource Name (ARN).
      struct TableSummary
        include JSON::Serializable

        # The name of the keyspace that the table is stored in.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The unique identifier of the table in the format of an Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name of the table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @keyspace_name : String,
          @resource_arn : String,
          @table_name : String
        )
        end
      end

      # Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single Amazon Keyspaces
      # resource. Amazon Web Services-assigned tag names and values are automatically assigned the aws:
      # prefix, which the user cannot assign. Amazon Web Services-assigned tag names do not count towards
      # the tag limit of 50. User-assigned tag names have the prefix user: in the Cost Allocation Report.
      # You cannot backdate the application of a tag. For more information, see Adding tags and labels to
      # Amazon Keyspaces resources in the Amazon Keyspaces Developer Guide .
      struct Tag
        include JSON::Serializable

        # The key of the tag. Tag keys are case sensitive. Each Amazon Keyspaces resource can only have up to
        # one tag with the same key. If you try to add an existing tag (same key), the existing tag value will
        # be updated to the new value.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the tag. Tag values are case-sensitive and can be null.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Keyspaces resource to which to add tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to be assigned to the Amazon Keyspaces resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The auto scaling policy that scales a table based on the ratio of consumed to provisioned capacity.
      struct TargetTrackingScalingPolicyConfiguration
        include JSON::Serializable

        # Specifies the target value for the target tracking auto scaling policy. Amazon Keyspaces auto
        # scaling scales up capacity automatically when traffic exceeds this target utilization rate, and then
        # back down when it falls below the target. This ensures that the ratio of consumed capacity to
        # provisioned capacity stays at or near this value. You define targetValue as a percentage. A double
        # between 20 and 90.
        @[JSON::Field(key: "targetValue")]
        getter target_value : Float64

        # Specifies if scale-in is enabled. When auto scaling automatically decreases capacity for a table,
        # the table scales in . When scaling policies are set, they can't scale in the table lower than its
        # minimum capacity.
        @[JSON::Field(key: "disableScaleIn")]
        getter disable_scale_in : Bool?

        # Specifies a scale-in cool down period. A cooldown period in seconds between scaling activities that
        # lets the table stabilize before another scaling activity starts.
        @[JSON::Field(key: "scaleInCooldown")]
        getter scale_in_cooldown : Int32?

        # Specifies a scale out cool down period. A cooldown period in seconds between scaling activities that
        # lets the table stabilize before another scaling activity starts.
        @[JSON::Field(key: "scaleOutCooldown")]
        getter scale_out_cooldown : Int32?

        def initialize(
          @target_value : Float64,
          @disable_scale_in : Bool? = nil,
          @scale_in_cooldown : Int32? = nil,
          @scale_out_cooldown : Int32? = nil
        )
        end
      end

      # Enable custom Time to Live (TTL) settings for rows and columns without setting a TTL default for the
      # specified table. For more information, see Enabling TTL on tables in the Amazon Keyspaces Developer
      # Guide .
      struct TimeToLive
        include JSON::Serializable

        # Shows how to enable custom Time to Live (TTL) settings for the specified table.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Keyspaces resource that the tags will be removed from. This value is an Amazon Resource
        # Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of existing tags to be removed from the Amazon Keyspaces resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateKeyspaceRequest
        include JSON::Serializable

        # The name of the keyspace.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        @[JSON::Field(key: "replicationSpecification")]
        getter replication_specification : Types::ReplicationSpecification

        @[JSON::Field(key: "clientSideTimestamps")]
        getter client_side_timestamps : Types::ClientSideTimestamps?

        def initialize(
          @keyspace_name : String,
          @replication_specification : Types::ReplicationSpecification,
          @client_side_timestamps : Types::ClientSideTimestamps? = nil
        )
        end
      end

      struct UpdateKeyspaceResponse
        include JSON::Serializable

        # The unique identifier of the keyspace in the format of an Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct UpdateTableRequest
        include JSON::Serializable

        # The name of the keyspace the specified table is stored in.
        @[JSON::Field(key: "keyspaceName")]
        getter keyspace_name : String

        # The name of the table.
        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # For each column to be added to the specified table: name - The name of the column. type - An Amazon
        # Keyspaces data type. For more information, see Data types in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "addColumns")]
        getter add_columns : Array(Types::ColumnDefinition)?

        # The optional auto scaling settings to update for a table in provisioned capacity mode. Specifies if
        # the service can manage throughput capacity of a provisioned table automatically on your behalf.
        # Amazon Keyspaces auto scaling helps you provision throughput capacity for variable workloads
        # efficiently by increasing and decreasing your table's read and write capacity automatically in
        # response to application traffic. If auto scaling is already enabled for the table, you can use
        # UpdateTable to update the minimum and maximum values or the auto scaling policy settings
        # independently. For more information, see Managing throughput capacity automatically with Amazon
        # Keyspaces auto scaling in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "autoScalingSpecification")]
        getter auto_scaling_specification : Types::AutoScalingSpecification?

        # Modifies the read/write throughput capacity mode for the table. The options are:
        # throughputMode:PAY_PER_REQUEST and throughputMode:PROVISIONED - Provisioned capacity mode requires
        # readCapacityUnits and writeCapacityUnits as input. The default is throughput_mode:PAY_PER_REQUEST .
        # For more information, see Read/write capacity modes in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "capacitySpecification")]
        getter capacity_specification : Types::CapacitySpecification?

        # The CDC stream settings of the table.
        @[JSON::Field(key: "cdcSpecification")]
        getter cdc_specification : Types::CdcSpecification?

        # Enables client-side timestamps for the table. By default, the setting is disabled. You can enable
        # client-side timestamps with the following option: status: "enabled" Once client-side timestamps are
        # enabled for a table, this setting cannot be disabled.
        @[JSON::Field(key: "clientSideTimestamps")]
        getter client_side_timestamps : Types::ClientSideTimestamps?

        # The default Time to Live setting in seconds for the table. For more information, see Setting the
        # default TTL value for a table in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "defaultTimeToLive")]
        getter default_time_to_live : Int32?

        # Modifies the encryption settings of the table. You can choose one of the following KMS key (KMS
        # key): type:AWS_OWNED_KMS_KEY - This key is owned by Amazon Keyspaces. type:CUSTOMER_MANAGED_KMS_KEY
        # - This key is stored in your account and is created, owned, and managed by you. This option requires
        # the kms_key_identifier of the KMS key in Amazon Resource Name (ARN) format as input. The default is
        # AWS_OWNED_KMS_KEY . For more information, see Encryption at rest in the Amazon Keyspaces Developer
        # Guide .
        @[JSON::Field(key: "encryptionSpecification")]
        getter encryption_specification : Types::EncryptionSpecification?

        # Modifies the pointInTimeRecovery settings of the table. The options are: status=ENABLED
        # status=DISABLED If it's not specified, the default is status=DISABLED . For more information, see
        # Point-in-time recovery in the Amazon Keyspaces Developer Guide .
        @[JSON::Field(key: "pointInTimeRecovery")]
        getter point_in_time_recovery : Types::PointInTimeRecovery?

        # The Region specific settings of a multi-Regional table.
        @[JSON::Field(key: "replicaSpecifications")]
        getter replica_specifications : Array(Types::ReplicaSpecification)?

        # Modifies Time to Live custom settings for the table. The options are: status:enabled status:disabled
        # The default is status:disabled . After ttl is enabled, you can't disable it for the table. For more
        # information, see Expiring data by using Amazon Keyspaces Time to Live (TTL) in the Amazon Keyspaces
        # Developer Guide .
        @[JSON::Field(key: "ttl")]
        getter ttl : Types::TimeToLive?

        def initialize(
          @keyspace_name : String,
          @table_name : String,
          @add_columns : Array(Types::ColumnDefinition)? = nil,
          @auto_scaling_specification : Types::AutoScalingSpecification? = nil,
          @capacity_specification : Types::CapacitySpecification? = nil,
          @cdc_specification : Types::CdcSpecification? = nil,
          @client_side_timestamps : Types::ClientSideTimestamps? = nil,
          @default_time_to_live : Int32? = nil,
          @encryption_specification : Types::EncryptionSpecification? = nil,
          @point_in_time_recovery : Types::PointInTimeRecovery? = nil,
          @replica_specifications : Array(Types::ReplicaSpecification)? = nil,
          @ttl : Types::TimeToLive? = nil
        )
        end
      end

      struct UpdateTableResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the modified table.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # The operation failed due to an invalid or malformed request.
      struct ValidationException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
