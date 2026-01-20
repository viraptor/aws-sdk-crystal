require "json"
require "time"

module AwsSdk
  module SecurityLake
    module Types

      # You do not have sufficient access to perform this action. Access denied errors appear when Amazon
      # Security Lake explicitly or implicitly denies an authorization request. An explicit denial occurs
      # when a policy contains a Deny statement for the specific Amazon Web Services action. An implicit
      # denial occurs when there is no applicable Deny statement and also no applicable Allow statement.

      struct AccessDeniedException
        include JSON::Serializable

        # A coded string to provide more information about the access denied exception. You can use the error
        # code to check the exception type.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The Amazon Web Services identity.

      struct AwsIdentity
        include JSON::Serializable

        # The external ID used to establish trust relationship with the Amazon Web Services identity.

        @[JSON::Field(key: "externalId")]
        getter external_id : String

        # The Amazon Web Services identity principal.

        @[JSON::Field(key: "principal")]
        getter principal : String

        def initialize(
          @external_id : String,
          @principal : String
        )
        end
      end

      # To add a natively-supported Amazon Web Services service as a log source, use these parameters to
      # specify the configuration settings for the log source.

      struct AwsLogSourceConfiguration
        include JSON::Serializable

        # Specify the Regions where you want to enable Security Lake.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The name for a Amazon Web Services source.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String

        # Specify the Amazon Web Services account information where you want to enable Security Lake.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(String)?

        # The version for a Amazon Web Services source.

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        def initialize(
          @regions : Array(String),
          @source_name : String,
          @accounts : Array(String)? = nil,
          @source_version : String? = nil
        )
        end
      end

      # Amazon Security Lake can collect logs and events from natively-supported Amazon Web Services
      # services.

      struct AwsLogSourceResource
        include JSON::Serializable

        # The name for a Amazon Web Services source. This must be a Regionally unique value.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        # The version for a Amazon Web Services source. This must be a Regionally unique value.

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        def initialize(
          @source_name : String? = nil,
          @source_version : String? = nil
        )
        end
      end

      # The request is malformed or contains an error such as an invalid parameter value or a missing
      # required parameter.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Occurs when a conflict with a previous successful write is detected. This generally occurs when the
      # previous write did not have time to propagate to the host serving the current request. A retry (with
      # appropriate backoff logic) is the recommended response to this exception.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The resource name.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The resource type.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct CreateAwsLogSourceRequest
        include JSON::Serializable

        # Specify the natively-supported Amazon Web Services service to add as a source in Security Lake.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::AwsLogSourceConfiguration)

        def initialize(
          @sources : Array(Types::AwsLogSourceConfiguration)
        )
        end
      end


      struct CreateAwsLogSourceResponse
        include JSON::Serializable

        # Lists all accounts in which enabling a natively supported Amazon Web Services service as a Security
        # Lake source failed. The failure occurred as these accounts are not part of an organization.

        @[JSON::Field(key: "failed")]
        getter failed : Array(String)?

        def initialize(
          @failed : Array(String)? = nil
        )
        end
      end


      struct CreateCustomLogSourceRequest
        include JSON::Serializable

        # The configuration used for the third-party custom source.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CustomLogSourceConfiguration

        # Specify the name for a third-party custom source. This must be a Regionally unique value. The
        # sourceName you enter here, is used in the LogProviderRole name which follows the convention
        # AmazonSecurityLake-Provider-{name of the custom source}-{region} . You must use a CustomLogSource
        # name that is shorter than or equal to 20 characters. This ensures that the LogProviderRole name is
        # below the 64 character limit.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String

        # The Open Cybersecurity Schema Framework (OCSF) event classes which describes the type of data that
        # the custom source will send to Security Lake. For the list of supported event classes, see the
        # Amazon Security Lake User Guide .

        @[JSON::Field(key: "eventClasses")]
        getter event_classes : Array(String)?

        # Specify the source version for the third-party custom source, to limit log collection to a specific
        # version of custom data source.

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        def initialize(
          @configuration : Types::CustomLogSourceConfiguration,
          @source_name : String,
          @event_classes : Array(String)? = nil,
          @source_version : String? = nil
        )
        end
      end


      struct CreateCustomLogSourceResponse
        include JSON::Serializable

        # The third-party custom source that was created.

        @[JSON::Field(key: "source")]
        getter source : Types::CustomLogSourceResource?

        def initialize(
          @source : Types::CustomLogSourceResource? = nil
        )
        end
      end


      struct CreateDataLakeExceptionSubscriptionRequest
        include JSON::Serializable

        # The Amazon Web Services account where you want to receive exception notifications.

        @[JSON::Field(key: "notificationEndpoint")]
        getter notification_endpoint : String

        # The subscription protocol to which exception notifications are posted.

        @[JSON::Field(key: "subscriptionProtocol")]
        getter subscription_protocol : String

        # The expiration period and time-to-live (TTL). It is the duration of time until which the exception
        # message remains.

        @[JSON::Field(key: "exceptionTimeToLive")]
        getter exception_time_to_live : Int64?

        def initialize(
          @notification_endpoint : String,
          @subscription_protocol : String,
          @exception_time_to_live : Int64? = nil
        )
        end
      end


      struct CreateDataLakeExceptionSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateDataLakeOrganizationConfigurationRequest
        include JSON::Serializable

        # Enable Security Lake with the specified configuration settings, to begin collecting security data
        # for new accounts in your organization.

        @[JSON::Field(key: "autoEnableNewAccount")]
        getter auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)?

        def initialize(
          @auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)? = nil
        )
        end
      end


      struct CreateDataLakeOrganizationConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateDataLakeRequest
        include JSON::Serializable

        # Specify the Region or Regions that will contribute data to the rollup region.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::DataLakeConfiguration)

        # The Amazon Resource Name (ARN) used to create and update the Glue table. This table contains
        # partitions generated by the ingestion and normalization of Amazon Web Services log sources and
        # custom sources.

        @[JSON::Field(key: "metaStoreManagerRoleArn")]
        getter meta_store_manager_role_arn : String

        # An array of objects, one for each tag to associate with the data lake configuration. For each tag,
        # you must specify both a tag key and a tag value. A tag value cannot be null, but it can be an empty
        # string.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configurations : Array(Types::DataLakeConfiguration),
          @meta_store_manager_role_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDataLakeResponse
        include JSON::Serializable

        # The created Security Lake configuration object.

        @[JSON::Field(key: "dataLakes")]
        getter data_lakes : Array(Types::DataLakeResource)?

        def initialize(
          @data_lakes : Array(Types::DataLakeResource)? = nil
        )
        end
      end


      struct CreateSubscriberNotificationRequest
        include JSON::Serializable

        # Specify the configuration using which you want to create the subscriber notification.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::NotificationConfiguration

        # The subscriber ID for the notification subscription.

        @[JSON::Field(key: "subscriberId")]
        getter subscriber_id : String

        def initialize(
          @configuration : Types::NotificationConfiguration,
          @subscriber_id : String
        )
        end
      end


      struct CreateSubscriberNotificationResponse
        include JSON::Serializable

        # The subscriber endpoint to which exception messages are posted.

        @[JSON::Field(key: "subscriberEndpoint")]
        getter subscriber_endpoint : String?

        def initialize(
          @subscriber_endpoint : String? = nil
        )
        end
      end


      struct CreateSubscriberRequest
        include JSON::Serializable

        # The supported Amazon Web Services services from which logs and events are collected. Security Lake
        # supports log and event collection for natively supported Amazon Web Services services.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::LogSourceResource)

        # The Amazon Web Services identity used to access your data.

        @[JSON::Field(key: "subscriberIdentity")]
        getter subscriber_identity : Types::AwsIdentity

        # The name of your Security Lake subscriber account.

        @[JSON::Field(key: "subscriberName")]
        getter subscriber_name : String

        # The Amazon S3 or Lake Formation access type.

        @[JSON::Field(key: "accessTypes")]
        getter access_types : Array(String)?

        # The description for your subscriber account in Security Lake.

        @[JSON::Field(key: "subscriberDescription")]
        getter subscriber_description : String?

        # An array of objects, one for each tag to associate with the subscriber. For each tag, you must
        # specify both a tag key and a tag value. A tag value cannot be null, but it can be an empty string.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sources : Array(Types::LogSourceResource),
          @subscriber_identity : Types::AwsIdentity,
          @subscriber_name : String,
          @access_types : Array(String)? = nil,
          @subscriber_description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSubscriberResponse
        include JSON::Serializable

        # Retrieve information about the subscriber created using the CreateSubscriber API.

        @[JSON::Field(key: "subscriber")]
        getter subscriber : Types::SubscriberResource?

        def initialize(
          @subscriber : Types::SubscriberResource? = nil
        )
        end
      end

      # The attributes of a third-party custom source.

      struct CustomLogSourceAttributes
        include JSON::Serializable

        # The ARN of the Glue crawler.

        @[JSON::Field(key: "crawlerArn")]
        getter crawler_arn : String?

        # The ARN of the Glue database where results are written, such as:
        # arn:aws:daylight:us-east-1::database/sometable/* .

        @[JSON::Field(key: "databaseArn")]
        getter database_arn : String?

        # The ARN of the Glue table.

        @[JSON::Field(key: "tableArn")]
        getter table_arn : String?

        def initialize(
          @crawler_arn : String? = nil,
          @database_arn : String? = nil,
          @table_arn : String? = nil
        )
        end
      end

      # The configuration used for the third-party custom source.

      struct CustomLogSourceConfiguration
        include JSON::Serializable

        # The configuration used for the Glue Crawler for a third-party custom source.

        @[JSON::Field(key: "crawlerConfiguration")]
        getter crawler_configuration : Types::CustomLogSourceCrawlerConfiguration

        # The identity of the log provider for the third-party custom source.

        @[JSON::Field(key: "providerIdentity")]
        getter provider_identity : Types::AwsIdentity

        def initialize(
          @crawler_configuration : Types::CustomLogSourceCrawlerConfiguration,
          @provider_identity : Types::AwsIdentity
        )
        end
      end

      # The configuration used for the Glue Crawler for a third-party custom source.

      struct CustomLogSourceCrawlerConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role to be used by the
        # Glue crawler. The recommended IAM policies are: The managed policy AWSGlueServiceRole A custom
        # policy granting access to your Amazon S3 Data Lake

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end

      # The details of the log provider for a third-party custom source.

      struct CustomLogSourceProvider
        include JSON::Serializable

        # The location of the partition in the Amazon S3 bucket for Security Lake.

        @[JSON::Field(key: "location")]
        getter location : String?

        # The ARN of the IAM role to be used by the entity putting logs into your custom source partition.
        # Security Lake will apply the correct access policies to this role, but you must first manually
        # create the trust policy for this role. The IAM role name must start with the text 'Security Lake'.
        # The IAM role must trust the logProviderAccountId to assume the role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @location : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Amazon Security Lake can collect logs and events from third-party custom sources.

      struct CustomLogSourceResource
        include JSON::Serializable

        # The attributes of a third-party custom source.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::CustomLogSourceAttributes?

        # The details of the log provider for a third-party custom source.

        @[JSON::Field(key: "provider")]
        getter provider : Types::CustomLogSourceProvider?

        # The name for a third-party custom source. This must be a Regionally unique value.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        # The version for a third-party custom source. This must be a Regionally unique value.

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        def initialize(
          @attributes : Types::CustomLogSourceAttributes? = nil,
          @provider : Types::CustomLogSourceProvider? = nil,
          @source_name : String? = nil,
          @source_version : String? = nil
        )
        end
      end

      # Automatically enable new organization accounts as member accounts from an Amazon Security Lake
      # administrator account.

      struct DataLakeAutoEnableNewAccountConfiguration
        include JSON::Serializable

        # The Amazon Web Services Regions where Security Lake is automatically enabled.

        @[JSON::Field(key: "region")]
        getter region : String

        # The Amazon Web Services sources that are automatically enabled in Security Lake.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::AwsLogSourceResource)

        def initialize(
          @region : String,
          @sources : Array(Types::AwsLogSourceResource)
        )
        end
      end

      # Provides details of Amazon Security Lake object.

      struct DataLakeConfiguration
        include JSON::Serializable

        # The Amazon Web Services Regions where Security Lake is automatically enabled.

        @[JSON::Field(key: "region")]
        getter region : String

        # Provides encryption details of Amazon Security Lake object.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::DataLakeEncryptionConfiguration?

        # Provides lifecycle details of Amazon Security Lake object.

        @[JSON::Field(key: "lifecycleConfiguration")]
        getter lifecycle_configuration : Types::DataLakeLifecycleConfiguration?

        # Provides replication details of Amazon Security Lake object.

        @[JSON::Field(key: "replicationConfiguration")]
        getter replication_configuration : Types::DataLakeReplicationConfiguration?

        def initialize(
          @region : String,
          @encryption_configuration : Types::DataLakeEncryptionConfiguration? = nil,
          @lifecycle_configuration : Types::DataLakeLifecycleConfiguration? = nil,
          @replication_configuration : Types::DataLakeReplicationConfiguration? = nil
        )
        end
      end

      # Provides encryption details of Amazon Security Lake object.

      struct DataLakeEncryptionConfiguration
        include JSON::Serializable

        # The identifier of KMS encryption key used by Amazon Security Lake to encrypt the Security Lake
        # object.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @kms_key_id : String? = nil
        )
        end
      end

      # The details for an Amazon Security Lake exception.

      struct DataLakeException
        include JSON::Serializable

        # The underlying exception of a Security Lake exception.

        @[JSON::Field(key: "exception")]
        getter exception : String?

        # The Amazon Web Services Regions where the exception occurred.

        @[JSON::Field(key: "region")]
        getter region : String?

        # List of all remediation steps for a Security Lake exception.

        @[JSON::Field(key: "remediation")]
        getter remediation : String?

        # This error can occur if you configure the wrong timestamp format, or if the subset of entries used
        # for validation had errors or missing values.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @exception : String? = nil,
          @region : String? = nil,
          @remediation : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Provides lifecycle details of Amazon Security Lake object.

      struct DataLakeLifecycleConfiguration
        include JSON::Serializable

        # Provides data expiration details of Amazon Security Lake object.

        @[JSON::Field(key: "expiration")]
        getter expiration : Types::DataLakeLifecycleExpiration?

        # Provides data storage transition details of Amazon Security Lake object.

        @[JSON::Field(key: "transitions")]
        getter transitions : Array(Types::DataLakeLifecycleTransition)?

        def initialize(
          @expiration : Types::DataLakeLifecycleExpiration? = nil,
          @transitions : Array(Types::DataLakeLifecycleTransition)? = nil
        )
        end
      end

      # Provide expiration lifecycle details of Amazon Security Lake object.

      struct DataLakeLifecycleExpiration
        include JSON::Serializable

        # Number of days before data expires in the Amazon Security Lake object.

        @[JSON::Field(key: "days")]
        getter days : Int32?

        def initialize(
          @days : Int32? = nil
        )
        end
      end

      # Provide transition lifecycle details of Amazon Security Lake object.

      struct DataLakeLifecycleTransition
        include JSON::Serializable

        # Number of days before data transitions to a different S3 Storage Class in the Amazon Security Lake
        # object.

        @[JSON::Field(key: "days")]
        getter days : Int32?

        # The range of storage classes that you can choose from based on the data access, resiliency, and cost
        # requirements of your workloads.

        @[JSON::Field(key: "storageClass")]
        getter storage_class : String?

        def initialize(
          @days : Int32? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # Provides replication details for objects stored in the Amazon Security Lake data lake.

      struct DataLakeReplicationConfiguration
        include JSON::Serializable

        # Specifies one or more centralized rollup Regions. The Amazon Web Services Region specified in the
        # region parameter of the CreateDataLake or UpdateDataLake operations contributes data to the rollup
        # Region or Regions specified in this parameter. Replication enables automatic, asynchronous copying
        # of objects across Amazon S3 buckets. S3 buckets that are configured for object replication can be
        # owned by the same Amazon Web Services account or by different accounts. You can replicate objects to
        # a single destination bucket or to multiple destination buckets. The destination buckets can be in
        # different Regions or within the same Region as the source bucket.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        # Replication settings for the Amazon S3 buckets. This parameter uses the Identity and Access
        # Management (IAM) role you created that is managed by Security Lake, to ensure the replication
        # setting is correct.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @regions : Array(String)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Provides details of Amazon Security Lake object.

      struct DataLakeResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) created by you to provide to the subscriber. For more information
        # about ARNs and how to use them in policies, see the Amazon Security Lake User Guide .

        @[JSON::Field(key: "dataLakeArn")]
        getter data_lake_arn : String

        # The Amazon Web Services Regions where Security Lake is enabled.

        @[JSON::Field(key: "region")]
        getter region : String

        # Retrieves the status of the CreateDatalake API call for an account in Amazon Security Lake.

        @[JSON::Field(key: "createStatus")]
        getter create_status : String?

        # Provides encryption details of Amazon Security Lake object.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::DataLakeEncryptionConfiguration?

        # Provides lifecycle details of Amazon Security Lake object.

        @[JSON::Field(key: "lifecycleConfiguration")]
        getter lifecycle_configuration : Types::DataLakeLifecycleConfiguration?

        # Provides replication details of Amazon Security Lake object.

        @[JSON::Field(key: "replicationConfiguration")]
        getter replication_configuration : Types::DataLakeReplicationConfiguration?

        # The ARN for the Amazon Security Lake Amazon S3 bucket.

        @[JSON::Field(key: "s3BucketArn")]
        getter s3_bucket_arn : String?

        # The status of the last UpdateDataLake or DeleteDataLake API request.

        @[JSON::Field(key: "updateStatus")]
        getter update_status : Types::DataLakeUpdateStatus?

        def initialize(
          @data_lake_arn : String,
          @region : String,
          @create_status : String? = nil,
          @encryption_configuration : Types::DataLakeEncryptionConfiguration? = nil,
          @lifecycle_configuration : Types::DataLakeLifecycleConfiguration? = nil,
          @replication_configuration : Types::DataLakeReplicationConfiguration? = nil,
          @s3_bucket_arn : String? = nil,
          @update_status : Types::DataLakeUpdateStatus? = nil
        )
        end
      end

      # Amazon Security Lake collects logs and events from supported Amazon Web Services services and custom
      # sources. For the list of supported Amazon Web Services services, see the Amazon Security Lake User
      # Guide .

      struct DataLakeSource
        include JSON::Serializable

        # The ID of the Security Lake account for which logs are collected.

        @[JSON::Field(key: "account")]
        getter account : String?

        # The Open Cybersecurity Schema Framework (OCSF) event classes describes the type of data that the
        # custom source will send to Security Lake. For the list of supported event classes, see Supported
        # OCSF Event classes in the Amazon Security Lake User Guide.

        @[JSON::Field(key: "eventClasses")]
        getter event_classes : Array(String)?

        # The supported Amazon Web Services services from which logs and events are collected. Amazon Security
        # Lake supports log and event collection for natively supported Amazon Web Services services.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        # The log status for the Security Lake account.

        @[JSON::Field(key: "sourceStatuses")]
        getter source_statuses : Array(Types::DataLakeSourceStatus)?

        def initialize(
          @account : String? = nil,
          @event_classes : Array(String)? = nil,
          @source_name : String? = nil,
          @source_statuses : Array(Types::DataLakeSourceStatus)? = nil
        )
        end
      end

      # Retrieves the Logs status for the Amazon Security Lake account.

      struct DataLakeSourceStatus
        include JSON::Serializable

        # Defines path the stored logs are available which has information on your systems, applications, and
        # services.

        @[JSON::Field(key: "resource")]
        getter resource : String?

        # The health status of services, including error codes and patterns.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @resource : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The details of the last UpdateDataLake or DeleteDataLake API request which failed.

      struct DataLakeUpdateException
        include JSON::Serializable

        # The reason code for the exception of the last UpdateDataLake or DeleteDataLake API request.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The reason for the exception of the last UpdateDataLake or DeleteDataLake API request.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @code : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The status of the last UpdateDataLake or DeleteDataLake API request. This is set to Completed after
      # the configuration is updated, or removed if deletion of the data lake is successful.

      struct DataLakeUpdateStatus
        include JSON::Serializable

        # The details of the last UpdateDataLake or DeleteDataLake API request which failed.

        @[JSON::Field(key: "exception")]
        getter exception : Types::DataLakeUpdateException?

        # The unique ID for the last UpdateDataLake or DeleteDataLake API request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        # The status of the last UpdateDataLake or DeleteDataLake API request that was requested.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @exception : Types::DataLakeUpdateException? = nil,
          @request_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteAwsLogSourceRequest
        include JSON::Serializable

        # Specify the natively-supported Amazon Web Services service to remove as a source in Security Lake.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::AwsLogSourceConfiguration)

        def initialize(
          @sources : Array(Types::AwsLogSourceConfiguration)
        )
        end
      end


      struct DeleteAwsLogSourceResponse
        include JSON::Serializable

        # Deletion of the Amazon Web Services sources failed as the account is not a part of the organization.

        @[JSON::Field(key: "failed")]
        getter failed : Array(String)?

        def initialize(
          @failed : Array(String)? = nil
        )
        end
      end


      struct DeleteCustomLogSourceRequest
        include JSON::Serializable

        # The source name of custom log source that you want to delete.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String

        # The source version for the third-party custom source. You can limit the custom source removal to the
        # specified source version.

        @[JSON::Field(key: "sourceVersion")]
        getter source_version : String?

        def initialize(
          @source_name : String,
          @source_version : String? = nil
        )
        end
      end


      struct DeleteCustomLogSourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataLakeExceptionSubscriptionRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataLakeExceptionSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataLakeOrganizationConfigurationRequest
        include JSON::Serializable

        # Turns off automatic enablement of Security Lake for member accounts that are added to an
        # organization.

        @[JSON::Field(key: "autoEnableNewAccount")]
        getter auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)?

        def initialize(
          @auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)? = nil
        )
        end
      end


      struct DeleteDataLakeOrganizationConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataLakeRequest
        include JSON::Serializable

        # The list of Regions where Security Lake is enabled.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        def initialize(
          @regions : Array(String)
        )
        end
      end


      struct DeleteDataLakeResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSubscriberNotificationRequest
        include JSON::Serializable

        # The ID of the Security Lake subscriber account.

        @[JSON::Field(key: "subscriberId")]
        getter subscriber_id : String

        def initialize(
          @subscriber_id : String
        )
        end
      end


      struct DeleteSubscriberNotificationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSubscriberRequest
        include JSON::Serializable

        # A value created by Security Lake that uniquely identifies your DeleteSubscriber API request.

        @[JSON::Field(key: "subscriberId")]
        getter subscriber_id : String

        def initialize(
          @subscriber_id : String
        )
        end
      end


      struct DeleteSubscriberResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterDataLakeDelegatedAdministratorRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterDataLakeDelegatedAdministratorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDataLakeExceptionSubscriptionRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDataLakeExceptionSubscriptionResponse
        include JSON::Serializable

        # The expiration period and time-to-live (TTL). It is the duration of time until which the exception
        # message remains.

        @[JSON::Field(key: "exceptionTimeToLive")]
        getter exception_time_to_live : Int64?

        # The Amazon Web Services account where you receive exception notifications.

        @[JSON::Field(key: "notificationEndpoint")]
        getter notification_endpoint : String?

        # The subscription protocol to which exception notifications are posted.

        @[JSON::Field(key: "subscriptionProtocol")]
        getter subscription_protocol : String?

        def initialize(
          @exception_time_to_live : Int64? = nil,
          @notification_endpoint : String? = nil,
          @subscription_protocol : String? = nil
        )
        end
      end


      struct GetDataLakeOrganizationConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDataLakeOrganizationConfigurationResponse
        include JSON::Serializable

        # The configuration used for new accounts in Security Lake.

        @[JSON::Field(key: "autoEnableNewAccount")]
        getter auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)?

        def initialize(
          @auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)? = nil
        )
        end
      end


      struct GetDataLakeSourcesRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for which a static snapshot of the current Amazon Web Services
        # Region, including enabled accounts and log sources, is retrieved.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(String)?

        # The maximum limit of accounts for which the static snapshot of the current Region, including enabled
        # accounts and log sources, is retrieved.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token
        # will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @accounts : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDataLakeSourcesResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) created by you to provide to the subscriber. For more information
        # about ARNs and how to use them in policies, see the Amazon Security Lake User Guide .

        @[JSON::Field(key: "dataLakeArn")]
        getter data_lake_arn : String?

        # The list of enabled accounts and enabled sources.

        @[JSON::Field(key: "dataLakeSources")]
        getter data_lake_sources : Array(Types::DataLakeSource)?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token
        # will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_lake_arn : String? = nil,
          @data_lake_sources : Array(Types::DataLakeSource)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSubscriberRequest
        include JSON::Serializable

        # A value created by Amazon Security Lake that uniquely identifies your GetSubscriber API request.

        @[JSON::Field(key: "subscriberId")]
        getter subscriber_id : String

        def initialize(
          @subscriber_id : String
        )
        end
      end


      struct GetSubscriberResponse
        include JSON::Serializable

        # The subscriber information for the specified subscriber ID.

        @[JSON::Field(key: "subscriber")]
        getter subscriber : Types::SubscriberResource?

        def initialize(
          @subscriber : Types::SubscriberResource? = nil
        )
        end
      end

      # The configurations used for HTTPS subscriber notification.

      struct HttpsNotificationConfiguration
        include JSON::Serializable

        # The subscription endpoint in Security Lake. If you prefer notification with an HTTPs endpoint,
        # populate this field.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The Amazon Resource Name (ARN) of the EventBridge API destinations IAM role that you created. For
        # more information about ARNs and how to use them in policies, see Managing data access and Amazon Web
        # Services Managed Policies in the Amazon Security Lake User Guide .

        @[JSON::Field(key: "targetRoleArn")]
        getter target_role_arn : String

        # The key name for the notification subscription.

        @[JSON::Field(key: "authorizationApiKeyName")]
        getter authorization_api_key_name : String?

        # The key value for the notification subscription.

        @[JSON::Field(key: "authorizationApiKeyValue")]
        getter authorization_api_key_value : String?

        # The HTTPS method used for the notification subscription.

        @[JSON::Field(key: "httpMethod")]
        getter http_method : String?

        def initialize(
          @endpoint : String,
          @target_role_arn : String,
          @authorization_api_key_name : String? = nil,
          @authorization_api_key_value : String? = nil,
          @http_method : String? = nil
        )
        end
      end

      # Internal service exceptions are sometimes caused by transient issues. Before you start
      # troubleshooting, perform the operation again.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListDataLakeExceptionsRequest
        include JSON::Serializable

        # Lists the maximum number of failures in Security Lake.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token
        # will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Web Services Regions from which exceptions are retrieved.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @regions : Array(String)? = nil
        )
        end
      end


      struct ListDataLakeExceptionsResponse
        include JSON::Serializable

        # Lists the failures that cannot be retried.

        @[JSON::Field(key: "exceptions")]
        getter exceptions : Array(Types::DataLakeException)?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token
        # will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @exceptions : Array(Types::DataLakeException)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataLakesRequest
        include JSON::Serializable

        # The list of Regions where Security Lake is enabled.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        def initialize(
          @regions : Array(String)? = nil
        )
        end
      end


      struct ListDataLakesResponse
        include JSON::Serializable

        # Retrieves the Security Lake configuration object.

        @[JSON::Field(key: "dataLakes")]
        getter data_lakes : Array(Types::DataLakeResource)?

        def initialize(
          @data_lakes : Array(Types::DataLakeResource)? = nil
        )
        end
      end


      struct ListLogSourcesRequest
        include JSON::Serializable

        # The list of Amazon Web Services accounts for which log sources are displayed.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(String)?

        # The maximum number of accounts for which the log sources are displayed.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. You can repeat the call using the
        # returned token to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of Regions for which log sources are displayed.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        # The list of sources for which log sources are displayed.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::LogSourceResource)?

        def initialize(
          @accounts : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @regions : Array(String)? = nil,
          @sources : Array(Types::LogSourceResource)? = nil
        )
        end
      end


      struct ListLogSourcesResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. You can repeat the call using the
        # returned token to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of log sources in your organization that send data to the data lake.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::LogSource)?

        def initialize(
          @next_token : String? = nil,
          @sources : Array(Types::LogSource)? = nil
        )
        end
      end


      struct ListSubscribersRequest
        include JSON::Serializable

        # The maximum number of accounts for which the configuration is displayed.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. You can repeat the call using the
        # returned token to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubscribersResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. You can repeat the call using the
        # returned token to retrieve the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The subscribers available for the specified Security Lake account ID.

        @[JSON::Field(key: "subscribers")]
        getter subscribers : Array(Types::SubscriberResource)?

        def initialize(
          @next_token : String? = nil,
          @subscribers : Array(Types::SubscriberResource)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Security Lake resource for which you want to retrieve
        # the tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # An array of objects, one for each tag (key and value) that’s associated with the Amazon Security
        # Lake resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Amazon Security Lake can collect logs and events from natively-supported Amazon Web Services
      # services and custom sources.

      struct LogSource
        include JSON::Serializable

        # Specify the account from which you want to collect logs.

        @[JSON::Field(key: "account")]
        getter account : String?

        # Specify the Regions from which you want to collect logs.

        @[JSON::Field(key: "region")]
        getter region : String?

        # Specify the sources from which you want to collect logs.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::LogSourceResource)?

        def initialize(
          @account : String? = nil,
          @region : String? = nil,
          @sources : Array(Types::LogSourceResource)? = nil
        )
        end
      end

      # The supported source types from which logs and events are collected in Amazon Security Lake. For a
      # list of supported Amazon Web Services services, see the Amazon Security Lake User Guide .

      struct LogSourceResource
        include JSON::Serializable

        # Amazon Security Lake supports log and event collection for natively supported Amazon Web Services
        # services. For more information, see the Amazon Security Lake User Guide .

        @[JSON::Field(key: "awsLogSource")]
        getter aws_log_source : Types::AwsLogSourceResource?

        # Amazon Security Lake supports custom source types. For more information, see the Amazon Security
        # Lake User Guide .

        @[JSON::Field(key: "customLogSource")]
        getter custom_log_source : Types::CustomLogSourceResource?

        def initialize(
          @aws_log_source : Types::AwsLogSourceResource? = nil,
          @custom_log_source : Types::CustomLogSourceResource? = nil
        )
        end
      end

      # Specify the configurations you want to use for subscriber notification to notify the subscriber when
      # new data is written to the data lake for sources that the subscriber consumes in Security Lake.

      struct NotificationConfiguration
        include JSON::Serializable

        # The configurations used for HTTPS subscriber notification.

        @[JSON::Field(key: "httpsNotificationConfiguration")]
        getter https_notification_configuration : Types::HttpsNotificationConfiguration?

        # The configurations for SQS subscriber notification.

        @[JSON::Field(key: "sqsNotificationConfiguration")]
        getter sqs_notification_configuration : Types::SqsNotificationConfiguration?

        def initialize(
          @https_notification_configuration : Types::HttpsNotificationConfiguration? = nil,
          @sqs_notification_configuration : Types::SqsNotificationConfiguration? = nil
        )
        end
      end


      struct RegisterDataLakeDelegatedAdministratorRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Security Lake delegated administrator.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct RegisterDataLakeDelegatedAdministratorResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the resource that could not be found.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The type of the resource that could not be found.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The configurations used for EventBridge subscriber notification.

      struct SqsNotificationConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Provides details about the Amazon Security Lake account subscription. Subscribers are notified of
      # new objects for a source as the data is written to your Amazon S3 bucket for Security Lake.

      struct SubscriberResource
        include JSON::Serializable

        # Amazon Security Lake supports log and event collection for natively supported Amazon Web Services
        # services. For more information, see the Amazon Security Lake User Guide .

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::LogSourceResource)

        # The subscriber ARN of the Amazon Security Lake subscriber account.

        @[JSON::Field(key: "subscriberArn")]
        getter subscriber_arn : String

        # The subscriber ID of the Amazon Security Lake subscriber account.

        @[JSON::Field(key: "subscriberId")]
        getter subscriber_id : String

        # The Amazon Web Services identity used to access your data.

        @[JSON::Field(key: "subscriberIdentity")]
        getter subscriber_identity : Types::AwsIdentity

        # The name of your Amazon Security Lake subscriber account.

        @[JSON::Field(key: "subscriberName")]
        getter subscriber_name : String

        # You can choose to notify subscribers of new objects with an Amazon Simple Queue Service (Amazon SQS)
        # queue or through messaging to an HTTPS endpoint provided by the subscriber. Subscribers can consume
        # data by directly querying Lake Formation tables in your Amazon S3 bucket through services like
        # Amazon Athena. This subscription type is defined as LAKEFORMATION .

        @[JSON::Field(key: "accessTypes")]
        getter access_types : Array(String)?

        # The date and time when the subscriber was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) which uniquely defines the Amazon Web Services RAM resource share.
        # Before accepting the RAM resource share invitation, you can view details related to the RAM resource
        # share. This field is available only for Lake Formation subscribers created after March 8, 2023.

        @[JSON::Field(key: "resourceShareArn")]
        getter resource_share_arn : String?

        # The name of the resource share.

        @[JSON::Field(key: "resourceShareName")]
        getter resource_share_name : String?

        # The Amazon Resource Name (ARN) specifying the role of the subscriber.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The ARN for the Amazon S3 bucket.

        @[JSON::Field(key: "s3BucketArn")]
        getter s3_bucket_arn : String?

        # The subscriber descriptions for a subscriber account. The description for a subscriber includes
        # subscriberName , accountID , externalID , and subscriberId .

        @[JSON::Field(key: "subscriberDescription")]
        getter subscriber_description : String?

        # The subscriber endpoint to which exception messages are posted.

        @[JSON::Field(key: "subscriberEndpoint")]
        getter subscriber_endpoint : String?

        # The subscriber status of the Amazon Security Lake subscriber account.

        @[JSON::Field(key: "subscriberStatus")]
        getter subscriber_status : String?

        # The date and time when the subscriber was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @sources : Array(Types::LogSourceResource),
          @subscriber_arn : String,
          @subscriber_id : String,
          @subscriber_identity : Types::AwsIdentity,
          @subscriber_name : String,
          @access_types : Array(String)? = nil,
          @created_at : Time? = nil,
          @resource_share_arn : String? = nil,
          @resource_share_name : String? = nil,
          @role_arn : String? = nil,
          @s3_bucket_arn : String? = nil,
          @subscriber_description : String? = nil,
          @subscriber_endpoint : String? = nil,
          @subscriber_status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A tag is a label that you can define and associate with Amazon Web Services resources, including
      # certain types of Amazon Security Lake resources. Tags can help you identify, categorize, and manage
      # resources in different ways, such as by owner, environment, or other criteria. You can associate
      # tags with the following types of Security Lake resources: subscribers, and the data lake
      # configuration for your Amazon Web Services account in individual Amazon Web Services Regions. A
      # resource can have up to 50 tags. Each tag consists of a required tag key and an associated tag value
      # . A tag key is a general label that acts as a category for a more specific tag value. Each tag key
      # must be unique and it can have only one tag value. A tag value acts as a descriptor for a tag key.
      # Tag keys and values are case sensitive. They can contain letters, numbers, spaces, or the following
      # symbols: _ . : / = + @ - For more information, see Tagging Amazon Security Lake resources in the
      # Amazon Security Lake User Guide .

      struct Tag
        include JSON::Serializable

        # The name of the tag. This is a general label that acts as a category for a more specific tag value (
        # value ).

        @[JSON::Field(key: "key")]
        getter key : String

        # The value that’s associated with the specified tag key ( key ). This value acts as a descriptor for
        # the tag key. A tag value cannot be null, but it can be an empty string.

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

        # The Amazon Resource Name (ARN) of the Amazon Security Lake resource to add or update the tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # An array of objects, one for each tag (key and value) to associate with the Amazon Security Lake
        # resource. For each tag, you must specify both a tag key and a tag value. A tag value cannot be null,
        # but it can be an empty string.

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

      # The limit on the number of requests per second was exceeded.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # That the rate of requests to Security Lake is exceeding the request quotas for your Amazon Web
        # Services account.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Retry the request after the specified time.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The code for the service in Service Quotas.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Security Lake resource to remove one or more tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of one or more tag keys. For each value in the list, specify the tag key for a tag to remove
        # from the Amazon Security Lake resource.

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


      struct UpdateDataLakeExceptionSubscriptionRequest
        include JSON::Serializable

        # The account that is subscribed to receive exception notifications.

        @[JSON::Field(key: "notificationEndpoint")]
        getter notification_endpoint : String

        # The subscription protocol to which exception messages are posted.

        @[JSON::Field(key: "subscriptionProtocol")]
        getter subscription_protocol : String

        # The time-to-live (TTL) for the exception message to remain. It is the duration of time until which
        # the exception message remains.

        @[JSON::Field(key: "exceptionTimeToLive")]
        getter exception_time_to_live : Int64?

        def initialize(
          @notification_endpoint : String,
          @subscription_protocol : String,
          @exception_time_to_live : Int64? = nil
        )
        end
      end


      struct UpdateDataLakeExceptionSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDataLakeRequest
        include JSON::Serializable

        # Specifies the Region or Regions that will contribute data to the rollup region.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::DataLakeConfiguration)

        # The Amazon Resource Name (ARN) used to create and update the Glue table. This table contains
        # partitions generated by the ingestion and normalization of Amazon Web Services log sources and
        # custom sources.

        @[JSON::Field(key: "metaStoreManagerRoleArn")]
        getter meta_store_manager_role_arn : String?

        def initialize(
          @configurations : Array(Types::DataLakeConfiguration),
          @meta_store_manager_role_arn : String? = nil
        )
        end
      end


      struct UpdateDataLakeResponse
        include JSON::Serializable

        # The created Security Lake configuration object.

        @[JSON::Field(key: "dataLakes")]
        getter data_lakes : Array(Types::DataLakeResource)?

        def initialize(
          @data_lakes : Array(Types::DataLakeResource)? = nil
        )
        end
      end


      struct UpdateSubscriberNotificationRequest
        include JSON::Serializable

        # The configuration for subscriber notification.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::NotificationConfiguration

        # The subscription ID for which the subscription notification is specified.

        @[JSON::Field(key: "subscriberId")]
        getter subscriber_id : String

        def initialize(
          @configuration : Types::NotificationConfiguration,
          @subscriber_id : String
        )
        end
      end


      struct UpdateSubscriberNotificationResponse
        include JSON::Serializable

        # The subscriber endpoint to which exception messages are posted.

        @[JSON::Field(key: "subscriberEndpoint")]
        getter subscriber_endpoint : String?

        def initialize(
          @subscriber_endpoint : String? = nil
        )
        end
      end


      struct UpdateSubscriberRequest
        include JSON::Serializable

        # A value created by Security Lake that uniquely identifies your subscription.

        @[JSON::Field(key: "subscriberId")]
        getter subscriber_id : String

        # The supported Amazon Web Services services from which logs and events are collected. For the list of
        # supported Amazon Web Services services, see the Amazon Security Lake User Guide .

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::LogSourceResource)?

        # The description of the Security Lake account subscriber.

        @[JSON::Field(key: "subscriberDescription")]
        getter subscriber_description : String?

        # The Amazon Web Services identity used to access your data.

        @[JSON::Field(key: "subscriberIdentity")]
        getter subscriber_identity : Types::AwsIdentity?

        # The name of the Security Lake account subscriber.

        @[JSON::Field(key: "subscriberName")]
        getter subscriber_name : String?

        def initialize(
          @subscriber_id : String,
          @sources : Array(Types::LogSourceResource)? = nil,
          @subscriber_description : String? = nil,
          @subscriber_identity : Types::AwsIdentity? = nil,
          @subscriber_name : String? = nil
        )
        end
      end


      struct UpdateSubscriberResponse
        include JSON::Serializable

        # The updated subscriber information.

        @[JSON::Field(key: "subscriber")]
        getter subscriber : Types::SubscriberResource?

        def initialize(
          @subscriber : Types::SubscriberResource? = nil
        )
        end
      end
    end
  end
end
