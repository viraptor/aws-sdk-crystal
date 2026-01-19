require "json"
require "time"

module AwsSdk
  module AppRunner
    module Types

      struct AssociateCustomDomainRequest
        include JSON::Serializable

        # A custom domain endpoint to associate. Specify a root domain (for example, example.com ), a
        # subdomain (for example, login.example.com or admin.login.example.com ), or a wildcard (for example,
        # *.example.com ).
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Amazon Resource Name (ARN) of the App Runner service that you want to associate a custom domain
        # name with.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # Set to true to associate the subdomain www. DomainName with the App Runner service in addition to
        # the base domain. Default: true
        @[JSON::Field(key: "EnableWWWSubdomain")]
        getter enable_www_subdomain : Bool?

        def initialize(
          @domain_name : String,
          @service_arn : String,
          @enable_www_subdomain : Bool? = nil
        )
        end
      end

      struct AssociateCustomDomainResponse
        include JSON::Serializable

        # A description of the domain name that's being associated.
        @[JSON::Field(key: "CustomDomain")]
        getter custom_domain : Types::CustomDomain

        # The App Runner subdomain of the App Runner service. The custom domain name is mapped to this target
        # name.
        @[JSON::Field(key: "DNSTarget")]
        getter dns_target : String

        # The Amazon Resource Name (ARN) of the App Runner service with which a custom domain name is
        # associated.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # DNS Target records for the custom domains of this Amazon VPC.
        @[JSON::Field(key: "VpcDNSTargets")]
        getter vpc_dns_targets : Array(Types::VpcDNSTarget)

        def initialize(
          @custom_domain : Types::CustomDomain,
          @dns_target : String,
          @service_arn : String,
          @vpc_dns_targets : Array(Types::VpcDNSTarget)
        )
        end
      end

      # Describes resources needed to authenticate access to some source repositories. The specific resource
      # depends on the repository provider.
      struct AuthenticationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants the App Runner service access to a source
        # repository. It's required for ECR image repositories (but not for ECR Public repositories).
        @[JSON::Field(key: "AccessRoleArn")]
        getter access_role_arn : String?

        # The Amazon Resource Name (ARN) of the App Runner connection that enables the App Runner service to
        # connect to a source repository. It's required for GitHub code repositories.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        def initialize(
          @access_role_arn : String? = nil,
          @connection_arn : String? = nil
        )
        end
      end

      # Describes an App Runner automatic scaling configuration resource. A higher MinSize increases the
      # spread of your App Runner service over more Availability Zones in the Amazon Web Services Region.
      # The tradeoff is a higher minimal cost. A lower MaxSize controls your cost. The tradeoff is lower
      # responsiveness during peak demand. Multiple revisions of a configuration might have the same
      # AutoScalingConfigurationName and different AutoScalingConfigurationRevision values.
      struct AutoScalingConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this auto scaling configuration.
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String?

        # The customer-provided auto scaling configuration name. It can be used in multiple revisions of a
        # configuration.
        @[JSON::Field(key: "AutoScalingConfigurationName")]
        getter auto_scaling_configuration_name : String?

        # The revision of this auto scaling configuration. It's unique among all the active configurations (
        # "Status": "ACTIVE" ) that share the same AutoScalingConfigurationName .
        @[JSON::Field(key: "AutoScalingConfigurationRevision")]
        getter auto_scaling_configuration_revision : Int32?

        # The time when the auto scaling configuration was created. It's in Unix time stamp format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The time when the auto scaling configuration was deleted. It's in Unix time stamp format.
        @[JSON::Field(key: "DeletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deleted_at : Time?

        # Indicates if this auto scaling configuration has an App Runner service associated with it. A value
        # of true indicates one or more services are associated. A value of false indicates no services are
        # associated.
        @[JSON::Field(key: "HasAssociatedService")]
        getter has_associated_service : Bool?

        # Indicates if this auto scaling configuration should be used as the default for a new App Runner
        # service that does not have an auto scaling configuration ARN specified during creation. Each account
        # can have only one default AutoScalingConfiguration per region. The default AutoScalingConfiguration
        # can be any revision under the same AutoScalingConfigurationName .
        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # It's set to true for the configuration with the highest Revision among all configurations that share
        # the same AutoScalingConfigurationName . It's set to false otherwise.
        @[JSON::Field(key: "Latest")]
        getter latest : Bool?

        # The maximum number of concurrent requests that an instance processes. If the number of concurrent
        # requests exceeds this limit, App Runner scales the service up.
        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : Int32?

        # The maximum number of instances that a service scales up to. At most MaxSize instances actively
        # serve traffic for your service.
        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32?

        # The minimum number of instances that App Runner provisions for a service. The service always has at
        # least MinSize provisioned instances. Some of them actively serve traffic. The rest of them
        # (provisioned and inactive instances) are a cost-effective compute capacity reserve and are ready to
        # be quickly activated. You pay for memory usage of all the provisioned instances. You pay for CPU
        # usage of only the active subset. App Runner temporarily doubles the number of provisioned instances
        # during deployments, to maintain the same capacity for both old and new code.
        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # The current state of the auto scaling configuration. If the status of a configuration revision is
        # INACTIVE , it was deleted and can't be used. Inactive configuration revisions are permanently
        # removed some time after they are deleted.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @auto_scaling_configuration_arn : String? = nil,
          @auto_scaling_configuration_name : String? = nil,
          @auto_scaling_configuration_revision : Int32? = nil,
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @has_associated_service : Bool? = nil,
          @is_default : Bool? = nil,
          @latest : Bool? = nil,
          @max_concurrency : Int32? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides summary information about an App Runner automatic scaling configuration resource. This type
      # contains limited information about an auto scaling configuration. It includes only identification
      # information, without configuration details. It's returned by the ListAutoScalingConfigurations
      # action. Complete configuration information is returned by the CreateAutoScalingConfiguration ,
      # DescribeAutoScalingConfiguration , and DeleteAutoScalingConfiguration actions using the
      # AutoScalingConfiguration type.
      struct AutoScalingConfigurationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this auto scaling configuration.
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String?

        # The customer-provided auto scaling configuration name. It can be used in multiple revisions of a
        # configuration.
        @[JSON::Field(key: "AutoScalingConfigurationName")]
        getter auto_scaling_configuration_name : String?

        # The revision of this auto scaling configuration. It's unique among all the active configurations (
        # "Status": "ACTIVE" ) with the same AutoScalingConfigurationName .
        @[JSON::Field(key: "AutoScalingConfigurationRevision")]
        getter auto_scaling_configuration_revision : Int32?

        # The time when the auto scaling configuration was created. It's in Unix time stamp format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Indicates if this auto scaling configuration has an App Runner service associated with it. A value
        # of true indicates one or more services are associated. A value of false indicates no services are
        # associated.
        @[JSON::Field(key: "HasAssociatedService")]
        getter has_associated_service : Bool?

        # Indicates if this auto scaling configuration should be used as the default for a new App Runner
        # service that does not have an auto scaling configuration ARN specified during creation. Each account
        # can have only one default AutoScalingConfiguration per region. The default AutoScalingConfiguration
        # can be any revision under the same AutoScalingConfigurationName .
        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # The current state of the auto scaling configuration. If the status of a configuration revision is
        # INACTIVE , it was deleted and can't be used. Inactive configuration revisions are permanently
        # removed some time after they are deleted.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @auto_scaling_configuration_arn : String? = nil,
          @auto_scaling_configuration_name : String? = nil,
          @auto_scaling_configuration_revision : Int32? = nil,
          @created_at : Time? = nil,
          @has_associated_service : Bool? = nil,
          @is_default : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a certificate CNAME record to add to your DNS. For more information, see
      # AssociateCustomDomain .
      struct CertificateValidationRecord
        include JSON::Serializable

        # The certificate CNAME record name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current state of the certificate CNAME record validation. It should change to SUCCESS after App
        # Runner completes validation with your DNS.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The record type, always CNAME .
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The certificate CNAME record value.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Describes the configuration that App Runner uses to build and run an App Runner service from a
      # source code repository.
      struct CodeConfiguration
        include JSON::Serializable

        # The source of the App Runner configuration. Values are interpreted as follows: REPOSITORY – App
        # Runner reads configuration values from the apprunner.yaml file in the source code repository and
        # ignores CodeConfigurationValues . API – App Runner uses configuration values provided in
        # CodeConfigurationValues and ignores the apprunner.yaml file in the source code repository.
        @[JSON::Field(key: "ConfigurationSource")]
        getter configuration_source : String

        # The basic configuration for building and running the App Runner service. Use it to quickly launch an
        # App Runner service without providing a apprunner.yaml file in the source code repository (or
        # ignoring the file if it exists).
        @[JSON::Field(key: "CodeConfigurationValues")]
        getter code_configuration_values : Types::CodeConfigurationValues?

        def initialize(
          @configuration_source : String,
          @code_configuration_values : Types::CodeConfigurationValues? = nil
        )
        end
      end

      # Describes the basic configuration needed for building and running an App Runner service. This type
      # doesn't support the full set of possible configuration options. Fur full configuration capabilities,
      # use a apprunner.yaml file in the source code repository.
      struct CodeConfigurationValues
        include JSON::Serializable

        # A runtime environment type for building and running an App Runner service. It represents a
        # programming language runtime.
        @[JSON::Field(key: "Runtime")]
        getter runtime : String

        # The command App Runner runs to build your application.
        @[JSON::Field(key: "BuildCommand")]
        getter build_command : String?

        # The port that your application listens to in the container. Default: 8080
        @[JSON::Field(key: "Port")]
        getter port : String?

        # An array of key-value pairs representing the secrets and parameters that get referenced to your
        # service as an environment variable. The supported values are either the full Amazon Resource Name
        # (ARN) of the Secrets Manager secret or the full ARN of the parameter in the Amazon Web Services
        # Systems Manager Parameter Store. If the Amazon Web Services Systems Manager Parameter Store
        # parameter exists in the same Amazon Web Services Region as the service that you're launching, you
        # can use either the full ARN or name of the secret. If the parameter exists in a different Region,
        # then the full ARN must be specified. Currently, cross account referencing of Amazon Web Services
        # Systems Manager Parameter Store parameter is not supported.
        @[JSON::Field(key: "RuntimeEnvironmentSecrets")]
        getter runtime_environment_secrets : Hash(String, String)?

        # The environment variables that are available to your running App Runner service. An array of
        # key-value pairs.
        @[JSON::Field(key: "RuntimeEnvironmentVariables")]
        getter runtime_environment_variables : Hash(String, String)?

        # The command App Runner runs to start your application.
        @[JSON::Field(key: "StartCommand")]
        getter start_command : String?

        def initialize(
          @runtime : String,
          @build_command : String? = nil,
          @port : String? = nil,
          @runtime_environment_secrets : Hash(String, String)? = nil,
          @runtime_environment_variables : Hash(String, String)? = nil,
          @start_command : String? = nil
        )
        end
      end

      # Describes a source code repository.
      struct CodeRepository
        include JSON::Serializable

        # The location of the repository that contains the source code.
        @[JSON::Field(key: "RepositoryUrl")]
        getter repository_url : String

        # The version that should be used within the source code repository.
        @[JSON::Field(key: "SourceCodeVersion")]
        getter source_code_version : Types::SourceCodeVersion

        # Configuration for building and running the service from a source code repository. CodeConfiguration
        # is required only for CreateService request.
        @[JSON::Field(key: "CodeConfiguration")]
        getter code_configuration : Types::CodeConfiguration?

        # The path of the directory that stores source code and configuration files. The build and start
        # commands also execute from here. The path is absolute from root and, if not specified, defaults to
        # the repository root.
        @[JSON::Field(key: "SourceDirectory")]
        getter source_directory : String?

        def initialize(
          @repository_url : String,
          @source_code_version : Types::SourceCodeVersion,
          @code_configuration : Types::CodeConfiguration? = nil,
          @source_directory : String? = nil
        )
        end
      end

      # Describes an App Runner connection resource.
      struct Connection
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this connection.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The customer-provided connection name.
        @[JSON::Field(key: "ConnectionName")]
        getter connection_name : String?

        # The App Runner connection creation time, expressed as a Unix time stamp.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The source repository provider.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The current state of the App Runner connection. When the state is AVAILABLE , you can use the
        # connection to create an App Runner service.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @connection_arn : String? = nil,
          @connection_name : String? = nil,
          @created_at : Time? = nil,
          @provider_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides summary information about an App Runner connection resource.
      struct ConnectionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this connection.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The customer-provided connection name.
        @[JSON::Field(key: "ConnectionName")]
        getter connection_name : String?

        # The App Runner connection creation time, expressed as a Unix time stamp.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The source repository provider.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The current state of the App Runner connection. When the state is AVAILABLE , you can use the
        # connection to create an App Runner service.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @connection_arn : String? = nil,
          @connection_name : String? = nil,
          @created_at : Time? = nil,
          @provider_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateAutoScalingConfigurationRequest
        include JSON::Serializable

        # A name for the auto scaling configuration. When you use it for the first time in an Amazon Web
        # Services Region, App Runner creates revision number 1 of this name. When you use the same name in
        # subsequent calls, App Runner creates incremental revisions of the configuration. Prior to the
        # release of Auto scale configuration enhancements , the name DefaultConfiguration was reserved. This
        # restriction is no longer in place. You can now manage DefaultConfiguration the same way you manage
        # your custom auto scaling configurations. This means you can do the following with the
        # DefaultConfiguration that App Runner provides: Create new revisions of the DefaultConfiguration .
        # Delete the revisions of the DefaultConfiguration . Delete the auto scaling configuration for which
        # the App Runner DefaultConfiguration was created. If you delete the auto scaling configuration you
        # can create another custom auto scaling configuration with the same DefaultConfiguration name. The
        # original DefaultConfiguration resource provided by App Runner remains in your account unless you
        # make changes to it.
        @[JSON::Field(key: "AutoScalingConfigurationName")]
        getter auto_scaling_configuration_name : String

        # The maximum number of concurrent requests that you want an instance to process. If the number of
        # concurrent requests exceeds this limit, App Runner scales up your service. Default: 100
        @[JSON::Field(key: "MaxConcurrency")]
        getter max_concurrency : Int32?

        # The maximum number of instances that your service scales up to. At most MaxSize instances actively
        # serve traffic for your service. Default: 25
        @[JSON::Field(key: "MaxSize")]
        getter max_size : Int32?

        # The minimum number of instances that App Runner provisions for your service. The service always has
        # at least MinSize provisioned instances. Some of them actively serve traffic. The rest of them
        # (provisioned and inactive instances) are a cost-effective compute capacity reserve and are ready to
        # be quickly activated. You pay for memory usage of all the provisioned instances. You pay for CPU
        # usage of only the active subset. App Runner temporarily doubles the number of provisioned instances
        # during deployments, to maintain the same capacity for both old and new code. Default: 1
        @[JSON::Field(key: "MinSize")]
        getter min_size : Int32?

        # A list of metadata items that you can associate with your auto scaling configuration resource. A tag
        # is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @auto_scaling_configuration_name : String,
          @max_concurrency : Int32? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAutoScalingConfigurationResponse
        include JSON::Serializable

        # A description of the App Runner auto scaling configuration that's created by this request.
        @[JSON::Field(key: "AutoScalingConfiguration")]
        getter auto_scaling_configuration : Types::AutoScalingConfiguration

        def initialize(
          @auto_scaling_configuration : Types::AutoScalingConfiguration
        )
        end
      end

      struct CreateConnectionRequest
        include JSON::Serializable

        # A name for the new connection. It must be unique across all App Runner connections for the Amazon
        # Web Services account in the Amazon Web Services Region.
        @[JSON::Field(key: "ConnectionName")]
        getter connection_name : String

        # The source repository provider.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String

        # A list of metadata items that you can associate with your connection resource. A tag is a key-value
        # pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connection_name : String,
          @provider_type : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateConnectionResponse
        include JSON::Serializable

        # A description of the App Runner connection that's created by this request.
        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection

        def initialize(
          @connection : Types::Connection
        )
        end
      end

      struct CreateObservabilityConfigurationRequest
        include JSON::Serializable

        # A name for the observability configuration. When you use it for the first time in an Amazon Web
        # Services Region, App Runner creates revision number 1 of this name. When you use the same name in
        # subsequent calls, App Runner creates incremental revisions of the configuration. The name
        # DefaultConfiguration is reserved. You can't use it to create a new observability configuration, and
        # you can't create a revision of it. When you want to use your own observability configuration for
        # your App Runner service, create a configuration with a different name , and then provide it when you
        # create or update your service.
        @[JSON::Field(key: "ObservabilityConfigurationName")]
        getter observability_configuration_name : String

        # A list of metadata items that you can associate with your observability configuration resource. A
        # tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The configuration of the tracing feature within this observability configuration. If you don't
        # specify it, App Runner doesn't enable tracing.
        @[JSON::Field(key: "TraceConfiguration")]
        getter trace_configuration : Types::TraceConfiguration?

        def initialize(
          @observability_configuration_name : String,
          @tags : Array(Types::Tag)? = nil,
          @trace_configuration : Types::TraceConfiguration? = nil
        )
        end
      end

      struct CreateObservabilityConfigurationResponse
        include JSON::Serializable

        # A description of the App Runner observability configuration that's created by this request.
        @[JSON::Field(key: "ObservabilityConfiguration")]
        getter observability_configuration : Types::ObservabilityConfiguration

        def initialize(
          @observability_configuration : Types::ObservabilityConfiguration
        )
        end
      end

      struct CreateServiceRequest
        include JSON::Serializable

        # A name for the App Runner service. It must be unique across all the running App Runner services in
        # your Amazon Web Services account in the Amazon Web Services Region.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The source to deploy to the App Runner service. It can be a code or an image repository.
        @[JSON::Field(key: "SourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration

        # The Amazon Resource Name (ARN) of an App Runner automatic scaling configuration resource that you
        # want to associate with your service. If not provided, App Runner associates the latest revision of a
        # default auto scaling configuration. Specify an ARN with a name and a revision number to associate
        # that revision. For example:
        # arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability/3 Specify just
        # the name to associate the latest revision. For example:
        # arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String?

        # An optional custom encryption key that App Runner uses to encrypt the copy of your source repository
        # that it maintains and your service logs. By default, App Runner uses an Amazon Web Services managed
        # key.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The settings for the health check that App Runner performs to monitor the health of the App Runner
        # service.
        @[JSON::Field(key: "HealthCheckConfiguration")]
        getter health_check_configuration : Types::HealthCheckConfiguration?

        # The runtime configuration of instances (scaling units) of your service.
        @[JSON::Field(key: "InstanceConfiguration")]
        getter instance_configuration : Types::InstanceConfiguration?

        # Configuration settings related to network traffic of the web application that the App Runner service
        # runs.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The observability configuration of your service.
        @[JSON::Field(key: "ObservabilityConfiguration")]
        getter observability_configuration : Types::ServiceObservabilityConfiguration?

        # An optional list of metadata items that you can associate with the App Runner service resource. A
        # tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @service_name : String,
          @source_configuration : Types::SourceConfiguration,
          @auto_scaling_configuration_arn : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @health_check_configuration : Types::HealthCheckConfiguration? = nil,
          @instance_configuration : Types::InstanceConfiguration? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @observability_configuration : Types::ServiceObservabilityConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateServiceResponse
        include JSON::Serializable

        # The unique ID of the asynchronous operation that this request started. You can use it combined with
        # the ListOperations call to track the operation's progress.
        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # A description of the App Runner service that's created by this request.
        @[JSON::Field(key: "Service")]
        getter service : Types::Service

        def initialize(
          @operation_id : String,
          @service : Types::Service
        )
        end
      end

      struct CreateVpcConnectorRequest
        include JSON::Serializable

        # A list of IDs of subnets that App Runner should use when it associates your service with a custom
        # Amazon VPC. Specify IDs of subnets of a single Amazon VPC. App Runner determines the Amazon VPC from
        # the subnets you specify. App Runner only supports subnets of IP address type IPv4 and dual stack
        # (IPv4 and IPv6).
        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        # A name for the VPC connector.
        @[JSON::Field(key: "VpcConnectorName")]
        getter vpc_connector_name : String

        # A list of IDs of security groups that App Runner should use for access to Amazon Web Services
        # resources under the specified subnets. If not specified, App Runner uses the default security group
        # of the Amazon VPC. The default security group allows all outbound traffic.
        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # A list of metadata items that you can associate with your VPC connector resource. A tag is a
        # key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @subnets : Array(String),
          @vpc_connector_name : String,
          @security_groups : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateVpcConnectorResponse
        include JSON::Serializable

        # A description of the App Runner VPC connector that's created by this request.
        @[JSON::Field(key: "VpcConnector")]
        getter vpc_connector : Types::VpcConnector

        def initialize(
          @vpc_connector : Types::VpcConnector
        )
        end
      end

      struct CreateVpcIngressConnectionRequest
        include JSON::Serializable

        # Specifications for the customer’s Amazon VPC and the related Amazon Web Services PrivateLink VPC
        # endpoint that are used to create the VPC Ingress Connection resource.
        @[JSON::Field(key: "IngressVpcConfiguration")]
        getter ingress_vpc_configuration : Types::IngressVpcConfiguration

        # The Amazon Resource Name (ARN) for this App Runner service that is used to create the VPC Ingress
        # Connection resource.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # A name for the VPC Ingress Connection resource. It must be unique across all the active VPC Ingress
        # Connections in your Amazon Web Services account in the Amazon Web Services Region.
        @[JSON::Field(key: "VpcIngressConnectionName")]
        getter vpc_ingress_connection_name : String

        # An optional list of metadata items that you can associate with the VPC Ingress Connection resource.
        # A tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @ingress_vpc_configuration : Types::IngressVpcConfiguration,
          @service_arn : String,
          @vpc_ingress_connection_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateVpcIngressConnectionResponse
        include JSON::Serializable

        # A description of the App Runner VPC Ingress Connection resource that's created by this request.
        @[JSON::Field(key: "VpcIngressConnection")]
        getter vpc_ingress_connection : Types::VpcIngressConnection

        def initialize(
          @vpc_ingress_connection : Types::VpcIngressConnection
        )
        end
      end

      # Describes a custom domain that's associated with an App Runner service.
      struct CustomDomain
        include JSON::Serializable

        # An associated custom domain endpoint. It can be a root domain (for example, example.com ), a
        # subdomain (for example, login.example.com or admin.login.example.com ), or a wildcard (for example,
        # *.example.com ).
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # When true , the subdomain www. DomainName is associated with the App Runner service in addition to
        # the base domain.
        @[JSON::Field(key: "EnableWWWSubdomain")]
        getter enable_www_subdomain : Bool

        # The current state of the domain name association.
        @[JSON::Field(key: "Status")]
        getter status : String

        # A list of certificate CNAME records that's used for this domain name.
        @[JSON::Field(key: "CertificateValidationRecords")]
        getter certificate_validation_records : Array(Types::CertificateValidationRecord)?

        def initialize(
          @domain_name : String,
          @enable_www_subdomain : Bool,
          @status : String,
          @certificate_validation_records : Array(Types::CertificateValidationRecord)? = nil
        )
        end
      end

      struct DeleteAutoScalingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want to delete.
        # The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with either .../ name
        # or .../ name / revision . If a revision isn't specified, the latest active revision is deleted.
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String

        # Set to true to delete all of the revisions associated with the AutoScalingConfigurationArn parameter
        # value. When DeleteAllRevisions is set to true , the only valid value for the Amazon Resource Name
        # (ARN) is a partial ARN ending with: .../name .
        @[JSON::Field(key: "DeleteAllRevisions")]
        getter delete_all_revisions : Bool?

        def initialize(
          @auto_scaling_configuration_arn : String,
          @delete_all_revisions : Bool? = nil
        )
        end
      end

      struct DeleteAutoScalingConfigurationResponse
        include JSON::Serializable

        # A description of the App Runner auto scaling configuration that this request just deleted.
        @[JSON::Field(key: "AutoScalingConfiguration")]
        getter auto_scaling_configuration : Types::AutoScalingConfiguration

        def initialize(
          @auto_scaling_configuration : Types::AutoScalingConfiguration
        )
        end
      end

      struct DeleteConnectionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner connection that you want to delete.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        def initialize(
          @connection_arn : String
        )
        end
      end

      struct DeleteConnectionResponse
        include JSON::Serializable

        # A description of the App Runner connection that this request just deleted.
        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection?

        def initialize(
          @connection : Types::Connection? = nil
        )
        end
      end

      struct DeleteObservabilityConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner observability configuration that you want to
        # delete. The ARN can be a full observability configuration ARN, or a partial ARN ending with either
        # .../ name or .../ name / revision . If a revision isn't specified, the latest active revision is
        # deleted.
        @[JSON::Field(key: "ObservabilityConfigurationArn")]
        getter observability_configuration_arn : String

        def initialize(
          @observability_configuration_arn : String
        )
        end
      end

      struct DeleteObservabilityConfigurationResponse
        include JSON::Serializable

        # A description of the App Runner observability configuration that this request just deleted.
        @[JSON::Field(key: "ObservabilityConfiguration")]
        getter observability_configuration : Types::ObservabilityConfiguration

        def initialize(
          @observability_configuration : Types::ObservabilityConfiguration
        )
        end
      end

      struct DeleteServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want to delete.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        def initialize(
          @service_arn : String
        )
        end
      end

      struct DeleteServiceResponse
        include JSON::Serializable

        # The unique ID of the asynchronous operation that this request started. You can use it combined with
        # the ListOperations call to track the operation's progress.
        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # A description of the App Runner service that this request just deleted.
        @[JSON::Field(key: "Service")]
        getter service : Types::Service

        def initialize(
          @operation_id : String,
          @service : Types::Service
        )
        end
      end

      struct DeleteVpcConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner VPC connector that you want to delete. The ARN must
        # be a full VPC connector ARN.
        @[JSON::Field(key: "VpcConnectorArn")]
        getter vpc_connector_arn : String

        def initialize(
          @vpc_connector_arn : String
        )
        end
      end

      struct DeleteVpcConnectorResponse
        include JSON::Serializable

        # A description of the App Runner VPC connector that this request just deleted.
        @[JSON::Field(key: "VpcConnector")]
        getter vpc_connector : Types::VpcConnector

        def initialize(
          @vpc_connector : Types::VpcConnector
        )
        end
      end

      struct DeleteVpcIngressConnectionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection that you want to delete.
        @[JSON::Field(key: "VpcIngressConnectionArn")]
        getter vpc_ingress_connection_arn : String

        def initialize(
          @vpc_ingress_connection_arn : String
        )
        end
      end

      struct DeleteVpcIngressConnectionResponse
        include JSON::Serializable

        # A description of the App Runner VPC Ingress Connection that this request just deleted.
        @[JSON::Field(key: "VpcIngressConnection")]
        getter vpc_ingress_connection : Types::VpcIngressConnection

        def initialize(
          @vpc_ingress_connection : Types::VpcIngressConnection
        )
        end
      end

      struct DescribeAutoScalingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want a
        # description for. The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with
        # either .../ name or .../ name / revision . If a revision isn't specified, the latest active revision
        # is described.
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String

        def initialize(
          @auto_scaling_configuration_arn : String
        )
        end
      end

      struct DescribeAutoScalingConfigurationResponse
        include JSON::Serializable

        # A full description of the App Runner auto scaling configuration that you specified in this request.
        @[JSON::Field(key: "AutoScalingConfiguration")]
        getter auto_scaling_configuration : Types::AutoScalingConfiguration

        def initialize(
          @auto_scaling_configuration : Types::AutoScalingConfiguration
        )
        end
      end

      struct DescribeCustomDomainsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want associated custom domain
        # names to be described for.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # The maximum number of results that each response (result page) can include. It's used for a
        # paginated request. If you don't specify MaxResults , the request retrieves all available results in
        # a single response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. It's used for a paginated request. The request retrieves the
        # next result page. All other parameter values must be identical to the ones that are specified in the
        # initial request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeCustomDomainsResponse
        include JSON::Serializable

        # A list of descriptions of custom domain names that are associated with the service. In a paginated
        # request, the request returns up to MaxResults records per call.
        @[JSON::Field(key: "CustomDomains")]
        getter custom_domains : Array(Types::CustomDomain)

        # The App Runner subdomain of the App Runner service. The associated custom domain names are mapped to
        # this target name.
        @[JSON::Field(key: "DNSTarget")]
        getter dns_target : String

        # The Amazon Resource Name (ARN) of the App Runner service whose associated custom domain names you
        # want to describe.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # DNS Target records for the custom domains of this Amazon VPC.
        @[JSON::Field(key: "VpcDNSTargets")]
        getter vpc_dns_targets : Array(Types::VpcDNSTarget)

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @custom_domains : Array(Types::CustomDomain),
          @dns_target : String,
          @service_arn : String,
          @vpc_dns_targets : Array(Types::VpcDNSTarget),
          @next_token : String? = nil
        )
        end
      end

      struct DescribeObservabilityConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner observability configuration that you want a
        # description for. The ARN can be a full observability configuration ARN, or a partial ARN ending with
        # either .../ name or .../ name / revision . If a revision isn't specified, the latest active revision
        # is described.
        @[JSON::Field(key: "ObservabilityConfigurationArn")]
        getter observability_configuration_arn : String

        def initialize(
          @observability_configuration_arn : String
        )
        end
      end

      struct DescribeObservabilityConfigurationResponse
        include JSON::Serializable

        # A full description of the App Runner observability configuration that you specified in this request.
        @[JSON::Field(key: "ObservabilityConfiguration")]
        getter observability_configuration : Types::ObservabilityConfiguration

        def initialize(
          @observability_configuration : Types::ObservabilityConfiguration
        )
        end
      end

      struct DescribeServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want a description for.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        def initialize(
          @service_arn : String
        )
        end
      end

      struct DescribeServiceResponse
        include JSON::Serializable

        # A full description of the App Runner service that you specified in this request.
        @[JSON::Field(key: "Service")]
        getter service : Types::Service

        def initialize(
          @service : Types::Service
        )
        end
      end

      struct DescribeVpcConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner VPC connector that you want a description for. The
        # ARN must be a full VPC connector ARN.
        @[JSON::Field(key: "VpcConnectorArn")]
        getter vpc_connector_arn : String

        def initialize(
          @vpc_connector_arn : String
        )
        end
      end

      struct DescribeVpcConnectorResponse
        include JSON::Serializable

        # A description of the App Runner VPC connector that you specified in this request.
        @[JSON::Field(key: "VpcConnector")]
        getter vpc_connector : Types::VpcConnector

        def initialize(
          @vpc_connector : Types::VpcConnector
        )
        end
      end

      struct DescribeVpcIngressConnectionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection that you want a description
        # for.
        @[JSON::Field(key: "VpcIngressConnectionArn")]
        getter vpc_ingress_connection_arn : String

        def initialize(
          @vpc_ingress_connection_arn : String
        )
        end
      end

      struct DescribeVpcIngressConnectionResponse
        include JSON::Serializable

        # A description of the App Runner VPC Ingress Connection that you specified in this request.
        @[JSON::Field(key: "VpcIngressConnection")]
        getter vpc_ingress_connection : Types::VpcIngressConnection

        def initialize(
          @vpc_ingress_connection : Types::VpcIngressConnection
        )
        end
      end

      struct DisassociateCustomDomainRequest
        include JSON::Serializable

        # The domain name that you want to disassociate from the App Runner service.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Amazon Resource Name (ARN) of the App Runner service that you want to disassociate a custom
        # domain name from.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        def initialize(
          @domain_name : String,
          @service_arn : String
        )
        end
      end

      struct DisassociateCustomDomainResponse
        include JSON::Serializable

        # A description of the domain name that's being disassociated.
        @[JSON::Field(key: "CustomDomain")]
        getter custom_domain : Types::CustomDomain

        # The App Runner subdomain of the App Runner service. The disassociated custom domain name was mapped
        # to this target name.
        @[JSON::Field(key: "DNSTarget")]
        getter dns_target : String

        # The Amazon Resource Name (ARN) of the App Runner service that a custom domain name is disassociated
        # from.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # DNS Target records for the custom domains of this Amazon VPC.
        @[JSON::Field(key: "VpcDNSTargets")]
        getter vpc_dns_targets : Array(Types::VpcDNSTarget)

        def initialize(
          @custom_domain : Types::CustomDomain,
          @dns_target : String,
          @service_arn : String,
          @vpc_dns_targets : Array(Types::VpcDNSTarget)
        )
        end
      end

      # Describes configuration settings related to outbound network traffic of an App Runner service.
      struct EgressConfiguration
        include JSON::Serializable

        # The type of egress configuration. Set to DEFAULT for access to resources hosted on public networks.
        # Set to VPC to associate your service to a custom VPC specified by VpcConnectorArn .
        @[JSON::Field(key: "EgressType")]
        getter egress_type : String?

        # The Amazon Resource Name (ARN) of the App Runner VPC connector that you want to associate with your
        # App Runner service. Only valid when EgressType = VPC .
        @[JSON::Field(key: "VpcConnectorArn")]
        getter vpc_connector_arn : String?

        def initialize(
          @egress_type : String? = nil,
          @vpc_connector_arn : String? = nil
        )
        end
      end

      # Describes a custom encryption key that App Runner uses to encrypt copies of the source repository
      # and service logs.
      struct EncryptionConfiguration
        include JSON::Serializable

        # The ARN of the KMS key that's used for encryption.
        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String

        def initialize(
          @kms_key : String
        )
        end
      end

      # Describes the settings for the health check that App Runner performs to monitor the health of a
      # service.
      struct HealthCheckConfiguration
        include JSON::Serializable

        # The number of consecutive checks that must succeed before App Runner decides that the service is
        # healthy. Default: 1
        @[JSON::Field(key: "HealthyThreshold")]
        getter healthy_threshold : Int32?

        # The time interval, in seconds, between health checks. Default: 5
        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The URL that health check requests are sent to. Path is only applicable when you set Protocol to
        # HTTP . Default: "/"
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The IP protocol that App Runner uses to perform health checks for your service. If you set Protocol
        # to HTTP , App Runner sends health check requests to the HTTP path specified by Path . Default: TCP
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The time, in seconds, to wait for a health check response before deciding it failed. Default: 2
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # The number of consecutive checks that must fail before App Runner decides that the service is
        # unhealthy. Default: 5
        @[JSON::Field(key: "UnhealthyThreshold")]
        getter unhealthy_threshold : Int32?

        def initialize(
          @healthy_threshold : Int32? = nil,
          @interval : Int32? = nil,
          @path : String? = nil,
          @protocol : String? = nil,
          @timeout : Int32? = nil,
          @unhealthy_threshold : Int32? = nil
        )
        end
      end

      # Describes the configuration that App Runner uses to run an App Runner service using an image pulled
      # from a source image repository.
      struct ImageConfiguration
        include JSON::Serializable

        # The port that your application listens to in the container. Default: 8080
        @[JSON::Field(key: "Port")]
        getter port : String?

        # An array of key-value pairs representing the secrets and parameters that get referenced to your
        # service as an environment variable. The supported values are either the full Amazon Resource Name
        # (ARN) of the Secrets Manager secret or the full ARN of the parameter in the Amazon Web Services
        # Systems Manager Parameter Store. If the Amazon Web Services Systems Manager Parameter Store
        # parameter exists in the same Amazon Web Services Region as the service that you're launching, you
        # can use either the full ARN or name of the secret. If the parameter exists in a different Region,
        # then the full ARN must be specified. Currently, cross account referencing of Amazon Web Services
        # Systems Manager Parameter Store parameter is not supported.
        @[JSON::Field(key: "RuntimeEnvironmentSecrets")]
        getter runtime_environment_secrets : Hash(String, String)?

        # Environment variables that are available to your running App Runner service. An array of key-value
        # pairs.
        @[JSON::Field(key: "RuntimeEnvironmentVariables")]
        getter runtime_environment_variables : Hash(String, String)?

        # An optional command that App Runner runs to start the application in the source image. If specified,
        # this command overrides the Docker image’s default start command.
        @[JSON::Field(key: "StartCommand")]
        getter start_command : String?

        def initialize(
          @port : String? = nil,
          @runtime_environment_secrets : Hash(String, String)? = nil,
          @runtime_environment_variables : Hash(String, String)? = nil,
          @start_command : String? = nil
        )
        end
      end

      # Describes a source image repository.
      struct ImageRepository
        include JSON::Serializable

        # The identifier of an image. For an image in Amazon Elastic Container Registry (Amazon ECR), this is
        # an image name. For the image name format, see Pulling an image in the Amazon ECR User Guide .
        @[JSON::Field(key: "ImageIdentifier")]
        getter image_identifier : String

        # The type of the image repository. This reflects the repository provider and whether the repository
        # is private or public.
        @[JSON::Field(key: "ImageRepositoryType")]
        getter image_repository_type : String

        # Configuration for running the identified image.
        @[JSON::Field(key: "ImageConfiguration")]
        getter image_configuration : Types::ImageConfiguration?

        def initialize(
          @image_identifier : String,
          @image_repository_type : String,
          @image_configuration : Types::ImageConfiguration? = nil
        )
        end
      end

      # Network configuration settings for inbound network traffic.
      struct IngressConfiguration
        include JSON::Serializable

        # Specifies whether your App Runner service is publicly accessible. To make the service publicly
        # accessible set it to True . To make the service privately accessible, from only within an Amazon VPC
        # set it to False .
        @[JSON::Field(key: "IsPubliclyAccessible")]
        getter is_publicly_accessible : Bool?

        def initialize(
          @is_publicly_accessible : Bool? = nil
        )
        end
      end

      # The configuration of your VPC and the associated VPC endpoint. The VPC endpoint is an Amazon Web
      # Services PrivateLink resource that allows access to your App Runner services from within an Amazon
      # VPC.
      struct IngressVpcConfiguration
        include JSON::Serializable

        # The ID of the VPC endpoint that your App Runner service connects to.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The ID of the VPC that is used for the VPC endpoint.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @vpc_endpoint_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Describes the runtime configuration of an App Runner service instance (scaling unit).
      struct InstanceConfiguration
        include JSON::Serializable

        # The number of CPU units reserved for each instance of your App Runner service. Default: 1 vCPU
        @[JSON::Field(key: "Cpu")]
        getter cpu : String?

        # The Amazon Resource Name (ARN) of an IAM role that provides permissions to your App Runner service.
        # These are permissions that your code needs when it calls any Amazon Web Services APIs.
        @[JSON::Field(key: "InstanceRoleArn")]
        getter instance_role_arn : String?

        # The amount of memory, in MB or GB, reserved for each instance of your App Runner service. Default: 2
        # GB
        @[JSON::Field(key: "Memory")]
        getter memory : String?

        def initialize(
          @cpu : String? = nil,
          @instance_role_arn : String? = nil,
          @memory : String? = nil
        )
        end
      end

      # An unexpected service exception occurred.
      struct InternalServiceErrorException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more input parameters aren't valid. Refer to the API action's document page, correct the
      # input parameters, and try the action again.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can't perform this action when the resource is in its current state.
      struct InvalidStateException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAutoScalingConfigurationsRequest
        include JSON::Serializable

        # The name of the App Runner auto scaling configuration that you want to list. If specified, App
        # Runner lists revisions that share this name. If not specified, App Runner returns revisions of all
        # active configurations.
        @[JSON::Field(key: "AutoScalingConfigurationName")]
        getter auto_scaling_configuration_name : String?

        # Set to true to list only the latest revision for each requested configuration name. Set to false to
        # list all revisions for each requested configuration name. Default: true
        @[JSON::Field(key: "LatestOnly")]
        getter latest_only : Bool?

        # The maximum number of results to include in each response (result page). It's used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. It's used for a paginated request. The request retrieves the
        # next result page. All other parameter values must be identical to the ones that are specified in the
        # initial request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_configuration_name : String? = nil,
          @latest_only : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAutoScalingConfigurationsResponse
        include JSON::Serializable

        # A list of summary information records for auto scaling configurations. In a paginated request, the
        # request returns up to MaxResults records for each call.
        @[JSON::Field(key: "AutoScalingConfigurationSummaryList")]
        getter auto_scaling_configuration_summary_list : Array(Types::AutoScalingConfigurationSummary)

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_configuration_summary_list : Array(Types::AutoScalingConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectionsRequest
        include JSON::Serializable

        # If specified, only this connection is returned. If not specified, the result isn't filtered by name.
        @[JSON::Field(key: "ConnectionName")]
        getter connection_name : String?

        # The maximum number of results to include in each response (result page). Used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. Used for a paginated request. The request retrieves the next
        # result page. All other parameter values must be identical to the ones specified in the initial
        # request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connection_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectionsResponse
        include JSON::Serializable

        # A list of summary information records for connections. In a paginated request, the request returns
        # up to MaxResults records for each call.
        @[JSON::Field(key: "ConnectionSummaryList")]
        getter connection_summary_list : Array(Types::ConnectionSummary)

        # The token that you can pass in a subsequent request to get the next result page. Returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connection_summary_list : Array(Types::ConnectionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListObservabilityConfigurationsRequest
        include JSON::Serializable

        # Set to true to list only the latest revision for each requested configuration name. Set to false to
        # list all revisions for each requested configuration name. Default: true
        @[JSON::Field(key: "LatestOnly")]
        getter latest_only : Bool?

        # The maximum number of results to include in each response (result page). It's used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. It's used for a paginated request. The request retrieves the
        # next result page. All other parameter values must be identical to the ones that are specified in the
        # initial request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the App Runner observability configuration that you want to list. If specified, App
        # Runner lists revisions that share this name. If not specified, App Runner returns revisions of all
        # active configurations.
        @[JSON::Field(key: "ObservabilityConfigurationName")]
        getter observability_configuration_name : String?

        def initialize(
          @latest_only : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @observability_configuration_name : String? = nil
        )
        end
      end

      struct ListObservabilityConfigurationsResponse
        include JSON::Serializable

        # A list of summary information records for observability configurations. In a paginated request, the
        # request returns up to MaxResults records for each call.
        @[JSON::Field(key: "ObservabilityConfigurationSummaryList")]
        getter observability_configuration_summary_list : Array(Types::ObservabilityConfigurationSummary)

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @observability_configuration_summary_list : Array(Types::ObservabilityConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListOperationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want a list of operations for.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # The maximum number of results to include in each response (result page). It's used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. It's used for a paginated request. The request retrieves the
        # next result page. All other parameter values must be identical to the ones specified in the initial
        # request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOperationsResponse
        include JSON::Serializable

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of operation summary information records. In a paginated request, the request returns up to
        # MaxResults records for each call.
        @[JSON::Field(key: "OperationSummaryList")]
        getter operation_summary_list : Array(Types::OperationSummary)?

        def initialize(
          @next_token : String? = nil,
          @operation_summary_list : Array(Types::OperationSummary)? = nil
        )
        end
      end

      struct ListServicesForAutoScalingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want to list
        # the services for. The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with
        # either .../ name or .../ name / revision . If a revision isn't specified, the latest active revision
        # is used.
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String

        # The maximum number of results to include in each response (result page). It's used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. It's used for a paginated request. The request retrieves the
        # next result page. All other parameter values must be identical to the ones specified in the initial
        # request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @auto_scaling_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesForAutoScalingConfigurationResponse
        include JSON::Serializable

        # A list of service ARN records. In a paginated request, the request returns up to MaxResults records
        # for each call.
        @[JSON::Field(key: "ServiceArnList")]
        getter service_arn_list : Array(String)

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_arn_list : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesRequest
        include JSON::Serializable

        # The maximum number of results to include in each response (result page). It's used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. Used for a paginated request. The request retrieves the next
        # result page. All other parameter values must be identical to the ones specified in the initial
        # request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesResponse
        include JSON::Serializable

        # A list of service summary information records. In a paginated request, the request returns up to
        # MaxResults records for each call.
        @[JSON::Field(key: "ServiceSummaryList")]
        getter service_summary_list : Array(Types::ServiceSummary)

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_summary_list : Array(Types::ServiceSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that a tag list is requested for. It must be the ARN
        # of an App Runner resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of the tag key-value pairs that are associated with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListVpcConnectorsRequest
        include JSON::Serializable

        # The maximum number of results to include in each response (result page). It's used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. It's used for a paginated request. The request retrieves the
        # next result page. All other parameter values must be identical to the ones that are specified in the
        # initial request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListVpcConnectorsResponse
        include JSON::Serializable

        # A list of information records for VPC connectors. In a paginated request, the request returns up to
        # MaxResults records for each call.
        @[JSON::Field(key: "VpcConnectors")]
        getter vpc_connectors : Array(Types::VpcConnector)

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @vpc_connectors : Array(Types::VpcConnector),
          @next_token : String? = nil
        )
        end
      end

      # Returns a list of VPC Ingress Connections based on the filter provided. It can return either
      # ServiceArn or VpcEndpointId , or both.
      struct ListVpcIngressConnectionsFilter
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a service to filter by.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String?

        # The ID of a VPC Endpoint to filter by.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @service_arn : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      struct ListVpcIngressConnectionsRequest
        include JSON::Serializable

        # The VPC Ingress Connections to be listed based on either the Service Arn or Vpc Endpoint Id, or
        # both.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::ListVpcIngressConnectionsFilter?

        # The maximum number of results to include in each response (result page). It's used for a paginated
        # request. If you don't specify MaxResults , the request retrieves all available results in a single
        # response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token from a previous result page. It's used for a paginated request. The request retrieves the
        # next result page. All other parameter values must be identical to the ones that are specified in the
        # initial request. If you don't specify NextToken , the request retrieves the first result page.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ListVpcIngressConnectionsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListVpcIngressConnectionsResponse
        include JSON::Serializable

        # A list of summary information records for VPC Ingress Connections. In a paginated request, the
        # request returns up to MaxResults records for each call.
        @[JSON::Field(key: "VpcIngressConnectionSummaryList")]
        getter vpc_ingress_connection_summary_list : Array(Types::VpcIngressConnectionSummary)

        # The token that you can pass in a subsequent request to get the next result page. It's returned in a
        # paginated request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @vpc_ingress_connection_summary_list : Array(Types::VpcIngressConnectionSummary),
          @next_token : String? = nil
        )
        end
      end

      # Describes configuration settings related to network traffic of an App Runner service. Consists of
      # embedded objects for each configurable network feature.
      struct NetworkConfiguration
        include JSON::Serializable

        # Network configuration settings for outbound message traffic.
        @[JSON::Field(key: "EgressConfiguration")]
        getter egress_configuration : Types::EgressConfiguration?

        # Network configuration settings for inbound message traffic.
        @[JSON::Field(key: "IngressConfiguration")]
        getter ingress_configuration : Types::IngressConfiguration?

        # App Runner provides you with the option to choose between IPv4 and dual stack (IPv4 and IPv6). This
        # is an optional parameter. If you do not specify an IpAddressType , it defaults to select IPv4.
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        def initialize(
          @egress_configuration : Types::EgressConfiguration? = nil,
          @ingress_configuration : Types::IngressConfiguration? = nil,
          @ip_address_type : String? = nil
        )
        end
      end

      # Describes an App Runner observability configuration resource. Multiple revisions of a configuration
      # have the same ObservabilityConfigurationName and different ObservabilityConfigurationRevision
      # values. The resource is designed to configure multiple features (currently one feature, tracing).
      # This type contains optional members that describe the configuration of these features (currently one
      # member, TraceConfiguration ). If a feature member isn't specified, the feature isn't enabled.
      struct ObservabilityConfiguration
        include JSON::Serializable

        # The time when the observability configuration was created. It's in Unix time stamp format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The time when the observability configuration was deleted. It's in Unix time stamp format.
        @[JSON::Field(key: "DeletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deleted_at : Time?

        # It's set to true for the configuration with the highest Revision among all configurations that share
        # the same ObservabilityConfigurationName . It's set to false otherwise.
        @[JSON::Field(key: "Latest")]
        getter latest : Bool?

        # The Amazon Resource Name (ARN) of this observability configuration.
        @[JSON::Field(key: "ObservabilityConfigurationArn")]
        getter observability_configuration_arn : String?

        # The customer-provided observability configuration name. It can be used in multiple revisions of a
        # configuration.
        @[JSON::Field(key: "ObservabilityConfigurationName")]
        getter observability_configuration_name : String?

        # The revision of this observability configuration. It's unique among all the active configurations (
        # "Status": "ACTIVE" ) that share the same ObservabilityConfigurationName .
        @[JSON::Field(key: "ObservabilityConfigurationRevision")]
        getter observability_configuration_revision : Int32?

        # The current state of the observability configuration. If the status of a configuration revision is
        # INACTIVE , it was deleted and can't be used. Inactive configuration revisions are permanently
        # removed some time after they are deleted.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The configuration of the tracing feature within this observability configuration. If not specified,
        # tracing isn't enabled.
        @[JSON::Field(key: "TraceConfiguration")]
        getter trace_configuration : Types::TraceConfiguration?

        def initialize(
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @latest : Bool? = nil,
          @observability_configuration_arn : String? = nil,
          @observability_configuration_name : String? = nil,
          @observability_configuration_revision : Int32? = nil,
          @status : String? = nil,
          @trace_configuration : Types::TraceConfiguration? = nil
        )
        end
      end

      # Provides summary information about an App Runner observability configuration resource. This type
      # contains limited information about an observability configuration. It includes only identification
      # information, without configuration details. It's returned by the ListObservabilityConfigurations
      # action. Complete configuration information is returned by the CreateObservabilityConfiguration ,
      # DescribeObservabilityConfiguration , and DeleteObservabilityConfiguration actions using the
      # ObservabilityConfiguration type.
      struct ObservabilityConfigurationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this observability configuration.
        @[JSON::Field(key: "ObservabilityConfigurationArn")]
        getter observability_configuration_arn : String?

        # The customer-provided observability configuration name. It can be used in multiple revisions of a
        # configuration.
        @[JSON::Field(key: "ObservabilityConfigurationName")]
        getter observability_configuration_name : String?

        # The revision of this observability configuration. It's unique among all the active configurations (
        # "Status": "ACTIVE" ) that share the same ObservabilityConfigurationName .
        @[JSON::Field(key: "ObservabilityConfigurationRevision")]
        getter observability_configuration_revision : Int32?

        def initialize(
          @observability_configuration_arn : String? = nil,
          @observability_configuration_name : String? = nil,
          @observability_configuration_revision : Int32? = nil
        )
        end
      end

      # Provides summary information for an operation that occurred on an App Runner service.
      struct OperationSummary
        include JSON::Serializable

        # The time when the operation ended. It's in the Unix time stamp format.
        @[JSON::Field(key: "EndedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # A unique ID of this operation. It's unique in the scope of the App Runner service.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The time when the operation started. It's in the Unix time stamp format.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The current state of the operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the resource that the operation acted on (for example, an App
        # Runner service).
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String?

        # The type of operation. It indicates a specific action that occured.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The time when the operation was last updated. It's in the Unix time stamp format.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @ended_at : Time? = nil,
          @id : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @target_arn : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct PauseServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want to pause.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        def initialize(
          @service_arn : String
        )
        end
      end

      struct PauseServiceResponse
        include JSON::Serializable

        # A description of the App Runner service that this request just paused.
        @[JSON::Field(key: "Service")]
        getter service : Types::Service

        # The unique ID of the asynchronous operation that this request started. You can use it combined with
        # the ListOperations call to track the operation's progress.
        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @service : Types::Service,
          @operation_id : String? = nil
        )
        end
      end

      # A resource doesn't exist for the specified Amazon Resource Name (ARN) in your Amazon Web Services
      # account.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ResumeServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want to resume.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        def initialize(
          @service_arn : String
        )
        end
      end

      struct ResumeServiceResponse
        include JSON::Serializable

        # A description of the App Runner service that this request just resumed.
        @[JSON::Field(key: "Service")]
        getter service : Types::Service

        # The unique ID of the asynchronous operation that this request started. You can use it combined with
        # the ListOperations call to track the operation's progress.
        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @service : Types::Service,
          @operation_id : String? = nil
        )
        end
      end

      # Describes an App Runner service. It can describe a service in any state, including deleted services.
      # This type contains the full information about a service, including configuration details. It's
      # returned by the CreateService , DescribeService , and DeleteService actions. A subset of this
      # information is returned by the ListServices action using the ServiceSummary type.
      struct Service
        include JSON::Serializable

        # Summary information for the App Runner automatic scaling configuration resource that's associated
        # with this service.
        @[JSON::Field(key: "AutoScalingConfigurationSummary")]
        getter auto_scaling_configuration_summary : Types::AutoScalingConfigurationSummary

        # The time when the App Runner service was created. It's in the Unix time stamp format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The runtime configuration of instances (scaling units) of this service.
        @[JSON::Field(key: "InstanceConfiguration")]
        getter instance_configuration : Types::InstanceConfiguration

        # Configuration settings related to network traffic of the web application that this service runs.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration

        # The Amazon Resource Name (ARN) of this service.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # An ID that App Runner generated for this service. It's unique within the Amazon Web Services Region.
        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        # The customer-provided service name.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The source deployed to the App Runner service. It can be a code or an image repository.
        @[JSON::Field(key: "SourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration

        # The current state of the App Runner service. These particular values mean the following.
        # CREATE_FAILED – The service failed to create. The failed service isn't usable, and still counts
        # towards your service quota. To troubleshoot this failure, read the failure events and logs, change
        # any parameters that need to be fixed, and rebuild your service using UpdateService . DELETE_FAILED –
        # The service failed to delete and can't be successfully recovered. Retry the service deletion call to
        # ensure that all related resources are removed.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The time when the App Runner service was last updated at. It's in the Unix time stamp format.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The time when the App Runner service was deleted. It's in the Unix time stamp format.
        @[JSON::Field(key: "DeletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deleted_at : Time?

        # The encryption key that App Runner uses to encrypt the service logs and the copy of the source
        # repository that App Runner maintains for the service. It can be either a customer-provided
        # encryption key or an Amazon Web Services managed key.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The settings for the health check that App Runner performs to monitor the health of this service.
        @[JSON::Field(key: "HealthCheckConfiguration")]
        getter health_check_configuration : Types::HealthCheckConfiguration?

        # The observability configuration of this service.
        @[JSON::Field(key: "ObservabilityConfiguration")]
        getter observability_configuration : Types::ServiceObservabilityConfiguration?

        # A subdomain URL that App Runner generated for this service. You can use this URL to access your
        # service web application.
        @[JSON::Field(key: "ServiceUrl")]
        getter service_url : String?

        def initialize(
          @auto_scaling_configuration_summary : Types::AutoScalingConfigurationSummary,
          @created_at : Time,
          @instance_configuration : Types::InstanceConfiguration,
          @network_configuration : Types::NetworkConfiguration,
          @service_arn : String,
          @service_id : String,
          @service_name : String,
          @source_configuration : Types::SourceConfiguration,
          @status : String,
          @updated_at : Time,
          @deleted_at : Time? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @health_check_configuration : Types::HealthCheckConfiguration? = nil,
          @observability_configuration : Types::ServiceObservabilityConfiguration? = nil,
          @service_url : String? = nil
        )
        end
      end

      # Describes the observability configuration of an App Runner service. These are additional
      # observability features, like tracing, that you choose to enable. They're configured in a separate
      # resource that you associate with your service.
      struct ServiceObservabilityConfiguration
        include JSON::Serializable

        # When true , an observability configuration resource is associated with the service, and an
        # ObservabilityConfigurationArn is specified.
        @[JSON::Field(key: "ObservabilityEnabled")]
        getter observability_enabled : Bool

        # The Amazon Resource Name (ARN) of the observability configuration that is associated with the
        # service. Specified only when ObservabilityEnabled is true . Specify an ARN with a name and a
        # revision number to associate that revision. For example:
        # arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing/3 Specify just the
        # name to associate the latest revision. For example:
        # arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing
        @[JSON::Field(key: "ObservabilityConfigurationArn")]
        getter observability_configuration_arn : String?

        def initialize(
          @observability_enabled : Bool,
          @observability_configuration_arn : String? = nil
        )
        end
      end

      # App Runner can't create this resource. You've reached your account quota for this resource type. For
      # App Runner per-resource quotas, see App Runner endpoints and quotas in the Amazon Web Services
      # General Reference .
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides summary information for an App Runner service. This type contains limited information about
      # a service. It doesn't include configuration details. It's returned by the ListServices action.
      # Complete service information is returned by the CreateService , DescribeService , and DeleteService
      # actions using the Service type.
      struct ServiceSummary
        include JSON::Serializable

        # The time when the App Runner service was created. It's in the Unix time stamp format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of this service.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String?

        # An ID that App Runner generated for this service. It's unique within the Amazon Web Services Region.
        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The customer-provided service name.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # A subdomain URL that App Runner generated for this service. You can use this URL to access your
        # service web application.
        @[JSON::Field(key: "ServiceUrl")]
        getter service_url : String?

        # The current state of the App Runner service. These particular values mean the following.
        # CREATE_FAILED – The service failed to create. The failed service isn't usable, and still counts
        # towards your service quota. To troubleshoot this failure, read the failure events and logs, change
        # any parameters that need to be fixed, and rebuild your service using UpdateService . DELETE_FAILED –
        # The service failed to delete and can't be successfully recovered. Retry the service deletion call to
        # ensure that all related resources are removed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time when the App Runner service was last updated. It's in theUnix time stamp format.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @service_arn : String? = nil,
          @service_id : String? = nil,
          @service_name : String? = nil,
          @service_url : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Identifies a version of code that App Runner refers to within a source code repository.
      struct SourceCodeVersion
        include JSON::Serializable

        # The type of version identifier. For a git-based repository, branches represent versions.
        @[JSON::Field(key: "Type")]
        getter type : String

        # A source code version. For a git-based repository, a branch name maps to a specific version. App
        # Runner uses the most recent commit to the branch.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # Describes the source deployed to an App Runner service. It can be a code or an image repository.
      struct SourceConfiguration
        include JSON::Serializable

        # Describes the resources that are needed to authenticate access to some source repositories.
        @[JSON::Field(key: "AuthenticationConfiguration")]
        getter authentication_configuration : Types::AuthenticationConfiguration?

        # If true , continuous integration from the source repository is enabled for the App Runner service.
        # Each repository change (including any source code commit or new image version) starts a deployment.
        # Default: App Runner sets to false for a source image that uses an ECR Public repository or an ECR
        # repository that's in an Amazon Web Services account other than the one that the service is in. App
        # Runner sets to true in all other cases (which currently include a source code repository or a source
        # image using a same-account ECR repository).
        @[JSON::Field(key: "AutoDeploymentsEnabled")]
        getter auto_deployments_enabled : Bool?

        # The description of a source code repository. You must provide either this member or ImageRepository
        # (but not both).
        @[JSON::Field(key: "CodeRepository")]
        getter code_repository : Types::CodeRepository?

        # The description of a source image repository. You must provide either this member or CodeRepository
        # (but not both).
        @[JSON::Field(key: "ImageRepository")]
        getter image_repository : Types::ImageRepository?

        def initialize(
          @authentication_configuration : Types::AuthenticationConfiguration? = nil,
          @auto_deployments_enabled : Bool? = nil,
          @code_repository : Types::CodeRepository? = nil,
          @image_repository : Types::ImageRepository? = nil
        )
        end
      end

      struct StartDeploymentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want to manually deploy to.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        def initialize(
          @service_arn : String
        )
        end
      end

      struct StartDeploymentResponse
        include JSON::Serializable

        # The unique ID of the asynchronous operation that this request started. You can use it combined with
        # the ListOperations call to track the operation's progress.
        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        def initialize(
          @operation_id : String
        )
        end
      end

      # Describes a tag that is applied to an App Runner resource. A tag is a metadata item consisting of a
      # key-value pair.
      struct Tag
        include JSON::Serializable

        # The key of the tag.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the tag.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to update tags for. It must be the ARN
        # of an App Runner resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag key-value pairs to add or update. If a key is new to the resource, the tag is added
        # with the provided value. If a key is already associated with the resource, the value of the tag is
        # updated.
        @[JSON::Field(key: "Tags")]
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

      # Describes the configuration of the tracing feature within an App Runner observability configuration.
      struct TraceConfiguration
        include JSON::Serializable

        # The implementation provider chosen for tracing App Runner services.
        @[JSON::Field(key: "Vendor")]
        getter vendor : String

        def initialize(
          @vendor : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove tags from. It must be the ARN
        # of an App Runner resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys that you want to remove.
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

      struct UpdateDefaultAutoScalingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want to set as
        # the default. The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with
        # either .../ name or .../ name / revision . If a revision isn't specified, the latest active revision
        # is set as the default.
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String

        def initialize(
          @auto_scaling_configuration_arn : String
        )
        end
      end

      struct UpdateDefaultAutoScalingConfigurationResponse
        include JSON::Serializable

        # A description of the App Runner auto scaling configuration that was set as default.
        @[JSON::Field(key: "AutoScalingConfiguration")]
        getter auto_scaling_configuration : Types::AutoScalingConfiguration

        def initialize(
          @auto_scaling_configuration : Types::AutoScalingConfiguration
        )
        end
      end

      struct UpdateServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the App Runner service that you want to update.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String

        # The Amazon Resource Name (ARN) of an App Runner automatic scaling configuration resource that you
        # want to associate with the App Runner service.
        @[JSON::Field(key: "AutoScalingConfigurationArn")]
        getter auto_scaling_configuration_arn : String?

        # The settings for the health check that App Runner performs to monitor the health of the App Runner
        # service.
        @[JSON::Field(key: "HealthCheckConfiguration")]
        getter health_check_configuration : Types::HealthCheckConfiguration?

        # The runtime configuration to apply to instances (scaling units) of your service.
        @[JSON::Field(key: "InstanceConfiguration")]
        getter instance_configuration : Types::InstanceConfiguration?

        # Configuration settings related to network traffic of the web application that the App Runner service
        # runs.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The observability configuration of your service.
        @[JSON::Field(key: "ObservabilityConfiguration")]
        getter observability_configuration : Types::ServiceObservabilityConfiguration?

        # The source configuration to apply to the App Runner service. You can change the configuration of the
        # code or image repository that the service uses. However, you can't switch from code to image or the
        # other way around. This means that you must provide the same structure member of SourceConfiguration
        # that you originally included when you created the service. Specifically, you can include either
        # CodeRepository or ImageRepository . To update the source configuration, set the values to members of
        # the structure that you include.
        @[JSON::Field(key: "SourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        def initialize(
          @service_arn : String,
          @auto_scaling_configuration_arn : String? = nil,
          @health_check_configuration : Types::HealthCheckConfiguration? = nil,
          @instance_configuration : Types::InstanceConfiguration? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @observability_configuration : Types::ServiceObservabilityConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil
        )
        end
      end

      struct UpdateServiceResponse
        include JSON::Serializable

        # The unique ID of the asynchronous operation that this request started. You can use it combined with
        # the ListOperations call to track the operation's progress.
        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # A description of the App Runner service updated by this request. All configuration values in the
        # returned Service structure reflect configuration changes that are being applied by this request.
        @[JSON::Field(key: "Service")]
        getter service : Types::Service

        def initialize(
          @operation_id : String,
          @service : Types::Service
        )
        end
      end

      struct UpdateVpcIngressConnectionRequest
        include JSON::Serializable

        # Specifications for the customer’s Amazon VPC and the related Amazon Web Services PrivateLink VPC
        # endpoint that are used to update the VPC Ingress Connection resource.
        @[JSON::Field(key: "IngressVpcConfiguration")]
        getter ingress_vpc_configuration : Types::IngressVpcConfiguration

        # The Amazon Resource Name (Arn) for the App Runner VPC Ingress Connection resource that you want to
        # update.
        @[JSON::Field(key: "VpcIngressConnectionArn")]
        getter vpc_ingress_connection_arn : String

        def initialize(
          @ingress_vpc_configuration : Types::IngressVpcConfiguration,
          @vpc_ingress_connection_arn : String
        )
        end
      end

      struct UpdateVpcIngressConnectionResponse
        include JSON::Serializable

        # A description of the App Runner VPC Ingress Connection resource that's updated by this request.
        @[JSON::Field(key: "VpcIngressConnection")]
        getter vpc_ingress_connection : Types::VpcIngressConnection

        def initialize(
          @vpc_ingress_connection : Types::VpcIngressConnection
        )
        end
      end

      # Describes an App Runner VPC connector resource. A VPC connector describes the Amazon Virtual Private
      # Cloud (Amazon VPC) that an App Runner service is associated with, and the subnets and security group
      # that are used. Multiple revisions of a connector might have the same Name and different Revision
      # values. At this time, App Runner supports only one revision per name.
      struct VpcConnector
        include JSON::Serializable

        # The time when the VPC connector was created. It's in Unix time stamp format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The time when the VPC connector was deleted. It's in Unix time stamp format.
        @[JSON::Field(key: "DeletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deleted_at : Time?

        # A list of IDs of security groups that App Runner uses for access to Amazon Web Services resources
        # under the specified subnets. If not specified, App Runner uses the default security group of the
        # Amazon VPC. The default security group allows all outbound traffic.
        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        # The current state of the VPC connector. If the status of a connector revision is INACTIVE , it was
        # deleted and can't be used. Inactive connector revisions are permanently removed some time after they
        # are deleted.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A list of IDs of subnets that App Runner uses for your service. All IDs are of subnets of a single
        # Amazon VPC.
        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        # The Amazon Resource Name (ARN) of this VPC connector.
        @[JSON::Field(key: "VpcConnectorArn")]
        getter vpc_connector_arn : String?

        # The customer-provided VPC connector name.
        @[JSON::Field(key: "VpcConnectorName")]
        getter vpc_connector_name : String?

        # The revision of this VPC connector. It's unique among all the active connectors ( "Status": "ACTIVE"
        # ) that share the same Name . At this time, App Runner supports only one revision per name.
        @[JSON::Field(key: "VpcConnectorRevision")]
        getter vpc_connector_revision : Int32?

        def initialize(
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @security_groups : Array(String)? = nil,
          @status : String? = nil,
          @subnets : Array(String)? = nil,
          @vpc_connector_arn : String? = nil,
          @vpc_connector_name : String? = nil,
          @vpc_connector_revision : Int32? = nil
        )
        end
      end

      # DNS Target record for a custom domain of this Amazon VPC.
      struct VpcDNSTarget
        include JSON::Serializable

        # The domain name of your target DNS that is associated with the Amazon VPC.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The ID of the Amazon VPC that is associated with the custom domain name of the target DNS.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        # The Amazon Resource Name (ARN) of the VPC Ingress Connection that is associated with your service.
        @[JSON::Field(key: "VpcIngressConnectionArn")]
        getter vpc_ingress_connection_arn : String?

        def initialize(
          @domain_name : String? = nil,
          @vpc_id : String? = nil,
          @vpc_ingress_connection_arn : String? = nil
        )
        end
      end

      # The App Runner resource that specifies an App Runner endpoint for incoming traffic. It establishes a
      # connection between a VPC interface endpoint and a App Runner service, to make your App Runner
      # service accessible from only within an Amazon VPC.
      struct VpcIngressConnection
        include JSON::Serializable

        # The Account Id you use to create the VPC Ingress Connection resource.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The time when the VPC Ingress Connection was created. It's in the Unix time stamp format. Type:
        # Timestamp Required: Yes
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The time when the App Runner service was deleted. It's in the Unix time stamp format. Type:
        # Timestamp Required: No
        @[JSON::Field(key: "DeletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deleted_at : Time?

        # The domain name associated with the VPC Ingress Connection resource.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # Specifications for the customer’s VPC and related PrivateLink VPC endpoint that are used to
        # associate with the VPC Ingress Connection resource.
        @[JSON::Field(key: "IngressVpcConfiguration")]
        getter ingress_vpc_configuration : Types::IngressVpcConfiguration?

        # The Amazon Resource Name (ARN) of the service associated with the VPC Ingress Connection.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String?

        # The current status of the VPC Ingress Connection. The VPC Ingress Connection displays one of the
        # following statuses: AVAILABLE , PENDING_CREATION , PENDING_UPDATE , PENDING_DELETION ,
        # FAILED_CREATION , FAILED_UPDATE , FAILED_DELETION , and DELETED ..
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the VPC Ingress Connection.
        @[JSON::Field(key: "VpcIngressConnectionArn")]
        getter vpc_ingress_connection_arn : String?

        # The customer-provided VPC Ingress Connection name.
        @[JSON::Field(key: "VpcIngressConnectionName")]
        getter vpc_ingress_connection_name : String?

        def initialize(
          @account_id : String? = nil,
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @domain_name : String? = nil,
          @ingress_vpc_configuration : Types::IngressVpcConfiguration? = nil,
          @service_arn : String? = nil,
          @status : String? = nil,
          @vpc_ingress_connection_arn : String? = nil,
          @vpc_ingress_connection_name : String? = nil
        )
        end
      end

      # Provides summary information about an VPC Ingress Connection, which includes its VPC Ingress
      # Connection ARN and its associated Service ARN.
      struct VpcIngressConnectionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service associated with the VPC Ingress Connection.
        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String?

        # The Amazon Resource Name (ARN) of the VPC Ingress Connection.
        @[JSON::Field(key: "VpcIngressConnectionArn")]
        getter vpc_ingress_connection_arn : String?

        def initialize(
          @service_arn : String? = nil,
          @vpc_ingress_connection_arn : String? = nil
        )
        end
      end
    end
  end
end
