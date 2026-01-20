require "json"
require "time"

module Aws
  module EMRContainers
    module Types

      # Authorization-related configuration inputs for the security configuration.

      struct AuthorizationConfiguration
        include JSON::Serializable

        # Encryption-related configuration input for the security configuration.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Lake Formation related configuration inputs for the security configuration.

        @[JSON::Field(key: "lakeFormationConfiguration")]
        getter lake_formation_configuration : Types::LakeFormationConfiguration?

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @lake_formation_configuration : Types::LakeFormationConfiguration? = nil
        )
        end
      end


      struct CancelJobRunRequest
        include JSON::Serializable

        # The ID of the job run to cancel.

        @[JSON::Field(key: "jobRunId")]
        getter id : String

        # The ID of the virtual cluster for which the job run will be canceled.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        def initialize(
          @id : String,
          @virtual_cluster_id : String
        )
        end
      end


      struct CancelJobRunResponse
        include JSON::Serializable

        # The output contains the ID of the cancelled job run.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The output contains the virtual cluster ID for which the job run is cancelled.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String?

        def initialize(
          @id : String? = nil,
          @virtual_cluster_id : String? = nil
        )
        end
      end

      # The entity representing certificate data generated for managed endpoint.

      struct Certificate
        include JSON::Serializable

        # The ARN of the certificate generated for managed endpoint.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The base64 encoded PEM certificate data generated for managed endpoint.

        @[JSON::Field(key: "certificateData")]
        getter certificate_data : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_data : String? = nil
        )
        end
      end

      # A configuration for CloudWatch monitoring. You can configure your jobs to send log information to
      # CloudWatch Logs.

      struct CloudWatchMonitoringConfiguration
        include JSON::Serializable

        # The name of the log group for log publishing.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        # The specified name prefix for log streams.

        @[JSON::Field(key: "logStreamNamePrefix")]
        getter log_stream_name_prefix : String?

        def initialize(
          @log_group_name : String,
          @log_stream_name_prefix : String? = nil
        )
        end
      end

      # A configuration specification to be used when provisioning virtual clusters, which can include
      # configurations for applications and software bundled with Amazon EMR on EKS. A configuration
      # consists of a classification, properties, and optional nested configurations. A classification
      # refers to an application-specific configuration file. Properties are the settings you want to change
      # in that file.

      struct Configuration
        include JSON::Serializable

        # The classification within a configuration.

        @[JSON::Field(key: "classification")]
        getter classification : String

        # A list of additional configurations to apply within a configuration object.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::Configuration)?

        # A set of properties specified within a configuration classification.

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, String)?

        def initialize(
          @classification : String,
          @configurations : Array(Types::Configuration)? = nil,
          @properties : Hash(String, String)? = nil
        )
        end
      end

      # A configuration specification to be used to override existing configurations.

      struct ConfigurationOverrides
        include JSON::Serializable

        # The configurations for the application running by the job run.

        @[JSON::Field(key: "applicationConfiguration")]
        getter application_configuration : Array(Types::Configuration)?

        # The configurations for monitoring.

        @[JSON::Field(key: "monitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        def initialize(
          @application_configuration : Array(Types::Configuration)? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil
        )
        end
      end

      # The information about the container used for a job run or a managed endpoint.

      struct ContainerInfo
        include JSON::Serializable

        # The information about the Amazon EKS cluster.

        @[JSON::Field(key: "eksInfo")]
        getter eks_info : Types::EksInfo?

        def initialize(
          @eks_info : Types::EksInfo? = nil
        )
        end
      end

      # The settings for container log rotation.

      struct ContainerLogRotationConfiguration
        include JSON::Serializable

        # The number of files to keep in container after rotation.

        @[JSON::Field(key: "maxFilesToKeep")]
        getter max_files_to_keep : Int32

        # The file size at which to rotate logs. Minimum of 2KB, Maximum of 2GB.

        @[JSON::Field(key: "rotationSize")]
        getter rotation_size : String

        def initialize(
          @max_files_to_keep : Int32,
          @rotation_size : String
        )
        end
      end

      # The information about the container provider.

      struct ContainerProvider
        include JSON::Serializable

        # The ID of the container cluster.

        @[JSON::Field(key: "id")]
        getter id : String

        # The type of the container provider. Amazon EKS is the only supported type as of now.

        @[JSON::Field(key: "type")]
        getter type : String

        # The information about the container cluster.

        @[JSON::Field(key: "info")]
        getter info : Types::ContainerInfo?

        def initialize(
          @id : String,
          @type : String,
          @info : Types::ContainerInfo? = nil
        )
        end
      end


      struct CreateJobTemplateRequest
        include JSON::Serializable

        # The client token of the job template.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The job template data which holds values of StartJobRun API request.

        @[JSON::Field(key: "jobTemplateData")]
        getter job_template_data : Types::JobTemplateData

        # The specified name of the job template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The KMS key ARN used to encrypt the job template.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The tags that are associated with the job template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @job_template_data : Types::JobTemplateData,
          @name : String,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateJobTemplateResponse
        include JSON::Serializable

        # This output display the ARN of the created job template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # This output displays the date and time when the job template was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # This output display the created job template ID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # This output displays the name of the created job template.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateManagedEndpointRequest
        include JSON::Serializable

        # The client idempotency token for this create call.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ARN of the execution role.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The name of the managed endpoint.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon EMR release version.

        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The type of the managed endpoint.

        @[JSON::Field(key: "type")]
        getter type : String

        # The ID of the virtual cluster for which a managed endpoint is created.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        # The certificate ARN provided by users for the managed endpoint. This field is under deprecation and
        # will be removed in future releases.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The configuration settings that will be used to override existing configurations.

        @[JSON::Field(key: "configurationOverrides")]
        getter configuration_overrides : Types::ConfigurationOverrides?

        # The tags of the managed endpoint.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @execution_role_arn : String,
          @name : String,
          @release_label : String,
          @type : String,
          @virtual_cluster_id : String,
          @certificate_arn : String? = nil,
          @configuration_overrides : Types::ConfigurationOverrides? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateManagedEndpointResponse
        include JSON::Serializable

        # The output contains the ARN of the managed endpoint.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The output contains the ID of the managed endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The output contains the name of the managed endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The output contains the ID of the virtual cluster.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @virtual_cluster_id : String? = nil
        )
        end
      end


      struct CreateSecurityConfigurationRequest
        include JSON::Serializable

        # The client idempotency token to use when creating the security configuration.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the security configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # Security configuration input for the request.

        @[JSON::Field(key: "securityConfigurationData")]
        getter security_configuration_data : Types::SecurityConfigurationData

        # The container provider associated with the security configuration.

        @[JSON::Field(key: "containerProvider")]
        getter container_provider : Types::ContainerProvider?

        # The tags to add to the security configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @name : String,
          @security_configuration_data : Types::SecurityConfigurationData,
          @container_provider : Types::ContainerProvider? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSecurityConfigurationResponse
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the security configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the security configuration.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the security configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateVirtualClusterRequest
        include JSON::Serializable

        # The client token of the virtual cluster.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The container provider of the virtual cluster.

        @[JSON::Field(key: "containerProvider")]
        getter container_provider : Types::ContainerProvider

        # The specified name of the virtual cluster.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the security configuration.

        @[JSON::Field(key: "securityConfigurationId")]
        getter security_configuration_id : String?

        # The tags assigned to the virtual cluster.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @container_provider : Types::ContainerProvider,
          @name : String,
          @security_configuration_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateVirtualClusterResponse
        include JSON::Serializable

        # This output contains the ARN of virtual cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # This output contains the virtual cluster ID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # This output contains the name of the virtual cluster.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The structure containing the session token being returned.

      struct Credentials
        include JSON::Serializable

        # The actual session token being returned.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @token : String? = nil
        )
        end
      end


      struct DeleteJobTemplateRequest
        include JSON::Serializable

        # The ID of the job template that will be deleted.

        @[JSON::Field(key: "templateId")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteJobTemplateResponse
        include JSON::Serializable

        # This output contains the ID of the job template that was deleted.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct DeleteManagedEndpointRequest
        include JSON::Serializable

        # The ID of the managed endpoint.

        @[JSON::Field(key: "endpointId")]
        getter id : String

        # The ID of the endpoint's virtual cluster.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        def initialize(
          @id : String,
          @virtual_cluster_id : String
        )
        end
      end


      struct DeleteManagedEndpointResponse
        include JSON::Serializable

        # The output displays the ID of the managed endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The output displays the ID of the endpoint's virtual cluster.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String?

        def initialize(
          @id : String? = nil,
          @virtual_cluster_id : String? = nil
        )
        end
      end


      struct DeleteVirtualClusterRequest
        include JSON::Serializable

        # The ID of the virtual cluster that will be deleted.

        @[JSON::Field(key: "virtualClusterId")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteVirtualClusterResponse
        include JSON::Serializable

        # This output contains the ID of the virtual cluster that will be deleted.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct DescribeJobRunRequest
        include JSON::Serializable

        # The ID of the job run request.

        @[JSON::Field(key: "jobRunId")]
        getter id : String

        # The ID of the virtual cluster for which the job run is submitted.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        def initialize(
          @id : String,
          @virtual_cluster_id : String
        )
        end
      end


      struct DescribeJobRunResponse
        include JSON::Serializable

        # The output displays information about a job run.

        @[JSON::Field(key: "jobRun")]
        getter job_run : Types::JobRun?

        def initialize(
          @job_run : Types::JobRun? = nil
        )
        end
      end


      struct DescribeJobTemplateRequest
        include JSON::Serializable

        # The ID of the job template that will be described.

        @[JSON::Field(key: "templateId")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeJobTemplateResponse
        include JSON::Serializable

        # This output displays information about the specified job template.

        @[JSON::Field(key: "jobTemplate")]
        getter job_template : Types::JobTemplate?

        def initialize(
          @job_template : Types::JobTemplate? = nil
        )
        end
      end


      struct DescribeManagedEndpointRequest
        include JSON::Serializable

        # This output displays ID of the managed endpoint.

        @[JSON::Field(key: "endpointId")]
        getter id : String

        # The ID of the endpoint's virtual cluster.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        def initialize(
          @id : String,
          @virtual_cluster_id : String
        )
        end
      end


      struct DescribeManagedEndpointResponse
        include JSON::Serializable

        # This output displays information about a managed endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : Types::Endpoint?

        def initialize(
          @endpoint : Types::Endpoint? = nil
        )
        end
      end


      struct DescribeSecurityConfigurationRequest
        include JSON::Serializable

        # The ID of the security configuration.

        @[JSON::Field(key: "securityConfigurationId")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeSecurityConfigurationResponse
        include JSON::Serializable

        # Details of the security configuration.

        @[JSON::Field(key: "securityConfiguration")]
        getter security_configuration : Types::SecurityConfiguration?

        def initialize(
          @security_configuration : Types::SecurityConfiguration? = nil
        )
        end
      end


      struct DescribeVirtualClusterRequest
        include JSON::Serializable

        # The ID of the virtual cluster that will be described.

        @[JSON::Field(key: "virtualClusterId")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeVirtualClusterResponse
        include JSON::Serializable

        # This output displays information about the specified virtual cluster.

        @[JSON::Field(key: "virtualCluster")]
        getter virtual_cluster : Types::VirtualCluster?

        def initialize(
          @virtual_cluster : Types::VirtualCluster? = nil
        )
        end
      end

      # The request exceeded the Amazon EKS API operation limits.

      struct EKSRequestThrottledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The information about the Amazon EKS cluster.

      struct EksInfo
        include JSON::Serializable

        # The namespaces of the Amazon EKS cluster.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The nodeLabel of the nodes where the resources of this virtual cluster can get scheduled. It
        # requires relevant scaling and policy engine addons.

        @[JSON::Field(key: "nodeLabel")]
        getter node_label : String?

        def initialize(
          @namespace : String? = nil,
          @node_label : String? = nil
        )
        end
      end

      # Configurations related to encryption for the security configuration.

      struct EncryptionConfiguration
        include JSON::Serializable

        # In-transit encryption-related input for the security configuration.

        @[JSON::Field(key: "inTransitEncryptionConfiguration")]
        getter in_transit_encryption_configuration : Types::InTransitEncryptionConfiguration?

        def initialize(
          @in_transit_encryption_configuration : Types::InTransitEncryptionConfiguration? = nil
        )
        end
      end

      # This entity represents the endpoint that is managed by Amazon EMR on EKS.

      struct Endpoint
        include JSON::Serializable

        # The ARN of the endpoint.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The certificate ARN of the endpoint. This field is under deprecation and will be removed in future.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The certificate generated by emr control plane on customer behalf to secure the managed endpoint.

        @[JSON::Field(key: "certificateAuthority")]
        getter certificate_authority : Types::Certificate?

        # The configuration settings that are used to override existing configurations for endpoints.

        @[JSON::Field(key: "configurationOverrides")]
        getter configuration_overrides : Types::ConfigurationOverrides?

        # The date and time when the endpoint was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The execution role ARN of the endpoint.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The reasons why the endpoint has failed.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ID of the endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The EMR release version to be used for the endpoint.

        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String?

        # The security group configuration of the endpoint.

        @[JSON::Field(key: "securityGroup")]
        getter security_group : String?

        # The server URL of the endpoint.

        @[JSON::Field(key: "serverUrl")]
        getter server_url : String?

        # The state of the endpoint.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Additional details of the endpoint state.

        @[JSON::Field(key: "stateDetails")]
        getter state_details : String?

        # The subnet IDs of the endpoint.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The tags of the endpoint.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the endpoint.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The ID of the endpoint's virtual cluster.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String?

        def initialize(
          @arn : String? = nil,
          @certificate_arn : String? = nil,
          @certificate_authority : Types::Certificate? = nil,
          @configuration_overrides : Types::ConfigurationOverrides? = nil,
          @created_at : Time? = nil,
          @execution_role_arn : String? = nil,
          @failure_reason : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @release_label : String? = nil,
          @security_group : String? = nil,
          @server_url : String? = nil,
          @state : String? = nil,
          @state_details : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @virtual_cluster_id : String? = nil
        )
        end
      end


      struct GetManagedEndpointSessionCredentialsRequest
        include JSON::Serializable

        # Type of the token requested. Currently supported and default value of this field is “TOKEN.”

        @[JSON::Field(key: "credentialType")]
        getter credential_type : String

        # The ARN of the managed endpoint for which the request is submitted.

        @[JSON::Field(key: "endpointId")]
        getter endpoint_identifier : String

        # The IAM Execution Role ARN that will be used by the job run.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The ARN of the Virtual Cluster which the Managed Endpoint belongs to.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_identifier : String

        # The client idempotency token of the job run request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Duration in seconds for which the session token is valid. The default duration is 15 minutes and the
        # maximum is 12 hours.

        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int32?

        # String identifier used to separate sections of the execution logs uploaded to S3.

        @[JSON::Field(key: "logContext")]
        getter log_context : String?

        def initialize(
          @credential_type : String,
          @endpoint_identifier : String,
          @execution_role_arn : String,
          @virtual_cluster_identifier : String,
          @client_token : String? = nil,
          @duration_in_seconds : Int32? = nil,
          @log_context : String? = nil
        )
        end
      end


      struct GetManagedEndpointSessionCredentialsResponse
        include JSON::Serializable

        # The structure containing the session credentials.

        @[JSON::Field(key: "credentials")]
        getter credentials : Types::Credentials?

        # The date and time when the session token will expire.

        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time?

        # The identifier of the session token returned.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @credentials : Types::Credentials? = nil,
          @expires_at : Time? = nil,
          @id : String? = nil
        )
        end
      end

      # Configurations related to in-transit encryption for the security configuration.

      struct InTransitEncryptionConfiguration
        include JSON::Serializable

        # TLS certificate-related configuration input for the security configuration.

        @[JSON::Field(key: "tlsCertificateConfiguration")]
        getter tls_certificate_configuration : Types::TLSCertificateConfiguration?

        def initialize(
          @tls_certificate_configuration : Types::TLSCertificateConfiguration? = nil
        )
        end
      end

      # This is an internal server exception.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specify the driver that the job runs on. Exactly one of the two available job drivers is required,
      # either sparkSqlJobDriver or sparkSubmitJobDriver.

      struct JobDriver
        include JSON::Serializable

        # The job driver for job type.

        @[JSON::Field(key: "sparkSqlJobDriver")]
        getter spark_sql_job_driver : Types::SparkSqlJobDriver?

        # The job driver parameters specified for spark submit.

        @[JSON::Field(key: "sparkSubmitJobDriver")]
        getter spark_submit_job_driver : Types::SparkSubmitJobDriver?

        def initialize(
          @spark_sql_job_driver : Types::SparkSqlJobDriver? = nil,
          @spark_submit_job_driver : Types::SparkSubmitJobDriver? = nil
        )
        end
      end

      # This entity describes a job run. A job run is a unit of work, such as a Spark jar, PySpark script,
      # or SparkSQL query, that you submit to Amazon EMR on EKS.

      struct JobRun
        include JSON::Serializable

        # The ARN of job run.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The client token used to start a job run.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration settings that are used to override default configuration.

        @[JSON::Field(key: "configurationOverrides")]
        getter configuration_overrides : Types::ConfigurationOverrides?

        # The date and time when the job run was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the job run.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The execution role ARN of the job run.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The reasons why the job run has failed.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The date and time when the job run has finished.

        @[JSON::Field(key: "finishedAt")]
        getter finished_at : Time?

        # The ID of the job run.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Parameters of job driver for the job run.

        @[JSON::Field(key: "jobDriver")]
        getter job_driver : Types::JobDriver?

        # The name of the job run.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The release version of Amazon EMR.

        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String?

        # The configuration of the retry policy that the job runs on.

        @[JSON::Field(key: "retryPolicyConfiguration")]
        getter retry_policy_configuration : Types::RetryPolicyConfiguration?

        # The current status of the retry policy executed on the job.

        @[JSON::Field(key: "retryPolicyExecution")]
        getter retry_policy_execution : Types::RetryPolicyExecution?

        # The state of the job run.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Additional details of the job run state.

        @[JSON::Field(key: "stateDetails")]
        getter state_details : String?

        # The assigned tags of the job run.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the job run's virtual cluster.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String?

        def initialize(
          @arn : String? = nil,
          @client_token : String? = nil,
          @configuration_overrides : Types::ConfigurationOverrides? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @execution_role_arn : String? = nil,
          @failure_reason : String? = nil,
          @finished_at : Time? = nil,
          @id : String? = nil,
          @job_driver : Types::JobDriver? = nil,
          @name : String? = nil,
          @release_label : String? = nil,
          @retry_policy_configuration : Types::RetryPolicyConfiguration? = nil,
          @retry_policy_execution : Types::RetryPolicyExecution? = nil,
          @state : String? = nil,
          @state_details : String? = nil,
          @tags : Hash(String, String)? = nil,
          @virtual_cluster_id : String? = nil
        )
        end
      end

      # This entity describes a job template. Job template stores values of StartJobRun API request in a
      # template and can be used to start a job run. Job template allows two use cases: avoid repeating
      # recurring StartJobRun API request values, enforcing certain values in StartJobRun API request.

      struct JobTemplate
        include JSON::Serializable

        # The job template data which holds values of StartJobRun API request.

        @[JSON::Field(key: "jobTemplateData")]
        getter job_template_data : Types::JobTemplateData

        # The ARN of the job template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time when the job template was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the job template.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The error message in case the decryption of job template fails.

        @[JSON::Field(key: "decryptionError")]
        getter decryption_error : String?

        # The ID of the job template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The KMS key ARN used to encrypt the job template.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The name of the job template.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags assigned to the job template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @job_template_data : Types::JobTemplateData,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @decryption_error : String? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The values of StartJobRun API requests used in job runs started using the job template.

      struct JobTemplateData
        include JSON::Serializable

        # The execution role ARN of the job run.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String


        @[JSON::Field(key: "jobDriver")]
        getter job_driver : Types::JobDriver

        # The release version of Amazon EMR.

        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The configuration settings that are used to override defaults configuration.

        @[JSON::Field(key: "configurationOverrides")]
        getter configuration_overrides : Types::ParametricConfigurationOverrides?

        # The tags assigned to jobs started using the job template.

        @[JSON::Field(key: "jobTags")]
        getter job_tags : Hash(String, String)?

        # The configuration of parameters existing in the job template.

        @[JSON::Field(key: "parameterConfiguration")]
        getter parameter_configuration : Hash(String, Types::TemplateParameterConfiguration)?

        def initialize(
          @execution_role_arn : String,
          @job_driver : Types::JobDriver,
          @release_label : String,
          @configuration_overrides : Types::ParametricConfigurationOverrides? = nil,
          @job_tags : Hash(String, String)? = nil,
          @parameter_configuration : Hash(String, Types::TemplateParameterConfiguration)? = nil
        )
        end
      end

      # Lake Formation related configuration inputs for the security configuration.

      struct LakeFormationConfiguration
        include JSON::Serializable

        # The session tag to authorize Amazon EMR on EKS for API calls to Lake Formation.

        @[JSON::Field(key: "authorizedSessionTagValue")]
        getter authorized_session_tag_value : String?

        # The query engine IAM role ARN that is tied to the secure Spark job. The QueryEngine role assumes the
        # JobExecutionRole to execute all the Lake Formation calls.

        @[JSON::Field(key: "queryEngineRoleArn")]
        getter query_engine_role_arn : String?

        # The namespace input of the system job.

        @[JSON::Field(key: "secureNamespaceInfo")]
        getter secure_namespace_info : Types::SecureNamespaceInfo?

        def initialize(
          @authorized_session_tag_value : String? = nil,
          @query_engine_role_arn : String? = nil,
          @secure_namespace_info : Types::SecureNamespaceInfo? = nil
        )
        end
      end


      struct ListJobRunsRequest
        include JSON::Serializable

        # The ID of the virtual cluster for which to list the job run.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        # The date and time after which the job runs were submitted.

        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The date and time before which the job runs were submitted.

        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The maximum number of job runs that can be listed.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the job run.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The token for the next set of job runs to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The states of the job run.

        @[JSON::Field(key: "states")]
        getter states : Array(String)?

        def initialize(
          @virtual_cluster_id : String,
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @states : Array(String)? = nil
        )
        end
      end


      struct ListJobRunsResponse
        include JSON::Serializable

        # This output lists information about the specified job runs.

        @[JSON::Field(key: "jobRuns")]
        getter job_runs : Array(Types::JobRun)?

        # This output displays the token for the next set of job runs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_runs : Array(Types::JobRun)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListJobTemplatesRequest
        include JSON::Serializable

        # The date and time after which the job templates were created.

        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The date and time before which the job templates were created.

        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The maximum number of job templates that can be listed.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of job templates to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListJobTemplatesResponse
        include JSON::Serializable

        # This output displays the token for the next set of job templates.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # This output lists information about the specified job templates.

        @[JSON::Field(key: "templates")]
        getter templates : Array(Types::JobTemplate)?

        def initialize(
          @next_token : String? = nil,
          @templates : Array(Types::JobTemplate)? = nil
        )
        end
      end


      struct ListManagedEndpointsRequest
        include JSON::Serializable

        # The ID of the virtual cluster.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        # The date and time after which the endpoints are created.

        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The date and time before which the endpoints are created.

        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The maximum number of managed endpoints that can be listed.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of managed endpoints to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The states of the managed endpoints.

        @[JSON::Field(key: "states")]
        getter states : Array(String)?

        # The types of the managed endpoints.

        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @virtual_cluster_id : String,
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @states : Array(String)? = nil,
          @types : Array(String)? = nil
        )
        end
      end


      struct ListManagedEndpointsResponse
        include JSON::Serializable

        # The managed endpoints to be listed.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # The token for the next set of endpoints to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @endpoints : Array(Types::Endpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSecurityConfigurationsRequest
        include JSON::Serializable

        # The date and time after which the security configuration was created.

        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The date and time before which the security configuration was created.

        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The maximum number of security configurations the operation can list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of security configurations to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSecurityConfigurationsResponse
        include JSON::Serializable

        # The token for the next set of security configurations to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of returned security configurations.

        @[JSON::Field(key: "securityConfigurations")]
        getter security_configurations : Array(Types::SecurityConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @security_configurations : Array(Types::SecurityConfiguration)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of tagged resources.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags assigned to resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListVirtualClustersRequest
        include JSON::Serializable

        # The container provider ID of the virtual cluster.

        @[JSON::Field(key: "containerProviderId")]
        getter container_provider_id : String?

        # The container provider type of the virtual cluster. Amazon EKS is the only supported type as of now.

        @[JSON::Field(key: "containerProviderType")]
        getter container_provider_type : String?

        # The date and time after which the virtual clusters are created.

        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # The date and time before which the virtual clusters are created.

        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # Optional Boolean that specifies whether the operation should return the virtual clusters that have
        # the access entry integration enabled or disabled. If not specified, the operation returns all
        # applicable virtual clusters.

        @[JSON::Field(key: "eksAccessEntryIntegrated")]
        getter eks_access_entry_integrated : Bool?

        # The maximum number of virtual clusters that can be listed.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of virtual clusters to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The states of the requested virtual clusters.

        @[JSON::Field(key: "states")]
        getter states : Array(String)?

        def initialize(
          @container_provider_id : String? = nil,
          @container_provider_type : String? = nil,
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @eks_access_entry_integrated : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @states : Array(String)? = nil
        )
        end
      end


      struct ListVirtualClustersResponse
        include JSON::Serializable

        # This output displays the token for the next set of virtual clusters.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # This output lists the specified virtual clusters.

        @[JSON::Field(key: "virtualClusters")]
        getter virtual_clusters : Array(Types::VirtualCluster)?

        def initialize(
          @next_token : String? = nil,
          @virtual_clusters : Array(Types::VirtualCluster)? = nil
        )
        end
      end

      # The entity that provides configuration control over managed logs.

      struct ManagedLogs
        include JSON::Serializable

        # Determines whether Amazon Web Services can retain logs.

        @[JSON::Field(key: "allowAWSToRetainLogs")]
        getter allow_aws_to_retain_logs : String?

        # The Amazon resource name (ARN) of the encryption key for logs.

        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @allow_aws_to_retain_logs : String? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end

      # Configuration setting for monitoring.

      struct MonitoringConfiguration
        include JSON::Serializable

        # Monitoring configurations for CloudWatch.

        @[JSON::Field(key: "cloudWatchMonitoringConfiguration")]
        getter cloud_watch_monitoring_configuration : Types::CloudWatchMonitoringConfiguration?

        # Enable or disable container log rotation.

        @[JSON::Field(key: "containerLogRotationConfiguration")]
        getter container_log_rotation_configuration : Types::ContainerLogRotationConfiguration?

        # The entity that controls configuration for managed logs.

        @[JSON::Field(key: "managedLogs")]
        getter managed_logs : Types::ManagedLogs?

        # Monitoring configurations for the persistent application UI.

        @[JSON::Field(key: "persistentAppUI")]
        getter persistent_app_ui : String?

        # Amazon S3 configuration for monitoring log publishing.

        @[JSON::Field(key: "s3MonitoringConfiguration")]
        getter s3_monitoring_configuration : Types::S3MonitoringConfiguration?

        def initialize(
          @cloud_watch_monitoring_configuration : Types::CloudWatchMonitoringConfiguration? = nil,
          @container_log_rotation_configuration : Types::ContainerLogRotationConfiguration? = nil,
          @managed_logs : Types::ManagedLogs? = nil,
          @persistent_app_ui : String? = nil,
          @s3_monitoring_configuration : Types::S3MonitoringConfiguration? = nil
        )
        end
      end

      # A configuration for CloudWatch monitoring. You can configure your jobs to send log information to
      # CloudWatch Logs. This data type allows job template parameters to be specified within.

      struct ParametricCloudWatchMonitoringConfiguration
        include JSON::Serializable

        # The name of the log group for log publishing.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        # The specified name prefix for log streams.

        @[JSON::Field(key: "logStreamNamePrefix")]
        getter log_stream_name_prefix : String?

        def initialize(
          @log_group_name : String? = nil,
          @log_stream_name_prefix : String? = nil
        )
        end
      end

      # A configuration specification to be used to override existing configurations. This data type allows
      # job template parameters to be specified within.

      struct ParametricConfigurationOverrides
        include JSON::Serializable

        # The configurations for the application running by the job run.

        @[JSON::Field(key: "applicationConfiguration")]
        getter application_configuration : Array(Types::Configuration)?

        # The configurations for monitoring.

        @[JSON::Field(key: "monitoringConfiguration")]
        getter monitoring_configuration : Types::ParametricMonitoringConfiguration?

        def initialize(
          @application_configuration : Array(Types::Configuration)? = nil,
          @monitoring_configuration : Types::ParametricMonitoringConfiguration? = nil
        )
        end
      end

      # Configuration setting for monitoring. This data type allows job template parameters to be specified
      # within.

      struct ParametricMonitoringConfiguration
        include JSON::Serializable

        # Monitoring configurations for CloudWatch.

        @[JSON::Field(key: "cloudWatchMonitoringConfiguration")]
        getter cloud_watch_monitoring_configuration : Types::ParametricCloudWatchMonitoringConfiguration?

        # Monitoring configurations for the persistent application UI.

        @[JSON::Field(key: "persistentAppUI")]
        getter persistent_app_ui : String?

        # Amazon S3 configuration for monitoring log publishing.

        @[JSON::Field(key: "s3MonitoringConfiguration")]
        getter s3_monitoring_configuration : Types::ParametricS3MonitoringConfiguration?

        def initialize(
          @cloud_watch_monitoring_configuration : Types::ParametricCloudWatchMonitoringConfiguration? = nil,
          @persistent_app_ui : String? = nil,
          @s3_monitoring_configuration : Types::ParametricS3MonitoringConfiguration? = nil
        )
        end
      end

      # Amazon S3 configuration for monitoring log publishing. You can configure your jobs to send log
      # information to Amazon S3. This data type allows job template parameters to be specified within.

      struct ParametricS3MonitoringConfiguration
        include JSON::Serializable

        # Amazon S3 destination URI for log publishing.

        @[JSON::Field(key: "logUri")]
        getter log_uri : String?

        def initialize(
          @log_uri : String? = nil
        )
        end
      end

      # The request throttled.

      struct RequestThrottledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration of the retry policy that the job runs on.

      struct RetryPolicyConfiguration
        include JSON::Serializable

        # The maximum number of attempts on the job's driver.

        @[JSON::Field(key: "maxAttempts")]
        getter max_attempts : Int32

        def initialize(
          @max_attempts : Int32
        )
        end
      end

      # The current status of the retry policy executed on the job.

      struct RetryPolicyExecution
        include JSON::Serializable

        # The current number of attempts made on the driver of the job.

        @[JSON::Field(key: "currentAttemptCount")]
        getter current_attempt_count : Int32

        def initialize(
          @current_attempt_count : Int32
        )
        end
      end

      # Amazon S3 configuration for monitoring log publishing. You can configure your jobs to send log
      # information to Amazon S3.

      struct S3MonitoringConfiguration
        include JSON::Serializable

        # Amazon S3 destination URI for log publishing.

        @[JSON::Field(key: "logUri")]
        getter log_uri : String

        def initialize(
          @log_uri : String
        )
        end
      end

      # Namespace inputs for the system job.

      struct SecureNamespaceInfo
        include JSON::Serializable

        # The ID of the Amazon EKS cluster where Amazon EMR on EKS jobs run.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String?

        # The namespace of the Amazon EKS cluster where the system jobs run.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @cluster_id : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # Inputs related to the security configuration. Security configurations in Amazon EMR on EKS are
      # templates for different security setups. You can use security configurations to configure the Lake
      # Formation integration setup. You can also create a security configuration to re-use a security setup
      # each time you create a virtual cluster.

      struct SecurityConfiguration
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the security configuration.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the job run was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the job run.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ID of the security configuration.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the security configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Security configuration inputs for the request.

        @[JSON::Field(key: "securityConfigurationData")]
        getter security_configuration_data : Types::SecurityConfigurationData?

        # The tags to assign to the security configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @security_configuration_data : Types::SecurityConfigurationData? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configurations related to the security configuration for the request.

      struct SecurityConfigurationData
        include JSON::Serializable

        # Authorization-related configuration input for the security configuration.

        @[JSON::Field(key: "authorizationConfiguration")]
        getter authorization_configuration : Types::AuthorizationConfiguration?

        def initialize(
          @authorization_configuration : Types::AuthorizationConfiguration? = nil
        )
        end
      end

      # The job driver for job type.

      struct SparkSqlJobDriver
        include JSON::Serializable

        # The SQL file to be executed.

        @[JSON::Field(key: "entryPoint")]
        getter entry_point : String?

        # The Spark parameters to be included in the Spark SQL command.

        @[JSON::Field(key: "sparkSqlParameters")]
        getter spark_sql_parameters : String?

        def initialize(
          @entry_point : String? = nil,
          @spark_sql_parameters : String? = nil
        )
        end
      end

      # The information about job driver for Spark submit.

      struct SparkSubmitJobDriver
        include JSON::Serializable

        # The entry point of job application.

        @[JSON::Field(key: "entryPoint")]
        getter entry_point : String

        # The arguments for job application.

        @[JSON::Field(key: "entryPointArguments")]
        getter entry_point_arguments : Array(String)?

        # The Spark submit parameters that are used for job runs.

        @[JSON::Field(key: "sparkSubmitParameters")]
        getter spark_submit_parameters : String?

        def initialize(
          @entry_point : String,
          @entry_point_arguments : Array(String)? = nil,
          @spark_submit_parameters : String? = nil
        )
        end
      end


      struct StartJobRunRequest
        include JSON::Serializable

        # The client idempotency token of the job run request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The virtual cluster ID for which the job run request is submitted.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String

        # The configuration overrides for the job run.

        @[JSON::Field(key: "configurationOverrides")]
        getter configuration_overrides : Types::ConfigurationOverrides?

        # The execution role ARN for the job run.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The job driver for the job run.

        @[JSON::Field(key: "jobDriver")]
        getter job_driver : Types::JobDriver?

        # The job template ID to be used to start the job run.

        @[JSON::Field(key: "jobTemplateId")]
        getter job_template_id : String?

        # The values of job template parameters to start a job run.

        @[JSON::Field(key: "jobTemplateParameters")]
        getter job_template_parameters : Hash(String, String)?

        # The name of the job run.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon EMR release version to use for the job run.

        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String?

        # The retry policy configuration for the job run.

        @[JSON::Field(key: "retryPolicyConfiguration")]
        getter retry_policy_configuration : Types::RetryPolicyConfiguration?

        # The tags assigned to job runs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @virtual_cluster_id : String,
          @configuration_overrides : Types::ConfigurationOverrides? = nil,
          @execution_role_arn : String? = nil,
          @job_driver : Types::JobDriver? = nil,
          @job_template_id : String? = nil,
          @job_template_parameters : Hash(String, String)? = nil,
          @name : String? = nil,
          @release_label : String? = nil,
          @retry_policy_configuration : Types::RetryPolicyConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartJobRunResponse
        include JSON::Serializable

        # This output lists the ARN of job run.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # This output displays the started job run ID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # This output displays the name of the started job run.

        @[JSON::Field(key: "name")]
        getter name : String?

        # This output displays the virtual cluster ID for which the job run was submitted.

        @[JSON::Field(key: "virtualClusterId")]
        getter virtual_cluster_id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @virtual_cluster_id : String? = nil
        )
        end
      end

      # Configurations related to the TLS certificate for the security configuration.

      struct TLSCertificateConfiguration
        include JSON::Serializable

        # The TLS certificate type. Acceptable values: PEM or Custom .

        @[JSON::Field(key: "certificateProviderType")]
        getter certificate_provider_type : String?

        # Secrets Manager ARN that contains the private TLS certificate contents, used for communication
        # between the user job and the system job.

        @[JSON::Field(key: "privateCertificateSecretArn")]
        getter private_certificate_secret_arn : String?

        # Secrets Manager ARN that contains the public TLS certificate contents, used for communication
        # between the user job and the system job.

        @[JSON::Field(key: "publicCertificateSecretArn")]
        getter public_certificate_secret_arn : String?

        def initialize(
          @certificate_provider_type : String? = nil,
          @private_certificate_secret_arn : String? = nil,
          @public_certificate_secret_arn : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of resources.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags assigned to resources.

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

      # The configuration of a job template parameter.

      struct TemplateParameterConfiguration
        include JSON::Serializable

        # The default value for the job template parameter.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The type of the job template parameter. Allowed values are: ‘STRING’, ‘NUMBER’.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @default_value : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of resources.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys of the resources.

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

      # There are invalid parameters in the client request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This entity describes a virtual cluster. A virtual cluster is a Kubernetes namespace that Amazon EMR
      # is registered with. Amazon EMR uses virtual clusters to run jobs and host endpoints. Multiple
      # virtual clusters can be backed by the same physical cluster. However, each virtual cluster maps to
      # one namespace on an Amazon EKS cluster. Virtual clusters do not create any active resources that
      # contribute to your bill or that require lifecycle management outside the service.

      struct VirtualCluster
        include JSON::Serializable

        # The ARN of the virtual cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The container provider of the virtual cluster.

        @[JSON::Field(key: "containerProvider")]
        getter container_provider : Types::ContainerProvider?

        # The date and time when the virtual cluster is created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the virtual cluster.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the virtual cluster.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the security configuration.

        @[JSON::Field(key: "securityConfigurationId")]
        getter security_configuration_id : String?

        # The state of the virtual cluster.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The assigned tags of the virtual cluster.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @container_provider : Types::ContainerProvider? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @security_configuration_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
