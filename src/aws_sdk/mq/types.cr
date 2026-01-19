require "json"
require "time"

module AwsSdk
  module Mq
    module Types

      # Action required for a broker.
      struct ActionRequired
        include JSON::Serializable

        # The code you can use to find instructions on the action required to resolve your broker issue.
        @[JSON::Field(key: "actionRequiredCode")]
        getter action_required_code : String?

        # Information about the action required to resolve your broker issue.
        @[JSON::Field(key: "actionRequiredInfo")]
        getter action_required_info : String?

        def initialize(
          @action_required_code : String? = nil,
          @action_required_info : String? = nil
        )
        end
      end

      # Name of the availability zone.
      struct AvailabilityZone
        include JSON::Serializable

        # Id for the availability zone.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Returns information about an error.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "errorAttribute")]
        getter error_attribute : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_attribute : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Types of broker engines.
      struct BrokerEngineType
        include JSON::Serializable

        # The broker's engine type.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        # The list of engine versions.
        @[JSON::Field(key: "engineVersions")]
        getter engine_versions : Array(Types::EngineVersion)?

        def initialize(
          @engine_type : String? = nil,
          @engine_versions : Array(Types::EngineVersion)? = nil
        )
        end
      end

      # Returns a list of broker engine type.
      struct BrokerEngineTypeOutput
        include JSON::Serializable

        # Required. The maximum number of engine types that can be returned per page (20 by default). This
        # value must be an integer from 5 to 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # List of available engine types and versions.
        @[JSON::Field(key: "brokerEngineTypes")]
        getter broker_engine_types : Array(Types::BrokerEngineType)?

        # The token that specifies the next page of results Amazon MQ should return. To request the first
        # page, leave nextToken empty.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @broker_engine_types : Array(Types::BrokerEngineType)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns information about all brokers.
      struct BrokerInstance
        include JSON::Serializable

        # The brokers web console URL.
        @[JSON::Field(key: "consoleURL")]
        getter console_url : String?

        # The broker's wire-level protocol endpoints.
        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(String)?

        # The IP address of the Elastic Network Interface (ENI) attached to the broker. Does not apply to
        # RabbitMQ brokers.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        def initialize(
          @console_url : String? = nil,
          @endpoints : Array(String)? = nil,
          @ip_address : String? = nil
        )
        end
      end

      # Option for host instance type.
      struct BrokerInstanceOption
        include JSON::Serializable

        # The list of available az.
        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZone)?

        # The broker's engine type.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        # The broker's instance type.
        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        # The broker's storage type.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # The list of supported deployment modes.
        @[JSON::Field(key: "supportedDeploymentModes")]
        getter supported_deployment_modes : Array(String)?

        # The list of supported engine versions.
        @[JSON::Field(key: "supportedEngineVersions")]
        getter supported_engine_versions : Array(String)?

        def initialize(
          @availability_zones : Array(Types::AvailabilityZone)? = nil,
          @engine_type : String? = nil,
          @host_instance_type : String? = nil,
          @storage_type : String? = nil,
          @supported_deployment_modes : Array(String)? = nil,
          @supported_engine_versions : Array(String)? = nil
        )
        end
      end

      # Returns a list of broker instance options.
      struct BrokerInstanceOptionsOutput
        include JSON::Serializable

        # Required. The maximum number of instance options that can be returned per page (20 by default). This
        # value must be an integer from 5 to 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # List of available broker instance options.
        @[JSON::Field(key: "brokerInstanceOptions")]
        getter broker_instance_options : Array(Types::BrokerInstanceOption)?

        # The token that specifies the next page of results Amazon MQ should return. To request the first
        # page, leave nextToken empty.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @broker_instance_options : Array(Types::BrokerInstanceOption)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns information about all brokers.
      struct BrokerSummary
        include JSON::Serializable

        # The broker's deployment mode.
        @[JSON::Field(key: "deploymentMode")]
        getter deployment_mode : String

        # The type of broker engine.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The broker's Amazon Resource Name (ARN).
        @[JSON::Field(key: "brokerArn")]
        getter broker_arn : String?

        # The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        # The broker's name. This value is unique in your Amazon Web Services account, 1-50 characters long,
        # and containing only letters, numbers, dashes, and underscores, and must not contain white spaces,
        # brackets, wildcard characters, or special characters.
        @[JSON::Field(key: "brokerName")]
        getter broker_name : String?

        # The broker's status.
        @[JSON::Field(key: "brokerState")]
        getter broker_state : String?

        # The time when the broker was created.
        @[JSON::Field(key: "created")]
        getter created : Time?

        # The broker's instance type.
        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        def initialize(
          @deployment_mode : String,
          @engine_type : String,
          @broker_arn : String? = nil,
          @broker_id : String? = nil,
          @broker_name : String? = nil,
          @broker_state : String? = nil,
          @created : Time? = nil,
          @host_instance_type : String? = nil
        )
        end
      end

      # Returns information about all configurations.
      struct Configuration
        include JSON::Serializable

        # Required. The ARN of the configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Optional. The authentication strategy associated with the configuration. The default is SIMPLE.
        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String

        # Required. The date and time of the configuration revision.
        @[JSON::Field(key: "created")]
        getter created : Time

        # Required. The description of the configuration.
        @[JSON::Field(key: "description")]
        getter description : String

        # Required. The type of broker engine. Currently, Amazon MQ supports ACTIVEMQ and RABBITMQ.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The broker engine version. Defaults to the latest available version for the specified broker engine
        # type. For a list of supported engine versions, see the ActiveMQ version management and the RabbitMQ
        # version management sections in the Amazon MQ Developer Guide.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String

        # Required. The unique ID that Amazon MQ generates for the configuration.
        @[JSON::Field(key: "id")]
        getter id : String

        # Required. The latest revision of the configuration.
        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision

        # Required. The name of the configuration. This value can contain only alphanumeric characters,
        # dashes, periods, underscores, and tildes (- . _ ~). This value must be 1-150 characters long.
        @[JSON::Field(key: "name")]
        getter name : String

        # The list of all tags associated with this configuration.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @authentication_strategy : String,
          @created : Time,
          @description : String,
          @engine_type : String,
          @engine_version : String,
          @id : String,
          @latest_revision : Types::ConfigurationRevision,
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A list of information about the configuration.
      struct ConfigurationId
        include JSON::Serializable

        # Required. The unique ID that Amazon MQ generates for the configuration.
        @[JSON::Field(key: "id")]
        getter id : String

        # The revision number of the configuration.
        @[JSON::Field(key: "revision")]
        getter revision : Int32?

        def initialize(
          @id : String,
          @revision : Int32? = nil
        )
        end
      end

      # Returns information about the specified configuration revision.
      struct ConfigurationRevision
        include JSON::Serializable

        # Required. The date and time of the configuration revision.
        @[JSON::Field(key: "created")]
        getter created : Time

        # Required. The revision number of the configuration.
        @[JSON::Field(key: "revision")]
        getter revision : Int32

        # The description of the configuration revision.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created : Time,
          @revision : Int32,
          @description : String? = nil
        )
        end
      end

      # Broker configuration information
      struct Configurations
        include JSON::Serializable

        # The broker's current configuration.
        @[JSON::Field(key: "current")]
        getter current : Types::ConfigurationId?

        # The history of configurations applied to the broker.
        @[JSON::Field(key: "history")]
        getter history : Array(Types::ConfigurationId)?

        # The broker's pending configuration.
        @[JSON::Field(key: "pending")]
        getter pending : Types::ConfigurationId?

        def initialize(
          @current : Types::ConfigurationId? = nil,
          @history : Array(Types::ConfigurationId)? = nil,
          @pending : Types::ConfigurationId? = nil
        )
        end
      end

      # Returns information about an error.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "errorAttribute")]
        getter error_attribute : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_attribute : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Creates a broker.
      struct CreateBrokerInput
        include JSON::Serializable

        # Required. The broker's name. This value must be unique in your Amazon Web Services account, 1-50
        # characters long, must contain only letters, numbers, dashes, and underscores, and must not contain
        # white spaces, brackets, wildcard characters, or special characters. Do not add personally
        # identifiable information (PII) or other confidential or sensitive information in broker names.
        # Broker names are accessible to other Amazon Web Services services, including CloudWatch Logs. Broker
        # names are not intended to be used for private or sensitive data.
        @[JSON::Field(key: "brokerName")]
        getter broker_name : String

        # Required. The broker's deployment mode.
        @[JSON::Field(key: "deploymentMode")]
        getter deployment_mode : String

        # Required. The type of broker engine. Currently, Amazon MQ supports ACTIVEMQ and RABBITMQ.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # Required. The broker's instance type.
        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String

        # Enables connections from applications outside of the VPC that hosts the broker's subnets. Set to
        # false by default, if no value is provided.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool

        # Optional. The authentication strategy used to secure the broker. The default is SIMPLE.
        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        # Enables automatic upgrades to new patch versions for brokers as new versions are released and
        # supported by Amazon MQ. Automatic upgrades occur during the scheduled maintenance window or after a
        # manual broker reboot. Set to true by default, if no value is specified. Must be set to true for
        # ActiveMQ brokers version 5.18 and above and for RabbitMQ brokers version 3.13 and above.
        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # A list of information about the configuration.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationId?

        # The unique ID that the requester receives for the created broker. Amazon MQ passes your ID with the
        # API action. We recommend using a Universally Unique Identifier (UUID) for the creatorRequestId. You
        # may omit the creatorRequestId if your application doesn't require idempotency.
        @[JSON::Field(key: "creatorRequestId")]
        getter creator_request_id : String?

        # Defines whether this broker is a part of a data replication pair.
        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        # The Amazon Resource Name (ARN) of the primary broker that is used to replicate data from in a data
        # replication pair, and is applied to the replica broker. Must be set when dataReplicationMode is set
        # to CRDR.
        @[JSON::Field(key: "dataReplicationPrimaryBrokerArn")]
        getter data_replication_primary_broker_arn : String?

        # Encryption options for the broker.
        @[JSON::Field(key: "encryptionOptions")]
        getter encryption_options : Types::EncryptionOptions?

        # The broker engine version. Defaults to the latest available version for the specified broker engine
        # type. For more information, see the ActiveMQ version management and the RabbitMQ version management
        # sections in the Amazon MQ Developer Guide.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # Optional. The metadata of the LDAP server used to authenticate and authorize connections to the
        # broker. Does not apply to RabbitMQ brokers.
        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataInput?

        # Enables Amazon CloudWatch logging for brokers.
        @[JSON::Field(key: "logs")]
        getter logs : Types::Logs?

        # The parameters that determine the WeeklyStartTime.
        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        # The list of rules (1 minimum, 125 maximum) that authorize connections to brokers.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The broker's storage type.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # The list of groups that define which subnets and IP ranges the broker can use from different
        # Availability Zones. If you specify more than one subnet, the subnets must be in different
        # Availability Zones. Amazon MQ will not be able to create VPC endpoints for your broker with multiple
        # subnets in the same Availability Zone. A SINGLE_INSTANCE deployment requires one subnet (for
        # example, the default subnet). An ACTIVE_STANDBY_MULTI_AZ Amazon MQ for ActiveMQ deployment requires
        # two subnets. A CLUSTER_MULTI_AZ Amazon MQ for RabbitMQ deployment has no subnet requirements when
        # deployed with public accessibility. Deployment without public accessibility requires at least one
        # subnet. If you specify subnets in a shared VPC for a RabbitMQ broker, the associated VPC to which
        # the specified subnets belong must be owned by your Amazon Web Services account. Amazon MQ will not
        # be able to create VPC endpoints in VPCs that are not owned by your Amazon Web Services account.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # Create tags when creating the broker.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The list of broker users (persons or applications) who can access queues and topics. For Amazon MQ
        # for RabbitMQ brokers, an administrative user is required if using simple authentication and
        # authorization. For brokers using OAuth2, this user is optional. When provided, one and only one
        # administrative user is accepted and created when a broker is first provisioned. All subsequent
        # broker users are created by making RabbitMQ API calls directly to brokers or via the RabbitMQ web
        # console.
        @[JSON::Field(key: "users")]
        getter users : Array(Types::User)?

        def initialize(
          @broker_name : String,
          @deployment_mode : String,
          @engine_type : String,
          @host_instance_type : String,
          @publicly_accessible : Bool,
          @authentication_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @configuration : Types::ConfigurationId? = nil,
          @creator_request_id : String? = nil,
          @data_replication_mode : String? = nil,
          @data_replication_primary_broker_arn : String? = nil,
          @encryption_options : Types::EncryptionOptions? = nil,
          @engine_version : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataInput? = nil,
          @logs : Types::Logs? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @security_groups : Array(String)? = nil,
          @storage_type : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # Returns information about the created broker.
      struct CreateBrokerOutput
        include JSON::Serializable

        # The broker's Amazon Resource Name (ARN).
        @[JSON::Field(key: "brokerArn")]
        getter broker_arn : String?

        # The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        def initialize(
          @broker_arn : String? = nil,
          @broker_id : String? = nil
        )
        end
      end

      struct CreateBrokerRequest
        include JSON::Serializable

        @[JSON::Field(key: "brokerName")]
        getter broker_name : String

        @[JSON::Field(key: "deploymentMode")]
        getter deployment_mode : String

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String

        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool

        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationId?

        @[JSON::Field(key: "creatorRequestId")]
        getter creator_request_id : String?

        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        @[JSON::Field(key: "dataReplicationPrimaryBrokerArn")]
        getter data_replication_primary_broker_arn : String?

        @[JSON::Field(key: "encryptionOptions")]
        getter encryption_options : Types::EncryptionOptions?

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataInput?

        @[JSON::Field(key: "logs")]
        getter logs : Types::Logs?

        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        @[JSON::Field(key: "users")]
        getter users : Array(Types::User)?

        def initialize(
          @broker_name : String,
          @deployment_mode : String,
          @engine_type : String,
          @host_instance_type : String,
          @publicly_accessible : Bool,
          @authentication_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @configuration : Types::ConfigurationId? = nil,
          @creator_request_id : String? = nil,
          @data_replication_mode : String? = nil,
          @data_replication_primary_broker_arn : String? = nil,
          @encryption_options : Types::EncryptionOptions? = nil,
          @engine_version : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataInput? = nil,
          @logs : Types::Logs? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @security_groups : Array(String)? = nil,
          @storage_type : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      struct CreateBrokerResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerArn")]
        getter broker_arn : String?

        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        def initialize(
          @broker_arn : String? = nil,
          @broker_id : String? = nil
        )
        end
      end

      # Creates a new configuration for the specified configuration name. Amazon MQ uses the default
      # configuration (the engine type and version).
      struct CreateConfigurationInput
        include JSON::Serializable

        # Required. The type of broker engine. Currently, Amazon MQ supports ACTIVEMQ and RABBITMQ.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # Required. The name of the configuration. This value can contain only alphanumeric characters,
        # dashes, periods, underscores, and tildes (- . _ ~). This value must be 1-150 characters long.
        @[JSON::Field(key: "name")]
        getter name : String

        # Optional. The authentication strategy associated with the configuration. The default is SIMPLE.
        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        # The broker engine version. Defaults to the latest available version for the specified broker engine
        # type. For more information, see the ActiveMQ version management and the RabbitMQ version management
        # sections in the Amazon MQ Developer Guide.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # Create tags when creating the configuration.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @engine_type : String,
          @name : String,
          @authentication_strategy : String? = nil,
          @engine_version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns information about the created configuration.
      struct CreateConfigurationOutput
        include JSON::Serializable

        # Required. The Amazon Resource Name (ARN) of the configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Optional. The authentication strategy associated with the configuration. The default is SIMPLE.
        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String

        # Required. The date and time of the configuration.
        @[JSON::Field(key: "created")]
        getter created : Time

        # Required. The unique ID that Amazon MQ generates for the configuration.
        @[JSON::Field(key: "id")]
        getter id : String

        # Required. The name of the configuration. This value can contain only alphanumeric characters,
        # dashes, periods, underscores, and tildes (- . _ ~). This value must be 1-150 characters long.
        @[JSON::Field(key: "name")]
        getter name : String

        # The latest revision of the configuration.
        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        def initialize(
          @arn : String,
          @authentication_strategy : String,
          @created : Time,
          @id : String,
          @name : String,
          @latest_revision : Types::ConfigurationRevision? = nil
        )
        end
      end

      struct CreateConfigurationRequest
        include JSON::Serializable

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        @[JSON::Field(key: "name")]
        getter name : String

        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @engine_type : String,
          @name : String,
          @authentication_strategy : String? = nil,
          @engine_version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateConfigurationResponse
        include JSON::Serializable

        @[JSON::Field(key: "arn")]
        getter arn : String?

        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        @[JSON::Field(key: "created")]
        getter created : Time?

        @[JSON::Field(key: "id")]
        getter id : String?

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @authentication_strategy : String? = nil,
          @created : Time? = nil,
          @id : String? = nil,
          @latest_revision : Types::ConfigurationRevision? = nil,
          @name : String? = nil
        )
        end
      end

      struct CreateTagsRequest
        include JSON::Serializable

        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Creates a new ActiveMQ user.
      struct CreateUserInput
        include JSON::Serializable

        # Required. The password of the user. This value must be at least 12 characters long, must contain at
        # least 4 unique characters, and must not contain commas, colons, or equal signs (,:=).
        @[JSON::Field(key: "password")]
        getter password : String

        # Enables access to the ActiveMQ Web Console for the ActiveMQ user.
        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        # The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only
        # alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be
        # 2-100 characters long.
        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        # Defines if this user is intended for CRDR replication purposes.
        @[JSON::Field(key: "replicationUser")]
        getter replication_user : Bool?

        def initialize(
          @password : String,
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil,
          @replication_user : Bool? = nil
        )
        end
      end

      struct CreateUserRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        @[JSON::Field(key: "password")]
        getter password : String

        @[JSON::Field(key: "username")]
        getter username : String

        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        @[JSON::Field(key: "replicationUser")]
        getter replication_user : Bool?

        def initialize(
          @broker_id : String,
          @password : String,
          @username : String,
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil,
          @replication_user : Bool? = nil
        )
        end
      end

      struct CreateUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a broker in a data replication pair.
      struct DataReplicationCounterpart
        include JSON::Serializable

        # Required. The unique broker id generated by Amazon MQ.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String

        # Required. The region of the broker.
        @[JSON::Field(key: "region")]
        getter region : String

        def initialize(
          @broker_id : String,
          @region : String
        )
        end
      end

      # The replication details of the data replication-enabled broker. Only returned if dataReplicationMode
      # or pendingDataReplicationMode is set to CRDR.
      struct DataReplicationMetadataOutput
        include JSON::Serializable

        # Defines the role of this broker in a data replication pair. When a replica broker is promoted to
        # primary, this role is interchanged.
        @[JSON::Field(key: "dataReplicationRole")]
        getter data_replication_role : String

        # Describes the replica/primary broker. Only returned if this broker is currently set as a primary or
        # replica in the broker's dataReplicationRole property.
        @[JSON::Field(key: "dataReplicationCounterpart")]
        getter data_replication_counterpart : Types::DataReplicationCounterpart?

        def initialize(
          @data_replication_role : String,
          @data_replication_counterpart : Types::DataReplicationCounterpart? = nil
        )
        end
      end

      # Returns information about the deleted broker.
      struct DeleteBrokerOutput
        include JSON::Serializable

        # The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        def initialize(
          @broker_id : String? = nil
        )
        end
      end

      struct DeleteBrokerRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        def initialize(
          @broker_id : String
        )
        end
      end

      struct DeleteBrokerResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        def initialize(
          @broker_id : String? = nil
        )
        end
      end

      # Returns information about the deleted configuration.
      struct DeleteConfigurationOutput
        include JSON::Serializable

        # The unique ID that Amazon MQ generates for the configuration.
        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        def initialize(
          @configuration_id : String? = nil
        )
        end
      end

      struct DeleteConfigurationRequest
        include JSON::Serializable

        @[JSON::Field(key: "configuration-id")]
        getter configuration_id : String

        def initialize(
          @configuration_id : String
        )
        end
      end

      struct DeleteConfigurationResponse
        include JSON::Serializable

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        def initialize(
          @configuration_id : String? = nil
        )
        end
      end

      struct DeleteTagsRequest
        include JSON::Serializable

        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct DeleteUserRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        @[JSON::Field(key: "username")]
        getter username : String

        def initialize(
          @broker_id : String,
          @username : String
        )
        end
      end

      struct DeleteUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeBrokerEngineTypesRequest
        include JSON::Serializable

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @engine_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeBrokerEngineTypesResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerEngineTypes")]
        getter broker_engine_types : Array(Types::BrokerEngineType)?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @broker_engine_types : Array(Types::BrokerEngineType)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeBrokerInstanceOptionsRequest
        include JSON::Serializable

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        def initialize(
          @engine_type : String? = nil,
          @host_instance_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @storage_type : String? = nil
        )
        end
      end

      struct DescribeBrokerInstanceOptionsResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerInstanceOptions")]
        getter broker_instance_options : Array(Types::BrokerInstanceOption)?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @broker_instance_options : Array(Types::BrokerInstanceOption)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns information about the specified broker.
      struct DescribeBrokerOutput
        include JSON::Serializable

        # Enables automatic upgrades to new patch versions for brokers as new versions are released and
        # supported by Amazon MQ. Automatic upgrades occur during the scheduled maintenance window or after a
        # manual broker reboot.
        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool

        # The broker's deployment mode.
        @[JSON::Field(key: "deploymentMode")]
        getter deployment_mode : String

        # The type of broker engine. Currently, Amazon MQ supports ACTIVEMQ and RABBITMQ.
        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # Enables connections from applications outside of the VPC that hosts the broker's subnets.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool

        # Actions required for a broker.
        @[JSON::Field(key: "actionsRequired")]
        getter actions_required : Array(Types::ActionRequired)?

        # The authentication strategy used to secure the broker. The default is SIMPLE.
        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        # The broker's Amazon Resource Name (ARN).
        @[JSON::Field(key: "brokerArn")]
        getter broker_arn : String?

        # The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        # A list of information about allocated brokers.
        @[JSON::Field(key: "brokerInstances")]
        getter broker_instances : Array(Types::BrokerInstance)?

        # The broker's name. This value must be unique in your Amazon Web Services account account, 1-50
        # characters long, must contain only letters, numbers, dashes, and underscores, and must not contain
        # white spaces, brackets, wildcard characters, or special characters.
        @[JSON::Field(key: "brokerName")]
        getter broker_name : String?

        # The broker's status.
        @[JSON::Field(key: "brokerState")]
        getter broker_state : String?

        # The list of all revisions for the specified configuration.
        @[JSON::Field(key: "configurations")]
        getter configurations : Types::Configurations?

        # The time when the broker was created.
        @[JSON::Field(key: "created")]
        getter created : Time?

        # The replication details of the data replication-enabled broker. Only returned if dataReplicationMode
        # is set to CRDR.
        @[JSON::Field(key: "dataReplicationMetadata")]
        getter data_replication_metadata : Types::DataReplicationMetadataOutput?

        # Describes whether this broker is a part of a data replication pair.
        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        # Encryption options for the broker.
        @[JSON::Field(key: "encryptionOptions")]
        getter encryption_options : Types::EncryptionOptions?

        # The broker engine version. For more information, see the ActiveMQ version management and the
        # RabbitMQ version management sections in the Amazon MQ Developer Guide.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The broker's instance type.
        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        # The metadata of the LDAP server used to authenticate and authorize connections to the broker.
        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataOutput?

        # The list of information about logs currently enabled and pending to be deployed for the specified
        # broker.
        @[JSON::Field(key: "logs")]
        getter logs : Types::LogsSummary?

        # The parameters that determine the WeeklyStartTime.
        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        # The authentication strategy that will be applied when the broker is rebooted. The default is SIMPLE.
        @[JSON::Field(key: "pendingAuthenticationStrategy")]
        getter pending_authentication_strategy : String?

        # The pending replication details of the data replication-enabled broker. Only returned if
        # pendingDataReplicationMode is set to CRDR.
        @[JSON::Field(key: "pendingDataReplicationMetadata")]
        getter pending_data_replication_metadata : Types::DataReplicationMetadataOutput?

        # Describes whether this broker will be a part of a data replication pair after reboot.
        @[JSON::Field(key: "pendingDataReplicationMode")]
        getter pending_data_replication_mode : String?

        # The broker engine version to upgrade to. For more information, see the ActiveMQ version management
        # and the RabbitMQ version management sections in the Amazon MQ Developer Guide.
        @[JSON::Field(key: "pendingEngineVersion")]
        getter pending_engine_version : String?

        # The broker's host instance type to upgrade to. For a list of supported instance types, see Broker
        # instance types .
        @[JSON::Field(key: "pendingHostInstanceType")]
        getter pending_host_instance_type : String?

        # The metadata of the LDAP server that will be used to authenticate and authorize connections to the
        # broker after it is rebooted.
        @[JSON::Field(key: "pendingLdapServerMetadata")]
        getter pending_ldap_server_metadata : Types::LdapServerMetadataOutput?

        # The list of pending security groups to authorize connections to brokers.
        @[JSON::Field(key: "pendingSecurityGroups")]
        getter pending_security_groups : Array(String)?

        # The list of rules (1 minimum, 125 maximum) that authorize connections to brokers.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The broker's storage type.
        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        # The list of groups that define which subnets and IP ranges the broker can use from different
        # Availability Zones.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The list of all tags associated with this broker.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The list of all broker usernames for the specified broker.
        @[JSON::Field(key: "users")]
        getter users : Array(Types::UserSummary)?

        def initialize(
          @auto_minor_version_upgrade : Bool,
          @deployment_mode : String,
          @engine_type : String,
          @publicly_accessible : Bool,
          @actions_required : Array(Types::ActionRequired)? = nil,
          @authentication_strategy : String? = nil,
          @broker_arn : String? = nil,
          @broker_id : String? = nil,
          @broker_instances : Array(Types::BrokerInstance)? = nil,
          @broker_name : String? = nil,
          @broker_state : String? = nil,
          @configurations : Types::Configurations? = nil,
          @created : Time? = nil,
          @data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @data_replication_mode : String? = nil,
          @encryption_options : Types::EncryptionOptions? = nil,
          @engine_version : String? = nil,
          @host_instance_type : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataOutput? = nil,
          @logs : Types::LogsSummary? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @pending_authentication_strategy : String? = nil,
          @pending_data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @pending_data_replication_mode : String? = nil,
          @pending_engine_version : String? = nil,
          @pending_host_instance_type : String? = nil,
          @pending_ldap_server_metadata : Types::LdapServerMetadataOutput? = nil,
          @pending_security_groups : Array(String)? = nil,
          @security_groups : Array(String)? = nil,
          @storage_type : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @users : Array(Types::UserSummary)? = nil
        )
        end
      end

      struct DescribeBrokerRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        def initialize(
          @broker_id : String
        )
        end
      end

      struct DescribeBrokerResponse
        include JSON::Serializable

        @[JSON::Field(key: "actionsRequired")]
        getter actions_required : Array(Types::ActionRequired)?

        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        @[JSON::Field(key: "brokerArn")]
        getter broker_arn : String?

        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        @[JSON::Field(key: "brokerInstances")]
        getter broker_instances : Array(Types::BrokerInstance)?

        @[JSON::Field(key: "brokerName")]
        getter broker_name : String?

        @[JSON::Field(key: "brokerState")]
        getter broker_state : String?

        @[JSON::Field(key: "configurations")]
        getter configurations : Types::Configurations?

        @[JSON::Field(key: "created")]
        getter created : Time?

        @[JSON::Field(key: "dataReplicationMetadata")]
        getter data_replication_metadata : Types::DataReplicationMetadataOutput?

        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        @[JSON::Field(key: "deploymentMode")]
        getter deployment_mode : String?

        @[JSON::Field(key: "encryptionOptions")]
        getter encryption_options : Types::EncryptionOptions?

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataOutput?

        @[JSON::Field(key: "logs")]
        getter logs : Types::LogsSummary?

        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        @[JSON::Field(key: "pendingAuthenticationStrategy")]
        getter pending_authentication_strategy : String?

        @[JSON::Field(key: "pendingDataReplicationMetadata")]
        getter pending_data_replication_metadata : Types::DataReplicationMetadataOutput?

        @[JSON::Field(key: "pendingDataReplicationMode")]
        getter pending_data_replication_mode : String?

        @[JSON::Field(key: "pendingEngineVersion")]
        getter pending_engine_version : String?

        @[JSON::Field(key: "pendingHostInstanceType")]
        getter pending_host_instance_type : String?

        @[JSON::Field(key: "pendingLdapServerMetadata")]
        getter pending_ldap_server_metadata : Types::LdapServerMetadataOutput?

        @[JSON::Field(key: "pendingSecurityGroups")]
        getter pending_security_groups : Array(String)?

        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        @[JSON::Field(key: "users")]
        getter users : Array(Types::UserSummary)?

        def initialize(
          @actions_required : Array(Types::ActionRequired)? = nil,
          @authentication_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @broker_arn : String? = nil,
          @broker_id : String? = nil,
          @broker_instances : Array(Types::BrokerInstance)? = nil,
          @broker_name : String? = nil,
          @broker_state : String? = nil,
          @configurations : Types::Configurations? = nil,
          @created : Time? = nil,
          @data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @data_replication_mode : String? = nil,
          @deployment_mode : String? = nil,
          @encryption_options : Types::EncryptionOptions? = nil,
          @engine_type : String? = nil,
          @engine_version : String? = nil,
          @host_instance_type : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataOutput? = nil,
          @logs : Types::LogsSummary? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @pending_authentication_strategy : String? = nil,
          @pending_data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @pending_data_replication_mode : String? = nil,
          @pending_engine_version : String? = nil,
          @pending_host_instance_type : String? = nil,
          @pending_ldap_server_metadata : Types::LdapServerMetadataOutput? = nil,
          @pending_security_groups : Array(String)? = nil,
          @publicly_accessible : Bool? = nil,
          @security_groups : Array(String)? = nil,
          @storage_type : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @users : Array(Types::UserSummary)? = nil
        )
        end
      end

      struct DescribeConfigurationRequest
        include JSON::Serializable

        @[JSON::Field(key: "configuration-id")]
        getter configuration_id : String

        def initialize(
          @configuration_id : String
        )
        end
      end

      struct DescribeConfigurationResponse
        include JSON::Serializable

        @[JSON::Field(key: "arn")]
        getter arn : String?

        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        @[JSON::Field(key: "created")]
        getter created : Time?

        @[JSON::Field(key: "description")]
        getter description : String?

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        @[JSON::Field(key: "id")]
        getter id : String?

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        @[JSON::Field(key: "name")]
        getter name : String?

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @authentication_strategy : String? = nil,
          @created : Time? = nil,
          @description : String? = nil,
          @engine_type : String? = nil,
          @engine_version : String? = nil,
          @id : String? = nil,
          @latest_revision : Types::ConfigurationRevision? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns the specified configuration revision for the specified configuration.
      struct DescribeConfigurationRevisionOutput
        include JSON::Serializable

        # Required. The unique ID that Amazon MQ generates for the configuration.
        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String

        # Required. The date and time of the configuration.
        @[JSON::Field(key: "created")]
        getter created : Time

        # Amazon MQ for ActiveMQ: the base64-encoded XML configuration. Amazon MQ for RabbitMQ: base64-encoded
        # Cuttlefish.
        @[JSON::Field(key: "data")]
        getter data : String

        # The description of the configuration.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @configuration_id : String,
          @created : Time,
          @data : String,
          @description : String? = nil
        )
        end
      end

      struct DescribeConfigurationRevisionRequest
        include JSON::Serializable

        @[JSON::Field(key: "configuration-id")]
        getter configuration_id : String

        @[JSON::Field(key: "configuration-revision")]
        getter configuration_revision : String

        def initialize(
          @configuration_id : String,
          @configuration_revision : String
        )
        end
      end

      struct DescribeConfigurationRevisionResponse
        include JSON::Serializable

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        @[JSON::Field(key: "created")]
        getter created : Time?

        @[JSON::Field(key: "data")]
        getter data : String?

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @configuration_id : String? = nil,
          @created : Time? = nil,
          @data : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Returns information about an ActiveMQ user.
      struct DescribeUserOutput
        include JSON::Serializable

        # Required. The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String

        # Required. The username of the ActiveMQ user. This value can contain only alphanumeric characters,
        # dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
        @[JSON::Field(key: "username")]
        getter username : String

        # Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        # The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only
        # alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be
        # 2-100 characters long.
        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        # The status of the changes pending for the ActiveMQ user.
        @[JSON::Field(key: "pending")]
        getter pending : Types::UserPendingChanges?

        # Describes whether the user is intended for data replication
        @[JSON::Field(key: "replicationUser")]
        getter replication_user : Bool?

        def initialize(
          @broker_id : String,
          @username : String,
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil,
          @pending : Types::UserPendingChanges? = nil,
          @replication_user : Bool? = nil
        )
        end
      end

      struct DescribeUserRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        @[JSON::Field(key: "username")]
        getter username : String

        def initialize(
          @broker_id : String,
          @username : String
        )
        end
      end

      struct DescribeUserResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        @[JSON::Field(key: "pending")]
        getter pending : Types::UserPendingChanges?

        @[JSON::Field(key: "replicationUser")]
        getter replication_user : Bool?

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @broker_id : String? = nil,
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil,
          @pending : Types::UserPendingChanges? = nil,
          @replication_user : Bool? = nil,
          @username : String? = nil
        )
        end
      end

      # Encryption options for the broker.
      struct EncryptionOptions
        include JSON::Serializable

        # Enables the use of an Amazon Web Services owned CMK using KMS (KMS). Set to true by default, if no
        # value is provided, for example, for RabbitMQ brokers.
        @[JSON::Field(key: "useAwsOwnedKey")]
        getter use_aws_owned_key : Bool

        # The customer master key (CMK) to use for the A KMS (KMS). This key is used to encrypt your data at
        # rest. If not provided, Amazon MQ will use a default CMK to encrypt your data.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @use_aws_owned_key : Bool,
          @kms_key_id : String? = nil
        )
        end
      end

      # Id of the engine version.
      struct EngineVersion
        include JSON::Serializable

        # Id for the version.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Returns information about an error.
      struct Error
        include JSON::Serializable

        # The attribute which caused the error.
        @[JSON::Field(key: "errorAttribute")]
        getter error_attribute : String?

        # The explanation of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_attribute : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Returns information about an error.
      struct ForbiddenException
        include JSON::Serializable

        @[JSON::Field(key: "errorAttribute")]
        getter error_attribute : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_attribute : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Returns information about an error.
      struct InternalServerErrorException
        include JSON::Serializable

        @[JSON::Field(key: "errorAttribute")]
        getter error_attribute : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_attribute : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Optional. The metadata of the LDAP server used to authenticate and authorize connections to the
      # broker. Does not apply to RabbitMQ brokers.
      struct LdapServerMetadataInput
        include JSON::Serializable

        # Specifies the location of the LDAP server such as Directory Service for Microsoft Active Directory.
        # Optional failover server.
        @[JSON::Field(key: "hosts")]
        getter hosts : Array(String)

        # The distinguished name of the node in the directory information tree (DIT) to search for roles or
        # groups. For example, ou=group, ou=corp, dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "roleBase")]
        getter role_base : String

        # The LDAP search filter used to find roles within the roleBase. The distinguished name of the user
        # matched by userSearchMatching is substituted into the {0} placeholder in the search filter. The
        # client's username is substituted into the {1} placeholder. For example, if you set this option to
        # (member=uid={1})for the user janedoe, the search filter becomes (member=uid=janedoe) after string
        # substitution. It matches all role entries that have a member attribute equal to uid=janedoe under
        # the subtree selected by the roleBase.
        @[JSON::Field(key: "roleSearchMatching")]
        getter role_search_matching : String

        # Service account password. A service account is an account in your LDAP server that has access to
        # initiate a connection. For example, cn=admin,dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "serviceAccountPassword")]
        getter service_account_password : String

        # Service account username. A service account is an account in your LDAP server that has access to
        # initiate a connection. For example, cn=admin,dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "serviceAccountUsername")]
        getter service_account_username : String

        # Select a particular subtree of the directory information tree (DIT) to search for user entries. The
        # subtree is specified by a DN, which specifies the base node of the subtree. For example, by setting
        # this option to ou=Users,ou=corp, dc=corp, dc=example, dc=com, the search for user entries is
        # restricted to the subtree beneath ou=Users, ou=corp, dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "userBase")]
        getter user_base : String

        # The LDAP search filter used to find users within the userBase. The client's username is substituted
        # into the {0} placeholder in the search filter. For example, if this option is set to (uid={0}) and
        # the received username is janedoe, the search filter becomes (uid=janedoe) after string substitution.
        # It will result in matching an entry like uid=janedoe, ou=Users,ou=corp, dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "userSearchMatching")]
        getter user_search_matching : String

        # Specifies the LDAP attribute that identifies the group name attribute in the object returned from
        # the group membership query.
        @[JSON::Field(key: "roleName")]
        getter role_name : String?

        # The directory search scope for the role. If set to true, scope is to search the entire subtree.
        @[JSON::Field(key: "roleSearchSubtree")]
        getter role_search_subtree : Bool?

        # Specifies the name of the LDAP attribute for the user group membership.
        @[JSON::Field(key: "userRoleName")]
        getter user_role_name : String?

        # The directory search scope for the user. If set to true, scope is to search the entire subtree.
        @[JSON::Field(key: "userSearchSubtree")]
        getter user_search_subtree : Bool?

        def initialize(
          @hosts : Array(String),
          @role_base : String,
          @role_search_matching : String,
          @service_account_password : String,
          @service_account_username : String,
          @user_base : String,
          @user_search_matching : String,
          @role_name : String? = nil,
          @role_search_subtree : Bool? = nil,
          @user_role_name : String? = nil,
          @user_search_subtree : Bool? = nil
        )
        end
      end

      # Optional. The metadata of the LDAP server used to authenticate and authorize connections to the
      # broker.
      struct LdapServerMetadataOutput
        include JSON::Serializable

        # Specifies the location of the LDAP server such as Directory Service for Microsoft Active Directory.
        # Optional failover server.
        @[JSON::Field(key: "hosts")]
        getter hosts : Array(String)

        # The distinguished name of the node in the directory information tree (DIT) to search for roles or
        # groups. For example, ou=group, ou=corp, dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "roleBase")]
        getter role_base : String

        # The LDAP search filter used to find roles within the roleBase. The distinguished name of the user
        # matched by userSearchMatching is substituted into the {0} placeholder in the search filter. The
        # client's username is substituted into the {1} placeholder. For example, if you set this option to
        # (member=uid={1})for the user janedoe, the search filter becomes (member=uid=janedoe) after string
        # substitution. It matches all role entries that have a member attribute equal to uid=janedoe under
        # the subtree selected by the roleBase.
        @[JSON::Field(key: "roleSearchMatching")]
        getter role_search_matching : String

        # Service account username. A service account is an account in your LDAP server that has access to
        # initiate a connection. For example, cn=admin,dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "serviceAccountUsername")]
        getter service_account_username : String

        # Select a particular subtree of the directory information tree (DIT) to search for user entries. The
        # subtree is specified by a DN, which specifies the base node of the subtree. For example, by setting
        # this option to ou=Users,ou=corp, dc=corp, dc=example, dc=com, the search for user entries is
        # restricted to the subtree beneath ou=Users, ou=corp, dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "userBase")]
        getter user_base : String

        # The LDAP search filter used to find users within the userBase. The client's username is substituted
        # into the {0} placeholder in the search filter. For example, if this option is set to (uid={0}) and
        # the received username is janedoe, the search filter becomes (uid=janedoe) after string substitution.
        # It will result in matching an entry like uid=janedoe, ou=Users,ou=corp, dc=corp, dc=example, dc=com.
        @[JSON::Field(key: "userSearchMatching")]
        getter user_search_matching : String

        # Specifies the LDAP attribute that identifies the group name attribute in the object returned from
        # the group membership query.
        @[JSON::Field(key: "roleName")]
        getter role_name : String?

        # The directory search scope for the role. If set to true, scope is to search the entire subtree.
        @[JSON::Field(key: "roleSearchSubtree")]
        getter role_search_subtree : Bool?

        # Specifies the name of the LDAP attribute for the user group membership.
        @[JSON::Field(key: "userRoleName")]
        getter user_role_name : String?

        # The directory search scope for the user. If set to true, scope is to search the entire subtree.
        @[JSON::Field(key: "userSearchSubtree")]
        getter user_search_subtree : Bool?

        def initialize(
          @hosts : Array(String),
          @role_base : String,
          @role_search_matching : String,
          @service_account_username : String,
          @user_base : String,
          @user_search_matching : String,
          @role_name : String? = nil,
          @role_search_subtree : Bool? = nil,
          @user_role_name : String? = nil,
          @user_search_subtree : Bool? = nil
        )
        end
      end

      # A list of information about all brokers.
      struct ListBrokersOutput
        include JSON::Serializable

        # A list of information about all brokers.
        @[JSON::Field(key: "brokerSummaries")]
        getter broker_summaries : Array(Types::BrokerSummary)?

        # The token that specifies the next page of results Amazon MQ should return. To request the first
        # page, leave nextToken empty.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @broker_summaries : Array(Types::BrokerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBrokersRequest
        include JSON::Serializable

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBrokersResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerSummaries")]
        getter broker_summaries : Array(Types::BrokerSummary)?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @broker_summaries : Array(Types::BrokerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns a list of all revisions for the specified configuration.
      struct ListConfigurationRevisionsOutput
        include JSON::Serializable

        # The unique ID that Amazon MQ generates for the configuration.
        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        # The maximum number of configuration revisions that can be returned per page (20 by default). This
        # value must be an integer from 5 to 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that specifies the next page of results Amazon MQ should return. To request the first
        # page, leave nextToken empty.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of all revisions for the specified configuration.
        @[JSON::Field(key: "revisions")]
        getter revisions : Array(Types::ConfigurationRevision)?

        def initialize(
          @configuration_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @revisions : Array(Types::ConfigurationRevision)? = nil
        )
        end
      end

      struct ListConfigurationRevisionsRequest
        include JSON::Serializable

        @[JSON::Field(key: "configuration-id")]
        getter configuration_id : String

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configuration_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConfigurationRevisionsResponse
        include JSON::Serializable

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "revisions")]
        getter revisions : Array(Types::ConfigurationRevision)?

        def initialize(
          @configuration_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @revisions : Array(Types::ConfigurationRevision)? = nil
        )
        end
      end

      # Returns a list of all configurations.
      struct ListConfigurationsOutput
        include JSON::Serializable

        # The list of all revisions for the specified configuration.
        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::Configuration)?

        # The maximum number of configurations that Amazon MQ can return per page (20 by default). This value
        # must be an integer from 5 to 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that specifies the next page of results Amazon MQ should return. To request the first
        # page, leave nextToken empty.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configurations : Array(Types::Configuration)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConfigurationsRequest
        include JSON::Serializable

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConfigurationsResponse
        include JSON::Serializable

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::Configuration)?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configurations : Array(Types::Configuration)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsRequest
        include JSON::Serializable

        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsResponse
        include JSON::Serializable

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns a list of all ActiveMQ users.
      struct ListUsersOutput
        include JSON::Serializable

        # Required. The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String

        # Required. The maximum number of ActiveMQ users that can be returned per page (20 by default). This
        # value must be an integer from 5 to 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # Required. The list of all ActiveMQ usernames for the specified broker. Does not apply to RabbitMQ
        # brokers.
        @[JSON::Field(key: "users")]
        getter users : Array(Types::UserSummary)

        # The token that specifies the next page of results Amazon MQ should return. To request the first
        # page, leave nextToken empty.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @broker_id : String,
          @max_results : Int32,
          @users : Array(Types::UserSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListUsersRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @broker_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListUsersResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "users")]
        getter users : Array(Types::UserSummary)?

        def initialize(
          @broker_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @users : Array(Types::UserSummary)? = nil
        )
        end
      end

      # The list of information about logs to be enabled for the specified broker.
      struct Logs
        include JSON::Serializable

        # Enables audit logging. Every user management action made using JMX or the ActiveMQ Web Console is
        # logged. Does not apply to RabbitMQ brokers.
        @[JSON::Field(key: "audit")]
        getter audit : Bool?

        # Enables general logging.
        @[JSON::Field(key: "general")]
        getter general : Bool?

        def initialize(
          @audit : Bool? = nil,
          @general : Bool? = nil
        )
        end
      end

      # The list of information about logs currently enabled and pending to be deployed for the specified
      # broker.
      struct LogsSummary
        include JSON::Serializable

        # Enables general logging.
        @[JSON::Field(key: "general")]
        getter general : Bool

        # The location of the CloudWatch Logs log group where general logs are sent.
        @[JSON::Field(key: "generalLogGroup")]
        getter general_log_group : String

        # Enables audit logging. Every user management action made using JMX or the ActiveMQ Web Console is
        # logged.
        @[JSON::Field(key: "audit")]
        getter audit : Bool?

        # The location of the CloudWatch Logs log group where audit logs are sent.
        @[JSON::Field(key: "auditLogGroup")]
        getter audit_log_group : String?

        # The list of information about logs pending to be deployed for the specified broker.
        @[JSON::Field(key: "pending")]
        getter pending : Types::PendingLogs?

        def initialize(
          @general : Bool,
          @general_log_group : String,
          @audit : Bool? = nil,
          @audit_log_group : String? = nil,
          @pending : Types::PendingLogs? = nil
        )
        end
      end

      # Returns information about an error.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "errorAttribute")]
        getter error_attribute : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_attribute : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The list of information about logs to be enabled for the specified broker.
      struct PendingLogs
        include JSON::Serializable

        # Enables audit logging. Every user management action made using JMX or the ActiveMQ Web Console is
        # logged.
        @[JSON::Field(key: "audit")]
        getter audit : Bool?

        # Enables general logging.
        @[JSON::Field(key: "general")]
        getter general : Bool?

        def initialize(
          @audit : Bool? = nil,
          @general : Bool? = nil
        )
        end
      end

      # Creates a Promote request with the properties specified.
      struct PromoteInput
        include JSON::Serializable

        # The Promote mode requested. Note: Valid values for the parameter are SWITCHOVER, FAILOVER.
        @[JSON::Field(key: "mode")]
        getter mode : String

        def initialize(
          @mode : String
        )
        end
      end

      # Returns information about the updated broker.
      struct PromoteOutput
        include JSON::Serializable

        # The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        def initialize(
          @broker_id : String? = nil
        )
        end
      end

      struct PromoteRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        @[JSON::Field(key: "mode")]
        getter mode : String

        def initialize(
          @broker_id : String,
          @mode : String
        )
        end
      end

      struct PromoteResponse
        include JSON::Serializable

        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        def initialize(
          @broker_id : String? = nil
        )
        end
      end

      struct RebootBrokerRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        def initialize(
          @broker_id : String
        )
        end
      end

      struct RebootBrokerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about the configuration element or attribute that was sanitized in the
      # configuration.
      struct SanitizationWarning
        include JSON::Serializable

        # The reason for which the configuration elements or attributes were sanitized.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The name of the configuration attribute that has been sanitized.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?

        # The name of the configuration element that has been sanitized.
        @[JSON::Field(key: "elementName")]
        getter element_name : String?

        def initialize(
          @reason : String,
          @attribute_name : String? = nil,
          @element_name : String? = nil
        )
        end
      end

      # A map of the key-value pairs for the resource tag.
      struct Tags
        include JSON::Serializable

        # The key-value pair for the resource tag.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns information about an error.
      struct UnauthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "errorAttribute")]
        getter error_attribute : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_attribute : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Updates the broker using the specified properties.
      struct UpdateBrokerInput
        include JSON::Serializable

        # Optional. The authentication strategy used to secure the broker. The default is SIMPLE.
        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        # Enables automatic upgrades to new patch versions for brokers as new versions are released and
        # supported by Amazon MQ. Automatic upgrades occur during the scheduled maintenance window or after a
        # manual broker reboot. Must be set to true for ActiveMQ brokers version 5.18 and above and for
        # RabbitMQ brokers version 3.13 and above.
        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # A list of information about the configuration.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationId?

        # Defines whether this broker is a part of a data replication pair.
        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        # The broker engine version. For more information, see the ActiveMQ version management and the
        # RabbitMQ version management sections in the Amazon MQ Developer Guide. When upgrading to ActiveMQ
        # version 5.18 and above or RabbitMQ version 3.13 and above, you must have autoMinorVersionUpgrade set
        # to true for the broker.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The broker's host instance type to upgrade to. For a list of supported instance types, see Broker
        # instance types .
        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        # Optional. The metadata of the LDAP server used to authenticate and authorize connections to the
        # broker. Does not apply to RabbitMQ brokers.
        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataInput?

        # Enables Amazon CloudWatch logging for brokers.
        @[JSON::Field(key: "logs")]
        getter logs : Types::Logs?

        # The parameters that determine the WeeklyStartTime.
        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        # The list of security groups (1 minimum, 5 maximum) that authorizes connections to brokers.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @authentication_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @configuration : Types::ConfigurationId? = nil,
          @data_replication_mode : String? = nil,
          @engine_version : String? = nil,
          @host_instance_type : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataInput? = nil,
          @logs : Types::Logs? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end

      # Returns information about the updated broker.
      struct UpdateBrokerOutput
        include JSON::Serializable

        # Required. The unique ID that Amazon MQ generates for the broker.
        @[JSON::Field(key: "brokerId")]
        getter broker_id : String

        # Optional. The authentication strategy used to secure the broker. The default is SIMPLE.
        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        # Enables automatic upgrades to new patch versions for brokers as new versions are released and
        # supported by Amazon MQ. Automatic upgrades occur during the scheduled maintenance window or after a
        # manual broker reboot.
        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The ID of the updated configuration.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationId?

        # The replication details of the data replication-enabled broker. Only returned if dataReplicationMode
        # is set to CRDR.
        @[JSON::Field(key: "dataReplicationMetadata")]
        getter data_replication_metadata : Types::DataReplicationMetadataOutput?

        # Describes whether this broker is a part of a data replication pair.
        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        # The broker engine version to upgrade to. For more information, see the ActiveMQ version management
        # and the RabbitMQ version management sections in the Amazon MQ Developer Guide.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The broker's host instance type to upgrade to. For a list of supported instance types, see Broker
        # instance types .
        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        # Optional. The metadata of the LDAP server used to authenticate and authorize connections to the
        # broker. Does not apply to RabbitMQ brokers.
        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataOutput?

        # The list of information about logs to be enabled for the specified broker.
        @[JSON::Field(key: "logs")]
        getter logs : Types::Logs?

        # The parameters that determine the WeeklyStartTime.
        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        # The pending replication details of the data replication-enabled broker. Only returned if
        # pendingDataReplicationMode is set to CRDR.
        @[JSON::Field(key: "pendingDataReplicationMetadata")]
        getter pending_data_replication_metadata : Types::DataReplicationMetadataOutput?

        # Describes whether this broker will be a part of a data replication pair after reboot.
        @[JSON::Field(key: "pendingDataReplicationMode")]
        getter pending_data_replication_mode : String?

        # The list of security groups (1 minimum, 5 maximum) that authorizes connections to brokers.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @broker_id : String,
          @authentication_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @configuration : Types::ConfigurationId? = nil,
          @data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @data_replication_mode : String? = nil,
          @engine_version : String? = nil,
          @host_instance_type : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataOutput? = nil,
          @logs : Types::Logs? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @pending_data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @pending_data_replication_mode : String? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end

      struct UpdateBrokerRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationId?

        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataInput?

        @[JSON::Field(key: "logs")]
        getter logs : Types::Logs?

        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @broker_id : String,
          @authentication_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @configuration : Types::ConfigurationId? = nil,
          @data_replication_mode : String? = nil,
          @engine_version : String? = nil,
          @host_instance_type : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataInput? = nil,
          @logs : Types::Logs? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end

      struct UpdateBrokerResponse
        include JSON::Serializable

        @[JSON::Field(key: "authenticationStrategy")]
        getter authentication_strategy : String?

        @[JSON::Field(key: "autoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        @[JSON::Field(key: "brokerId")]
        getter broker_id : String?

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ConfigurationId?

        @[JSON::Field(key: "dataReplicationMetadata")]
        getter data_replication_metadata : Types::DataReplicationMetadataOutput?

        @[JSON::Field(key: "dataReplicationMode")]
        getter data_replication_mode : String?

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        @[JSON::Field(key: "hostInstanceType")]
        getter host_instance_type : String?

        @[JSON::Field(key: "ldapServerMetadata")]
        getter ldap_server_metadata : Types::LdapServerMetadataOutput?

        @[JSON::Field(key: "logs")]
        getter logs : Types::Logs?

        @[JSON::Field(key: "maintenanceWindowStartTime")]
        getter maintenance_window_start_time : Types::WeeklyStartTime?

        @[JSON::Field(key: "pendingDataReplicationMetadata")]
        getter pending_data_replication_metadata : Types::DataReplicationMetadataOutput?

        @[JSON::Field(key: "pendingDataReplicationMode")]
        getter pending_data_replication_mode : String?

        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @authentication_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @broker_id : String? = nil,
          @configuration : Types::ConfigurationId? = nil,
          @data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @data_replication_mode : String? = nil,
          @engine_version : String? = nil,
          @host_instance_type : String? = nil,
          @ldap_server_metadata : Types::LdapServerMetadataOutput? = nil,
          @logs : Types::Logs? = nil,
          @maintenance_window_start_time : Types::WeeklyStartTime? = nil,
          @pending_data_replication_metadata : Types::DataReplicationMetadataOutput? = nil,
          @pending_data_replication_mode : String? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end

      # Updates the specified configuration.
      struct UpdateConfigurationInput
        include JSON::Serializable

        # Amazon MQ for Active MQ: The base64-encoded XML configuration. Amazon MQ for RabbitMQ: the
        # base64-encoded Cuttlefish configuration.
        @[JSON::Field(key: "data")]
        getter data : String

        # The description of the configuration.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @data : String,
          @description : String? = nil
        )
        end
      end

      # Returns information about the updated configuration.
      struct UpdateConfigurationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Required. The date and time of the configuration.
        @[JSON::Field(key: "created")]
        getter created : Time

        # The unique ID that Amazon MQ generates for the configuration.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the configuration. This value can contain only alphanumeric characters, dashes, periods,
        # underscores, and tildes (- . _ ~). This value must be 1-150 characters long.
        @[JSON::Field(key: "name")]
        getter name : String

        # The latest revision of the configuration.
        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        # The list of the first 20 warnings about the configuration elements or attributes that were
        # sanitized.
        @[JSON::Field(key: "warnings")]
        getter warnings : Array(Types::SanitizationWarning)?

        def initialize(
          @arn : String,
          @created : Time,
          @id : String,
          @name : String,
          @latest_revision : Types::ConfigurationRevision? = nil,
          @warnings : Array(Types::SanitizationWarning)? = nil
        )
        end
      end

      struct UpdateConfigurationRequest
        include JSON::Serializable

        @[JSON::Field(key: "configuration-id")]
        getter configuration_id : String

        @[JSON::Field(key: "data")]
        getter data : String

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @configuration_id : String,
          @data : String,
          @description : String? = nil
        )
        end
      end

      struct UpdateConfigurationResponse
        include JSON::Serializable

        @[JSON::Field(key: "arn")]
        getter arn : String?

        @[JSON::Field(key: "created")]
        getter created : Time?

        @[JSON::Field(key: "id")]
        getter id : String?

        @[JSON::Field(key: "latestRevision")]
        getter latest_revision : Types::ConfigurationRevision?

        @[JSON::Field(key: "name")]
        getter name : String?

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(Types::SanitizationWarning)?

        def initialize(
          @arn : String? = nil,
          @created : Time? = nil,
          @id : String? = nil,
          @latest_revision : Types::ConfigurationRevision? = nil,
          @name : String? = nil,
          @warnings : Array(Types::SanitizationWarning)? = nil
        )
        end
      end

      # Updates the information for an ActiveMQ user.
      struct UpdateUserInput
        include JSON::Serializable

        # Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        # The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only
        # alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be
        # 2-100 characters long.
        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        # The password of the user. This value must be at least 12 characters long, must contain at least 4
        # unique characters, and must not contain commas, colons, or equal signs (,:=).
        @[JSON::Field(key: "password")]
        getter password : String?

        # Defines whether the user is intended for data replication.
        @[JSON::Field(key: "replicationUser")]
        getter replication_user : Bool?

        def initialize(
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil,
          @password : String? = nil,
          @replication_user : Bool? = nil
        )
        end
      end

      struct UpdateUserRequest
        include JSON::Serializable

        @[JSON::Field(key: "broker-id")]
        getter broker_id : String

        @[JSON::Field(key: "username")]
        getter username : String

        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        @[JSON::Field(key: "password")]
        getter password : String?

        @[JSON::Field(key: "replicationUser")]
        getter replication_user : Bool?

        def initialize(
          @broker_id : String,
          @username : String,
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil,
          @password : String? = nil,
          @replication_user : Bool? = nil
        )
        end
      end

      struct UpdateUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A user associated with the broker. For Amazon MQ for RabbitMQ brokers, one and only one
      # administrative user is accepted and created when a broker is first provisioned. All subsequent
      # broker users are created by making RabbitMQ API calls directly to brokers or via the RabbitMQ web
      # console.
      struct User
        include JSON::Serializable

        # Required. The password of the user. This value must be at least 12 characters long, must contain at
        # least 4 unique characters, and must not contain commas, colons, or equal signs (,:=).
        @[JSON::Field(key: "password")]
        getter password : String

        # The username of the broker user. The following restrictions apply to broker usernames: For Amazon MQ
        # for ActiveMQ brokers, this value can contain only alphanumeric characters, dashes, periods,
        # underscores, and tildes (- . _ ~). This value must be 2-100 characters long. para>For Amazon MQ for
        # RabbitMQ brokers, this value can contain only alphanumeric characters, dashes, periods, underscores
        # (- . _). This value must not contain a tilde (~) character. Amazon MQ prohibts using guest as a
        # valid usename. This value must be 2-100 characters long. Do not add personally identifiable
        # information (PII) or other confidential or sensitive information in broker usernames. Broker
        # usernames are accessible to other Amazon Web Services services, including CloudWatch Logs. Broker
        # usernames are not intended to be used for private or sensitive data.
        @[JSON::Field(key: "username")]
        getter username : String

        # Enables access to the ActiveMQ Web Console for the ActiveMQ user. Does not apply to RabbitMQ
        # brokers.
        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        # The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only
        # alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be
        # 2-100 characters long. Does not apply to RabbitMQ brokers.
        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        # Defines if this user is intended for CRDR replication purposes.
        @[JSON::Field(key: "replicationUser")]
        getter replication_user : Bool?

        def initialize(
          @password : String,
          @username : String,
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil,
          @replication_user : Bool? = nil
        )
        end
      end

      # Returns information about the status of the changes pending for the ActiveMQ user.
      struct UserPendingChanges
        include JSON::Serializable

        # Required. The type of change pending for the ActiveMQ user.
        @[JSON::Field(key: "pendingChange")]
        getter pending_change : String

        # Enables access to the the ActiveMQ Web Console for the ActiveMQ user.
        @[JSON::Field(key: "consoleAccess")]
        getter console_access : Bool?

        # The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only
        # alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be
        # 2-100 characters long.
        @[JSON::Field(key: "groups")]
        getter groups : Array(String)?

        def initialize(
          @pending_change : String,
          @console_access : Bool? = nil,
          @groups : Array(String)? = nil
        )
        end
      end

      # Returns a list of all broker users. Does not apply to RabbitMQ brokers.
      struct UserSummary
        include JSON::Serializable

        # Required. The username of the broker user. This value can contain only alphanumeric characters,
        # dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.
        @[JSON::Field(key: "username")]
        getter username : String

        # The type of change pending for the broker user.
        @[JSON::Field(key: "pendingChange")]
        getter pending_change : String?

        def initialize(
          @username : String,
          @pending_change : String? = nil
        )
        end
      end

      # The scheduled time period relative to UTC during which Amazon MQ begins to apply pending updates or
      # patches to the broker.
      struct WeeklyStartTime
        include JSON::Serializable

        # Required. The day of the week.
        @[JSON::Field(key: "dayOfWeek")]
        getter day_of_week : String

        # Required. The time, in 24-hour format.
        @[JSON::Field(key: "timeOfDay")]
        getter time_of_day : String

        # The time zone, UTC by default, in either the Country/City format, or the UTC offset format.
        @[JSON::Field(key: "timeZone")]
        getter time_zone : String?

        def initialize(
          @day_of_week : String,
          @time_of_day : String,
          @time_zone : String? = nil
        )
        end
      end
    end
  end
end
