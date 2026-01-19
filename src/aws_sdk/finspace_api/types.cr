require "json"

module AwsSdk
  module FinspaceData
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct AssociateUserToPermissionGroupRequest
        include JSON::Serializable

        # The unique identifier for the permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String

        # The unique identifier for the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_group_id : String,
          @user_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct AssociateUserToPermissionGroupResponse
        include JSON::Serializable

        # The returned status code of the response.
        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @status_code : Int32? = nil
        )
        end
      end

      # The credentials required to access the external Dataview from the S3 location.
      struct AwsCredentials
        include JSON::Serializable

        # The unique identifier for the security credentials.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?

        # The Epoch time when the current credentials expire.
        @[JSON::Field(key: "expiration")]
        getter expiration : Int64?

        # The secret access key that can be used to sign requests.
        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String?

        # The token that users must pass to use the credentials.
        @[JSON::Field(key: "sessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Int64? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # The structure with error messages.
      struct ChangesetErrorInfo
        include JSON::Serializable

        # The category of the error. VALIDATION – The inputs to this request are invalid.
        # SERVICE_QUOTA_EXCEEDED – Service quotas have been exceeded. Please contact AWS support to increase
        # quotas. ACCESS_DENIED – Missing required permission to perform this request. RESOURCE_NOT_FOUND –
        # One or more inputs to this request were not found. THROTTLING – The system temporarily lacks
        # sufficient resources to process the request. INTERNAL_SERVICE_EXCEPTION – An internal service error
        # has occurred. CANCELLED – Cancelled. USER_RECOVERABLE – A user recoverable error has occurred.
        @[JSON::Field(key: "errorCategory")]
        getter error_category : String?

        # The text of the error message.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_category : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # A Changeset is unit of data in a Dataset.
      struct ChangesetSummary
        include JSON::Serializable

        # Beginning time from which the Changeset is active. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "activeFromTimestamp")]
        getter active_from_timestamp : Int64?

        # Time until which the Changeset is active. The value is determined as epoch time in milliseconds. For
        # example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "activeUntilTimestamp")]
        getter active_until_timestamp : Int64?

        # Type that indicates how a Changeset is applied to a Dataset. REPLACE – Changeset is considered as a
        # replacement to all prior loaded Changesets. APPEND – Changeset is considered as an addition to the
        # end of all prior loaded Changesets. MODIFY – Changeset is considered as a replacement to a specific
        # prior ingested Changeset.
        @[JSON::Field(key: "changeType")]
        getter change_type : String?

        # The ARN identifier of the Changeset.
        @[JSON::Field(key: "changesetArn")]
        getter changeset_arn : String?

        # The unique identifier for a Changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the Changeset was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The unique identifier for the FinSpace Dataset in which the Changeset is created.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # The structure with error messages.
        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::ChangesetErrorInfo?

        # Options that define the structure of the source file(s).
        @[JSON::Field(key: "formatParams")]
        getter format_params : Hash(String, String)?

        # Options that define the location of the data being ingested.
        @[JSON::Field(key: "sourceParams")]
        getter source_params : Hash(String, String)?

        # Status of the Changeset ingestion. PENDING – Changeset is pending creation. FAILED – Changeset
        # creation has failed. SUCCESS – Changeset creation has succeeded. RUNNING – Changeset creation is
        # running. STOP_REQUESTED – User requested Changeset creation to stop.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique identifier of the updated Changeset.
        @[JSON::Field(key: "updatedByChangesetId")]
        getter updated_by_changeset_id : String?

        # The unique identifier of the Changeset that is updated.
        @[JSON::Field(key: "updatesChangesetId")]
        getter updates_changeset_id : String?

        def initialize(
          @active_from_timestamp : Int64? = nil,
          @active_until_timestamp : Int64? = nil,
          @change_type : String? = nil,
          @changeset_arn : String? = nil,
          @changeset_id : String? = nil,
          @create_time : Int64? = nil,
          @dataset_id : String? = nil,
          @error_info : Types::ChangesetErrorInfo? = nil,
          @format_params : Hash(String, String)? = nil,
          @source_params : Hash(String, String)? = nil,
          @status : String? = nil,
          @updated_by_changeset_id : String? = nil,
          @updates_changeset_id : String? = nil
        )
        end
      end

      # The definition of a column in a tabular Dataset.
      struct ColumnDefinition
        include JSON::Serializable

        # Description for a column.
        @[JSON::Field(key: "columnDescription")]
        getter column_description : String?

        # The name of a column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String?

        # Data type of a column. STRING – A String data type. CHAR – A char data type. INTEGER – An integer
        # data type. TINYINT – A tinyint data type. SMALLINT – A smallint data type. BIGINT – A bigint data
        # type. FLOAT – A float data type. DOUBLE – A double data type. DATE – A date data type. DATETIME – A
        # datetime data type. BOOLEAN – A boolean data type. BINARY – A binary data type.
        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        def initialize(
          @column_description : String? = nil,
          @column_name : String? = nil,
          @data_type : String? = nil
        )
        end
      end

      # The request conflicts with an existing resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The request for a CreateChangeset operation.
      struct CreateChangesetRequest
        include JSON::Serializable

        # The option to indicate how a Changeset will be applied to a Dataset. REPLACE – Changeset will be
        # considered as a replacement to all prior loaded Changesets. APPEND – Changeset will be considered as
        # an addition to the end of all prior loaded Changesets. MODIFY – Changeset is considered as a
        # replacement to a specific prior ingested Changeset.
        @[JSON::Field(key: "changeType")]
        getter change_type : String

        # The unique identifier for the FinSpace Dataset where the Changeset will be created.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # Options that define the structure of the source file(s) including the format type ( formatType ),
        # header row ( withHeader ), data separation character ( separator ) and the type of compression (
        # compression ). formatType is a required attribute and can have the following values: PARQUET –
        # Parquet source file format. CSV – CSV source file format. JSON – JSON source file format. XML – XML
        # source file format. Here is an example of how you could specify the formatParams : "formatParams": {
        # "formatType": "CSV", "withHeader": "true", "separator": ",", "compression":"None" } Note that if you
        # only provide formatType as CSV , the rest of the attributes will automatically default to CSV values
        # as following: { "withHeader": "true", "separator": "," } For more information about supported file
        # formats, see Supported Data Types and File Formats in the FinSpace User Guide.
        @[JSON::Field(key: "formatParams")]
        getter format_params : Hash(String, String)

        # Options that define the location of the data being ingested ( s3SourcePath ) and the source of the
        # changeset ( sourceType ). Both s3SourcePath and sourceType are required attributes. Here is an
        # example of how you could specify the sourceParams : "sourceParams": { "s3SourcePath":
        # "s3://finspace-landing-us-east-2-bk7gcfvitndqa6ebnvys4d/scratch/wr5hh8pwkpqqkxa4sxrmcw/ingestion/equity.csv",
        # "sourceType": "S3" } The S3 path that you specify must allow the FinSpace role access. To do that,
        # you first need to configure the IAM policy on S3 bucket. For more information, see Loading data from
        # an Amazon S3 Bucket using the FinSpace API section.
        @[JSON::Field(key: "sourceParams")]
        getter source_params : Hash(String, String)

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @change_type : String,
          @dataset_id : String,
          @format_params : Hash(String, String),
          @source_params : Hash(String, String),
          @client_token : String? = nil
        )
        end
      end

      # The response from a CreateChangeset operation.
      struct CreateChangesetResponse
        include JSON::Serializable

        # The unique identifier of the Changeset that is created.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The unique identifier for the FinSpace Dataset where the Changeset is created.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        def initialize(
          @changeset_id : String? = nil,
          @dataset_id : String? = nil
        )
        end
      end

      # Request for creating a data view.
      struct CreateDataViewRequest
        include JSON::Serializable

        # The unique Dataset identifier that is used to create a Dataview.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # Options that define the destination type for the Dataview.
        @[JSON::Field(key: "destinationTypeParams")]
        getter destination_type_params : Types::DataViewDestinationTypeParams

        # Beginning time to use for the Dataview. The value is determined as epoch time in milliseconds. For
        # example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "asOfTimestamp")]
        getter as_of_timestamp : Int64?

        # Flag to indicate Dataview should be updated automatically.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Ordered set of column names used to partition data.
        @[JSON::Field(key: "partitionColumns")]
        getter partition_columns : Array(String)?

        # Columns to be used for sorting the data.
        @[JSON::Field(key: "sortColumns")]
        getter sort_columns : Array(String)?

        def initialize(
          @dataset_id : String,
          @destination_type_params : Types::DataViewDestinationTypeParams,
          @as_of_timestamp : Int64? = nil,
          @auto_update : Bool? = nil,
          @client_token : String? = nil,
          @partition_columns : Array(String)? = nil,
          @sort_columns : Array(String)? = nil
        )
        end
      end

      # Response for creating a data view.
      struct CreateDataViewResponse
        include JSON::Serializable

        # The unique identifier for the created Dataview.
        @[JSON::Field(key: "dataViewId")]
        getter data_view_id : String?

        # The unique identifier of the Dataset used for the Dataview.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        def initialize(
          @data_view_id : String? = nil,
          @dataset_id : String? = nil
        )
        end
      end

      # The request for a CreateDataset operation
      struct CreateDatasetRequest
        include JSON::Serializable

        # Display title for a FinSpace Dataset.
        @[JSON::Field(key: "datasetTitle")]
        getter dataset_title : String

        # The format in which Dataset data is structured. TABULAR – Data is structured in a tabular format.
        # NON_TABULAR – Data is structured in a non-tabular format.
        @[JSON::Field(key: "kind")]
        getter kind : String

        # Permission group parameters for Dataset permissions.
        @[JSON::Field(key: "permissionGroupParams")]
        getter permission_group_params : Types::PermissionGroupParams

        # The unique resource identifier for a Dataset.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Description of a Dataset.
        @[JSON::Field(key: "datasetDescription")]
        getter dataset_description : String?

        # Contact information for a Dataset owner.
        @[JSON::Field(key: "ownerInfo")]
        getter owner_info : Types::DatasetOwnerInfo?

        # Definition for a schema on a tabular Dataset.
        @[JSON::Field(key: "schemaDefinition")]
        getter schema_definition : Types::SchemaUnion?

        def initialize(
          @dataset_title : String,
          @kind : String,
          @permission_group_params : Types::PermissionGroupParams,
          @alias : String? = nil,
          @client_token : String? = nil,
          @dataset_description : String? = nil,
          @owner_info : Types::DatasetOwnerInfo? = nil,
          @schema_definition : Types::SchemaUnion? = nil
        )
        end
      end

      # The response from a CreateDataset operation
      struct CreateDatasetResponse
        include JSON::Serializable

        # The unique identifier for the created Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        def initialize(
          @dataset_id : String? = nil
        )
        end
      end

      struct CreatePermissionGroupRequest
        include JSON::Serializable

        # The option to indicate FinSpace application permissions that are granted to a specific group. When
        # assigning application permissions, be aware that the permission ManageUsersAndGroups allows users to
        # grant themselves or others access to any functionality in their FinSpace environment's application.
        # It should only be granted to trusted users. CreateDataset – Group members can create new datasets.
        # ManageClusters – Group members can manage Apache Spark clusters from FinSpace notebooks.
        # ManageUsersAndGroups – Group members can manage users and permission groups. This is a privileged
        # permission that allows users to grant themselves or others access to any functionality in the
        # application. It should only be granted to trusted users. ManageAttributeSets – Group members can
        # manage attribute sets. ViewAuditData – Group members can view audit data. AccessNotebooks – Group
        # members will have access to FinSpace notebooks. GetTemporaryCredentials – Group members can get
        # temporary API credentials.
        @[JSON::Field(key: "applicationPermissions")]
        getter application_permissions : Array(String)

        # The name of the permission group.
        @[JSON::Field(key: "name")]
        getter name : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A brief description for the permission group.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @application_permissions : Array(String),
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreatePermissionGroupResponse
        include JSON::Serializable

        # The unique identifier for the permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String?

        def initialize(
          @permission_group_id : String? = nil
        )
        end
      end

      struct CreateUserRequest
        include JSON::Serializable

        # The email address of the user that you want to register. The email address serves as a uniquer
        # identifier for each user and cannot be changed after it's created.
        @[JSON::Field(key: "emailAddress")]
        getter email_address : String

        # The option to indicate the type of user. Use one of the following options to specify this parameter:
        # SUPER_USER – A user with permission to all the functionality and data in FinSpace. APP_USER – A user
        # with specific permissions in FinSpace. The users are assigned permissions by adding them to a
        # permission group.
        @[JSON::Field(key: "type")]
        getter type : String

        # The option to indicate whether the user can use the GetProgrammaticAccessCredentials API to obtain
        # credentials that can then be used to access other FinSpace Data API operations. ENABLED – The user
        # has permissions to use the APIs. DISABLED – The user does not have permissions to use any APIs.
        @[JSON::Field(key: "apiAccess")]
        getter api_access : String?

        # The ARN identifier of an AWS user or role that is allowed to call the
        # GetProgrammaticAccessCredentials API to obtain a credentials token for a specific FinSpace user.
        # This must be an IAM role within your FinSpace account.
        @[JSON::Field(key: "apiAccessPrincipalArn")]
        getter api_access_principal_arn : String?

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The first name of the user that you want to register.
        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The last name of the user that you want to register.
        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        def initialize(
          @email_address : String,
          @type : String,
          @api_access : String? = nil,
          @api_access_principal_arn : String? = nil,
          @client_token : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil
        )
        end
      end

      struct CreateUserResponse
        include JSON::Serializable

        # The unique identifier for the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # Short term API credentials.
      struct Credentials
        include JSON::Serializable

        # The access key identifier.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?

        # The access key.
        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String?

        # The session token.
        @[JSON::Field(key: "sessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # Structure for the Dataview destination type parameters.
      struct DataViewDestinationTypeParams
        include JSON::Serializable

        # Destination type for a Dataview. GLUE_TABLE – Glue table destination type. S3 – S3 destination type.
        @[JSON::Field(key: "destinationType")]
        getter destination_type : String

        # Dataview export file format. PARQUET – Parquet export file format. DELIMITED_TEXT – Delimited text
        # export file format.
        @[JSON::Field(key: "s3DestinationExportFileFormat")]
        getter s3_destination_export_file_format : String?

        # Format Options for S3 Destination type. Here is an example of how you could specify the
        # s3DestinationExportFileFormatOptions { "header": "true", "delimiter": ",", "compression": "gzip" }
        @[JSON::Field(key: "s3DestinationExportFileFormatOptions")]
        getter s3_destination_export_file_format_options : Hash(String, String)?

        def initialize(
          @destination_type : String,
          @s3_destination_export_file_format : String? = nil,
          @s3_destination_export_file_format_options : Hash(String, String)? = nil
        )
        end
      end

      # The structure with error messages.
      struct DataViewErrorInfo
        include JSON::Serializable

        # The category of the error. VALIDATION – The inputs to this request are invalid.
        # SERVICE_QUOTA_EXCEEDED – Service quotas have been exceeded. Please contact AWS support to increase
        # quotas. ACCESS_DENIED – Missing required permission to perform this request. RESOURCE_NOT_FOUND –
        # One or more inputs to this request were not found. THROTTLING – The system temporarily lacks
        # sufficient resources to process the request. INTERNAL_SERVICE_EXCEPTION – An internal service error
        # has occurred. CANCELLED – Cancelled. USER_RECOVERABLE – A user recoverable error has occurred.
        @[JSON::Field(key: "errorCategory")]
        getter error_category : String?

        # The text of the error message.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_category : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Structure for the summary of a Dataview.
      struct DataViewSummary
        include JSON::Serializable

        # Time range to use for the Dataview. The value is determined as epoch time in milliseconds. For
        # example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "asOfTimestamp")]
        getter as_of_timestamp : Int64?

        # The flag to indicate Dataview should be updated automatically.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # The timestamp at which the Dataview was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The ARN identifier of the Dataview.
        @[JSON::Field(key: "dataViewArn")]
        getter data_view_arn : String?

        # The unique identifier for the Dataview.
        @[JSON::Field(key: "dataViewId")]
        getter data_view_id : String?

        # Th unique identifier for the Dataview Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # Information about the Dataview destination.
        @[JSON::Field(key: "destinationTypeProperties")]
        getter destination_type_properties : Types::DataViewDestinationTypeParams?

        # The structure with error messages.
        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::DataViewErrorInfo?

        # The last time that a Dataview was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # Ordered set of column names used to partition data.
        @[JSON::Field(key: "partitionColumns")]
        getter partition_columns : Array(String)?

        # Columns to be used for sorting the data.
        @[JSON::Field(key: "sortColumns")]
        getter sort_columns : Array(String)?

        # The status of a Dataview creation. RUNNING – Dataview creation is running. STARTING – Dataview
        # creation is starting. FAILED – Dataview creation has failed. CANCELLED – Dataview creation has been
        # cancelled. TIMEOUT – Dataview creation has timed out. SUCCESS – Dataview creation has succeeded.
        # PENDING – Dataview creation is pending. FAILED_CLEANUP_FAILED – Dataview creation failed and
        # resource cleanup failed.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @as_of_timestamp : Int64? = nil,
          @auto_update : Bool? = nil,
          @create_time : Int64? = nil,
          @data_view_arn : String? = nil,
          @data_view_id : String? = nil,
          @dataset_id : String? = nil,
          @destination_type_properties : Types::DataViewDestinationTypeParams? = nil,
          @error_info : Types::DataViewErrorInfo? = nil,
          @last_modified_time : Int64? = nil,
          @partition_columns : Array(String)? = nil,
          @sort_columns : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # The structure for a Dataset.
      struct Dataset
        include JSON::Serializable

        # The unique resource identifier for a Dataset.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The timestamp at which the Dataset was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The ARN identifier of the Dataset.
        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # Description for a Dataset.
        @[JSON::Field(key: "datasetDescription")]
        getter dataset_description : String?

        # An identifier for a Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # Display title for a Dataset.
        @[JSON::Field(key: "datasetTitle")]
        getter dataset_title : String?

        # The format in which Dataset data is structured. TABULAR – Data is structured in a tabular format.
        # NON_TABULAR – Data is structured in a non-tabular format.
        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The last time that the Dataset was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # Contact information for a Dataset owner.
        @[JSON::Field(key: "ownerInfo")]
        getter owner_info : Types::DatasetOwnerInfo?

        # Definition for a schema on a tabular Dataset.
        @[JSON::Field(key: "schemaDefinition")]
        getter schema_definition : Types::SchemaUnion?

        def initialize(
          @alias : String? = nil,
          @create_time : Int64? = nil,
          @dataset_arn : String? = nil,
          @dataset_description : String? = nil,
          @dataset_id : String? = nil,
          @dataset_title : String? = nil,
          @kind : String? = nil,
          @last_modified_time : Int64? = nil,
          @owner_info : Types::DatasetOwnerInfo? = nil,
          @schema_definition : Types::SchemaUnion? = nil
        )
        end
      end

      # A structure for Dataset owner info.
      struct DatasetOwnerInfo
        include JSON::Serializable

        # Email address for the Dataset owner.
        @[JSON::Field(key: "email")]
        getter email : String?

        # The name of the Dataset owner.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Phone number for the Dataset owner.
        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String?

        def initialize(
          @email : String? = nil,
          @name : String? = nil,
          @phone_number : String? = nil
        )
        end
      end

      # The request for a DeleteDataset operation.
      struct DeleteDatasetRequest
        include JSON::Serializable

        # The unique identifier of the Dataset to be deleted.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @dataset_id : String,
          @client_token : String? = nil
        )
        end
      end

      # The response from an DeleteDataset operation
      struct DeleteDatasetResponse
        include JSON::Serializable

        # The unique identifier for the deleted Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        def initialize(
          @dataset_id : String? = nil
        )
        end
      end

      struct DeletePermissionGroupRequest
        include JSON::Serializable

        # The unique identifier for the permission group that you want to delete.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_group_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeletePermissionGroupResponse
        include JSON::Serializable

        # The unique identifier for the deleted permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String?

        def initialize(
          @permission_group_id : String? = nil
        )
        end
      end

      struct DisableUserRequest
        include JSON::Serializable

        # The unique identifier for the user that you want to deactivate.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @user_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DisableUserResponse
        include JSON::Serializable

        # The unique identifier for the deactivated user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      struct DisassociateUserFromPermissionGroupRequest
        include JSON::Serializable

        # The unique identifier for the permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String

        # The unique identifier for the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @permission_group_id : String,
          @user_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DisassociateUserFromPermissionGroupResponse
        include JSON::Serializable

        # The returned status code of the response.
        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @status_code : Int32? = nil
        )
        end
      end

      struct EnableUserRequest
        include JSON::Serializable

        # The unique identifier for the user that you want to activate.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @user_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct EnableUserResponse
        include JSON::Serializable

        # The unique identifier for the active user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # Request to describe a changeset.
      struct GetChangesetRequest
        include JSON::Serializable

        # The unique identifier of the Changeset for which to get data.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String

        # The unique identifier for the FinSpace Dataset where the Changeset is created.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        def initialize(
          @changeset_id : String,
          @dataset_id : String
        )
        end
      end

      # The response from a describe changeset operation
      struct GetChangesetResponse
        include JSON::Serializable

        # Beginning time from which the Changeset is active. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "activeFromTimestamp")]
        getter active_from_timestamp : Int64?

        # Time until which the Changeset is active. The value is determined as epoch time in milliseconds. For
        # example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "activeUntilTimestamp")]
        getter active_until_timestamp : Int64?

        # Type that indicates how a Changeset is applied to a Dataset. REPLACE – Changeset is considered as a
        # replacement to all prior loaded Changesets. APPEND – Changeset is considered as an addition to the
        # end of all prior loaded Changesets. MODIFY – Changeset is considered as a replacement to a specific
        # prior ingested Changeset.
        @[JSON::Field(key: "changeType")]
        getter change_type : String?

        # The ARN identifier of the Changeset.
        @[JSON::Field(key: "changesetArn")]
        getter changeset_arn : String?

        # The unique identifier for a Changeset.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The timestamp at which the Changeset was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The unique identifier for the FinSpace Dataset where the Changeset is created.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # The structure with error messages.
        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::ChangesetErrorInfo?

        # Structure of the source file(s).
        @[JSON::Field(key: "formatParams")]
        getter format_params : Hash(String, String)?

        # Options that define the location of the data being ingested.
        @[JSON::Field(key: "sourceParams")]
        getter source_params : Hash(String, String)?

        # The status of Changeset creation operation.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique identifier of the updated Changeset.
        @[JSON::Field(key: "updatedByChangesetId")]
        getter updated_by_changeset_id : String?

        # The unique identifier of the Changeset that is being updated.
        @[JSON::Field(key: "updatesChangesetId")]
        getter updates_changeset_id : String?

        def initialize(
          @active_from_timestamp : Int64? = nil,
          @active_until_timestamp : Int64? = nil,
          @change_type : String? = nil,
          @changeset_arn : String? = nil,
          @changeset_id : String? = nil,
          @create_time : Int64? = nil,
          @dataset_id : String? = nil,
          @error_info : Types::ChangesetErrorInfo? = nil,
          @format_params : Hash(String, String)? = nil,
          @source_params : Hash(String, String)? = nil,
          @status : String? = nil,
          @updated_by_changeset_id : String? = nil,
          @updates_changeset_id : String? = nil
        )
        end
      end

      # Request for retrieving a data view detail. Grouped / accessible within a dataset by its dataset id.
      struct GetDataViewRequest
        include JSON::Serializable

        # The unique identifier for the Dataview.
        @[JSON::Field(key: "dataviewId")]
        getter data_view_id : String

        # The unique identifier for the Dataset used in the Dataview.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        def initialize(
          @data_view_id : String,
          @dataset_id : String
        )
        end
      end

      # Response from retrieving a dataview, which includes details on the target database and table name
      struct GetDataViewResponse
        include JSON::Serializable

        # Time range to use for the Dataview. The value is determined as epoch time in milliseconds. For
        # example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "asOfTimestamp")]
        getter as_of_timestamp : Int64?

        # Flag to indicate Dataview should be updated automatically.
        @[JSON::Field(key: "autoUpdate")]
        getter auto_update : Bool?

        # The timestamp at which the Dataview was created in FinSpace. The value is determined as epoch time
        # in milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The ARN identifier of the Dataview.
        @[JSON::Field(key: "dataViewArn")]
        getter data_view_arn : String?

        # The unique identifier for the Dataview.
        @[JSON::Field(key: "dataViewId")]
        getter data_view_id : String?

        # The unique identifier for the Dataset used in the Dataview.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # Options that define the destination type for the Dataview.
        @[JSON::Field(key: "destinationTypeParams")]
        getter destination_type_params : Types::DataViewDestinationTypeParams?

        # Information about an error that occurred for the Dataview.
        @[JSON::Field(key: "errorInfo")]
        getter error_info : Types::DataViewErrorInfo?

        # The last time that a Dataview was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # Ordered set of column names used to partition data.
        @[JSON::Field(key: "partitionColumns")]
        getter partition_columns : Array(String)?

        # Columns to be used for sorting the data.
        @[JSON::Field(key: "sortColumns")]
        getter sort_columns : Array(String)?

        # The status of a Dataview creation. RUNNING – Dataview creation is running. STARTING – Dataview
        # creation is starting. FAILED – Dataview creation has failed. CANCELLED – Dataview creation has been
        # cancelled. TIMEOUT – Dataview creation has timed out. SUCCESS – Dataview creation has succeeded.
        # PENDING – Dataview creation is pending. FAILED_CLEANUP_FAILED – Dataview creation failed and
        # resource cleanup failed.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @as_of_timestamp : Int64? = nil,
          @auto_update : Bool? = nil,
          @create_time : Int64? = nil,
          @data_view_arn : String? = nil,
          @data_view_id : String? = nil,
          @dataset_id : String? = nil,
          @destination_type_params : Types::DataViewDestinationTypeParams? = nil,
          @error_info : Types::DataViewErrorInfo? = nil,
          @last_modified_time : Int64? = nil,
          @partition_columns : Array(String)? = nil,
          @sort_columns : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # Request for the GetDataset operation.
      struct GetDatasetRequest
        include JSON::Serializable

        # The unique identifier for a Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        def initialize(
          @dataset_id : String
        )
        end
      end

      # Response for the GetDataset operation
      struct GetDatasetResponse
        include JSON::Serializable

        # The unique resource identifier for a Dataset.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The timestamp at which the Dataset was created in FinSpace. The value is determined as epoch time in
        # milliseconds. For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as
        # 1635768000000.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The ARN identifier of the Dataset.
        @[JSON::Field(key: "datasetArn")]
        getter dataset_arn : String?

        # A description of the Dataset.
        @[JSON::Field(key: "datasetDescription")]
        getter dataset_description : String?

        # The unique identifier for a Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        # Display title for a Dataset.
        @[JSON::Field(key: "datasetTitle")]
        getter dataset_title : String?

        # The format in which Dataset data is structured. TABULAR – Data is structured in a tabular format.
        # NON_TABULAR – Data is structured in a non-tabular format.
        @[JSON::Field(key: "kind")]
        getter kind : String?

        # The last time that the Dataset was modified. The value is determined as epoch time in milliseconds.
        # For example, the value for Monday, November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # Definition for a schema on a tabular Dataset.
        @[JSON::Field(key: "schemaDefinition")]
        getter schema_definition : Types::SchemaUnion?

        # Status of the Dataset creation. PENDING – Dataset is pending creation. FAILED – Dataset creation has
        # failed. SUCCESS – Dataset creation has succeeded. RUNNING – Dataset creation is running.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @alias : String? = nil,
          @create_time : Int64? = nil,
          @dataset_arn : String? = nil,
          @dataset_description : String? = nil,
          @dataset_id : String? = nil,
          @dataset_title : String? = nil,
          @kind : String? = nil,
          @last_modified_time : Int64? = nil,
          @schema_definition : Types::SchemaUnion? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetExternalDataViewAccessDetailsRequest
        include JSON::Serializable

        # The unique identifier for the Dataview that you want to access.
        @[JSON::Field(key: "dataviewId")]
        getter data_view_id : String

        # The unique identifier for the Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        def initialize(
          @data_view_id : String,
          @dataset_id : String
        )
        end
      end

      struct GetExternalDataViewAccessDetailsResponse
        include JSON::Serializable

        # The credentials required to access the external Dataview from the S3 location.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::AwsCredentials?

        # The location where the external Dataview is stored.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @credentials : Types::AwsCredentials? = nil,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      struct GetPermissionGroupRequest
        include JSON::Serializable

        # The unique identifier for the permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String

        def initialize(
          @permission_group_id : String
        )
        end
      end

      struct GetPermissionGroupResponse
        include JSON::Serializable

        @[JSON::Field(key: "permissionGroup")]
        getter permission_group : Types::PermissionGroup?

        def initialize(
          @permission_group : Types::PermissionGroup? = nil
        )
        end
      end

      # Request for GetProgrammaticAccessCredentials operation
      struct GetProgrammaticAccessCredentialsRequest
        include JSON::Serializable

        # The FinSpace environment identifier.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The time duration in which the credentials remain valid.
        @[JSON::Field(key: "durationInMinutes")]
        getter duration_in_minutes : Int64?

        def initialize(
          @environment_id : String,
          @duration_in_minutes : Int64? = nil
        )
        end
      end

      # Response for GetProgrammaticAccessCredentials operation
      struct GetProgrammaticAccessCredentialsResponse
        include JSON::Serializable

        # Returns the programmatic credentials.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::Credentials?

        # Returns the duration in which the credentials will remain valid.
        @[JSON::Field(key: "durationInMinutes")]
        getter duration_in_minutes : Int64?

        def initialize(
          @credentials : Types::Credentials? = nil,
          @duration_in_minutes : Int64? = nil
        )
        end
      end

      struct GetUserRequest
        include JSON::Serializable

        # The unique identifier of the user to get data for.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @user_id : String
        )
        end
      end

      struct GetUserResponse
        include JSON::Serializable

        # Indicates whether the user can use the GetProgrammaticAccessCredentials API to obtain credentials
        # that can then be used to access other FinSpace Data API operations. ENABLED – The user has
        # permissions to use the APIs. DISABLED – The user does not have permissions to use any APIs.
        @[JSON::Field(key: "apiAccess")]
        getter api_access : String?

        # The ARN identifier of an AWS user or role that is allowed to call the
        # GetProgrammaticAccessCredentials API to obtain a credentials token for a specific FinSpace user.
        # This must be an IAM role within your FinSpace account.
        @[JSON::Field(key: "apiAccessPrincipalArn")]
        getter api_access_principal_arn : String?

        # The timestamp at which the user was created in FinSpace. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The email address that is associated with the user.
        @[JSON::Field(key: "emailAddress")]
        getter email_address : String?

        # The first name of the user.
        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # Describes the last time the user was deactivated. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "lastDisabledTime")]
        getter last_disabled_time : Int64?

        # Describes the last time the user was activated. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "lastEnabledTime")]
        getter last_enabled_time : Int64?

        # Describes the last time that the user logged into their account. The value is determined as epoch
        # time in milliseconds.
        @[JSON::Field(key: "lastLoginTime")]
        getter last_login_time : Int64?

        # Describes the last time the user details were updated. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # The last name of the user.
        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The current status of the user. CREATING – The creation is in progress. ENABLED – The user is
        # created and is currently active. DISABLED – The user is currently inactive.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Indicates the type of user. SUPER_USER – A user with permission to all the functionality and data in
        # FinSpace. APP_USER – A user with specific permissions in FinSpace. The users are assigned
        # permissions by adding them to a permission group.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The unique identifier for the user that is retrieved.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @api_access : String? = nil,
          @api_access_principal_arn : String? = nil,
          @create_time : Int64? = nil,
          @email_address : String? = nil,
          @first_name : String? = nil,
          @last_disabled_time : Int64? = nil,
          @last_enabled_time : Int64? = nil,
          @last_login_time : Int64? = nil,
          @last_modified_time : Int64? = nil,
          @last_name : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct GetWorkingLocationRequest
        include JSON::Serializable

        # Specify the type of the working location. SAGEMAKER – Use the Amazon S3 location as a temporary
        # location to store data content when working with FinSpace Notebooks that run on SageMaker studio.
        # INGESTION – Use the Amazon S3 location as a staging location to copy your data content and then use
        # the location with the Changeset creation operation.
        @[JSON::Field(key: "locationType")]
        getter location_type : String?

        def initialize(
          @location_type : String? = nil
        )
        end
      end

      struct GetWorkingLocationResponse
        include JSON::Serializable

        # Returns the Amazon S3 bucket name for the working location.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # Returns the Amazon S3 Path for the working location.
        @[JSON::Field(key: "s3Path")]
        getter s3_path : String?

        # Returns the Amazon S3 URI for the working location.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @s3_bucket : String? = nil,
          @s3_path : String? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A limit has exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Request to ListChangesetsRequest. It exposes minimal query filters.
      struct ListChangesetsRequest
        include JSON::Serializable

        # The unique identifier for the FinSpace Dataset to which the Changeset belongs.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Response to ListChangesetsResponse. This returns a list of dataset changesets that match the query
      # criteria.
      struct ListChangesetsResponse
        include JSON::Serializable

        # List of Changesets found.
        @[JSON::Field(key: "changesets")]
        getter changesets : Array(Types::ChangesetSummary)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @changesets : Array(Types::ChangesetSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Request for a list data views.
      struct ListDataViewsRequest
        include JSON::Serializable

        # The unique identifier of the Dataset for which to retrieve Dataviews.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dataset_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataViewsResponse
        include JSON::Serializable

        # A list of Dataviews.
        @[JSON::Field(key: "dataViews")]
        getter data_views : Array(Types::DataViewSummary)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_views : Array(Types::DataViewSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Request for the ListDatasets operation.
      struct ListDatasetsRequest
        include JSON::Serializable

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Response for the ListDatasets operation
      struct ListDatasetsResponse
        include JSON::Serializable

        # List of Datasets.
        @[JSON::Field(key: "datasets")]
        getter datasets : Array(Types::Dataset)?

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @datasets : Array(Types::Dataset)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPermissionGroupsByUserRequest
        include JSON::Serializable

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # The unique identifier for the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @user_id : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListPermissionGroupsByUserResponse
        include JSON::Serializable

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of returned permission groups.
        @[JSON::Field(key: "permissionGroups")]
        getter permission_groups : Array(Types::PermissionGroupByUser)?

        def initialize(
          @next_token : String? = nil,
          @permission_groups : Array(Types::PermissionGroupByUser)? = nil
        )
        end
      end

      struct ListPermissionGroupsRequest
        include JSON::Serializable

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @next_token : String? = nil
        )
        end
      end

      struct ListPermissionGroupsResponse
        include JSON::Serializable

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all the permission groups.
        @[JSON::Field(key: "permissionGroups")]
        getter permission_groups : Array(Types::PermissionGroup)?

        def initialize(
          @next_token : String? = nil,
          @permission_groups : Array(Types::PermissionGroup)? = nil
        )
        end
      end

      struct ListUsersByPermissionGroupRequest
        include JSON::Serializable

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # The unique identifier for the permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @permission_group_id : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListUsersByPermissionGroupResponse
        include JSON::Serializable

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Lists details of all users in a specific permission group.
        @[JSON::Field(key: "users")]
        getter users : Array(Types::UserByPermissionGroup)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::UserByPermissionGroup)? = nil
        )
        end
      end

      struct ListUsersRequest
        include JSON::Serializable

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @next_token : String? = nil
        )
        end
      end

      struct ListUsersResponse
        include JSON::Serializable

        # A token that indicates where a results page should begin.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all the users.
        @[JSON::Field(key: "users")]
        getter users : Array(Types::User)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # The structure for a permission group.
      struct PermissionGroup
        include JSON::Serializable

        # Indicates the permissions that are granted to a specific group for accessing the FinSpace
        # application. When assigning application permissions, be aware that the permission
        # ManageUsersAndGroups allows users to grant themselves or others access to any functionality in their
        # FinSpace environment's application. It should only be granted to trusted users. CreateDataset –
        # Group members can create new datasets. ManageClusters – Group members can manage Apache Spark
        # clusters from FinSpace notebooks. ManageUsersAndGroups – Group members can manage users and
        # permission groups. This is a privileged permission that allows users to grant themselves or others
        # access to any functionality in the application. It should only be granted to trusted users.
        # ManageAttributeSets – Group members can manage attribute sets. ViewAuditData – Group members can
        # view audit data. AccessNotebooks – Group members will have access to FinSpace notebooks.
        # GetTemporaryCredentials – Group members can get temporary API credentials.
        @[JSON::Field(key: "applicationPermissions")]
        getter application_permissions : Array(String)?

        # The timestamp at which the group was created in FinSpace. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # A brief description for the permission group.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Describes the last time the permission group was updated. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # Indicates the status of the user within a permission group. ADDITION_IN_PROGRESS – The user is
        # currently being added to the permission group. ADDITION_SUCCESS – The user is successfully added to
        # the permission group. REMOVAL_IN_PROGRESS – The user is currently being removed from the permission
        # group.
        @[JSON::Field(key: "membershipStatus")]
        getter membership_status : String?

        # The name of the permission group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The unique identifier for the permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String?

        def initialize(
          @application_permissions : Array(String)? = nil,
          @create_time : Int64? = nil,
          @description : String? = nil,
          @last_modified_time : Int64? = nil,
          @membership_status : String? = nil,
          @name : String? = nil,
          @permission_group_id : String? = nil
        )
        end
      end

      # The structure of a permission group associated with a user.
      struct PermissionGroupByUser
        include JSON::Serializable

        # Indicates the status of the user within a permission group. ADDITION_IN_PROGRESS – The user is
        # currently being added to the permission group. ADDITION_SUCCESS – The user is successfully added to
        # the permission group. REMOVAL_IN_PROGRESS – The user is currently being removed from the permission
        # group.
        @[JSON::Field(key: "membershipStatus")]
        getter membership_status : String?

        # The name of the permission group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The unique identifier for the permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String?

        def initialize(
          @membership_status : String? = nil,
          @name : String? = nil,
          @permission_group_id : String? = nil
        )
        end
      end

      # Permission group parameters for Dataset permissions. Here is an example of how you could specify the
      # PermissionGroupParams : { "permissionGroupId": "0r6fCRtSTUk4XPfXQe3M0g", "datasetPermissions": [
      # {"permission": "ViewDatasetDetails"}, {"permission": "AddDatasetData"}, {"permission":
      # "EditDatasetMetadata"}, {"permission": "DeleteDataset"} ] }
      struct PermissionGroupParams
        include JSON::Serializable

        # List of resource permissions.
        @[JSON::Field(key: "datasetPermissions")]
        getter dataset_permissions : Array(Types::ResourcePermission)?

        # The unique identifier for the PermissionGroup .
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String?

        def initialize(
          @dataset_permissions : Array(Types::ResourcePermission)? = nil,
          @permission_group_id : String? = nil
        )
        end
      end

      struct ResetUserPasswordRequest
        include JSON::Serializable

        # The unique identifier of the user that a temporary password is requested for.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @user_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct ResetUserPasswordResponse
        include JSON::Serializable

        # A randomly generated temporary password for the requested user. This password expires in 7 days.
        @[JSON::Field(key: "temporaryPassword")]
        getter temporary_password : String?

        # The unique identifier of the user that a new password is generated for.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @temporary_password : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # One or more resources can't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Resource permission for a dataset. When you create a dataset, all the other members of the same user
      # group inherit access to the dataset. You can only create a dataset if your user group has
      # application permission for Create Datasets. The following is a list of valid dataset permissions
      # that you can apply: ViewDatasetDetails ReadDatasetDetails AddDatasetData CreateDataView
      # EditDatasetMetadata DeleteDataset For more information on the dataset permissions, see Supported
      # Dataset Permissions in the FinSpace User Guide.
      struct ResourcePermission
        include JSON::Serializable

        # Permission for a resource.
        @[JSON::Field(key: "permission")]
        getter permission : String?

        def initialize(
          @permission : String? = nil
        )
        end
      end

      # The location of an external Dataview in an S3 bucket.
      struct S3Location
        include JSON::Serializable

        # The name of the S3 bucket.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The path of the folder, within the S3 bucket that contains the Dataset.
        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # Definition for a schema on a tabular Dataset.
      struct SchemaDefinition
        include JSON::Serializable

        # List of column definitions.
        @[JSON::Field(key: "columns")]
        getter columns : Array(Types::ColumnDefinition)?

        # List of column names used for primary key.
        @[JSON::Field(key: "primaryKeyColumns")]
        getter primary_key_columns : Array(String)?

        def initialize(
          @columns : Array(Types::ColumnDefinition)? = nil,
          @primary_key_columns : Array(String)? = nil
        )
        end
      end

      # A union of schema types.
      struct SchemaUnion
        include JSON::Serializable

        # The configuration for a schema on a tabular Dataset.
        @[JSON::Field(key: "tabularSchemaConfig")]
        getter tabular_schema_config : Types::SchemaDefinition?

        def initialize(
          @tabular_schema_config : Types::SchemaDefinition? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end

      # Request to update an existing changeset.
      struct UpdateChangesetRequest
        include JSON::Serializable

        # The unique identifier for the Changeset to update.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String

        # The unique identifier for the FinSpace Dataset in which the Changeset is created.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # Options that define the structure of the source file(s) including the format type ( formatType ),
        # header row ( withHeader ), data separation character ( separator ) and the type of compression (
        # compression ). formatType is a required attribute and can have the following values: PARQUET –
        # Parquet source file format. CSV – CSV source file format. JSON – JSON source file format. XML – XML
        # source file format. Here is an example of how you could specify the formatParams : "formatParams": {
        # "formatType": "CSV", "withHeader": "true", "separator": ",", "compression":"None" } Note that if you
        # only provide formatType as CSV , the rest of the attributes will automatically default to CSV values
        # as following: { "withHeader": "true", "separator": "," } For more information about supported file
        # formats, see Supported Data Types and File Formats in the FinSpace User Guide.
        @[JSON::Field(key: "formatParams")]
        getter format_params : Hash(String, String)

        # Options that define the location of the data being ingested ( s3SourcePath ) and the source of the
        # changeset ( sourceType ). Both s3SourcePath and sourceType are required attributes. Here is an
        # example of how you could specify the sourceParams : "sourceParams": { "s3SourcePath":
        # "s3://finspace-landing-us-east-2-bk7gcfvitndqa6ebnvys4d/scratch/wr5hh8pwkpqqkxa4sxrmcw/ingestion/equity.csv",
        # "sourceType": "S3" } The S3 path that you specify must allow the FinSpace role access. To do that,
        # you first need to configure the IAM policy on S3 bucket. For more information, see Loading data from
        # an Amazon S3 Bucket using the FinSpace API section.
        @[JSON::Field(key: "sourceParams")]
        getter source_params : Hash(String, String)

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @changeset_id : String,
          @dataset_id : String,
          @format_params : Hash(String, String),
          @source_params : Hash(String, String),
          @client_token : String? = nil
        )
        end
      end

      # The response from a update changeset operation.
      struct UpdateChangesetResponse
        include JSON::Serializable

        # The unique identifier for the Changeset to update.
        @[JSON::Field(key: "changesetId")]
        getter changeset_id : String?

        # The unique identifier for the FinSpace Dataset in which the Changeset is created.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        def initialize(
          @changeset_id : String? = nil,
          @dataset_id : String? = nil
        )
        end
      end

      # The request for an UpdateDataset operation
      struct UpdateDatasetRequest
        include JSON::Serializable

        # The unique identifier for the Dataset to update.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String

        # A display title for the Dataset.
        @[JSON::Field(key: "datasetTitle")]
        getter dataset_title : String

        # The format in which the Dataset data is structured. TABULAR – Data is structured in a tabular
        # format. NON_TABULAR – Data is structured in a non-tabular format.
        @[JSON::Field(key: "kind")]
        getter kind : String

        # The unique resource identifier for a Dataset.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the Dataset.
        @[JSON::Field(key: "datasetDescription")]
        getter dataset_description : String?

        # Definition for a schema on a tabular Dataset.
        @[JSON::Field(key: "schemaDefinition")]
        getter schema_definition : Types::SchemaUnion?

        def initialize(
          @dataset_id : String,
          @dataset_title : String,
          @kind : String,
          @alias : String? = nil,
          @client_token : String? = nil,
          @dataset_description : String? = nil,
          @schema_definition : Types::SchemaUnion? = nil
        )
        end
      end

      # The response from an UpdateDataset operation
      struct UpdateDatasetResponse
        include JSON::Serializable

        # The unique identifier for updated Dataset.
        @[JSON::Field(key: "datasetId")]
        getter dataset_id : String?

        def initialize(
          @dataset_id : String? = nil
        )
        end
      end

      struct UpdatePermissionGroupRequest
        include JSON::Serializable

        # The unique identifier for the permission group to update.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String

        # The permissions that are granted to a specific group for accessing the FinSpace application. When
        # assigning application permissions, be aware that the permission ManageUsersAndGroups allows users to
        # grant themselves or others access to any functionality in their FinSpace environment's application.
        # It should only be granted to trusted users. CreateDataset – Group members can create new datasets.
        # ManageClusters – Group members can manage Apache Spark clusters from FinSpace notebooks.
        # ManageUsersAndGroups – Group members can manage users and permission groups. This is a privileged
        # permission that allows users to grant themselves or others access to any functionality in the
        # application. It should only be granted to trusted users. ManageAttributeSets – Group members can
        # manage attribute sets. ViewAuditData – Group members can view audit data. AccessNotebooks – Group
        # members will have access to FinSpace notebooks. GetTemporaryCredentials – Group members can get
        # temporary API credentials.
        @[JSON::Field(key: "applicationPermissions")]
        getter application_permissions : Array(String)?

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A brief description for the permission group.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the permission group.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @permission_group_id : String,
          @application_permissions : Array(String)? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdatePermissionGroupResponse
        include JSON::Serializable

        # The unique identifier for the updated permission group.
        @[JSON::Field(key: "permissionGroupId")]
        getter permission_group_id : String?

        def initialize(
          @permission_group_id : String? = nil
        )
        end
      end

      struct UpdateUserRequest
        include JSON::Serializable

        # The unique identifier for the user that you want to update.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The option to indicate whether the user can use the GetProgrammaticAccessCredentials API to obtain
        # credentials that can then be used to access other FinSpace Data API operations. ENABLED – The user
        # has permissions to use the APIs. DISABLED – The user does not have permissions to use any APIs.
        @[JSON::Field(key: "apiAccess")]
        getter api_access : String?

        # The ARN identifier of an AWS user or role that is allowed to call the
        # GetProgrammaticAccessCredentials API to obtain a credentials token for a specific FinSpace user.
        # This must be an IAM role within your FinSpace account.
        @[JSON::Field(key: "apiAccessPrincipalArn")]
        getter api_access_principal_arn : String?

        # A token that ensures idempotency. This token expires in 10 minutes.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The first name of the user.
        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The last name of the user.
        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The option to indicate the type of user. SUPER_USER – A user with permission to all the
        # functionality and data in FinSpace. APP_USER – A user with specific permissions in FinSpace. The
        # users are assigned permissions by adding them to a permission group.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @user_id : String,
          @api_access : String? = nil,
          @api_access_principal_arn : String? = nil,
          @client_token : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateUserResponse
        include JSON::Serializable

        # The unique identifier of the updated user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # The details of the user.
      struct User
        include JSON::Serializable

        # Indicates whether the user can use the GetProgrammaticAccessCredentials API to obtain credentials
        # that can then be used to access other FinSpace Data API operations. ENABLED – The user has
        # permissions to use the APIs. DISABLED – The user does not have permissions to use any APIs.
        @[JSON::Field(key: "apiAccess")]
        getter api_access : String?

        # The ARN identifier of an AWS user or role that is allowed to call the
        # GetProgrammaticAccessCredentials API to obtain a credentials token for a specific FinSpace user.
        # This must be an IAM role within your FinSpace account.
        @[JSON::Field(key: "apiAccessPrincipalArn")]
        getter api_access_principal_arn : String?

        # The timestamp at which the user was created in FinSpace. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "createTime")]
        getter create_time : Int64?

        # The email address of the user. The email address serves as a uniquer identifier for each user and
        # cannot be changed after it's created.
        @[JSON::Field(key: "emailAddress")]
        getter email_address : String?

        # The first name of the user.
        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # Describes the last time the user was deactivated. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "lastDisabledTime")]
        getter last_disabled_time : Int64?

        # Describes the last time the user was activated. The value is determined as epoch time in
        # milliseconds.
        @[JSON::Field(key: "lastEnabledTime")]
        getter last_enabled_time : Int64?

        # Describes the last time that the user logged into their account. The value is determined as epoch
        # time in milliseconds.
        @[JSON::Field(key: "lastLoginTime")]
        getter last_login_time : Int64?

        # Describes the last time the user was updated. The value is determined as epoch time in milliseconds.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # The last name of the user.
        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The current status of the user. CREATING – The user creation is in progress. ENABLED – The user is
        # created and is currently active. DISABLED – The user is currently inactive.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Indicates the type of user. SUPER_USER – A user with permission to all the functionality and data in
        # FinSpace. APP_USER – A user with specific permissions in FinSpace. The users are assigned
        # permissions by adding them to a permission group.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The unique identifier for the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @api_access : String? = nil,
          @api_access_principal_arn : String? = nil,
          @create_time : Int64? = nil,
          @email_address : String? = nil,
          @first_name : String? = nil,
          @last_disabled_time : Int64? = nil,
          @last_enabled_time : Int64? = nil,
          @last_login_time : Int64? = nil,
          @last_modified_time : Int64? = nil,
          @last_name : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # The structure of a user associated with a permission group.
      struct UserByPermissionGroup
        include JSON::Serializable

        # Indicates whether the user can access FinSpace API operations. ENABLED – The user has permissions to
        # use the API operations. DISABLED – The user does not have permissions to use any API operations.
        @[JSON::Field(key: "apiAccess")]
        getter api_access : String?

        # The IAM ARN identifier that is attached to FinSpace API calls.
        @[JSON::Field(key: "apiAccessPrincipalArn")]
        getter api_access_principal_arn : String?

        # The email address of the user. The email address serves as a unique identifier for each user and
        # cannot be changed after it's created.
        @[JSON::Field(key: "emailAddress")]
        getter email_address : String?

        # The first name of the user.
        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The last name of the user.
        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # Indicates the status of the user within a permission group. ADDITION_IN_PROGRESS – The user is
        # currently being added to the permission group. ADDITION_SUCCESS – The user is successfully added to
        # the permission group. REMOVAL_IN_PROGRESS – The user is currently being removed from the permission
        # group.
        @[JSON::Field(key: "membershipStatus")]
        getter membership_status : String?

        # The current status of the user. CREATING – The user creation is in progress. ENABLED – The user is
        # created and is currently active. DISABLED – The user is currently inactive.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Indicates the type of user. SUPER_USER – A user with permission to all the functionality and data in
        # FinSpace. APP_USER – A user with specific permissions in FinSpace. The users are assigned
        # permissions by adding them to a permission group.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The unique identifier for the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @api_access : String? = nil,
          @api_access_principal_arn : String? = nil,
          @email_address : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @membership_status : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
