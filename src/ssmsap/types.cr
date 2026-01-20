require "json"
require "time"

module Aws
  module SsmSap
    module Types

      # An SAP application registered with AWS Systems Manager for SAP.

      struct Application
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Application Registry.

        @[JSON::Field(key: "AppRegistryArn")]
        getter app_registry_arn : String?

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Names of the associated AWS Systems Manager for SAP applications.

        @[JSON::Field(key: "AssociatedApplicationArns")]
        getter associated_application_arns : Array(String)?

        # The components of the application.

        @[JSON::Field(key: "Components")]
        getter components : Array(String)?

        # The latest discovery result for the application.

        @[JSON::Field(key: "DiscoveryStatus")]
        getter discovery_status : String?

        # The ID of the application.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The time at which the application was last updated.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The status of the application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The type of the application.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @app_registry_arn : String? = nil,
          @arn : String? = nil,
          @associated_application_arns : Array(String)? = nil,
          @components : Array(String)? = nil,
          @discovery_status : String? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The credentials of your SAP application.

      struct ApplicationCredential
        include JSON::Serializable

        # The type of the application credentials.

        @[JSON::Field(key: "CredentialType")]
        getter credential_type : String

        # The name of the SAP HANA database.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The secret ID created in AWS Secrets Manager to store the credentials of the SAP application.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @credential_type : String,
          @database_name : String,
          @secret_id : String
        )
        end
      end

      # The summary of the SAP application registered with AWS Systems Manager for SAP.

      struct ApplicationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The status of the latest discovery.

        @[JSON::Field(key: "DiscoveryStatus")]
        getter discovery_status : String?

        # The ID of the application.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The tags on the application.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The type of the application.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @discovery_status : String? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the properties of the associated host.

      struct AssociatedHost
        include JSON::Serializable

        # The ID of the Amazon EC2 instance.

        @[JSON::Field(key: "Ec2InstanceId")]
        getter ec2_instance_id : String?

        # The name of the host.

        @[JSON::Field(key: "Hostname")]
        getter hostname : String?

        # The IP addresses of the associated host.

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(Types::IpAddressMember)?

        # The version of the operating system.

        @[JSON::Field(key: "OsVersion")]
        getter os_version : String?

        def initialize(
          @ec2_instance_id : String? = nil,
          @hostname : String? = nil,
          @ip_addresses : Array(Types::IpAddressMember)? = nil,
          @os_version : String? = nil
        )
        end
      end

      # Configuration parameters for AWS Backint Agent for SAP HANA. You can backup your SAP HANA database
      # with AWS Backup or Amazon S3.

      struct BackintConfig
        include JSON::Serializable

        # AWS service for your database backup.

        @[JSON::Field(key: "BackintMode")]
        getter backint_mode : String


        @[JSON::Field(key: "EnsureNoBackupInProcess")]
        getter ensure_no_backup_in_process : Bool

        def initialize(
          @backint_mode : String,
          @ensure_no_backup_in_process : Bool
        )
        end
      end

      # The SAP component of your application.

      struct Component
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the component.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The associated host of the component.

        @[JSON::Field(key: "AssociatedHost")]
        getter associated_host : Types::AssociatedHost?

        # The child components of a highly available environment. For example, in a highly available SAP on
        # AWS workload, the child component consists of the primary and secondar instances.

        @[JSON::Field(key: "ChildComponents")]
        getter child_components : Array(String)?

        # The ID of the component.

        @[JSON::Field(key: "ComponentId")]
        getter component_id : String?

        # The type of the component.

        @[JSON::Field(key: "ComponentType")]
        getter component_type : String?

        # The connection specifications for the database of the component.

        @[JSON::Field(key: "DatabaseConnection")]
        getter database_connection : Types::DatabaseConnection?

        # The SAP HANA databases of the component.

        @[JSON::Field(key: "Databases")]
        getter databases : Array(String)?

        # The SAP HANA version of the component.

        @[JSON::Field(key: "HdbVersion")]
        getter hdb_version : String?

        # The hosts of the component.

        @[JSON::Field(key: "Hosts")]
        getter hosts : Array(Types::Host)?

        # The time at which the component was last updated.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The parent component of a highly available environment. For example, in a highly available SAP on
        # AWS workload, the parent component consists of the entire setup, including the child components.

        @[JSON::Field(key: "ParentComponent")]
        getter parent_component : String?

        # The primary host of the component.

        @[JSON::Field(key: "PrimaryHost")]
        getter primary_host : String?

        # Details of the SAP HANA system replication for the component.

        @[JSON::Field(key: "Resilience")]
        getter resilience : Types::Resilience?

        # The SAP feature of the component.

        @[JSON::Field(key: "SapFeature")]
        getter sap_feature : String?

        # The hostname of the component.

        @[JSON::Field(key: "SapHostname")]
        getter sap_hostname : String?

        # The kernel version of the component.

        @[JSON::Field(key: "SapKernelVersion")]
        getter sap_kernel_version : String?

        # The SAP System Identifier of the application component.

        @[JSON::Field(key: "Sid")]
        getter sid : String?

        # The status of the component. ACTIVATED - this status has been deprecated. STARTING - the component
        # is in the process of being started. STOPPED - the component is not running. STOPPING - the component
        # is in the process of being stopped. RUNNING - the component is running. RUNNING_WITH_ERROR - one or
        # more child component(s) of the parent component is not running. Call GetComponent to review the
        # status of each child component. UNDEFINED - AWS Systems Manager for SAP cannot provide the component
        # status based on the discovered information. Verify your SAP application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The SAP system number of the application component.

        @[JSON::Field(key: "SystemNumber")]
        getter system_number : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @associated_host : Types::AssociatedHost? = nil,
          @child_components : Array(String)? = nil,
          @component_id : String? = nil,
          @component_type : String? = nil,
          @database_connection : Types::DatabaseConnection? = nil,
          @databases : Array(String)? = nil,
          @hdb_version : String? = nil,
          @hosts : Array(Types::Host)? = nil,
          @last_updated : Time? = nil,
          @parent_component : String? = nil,
          @primary_host : String? = nil,
          @resilience : Types::Resilience? = nil,
          @sap_feature : String? = nil,
          @sap_hostname : String? = nil,
          @sap_kernel_version : String? = nil,
          @sid : String? = nil,
          @status : String? = nil,
          @system_number : String? = nil
        )
        end
      end

      # This is information about the component of your SAP application, such as Web Dispatcher.

      struct ComponentInfo
        include JSON::Serializable

        # This string is the type of the component. Accepted value is WD .

        @[JSON::Field(key: "ComponentType")]
        getter component_type : String

        # This is the Amazon EC2 instance on which your SAP component is running. Accepted values are
        # alphanumeric.

        @[JSON::Field(key: "Ec2InstanceId")]
        getter ec2_instance_id : String

        # This string is the SAP System ID of the component. Accepted values are alphanumeric.

        @[JSON::Field(key: "Sid")]
        getter sid : String

        def initialize(
          @component_type : String,
          @ec2_instance_id : String,
          @sid : String
        )
        end
      end

      # The summary of the component.

      struct ComponentSummary
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the component summary.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the component.

        @[JSON::Field(key: "ComponentId")]
        getter component_id : String?

        # The type of the component.

        @[JSON::Field(key: "ComponentType")]
        getter component_type : String?

        # The tags of the component.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @component_id : String? = nil,
          @component_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a configuration check definition supported by AWS Systems Manager for SAP.

      struct ConfigurationCheckDefinition
        include JSON::Serializable

        # The list of SSMSAP application types that this configuration check can be evaluated against.

        @[JSON::Field(key: "ApplicableApplicationTypes")]
        getter applicable_application_types : Array(String)?

        # A description of what the configuration check validates.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the configuration check.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the configuration check.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @applicable_application_types : Array(String)? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents a configuration check operation that has been executed against an application.

      struct ConfigurationCheckOperation
        include JSON::Serializable

        # The ID of the application against which the configuration check was performed.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # A description of the configuration check that was performed.

        @[JSON::Field(key: "ConfigurationCheckDescription")]
        getter configuration_check_description : String?

        # The unique identifier of the configuration check that was performed.

        @[JSON::Field(key: "ConfigurationCheckId")]
        getter configuration_check_id : String?

        # The name of the configuration check that was performed.

        @[JSON::Field(key: "ConfigurationCheckName")]
        getter configuration_check_name : String?

        # The time at which the configuration check operation completed.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The unique identifier of the configuration check operation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A summary of all the rule results, showing counts for each status type.

        @[JSON::Field(key: "RuleStatusCounts")]
        getter rule_status_counts : Types::RuleStatusCounts?

        # The time at which the configuration check operation started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The current status of the configuration check operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message providing additional details about the status of the configuration check operation.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @application_id : String? = nil,
          @configuration_check_description : String? = nil,
          @configuration_check_id : String? = nil,
          @configuration_check_name : String? = nil,
          @end_time : Time? = nil,
          @id : String? = nil,
          @rule_status_counts : Types::RuleStatusCounts? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A conflict has occurred.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The SAP HANA database of the application registered with AWS Systems Manager for SAP.

      struct Database
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the database.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the component.

        @[JSON::Field(key: "ComponentId")]
        getter component_id : String?

        # The Amazon Resource Names of the connected AWS Systems Manager for SAP components.

        @[JSON::Field(key: "ConnectedComponentArns")]
        getter connected_component_arns : Array(String)?

        # The credentials of the database.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Array(Types::ApplicationCredential)?

        # The ID of the SAP HANA database.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # The name of the database.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The type of the database.

        @[JSON::Field(key: "DatabaseType")]
        getter database_type : String?

        # The time at which the database was last updated.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The primary host of the database.

        @[JSON::Field(key: "PrimaryHost")]
        getter primary_host : String?

        # The SQL port of the database.

        @[JSON::Field(key: "SQLPort")]
        getter sql_port : Int32?

        # The status of the database.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @component_id : String? = nil,
          @connected_component_arns : Array(String)? = nil,
          @credentials : Array(Types::ApplicationCredential)? = nil,
          @database_id : String? = nil,
          @database_name : String? = nil,
          @database_type : String? = nil,
          @last_updated : Time? = nil,
          @primary_host : String? = nil,
          @sql_port : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # The connection specifications for the database.

      struct DatabaseConnection
        include JSON::Serializable

        # The IP address for connection.

        @[JSON::Field(key: "ConnectionIp")]
        getter connection_ip : String?

        # The Amazon Resource Name of the connected SAP HANA database.

        @[JSON::Field(key: "DatabaseArn")]
        getter database_arn : String?

        # The method of connection.

        @[JSON::Field(key: "DatabaseConnectionMethod")]
        getter database_connection_method : String?

        def initialize(
          @connection_ip : String? = nil,
          @database_arn : String? = nil,
          @database_connection_method : String? = nil
        )
        end
      end

      # The summary of the database.

      struct DatabaseSummary
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the database.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the component.

        @[JSON::Field(key: "ComponentId")]
        getter component_id : String?

        # The ID of the database.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        # The type of the database.

        @[JSON::Field(key: "DatabaseType")]
        getter database_type : String?

        # The tags of the database.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @component_id : String? = nil,
          @database_id : String? = nil,
          @database_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DeleteResourcePermissionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Delete or restore the permissions on the target database.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # The Amazon Resource Name (ARN) of the source resource.

        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        def initialize(
          @resource_arn : String,
          @action_type : String? = nil,
          @source_resource_arn : String? = nil
        )
        end
      end


      struct DeleteResourcePermissionOutput
        include JSON::Serializable

        # The policy that removes permissions on the target database.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct DeregisterApplicationInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeregisterApplicationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A specific result obtained by specifying the name, value, and operator.

      struct Filter
        include JSON::Serializable

        # The name of the filter. Filter names are case-sensitive.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The operator for the filter.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The filter values. Filter values are case-sensitive. If you specify multiple values for a filter,
        # the values are joined with an OR, and the request returns all results that match any of the
        # specified values

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @operator : String,
          @value : String
        )
        end
      end


      struct GetApplicationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application registry.

        @[JSON::Field(key: "AppRegistryArn")]
        getter app_registry_arn : String?

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        def initialize(
          @app_registry_arn : String? = nil,
          @application_arn : String? = nil,
          @application_id : String? = nil
        )
        end
      end


      struct GetApplicationOutput
        include JSON::Serializable

        # Returns all of the metadata of an application registered with AWS Systems Manager for SAP.

        @[JSON::Field(key: "Application")]
        getter application : Types::Application?

        # The tags of a registered application.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application : Types::Application? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetComponentInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The ID of the component.

        @[JSON::Field(key: "ComponentId")]
        getter component_id : String

        def initialize(
          @application_id : String,
          @component_id : String
        )
        end
      end


      struct GetComponentOutput
        include JSON::Serializable

        # The component of an application registered with AWS Systems Manager for SAP.

        @[JSON::Field(key: "Component")]
        getter component : Types::Component?

        # The tags of a component.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @component : Types::Component? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetConfigurationCheckOperationInput
        include JSON::Serializable

        # The ID of the configuration check operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        def initialize(
          @operation_id : String
        )
        end
      end


      struct GetConfigurationCheckOperationOutput
        include JSON::Serializable

        # Returns the details of a configuration check operation.

        @[JSON::Field(key: "ConfigurationCheckOperation")]
        getter configuration_check_operation : Types::ConfigurationCheckOperation?

        def initialize(
          @configuration_check_operation : Types::ConfigurationCheckOperation? = nil
        )
        end
      end


      struct GetDatabaseInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The ID of the component.

        @[JSON::Field(key: "ComponentId")]
        getter component_id : String?

        # The Amazon Resource Name (ARN) of the database.

        @[JSON::Field(key: "DatabaseArn")]
        getter database_arn : String?

        # The ID of the database.

        @[JSON::Field(key: "DatabaseId")]
        getter database_id : String?

        def initialize(
          @application_id : String? = nil,
          @component_id : String? = nil,
          @database_arn : String? = nil,
          @database_id : String? = nil
        )
        end
      end


      struct GetDatabaseOutput
        include JSON::Serializable

        # The SAP HANA database of an application registered with AWS Systems Manager for SAP.

        @[JSON::Field(key: "Database")]
        getter database : Types::Database?

        # The tags of a database.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @database : Types::Database? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetOperationInput
        include JSON::Serializable

        # The ID of the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        def initialize(
          @operation_id : String
        )
        end
      end


      struct GetOperationOutput
        include JSON::Serializable

        # Returns the details of an operation.

        @[JSON::Field(key: "Operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end


      struct GetResourcePermissionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        def initialize(
          @resource_arn : String,
          @action_type : String? = nil
        )
        end
      end


      struct GetResourcePermissionOutput
        include JSON::Serializable


        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # Describes the properties of the Dedicated Host.

      struct Host
        include JSON::Serializable

        # The ID of Amazon EC2 instance.

        @[JSON::Field(key: "EC2InstanceId")]
        getter ec2_instance_id : String?

        # The IP address of the Dedicated Host.

        @[JSON::Field(key: "HostIp")]
        getter host_ip : String?

        # The name of the Dedicated Host.

        @[JSON::Field(key: "HostName")]
        getter host_name : String?

        # The role of the Dedicated Host.

        @[JSON::Field(key: "HostRole")]
        getter host_role : String?

        # The instance ID of the instance on the Dedicated Host.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The version of the operating system.

        @[JSON::Field(key: "OsVersion")]
        getter os_version : String?

        def initialize(
          @ec2_instance_id : String? = nil,
          @host_ip : String? = nil,
          @host_name : String? = nil,
          @host_role : String? = nil,
          @instance_id : String? = nil,
          @os_version : String? = nil
        )
        end
      end

      # An internal error has occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information of the IP address.

      struct IpAddressMember
        include JSON::Serializable

        # The type of allocation for the IP address.

        @[JSON::Field(key: "AllocationType")]
        getter allocation_type : String?

        # The IP address.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The primary IP address.

        @[JSON::Field(key: "Primary")]
        getter primary : Bool?

        def initialize(
          @allocation_type : String? = nil,
          @ip_address : String? = nil,
          @primary : Bool? = nil
        )
        end
      end


      struct ListApplicationsInput
        include JSON::Serializable

        # The filter of name, value, and operator.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsOutput
        include JSON::Serializable

        # The applications registered with AWS Systems Manager for SAP.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::ApplicationSummary)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::ApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentsInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If you do not specify a value for MaxResults, the
        # request returns 50 items per page by default.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentsOutput
        include JSON::Serializable

        # List of components registered with AWS System Manager for SAP.

        @[JSON::Field(key: "Components")]
        getter components : Array(Types::ComponentSummary)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @components : Array(Types::ComponentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigurationCheckDefinitionsInput
        include JSON::Serializable

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigurationCheckDefinitionsOutput
        include JSON::Serializable

        # The configuration check types supported by AWS Systems Manager for SAP.

        @[JSON::Field(key: "ConfigurationChecks")]
        getter configuration_checks : Array(Types::ConfigurationCheckDefinition)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_checks : Array(Types::ConfigurationCheckDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigurationCheckOperationsInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The filters of an operation.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The mode for listing configuration check operations. Defaults to "LATEST_PER_CHECK".
        # LATEST_PER_CHECK - Will list the latest configuration check operation per check type. ALL_OPERATIONS
        # - Will list all configuration check operations performed on the application.

        @[JSON::Field(key: "ListMode")]
        getter list_mode : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @filters : Array(Types::Filter)? = nil,
          @list_mode : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigurationCheckOperationsOutput
        include JSON::Serializable

        # The configuration check operations performed by AWS Systems Manager for SAP.

        @[JSON::Field(key: "ConfigurationCheckOperations")]
        getter configuration_check_operations : Array(Types::ConfigurationCheckOperation)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_check_operations : Array(Types::ConfigurationCheckOperation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatabasesInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The ID of the component.

        @[JSON::Field(key: "ComponentId")]
        getter component_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If you do not specify a value for MaxResults, the
        # request returns 50 items per page by default.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String? = nil,
          @component_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatabasesOutput
        include JSON::Serializable

        # The SAP HANA databases of an application.

        @[JSON::Field(key: "Databases")]
        getter databases : Array(Types::DatabaseSummary)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @databases : Array(Types::DatabaseSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOperationEventsInput
        include JSON::Serializable

        # The ID of the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # Optionally specify filters to narrow the returned operation event items. Valid filter names include
        # status , resourceID , and resourceType . The valid operator for all three filters is Equals .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If you do not specify a value for MaxResults , the
        # request returns 50 items per page by default.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @operation_id : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOperationEventsOutput
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A returned list of operation events that meet the filter criteria.

        @[JSON::Field(key: "OperationEvents")]
        getter operation_events : Array(Types::OperationEvent)?

        def initialize(
          @next_token : String? = nil,
          @operation_events : Array(Types::OperationEvent)? = nil
        )
        end
      end


      struct ListOperationsInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The filters of an operation.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If you do not specify a value for MaxResults, the
        # request returns 50 items per page by default.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOperationsOutput
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of operations performed by AWS Systems Manager for SAP.

        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @next_token : String? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end


      struct ListSubCheckResultsInput
        include JSON::Serializable

        # The ID of the configuration check operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @operation_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubCheckResultsOutput
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The sub-check results of a configuration check operation.

        @[JSON::Field(key: "SubCheckResults")]
        getter sub_check_results : Array(Types::SubCheckResult)?

        def initialize(
          @next_token : String? = nil,
          @sub_check_results : Array(Types::SubCheckResult)? = nil
        )
        end
      end


      struct ListSubCheckRuleResultsInput
        include JSON::Serializable

        # The ID of the sub check result.

        @[JSON::Field(key: "SubCheckResultId")]
        getter sub_check_result_id : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @sub_check_result_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubCheckRuleResultsOutput
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The rule results of a sub-check belonging to a configuration check operation.

        @[JSON::Field(key: "RuleResults")]
        getter rule_results : Array(Types::RuleResult)?

        def initialize(
          @next_token : String? = nil,
          @rule_results : Array(Types::RuleResult)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The operations performed by AWS Systems Manager for SAP.

      struct Operation
        include JSON::Serializable

        # The end time of the operation.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The ID of the operation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The time at which the operation was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The properties of the operation.

        @[JSON::Field(key: "Properties")]
        getter properties : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the operation.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The resource ID of the operation.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type of the operation.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The start time of the operation.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The status of the operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message of the operation.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The type of the operation.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @end_time : Time? = nil,
          @id : String? = nil,
          @last_updated_time : Time? = nil,
          @properties : Hash(String, String)? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An operation event returns details for an operation, including key milestones which can be used to
      # monitor and track operations in progress. Operation events contain: Description string Resource,
      # including its ARN and type Status StatusMessage string TimeStamp Operation event examples include
      # StartApplication or StopApplication.

      struct OperationEvent
        include JSON::Serializable

        # A description of the operation event. For example, "Stop the EC2 instance i-abcdefgh987654321".

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The resource involved in the operations event. Contains ResourceArn ARN and ResourceType .

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource?

        # The status of the operation event. The possible statuses are: IN_PROGRESS , COMPLETED , and FAILED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message relating to a specific operation event.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The timestamp of the specified operation event.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @description : String? = nil,
          @resource : Types::Resource? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end


      struct PutResourcePermissionInput
        include JSON::Serializable


        @[JSON::Field(key: "ActionType")]
        getter action_type : String


        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String

        def initialize(
          @action_type : String,
          @resource_arn : String,
          @source_resource_arn : String
        )
        end
      end


      struct PutResourcePermissionOutput
        include JSON::Serializable


        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct RegisterApplicationInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The type of the application.

        @[JSON::Field(key: "ApplicationType")]
        getter application_type : String

        # The Amazon EC2 instances on which your SAP application is running.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(String)

        # This is an optional parameter for component details to which the SAP ABAP application is attached,
        # such as Web Dispatcher. This is an array of ApplicationComponent objects. You may input 0 to 5
        # items.

        @[JSON::Field(key: "ComponentsInfo")]
        getter components_info : Array(Types::ComponentInfo)?

        # The credentials of the SAP application.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Array(Types::ApplicationCredential)?

        # The Amazon Resource Name of the SAP HANA database.

        @[JSON::Field(key: "DatabaseArn")]
        getter database_arn : String?

        # The SAP instance number of the application.

        @[JSON::Field(key: "SapInstanceNumber")]
        getter sap_instance_number : String?

        # The System ID of the application.

        @[JSON::Field(key: "Sid")]
        getter sid : String?

        # The tags to be attached to the SAP application.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String,
          @application_type : String,
          @instances : Array(String),
          @components_info : Array(Types::ComponentInfo)? = nil,
          @credentials : Array(Types::ApplicationCredential)? = nil,
          @database_arn : String? = nil,
          @sap_instance_number : String? = nil,
          @sid : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterApplicationOutput
        include JSON::Serializable

        # The application registered with AWS Systems Manager for SAP.

        @[JSON::Field(key: "Application")]
        getter application : Types::Application?

        # The ID of the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @application : Types::Application? = nil,
          @operation_id : String? = nil
        )
        end
      end

      # Details of the SAP HANA system replication for the instance.

      struct Resilience
        include JSON::Serializable

        # The cluster status of the component.

        @[JSON::Field(key: "ClusterStatus")]
        getter cluster_status : String?

        # Indicates if or not enqueue replication is enabled for the ASCS component.

        @[JSON::Field(key: "EnqueueReplication")]
        getter enqueue_replication : Bool?

        # The operation mode of the component.

        @[JSON::Field(key: "HsrOperationMode")]
        getter hsr_operation_mode : String?

        # The replication mode of the component.

        @[JSON::Field(key: "HsrReplicationMode")]
        getter hsr_replication_mode : String?

        # The tier of the component.

        @[JSON::Field(key: "HsrTier")]
        getter hsr_tier : String?

        def initialize(
          @cluster_status : String? = nil,
          @enqueue_replication : Bool? = nil,
          @hsr_operation_mode : String? = nil,
          @hsr_replication_mode : String? = nil,
          @hsr_tier : String? = nil
        )
        end
      end

      # The resource contains a ResourceArn and the ResourceType .

      struct Resource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the source resource. Example of ResourceArn : "
        # arn:aws:ec2:us-east-1:111111111111:instance/i-abcdefgh987654321 "

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The resource type. Example of ResourceType : " AWS::SystemsManagerSAP::Component " or "
        # AWS::EC2::Instance ".

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The resource is not available.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the result of a single rule within a configuration check.

      struct RuleResult
        include JSON::Serializable

        # A description of what the rule validates.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the rule result.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A message providing details about the rule result.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # Additional metadata associated with the rule result.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)?

        # The status of the rule result.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @message : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @status : String? = nil
        )
        end
      end

      # A summary of rule results, providing counts for each status type.

      struct RuleStatusCounts
        include JSON::Serializable

        # The number of rules that failed.

        @[JSON::Field(key: "Failed")]
        getter failed : Int32?

        # The number of rules that returned informational results.

        @[JSON::Field(key: "Info")]
        getter info : Int32?

        # The number of rules that passed.

        @[JSON::Field(key: "Passed")]
        getter passed : Int32?

        # The number of rules with unknown status.

        @[JSON::Field(key: "Unknown")]
        getter unknown : Int32?

        # The number of rules that returned warnings.

        @[JSON::Field(key: "Warning")]
        getter warning : Int32?

        def initialize(
          @failed : Int32? = nil,
          @info : Int32? = nil,
          @passed : Int32? = nil,
          @unknown : Int32? = nil,
          @warning : Int32? = nil
        )
        end
      end


      struct StartApplicationInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct StartApplicationOutput
        include JSON::Serializable

        # The ID of the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct StartApplicationRefreshInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct StartApplicationRefreshOutput
        include JSON::Serializable

        # The ID of the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct StartConfigurationChecksInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The list of configuration checks to perform.

        @[JSON::Field(key: "ConfigurationCheckIds")]
        getter configuration_check_ids : Array(String)?

        def initialize(
          @application_id : String,
          @configuration_check_ids : Array(String)? = nil
        )
        end
      end


      struct StartConfigurationChecksOutput
        include JSON::Serializable

        # The configuration check operations that were started.

        @[JSON::Field(key: "ConfigurationCheckOperations")]
        getter configuration_check_operations : Array(Types::ConfigurationCheckOperation)?

        def initialize(
          @configuration_check_operations : Array(Types::ConfigurationCheckOperation)? = nil
        )
        end
      end


      struct StopApplicationInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # Boolean. If included and if set to True , the StopApplication operation will shut down the
        # associated Amazon EC2 instance in addition to the application.

        @[JSON::Field(key: "IncludeEc2InstanceShutdown")]
        getter include_ec2_instance_shutdown : Bool?

        # Specify the ConnectedEntityType . Accepted type is DBMS . If this parameter is included, the
        # connected DBMS (Database Management System) will be stopped.

        @[JSON::Field(key: "StopConnectedEntity")]
        getter stop_connected_entity : String?

        def initialize(
          @application_id : String,
          @include_ec2_instance_shutdown : Bool? = nil,
          @stop_connected_entity : String? = nil
        )
        end
      end


      struct StopApplicationOutput
        include JSON::Serializable

        # The ID of the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # Represents the result of a sub-check within a configuration check operation.

      struct SubCheckResult
        include JSON::Serializable

        # A description of what the sub-check validates.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the sub-check result.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the sub-check.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of references or documentation links related to the sub-check.

        @[JSON::Field(key: "References")]
        getter references : Array(String)?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @references : Array(String)? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags on a resource.

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

      # The request is not authorized.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Adds/updates or removes credentials for applications registered with AWS Systems Manager for SAP.

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


      struct UpdateApplicationSettingsInput
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # Installation of AWS Backint Agent for SAP HANA.

        @[JSON::Field(key: "Backint")]
        getter backint : Types::BackintConfig?

        # The credentials to be added or updated.

        @[JSON::Field(key: "CredentialsToAddOrUpdate")]
        getter credentials_to_add_or_update : Array(Types::ApplicationCredential)?

        # The credentials to be removed.

        @[JSON::Field(key: "CredentialsToRemove")]
        getter credentials_to_remove : Array(Types::ApplicationCredential)?

        # The Amazon Resource Name of the SAP HANA database that replaces the current SAP HANA connection with
        # the SAP_ABAP application.

        @[JSON::Field(key: "DatabaseArn")]
        getter database_arn : String?

        def initialize(
          @application_id : String,
          @backint : Types::BackintConfig? = nil,
          @credentials_to_add_or_update : Array(Types::ApplicationCredential)? = nil,
          @credentials_to_remove : Array(Types::ApplicationCredential)? = nil,
          @database_arn : String? = nil
        )
        end
      end


      struct UpdateApplicationSettingsOutput
        include JSON::Serializable

        # The update message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The IDs of the operations.

        @[JSON::Field(key: "OperationIds")]
        getter operation_ids : Array(String)?

        def initialize(
          @message : String? = nil,
          @operation_ids : Array(String)? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.

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
