require "json"
require "time"

module AwsSdk
  module Firehose
    module Types

      # Describes the buffering to perform before delivering data to the Serverless offering for Amazon
      # OpenSearch Service destination.
      struct AmazonOpenSearchServerlessBufferingHints
        include JSON::Serializable

        # Buffer incoming data for the specified period of time, in seconds, before delivering it to the
        # destination. The default value is 300 (5 minutes).
        @[JSON::Field(key: "IntervalInSeconds")]
        getter interval_in_seconds : Int32?

        # Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The
        # default value is 5. We recommend setting this parameter to a value greater than the amount of data
        # you typically ingest into the Firehose stream in 10 seconds. For example, if you typically ingest
        # data at 1 MB/sec, the value should be 10 MB or higher.
        @[JSON::Field(key: "SizeInMBs")]
        getter size_in_m_bs : Int32?

        def initialize(
          @interval_in_seconds : Int32? = nil,
          @size_in_m_bs : Int32? = nil
        )
        end
      end

      # Describes the configuration of a destination in the Serverless offering for Amazon OpenSearch
      # Service.
      struct AmazonOpenSearchServerlessDestinationConfiguration
        include JSON::Serializable

        # The Serverless offering for Amazon OpenSearch Service index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the Serverless
        # offering for Amazon OpenSearch Service Configuration API and for indexing documents.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # The buffering options. If no value is specified, the default values for
        # AmazonopensearchserviceBufferingHints are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::AmazonOpenSearchServerlessBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the collection in the Serverless offering for Amazon
        # OpenSearch Service.
        @[JSON::Field(key: "CollectionEndpoint")]
        getter collection_endpoint : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to the Serverless offering for
        # Amazon OpenSearch Service. The default value is 300 (5 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::AmazonOpenSearchServerlessRetryOptions?

        # Defines how documents should be delivered to Amazon S3. When it is set to FailedDocumentsOnly,
        # Firehose writes any documents that could not be indexed to the configured Amazon S3 destination,
        # with AmazonOpenSearchService-failed/ appended to the key prefix. When set to AllDocuments, Firehose
        # delivers all incoming records to Amazon S3, and also writes failed documents with
        # AmazonOpenSearchService-failed/ appended to the prefix.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @index_name : String,
          @role_arn : String,
          @s3_configuration : Types::S3DestinationConfiguration,
          @buffering_hints : Types::AmazonOpenSearchServerlessBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @collection_endpoint : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::AmazonOpenSearchServerlessRetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      # The destination description in the Serverless offering for Amazon OpenSearch Service.
      struct AmazonOpenSearchServerlessDestinationDescription
        include JSON::Serializable

        # The buffering options.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::AmazonOpenSearchServerlessBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the collection in the Serverless offering for Amazon
        # OpenSearch Service.
        @[JSON::Field(key: "CollectionEndpoint")]
        getter collection_endpoint : String?

        # The Serverless offering for Amazon OpenSearch Service index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The Serverless offering for Amazon OpenSearch Service retry options.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::AmazonOpenSearchServerlessRetryOptions?

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The Amazon S3 backup mode.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        @[JSON::Field(key: "VpcConfigurationDescription")]
        getter vpc_configuration_description : Types::VpcConfigurationDescription?

        def initialize(
          @buffering_hints : Types::AmazonOpenSearchServerlessBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @collection_endpoint : String? = nil,
          @index_name : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::AmazonOpenSearchServerlessRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @vpc_configuration_description : Types::VpcConfigurationDescription? = nil
        )
        end
      end

      # Describes an update for a destination in the Serverless offering for Amazon OpenSearch Service.
      struct AmazonOpenSearchServerlessDestinationUpdate
        include JSON::Serializable

        # The buffering options. If no value is specified, AmazonopensearchBufferingHints object default
        # values are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::AmazonOpenSearchServerlessBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the collection in the Serverless offering for Amazon
        # OpenSearch Service.
        @[JSON::Field(key: "CollectionEndpoint")]
        getter collection_endpoint : String?

        # The Serverless offering for Amazon OpenSearch Service index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to the Serverless offering for
        # Amazon OpenSearch Service. The default value is 300 (5 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::AmazonOpenSearchServerlessRetryOptions?

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the Serverless
        # offering for Amazon OpenSearch Service Configuration API and for indexing documents.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        @[JSON::Field(key: "S3Update")]
        getter s3_update : Types::S3DestinationUpdate?

        def initialize(
          @buffering_hints : Types::AmazonOpenSearchServerlessBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @collection_endpoint : String? = nil,
          @index_name : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::AmazonOpenSearchServerlessRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_update : Types::S3DestinationUpdate? = nil
        )
        end
      end

      # Configures retry behavior in case Firehose is unable to deliver documents to the Serverless offering
      # for Amazon OpenSearch Service.
      struct AmazonOpenSearchServerlessRetryOptions
        include JSON::Serializable

        # After an initial failure to deliver to the Serverless offering for Amazon OpenSearch Service, the
        # total amount of time during which Firehose retries delivery (including the first attempt). After
        # this time has elapsed, the failed documents are written to Amazon S3. Default value is 300 seconds
        # (5 minutes). A value of 0 (zero) results in no retries.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      # Describes the buffering to perform before delivering data to the Amazon OpenSearch Service
      # destination.
      struct AmazonopensearchserviceBufferingHints
        include JSON::Serializable

        # Buffer incoming data for the specified period of time, in seconds, before delivering it to the
        # destination. The default value is 300 (5 minutes).
        @[JSON::Field(key: "IntervalInSeconds")]
        getter interval_in_seconds : Int32?

        # Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The
        # default value is 5. We recommend setting this parameter to a value greater than the amount of data
        # you typically ingest into the Firehose stream in 10 seconds. For example, if you typically ingest
        # data at 1 MB/sec, the value should be 10 MB or higher.
        @[JSON::Field(key: "SizeInMBs")]
        getter size_in_m_bs : Int32?

        def initialize(
          @interval_in_seconds : Int32? = nil,
          @size_in_m_bs : Int32? = nil
        )
        end
      end

      # Describes the configuration of a destination in Amazon OpenSearch Service
      struct AmazonopensearchserviceDestinationConfiguration
        include JSON::Serializable

        # The ElasticsearAmazon OpenSearch Service index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the Amazon
        # OpenSearch Service Configuration API and for indexing documents.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # The buffering options. If no value is specified, the default values for
        # AmazonopensearchserviceBufferingHints are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::AmazonopensearchserviceBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the cluster. Specify either this ClusterEndpoint or the
        # DomainARN field.
        @[JSON::Field(key: "ClusterEndpoint")]
        getter cluster_endpoint : String?

        # Indicates the method for setting up document ID. The supported methods are Firehose generated
        # document ID and OpenSearch Service generated document ID.
        @[JSON::Field(key: "DocumentIdOptions")]
        getter document_id_options : Types::DocumentIdOptions?

        # The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for
        # DescribeElasticsearchDomain, DescribeElasticsearchDomains, and DescribeElasticsearchDomainConfig
        # after assuming the role specified in RoleARN.
        @[JSON::Field(key: "DomainARN")]
        getter domain_arn : String?

        # The Amazon OpenSearch Service index rotation period. Index rotation appends a timestamp to the
        # IndexName to facilitate the expiration of old data.
        @[JSON::Field(key: "IndexRotationPeriod")]
        getter index_rotation_period : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch Service. The
        # default value is 300 (5 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::AmazonopensearchserviceRetryOptions?

        # Defines how documents should be delivered to Amazon S3. When it is set to FailedDocumentsOnly,
        # Firehose writes any documents that could not be indexed to the configured Amazon S3 destination,
        # with AmazonOpenSearchService-failed/ appended to the key prefix. When set to AllDocuments, Firehose
        # delivers all incoming records to Amazon S3, and also writes failed documents with
        # AmazonOpenSearchService-failed/ appended to the prefix.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be only one type per
        # index. If you try to specify a new type for an existing index that already has another type,
        # Firehose returns an error during run time.
        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @index_name : String,
          @role_arn : String,
          @s3_configuration : Types::S3DestinationConfiguration,
          @buffering_hints : Types::AmazonopensearchserviceBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @cluster_endpoint : String? = nil,
          @document_id_options : Types::DocumentIdOptions? = nil,
          @domain_arn : String? = nil,
          @index_rotation_period : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::AmazonopensearchserviceRetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @type_name : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      # The destination description in Amazon OpenSearch Service.
      struct AmazonopensearchserviceDestinationDescription
        include JSON::Serializable

        # The buffering options.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::AmazonopensearchserviceBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the cluster. Firehose uses either this ClusterEndpoint
        # or the DomainARN field to send data to Amazon OpenSearch Service.
        @[JSON::Field(key: "ClusterEndpoint")]
        getter cluster_endpoint : String?

        # Indicates the method for setting up document ID. The supported methods are Firehose generated
        # document ID and OpenSearch Service generated document ID.
        @[JSON::Field(key: "DocumentIdOptions")]
        getter document_id_options : Types::DocumentIdOptions?

        # The ARN of the Amazon OpenSearch Service domain.
        @[JSON::Field(key: "DomainARN")]
        getter domain_arn : String?

        # The Amazon OpenSearch Service index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The Amazon OpenSearch Service index rotation period
        @[JSON::Field(key: "IndexRotationPeriod")]
        getter index_rotation_period : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The Amazon OpenSearch Service retry options.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::AmazonopensearchserviceRetryOptions?

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The Amazon S3 backup mode.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        # The Amazon OpenSearch Service type name. This applies to Elasticsearch 6.x and lower versions. For
        # Elasticsearch 7.x and OpenSearch Service 1.x, there's no value for TypeName.
        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        @[JSON::Field(key: "VpcConfigurationDescription")]
        getter vpc_configuration_description : Types::VpcConfigurationDescription?

        def initialize(
          @buffering_hints : Types::AmazonopensearchserviceBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @cluster_endpoint : String? = nil,
          @document_id_options : Types::DocumentIdOptions? = nil,
          @domain_arn : String? = nil,
          @index_name : String? = nil,
          @index_rotation_period : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::AmazonopensearchserviceRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @type_name : String? = nil,
          @vpc_configuration_description : Types::VpcConfigurationDescription? = nil
        )
        end
      end

      # Describes an update for a destination in Amazon OpenSearch Service.
      struct AmazonopensearchserviceDestinationUpdate
        include JSON::Serializable

        # The buffering options. If no value is specified, AmazonopensearchBufferingHints object default
        # values are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::AmazonopensearchserviceBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the cluster. Specify either this ClusterEndpoint or the
        # DomainARN field.
        @[JSON::Field(key: "ClusterEndpoint")]
        getter cluster_endpoint : String?

        # Indicates the method for setting up document ID. The supported methods are Firehose generated
        # document ID and OpenSearch Service generated document ID.
        @[JSON::Field(key: "DocumentIdOptions")]
        getter document_id_options : Types::DocumentIdOptions?

        # The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for
        # DescribeDomain, DescribeDomains, and DescribeDomainConfig after assuming the IAM role specified in
        # RoleARN.
        @[JSON::Field(key: "DomainARN")]
        getter domain_arn : String?

        # The Amazon OpenSearch Service index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The Amazon OpenSearch Service index rotation period. Index rotation appends a timestamp to IndexName
        # to facilitate the expiration of old data.
        @[JSON::Field(key: "IndexRotationPeriod")]
        getter index_rotation_period : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch Service. The
        # default value is 300 (5 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::AmazonopensearchserviceRetryOptions?

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the Amazon
        # OpenSearch Service Configuration API and for indexing documents.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        @[JSON::Field(key: "S3Update")]
        getter s3_update : Types::S3DestinationUpdate?

        # The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be only one type per
        # index. If you try to specify a new type for an existing index that already has another type,
        # Firehose returns an error during runtime. If you upgrade Elasticsearch from 6.x to 7.x and don’t
        # update your Firehose stream, Firehose still delivers data to Elasticsearch with the old index name
        # and type name. If you want to update your Firehose stream with a new index name, provide an empty
        # string for TypeName.
        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @buffering_hints : Types::AmazonopensearchserviceBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @cluster_endpoint : String? = nil,
          @document_id_options : Types::DocumentIdOptions? = nil,
          @domain_arn : String? = nil,
          @index_name : String? = nil,
          @index_rotation_period : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::AmazonopensearchserviceRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_update : Types::S3DestinationUpdate? = nil,
          @type_name : String? = nil
        )
        end
      end

      # Configures retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch
      # Service.
      struct AmazonopensearchserviceRetryOptions
        include JSON::Serializable

        # After an initial failure to deliver to Amazon OpenSearch Service, the total amount of time during
        # which Firehose retries delivery (including the first attempt). After this time has elapsed, the
        # failed documents are written to Amazon S3. Default value is 300 seconds (5 minutes). A value of 0
        # (zero) results in no retries.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      # The authentication configuration of the Amazon MSK cluster.
      struct AuthenticationConfiguration
        include JSON::Serializable

        # The type of connectivity used to access the Amazon MSK cluster.
        @[JSON::Field(key: "Connectivity")]
        getter connectivity : String

        # The ARN of the role used to access the Amazon MSK cluster.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @connectivity : String,
          @role_arn : String
        )
        end
      end

      # Describes hints for the buffering to perform before delivering data to the destination. These
      # options are treated as hints, and therefore Firehose might choose to use different values when it is
      # optimal. The SizeInMBs and IntervalInSeconds parameters are optional. However, if specify a value
      # for one of them, you must also provide a value for the other.
      struct BufferingHints
        include JSON::Serializable

        # Buffer incoming data for the specified period of time, in seconds, before delivering it to the
        # destination. The default value is 300. This parameter is optional but if you specify a value for it,
        # you must also specify a value for SizeInMBs , and vice versa.
        @[JSON::Field(key: "IntervalInSeconds")]
        getter interval_in_seconds : Int32?

        # Buffer incoming data to the specified size, in MiBs, before delivering it to the destination. The
        # default value is 5. This parameter is optional but if you specify a value for it, you must also
        # specify a value for IntervalInSeconds , and vice versa. We recommend setting this parameter to a
        # value greater than the amount of data you typically ingest into the Firehose stream in 10 seconds.
        # For example, if you typically ingest data at 1 MiB/sec, the value should be 10 MiB or higher.
        @[JSON::Field(key: "SizeInMBs")]
        getter size_in_m_bs : Int32?

        def initialize(
          @interval_in_seconds : Int32? = nil,
          @size_in_m_bs : Int32? = nil
        )
        end
      end

      # Describes the containers where the destination Apache Iceberg Tables are persisted.
      struct CatalogConfiguration
        include JSON::Serializable

        # Specifies the Glue catalog ARN identifier of the destination Apache Iceberg Tables. You must specify
        # the ARN in the format arn:aws:glue:region:account-id:catalog .
        @[JSON::Field(key: "CatalogARN")]
        getter catalog_arn : String?

        # The warehouse location for Apache Iceberg tables. You must configure this when schema evolution and
        # table creation is enabled. Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "WarehouseLocation")]
        getter warehouse_location : String?

        def initialize(
          @catalog_arn : String? = nil,
          @warehouse_location : String? = nil
        )
        end
      end

      # Describes the Amazon CloudWatch logging options for your Firehose stream.
      struct CloudWatchLoggingOptions
        include JSON::Serializable

        # Enables or disables CloudWatch logging.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The CloudWatch group name for logging. This value is required if CloudWatch logging is enabled.
        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String?

        # The CloudWatch log stream name for logging. This value is required if CloudWatch logging is enabled.
        @[JSON::Field(key: "LogStreamName")]
        getter log_stream_name : String?

        def initialize(
          @enabled : Bool? = nil,
          @log_group_name : String? = nil,
          @log_stream_name : String? = nil
        )
        end
      end

      # Another modification has already happened. Fetch VersionId again and use it to update the
      # destination.
      struct ConcurrentModificationException
        include JSON::Serializable

        # A message that provides information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a COPY command for Amazon Redshift.
      struct CopyCommand
        include JSON::Serializable

        # The name of the target table. The table must already exist in the database.
        @[JSON::Field(key: "DataTableName")]
        getter data_table_name : String

        # Optional parameters to use with the Amazon Redshift COPY command. For more information, see the
        # "Optional Parameters" section of Amazon Redshift COPY command . Some possible examples that would
        # apply to Firehose are as follows: delimiter '\t' lzop; - fields are delimited with "\t" (TAB
        # character) and compressed using lzop. delimiter '|' - fields are delimited with "|" (this is the
        # default delimiter). delimiter '|' escape - the delimiter should be escaped. fixedwidth
        # 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6' - fields are fixed width in the
        # source, with each width specified after every column in the table. JSON
        # 's3://mybucket/jsonpaths.txt' - data is in JSON format, and the path specified is the format of the
        # data. For more examples, see Amazon Redshift COPY command examples .
        @[JSON::Field(key: "CopyOptions")]
        getter copy_options : String?

        # A comma-separated list of column names.
        @[JSON::Field(key: "DataTableColumns")]
        getter data_table_columns : String?

        def initialize(
          @data_table_name : String,
          @copy_options : String? = nil,
          @data_table_columns : String? = nil
        )
        end
      end

      struct CreateDeliveryStreamInput
        include JSON::Serializable

        # The name of the Firehose stream. This name must be unique per Amazon Web Services account in the
        # same Amazon Web Services Region. If the Firehose streams are in different accounts or different
        # Regions, you can have multiple Firehose streams with the same name.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # The destination in the Serverless offering for Amazon OpenSearch Service. You can specify only one
        # destination.
        @[JSON::Field(key: "AmazonOpenSearchServerlessDestinationConfiguration")]
        getter amazon_open_search_serverless_destination_configuration : Types::AmazonOpenSearchServerlessDestinationConfiguration?

        # The destination in Amazon OpenSearch Service. You can specify only one destination.
        @[JSON::Field(key: "AmazonopensearchserviceDestinationConfiguration")]
        getter amazonopensearchservice_destination_configuration : Types::AmazonopensearchserviceDestinationConfiguration?

        # The top level object for configuring streams with database as a source. Amazon Data Firehose is in
        # preview release and is subject to change.
        @[JSON::Field(key: "DatabaseSourceConfiguration")]
        getter database_source_configuration : Types::DatabaseSourceConfiguration?

        # Used to specify the type and Amazon Resource Name (ARN) of the KMS key needed for Server-Side
        # Encryption (SSE).
        @[JSON::Field(key: "DeliveryStreamEncryptionConfigurationInput")]
        getter delivery_stream_encryption_configuration_input : Types::DeliveryStreamEncryptionConfigurationInput?

        # The Firehose stream type. This parameter can be one of the following values: DirectPut : Provider
        # applications access the Firehose stream directly. KinesisStreamAsSource : The Firehose stream uses a
        # Kinesis data stream as a source.
        @[JSON::Field(key: "DeliveryStreamType")]
        getter delivery_stream_type : String?

        # The structure that configures parameters such as ThroughputHintInMBs for a stream configured with
        # Direct PUT as a source.
        @[JSON::Field(key: "DirectPutSourceConfiguration")]
        getter direct_put_source_configuration : Types::DirectPutSourceConfiguration?

        # The destination in Amazon OpenSearch Service. You can specify only one destination.
        @[JSON::Field(key: "ElasticsearchDestinationConfiguration")]
        getter elasticsearch_destination_configuration : Types::ElasticsearchDestinationConfiguration?

        # The destination in Amazon S3. You can specify only one destination.
        @[JSON::Field(key: "ExtendedS3DestinationConfiguration")]
        getter extended_s3_destination_configuration : Types::ExtendedS3DestinationConfiguration?

        # Enables configuring Kinesis Firehose to deliver data to any HTTP endpoint destination. You can
        # specify only one destination.
        @[JSON::Field(key: "HttpEndpointDestinationConfiguration")]
        getter http_endpoint_destination_configuration : Types::HttpEndpointDestinationConfiguration?

        # Configure Apache Iceberg Tables destination.
        @[JSON::Field(key: "IcebergDestinationConfiguration")]
        getter iceberg_destination_configuration : Types::IcebergDestinationConfiguration?

        # When a Kinesis data stream is used as the source for the Firehose stream, a
        # KinesisStreamSourceConfiguration containing the Kinesis data stream Amazon Resource Name (ARN) and
        # the role ARN for the source stream.
        @[JSON::Field(key: "KinesisStreamSourceConfiguration")]
        getter kinesis_stream_source_configuration : Types::KinesisStreamSourceConfiguration?

        @[JSON::Field(key: "MSKSourceConfiguration")]
        getter msk_source_configuration : Types::MSKSourceConfiguration?

        # The destination in Amazon Redshift. You can specify only one destination.
        @[JSON::Field(key: "RedshiftDestinationConfiguration")]
        getter redshift_destination_configuration : Types::RedshiftDestinationConfiguration?

        # [Deprecated] The destination in Amazon S3. You can specify only one destination.
        @[JSON::Field(key: "S3DestinationConfiguration")]
        getter s3_destination_configuration : Types::S3DestinationConfiguration?

        # Configure Snowflake destination
        @[JSON::Field(key: "SnowflakeDestinationConfiguration")]
        getter snowflake_destination_configuration : Types::SnowflakeDestinationConfiguration?

        # The destination in Splunk. You can specify only one destination.
        @[JSON::Field(key: "SplunkDestinationConfiguration")]
        getter splunk_destination_configuration : Types::SplunkDestinationConfiguration?

        # A set of tags to assign to the Firehose stream. A tag is a key-value pair that you can define and
        # assign to Amazon Web Services resources. Tags are metadata. For example, you can add friendly names
        # and descriptions or other types of information that can help you distinguish the Firehose stream.
        # For more information about tags, see Using Cost Allocation Tags in the Amazon Web Services Billing
        # and Cost Management User Guide. You can specify up to 50 tags when creating a Firehose stream. If
        # you specify tags in the CreateDeliveryStream action, Amazon Data Firehose performs an additional
        # authorization on the firehose:TagDeliveryStream action to verify if users have permissions to create
        # tags. If you do not provide this permission, requests to create new Firehose streams with IAM
        # resource tags will fail with an AccessDeniedException such as following. AccessDeniedException User:
        # arn:aws:sts::x:assumed-role/x/x is not authorized to perform: firehose:TagDeliveryStream on
        # resource: arn:aws:firehose:us-east-1:x:deliverystream/x with an explicit deny in an identity-based
        # policy. For an example IAM policy, see Tag example.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @delivery_stream_name : String,
          @amazon_open_search_serverless_destination_configuration : Types::AmazonOpenSearchServerlessDestinationConfiguration? = nil,
          @amazonopensearchservice_destination_configuration : Types::AmazonopensearchserviceDestinationConfiguration? = nil,
          @database_source_configuration : Types::DatabaseSourceConfiguration? = nil,
          @delivery_stream_encryption_configuration_input : Types::DeliveryStreamEncryptionConfigurationInput? = nil,
          @delivery_stream_type : String? = nil,
          @direct_put_source_configuration : Types::DirectPutSourceConfiguration? = nil,
          @elasticsearch_destination_configuration : Types::ElasticsearchDestinationConfiguration? = nil,
          @extended_s3_destination_configuration : Types::ExtendedS3DestinationConfiguration? = nil,
          @http_endpoint_destination_configuration : Types::HttpEndpointDestinationConfiguration? = nil,
          @iceberg_destination_configuration : Types::IcebergDestinationConfiguration? = nil,
          @kinesis_stream_source_configuration : Types::KinesisStreamSourceConfiguration? = nil,
          @msk_source_configuration : Types::MSKSourceConfiguration? = nil,
          @redshift_destination_configuration : Types::RedshiftDestinationConfiguration? = nil,
          @s3_destination_configuration : Types::S3DestinationConfiguration? = nil,
          @snowflake_destination_configuration : Types::SnowflakeDestinationConfiguration? = nil,
          @splunk_destination_configuration : Types::SplunkDestinationConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDeliveryStreamOutput
        include JSON::Serializable

        # The ARN of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamARN")]
        getter delivery_stream_arn : String?

        def initialize(
          @delivery_stream_arn : String? = nil
        )
        end
      end

      # Specifies that you want Firehose to convert data from the JSON format to the Parquet or ORC format
      # before writing it to Amazon S3. Firehose uses the serializer and deserializer that you specify, in
      # addition to the column information from the Amazon Web Services Glue table, to deserialize your
      # input data from JSON and then serialize it to the Parquet or ORC format. For more information, see
      # Firehose Record Format Conversion .
      struct DataFormatConversionConfiguration
        include JSON::Serializable

        # Defaults to true . Set it to false if you want to disable format conversion while preserving the
        # configuration details.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies the deserializer that you want Firehose to use to convert the format of your data from
        # JSON. This parameter is required if Enabled is set to true.
        @[JSON::Field(key: "InputFormatConfiguration")]
        getter input_format_configuration : Types::InputFormatConfiguration?

        # Specifies the serializer that you want Firehose to use to convert the format of your data to the
        # Parquet or ORC format. This parameter is required if Enabled is set to true.
        @[JSON::Field(key: "OutputFormatConfiguration")]
        getter output_format_configuration : Types::OutputFormatConfiguration?

        # Specifies the Amazon Web Services Glue Data Catalog table that contains the column information. This
        # parameter is required if Enabled is set to true.
        @[JSON::Field(key: "SchemaConfiguration")]
        getter schema_configuration : Types::SchemaConfiguration?

        def initialize(
          @enabled : Bool? = nil,
          @input_format_configuration : Types::InputFormatConfiguration? = nil,
          @output_format_configuration : Types::OutputFormatConfiguration? = nil,
          @schema_configuration : Types::SchemaConfiguration? = nil
        )
        end
      end

      # The structure used to configure the list of column patterns in source database endpoint for Firehose
      # to read from. Amazon Data Firehose is in preview release and is subject to change.
      struct DatabaseColumnList
        include JSON::Serializable

        # The list of column patterns in source database to be excluded for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Exclude")]
        getter exclude : Array(String)?

        # The list of column patterns in source database to be included for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Include")]
        getter include : Array(String)?

        def initialize(
          @exclude : Array(String)? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      # The structure used to configure the list of database patterns in source database endpoint for
      # Firehose to read from. Amazon Data Firehose is in preview release and is subject to change.
      struct DatabaseList
        include JSON::Serializable

        # The list of database patterns in source database endpoint to be excluded for Firehose to read from.
        # Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Exclude")]
        getter exclude : Array(String)?

        # The list of database patterns in source database endpoint to be included for Firehose to read from.
        # Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Include")]
        getter include : Array(String)?

        def initialize(
          @exclude : Array(String)? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      # The structure that describes the snapshot information of a table in source database endpoint that
      # Firehose reads. Amazon Data Firehose is in preview release and is subject to change.
      struct DatabaseSnapshotInfo
        include JSON::Serializable

        # The identifier of the current snapshot of the table in source database endpoint. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The timestamp when the current snapshot is taken on the table. Amazon Data Firehose is in preview
        # release and is subject to change.
        @[JSON::Field(key: "RequestTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter request_timestamp : Time

        # The principal that sent the request to take the current snapshot on the table. Amazon Data Firehose
        # is in preview release and is subject to change.
        @[JSON::Field(key: "RequestedBy")]
        getter requested_by : String

        # The status of the current snapshot of the table. Amazon Data Firehose is in preview release and is
        # subject to change.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The fully qualified name of the table in source database endpoint that Firehose reads. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Table")]
        getter table : String

        @[JSON::Field(key: "FailureDescription")]
        getter failure_description : Types::FailureDescription?

        def initialize(
          @id : String,
          @request_timestamp : Time,
          @requested_by : String,
          @status : String,
          @table : String,
          @failure_description : Types::FailureDescription? = nil
        )
        end
      end

      # The structure to configure the authentication methods for Firehose to connect to source database
      # endpoint. Amazon Data Firehose is in preview release and is subject to change.
      struct DatabaseSourceAuthenticationConfiguration
        include JSON::Serializable

        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration

        def initialize(
          @secrets_manager_configuration : Types::SecretsManagerConfiguration
        )
        end
      end

      # The top level object for configuring streams with database as a source. Amazon Data Firehose is in
      # preview release and is subject to change.
      struct DatabaseSourceConfiguration
        include JSON::Serializable

        # The structure to configure the authentication methods for Firehose to connect to source database
        # endpoint. Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "DatabaseSourceAuthenticationConfiguration")]
        getter database_source_authentication_configuration : Types::DatabaseSourceAuthenticationConfiguration

        # The details of the VPC Endpoint Service which Firehose uses to create a PrivateLink to the database.
        # Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "DatabaseSourceVPCConfiguration")]
        getter database_source_vpc_configuration : Types::DatabaseSourceVPCConfiguration

        # The list of database patterns in source database endpoint for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Databases")]
        getter databases : Types::DatabaseList

        # The endpoint of the database server. Amazon Data Firehose is in preview release and is subject to
        # change.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String

        # The port of the database. This can be one of the following values. 3306 for MySQL database type 5432
        # for PostgreSQL database type Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Port")]
        getter port : Int32

        # The fully qualified name of the table in source database endpoint that Firehose uses to track
        # snapshot progress. Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "SnapshotWatermarkTable")]
        getter snapshot_watermark_table : String

        # The list of table patterns in source database endpoint for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Tables")]
        getter tables : Types::DatabaseTableList

        # The type of database engine. This can be one of the following values. MySQL PostgreSQL Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The list of column patterns in source database endpoint for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Columns")]
        getter columns : Types::DatabaseColumnList?

        # The mode to enable or disable SSL when Firehose connects to the database endpoint. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "SSLMode")]
        getter ssl_mode : String?

        # The optional list of table and column names used as unique key columns when taking snapshot if the
        # tables don’t have primary keys configured. Amazon Data Firehose is in preview release and is subject
        # to change.
        @[JSON::Field(key: "SurrogateKeys")]
        getter surrogate_keys : Array(String)?

        def initialize(
          @database_source_authentication_configuration : Types::DatabaseSourceAuthenticationConfiguration,
          @database_source_vpc_configuration : Types::DatabaseSourceVPCConfiguration,
          @databases : Types::DatabaseList,
          @endpoint : String,
          @port : Int32,
          @snapshot_watermark_table : String,
          @tables : Types::DatabaseTableList,
          @type : String,
          @columns : Types::DatabaseColumnList? = nil,
          @ssl_mode : String? = nil,
          @surrogate_keys : Array(String)? = nil
        )
        end
      end

      # The top level object for database source description. Amazon Data Firehose is in preview release and
      # is subject to change.
      struct DatabaseSourceDescription
        include JSON::Serializable

        # The list of column patterns in source database endpoint for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Columns")]
        getter columns : Types::DatabaseColumnList?

        # The structure to configure the authentication methods for Firehose to connect to source database
        # endpoint. Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "DatabaseSourceAuthenticationConfiguration")]
        getter database_source_authentication_configuration : Types::DatabaseSourceAuthenticationConfiguration?

        # The details of the VPC Endpoint Service which Firehose uses to create a PrivateLink to the database.
        # Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "DatabaseSourceVPCConfiguration")]
        getter database_source_vpc_configuration : Types::DatabaseSourceVPCConfiguration?

        # The list of database patterns in source database endpoint for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Databases")]
        getter databases : Types::DatabaseList?

        # The endpoint of the database server. Amazon Data Firehose is in preview release and is subject to
        # change.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The port of the database. This can be one of the following values. 3306 for MySQL database type 5432
        # for PostgreSQL database type Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The mode to enable or disable SSL when Firehose connects to the database endpoint. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "SSLMode")]
        getter ssl_mode : String?

        # The structure that describes the snapshot information of a table in source database endpoint that
        # Firehose reads. Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "SnapshotInfo")]
        getter snapshot_info : Array(Types::DatabaseSnapshotInfo)?

        # The fully qualified name of the table in source database endpoint that Firehose uses to track
        # snapshot progress. Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "SnapshotWatermarkTable")]
        getter snapshot_watermark_table : String?

        # The optional list of table and column names used as unique key columns when taking snapshot if the
        # tables don’t have primary keys configured. Amazon Data Firehose is in preview release and is subject
        # to change.
        @[JSON::Field(key: "SurrogateKeys")]
        getter surrogate_keys : Array(String)?

        # The list of table patterns in source database endpoint for Firehose to read from. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Tables")]
        getter tables : Types::DatabaseTableList?

        # The type of database engine. This can be one of the following values. MySQL PostgreSQL Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @columns : Types::DatabaseColumnList? = nil,
          @database_source_authentication_configuration : Types::DatabaseSourceAuthenticationConfiguration? = nil,
          @database_source_vpc_configuration : Types::DatabaseSourceVPCConfiguration? = nil,
          @databases : Types::DatabaseList? = nil,
          @endpoint : String? = nil,
          @port : Int32? = nil,
          @ssl_mode : String? = nil,
          @snapshot_info : Array(Types::DatabaseSnapshotInfo)? = nil,
          @snapshot_watermark_table : String? = nil,
          @surrogate_keys : Array(String)? = nil,
          @tables : Types::DatabaseTableList? = nil,
          @type : String? = nil
        )
        end
      end

      # The structure for details of the VPC Endpoint Service which Firehose uses to create a PrivateLink to
      # the database. Amazon Data Firehose is in preview release and is subject to change.
      struct DatabaseSourceVPCConfiguration
        include JSON::Serializable

        # The VPC endpoint service name which Firehose uses to create a PrivateLink to the database. The
        # endpoint service must have the Firehose service principle firehose.amazonaws.com as an allowed
        # principal on the VPC endpoint service. The VPC endpoint service name is a string that looks like
        # com.amazonaws.vpce.&lt;region&gt;.&lt;vpc-endpoint-service-id&gt; . Amazon Data Firehose is in
        # preview release and is subject to change.
        @[JSON::Field(key: "VpcEndpointServiceName")]
        getter vpc_endpoint_service_name : String

        def initialize(
          @vpc_endpoint_service_name : String
        )
        end
      end

      # The structure used to configure the list of table patterns in source database endpoint for Firehose
      # to read from. Amazon Data Firehose is in preview release and is subject to change.
      struct DatabaseTableList
        include JSON::Serializable

        # The list of table patterns in source database endpoint to be excluded for Firehose to read from.
        # Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Exclude")]
        getter exclude : Array(String)?

        # The list of table patterns in source database endpoint to be included for Firehose to read from.
        # Amazon Data Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "Include")]
        getter include : Array(String)?

        def initialize(
          @exclude : Array(String)? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      struct DeleteDeliveryStreamInput
        include JSON::Serializable

        # The name of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # Set this to true if you want to delete the Firehose stream even if Firehose is unable to retire the
        # grant for the CMK. Firehose might be unable to retire the grant due to a customer error, such as
        # when the CMK or the grant are in an invalid state. If you force deletion, you can then use the
        # RevokeGrant operation to revoke the grant you gave to Firehose. If a failure to retire the grant
        # happens due to an Amazon Web Services KMS issue, Firehose keeps retrying the delete operation. The
        # default value is false.
        @[JSON::Field(key: "AllowForceDelete")]
        getter allow_force_delete : Bool?

        def initialize(
          @delivery_stream_name : String,
          @allow_force_delete : Bool? = nil
        )
        end
      end

      struct DeleteDeliveryStreamOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a Firehose stream.
      struct DeliveryStreamDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Firehose stream. For more information, see Amazon Resource
        # Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "DeliveryStreamARN")]
        getter delivery_stream_arn : String

        # The name of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # The status of the Firehose stream. If the status of a Firehose stream is CREATING_FAILED , this
        # status doesn't change, and you can't invoke CreateDeliveryStream again on it. However, you can
        # invoke the DeleteDeliveryStream operation to delete it.
        @[JSON::Field(key: "DeliveryStreamStatus")]
        getter delivery_stream_status : String

        # The Firehose stream type. This can be one of the following values: DirectPut : Provider applications
        # access the Firehose stream directly. KinesisStreamAsSource : The Firehose stream uses a Kinesis data
        # stream as a source.
        @[JSON::Field(key: "DeliveryStreamType")]
        getter delivery_stream_type : String

        # The destinations.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::DestinationDescription)

        # Indicates whether there are more destinations available to list.
        @[JSON::Field(key: "HasMoreDestinations")]
        getter has_more_destinations : Bool

        # Each time the destination is updated for a Firehose stream, the version ID is changed, and the
        # current version ID is required when updating the destination. This is so that the service knows it
        # is applying the changes to the correct version of the delivery stream.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # The date and time that the Firehose stream was created.
        @[JSON::Field(key: "CreateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time?

        # Indicates the server-side encryption (SSE) status for the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamEncryptionConfiguration")]
        getter delivery_stream_encryption_configuration : Types::DeliveryStreamEncryptionConfiguration?

        # Provides details in case one of the following operations fails due to an error related to KMS:
        # CreateDeliveryStream , DeleteDeliveryStream , StartDeliveryStreamEncryption ,
        # StopDeliveryStreamEncryption .
        @[JSON::Field(key: "FailureDescription")]
        getter failure_description : Types::FailureDescription?

        # The date and time that the Firehose stream was last updated.
        @[JSON::Field(key: "LastUpdateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_timestamp : Time?

        # If the DeliveryStreamType parameter is KinesisStreamAsSource , a SourceDescription object describing
        # the source Kinesis data stream.
        @[JSON::Field(key: "Source")]
        getter source : Types::SourceDescription?

        def initialize(
          @delivery_stream_arn : String,
          @delivery_stream_name : String,
          @delivery_stream_status : String,
          @delivery_stream_type : String,
          @destinations : Array(Types::DestinationDescription),
          @has_more_destinations : Bool,
          @version_id : String,
          @create_timestamp : Time? = nil,
          @delivery_stream_encryption_configuration : Types::DeliveryStreamEncryptionConfiguration? = nil,
          @failure_description : Types::FailureDescription? = nil,
          @last_update_timestamp : Time? = nil,
          @source : Types::SourceDescription? = nil
        )
        end
      end

      # Contains information about the server-side encryption (SSE) status for the delivery stream, the type
      # customer master key (CMK) in use, if any, and the ARN of the CMK. You can get
      # DeliveryStreamEncryptionConfiguration by invoking the DescribeDeliveryStream operation.
      struct DeliveryStreamEncryptionConfiguration
        include JSON::Serializable

        # Provides details in case one of the following operations fails due to an error related to KMS:
        # CreateDeliveryStream , DeleteDeliveryStream , StartDeliveryStreamEncryption ,
        # StopDeliveryStreamEncryption .
        @[JSON::Field(key: "FailureDescription")]
        getter failure_description : Types::FailureDescription?

        # If KeyType is CUSTOMER_MANAGED_CMK , this field contains the ARN of the customer managed CMK. If
        # KeyType is Amazon Web Services_OWNED_CMK , DeliveryStreamEncryptionConfiguration doesn't contain a
        # value for KeyARN .
        @[JSON::Field(key: "KeyARN")]
        getter key_arn : String?

        # Indicates the type of customer master key (CMK) that is used for encryption. The default setting is
        # Amazon Web Services_OWNED_CMK . For more information about CMKs, see Customer Master Keys (CMKs) .
        @[JSON::Field(key: "KeyType")]
        getter key_type : String?

        # This is the server-side encryption (SSE) status for the Firehose stream. For a full description of
        # the different values of this status, see StartDeliveryStreamEncryption and
        # StopDeliveryStreamEncryption . If this status is ENABLING_FAILED or DISABLING_FAILED , it is the
        # status of the most recent attempt to enable or disable SSE, respectively.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @failure_description : Types::FailureDescription? = nil,
          @key_arn : String? = nil,
          @key_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the type and Amazon Resource Name (ARN) of the CMK to use for Server-Side Encryption
      # (SSE).
      struct DeliveryStreamEncryptionConfigurationInput
        include JSON::Serializable

        # Indicates the type of customer master key (CMK) to use for encryption. The default setting is Amazon
        # Web Services_OWNED_CMK . For more information about CMKs, see Customer Master Keys (CMKs) . When you
        # invoke CreateDeliveryStream or StartDeliveryStreamEncryption with KeyType set to
        # CUSTOMER_MANAGED_CMK, Firehose invokes the Amazon KMS operation CreateGrant to create a grant that
        # allows the Firehose service to use the customer managed CMK to perform encryption and decryption.
        # Firehose manages that grant. When you invoke StartDeliveryStreamEncryption to change the CMK for a
        # Firehose stream that is encrypted with a customer managed CMK, Firehose schedules the grant it had
        # on the old CMK for retirement. You can use a CMK of type CUSTOMER_MANAGED_CMK to encrypt up to 500
        # Firehose streams. If a CreateDeliveryStream or StartDeliveryStreamEncryption operation exceeds this
        # limit, Firehose throws a LimitExceededException . To encrypt your Firehose stream, use symmetric
        # CMKs. Firehose doesn't support asymmetric CMKs. For information about symmetric and asymmetric CMKs,
        # see About Symmetric and Asymmetric CMKs in the Amazon Web Services Key Management Service developer
        # guide.
        @[JSON::Field(key: "KeyType")]
        getter key_type : String

        # If you set KeyType to CUSTOMER_MANAGED_CMK , you must specify the Amazon Resource Name (ARN) of the
        # CMK. If you set KeyType to Amazon Web Services_OWNED_CMK , Firehose uses a service-account CMK.
        @[JSON::Field(key: "KeyARN")]
        getter key_arn : String?

        def initialize(
          @key_type : String,
          @key_arn : String? = nil
        )
        end
      end

      struct DescribeDeliveryStreamInput
        include JSON::Serializable

        # The name of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # The ID of the destination to start returning the destination information. Firehose supports one
        # destination per Firehose stream.
        @[JSON::Field(key: "ExclusiveStartDestinationId")]
        getter exclusive_start_destination_id : String?

        # The limit on the number of destinations to return. You can have one destination per Firehose stream.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @delivery_stream_name : String,
          @exclusive_start_destination_id : String? = nil,
          @limit : Int32? = nil
        )
        end
      end

      struct DescribeDeliveryStreamOutput
        include JSON::Serializable

        # Information about the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamDescription")]
        getter delivery_stream_description : Types::DeliveryStreamDescription

        def initialize(
          @delivery_stream_description : Types::DeliveryStreamDescription
        )
        end
      end

      # The deserializer you want Firehose to use for converting the input data from JSON. Firehose then
      # serializes the data to its final format using the Serializer . Firehose supports two types of
      # deserializers: the Apache Hive JSON SerDe and the OpenX JSON SerDe .
      struct Deserializer
        include JSON::Serializable

        # The native Hive / HCatalog JsonSerDe. Used by Firehose for deserializing data, which means
        # converting it from the JSON format in preparation for serializing it to the Parquet or ORC format.
        # This is one of two deserializers you can choose, depending on which one offers the functionality you
        # need. The other option is the OpenX SerDe.
        @[JSON::Field(key: "HiveJsonSerDe")]
        getter hive_json_ser_de : Types::HiveJsonSerDe?

        # The OpenX SerDe. Used by Firehose for deserializing data, which means converting it from the JSON
        # format in preparation for serializing it to the Parquet or ORC format. This is one of two
        # deserializers you can choose, depending on which one offers the functionality you need. The other
        # option is the native Hive / HCatalog JsonSerDe.
        @[JSON::Field(key: "OpenXJsonSerDe")]
        getter open_x_json_ser_de : Types::OpenXJsonSerDe?

        def initialize(
          @hive_json_ser_de : Types::HiveJsonSerDe? = nil,
          @open_x_json_ser_de : Types::OpenXJsonSerDe? = nil
        )
        end
      end

      # Describes the destination for a Firehose stream.
      struct DestinationDescription
        include JSON::Serializable

        # The ID of the destination.
        @[JSON::Field(key: "DestinationId")]
        getter destination_id : String

        # The destination in the Serverless offering for Amazon OpenSearch Service.
        @[JSON::Field(key: "AmazonOpenSearchServerlessDestinationDescription")]
        getter amazon_open_search_serverless_destination_description : Types::AmazonOpenSearchServerlessDestinationDescription?

        # The destination in Amazon OpenSearch Service.
        @[JSON::Field(key: "AmazonopensearchserviceDestinationDescription")]
        getter amazonopensearchservice_destination_description : Types::AmazonopensearchserviceDestinationDescription?

        # The destination in Amazon OpenSearch Service.
        @[JSON::Field(key: "ElasticsearchDestinationDescription")]
        getter elasticsearch_destination_description : Types::ElasticsearchDestinationDescription?

        # The destination in Amazon S3.
        @[JSON::Field(key: "ExtendedS3DestinationDescription")]
        getter extended_s3_destination_description : Types::ExtendedS3DestinationDescription?

        # Describes the specified HTTP endpoint destination.
        @[JSON::Field(key: "HttpEndpointDestinationDescription")]
        getter http_endpoint_destination_description : Types::HttpEndpointDestinationDescription?

        # Describes a destination in Apache Iceberg Tables.
        @[JSON::Field(key: "IcebergDestinationDescription")]
        getter iceberg_destination_description : Types::IcebergDestinationDescription?

        # The destination in Amazon Redshift.
        @[JSON::Field(key: "RedshiftDestinationDescription")]
        getter redshift_destination_description : Types::RedshiftDestinationDescription?

        # [Deprecated] The destination in Amazon S3.
        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        # Optional description for the destination
        @[JSON::Field(key: "SnowflakeDestinationDescription")]
        getter snowflake_destination_description : Types::SnowflakeDestinationDescription?

        # The destination in Splunk.
        @[JSON::Field(key: "SplunkDestinationDescription")]
        getter splunk_destination_description : Types::SplunkDestinationDescription?

        def initialize(
          @destination_id : String,
          @amazon_open_search_serverless_destination_description : Types::AmazonOpenSearchServerlessDestinationDescription? = nil,
          @amazonopensearchservice_destination_description : Types::AmazonopensearchserviceDestinationDescription? = nil,
          @elasticsearch_destination_description : Types::ElasticsearchDestinationDescription? = nil,
          @extended_s3_destination_description : Types::ExtendedS3DestinationDescription? = nil,
          @http_endpoint_destination_description : Types::HttpEndpointDestinationDescription? = nil,
          @iceberg_destination_description : Types::IcebergDestinationDescription? = nil,
          @redshift_destination_description : Types::RedshiftDestinationDescription? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @snowflake_destination_description : Types::SnowflakeDestinationDescription? = nil,
          @splunk_destination_description : Types::SplunkDestinationDescription? = nil
        )
        end
      end

      # Describes the configuration of a destination in Apache Iceberg Tables.
      struct DestinationTableConfiguration
        include JSON::Serializable

        # The name of the Apache Iceberg database.
        @[JSON::Field(key: "DestinationDatabaseName")]
        getter destination_database_name : String

        # Specifies the name of the Apache Iceberg Table.
        @[JSON::Field(key: "DestinationTableName")]
        getter destination_table_name : String

        # The partition spec configuration for a table that is used by automatic table creation. Amazon Data
        # Firehose is in preview release and is subject to change.
        @[JSON::Field(key: "PartitionSpec")]
        getter partition_spec : Types::PartitionSpec?

        # The table specific S3 error output prefix. All the errors that occurred while delivering to this
        # table will be prefixed with this value in S3 destination.
        @[JSON::Field(key: "S3ErrorOutputPrefix")]
        getter s3_error_output_prefix : String?

        # A list of unique keys for a given Apache Iceberg table. Firehose will use these for running Create,
        # Update, or Delete operations on the given Iceberg table.
        @[JSON::Field(key: "UniqueKeys")]
        getter unique_keys : Array(String)?

        def initialize(
          @destination_database_name : String,
          @destination_table_name : String,
          @partition_spec : Types::PartitionSpec? = nil,
          @s3_error_output_prefix : String? = nil,
          @unique_keys : Array(String)? = nil
        )
        end
      end

      # The structure that configures parameters such as ThroughputHintInMBs for a stream configured with
      # Direct PUT as a source.
      struct DirectPutSourceConfiguration
        include JSON::Serializable

        # The value that you configure for this parameter is for information purpose only and does not affect
        # Firehose delivery throughput limit. You can use the Firehose Limits form to request a throughput
        # limit increase.
        @[JSON::Field(key: "ThroughputHintInMBs")]
        getter throughput_hint_in_m_bs : Int32

        def initialize(
          @throughput_hint_in_m_bs : Int32
        )
        end
      end

      # The structure that configures parameters such as ThroughputHintInMBs for a stream configured with
      # Direct PUT as a source.
      struct DirectPutSourceDescription
        include JSON::Serializable

        # The value that you configure for this parameter is for information purpose only and does not affect
        # Firehose delivery throughput limit. You can use the Firehose Limits form to request a throughput
        # limit increase.
        @[JSON::Field(key: "ThroughputHintInMBs")]
        getter throughput_hint_in_m_bs : Int32?

        def initialize(
          @throughput_hint_in_m_bs : Int32? = nil
        )
        end
      end

      # Indicates the method for setting up document ID. The supported methods are Firehose generated
      # document ID and OpenSearch Service generated document ID.
      struct DocumentIdOptions
        include JSON::Serializable

        # When the FIREHOSE_DEFAULT option is chosen, Firehose generates a unique document ID for each record
        # based on a unique internal identifier. The generated document ID is stable across multiple delivery
        # attempts, which helps prevent the same record from being indexed multiple times with different
        # document IDs. When the NO_DOCUMENT_ID option is chosen, Firehose does not include any document IDs
        # in the requests it sends to the Amazon OpenSearch Service. This causes the Amazon OpenSearch Service
        # domain to generate document IDs. In case of multiple delivery attempts, this may cause the same
        # record to be indexed more than once with different document IDs. This option enables write-heavy
        # operations, such as the ingestion of logs and observability data, to consume less resources in the
        # Amazon OpenSearch Service domain, resulting in improved performance.
        @[JSON::Field(key: "DefaultDocumentIdFormat")]
        getter default_document_id_format : String

        def initialize(
          @default_document_id_format : String
        )
        end
      end

      # The configuration of the dynamic partitioning mechanism that creates smaller data sets from the
      # streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only
      # supported for Amazon S3 destinations.
      struct DynamicPartitioningConfiguration
        include JSON::Serializable

        # Specifies that the dynamic partitioning is enabled for this Firehose stream.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The retry behavior in case Firehose is unable to deliver data to an Amazon S3 prefix.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::RetryOptions?

        def initialize(
          @enabled : Bool? = nil,
          @retry_options : Types::RetryOptions? = nil
        )
        end
      end

      # Describes the buffering to perform before delivering data to the Amazon OpenSearch Service
      # destination.
      struct ElasticsearchBufferingHints
        include JSON::Serializable

        # Buffer incoming data for the specified period of time, in seconds, before delivering it to the
        # destination. The default value is 300 (5 minutes).
        @[JSON::Field(key: "IntervalInSeconds")]
        getter interval_in_seconds : Int32?

        # Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The
        # default value is 5. We recommend setting this parameter to a value greater than the amount of data
        # you typically ingest into the Firehose stream in 10 seconds. For example, if you typically ingest
        # data at 1 MB/sec, the value should be 10 MB or higher.
        @[JSON::Field(key: "SizeInMBs")]
        getter size_in_m_bs : Int32?

        def initialize(
          @interval_in_seconds : Int32? = nil,
          @size_in_m_bs : Int32? = nil
        )
        end
      end

      # Describes the configuration of a destination in Amazon OpenSearch Service.
      struct ElasticsearchDestinationConfiguration
        include JSON::Serializable

        # The Elasticsearch index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the Amazon
        # OpenSearch Service Configuration API and for indexing documents. For more information, see Grant
        # Firehose Access to an Amazon S3 Destination and Amazon Resource Names (ARNs) and Amazon Web Services
        # Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The configuration for the backup Amazon S3 location.
        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # The buffering options. If no value is specified, the default values for ElasticsearchBufferingHints
        # are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::ElasticsearchBufferingHints?

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the cluster. Specify either this ClusterEndpoint or the
        # DomainARN field.
        @[JSON::Field(key: "ClusterEndpoint")]
        getter cluster_endpoint : String?

        # Indicates the method for setting up document ID. The supported methods are Firehose generated
        # document ID and OpenSearch Service generated document ID.
        @[JSON::Field(key: "DocumentIdOptions")]
        getter document_id_options : Types::DocumentIdOptions?

        # The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for
        # DescribeDomain , DescribeDomains , and DescribeDomainConfig after assuming the role specified in
        # RoleARN . For more information, see Amazon Resource Names (ARNs) and Amazon Web Services Service
        # Namespaces . Specify either ClusterEndpoint or DomainARN .
        @[JSON::Field(key: "DomainARN")]
        getter domain_arn : String?

        # The Elasticsearch index rotation period. Index rotation appends a timestamp to the IndexName to
        # facilitate the expiration of old data. For more information, see Index Rotation for the Amazon
        # OpenSearch Service Destination . The default value is OneDay .
        @[JSON::Field(key: "IndexRotationPeriod")]
        getter index_rotation_period : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch Service. The
        # default value is 300 (5 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::ElasticsearchRetryOptions?

        # Defines how documents should be delivered to Amazon S3. When it is set to FailedDocumentsOnly ,
        # Firehose writes any documents that could not be indexed to the configured Amazon S3 destination,
        # with AmazonOpenSearchService-failed/ appended to the key prefix. When set to AllDocuments , Firehose
        # delivers all incoming records to Amazon S3, and also writes failed documents with
        # AmazonOpenSearchService-failed/ appended to the prefix. For more information, see Amazon S3 Backup
        # for the Amazon OpenSearch Service Destination . Default value is FailedDocumentsOnly . You can't
        # change this backup mode after you create the Firehose stream.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The Elasticsearch type name. For Elasticsearch 6.x, there can be only one type per index. If you try
        # to specify a new type for an existing index that already has another type, Firehose returns an error
        # during run time. For Elasticsearch 7.x, don't specify a TypeName .
        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The details of the VPC of the Amazon destination.
        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @index_name : String,
          @role_arn : String,
          @s3_configuration : Types::S3DestinationConfiguration,
          @buffering_hints : Types::ElasticsearchBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @cluster_endpoint : String? = nil,
          @document_id_options : Types::DocumentIdOptions? = nil,
          @domain_arn : String? = nil,
          @index_rotation_period : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::ElasticsearchRetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @type_name : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      # The destination description in Amazon OpenSearch Service.
      struct ElasticsearchDestinationDescription
        include JSON::Serializable

        # The buffering options.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::ElasticsearchBufferingHints?

        # The Amazon CloudWatch logging options.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the cluster. Firehose uses either this ClusterEndpoint
        # or the DomainARN field to send data to Amazon OpenSearch Service.
        @[JSON::Field(key: "ClusterEndpoint")]
        getter cluster_endpoint : String?

        # Indicates the method for setting up document ID. The supported methods are Firehose generated
        # document ID and OpenSearch Service generated document ID.
        @[JSON::Field(key: "DocumentIdOptions")]
        getter document_id_options : Types::DocumentIdOptions?

        # The ARN of the Amazon OpenSearch Service domain. For more information, see Amazon Resource Names
        # (ARNs) and Amazon Web Services Service Namespaces . Firehose uses either ClusterEndpoint or
        # DomainARN to send data to Amazon OpenSearch Service.
        @[JSON::Field(key: "DomainARN")]
        getter domain_arn : String?

        # The Elasticsearch index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The Elasticsearch index rotation period
        @[JSON::Field(key: "IndexRotationPeriod")]
        getter index_rotation_period : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The Amazon OpenSearch Service retry options.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::ElasticsearchRetryOptions?

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The Amazon S3 backup mode.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The Amazon S3 destination.
        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        # The Elasticsearch type name. This applies to Elasticsearch 6.x and lower versions. For Elasticsearch
        # 7.x and OpenSearch Service 1.x, there's no value for TypeName .
        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        # The details of the VPC of the Amazon OpenSearch or the Amazon OpenSearch Serverless destination.
        @[JSON::Field(key: "VpcConfigurationDescription")]
        getter vpc_configuration_description : Types::VpcConfigurationDescription?

        def initialize(
          @buffering_hints : Types::ElasticsearchBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @cluster_endpoint : String? = nil,
          @document_id_options : Types::DocumentIdOptions? = nil,
          @domain_arn : String? = nil,
          @index_name : String? = nil,
          @index_rotation_period : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::ElasticsearchRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @type_name : String? = nil,
          @vpc_configuration_description : Types::VpcConfigurationDescription? = nil
        )
        end
      end

      # Describes an update for a destination in Amazon OpenSearch Service.
      struct ElasticsearchDestinationUpdate
        include JSON::Serializable

        # The buffering options. If no value is specified, ElasticsearchBufferingHints object default values
        # are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::ElasticsearchBufferingHints?

        # The CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The endpoint to use when communicating with the cluster. Specify either this ClusterEndpoint or the
        # DomainARN field.
        @[JSON::Field(key: "ClusterEndpoint")]
        getter cluster_endpoint : String?

        # Indicates the method for setting up document ID. The supported methods are Firehose generated
        # document ID and OpenSearch Service generated document ID.
        @[JSON::Field(key: "DocumentIdOptions")]
        getter document_id_options : Types::DocumentIdOptions?

        # The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for
        # DescribeDomain , DescribeDomains , and DescribeDomainConfig after assuming the IAM role specified in
        # RoleARN . For more information, see Amazon Resource Names (ARNs) and Amazon Web Services Service
        # Namespaces . Specify either ClusterEndpoint or DomainARN .
        @[JSON::Field(key: "DomainARN")]
        getter domain_arn : String?

        # The Elasticsearch index name.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The Elasticsearch index rotation period. Index rotation appends a timestamp to IndexName to
        # facilitate the expiration of old data. For more information, see Index Rotation for the Amazon
        # OpenSearch Service Destination . Default value is OneDay .
        @[JSON::Field(key: "IndexRotationPeriod")]
        getter index_rotation_period : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch Service. The
        # default value is 300 (5 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::ElasticsearchRetryOptions?

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the Amazon
        # OpenSearch Service Configuration API and for indexing documents. For more information, see Grant
        # Firehose Access to an Amazon S3 Destination and Amazon Resource Names (ARNs) and Amazon Web Services
        # Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The Amazon S3 destination.
        @[JSON::Field(key: "S3Update")]
        getter s3_update : Types::S3DestinationUpdate?

        # The Elasticsearch type name. For Elasticsearch 6.x, there can be only one type per index. If you try
        # to specify a new type for an existing index that already has another type, Firehose returns an error
        # during runtime. If you upgrade Elasticsearch from 6.x to 7.x and don’t update your Firehose stream,
        # Firehose still delivers data to Elasticsearch with the old index name and type name. If you want to
        # update your Firehose stream with a new index name, provide an empty string for TypeName .
        @[JSON::Field(key: "TypeName")]
        getter type_name : String?

        def initialize(
          @buffering_hints : Types::ElasticsearchBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @cluster_endpoint : String? = nil,
          @document_id_options : Types::DocumentIdOptions? = nil,
          @domain_arn : String? = nil,
          @index_name : String? = nil,
          @index_rotation_period : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::ElasticsearchRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_update : Types::S3DestinationUpdate? = nil,
          @type_name : String? = nil
        )
        end
      end

      # Configures retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch
      # Service.
      struct ElasticsearchRetryOptions
        include JSON::Serializable

        # After an initial failure to deliver to Amazon OpenSearch Service, the total amount of time during
        # which Firehose retries delivery (including the first attempt). After this time has elapsed, the
        # failed documents are written to Amazon S3. Default value is 300 seconds (5 minutes). A value of 0
        # (zero) results in no retries.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      # Describes the encryption for a destination in Amazon S3.
      struct EncryptionConfiguration
        include JSON::Serializable

        # The encryption key.
        @[JSON::Field(key: "KMSEncryptionConfig")]
        getter kms_encryption_config : Types::KMSEncryptionConfig?

        # Specifically override existing encryption information to ensure that no encryption is used.
        @[JSON::Field(key: "NoEncryptionConfig")]
        getter no_encryption_config : String?

        def initialize(
          @kms_encryption_config : Types::KMSEncryptionConfig? = nil,
          @no_encryption_config : String? = nil
        )
        end
      end

      # Describes the configuration of a destination in Amazon S3.
      struct ExtendedS3DestinationConfiguration
        include JSON::Serializable

        # The ARN of the S3 bucket. For more information, see Amazon Resource Names (ARNs) and Amazon Web
        # Services Service Namespaces .
        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The buffering option.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints?

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The compression format. If no value is specified, the default is UNCOMPRESSED.
        @[JSON::Field(key: "CompressionFormat")]
        getter compression_format : String?

        # The time zone you prefer. UTC is the default.
        @[JSON::Field(key: "CustomTimeZone")]
        getter custom_time_zone : String?

        # The serializer, deserializer, and schema for converting data from the JSON format to the Parquet or
        # ORC format before writing it to Amazon S3.
        @[JSON::Field(key: "DataFormatConversionConfiguration")]
        getter data_format_conversion_configuration : Types::DataFormatConversionConfiguration?

        # The configuration of the dynamic partitioning mechanism that creates smaller data sets from the
        # streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only
        # supported for Amazon S3 destinations.
        @[JSON::Field(key: "DynamicPartitioningConfiguration")]
        getter dynamic_partitioning_configuration : Types::DynamicPartitioningConfiguration?

        # The encryption configuration. If no value is specified, the default is no encryption.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A prefix that Firehose evaluates and adds to failed records before writing them to S3. This prefix
        # appears immediately following the bucket name. For information about how to specify this prefix, see
        # Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "ErrorOutputPrefix")]
        getter error_output_prefix : String?

        # Specify a file extension. It will override the default file extension
        @[JSON::Field(key: "FileExtension")]
        getter file_extension : String?

        # The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered Amazon S3 files. You can
        # also specify a custom prefix, as described in Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The configuration for backup in Amazon S3.
        @[JSON::Field(key: "S3BackupConfiguration")]
        getter s3_backup_configuration : Types::S3DestinationConfiguration?

        # The Amazon S3 backup mode. After you create a Firehose stream, you can update it to enable Amazon S3
        # backup if it is disabled. If backup is enabled, you can't update the Firehose stream to disable it.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        def initialize(
          @bucket_arn : String,
          @role_arn : String,
          @buffering_hints : Types::BufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @compression_format : String? = nil,
          @custom_time_zone : String? = nil,
          @data_format_conversion_configuration : Types::DataFormatConversionConfiguration? = nil,
          @dynamic_partitioning_configuration : Types::DynamicPartitioningConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @error_output_prefix : String? = nil,
          @file_extension : String? = nil,
          @prefix : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @s3_backup_configuration : Types::S3DestinationConfiguration? = nil,
          @s3_backup_mode : String? = nil
        )
        end
      end

      # Describes a destination in Amazon S3.
      struct ExtendedS3DestinationDescription
        include JSON::Serializable

        # The ARN of the S3 bucket. For more information, see Amazon Resource Names (ARNs) and Amazon Web
        # Services Service Namespaces .
        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The buffering option.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints

        # The compression format. If no value is specified, the default is UNCOMPRESSED .
        @[JSON::Field(key: "CompressionFormat")]
        getter compression_format : String

        # The encryption configuration. If no value is specified, the default is no encryption.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The time zone you prefer. UTC is the default.
        @[JSON::Field(key: "CustomTimeZone")]
        getter custom_time_zone : String?

        # The serializer, deserializer, and schema for converting data from the JSON format to the Parquet or
        # ORC format before writing it to Amazon S3.
        @[JSON::Field(key: "DataFormatConversionConfiguration")]
        getter data_format_conversion_configuration : Types::DataFormatConversionConfiguration?

        # The configuration of the dynamic partitioning mechanism that creates smaller data sets from the
        # streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only
        # supported for Amazon S3 destinations.
        @[JSON::Field(key: "DynamicPartitioningConfiguration")]
        getter dynamic_partitioning_configuration : Types::DynamicPartitioningConfiguration?

        # A prefix that Firehose evaluates and adds to failed records before writing them to S3. This prefix
        # appears immediately following the bucket name. For information about how to specify this prefix, see
        # Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "ErrorOutputPrefix")]
        getter error_output_prefix : String?

        # Specify a file extension. It will override the default file extension
        @[JSON::Field(key: "FileExtension")]
        getter file_extension : String?

        # The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered Amazon S3 files. You can
        # also specify a custom prefix, as described in Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The configuration for backup in Amazon S3.
        @[JSON::Field(key: "S3BackupDescription")]
        getter s3_backup_description : Types::S3DestinationDescription?

        # The Amazon S3 backup mode.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        def initialize(
          @bucket_arn : String,
          @buffering_hints : Types::BufferingHints,
          @compression_format : String,
          @encryption_configuration : Types::EncryptionConfiguration,
          @role_arn : String,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @custom_time_zone : String? = nil,
          @data_format_conversion_configuration : Types::DataFormatConversionConfiguration? = nil,
          @dynamic_partitioning_configuration : Types::DynamicPartitioningConfiguration? = nil,
          @error_output_prefix : String? = nil,
          @file_extension : String? = nil,
          @prefix : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @s3_backup_description : Types::S3DestinationDescription? = nil,
          @s3_backup_mode : String? = nil
        )
        end
      end

      # Describes an update for a destination in Amazon S3.
      struct ExtendedS3DestinationUpdate
        include JSON::Serializable

        # The ARN of the S3 bucket. For more information, see Amazon Resource Names (ARNs) and Amazon Web
        # Services Service Namespaces .
        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String?

        # The buffering option.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints?

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The compression format. If no value is specified, the default is UNCOMPRESSED .
        @[JSON::Field(key: "CompressionFormat")]
        getter compression_format : String?

        # The time zone you prefer. UTC is the default.
        @[JSON::Field(key: "CustomTimeZone")]
        getter custom_time_zone : String?

        # The serializer, deserializer, and schema for converting data from the JSON format to the Parquet or
        # ORC format before writing it to Amazon S3.
        @[JSON::Field(key: "DataFormatConversionConfiguration")]
        getter data_format_conversion_configuration : Types::DataFormatConversionConfiguration?

        # The configuration of the dynamic partitioning mechanism that creates smaller data sets from the
        # streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is only
        # supported for Amazon S3 destinations.
        @[JSON::Field(key: "DynamicPartitioningConfiguration")]
        getter dynamic_partitioning_configuration : Types::DynamicPartitioningConfiguration?

        # The encryption configuration. If no value is specified, the default is no encryption.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A prefix that Firehose evaluates and adds to failed records before writing them to S3. This prefix
        # appears immediately following the bucket name. For information about how to specify this prefix, see
        # Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "ErrorOutputPrefix")]
        getter error_output_prefix : String?

        # Specify a file extension. It will override the default file extension
        @[JSON::Field(key: "FileExtension")]
        getter file_extension : String?

        # The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered Amazon S3 files. You can
        # also specify a custom prefix, as described in Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # You can update a Firehose stream to enable Amazon S3 backup if it is disabled. If backup is enabled,
        # you can't update the Firehose stream to disable it.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The Amazon S3 destination for backup.
        @[JSON::Field(key: "S3BackupUpdate")]
        getter s3_backup_update : Types::S3DestinationUpdate?

        def initialize(
          @bucket_arn : String? = nil,
          @buffering_hints : Types::BufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @compression_format : String? = nil,
          @custom_time_zone : String? = nil,
          @data_format_conversion_configuration : Types::DataFormatConversionConfiguration? = nil,
          @dynamic_partitioning_configuration : Types::DynamicPartitioningConfiguration? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @error_output_prefix : String? = nil,
          @file_extension : String? = nil,
          @prefix : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_backup_update : Types::S3DestinationUpdate? = nil
        )
        end
      end

      # Provides details in case one of the following operations fails due to an error related to KMS:
      # CreateDeliveryStream , DeleteDeliveryStream , StartDeliveryStreamEncryption ,
      # StopDeliveryStreamEncryption .
      struct FailureDescription
        include JSON::Serializable

        # A message providing details about the error that caused the failure.
        @[JSON::Field(key: "Details")]
        getter details : String

        # The type of error that caused the failure.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @details : String,
          @type : String
        )
        end
      end

      # The native Hive / HCatalog JsonSerDe. Used by Firehose for deserializing data, which means
      # converting it from the JSON format in preparation for serializing it to the Parquet or ORC format.
      # This is one of two deserializers you can choose, depending on which one offers the functionality you
      # need. The other option is the OpenX SerDe.
      struct HiveJsonSerDe
        include JSON::Serializable

        # Indicates how you want Firehose to parse the date and timestamps that may be present in your input
        # data JSON. To specify these format strings, follow the pattern syntax of JodaTime's DateTimeFormat
        # format strings. For more information, see Class DateTimeFormat . You can also use the special value
        # millis to parse timestamps in epoch milliseconds. If you don't specify a format, Firehose uses
        # java.sql.Timestamp::valueOf by default.
        @[JSON::Field(key: "TimestampFormats")]
        getter timestamp_formats : Array(String)?

        def initialize(
          @timestamp_formats : Array(String)? = nil
        )
        end
      end

      # Describes the buffering options that can be applied before data is delivered to the HTTP endpoint
      # destination. Firehose treats these options as hints, and it might choose to use more optimal values.
      # The SizeInMBs and IntervalInSeconds parameters are optional. However, if specify a value for one of
      # them, you must also provide a value for the other.
      struct HttpEndpointBufferingHints
        include JSON::Serializable

        # Buffer incoming data for the specified period of time, in seconds, before delivering it to the
        # destination. The default value is 300 (5 minutes).
        @[JSON::Field(key: "IntervalInSeconds")]
        getter interval_in_seconds : Int32?

        # Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The
        # default value is 5. We recommend setting this parameter to a value greater than the amount of data
        # you typically ingest into the Firehose stream in 10 seconds. For example, if you typically ingest
        # data at 1 MB/sec, the value should be 10 MB or higher.
        @[JSON::Field(key: "SizeInMBs")]
        getter size_in_m_bs : Int32?

        def initialize(
          @interval_in_seconds : Int32? = nil,
          @size_in_m_bs : Int32? = nil
        )
        end
      end

      # Describes the metadata that's delivered to the specified HTTP endpoint destination.
      struct HttpEndpointCommonAttribute
        include JSON::Serializable

        # The name of the HTTP endpoint common attribute.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The value of the HTTP endpoint common attribute.
        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String

        def initialize(
          @attribute_name : String,
          @attribute_value : String
        )
        end
      end

      # Describes the configuration of the HTTP endpoint to which Kinesis Firehose delivers data.
      struct HttpEndpointConfiguration
        include JSON::Serializable

        # The URL of the HTTP endpoint selected as the destination. If you choose an HTTP endpoint as your
        # destination, review and follow the instructions in the Appendix - HTTP Endpoint Delivery Request and
        # Response Specifications .
        @[JSON::Field(key: "Url")]
        getter url : String

        # The access key required for Kinesis Firehose to authenticate with the HTTP endpoint selected as the
        # destination.
        @[JSON::Field(key: "AccessKey")]
        getter access_key : String?

        # The name of the HTTP endpoint selected as the destination.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @url : String,
          @access_key : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Describes the HTTP endpoint selected as the destination.
      struct HttpEndpointDescription
        include JSON::Serializable

        # The name of the HTTP endpoint selected as the destination.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The URL of the HTTP endpoint selected as the destination.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @name : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Describes the configuration of the HTTP endpoint destination.
      struct HttpEndpointDestinationConfiguration
        include JSON::Serializable

        # The configuration of the HTTP endpoint selected as the destination.
        @[JSON::Field(key: "EndpointConfiguration")]
        getter endpoint_configuration : Types::HttpEndpointConfiguration

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # The buffering options that can be used before data is delivered to the specified destination.
        # Firehose treats these options as hints, and it might choose to use more optimal values. The
        # SizeInMBs and IntervalInSeconds parameters are optional. However, if you specify a value for one of
        # them, you must also provide a value for the other.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::HttpEndpointBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The configuration of the request sent to the HTTP endpoint that is specified as the destination.
        @[JSON::Field(key: "RequestConfiguration")]
        getter request_configuration : Types::HttpEndpointRequestConfiguration?

        # Describes the retry behavior in case Firehose is unable to deliver data to the specified HTTP
        # endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified
        # HTTP endpoint destination.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::HttpEndpointRetryOptions?

        # Firehose uses this IAM role for all the permissions that the delivery stream needs.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Describes the S3 bucket backup options for the data that Firehose delivers to the HTTP endpoint
        # destination. You can back up all documents ( AllData ) or only the documents that Firehose could not
        # deliver to the specified HTTP endpoint destination ( FailedDataOnly ).
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The configuration that defines how you access secrets for HTTP Endpoint destination.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        def initialize(
          @endpoint_configuration : Types::HttpEndpointConfiguration,
          @s3_configuration : Types::S3DestinationConfiguration,
          @buffering_hints : Types::HttpEndpointBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @request_configuration : Types::HttpEndpointRequestConfiguration? = nil,
          @retry_options : Types::HttpEndpointRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil
        )
        end
      end

      # Describes the HTTP endpoint destination.
      struct HttpEndpointDestinationDescription
        include JSON::Serializable

        # Describes buffering options that can be applied to the data before it is delivered to the HTTPS
        # endpoint destination. Firehose teats these options as hints, and it might choose to use more optimal
        # values. The SizeInMBs and IntervalInSeconds parameters are optional. However, if specify a value for
        # one of them, you must also provide a value for the other.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::HttpEndpointBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The configuration of the specified HTTP endpoint destination.
        @[JSON::Field(key: "EndpointConfiguration")]
        getter endpoint_configuration : Types::HttpEndpointDescription?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The configuration of request sent to the HTTP endpoint specified as the destination.
        @[JSON::Field(key: "RequestConfiguration")]
        getter request_configuration : Types::HttpEndpointRequestConfiguration?

        # Describes the retry behavior in case Firehose is unable to deliver data to the specified HTTP
        # endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified
        # HTTP endpoint destination.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::HttpEndpointRetryOptions?

        # Firehose uses this IAM role for all the permissions that the delivery stream needs.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Describes the S3 bucket backup options for the data that Kinesis Firehose delivers to the HTTP
        # endpoint destination. You can back up all documents ( AllData ) or only the documents that Firehose
        # could not deliver to the specified HTTP endpoint destination ( FailedDataOnly ).
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        # The configuration that defines how you access secrets for HTTP Endpoint destination.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        def initialize(
          @buffering_hints : Types::HttpEndpointBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @endpoint_configuration : Types::HttpEndpointDescription? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @request_configuration : Types::HttpEndpointRequestConfiguration? = nil,
          @retry_options : Types::HttpEndpointRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil
        )
        end
      end

      # Updates the specified HTTP endpoint destination.
      struct HttpEndpointDestinationUpdate
        include JSON::Serializable

        # Describes buffering options that can be applied to the data before it is delivered to the HTTPS
        # endpoint destination. Firehose teats these options as hints, and it might choose to use more optimal
        # values. The SizeInMBs and IntervalInSeconds parameters are optional. However, if specify a value for
        # one of them, you must also provide a value for the other.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::HttpEndpointBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # Describes the configuration of the HTTP endpoint destination.
        @[JSON::Field(key: "EndpointConfiguration")]
        getter endpoint_configuration : Types::HttpEndpointConfiguration?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The configuration of the request sent to the HTTP endpoint specified as the destination.
        @[JSON::Field(key: "RequestConfiguration")]
        getter request_configuration : Types::HttpEndpointRequestConfiguration?

        # Describes the retry behavior in case Firehose is unable to deliver data to the specified HTTP
        # endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified
        # HTTP endpoint destination.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::HttpEndpointRetryOptions?

        # Firehose uses this IAM role for all the permissions that the delivery stream needs.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Describes the S3 bucket backup options for the data that Kinesis Firehose delivers to the HTTP
        # endpoint destination. You can back up all documents ( AllData ) or only the documents that Firehose
        # could not deliver to the specified HTTP endpoint destination ( FailedDataOnly ).
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3Update")]
        getter s3_update : Types::S3DestinationUpdate?

        # The configuration that defines how you access secrets for HTTP Endpoint destination.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        def initialize(
          @buffering_hints : Types::HttpEndpointBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @endpoint_configuration : Types::HttpEndpointConfiguration? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @request_configuration : Types::HttpEndpointRequestConfiguration? = nil,
          @retry_options : Types::HttpEndpointRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_update : Types::S3DestinationUpdate? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil
        )
        end
      end

      # The configuration of the HTTP endpoint request.
      struct HttpEndpointRequestConfiguration
        include JSON::Serializable

        # Describes the metadata sent to the HTTP endpoint destination.
        @[JSON::Field(key: "CommonAttributes")]
        getter common_attributes : Array(Types::HttpEndpointCommonAttribute)?

        # Firehose uses the content encoding to compress the body of a request before sending the request to
        # the destination. For more information, see Content-Encoding in MDN Web Docs, the official Mozilla
        # documentation.
        @[JSON::Field(key: "ContentEncoding")]
        getter content_encoding : String?

        def initialize(
          @common_attributes : Array(Types::HttpEndpointCommonAttribute)? = nil,
          @content_encoding : String? = nil
        )
        end
      end

      # Describes the retry behavior in case Firehose is unable to deliver data to the specified HTTP
      # endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the specified
      # HTTP endpoint destination.
      struct HttpEndpointRetryOptions
        include JSON::Serializable

        # The total amount of time that Firehose spends on retries. This duration starts after the initial
        # attempt to send data to the custom destination via HTTPS endpoint fails. It doesn't include the
        # periods during which Firehose waits for acknowledgment from the specified destination after each
        # attempt.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      # Specifies the destination configure settings for Apache Iceberg Table.
      struct IcebergDestinationConfiguration
        include JSON::Serializable

        # Configuration describing where the destination Apache Iceberg Tables are persisted.
        @[JSON::Field(key: "CatalogConfiguration")]
        getter catalog_configuration : Types::CatalogConfiguration

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling Apache Iceberg
        # Tables.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # Describes whether all incoming data for this delivery stream will be append only (inserts only and
        # not for updates and deletes) for Iceberg delivery. This feature is only applicable for Apache
        # Iceberg Tables. The default value is false. If you set this value to true, Firehose automatically
        # increases the throughput limit of a stream based on the throttling levels of the stream. If you set
        # this parameter to true for a stream with updates and deletes, you will see out of order delivery.
        @[JSON::Field(key: "AppendOnly")]
        getter append_only : Bool?

        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # Provides a list of DestinationTableConfigurations which Firehose uses to deliver data to Apache
        # Iceberg Tables. Firehose will write data with insert if table specific configuration is not provided
        # here.
        @[JSON::Field(key: "DestinationTableConfigurationList")]
        getter destination_table_configuration_list : Array(Types::DestinationTableConfiguration)?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::RetryOptions?

        # Describes how Firehose will backup records. Currently,S3 backup only supports FailedDataOnly .
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The configuration to enable automatic schema evolution. Amazon Data Firehose is in preview release
        # and is subject to change.
        @[JSON::Field(key: "SchemaEvolutionConfiguration")]
        getter schema_evolution_configuration : Types::SchemaEvolutionConfiguration?

        # The configuration to enable automatic table creation. Amazon Data Firehose is in preview release and
        # is subject to change.
        @[JSON::Field(key: "TableCreationConfiguration")]
        getter table_creation_configuration : Types::TableCreationConfiguration?

        def initialize(
          @catalog_configuration : Types::CatalogConfiguration,
          @role_arn : String,
          @s3_configuration : Types::S3DestinationConfiguration,
          @append_only : Bool? = nil,
          @buffering_hints : Types::BufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @destination_table_configuration_list : Array(Types::DestinationTableConfiguration)? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::RetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @schema_evolution_configuration : Types::SchemaEvolutionConfiguration? = nil,
          @table_creation_configuration : Types::TableCreationConfiguration? = nil
        )
        end
      end

      # Describes a destination in Apache Iceberg Tables.
      struct IcebergDestinationDescription
        include JSON::Serializable

        # Describes whether all incoming data for this delivery stream will be append only (inserts only and
        # not for updates and deletes) for Iceberg delivery. This feature is only applicable for Apache
        # Iceberg Tables. The default value is false. If you set this value to true, Firehose automatically
        # increases the throughput limit of a stream based on the throttling levels of the stream. If you set
        # this parameter to true for a stream with updates and deletes, you will see out of order delivery.
        @[JSON::Field(key: "AppendOnly")]
        getter append_only : Bool?

        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints?

        # Configuration describing where the destination Iceberg tables are persisted.
        @[JSON::Field(key: "CatalogConfiguration")]
        getter catalog_configuration : Types::CatalogConfiguration?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # Provides a list of DestinationTableConfigurations which Firehose uses to deliver data to Apache
        # Iceberg Tables. Firehose will write data with insert if table specific configuration is not provided
        # here.
        @[JSON::Field(key: "DestinationTableConfigurationList")]
        getter destination_table_configuration_list : Array(Types::DestinationTableConfiguration)?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::RetryOptions?

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling Apache Iceberg
        # Tables.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Describes how Firehose will backup records. Currently,Firehose only supports FailedDataOnly .
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        # The description of automatic schema evolution configuration. Amazon Data Firehose is in preview
        # release and is subject to change.
        @[JSON::Field(key: "SchemaEvolutionConfiguration")]
        getter schema_evolution_configuration : Types::SchemaEvolutionConfiguration?

        # The description of table creation configuration. Amazon Data Firehose is in preview release and is
        # subject to change.
        @[JSON::Field(key: "TableCreationConfiguration")]
        getter table_creation_configuration : Types::TableCreationConfiguration?

        def initialize(
          @append_only : Bool? = nil,
          @buffering_hints : Types::BufferingHints? = nil,
          @catalog_configuration : Types::CatalogConfiguration? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @destination_table_configuration_list : Array(Types::DestinationTableConfiguration)? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::RetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @schema_evolution_configuration : Types::SchemaEvolutionConfiguration? = nil,
          @table_creation_configuration : Types::TableCreationConfiguration? = nil
        )
        end
      end

      # Describes an update for a destination in Apache Iceberg Tables.
      struct IcebergDestinationUpdate
        include JSON::Serializable

        # Describes whether all incoming data for this delivery stream will be append only (inserts only and
        # not for updates and deletes) for Iceberg delivery. This feature is only applicable for Apache
        # Iceberg Tables. The default value is false. If you set this value to true, Firehose automatically
        # increases the throughput limit of a stream based on the throttling levels of the stream. If you set
        # this parameter to true for a stream with updates and deletes, you will see out of order delivery.
        @[JSON::Field(key: "AppendOnly")]
        getter append_only : Bool?

        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints?

        # Configuration describing where the destination Iceberg tables are persisted.
        @[JSON::Field(key: "CatalogConfiguration")]
        getter catalog_configuration : Types::CatalogConfiguration?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # Provides a list of DestinationTableConfigurations which Firehose uses to deliver data to Apache
        # Iceberg Tables. Firehose will write data with insert if table specific configuration is not provided
        # here.
        @[JSON::Field(key: "DestinationTableConfigurationList")]
        getter destination_table_configuration_list : Array(Types::DestinationTableConfiguration)?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::RetryOptions?

        # The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling Apache Iceberg
        # Tables.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Describes how Firehose will backup records. Currently,Firehose only supports FailedDataOnly .
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration?

        # The configuration to enable automatic schema evolution. Amazon Data Firehose is in preview release
        # and is subject to change.
        @[JSON::Field(key: "SchemaEvolutionConfiguration")]
        getter schema_evolution_configuration : Types::SchemaEvolutionConfiguration?

        # The configuration to enable automatic table creation. Amazon Data Firehose is in preview release and
        # is subject to change.
        @[JSON::Field(key: "TableCreationConfiguration")]
        getter table_creation_configuration : Types::TableCreationConfiguration?

        def initialize(
          @append_only : Bool? = nil,
          @buffering_hints : Types::BufferingHints? = nil,
          @catalog_configuration : Types::CatalogConfiguration? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @destination_table_configuration_list : Array(Types::DestinationTableConfiguration)? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::RetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_configuration : Types::S3DestinationConfiguration? = nil,
          @schema_evolution_configuration : Types::SchemaEvolutionConfiguration? = nil,
          @table_creation_configuration : Types::TableCreationConfiguration? = nil
        )
        end
      end

      # Specifies the deserializer you want to use to convert the format of the input data. This parameter
      # is required if Enabled is set to true.
      struct InputFormatConfiguration
        include JSON::Serializable

        # Specifies which deserializer to use. You can choose either the Apache Hive JSON SerDe or the OpenX
        # JSON SerDe. If both are non-null, the server rejects the request.
        @[JSON::Field(key: "Deserializer")]
        getter deserializer : Types::Deserializer?

        def initialize(
          @deserializer : Types::Deserializer? = nil
        )
        end
      end

      # The specified input parameter has a value that is not valid.
      struct InvalidArgumentException
        include JSON::Serializable

        # A message that provides information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Firehose throws this exception when an attempt to put records or to start or stop Firehose stream
      # encryption fails. This happens when the KMS service throws one of the following exception types:
      # AccessDeniedException , InvalidStateException , DisabledException , or NotFoundException .
      struct InvalidKMSResourceException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Only requests from CloudWatch Logs are supported when CloudWatch Logs decompression is enabled.
      struct InvalidSourceException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes an encryption key for a destination in Amazon S3.
      struct KMSEncryptionConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the encryption key. Must belong to the same Amazon Web Services
        # Region as the destination Amazon S3 bucket. For more information, see Amazon Resource Names (ARNs)
        # and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "AWSKMSKeyARN")]
        getter awskms_key_arn : String

        def initialize(
          @awskms_key_arn : String
        )
        end
      end

      # The stream and role Amazon Resource Names (ARNs) for a Kinesis data stream used as the source for a
      # Firehose stream.
      struct KinesisStreamSourceConfiguration
        include JSON::Serializable

        # The ARN of the source Kinesis data stream. For more information, see Amazon Kinesis Data Streams ARN
        # Format .
        @[JSON::Field(key: "KinesisStreamARN")]
        getter kinesis_stream_arn : String

        # The ARN of the role that provides access to the source Kinesis data stream. For more information,
        # see Amazon Web Services Identity and Access Management (IAM) ARN Format .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        def initialize(
          @kinesis_stream_arn : String,
          @role_arn : String
        )
        end
      end

      # Details about a Kinesis data stream used as the source for a Firehose stream.
      struct KinesisStreamSourceDescription
        include JSON::Serializable

        # Firehose starts retrieving records from the Kinesis data stream starting with this timestamp.
        @[JSON::Field(key: "DeliveryStartTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delivery_start_timestamp : Time?

        # The Amazon Resource Name (ARN) of the source Kinesis data stream. For more information, see Amazon
        # Kinesis Data Streams ARN Format .
        @[JSON::Field(key: "KinesisStreamARN")]
        getter kinesis_stream_arn : String?

        # The ARN of the role used by the source Kinesis data stream. For more information, see Amazon Web
        # Services Identity and Access Management (IAM) ARN Format .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @delivery_start_timestamp : Time? = nil,
          @kinesis_stream_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # You have already reached the limit for a requested resource.
      struct LimitExceededException
        include JSON::Serializable

        # A message that provides information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListDeliveryStreamsInput
        include JSON::Serializable

        # The Firehose stream type. This can be one of the following values: DirectPut : Provider applications
        # access the Firehose stream directly. KinesisStreamAsSource : The Firehose stream uses a Kinesis data
        # stream as a source. This parameter is optional. If this parameter is omitted, Firehose streams of
        # all types are returned.
        @[JSON::Field(key: "DeliveryStreamType")]
        getter delivery_stream_type : String?

        # The list of Firehose streams returned by this call to ListDeliveryStreams will start with the
        # Firehose stream whose name comes alphabetically immediately after the name you specify in
        # ExclusiveStartDeliveryStreamName .
        @[JSON::Field(key: "ExclusiveStartDeliveryStreamName")]
        getter exclusive_start_delivery_stream_name : String?

        # The maximum number of Firehose streams to list. The default value is 10.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @delivery_stream_type : String? = nil,
          @exclusive_start_delivery_stream_name : String? = nil,
          @limit : Int32? = nil
        )
        end
      end

      struct ListDeliveryStreamsOutput
        include JSON::Serializable

        # The names of the Firehose streams.
        @[JSON::Field(key: "DeliveryStreamNames")]
        getter delivery_stream_names : Array(String)

        # Indicates whether there are more Firehose streams available to list.
        @[JSON::Field(key: "HasMoreDeliveryStreams")]
        getter has_more_delivery_streams : Bool

        def initialize(
          @delivery_stream_names : Array(String),
          @has_more_delivery_streams : Bool
        )
        end
      end

      struct ListTagsForDeliveryStreamInput
        include JSON::Serializable

        # The name of the Firehose stream whose tags you want to list.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # The key to use as the starting point for the list of tags. If you set this parameter,
        # ListTagsForDeliveryStream gets all tags that occur after ExclusiveStartTagKey .
        @[JSON::Field(key: "ExclusiveStartTagKey")]
        getter exclusive_start_tag_key : String?

        # The number of tags to return. If this number is less than the total number of tags associated with
        # the Firehose stream, HasMoreTags is set to true in the response. To list additional tags, set
        # ExclusiveStartTagKey to the last key in the response.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @delivery_stream_name : String,
          @exclusive_start_tag_key : String? = nil,
          @limit : Int32? = nil
        )
        end
      end

      struct ListTagsForDeliveryStreamOutput
        include JSON::Serializable

        # If this is true in the response, more tags are available. To list the remaining tags, set
        # ExclusiveStartTagKey to the key of the last tag returned and call ListTagsForDeliveryStream again.
        @[JSON::Field(key: "HasMoreTags")]
        getter has_more_tags : Bool

        # A list of tags associated with DeliveryStreamName , starting with the first tag after
        # ExclusiveStartTagKey and up to the specified Limit .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @has_more_tags : Bool,
          @tags : Array(Types::Tag)
        )
        end
      end

      # The configuration for the Amazon MSK cluster to be used as the source for a delivery stream.
      struct MSKSourceConfiguration
        include JSON::Serializable

        # The authentication configuration of the Amazon MSK cluster.
        @[JSON::Field(key: "AuthenticationConfiguration")]
        getter authentication_configuration : Types::AuthenticationConfiguration

        # The ARN of the Amazon MSK cluster.
        @[JSON::Field(key: "MSKClusterARN")]
        getter msk_cluster_arn : String

        # The topic name within the Amazon MSK cluster.
        @[JSON::Field(key: "TopicName")]
        getter topic_name : String

        # The start date and time in UTC for the offset position within your MSK topic from where Firehose
        # begins to read. By default, this is set to timestamp when Firehose becomes Active. If you want to
        # create a Firehose stream with Earliest start position from SDK or CLI, you need to set the
        # ReadFromTimestamp parameter to Epoch (1970-01-01T00:00:00Z).
        @[JSON::Field(key: "ReadFromTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter read_from_timestamp : Time?

        def initialize(
          @authentication_configuration : Types::AuthenticationConfiguration,
          @msk_cluster_arn : String,
          @topic_name : String,
          @read_from_timestamp : Time? = nil
        )
        end
      end

      # Details about the Amazon MSK cluster used as the source for a Firehose stream.
      struct MSKSourceDescription
        include JSON::Serializable

        # The authentication configuration of the Amazon MSK cluster.
        @[JSON::Field(key: "AuthenticationConfiguration")]
        getter authentication_configuration : Types::AuthenticationConfiguration?

        # Firehose starts retrieving records from the topic within the Amazon MSK cluster starting with this
        # timestamp.
        @[JSON::Field(key: "DeliveryStartTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delivery_start_timestamp : Time?

        # The ARN of the Amazon MSK cluster.
        @[JSON::Field(key: "MSKClusterARN")]
        getter msk_cluster_arn : String?

        # The start date and time in UTC for the offset position within your MSK topic from where Firehose
        # begins to read. By default, this is set to timestamp when Firehose becomes Active. If you want to
        # create a Firehose stream with Earliest start position from SDK or CLI, you need to set the
        # ReadFromTimestampUTC parameter to Epoch (1970-01-01T00:00:00Z).
        @[JSON::Field(key: "ReadFromTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter read_from_timestamp : Time?

        # The topic name within the Amazon MSK cluster.
        @[JSON::Field(key: "TopicName")]
        getter topic_name : String?

        def initialize(
          @authentication_configuration : Types::AuthenticationConfiguration? = nil,
          @delivery_start_timestamp : Time? = nil,
          @msk_cluster_arn : String? = nil,
          @read_from_timestamp : Time? = nil,
          @topic_name : String? = nil
        )
        end
      end

      # The OpenX SerDe. Used by Firehose for deserializing data, which means converting it from the JSON
      # format in preparation for serializing it to the Parquet or ORC format. This is one of two
      # deserializers you can choose, depending on which one offers the functionality you need. The other
      # option is the native Hive / HCatalog JsonSerDe.
      struct OpenXJsonSerDe
        include JSON::Serializable

        # When set to true , which is the default, Firehose converts JSON keys to lowercase before
        # deserializing them.
        @[JSON::Field(key: "CaseInsensitive")]
        getter case_insensitive : Bool?

        # Maps column names to JSON keys that aren't identical to the column names. This is useful when the
        # JSON contains keys that are Hive keywords. For example, timestamp is a Hive keyword. If you have a
        # JSON key named timestamp , set this parameter to {"ts": "timestamp"} to map this key to a column
        # named ts .
        @[JSON::Field(key: "ColumnToJsonKeyMappings")]
        getter column_to_json_key_mappings : Hash(String, String)?

        # When set to true , specifies that the names of the keys include dots and that you want Firehose to
        # replace them with underscores. This is useful because Apache Hive does not allow dots in column
        # names. For example, if the JSON contains a key whose name is "a.b", you can define the column name
        # to be "a_b" when using this option. The default is false .
        @[JSON::Field(key: "ConvertDotsInJsonKeysToUnderscores")]
        getter convert_dots_in_json_keys_to_underscores : Bool?

        def initialize(
          @case_insensitive : Bool? = nil,
          @column_to_json_key_mappings : Hash(String, String)? = nil,
          @convert_dots_in_json_keys_to_underscores : Bool? = nil
        )
        end
      end

      # A serializer to use for converting data to the ORC format before storing it in Amazon S3. For more
      # information, see Apache ORC .
      struct OrcSerDe
        include JSON::Serializable

        # The Hadoop Distributed File System (HDFS) block size. This is useful if you intend to copy the data
        # from Amazon S3 to HDFS before querying. The default is 256 MiB and the minimum is 64 MiB. Firehose
        # uses this value for padding calculations.
        @[JSON::Field(key: "BlockSizeBytes")]
        getter block_size_bytes : Int32?

        # The column names for which you want Firehose to create bloom filters. The default is null .
        @[JSON::Field(key: "BloomFilterColumns")]
        getter bloom_filter_columns : Array(String)?

        # The Bloom filter false positive probability (FPP). The lower the FPP, the bigger the Bloom filter.
        # The default value is 0.05, the minimum is 0, and the maximum is 1.
        @[JSON::Field(key: "BloomFilterFalsePositiveProbability")]
        getter bloom_filter_false_positive_probability : Float64?

        # The compression code to use over data blocks. The default is SNAPPY .
        @[JSON::Field(key: "Compression")]
        getter compression : String?

        # Represents the fraction of the total number of non-null rows. To turn off dictionary encoding, set
        # this fraction to a number that is less than the number of distinct keys in a dictionary. To always
        # use dictionary encoding, set this threshold to 1.
        @[JSON::Field(key: "DictionaryKeyThreshold")]
        getter dictionary_key_threshold : Float64?

        # Set this to true to indicate that you want stripes to be padded to the HDFS block boundaries. This
        # is useful if you intend to copy the data from Amazon S3 to HDFS before querying. The default is
        # false .
        @[JSON::Field(key: "EnablePadding")]
        getter enable_padding : Bool?

        # The version of the file to write. The possible values are V0_11 and V0_12 . The default is V0_12 .
        @[JSON::Field(key: "FormatVersion")]
        getter format_version : String?

        # A number between 0 and 1 that defines the tolerance for block padding as a decimal fraction of
        # stripe size. The default value is 0.05, which means 5 percent of stripe size. For the default values
        # of 64 MiB ORC stripes and 256 MiB HDFS blocks, the default block padding tolerance of 5 percent
        # reserves a maximum of 3.2 MiB for padding within the 256 MiB block. In such a case, if the available
        # size within the block is more than 3.2 MiB, a new, smaller stripe is inserted to fit within that
        # space. This ensures that no stripe crosses block boundaries and causes remote reads within a
        # node-local task. Firehose ignores this parameter when OrcSerDe$EnablePadding is false .
        @[JSON::Field(key: "PaddingTolerance")]
        getter padding_tolerance : Float64?

        # The number of rows between index entries. The default is 10,000 and the minimum is 1,000.
        @[JSON::Field(key: "RowIndexStride")]
        getter row_index_stride : Int32?

        # The number of bytes in each stripe. The default is 64 MiB and the minimum is 8 MiB.
        @[JSON::Field(key: "StripeSizeBytes")]
        getter stripe_size_bytes : Int32?

        def initialize(
          @block_size_bytes : Int32? = nil,
          @bloom_filter_columns : Array(String)? = nil,
          @bloom_filter_false_positive_probability : Float64? = nil,
          @compression : String? = nil,
          @dictionary_key_threshold : Float64? = nil,
          @enable_padding : Bool? = nil,
          @format_version : String? = nil,
          @padding_tolerance : Float64? = nil,
          @row_index_stride : Int32? = nil,
          @stripe_size_bytes : Int32? = nil
        )
        end
      end

      # Specifies the serializer that you want Firehose to use to convert the format of your data before it
      # writes it to Amazon S3. This parameter is required if Enabled is set to true.
      struct OutputFormatConfiguration
        include JSON::Serializable

        # Specifies which serializer to use. You can choose either the ORC SerDe or the Parquet SerDe. If both
        # are non-null, the server rejects the request.
        @[JSON::Field(key: "Serializer")]
        getter serializer : Types::Serializer?

        def initialize(
          @serializer : Types::Serializer? = nil
        )
        end
      end

      # A serializer to use for converting data to the Parquet format before storing it in Amazon S3. For
      # more information, see Apache Parquet .
      struct ParquetSerDe
        include JSON::Serializable

        # The Hadoop Distributed File System (HDFS) block size. This is useful if you intend to copy the data
        # from Amazon S3 to HDFS before querying. The default is 256 MiB and the minimum is 64 MiB. Firehose
        # uses this value for padding calculations.
        @[JSON::Field(key: "BlockSizeBytes")]
        getter block_size_bytes : Int32?

        # The compression code to use over data blocks. The possible values are UNCOMPRESSED , SNAPPY , and
        # GZIP , with the default being SNAPPY . Use SNAPPY for higher decompression speed. Use GZIP if the
        # compression ratio is more important than speed.
        @[JSON::Field(key: "Compression")]
        getter compression : String?

        # Indicates whether to enable dictionary compression.
        @[JSON::Field(key: "EnableDictionaryCompression")]
        getter enable_dictionary_compression : Bool?

        # The maximum amount of padding to apply. This is useful if you intend to copy the data from Amazon S3
        # to HDFS before querying. The default is 0.
        @[JSON::Field(key: "MaxPaddingBytes")]
        getter max_padding_bytes : Int32?

        # The Parquet page size. Column chunks are divided into pages. A page is conceptually an indivisible
        # unit (in terms of compression and encoding). The minimum value is 64 KiB and the default is 1 MiB.
        @[JSON::Field(key: "PageSizeBytes")]
        getter page_size_bytes : Int32?

        # Indicates the version of row format to output. The possible values are V1 and V2 . The default is V1
        # .
        @[JSON::Field(key: "WriterVersion")]
        getter writer_version : String?

        def initialize(
          @block_size_bytes : Int32? = nil,
          @compression : String? = nil,
          @enable_dictionary_compression : Bool? = nil,
          @max_padding_bytes : Int32? = nil,
          @page_size_bytes : Int32? = nil,
          @writer_version : String? = nil
        )
        end
      end

      # Represents a single field in a PartitionSpec . Amazon Data Firehose is in preview release and is
      # subject to change.
      struct PartitionField
        include JSON::Serializable

        # The column name to be configured in partition spec. Amazon Data Firehose is in preview release and
        # is subject to change.
        @[JSON::Field(key: "SourceName")]
        getter source_name : String

        def initialize(
          @source_name : String
        )
        end
      end

      # Represents how to produce partition data for a table. Partition data is produced by transforming
      # columns in a table. Each column transform is represented by a named PartitionField . Here is an
      # example of the schema in JSON. "partitionSpec": { "identity": [ {"sourceName": "column1"},
      # {"sourceName": "column2"}, {"sourceName": "column3"} ] } Amazon Data Firehose is in preview release
      # and is subject to change.
      struct PartitionSpec
        include JSON::Serializable

        # List of identity transforms that performs an identity transformation. The transform takes the source
        # value, and does not modify it. Result type is the source type. Amazon Data Firehose is in preview
        # release and is subject to change.
        @[JSON::Field(key: "Identity")]
        getter identity : Array(Types::PartitionField)?

        def initialize(
          @identity : Array(Types::PartitionField)? = nil
        )
        end
      end

      # Describes a data processing configuration.
      struct ProcessingConfiguration
        include JSON::Serializable

        # Enables or disables data processing.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The data processors.
        @[JSON::Field(key: "Processors")]
        getter processors : Array(Types::Processor)?

        def initialize(
          @enabled : Bool? = nil,
          @processors : Array(Types::Processor)? = nil
        )
        end
      end

      # Describes a data processor. If you want to add a new line delimiter between records in objects that
      # are delivered to Amazon S3, choose AppendDelimiterToRecord as a processor type. You don’t have to
      # put a processor parameter when you select AppendDelimiterToRecord .
      struct Processor
        include JSON::Serializable

        # The type of processor.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The processor parameters.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::ProcessorParameter)?

        def initialize(
          @type : String,
          @parameters : Array(Types::ProcessorParameter)? = nil
        )
        end
      end

      # Describes the processor parameter.
      struct ProcessorParameter
        include JSON::Serializable

        # The name of the parameter. Currently the following default values are supported: 3 for
        # NumberOfRetries and 60 for the BufferIntervalInSeconds . The BufferSizeInMBs ranges between 0.2 MB
        # and up to 3MB. The default buffering hint is 1MB for all destinations, except Splunk. For Splunk,
        # the default buffering hint is 256 KB.
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String

        # The parameter value.
        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String

        def initialize(
          @parameter_name : String,
          @parameter_value : String
        )
        end
      end

      struct PutRecordBatchInput
        include JSON::Serializable

        # The name of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # One or more records.
        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)

        def initialize(
          @delivery_stream_name : String,
          @records : Array(Types::Record)
        )
        end
      end

      struct PutRecordBatchOutput
        include JSON::Serializable

        # The number of records that might have failed processing. This number might be greater than 0 even if
        # the PutRecordBatch call succeeds. Check FailedPutCount to determine whether there are records that
        # you need to resend.
        @[JSON::Field(key: "FailedPutCount")]
        getter failed_put_count : Int32

        # The results array. For each record, the index of the response element is the same as the index used
        # in the request array.
        @[JSON::Field(key: "RequestResponses")]
        getter request_responses : Array(Types::PutRecordBatchResponseEntry)

        # Indicates whether server-side encryption (SSE) was enabled during this operation.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        def initialize(
          @failed_put_count : Int32,
          @request_responses : Array(Types::PutRecordBatchResponseEntry),
          @encrypted : Bool? = nil
        )
        end
      end

      # Contains the result for an individual record from a PutRecordBatch request. If the record is
      # successfully added to your Firehose stream, it receives a record ID. If the record fails to be added
      # to your Firehose stream, the result includes an error code and an error message.
      struct PutRecordBatchResponseEntry
        include JSON::Serializable

        # The error code for an individual record result.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message for an individual record result.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ID of the record.
        @[JSON::Field(key: "RecordId")]
        getter record_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @record_id : String? = nil
        )
        end
      end

      struct PutRecordInput
        include JSON::Serializable

        # The name of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # The record.
        @[JSON::Field(key: "Record")]
        getter record : Types::Record

        def initialize(
          @delivery_stream_name : String,
          @record : Types::Record
        )
        end
      end

      struct PutRecordOutput
        include JSON::Serializable

        # The ID of the record.
        @[JSON::Field(key: "RecordId")]
        getter record_id : String

        # Indicates whether server-side encryption (SSE) was enabled during this operation.
        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool?

        def initialize(
          @record_id : String,
          @encrypted : Bool? = nil
        )
        end
      end

      # The unit of data in a Firehose stream.
      struct Record
        include JSON::Serializable

        # The data blob, which is base64-encoded when the blob is serialized. The maximum size of the data
        # blob, before base64-encoding, is 1,000 KiB.
        @[JSON::Field(key: "Data")]
        getter data : Bytes

        def initialize(
          @data : Bytes
        )
        end
      end

      # Describes the configuration of a destination in Amazon Redshift.
      struct RedshiftDestinationConfiguration
        include JSON::Serializable

        # The database connection string.
        @[JSON::Field(key: "ClusterJDBCURL")]
        getter cluster_jdbcurl : String

        # The COPY command.
        @[JSON::Field(key: "CopyCommand")]
        getter copy_command : Types::CopyCommand

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The configuration for the intermediate Amazon S3 location from which Amazon Redshift obtains data.
        # Restrictions are described in the topic for CreateDeliveryStream . The compression formats SNAPPY or
        # ZIP cannot be specified in RedshiftDestinationConfiguration.S3Configuration because the Amazon
        # Redshift COPY operation that reads from the S3 bucket doesn't support these compression formats.
        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # The CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The user password.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to Amazon Redshift. Default value
        # is 3600 (60 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::RedshiftRetryOptions?

        # The configuration for backup in Amazon S3.
        @[JSON::Field(key: "S3BackupConfiguration")]
        getter s3_backup_configuration : Types::S3DestinationConfiguration?

        # The Amazon S3 backup mode. After you create a Firehose stream, you can update it to enable Amazon S3
        # backup if it is disabled. If backup is enabled, you can't update the Firehose stream to disable it.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The configuration that defines how you access secrets for Amazon Redshift.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        # The name of the user.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @cluster_jdbcurl : String,
          @copy_command : Types::CopyCommand,
          @role_arn : String,
          @s3_configuration : Types::S3DestinationConfiguration,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @password : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::RedshiftRetryOptions? = nil,
          @s3_backup_configuration : Types::S3DestinationConfiguration? = nil,
          @s3_backup_mode : String? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil,
          @username : String? = nil
        )
        end
      end

      # Describes a destination in Amazon Redshift.
      struct RedshiftDestinationDescription
        include JSON::Serializable

        # The database connection string.
        @[JSON::Field(key: "ClusterJDBCURL")]
        getter cluster_jdbcurl : String

        # The COPY command.
        @[JSON::Field(key: "CopyCommand")]
        getter copy_command : Types::CopyCommand

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The Amazon S3 destination.
        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to Amazon Redshift. Default value
        # is 3600 (60 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::RedshiftRetryOptions?

        # The configuration for backup in Amazon S3.
        @[JSON::Field(key: "S3BackupDescription")]
        getter s3_backup_description : Types::S3DestinationDescription?

        # The Amazon S3 backup mode.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The configuration that defines how you access secrets for Amazon Redshift.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        # The name of the user.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @cluster_jdbcurl : String,
          @copy_command : Types::CopyCommand,
          @role_arn : String,
          @s3_destination_description : Types::S3DestinationDescription,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::RedshiftRetryOptions? = nil,
          @s3_backup_description : Types::S3DestinationDescription? = nil,
          @s3_backup_mode : String? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil,
          @username : String? = nil
        )
        end
      end

      # Describes an update for a destination in Amazon Redshift.
      struct RedshiftDestinationUpdate
        include JSON::Serializable

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The database connection string.
        @[JSON::Field(key: "ClusterJDBCURL")]
        getter cluster_jdbcurl : String?

        # The COPY command.
        @[JSON::Field(key: "CopyCommand")]
        getter copy_command : Types::CopyCommand?

        # The user password.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver documents to Amazon Redshift. Default value
        # is 3600 (60 minutes).
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::RedshiftRetryOptions?

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # You can update a Firehose stream to enable Amazon S3 backup if it is disabled. If backup is enabled,
        # you can't update the Firehose stream to disable it.
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The Amazon S3 destination for backup.
        @[JSON::Field(key: "S3BackupUpdate")]
        getter s3_backup_update : Types::S3DestinationUpdate?

        # The Amazon S3 destination. The compression formats SNAPPY or ZIP cannot be specified in
        # RedshiftDestinationUpdate.S3Update because the Amazon Redshift COPY operation that reads from the S3
        # bucket doesn't support these compression formats.
        @[JSON::Field(key: "S3Update")]
        getter s3_update : Types::S3DestinationUpdate?

        # The configuration that defines how you access secrets for Amazon Redshift.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        # The name of the user.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @cluster_jdbcurl : String? = nil,
          @copy_command : Types::CopyCommand? = nil,
          @password : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::RedshiftRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_backup_update : Types::S3DestinationUpdate? = nil,
          @s3_update : Types::S3DestinationUpdate? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil,
          @username : String? = nil
        )
        end
      end

      # Configures retry behavior in case Firehose is unable to deliver documents to Amazon Redshift.
      struct RedshiftRetryOptions
        include JSON::Serializable

        # The length of time during which Firehose retries delivery after a failure, starting from the initial
        # request and including the first attempt. The default value is 3600 seconds (60 minutes). Firehose
        # does not retry if the value of DurationInSeconds is 0 (zero) or if the first delivery attempt takes
        # longer than the current value.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      # The resource is already in use and not available for this operation.
      struct ResourceInUseException
        include JSON::Serializable

        # A message that provides information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # A message that provides information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The retry behavior in case Firehose is unable to deliver data to a destination.
      struct RetryOptions
        include JSON::Serializable

        # The period of time during which Firehose retries to deliver data to the specified destination.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      # Describes the configuration of a destination in Amazon S3.
      struct S3DestinationConfiguration
        include JSON::Serializable

        # The ARN of the S3 bucket. For more information, see Amazon Resource Names (ARNs) and Amazon Web
        # Services Service Namespaces .
        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The buffering option. If no value is specified, BufferingHints object default values are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints?

        # The CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The compression format. If no value is specified, the default is UNCOMPRESSED . The compression
        # formats SNAPPY or ZIP cannot be specified for Amazon Redshift destinations because they are not
        # supported by the Amazon Redshift COPY operation that reads from the S3 bucket.
        @[JSON::Field(key: "CompressionFormat")]
        getter compression_format : String?

        # The encryption configuration. If no value is specified, the default is no encryption.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A prefix that Firehose evaluates and adds to failed records before writing them to S3. This prefix
        # appears immediately following the bucket name. For information about how to specify this prefix, see
        # Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "ErrorOutputPrefix")]
        getter error_output_prefix : String?

        # The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered Amazon S3 files. You can
        # also specify a custom prefix, as described in Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket_arn : String,
          @role_arn : String,
          @buffering_hints : Types::BufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @compression_format : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @error_output_prefix : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes a destination in Amazon S3.
      struct S3DestinationDescription
        include JSON::Serializable

        # The ARN of the S3 bucket. For more information, see Amazon Resource Names (ARNs) and Amazon Web
        # Services Service Namespaces .
        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String

        # The buffering option. If no value is specified, BufferingHints object default values are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints

        # The compression format. If no value is specified, the default is UNCOMPRESSED .
        @[JSON::Field(key: "CompressionFormat")]
        getter compression_format : String

        # The encryption configuration. If no value is specified, the default is no encryption.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # A prefix that Firehose evaluates and adds to failed records before writing them to S3. This prefix
        # appears immediately following the bucket name. For information about how to specify this prefix, see
        # Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "ErrorOutputPrefix")]
        getter error_output_prefix : String?

        # The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered Amazon S3 files. You can
        # also specify a custom prefix, as described in Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket_arn : String,
          @buffering_hints : Types::BufferingHints,
          @compression_format : String,
          @encryption_configuration : Types::EncryptionConfiguration,
          @role_arn : String,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @error_output_prefix : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes an update for a destination in Amazon S3.
      struct S3DestinationUpdate
        include JSON::Serializable

        # The ARN of the S3 bucket. For more information, see Amazon Resource Names (ARNs) and Amazon Web
        # Services Service Namespaces .
        @[JSON::Field(key: "BucketARN")]
        getter bucket_arn : String?

        # The buffering option. If no value is specified, BufferingHints object default values are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::BufferingHints?

        # The CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The compression format. If no value is specified, the default is UNCOMPRESSED . The compression
        # formats SNAPPY or ZIP cannot be specified for Amazon Redshift destinations because they are not
        # supported by the Amazon Redshift COPY operation that reads from the S3 bucket.
        @[JSON::Field(key: "CompressionFormat")]
        getter compression_format : String?

        # The encryption configuration. If no value is specified, the default is no encryption.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A prefix that Firehose evaluates and adds to failed records before writing them to S3. This prefix
        # appears immediately following the bucket name. For information about how to specify this prefix, see
        # Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "ErrorOutputPrefix")]
        getter error_output_prefix : String?

        # The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered Amazon S3 files. You can
        # also specify a custom prefix, as described in Custom Prefixes for Amazon S3 Objects .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        def initialize(
          @bucket_arn : String? = nil,
          @buffering_hints : Types::BufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @compression_format : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @error_output_prefix : String? = nil,
          @prefix : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Specifies the schema to which you want Firehose to configure your data before it writes it to Amazon
      # S3. This parameter is required if Enabled is set to true.
      struct SchemaConfiguration
        include JSON::Serializable

        # The ID of the Amazon Web Services Glue Data Catalog. If you don't supply this, the Amazon Web
        # Services account ID is used by default.
        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # Specifies the name of the Amazon Web Services Glue database that contains the schema for the output
        # data. If the SchemaConfiguration request parameter is used as part of invoking the
        # CreateDeliveryStream API, then the DatabaseName property is required and its value must be
        # specified.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # If you don't specify an Amazon Web Services Region, the default is the current Region.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The role that Firehose can use to access Amazon Web Services Glue. This role must be in the same
        # account you use for Firehose. Cross-account roles aren't allowed. If the SchemaConfiguration request
        # parameter is used as part of invoking the CreateDeliveryStream API, then the RoleARN property is
        # required and its value must be specified.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Specifies the Amazon Web Services Glue table that contains the column information that constitutes
        # your data schema. If the SchemaConfiguration request parameter is used as part of invoking the
        # CreateDeliveryStream API, then the TableName property is required and its value must be specified.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # Specifies the table version for the output data schema. If you don't specify this version ID, or if
        # you set it to LATEST , Firehose uses the most recent version. This means that any updates to the
        # table are automatically picked up.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @catalog_id : String? = nil,
          @database_name : String? = nil,
          @region : String? = nil,
          @role_arn : String? = nil,
          @table_name : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # The configuration to enable schema evolution. Amazon Data Firehose is in preview release and is
      # subject to change.
      struct SchemaEvolutionConfiguration
        include JSON::Serializable

        # Specify whether you want to enable schema evolution. Amazon Data Firehose is in preview release and
        # is subject to change.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # The structure that defines how Firehose accesses the secret.
      struct SecretsManagerConfiguration
        include JSON::Serializable

        # Specifies whether you want to use the secrets manager feature. When set as True the secrets manager
        # configuration overwrites the existing secrets in the destination configuration. When it's set to
        # False Firehose falls back to the credentials in the destination configuration.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Specifies the role that Firehose assumes when calling the Secrets Manager API operation. When you
        # provide the role, it overrides any destination specific role defined in the destination
        # configuration. If you do not provide the then we use the destination specific role. This parameter
        # is required for Splunk.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The ARN of the secret that stores your credentials. It must be in the same region as the Firehose
        # stream and the role. The secret ARN can reside in a different account than the Firehose stream and
        # role as Firehose supports cross-account secret access. This parameter is required when Enabled is
        # set to True .
        @[JSON::Field(key: "SecretARN")]
        getter secret_arn : String?

        def initialize(
          @enabled : Bool,
          @role_arn : String? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # The serializer that you want Firehose to use to convert data to the target format before writing it
      # to Amazon S3. Firehose supports two types of serializers: the ORC SerDe and the Parquet SerDe.
      struct Serializer
        include JSON::Serializable

        # A serializer to use for converting data to the ORC format before storing it in Amazon S3. For more
        # information, see Apache ORC .
        @[JSON::Field(key: "OrcSerDe")]
        getter orc_ser_de : Types::OrcSerDe?

        # A serializer to use for converting data to the Parquet format before storing it in Amazon S3. For
        # more information, see Apache Parquet .
        @[JSON::Field(key: "ParquetSerDe")]
        getter parquet_ser_de : Types::ParquetSerDe?

        def initialize(
          @orc_ser_de : Types::OrcSerDe? = nil,
          @parquet_ser_de : Types::ParquetSerDe? = nil
        )
        end
      end

      # The service is unavailable. Back off and retry the operation. If you continue to see the exception,
      # throughput limits for the Firehose stream may have been exceeded. For more information about limits
      # and how to request an increase, see Amazon Firehose Limits .
      struct ServiceUnavailableException
        include JSON::Serializable

        # A message that provides information about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the buffering to perform before delivering data to the Snowflake destination. If you do
      # not specify any value, Firehose uses the default values.
      struct SnowflakeBufferingHints
        include JSON::Serializable

        # Buffer incoming data for the specified period of time, in seconds, before delivering it to the
        # destination. The default value is 0.
        @[JSON::Field(key: "IntervalInSeconds")]
        getter interval_in_seconds : Int32?

        # Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The
        # default value is 128.
        @[JSON::Field(key: "SizeInMBs")]
        getter size_in_m_bs : Int32?

        def initialize(
          @interval_in_seconds : Int32? = nil,
          @size_in_m_bs : Int32? = nil
        )
        end
      end

      # Configure Snowflake destination
      struct SnowflakeDestinationConfiguration
        include JSON::Serializable

        # URL for accessing your Snowflake account. This URL must include your account identifier . Note that
        # the protocol (https://) and port number are optional.
        @[JSON::Field(key: "AccountUrl")]
        getter account_url : String

        # All data in Snowflake is maintained in databases.
        @[JSON::Field(key: "Database")]
        getter database : String

        # The Amazon Resource Name (ARN) of the Snowflake role
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # Each database consists of one or more schemas, which are logical groupings of database objects, such
        # as tables and views
        @[JSON::Field(key: "Schema")]
        getter schema : String

        # All data in Snowflake is stored in database tables, logically structured as collections of columns
        # and rows.
        @[JSON::Field(key: "Table")]
        getter table : String

        # Describes the buffering to perform before delivering data to the Snowflake destination. If you do
        # not specify any value, Firehose uses the default values.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::SnowflakeBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The name of the record content column.
        @[JSON::Field(key: "ContentColumnName")]
        getter content_column_name : String?

        # Choose to load JSON keys mapped to table column names or choose to split the JSON payload where
        # content is mapped to a record content column and source metadata is mapped to a record metadata
        # column.
        @[JSON::Field(key: "DataLoadingOption")]
        getter data_loading_option : String?

        # Passphrase to decrypt the private key when the key is encrypted. For information, see Using Key Pair
        # Authentication &amp; Key Rotation .
        @[JSON::Field(key: "KeyPassphrase")]
        getter key_passphrase : String?

        # Specify a column name in the table, where the metadata information has to be loaded. When you enable
        # this field, you will see the following column in the snowflake table, which differs based on the
        # source type. For Direct PUT as source { "firehoseDeliveryStreamName" : "streamname", "IngestionTime"
        # : "timestamp" } For Kinesis Data Stream as source "kinesisStreamName" : "streamname",
        # "kinesisShardId" : "Id", "kinesisPartitionKey" : "key", "kinesisSequenceNumber" : "1234",
        # "subsequenceNumber" : "2334", "IngestionTime" : "timestamp" }
        @[JSON::Field(key: "MetaDataColumnName")]
        getter meta_data_column_name : String?

        # The private key used to encrypt your Snowflake client. For information, see Using Key Pair
        # Authentication &amp; Key Rotation .
        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The time period where Firehose will retry sending data to the chosen HTTP endpoint.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::SnowflakeRetryOptions?

        # Choose an S3 backup mode
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The configuration that defines how you access secrets for Snowflake.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        # Optionally configure a Snowflake role. Otherwise the default user role will be used.
        @[JSON::Field(key: "SnowflakeRoleConfiguration")]
        getter snowflake_role_configuration : Types::SnowflakeRoleConfiguration?

        # The VPCE ID for Firehose to privately connect with Snowflake. The ID format is
        # com.amazonaws.vpce.[region].vpce-svc-&lt;[id]&gt;. For more information, see Amazon PrivateLink
        # &amp; Snowflake
        @[JSON::Field(key: "SnowflakeVpcConfiguration")]
        getter snowflake_vpc_configuration : Types::SnowflakeVpcConfiguration?

        # User login name for the Snowflake account.
        @[JSON::Field(key: "User")]
        getter user : String?

        def initialize(
          @account_url : String,
          @database : String,
          @role_arn : String,
          @s3_configuration : Types::S3DestinationConfiguration,
          @schema : String,
          @table : String,
          @buffering_hints : Types::SnowflakeBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @content_column_name : String? = nil,
          @data_loading_option : String? = nil,
          @key_passphrase : String? = nil,
          @meta_data_column_name : String? = nil,
          @private_key : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::SnowflakeRetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil,
          @snowflake_role_configuration : Types::SnowflakeRoleConfiguration? = nil,
          @snowflake_vpc_configuration : Types::SnowflakeVpcConfiguration? = nil,
          @user : String? = nil
        )
        end
      end

      # Optional Snowflake destination description
      struct SnowflakeDestinationDescription
        include JSON::Serializable

        # URL for accessing your Snowflake account. This URL must include your account identifier . Note that
        # the protocol (https://) and port number are optional.
        @[JSON::Field(key: "AccountUrl")]
        getter account_url : String?

        # Describes the buffering to perform before delivering data to the Snowflake destination. If you do
        # not specify any value, Firehose uses the default values.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::SnowflakeBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The name of the record content column
        @[JSON::Field(key: "ContentColumnName")]
        getter content_column_name : String?

        # Choose to load JSON keys mapped to table column names or choose to split the JSON payload where
        # content is mapped to a record content column and source metadata is mapped to a record metadata
        # column.
        @[JSON::Field(key: "DataLoadingOption")]
        getter data_loading_option : String?

        # All data in Snowflake is maintained in databases.
        @[JSON::Field(key: "Database")]
        getter database : String?

        # The name of the record metadata column
        @[JSON::Field(key: "MetaDataColumnName")]
        getter meta_data_column_name : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The time period where Firehose will retry sending data to the chosen HTTP endpoint.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::SnowflakeRetryOptions?

        # The Amazon Resource Name (ARN) of the Snowflake role
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Choose an S3 backup mode
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        # Each database consists of one or more schemas, which are logical groupings of database objects, such
        # as tables and views
        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # The configuration that defines how you access secrets for Snowflake.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        # Optionally configure a Snowflake role. Otherwise the default user role will be used.
        @[JSON::Field(key: "SnowflakeRoleConfiguration")]
        getter snowflake_role_configuration : Types::SnowflakeRoleConfiguration?

        # The VPCE ID for Firehose to privately connect with Snowflake. The ID format is
        # com.amazonaws.vpce.[region].vpce-svc-&lt;[id]&gt;. For more information, see Amazon PrivateLink
        # &amp; Snowflake
        @[JSON::Field(key: "SnowflakeVpcConfiguration")]
        getter snowflake_vpc_configuration : Types::SnowflakeVpcConfiguration?

        # All data in Snowflake is stored in database tables, logically structured as collections of columns
        # and rows.
        @[JSON::Field(key: "Table")]
        getter table : String?

        # User login name for the Snowflake account.
        @[JSON::Field(key: "User")]
        getter user : String?

        def initialize(
          @account_url : String? = nil,
          @buffering_hints : Types::SnowflakeBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @content_column_name : String? = nil,
          @data_loading_option : String? = nil,
          @database : String? = nil,
          @meta_data_column_name : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::SnowflakeRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @schema : String? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil,
          @snowflake_role_configuration : Types::SnowflakeRoleConfiguration? = nil,
          @snowflake_vpc_configuration : Types::SnowflakeVpcConfiguration? = nil,
          @table : String? = nil,
          @user : String? = nil
        )
        end
      end

      # Update to configuration settings
      struct SnowflakeDestinationUpdate
        include JSON::Serializable

        # URL for accessing your Snowflake account. This URL must include your account identifier . Note that
        # the protocol (https://) and port number are optional.
        @[JSON::Field(key: "AccountUrl")]
        getter account_url : String?

        # Describes the buffering to perform before delivering data to the Snowflake destination.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::SnowflakeBufferingHints?

        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The name of the content metadata column
        @[JSON::Field(key: "ContentColumnName")]
        getter content_column_name : String?

        # JSON keys mapped to table column names or choose to split the JSON payload where content is mapped
        # to a record content column and source metadata is mapped to a record metadata column.
        @[JSON::Field(key: "DataLoadingOption")]
        getter data_loading_option : String?

        # All data in Snowflake is maintained in databases.
        @[JSON::Field(key: "Database")]
        getter database : String?

        # Passphrase to decrypt the private key when the key is encrypted. For information, see Using Key Pair
        # Authentication &amp; Key Rotation .
        @[JSON::Field(key: "KeyPassphrase")]
        getter key_passphrase : String?

        # The name of the record metadata column
        @[JSON::Field(key: "MetaDataColumnName")]
        getter meta_data_column_name : String?

        # The private key used to encrypt your Snowflake client. For information, see Using Key Pair
        # Authentication &amp; Key Rotation .
        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # Specify how long Firehose retries sending data to the New Relic HTTP endpoint. After sending data,
        # Firehose first waits for an acknowledgment from the HTTP endpoint. If an error occurs or the
        # acknowledgment doesn’t arrive within the acknowledgment timeout period, Firehose starts the retry
        # duration counter. It keeps retrying until the retry duration expires. After that, Firehose considers
        # it a data delivery failure and backs up the data to your Amazon S3 bucket. Every time that Firehose
        # sends data to the HTTP endpoint (either the initial attempt or a retry), it restarts the
        # acknowledgement timeout counter and waits for an acknowledgement from the HTTP endpoint. Even if the
        # retry duration expires, Firehose still waits for the acknowledgment until it receives it or the
        # acknowledgement timeout period is reached. If the acknowledgment times out, Firehose determines
        # whether there's time left in the retry counter. If there is time left, it retries again and repeats
        # the logic until it receives an acknowledgment or determines that the retry time has expired. If you
        # don't want Firehose to retry sending data, set this value to 0.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::SnowflakeRetryOptions?

        # The Amazon Resource Name (ARN) of the Snowflake role
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # Choose an S3 backup mode. Once you set the mode as AllData , you can not change it to FailedDataOnly
        # .
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        @[JSON::Field(key: "S3Update")]
        getter s3_update : Types::S3DestinationUpdate?

        # Each database consists of one or more schemas, which are logical groupings of database objects, such
        # as tables and views
        @[JSON::Field(key: "Schema")]
        getter schema : String?

        # Describes the Secrets Manager configuration in Snowflake.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        # Optionally configure a Snowflake role. Otherwise the default user role will be used.
        @[JSON::Field(key: "SnowflakeRoleConfiguration")]
        getter snowflake_role_configuration : Types::SnowflakeRoleConfiguration?

        # All data in Snowflake is stored in database tables, logically structured as collections of columns
        # and rows.
        @[JSON::Field(key: "Table")]
        getter table : String?

        # User login name for the Snowflake account.
        @[JSON::Field(key: "User")]
        getter user : String?

        def initialize(
          @account_url : String? = nil,
          @buffering_hints : Types::SnowflakeBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @content_column_name : String? = nil,
          @data_loading_option : String? = nil,
          @database : String? = nil,
          @key_passphrase : String? = nil,
          @meta_data_column_name : String? = nil,
          @private_key : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::SnowflakeRetryOptions? = nil,
          @role_arn : String? = nil,
          @s3_backup_mode : String? = nil,
          @s3_update : Types::S3DestinationUpdate? = nil,
          @schema : String? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil,
          @snowflake_role_configuration : Types::SnowflakeRoleConfiguration? = nil,
          @table : String? = nil,
          @user : String? = nil
        )
        end
      end

      # Specify how long Firehose retries sending data to the New Relic HTTP endpoint. After sending data,
      # Firehose first waits for an acknowledgment from the HTTP endpoint. If an error occurs or the
      # acknowledgment doesn’t arrive within the acknowledgment timeout period, Firehose starts the retry
      # duration counter. It keeps retrying until the retry duration expires. After that, Firehose considers
      # it a data delivery failure and backs up the data to your Amazon S3 bucket. Every time that Firehose
      # sends data to the HTTP endpoint (either the initial attempt or a retry), it restarts the
      # acknowledgement timeout counter and waits for an acknowledgement from the HTTP endpoint. Even if the
      # retry duration expires, Firehose still waits for the acknowledgment until it receives it or the
      # acknowledgement timeout period is reached. If the acknowledgment times out, Firehose determines
      # whether there's time left in the retry counter. If there is time left, it retries again and repeats
      # the logic until it receives an acknowledgment or determines that the retry time has expired. If you
      # don't want Firehose to retry sending data, set this value to 0.
      struct SnowflakeRetryOptions
        include JSON::Serializable

        # the time period where Firehose will retry sending data to the chosen HTTP endpoint.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      # Optionally configure a Snowflake role. Otherwise the default user role will be used.
      struct SnowflakeRoleConfiguration
        include JSON::Serializable

        # Enable Snowflake role
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The Snowflake role you wish to configure
        @[JSON::Field(key: "SnowflakeRole")]
        getter snowflake_role : String?

        def initialize(
          @enabled : Bool? = nil,
          @snowflake_role : String? = nil
        )
        end
      end

      # Configure a Snowflake VPC
      struct SnowflakeVpcConfiguration
        include JSON::Serializable

        # The VPCE ID for Firehose to privately connect with Snowflake. The ID format is
        # com.amazonaws.vpce.[region].vpce-svc-&lt;[id]&gt;. For more information, see Amazon PrivateLink
        # &amp; Snowflake
        @[JSON::Field(key: "PrivateLinkVpceId")]
        getter private_link_vpce_id : String

        def initialize(
          @private_link_vpce_id : String
        )
        end
      end

      # Details about a Kinesis data stream used as the source for a Firehose stream.
      struct SourceDescription
        include JSON::Serializable

        # Details about a database used as the source for a Firehose stream. Amazon Data Firehose is in
        # preview release and is subject to change.
        @[JSON::Field(key: "DatabaseSourceDescription")]
        getter database_source_description : Types::DatabaseSourceDescription?

        # Details about Direct PUT used as the source for a Firehose stream.
        @[JSON::Field(key: "DirectPutSourceDescription")]
        getter direct_put_source_description : Types::DirectPutSourceDescription?

        # The KinesisStreamSourceDescription value for the source Kinesis data stream.
        @[JSON::Field(key: "KinesisStreamSourceDescription")]
        getter kinesis_stream_source_description : Types::KinesisStreamSourceDescription?

        # The configuration description for the Amazon MSK cluster to be used as the source for a delivery
        # stream.
        @[JSON::Field(key: "MSKSourceDescription")]
        getter msk_source_description : Types::MSKSourceDescription?

        def initialize(
          @database_source_description : Types::DatabaseSourceDescription? = nil,
          @direct_put_source_description : Types::DirectPutSourceDescription? = nil,
          @kinesis_stream_source_description : Types::KinesisStreamSourceDescription? = nil,
          @msk_source_description : Types::MSKSourceDescription? = nil
        )
        end
      end

      # The buffering options. If no value is specified, the default values for Splunk are used.
      struct SplunkBufferingHints
        include JSON::Serializable

        # Buffer incoming data for the specified period of time, in seconds, before delivering it to the
        # destination. The default value is 60 (1 minute).
        @[JSON::Field(key: "IntervalInSeconds")]
        getter interval_in_seconds : Int32?

        # Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The
        # default value is 5.
        @[JSON::Field(key: "SizeInMBs")]
        getter size_in_m_bs : Int32?

        def initialize(
          @interval_in_seconds : Int32? = nil,
          @size_in_m_bs : Int32? = nil
        )
        end
      end

      # Describes the configuration of a destination in Splunk.
      struct SplunkDestinationConfiguration
        include JSON::Serializable

        # The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.
        @[JSON::Field(key: "HECEndpoint")]
        getter hec_endpoint : String

        # This type can be either "Raw" or "Event."
        @[JSON::Field(key: "HECEndpointType")]
        getter hec_endpoint_type : String

        # The configuration for the backup Amazon S3 location.
        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DestinationConfiguration

        # The buffering options. If no value is specified, the default values for Splunk are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::SplunkBufferingHints?

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The amount of time that Firehose waits to receive an acknowledgment from Splunk after it sends it
        # data. At the end of the timeout period, Firehose either tries to send the data again or considers it
        # an error, based on your retry settings.
        @[JSON::Field(key: "HECAcknowledgmentTimeoutInSeconds")]
        getter hec_acknowledgment_timeout_in_seconds : Int32?

        # This is a GUID that you obtain from your Splunk cluster when you create a new HEC endpoint.
        @[JSON::Field(key: "HECToken")]
        getter hec_token : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver data to Splunk, or if it doesn't receive an
        # acknowledgment of receipt from Splunk.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::SplunkRetryOptions?

        # Defines how documents should be delivered to Amazon S3. When set to FailedEventsOnly , Firehose
        # writes any data that could not be indexed to the configured Amazon S3 destination. When set to
        # AllEvents , Firehose delivers all incoming records to Amazon S3, and also writes failed documents to
        # Amazon S3. The default value is FailedEventsOnly . You can update this backup mode from
        # FailedEventsOnly to AllEvents . You can't update it from AllEvents to FailedEventsOnly .
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The configuration that defines how you access secrets for Splunk.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        def initialize(
          @hec_endpoint : String,
          @hec_endpoint_type : String,
          @s3_configuration : Types::S3DestinationConfiguration,
          @buffering_hints : Types::SplunkBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @hec_acknowledgment_timeout_in_seconds : Int32? = nil,
          @hec_token : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::SplunkRetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil
        )
        end
      end

      # Describes a destination in Splunk.
      struct SplunkDestinationDescription
        include JSON::Serializable

        # The buffering options. If no value is specified, the default values for Splunk are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::SplunkBufferingHints?

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The amount of time that Firehose waits to receive an acknowledgment from Splunk after it sends it
        # data. At the end of the timeout period, Firehose either tries to send the data again or considers it
        # an error, based on your retry settings.
        @[JSON::Field(key: "HECAcknowledgmentTimeoutInSeconds")]
        getter hec_acknowledgment_timeout_in_seconds : Int32?

        # The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.
        @[JSON::Field(key: "HECEndpoint")]
        getter hec_endpoint : String?

        # This type can be either "Raw" or "Event."
        @[JSON::Field(key: "HECEndpointType")]
        getter hec_endpoint_type : String?

        # A GUID you obtain from your Splunk cluster when you create a new HEC endpoint.
        @[JSON::Field(key: "HECToken")]
        getter hec_token : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver data to Splunk or if it doesn't receive an
        # acknowledgment of receipt from Splunk.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::SplunkRetryOptions?

        # Defines how documents should be delivered to Amazon S3. When set to FailedDocumentsOnly , Firehose
        # writes any data that could not be indexed to the configured Amazon S3 destination. When set to
        # AllDocuments , Firehose delivers all incoming records to Amazon S3, and also writes failed documents
        # to Amazon S3. Default value is FailedDocumentsOnly .
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # The Amazon S3 destination.&gt;
        @[JSON::Field(key: "S3DestinationDescription")]
        getter s3_destination_description : Types::S3DestinationDescription?

        # The configuration that defines how you access secrets for Splunk.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        def initialize(
          @buffering_hints : Types::SplunkBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @hec_acknowledgment_timeout_in_seconds : Int32? = nil,
          @hec_endpoint : String? = nil,
          @hec_endpoint_type : String? = nil,
          @hec_token : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::SplunkRetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @s3_destination_description : Types::S3DestinationDescription? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil
        )
        end
      end

      # Describes an update for a destination in Splunk.
      struct SplunkDestinationUpdate
        include JSON::Serializable

        # The buffering options. If no value is specified, the default values for Splunk are used.
        @[JSON::Field(key: "BufferingHints")]
        getter buffering_hints : Types::SplunkBufferingHints?

        # The Amazon CloudWatch logging options for your Firehose stream.
        @[JSON::Field(key: "CloudWatchLoggingOptions")]
        getter cloud_watch_logging_options : Types::CloudWatchLoggingOptions?

        # The amount of time that Firehose waits to receive an acknowledgment from Splunk after it sends data.
        # At the end of the timeout period, Firehose either tries to send the data again or considers it an
        # error, based on your retry settings.
        @[JSON::Field(key: "HECAcknowledgmentTimeoutInSeconds")]
        getter hec_acknowledgment_timeout_in_seconds : Int32?

        # The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.
        @[JSON::Field(key: "HECEndpoint")]
        getter hec_endpoint : String?

        # This type can be either "Raw" or "Event."
        @[JSON::Field(key: "HECEndpointType")]
        getter hec_endpoint_type : String?

        # A GUID that you obtain from your Splunk cluster when you create a new HEC endpoint.
        @[JSON::Field(key: "HECToken")]
        getter hec_token : String?

        # The data processing configuration.
        @[JSON::Field(key: "ProcessingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration?

        # The retry behavior in case Firehose is unable to deliver data to Splunk or if it doesn't receive an
        # acknowledgment of receipt from Splunk.
        @[JSON::Field(key: "RetryOptions")]
        getter retry_options : Types::SplunkRetryOptions?

        # Specifies how you want Firehose to back up documents to Amazon S3. When set to FailedDocumentsOnly ,
        # Firehose writes any data that could not be indexed to the configured Amazon S3 destination. When set
        # to AllEvents , Firehose delivers all incoming records to Amazon S3, and also writes failed documents
        # to Amazon S3. The default value is FailedEventsOnly . You can update this backup mode from
        # FailedEventsOnly to AllEvents . You can't update it from AllEvents to FailedEventsOnly .
        @[JSON::Field(key: "S3BackupMode")]
        getter s3_backup_mode : String?

        # Your update to the configuration of the backup Amazon S3 location.
        @[JSON::Field(key: "S3Update")]
        getter s3_update : Types::S3DestinationUpdate?

        # The configuration that defines how you access secrets for Splunk.
        @[JSON::Field(key: "SecretsManagerConfiguration")]
        getter secrets_manager_configuration : Types::SecretsManagerConfiguration?

        def initialize(
          @buffering_hints : Types::SplunkBufferingHints? = nil,
          @cloud_watch_logging_options : Types::CloudWatchLoggingOptions? = nil,
          @hec_acknowledgment_timeout_in_seconds : Int32? = nil,
          @hec_endpoint : String? = nil,
          @hec_endpoint_type : String? = nil,
          @hec_token : String? = nil,
          @processing_configuration : Types::ProcessingConfiguration? = nil,
          @retry_options : Types::SplunkRetryOptions? = nil,
          @s3_backup_mode : String? = nil,
          @s3_update : Types::S3DestinationUpdate? = nil,
          @secrets_manager_configuration : Types::SecretsManagerConfiguration? = nil
        )
        end
      end

      # Configures retry behavior in case Firehose is unable to deliver documents to Splunk, or if it
      # doesn't receive an acknowledgment from Splunk.
      struct SplunkRetryOptions
        include JSON::Serializable

        # The total amount of time that Firehose spends on retries. This duration starts after the initial
        # attempt to send data to Splunk fails. It doesn't include the periods during which Firehose waits for
        # acknowledgment from Splunk after each attempt.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        def initialize(
          @duration_in_seconds : Int32? = nil
        )
        end
      end

      struct StartDeliveryStreamEncryptionInput
        include JSON::Serializable

        # The name of the Firehose stream for which you want to enable server-side encryption (SSE).
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # Used to specify the type and Amazon Resource Name (ARN) of the KMS key needed for Server-Side
        # Encryption (SSE).
        @[JSON::Field(key: "DeliveryStreamEncryptionConfigurationInput")]
        getter delivery_stream_encryption_configuration_input : Types::DeliveryStreamEncryptionConfigurationInput?

        def initialize(
          @delivery_stream_name : String,
          @delivery_stream_encryption_configuration_input : Types::DeliveryStreamEncryptionConfigurationInput? = nil
        )
        end
      end

      struct StartDeliveryStreamEncryptionOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct StopDeliveryStreamEncryptionInput
        include JSON::Serializable

        # The name of the Firehose stream for which you want to disable server-side encryption (SSE).
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        def initialize(
          @delivery_stream_name : String
        )
        end
      end

      struct StopDeliveryStreamEncryptionOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration to enable automatic table creation. Amazon Data Firehose is in preview release and
      # is subject to change.
      struct TableCreationConfiguration
        include JSON::Serializable

        # Specify whether you want to enable automatic table creation. Amazon Data Firehose is in preview
        # release and is subject to change.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # Metadata that you can assign to a Firehose stream, consisting of a key-value pair.
      struct Tag
        include JSON::Serializable

        # A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode letters,
        # digits, white space, _ . / = + - % @
        @[JSON::Field(key: "Key")]
        getter key : String

        # An optional string, which you can use to describe or define the tag. Maximum length: 256 characters.
        # Valid characters: Unicode letters, digits, white space, _ . / = + - % @
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      struct TagDeliveryStreamInput
        include JSON::Serializable

        # The name of the Firehose stream to which you want to add the tags.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # A set of key-value pairs to use to create the tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @delivery_stream_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagDeliveryStreamOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagDeliveryStreamInput
        include JSON::Serializable

        # The name of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # A list of tag keys. Each corresponding tag is removed from the delivery stream.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @delivery_stream_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagDeliveryStreamOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateDestinationInput
        include JSON::Serializable

        # Obtain this value from the VersionId result of DeliveryStreamDescription . This value is required,
        # and helps the service perform conditional operations. For example, if there is an interleaving
        # update and this value is null, then the update destination fails. After the update is successful,
        # the VersionId value is updated. The service then performs a merge of the old configuration with the
        # new configuration.
        @[JSON::Field(key: "CurrentDeliveryStreamVersionId")]
        getter current_delivery_stream_version_id : String

        # The name of the Firehose stream.
        @[JSON::Field(key: "DeliveryStreamName")]
        getter delivery_stream_name : String

        # The ID of the destination.
        @[JSON::Field(key: "DestinationId")]
        getter destination_id : String

        # Describes an update for a destination in the Serverless offering for Amazon OpenSearch Service.
        @[JSON::Field(key: "AmazonOpenSearchServerlessDestinationUpdate")]
        getter amazon_open_search_serverless_destination_update : Types::AmazonOpenSearchServerlessDestinationUpdate?

        # Describes an update for a destination in Amazon OpenSearch Service.
        @[JSON::Field(key: "AmazonopensearchserviceDestinationUpdate")]
        getter amazonopensearchservice_destination_update : Types::AmazonopensearchserviceDestinationUpdate?

        # Describes an update for a destination in Amazon OpenSearch Service.
        @[JSON::Field(key: "ElasticsearchDestinationUpdate")]
        getter elasticsearch_destination_update : Types::ElasticsearchDestinationUpdate?

        # Describes an update for a destination in Amazon S3.
        @[JSON::Field(key: "ExtendedS3DestinationUpdate")]
        getter extended_s3_destination_update : Types::ExtendedS3DestinationUpdate?

        # Describes an update to the specified HTTP endpoint destination.
        @[JSON::Field(key: "HttpEndpointDestinationUpdate")]
        getter http_endpoint_destination_update : Types::HttpEndpointDestinationUpdate?

        # Describes an update for a destination in Apache Iceberg Tables.
        @[JSON::Field(key: "IcebergDestinationUpdate")]
        getter iceberg_destination_update : Types::IcebergDestinationUpdate?

        # Describes an update for a destination in Amazon Redshift.
        @[JSON::Field(key: "RedshiftDestinationUpdate")]
        getter redshift_destination_update : Types::RedshiftDestinationUpdate?

        # [Deprecated] Describes an update for a destination in Amazon S3.
        @[JSON::Field(key: "S3DestinationUpdate")]
        getter s3_destination_update : Types::S3DestinationUpdate?

        # Update to the Snowflake destination configuration settings.
        @[JSON::Field(key: "SnowflakeDestinationUpdate")]
        getter snowflake_destination_update : Types::SnowflakeDestinationUpdate?

        # Describes an update for a destination in Splunk.
        @[JSON::Field(key: "SplunkDestinationUpdate")]
        getter splunk_destination_update : Types::SplunkDestinationUpdate?

        def initialize(
          @current_delivery_stream_version_id : String,
          @delivery_stream_name : String,
          @destination_id : String,
          @amazon_open_search_serverless_destination_update : Types::AmazonOpenSearchServerlessDestinationUpdate? = nil,
          @amazonopensearchservice_destination_update : Types::AmazonopensearchserviceDestinationUpdate? = nil,
          @elasticsearch_destination_update : Types::ElasticsearchDestinationUpdate? = nil,
          @extended_s3_destination_update : Types::ExtendedS3DestinationUpdate? = nil,
          @http_endpoint_destination_update : Types::HttpEndpointDestinationUpdate? = nil,
          @iceberg_destination_update : Types::IcebergDestinationUpdate? = nil,
          @redshift_destination_update : Types::RedshiftDestinationUpdate? = nil,
          @s3_destination_update : Types::S3DestinationUpdate? = nil,
          @snowflake_destination_update : Types::SnowflakeDestinationUpdate? = nil,
          @splunk_destination_update : Types::SplunkDestinationUpdate? = nil
        )
        end
      end

      struct UpdateDestinationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The details of the VPC of the Amazon OpenSearch or Amazon OpenSearch Serverless destination.
      struct VpcConfiguration
        include JSON::Serializable

        # The ARN of the IAM role that you want the Firehose stream to use to create endpoints in the
        # destination VPC. You can use your existing Firehose delivery role or you can specify a new role. In
        # either case, make sure that the role trusts the Firehose service principal and that it grants the
        # following permissions: ec2:DescribeVpcs ec2:DescribeVpcAttribute ec2:DescribeSubnets
        # ec2:DescribeSecurityGroups ec2:DescribeNetworkInterfaces ec2:CreateNetworkInterface
        # ec2:CreateNetworkInterfacePermission ec2:DeleteNetworkInterface When you specify subnets for
        # delivering data to the destination in a private VPC, make sure you have enough number of free IP
        # addresses in chosen subnets. If there is no available free IP address in a specified subnet,
        # Firehose cannot create or add ENIs for the data delivery in the private VPC, and the delivery will
        # be degraded or fail.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The IDs of the security groups that you want Firehose to use when it creates ENIs in the VPC of the
        # Amazon OpenSearch Service destination. You can use the same security group that the Amazon
        # OpenSearch Service domain uses or different ones. If you specify different security groups here,
        # ensure that they allow outbound HTTPS traffic to the Amazon OpenSearch Service domain's security
        # group. Also ensure that the Amazon OpenSearch Service domain's security group allows HTTPS traffic
        # from the security groups specified here. If you use the same security group for both your delivery
        # stream and the Amazon OpenSearch Service domain, make sure the security group inbound rule allows
        # HTTPS traffic. For more information about security group rules, see Security group rules in the
        # Amazon VPC documentation.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The IDs of the subnets that you want Firehose to use to create ENIs in the VPC of the Amazon
        # OpenSearch Service destination. Make sure that the routing tables and inbound and outbound rules
        # allow traffic to flow from the subnets whose IDs are specified here to the subnets that have the
        # destination Amazon OpenSearch Service endpoints. Firehose creates at least one ENI in each of the
        # subnets that are specified here. Do not delete or modify these ENIs. The number of ENIs that
        # Firehose creates in the subnets specified here scales up and down automatically based on throughput.
        # To enable Firehose to scale up the number of ENIs to match throughput, ensure that you have
        # sufficient quota. To help you calculate the quota you need, assume that Firehose can create up to
        # three ENIs for this Firehose stream for each of the subnets specified here. For more information
        # about ENI quota, see Network Interfaces in the Amazon VPC Quotas topic.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @role_arn : String,
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # The details of the VPC of the Amazon OpenSearch Service destination.
      struct VpcConfigurationDescription
        include JSON::Serializable

        # The ARN of the IAM role that the Firehose stream uses to create endpoints in the destination VPC.
        # You can use your existing Firehose delivery role or you can specify a new role. In either case, make
        # sure that the role trusts the Firehose service principal and that it grants the following
        # permissions: ec2:DescribeVpcs ec2:DescribeVpcAttribute ec2:DescribeSubnets
        # ec2:DescribeSecurityGroups ec2:DescribeNetworkInterfaces ec2:CreateNetworkInterface
        # ec2:CreateNetworkInterfacePermission ec2:DeleteNetworkInterface If you revoke these permissions
        # after you create the Firehose stream, Firehose can't scale out by creating more ENIs when necessary.
        # You might therefore see a degradation in performance.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # The IDs of the security groups that Firehose uses when it creates ENIs in the VPC of the Amazon
        # OpenSearch Service destination. You can use the same security group that the Amazon ES domain uses
        # or different ones. If you specify different security groups, ensure that they allow outbound HTTPS
        # traffic to the Amazon OpenSearch Service domain's security group. Also ensure that the Amazon
        # OpenSearch Service domain's security group allows HTTPS traffic from the security groups specified
        # here. If you use the same security group for both your Firehose stream and the Amazon OpenSearch
        # Service domain, make sure the security group inbound rule allows HTTPS traffic. For more information
        # about security group rules, see Security group rules in the Amazon VPC documentation.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The IDs of the subnets that Firehose uses to create ENIs in the VPC of the Amazon OpenSearch Service
        # destination. Make sure that the routing tables and inbound and outbound rules allow traffic to flow
        # from the subnets whose IDs are specified here to the subnets that have the destination Amazon
        # OpenSearch Service endpoints. Firehose creates at least one ENI in each of the subnets that are
        # specified here. Do not delete or modify these ENIs. The number of ENIs that Firehose creates in the
        # subnets specified here scales up and down automatically based on throughput. To enable Firehose to
        # scale up the number of ENIs to match throughput, ensure that you have sufficient quota. To help you
        # calculate the quota you need, assume that Firehose can create up to three ENIs for this Firehose
        # stream for each of the subnets specified here. For more information about ENI quota, see Network
        # Interfaces in the Amazon VPC Quotas topic.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the Amazon OpenSearch Service destination's VPC.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        def initialize(
          @role_arn : String,
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_id : String
        )
        end
      end
    end
  end
end
