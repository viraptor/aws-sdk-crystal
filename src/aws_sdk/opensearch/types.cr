require "json"
require "time"

module AwsSdk
  module OpenSearch
    module Types

      # Container for parameters required to enable all machine learning features.

      struct AIMLOptionsInput
        include JSON::Serializable

        # Container for parameters required for natural language query generation on the specified domain.

        @[JSON::Field(key: "NaturalLanguageQueryGenerationOptions")]
        getter natural_language_query_generation_options : Types::NaturalLanguageQueryGenerationOptionsInput?

        # Container for parameters required to enable S3 vectors engine features on the specified domain.

        @[JSON::Field(key: "S3VectorsEngine")]
        getter s3_vectors_engine : Types::S3VectorsEngine?

        # Specifies whether to enable serverless vector acceleration for the domain. When enabled, provides
        # GPU-accelerated vector search capabilities for improved performance on vector workloads.

        @[JSON::Field(key: "ServerlessVectorAcceleration")]
        getter serverless_vector_acceleration : Types::ServerlessVectorAcceleration?

        def initialize(
          @natural_language_query_generation_options : Types::NaturalLanguageQueryGenerationOptionsInput? = nil,
          @s3_vectors_engine : Types::S3VectorsEngine? = nil,
          @serverless_vector_acceleration : Types::ServerlessVectorAcceleration? = nil
        )
        end
      end

      # Container for parameters representing the state of machine learning features on the specified
      # domain.

      struct AIMLOptionsOutput
        include JSON::Serializable

        # Container for parameters required for natural language query generation on the specified domain.

        @[JSON::Field(key: "NaturalLanguageQueryGenerationOptions")]
        getter natural_language_query_generation_options : Types::NaturalLanguageQueryGenerationOptionsOutput?

        # Container for parameters representing the state of S3 vectors engine features on the specified
        # domain.

        @[JSON::Field(key: "S3VectorsEngine")]
        getter s3_vectors_engine : Types::S3VectorsEngine?

        # The current serverless vector acceleration configuration for the domain.

        @[JSON::Field(key: "ServerlessVectorAcceleration")]
        getter serverless_vector_acceleration : Types::ServerlessVectorAcceleration?

        def initialize(
          @natural_language_query_generation_options : Types::NaturalLanguageQueryGenerationOptionsOutput? = nil,
          @s3_vectors_engine : Types::S3VectorsEngine? = nil,
          @serverless_vector_acceleration : Types::ServerlessVectorAcceleration? = nil
        )
        end
      end

      # The status of machine learning options on the specified domain.

      struct AIMLOptionsStatus
        include JSON::Serializable

        # Machine learning options on the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::AIMLOptionsOutput?


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus?

        def initialize(
          @options : Types::AIMLOptionsOutput? = nil,
          @status : Types::OptionStatus? = nil
        )
        end
      end

      # Information about an Amazon OpenSearch Service domain.

      struct AWSDomainInformation
        include JSON::Serializable

        # Name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Amazon Web Services account ID of the domain owner.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # The Amazon Web Services Region in which the domain is located.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @domain_name : String,
          @owner_id : String? = nil,
          @region : String? = nil
        )
        end
      end

      # Container for the parameters to the AcceptInboundConnection operation.

      struct AcceptInboundConnectionRequest
        include JSON::Serializable

        # The ID of the inbound connection to accept.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end

      # Contains details about the accepted inbound connection.

      struct AcceptInboundConnectionResponse
        include JSON::Serializable

        # Information about the accepted inbound connection.

        @[JSON::Field(key: "Connection")]
        getter connection : Types::InboundConnection?

        def initialize(
          @connection : Types::InboundConnection? = nil
        )
        end
      end

      # An error occurred because you don't have permissions to access the resource.

      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # The configured access rules for the domain's search endpoint, and the current status of those rules.

      struct AccessPoliciesStatus
        include JSON::Serializable

        # The access policy configured for the domain. Access policies can be resource-based, IP-based, or
        # IAM-based. For more information, see Configuring access policies .

        @[JSON::Field(key: "Options")]
        getter options : String

        # The status of the access policy for the domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : String,
          @status : Types::OptionStatus
        )
        end
      end

      # Container for the parameters to the AddDataSource operation.

      struct AddDataSourceRequest
        include JSON::Serializable

        # The type of data source.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DataSourceType

        # The name of the domain to add the data source to.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A name for the data source.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @data_source_type : Types::DataSourceType,
          @domain_name : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # The result of an AddDataSource operation.

      struct AddDataSourceResponse
        include JSON::Serializable

        # A message associated with creation of the data source.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AddDirectQueryDataSourceRequest
        include JSON::Serializable

        # A unique, user-defined label to identify the data source within your OpenSearch Service environment.

        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String

        # The supported Amazon Web Services service that you want to use as the source for direct queries in
        # OpenSearch Service.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DirectQueryDataSourceType

        # A list of Amazon Resource Names (ARNs) for the OpenSearch collections that are associated with the
        # direct query data source.

        @[JSON::Field(key: "OpenSearchArns")]
        getter open_search_arns : Array(String)

        # An optional text field for providing additional context and details about the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @data_source_name : String,
          @data_source_type : Types::DirectQueryDataSourceType,
          @open_search_arns : Array(String),
          @description : String? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct AddDirectQueryDataSourceResponse
        include JSON::Serializable

        # The unique, system-generated identifier that represents the data source.

        @[JSON::Field(key: "DataSourceArn")]
        getter data_source_arn : String?

        def initialize(
          @data_source_arn : String? = nil
        )
        end
      end

      # Container for the parameters to the AddTags operation. Specifies the tags to attach to the domain,
      # data source, or application.

      struct AddTagsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the OpenSearch Service domain, data source, or application to which
        # you want to attach resource tags.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # List of resource tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)

        def initialize(
          @arn : String,
          @tag_list : Array(Types::Tag)
        )
        end
      end

      # List of limits that are specific to a given instance type.

      struct AdditionalLimit
        include JSON::Serializable

        # MaximumNumberOfDataNodesSupported - This attribute only applies to master nodes and specifies the
        # maximum number of data nodes of a given instance type a master node can support.
        # MaximumNumberOfDataNodesWithoutMasterNode - This attribute only applies to data nodes and specifies
        # the maximum number of data nodes of a given instance type can exist without a master node governing
        # them.

        @[JSON::Field(key: "LimitName")]
        getter limit_name : String?

        # The values of the additional instance type limits.

        @[JSON::Field(key: "LimitValues")]
        getter limit_values : Array(String)?

        def initialize(
          @limit_name : String? = nil,
          @limit_values : Array(String)? = nil
        )
        end
      end

      # Status of the advanced options for the specified domain. The following options are available:
      # "rest.action.multi.allow_explicit_index": "true" | "false" - Note the use of a string rather than a
      # boolean. Specifies whether explicit references to indexes are allowed inside the body of HTTP
      # requests. If you want to configure access policies for domain sub-resources, such as specific
      # indexes and domain APIs, you must disable this property. Default is true.
      # "indices.fielddata.cache.size": "80" - Note the use of a string rather than a boolean. Specifies the
      # percentage of heap space allocated to field data. Default is unbounded.
      # "indices.query.bool.max_clause_count": "1024" - Note the use of a string rather than a boolean.
      # Specifies the maximum number of clauses allowed in a Lucene boolean query. Default is 1,024. Queries
      # with more than the permitted number of clauses result in a TooManyClauses error.
      # "override_main_response_version": "true" | "false" - Note the use of a string rather than a boolean.
      # Specifies whether the domain reports its version as 7.10 to allow Elasticsearch OSS clients and
      # plugins to continue working with it. Default is false when creating a domain and true when upgrading
      # a domain. For more information, see Advanced cluster parameters .

      struct AdvancedOptionsStatus
        include JSON::Serializable

        # The status of advanced options for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Hash(String, String)

        # The status of advanced options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Hash(String, String),
          @status : Types::OptionStatus
        )
        end
      end

      # Container for fine-grained access control settings.

      struct AdvancedSecurityOptions
        include JSON::Serializable

        # Date and time when the migration period will be disabled. Only necessary when enabling fine-grained
        # access control on an existing domain .

        @[JSON::Field(key: "AnonymousAuthDisableDate")]
        getter anonymous_auth_disable_date : Time?

        # True if a 30-day migration period is enabled, during which administrators can create role mappings.
        # Only necessary when enabling fine-grained access control on an existing domain .

        @[JSON::Field(key: "AnonymousAuthEnabled")]
        getter anonymous_auth_enabled : Bool?

        # True if fine-grained access control is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Configuration options for IAM identity federation in advanced security settings.

        @[JSON::Field(key: "IAMFederationOptions")]
        getter iam_federation_options : Types::IAMFederationOptionsOutput?

        # True if the internal user database is enabled.

        @[JSON::Field(key: "InternalUserDatabaseEnabled")]
        getter internal_user_database_enabled : Bool?

        # Container for information about the JWT configuration of the Amazon OpenSearch Service.

        @[JSON::Field(key: "JWTOptions")]
        getter jwt_options : Types::JWTOptionsOutput?

        # Container for information about the SAML configuration for OpenSearch Dashboards.

        @[JSON::Field(key: "SAMLOptions")]
        getter saml_options : Types::SAMLOptionsOutput?

        def initialize(
          @anonymous_auth_disable_date : Time? = nil,
          @anonymous_auth_enabled : Bool? = nil,
          @enabled : Bool? = nil,
          @iam_federation_options : Types::IAMFederationOptionsOutput? = nil,
          @internal_user_database_enabled : Bool? = nil,
          @jwt_options : Types::JWTOptionsOutput? = nil,
          @saml_options : Types::SAMLOptionsOutput? = nil
        )
        end
      end

      # Options for enabling and configuring fine-grained access control. For more information, see
      # Fine-grained access control in Amazon OpenSearch Service .

      struct AdvancedSecurityOptionsInput
        include JSON::Serializable

        # True to enable a 30-day migration period during which administrators can create role mappings. Only
        # necessary when enabling fine-grained access control on an existing domain .

        @[JSON::Field(key: "AnonymousAuthEnabled")]
        getter anonymous_auth_enabled : Bool?

        # True to enable fine-grained access control.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Input configuration for IAM identity federation within advanced security options.

        @[JSON::Field(key: "IAMFederationOptions")]
        getter iam_federation_options : Types::IAMFederationOptionsInput?

        # True to enable the internal user database.

        @[JSON::Field(key: "InternalUserDatabaseEnabled")]
        getter internal_user_database_enabled : Bool?

        # Container for information about the JWT configuration of the Amazon OpenSearch Service.

        @[JSON::Field(key: "JWTOptions")]
        getter jwt_options : Types::JWTOptionsInput?

        # Container for information about the master user.

        @[JSON::Field(key: "MasterUserOptions")]
        getter master_user_options : Types::MasterUserOptions?

        # Container for information about the SAML configuration for OpenSearch Dashboards.

        @[JSON::Field(key: "SAMLOptions")]
        getter saml_options : Types::SAMLOptionsInput?

        def initialize(
          @anonymous_auth_enabled : Bool? = nil,
          @enabled : Bool? = nil,
          @iam_federation_options : Types::IAMFederationOptionsInput? = nil,
          @internal_user_database_enabled : Bool? = nil,
          @jwt_options : Types::JWTOptionsInput? = nil,
          @master_user_options : Types::MasterUserOptions? = nil,
          @saml_options : Types::SAMLOptionsInput? = nil
        )
        end
      end

      # The status of fine-grained access control settings for a domain.

      struct AdvancedSecurityOptionsStatus
        include JSON::Serializable

        # Container for fine-grained access control settings.

        @[JSON::Field(key: "Options")]
        getter options : Types::AdvancedSecurityOptions

        # Status of the fine-grained access control settings for a domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::AdvancedSecurityOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Configuration settings for an OpenSearch application. For more information, see Using the OpenSearch
      # user interface in Amazon OpenSearch Service .

      struct AppConfig
        include JSON::Serializable

        # The configuration item to set, such as the admin role for the OpenSearch application.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The value assigned to the configuration key, such as an IAM user ARN.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Basic details of an OpenSearch application.

      struct ApplicationSummary
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when an OpenSearch application was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The endpoint URL of an OpenSearch application.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The unique identifier of an OpenSearch application.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of the last update to an OpenSearch application.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of an OpenSearch application.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of an OpenSearch application. Possible values: CREATING , UPDATING , DELETING ,
        # FAILED , ACTIVE , and DELETED .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @endpoint : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Container for the request parameters to the AssociatePackage operation.

      struct AssociatePackageRequest
        include JSON::Serializable

        # Name of the domain to associate the package with.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Internal ID of the package to associate with a domain. Use DescribePackages to find this value.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # The configuration for associating a package with an Amazon OpenSearch Service domain.

        @[JSON::Field(key: "AssociationConfiguration")]
        getter association_configuration : Types::PackageAssociationConfiguration?

        # A list of package IDs that must be associated with the domain before the package specified in the
        # request can be associated.

        @[JSON::Field(key: "PrerequisitePackageIDList")]
        getter prerequisite_package_id_list : Array(String)?

        def initialize(
          @domain_name : String,
          @package_id : String,
          @association_configuration : Types::PackageAssociationConfiguration? = nil,
          @prerequisite_package_id_list : Array(String)? = nil
        )
        end
      end

      # Container for the response returned by the AssociatePackage operation.

      struct AssociatePackageResponse
        include JSON::Serializable

        # Information about a package that is associated with a domain.

        @[JSON::Field(key: "DomainPackageDetails")]
        getter domain_package_details : Types::DomainPackageDetails?

        def initialize(
          @domain_package_details : Types::DomainPackageDetails? = nil
        )
        end
      end


      struct AssociatePackagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of packages and their prerequisites to be associated with a domain.

        @[JSON::Field(key: "PackageList")]
        getter package_list : Array(Types::PackageDetailsForAssociation)

        def initialize(
          @domain_name : String,
          @package_list : Array(Types::PackageDetailsForAssociation)
        )
        end
      end


      struct AssociatePackagesResponse
        include JSON::Serializable

        # List of information about packages that are associated with a domain.

        @[JSON::Field(key: "DomainPackageDetailsList")]
        getter domain_package_details_list : Array(Types::DomainPackageDetails)?

        def initialize(
          @domain_package_details_list : Array(Types::DomainPackageDetails)? = nil
        )
        end
      end


      struct AuthorizeVpcEndpointAccessRequest
        include JSON::Serializable

        # The name of the OpenSearch Service domain to provide access to.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Amazon Web Services account ID to grant access to.

        @[JSON::Field(key: "Account")]
        getter account : String?

        # The Amazon Web Services service SP to grant access to.

        @[JSON::Field(key: "Service")]
        getter service : String?

        def initialize(
          @domain_name : String,
          @account : String? = nil,
          @service : String? = nil
        )
        end
      end


      struct AuthorizeVpcEndpointAccessResponse
        include JSON::Serializable

        # Information about the Amazon Web Services account or service that was provided access to the domain.

        @[JSON::Field(key: "AuthorizedPrincipal")]
        getter authorized_principal : Types::AuthorizedPrincipal

        def initialize(
          @authorized_principal : Types::AuthorizedPrincipal
        )
        end
      end

      # Information about an Amazon Web Services account or service that has access to an Amazon OpenSearch
      # Service domain through the use of an interface VPC endpoint.

      struct AuthorizedPrincipal
        include JSON::Serializable

        # The IAM principal that is allowed access to the domain.

        @[JSON::Field(key: "Principal")]
        getter principal : String?

        # The type of principal.

        @[JSON::Field(key: "PrincipalType")]
        getter principal_type : String?

        def initialize(
          @principal : String? = nil,
          @principal_type : String? = nil
        )
        end
      end

      # Information about an Auto-Tune action. For more information, see Auto-Tune for Amazon OpenSearch
      # Service .

      struct AutoTune
        include JSON::Serializable

        # Details about an Auto-Tune action.

        @[JSON::Field(key: "AutoTuneDetails")]
        getter auto_tune_details : Types::AutoTuneDetails?

        # The type of Auto-Tune action.

        @[JSON::Field(key: "AutoTuneType")]
        getter auto_tune_type : String?

        def initialize(
          @auto_tune_details : Types::AutoTuneDetails? = nil,
          @auto_tune_type : String? = nil
        )
        end
      end

      # Specifies details about a scheduled Auto-Tune action. For more information, see Auto-Tune for Amazon
      # OpenSearch Service .

      struct AutoTuneDetails
        include JSON::Serializable

        # Container for details about a scheduled Auto-Tune action.

        @[JSON::Field(key: "ScheduledAutoTuneDetails")]
        getter scheduled_auto_tune_details : Types::ScheduledAutoTuneDetails?

        def initialize(
          @scheduled_auto_tune_details : Types::ScheduledAutoTuneDetails? = nil
        )
        end
      end

      # This object is deprecated. Use the domain's off-peak window to schedule Auto-Tune optimizations. For
      # migration instructions, see Migrating from Auto-Tune maintenance windows . The Auto-Tune maintenance
      # schedule. For more information, see Auto-Tune for Amazon OpenSearch Service .

      struct AutoTuneMaintenanceSchedule
        include JSON::Serializable

        # A cron expression for a recurring maintenance schedule during which Auto-Tune can deploy changes.

        @[JSON::Field(key: "CronExpressionForRecurrence")]
        getter cron_expression_for_recurrence : String?

        # The duration of the maintenance schedule. For example, "Duration": {"Value": 2, "Unit": "HOURS"} .

        @[JSON::Field(key: "Duration")]
        getter duration : Types::Duration?

        # The Epoch timestamp at which the Auto-Tune maintenance schedule starts.

        @[JSON::Field(key: "StartAt")]
        getter start_at : Time?

        def initialize(
          @cron_expression_for_recurrence : String? = nil,
          @duration : Types::Duration? = nil,
          @start_at : Time? = nil
        )
        end
      end

      # Auto-Tune settings when updating a domain. For more information, see Auto-Tune for Amazon OpenSearch
      # Service .

      struct AutoTuneOptions
        include JSON::Serializable

        # Whether Auto-Tune is enabled or disabled.

        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # DEPRECATED. Use off-peak window instead. A list of maintenance schedules during which Auto-Tune can
        # deploy changes.

        @[JSON::Field(key: "MaintenanceSchedules")]
        getter maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)?

        # When disabling Auto-Tune, specify NO_ROLLBACK to retain all prior Auto-Tune settings or
        # DEFAULT_ROLLBACK to revert to the OpenSearch Service defaults. If you specify DEFAULT_ROLLBACK , you
        # must include a MaintenanceSchedule in the request. Otherwise, OpenSearch Service is unable to
        # perform the rollback.

        @[JSON::Field(key: "RollbackOnDisable")]
        getter rollback_on_disable : String?

        # Whether to use the domain's off-peak window to deploy configuration changes on the domain rather
        # than a maintenance schedule.

        @[JSON::Field(key: "UseOffPeakWindow")]
        getter use_off_peak_window : Bool?

        def initialize(
          @desired_state : String? = nil,
          @maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)? = nil,
          @rollback_on_disable : String? = nil,
          @use_off_peak_window : Bool? = nil
        )
        end
      end

      # Options for configuring Auto-Tune. For more information, see Auto-Tune for Amazon OpenSearch Service

      struct AutoTuneOptionsInput
        include JSON::Serializable

        # Whether Auto-Tune is enabled or disabled.

        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # A list of maintenance schedules during which Auto-Tune can deploy changes. Maintenance windows are
        # deprecated and have been replaced with off-peak windows .

        @[JSON::Field(key: "MaintenanceSchedules")]
        getter maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)?

        # Whether to schedule Auto-Tune optimizations that require blue/green deployments during the domain's
        # configured daily off-peak window.

        @[JSON::Field(key: "UseOffPeakWindow")]
        getter use_off_peak_window : Bool?

        def initialize(
          @desired_state : String? = nil,
          @maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)? = nil,
          @use_off_peak_window : Bool? = nil
        )
        end
      end

      # The Auto-Tune settings for a domain, displayed when enabling or disabling Auto-Tune.

      struct AutoTuneOptionsOutput
        include JSON::Serializable

        # Any errors that occurred while enabling or disabling Auto-Tune.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The current state of Auto-Tune on the domain.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Whether the domain's off-peak window will be used to deploy Auto-Tune changes rather than a
        # maintenance schedule.

        @[JSON::Field(key: "UseOffPeakWindow")]
        getter use_off_peak_window : Bool?

        def initialize(
          @error_message : String? = nil,
          @state : String? = nil,
          @use_off_peak_window : Bool? = nil
        )
        end
      end

      # The Auto-Tune status for the domain.

      struct AutoTuneOptionsStatus
        include JSON::Serializable

        # Auto-Tune settings for updating a domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::AutoTuneOptions?

        # The current status of Auto-Tune for a domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::AutoTuneStatus?

        def initialize(
          @options : Types::AutoTuneOptions? = nil,
          @status : Types::AutoTuneStatus? = nil
        )
        end
      end

      # The current status of Auto-Tune for the domain. For more information, see Auto-Tune for Amazon
      # OpenSearch Service .

      struct AutoTuneStatus
        include JSON::Serializable

        # Date and time when Auto-Tune was enabled for the domain.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # The current state of Auto-Tune on the domain.

        @[JSON::Field(key: "State")]
        getter state : String

        # Date and time when the Auto-Tune options were last updated for the domain.

        @[JSON::Field(key: "UpdateDate")]
        getter update_date : Time

        # Any errors that occurred while enabling or disabling Auto-Tune.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Indicates whether the domain is being deleted.

        @[JSON::Field(key: "PendingDeletion")]
        getter pending_deletion : Bool?

        # The latest version of the Auto-Tune options.

        @[JSON::Field(key: "UpdateVersion")]
        getter update_version : Int32?

        def initialize(
          @creation_date : Time,
          @state : String,
          @update_date : Time,
          @error_message : String? = nil,
          @pending_deletion : Bool? = nil,
          @update_version : Int32? = nil
        )
        end
      end

      # Information about an Availability Zone on a domain.

      struct AvailabilityZoneInfo
        include JSON::Serializable

        # The name of the Availability Zone.

        @[JSON::Field(key: "AvailabilityZoneName")]
        getter availability_zone_name : String?

        # The number of data nodes active in the Availability Zone.

        @[JSON::Field(key: "AvailableDataNodeCount")]
        getter available_data_node_count : String?

        # The total number of data nodes configured in the Availability Zone.

        @[JSON::Field(key: "ConfiguredDataNodeCount")]
        getter configured_data_node_count : String?

        # The total number of primary and replica shards in the Availability Zone.

        @[JSON::Field(key: "TotalShards")]
        getter total_shards : String?

        # The total number of primary and replica shards that aren't allocated to any of the nodes in the
        # Availability Zone.

        @[JSON::Field(key: "TotalUnAssignedShards")]
        getter total_un_assigned_shards : String?

        # The current state of the Availability Zone. Current options are Active and StandBy . Active - Data
        # nodes in the Availability Zone are in use. StandBy - Data nodes in the Availability Zone are in a
        # standby state. NotAvailable - Unable to retrieve information.

        @[JSON::Field(key: "ZoneStatus")]
        getter zone_status : String?

        def initialize(
          @availability_zone_name : String? = nil,
          @available_data_node_count : String? = nil,
          @configured_data_node_count : String? = nil,
          @total_shards : String? = nil,
          @total_un_assigned_shards : String? = nil,
          @zone_status : String? = nil
        )
        end
      end

      # An error occurred while processing the request.

      struct BaseException
        include JSON::Serializable

        # A description of the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CancelDomainConfigChangeRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # When set to True , returns the list of change IDs and properties that will be cancelled without
        # actually cancelling the change.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @domain_name : String,
          @dry_run : Bool? = nil
        )
        end
      end


      struct CancelDomainConfigChangeResponse
        include JSON::Serializable

        # The unique identifiers of the changes that were cancelled.

        @[JSON::Field(key: "CancelledChangeIds")]
        getter cancelled_change_ids : Array(String)?

        # The domain change properties that were cancelled.

        @[JSON::Field(key: "CancelledChangeProperties")]
        getter cancelled_change_properties : Array(Types::CancelledChangeProperty)?

        # Whether or not the request was a dry run. If True , the changes were not actually cancelled.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @cancelled_change_ids : Array(String)? = nil,
          @cancelled_change_properties : Array(Types::CancelledChangeProperty)? = nil,
          @dry_run : Bool? = nil
        )
        end
      end

      # Container for the request parameters to cancel a service software update.

      struct CancelServiceSoftwareUpdateRequest
        include JSON::Serializable

        # Name of the OpenSearch Service domain that you want to cancel the service software update on.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # Container for the response to a CancelServiceSoftwareUpdate operation. Contains the status of the
      # update.

      struct CancelServiceSoftwareUpdateResponse
        include JSON::Serializable

        # Container for the state of your domain relative to the latest service software.

        @[JSON::Field(key: "ServiceSoftwareOptions")]
        getter service_software_options : Types::ServiceSoftwareOptions?

        def initialize(
          @service_software_options : Types::ServiceSoftwareOptions? = nil
        )
        end
      end

      # A property change that was cancelled for an Amazon OpenSearch Service domain.

      struct CancelledChangeProperty
        include JSON::Serializable

        # The current value of the property, after the change was cancelled.

        @[JSON::Field(key: "ActiveValue")]
        getter active_value : String?

        # The pending value of the property that was cancelled. This would have been the eventual value of the
        # property if the chance had not been cancelled.

        @[JSON::Field(key: "CancelledValue")]
        getter cancelled_value : String?

        # The name of the property whose change was cancelled.

        @[JSON::Field(key: "PropertyName")]
        getter property_name : String?

        def initialize(
          @active_value : String? = nil,
          @cancelled_value : String? = nil,
          @property_name : String? = nil
        )
        end
      end

      # Container for information about a configuration change happening on a domain.

      struct ChangeProgressDetails
        include JSON::Serializable

        # The ID of the configuration change.

        @[JSON::Field(key: "ChangeId")]
        getter change_id : String?

        # The current status of the configuration change.

        @[JSON::Field(key: "ConfigChangeStatus")]
        getter config_change_status : String?

        # The IAM principal who initiated the configuration change.

        @[JSON::Field(key: "InitiatedBy")]
        getter initiated_by : String?

        # The last time that the configuration change was updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # A message corresponding to the status of the configuration change.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The time that the configuration change was initiated, in Universal Coordinated Time (UTC).

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @change_id : String? = nil,
          @config_change_status : String? = nil,
          @initiated_by : String? = nil,
          @last_updated_time : Time? = nil,
          @message : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Progress details for each stage of a domain update.

      struct ChangeProgressStage
        include JSON::Serializable

        # The description of the stage.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The most recent updated timestamp of the stage.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The name of the stage.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the stage.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @last_updated : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The progress details of a specific domain configuration change.

      struct ChangeProgressStatusDetails
        include JSON::Serializable

        # The unique change identifier associated with a specific domain configuration change.

        @[JSON::Field(key: "ChangeId")]
        getter change_id : String?

        # The specific stages that the domain is going through to perform the configuration change.

        @[JSON::Field(key: "ChangeProgressStages")]
        getter change_progress_stages : Array(Types::ChangeProgressStage)?

        # The list of properties in the domain configuration change that have completed.

        @[JSON::Field(key: "CompletedProperties")]
        getter completed_properties : Array(String)?

        # The current status of the configuration change.

        @[JSON::Field(key: "ConfigChangeStatus")]
        getter config_change_status : String?

        # The IAM principal who initiated the configuration change.

        @[JSON::Field(key: "InitiatedBy")]
        getter initiated_by : String?

        # The last time that the status of the configuration change was updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The list of properties in the domain configuration change that are still pending.

        @[JSON::Field(key: "PendingProperties")]
        getter pending_properties : Array(String)?

        # The time at which the configuration change is made on the domain.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The overall status of the domain configuration change.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The total number of stages required for the configuration change.

        @[JSON::Field(key: "TotalNumberOfStages")]
        getter total_number_of_stages : Int32?

        def initialize(
          @change_id : String? = nil,
          @change_progress_stages : Array(Types::ChangeProgressStage)? = nil,
          @completed_properties : Array(String)? = nil,
          @config_change_status : String? = nil,
          @initiated_by : String? = nil,
          @last_updated_time : Time? = nil,
          @pending_properties : Array(String)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @total_number_of_stages : Int32? = nil
        )
        end
      end

      # Configuration details for a CloudWatch Logs data source that can be used for direct queries.

      struct CloudWatchDirectQueryDataSource
        include JSON::Serializable

        # The unique identifier of the IAM role that grants OpenSearch Service permission to access the
        # specified data source.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end

      # Container for the cluster configuration of an OpenSearch Service domain. For more information, see
      # Creating and managing Amazon OpenSearch Service domains .

      struct ClusterConfig
        include JSON::Serializable

        # Container for cold storage configuration options.

        @[JSON::Field(key: "ColdStorageOptions")]
        getter cold_storage_options : Types::ColdStorageOptions?

        # Number of dedicated master nodes in the cluster. This number must be greater than 2 and not 4,
        # otherwise you receive a validation exception.

        @[JSON::Field(key: "DedicatedMasterCount")]
        getter dedicated_master_count : Int32?

        # Indicates whether dedicated master nodes are enabled for the cluster. True if the cluster will use a
        # dedicated master node. False if the cluster will not.

        @[JSON::Field(key: "DedicatedMasterEnabled")]
        getter dedicated_master_enabled : Bool?

        # OpenSearch Service instance type of the dedicated master nodes in the cluster.

        @[JSON::Field(key: "DedicatedMasterType")]
        getter dedicated_master_type : String?

        # Number of data nodes in the cluster. This number must be greater than 1, otherwise you receive a
        # validation exception.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # Instance type of data nodes in the cluster.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # A boolean that indicates whether a multi-AZ domain is turned on with a standby AZ. For more
        # information, see Configuring a multi-AZ domain in Amazon OpenSearch Service .

        @[JSON::Field(key: "MultiAZWithStandbyEnabled")]
        getter multi_az_with_standby_enabled : Bool?

        # List of node options for the domain.

        @[JSON::Field(key: "NodeOptions")]
        getter node_options : Array(Types::NodeOption)?

        # The number of warm nodes in the cluster.

        @[JSON::Field(key: "WarmCount")]
        getter warm_count : Int32?

        # Whether to enable warm storage for the cluster.

        @[JSON::Field(key: "WarmEnabled")]
        getter warm_enabled : Bool?

        # The instance type for the cluster's warm nodes.

        @[JSON::Field(key: "WarmType")]
        getter warm_type : String?

        # Container for zone awareness configuration options. Only required if ZoneAwarenessEnabled is true .

        @[JSON::Field(key: "ZoneAwarenessConfig")]
        getter zone_awareness_config : Types::ZoneAwarenessConfig?

        # Indicates whether multiple Availability Zones are enabled. For more information, see Configuring a
        # multi-AZ domain in Amazon OpenSearch Service .

        @[JSON::Field(key: "ZoneAwarenessEnabled")]
        getter zone_awareness_enabled : Bool?

        def initialize(
          @cold_storage_options : Types::ColdStorageOptions? = nil,
          @dedicated_master_count : Int32? = nil,
          @dedicated_master_enabled : Bool? = nil,
          @dedicated_master_type : String? = nil,
          @instance_count : Int32? = nil,
          @instance_type : String? = nil,
          @multi_az_with_standby_enabled : Bool? = nil,
          @node_options : Array(Types::NodeOption)? = nil,
          @warm_count : Int32? = nil,
          @warm_enabled : Bool? = nil,
          @warm_type : String? = nil,
          @zone_awareness_config : Types::ZoneAwarenessConfig? = nil,
          @zone_awareness_enabled : Bool? = nil
        )
        end
      end

      # The cluster configuration status for a domain.

      struct ClusterConfigStatus
        include JSON::Serializable

        # Cluster configuration options for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::ClusterConfig

        # The status of cluster configuration options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::ClusterConfig,
          @status : Types::OptionStatus
        )
        end
      end

      # Container for the parameters required to enable Cognito authentication for an OpenSearch Service
      # domain. For more information, see Configuring Amazon Cognito authentication for OpenSearch
      # Dashboards .

      struct CognitoOptions
        include JSON::Serializable

        # Whether to enable or disable Amazon Cognito authentication for OpenSearch Dashboards.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The Amazon Cognito identity pool ID that you want OpenSearch Service to use for OpenSearch
        # Dashboards authentication.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # The AmazonOpenSearchServiceCognitoAccess role that allows OpenSearch Service to configure your user
        # pool and identity pool.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The Amazon Cognito user pool ID that you want OpenSearch Service to use for OpenSearch Dashboards
        # authentication.

        @[JSON::Field(key: "UserPoolId")]
        getter user_pool_id : String?

        def initialize(
          @enabled : Bool? = nil,
          @identity_pool_id : String? = nil,
          @role_arn : String? = nil,
          @user_pool_id : String? = nil
        )
        end
      end

      # The status of the Cognito options for the specified domain.

      struct CognitoOptionsStatus
        include JSON::Serializable

        # Cognito options for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::CognitoOptions

        # The status of the Cognito options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::CognitoOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Container for the parameters required to enable cold storage for an OpenSearch Service domain. For
      # more information, see Cold storage for Amazon OpenSearch Service .

      struct ColdStorageOptions
        include JSON::Serializable

        # Whether to enable or disable cold storage on the domain. You must enable UltraWarm storage to enable
        # cold storage.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # A map of OpenSearch or Elasticsearch versions and the versions you can upgrade them to.

      struct CompatibleVersionsMap
        include JSON::Serializable

        # The current version that the OpenSearch Service domain is running.

        @[JSON::Field(key: "SourceVersion")]
        getter source_version : String?

        # The possible versions that you can upgrade the domain to.

        @[JSON::Field(key: "TargetVersions")]
        getter target_versions : Array(String)?

        def initialize(
          @source_version : String? = nil,
          @target_versions : Array(String)? = nil
        )
        end
      end

      # An error occurred because the client attempts to remove a resource that is currently in use.

      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end

      # The connection properties of an outbound connection.

      struct ConnectionProperties
        include JSON::Serializable

        # The connection properties for cross cluster search.

        @[JSON::Field(key: "CrossClusterSearch")]
        getter cross_cluster_search : Types::CrossClusterSearchConnectionProperties?

        # The Endpoint attribute cannot be modified. The endpoint of the remote domain. Applicable for
        # VPC_ENDPOINT connection mode.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        def initialize(
          @cross_cluster_search : Types::CrossClusterSearchConnectionProperties? = nil,
          @endpoint : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # The unique name of the OpenSearch application. Names must be unique within an Amazon Web Services
        # Region for each account.

        @[JSON::Field(key: "name")]
        getter name : String

        # Configuration settings for the OpenSearch application, including administrative options.

        @[JSON::Field(key: "appConfigs")]
        getter app_configs : Array(Types::AppConfig)?

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The data sources to link to the OpenSearch application.

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(Types::DataSource)?

        # Configuration settings for integrating Amazon Web Services IAM Identity Center with the OpenSearch
        # application.

        @[JSON::Field(key: "iamIdentityCenterOptions")]
        getter iam_identity_center_options : Types::IamIdentityCenterOptionsInput?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the application's data at rest. If
        # provided, the application uses your customer-managed key for encryption. If omitted, the application
        # uses an AWS-managed key. The KMS key must be in the same region as the application.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?


        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @name : String,
          @app_configs : Array(Types::AppConfig)? = nil,
          @client_token : String? = nil,
          @data_sources : Array(Types::DataSource)? = nil,
          @iam_identity_center_options : Types::IamIdentityCenterOptionsInput? = nil,
          @kms_key_arn : String? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # Configuration settings for the OpenSearch application, including administrative options.

        @[JSON::Field(key: "appConfigs")]
        getter app_configs : Array(Types::AppConfig)?


        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp indicating when the OpenSearch application was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The data sources linked to the OpenSearch application.

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(Types::DataSource)?

        # The IAM Identity Center settings configured for the OpenSearch application.

        @[JSON::Field(key: "iamIdentityCenterOptions")]
        getter iam_identity_center_options : Types::IamIdentityCenterOptions?

        # The unique identifier assigned to the OpenSearch application.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the application's data at rest.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The name of the OpenSearch application.

        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @app_configs : Array(Types::AppConfig)? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @data_sources : Array(Types::DataSource)? = nil,
          @iam_identity_center_options : Types::IamIdentityCenterOptions? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @name : String? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDomainRequest
        include JSON::Serializable

        # Name of the OpenSearch Service domain to create. Domain names are unique across the domains owned by
        # an account within an Amazon Web Services Region.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Options for all machine learning features for the specified domain.

        @[JSON::Field(key: "AIMLOptions")]
        getter aiml_options : Types::AIMLOptionsInput?

        # Identity and Access Management (IAM) policy document specifying the access policies for the new
        # domain.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : String?

        # Key-value pairs to specify advanced configuration options. The following key-value pairs are
        # supported: "rest.action.multi.allow_explicit_index": "true" | "false" - Note the use of a string
        # rather than a boolean. Specifies whether explicit references to indexes are allowed inside the body
        # of HTTP requests. If you want to configure access policies for domain sub-resources, such as
        # specific indexes and domain APIs, you must disable this property. Default is true.
        # "indices.fielddata.cache.size": "80" - Note the use of a string rather than a boolean. Specifies the
        # percentage of heap space allocated to field data. Default is unbounded.
        # "indices.query.bool.max_clause_count": "1024" - Note the use of a string rather than a boolean.
        # Specifies the maximum number of clauses allowed in a Lucene boolean query. Default is 1,024. Queries
        # with more than the permitted number of clauses result in a TooManyClauses error.
        # "override_main_response_version": "true" | "false" - Note the use of a string rather than a boolean.
        # Specifies whether the domain reports its version as 7.10 to allow Elasticsearch OSS clients and
        # plugins to continue working with it. Default is false when creating a domain and true when upgrading
        # a domain. For more information, see Advanced cluster parameters .

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # Options for fine-grained access control.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptionsInput?

        # Options for Auto-Tune.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptionsInput?

        # Container for the cluster configuration of a domain.

        @[JSON::Field(key: "ClusterConfig")]
        getter cluster_config : Types::ClusterConfig?

        # Key-value pairs to configure Amazon Cognito authentication. For more information, see Configuring
        # Amazon Cognito authentication for OpenSearch Dashboards .

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptions?

        # Additional options for the domain endpoint, such as whether to require HTTPS for all traffic.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptions?

        # Container for the parameters required to enable EBS-based storage for an OpenSearch Service domain.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptions?

        # Key-value pairs to enable encryption at rest.

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # String of format Elasticsearch_X.Y or OpenSearch_X.Y to specify the engine version for the
        # OpenSearch Service domain. For example, OpenSearch_1.0 or Elasticsearch_7.9 . For more information,
        # see Creating and managing Amazon OpenSearch Service domains .

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specify either dual stack or IPv4 as your IP address type. Dual stack allows you to share domain
        # resources across IPv4 and IPv6 address types, and is the recommended option. If you set your IP
        # address type to dual stack, you can't change your address type later.

        @[JSON::Field(key: "IPAddressType")]
        getter ip_address_type : String?

        # Configuration options for enabling and managing IAM Identity Center integration within a domain.

        @[JSON::Field(key: "IdentityCenterOptions")]
        getter identity_center_options : Types::IdentityCenterOptionsInput?

        # Key-value pairs to configure log publishing.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Hash(String, Types::LogPublishingOption)?

        # Enables node-to-node encryption.

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions?

        # Specifies a daily 10-hour time block during which OpenSearch Service can perform configuration
        # changes on the domain, including service software updates and Auto-Tune enhancements that require a
        # blue/green deployment. If no options are specified, the default start time of 10:00 P.M. local time
        # (for the Region that the domain is created in) is used.

        @[JSON::Field(key: "OffPeakWindowOptions")]
        getter off_peak_window_options : Types::OffPeakWindowOptions?

        # DEPRECATED. Container for the parameters required to configure automated snapshots of domain
        # indexes.

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptions?

        # Software update options for the domain.

        @[JSON::Field(key: "SoftwareUpdateOptions")]
        getter software_update_options : Types::SoftwareUpdateOptions?

        # List of tags to add to the domain upon creation.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        # Container for the values required to configure VPC access domains. If you don't specify these
        # values, OpenSearch Service creates the domain with a public endpoint. For more information, see
        # Launching your Amazon OpenSearch Service domains using a VPC .

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCOptions?

        def initialize(
          @domain_name : String,
          @aiml_options : Types::AIMLOptionsInput? = nil,
          @access_policies : String? = nil,
          @advanced_options : Hash(String, String)? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
          @auto_tune_options : Types::AutoTuneOptionsInput? = nil,
          @cluster_config : Types::ClusterConfig? = nil,
          @cognito_options : Types::CognitoOptions? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptions? = nil,
          @ebs_options : Types::EBSOptions? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @engine_version : String? = nil,
          @ip_address_type : String? = nil,
          @identity_center_options : Types::IdentityCenterOptionsInput? = nil,
          @log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
          @off_peak_window_options : Types::OffPeakWindowOptions? = nil,
          @snapshot_options : Types::SnapshotOptions? = nil,
          @software_update_options : Types::SoftwareUpdateOptions? = nil,
          @tag_list : Array(Types::Tag)? = nil,
          @vpc_options : Types::VPCOptions? = nil
        )
        end
      end

      # The result of a CreateDomain operation. Contains the status of the newly created domain.

      struct CreateDomainResponse
        include JSON::Serializable

        # The status of the newly created domain.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::DomainStatus?

        def initialize(
          @domain_status : Types::DomainStatus? = nil
        )
        end
      end


      struct CreateIndexRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the index to create. Must be between 1 and 255 characters and follow OpenSearch naming
        # conventions.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The JSON schema defining index mappings, settings, and semantic enrichment configuration. The schema
        # specifies which text fields should be automatically enriched for semantic search capabilities and
        # includes OpenSearch index configuration parameters.

        @[JSON::Field(key: "IndexSchema")]
        getter index_schema : Types::IndexSchema

        def initialize(
          @domain_name : String,
          @index_name : String,
          @index_schema : Types::IndexSchema
        )
        end
      end


      struct CreateIndexResponse
        include JSON::Serializable

        # The status of the index creation operation.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Container for the parameters to the CreateOutboundConnection operation.

      struct CreateOutboundConnectionRequest
        include JSON::Serializable

        # Name of the connection.

        @[JSON::Field(key: "ConnectionAlias")]
        getter connection_alias : String

        # Name and Region of the source (local) domain.

        @[JSON::Field(key: "LocalDomainInfo")]
        getter local_domain_info : Types::DomainInformationContainer

        # Name and Region of the destination (remote) domain.

        @[JSON::Field(key: "RemoteDomainInfo")]
        getter remote_domain_info : Types::DomainInformationContainer

        # The connection mode.

        @[JSON::Field(key: "ConnectionMode")]
        getter connection_mode : String?

        # The ConnectionProperties for the outbound connection.

        @[JSON::Field(key: "ConnectionProperties")]
        getter connection_properties : Types::ConnectionProperties?

        def initialize(
          @connection_alias : String,
          @local_domain_info : Types::DomainInformationContainer,
          @remote_domain_info : Types::DomainInformationContainer,
          @connection_mode : String? = nil,
          @connection_properties : Types::ConnectionProperties? = nil
        )
        end
      end

      # The result of a CreateOutboundConnection request. Contains details about the newly created
      # cross-cluster connection.

      struct CreateOutboundConnectionResponse
        include JSON::Serializable

        # Name of the connection.

        @[JSON::Field(key: "ConnectionAlias")]
        getter connection_alias : String?

        # The unique identifier for the created outbound connection, which is used for subsequent operations
        # on the connection.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The connection mode.

        @[JSON::Field(key: "ConnectionMode")]
        getter connection_mode : String?

        # The ConnectionProperties for the newly created connection.

        @[JSON::Field(key: "ConnectionProperties")]
        getter connection_properties : Types::ConnectionProperties?

        # The status of the connection.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::OutboundConnectionStatus?

        # Information about the source (local) domain.

        @[JSON::Field(key: "LocalDomainInfo")]
        getter local_domain_info : Types::DomainInformationContainer?

        # Information about the destination (remote) domain.

        @[JSON::Field(key: "RemoteDomainInfo")]
        getter remote_domain_info : Types::DomainInformationContainer?

        def initialize(
          @connection_alias : String? = nil,
          @connection_id : String? = nil,
          @connection_mode : String? = nil,
          @connection_properties : Types::ConnectionProperties? = nil,
          @connection_status : Types::OutboundConnectionStatus? = nil,
          @local_domain_info : Types::DomainInformationContainer? = nil,
          @remote_domain_info : Types::DomainInformationContainer? = nil
        )
        end
      end

      # Container for request parameters to the CreatePackage operation.

      struct CreatePackageRequest
        include JSON::Serializable

        # Unique name for the package.

        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # The Amazon S3 location from which to import the package.

        @[JSON::Field(key: "PackageSource")]
        getter package_source : Types::PackageSource

        # The type of package.

        @[JSON::Field(key: "PackageType")]
        getter package_type : String

        # The version of the Amazon OpenSearch Service engine for which is compatible with the package. This
        # can only be specified for package type ZIP-PLUGIN

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The configuration parameters for the package being created.

        @[JSON::Field(key: "PackageConfiguration")]
        getter package_configuration : Types::PackageConfiguration?

        # Description of the package.

        @[JSON::Field(key: "PackageDescription")]
        getter package_description : String?

        # The encryption parameters for the package being created.

        @[JSON::Field(key: "PackageEncryptionOptions")]
        getter package_encryption_options : Types::PackageEncryptionOptions?

        # The vending options for the package being created. They determine if the package can be vended to
        # other users.

        @[JSON::Field(key: "PackageVendingOptions")]
        getter package_vending_options : Types::PackageVendingOptions?

        def initialize(
          @package_name : String,
          @package_source : Types::PackageSource,
          @package_type : String,
          @engine_version : String? = nil,
          @package_configuration : Types::PackageConfiguration? = nil,
          @package_description : String? = nil,
          @package_encryption_options : Types::PackageEncryptionOptions? = nil,
          @package_vending_options : Types::PackageVendingOptions? = nil
        )
        end
      end

      # Container for the response returned by the CreatePackage operation.

      struct CreatePackageResponse
        include JSON::Serializable

        # Basic information about an OpenSearch Service package.

        @[JSON::Field(key: "PackageDetails")]
        getter package_details : Types::PackageDetails?

        def initialize(
          @package_details : Types::PackageDetails? = nil
        )
        end
      end


      struct CreateVpcEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain to create the endpoint for.

        @[JSON::Field(key: "DomainArn")]
        getter domain_arn : String

        # Options to specify the subnets and security groups for the endpoint.

        @[JSON::Field(key: "VpcOptions")]
        getter vpc_options : Types::VPCOptions

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @domain_arn : String,
          @vpc_options : Types::VPCOptions,
          @client_token : String? = nil
        )
        end
      end


      struct CreateVpcEndpointResponse
        include JSON::Serializable

        # Information about the newly created VPC endpoint.

        @[JSON::Field(key: "VpcEndpoint")]
        getter vpc_endpoint : Types::VpcEndpoint

        def initialize(
          @vpc_endpoint : Types::VpcEndpoint
        )
        end
      end

      # Cross-cluster search specific connection properties.

      struct CrossClusterSearchConnectionProperties
        include JSON::Serializable

        # The status of the SkipUnavailable setting for the outbound connection. This feature allows you to
        # specify some clusters as optional and ensure that your cross-cluster queries return partial results
        # despite failures on one or more remote clusters.

        @[JSON::Field(key: "SkipUnavailable")]
        getter skip_unavailable : String?

        def initialize(
          @skip_unavailable : String? = nil
        )
        end
      end

      # Data sources that are associated with an OpenSearch application.

      struct DataSource
        include JSON::Serializable


        @[JSON::Field(key: "dataSourceArn")]
        getter data_source_arn : String?

        # Detailed description of a data source.

        @[JSON::Field(key: "dataSourceDescription")]
        getter data_source_description : String?

        def initialize(
          @data_source_arn : String? = nil,
          @data_source_description : String? = nil
        )
        end
      end

      # Details about a direct-query data source.

      struct DataSourceDetails
        include JSON::Serializable

        # The type of data source.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DataSourceType?

        # A description of the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the data source.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the data source.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @data_source_type : Types::DataSourceType? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The type of data source.

      struct DataSourceType
        include JSON::Serializable

        # An Amazon S3 data source.

        @[JSON::Field(key: "S3GlueDataCatalog")]
        getter s3_glue_data_catalog : Types::S3GlueDataCatalog?

        def initialize(
          @s3_glue_data_catalog : Types::S3GlueDataCatalog? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The unique identifier of the OpenSearch application to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Container for the parameters to the DeleteDataSource operation.

      struct DeleteDataSourceRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the data source to delete.

        @[JSON::Field(key: "DataSourceName")]
        getter name : String

        def initialize(
          @domain_name : String,
          @name : String
        )
        end
      end

      # The result of a GetDataSource operation.

      struct DeleteDataSourceResponse
        include JSON::Serializable

        # A message associated with deletion of the data source.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteDirectQueryDataSourceRequest
        include JSON::Serializable

        # A unique, user-defined label to identify the data source within your OpenSearch Service environment.

        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String

        def initialize(
          @data_source_name : String
        )
        end
      end

      # Container for the parameters to the DeleteDomain operation.

      struct DeleteDomainRequest
        include JSON::Serializable

        # The name of the domain you want to permanently delete.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The results of a DeleteDomain request. Contains the status of the pending deletion, or a "domain not
      # found" error if the domain and all of its resources have been deleted.

      struct DeleteDomainResponse
        include JSON::Serializable

        # The status of the domain being deleted.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::DomainStatus?

        def initialize(
          @domain_status : Types::DomainStatus? = nil
        )
        end
      end

      # Container for the parameters to the DeleteInboundConnection operation.

      struct DeleteInboundConnectionRequest
        include JSON::Serializable

        # The ID of the inbound connection to permanently delete.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end

      # The results of a DeleteInboundConnection operation. Contains details about the deleted inbound
      # connection.

      struct DeleteInboundConnectionResponse
        include JSON::Serializable

        # The deleted inbound connection.

        @[JSON::Field(key: "Connection")]
        getter connection : Types::InboundConnection?

        def initialize(
          @connection : Types::InboundConnection? = nil
        )
        end
      end


      struct DeleteIndexRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the index to delete.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        def initialize(
          @domain_name : String,
          @index_name : String
        )
        end
      end


      struct DeleteIndexResponse
        include JSON::Serializable

        # The status of the index deletion operation.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Container for the parameters to the DeleteOutboundConnection operation.

      struct DeleteOutboundConnectionRequest
        include JSON::Serializable

        # The ID of the outbound connection you want to permanently delete.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end

      # Details about the deleted outbound connection.

      struct DeleteOutboundConnectionResponse
        include JSON::Serializable

        # The deleted inbound connection.

        @[JSON::Field(key: "Connection")]
        getter connection : Types::OutboundConnection?

        def initialize(
          @connection : Types::OutboundConnection? = nil
        )
        end
      end

      # Deletes a package from OpenSearch Service. The package can't be associated with any OpenSearch
      # Service domain.

      struct DeletePackageRequest
        include JSON::Serializable

        # The internal ID of the package you want to delete. Use DescribePackages to find this value.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        def initialize(
          @package_id : String
        )
        end
      end

      # Container for the response parameters to the DeletePackage operation.

      struct DeletePackageResponse
        include JSON::Serializable

        # Information about the deleted package.

        @[JSON::Field(key: "PackageDetails")]
        getter package_details : Types::PackageDetails?

        def initialize(
          @package_details : Types::PackageDetails? = nil
        )
        end
      end


      struct DeleteVpcEndpointRequest
        include JSON::Serializable

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String

        def initialize(
          @vpc_endpoint_id : String
        )
        end
      end


      struct DeleteVpcEndpointResponse
        include JSON::Serializable

        # Information about the deleted endpoint, including its current status ( DELETING or DELETE_FAILED ).

        @[JSON::Field(key: "VpcEndpointSummary")]
        getter vpc_endpoint_summary : Types::VpcEndpointSummary

        def initialize(
          @vpc_endpoint_summary : Types::VpcEndpointSummary
        )
        end
      end

      # An exception for when a failure in one of the dependencies results in the service being unable to
      # fetch details about the resource.

      struct DependencyFailureException
        include JSON::Serializable

        def initialize
        end
      end

      # Container for the parameters to the DescribeDomainAutoTunes operation.

      struct DescribeDomainAutoTunesRequest
        include JSON::Serializable

        # Name of the domain that you want Auto-Tune details about.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your initial DescribeDomainAutoTunes operation returns a nextToken , you can include the returned
        # nextToken in subsequent DescribeDomainAutoTunes operations, which returns results in the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a DescribeDomainAutoTunes request.

      struct DescribeDomainAutoTunesResponse
        include JSON::Serializable

        # The list of setting adjustments that Auto-Tune has made to the domain.

        @[JSON::Field(key: "AutoTunes")]
        getter auto_tunes : Array(Types::AutoTune)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_tunes : Array(Types::AutoTune)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the DescribeDomainChangeProgress operation.

      struct DescribeDomainChangeProgressRequest
        include JSON::Serializable

        # The name of the domain to get progress information for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The specific change ID for which you want to get progress information. If omitted, the request
        # returns information about the most recent configuration change.

        @[JSON::Field(key: "changeid")]
        getter change_id : String?

        def initialize(
          @domain_name : String,
          @change_id : String? = nil
        )
        end
      end

      # The result of a DescribeDomainChangeProgress request. Contains progress information for the
      # requested domain change.

      struct DescribeDomainChangeProgressResponse
        include JSON::Serializable

        # Container for information about the stages of a configuration change happening on a domain.

        @[JSON::Field(key: "ChangeProgressStatus")]
        getter change_progress_status : Types::ChangeProgressStatusDetails?

        def initialize(
          @change_progress_status : Types::ChangeProgressStatusDetails? = nil
        )
        end
      end

      # Container for the parameters to the DescribeDomainConfig operation.

      struct DescribeDomainConfigRequest
        include JSON::Serializable

        # Name of the OpenSearch Service domain configuration that you want to describe.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # Contains the configuration information of the requested domain.

      struct DescribeDomainConfigResponse
        include JSON::Serializable

        # Container for the configuration of the OpenSearch Service domain.

        @[JSON::Field(key: "DomainConfig")]
        getter domain_config : Types::DomainConfig

        def initialize(
          @domain_config : Types::DomainConfig
        )
        end
      end

      # Container for the parameters to the DescribeDomainHealth operation.

      struct DescribeDomainHealthRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a DescribeDomainHealth request. Contains health information for the requested domain.

      struct DescribeDomainHealthResponse
        include JSON::Serializable

        # The number of active Availability Zones configured for the domain. If the service is unable to fetch
        # this information, it will return NotAvailable .

        @[JSON::Field(key: "ActiveAvailabilityZoneCount")]
        getter active_availability_zone_count : String?

        # The number of Availability Zones configured for the domain. If the service is unable to fetch this
        # information, it will return NotAvailable .

        @[JSON::Field(key: "AvailabilityZoneCount")]
        getter availability_zone_count : String?

        # The current health status of your cluster. Red - At least one primary shard is not allocated to any
        # node. Yellow - All primary shards are allocated to nodes, but some replicas aren’t. Green - All
        # primary shards and their replicas are allocated to nodes. NotAvailable - Unable to retrieve cluster
        # health.

        @[JSON::Field(key: "ClusterHealth")]
        getter cluster_health : String?

        # The number of data nodes configured for the domain. If the service is unable to fetch this
        # information, it will return NotAvailable .

        @[JSON::Field(key: "DataNodeCount")]
        getter data_node_count : String?

        # A boolean that indicates if dedicated master nodes are activated for the domain.

        @[JSON::Field(key: "DedicatedMaster")]
        getter dedicated_master : Bool?

        # The current state of the domain. Processing - The domain has updates in progress. Active - Requested
        # changes have been processed and deployed to the domain.

        @[JSON::Field(key: "DomainState")]
        getter domain_state : String?

        # A list of EnvironmentInfo for the domain.

        @[JSON::Field(key: "EnvironmentInformation")]
        getter environment_information : Array(Types::EnvironmentInfo)?

        # The number of nodes that can be elected as a master node. If dedicated master nodes is turned on,
        # this value is the number of dedicated master nodes configured for the domain. If the service is
        # unable to fetch this information, it will return NotAvailable .

        @[JSON::Field(key: "MasterEligibleNodeCount")]
        getter master_eligible_node_count : String?

        # Indicates whether the domain has an elected master node. Available - The domain has an elected
        # master node. UnAvailable - The master node hasn't yet been elected, and a quorum to elect a new
        # master node hasn't been reached.

        @[JSON::Field(key: "MasterNode")]
        getter master_node : String?

        # The number of standby Availability Zones configured for the domain. If the service is unable to
        # fetch this information, it will return NotAvailable .

        @[JSON::Field(key: "StandByAvailabilityZoneCount")]
        getter stand_by_availability_zone_count : String?

        # The total number of primary and replica shards for the domain.

        @[JSON::Field(key: "TotalShards")]
        getter total_shards : String?

        # The total number of primary and replica shards not allocated to any of the nodes for the cluster.

        @[JSON::Field(key: "TotalUnAssignedShards")]
        getter total_un_assigned_shards : String?

        # The number of warm nodes configured for the domain.

        @[JSON::Field(key: "WarmNodeCount")]
        getter warm_node_count : String?

        def initialize(
          @active_availability_zone_count : String? = nil,
          @availability_zone_count : String? = nil,
          @cluster_health : String? = nil,
          @data_node_count : String? = nil,
          @dedicated_master : Bool? = nil,
          @domain_state : String? = nil,
          @environment_information : Array(Types::EnvironmentInfo)? = nil,
          @master_eligible_node_count : String? = nil,
          @master_node : String? = nil,
          @stand_by_availability_zone_count : String? = nil,
          @total_shards : String? = nil,
          @total_un_assigned_shards : String? = nil,
          @warm_node_count : String? = nil
        )
        end
      end

      # Container for the parameters to the DescribeDomainNodes operation.

      struct DescribeDomainNodesRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a DescribeDomainNodes request. Contains information about the nodes on the requested
      # domain.

      struct DescribeDomainNodesResponse
        include JSON::Serializable

        # Contains nodes information list DomainNodesStatusList with details about the all nodes on the
        # requested domain.

        @[JSON::Field(key: "DomainNodesStatusList")]
        getter domain_nodes_status_list : Array(Types::DomainNodesStatus)?

        def initialize(
          @domain_nodes_status_list : Array(Types::DomainNodesStatus)? = nil
        )
        end
      end

      # Container for the parameters to the DescribeDomain operation.

      struct DescribeDomainRequest
        include JSON::Serializable

        # The name of the domain that you want information about.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # Contains the status of the domain specified in the request.

      struct DescribeDomainResponse
        include JSON::Serializable

        # List that contains the status of each specified OpenSearch Service domain.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::DomainStatus

        def initialize(
          @domain_status : Types::DomainStatus
        )
        end
      end

      # Container for the parameters to the DescribeDomains operation.

      struct DescribeDomainsRequest
        include JSON::Serializable

        # Array of OpenSearch Service domain names that you want information about. You must specify at least
        # one domain name.

        @[JSON::Field(key: "DomainNames")]
        getter domain_names : Array(String)

        def initialize(
          @domain_names : Array(String)
        )
        end
      end

      # Contains the status of the specified domains or all domains owned by the account.

      struct DescribeDomainsResponse
        include JSON::Serializable

        # The status of the requested domains.

        @[JSON::Field(key: "DomainStatusList")]
        getter domain_status_list : Array(Types::DomainStatus)

        def initialize(
          @domain_status_list : Array(Types::DomainStatus)
        )
        end
      end


      struct DescribeDryRunProgressRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the dry run.

        @[JSON::Field(key: "dryRunId")]
        getter dry_run_id : String?

        # Whether to include the configuration of the dry run in the response. The configuration specifies the
        # updates that you're planning to make on the domain.

        @[JSON::Field(key: "loadDryRunConfig")]
        getter load_dry_run_config : Bool?

        def initialize(
          @domain_name : String,
          @dry_run_id : String? = nil,
          @load_dry_run_config : Bool? = nil
        )
        end
      end


      struct DescribeDryRunProgressResponse
        include JSON::Serializable

        # Details about the changes you're planning to make on the domain.

        @[JSON::Field(key: "DryRunConfig")]
        getter dry_run_config : Types::DomainStatus?

        # The current status of the dry run, including any validation errors.

        @[JSON::Field(key: "DryRunProgressStatus")]
        getter dry_run_progress_status : Types::DryRunProgressStatus?

        # The results of the dry run.

        @[JSON::Field(key: "DryRunResults")]
        getter dry_run_results : Types::DryRunResults?

        def initialize(
          @dry_run_config : Types::DomainStatus? = nil,
          @dry_run_progress_status : Types::DryRunProgressStatus? = nil,
          @dry_run_results : Types::DryRunResults? = nil
        )
        end
      end

      # Container for the parameters to the DescribeInboundConnections operation.

      struct DescribeInboundConnectionsRequest
        include JSON::Serializable

        # A list of filters used to match properties for inbound cross-cluster connections.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your initial DescribeInboundConnections operation returns a nextToken , you can include the
        # returned nextToken in subsequent DescribeInboundConnections operations, which returns results in the
        # next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains a list of connections matching the filter criteria.

      struct DescribeInboundConnectionsResponse
        include JSON::Serializable

        # List of inbound connections.

        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::InboundConnection)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connections : Array(Types::InboundConnection)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the DescribeInstanceTypeLimits operation.

      struct DescribeInstanceTypeLimitsRequest
        include JSON::Serializable

        # Version of OpenSearch or Elasticsearch, in the format Elasticsearch_X.Y or OpenSearch_X.Y. Defaults
        # to the latest version of OpenSearch.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String

        # The OpenSearch Service instance type for which you need limit information.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # The name of the domain. Only specify if you need the limits for an existing domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @engine_version : String,
          @instance_type : String,
          @domain_name : String? = nil
        )
        end
      end

      # Container for the parameters received from the DescribeInstanceTypeLimits operation.

      struct DescribeInstanceTypeLimitsResponse
        include JSON::Serializable

        # Map that contains all applicable instance type limits. data refers to data nodes. master refers to
        # dedicated master nodes.

        @[JSON::Field(key: "LimitsByRole")]
        getter limits_by_role : Hash(String, Types::Limits)?

        def initialize(
          @limits_by_role : Hash(String, Types::Limits)? = nil
        )
        end
      end

      # Container for the parameters to the DescribeOutboundConnections operation.

      struct DescribeOutboundConnectionsRequest
        include JSON::Serializable

        # List of filter names and values that you can use for requests.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your initial DescribeOutboundConnections operation returns a nextToken , you can include the
        # returned nextToken in subsequent DescribeOutboundConnections operations, which returns results in
        # the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains a list of connections matching the filter criteria.

      struct DescribeOutboundConnectionsResponse
        include JSON::Serializable

        # List of outbound connections that match the filter criteria.

        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::OutboundConnection)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connections : Array(Types::OutboundConnection)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A filter to apply to the DescribePackage response.

      struct DescribePackagesFilter
        include JSON::Serializable

        # Any field from PackageDetails .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A non-empty list of values for the specified filter field.

        @[JSON::Field(key: "Value")]
        getter value : Array(String)?

        def initialize(
          @name : String? = nil,
          @value : Array(String)? = nil
        )
        end
      end

      # Container for the request parameters to the DescribePackage operation.

      struct DescribePackagesRequest
        include JSON::Serializable

        # Only returns packages that match the DescribePackagesFilterList values.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DescribePackagesFilter)?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If your initial DescribePackageFilters operation returns a nextToken , you can include the returned
        # nextToken in subsequent DescribePackageFilters operations, which returns results in the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::DescribePackagesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the response returned by the DescribePackages operation.

      struct DescribePackagesResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Basic information about a package.

        @[JSON::Field(key: "PackageDetailsList")]
        getter package_details_list : Array(Types::PackageDetails)?

        def initialize(
          @next_token : String? = nil,
          @package_details_list : Array(Types::PackageDetails)? = nil
        )
        end
      end

      # Container for the request parameters to a DescribeReservedInstanceOfferings operation.

      struct DescribeReservedInstanceOfferingsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial DescribeReservedInstanceOfferings operation returns a nextToken , you can include
        # the returned nextToken in subsequent DescribeReservedInstanceOfferings operations, which returns
        # results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Reserved Instance identifier filter value. Use this parameter to show only the available
        # instance types that match the specified reservation identifier.

        @[JSON::Field(key: "offeringId")]
        getter reserved_instance_offering_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reserved_instance_offering_id : String? = nil
        )
        end
      end

      # Container for results of a DescribeReservedInstanceOfferings request.

      struct DescribeReservedInstanceOfferingsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of Reserved Instance offerings.

        @[JSON::Field(key: "ReservedInstanceOfferings")]
        getter reserved_instance_offerings : Array(Types::ReservedInstanceOffering)?

        def initialize(
          @next_token : String? = nil,
          @reserved_instance_offerings : Array(Types::ReservedInstanceOffering)? = nil
        )
        end
      end

      # Container for the request parameters to the DescribeReservedInstances operation.

      struct DescribeReservedInstancesRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial DescribeReservedInstances operation returns a nextToken , you can include the
        # returned nextToken in subsequent DescribeReservedInstances operations, which returns results in the
        # next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The reserved instance identifier filter value. Use this parameter to show only the reservation that
        # matches the specified reserved OpenSearch instance ID.

        @[JSON::Field(key: "reservationId")]
        getter reserved_instance_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reserved_instance_id : String? = nil
        )
        end
      end

      # Container for results from DescribeReservedInstances

      struct DescribeReservedInstancesResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of Reserved Instances in the current Region.

        @[JSON::Field(key: "ReservedInstances")]
        getter reserved_instances : Array(Types::ReservedInstance)?

        def initialize(
          @next_token : String? = nil,
          @reserved_instances : Array(Types::ReservedInstance)? = nil
        )
        end
      end


      struct DescribeVpcEndpointsRequest
        include JSON::Serializable

        # The unique identifiers of the endpoints to get information about.

        @[JSON::Field(key: "VpcEndpointIds")]
        getter vpc_endpoint_ids : Array(String)

        def initialize(
          @vpc_endpoint_ids : Array(String)
        )
        end
      end


      struct DescribeVpcEndpointsResponse
        include JSON::Serializable

        # Any errors associated with the request.

        @[JSON::Field(key: "VpcEndpointErrors")]
        getter vpc_endpoint_errors : Array(Types::VpcEndpointError)

        # Information about each requested VPC endpoint.

        @[JSON::Field(key: "VpcEndpoints")]
        getter vpc_endpoints : Array(Types::VpcEndpoint)

        def initialize(
          @vpc_endpoint_errors : Array(Types::VpcEndpointError),
          @vpc_endpoints : Array(Types::VpcEndpoint)
        )
        end
      end

      # The configuration details for a data source that can be directly queried.

      struct DirectQueryDataSource
        include JSON::Serializable

        # The unique, system-generated identifier that represents the data source.

        @[JSON::Field(key: "DataSourceArn")]
        getter data_source_arn : String?

        # A unique, user-defined label to identify the data source within your OpenSearch Service environment.

        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String?

        # The supported Amazon Web Services service that is used as the source for direct queries in
        # OpenSearch Service.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DirectQueryDataSourceType?

        # A description that provides additional context and details about the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of Amazon Resource Names (ARNs) for the OpenSearch collections that are associated with the
        # direct query data source.

        @[JSON::Field(key: "OpenSearchArns")]
        getter open_search_arns : Array(String)?

        # A list of tags attached to a direct query data source.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @data_source_arn : String? = nil,
          @data_source_name : String? = nil,
          @data_source_type : Types::DirectQueryDataSourceType? = nil,
          @description : String? = nil,
          @open_search_arns : Array(String)? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # The type of data source that is used for direct queries. This is a supported Amazon Web Services
      # service, such as CloudWatch Logs or Security Lake.

      struct DirectQueryDataSourceType
        include JSON::Serializable

        # Specifies CloudWatch Logs as a type of data source for direct queries.

        @[JSON::Field(key: "CloudWatchLog")]
        getter cloud_watch_log : Types::CloudWatchDirectQueryDataSource?

        # Specifies Security Lake as a type of data source for direct queries.

        @[JSON::Field(key: "SecurityLake")]
        getter security_lake : Types::SecurityLakeDirectQueryDataSource?

        def initialize(
          @cloud_watch_log : Types::CloudWatchDirectQueryDataSource? = nil,
          @security_lake : Types::SecurityLakeDirectQueryDataSource? = nil
        )
        end
      end

      # An error occured because the client wanted to access an unsupported operation.

      struct DisabledOperationException
        include JSON::Serializable

        def initialize
        end
      end

      # Container for the request parameters to the DissociatePackage operation.

      struct DissociatePackageRequest
        include JSON::Serializable

        # Name of the domain to dissociate the package from.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Internal ID of the package to dissociate from the domain. Use ListPackagesForDomain to find this
        # value.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        def initialize(
          @domain_name : String,
          @package_id : String
        )
        end
      end

      # Container for the response returned by an DissociatePackage operation.

      struct DissociatePackageResponse
        include JSON::Serializable

        # Information about a package that has been dissociated from the domain.

        @[JSON::Field(key: "DomainPackageDetails")]
        getter domain_package_details : Types::DomainPackageDetails?

        def initialize(
          @domain_package_details : Types::DomainPackageDetails? = nil
        )
        end
      end


      struct DissociatePackagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of package IDs to be dissociated from a domain.

        @[JSON::Field(key: "PackageList")]
        getter package_list : Array(String)

        def initialize(
          @domain_name : String,
          @package_list : Array(String)
        )
        end
      end


      struct DissociatePackagesResponse
        include JSON::Serializable

        # A list of package details for the packages that were dissociated from the domain.

        @[JSON::Field(key: "DomainPackageDetailsList")]
        getter domain_package_details_list : Array(Types::DomainPackageDetails)?

        def initialize(
          @domain_package_details_list : Array(Types::DomainPackageDetails)? = nil
        )
        end
      end

      # Container for the configuration of an OpenSearch Service domain.

      struct DomainConfig
        include JSON::Serializable

        # Container for parameters required to enable all machine learning features.

        @[JSON::Field(key: "AIMLOptions")]
        getter aiml_options : Types::AIMLOptionsStatus?

        # Specifies the access policies for the domain.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : Types::AccessPoliciesStatus?

        # Key-value pairs to specify advanced configuration options. For more information, see Advanced
        # options .

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Types::AdvancedOptionsStatus?

        # Container for fine-grained access control settings for the domain.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptionsStatus?

        # Container for Auto-Tune settings for the domain.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptionsStatus?

        # Container for information about the progress of an existing configuration change.

        @[JSON::Field(key: "ChangeProgressDetails")]
        getter change_progress_details : Types::ChangeProgressDetails?

        # Container for the cluster configuration of a the domain.

        @[JSON::Field(key: "ClusterConfig")]
        getter cluster_config : Types::ClusterConfigStatus?

        # Container for Amazon Cognito options for the domain.

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptionsStatus?

        # Additional options for the domain endpoint, such as whether to require HTTPS for all traffic.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptionsStatus?

        # Container for EBS options configured for the domain.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptionsStatus?

        # Key-value pairs to enable encryption at rest.

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptionsStatus?

        # The OpenSearch or Elasticsearch version that the domain is running.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Types::VersionStatus?

        # Choose either dual stack or IPv4 as your IP address type. Dual stack allows you to share domain
        # resources across IPv4 and IPv6 address types, and is the recommended option. If you set your IP
        # address type to dual stack, you can't change your address type later.

        @[JSON::Field(key: "IPAddressType")]
        getter ip_address_type : Types::IPAddressTypeStatus?

        # Configuration options for enabling and managing IAM Identity Center integration within a domain.

        @[JSON::Field(key: "IdentityCenterOptions")]
        getter identity_center_options : Types::IdentityCenterOptionsStatus?

        # Key-value pairs to configure log publishing.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Types::LogPublishingOptionsStatus?

        # Information about the domain properties that are currently being modified.

        @[JSON::Field(key: "ModifyingProperties")]
        getter modifying_properties : Array(Types::ModifyingProperties)?

        # Whether node-to-node encryption is enabled or disabled.

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptionsStatus?

        # Container for off-peak window options for the domain.

        @[JSON::Field(key: "OffPeakWindowOptions")]
        getter off_peak_window_options : Types::OffPeakWindowOptionsStatus?

        # DEPRECATED. Container for parameters required to configure automated snapshots of domain indexes.

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptionsStatus?

        # Software update options for the domain.

        @[JSON::Field(key: "SoftwareUpdateOptions")]
        getter software_update_options : Types::SoftwareUpdateOptionsStatus?

        # The current VPC options for the domain and the status of any updates to their configuration.

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCDerivedInfoStatus?

        def initialize(
          @aiml_options : Types::AIMLOptionsStatus? = nil,
          @access_policies : Types::AccessPoliciesStatus? = nil,
          @advanced_options : Types::AdvancedOptionsStatus? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptionsStatus? = nil,
          @auto_tune_options : Types::AutoTuneOptionsStatus? = nil,
          @change_progress_details : Types::ChangeProgressDetails? = nil,
          @cluster_config : Types::ClusterConfigStatus? = nil,
          @cognito_options : Types::CognitoOptionsStatus? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptionsStatus? = nil,
          @ebs_options : Types::EBSOptionsStatus? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptionsStatus? = nil,
          @engine_version : Types::VersionStatus? = nil,
          @ip_address_type : Types::IPAddressTypeStatus? = nil,
          @identity_center_options : Types::IdentityCenterOptionsStatus? = nil,
          @log_publishing_options : Types::LogPublishingOptionsStatus? = nil,
          @modifying_properties : Array(Types::ModifyingProperties)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptionsStatus? = nil,
          @off_peak_window_options : Types::OffPeakWindowOptionsStatus? = nil,
          @snapshot_options : Types::SnapshotOptionsStatus? = nil,
          @software_update_options : Types::SoftwareUpdateOptionsStatus? = nil,
          @vpc_options : Types::VPCDerivedInfoStatus? = nil
        )
        end
      end

      # Options to configure a custom endpoint for an OpenSearch Service domain.

      struct DomainEndpointOptions
        include JSON::Serializable

        # The fully qualified URL for the custom endpoint.

        @[JSON::Field(key: "CustomEndpoint")]
        getter custom_endpoint : String?

        # The ARN for your security certificate, managed in Amazon Web Services Certificate Manager (ACM).

        @[JSON::Field(key: "CustomEndpointCertificateArn")]
        getter custom_endpoint_certificate_arn : String?

        # Whether to enable a custom endpoint for the domain.

        @[JSON::Field(key: "CustomEndpointEnabled")]
        getter custom_endpoint_enabled : Bool?

        # True to require that all traffic to the domain arrive over HTTPS.

        @[JSON::Field(key: "EnforceHTTPS")]
        getter enforce_https : Bool?

        # Specify the TLS security policy to apply to the HTTPS endpoint of the domain. The policy can be one
        # of the following values: Policy-Min-TLS-1-0-2019-07: TLS security policy that supports TLS version
        # 1.0 to TLS version 1.2 Policy-Min-TLS-1-2-2019-07: TLS security policy that supports only TLS
        # version 1.2 Policy-Min-TLS-1-2-PFS-2023-10: TLS security policy that supports TLS version 1.2 to TLS
        # version 1.3 with perfect forward secrecy cipher suites

        @[JSON::Field(key: "TLSSecurityPolicy")]
        getter tls_security_policy : String?

        def initialize(
          @custom_endpoint : String? = nil,
          @custom_endpoint_certificate_arn : String? = nil,
          @custom_endpoint_enabled : Bool? = nil,
          @enforce_https : Bool? = nil,
          @tls_security_policy : String? = nil
        )
        end
      end

      # The configured endpoint options for a domain and their current status.

      struct DomainEndpointOptionsStatus
        include JSON::Serializable

        # Options to configure the endpoint for a domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::DomainEndpointOptions

        # The status of the endpoint options for a domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::DomainEndpointOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Information about an OpenSearch Service domain.

      struct DomainInfo
        include JSON::Serializable

        # Name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The type of search engine that the domain is running. OpenSearch for an OpenSearch engine, or
        # Elasticsearch for a legacy Elasticsearch OSS engine.

        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        def initialize(
          @domain_name : String? = nil,
          @engine_type : String? = nil
        )
        end
      end

      # Container for information about an OpenSearch Service domain.

      struct DomainInformationContainer
        include JSON::Serializable

        # Information about an Amazon OpenSearch Service domain.

        @[JSON::Field(key: "AWSDomainInformation")]
        getter aws_domain_information : Types::AWSDomainInformation?

        def initialize(
          @aws_domain_information : Types::AWSDomainInformation? = nil
        )
        end
      end

      # Container for the domain maintenance details.

      struct DomainMaintenanceDetails
        include JSON::Serializable

        # The name of the action.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The time at which the action was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The ID of the requested action.

        @[JSON::Field(key: "MaintenanceId")]
        getter maintenance_id : String?

        # The ID of the data node.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        # The status of the action.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message for the action.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The time at which the action was updated.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : String? = nil,
          @created_at : Time? = nil,
          @domain_name : String? = nil,
          @maintenance_id : String? = nil,
          @node_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Container for information about nodes on the domain.

      struct DomainNodesStatus
        include JSON::Serializable

        # The Availability Zone of the node.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The instance type information of the node.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The ID of the node.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        # Indicates if the node is active or in standby.

        @[JSON::Field(key: "NodeStatus")]
        getter node_status : String?

        # Indicates whether the nodes is a data, master, or UltraWarm node.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The storage size of the node, in GiB.

        @[JSON::Field(key: "StorageSize")]
        getter storage_size : String?

        # Indicates if the node has EBS or instance storage.

        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        # If the nodes has EBS storage, indicates if the volume type is gp2 or gp3. Only applicable for data
        # nodes.

        @[JSON::Field(key: "StorageVolumeType")]
        getter storage_volume_type : String?

        def initialize(
          @availability_zone : String? = nil,
          @instance_type : String? = nil,
          @node_id : String? = nil,
          @node_status : String? = nil,
          @node_type : String? = nil,
          @storage_size : String? = nil,
          @storage_type : String? = nil,
          @storage_volume_type : String? = nil
        )
        end
      end

      # Information about a package that is associated with a domain. For more information, see Custom
      # packages for Amazon OpenSearch Service .

      struct DomainPackageDetails
        include JSON::Serializable

        # The configuration for associating a package with an Amazon OpenSearch Service domain.

        @[JSON::Field(key: "AssociationConfiguration")]
        getter association_configuration : Types::PackageAssociationConfiguration?

        # Name of the domain that the package is associated with.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # State of the association.

        @[JSON::Field(key: "DomainPackageStatus")]
        getter domain_package_status : String?

        # Additional information if the package is in an error state. Null otherwise.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::ErrorDetails?

        # Timestamp of the most recent update to the package association status.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # Internal ID of the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String?

        # User-specified name of the package.

        @[JSON::Field(key: "PackageName")]
        getter package_name : String?

        # The type of package.

        @[JSON::Field(key: "PackageType")]
        getter package_type : String?

        # The current version of the package.

        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String?

        # A list of package IDs that must be associated with the domain before or with the package can be
        # associated.

        @[JSON::Field(key: "PrerequisitePackageIDList")]
        getter prerequisite_package_id_list : Array(String)?

        # The relative path of the package on the OpenSearch Service cluster nodes. This is synonym_path when
        # the package is for synonym files.

        @[JSON::Field(key: "ReferencePath")]
        getter reference_path : String?

        def initialize(
          @association_configuration : Types::PackageAssociationConfiguration? = nil,
          @domain_name : String? = nil,
          @domain_package_status : String? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @last_updated : Time? = nil,
          @package_id : String? = nil,
          @package_name : String? = nil,
          @package_type : String? = nil,
          @package_version : String? = nil,
          @prerequisite_package_id_list : Array(String)? = nil,
          @reference_path : String? = nil
        )
        end
      end

      # The current status of an OpenSearch Service domain.

      struct DomainStatus
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain. For more information, see IAM identifiers in the
        # Amazon Web Services Identity and Access Management User Guide .

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # Container for the cluster configuration of the domain.

        @[JSON::Field(key: "ClusterConfig")]
        getter cluster_config : Types::ClusterConfig

        # Unique identifier for the domain.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # Name of the domain. Domain names are unique across all domains owned by the same account within an
        # Amazon Web Services Region.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Container for parameters required to enable all machine learning features.

        @[JSON::Field(key: "AIMLOptions")]
        getter aiml_options : Types::AIMLOptionsOutput?

        # Identity and Access Management (IAM) policy document specifying the access policies for the domain.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : String?

        # Key-value pairs that specify advanced configuration options.

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # Settings for fine-grained access control.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptions?

        # Auto-Tune settings for the domain.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptionsOutput?

        # Information about a configuration change happening on the domain.

        @[JSON::Field(key: "ChangeProgressDetails")]
        getter change_progress_details : Types::ChangeProgressDetails?

        # Key-value pairs to configure Amazon Cognito authentication for OpenSearch Dashboards.

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptions?

        # Creation status of an OpenSearch Service domain. True if domain creation is complete. False if
        # domain creation is still in progress.

        @[JSON::Field(key: "Created")]
        getter created : Bool?

        # Deletion status of an OpenSearch Service domain. True if domain deletion is complete. False if
        # domain deletion is still in progress. Once deletion is complete, the status of the domain is no
        # longer returned.

        @[JSON::Field(key: "Deleted")]
        getter deleted : Bool?

        # Additional options for the domain endpoint, such as whether to require HTTPS for all traffic.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptions?

        # The dual stack hosted zone ID for the domain.

        @[JSON::Field(key: "DomainEndpointV2HostedZoneId")]
        getter domain_endpoint_v2_hosted_zone_id : String?

        # The status of any changes that are currently in progress for the domain.

        @[JSON::Field(key: "DomainProcessingStatus")]
        getter domain_processing_status : String?

        # Container for EBS-based storage settings for the domain.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptions?

        # Encryption at rest settings for the domain.

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # Domain-specific endpoint used to submit index, search, and data upload requests to the domain.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # If IPAddressType to set to dualstack , a version 2 domain endpoint is provisioned. This endpoint
        # functions like a normal endpoint, except that it works with both IPv4 and IPv6 IP addresses. Normal
        # endpoints work only with IPv4 IP addresses.

        @[JSON::Field(key: "EndpointV2")]
        getter endpoint_v2 : String?

        # The key-value pair that exists if the OpenSearch Service domain uses VPC endpoints. For example:
        # IPv4 IP addresses - 'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com'
        # Dual stack IP addresses - 'vpcv2':'vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.aos.us-east-1.on.aws'

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Hash(String, String)?

        # Version of OpenSearch or Elasticsearch that the domain is running, in the format Elasticsearch_X.Y
        # or OpenSearch_X.Y .

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The type of IP addresses supported by the endpoint for the domain.

        @[JSON::Field(key: "IPAddressType")]
        getter ip_address_type : String?

        # Configuration options for controlling IAM Identity Center integration within a domain.

        @[JSON::Field(key: "IdentityCenterOptions")]
        getter identity_center_options : Types::IdentityCenterOptions?

        # Log publishing options for the domain.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Hash(String, Types::LogPublishingOption)?

        # Information about the domain properties that are currently being modified.

        @[JSON::Field(key: "ModifyingProperties")]
        getter modifying_properties : Array(Types::ModifyingProperties)?

        # Whether node-to-node encryption is enabled or disabled.

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions?

        # Options that specify a custom 10-hour window during which OpenSearch Service can perform
        # configuration changes on the domain.

        @[JSON::Field(key: "OffPeakWindowOptions")]
        getter off_peak_window_options : Types::OffPeakWindowOptions?

        # The status of the domain configuration. True if OpenSearch Service is processing configuration
        # changes. False if the configuration is active.

        @[JSON::Field(key: "Processing")]
        getter processing : Bool?

        # The current status of the domain's service software.

        @[JSON::Field(key: "ServiceSoftwareOptions")]
        getter service_software_options : Types::ServiceSoftwareOptions?

        # DEPRECATED. Container for parameters required to configure automated snapshots of domain indexes.

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptions?

        # Service software update options for the domain.

        @[JSON::Field(key: "SoftwareUpdateOptions")]
        getter software_update_options : Types::SoftwareUpdateOptions?

        # The status of a domain version upgrade to a new version of OpenSearch or Elasticsearch. True if
        # OpenSearch Service is in the process of a version upgrade. False if the configuration is active.

        @[JSON::Field(key: "UpgradeProcessing")]
        getter upgrade_processing : Bool?

        # The VPC configuration for the domain.

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCDerivedInfo?

        def initialize(
          @arn : String,
          @cluster_config : Types::ClusterConfig,
          @domain_id : String,
          @domain_name : String,
          @aiml_options : Types::AIMLOptionsOutput? = nil,
          @access_policies : String? = nil,
          @advanced_options : Hash(String, String)? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptions? = nil,
          @auto_tune_options : Types::AutoTuneOptionsOutput? = nil,
          @change_progress_details : Types::ChangeProgressDetails? = nil,
          @cognito_options : Types::CognitoOptions? = nil,
          @created : Bool? = nil,
          @deleted : Bool? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptions? = nil,
          @domain_endpoint_v2_hosted_zone_id : String? = nil,
          @domain_processing_status : String? = nil,
          @ebs_options : Types::EBSOptions? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @endpoint : String? = nil,
          @endpoint_v2 : String? = nil,
          @endpoints : Hash(String, String)? = nil,
          @engine_version : String? = nil,
          @ip_address_type : String? = nil,
          @identity_center_options : Types::IdentityCenterOptions? = nil,
          @log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
          @modifying_properties : Array(Types::ModifyingProperties)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
          @off_peak_window_options : Types::OffPeakWindowOptions? = nil,
          @processing : Bool? = nil,
          @service_software_options : Types::ServiceSoftwareOptions? = nil,
          @snapshot_options : Types::SnapshotOptions? = nil,
          @software_update_options : Types::SoftwareUpdateOptions? = nil,
          @upgrade_processing : Bool? = nil,
          @vpc_options : Types::VPCDerivedInfo? = nil
        )
        end
      end

      # Information about the progress of a pre-upgrade dry run analysis.

      struct DryRunProgressStatus
        include JSON::Serializable

        # The timestamp when the dry run was initiated.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String

        # The unique identifier of the dry run.

        @[JSON::Field(key: "DryRunId")]
        getter dry_run_id : String

        # The current status of the dry run.

        @[JSON::Field(key: "DryRunStatus")]
        getter dry_run_status : String

        # The timestamp when the dry run was last updated.

        @[JSON::Field(key: "UpdateDate")]
        getter update_date : String

        # Any validation failures that occurred as a result of the dry run.

        @[JSON::Field(key: "ValidationFailures")]
        getter validation_failures : Array(Types::ValidationFailure)?

        def initialize(
          @creation_date : String,
          @dry_run_id : String,
          @dry_run_status : String,
          @update_date : String,
          @validation_failures : Array(Types::ValidationFailure)? = nil
        )
        end
      end

      # Results of a dry run performed in an update domain request.

      struct DryRunResults
        include JSON::Serializable

        # Specifies the way in which OpenSearch Service will apply an update. Possible values are: Blue/Green
        # - The update requires a blue/green deployment. DynamicUpdate - No blue/green deployment required
        # Undetermined - The domain is in the middle of an update and can't predict the deployment type. Try
        # again after the update is complete. None - The request doesn't include any configuration changes.

        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # A message corresponding to the deployment type.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @deployment_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The duration of a maintenance schedule. For more information, see Auto-Tune for Amazon OpenSearch
      # Service .

      struct Duration
        include JSON::Serializable

        # The unit of measurement for the duration of a maintenance schedule.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # Integer to specify the value of a maintenance schedule duration.

        @[JSON::Field(key: "Value")]
        getter value : Int64?

        def initialize(
          @unit : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # Container for the parameters required to enable EBS-based storage for an OpenSearch Service domain.

      struct EBSOptions
        include JSON::Serializable

        # Indicates whether EBS volumes are attached to data nodes in an OpenSearch Service domain.

        @[JSON::Field(key: "EBSEnabled")]
        getter ebs_enabled : Bool?

        # Specifies the baseline input/output (I/O) performance of EBS volumes attached to data nodes.
        # Applicable only for the gp3 and provisioned IOPS EBS volume types.

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # Specifies the throughput (in MiB/s) of the EBS volumes attached to data nodes. Applicable only for
        # the gp3 volume type.

        @[JSON::Field(key: "Throughput")]
        getter throughput : Int32?

        # Specifies the size (in GiB) of EBS volumes attached to data nodes.

        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int32?

        # Specifies the type of EBS volumes attached to data nodes.

        @[JSON::Field(key: "VolumeType")]
        getter volume_type : String?

        def initialize(
          @ebs_enabled : Bool? = nil,
          @iops : Int32? = nil,
          @throughput : Int32? = nil,
          @volume_size : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # The status of the EBS options for the specified OpenSearch Service domain.

      struct EBSOptionsStatus
        include JSON::Serializable

        # The configured EBS options for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::EBSOptions

        # The status of the EBS options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::EBSOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Specifies whether the domain should encrypt data at rest, and if so, the Key Management Service
      # (KMS) key to use. Can only be used when creating a new domain or enabling encryption at rest for the
      # first time on an existing domain. You can't modify this parameter after it's already been specified.

      struct EncryptionAtRestOptions
        include JSON::Serializable

        # True to enable encryption at rest.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The KMS key ID. Takes the form 1a2a3a4-1a2a-3a4a-5a6a-1a2a3a4a5a6a .

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @enabled : Bool? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      # Status of the encryption at rest options for the specified OpenSearch Service domain.

      struct EncryptionAtRestOptionsStatus
        include JSON::Serializable

        # Encryption at rest options for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::EncryptionAtRestOptions

        # The status of the encryption at rest options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::EncryptionAtRestOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Information about the active domain environment.

      struct EnvironmentInfo
        include JSON::Serializable

        # A list of AvailabilityZoneInfo for the domain.

        @[JSON::Field(key: "AvailabilityZoneInformation")]
        getter availability_zone_information : Array(Types::AvailabilityZoneInfo)?

        def initialize(
          @availability_zone_information : Array(Types::AvailabilityZoneInfo)? = nil
        )
        end
      end

      # Additional information if the package is in an error state. Null otherwise.

      struct ErrorDetails
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The type of error that occurred.

        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        def initialize(
          @error_message : String? = nil,
          @error_type : String? = nil
        )
        end
      end

      # A filter used to limit results when describing inbound or outbound cross-cluster connections. You
      # can specify multiple values per filter. A cross-cluster connection must match at least one of the
      # specified values for it to be returned from an operation.

      struct Filter
        include JSON::Serializable

        # The name of the filter.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # One or more values for the filter.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct GetApplicationRequest
        include JSON::Serializable

        # The unique identifier of the OpenSearch application to retrieve.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetApplicationResponse
        include JSON::Serializable

        # The configuration settings of the OpenSearch application.

        @[JSON::Field(key: "appConfigs")]
        getter app_configs : Array(Types::AppConfig)?


        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the OpenSearch application was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The data sources associated with the OpenSearch application.

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(Types::DataSource)?

        # The endpoint URL of the OpenSearch application.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The IAM Identity Center settings configured for the OpenSearch application.

        @[JSON::Field(key: "iamIdentityCenterOptions")]
        getter iam_identity_center_options : Types::IamIdentityCenterOptions?

        # The unique identifier of the OpenSearch application.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the application's data at rest.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The timestamp of the last update to the OpenSearch application.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the OpenSearch application.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the OpenSearch application. Possible values: CREATING , UPDATING , DELETING ,
        # FAILED , ACTIVE , and DELETED .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_configs : Array(Types::AppConfig)? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @data_sources : Array(Types::DataSource)? = nil,
          @endpoint : String? = nil,
          @iam_identity_center_options : Types::IamIdentityCenterOptions? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Container for the request parameters to GetCompatibleVersions operation.

      struct GetCompatibleVersionsRequest
        include JSON::Serializable

        # The name of an existing domain. Provide this parameter to limit the results to a single domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @domain_name : String? = nil
        )
        end
      end

      # Container for the response returned by the GetCompatibleVersions operation.

      struct GetCompatibleVersionsResponse
        include JSON::Serializable

        # A map of OpenSearch or Elasticsearch versions and the versions you can upgrade them to.

        @[JSON::Field(key: "CompatibleVersions")]
        getter compatible_versions : Array(Types::CompatibleVersionsMap)?

        def initialize(
          @compatible_versions : Array(Types::CompatibleVersionsMap)? = nil
        )
        end
      end

      # Container for the parameters to the GetDataSource operation.

      struct GetDataSourceRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the data source to get information about.

        @[JSON::Field(key: "DataSourceName")]
        getter name : String

        def initialize(
          @domain_name : String,
          @name : String
        )
        end
      end

      # The result of a GetDataSource operation.

      struct GetDataSourceResponse
        include JSON::Serializable

        # The type of data source.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DataSourceType?

        # A description of the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the data source.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the data source.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @data_source_type : Types::DataSourceType? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetDefaultApplicationSettingRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDefaultApplicationSettingResponse
        include JSON::Serializable


        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        def initialize(
          @application_arn : String? = nil
        )
        end
      end


      struct GetDirectQueryDataSourceRequest
        include JSON::Serializable

        # A unique, user-defined label that identifies the data source within your OpenSearch Service
        # environment.

        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String

        def initialize(
          @data_source_name : String
        )
        end
      end


      struct GetDirectQueryDataSourceResponse
        include JSON::Serializable

        # The unique, system-generated identifier that represents the data source.

        @[JSON::Field(key: "DataSourceArn")]
        getter data_source_arn : String?

        # A unique, user-defined label to identify the data source within your OpenSearch Service environment.

        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String?

        # The supported Amazon Web Services service that is used as the source for direct queries in
        # OpenSearch Service.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DirectQueryDataSourceType?

        # A description that provides additional context and details about the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of Amazon Resource Names (ARNs) for the OpenSearch collections that are associated with the
        # direct query data source.

        @[JSON::Field(key: "OpenSearchArns")]
        getter open_search_arns : Array(String)?

        def initialize(
          @data_source_arn : String? = nil,
          @data_source_name : String? = nil,
          @data_source_type : Types::DirectQueryDataSourceType? = nil,
          @description : String? = nil,
          @open_search_arns : Array(String)? = nil
        )
        end
      end

      # Container for the parameters to the GetDomainMaintenanceStatus operation.

      struct GetDomainMaintenanceStatusRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The request ID of the maintenance action.

        @[JSON::Field(key: "maintenanceId")]
        getter maintenance_id : String

        def initialize(
          @domain_name : String,
          @maintenance_id : String
        )
        end
      end

      # The result of a GetDomainMaintenanceStatus request that information about the requested action.

      struct GetDomainMaintenanceStatusResponse
        include JSON::Serializable

        # The action name.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The time at which the action was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The node ID of the maintenance action.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        # The status of the maintenance action.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message of the maintenance action.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The time at which the action was updated.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : String? = nil,
          @created_at : Time? = nil,
          @node_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetIndexRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the index to retrieve information about.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        def initialize(
          @domain_name : String,
          @index_name : String
        )
        end
      end


      struct GetIndexResponse
        include JSON::Serializable

        # The JSON schema of the index including mappings, settings, and semantic enrichment configuration.

        @[JSON::Field(key: "IndexSchema")]
        getter index_schema : Types::IndexSchema

        def initialize(
          @index_schema : Types::IndexSchema
        )
        end
      end

      # Container for the request parameters to the GetPackageVersionHistory operation.

      struct GetPackageVersionHistoryRequest
        include JSON::Serializable

        # The unique identifier of the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial GetPackageVersionHistory operation returns a nextToken , you can include the
        # returned nextToken in subsequent GetPackageVersionHistory operations, which returns results in the
        # next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @package_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for response returned by GetPackageVersionHistory operation.

      struct GetPackageVersionHistoryResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique identifier of the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String?

        # A list of package versions, along with their creation time and commit message.

        @[JSON::Field(key: "PackageVersionHistoryList")]
        getter package_version_history_list : Array(Types::PackageVersionHistory)?

        def initialize(
          @next_token : String? = nil,
          @package_id : String? = nil,
          @package_version_history_list : Array(Types::PackageVersionHistory)? = nil
        )
        end
      end

      # Container for the request parameters to the GetUpgradeHistory operation.

      struct GetUpgradeHistoryRequest
        include JSON::Serializable

        # The name of an existing domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial GetUpgradeHistory operation returns a nextToken , you can include the returned
        # nextToken in subsequent GetUpgradeHistory operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the response returned by the GetUpgradeHistory operation.

      struct GetUpgradeHistoryResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of objects corresponding to each upgrade or upgrade eligibility check performed on a domain.

        @[JSON::Field(key: "UpgradeHistories")]
        getter upgrade_histories : Array(Types::UpgradeHistory)?

        def initialize(
          @next_token : String? = nil,
          @upgrade_histories : Array(Types::UpgradeHistory)? = nil
        )
        end
      end

      # Container for the request parameters to the GetUpgradeStatus operation.

      struct GetUpgradeStatusRequest
        include JSON::Serializable

        # The domain of the domain to get upgrade status information for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # Container for the response returned by the GetUpgradeStatus operation.

      struct GetUpgradeStatusResponse
        include JSON::Serializable

        # The status of the current step that an upgrade is on.

        @[JSON::Field(key: "StepStatus")]
        getter step_status : String?

        # A string that describes the update.

        @[JSON::Field(key: "UpgradeName")]
        getter upgrade_name : String?

        # One of three steps that an upgrade or upgrade eligibility check goes through.

        @[JSON::Field(key: "UpgradeStep")]
        getter upgrade_step : String?

        def initialize(
          @step_status : String? = nil,
          @upgrade_name : String? = nil,
          @upgrade_step : String? = nil
        )
        end
      end

      # Input parameters for configuring IAM identity federation settings.

      struct IAMFederationOptionsInput
        include JSON::Serializable

        # Specifies whether IAM identity federation is enabled for the OpenSearch domain.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The key in the SAML assertion that contains the user's role information.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # The key in the SAML assertion that contains the user's subject identifier.

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled : Bool? = nil,
          @roles_key : String? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # Output parameters showing the current IAM identity federation configuration.

      struct IAMFederationOptionsOutput
        include JSON::Serializable

        # Indicates whether IAM identity federation is currently enabled for the domain.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The configured key in the SAML assertion for the user's role information.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # The configured key in the SAML assertion for the user's subject identifier.

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled : Bool? = nil,
          @roles_key : String? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # The IP address type status for the domain.

      struct IPAddressTypeStatus
        include JSON::Serializable

        # The IP address options for the domain.

        @[JSON::Field(key: "Options")]
        getter options : String


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : String,
          @status : Types::OptionStatus
        )
        end
      end

      # Configuration settings for IAM Identity Center in an OpenSearch application.

      struct IamIdentityCenterOptions
        include JSON::Serializable

        # Indicates whether IAM Identity Center is enabled for the OpenSearch application.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?


        @[JSON::Field(key: "iamIdentityCenterApplicationArn")]
        getter iam_identity_center_application_arn : String?


        @[JSON::Field(key: "iamIdentityCenterInstanceArn")]
        getter iam_identity_center_instance_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role assigned to the IAM Identity Center application for
        # the OpenSearch application.

        @[JSON::Field(key: "iamRoleForIdentityCenterApplicationArn")]
        getter iam_role_for_identity_center_application_arn : String?

        def initialize(
          @enabled : Bool? = nil,
          @iam_identity_center_application_arn : String? = nil,
          @iam_identity_center_instance_arn : String? = nil,
          @iam_role_for_identity_center_application_arn : String? = nil
        )
        end
      end

      # Configuration settings for enabling and managing IAM Identity Center.

      struct IamIdentityCenterOptionsInput
        include JSON::Serializable

        # Specifies whether IAM Identity Center is enabled or disabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?


        @[JSON::Field(key: "iamIdentityCenterInstanceArn")]
        getter iam_identity_center_instance_arn : String?

        # The ARN of the IAM role associated with the IAM Identity Center application.

        @[JSON::Field(key: "iamRoleForIdentityCenterApplicationArn")]
        getter iam_role_for_identity_center_application_arn : String?

        def initialize(
          @enabled : Bool? = nil,
          @iam_identity_center_instance_arn : String? = nil,
          @iam_role_for_identity_center_application_arn : String? = nil
        )
        end
      end

      # Settings container for integrating IAM Identity Center with OpenSearch UI applications, which
      # enables enabling secure user authentication and access control across multiple data sources. This
      # setup supports single sign-on (SSO) through IAM Identity Center, allowing centralized user
      # management.

      struct IdentityCenterOptions
        include JSON::Serializable

        # Indicates whether IAM Identity Center is enabled for the application.

        @[JSON::Field(key: "EnabledAPIAccess")]
        getter enabled_api_access : Bool?

        # The ARN of the IAM Identity Center application that integrates with Amazon OpenSearch Service.

        @[JSON::Field(key: "IdentityCenterApplicationARN")]
        getter identity_center_application_arn : String?

        # The Amazon Resource Name (ARN) of the IAM Identity Center instance.

        @[JSON::Field(key: "IdentityCenterInstanceARN")]
        getter identity_center_instance_arn : String?

        # The identifier of the IAM Identity Store.

        @[JSON::Field(key: "IdentityStoreId")]
        getter identity_store_id : String?

        # Specifies the attribute that contains the backend role identifier (such as group name or group ID)
        # in IAM Identity Center.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # Specifies the attribute that contains the subject identifier (such as username, user ID, or email)
        # in IAM Identity Center.

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled_api_access : Bool? = nil,
          @identity_center_application_arn : String? = nil,
          @identity_center_instance_arn : String? = nil,
          @identity_store_id : String? = nil,
          @roles_key : String? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # Configuration settings for enabling and managing IAM Identity Center.

      struct IdentityCenterOptionsInput
        include JSON::Serializable

        # Indicates whether IAM Identity Center is enabled for API access in Amazon OpenSearch Service.

        @[JSON::Field(key: "EnabledAPIAccess")]
        getter enabled_api_access : Bool?

        # The ARN of the IAM Identity Center instance used to create an OpenSearch UI application that uses
        # IAM Identity Center for authentication.

        @[JSON::Field(key: "IdentityCenterInstanceARN")]
        getter identity_center_instance_arn : String?

        # Specifies the attribute that contains the backend role identifier (such as group name or group ID)
        # in IAM Identity Center.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # Specifies the attribute that contains the subject identifier (such as username, user ID, or email)
        # in IAM Identity Center.

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled_api_access : Bool? = nil,
          @identity_center_instance_arn : String? = nil,
          @roles_key : String? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # The status of IAM Identity Center configuration settings for a domain.

      struct IdentityCenterOptionsStatus
        include JSON::Serializable

        # Configuration settings for IAM Identity Center integration.

        @[JSON::Field(key: "Options")]
        getter options : Types::IdentityCenterOptions

        # The status of IAM Identity Center configuration settings for a domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::IdentityCenterOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Describes an inbound cross-cluster connection for Amazon OpenSearch Service. For more information,
      # see Cross-cluster search for Amazon OpenSearch Service .

      struct InboundConnection
        include JSON::Serializable

        # The unique identifier of the connection.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The connection mode.

        @[JSON::Field(key: "ConnectionMode")]
        getter connection_mode : String?

        # The current status of the connection.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::InboundConnectionStatus?

        # Information about the source (local) domain.

        @[JSON::Field(key: "LocalDomainInfo")]
        getter local_domain_info : Types::DomainInformationContainer?

        # Information about the destination (remote) domain.

        @[JSON::Field(key: "RemoteDomainInfo")]
        getter remote_domain_info : Types::DomainInformationContainer?

        def initialize(
          @connection_id : String? = nil,
          @connection_mode : String? = nil,
          @connection_status : Types::InboundConnectionStatus? = nil,
          @local_domain_info : Types::DomainInformationContainer? = nil,
          @remote_domain_info : Types::DomainInformationContainer? = nil
        )
        end
      end

      # The status of an inbound cross-cluster connection for OpenSearch Service.

      struct InboundConnectionStatus
        include JSON::Serializable

        # Information about the connection.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status code for the connection. Can be one of the following: PENDING_ACCEPTANCE - Inbound
        # connection is not yet accepted by the remote domain owner. APPROVED : Inbound connection is pending
        # acceptance by the remote domain owner. PROVISIONING : Inbound connection is being provisioned.
        # ACTIVE : Inbound connection is active and ready to use. REJECTING : Inbound connection rejection is
        # in process. REJECTED : Inbound connection is rejected. DELETING : Inbound connection deletion is in
        # progress. DELETED : Inbound connection is deleted and can no longer be used.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        def initialize(
          @message : String? = nil,
          @status_code : String? = nil
        )
        end
      end


      struct IndexSchema
        include JSON::Serializable

        def initialize
        end
      end

      # Limits on the number of instances that can be created in OpenSearch Service for a given instance
      # type.

      struct InstanceCountLimits
        include JSON::Serializable

        # The minimum allowed number of instances.

        @[JSON::Field(key: "MaximumInstanceCount")]
        getter maximum_instance_count : Int32?

        # The maximum allowed number of instances.

        @[JSON::Field(key: "MinimumInstanceCount")]
        getter minimum_instance_count : Int32?

        def initialize(
          @maximum_instance_count : Int32? = nil,
          @minimum_instance_count : Int32? = nil
        )
        end
      end

      # Instance-related attributes that are available for a given instance type.

      struct InstanceLimits
        include JSON::Serializable

        # Limits on the number of instances that can be created for a given instance type.

        @[JSON::Field(key: "InstanceCountLimits")]
        getter instance_count_limits : Types::InstanceCountLimits?

        def initialize(
          @instance_count_limits : Types::InstanceCountLimits? = nil
        )
        end
      end

      # Lists all instance types and available features for a given OpenSearch or Elasticsearch version.

      struct InstanceTypeDetails
        include JSON::Serializable

        # Whether fine-grained access control is supported for the instance type.

        @[JSON::Field(key: "AdvancedSecurityEnabled")]
        getter advanced_security_enabled : Bool?

        # Whether logging is supported for the instance type.

        @[JSON::Field(key: "AppLogsEnabled")]
        getter app_logs_enabled : Bool?

        # The supported Availability Zones for the instance type.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Whether Amazon Cognito access is supported for the instance type.

        @[JSON::Field(key: "CognitoEnabled")]
        getter cognito_enabled : Bool?

        # Whether encryption at rest and node-to-node encryption are supported for the instance type.

        @[JSON::Field(key: "EncryptionEnabled")]
        getter encryption_enabled : Bool?

        # Whether the instance acts as a data node, a dedicated master node, or an UltraWarm node.

        @[JSON::Field(key: "InstanceRole")]
        getter instance_role : Array(String)?

        # The instance type.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # Whether UltraWarm is supported for the instance type.

        @[JSON::Field(key: "WarmEnabled")]
        getter warm_enabled : Bool?

        def initialize(
          @advanced_security_enabled : Bool? = nil,
          @app_logs_enabled : Bool? = nil,
          @availability_zones : Array(String)? = nil,
          @cognito_enabled : Bool? = nil,
          @encryption_enabled : Bool? = nil,
          @instance_role : Array(String)? = nil,
          @instance_type : String? = nil,
          @warm_enabled : Bool? = nil
        )
        end
      end

      # Request processing failed because of an unknown error, exception, or internal failure.

      struct InternalException
        include JSON::Serializable

        def initialize
        end
      end

      # Request processing failed because you provided an invalid pagination token.

      struct InvalidPaginationTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # An exception for trying to create or access a sub-resource that's either invalid or not supported.

      struct InvalidTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # The JWT authentication and authorization configuration for an Amazon OpenSearch Service domain.

      struct JWTOptionsInput
        include JSON::Serializable

        # True to enable JWT authentication and authorization for a domain.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Element of the JWT assertion used by the cluster to verify JWT signatures.

        @[JSON::Field(key: "PublicKey")]
        getter public_key : String?

        # Element of the JWT assertion to use for roles.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # Element of the JWT assertion to use for the user name.

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled : Bool? = nil,
          @public_key : String? = nil,
          @roles_key : String? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # Describes the JWT options configured for the domain.

      struct JWTOptionsOutput
        include JSON::Serializable

        # True if JWT use is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The key used to verify the signature of incoming JWT requests.

        @[JSON::Field(key: "PublicKey")]
        getter public_key : String?

        # The key used for matching the JWT roles attribute.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # The key used for matching the JWT subject attribute.

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled : Bool? = nil,
          @public_key : String? = nil,
          @roles_key : String? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # The configuration parameters to enable access to the key store required by the package.

      struct KeyStoreAccessOption
        include JSON::Serializable

        # This indicates whether Key Store access is enabled

        @[JSON::Field(key: "KeyStoreAccessEnabled")]
        getter key_store_access_enabled : Bool

        # Role ARN to access the KeyStore Key

        @[JSON::Field(key: "KeyAccessRoleArn")]
        getter key_access_role_arn : String?

        def initialize(
          @key_store_access_enabled : Bool,
          @key_access_role_arn : String? = nil
        )
        end
      end

      # An exception for trying to create more than the allowed number of resources or sub-resources.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Limits for a given instance type and for each of its roles.

      struct Limits
        include JSON::Serializable

        # List of additional limits that are specific to a given instance type for each of its instance roles.

        @[JSON::Field(key: "AdditionalLimits")]
        getter additional_limits : Array(Types::AdditionalLimit)?

        # The limits for a given instance type.

        @[JSON::Field(key: "InstanceLimits")]
        getter instance_limits : Types::InstanceLimits?

        # Storage-related attributes that are available for a given instance type.

        @[JSON::Field(key: "StorageTypes")]
        getter storage_types : Array(Types::StorageType)?

        def initialize(
          @additional_limits : Array(Types::AdditionalLimit)? = nil,
          @instance_limits : Types::InstanceLimits? = nil,
          @storage_types : Array(Types::StorageType)? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filters the list of OpenSearch applications by status. Possible values: CREATING , UPDATING ,
        # DELETING , FAILED , ACTIVE , and DELETED .

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # Summarizes OpenSearch applications, including ID, ARN, name, endpoint, status, creation time, and
        # last update time.

        @[JSON::Field(key: "ApplicationSummaries")]
        getter application_summaries : Array(Types::ApplicationSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_summaries : Array(Types::ApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the ListDataSources operation.

      struct ListDataSourcesRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a ListDataSources operation.

      struct ListDataSourcesResponse
        include JSON::Serializable

        # A list of data sources associated with specified domain.

        @[JSON::Field(key: "DataSources")]
        getter data_sources : Array(Types::DataSourceDetails)?

        def initialize(
          @data_sources : Array(Types::DataSourceDetails)? = nil
        )
        end
      end


      struct ListDirectQueryDataSourcesRequest
        include JSON::Serializable


        @[JSON::Field(key: "nexttoken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListDirectQueryDataSourcesResponse
        include JSON::Serializable

        # A list of the direct query data sources that are returned by the ListDirectQueryDataSources API
        # operation.

        @[JSON::Field(key: "DirectQueryDataSources")]
        getter direct_query_data_sources : Array(Types::DirectQueryDataSource)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @direct_query_data_sources : Array(Types::DirectQueryDataSource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the ListDomainMaintenances operation.

      struct ListDomainMaintenancesRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the action.

        @[JSON::Field(key: "action")]
        getter action : String?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListDomainMaintenances operation returns a nextToken , include the returned
        # nextToken in subsequent ListDomainMaintenances operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the action.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_name : String,
          @action : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The result of a ListDomainMaintenances request that contains information about the requested
      # actions.

      struct ListDomainMaintenancesResponse
        include JSON::Serializable

        # A list of the submitted maintenance actions.

        @[JSON::Field(key: "DomainMaintenances")]
        getter domain_maintenances : Array(Types::DomainMaintenanceDetails)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_maintenances : Array(Types::DomainMaintenanceDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the ListDomainNames operation.

      struct ListDomainNamesRequest
        include JSON::Serializable

        # Filters the output by domain engine type.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        def initialize(
          @engine_type : String? = nil
        )
        end
      end

      # The results of a ListDomainNames operation. Contains the names of all domains owned by this account
      # and their respective engine types.

      struct ListDomainNamesResponse
        include JSON::Serializable

        # The names of all OpenSearch Service domains owned by the current user and their respective engine
        # types.

        @[JSON::Field(key: "DomainNames")]
        getter domain_names : Array(Types::DomainInfo)?

        def initialize(
          @domain_names : Array(Types::DomainInfo)? = nil
        )
        end
      end

      # Container for the request parameters to the ListDomainsForPackage operation.

      struct ListDomainsForPackageRequest
        include JSON::Serializable

        # The unique identifier of the package for which to list associated domains.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListDomainsForPackage operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListDomainsForPackage operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @package_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the response parameters to the ListDomainsForPackage operation.

      struct ListDomainsForPackageResponse
        include JSON::Serializable

        # Information about all domains associated with a package.

        @[JSON::Field(key: "DomainPackageDetailsList")]
        getter domain_package_details_list : Array(Types::DomainPackageDetails)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_package_details_list : Array(Types::DomainPackageDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInstanceTypeDetailsRequest
        include JSON::Serializable

        # The version of OpenSearch or Elasticsearch, in the format Elasticsearch_X.Y or OpenSearch_X.Y.
        # Defaults to the latest version of OpenSearch.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String

        # The name of the domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # An optional parameter that lists information for a given instance type.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListInstanceTypeDetails operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListInstanceTypeDetails operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional parameter that specifies the Availability Zones for the domain.

        @[JSON::Field(key: "retrieveAZs")]
        getter retrieve_a_zs : Bool?

        def initialize(
          @engine_version : String,
          @domain_name : String? = nil,
          @instance_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @retrieve_a_zs : Bool? = nil
        )
        end
      end


      struct ListInstanceTypeDetailsResponse
        include JSON::Serializable

        # Lists all supported instance types and features for the given OpenSearch or Elasticsearch version.

        @[JSON::Field(key: "InstanceTypeDetails")]
        getter instance_type_details : Array(Types::InstanceTypeDetails)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_type_details : Array(Types::InstanceTypeDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the request parameters to the ListPackagesForDomain operation.

      struct ListPackagesForDomainRequest
        include JSON::Serializable

        # The name of the domain for which you want to list associated packages.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListPackagesForDomain operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListPackagesForDomain operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the response parameters to the ListPackagesForDomain operation.

      struct ListPackagesForDomainResponse
        include JSON::Serializable

        # List of all packages associated with a domain.

        @[JSON::Field(key: "DomainPackageDetailsList")]
        getter domain_package_details_list : Array(Types::DomainPackageDetails)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_package_details_list : Array(Types::DomainPackageDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListScheduledActionsRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListScheduledActions operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListScheduledActions operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListScheduledActionsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of actions that are scheduled for the domain.

        @[JSON::Field(key: "ScheduledActions")]
        getter scheduled_actions : Array(Types::ScheduledAction)?

        def initialize(
          @next_token : String? = nil,
          @scheduled_actions : Array(Types::ScheduledAction)? = nil
        )
        end
      end

      # Container for the parameters to the ListTags operation.

      struct ListTagsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the domain, data source, or application to view tags for.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The results of a ListTags operation.

      struct ListTagsResponse
        include JSON::Serializable

        # List of resource tags associated with the specified domain, data source, or application.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Container for the request parameters to the ListVersions operation.

      struct ListVersionsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListVersions operation returns a nextToken , you can include the returned nextToken
        # in subsequent ListVersions operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters for response received from the ListVersions operation.

      struct ListVersionsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of all versions of OpenSearch and Elasticsearch that Amazon OpenSearch Service supports.

        @[JSON::Field(key: "Versions")]
        getter versions : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @versions : Array(String)? = nil
        )
        end
      end


      struct ListVpcEndpointAccessRequest
        include JSON::Serializable

        # The name of the OpenSearch Service domain to retrieve access information for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # If your initial ListVpcEndpointAccess operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListVpcEndpointAccess operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListVpcEndpointAccessResponse
        include JSON::Serializable

        # A list of IAM principals that can currently access the domain.

        @[JSON::Field(key: "AuthorizedPrincipalList")]
        getter authorized_principal_list : Array(Types::AuthorizedPrincipal)

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String

        def initialize(
          @authorized_principal_list : Array(Types::AuthorizedPrincipal),
          @next_token : String
        )
        end
      end


      struct ListVpcEndpointsForDomainRequest
        include JSON::Serializable

        # The name of the domain to list associated VPC endpoints for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # If your initial ListEndpointsForDomain operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListEndpointsForDomain operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListVpcEndpointsForDomainResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String

        # Information about each endpoint associated with the domain.

        @[JSON::Field(key: "VpcEndpointSummaryList")]
        getter vpc_endpoint_summary_list : Array(Types::VpcEndpointSummary)

        def initialize(
          @next_token : String,
          @vpc_endpoint_summary_list : Array(Types::VpcEndpointSummary)
        )
        end
      end


      struct ListVpcEndpointsRequest
        include JSON::Serializable

        # If your initial ListVpcEndpoints operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListVpcEndpoints operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListVpcEndpointsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Send the request again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String

        # Information about each endpoint.

        @[JSON::Field(key: "VpcEndpointSummaryList")]
        getter vpc_endpoint_summary_list : Array(Types::VpcEndpointSummary)

        def initialize(
          @next_token : String,
          @vpc_endpoint_summary_list : Array(Types::VpcEndpointSummary)
        )
        end
      end

      # Specifies whether the Amazon OpenSearch Service domain publishes the OpenSearch application and slow
      # logs to Amazon CloudWatch. For more information, see Monitoring OpenSearch logs with Amazon
      # CloudWatch Logs . After you enable log publishing, you still have to enable the collection of slow
      # logs using the OpenSearch REST API.

      struct LogPublishingOption
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch Logs group to publish logs to.

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String?

        # Whether the log should be published.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @cloud_watch_logs_log_group_arn : String? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # The configured log publishing options for the domain and their current status.

      struct LogPublishingOptionsStatus
        include JSON::Serializable

        # The log publishing options configured for the domain.

        @[JSON::Field(key: "Options")]
        getter options : Hash(String, Types::LogPublishingOption)?

        # The status of the log publishing options for the domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus?

        def initialize(
          @options : Hash(String, Types::LogPublishingOption)? = nil,
          @status : Types::OptionStatus? = nil
        )
        end
      end

      # Credentials for the master user for a domain.

      struct MasterUserOptions
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the master user. Only specify if InternalUserDatabaseEnabled is false
        # .

        @[JSON::Field(key: "MasterUserARN")]
        getter master_user_arn : String?

        # User name for the master user. Only specify if InternalUserDatabaseEnabled is true .

        @[JSON::Field(key: "MasterUserName")]
        getter master_user_name : String?

        # Password for the master user. Only specify if InternalUserDatabaseEnabled is true .

        @[JSON::Field(key: "MasterUserPassword")]
        getter master_user_password : String?

        def initialize(
          @master_user_arn : String? = nil,
          @master_user_name : String? = nil,
          @master_user_password : String? = nil
        )
        end
      end

      # Information about the domain properties that are currently being modified.

      struct ModifyingProperties
        include JSON::Serializable

        # The current value of the domain property that is being modified.

        @[JSON::Field(key: "ActiveValue")]
        getter active_value : String?

        # The name of the property that is currently being modified.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value that the property that is currently being modified will eventually have.

        @[JSON::Field(key: "PendingValue")]
        getter pending_value : String?

        # The type of value that is currently being modified. Properties can have two types: PLAIN_TEXT :
        # Contain direct values such as "1", "True", or "c5.large.search". STRINGIFIED_JSON : Contain content
        # in JSON format, such as {"Enabled":"True"}".

        @[JSON::Field(key: "ValueType")]
        getter value_type : String?

        def initialize(
          @active_value : String? = nil,
          @name : String? = nil,
          @pending_value : String? = nil,
          @value_type : String? = nil
        )
        end
      end

      # Container for parameters required to enable the natural language query generation feature.

      struct NaturalLanguageQueryGenerationOptionsInput
        include JSON::Serializable

        # The desired state of the natural language query generation feature. Valid values are ENABLED and
        # DISABLED.

        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        def initialize(
          @desired_state : String? = nil
        )
        end
      end

      # Container for parameters representing the state of the natural language query generation feature on
      # the specified domain.

      struct NaturalLanguageQueryGenerationOptionsOutput
        include JSON::Serializable

        # The current state of the natural language query generation feature, indicating completion, in
        # progress, or failure.

        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The desired state of the natural language query generation feature. Valid values are ENABLED and
        # DISABLED.

        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        def initialize(
          @current_state : String? = nil,
          @desired_state : String? = nil
        )
        end
      end

      # Configuration options for defining the setup of any node type within the cluster.

      struct NodeConfig
        include JSON::Serializable

        # The number of nodes of a specific type within the cluster.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # A boolean value indicating whether a specific node type is active or inactive.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The instance type of a particular node within the cluster.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @count : Int32? = nil,
          @enabled : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Configuration settings for defining the node type within a cluster.

      struct NodeOption
        include JSON::Serializable

        # Configuration options for defining the setup of any node type.

        @[JSON::Field(key: "NodeConfig")]
        getter node_config : Types::NodeConfig?

        # Defines the type of node, such as coordinating nodes.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        def initialize(
          @node_config : Types::NodeConfig? = nil,
          @node_type : String? = nil
        )
        end
      end

      # Enables or disables node-to-node encryption. For more information, see Node-to-node encryption for
      # Amazon OpenSearch Service .

      struct NodeToNodeEncryptionOptions
        include JSON::Serializable

        # True to enable node-to-node encryption.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Status of the node-to-node encryption options for the specified domain.

      struct NodeToNodeEncryptionOptionsStatus
        include JSON::Serializable

        # The node-to-node encryption options for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::NodeToNodeEncryptionOptions

        # The status of the node-to-node encryption options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::NodeToNodeEncryptionOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # A custom 10-hour, low-traffic window during which OpenSearch Service can perform mandatory
      # configuration changes on the domain. These actions can include scheduled service software updates
      # and blue/green Auto-Tune enhancements. OpenSearch Service will schedule these actions during the
      # window that you specify. If you don't specify a window start time, it defaults to 10:00 P.M. local
      # time. For more information, see Defining off-peak maintenance windows for Amazon OpenSearch Service
      # .

      struct OffPeakWindow
        include JSON::Serializable

        # A custom start time for the off-peak window, in Coordinated Universal Time (UTC). The window length
        # will always be 10 hours, so you can't specify an end time. For example, if you specify 11:00 P.M.
        # UTC as a start time, the end time will automatically be set to 9:00 A.M.

        @[JSON::Field(key: "WindowStartTime")]
        getter window_start_time : Types::WindowStartTime?

        def initialize(
          @window_start_time : Types::WindowStartTime? = nil
        )
        end
      end

      # Options for a domain's off-peak window , during which OpenSearch Service can perform mandatory
      # configuration changes on the domain.

      struct OffPeakWindowOptions
        include JSON::Serializable

        # Whether to enable an off-peak window. This option is only available when modifying a domain created
        # prior to February 16, 2023, not when creating a new domain. All domains created after this date have
        # the off-peak window enabled by default. You can't disable the off-peak window after it's enabled for
        # a domain.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Off-peak window settings for the domain.

        @[JSON::Field(key: "OffPeakWindow")]
        getter off_peak_window : Types::OffPeakWindow?

        def initialize(
          @enabled : Bool? = nil,
          @off_peak_window : Types::OffPeakWindow? = nil
        )
        end
      end

      # The status of off-peak window options for a domain.

      struct OffPeakWindowOptionsStatus
        include JSON::Serializable

        # The domain's off-peak window configuration.

        @[JSON::Field(key: "Options")]
        getter options : Types::OffPeakWindowOptions?

        # The current status of off-peak window options.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus?

        def initialize(
          @options : Types::OffPeakWindowOptions? = nil,
          @status : Types::OptionStatus? = nil
        )
        end
      end

      # Provides the current status of an entity.

      struct OptionStatus
        include JSON::Serializable

        # The timestamp when the entity was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # The state of the entity.

        @[JSON::Field(key: "State")]
        getter state : String

        # The timestamp of the last time the entity was updated.

        @[JSON::Field(key: "UpdateDate")]
        getter update_date : Time

        # Indicates whether the entity is being deleted.

        @[JSON::Field(key: "PendingDeletion")]
        getter pending_deletion : Bool?

        # The latest version of the entity.

        @[JSON::Field(key: "UpdateVersion")]
        getter update_version : Int32?

        def initialize(
          @creation_date : Time,
          @state : String,
          @update_date : Time,
          @pending_deletion : Bool? = nil,
          @update_version : Int32? = nil
        )
        end
      end

      # Specifies details about an outbound cross-cluster connection.

      struct OutboundConnection
        include JSON::Serializable

        # Name of the connection.

        @[JSON::Field(key: "ConnectionAlias")]
        getter connection_alias : String?

        # Unique identifier of the connection.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The connection mode.

        @[JSON::Field(key: "ConnectionMode")]
        getter connection_mode : String?

        # Properties for the outbound connection.

        @[JSON::Field(key: "ConnectionProperties")]
        getter connection_properties : Types::ConnectionProperties?

        # Status of the connection.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::OutboundConnectionStatus?

        # Information about the source (local) domain.

        @[JSON::Field(key: "LocalDomainInfo")]
        getter local_domain_info : Types::DomainInformationContainer?

        # Information about the destination (remote) domain.

        @[JSON::Field(key: "RemoteDomainInfo")]
        getter remote_domain_info : Types::DomainInformationContainer?

        def initialize(
          @connection_alias : String? = nil,
          @connection_id : String? = nil,
          @connection_mode : String? = nil,
          @connection_properties : Types::ConnectionProperties? = nil,
          @connection_status : Types::OutboundConnectionStatus? = nil,
          @local_domain_info : Types::DomainInformationContainer? = nil,
          @remote_domain_info : Types::DomainInformationContainer? = nil
        )
        end
      end

      # The status of an outbound cross-cluster connection.

      struct OutboundConnectionStatus
        include JSON::Serializable

        # Verbose information for the outbound connection.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status code for the outbound connection. Can be one of the following: VALIDATING - The outbound
        # connection request is being validated. VALIDATION_FAILED - Validation failed for the connection
        # request. PENDING_ACCEPTANCE : Outbound connection request is validated and is not yet accepted by
        # the remote domain owner. APPROVED - Outbound connection has been approved by the remote domain owner
        # for getting provisioned. PROVISIONING - Outbound connection request is in process. ACTIVE - Outbound
        # connection is active and ready to use. REJECTING - Outbound connection rejection by remote domain
        # owner is in progress. REJECTED - Outbound connection request is rejected by remote domain owner.
        # DELETING - Outbound connection deletion is in progress. DELETED - Outbound connection is deleted and
        # can no longer be used.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        def initialize(
          @message : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # The configuration for associating a package with a domain.

      struct PackageAssociationConfiguration
        include JSON::Serializable

        # The configuration parameters to enable accessing the key store required by the package.

        @[JSON::Field(key: "KeyStoreAccessOption")]
        getter key_store_access_option : Types::KeyStoreAccessOption?

        def initialize(
          @key_store_access_option : Types::KeyStoreAccessOption? = nil
        )
        end
      end

      # The configuration parameters for a package.

      struct PackageConfiguration
        include JSON::Serializable

        # The configuration requirements for the package.

        @[JSON::Field(key: "ConfigurationRequirement")]
        getter configuration_requirement : String

        # The license requirements for the package.

        @[JSON::Field(key: "LicenseRequirement")]
        getter license_requirement : String

        # The relative file path for the license associated with the package.

        @[JSON::Field(key: "LicenseFilepath")]
        getter license_filepath : String?

        # This indicates whether a B/G deployment is required for updating the configuration that the plugin
        # is prerequisite for.

        @[JSON::Field(key: "RequiresRestartForConfigurationUpdate")]
        getter requires_restart_for_configuration_update : Bool?

        def initialize(
          @configuration_requirement : String,
          @license_requirement : String,
          @license_filepath : String? = nil,
          @requires_restart_for_configuration_update : Bool? = nil
        )
        end
      end

      # Basic information about a package.

      struct PackageDetails
        include JSON::Serializable

        # A list of users who are allowed to view and associate the package. This field is only visible to the
        # owner of a package.

        @[JSON::Field(key: "AllowListedUserList")]
        getter allow_listed_user_list : Array(String)?

        # This represents the available configuration parameters for the package.

        @[JSON::Field(key: "AvailablePackageConfiguration")]
        getter available_package_configuration : Types::PackageConfiguration?

        # The package version.

        @[JSON::Field(key: "AvailablePackageVersion")]
        getter available_package_version : String?

        # If the package is a ZIP-PLUGIN package, additional information about plugin properties.

        @[JSON::Field(key: "AvailablePluginProperties")]
        getter available_plugin_properties : Types::PluginProperties?

        # The timestamp when the package was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Version of OpenSearch or Elasticsearch, in the format Elasticsearch_X.Y or OpenSearch_X.Y. Defaults
        # to the latest version of OpenSearch.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Additional information if the package is in an error state. Null otherwise.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::ErrorDetails?

        # Date and time when the package was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # User-specified description of the package.

        @[JSON::Field(key: "PackageDescription")]
        getter package_description : String?

        # Encryption options for a package.

        @[JSON::Field(key: "PackageEncryptionOptions")]
        getter package_encryption_options : Types::PackageEncryptionOptions?

        # The unique identifier of the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String?

        # The user-specified name of the package.

        @[JSON::Field(key: "PackageName")]
        getter package_name : String?

        # The owner of the package who is allowed to create and update a package and add users to the package
        # scope.

        @[JSON::Field(key: "PackageOwner")]
        getter package_owner : String?

        # The current status of the package. The available options are AVAILABLE , COPYING , COPY_FAILED ,
        # VALIDATNG , VALIDATION_FAILED , DELETING , and DELETE_FAILED .

        @[JSON::Field(key: "PackageStatus")]
        getter package_status : String?

        # The type of package.

        @[JSON::Field(key: "PackageType")]
        getter package_type : String?

        # Package Vending Options for a package.

        @[JSON::Field(key: "PackageVendingOptions")]
        getter package_vending_options : Types::PackageVendingOptions?

        def initialize(
          @allow_listed_user_list : Array(String)? = nil,
          @available_package_configuration : Types::PackageConfiguration? = nil,
          @available_package_version : String? = nil,
          @available_plugin_properties : Types::PluginProperties? = nil,
          @created_at : Time? = nil,
          @engine_version : String? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @last_updated_at : Time? = nil,
          @package_description : String? = nil,
          @package_encryption_options : Types::PackageEncryptionOptions? = nil,
          @package_id : String? = nil,
          @package_name : String? = nil,
          @package_owner : String? = nil,
          @package_status : String? = nil,
          @package_type : String? = nil,
          @package_vending_options : Types::PackageVendingOptions? = nil
        )
        end
      end

      # Details of a package that is associated with a domain.

      struct PackageDetailsForAssociation
        include JSON::Serializable

        # Internal ID of the package that you want to associate with a domain.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # The configuration parameters for associating the package with a domain.

        @[JSON::Field(key: "AssociationConfiguration")]
        getter association_configuration : Types::PackageAssociationConfiguration?

        # List of package IDs that must be linked to the domain before or simultaneously with the package
        # association.

        @[JSON::Field(key: "PrerequisitePackageIDList")]
        getter prerequisite_package_id_list : Array(String)?

        def initialize(
          @package_id : String,
          @association_configuration : Types::PackageAssociationConfiguration? = nil,
          @prerequisite_package_id_list : Array(String)? = nil
        )
        end
      end

      # Encryption options for a package.

      struct PackageEncryptionOptions
        include JSON::Serializable

        # Whether encryption is enabled for the package.

        @[JSON::Field(key: "EncryptionEnabled")]
        getter encryption_enabled : Bool

        # KMS key ID for encrypting the package.

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        def initialize(
          @encryption_enabled : Bool,
          @kms_key_identifier : String? = nil
        )
        end
      end

      # The Amazon S3 location to import the package from.

      struct PackageSource
        include JSON::Serializable

        # The name of the Amazon S3 bucket containing the package.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # Key (file name) of the package.

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        def initialize(
          @s3_bucket_name : String? = nil,
          @s3_key : String? = nil
        )
        end
      end

      # Configuration options for determining whether a package can be made available for use by other
      # users.

      struct PackageVendingOptions
        include JSON::Serializable

        # Indicates whether the package vending feature is enabled, allowing the package to be used by other
        # users.

        @[JSON::Field(key: "VendingEnabled")]
        getter vending_enabled : Bool

        def initialize(
          @vending_enabled : Bool
        )
        end
      end

      # Details about a package version.

      struct PackageVersionHistory
        include JSON::Serializable

        # A message associated with the package version when it was uploaded.

        @[JSON::Field(key: "CommitMessage")]
        getter commit_message : String?

        # The date and time when the package was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The configuration details for a specific version of a package.

        @[JSON::Field(key: "PackageConfiguration")]
        getter package_configuration : Types::PackageConfiguration?

        # The package version.

        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String?

        # Additional information about plugin properties if the package is a ZIP-PLUGIN package.

        @[JSON::Field(key: "PluginProperties")]
        getter plugin_properties : Types::PluginProperties?

        def initialize(
          @commit_message : String? = nil,
          @created_at : Time? = nil,
          @package_configuration : Types::PackageConfiguration? = nil,
          @package_version : String? = nil,
          @plugin_properties : Types::PluginProperties? = nil
        )
        end
      end

      # Basic information about the plugin.

      struct PluginProperties
        include JSON::Serializable

        # The name of the class to load.

        @[JSON::Field(key: "ClassName")]
        getter class_name : String?

        # The description of the plugin.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the plugin.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The uncompressed size of the plugin.

        @[JSON::Field(key: "UncompressedSizeInBytes")]
        getter uncompressed_size_in_bytes : Int64?

        # The version of the plugin.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @class_name : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @uncompressed_size_in_bytes : Int64? = nil,
          @version : String? = nil
        )
        end
      end

      # Container for request parameters to the PurchaseReservedInstanceOffering operation.

      struct PurchaseReservedInstanceOfferingRequest
        include JSON::Serializable

        # A customer-specified identifier to track this reservation.

        @[JSON::Field(key: "ReservationName")]
        getter reservation_name : String

        # The ID of the Reserved Instance offering to purchase.

        @[JSON::Field(key: "ReservedInstanceOfferingId")]
        getter reserved_instance_offering_id : String

        # The number of OpenSearch instances to reserve.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        def initialize(
          @reservation_name : String,
          @reserved_instance_offering_id : String,
          @instance_count : Int32? = nil
        )
        end
      end

      # Represents the output of a PurchaseReservedInstanceOffering operation.

      struct PurchaseReservedInstanceOfferingResponse
        include JSON::Serializable

        # The customer-specified identifier used to track this reservation.

        @[JSON::Field(key: "ReservationName")]
        getter reservation_name : String?

        # The ID of the Reserved Instance offering that was purchased.

        @[JSON::Field(key: "ReservedInstanceId")]
        getter reserved_instance_id : String?

        def initialize(
          @reservation_name : String? = nil,
          @reserved_instance_id : String? = nil
        )
        end
      end


      struct PutDefaultApplicationSettingRequest
        include JSON::Serializable


        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String

        # Set to true to set the specified ARN as the default application. Set to false to clear the default
        # application.

        @[JSON::Field(key: "setAsDefault")]
        getter set_as_default : Bool

        def initialize(
          @application_arn : String,
          @set_as_default : Bool
        )
        end
      end


      struct PutDefaultApplicationSettingResponse
        include JSON::Serializable


        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        def initialize(
          @application_arn : String? = nil
        )
        end
      end

      # Contains the specific price and frequency of a recurring charges for an OpenSearch Reserved
      # Instance, or for a Reserved Instance offering.

      struct RecurringCharge
        include JSON::Serializable

        # The monetary amount of the recurring charge.

        @[JSON::Field(key: "RecurringChargeAmount")]
        getter recurring_charge_amount : Float64?

        # The frequency of the recurring charge.

        @[JSON::Field(key: "RecurringChargeFrequency")]
        getter recurring_charge_frequency : String?

        def initialize(
          @recurring_charge_amount : Float64? = nil,
          @recurring_charge_frequency : String? = nil
        )
        end
      end

      # Container for the request parameters to the RejectInboundConnection operation.

      struct RejectInboundConnectionRequest
        include JSON::Serializable

        # The unique identifier of the inbound connection to reject.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end

      # Represents the output of a RejectInboundConnection operation.

      struct RejectInboundConnectionResponse
        include JSON::Serializable

        # Contains details about the rejected inbound connection.

        @[JSON::Field(key: "Connection")]
        getter connection : Types::InboundConnection?

        def initialize(
          @connection : Types::InboundConnection? = nil
        )
        end
      end

      # Container for the request parameters to the RemoveTags operation.

      struct RemoveTagsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain, data source, or application from which you want to
        # delete the specified tags.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # The list of tag keys to remove from the domain, data source, or application.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Details of an OpenSearch Reserved Instance.

      struct ReservedInstance
        include JSON::Serializable

        # The unique identifier of the billing subscription.

        @[JSON::Field(key: "BillingSubscriptionId")]
        getter billing_subscription_id : Int64?

        # The currency code for the offering.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The duration, in seconds, for which the OpenSearch instance is reserved.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The upfront fixed charge you will paid to purchase the specific Reserved Instance offering.

        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The number of OpenSearch instances that have been reserved.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # The OpenSearch instance type offered by theReserved Instance offering.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The payment option as defined in the Reserved Instance offering.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The recurring charge to your account, regardless of whether you create any domains using the
        # Reserved Instance offering.

        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The customer-specified identifier to track this reservation.

        @[JSON::Field(key: "ReservationName")]
        getter reservation_name : String?

        # The unique identifier for the reservation.

        @[JSON::Field(key: "ReservedInstanceId")]
        getter reserved_instance_id : String?

        # The unique identifier of the Reserved Instance offering.

        @[JSON::Field(key: "ReservedInstanceOfferingId")]
        getter reserved_instance_offering_id : String?

        # The date and time when the reservation was purchased.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The state of the Reserved Instance.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The hourly rate at which you're charged for the domain using this Reserved Instance.

        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @billing_subscription_id : Int64? = nil,
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @instance_count : Int32? = nil,
          @instance_type : String? = nil,
          @payment_option : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reservation_name : String? = nil,
          @reserved_instance_id : String? = nil,
          @reserved_instance_offering_id : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # Details of an OpenSearch Reserved Instance offering.

      struct ReservedInstanceOffering
        include JSON::Serializable

        # The currency code for the Reserved Instance offering.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The duration, in seconds, for which the offering will reserve the OpenSearch instance.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The upfront fixed charge you will pay to purchase the specific Reserved Instance offering.

        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The OpenSearch instance type offered by the Reserved Instance offering.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # Payment option for the Reserved Instance offering

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The recurring charge to your account, regardless of whether you creates any domains using the
        # offering.

        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The unique identifier of the Reserved Instance offering.

        @[JSON::Field(key: "ReservedInstanceOfferingId")]
        getter reserved_instance_offering_id : String?

        # The hourly rate at which you're charged for the domain using this Reserved Instance.

        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @instance_type : String? = nil,
          @payment_option : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reserved_instance_offering_id : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # An exception for creating a resource that already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # An exception for accessing or deleting a resource that doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end


      struct RevokeVpcEndpointAccessRequest
        include JSON::Serializable

        # The name of the OpenSearch Service domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The account ID to revoke access from.

        @[JSON::Field(key: "Account")]
        getter account : String?

        # The service SP to revoke access from.

        @[JSON::Field(key: "Service")]
        getter service : String?

        def initialize(
          @domain_name : String,
          @account : String? = nil,
          @service : String? = nil
        )
        end
      end


      struct RevokeVpcEndpointAccessResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the Amazon S3 Glue Data Catalog.

      struct S3GlueDataCatalog
        include JSON::Serializable

        # &gt;The Amazon Resource Name (ARN) for the S3 Glue Data Catalog.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @role_arn : String? = nil
        )
        end
      end

      # Options for enabling S3 vectors engine features on the specified domain.

      struct S3VectorsEngine
        include JSON::Serializable

        # Enables S3 vectors engine features.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # The SAML identity povider information.

      struct SAMLIdp
        include JSON::Serializable

        # The unique entity ID of the application in the SAML identity provider.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The metadata of the SAML application, in XML format.

        @[JSON::Field(key: "MetadataContent")]
        getter metadata_content : String

        def initialize(
          @entity_id : String,
          @metadata_content : String
        )
        end
      end

      # The SAML authentication configuration for an Amazon OpenSearch Service domain.

      struct SAMLOptionsInput
        include JSON::Serializable

        # True to enable SAML authentication for a domain.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The SAML Identity Provider's information.

        @[JSON::Field(key: "Idp")]
        getter idp : Types::SAMLIdp?

        # The backend role that the SAML master user is mapped to.

        @[JSON::Field(key: "MasterBackendRole")]
        getter master_backend_role : String?

        # The SAML master user name, which is stored in the domain's internal user database.

        @[JSON::Field(key: "MasterUserName")]
        getter master_user_name : String?

        # Element of the SAML assertion to use for backend roles. Default is roles .

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # The duration, in minutes, after which a user session becomes inactive. Acceptable values are between
        # 1 and 1440, and the default value is 60.

        @[JSON::Field(key: "SessionTimeoutMinutes")]
        getter session_timeout_minutes : Int32?

        # Element of the SAML assertion to use for the user name. Default is NameID .

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled : Bool? = nil,
          @idp : Types::SAMLIdp? = nil,
          @master_backend_role : String? = nil,
          @master_user_name : String? = nil,
          @roles_key : String? = nil,
          @session_timeout_minutes : Int32? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # Describes the SAML application configured for the domain.

      struct SAMLOptionsOutput
        include JSON::Serializable

        # True if SAML is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Describes the SAML identity provider's information.

        @[JSON::Field(key: "Idp")]
        getter idp : Types::SAMLIdp?

        # The key used for matching the SAML roles attribute.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # The duration, in minutes, after which a user session becomes inactive.

        @[JSON::Field(key: "SessionTimeoutMinutes")]
        getter session_timeout_minutes : Int32?

        # The key used for matching the SAML subject attribute.

        @[JSON::Field(key: "SubjectKey")]
        getter subject_key : String?

        def initialize(
          @enabled : Bool? = nil,
          @idp : Types::SAMLIdp? = nil,
          @roles_key : String? = nil,
          @session_timeout_minutes : Int32? = nil,
          @subject_key : String? = nil
        )
        end
      end

      # Information about a scheduled configuration change for an OpenSearch Service domain. This actions
      # can be a service software update or a blue/green Auto-Tune enhancement .

      struct ScheduledAction
        include JSON::Serializable

        # The unique identifier of the scheduled action.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The time when the change is scheduled to happen.

        @[JSON::Field(key: "ScheduledTime")]
        getter scheduled_time : Int64

        # The severity of the action.

        @[JSON::Field(key: "Severity")]
        getter severity : String

        # The type of action that will be taken on the domain.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Whether or not the scheduled action is cancellable.

        @[JSON::Field(key: "Cancellable")]
        getter cancellable : Bool?

        # A description of the action to be taken.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Whether the action is required or optional.

        @[JSON::Field(key: "Mandatory")]
        getter mandatory : Bool?

        # Whether the action was scheduled manually ( CUSTOMER , or by OpenSearch Service automatically (
        # SYSTEM ).

        @[JSON::Field(key: "ScheduledBy")]
        getter scheduled_by : String?

        # The current status of the scheduled action.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @id : String,
          @scheduled_time : Int64,
          @severity : String,
          @type : String,
          @cancellable : Bool? = nil,
          @description : String? = nil,
          @mandatory : Bool? = nil,
          @scheduled_by : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies details about a scheduled Auto-Tune action. For more information, see Auto-Tune for Amazon
      # OpenSearch Service .

      struct ScheduledAutoTuneDetails
        include JSON::Serializable

        # A description of the Auto-Tune action.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The type of Auto-Tune action.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # The date and time when the Auto-Tune action is scheduled for the domain.

        @[JSON::Field(key: "Date")]
        getter date : Time?

        # The severity of the Auto-Tune action. Valid values are LOW , MEDIUM , and HIGH .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        def initialize(
          @action : String? = nil,
          @action_type : String? = nil,
          @date : Time? = nil,
          @severity : String? = nil
        )
        end
      end

      # Configuration details for a Security Lake data source that can be used for direct queries.

      struct SecurityLakeDirectQueryDataSource
        include JSON::Serializable

        # The unique identifier of the IAM role that grants OpenSearch Service permission to access the
        # specified data source.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end

      # Configuration for serverless vector acceleration, which provides GPU-accelerated vector search
      # capabilities for improved performance on vector workloads.

      struct ServerlessVectorAcceleration
        include JSON::Serializable

        # Specifies whether serverless vector acceleration is enabled for the domain.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # The current status of the service software for an Amazon OpenSearch Service domain. For more
      # information, see Service software updates in Amazon OpenSearch Service .

      struct ServiceSoftwareOptions
        include JSON::Serializable

        # The timestamp, in Epoch time, until which you can manually request a service software update. After
        # this date, we automatically update your service software.

        @[JSON::Field(key: "AutomatedUpdateDate")]
        getter automated_update_date : Time?

        # True if you're able to cancel your service software version update. False if you can't cancel your
        # service software update.

        @[JSON::Field(key: "Cancellable")]
        getter cancellable : Bool?

        # The current service software version present on the domain.

        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String?

        # A description of the service software update status.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new service software version, if one is available.

        @[JSON::Field(key: "NewVersion")]
        getter new_version : String?

        # True if a service software is never automatically updated. False if a service software is
        # automatically updated after the automated update date.

        @[JSON::Field(key: "OptionalDeployment")]
        getter optional_deployment : Bool?

        # True if you're able to update your service software version. False if you can't update your service
        # software version.

        @[JSON::Field(key: "UpdateAvailable")]
        getter update_available : Bool?

        # The status of your service software update.

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?

        def initialize(
          @automated_update_date : Time? = nil,
          @cancellable : Bool? = nil,
          @current_version : String? = nil,
          @description : String? = nil,
          @new_version : String? = nil,
          @optional_deployment : Bool? = nil,
          @update_available : Bool? = nil,
          @update_status : String? = nil
        )
        end
      end

      # An exception for attempting to schedule a domain action during an unavailable time slot.

      struct SlotNotAvailableException
        include JSON::Serializable

        # Alternate time slots during which OpenSearch Service has available capacity to schedule a domain
        # action.

        @[JSON::Field(key: "SlotSuggestions")]
        getter slot_suggestions : Array(Int64)?

        def initialize(
          @slot_suggestions : Array(Int64)? = nil
        )
        end
      end

      # The time, in UTC format, when OpenSearch Service takes a daily automated snapshot of the specified
      # domain. Default is 0 hours.

      struct SnapshotOptions
        include JSON::Serializable

        # The time, in UTC format, when OpenSearch Service takes a daily automated snapshot of the specified
        # domain. Default is 0 hours.

        @[JSON::Field(key: "AutomatedSnapshotStartHour")]
        getter automated_snapshot_start_hour : Int32?

        def initialize(
          @automated_snapshot_start_hour : Int32? = nil
        )
        end
      end

      # Container for information about a daily automated snapshot for an OpenSearch Service domain.

      struct SnapshotOptionsStatus
        include JSON::Serializable

        # The daily snapshot options specified for the domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::SnapshotOptions

        # The status of a daily automated snapshot.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::SnapshotOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Options for configuring service software updates for a domain.

      struct SoftwareUpdateOptions
        include JSON::Serializable

        # Whether automatic service software updates are enabled for the domain.

        @[JSON::Field(key: "AutoSoftwareUpdateEnabled")]
        getter auto_software_update_enabled : Bool?

        def initialize(
          @auto_software_update_enabled : Bool? = nil
        )
        end
      end

      # The status of the service software options for a domain.

      struct SoftwareUpdateOptionsStatus
        include JSON::Serializable

        # The service software update options for a domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::SoftwareUpdateOptions?

        # The status of service software update options, including creation date and last updated date.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus?

        def initialize(
          @options : Types::SoftwareUpdateOptions? = nil,
          @status : Types::OptionStatus? = nil
        )
        end
      end

      # Container for the parameters to the StartDomainMaintenance operation.

      struct StartDomainMaintenanceRequest
        include JSON::Serializable

        # The name of the action.

        @[JSON::Field(key: "Action")]
        getter action : String

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The ID of the data node.

        @[JSON::Field(key: "NodeId")]
        getter node_id : String?

        def initialize(
          @action : String,
          @domain_name : String,
          @node_id : String? = nil
        )
        end
      end

      # The result of a StartDomainMaintenance request that information about the requested action.

      struct StartDomainMaintenanceResponse
        include JSON::Serializable

        # The request ID of requested action.

        @[JSON::Field(key: "MaintenanceId")]
        getter maintenance_id : String?

        def initialize(
          @maintenance_id : String? = nil
        )
        end
      end

      # Container for the request parameters to the StartServiceSoftwareUpdate operation.

      struct StartServiceSoftwareUpdateRequest
        include JSON::Serializable

        # The name of the domain that you want to update to the latest service software.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Epoch timestamp when you want the service software update to start. You only need to specify
        # this parameter if you set ScheduleAt to TIMESTAMP .

        @[JSON::Field(key: "DesiredStartTime")]
        getter desired_start_time : Int64?

        # When to start the service software update. NOW - Immediately schedules the update to happen in the
        # current hour if there's capacity available. TIMESTAMP - Lets you specify a custom date and time to
        # apply the update. If you specify this value, you must also provide a value for DesiredStartTime .
        # OFF_PEAK_WINDOW - Marks the update to be picked up during an upcoming off-peak window. There's no
        # guarantee that the update will happen during the next immediate window. Depending on capacity, it
        # might happen in subsequent days. Default: NOW if you don't specify a value for DesiredStartTime ,
        # and TIMESTAMP if you do.

        @[JSON::Field(key: "ScheduleAt")]
        getter schedule_at : String?

        def initialize(
          @domain_name : String,
          @desired_start_time : Int64? = nil,
          @schedule_at : String? = nil
        )
        end
      end

      # Represents the output of a StartServiceSoftwareUpdate operation. Contains the status of the update.

      struct StartServiceSoftwareUpdateResponse
        include JSON::Serializable

        # The current status of the OpenSearch Service software update.

        @[JSON::Field(key: "ServiceSoftwareOptions")]
        getter service_software_options : Types::ServiceSoftwareOptions?

        def initialize(
          @service_software_options : Types::ServiceSoftwareOptions? = nil
        )
        end
      end

      # A list of storage types for an Amazon OpenSearch Service domain that are available for a given
      # intance type.

      struct StorageType
        include JSON::Serializable

        # The storage sub-type, such as gp3 or io1 .

        @[JSON::Field(key: "StorageSubTypeName")]
        getter storage_sub_type_name : String?

        # Limits that are applicable for the given storage type.

        @[JSON::Field(key: "StorageTypeLimits")]
        getter storage_type_limits : Array(Types::StorageTypeLimit)?

        # The name of the storage type.

        @[JSON::Field(key: "StorageTypeName")]
        getter storage_type_name : String?

        def initialize(
          @storage_sub_type_name : String? = nil,
          @storage_type_limits : Array(Types::StorageTypeLimit)? = nil,
          @storage_type_name : String? = nil
        )
        end
      end

      # Limits that are applicable for the given Amazon OpenSearch Service storage type.

      struct StorageTypeLimit
        include JSON::Serializable

        # Name of storage limits that are applicable for the given storage type. If StorageType is ebs , the
        # following options are available: MinimumVolumeSize - Minimum volume size that is available for the
        # given storage type. Can be empty if not applicable. MaximumVolumeSize - Maximum volume size that is
        # available for the given storage type. Can be empty if not applicable. MaximumIops - Maximum amount
        # of IOPS that is available for the given the storage type. Can be empty if not applicable.
        # MinimumIops - Minimum amount of IOPS that is available for the given the storage type. Can be empty
        # if not applicable. MaximumThroughput - Maximum amount of throughput that is available for the given
        # the storage type. Can be empty if not applicable. MinimumThroughput - Minimum amount of throughput
        # that is available for the given the storage type. Can be empty if not applicable.

        @[JSON::Field(key: "LimitName")]
        getter limit_name : String?

        # The limit values.

        @[JSON::Field(key: "LimitValues")]
        getter limit_values : Array(String)?

        def initialize(
          @limit_name : String? = nil,
          @limit_values : Array(String)? = nil
        )
        end
      end

      # A tag (key-value pair) for an Amazon OpenSearch Service resource.

      struct Tag
        include JSON::Serializable

        # The tag key. Tag keys must be unique for the domain to which they are attached.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value assigned to the corresponding tag key. Tag values can be null and don't have to be unique
        # in a tag set. For example, you can have a key value pair in a tag set of project : Trinity and
        # cost-center : Trinity

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The request was denied due to request throttling. Reduce the frequency of your requests and try
      # again.

      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # The unique identifier for the OpenSearch application to be updated.

        @[JSON::Field(key: "id")]
        getter id : String

        # The configuration settings to modify for the OpenSearch application.

        @[JSON::Field(key: "appConfigs")]
        getter app_configs : Array(Types::AppConfig)?

        # The data sources to associate with the OpenSearch application.

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(Types::DataSource)?

        def initialize(
          @id : String,
          @app_configs : Array(Types::AppConfig)? = nil,
          @data_sources : Array(Types::DataSource)? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        # The configuration settings for the updated OpenSearch application.

        @[JSON::Field(key: "appConfigs")]
        getter app_configs : Array(Types::AppConfig)?


        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the OpenSearch application was originally created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The data sources associated with the updated OpenSearch application.

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(Types::DataSource)?

        # The IAM Identity Center configuration for the updated OpenSearch application.

        @[JSON::Field(key: "iamIdentityCenterOptions")]
        getter iam_identity_center_options : Types::IamIdentityCenterOptions?

        # The unique identifier of the updated OpenSearch application.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp when the OpenSearch application was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the updated OpenSearch application.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @app_configs : Array(Types::AppConfig)? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @data_sources : Array(Types::DataSource)? = nil,
          @iam_identity_center_options : Types::IamIdentityCenterOptions? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Container for the parameters to the UpdateDataSource operation.

      struct UpdateDataSourceRequest
        include JSON::Serializable

        # The type of data source.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DataSourceType

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the data source to modify.

        @[JSON::Field(key: "DataSourceName")]
        getter name : String

        # A new description of the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The status of the data source update.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @data_source_type : Types::DataSourceType,
          @domain_name : String,
          @name : String,
          @description : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The result of an UpdateDataSource operation.

      struct UpdateDataSourceResponse
        include JSON::Serializable

        # A message associated with the updated data source.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateDirectQueryDataSourceRequest
        include JSON::Serializable

        # A unique, user-defined label to identify the data source within your OpenSearch Service environment.

        @[JSON::Field(key: "DataSourceName")]
        getter data_source_name : String

        # The supported Amazon Web Services service that you want to use as the source for direct queries in
        # OpenSearch Service.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : Types::DirectQueryDataSourceType

        # A list of Amazon Resource Names (ARNs) for the OpenSearch collections that are associated with the
        # direct query data source.

        @[JSON::Field(key: "OpenSearchArns")]
        getter open_search_arns : Array(String)

        # An optional text field for providing additional context and details about the data source.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @data_source_name : String,
          @data_source_type : Types::DirectQueryDataSourceType,
          @open_search_arns : Array(String),
          @description : String? = nil
        )
        end
      end


      struct UpdateDirectQueryDataSourceResponse
        include JSON::Serializable

        # The unique, system-generated identifier that represents the data source.

        @[JSON::Field(key: "DataSourceArn")]
        getter data_source_arn : String?

        def initialize(
          @data_source_arn : String? = nil
        )
        end
      end

      # Container for the request parameters to the UpdateDomain operation.

      struct UpdateDomainConfigRequest
        include JSON::Serializable

        # The name of the domain that you're updating.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Options for all machine learning features for the specified domain.

        @[JSON::Field(key: "AIMLOptions")]
        getter aiml_options : Types::AIMLOptionsInput?

        # Identity and Access Management (IAM) access policy as a JSON-formatted string.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : String?

        # Key-value pairs to specify advanced configuration options. The following key-value pairs are
        # supported: "rest.action.multi.allow_explicit_index": "true" | "false" - Note the use of a string
        # rather than a boolean. Specifies whether explicit references to indexes are allowed inside the body
        # of HTTP requests. If you want to configure access policies for domain sub-resources, such as
        # specific indexes and domain APIs, you must disable this property. Default is true.
        # "indices.fielddata.cache.size": "80" - Note the use of a string rather than a boolean. Specifies the
        # percentage of heap space allocated to field data. Default is unbounded.
        # "indices.query.bool.max_clause_count": "1024" - Note the use of a string rather than a boolean.
        # Specifies the maximum number of clauses allowed in a Lucene boolean query. Default is 1,024. Queries
        # with more than the permitted number of clauses result in a TooManyClauses error. For more
        # information, see Advanced cluster parameters .

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # Options for fine-grained access control.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptionsInput?

        # Options for Auto-Tune.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptions?

        # Changes that you want to make to the cluster configuration, such as the instance type and number of
        # EC2 instances.

        @[JSON::Field(key: "ClusterConfig")]
        getter cluster_config : Types::ClusterConfig?

        # Key-value pairs to configure Amazon Cognito authentication for OpenSearch Dashboards.

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptions?

        # Additional options for the domain endpoint, such as whether to require HTTPS for all traffic.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptions?

        # This flag, when set to True, specifies whether the UpdateDomain request should return the results of
        # a dry run analysis without actually applying the change. A dry run determines what type of
        # deployment the update will cause.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # The type of dry run to perform. Basic only returns the type of deployment (blue/green or dynamic)
        # that the update will cause. Verbose runs an additional check to validate the changes you're making.
        # For more information, see Validating a domain update .

        @[JSON::Field(key: "DryRunMode")]
        getter dry_run_mode : String?

        # The type and size of the EBS volume to attach to instances in the domain.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptions?

        # Encryption at rest options for the domain.

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # Specify either dual stack or IPv4 as your IP address type. Dual stack allows you to share domain
        # resources across IPv4 and IPv6 address types, and is the recommended option. If your IP address type
        # is currently set to dual stack, you can't change it.

        @[JSON::Field(key: "IPAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "IdentityCenterOptions")]
        getter identity_center_options : Types::IdentityCenterOptionsInput?

        # Options to publish OpenSearch logs to Amazon CloudWatch Logs.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Hash(String, Types::LogPublishingOption)?

        # Node-to-node encryption options for the domain.

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions?

        # Off-peak window options for the domain.

        @[JSON::Field(key: "OffPeakWindowOptions")]
        getter off_peak_window_options : Types::OffPeakWindowOptions?

        # Option to set the time, in UTC format, for the daily automated snapshot. Default value is 0 hours.

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptions?

        # Service software update options for the domain.

        @[JSON::Field(key: "SoftwareUpdateOptions")]
        getter software_update_options : Types::SoftwareUpdateOptions?

        # Options to specify the subnets and security groups for a VPC endpoint. For more information, see
        # Launching your Amazon OpenSearch Service domains using a VPC .

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCOptions?

        def initialize(
          @domain_name : String,
          @aiml_options : Types::AIMLOptionsInput? = nil,
          @access_policies : String? = nil,
          @advanced_options : Hash(String, String)? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
          @auto_tune_options : Types::AutoTuneOptions? = nil,
          @cluster_config : Types::ClusterConfig? = nil,
          @cognito_options : Types::CognitoOptions? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptions? = nil,
          @dry_run : Bool? = nil,
          @dry_run_mode : String? = nil,
          @ebs_options : Types::EBSOptions? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @ip_address_type : String? = nil,
          @identity_center_options : Types::IdentityCenterOptionsInput? = nil,
          @log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
          @off_peak_window_options : Types::OffPeakWindowOptions? = nil,
          @snapshot_options : Types::SnapshotOptions? = nil,
          @software_update_options : Types::SoftwareUpdateOptions? = nil,
          @vpc_options : Types::VPCOptions? = nil
        )
        end
      end

      # The results of an UpdateDomain request. Contains the status of the domain being updated.

      struct UpdateDomainConfigResponse
        include JSON::Serializable

        # The status of the updated domain.

        @[JSON::Field(key: "DomainConfig")]
        getter domain_config : Types::DomainConfig

        # The status of the dry run being performed on the domain, if any.

        @[JSON::Field(key: "DryRunProgressStatus")]
        getter dry_run_progress_status : Types::DryRunProgressStatus?

        # Results of the dry run performed in the update domain request.

        @[JSON::Field(key: "DryRunResults")]
        getter dry_run_results : Types::DryRunResults?

        def initialize(
          @domain_config : Types::DomainConfig,
          @dry_run_progress_status : Types::DryRunProgressStatus? = nil,
          @dry_run_results : Types::DryRunResults? = nil
        )
        end
      end


      struct UpdateIndexRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the index to update.

        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The updated JSON schema for the index including any changes to mappings, settings, and semantic
        # enrichment configuration.

        @[JSON::Field(key: "IndexSchema")]
        getter index_schema : Types::IndexSchema

        def initialize(
          @domain_name : String,
          @index_name : String,
          @index_schema : Types::IndexSchema
        )
        end
      end


      struct UpdateIndexResponse
        include JSON::Serializable

        # The status of the index update operation.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Container for request parameters to the UpdatePackage operation.

      struct UpdatePackageRequest
        include JSON::Serializable

        # The unique identifier for the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # Amazon S3 bucket and key for the package.

        @[JSON::Field(key: "PackageSource")]
        getter package_source : Types::PackageSource

        # Commit message for the updated file, which is shown as part of GetPackageVersionHistoryResponse .

        @[JSON::Field(key: "CommitMessage")]
        getter commit_message : String?

        # The updated configuration details for a package.

        @[JSON::Field(key: "PackageConfiguration")]
        getter package_configuration : Types::PackageConfiguration?

        # A new description of the package.

        @[JSON::Field(key: "PackageDescription")]
        getter package_description : String?

        # Encryption options for a package.

        @[JSON::Field(key: "PackageEncryptionOptions")]
        getter package_encryption_options : Types::PackageEncryptionOptions?

        def initialize(
          @package_id : String,
          @package_source : Types::PackageSource,
          @commit_message : String? = nil,
          @package_configuration : Types::PackageConfiguration? = nil,
          @package_description : String? = nil,
          @package_encryption_options : Types::PackageEncryptionOptions? = nil
        )
        end
      end

      # Container for the response returned by the UpdatePackage operation.

      struct UpdatePackageResponse
        include JSON::Serializable

        # Information about a package.

        @[JSON::Field(key: "PackageDetails")]
        getter package_details : Types::PackageDetails?

        def initialize(
          @package_details : Types::PackageDetails? = nil
        )
        end
      end


      struct UpdatePackageScopeRequest
        include JSON::Serializable

        # The operation to perform on the package scope (e.g., add/remove/override users).

        @[JSON::Field(key: "Operation")]
        getter operation : String

        # ID of the package whose scope is being updated.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # List of users to be added or removed from the package scope.

        @[JSON::Field(key: "PackageUserList")]
        getter package_user_list : Array(String)

        def initialize(
          @operation : String,
          @package_id : String,
          @package_user_list : Array(String)
        )
        end
      end


      struct UpdatePackageScopeResponse
        include JSON::Serializable

        # The operation that was performed on the package scope.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # ID of the package whose scope was updated.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String?

        # List of users who have access to the package after the scope update.

        @[JSON::Field(key: "PackageUserList")]
        getter package_user_list : Array(String)?

        def initialize(
          @operation : String? = nil,
          @package_id : String? = nil,
          @package_user_list : Array(String)? = nil
        )
        end
      end


      struct UpdateScheduledActionRequest
        include JSON::Serializable

        # The unique identifier of the action to reschedule. To retrieve this ID, send a ListScheduledActions
        # request.

        @[JSON::Field(key: "ActionID")]
        getter action_id : String

        # The type of action to reschedule. Can be one of SERVICE_SOFTWARE_UPDATE , JVM_HEAP_SIZE_TUNING , or
        # JVM_YOUNG_GEN_TUNING . To retrieve this value, send a ListScheduledActions request.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String

        # The name of the domain to reschedule an action for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # When to schedule the action. NOW - Immediately schedules the update to happen in the current hour if
        # there's capacity available. TIMESTAMP - Lets you specify a custom date and time to apply the update.
        # If you specify this value, you must also provide a value for DesiredStartTime . OFF_PEAK_WINDOW -
        # Marks the action to be picked up during an upcoming off-peak window. There's no guarantee that the
        # change will be implemented during the next immediate window. Depending on capacity, it might happen
        # in subsequent days.

        @[JSON::Field(key: "ScheduleAt")]
        getter schedule_at : String

        # The time to implement the change, in Coordinated Universal Time (UTC). Only specify this parameter
        # if you set ScheduleAt to TIMESTAMP .

        @[JSON::Field(key: "DesiredStartTime")]
        getter desired_start_time : Int64?

        def initialize(
          @action_id : String,
          @action_type : String,
          @domain_name : String,
          @schedule_at : String,
          @desired_start_time : Int64? = nil
        )
        end
      end


      struct UpdateScheduledActionResponse
        include JSON::Serializable

        # Information about the rescheduled action.

        @[JSON::Field(key: "ScheduledAction")]
        getter scheduled_action : Types::ScheduledAction?

        def initialize(
          @scheduled_action : Types::ScheduledAction? = nil
        )
        end
      end


      struct UpdateVpcEndpointRequest
        include JSON::Serializable

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String

        # The security groups and/or subnets to add, remove, or modify.

        @[JSON::Field(key: "VpcOptions")]
        getter vpc_options : Types::VPCOptions

        def initialize(
          @vpc_endpoint_id : String,
          @vpc_options : Types::VPCOptions
        )
        end
      end


      struct UpdateVpcEndpointResponse
        include JSON::Serializable

        # The endpoint to be updated.

        @[JSON::Field(key: "VpcEndpoint")]
        getter vpc_endpoint : Types::VpcEndpoint

        def initialize(
          @vpc_endpoint : Types::VpcEndpoint
        )
        end
      end

      # Container for the request parameters to the UpgradeDomain operation.

      struct UpgradeDomainRequest
        include JSON::Serializable

        # Name of the OpenSearch Service domain that you want to upgrade.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # OpenSearch or Elasticsearch version to which you want to upgrade, in the format Opensearch_X.Y or
        # Elasticsearch_X.Y.

        @[JSON::Field(key: "TargetVersion")]
        getter target_version : String

        # Only supports the override_main_response_version parameter and not other advanced options. You can
        # only include this option when upgrading to an OpenSearch version. Specifies whether the domain
        # reports its version as 7.10 so that it continues to work with Elasticsearch OSS clients and plugins.

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # When true, indicates that an upgrade eligibility check needs to be performed. Does not actually
        # perform the upgrade.

        @[JSON::Field(key: "PerformCheckOnly")]
        getter perform_check_only : Bool?

        def initialize(
          @domain_name : String,
          @target_version : String,
          @advanced_options : Hash(String, String)? = nil,
          @perform_check_only : Bool? = nil
        )
        end
      end

      # Container for the response returned by UpgradeDomain operation.

      struct UpgradeDomainResponse
        include JSON::Serializable

        # The advanced options configuration for the domain.

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # Container for information about a configuration change happening on a domain.

        @[JSON::Field(key: "ChangeProgressDetails")]
        getter change_progress_details : Types::ChangeProgressDetails?

        # The name of the domain that was upgraded.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # When true, indicates that an upgrade eligibility check was performed.

        @[JSON::Field(key: "PerformCheckOnly")]
        getter perform_check_only : Bool?

        # OpenSearch or Elasticsearch version that the domain was upgraded to.

        @[JSON::Field(key: "TargetVersion")]
        getter target_version : String?

        # The unique identifier of the domain upgrade.

        @[JSON::Field(key: "UpgradeId")]
        getter upgrade_id : String?

        def initialize(
          @advanced_options : Hash(String, String)? = nil,
          @change_progress_details : Types::ChangeProgressDetails? = nil,
          @domain_name : String? = nil,
          @perform_check_only : Bool? = nil,
          @target_version : String? = nil,
          @upgrade_id : String? = nil
        )
        end
      end

      # History of the last 10 upgrades and upgrade eligibility checks for an Amazon OpenSearch Service
      # domain.

      struct UpgradeHistory
        include JSON::Serializable

        # UTC timestamp at which the upgrade API call was made, in the format yyyy-MM-ddTHH:mm:ssZ .

        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time?

        # A list of each step performed as part of a specific upgrade or upgrade eligibility check.

        @[JSON::Field(key: "StepsList")]
        getter steps_list : Array(Types::UpgradeStepItem)?

        # A string that describes the upgrade.

        @[JSON::Field(key: "UpgradeName")]
        getter upgrade_name : String?

        # The current status of the upgrade. The status can take one of the following values: In Progress
        # Succeeded Succeeded with Issues Failed

        @[JSON::Field(key: "UpgradeStatus")]
        getter upgrade_status : String?

        def initialize(
          @start_timestamp : Time? = nil,
          @steps_list : Array(Types::UpgradeStepItem)? = nil,
          @upgrade_name : String? = nil,
          @upgrade_status : String? = nil
        )
        end
      end

      # Represents a single step of an upgrade or upgrade eligibility check workflow.

      struct UpgradeStepItem
        include JSON::Serializable

        # A list of strings containing detailed information about the errors encountered in a particular step.

        @[JSON::Field(key: "Issues")]
        getter issues : Array(String)?

        # The floating point value representing the progress percentage of a particular step.

        @[JSON::Field(key: "ProgressPercent")]
        getter progress_percent : Float64?

        # One of three steps that an upgrade or upgrade eligibility check goes through: PreUpgradeCheck
        # Snapshot Upgrade

        @[JSON::Field(key: "UpgradeStep")]
        getter upgrade_step : String?

        # The current status of the upgrade. The status can take one of the following values: In Progress
        # Succeeded Succeeded with Issues Failed

        @[JSON::Field(key: "UpgradeStepStatus")]
        getter upgrade_step_status : String?

        def initialize(
          @issues : Array(String)? = nil,
          @progress_percent : Float64? = nil,
          @upgrade_step : String? = nil,
          @upgrade_step_status : String? = nil
        )
        end
      end

      # Information about the subnets and security groups for an Amazon OpenSearch Service domain
      # provisioned within a virtual private cloud (VPC). For more information, see Launching your Amazon
      # OpenSearch Service domains using a VPC . This information only exists if the domain was created with
      # VPCOptions .

      struct VPCDerivedInfo
        include JSON::Serializable

        # The list of Availability Zones associated with the VPC subnets.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The list of security group IDs associated with the VPC endpoints for the domain.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of subnet IDs associated with the VPC endpoints for the domain.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The ID for your VPC. Amazon VPC generates this value when you create a VPC.

        @[JSON::Field(key: "VPCId")]
        getter vpc_id : String?

        def initialize(
          @availability_zones : Array(String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Status of the VPC options for a specified domain.

      struct VPCDerivedInfoStatus
        include JSON::Serializable

        # The VPC options for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::VPCDerivedInfo

        # The status of the VPC options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::VPCDerivedInfo,
          @status : Types::OptionStatus
        )
        end
      end

      # Options to specify the subnets and security groups for an Amazon OpenSearch Service VPC endpoint.
      # For more information, see Launching your Amazon OpenSearch Service domains using a VPC .

      struct VPCOptions
        include JSON::Serializable

        # The list of security group IDs associated with the VPC endpoints for the domain. If you do not
        # provide a security group ID, OpenSearch Service uses the default security group for the VPC.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of subnet IDs associated with the VPC endpoints for the domain. If your domain uses multiple
        # Availability Zones, you need to provide two subnet IDs, one per zone. Otherwise, provide only one.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # An exception for accessing or deleting a resource that doesn't exist.

      struct ValidationException
        include JSON::Serializable

        def initialize
        end
      end

      # A validation failure that occurred as the result of a pre-update validation check (verbose dry run)
      # on a domain.

      struct ValidationFailure
        include JSON::Serializable

        # The error code of the failure.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # A message corresponding to the failure.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The status of the the OpenSearch or Elasticsearch version options for the specified Amazon
      # OpenSearch Service domain.

      struct VersionStatus
        include JSON::Serializable

        # The OpenSearch or Elasticsearch version for the specified domain.

        @[JSON::Field(key: "Options")]
        getter options : String

        # The status of the version options for the specified domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : String,
          @status : Types::OptionStatus
        )
        end
      end

      # The connection endpoint for connecting to an Amazon OpenSearch Service domain through a proxy.

      struct VpcEndpoint
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain associated with the endpoint.

        @[JSON::Field(key: "DomainArn")]
        getter domain_arn : String?

        # The connection endpoint ID for connecting to the domain.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The current status of the endpoint.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The creator of the endpoint.

        @[JSON::Field(key: "VpcEndpointOwner")]
        getter vpc_endpoint_owner : String?

        # Options to specify the subnets and security groups for an Amazon OpenSearch Service VPC endpoint.

        @[JSON::Field(key: "VpcOptions")]
        getter vpc_options : Types::VPCDerivedInfo?

        def initialize(
          @domain_arn : String? = nil,
          @endpoint : String? = nil,
          @status : String? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_endpoint_owner : String? = nil,
          @vpc_options : Types::VPCDerivedInfo? = nil
        )
        end
      end

      # Error information when attempting to describe an Amazon OpenSearch Service-managed VPC endpoint.

      struct VpcEndpointError
        include JSON::Serializable

        # The code associated with the error.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A message describing the error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      # Summary information for an Amazon OpenSearch Service-managed VPC endpoint.

      struct VpcEndpointSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain associated with the endpoint.

        @[JSON::Field(key: "DomainArn")]
        getter domain_arn : String?

        # The current status of the endpoint.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The creator of the endpoint.

        @[JSON::Field(key: "VpcEndpointOwner")]
        getter vpc_endpoint_owner : String?

        def initialize(
          @domain_arn : String? = nil,
          @status : String? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_endpoint_owner : String? = nil
        )
        end
      end

      # The desired start time for an off-peak maintenance window .

      struct WindowStartTime
        include JSON::Serializable

        # The start hour of the window in Coordinated Universal Time (UTC), using 24-hour time. For example,
        # 17 refers to 5:00 P.M. UTC.

        @[JSON::Field(key: "Hours")]
        getter hours : Int64

        # The start minute of the window, in UTC.

        @[JSON::Field(key: "Minutes")]
        getter minutes : Int64

        def initialize(
          @hours : Int64,
          @minutes : Int64
        )
        end
      end

      # The zone awareness configuration for an Amazon OpenSearch Service domain.

      struct ZoneAwarenessConfig
        include JSON::Serializable

        # If you enabled multiple Availability Zones, this value is the number of zones that you want the
        # domain to use. Valid values are 2 and 3 . If your domain is provisioned within a VPC, this value be
        # equal to number of subnets.

        @[JSON::Field(key: "AvailabilityZoneCount")]
        getter availability_zone_count : Int32?

        def initialize(
          @availability_zone_count : Int32? = nil
        )
        end
      end
    end
  end
end
