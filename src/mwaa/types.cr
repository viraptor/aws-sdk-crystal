require "json"
require "time"

module Aws
  module MWAA
    module Types

      # Access to the Apache Airflow Web UI or CLI has been denied due to insufficient permissions. To learn
      # more, see Accessing an Amazon MWAA environment .

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateCliTokenRequest
        include JSON::Serializable

        # The name of the Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct CreateCliTokenResponse
        include JSON::Serializable

        # An Airflow CLI login token.

        @[JSON::Field(key: "CliToken")]
        getter cli_token : String?

        # The Airflow web server hostname for the environment.

        @[JSON::Field(key: "WebServerHostname")]
        getter web_server_hostname : String?

        def initialize(
          @cli_token : String? = nil,
          @web_server_hostname : String? = nil
        )
        end
      end

      # This section contains the Amazon Managed Workflows for Apache Airflow (Amazon MWAA) API reference
      # documentation to create an environment. For more information, see Get started with Amazon Managed
      # Workflows for Apache Airflow .

      struct CreateEnvironmentInput
        include JSON::Serializable

        # The relative path to the DAGs folder on your Amazon S3 bucket. For example, dags . For more
        # information, see Adding or updating DAGs .

        @[JSON::Field(key: "DagS3Path")]
        getter dag_s3_path : String

        # The Amazon Resource Name (ARN) of the execution role for your environment. An execution role is an
        # Amazon Web Services Identity and Access Management (IAM) role that grants MWAA permission to access
        # Amazon Web Services services and resources used by your environment. For example,
        # arn:aws:iam::123456789:role/my-execution-role . For more information, see Amazon MWAA Execution role
        # .

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # The name of the Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The VPC networking components used to secure and enable network traffic between the Amazon Web
        # Services resources for your environment. For more information, see About networking on Amazon MWAA .

        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration

        # The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code and supporting files are
        # stored. For example, arn:aws:s3:::my-airflow-bucket-unique-name . For more information, see Create
        # an Amazon S3 bucket for Amazon MWAA .

        @[JSON::Field(key: "SourceBucketArn")]
        getter source_bucket_arn : String

        # A list of key-value pairs containing the Apache Airflow configuration options you want to attach to
        # your environment. For more information, see Apache Airflow configuration options .

        @[JSON::Field(key: "AirflowConfigurationOptions")]
        getter airflow_configuration_options : Hash(String, String)?

        # The Apache Airflow version for your environment. If no value is specified, it defaults to the latest
        # version. For more information, see Apache Airflow versions on Amazon Managed Workflows for Apache
        # Airflow (Amazon MWAA) . Valid values: 1.10.12 , 2.0.2 , 2.2.2 , 2.4.3 , 2.5.1 , 2.6.3 , 2.7.2 ,
        # 2.8.1 , 2.9.2 , 2.10.1 , and 2.10.3 .

        @[JSON::Field(key: "AirflowVersion")]
        getter airflow_version : String?

        # Defines whether the VPC endpoints configured for the environment are created, and managed, by the
        # customer or by Amazon MWAA. If set to SERVICE , Amazon MWAA will create and manage the required VPC
        # endpoints in your VPC. If set to CUSTOMER , you must create, and manage, the VPC endpoints for your
        # VPC. If you choose to create an environment in a shared VPC, you must set this value to CUSTOMER .
        # In a shared VPC deployment, the environment will remain in PENDING status until you create the VPC
        # endpoints. If you do not take action to create the endpoints within 72 hours, the status will change
        # to CREATE_FAILED . You can delete the failed environment and create a new one.

        @[JSON::Field(key: "EndpointManagement")]
        getter endpoint_management : String?

        # The environment class type. Valid values: mw1.micro , mw1.small , mw1.medium , mw1.large ,
        # mw1.xlarge , and mw1.2xlarge . For more information, see Amazon MWAA environment class .

        @[JSON::Field(key: "EnvironmentClass")]
        getter environment_class : String?

        # The Amazon Web Services Key Management Service (KMS) key to encrypt the data in your environment.
        # You can use an Amazon Web Services owned CMK, or a Customer managed CMK (advanced). For more
        # information, see Create an Amazon MWAA environment .

        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String?

        # Defines the Apache Airflow logs to send to CloudWatch Logs.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfigurationInput?

        # The maximum number of web servers that you want to run in your environment. Amazon MWAA scales the
        # number of Apache Airflow web servers up to the number you specify for MaxWebservers when you
        # interact with your Apache Airflow environment using Apache Airflow REST API, or the Apache Airflow
        # CLI. For example, in scenarios where your workload requires network calls to the Apache Airflow REST
        # API with a high transaction-per-second (TPS) rate, Amazon MWAA will increase the number of web
        # servers up to the number set in MaxWebserers . As TPS rates decrease Amazon MWAA disposes of the
        # additional web servers, and scales down to the number set in MinxWebserers . Valid values: For
        # environments larger than mw1.micro, accepts values from 2 to 5 . Defaults to 2 for all environment
        # sizes except mw1.micro, which defaults to 1 .

        @[JSON::Field(key: "MaxWebservers")]
        getter max_webservers : Int32?

        # The maximum number of workers that you want to run in your environment. MWAA scales the number of
        # Apache Airflow workers up to the number you specify in the MaxWorkers field. For example, 20 . When
        # there are no more tasks running, and no more in the queue, MWAA disposes of the extra workers
        # leaving the one worker that is included with your environment, or the number you specify in
        # MinWorkers .

        @[JSON::Field(key: "MaxWorkers")]
        getter max_workers : Int32?

        # The minimum number of web servers that you want to run in your environment. Amazon MWAA scales the
        # number of Apache Airflow web servers up to the number you specify for MaxWebservers when you
        # interact with your Apache Airflow environment using Apache Airflow REST API, or the Apache Airflow
        # CLI. As the transaction-per-second rate, and the network load, decrease, Amazon MWAA disposes of the
        # additional web servers, and scales down to the number set in MinxWebserers . Valid values: For
        # environments larger than mw1.micro, accepts values from 2 to 5 . Defaults to 2 for all environment
        # sizes except mw1.micro, which defaults to 1 .

        @[JSON::Field(key: "MinWebservers")]
        getter min_webservers : Int32?

        # The minimum number of workers that you want to run in your environment. MWAA scales the number of
        # Apache Airflow workers up to the number you specify in the MaxWorkers field. When there are no more
        # tasks running, and no more in the queue, MWAA disposes of the extra workers leaving the worker count
        # you specify in the MinWorkers field. For example, 2 .

        @[JSON::Field(key: "MinWorkers")]
        getter min_workers : Int32?

        # The version of the plugins.zip file on your Amazon S3 bucket. You must specify a version each time a
        # plugins.zip file is updated. For more information, see How S3 Versioning works .

        @[JSON::Field(key: "PluginsS3ObjectVersion")]
        getter plugins_s3_object_version : String?

        # The relative path to the plugins.zip file on your Amazon S3 bucket. For example, plugins.zip . If
        # specified, then the plugins.zip version is required. For more information, see Installing custom
        # plugins .

        @[JSON::Field(key: "PluginsS3Path")]
        getter plugins_s3_path : String?

        # The version of the requirements.txt file on your Amazon S3 bucket. You must specify a version each
        # time a requirements.txt file is updated. For more information, see How S3 Versioning works .

        @[JSON::Field(key: "RequirementsS3ObjectVersion")]
        getter requirements_s3_object_version : String?

        # The relative path to the requirements.txt file on your Amazon S3 bucket. For example,
        # requirements.txt . If specified, then a version is required. For more information, see Installing
        # Python dependencies .

        @[JSON::Field(key: "RequirementsS3Path")]
        getter requirements_s3_path : String?

        # The number of Apache Airflow schedulers to run in your environment. Valid values: v2 - For
        # environments larger than mw1.micro, accepts values from 2 to 5 . Defaults to 2 for all environment
        # sizes except mw1.micro, which defaults to 1 . v1 - Accepts 1 .

        @[JSON::Field(key: "Schedulers")]
        getter schedulers : Int32?

        # The version of the startup shell script in your Amazon S3 bucket. You must specify the version ID
        # that Amazon S3 assigns to the file every time you update the script. Version IDs are Unicode, UTF-8
        # encoded, URL-ready, opaque strings that are no more than 1,024 bytes long. The following is an
        # example: 3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo For more information, see
        # Using a startup script .

        @[JSON::Field(key: "StartupScriptS3ObjectVersion")]
        getter startup_script_s3_object_version : String?

        # The relative path to the startup shell script in your Amazon S3 bucket. For example,
        # s3://mwaa-environment/startup.sh . Amazon MWAA runs the script as your environment starts, and
        # before running the Apache Airflow process. You can use this script to install dependencies, modify
        # Apache Airflow configuration options, and set environment variables. For more information, see Using
        # a startup script .

        @[JSON::Field(key: "StartupScriptS3Path")]
        getter startup_script_s3_path : String?

        # The key-value tag pairs you want to associate to your environment. For example, "Environment":
        # "Staging" . For more information, see Tagging Amazon Web Services resources .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Defines the access mode for the Apache Airflow web server . For more information, see Apache Airflow
        # access modes .

        @[JSON::Field(key: "WebserverAccessMode")]
        getter webserver_access_mode : String?

        # The day and time of the week in Coordinated Universal Time (UTC) 24-hour standard time to start
        # weekly maintenance updates of your environment in the following format: DAY:HH:MM . For example:
        # TUE:03:30 . You can specify a start time in 30 minute increments only.

        @[JSON::Field(key: "WeeklyMaintenanceWindowStart")]
        getter weekly_maintenance_window_start : String?

        def initialize(
          @dag_s3_path : String,
          @execution_role_arn : String,
          @name : String,
          @network_configuration : Types::NetworkConfiguration,
          @source_bucket_arn : String,
          @airflow_configuration_options : Hash(String, String)? = nil,
          @airflow_version : String? = nil,
          @endpoint_management : String? = nil,
          @environment_class : String? = nil,
          @kms_key : String? = nil,
          @logging_configuration : Types::LoggingConfigurationInput? = nil,
          @max_webservers : Int32? = nil,
          @max_workers : Int32? = nil,
          @min_webservers : Int32? = nil,
          @min_workers : Int32? = nil,
          @plugins_s3_object_version : String? = nil,
          @plugins_s3_path : String? = nil,
          @requirements_s3_object_version : String? = nil,
          @requirements_s3_path : String? = nil,
          @schedulers : Int32? = nil,
          @startup_script_s3_object_version : String? = nil,
          @startup_script_s3_path : String? = nil,
          @tags : Hash(String, String)? = nil,
          @webserver_access_mode : String? = nil,
          @weekly_maintenance_window_start : String? = nil
        )
        end
      end


      struct CreateEnvironmentOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) returned in the response for the environment.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct CreateWebLoginTokenRequest
        include JSON::Serializable

        # The name of the Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct CreateWebLoginTokenResponse
        include JSON::Serializable

        # The user name of the Apache Airflow identity creating the web login token.

        @[JSON::Field(key: "AirflowIdentity")]
        getter airflow_identity : String?

        # The name of the IAM identity creating the web login token. This might be an IAM user, or an assumed
        # or federated identity. For example, assumed-role/Admin/your-name .

        @[JSON::Field(key: "IamIdentity")]
        getter iam_identity : String?

        # The Airflow web server hostname for the environment.

        @[JSON::Field(key: "WebServerHostname")]
        getter web_server_hostname : String?

        # An Airflow web server login token.

        @[JSON::Field(key: "WebToken")]
        getter web_token : String?

        def initialize(
          @airflow_identity : String? = nil,
          @iam_identity : String? = nil,
          @web_server_hostname : String? = nil,
          @web_token : String? = nil
        )
        end
      end


      struct DeleteEnvironmentInput
        include JSON::Serializable

        # The name of the Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteEnvironmentOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Internal only . Represents the dimensions of a metric. To learn more about the metrics published to
      # Amazon CloudWatch, see Amazon MWAA performance metrics in Amazon CloudWatch .

      struct Dimension
        include JSON::Serializable

        # Internal only . The name of the dimension.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Internal only . The value of the dimension.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

      struct Environment
        include JSON::Serializable

        # A list of key-value pairs containing the Apache Airflow configuration options attached to your
        # environment. For more information, see Apache Airflow configuration options .

        @[JSON::Field(key: "AirflowConfigurationOptions")]
        getter airflow_configuration_options : Hash(String, String)?

        # The Apache Airflow version on your environment. Valid values: 1.10.12 , 2.0.2 , 2.2.2 , 2.4.3 ,
        # 2.5.1 , 2.6.3 , 2.7.2 , 2.8.1 , 2.9.2 , 2.10.1 , and 2.10.3 .

        @[JSON::Field(key: "AirflowVersion")]
        getter airflow_version : String?

        # The Amazon Resource Name (ARN) of the Amazon MWAA environment.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The queue ARN for the environment's Celery Executor . Amazon MWAA uses a Celery Executor to
        # distribute tasks across multiple workers. When you create an environment in a shared VPC, you must
        # provide access to the Celery Executor queue from your VPC.

        @[JSON::Field(key: "CeleryExecutorQueue")]
        getter celery_executor_queue : String?

        # The day and time the environment was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The relative path to the DAGs folder in your Amazon S3 bucket. For example,
        # s3://mwaa-environment/dags . For more information, see Adding or updating DAGs .

        @[JSON::Field(key: "DagS3Path")]
        getter dag_s3_path : String?

        # The VPC endpoint for the environment's Amazon RDS database.

        @[JSON::Field(key: "DatabaseVpcEndpointService")]
        getter database_vpc_endpoint_service : String?

        # Defines whether the VPC endpoints configured for the environment are created, and managed, by the
        # customer or by Amazon MWAA. If set to SERVICE , Amazon MWAA will create and manage the required VPC
        # endpoints in your VPC. If set to CUSTOMER , you must create, and manage, the VPC endpoints in your
        # VPC.

        @[JSON::Field(key: "EndpointManagement")]
        getter endpoint_management : String?

        # The environment class type. Valid values: mw1.micro , mw1.small , mw1.medium , mw1.large ,
        # mw1.xlarge , and mw1.2xlarge . For more information, see Amazon MWAA environment class .

        @[JSON::Field(key: "EnvironmentClass")]
        getter environment_class : String?

        # The Amazon Resource Name (ARN) of the execution role in IAM that allows MWAA to access Amazon Web
        # Services resources in your environment. For example, arn:aws:iam::123456789:role/my-execution-role .
        # For more information, see Amazon MWAA Execution role .

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The KMS encryption key used to encrypt the data in your environment.

        @[JSON::Field(key: "KmsKey")]
        getter kms_key : String?

        # The status of the last update on the environment.

        @[JSON::Field(key: "LastUpdate")]
        getter last_update : Types::LastUpdate?

        # The Apache Airflow logs published to CloudWatch Logs.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # The maximum number of web servers that you want to run in your environment. Amazon MWAA scales the
        # number of Apache Airflow web servers up to the number you specify for MaxWebservers when you
        # interact with your Apache Airflow environment using Apache Airflow REST API, or the Apache Airflow
        # CLI. For example, in scenarios where your workload requires network calls to the Apache Airflow REST
        # API with a high transaction-per-second (TPS) rate, Amazon MWAA will increase the number of web
        # servers up to the number set in MaxWebserers . As TPS rates decrease Amazon MWAA disposes of the
        # additional web servers, and scales down to the number set in MinxWebserers . Valid values: For
        # environments larger than mw1.micro, accepts values from 2 to 5 . Defaults to 2 for all environment
        # sizes except mw1.micro, which defaults to 1 .

        @[JSON::Field(key: "MaxWebservers")]
        getter max_webservers : Int32?

        # The maximum number of workers that run in your environment. For example, 20 .

        @[JSON::Field(key: "MaxWorkers")]
        getter max_workers : Int32?

        # The minimum number of web servers that you want to run in your environment. Amazon MWAA scales the
        # number of Apache Airflow web servers up to the number you specify for MaxWebservers when you
        # interact with your Apache Airflow environment using Apache Airflow REST API, or the Apache Airflow
        # CLI. As the transaction-per-second rate, and the network load, decrease, Amazon MWAA disposes of the
        # additional web servers, and scales down to the number set in MinxWebserers . Valid values: For
        # environments larger than mw1.micro, accepts values from 2 to 5 . Defaults to 2 for all environment
        # sizes except mw1.micro, which defaults to 1 .

        @[JSON::Field(key: "MinWebservers")]
        getter min_webservers : Int32?

        # The minimum number of workers that run in your environment. For example, 2 .

        @[JSON::Field(key: "MinWorkers")]
        getter min_workers : Int32?

        # The name of the Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Describes the VPC networking components used to secure and enable network traffic between the Amazon
        # Web Services resources for your environment. For more information, see About networking on Amazon
        # MWAA .

        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The version of the plugins.zip file in your Amazon S3 bucket. You must specify the version ID that
        # Amazon S3 assigns to the file. Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque strings
        # that are no more than 1,024 bytes long. The following is an example:
        # 3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo For more information, see
        # Installing custom plugins .

        @[JSON::Field(key: "PluginsS3ObjectVersion")]
        getter plugins_s3_object_version : String?

        # The relative path to the file in your Amazon S3 bucket. For example,
        # s3://mwaa-environment/plugins.zip . For more information, see Installing custom plugins .

        @[JSON::Field(key: "PluginsS3Path")]
        getter plugins_s3_path : String?

        # The version of the requirements.txt file on your Amazon S3 bucket. You must specify the version ID
        # that Amazon S3 assigns to the file. Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque
        # strings that are no more than 1,024 bytes long. The following is an example:
        # 3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo For more information, see
        # Installing Python dependencies .

        @[JSON::Field(key: "RequirementsS3ObjectVersion")]
        getter requirements_s3_object_version : String?

        # The relative path to the requirements.txt file in your Amazon S3 bucket. For example,
        # s3://mwaa-environment/requirements.txt . For more information, see Installing Python dependencies .

        @[JSON::Field(key: "RequirementsS3Path")]
        getter requirements_s3_path : String?

        # The number of Apache Airflow schedulers that run in your Amazon MWAA environment.

        @[JSON::Field(key: "Schedulers")]
        getter schedulers : Int32?

        # The Amazon Resource Name (ARN) for the service-linked role of the environment. For more information,
        # see Amazon MWAA Service-linked role .

        @[JSON::Field(key: "ServiceRoleArn")]
        getter service_role_arn : String?

        # The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code and supporting files are
        # stored. For example, arn:aws:s3:::my-airflow-bucket-unique-name . For more information, see Create
        # an Amazon S3 bucket for Amazon MWAA .

        @[JSON::Field(key: "SourceBucketArn")]
        getter source_bucket_arn : String?

        # The version of the startup shell script in your Amazon S3 bucket. You must specify the version ID
        # that Amazon S3 assigns to the file. Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque
        # strings that are no more than 1,024 bytes long. The following is an example:
        # 3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo For more information, see Using a
        # startup script .

        @[JSON::Field(key: "StartupScriptS3ObjectVersion")]
        getter startup_script_s3_object_version : String?

        # The relative path to the startup shell script in your Amazon S3 bucket. For example,
        # s3://mwaa-environment/startup.sh . Amazon MWAA runs the script as your environment starts, and
        # before running the Apache Airflow process. You can use this script to install dependencies, modify
        # Apache Airflow configuration options, and set environment variables. For more information, see Using
        # a startup script .

        @[JSON::Field(key: "StartupScriptS3Path")]
        getter startup_script_s3_path : String?

        # The status of the Amazon MWAA environment. Valid values: CREATING - Indicates the request to create
        # the environment is in progress. CREATING_SNAPSHOT - Indicates the request to update environment
        # details, or upgrade the environment version, is in progress and Amazon MWAA is creating a storage
        # volume snapshot of the Amazon RDS database cluster associated with the environment. A database
        # snapshot is a backup created at a specific point in time. Amazon MWAA uses snapshots to recover
        # environment metadata if the process to update or upgrade an environment fails. CREATE_FAILED -
        # Indicates the request to create the environment failed, and the environment could not be created.
        # AVAILABLE - Indicates the request was successful and the environment is ready to use. PENDING -
        # Indicates the request was successful, but the process to create the environment is paused until you
        # create the required VPC endpoints in your VPC. After you create the VPC endpoints, the process
        # resumes. UPDATING - Indicates the request to update the environment is in progress. ROLLING_BACK -
        # Indicates the request to update environment details, or upgrade the environment version, failed and
        # Amazon MWAA is restoring the environment using the latest storage volume snapshot. DELETING -
        # Indicates the request to delete the environment is in progress. DELETED - Indicates the request to
        # delete the environment is complete, and the environment has been deleted. UNAVAILABLE - Indicates
        # the request failed, but the environment did not return to its previous state and is not stable.
        # UPDATE_FAILED - Indicates the request to update the environment failed, and the environment was
        # restored to its previous state successfully and is ready to use. MAINTENANCE - Indicates that the
        # environment is undergoing maintenance. Depending on the type of work Amazon MWAA is performing, your
        # environment might become unavailable during this process. After all operations are done, your
        # environment will return to its status prior to mainteneace operations. We recommend reviewing our
        # troubleshooting guide for a list of common errors and their solutions. For more information, see
        # Amazon MWAA troubleshooting .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The key-value tag pairs associated to your environment. For example, "Environment": "Staging" . For
        # more information, see Tagging Amazon Web Services resources .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The Apache Airflow web server access mode. For more information, see Apache Airflow access modes .

        @[JSON::Field(key: "WebserverAccessMode")]
        getter webserver_access_mode : String?

        # The Apache Airflow web server host name for the Amazon MWAA environment. For more information, see
        # Accessing the Apache Airflow UI .

        @[JSON::Field(key: "WebserverUrl")]
        getter webserver_url : String?

        # The VPC endpoint for the environment's web server.

        @[JSON::Field(key: "WebserverVpcEndpointService")]
        getter webserver_vpc_endpoint_service : String?

        # The day and time of the week in Coordinated Universal Time (UTC) 24-hour standard time that weekly
        # maintenance updates are scheduled. For example: TUE:03:30 .

        @[JSON::Field(key: "WeeklyMaintenanceWindowStart")]
        getter weekly_maintenance_window_start : String?

        def initialize(
          @airflow_configuration_options : Hash(String, String)? = nil,
          @airflow_version : String? = nil,
          @arn : String? = nil,
          @celery_executor_queue : String? = nil,
          @created_at : Time? = nil,
          @dag_s3_path : String? = nil,
          @database_vpc_endpoint_service : String? = nil,
          @endpoint_management : String? = nil,
          @environment_class : String? = nil,
          @execution_role_arn : String? = nil,
          @kms_key : String? = nil,
          @last_update : Types::LastUpdate? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @max_webservers : Int32? = nil,
          @max_workers : Int32? = nil,
          @min_webservers : Int32? = nil,
          @min_workers : Int32? = nil,
          @name : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @plugins_s3_object_version : String? = nil,
          @plugins_s3_path : String? = nil,
          @requirements_s3_object_version : String? = nil,
          @requirements_s3_path : String? = nil,
          @schedulers : Int32? = nil,
          @service_role_arn : String? = nil,
          @source_bucket_arn : String? = nil,
          @startup_script_s3_object_version : String? = nil,
          @startup_script_s3_path : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @webserver_access_mode : String? = nil,
          @webserver_url : String? = nil,
          @webserver_vpc_endpoint_service : String? = nil,
          @weekly_maintenance_window_start : String? = nil
        )
        end
      end


      struct GetEnvironmentInput
        include JSON::Serializable

        # The name of the Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetEnvironmentOutput
        include JSON::Serializable

        # An object containing all available details about the environment.

        @[JSON::Field(key: "Environment")]
        getter environment : Types::Environment?

        def initialize(
          @environment : Types::Environment? = nil
        )
        end
      end

      # InternalServerException: An internal error has occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InvokeRestApiRequest
        include JSON::Serializable

        # The HTTP method used for making Airflow REST API calls. For example, POST .

        @[JSON::Field(key: "Method")]
        getter method : String

        # The name of the Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Apache Airflow REST API endpoint path to be called. For example, /dags/123456/clearTaskInstances
        # . For more information, see Apache Airflow API

        @[JSON::Field(key: "Path")]
        getter path : String

        # The request body for the Apache Airflow REST API call, provided as a JSON object.

        @[JSON::Field(key: "Body")]
        getter body : Types::RestApiRequestBody?

        # Query parameters to be included in the Apache Airflow REST API call, provided as a JSON object.

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Types::Document?

        def initialize(
          @method : String,
          @name : String,
          @path : String,
          @body : Types::RestApiRequestBody? = nil,
          @query_parameters : Types::Document? = nil
        )
        end
      end


      struct InvokeRestApiResponse
        include JSON::Serializable

        # The response data from the Apache Airflow REST API call, provided as a JSON object.

        @[JSON::Field(key: "RestApiResponse")]
        getter rest_api_response : Types::RestApiResponse?

        # The HTTP status code returned by the Apache Airflow REST API call.

        @[JSON::Field(key: "RestApiStatusCode")]
        getter rest_api_status_code : Int32?

        def initialize(
          @rest_api_response : Types::RestApiResponse? = nil,
          @rest_api_status_code : Int32? = nil
        )
        end
      end

      # Describes the status of the last update on the environment, and any errors that were encountered.

      struct LastUpdate
        include JSON::Serializable

        # The day and time of the last update on the environment.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The error that was encountered during the last update of the environment.

        @[JSON::Field(key: "Error")]
        getter error : Types::UpdateError?

        # The source of the last update to the environment. Includes internal processes by Amazon MWAA, such
        # as an environment maintenance update.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The status of the last update on the environment.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The worker replacement strategy used in the last update of the environment.

        @[JSON::Field(key: "WorkerReplacementStrategy")]
        getter worker_replacement_strategy : String?

        def initialize(
          @created_at : Time? = nil,
          @error : Types::UpdateError? = nil,
          @source : String? = nil,
          @status : String? = nil,
          @worker_replacement_strategy : String? = nil
        )
        end
      end


      struct ListEnvironmentsInput
        include JSON::Serializable

        # The maximum number of results to retrieve per page. For example, 5 environments per page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Retrieves the next page of the results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsOutput
        include JSON::Serializable

        # Returns a list of Amazon MWAA environments.

        @[JSON::Field(key: "Environments")]
        getter environments : Array(String)

        # Retrieves the next page of the results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon MWAA environment. For example,
        # arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The key-value tag pairs associated to your environment. For more information, see Tagging Amazon Web
        # Services resources .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes the Apache Airflow log types that are published to CloudWatch Logs.

      struct LoggingConfiguration
        include JSON::Serializable

        # The Airflow DAG processing logs published to CloudWatch Logs and the log level.

        @[JSON::Field(key: "DagProcessingLogs")]
        getter dag_processing_logs : Types::ModuleLoggingConfiguration?

        # The Airflow scheduler logs published to CloudWatch Logs and the log level.

        @[JSON::Field(key: "SchedulerLogs")]
        getter scheduler_logs : Types::ModuleLoggingConfiguration?

        # The Airflow task logs published to CloudWatch Logs and the log level.

        @[JSON::Field(key: "TaskLogs")]
        getter task_logs : Types::ModuleLoggingConfiguration?

        # The Airflow web server logs published to CloudWatch Logs and the log level.

        @[JSON::Field(key: "WebserverLogs")]
        getter webserver_logs : Types::ModuleLoggingConfiguration?

        # The Airflow worker logs published to CloudWatch Logs and the log level.

        @[JSON::Field(key: "WorkerLogs")]
        getter worker_logs : Types::ModuleLoggingConfiguration?

        def initialize(
          @dag_processing_logs : Types::ModuleLoggingConfiguration? = nil,
          @scheduler_logs : Types::ModuleLoggingConfiguration? = nil,
          @task_logs : Types::ModuleLoggingConfiguration? = nil,
          @webserver_logs : Types::ModuleLoggingConfiguration? = nil,
          @worker_logs : Types::ModuleLoggingConfiguration? = nil
        )
        end
      end

      # Defines the Apache Airflow log types to send to CloudWatch Logs.

      struct LoggingConfigurationInput
        include JSON::Serializable

        # Publishes Airflow DAG processing logs to CloudWatch Logs.

        @[JSON::Field(key: "DagProcessingLogs")]
        getter dag_processing_logs : Types::ModuleLoggingConfigurationInput?

        # Publishes Airflow scheduler logs to CloudWatch Logs.

        @[JSON::Field(key: "SchedulerLogs")]
        getter scheduler_logs : Types::ModuleLoggingConfigurationInput?

        # Publishes Airflow task logs to CloudWatch Logs.

        @[JSON::Field(key: "TaskLogs")]
        getter task_logs : Types::ModuleLoggingConfigurationInput?

        # Publishes Airflow web server logs to CloudWatch Logs.

        @[JSON::Field(key: "WebserverLogs")]
        getter webserver_logs : Types::ModuleLoggingConfigurationInput?

        # Publishes Airflow worker logs to CloudWatch Logs.

        @[JSON::Field(key: "WorkerLogs")]
        getter worker_logs : Types::ModuleLoggingConfigurationInput?

        def initialize(
          @dag_processing_logs : Types::ModuleLoggingConfigurationInput? = nil,
          @scheduler_logs : Types::ModuleLoggingConfigurationInput? = nil,
          @task_logs : Types::ModuleLoggingConfigurationInput? = nil,
          @webserver_logs : Types::ModuleLoggingConfigurationInput? = nil,
          @worker_logs : Types::ModuleLoggingConfigurationInput? = nil
        )
        end
      end

      # Internal only . Collects Apache Airflow metrics. To learn more about the metrics published to Amazon
      # CloudWatch, see Amazon MWAA performance metrics in Amazon CloudWatch .

      struct MetricDatum
        include JSON::Serializable

        # Internal only . The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # Internal only . The time the metric data was received.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # Internal only . The dimensions associated with the metric.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        # Internal only . The statistical values for the metric.

        @[JSON::Field(key: "StatisticValues")]
        getter statistic_values : Types::StatisticSet?

        # Internal only . The unit used to store the metric.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # Internal only . The value for the metric.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @metric_name : String,
          @timestamp : Time,
          @dimensions : Array(Types::Dimension)? = nil,
          @statistic_values : Types::StatisticSet? = nil,
          @unit : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Describes the Apache Airflow log details for the log type (e.g. DagProcessingLogs ).

      struct ModuleLoggingConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the CloudWatch Logs group where the Apache Airflow log type (e.g.
        # DagProcessingLogs ) is published. For example,
        # arn:aws:logs:us-east-1:123456789012:log-group:airflow-MyMWAAEnvironment-MwaaEnvironment-DAGProcessing:*
        # .

        @[JSON::Field(key: "CloudWatchLogGroupArn")]
        getter cloud_watch_log_group_arn : String?

        # Indicates whether the Apache Airflow log type (e.g. DagProcessingLogs ) is enabled.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The Apache Airflow log level for the log type (e.g. DagProcessingLogs ).

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String?

        def initialize(
          @cloud_watch_log_group_arn : String? = nil,
          @enabled : Bool? = nil,
          @log_level : String? = nil
        )
        end
      end

      # Enables the Apache Airflow log type (e.g. DagProcessingLogs ) and defines the log level to send to
      # CloudWatch Logs (e.g. INFO ).

      struct ModuleLoggingConfigurationInput
        include JSON::Serializable

        # Indicates whether to enable the Apache Airflow log type (e.g. DagProcessingLogs ).

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Defines the Apache Airflow log level (e.g. INFO ) to send to CloudWatch Logs.

        @[JSON::Field(key: "LogLevel")]
        getter log_level : String

        def initialize(
          @enabled : Bool,
          @log_level : String
        )
        end
      end

      # Describes the VPC networking components used to secure and enable network traffic between the Amazon
      # Web Services resources for your environment. For more information, see About networking on Amazon
      # MWAA .

      struct NetworkConfiguration
        include JSON::Serializable

        # A list of security group IDs. For more information, see Security in your VPC on Amazon MWAA .

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of subnet IDs. For more information, see About networking on Amazon MWAA .

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end


      struct PublishMetricsInput
        include JSON::Serializable

        # Internal only . The name of the environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String

        # Internal only . Publishes metrics to Amazon CloudWatch. To learn more about the metrics published to
        # Amazon CloudWatch, see Amazon MWAA performance metrics in Amazon CloudWatch .

        @[JSON::Field(key: "MetricData")]
        getter metric_data : Array(Types::MetricDatum)

        def initialize(
          @environment_name : String,
          @metric_data : Array(Types::MetricDatum)
        )
        end
      end


      struct PublishMetricsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # ResourceNotFoundException: The resource is not available.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An exception indicating that a client-side error occurred during the Apache Airflow REST API call.

      struct RestApiClientException
        include JSON::Serializable

        # The error response data from the Apache Airflow REST API call, provided as a JSON object.

        @[JSON::Field(key: "RestApiResponse")]
        getter rest_api_response : Types::RestApiResponse?

        # The HTTP status code returned by the Apache Airflow REST API call.

        @[JSON::Field(key: "RestApiStatusCode")]
        getter rest_api_status_code : Int32?

        def initialize(
          @rest_api_response : Types::RestApiResponse? = nil,
          @rest_api_status_code : Int32? = nil
        )
        end
      end


      struct RestApiRequestBody
        include JSON::Serializable

        def initialize
        end
      end


      struct RestApiResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An exception indicating that a server-side error occurred during the Apache Airflow REST API call.

      struct RestApiServerException
        include JSON::Serializable

        # The error response data from the Apache Airflow REST API call, provided as a JSON object.

        @[JSON::Field(key: "RestApiResponse")]
        getter rest_api_response : Types::RestApiResponse?

        # The HTTP status code returned by the Apache Airflow REST API call.

        @[JSON::Field(key: "RestApiStatusCode")]
        getter rest_api_status_code : Int32?

        def initialize(
          @rest_api_response : Types::RestApiResponse? = nil,
          @rest_api_status_code : Int32? = nil
        )
        end
      end

      # Internal only . Represents a set of statistics that describe a specific metric. To learn more about
      # the metrics published to Amazon CloudWatch, see Amazon MWAA performance metrics in Amazon CloudWatch
      # .

      struct StatisticSet
        include JSON::Serializable

        # Internal only . The maximum value of the sample set.

        @[JSON::Field(key: "Maximum")]
        getter maximum : Float64?

        # Internal only . The minimum value of the sample set.

        @[JSON::Field(key: "Minimum")]
        getter minimum : Float64?

        # Internal only . The number of samples used for the statistic set.

        @[JSON::Field(key: "SampleCount")]
        getter sample_count : Int32?

        # Internal only . The sum of values for the sample set.

        @[JSON::Field(key: "Sum")]
        getter sum : Float64?

        def initialize(
          @maximum : Float64? = nil,
          @minimum : Float64? = nil,
          @sample_count : Int32? = nil,
          @sum : Float64? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon MWAA environment. For example,
        # arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The key-value tag pairs you want to associate to your environment. For example, "Environment":
        # "Staging" . For more information, see Tagging Amazon Web Services resources .

        @[JSON::Field(key: "Tags")]
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


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon MWAA environment. For example,
        # arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The key-value tag pair you want to remove. For example, "Environment": "Staging" .

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


      struct UpdateEnvironmentInput
        include JSON::Serializable

        # The name of your Amazon MWAA environment. For example, MyMWAAEnvironment .

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of key-value pairs containing the Apache Airflow configuration options you want to attach to
        # your environment. For more information, see Apache Airflow configuration options .

        @[JSON::Field(key: "AirflowConfigurationOptions")]
        getter airflow_configuration_options : Hash(String, String)?

        # The Apache Airflow version for your environment. To upgrade your environment, specify a newer
        # version of Apache Airflow supported by Amazon MWAA. Before you upgrade an environment, make sure
        # your requirements, DAGs, plugins, and other resources used in your workflows are compatible with the
        # new Apache Airflow version. For more information about updating your resources, see Upgrading an
        # Amazon MWAA environment . Valid values: 1.10.12 , 2.0.2 , 2.2.2 , 2.4.3 , 2.5.1 , 2.6.3 , 2.7.2 ,
        # 2.8.1 , 2.9.2 , 2.10.1 , and 2.10.3 .

        @[JSON::Field(key: "AirflowVersion")]
        getter airflow_version : String?

        # The relative path to the DAGs folder on your Amazon S3 bucket. For example, dags . For more
        # information, see Adding or updating DAGs .

        @[JSON::Field(key: "DagS3Path")]
        getter dag_s3_path : String?

        # The environment class type. Valid values: mw1.micro , mw1.small , mw1.medium , mw1.large ,
        # mw1.xlarge , and mw1.2xlarge . For more information, see Amazon MWAA environment class .

        @[JSON::Field(key: "EnvironmentClass")]
        getter environment_class : String?

        # The Amazon Resource Name (ARN) of the execution role in IAM that allows MWAA to access Amazon Web
        # Services resources in your environment. For example, arn:aws:iam::123456789:role/my-execution-role .
        # For more information, see Amazon MWAA Execution role .

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The Apache Airflow log types to send to CloudWatch Logs.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfigurationInput?

        # The maximum number of web servers that you want to run in your environment. Amazon MWAA scales the
        # number of Apache Airflow web servers up to the number you specify for MaxWebservers when you
        # interact with your Apache Airflow environment using Apache Airflow REST API, or the Apache Airflow
        # CLI. For example, in scenarios where your workload requires network calls to the Apache Airflow REST
        # API with a high transaction-per-second (TPS) rate, Amazon MWAA will increase the number of web
        # servers up to the number set in MaxWebserers . As TPS rates decrease Amazon MWAA disposes of the
        # additional web servers, and scales down to the number set in MinxWebserers . Valid values: For
        # environments larger than mw1.micro, accepts values from 2 to 5 . Defaults to 2 for all environment
        # sizes except mw1.micro, which defaults to 1 .

        @[JSON::Field(key: "MaxWebservers")]
        getter max_webservers : Int32?

        # The maximum number of workers that you want to run in your environment. MWAA scales the number of
        # Apache Airflow workers up to the number you specify in the MaxWorkers field. For example, 20 . When
        # there are no more tasks running, and no more in the queue, MWAA disposes of the extra workers
        # leaving the one worker that is included with your environment, or the number you specify in
        # MinWorkers .

        @[JSON::Field(key: "MaxWorkers")]
        getter max_workers : Int32?

        # The minimum number of web servers that you want to run in your environment. Amazon MWAA scales the
        # number of Apache Airflow web servers up to the number you specify for MaxWebservers when you
        # interact with your Apache Airflow environment using Apache Airflow REST API, or the Apache Airflow
        # CLI. As the transaction-per-second rate, and the network load, decrease, Amazon MWAA disposes of the
        # additional web servers, and scales down to the number set in MinxWebserers . Valid values: For
        # environments larger than mw1.micro, accepts values from 2 to 5 . Defaults to 2 for all environment
        # sizes except mw1.micro, which defaults to 1 .

        @[JSON::Field(key: "MinWebservers")]
        getter min_webservers : Int32?

        # The minimum number of workers that you want to run in your environment. MWAA scales the number of
        # Apache Airflow workers up to the number you specify in the MaxWorkers field. When there are no more
        # tasks running, and no more in the queue, MWAA disposes of the extra workers leaving the worker count
        # you specify in the MinWorkers field. For example, 2 .

        @[JSON::Field(key: "MinWorkers")]
        getter min_workers : Int32?

        # The VPC networking components used to secure and enable network traffic between the Amazon Web
        # Services resources for your environment. For more information, see About networking on Amazon MWAA .

        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::UpdateNetworkConfigurationInput?

        # The version of the plugins.zip file on your Amazon S3 bucket. You must specify a version each time a
        # plugins.zip file is updated. For more information, see How S3 Versioning works .

        @[JSON::Field(key: "PluginsS3ObjectVersion")]
        getter plugins_s3_object_version : String?

        # The relative path to the plugins.zip file on your Amazon S3 bucket. For example, plugins.zip . If
        # specified, then the plugins.zip version is required. For more information, see Installing custom
        # plugins .

        @[JSON::Field(key: "PluginsS3Path")]
        getter plugins_s3_path : String?

        # The version of the requirements.txt file on your Amazon S3 bucket. You must specify a version each
        # time a requirements.txt file is updated. For more information, see How S3 Versioning works .

        @[JSON::Field(key: "RequirementsS3ObjectVersion")]
        getter requirements_s3_object_version : String?

        # The relative path to the requirements.txt file on your Amazon S3 bucket. For example,
        # requirements.txt . If specified, then a file version is required. For more information, see
        # Installing Python dependencies .

        @[JSON::Field(key: "RequirementsS3Path")]
        getter requirements_s3_path : String?

        # The number of Apache Airflow schedulers to run in your Amazon MWAA environment.

        @[JSON::Field(key: "Schedulers")]
        getter schedulers : Int32?

        # The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code and supporting files are
        # stored. For example, arn:aws:s3:::my-airflow-bucket-unique-name . For more information, see Create
        # an Amazon S3 bucket for Amazon MWAA .

        @[JSON::Field(key: "SourceBucketArn")]
        getter source_bucket_arn : String?

        # The version of the startup shell script in your Amazon S3 bucket. You must specify the version ID
        # that Amazon S3 assigns to the file every time you update the script. Version IDs are Unicode, UTF-8
        # encoded, URL-ready, opaque strings that are no more than 1,024 bytes long. The following is an
        # example: 3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo For more information, see
        # Using a startup script .

        @[JSON::Field(key: "StartupScriptS3ObjectVersion")]
        getter startup_script_s3_object_version : String?

        # The relative path to the startup shell script in your Amazon S3 bucket. For example,
        # s3://mwaa-environment/startup.sh . Amazon MWAA runs the script as your environment starts, and
        # before running the Apache Airflow process. You can use this script to install dependencies, modify
        # Apache Airflow configuration options, and set environment variables. For more information, see Using
        # a startup script .

        @[JSON::Field(key: "StartupScriptS3Path")]
        getter startup_script_s3_path : String?

        # The Apache Airflow Web server access mode. For more information, see Apache Airflow access modes .

        @[JSON::Field(key: "WebserverAccessMode")]
        getter webserver_access_mode : String?

        # The day and time of the week in Coordinated Universal Time (UTC) 24-hour standard time to start
        # weekly maintenance updates of your environment in the following format: DAY:HH:MM . For example:
        # TUE:03:30 . You can specify a start time in 30 minute increments only.

        @[JSON::Field(key: "WeeklyMaintenanceWindowStart")]
        getter weekly_maintenance_window_start : String?

        # The worker replacement strategy to use when updating the environment. You can select one of the
        # following strategies: Forced - Stops and replaces Apache Airflow workers without waiting for tasks
        # to complete before an update. Graceful - Allows Apache Airflow workers to complete running tasks for
        # up to 12 hours during an update before they're stopped and replaced.

        @[JSON::Field(key: "WorkerReplacementStrategy")]
        getter worker_replacement_strategy : String?

        def initialize(
          @name : String,
          @airflow_configuration_options : Hash(String, String)? = nil,
          @airflow_version : String? = nil,
          @dag_s3_path : String? = nil,
          @environment_class : String? = nil,
          @execution_role_arn : String? = nil,
          @logging_configuration : Types::LoggingConfigurationInput? = nil,
          @max_webservers : Int32? = nil,
          @max_workers : Int32? = nil,
          @min_webservers : Int32? = nil,
          @min_workers : Int32? = nil,
          @network_configuration : Types::UpdateNetworkConfigurationInput? = nil,
          @plugins_s3_object_version : String? = nil,
          @plugins_s3_path : String? = nil,
          @requirements_s3_object_version : String? = nil,
          @requirements_s3_path : String? = nil,
          @schedulers : Int32? = nil,
          @source_bucket_arn : String? = nil,
          @startup_script_s3_object_version : String? = nil,
          @startup_script_s3_path : String? = nil,
          @webserver_access_mode : String? = nil,
          @weekly_maintenance_window_start : String? = nil,
          @worker_replacement_strategy : String? = nil
        )
        end
      end


      struct UpdateEnvironmentOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon MWAA environment. For example,
        # arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # Describes the error(s) encountered with the last update of the environment.

      struct UpdateError
        include JSON::Serializable

        # The error code that corresponds to the error with the last update.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message that corresponds to the error code.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Defines the VPC networking components used to secure and enable network traffic between the Amazon
      # Web Services resources for your environment. For more information, see About networking on Amazon
      # MWAA .

      struct UpdateNetworkConfigurationInput
        include JSON::Serializable

        # A list of security group IDs. A security group must be attached to the same VPC as the subnets. For
        # more information, see Security in your VPC on Amazon MWAA .

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String)
        )
        end
      end

      # ValidationException: The provided input is not valid.

      struct ValidationException
        include JSON::Serializable


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
