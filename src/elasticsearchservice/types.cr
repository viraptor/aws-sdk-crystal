require "json"
require "time"

module Aws
  module ElasticsearchService
    module Types

      # Container for the parameters to the AcceptInboundCrossClusterSearchConnection operation.

      struct AcceptInboundCrossClusterSearchConnectionRequest
        include JSON::Serializable

        # The id of the inbound connection that you want to accept.

        @[JSON::Field(key: "ConnectionId")]
        getter cross_cluster_search_connection_id : String

        def initialize(
          @cross_cluster_search_connection_id : String
        )
        end
      end

      # The result of a AcceptInboundCrossClusterSearchConnection operation. Contains details of accepted
      # inbound connection.

      struct AcceptInboundCrossClusterSearchConnectionResponse
        include JSON::Serializable

        # Specifies the InboundCrossClusterSearchConnection of accepted inbound connection.

        @[JSON::Field(key: "CrossClusterSearchConnection")]
        getter cross_cluster_search_connection : Types::InboundCrossClusterSearchConnection?

        def initialize(
          @cross_cluster_search_connection : Types::InboundCrossClusterSearchConnection? = nil
        )
        end
      end

      # An error occurred because user does not have permissions to access the resource. Returns HTTP status
      # code 403.

      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # The configured access rules for the domain's document and search endpoints, and the current status
      # of those rules.

      struct AccessPoliciesStatus
        include JSON::Serializable

        # The access policy configured for the Elasticsearch domain. Access policies may be resource-based,
        # IP-based, or IAM-based. See Configuring Access Policies for more information.

        @[JSON::Field(key: "Options")]
        getter options : String

        # The status of the access policy for the Elasticsearch domain. See OptionStatus for the status
        # information that's included.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : String,
          @status : Types::OptionStatus
        )
        end
      end

      # Container for the parameters to the AddTags operation. Specify the tags that you want to attach to
      # the Elasticsearch domain.

      struct AddTagsRequest
        include JSON::Serializable

        # Specify the ARN for which you want to add the tags.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # List of Tag that need to be added for the Elasticsearch domain.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)

        def initialize(
          @arn : String,
          @tag_list : Array(Types::Tag)
        )
        end
      end

      # List of limits that are specific to a given InstanceType and for each of it's InstanceRole .

      struct AdditionalLimit
        include JSON::Serializable

        # Name of Additional Limit is specific to a given InstanceType and for each of it's InstanceRole etc.
        # Attributes and their details: MaximumNumberOfDataNodesSupported This attribute will be present in
        # Master node only to specify how much data nodes upto which given ESPartitionInstanceType can support
        # as master node. MaximumNumberOfDataNodesWithoutMasterNode This attribute will be present in Data
        # node only to specify how much data nodes of given ESPartitionInstanceType upto which you don't need
        # any master nodes to govern them.

        @[JSON::Field(key: "LimitName")]
        getter limit_name : String?

        # Value for given AdditionalLimit$LimitName .

        @[JSON::Field(key: "LimitValues")]
        getter limit_values : Array(String)?

        def initialize(
          @limit_name : String? = nil,
          @limit_values : Array(String)? = nil
        )
        end
      end

      # Status of the advanced options for the specified Elasticsearch domain. Currently, the following
      # advanced options are available: Option to allow references to indices in an HTTP request body. Must
      # be false when configuring access to individual sub-resources. By default, the value is true . See
      # Configuration Advanced Options for more information. Option to specify the percentage of heap space
      # that is allocated to field data. By default, this setting is unbounded. For more information, see
      # Configuring Advanced Options .

      struct AdvancedOptionsStatus
        include JSON::Serializable

        # Specifies the status of advanced options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Hash(String, String)

        # Specifies the status of OptionStatus for advanced options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Hash(String, String),
          @status : Types::OptionStatus
        )
        end
      end

      # Specifies the advanced security configuration: whether advanced security is enabled, whether the
      # internal database option is enabled.

      struct AdvancedSecurityOptions
        include JSON::Serializable

        # Specifies the Anonymous Auth Disable Date when Anonymous Auth is enabled.

        @[JSON::Field(key: "AnonymousAuthDisableDate")]
        getter anonymous_auth_disable_date : Time?

        # True if Anonymous auth is enabled. Anonymous auth can be enabled only when AdvancedSecurity is
        # enabled on existing domains.

        @[JSON::Field(key: "AnonymousAuthEnabled")]
        getter anonymous_auth_enabled : Bool?

        # True if advanced security is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # True if the internal user database is enabled.

        @[JSON::Field(key: "InternalUserDatabaseEnabled")]
        getter internal_user_database_enabled : Bool?

        # Describes the SAML application configured for a domain.

        @[JSON::Field(key: "SAMLOptions")]
        getter saml_options : Types::SAMLOptionsOutput?

        def initialize(
          @anonymous_auth_disable_date : Time? = nil,
          @anonymous_auth_enabled : Bool? = nil,
          @enabled : Bool? = nil,
          @internal_user_database_enabled : Bool? = nil,
          @saml_options : Types::SAMLOptionsOutput? = nil
        )
        end
      end

      # Specifies the advanced security configuration: whether advanced security is enabled, whether the
      # internal database option is enabled, master username and password (if internal database is enabled),
      # and master user ARN (if IAM is enabled).

      struct AdvancedSecurityOptionsInput
        include JSON::Serializable

        # True if Anonymous auth is enabled. Anonymous auth can be enabled only when AdvancedSecurity is
        # enabled on existing domains.

        @[JSON::Field(key: "AnonymousAuthEnabled")]
        getter anonymous_auth_enabled : Bool?

        # True if advanced security is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # True if the internal user database is enabled.

        @[JSON::Field(key: "InternalUserDatabaseEnabled")]
        getter internal_user_database_enabled : Bool?

        # Credentials for the master user: username and password, ARN, or both.

        @[JSON::Field(key: "MasterUserOptions")]
        getter master_user_options : Types::MasterUserOptions?

        # Specifies the SAML application configuration for the domain.

        @[JSON::Field(key: "SAMLOptions")]
        getter saml_options : Types::SAMLOptionsInput?

        def initialize(
          @anonymous_auth_enabled : Bool? = nil,
          @enabled : Bool? = nil,
          @internal_user_database_enabled : Bool? = nil,
          @master_user_options : Types::MasterUserOptions? = nil,
          @saml_options : Types::SAMLOptionsInput? = nil
        )
        end
      end

      # Specifies the status of advanced security options for the specified Elasticsearch domain.

      struct AdvancedSecurityOptionsStatus
        include JSON::Serializable

        # Specifies advanced security options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::AdvancedSecurityOptions

        # Status of the advanced security options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::AdvancedSecurityOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Container for request parameters to AssociatePackage operation.

      struct AssociatePackageRequest
        include JSON::Serializable

        # Name of the domain that you want to associate the package with.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Internal ID of the package that you want to associate with a domain. Use DescribePackages to find
        # this value.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        def initialize(
          @domain_name : String,
          @package_id : String
        )
        end
      end

      # Container for response returned by AssociatePackage operation.

      struct AssociatePackageResponse
        include JSON::Serializable

        # DomainPackageDetails

        @[JSON::Field(key: "DomainPackageDetails")]
        getter domain_package_details : Types::DomainPackageDetails?

        def initialize(
          @domain_package_details : Types::DomainPackageDetails? = nil
        )
        end
      end

      # Container for request parameters to the AuthorizeVpcEndpointAccess operation. Specifies the account
      # to be permitted to manage VPC endpoints against the domain.

      struct AuthorizeVpcEndpointAccessRequest
        include JSON::Serializable

        # The account ID to grant access to.

        @[JSON::Field(key: "Account")]
        getter account : String

        # The name of the OpenSearch Service domain to provide access to.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @account : String,
          @domain_name : String
        )
        end
      end

      # Container for response parameters to the AuthorizeVpcEndpointAccess operation. Contains the account
      # ID and the type of the account being authorized to access the VPC endpoint.

      struct AuthorizeVpcEndpointAccessResponse
        include JSON::Serializable

        # Information about the account or service that was provided access to the domain.

        @[JSON::Field(key: "AuthorizedPrincipal")]
        getter authorized_principal : Types::AuthorizedPrincipal

        def initialize(
          @authorized_principal : Types::AuthorizedPrincipal
        )
        end
      end

      # Information about an account or service that has access to an Amazon OpenSearch Service domain
      # through the use of an interface VPC endpoint.

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

      # Specifies Auto-Tune type and Auto-Tune action details.

      struct AutoTune
        include JSON::Serializable

        # Specifies details of the Auto-Tune action. See the Developer Guide for more information.

        @[JSON::Field(key: "AutoTuneDetails")]
        getter auto_tune_details : Types::AutoTuneDetails?

        # Specifies Auto-Tune type. Valid value is SCHEDULED_ACTION.

        @[JSON::Field(key: "AutoTuneType")]
        getter auto_tune_type : String?

        def initialize(
          @auto_tune_details : Types::AutoTuneDetails? = nil,
          @auto_tune_type : String? = nil
        )
        end
      end

      # Specifies details of the Auto-Tune action. See the Developer Guide for more information.

      struct AutoTuneDetails
        include JSON::Serializable


        @[JSON::Field(key: "ScheduledAutoTuneDetails")]
        getter scheduled_auto_tune_details : Types::ScheduledAutoTuneDetails?

        def initialize(
          @scheduled_auto_tune_details : Types::ScheduledAutoTuneDetails? = nil
        )
        end
      end

      # Specifies Auto-Tune maitenance schedule. See the Developer Guide for more information.

      struct AutoTuneMaintenanceSchedule
        include JSON::Serializable

        # Specifies cron expression for a recurring maintenance schedule. See the Developer Guide for more
        # information.

        @[JSON::Field(key: "CronExpressionForRecurrence")]
        getter cron_expression_for_recurrence : String?

        # Specifies maintenance schedule duration: duration value and duration unit. See the Developer Guide
        # for more information.

        @[JSON::Field(key: "Duration")]
        getter duration : Types::Duration?

        # Specifies timestamp at which Auto-Tune maintenance schedule start.

        @[JSON::Field(key: "StartAt")]
        getter start_at : Time?

        def initialize(
          @cron_expression_for_recurrence : String? = nil,
          @duration : Types::Duration? = nil,
          @start_at : Time? = nil
        )
        end
      end

      # Specifies the Auto-Tune options: the Auto-Tune desired state for the domain, rollback state when
      # disabling Auto-Tune options and list of maintenance schedules.

      struct AutoTuneOptions
        include JSON::Serializable

        # Specifies the Auto-Tune desired state. Valid values are ENABLED, DISABLED.

        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # Specifies list of maitenance schedules. See the Developer Guide for more information.

        @[JSON::Field(key: "MaintenanceSchedules")]
        getter maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)?

        # Specifies the rollback state while disabling Auto-Tune for the domain. Valid values are NO_ROLLBACK,
        # DEFAULT_ROLLBACK.

        @[JSON::Field(key: "RollbackOnDisable")]
        getter rollback_on_disable : String?

        def initialize(
          @desired_state : String? = nil,
          @maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)? = nil,
          @rollback_on_disable : String? = nil
        )
        end
      end

      # Specifies the Auto-Tune options: the Auto-Tune desired state for the domain and list of maintenance
      # schedules.

      struct AutoTuneOptionsInput
        include JSON::Serializable

        # Specifies the Auto-Tune desired state. Valid values are ENABLED, DISABLED.

        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # Specifies list of maitenance schedules. See the Developer Guide for more information.

        @[JSON::Field(key: "MaintenanceSchedules")]
        getter maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)?

        def initialize(
          @desired_state : String? = nil,
          @maintenance_schedules : Array(Types::AutoTuneMaintenanceSchedule)? = nil
        )
        end
      end

      # Specifies the Auto-Tune options: the Auto-Tune desired state for the domain and list of maintenance
      # schedules.

      struct AutoTuneOptionsOutput
        include JSON::Serializable

        # Specifies the error message while enabling or disabling the Auto-Tune.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Specifies the AutoTuneState for the Elasticsearch domain.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @error_message : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Specifies the status of Auto-Tune options for the specified Elasticsearch domain.

      struct AutoTuneOptionsStatus
        include JSON::Serializable

        # Specifies Auto-Tune options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::AutoTuneOptions?

        # Specifies Status of the Auto-Tune options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::AutoTuneStatus?

        def initialize(
          @options : Types::AutoTuneOptions? = nil,
          @status : Types::AutoTuneStatus? = nil
        )
        end
      end

      # Provides the current status of the Auto-Tune options.

      struct AutoTuneStatus
        include JSON::Serializable

        # Timestamp which tells Auto-Tune options creation date .

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # Specifies the AutoTuneState for the Elasticsearch domain.

        @[JSON::Field(key: "State")]
        getter state : String

        # Timestamp which tells Auto-Tune options last updated time.

        @[JSON::Field(key: "UpdateDate")]
        getter update_date : Time

        # Specifies the error message while enabling or disabling the Auto-Tune options.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Indicates whether the Elasticsearch domain is being deleted.

        @[JSON::Field(key: "PendingDeletion")]
        getter pending_deletion : Bool?

        # Specifies the Auto-Tune options latest version.

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

      # Container for parameters of the CancelDomainConfigChange operation.

      struct CancelDomainConfigChangeRequest
        include JSON::Serializable

        # Name of the OpenSearch Service domain configuration request to cancel.

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

      # Contains the details of the cancelled domain config change.

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

      # Container for the parameters to the CancelElasticsearchServiceSoftwareUpdate operation. Specifies
      # the name of the Elasticsearch domain that you wish to cancel a service software update on.

      struct CancelElasticsearchServiceSoftwareUpdateRequest
        include JSON::Serializable

        # The name of the domain that you want to stop the latest service software update on.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a CancelElasticsearchServiceSoftwareUpdate operation. Contains the status of the
      # update.

      struct CancelElasticsearchServiceSoftwareUpdateResponse
        include JSON::Serializable

        # The current status of the Elasticsearch service software update.

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

      # Specifies change details of the domain configuration change.

      struct ChangeProgressDetails
        include JSON::Serializable

        # The unique change identifier associated with a specific domain configuration change.

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

        # Contains an optional message associated with the domain configuration change.

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

      # A progress stage details of a specific domain configuration change.

      struct ChangeProgressStage
        include JSON::Serializable

        # The description of the progress stage.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The last updated timestamp of the progress stage.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The name of the specific progress stage.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The overall status of a specific progress stage.

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

        # The list of properties involved in the domain configuration change that are completed.

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

        # The list of properties involved in the domain configuration change that are still in pending.

        @[JSON::Field(key: "PendingProperties")]
        getter pending_properties : Array(String)?

        # The time at which the configuration change is made on the domain.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The overall status of the domain configuration change. This field can take the following values:
        # PENDING , PROCESSING , COMPLETED and FAILED

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

      # Options to specify the Cognito user and identity pools for Kibana authentication. For more
      # information, see Amazon Cognito Authentication for Kibana .

      struct CognitoOptions
        include JSON::Serializable

        # Specifies the option to enable Cognito for Kibana authentication.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies the Cognito identity pool ID for Kibana authentication.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # Specifies the role ARN that provides Elasticsearch permissions for accessing Cognito resources.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Specifies the Cognito user pool ID for Kibana authentication.

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

      # Status of the Cognito options for the specified Elasticsearch domain.

      struct CognitoOptionsStatus
        include JSON::Serializable

        # Specifies the Cognito options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::CognitoOptions

        # Specifies the status of the Cognito options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::CognitoOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Specifies the configuration for cold storage options such as enabled

      struct ColdStorageOptions
        include JSON::Serializable

        # Enable cold storage option. Accepted values true or false

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # A map from an ElasticsearchVersion to a list of compatible ElasticsearchVersion s to which the
      # domain can be upgraded.

      struct CompatibleVersionsMap
        include JSON::Serializable

        # The current version of Elasticsearch on which a domain is.

        @[JSON::Field(key: "SourceVersion")]
        getter source_version : String?


        @[JSON::Field(key: "TargetVersions")]
        getter target_versions : Array(String)?

        def initialize(
          @source_version : String? = nil,
          @target_versions : Array(String)? = nil
        )
        end
      end

      # An error occurred because the client attempts to remove a resource that is currently in use. Returns
      # HTTP status code 409.

      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateElasticsearchDomainRequest
        include JSON::Serializable

        # The name of the Elasticsearch domain that you are creating. Domain names are unique across the
        # domains owned by an account within an AWS region. Domain names must start with a lowercase letter
        # and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # IAM access policy as a JSON-formatted string.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : String?

        # Option to allow references to indices in an HTTP request body. Must be false when configuring access
        # to individual sub-resources. By default, the value is true . See Configuration Advanced Options for
        # more information.

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # Specifies advanced security options.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptionsInput?

        # Specifies Auto-Tune options.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptionsInput?

        # Options to specify the Cognito user and identity pools for Kibana authentication. For more
        # information, see Amazon Cognito Authentication for Kibana .

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptions?

        # Options to specify configuration that will be applied to the domain endpoint.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptions?

        # Options to enable, disable and specify the type and size of EBS storage volumes.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptions?

        # Configuration options for an Elasticsearch domain. Specifies the instance type and number of
        # instances in the domain cluster.

        @[JSON::Field(key: "ElasticsearchClusterConfig")]
        getter elasticsearch_cluster_config : Types::ElasticsearchClusterConfig?

        # String of format X.Y to specify version for the Elasticsearch domain eg. "1.5" or "2.3". For more
        # information, see Creating Elasticsearch Domains in the Amazon Elasticsearch Service Developer Guide
        # .

        @[JSON::Field(key: "ElasticsearchVersion")]
        getter elasticsearch_version : String?

        # Specifies the Encryption At Rest Options.

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # Map of LogType and LogPublishingOption , each containing options to publish a given type of
        # Elasticsearch log.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Hash(String, Types::LogPublishingOption)?

        # Specifies the NodeToNodeEncryptionOptions.

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions?

        # Option to set time, in UTC format, of the daily automated snapshot. Default value is 0 hours.

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptions?

        # A list of Tag added during domain creation.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        # Options to specify the subnets and security groups for VPC endpoint. For more information, see
        # Creating a VPC in VPC Endpoints for Amazon Elasticsearch Service Domains

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCOptions?

        def initialize(
          @domain_name : String,
          @access_policies : String? = nil,
          @advanced_options : Hash(String, String)? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
          @auto_tune_options : Types::AutoTuneOptionsInput? = nil,
          @cognito_options : Types::CognitoOptions? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptions? = nil,
          @ebs_options : Types::EBSOptions? = nil,
          @elasticsearch_cluster_config : Types::ElasticsearchClusterConfig? = nil,
          @elasticsearch_version : String? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
          @snapshot_options : Types::SnapshotOptions? = nil,
          @tag_list : Array(Types::Tag)? = nil,
          @vpc_options : Types::VPCOptions? = nil
        )
        end
      end

      # The result of a CreateElasticsearchDomain operation. Contains the status of the newly created
      # Elasticsearch domain.

      struct CreateElasticsearchDomainResponse
        include JSON::Serializable

        # The status of the newly created Elasticsearch domain.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::ElasticsearchDomainStatus?

        def initialize(
          @domain_status : Types::ElasticsearchDomainStatus? = nil
        )
        end
      end

      # Container for the parameters to the CreateOutboundCrossClusterSearchConnection operation.

      struct CreateOutboundCrossClusterSearchConnectionRequest
        include JSON::Serializable

        # Specifies the connection alias that will be used by the customer for this connection.

        @[JSON::Field(key: "ConnectionAlias")]
        getter connection_alias : String

        # Specifies the DomainInformation for the destination Elasticsearch domain.

        @[JSON::Field(key: "DestinationDomainInfo")]
        getter destination_domain_info : Types::DomainInformation

        # Specifies the DomainInformation for the source Elasticsearch domain.

        @[JSON::Field(key: "SourceDomainInfo")]
        getter source_domain_info : Types::DomainInformation

        def initialize(
          @connection_alias : String,
          @destination_domain_info : Types::DomainInformation,
          @source_domain_info : Types::DomainInformation
        )
        end
      end

      # The result of a CreateOutboundCrossClusterSearchConnection request. Contains the details of the
      # newly created cross-cluster search connection.

      struct CreateOutboundCrossClusterSearchConnectionResponse
        include JSON::Serializable

        # Specifies the connection alias provided during the create connection request.

        @[JSON::Field(key: "ConnectionAlias")]
        getter connection_alias : String?

        # Specifies the OutboundCrossClusterSearchConnectionStatus for the newly created connection.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::OutboundCrossClusterSearchConnectionStatus?

        # Unique id for the created outbound connection, which is used for subsequent operations on
        # connection.

        @[JSON::Field(key: "CrossClusterSearchConnectionId")]
        getter cross_cluster_search_connection_id : String?

        # Specifies the DomainInformation for the destination Elasticsearch domain.

        @[JSON::Field(key: "DestinationDomainInfo")]
        getter destination_domain_info : Types::DomainInformation?

        # Specifies the DomainInformation for the source Elasticsearch domain.

        @[JSON::Field(key: "SourceDomainInfo")]
        getter source_domain_info : Types::DomainInformation?

        def initialize(
          @connection_alias : String? = nil,
          @connection_status : Types::OutboundCrossClusterSearchConnectionStatus? = nil,
          @cross_cluster_search_connection_id : String? = nil,
          @destination_domain_info : Types::DomainInformation? = nil,
          @source_domain_info : Types::DomainInformation? = nil
        )
        end
      end

      # Container for request parameters to CreatePackage operation.

      struct CreatePackageRequest
        include JSON::Serializable

        # Unique identifier for the package.

        @[JSON::Field(key: "PackageName")]
        getter package_name : String

        # The customer S3 location PackageSource for importing the package.

        @[JSON::Field(key: "PackageSource")]
        getter package_source : Types::PackageSource

        # Type of package. Currently supports only TXT-DICTIONARY.

        @[JSON::Field(key: "PackageType")]
        getter package_type : String

        # Description of the package.

        @[JSON::Field(key: "PackageDescription")]
        getter package_description : String?

        def initialize(
          @package_name : String,
          @package_source : Types::PackageSource,
          @package_type : String,
          @package_description : String? = nil
        )
        end
      end

      # Container for response returned by CreatePackage operation.

      struct CreatePackageResponse
        include JSON::Serializable

        # Information about the package PackageDetails .

        @[JSON::Field(key: "PackageDetails")]
        getter package_details : Types::PackageDetails?

        def initialize(
          @package_details : Types::PackageDetails? = nil
        )
        end
      end

      # Container for the parameters to the CreateVpcEndpointRequest operation.

      struct CreateVpcEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain to grant access to.

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

      # Container for response parameters to the CreateVpcEndpoint operation. Contains the configuration and
      # status of the VPC Endpoint being created.

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

      # Container for the parameters to the DeleteElasticsearchDomain operation. Specifies the name of the
      # Elasticsearch domain that you want to delete.

      struct DeleteElasticsearchDomainRequest
        include JSON::Serializable

        # The name of the Elasticsearch domain that you want to permanently delete.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a DeleteElasticsearchDomain request. Contains the status of the pending deletion, or
      # no status if the domain and all of its resources have been deleted.

      struct DeleteElasticsearchDomainResponse
        include JSON::Serializable

        # The status of the Elasticsearch domain being deleted.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::ElasticsearchDomainStatus?

        def initialize(
          @domain_status : Types::ElasticsearchDomainStatus? = nil
        )
        end
      end

      # Container for the parameters to the DeleteInboundCrossClusterSearchConnection operation.

      struct DeleteInboundCrossClusterSearchConnectionRequest
        include JSON::Serializable

        # The id of the inbound connection that you want to permanently delete.

        @[JSON::Field(key: "ConnectionId")]
        getter cross_cluster_search_connection_id : String

        def initialize(
          @cross_cluster_search_connection_id : String
        )
        end
      end

      # The result of a DeleteInboundCrossClusterSearchConnection operation. Contains details of deleted
      # inbound connection.

      struct DeleteInboundCrossClusterSearchConnectionResponse
        include JSON::Serializable

        # Specifies the InboundCrossClusterSearchConnection of deleted inbound connection.

        @[JSON::Field(key: "CrossClusterSearchConnection")]
        getter cross_cluster_search_connection : Types::InboundCrossClusterSearchConnection?

        def initialize(
          @cross_cluster_search_connection : Types::InboundCrossClusterSearchConnection? = nil
        )
        end
      end

      # Container for the parameters to the DeleteOutboundCrossClusterSearchConnection operation.

      struct DeleteOutboundCrossClusterSearchConnectionRequest
        include JSON::Serializable

        # The id of the outbound connection that you want to permanently delete.

        @[JSON::Field(key: "ConnectionId")]
        getter cross_cluster_search_connection_id : String

        def initialize(
          @cross_cluster_search_connection_id : String
        )
        end
      end

      # The result of a DeleteOutboundCrossClusterSearchConnection operation. Contains details of deleted
      # outbound connection.

      struct DeleteOutboundCrossClusterSearchConnectionResponse
        include JSON::Serializable

        # Specifies the OutboundCrossClusterSearchConnection of deleted outbound connection.

        @[JSON::Field(key: "CrossClusterSearchConnection")]
        getter cross_cluster_search_connection : Types::OutboundCrossClusterSearchConnection?

        def initialize(
          @cross_cluster_search_connection : Types::OutboundCrossClusterSearchConnection? = nil
        )
        end
      end

      # Container for request parameters to DeletePackage operation.

      struct DeletePackageRequest
        include JSON::Serializable

        # Internal ID of the package that you want to delete. Use DescribePackages to find this value.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        def initialize(
          @package_id : String
        )
        end
      end

      # Container for response parameters to DeletePackage operation.

      struct DeletePackageResponse
        include JSON::Serializable

        # PackageDetails

        @[JSON::Field(key: "PackageDetails")]
        getter package_details : Types::PackageDetails?

        def initialize(
          @package_details : Types::PackageDetails? = nil
        )
        end
      end

      # Deletes an Amazon OpenSearch Service-managed interface VPC endpoint.

      struct DeleteVpcEndpointRequest
        include JSON::Serializable

        # The unique identifier of the endpoint to be deleted.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String

        def initialize(
          @vpc_endpoint_id : String
        )
        end
      end

      # Container for response parameters to the DeleteVpcEndpoint operation. Contains the summarized detail
      # of the VPC Endpoint being deleted.

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

      # Container for the parameters to the DescribeDomainAutoTunes operation.

      struct DescribeDomainAutoTunesRequest
        include JSON::Serializable

        # Specifies the domain name for which you want Auto-Tune action details.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Set this value to limit the number of results returned. If not specified, defaults to 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # NextToken is sent in case the earlier API call results contain the NextToken. It is used for
        # pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of DescribeDomainAutoTunes request. See the Developer Guide for more information.

      struct DescribeDomainAutoTunesResponse
        include JSON::Serializable

        # Specifies the list of setting adjustments that Auto-Tune has made to the domain. See the Developer
        # Guide for more information.

        @[JSON::Field(key: "AutoTunes")]
        getter auto_tunes : Array(Types::AutoTune)?

        # Specifies an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_tunes : Array(Types::AutoTune)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the DescribeDomainChangeProgress operation. Specifies the domain
      # name and optional change specific identity for which you want progress information.

      struct DescribeDomainChangeProgressRequest
        include JSON::Serializable

        # The domain you want to get the progress information about.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The specific change ID for which you want to get progress information. This is an optional
        # parameter. If omitted, the service returns information about the most recent configuration change.

        @[JSON::Field(key: "changeid")]
        getter change_id : String?

        def initialize(
          @domain_name : String,
          @change_id : String? = nil
        )
        end
      end

      # The result of a DescribeDomainChangeProgress request. Contains the progress information of the
      # requested domain change.

      struct DescribeDomainChangeProgressResponse
        include JSON::Serializable

        # Progress information for the configuration change that is requested in the
        # DescribeDomainChangeProgress request.

        @[JSON::Field(key: "ChangeProgressStatus")]
        getter change_progress_status : Types::ChangeProgressStatusDetails?

        def initialize(
          @change_progress_status : Types::ChangeProgressStatusDetails? = nil
        )
        end
      end

      # Container for the parameters to the DescribeElasticsearchDomainConfig operation. Specifies the
      # domain name for which you want configuration information.

      struct DescribeElasticsearchDomainConfigRequest
        include JSON::Serializable

        # The Elasticsearch domain that you want to get information about.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a DescribeElasticsearchDomainConfig request. Contains the configuration information of
      # the requested domain.

      struct DescribeElasticsearchDomainConfigResponse
        include JSON::Serializable

        # The configuration information of the domain requested in the DescribeElasticsearchDomainConfig
        # request.

        @[JSON::Field(key: "DomainConfig")]
        getter domain_config : Types::ElasticsearchDomainConfig

        def initialize(
          @domain_config : Types::ElasticsearchDomainConfig
        )
        end
      end

      # Container for the parameters to the DescribeElasticsearchDomain operation.

      struct DescribeElasticsearchDomainRequest
        include JSON::Serializable

        # The name of the Elasticsearch domain for which you want information.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a DescribeElasticsearchDomain request. Contains the status of the domain specified in
      # the request.

      struct DescribeElasticsearchDomainResponse
        include JSON::Serializable

        # The current status of the Elasticsearch domain.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::ElasticsearchDomainStatus

        def initialize(
          @domain_status : Types::ElasticsearchDomainStatus
        )
        end
      end

      # Container for the parameters to the DescribeElasticsearchDomains operation. By default, the API
      # returns the status of all Elasticsearch domains.

      struct DescribeElasticsearchDomainsRequest
        include JSON::Serializable

        # The Elasticsearch domains for which you want information.

        @[JSON::Field(key: "DomainNames")]
        getter domain_names : Array(String)

        def initialize(
          @domain_names : Array(String)
        )
        end
      end

      # The result of a DescribeElasticsearchDomains request. Contains the status of the specified domains
      # or all domains owned by the account.

      struct DescribeElasticsearchDomainsResponse
        include JSON::Serializable

        # The status of the domains requested in the DescribeElasticsearchDomains request.

        @[JSON::Field(key: "DomainStatusList")]
        getter domain_status_list : Array(Types::ElasticsearchDomainStatus)

        def initialize(
          @domain_status_list : Array(Types::ElasticsearchDomainStatus)
        )
        end
      end

      # Container for the parameters to DescribeElasticsearchInstanceTypeLimits operation.

      struct DescribeElasticsearchInstanceTypeLimitsRequest
        include JSON::Serializable

        # Version of Elasticsearch for which Limits are needed.

        @[JSON::Field(key: "ElasticsearchVersion")]
        getter elasticsearch_version : String

        # The instance type for an Elasticsearch cluster for which Elasticsearch Limits are needed.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        # DomainName represents the name of the Domain that we are trying to modify. This should be present
        # only if we are querying for Elasticsearch Limits for existing domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @elasticsearch_version : String,
          @instance_type : String,
          @domain_name : String? = nil
        )
        end
      end

      # Container for the parameters received from DescribeElasticsearchInstanceTypeLimits operation.

      struct DescribeElasticsearchInstanceTypeLimitsResponse
        include JSON::Serializable


        @[JSON::Field(key: "LimitsByRole")]
        getter limits_by_role : Hash(String, Types::Limits)?

        def initialize(
          @limits_by_role : Hash(String, Types::Limits)? = nil
        )
        end
      end

      # Container for the parameters to the DescribeInboundCrossClusterSearchConnections operation.

      struct DescribeInboundCrossClusterSearchConnectionsRequest
        include JSON::Serializable

        # A list of filters used to match properties for inbound cross-cluster search connection. Available
        # Filter names for this operation are: cross-cluster-search-connection-id
        # source-domain-info.domain-name source-domain-info.owner-id source-domain-info.region
        # destination-domain-info.domain-name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Set this value to limit the number of results returned. If not specified, defaults to 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # NextToken is sent in case the earlier API call results contain the NextToken. It is used for
        # pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a DescribeInboundCrossClusterSearchConnections request. Contains the list of
      # connections matching the filter criteria.

      struct DescribeInboundCrossClusterSearchConnectionsResponse
        include JSON::Serializable

        # Consists of list of InboundCrossClusterSearchConnection matching the specified filter criteria.

        @[JSON::Field(key: "CrossClusterSearchConnections")]
        getter cross_cluster_search_connections : Array(Types::InboundCrossClusterSearchConnection)?

        # If more results are available and NextToken is present, make the next request to the same API with
        # the received NextToken to paginate the remaining results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cross_cluster_search_connections : Array(Types::InboundCrossClusterSearchConnection)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the DescribeOutboundCrossClusterSearchConnections operation.

      struct DescribeOutboundCrossClusterSearchConnectionsRequest
        include JSON::Serializable

        # A list of filters used to match properties for outbound cross-cluster search connection. Available
        # Filter names for this operation are: cross-cluster-search-connection-id
        # destination-domain-info.domain-name destination-domain-info.owner-id destination-domain-info.region
        # source-domain-info.domain-name

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Set this value to limit the number of results returned. If not specified, defaults to 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # NextToken is sent in case the earlier API call results contain the NextToken. It is used for
        # pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a DescribeOutboundCrossClusterSearchConnections request. Contains the list of
      # connections matching the filter criteria.

      struct DescribeOutboundCrossClusterSearchConnectionsResponse
        include JSON::Serializable

        # Consists of list of OutboundCrossClusterSearchConnection matching the specified filter criteria.

        @[JSON::Field(key: "CrossClusterSearchConnections")]
        getter cross_cluster_search_connections : Array(Types::OutboundCrossClusterSearchConnection)?

        # If more results are available and NextToken is present, make the next request to the same API with
        # the received NextToken to paginate the remaining results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cross_cluster_search_connections : Array(Types::OutboundCrossClusterSearchConnection)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Filter to apply in DescribePackage response.

      struct DescribePackagesFilter
        include JSON::Serializable

        # Any field from PackageDetails .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A non-empty list of values for the specified field.

        @[JSON::Field(key: "Value")]
        getter value : Array(String)?

        def initialize(
          @name : String? = nil,
          @value : Array(String)? = nil
        )
        end
      end

      # Container for request parameters to DescribePackage operation.

      struct DescribePackagesRequest
        include JSON::Serializable

        # Only returns packages that match the DescribePackagesFilterList values.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DescribePackagesFilter)?

        # Limits results to a maximum number of packages.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If
        # provided, returns results for the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::DescribePackagesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for response returned by DescribePackages operation.

      struct DescribePackagesResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of PackageDetails objects.

        @[JSON::Field(key: "PackageDetailsList")]
        getter package_details_list : Array(Types::PackageDetails)?

        def initialize(
          @next_token : String? = nil,
          @package_details_list : Array(Types::PackageDetails)? = nil
        )
        end
      end

      # Container for parameters to DescribeReservedElasticsearchInstanceOfferings

      struct DescribeReservedElasticsearchInstanceOfferingsRequest
        include JSON::Serializable

        # Set this value to limit the number of results returned. If not specified, defaults to 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # NextToken should be sent in case if earlier API call produced result containing NextToken. It is
        # used for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The offering identifier filter value. Use this parameter to show only the available offering that
        # matches the specified reservation identifier.

        @[JSON::Field(key: "offeringId")]
        getter reserved_elasticsearch_instance_offering_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reserved_elasticsearch_instance_offering_id : String? = nil
        )
        end
      end

      # Container for results from DescribeReservedElasticsearchInstanceOfferings

      struct DescribeReservedElasticsearchInstanceOfferingsResponse
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of reserved Elasticsearch instance offerings

        @[JSON::Field(key: "ReservedElasticsearchInstanceOfferings")]
        getter reserved_elasticsearch_instance_offerings : Array(Types::ReservedElasticsearchInstanceOffering)?

        def initialize(
          @next_token : String? = nil,
          @reserved_elasticsearch_instance_offerings : Array(Types::ReservedElasticsearchInstanceOffering)? = nil
        )
        end
      end

      # Container for parameters to DescribeReservedElasticsearchInstances

      struct DescribeReservedElasticsearchInstancesRequest
        include JSON::Serializable

        # Set this value to limit the number of results returned. If not specified, defaults to 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # NextToken should be sent in case if earlier API call produced result containing NextToken. It is
        # used for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The reserved instance identifier filter value. Use this parameter to show only the reservation that
        # matches the specified reserved Elasticsearch instance ID.

        @[JSON::Field(key: "reservationId")]
        getter reserved_elasticsearch_instance_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reserved_elasticsearch_instance_id : String? = nil
        )
        end
      end

      # Container for results from DescribeReservedElasticsearchInstances

      struct DescribeReservedElasticsearchInstancesResponse
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of reserved Elasticsearch instances.

        @[JSON::Field(key: "ReservedElasticsearchInstances")]
        getter reserved_elasticsearch_instances : Array(Types::ReservedElasticsearchInstance)?

        def initialize(
          @next_token : String? = nil,
          @reserved_elasticsearch_instances : Array(Types::ReservedElasticsearchInstance)? = nil
        )
        end
      end

      # Container for request parameters to the DescribeVpcEndpoints operation. Specifies the list of VPC
      # endpoints to be described.

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

      # Container for response parameters to the DescribeVpcEndpoints operation. Returns a list containing
      # configuration details and status of the VPC Endpoints as well as a list containing error responses
      # of the endpoints that could not be described

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

      # An error occured because the client wanted to access a not supported operation. Gives http status
      # code of 409.

      struct DisabledOperationException
        include JSON::Serializable

        def initialize
        end
      end

      # Container for request parameters to DissociatePackage operation.

      struct DissociatePackageRequest
        include JSON::Serializable

        # Name of the domain that you want to associate the package with.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Internal ID of the package that you want to associate with a domain. Use DescribePackages to find
        # this value.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        def initialize(
          @domain_name : String,
          @package_id : String
        )
        end
      end

      # Container for response returned by DissociatePackage operation.

      struct DissociatePackageResponse
        include JSON::Serializable

        # DomainPackageDetails

        @[JSON::Field(key: "DomainPackageDetails")]
        getter domain_package_details : Types::DomainPackageDetails?

        def initialize(
          @domain_package_details : Types::DomainPackageDetails? = nil
        )
        end
      end

      # Options to configure endpoint for the Elasticsearch domain.

      struct DomainEndpointOptions
        include JSON::Serializable

        # Specify the fully qualified domain for your custom endpoint.

        @[JSON::Field(key: "CustomEndpoint")]
        getter custom_endpoint : String?

        # Specify ACM certificate ARN for your custom endpoint.

        @[JSON::Field(key: "CustomEndpointCertificateArn")]
        getter custom_endpoint_certificate_arn : String?

        # Specify if custom endpoint should be enabled for the Elasticsearch domain.

        @[JSON::Field(key: "CustomEndpointEnabled")]
        getter custom_endpoint_enabled : Bool?

        # Specify if only HTTPS endpoint should be enabled for the Elasticsearch domain.

        @[JSON::Field(key: "EnforceHTTPS")]
        getter enforce_https : Bool?

        # Specify the TLS security policy that needs to be applied to the HTTPS endpoint of Elasticsearch
        # domain. It can be one of the following values: Policy-Min-TLS-1-0-2019-07: TLS security policy that
        # supports TLS version 1.0 to TLS version 1.2 Policy-Min-TLS-1-2-2019-07: TLS security policy that
        # supports only TLS version 1.2 Policy-Min-TLS-1-2-PFS-2023-10: TLS security policy that supports TLS
        # version 1.2 to TLS version 1.3 with perfect forward secrecy cipher suites

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

      # The configured endpoint options for the domain and their current status.

      struct DomainEndpointOptionsStatus
        include JSON::Serializable

        # Options to configure endpoint for the Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::DomainEndpointOptions

        # The status of the endpoint options for the Elasticsearch domain. See OptionStatus for the status
        # information that's included.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::DomainEndpointOptions,
          @status : Types::OptionStatus
        )
        end
      end


      struct DomainInfo
        include JSON::Serializable

        # Specifies the DomainName .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # Specifies the EngineType of the domain.

        @[JSON::Field(key: "EngineType")]
        getter engine_type : String?

        def initialize(
          @domain_name : String? = nil,
          @engine_type : String? = nil
        )
        end
      end


      struct DomainInformation
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String


        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?


        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @domain_name : String,
          @owner_id : String? = nil,
          @region : String? = nil
        )
        end
      end

      # Information on a package that is associated with a domain.

      struct DomainPackageDetails
        include JSON::Serializable

        # Name of the domain you've associated a package with.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # State of the association. Values are
        # ASSOCIATING/ASSOCIATION_FAILED/ACTIVE/DISSOCIATING/DISSOCIATION_FAILED.

        @[JSON::Field(key: "DomainPackageStatus")]
        getter domain_package_status : String?

        # Additional information if the package is in an error state. Null otherwise.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::ErrorDetails?

        # Timestamp of the most-recent update to the association status.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # Internal ID of the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String?

        # User specified name of the package.

        @[JSON::Field(key: "PackageName")]
        getter package_name : String?

        # Currently supports only TXT-DICTIONARY.

        @[JSON::Field(key: "PackageType")]
        getter package_type : String?


        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String?

        # The relative path on Amazon ES nodes, which can be used as synonym_path when the package is synonym
        # file.

        @[JSON::Field(key: "ReferencePath")]
        getter reference_path : String?

        def initialize(
          @domain_name : String? = nil,
          @domain_package_status : String? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @last_updated : Time? = nil,
          @package_id : String? = nil,
          @package_name : String? = nil,
          @package_type : String? = nil,
          @package_version : String? = nil,
          @reference_path : String? = nil
        )
        end
      end


      struct DryRunResults
        include JSON::Serializable

        # Specifies the deployment mechanism through which the update shall be applied on the domain. Possible
        # responses are Blue/Green (The update will require a blue/green deployment.) DynamicUpdate (The
        # update can be applied in-place without a Blue/Green deployment required.) Undetermined (The domain
        # is undergoing an update which needs to complete before the deployment type can be predicted.) None
        # (The configuration change matches the current configuration and will not result in any update.)

        @[JSON::Field(key: "DeploymentType")]
        getter deployment_type : String?

        # Contains an optional message associated with the DryRunResults.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @deployment_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Specifies maintenance schedule duration: duration value and duration unit. See the Developer Guide
      # for more information.

      struct Duration
        include JSON::Serializable

        # Specifies the unit of a maintenance schedule duration. Valid value is HOURS. See the Developer Guide
        # for more information.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # Integer to specify the value of a maintenance schedule duration. See the Developer Guide for more
        # information.

        @[JSON::Field(key: "Value")]
        getter value : Int64?

        def initialize(
          @unit : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # Options to enable, disable, and specify the properties of EBS storage volumes. For more information,
      # see Configuring EBS-based Storage .

      struct EBSOptions
        include JSON::Serializable

        # Specifies whether EBS-based storage is enabled.

        @[JSON::Field(key: "EBSEnabled")]
        getter ebs_enabled : Bool?

        # Specifies the IOPS for Provisioned IOPS And GP3 EBS volume (SSD).

        @[JSON::Field(key: "Iops")]
        getter iops : Int32?

        # Specifies the Throughput for GP3 EBS volume (SSD).

        @[JSON::Field(key: "Throughput")]
        getter throughput : Int32?

        # Integer to specify the size of an EBS volume.

        @[JSON::Field(key: "VolumeSize")]
        getter volume_size : Int32?

        # Specifies the volume type for EBS-based storage.

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

      # Status of the EBS options for the specified Elasticsearch domain.

      struct EBSOptionsStatus
        include JSON::Serializable

        # Specifies the EBS options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::EBSOptions

        # Specifies the status of the EBS options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::EBSOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Specifies the configuration for the domain cluster, such as the type and number of instances.

      struct ElasticsearchClusterConfig
        include JSON::Serializable

        # Specifies the ColdStorageOptions config for Elasticsearch Domain

        @[JSON::Field(key: "ColdStorageOptions")]
        getter cold_storage_options : Types::ColdStorageOptions?

        # Total number of dedicated master nodes, active and on standby, for the cluster.

        @[JSON::Field(key: "DedicatedMasterCount")]
        getter dedicated_master_count : Int32?

        # A boolean value to indicate whether a dedicated master node is enabled. See About Dedicated Master
        # Nodes for more information.

        @[JSON::Field(key: "DedicatedMasterEnabled")]
        getter dedicated_master_enabled : Bool?

        # The instance type for a dedicated master node.

        @[JSON::Field(key: "DedicatedMasterType")]
        getter dedicated_master_type : String?

        # The number of instances in the specified domain cluster.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # The instance type for an Elasticsearch cluster. UltraWarm instance types are not supported for data
        # instances.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The number of warm nodes in the cluster.

        @[JSON::Field(key: "WarmCount")]
        getter warm_count : Int32?

        # True to enable warm storage.

        @[JSON::Field(key: "WarmEnabled")]
        getter warm_enabled : Bool?

        # The instance type for the Elasticsearch cluster's warm nodes.

        @[JSON::Field(key: "WarmType")]
        getter warm_type : String?

        # Specifies the zone awareness configuration for a domain when zone awareness is enabled.

        @[JSON::Field(key: "ZoneAwarenessConfig")]
        getter zone_awareness_config : Types::ZoneAwarenessConfig?

        # A boolean value to indicate whether zone awareness is enabled. See About Zone Awareness for more
        # information.

        @[JSON::Field(key: "ZoneAwarenessEnabled")]
        getter zone_awareness_enabled : Bool?

        def initialize(
          @cold_storage_options : Types::ColdStorageOptions? = nil,
          @dedicated_master_count : Int32? = nil,
          @dedicated_master_enabled : Bool? = nil,
          @dedicated_master_type : String? = nil,
          @instance_count : Int32? = nil,
          @instance_type : String? = nil,
          @warm_count : Int32? = nil,
          @warm_enabled : Bool? = nil,
          @warm_type : String? = nil,
          @zone_awareness_config : Types::ZoneAwarenessConfig? = nil,
          @zone_awareness_enabled : Bool? = nil
        )
        end
      end

      # Specifies the configuration status for the specified Elasticsearch domain.

      struct ElasticsearchClusterConfigStatus
        include JSON::Serializable

        # Specifies the cluster configuration for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::ElasticsearchClusterConfig

        # Specifies the status of the configuration for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::ElasticsearchClusterConfig,
          @status : Types::OptionStatus
        )
        end
      end

      # The configuration of an Elasticsearch domain.

      struct ElasticsearchDomainConfig
        include JSON::Serializable

        # IAM access policy as a JSON-formatted string.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : Types::AccessPoliciesStatus?

        # Specifies the AdvancedOptions for the domain. See Configuring Advanced Options for more information.

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Types::AdvancedOptionsStatus?

        # Specifies AdvancedSecurityOptions for the domain.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptionsStatus?

        # Specifies AutoTuneOptions for the domain.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptionsStatus?

        # Specifies change details of the domain configuration change.

        @[JSON::Field(key: "ChangeProgressDetails")]
        getter change_progress_details : Types::ChangeProgressDetails?

        # The CognitoOptions for the specified domain. For more information, see Amazon Cognito Authentication
        # for Kibana .

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptionsStatus?

        # Specifies the DomainEndpointOptions for the Elasticsearch domain.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptionsStatus?

        # Specifies the EBSOptions for the Elasticsearch domain.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptionsStatus?

        # Specifies the ElasticsearchClusterConfig for the Elasticsearch domain.

        @[JSON::Field(key: "ElasticsearchClusterConfig")]
        getter elasticsearch_cluster_config : Types::ElasticsearchClusterConfigStatus?

        # String of format X.Y to specify version for the Elasticsearch domain.

        @[JSON::Field(key: "ElasticsearchVersion")]
        getter elasticsearch_version : Types::ElasticsearchVersionStatus?

        # Specifies the EncryptionAtRestOptions for the Elasticsearch domain.

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptionsStatus?

        # Log publishing options for the given domain.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Types::LogPublishingOptionsStatus?

        # Information about the domain properties that are currently being modified.

        @[JSON::Field(key: "ModifyingProperties")]
        getter modifying_properties : Array(Types::ModifyingProperties)?

        # Specifies the NodeToNodeEncryptionOptions for the Elasticsearch domain.

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptionsStatus?

        # Specifies the SnapshotOptions for the Elasticsearch domain.

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptionsStatus?

        # The VPCOptions for the specified domain. For more information, see VPC Endpoints for Amazon
        # Elasticsearch Service Domains .

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCDerivedInfoStatus?

        def initialize(
          @access_policies : Types::AccessPoliciesStatus? = nil,
          @advanced_options : Types::AdvancedOptionsStatus? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptionsStatus? = nil,
          @auto_tune_options : Types::AutoTuneOptionsStatus? = nil,
          @change_progress_details : Types::ChangeProgressDetails? = nil,
          @cognito_options : Types::CognitoOptionsStatus? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptionsStatus? = nil,
          @ebs_options : Types::EBSOptionsStatus? = nil,
          @elasticsearch_cluster_config : Types::ElasticsearchClusterConfigStatus? = nil,
          @elasticsearch_version : Types::ElasticsearchVersionStatus? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptionsStatus? = nil,
          @log_publishing_options : Types::LogPublishingOptionsStatus? = nil,
          @modifying_properties : Array(Types::ModifyingProperties)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptionsStatus? = nil,
          @snapshot_options : Types::SnapshotOptionsStatus? = nil,
          @vpc_options : Types::VPCDerivedInfoStatus? = nil
        )
        end
      end

      # The current status of an Elasticsearch domain.

      struct ElasticsearchDomainStatus
        include JSON::Serializable

        # The Amazon resource name (ARN) of an Elasticsearch domain. See Identifiers for IAM Entities in Using
        # AWS Identity and Access Management for more information.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # The unique identifier for the specified Elasticsearch domain.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account
        # within an AWS region. Domain names start with a letter or number and can contain the following
        # characters: a-z (lowercase), 0-9, and - (hyphen).

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The type and number of instances in the domain cluster.

        @[JSON::Field(key: "ElasticsearchClusterConfig")]
        getter elasticsearch_cluster_config : Types::ElasticsearchClusterConfig

        # IAM access policy as a JSON-formatted string.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : String?

        # Specifies the status of the AdvancedOptions

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # The current status of the Elasticsearch domain's advanced security options.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptions?

        # The current status of the Elasticsearch domain's Auto-Tune options.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptionsOutput?

        # Specifies change details of the domain configuration change.

        @[JSON::Field(key: "ChangeProgressDetails")]
        getter change_progress_details : Types::ChangeProgressDetails?

        # The CognitoOptions for the specified domain. For more information, see Amazon Cognito Authentication
        # for Kibana .

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptions?

        # The domain creation status. True if the creation of an Elasticsearch domain is complete. False if
        # domain creation is still in progress.

        @[JSON::Field(key: "Created")]
        getter created : Bool?

        # The domain deletion status. True if a delete request has been received for the domain but resource
        # cleanup is still in progress. False if the domain has not been deleted. Once domain deletion is
        # complete, the status of the domain is no longer returned.

        @[JSON::Field(key: "Deleted")]
        getter deleted : Bool?

        # The current status of the Elasticsearch domain's endpoint options.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptions?

        # The status of any changes that are currently in progress for the domain.

        @[JSON::Field(key: "DomainProcessingStatus")]
        getter domain_processing_status : String?

        # The EBSOptions for the specified domain. See Configuring EBS-based Storage for more information.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptions?


        @[JSON::Field(key: "ElasticsearchVersion")]
        getter elasticsearch_version : String?

        # Specifies the status of the EncryptionAtRestOptions .

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # The Elasticsearch domain endpoint that you use to submit index and search requests.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # Map containing the Elasticsearch domain endpoints used to submit index and search requests. Example
        # key, value : 'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com' .

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Hash(String, String)?

        # Log publishing options for the given domain.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Hash(String, Types::LogPublishingOption)?

        # Information about the domain properties that are currently being modified.

        @[JSON::Field(key: "ModifyingProperties")]
        getter modifying_properties : Array(Types::ModifyingProperties)?

        # Specifies the status of the NodeToNodeEncryptionOptions .

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions?

        # The status of the Elasticsearch domain configuration. True if Amazon Elasticsearch Service is
        # processing configuration changes. False if the configuration is active.

        @[JSON::Field(key: "Processing")]
        getter processing : Bool?

        # The current status of the Elasticsearch domain's service software.

        @[JSON::Field(key: "ServiceSoftwareOptions")]
        getter service_software_options : Types::ServiceSoftwareOptions?

        # Specifies the status of the SnapshotOptions

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptions?

        # The status of an Elasticsearch domain version upgrade. True if Amazon Elasticsearch Service is
        # undergoing a version upgrade. False if the configuration is active.

        @[JSON::Field(key: "UpgradeProcessing")]
        getter upgrade_processing : Bool?

        # The VPCOptions for the specified domain. For more information, see VPC Endpoints for Amazon
        # Elasticsearch Service Domains .

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCDerivedInfo?

        def initialize(
          @arn : String,
          @domain_id : String,
          @domain_name : String,
          @elasticsearch_cluster_config : Types::ElasticsearchClusterConfig,
          @access_policies : String? = nil,
          @advanced_options : Hash(String, String)? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptions? = nil,
          @auto_tune_options : Types::AutoTuneOptionsOutput? = nil,
          @change_progress_details : Types::ChangeProgressDetails? = nil,
          @cognito_options : Types::CognitoOptions? = nil,
          @created : Bool? = nil,
          @deleted : Bool? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptions? = nil,
          @domain_processing_status : String? = nil,
          @ebs_options : Types::EBSOptions? = nil,
          @elasticsearch_version : String? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @endpoint : String? = nil,
          @endpoints : Hash(String, String)? = nil,
          @log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
          @modifying_properties : Array(Types::ModifyingProperties)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
          @processing : Bool? = nil,
          @service_software_options : Types::ServiceSoftwareOptions? = nil,
          @snapshot_options : Types::SnapshotOptions? = nil,
          @upgrade_processing : Bool? = nil,
          @vpc_options : Types::VPCDerivedInfo? = nil
        )
        end
      end

      # Status of the Elasticsearch version options for the specified Elasticsearch domain.

      struct ElasticsearchVersionStatus
        include JSON::Serializable

        # Specifies the Elasticsearch version for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : String

        # Specifies the status of the Elasticsearch version options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : String,
          @status : Types::OptionStatus
        )
        end
      end

      # Specifies the Encryption At Rest Options.

      struct EncryptionAtRestOptions
        include JSON::Serializable

        # Specifies the option to enable Encryption At Rest.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies the KMS Key ID for Encryption At Rest options.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @enabled : Bool? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      # Status of the Encryption At Rest options for the specified Elasticsearch domain.

      struct EncryptionAtRestOptionsStatus
        include JSON::Serializable

        # Specifies the Encryption At Rest options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::EncryptionAtRestOptions

        # Specifies the status of the Encryption At Rest options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::EncryptionAtRestOptions,
          @status : Types::OptionStatus
        )
        end
      end


      struct ErrorDetails
        include JSON::Serializable


        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?


        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        def initialize(
          @error_message : String? = nil,
          @error_type : String? = nil
        )
        end
      end

      # A filter used to limit results when describing inbound or outbound cross-cluster search connections.
      # Multiple values can be specified per filter. A cross-cluster search connection must match at least
      # one of the specified values for it to be returned from an operation.

      struct Filter
        include JSON::Serializable

        # Specifies the name of the filter.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Contains one or more values for the filter.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Container for request parameters to GetCompatibleElasticsearchVersions operation.

      struct GetCompatibleElasticsearchVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @domain_name : String? = nil
        )
        end
      end

      # Container for response returned by GetCompatibleElasticsearchVersions operation.

      struct GetCompatibleElasticsearchVersionsResponse
        include JSON::Serializable

        # A map of compatible Elasticsearch versions returned as part of the
        # GetCompatibleElasticsearchVersions operation.

        @[JSON::Field(key: "CompatibleElasticsearchVersions")]
        getter compatible_elasticsearch_versions : Array(Types::CompatibleVersionsMap)?

        def initialize(
          @compatible_elasticsearch_versions : Array(Types::CompatibleVersionsMap)? = nil
        )
        end
      end

      # Container for request parameters to GetPackageVersionHistory operation.

      struct GetPackageVersionHistoryRequest
        include JSON::Serializable

        # Returns an audit history of versions of the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # Limits results to a maximum number of versions.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If
        # provided, returns results for the next page.

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


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "PackageID")]
        getter package_id : String?

        # List of PackageVersionHistory objects.

        @[JSON::Field(key: "PackageVersionHistoryList")]
        getter package_version_history_list : Array(Types::PackageVersionHistory)?

        def initialize(
          @next_token : String? = nil,
          @package_id : String? = nil,
          @package_version_history_list : Array(Types::PackageVersionHistory)? = nil
        )
        end
      end

      # Container for request parameters to GetUpgradeHistory operation.

      struct GetUpgradeHistoryRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for response returned by GetUpgradeHistory operation.

      struct GetUpgradeHistoryResponse
        include JSON::Serializable

        # Pagination token that needs to be supplied to the next call to get the next page of results

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of UpgradeHistory objects corresponding to each Upgrade or Upgrade Eligibility Check
        # performed on a domain returned as part of GetUpgradeHistoryResponse object.

        @[JSON::Field(key: "UpgradeHistories")]
        getter upgrade_histories : Array(Types::UpgradeHistory)?

        def initialize(
          @next_token : String? = nil,
          @upgrade_histories : Array(Types::UpgradeHistory)? = nil
        )
        end
      end

      # Container for request parameters to GetUpgradeStatus operation.

      struct GetUpgradeStatusRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # Container for response returned by GetUpgradeStatus operation.

      struct GetUpgradeStatusResponse
        include JSON::Serializable

        # One of 4 statuses that a step can go through returned as part of the GetUpgradeStatusResponse
        # object. The status can take one of the following values: In Progress Succeeded Succeeded with Issues
        # Failed

        @[JSON::Field(key: "StepStatus")]
        getter step_status : String?

        # A string that describes the update briefly

        @[JSON::Field(key: "UpgradeName")]
        getter upgrade_name : String?

        # Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does through: PreUpgradeCheck
        # Snapshot Upgrade

        @[JSON::Field(key: "UpgradeStep")]
        getter upgrade_step : String?

        def initialize(
          @step_status : String? = nil,
          @upgrade_name : String? = nil,
          @upgrade_step : String? = nil
        )
        end
      end

      # Specifies details of an inbound connection.

      struct InboundCrossClusterSearchConnection
        include JSON::Serializable

        # Specifies the InboundCrossClusterSearchConnectionStatus for the outbound connection.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::InboundCrossClusterSearchConnectionStatus?

        # Specifies the connection id for the inbound cross-cluster search connection.

        @[JSON::Field(key: "CrossClusterSearchConnectionId")]
        getter cross_cluster_search_connection_id : String?

        # Specifies the DomainInformation for the destination Elasticsearch domain.

        @[JSON::Field(key: "DestinationDomainInfo")]
        getter destination_domain_info : Types::DomainInformation?

        # Specifies the DomainInformation for the source Elasticsearch domain.

        @[JSON::Field(key: "SourceDomainInfo")]
        getter source_domain_info : Types::DomainInformation?

        def initialize(
          @connection_status : Types::InboundCrossClusterSearchConnectionStatus? = nil,
          @cross_cluster_search_connection_id : String? = nil,
          @destination_domain_info : Types::DomainInformation? = nil,
          @source_domain_info : Types::DomainInformation? = nil
        )
        end
      end

      # Specifies the coonection status of an inbound cross-cluster search connection.

      struct InboundCrossClusterSearchConnectionStatus
        include JSON::Serializable

        # Specifies verbose information for the inbound connection status.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The state code for inbound connection. This can be one of the following: PENDING_ACCEPTANCE: Inbound
        # connection is not yet accepted by destination domain owner. APPROVED: Inbound connection is pending
        # acceptance by destination domain owner. REJECTING: Inbound connection rejection is in process.
        # REJECTED: Inbound connection is rejected. DELETING: Inbound connection deletion is in progress.
        # DELETED: Inbound connection is deleted and cannot be used further.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        def initialize(
          @message : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # InstanceCountLimits represents the limits on number of instances that be created in Amazon
      # Elasticsearch for given InstanceType.

      struct InstanceCountLimits
        include JSON::Serializable


        @[JSON::Field(key: "MaximumInstanceCount")]
        getter maximum_instance_count : Int32?


        @[JSON::Field(key: "MinimumInstanceCount")]
        getter minimum_instance_count : Int32?

        def initialize(
          @maximum_instance_count : Int32? = nil,
          @minimum_instance_count : Int32? = nil
        )
        end
      end

      # InstanceLimits represents the list of instance related attributes that are available for given
      # InstanceType.

      struct InstanceLimits
        include JSON::Serializable


        @[JSON::Field(key: "InstanceCountLimits")]
        getter instance_count_limits : Types::InstanceCountLimits?

        def initialize(
          @instance_count_limits : Types::InstanceCountLimits? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure (the failure is
      # internal to the service) . Gives http status code of 500.

      struct InternalException
        include JSON::Serializable

        def initialize
        end
      end

      # The request processing has failed because of invalid pagination token provided by customer. Returns
      # an HTTP status code of 400.

      struct InvalidPaginationTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # An exception for trying to create or access sub-resource that is either invalid or not supported.
      # Gives http status code of 409.

      struct InvalidTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # An exception for trying to create more than allowed resources or sub-resources. Gives http status
      # code of 409.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Limits for given InstanceType and for each of it's role. Limits contains following StorageTypes,
      # InstanceLimits and AdditionalLimits

      struct Limits
        include JSON::Serializable

        # List of additional limits that are specific to a given InstanceType and for each of it's
        # InstanceRole .

        @[JSON::Field(key: "AdditionalLimits")]
        getter additional_limits : Array(Types::AdditionalLimit)?


        @[JSON::Field(key: "InstanceLimits")]
        getter instance_limits : Types::InstanceLimits?

        # StorageType represents the list of storage related types and attributes that are available for given
        # InstanceType.

        @[JSON::Field(key: "StorageTypes")]
        getter storage_types : Array(Types::StorageType)?

        def initialize(
          @additional_limits : Array(Types::AdditionalLimit)? = nil,
          @instance_limits : Types::InstanceLimits? = nil,
          @storage_types : Array(Types::StorageType)? = nil
        )
        end
      end

      # Container for the parameters to the ListDomainNames operation.

      struct ListDomainNamesRequest
        include JSON::Serializable

        # Optional parameter to filter the output by domain engine type. Acceptable values are 'Elasticsearch'
        # and 'OpenSearch'.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        def initialize(
          @engine_type : String? = nil
        )
        end
      end

      # The result of a ListDomainNames operation. Contains the names of all domains owned by this account
      # and their respective engine types.

      struct ListDomainNamesResponse
        include JSON::Serializable

        # List of domain names and respective engine types.

        @[JSON::Field(key: "DomainNames")]
        getter domain_names : Array(Types::DomainInfo)?

        def initialize(
          @domain_names : Array(Types::DomainInfo)? = nil
        )
        end
      end

      # Container for request parameters to ListDomainsForPackage operation.

      struct ListDomainsForPackageRequest
        include JSON::Serializable

        # The package for which to list domains.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String

        # Limits results to a maximum number of domains.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If
        # provided, returns results for the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @package_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for response parameters to ListDomainsForPackage operation.

      struct ListDomainsForPackageResponse
        include JSON::Serializable

        # List of DomainPackageDetails objects.

        @[JSON::Field(key: "DomainPackageDetailsList")]
        getter domain_package_details_list : Array(Types::DomainPackageDetails)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_package_details_list : Array(Types::DomainPackageDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the ListElasticsearchInstanceTypes operation.

      struct ListElasticsearchInstanceTypesRequest
        include JSON::Serializable

        # Version of Elasticsearch for which list of supported elasticsearch instance types are needed.

        @[JSON::Field(key: "ElasticsearchVersion")]
        getter elasticsearch_version : String

        # DomainName represents the name of the Domain that we are trying to modify. This should be present
        # only if we are querying for list of available Elasticsearch instance types when modifying existing
        # domain.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # Set this value to limit the number of results returned. Value provided must be greater than 30 else
        # it wont be honored.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # NextToken should be sent in case if earlier API call produced result containing NextToken. It is
        # used for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @elasticsearch_version : String,
          @domain_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters returned by ListElasticsearchInstanceTypes operation.

      struct ListElasticsearchInstanceTypesResponse
        include JSON::Serializable

        # List of instance types supported by Amazon Elasticsearch service for given ElasticsearchVersion

        @[JSON::Field(key: "ElasticsearchInstanceTypes")]
        getter elasticsearch_instance_types : Array(String)?

        # In case if there are more results available NextToken would be present, make further request to the
        # same API with received NextToken to paginate remaining results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @elasticsearch_instance_types : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the ListElasticsearchVersions operation. Use MaxResults to control
      # the maximum number of results to retrieve in a single call. Use NextToken in response to retrieve
      # more results. If the received response does not contain a NextToken, then there are no more results
      # to retrieve.

      struct ListElasticsearchVersionsRequest
        include JSON::Serializable

        # Set this value to limit the number of results returned. Value provided must be greater than 10 else
        # it wont be honored.

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

      # Container for the parameters for response received from ListElasticsearchVersions operation.

      struct ListElasticsearchVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "ElasticsearchVersions")]
        getter elasticsearch_versions : Array(String)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @elasticsearch_versions : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for request parameters to ListPackagesForDomain operation.

      struct ListPackagesForDomainRequest
        include JSON::Serializable

        # The name of the domain for which you want to list associated packages.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Limits results to a maximum number of packages.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If
        # provided, returns results for the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for response parameters to ListPackagesForDomain operation.

      struct ListPackagesForDomainResponse
        include JSON::Serializable

        # List of DomainPackageDetails objects.

        @[JSON::Field(key: "DomainPackageDetailsList")]
        getter domain_package_details_list : Array(Types::DomainPackageDetails)?

        # Pagination token that needs to be supplied to the next call to get the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_package_details_list : Array(Types::DomainPackageDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Container for the parameters to the ListTags operation. Specify the ARN for the Elasticsearch domain
      # to which the tags are attached that you want to view are attached.

      struct ListTagsRequest
        include JSON::Serializable

        # Specify the ARN for the Elasticsearch domain to which the tags are attached that you want to view.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The result of a ListTags operation. Contains tags for all requested Elasticsearch domains.

      struct ListTagsResponse
        include JSON::Serializable

        # List of Tag for the requested Elasticsearch domain.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Retrieves information about each principal that is allowed to access a given Amazon OpenSearch
      # Service domain through the use of an interface VPC endpoint

      struct ListVpcEndpointAccessRequest
        include JSON::Serializable

        # The name of the OpenSearch Service domain to retrieve access information for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @next_token : String? = nil
        )
        end
      end

      # Container for response parameters to the ListVpcEndpointAccess operation. Returns a list of accounts
      # id and account type authorized to manage VPC endpoints.

      struct ListVpcEndpointAccessResponse
        include JSON::Serializable

        # List of AuthorizedPrincipal describing the details of the permissions to manage VPC endpoints
        # against the specified domain.

        @[JSON::Field(key: "AuthorizedPrincipalList")]
        getter authorized_principal_list : Array(Types::AuthorizedPrincipal)

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String

        def initialize(
          @authorized_principal_list : Array(Types::AuthorizedPrincipal),
          @next_token : String
        )
        end
      end

      # Container for request parameters to the ListVpcEndpointsForDomain operation. Specifies the domain
      # whose VPC endpoints will be listed.

      struct ListVpcEndpointsForDomainRequest
        include JSON::Serializable

        # Name of the ElasticSearch domain whose VPC endpoints are to be listed.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Provides an identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @next_token : String? = nil
        )
        end
      end

      # Container for response parameters to the ListVpcEndpointsForDomain operation. Returns a list
      # containing summarized details of the VPC endpoints.

      struct ListVpcEndpointsForDomainResponse
        include JSON::Serializable

        # Information about each endpoint associated with the domain.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String

        # Provides list of VpcEndpointSummary summarizing details of the VPC endpoints.

        @[JSON::Field(key: "VpcEndpointSummaryList")]
        getter vpc_endpoint_summary_list : Array(Types::VpcEndpointSummary)

        def initialize(
          @next_token : String,
          @vpc_endpoint_summary_list : Array(Types::VpcEndpointSummary)
        )
        end
      end

      # Container for request parameters to the ListVpcEndpoints operation.

      struct ListVpcEndpointsRequest
        include JSON::Serializable

        # Identifier to allow retrieval of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Container for response parameters to the ListVpcEndpoints operation. Returns a list containing
      # summarized details of the VPC endpoints.

      struct ListVpcEndpointsResponse
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.

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

      # Log Publishing option that is set for given domain. Attributes and their details:
      # CloudWatchLogsLogGroupArn: ARN of the Cloudwatch log group to which log needs to be published.
      # Enabled: Whether the log publishing for given log type is enabled or not

      struct LogPublishingOption
        include JSON::Serializable


        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String?

        # Specifies whether given log publishing option is enabled or not.

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

        # The log publishing options configured for the Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Hash(String, Types::LogPublishingOption)?

        # The status of the log publishing options for the Elasticsearch domain. See OptionStatus for the
        # status information that's included.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus?

        def initialize(
          @options : Hash(String, Types::LogPublishingOption)? = nil,
          @status : Types::OptionStatus? = nil
        )
        end
      end

      # Credentials for the master user: username and password, ARN, or both.

      struct MasterUserOptions
        include JSON::Serializable

        # ARN for the master user (if IAM is enabled).

        @[JSON::Field(key: "MasterUserARN")]
        getter master_user_arn : String?

        # The master user's username, which is stored in the Amazon Elasticsearch Service domain's internal
        # database.

        @[JSON::Field(key: "MasterUserName")]
        getter master_user_name : String?

        # The master user's password, which is stored in the Amazon Elasticsearch Service domain's internal
        # database.

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

      # Specifies the node-to-node encryption options.

      struct NodeToNodeEncryptionOptions
        include JSON::Serializable

        # Specify true to enable node-to-node encryption.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Status of the node-to-node encryption options for the specified Elasticsearch domain.

      struct NodeToNodeEncryptionOptionsStatus
        include JSON::Serializable

        # Specifies the node-to-node encryption options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::NodeToNodeEncryptionOptions

        # Specifies the status of the node-to-node encryption options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::NodeToNodeEncryptionOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Provides the current status of the entity.

      struct OptionStatus
        include JSON::Serializable

        # Timestamp which tells the creation date for the entity.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # Provides the OptionState for the Elasticsearch domain.

        @[JSON::Field(key: "State")]
        getter state : String

        # Timestamp which tells the last updated time for the entity.

        @[JSON::Field(key: "UpdateDate")]
        getter update_date : Time

        # Indicates whether the Elasticsearch domain is being deleted.

        @[JSON::Field(key: "PendingDeletion")]
        getter pending_deletion : Bool?

        # Specifies the latest version for the entity.

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

      # Specifies details of an outbound connection.

      struct OutboundCrossClusterSearchConnection
        include JSON::Serializable

        # Specifies the connection alias for the outbound cross-cluster search connection.

        @[JSON::Field(key: "ConnectionAlias")]
        getter connection_alias : String?

        # Specifies the OutboundCrossClusterSearchConnectionStatus for the outbound connection.

        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : Types::OutboundCrossClusterSearchConnectionStatus?

        # Specifies the connection id for the outbound cross-cluster search connection.

        @[JSON::Field(key: "CrossClusterSearchConnectionId")]
        getter cross_cluster_search_connection_id : String?

        # Specifies the DomainInformation for the destination Elasticsearch domain.

        @[JSON::Field(key: "DestinationDomainInfo")]
        getter destination_domain_info : Types::DomainInformation?

        # Specifies the DomainInformation for the source Elasticsearch domain.

        @[JSON::Field(key: "SourceDomainInfo")]
        getter source_domain_info : Types::DomainInformation?

        def initialize(
          @connection_alias : String? = nil,
          @connection_status : Types::OutboundCrossClusterSearchConnectionStatus? = nil,
          @cross_cluster_search_connection_id : String? = nil,
          @destination_domain_info : Types::DomainInformation? = nil,
          @source_domain_info : Types::DomainInformation? = nil
        )
        end
      end

      # Specifies the connection status of an outbound cross-cluster search connection.

      struct OutboundCrossClusterSearchConnectionStatus
        include JSON::Serializable

        # Specifies verbose information for the outbound connection status.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The state code for outbound connection. This can be one of the following: VALIDATING: The outbound
        # connection request is being validated. VALIDATION_FAILED: Validation failed for the connection
        # request. PENDING_ACCEPTANCE: Outbound connection request is validated and is not yet accepted by
        # destination domain owner. PROVISIONING: Outbound connection request is in process. ACTIVE: Outbound
        # connection is active and ready to use. REJECTED: Outbound connection request is rejected by
        # destination domain owner. DELETING: Outbound connection deletion is in progress. DELETED: Outbound
        # connection is deleted and cannot be used further.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        def initialize(
          @message : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # Basic information about a package.

      struct PackageDetails
        include JSON::Serializable


        @[JSON::Field(key: "AvailablePackageVersion")]
        getter available_package_version : String?

        # Timestamp which tells creation date of the package.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Additional information if the package is in an error state. Null otherwise.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::ErrorDetails?


        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # User-specified description of the package.

        @[JSON::Field(key: "PackageDescription")]
        getter package_description : String?

        # Internal ID of the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String?

        # User specified name of the package.

        @[JSON::Field(key: "PackageName")]
        getter package_name : String?

        # Current state of the package. Values are COPYING/COPY_FAILED/AVAILABLE/DELETING/DELETE_FAILED

        @[JSON::Field(key: "PackageStatus")]
        getter package_status : String?

        # Currently supports only TXT-DICTIONARY.

        @[JSON::Field(key: "PackageType")]
        getter package_type : String?

        def initialize(
          @available_package_version : String? = nil,
          @created_at : Time? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @last_updated_at : Time? = nil,
          @package_description : String? = nil,
          @package_id : String? = nil,
          @package_name : String? = nil,
          @package_status : String? = nil,
          @package_type : String? = nil
        )
        end
      end

      # The S3 location for importing the package specified as S3BucketName and S3Key

      struct PackageSource
        include JSON::Serializable

        # Name of the bucket containing the package.

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

      # Details of a package version.

      struct PackageVersionHistory
        include JSON::Serializable

        # A message associated with the version.

        @[JSON::Field(key: "CommitMessage")]
        getter commit_message : String?

        # Timestamp which tells creation time of the package version.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Version of the package.

        @[JSON::Field(key: "PackageVersion")]
        getter package_version : String?

        def initialize(
          @commit_message : String? = nil,
          @created_at : Time? = nil,
          @package_version : String? = nil
        )
        end
      end

      # Container for parameters to PurchaseReservedElasticsearchInstanceOffering

      struct PurchaseReservedElasticsearchInstanceOfferingRequest
        include JSON::Serializable

        # A customer-specified identifier to track this reservation.

        @[JSON::Field(key: "ReservationName")]
        getter reservation_name : String

        # The ID of the reserved Elasticsearch instance offering to purchase.

        @[JSON::Field(key: "ReservedElasticsearchInstanceOfferingId")]
        getter reserved_elasticsearch_instance_offering_id : String

        # The number of Elasticsearch instances to reserve.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        def initialize(
          @reservation_name : String,
          @reserved_elasticsearch_instance_offering_id : String,
          @instance_count : Int32? = nil
        )
        end
      end

      # Represents the output of a PurchaseReservedElasticsearchInstanceOffering operation.

      struct PurchaseReservedElasticsearchInstanceOfferingResponse
        include JSON::Serializable

        # The customer-specified identifier used to track this reservation.

        @[JSON::Field(key: "ReservationName")]
        getter reservation_name : String?

        # Details of the reserved Elasticsearch instance which was purchased.

        @[JSON::Field(key: "ReservedElasticsearchInstanceId")]
        getter reserved_elasticsearch_instance_id : String?

        def initialize(
          @reservation_name : String? = nil,
          @reserved_elasticsearch_instance_id : String? = nil
        )
        end
      end

      # Contains the specific price and frequency of a recurring charges for a reserved Elasticsearch
      # instance, or for a reserved Elasticsearch instance offering.

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

      # Container for the parameters to the RejectInboundCrossClusterSearchConnection operation.

      struct RejectInboundCrossClusterSearchConnectionRequest
        include JSON::Serializable

        # The id of the inbound connection that you want to reject.

        @[JSON::Field(key: "ConnectionId")]
        getter cross_cluster_search_connection_id : String

        def initialize(
          @cross_cluster_search_connection_id : String
        )
        end
      end

      # The result of a RejectInboundCrossClusterSearchConnection operation. Contains details of rejected
      # inbound connection.

      struct RejectInboundCrossClusterSearchConnectionResponse
        include JSON::Serializable

        # Specifies the InboundCrossClusterSearchConnection of rejected inbound connection.

        @[JSON::Field(key: "CrossClusterSearchConnection")]
        getter cross_cluster_search_connection : Types::InboundCrossClusterSearchConnection?

        def initialize(
          @cross_cluster_search_connection : Types::InboundCrossClusterSearchConnection? = nil
        )
        end
      end

      # Container for the parameters to the RemoveTags operation. Specify the ARN for the Elasticsearch
      # domain from which you want to remove the specified TagKey .

      struct RemoveTagsRequest
        include JSON::Serializable

        # Specifies the ARN for the Elasticsearch domain from which you want to delete the specified tags.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # Specifies the TagKey list which you want to remove from the Elasticsearch domain.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Details of a reserved Elasticsearch instance.

      struct ReservedElasticsearchInstance
        include JSON::Serializable

        # The currency code for the reserved Elasticsearch instance offering.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The duration, in seconds, for which the Elasticsearch instance is reserved.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The number of Elasticsearch instances that have been reserved.

        @[JSON::Field(key: "ElasticsearchInstanceCount")]
        getter elasticsearch_instance_count : Int32?

        # The Elasticsearch instance type offered by the reserved instance offering.

        @[JSON::Field(key: "ElasticsearchInstanceType")]
        getter elasticsearch_instance_type : String?

        # The upfront fixed charge you will paid to purchase the specific reserved Elasticsearch instance
        # offering.

        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The payment option as defined in the reserved Elasticsearch instance offering.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The charge to your account regardless of whether you are creating any domains using the instance
        # offering.

        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The customer-specified identifier to track this reservation.

        @[JSON::Field(key: "ReservationName")]
        getter reservation_name : String?

        # The unique identifier for the reservation.

        @[JSON::Field(key: "ReservedElasticsearchInstanceId")]
        getter reserved_elasticsearch_instance_id : String?

        # The offering identifier.

        @[JSON::Field(key: "ReservedElasticsearchInstanceOfferingId")]
        getter reserved_elasticsearch_instance_offering_id : String?

        # The time the reservation started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The state of the reserved Elasticsearch instance.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The rate you are charged for each hour for the domain that is using this reserved instance.

        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @elasticsearch_instance_count : Int32? = nil,
          @elasticsearch_instance_type : String? = nil,
          @fixed_price : Float64? = nil,
          @payment_option : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reservation_name : String? = nil,
          @reserved_elasticsearch_instance_id : String? = nil,
          @reserved_elasticsearch_instance_offering_id : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # Details of a reserved Elasticsearch instance offering.

      struct ReservedElasticsearchInstanceOffering
        include JSON::Serializable

        # The currency code for the reserved Elasticsearch instance offering.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The duration, in seconds, for which the offering will reserve the Elasticsearch instance.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The Elasticsearch instance type offered by the reserved instance offering.

        @[JSON::Field(key: "ElasticsearchInstanceType")]
        getter elasticsearch_instance_type : String?

        # The upfront fixed charge you will pay to purchase the specific reserved Elasticsearch instance
        # offering.

        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # Payment option for the reserved Elasticsearch instance offering

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The charge to your account regardless of whether you are creating any domains using the instance
        # offering.

        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The Elasticsearch reserved instance offering identifier.

        @[JSON::Field(key: "ReservedElasticsearchInstanceOfferingId")]
        getter reserved_elasticsearch_instance_offering_id : String?

        # The rate you are charged for each hour the domain that is using the offering is running.

        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @currency_code : String? = nil,
          @duration : Int32? = nil,
          @elasticsearch_instance_type : String? = nil,
          @fixed_price : Float64? = nil,
          @payment_option : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reserved_elasticsearch_instance_offering_id : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # An exception for creating a resource that already exists. Gives http status code of 400.

      struct ResourceAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # An exception for accessing or deleting a resource that does not exist. Gives http status code of
      # 400.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Revokes access to an Amazon OpenSearch Service domain that was provided through an interface VPC
      # endpoint.

      struct RevokeVpcEndpointAccessRequest
        include JSON::Serializable

        # The account ID to revoke access from.

        @[JSON::Field(key: "Account")]
        getter account : String

        # The name of the OpenSearch Service domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @account : String,
          @domain_name : String
        )
        end
      end

      # Container for response parameters to the RevokeVpcEndpointAccess operation. The response body for
      # this operation is empty.

      struct RevokeVpcEndpointAccessResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the SAML Identity Provider's information.

      struct SAMLIdp
        include JSON::Serializable

        # The unique Entity ID of the application in SAML Identity Provider.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The Metadata of the SAML application in xml format.

        @[JSON::Field(key: "MetadataContent")]
        getter metadata_content : String

        def initialize(
          @entity_id : String,
          @metadata_content : String
        )
        end
      end

      # Specifies the SAML application configuration for the domain.

      struct SAMLOptionsInput
        include JSON::Serializable

        # True if SAML is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies the SAML Identity Provider's information.

        @[JSON::Field(key: "Idp")]
        getter idp : Types::SAMLIdp?

        # The backend role to which the SAML master user is mapped to.

        @[JSON::Field(key: "MasterBackendRole")]
        getter master_backend_role : String?

        # The SAML master username, which is stored in the Amazon Elasticsearch Service domain's internal
        # database.

        @[JSON::Field(key: "MasterUserName")]
        getter master_user_name : String?

        # The key to use for matching the SAML Roles attribute.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # The duration, in minutes, after which a user session becomes inactive. Acceptable values are between
        # 1 and 1440, and the default value is 60.

        @[JSON::Field(key: "SessionTimeoutMinutes")]
        getter session_timeout_minutes : Int32?

        # The key to use for matching the SAML Subject attribute.

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

        # Describes the SAML Identity Provider's information.

        @[JSON::Field(key: "Idp")]
        getter idp : Types::SAMLIdp?

        # The key used for matching the SAML Roles attribute.

        @[JSON::Field(key: "RolesKey")]
        getter roles_key : String?

        # The duration, in minutes, after which a user session becomes inactive.

        @[JSON::Field(key: "SessionTimeoutMinutes")]
        getter session_timeout_minutes : Int32?

        # The key used for matching the SAML Subject attribute.

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

      # Specifies details of the scheduled Auto-Tune action. See the Developer Guide for more information.

      struct ScheduledAutoTuneDetails
        include JSON::Serializable

        # Specifies Auto-Tune action description.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # Specifies Auto-Tune action type. Valid values are JVM_HEAP_SIZE_TUNING and JVM_YOUNG_GEN_TUNING.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # Specifies timestamp for the Auto-Tune action scheduled for the domain.

        @[JSON::Field(key: "Date")]
        getter date : Time?

        # Specifies Auto-Tune action severity. Valid values are LOW, MEDIUM and HIGH.

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

      # The current options of an Elasticsearch domain service software options.

      struct ServiceSoftwareOptions
        include JSON::Serializable

        # Timestamp, in Epoch time, until which you can manually request a service software update. After this
        # date, we automatically update your service software.

        @[JSON::Field(key: "AutomatedUpdateDate")]
        getter automated_update_date : Time?

        # True if you are able to cancel your service software version update. False if you are not able to
        # cancel your service software version.

        @[JSON::Field(key: "Cancellable")]
        getter cancellable : Bool?

        # The current service software version that is present on the domain.

        @[JSON::Field(key: "CurrentVersion")]
        getter current_version : String?

        # The description of the UpdateStatus .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new service software version if one is available.

        @[JSON::Field(key: "NewVersion")]
        getter new_version : String?

        # True if a service software is never automatically updated. False if a service software is
        # automatically updated after AutomatedUpdateDate .

        @[JSON::Field(key: "OptionalDeployment")]
        getter optional_deployment : Bool?

        # True if you are able to update you service software version. False if you are not able to update
        # your service software version.

        @[JSON::Field(key: "UpdateAvailable")]
        getter update_available : Bool?

        # The status of your service software update. This field can take the following values: ELIGIBLE ,
        # PENDING_UPDATE , IN_PROGRESS , COMPLETED , and NOT_ELIGIBLE .

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

      # Specifies the time, in UTC format, when the service takes a daily automated snapshot of the
      # specified Elasticsearch domain. Default value is 0 hours.

      struct SnapshotOptions
        include JSON::Serializable

        # Specifies the time, in UTC format, when the service takes a daily automated snapshot of the
        # specified Elasticsearch domain. Default value is 0 hours.

        @[JSON::Field(key: "AutomatedSnapshotStartHour")]
        getter automated_snapshot_start_hour : Int32?

        def initialize(
          @automated_snapshot_start_hour : Int32? = nil
        )
        end
      end

      # Status of a daily automated snapshot.

      struct SnapshotOptionsStatus
        include JSON::Serializable

        # Specifies the daily snapshot options specified for the Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::SnapshotOptions

        # Specifies the status of a daily automated snapshot.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::SnapshotOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # Container for the parameters to the StartElasticsearchServiceSoftwareUpdate operation. Specifies the
      # name of the Elasticsearch domain that you wish to schedule a service software update on.

      struct StartElasticsearchServiceSoftwareUpdateRequest
        include JSON::Serializable

        # The name of the domain that you want to update to the latest service software.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a StartElasticsearchServiceSoftwareUpdate operation. Contains the status of the
      # update.

      struct StartElasticsearchServiceSoftwareUpdateResponse
        include JSON::Serializable

        # The current status of the Elasticsearch service software update.

        @[JSON::Field(key: "ServiceSoftwareOptions")]
        getter service_software_options : Types::ServiceSoftwareOptions?

        def initialize(
          @service_software_options : Types::ServiceSoftwareOptions? = nil
        )
        end
      end

      # StorageTypes represents the list of storage related types and their attributes that are available
      # for given InstanceType.

      struct StorageType
        include JSON::Serializable


        @[JSON::Field(key: "StorageSubTypeName")]
        getter storage_sub_type_name : String?

        # List of limits that are applicable for given storage type.

        @[JSON::Field(key: "StorageTypeLimits")]
        getter storage_type_limits : Array(Types::StorageTypeLimit)?


        @[JSON::Field(key: "StorageTypeName")]
        getter storage_type_name : String?

        def initialize(
          @storage_sub_type_name : String? = nil,
          @storage_type_limits : Array(Types::StorageTypeLimit)? = nil,
          @storage_type_name : String? = nil
        )
        end
      end

      # Limits that are applicable for given storage type.

      struct StorageTypeLimit
        include JSON::Serializable

        # Name of storage limits that are applicable for given storage type. If StorageType is ebs, following
        # storage options are applicable MinimumVolumeSize Minimum amount of volume size that is applicable
        # for given storage type.It can be empty if it is not applicable. MaximumVolumeSize Maximum amount of
        # volume size that is applicable for given storage type.It can be empty if it is not applicable.
        # MaximumIops Maximum amount of Iops that is applicable for given storage type.It can be empty if it
        # is not applicable. MinimumIops Minimum amount of Iops that is applicable for given storage type.It
        # can be empty if it is not applicable. MaximumThroughput Maximum amount of Throughput that is
        # applicable for given storage type.It can be empty if it is not applicable. MinimumThroughput Minimum
        # amount of Throughput that is applicable for given storage type.It can be empty if it is not
        # applicable.

        @[JSON::Field(key: "LimitName")]
        getter limit_name : String?

        # Values for the StorageTypeLimit$LimitName .

        @[JSON::Field(key: "LimitValues")]
        getter limit_values : Array(String)?

        def initialize(
          @limit_name : String? = nil,
          @limit_values : Array(String)? = nil
        )
        end
      end

      # Specifies a key value pair for a resource tag.

      struct Tag
        include JSON::Serializable

        # Specifies the TagKey , the name of the tag. Tag keys must be unique for the Elasticsearch domain to
        # which they are attached.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Specifies the TagValue , the value assigned to the corresponding tag key. Tag values can be null and
        # do not have to be unique in a tag set. For example, you can have a key value pair in a tag set of
        # project : Trinity and cost-center : Trinity

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Container for the parameters to the UpdateElasticsearchDomain operation. Specifies the type and
      # number of instances in the domain cluster.

      struct UpdateElasticsearchDomainConfigRequest
        include JSON::Serializable

        # The name of the Elasticsearch domain that you are updating.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # IAM access policy as a JSON-formatted string.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : String?

        # Modifies the advanced option to allow references to indices in an HTTP request body. Must be false
        # when configuring access to individual sub-resources. By default, the value is true . See
        # Configuration Advanced Options for more information.

        @[JSON::Field(key: "AdvancedOptions")]
        getter advanced_options : Hash(String, String)?

        # Specifies advanced security options.

        @[JSON::Field(key: "AdvancedSecurityOptions")]
        getter advanced_security_options : Types::AdvancedSecurityOptionsInput?

        # Specifies Auto-Tune options.

        @[JSON::Field(key: "AutoTuneOptions")]
        getter auto_tune_options : Types::AutoTuneOptions?

        # Options to specify the Cognito user and identity pools for Kibana authentication. For more
        # information, see Amazon Cognito Authentication for Kibana .

        @[JSON::Field(key: "CognitoOptions")]
        getter cognito_options : Types::CognitoOptions?

        # Options to specify configuration that will be applied to the domain endpoint.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptions?

        # This flag, when set to True, specifies whether the UpdateElasticsearchDomain request should return
        # the results of validation checks without actually applying the change. This flag, when set to True,
        # specifies the deployment mechanism through which the update shall be applied on the domain. This
        # will not actually perform the Update.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # Specify the type and size of the EBS volume that you want to use.

        @[JSON::Field(key: "EBSOptions")]
        getter ebs_options : Types::EBSOptions?

        # The type and number of instances to instantiate for the domain cluster.

        @[JSON::Field(key: "ElasticsearchClusterConfig")]
        getter elasticsearch_cluster_config : Types::ElasticsearchClusterConfig?

        # Specifies the Encryption At Rest Options.

        @[JSON::Field(key: "EncryptionAtRestOptions")]
        getter encryption_at_rest_options : Types::EncryptionAtRestOptions?

        # Map of LogType and LogPublishingOption , each containing options to publish a given type of
        # Elasticsearch log.

        @[JSON::Field(key: "LogPublishingOptions")]
        getter log_publishing_options : Hash(String, Types::LogPublishingOption)?

        # Specifies the NodeToNodeEncryptionOptions.

        @[JSON::Field(key: "NodeToNodeEncryptionOptions")]
        getter node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions?

        # Option to set the time, in UTC format, for the daily automated snapshot. Default value is 0 hours.

        @[JSON::Field(key: "SnapshotOptions")]
        getter snapshot_options : Types::SnapshotOptions?

        # Options to specify the subnets and security groups for VPC endpoint. For more information, see
        # Creating a VPC in VPC Endpoints for Amazon Elasticsearch Service Domains

        @[JSON::Field(key: "VPCOptions")]
        getter vpc_options : Types::VPCOptions?

        def initialize(
          @domain_name : String,
          @access_policies : String? = nil,
          @advanced_options : Hash(String, String)? = nil,
          @advanced_security_options : Types::AdvancedSecurityOptionsInput? = nil,
          @auto_tune_options : Types::AutoTuneOptions? = nil,
          @cognito_options : Types::CognitoOptions? = nil,
          @domain_endpoint_options : Types::DomainEndpointOptions? = nil,
          @dry_run : Bool? = nil,
          @ebs_options : Types::EBSOptions? = nil,
          @elasticsearch_cluster_config : Types::ElasticsearchClusterConfig? = nil,
          @encryption_at_rest_options : Types::EncryptionAtRestOptions? = nil,
          @log_publishing_options : Hash(String, Types::LogPublishingOption)? = nil,
          @node_to_node_encryption_options : Types::NodeToNodeEncryptionOptions? = nil,
          @snapshot_options : Types::SnapshotOptions? = nil,
          @vpc_options : Types::VPCOptions? = nil
        )
        end
      end

      # The result of an UpdateElasticsearchDomain request. Contains the status of the Elasticsearch domain
      # being updated.

      struct UpdateElasticsearchDomainConfigResponse
        include JSON::Serializable

        # The status of the updated Elasticsearch domain.

        @[JSON::Field(key: "DomainConfig")]
        getter domain_config : Types::ElasticsearchDomainConfig

        # Contains result of DryRun.

        @[JSON::Field(key: "DryRunResults")]
        getter dry_run_results : Types::DryRunResults?

        def initialize(
          @domain_config : Types::ElasticsearchDomainConfig,
          @dry_run_results : Types::DryRunResults? = nil
        )
        end
      end

      # Container for request parameters to UpdatePackage operation.

      struct UpdatePackageRequest
        include JSON::Serializable

        # Unique identifier for the package.

        @[JSON::Field(key: "PackageID")]
        getter package_id : String


        @[JSON::Field(key: "PackageSource")]
        getter package_source : Types::PackageSource

        # An info message for the new version which will be shown as part of GetPackageVersionHistoryResponse
        # .

        @[JSON::Field(key: "CommitMessage")]
        getter commit_message : String?

        # New description of the package.

        @[JSON::Field(key: "PackageDescription")]
        getter package_description : String?

        def initialize(
          @package_id : String,
          @package_source : Types::PackageSource,
          @commit_message : String? = nil,
          @package_description : String? = nil
        )
        end
      end

      # Container for response returned by UpdatePackage operation.

      struct UpdatePackageResponse
        include JSON::Serializable

        # Information about the package PackageDetails .

        @[JSON::Field(key: "PackageDetails")]
        getter package_details : Types::PackageDetails?

        def initialize(
          @package_details : Types::PackageDetails? = nil
        )
        end
      end

      # Modifies an Amazon OpenSearch Service-managed interface VPC endpoint.

      struct UpdateVpcEndpointRequest
        include JSON::Serializable

        # Unique identifier of the VPC endpoint to be updated.

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

      # Contains the configuration and status of the VPC endpoint being updated.

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

      # Container for request parameters to UpgradeElasticsearchDomain operation.

      struct UpgradeElasticsearchDomainRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The version of Elasticsearch that you intend to upgrade the domain to.

        @[JSON::Field(key: "TargetVersion")]
        getter target_version : String

        # This flag, when set to True, indicates that an Upgrade Eligibility Check needs to be performed. This
        # will not actually perform the Upgrade.

        @[JSON::Field(key: "PerformCheckOnly")]
        getter perform_check_only : Bool?

        def initialize(
          @domain_name : String,
          @target_version : String,
          @perform_check_only : Bool? = nil
        )
        end
      end

      # Container for response returned by UpgradeElasticsearchDomain operation.

      struct UpgradeElasticsearchDomainResponse
        include JSON::Serializable


        @[JSON::Field(key: "ChangeProgressDetails")]
        getter change_progress_details : Types::ChangeProgressDetails?


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # This flag, when set to True, indicates that an Upgrade Eligibility Check needs to be performed. This
        # will not actually perform the Upgrade.

        @[JSON::Field(key: "PerformCheckOnly")]
        getter perform_check_only : Bool?

        # The version of Elasticsearch that you intend to upgrade the domain to.

        @[JSON::Field(key: "TargetVersion")]
        getter target_version : String?

        def initialize(
          @change_progress_details : Types::ChangeProgressDetails? = nil,
          @domain_name : String? = nil,
          @perform_check_only : Bool? = nil,
          @target_version : String? = nil
        )
        end
      end

      # History of the last 10 Upgrades and Upgrade Eligibility Checks.

      struct UpgradeHistory
        include JSON::Serializable

        # UTC Timestamp at which the Upgrade API call was made in "yyyy-MM-ddTHH:mm:ssZ" format.

        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time?

        # A list of UpgradeStepItem s representing information about each step performed as pard of a specific
        # Upgrade or Upgrade Eligibility Check.

        @[JSON::Field(key: "StepsList")]
        getter steps_list : Array(Types::UpgradeStepItem)?

        # A string that describes the update briefly

        @[JSON::Field(key: "UpgradeName")]
        getter upgrade_name : String?

        # The overall status of the update. The status can take one of the following values: In Progress
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

      # Represents a single step of the Upgrade or Upgrade Eligibility Check workflow.

      struct UpgradeStepItem
        include JSON::Serializable

        # A list of strings containing detailed information about the errors encountered in a particular step.

        @[JSON::Field(key: "Issues")]
        getter issues : Array(String)?

        # The Floating point value representing progress percentage of a particular step.

        @[JSON::Field(key: "ProgressPercent")]
        getter progress_percent : Float64?

        # Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does through: PreUpgradeCheck
        # Snapshot Upgrade

        @[JSON::Field(key: "UpgradeStep")]
        getter upgrade_step : String?

        # The status of a particular step during an upgrade. The status can take one of the following values:
        # In Progress Succeeded Succeeded with Issues Failed

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

      # Options to specify the subnets and security groups for VPC endpoint. For more information, see VPC
      # Endpoints for Amazon Elasticsearch Service Domains .

      struct VPCDerivedInfo
        include JSON::Serializable

        # The availability zones for the Elasticsearch domain. Exists only if the domain was created with
        # VPCOptions.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # Specifies the security groups for VPC endpoint.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # Specifies the subnets for VPC endpoint.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The VPC Id for the Elasticsearch domain. Exists only if the domain was created with VPCOptions.

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

      # Status of the VPC options for the specified Elasticsearch domain.

      struct VPCDerivedInfoStatus
        include JSON::Serializable

        # Specifies the VPC options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::VPCDerivedInfo

        # Specifies the status of the VPC options for the specified Elasticsearch domain.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::VPCDerivedInfo,
          @status : Types::OptionStatus
        )
        end
      end

      # Options to specify the subnets and security groups for VPC endpoint. For more information, see VPC
      # Endpoints for Amazon Elasticsearch Service Domains .

      struct VPCOptions
        include JSON::Serializable

        # Specifies the security groups for VPC endpoint.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # Specifies the subnets for VPC endpoint.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # An exception for missing / invalid input fields. Gives http status code of 400.

      struct ValidationException
        include JSON::Serializable

        def initialize
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

      # Specifies the zone awareness configuration for the domain cluster, such as the number of
      # availability zones.

      struct ZoneAwarenessConfig
        include JSON::Serializable

        # An integer value to indicate the number of availability zones for a domain when zone awareness is
        # enabled. This should be equal to number of subnets if VPC endpoints is enabled

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
