require "json"
require "time"

module AwsSdk
  module LakeFormation
    module Types

      # Access to a resource was denied.

      struct AccessDeniedException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AddLFTagsToResourceRequest
        include JSON::Serializable

        # The LF-tags to attach to the resource.

        @[JSON::Field(key: "LFTags")]
        getter lf_tags : Array(Types::LFTagPair)

        # The database, table, or column resource to which to attach an LF-tag.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @lf_tags : Array(Types::LFTagPair),
          @resource : Types::Resource,
          @catalog_id : String? = nil
        )
        end
      end


      struct AddLFTagsToResourceResponse
        include JSON::Serializable

        # A list of failures to tag the resource.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(Types::LFTagError)?

        def initialize(
          @failures : Array(Types::LFTagError)? = nil
        )
        end
      end

      # A new object to add to the governed table.

      struct AddObjectInput
        include JSON::Serializable

        # The Amazon S3 ETag of the object. Returned by GetTableObjects for validation and used to identify
        # changes to the underlying data.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # The size of the Amazon S3 object in bytes.

        @[JSON::Field(key: "Size")]
        getter size : Int64

        # The Amazon S3 location of the object.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # A list of partition values for the object. A value must be specified for each partition key
        # associated with the table. The supported data types are integer, long, date(yyyy-MM-dd),
        # timestamp(yyyy-MM-dd HH:mm:ssXXX or yyyy-MM-dd HH:mm:ss"), string and decimal.

        @[JSON::Field(key: "PartitionValues")]
        getter partition_values : Array(String)?

        def initialize(
          @e_tag : String,
          @size : Int64,
          @uri : String,
          @partition_values : Array(String)? = nil
        )
        end
      end

      # A structure that you pass to indicate you want all rows in a filter.

      struct AllRowsWildcard
        include JSON::Serializable

        def initialize
        end
      end

      # A resource to be created or added already exists.

      struct AlreadyExistsException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssumeDecoratedRoleWithSAMLRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SAML provider in IAM that describes the IdP.

        @[JSON::Field(key: "PrincipalArn")]
        getter principal_arn : String

        # The role that represents an IAM principal whose scope down policy allows it to call credential
        # vending APIs such as GetTemporaryTableCredentials . The caller must also have iam:PassRole
        # permission on this role.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A SAML assertion consisting of an assertion statement for the user who needs temporary credentials.
        # This must match the SAML assertion that was issued to IAM. This must be Base64 encoded.

        @[JSON::Field(key: "SAMLAssertion")]
        getter saml_assertion : String

        # The time period, between 900 and 43,200 seconds, for the timeout of the temporary credentials.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Int32?

        def initialize(
          @principal_arn : String,
          @role_arn : String,
          @saml_assertion : String,
          @duration_seconds : Int32? = nil
        )
        end
      end


      struct AssumeDecoratedRoleWithSAMLResponse
        include JSON::Serializable

        # The access key ID for the temporary credentials. (The access key consists of an access key ID and a
        # secret key).

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The date and time when the temporary credentials expire.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        # The secret key for the temporary credentials. (The access key consists of an access key ID and a
        # secret key).

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String?

        # The session token for the temporary credentials.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # A structure used to include auditing information on the privileged API.

      struct AuditContext
        include JSON::Serializable

        # The filter engine can populate the 'AdditionalAuditContext' information with the request ID for you
        # to track. This information will be displayed in CloudTrail log in your account.

        @[JSON::Field(key: "AdditionalAuditContext")]
        getter additional_audit_context : String?

        def initialize(
          @additional_audit_context : String? = nil
        )
        end
      end


      struct BatchGrantPermissionsRequest
        include JSON::Serializable

        # A list of up to 20 entries for resource permissions to be granted by batch operation to the
        # principal.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::BatchPermissionsRequestEntry)

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @entries : Array(Types::BatchPermissionsRequestEntry),
          @catalog_id : String? = nil
        )
        end
      end


      struct BatchGrantPermissionsResponse
        include JSON::Serializable

        # A list of failures to grant permissions to the resources.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(Types::BatchPermissionsFailureEntry)?

        def initialize(
          @failures : Array(Types::BatchPermissionsFailureEntry)? = nil
        )
        end
      end

      # A list of failures when performing a batch grant or batch revoke operation.

      struct BatchPermissionsFailureEntry
        include JSON::Serializable

        # An error message that applies to the failure of the entry.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetail?

        # An identifier for an entry of the batch request.

        @[JSON::Field(key: "RequestEntry")]
        getter request_entry : Types::BatchPermissionsRequestEntry?

        def initialize(
          @error : Types::ErrorDetail? = nil,
          @request_entry : Types::BatchPermissionsRequestEntry? = nil
        )
        end
      end

      # A permission to a resource granted by batch operation to the principal.

      struct BatchPermissionsRequestEntry
        include JSON::Serializable

        # A unique identifier for the batch permissions request entry.

        @[JSON::Field(key: "Id")]
        getter id : String


        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        # The permissions to be granted.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # Indicates if the option to pass permissions is granted.

        @[JSON::Field(key: "PermissionsWithGrantOption")]
        getter permissions_with_grant_option : Array(String)?

        # The principal to be granted a permission.

        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal?

        # The resource to which the principal is to be granted a permission.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource?

        def initialize(
          @id : String,
          @condition : Types::Condition? = nil,
          @permissions : Array(String)? = nil,
          @permissions_with_grant_option : Array(String)? = nil,
          @principal : Types::DataLakePrincipal? = nil,
          @resource : Types::Resource? = nil
        )
        end
      end


      struct BatchRevokePermissionsRequest
        include JSON::Serializable

        # A list of up to 20 entries for resource permissions to be revoked by batch operation to the
        # principal.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::BatchPermissionsRequestEntry)

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @entries : Array(Types::BatchPermissionsRequestEntry),
          @catalog_id : String? = nil
        )
        end
      end


      struct BatchRevokePermissionsResponse
        include JSON::Serializable

        # A list of failures to revoke permissions to the resources.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(Types::BatchPermissionsFailureEntry)?

        def initialize(
          @failures : Array(Types::BatchPermissionsFailureEntry)? = nil
        )
        end
      end


      struct CancelTransactionRequest
        include JSON::Serializable

        # The transaction to cancel.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String

        def initialize(
          @transaction_id : String
        )
        end
      end


      struct CancelTransactionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure for the catalog object.

      struct CatalogResource
        include JSON::Serializable

        # An identifier for the catalog resource.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # A structure containing the name of a column resource and the LF-tags attached to it.

      struct ColumnLFTag
        include JSON::Serializable

        # The LF-tags attached to a column resource.

        @[JSON::Field(key: "LFTags")]
        getter lf_tags : Array(Types::LFTagPair)?

        # The name of a column resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @lf_tags : Array(Types::LFTagPair)? = nil,
          @name : String? = nil
        )
        end
      end

      # A wildcard object, consisting of an optional list of excluded column names or indexes.

      struct ColumnWildcard
        include JSON::Serializable

        # Excludes column names. Any column with this name will be excluded.

        @[JSON::Field(key: "ExcludedColumnNames")]
        getter excluded_column_names : Array(String)?

        def initialize(
          @excluded_column_names : Array(String)? = nil
        )
        end
      end


      struct CommitTransactionRequest
        include JSON::Serializable

        # The transaction to commit.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String

        def initialize(
          @transaction_id : String
        )
        end
      end


      struct CommitTransactionResponse
        include JSON::Serializable

        # The status of the transaction.

        @[JSON::Field(key: "TransactionStatus")]
        getter transaction_status : String?

        def initialize(
          @transaction_status : String? = nil
        )
        end
      end

      # Two processes are trying to modify a resource simultaneously.

      struct ConcurrentModificationException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A Lake Formation condition, which applies to permissions and opt-ins that contain an expression.

      struct Condition
        include JSON::Serializable

        # An expression written based on the Cedar Policy Language used to match the principal attributes.

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        def initialize(
          @expression : String? = nil
        )
        end
      end

      # Multiple resources exist with the same Amazon S3 location

      struct ConflictException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateDataCellsFilterRequest
        include JSON::Serializable

        # A DataCellsFilter structure containing information about the data cells filter.

        @[JSON::Field(key: "TableData")]
        getter table_data : Types::DataCellsFilter

        def initialize(
          @table_data : Types::DataCellsFilter
        )
        end
      end


      struct CreateDataCellsFilterResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateLFTagExpressionRequest
        include JSON::Serializable

        # A list of LF-Tag conditions (key-value pairs).

        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        # A name for the expression.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # A description with information about the LF-Tag expression.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @expression : Array(Types::LFTag),
          @name : String,
          @catalog_id : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateLFTagExpressionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateLFTagRequest
        include JSON::Serializable

        # The key-name for the LF-tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # A list of possible values an attribute can take.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @tag_key : String,
          @tag_values : Array(String),
          @catalog_id : String? = nil
        )
        end
      end


      struct CreateLFTagResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateLakeFormationIdentityCenterConfigurationRequest
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, view definitions, and other
        # control information to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # A list of the account IDs of Amazon Web Services accounts of third-party applications that are
        # allowed to access data managed by Lake Formation.

        @[JSON::Field(key: "ExternalFiltering")]
        getter external_filtering : Types::ExternalFilteringConfiguration?

        # The ARN of the IAM Identity Center instance for which the operation will be executed. For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # in the Amazon Web Services General Reference.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # A list of service integrations for enabling trusted identity propagation with external services such
        # as Redshift.

        @[JSON::Field(key: "ServiceIntegrations")]
        getter service_integrations : Array(Types::ServiceIntegrationUnion)?

        # A list of Amazon Web Services account IDs and/or Amazon Web Services organization/organizational
        # unit ARNs that are allowed to access data managed by Lake Formation. If the ShareRecipients list
        # includes valid values, a resource share is created with the principals you want to have access to
        # the resources. If the ShareRecipients value is null or the list is empty, no resource share is
        # created.

        @[JSON::Field(key: "ShareRecipients")]
        getter share_recipients : Array(Types::DataLakePrincipal)?

        def initialize(
          @catalog_id : String? = nil,
          @external_filtering : Types::ExternalFilteringConfiguration? = nil,
          @instance_arn : String? = nil,
          @service_integrations : Array(Types::ServiceIntegrationUnion)? = nil,
          @share_recipients : Array(Types::DataLakePrincipal)? = nil
        )
        end
      end


      struct CreateLakeFormationIdentityCenterConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lake Formation application integrated with IAM Identity
        # Center.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        def initialize(
          @application_arn : String? = nil
        )
        end
      end


      struct CreateLakeFormationOptInRequest
        include JSON::Serializable


        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal


        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource


        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        def initialize(
          @principal : Types::DataLakePrincipal,
          @resource : Types::Resource,
          @condition : Types::Condition? = nil
        )
        end
      end


      struct CreateLakeFormationOptInResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that describes certain columns on certain rows.

      struct DataCellsFilter
        include JSON::Serializable

        # A database in the Glue Data Catalog.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name given by the user to the data filter cell.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the catalog to which the table belongs.

        @[JSON::Field(key: "TableCatalogId")]
        getter table_catalog_id : String

        # A table in the database.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # A list of column names and/or nested column attributes. When specifying nested attributes, use a
        # qualified dot (.) delimited format such as "address"."zip". Nested attributes within this list may
        # not exceed a depth of 5.

        @[JSON::Field(key: "ColumnNames")]
        getter column_names : Array(String)?

        # A wildcard with exclusions. You must specify either a ColumnNames list or the ColumnWildCard .

        @[JSON::Field(key: "ColumnWildcard")]
        getter column_wildcard : Types::ColumnWildcard?

        # A PartiQL predicate.

        @[JSON::Field(key: "RowFilter")]
        getter row_filter : Types::RowFilter?

        # The ID of the data cells filter version.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @database_name : String,
          @name : String,
          @table_catalog_id : String,
          @table_name : String,
          @column_names : Array(String)? = nil,
          @column_wildcard : Types::ColumnWildcard? = nil,
          @row_filter : Types::RowFilter? = nil,
          @version_id : String? = nil
        )
        end
      end

      # A structure for a data cells filter resource.

      struct DataCellsFilterResource
        include JSON::Serializable

        # A database in the Glue Data Catalog.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The name of the data cells filter.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the catalog to which the table belongs.

        @[JSON::Field(key: "TableCatalogId")]
        getter table_catalog_id : String?

        # The name of the table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @database_name : String? = nil,
          @name : String? = nil,
          @table_catalog_id : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      # The Lake Formation principal. Supported principals are IAM users or IAM roles.

      struct DataLakePrincipal
        include JSON::Serializable

        # An identifier for the Lake Formation principal.

        @[JSON::Field(key: "DataLakePrincipalIdentifier")]
        getter data_lake_principal_identifier : String?

        def initialize(
          @data_lake_principal_identifier : String? = nil
        )
        end
      end

      # A structure representing a list of Lake Formation principals designated as data lake administrators
      # and lists of principal permission entries for default create database and default create table
      # permissions.

      struct DataLakeSettings
        include JSON::Serializable

        # Whether to allow Amazon EMR clusters to access data managed by Lake Formation. If true, you allow
        # Amazon EMR clusters to access data in Amazon S3 locations that are registered with Lake Formation.
        # If false or null, no Amazon EMR clusters will be able to access data in Amazon S3 locations that are
        # registered with Lake Formation. For more information, see (Optional) Allow external data filtering .

        @[JSON::Field(key: "AllowExternalDataFiltering")]
        getter allow_external_data_filtering : Bool?

        # Whether to allow a third-party query engine to get data access credentials without session tags when
        # a caller has full data access permissions.

        @[JSON::Field(key: "AllowFullTableExternalDataAccess")]
        getter allow_full_table_external_data_access : Bool?

        # Lake Formation relies on a privileged process secured by Amazon EMR or the third party integrator to
        # tag the user's role while assuming it. Lake Formation will publish the acceptable key-value pair,
        # for example key = "LakeFormationTrustedCaller" and value = "TRUE" and the third party integrator
        # must properly tag the temporary security credentials that will be used to call Lake Formation's
        # administrative APIs.

        @[JSON::Field(key: "AuthorizedSessionTagValueList")]
        getter authorized_session_tag_value_list : Array(String)?

        # Specifies whether access control on newly created database is managed by Lake Formation permissions
        # or exclusively by IAM permissions. A null value indicates access control by Lake Formation
        # permissions. A value that assigns ALL to IAM_ALLOWED_PRINCIPALS indicates access control by IAM
        # permissions. This is referred to as the setting "Use only IAM access control," and is for backward
        # compatibility with the Glue permission model implemented by IAM permissions. The only permitted
        # values are an empty array or an array that contains a single JSON object that grants ALL to
        # IAM_ALLOWED_PRINCIPALS. For more information, see Changing the Default Security Settings for Your
        # Data Lake .

        @[JSON::Field(key: "CreateDatabaseDefaultPermissions")]
        getter create_database_default_permissions : Array(Types::PrincipalPermissions)?

        # Specifies whether access control on newly created table is managed by Lake Formation permissions or
        # exclusively by IAM permissions. A null value indicates access control by Lake Formation permissions.
        # A value that assigns ALL to IAM_ALLOWED_PRINCIPALS indicates access control by IAM permissions. This
        # is referred to as the setting "Use only IAM access control," and is for backward compatibility with
        # the Glue permission model implemented by IAM permissions. The only permitted values are an empty
        # array or an array that contains a single JSON object that grants ALL to IAM_ALLOWED_PRINCIPALS. For
        # more information, see Changing the Default Security Settings for Your Data Lake .

        @[JSON::Field(key: "CreateTableDefaultPermissions")]
        getter create_table_default_permissions : Array(Types::PrincipalPermissions)?

        # A list of Lake Formation principals. Supported principals are IAM users or IAM roles.

        @[JSON::Field(key: "DataLakeAdmins")]
        getter data_lake_admins : Array(Types::DataLakePrincipal)?

        # A list of the account IDs of Amazon Web Services accounts with Amazon EMR clusters that are to
        # perform data filtering.&gt;

        @[JSON::Field(key: "ExternalDataFilteringAllowList")]
        getter external_data_filtering_allow_list : Array(Types::DataLakePrincipal)?

        # A key-value map that provides an additional configuration on your data lake. CROSS_ACCOUNT_VERSION
        # is the key you can configure in the Parameters field. Accepted values for the CrossAccountVersion
        # key are 1, 2, 3, and 4.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # A list of Lake Formation principals with only view access to the resources, without the ability to
        # make changes. Supported principals are IAM users or IAM roles.

        @[JSON::Field(key: "ReadOnlyAdmins")]
        getter read_only_admins : Array(Types::DataLakePrincipal)?

        # A list of the resource-owning account IDs that the caller's account can use to share their user
        # access details (user ARNs). The user ARNs can be logged in the resource owner's CloudTrail log. You
        # may want to specify this property when you are in a high-trust boundary, such as the same team or
        # company.

        @[JSON::Field(key: "TrustedResourceOwners")]
        getter trusted_resource_owners : Array(String)?

        def initialize(
          @allow_external_data_filtering : Bool? = nil,
          @allow_full_table_external_data_access : Bool? = nil,
          @authorized_session_tag_value_list : Array(String)? = nil,
          @create_database_default_permissions : Array(Types::PrincipalPermissions)? = nil,
          @create_table_default_permissions : Array(Types::PrincipalPermissions)? = nil,
          @data_lake_admins : Array(Types::DataLakePrincipal)? = nil,
          @external_data_filtering_allow_list : Array(Types::DataLakePrincipal)? = nil,
          @parameters : Hash(String, String)? = nil,
          @read_only_admins : Array(Types::DataLakePrincipal)? = nil,
          @trusted_resource_owners : Array(String)? = nil
        )
        end
      end

      # A structure for a data location object where permissions are granted or revoked.

      struct DataLocationResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the data location resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The identifier for the Data Catalog where the location is registered with Lake Formation. By
        # default, it is the account ID of the caller.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @resource_arn : String,
          @catalog_id : String? = nil
        )
        end
      end

      # A structure for the database object.

      struct DatabaseResource
        include JSON::Serializable

        # The name of the database resource. Unique to the Data Catalog.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the Data Catalog. By default, it is the account ID of the caller.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @name : String,
          @catalog_id : String? = nil
        )
        end
      end


      struct DeleteDataCellsFilterRequest
        include JSON::Serializable

        # A database in the Glue Data Catalog.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # The name given by the user to the data filter cell.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the catalog to which the table belongs.

        @[JSON::Field(key: "TableCatalogId")]
        getter table_catalog_id : String?

        # A table in the database.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @database_name : String? = nil,
          @name : String? = nil,
          @table_catalog_id : String? = nil,
          @table_name : String? = nil
        )
        end
      end


      struct DeleteDataCellsFilterResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLFTagExpressionRequest
        include JSON::Serializable

        # The name for the LF-Tag expression.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the Data Catalog. By default, the account ID in which the LF-Tag expression is
        # saved.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @name : String,
          @catalog_id : String? = nil
        )
        end
      end


      struct DeleteLFTagExpressionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLFTagRequest
        include JSON::Serializable

        # The key-name for the LF-tag to delete.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @tag_key : String,
          @catalog_id : String? = nil
        )
        end
      end


      struct DeleteLFTagResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLakeFormationIdentityCenterConfigurationRequest
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, view definition, and other
        # control information to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @catalog_id : String? = nil
        )
        end
      end


      struct DeleteLakeFormationIdentityCenterConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLakeFormationOptInRequest
        include JSON::Serializable


        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal


        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource


        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        def initialize(
          @principal : Types::DataLakePrincipal,
          @resource : Types::Resource,
          @condition : Types::Condition? = nil
        )
        end
      end


      struct DeleteLakeFormationOptInResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object to delete from the governed table.

      struct DeleteObjectInput
        include JSON::Serializable

        # The Amazon S3 location of the object to delete.

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # The Amazon S3 ETag of the object. Returned by GetTableObjects for validation and used to identify
        # changes to the underlying data.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # A list of partition values for the object. A value must be specified for each partition key
        # associated with the governed table.

        @[JSON::Field(key: "PartitionValues")]
        getter partition_values : Array(String)?

        def initialize(
          @uri : String,
          @e_tag : String? = nil,
          @partition_values : Array(String)? = nil
        )
        end
      end


      struct DeleteObjectsOnCancelRequest
        include JSON::Serializable

        # The database that contains the governed table.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # A list of VirtualObject structures, which indicates the Amazon S3 objects to be deleted if the
        # transaction cancels.

        @[JSON::Field(key: "Objects")]
        getter objects : Array(Types::VirtualObject)

        # The name of the governed table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # ID of the transaction that the writes occur in.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String

        # The Glue data catalog that contains the governed table. Defaults to the current account ID.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @database_name : String,
          @objects : Array(Types::VirtualObject),
          @table_name : String,
          @transaction_id : String,
          @catalog_id : String? = nil
        )
        end
      end


      struct DeleteObjectsOnCancelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to deregister.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DeregisterResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeLakeFormationIdentityCenterConfigurationRequest
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @catalog_id : String? = nil
        )
        end
      end


      struct DescribeLakeFormationIdentityCenterConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lake Formation application integrated with IAM Identity
        # Center.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # Indicates if external filtering is enabled.

        @[JSON::Field(key: "ExternalFiltering")]
        getter external_filtering : Types::ExternalFilteringConfiguration?

        # The Amazon Resource Name (ARN) of the connection.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # The Amazon Resource Name (ARN) of the RAM share.

        @[JSON::Field(key: "ResourceShare")]
        getter resource_share : String?

        # A list of service integrations for enabling trusted identity propagation with external services such
        # as Redshift.

        @[JSON::Field(key: "ServiceIntegrations")]
        getter service_integrations : Array(Types::ServiceIntegrationUnion)?

        # A list of Amazon Web Services account IDs or Amazon Web Services organization/organizational unit
        # ARNs that are allowed to access data managed by Lake Formation. If the ShareRecipients list includes
        # valid values, a resource share is created with the principals you want to have access to the
        # resources as the ShareRecipients . If the ShareRecipients value is null or the list is empty, no
        # resource share is created.

        @[JSON::Field(key: "ShareRecipients")]
        getter share_recipients : Array(Types::DataLakePrincipal)?

        def initialize(
          @application_arn : String? = nil,
          @catalog_id : String? = nil,
          @external_filtering : Types::ExternalFilteringConfiguration? = nil,
          @instance_arn : String? = nil,
          @resource_share : String? = nil,
          @service_integrations : Array(Types::ServiceIntegrationUnion)? = nil,
          @share_recipients : Array(Types::DataLakePrincipal)? = nil
        )
        end
      end


      struct DescribeResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DescribeResourceResponse
        include JSON::Serializable

        # A structure containing information about an Lake Formation resource.

        @[JSON::Field(key: "ResourceInfo")]
        getter resource_info : Types::ResourceInfo?

        def initialize(
          @resource_info : Types::ResourceInfo? = nil
        )
        end
      end


      struct DescribeTransactionRequest
        include JSON::Serializable

        # The transaction for which to return status.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String

        def initialize(
          @transaction_id : String
        )
        end
      end


      struct DescribeTransactionResponse
        include JSON::Serializable

        # Returns a TransactionDescription object containing information about the transaction.

        @[JSON::Field(key: "TransactionDescription")]
        getter transaction_description : Types::TransactionDescription?

        def initialize(
          @transaction_description : Types::TransactionDescription? = nil
        )
        end
      end

      # A structure containing the additional details to be returned in the AdditionalDetails attribute of
      # PrincipalResourcePermissions . If a catalog resource is shared through Resource Access Manager
      # (RAM), then there will exist a corresponding RAM resource share ARN.

      struct DetailsMap
        include JSON::Serializable

        # A resource share ARN for a catalog resource shared through RAM.

        @[JSON::Field(key: "ResourceShare")]
        getter resource_share : Array(String)?

        def initialize(
          @resource_share : Array(String)? = nil
        )
        end
      end

      # A specified entity does not exist.

      struct EntityNotFoundException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an error.

      struct ErrorDetail
        include JSON::Serializable

        # The code associated with this error.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A message describing the error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Statistics related to the processing of a query statement.

      struct ExecutionStatistics
        include JSON::Serializable

        # The average time the request took to be executed.

        @[JSON::Field(key: "AverageExecutionTimeMillis")]
        getter average_execution_time_millis : Int64?

        # The amount of data that was scanned in bytes.

        @[JSON::Field(key: "DataScannedBytes")]
        getter data_scanned_bytes : Int64?

        # The number of work units executed.

        @[JSON::Field(key: "WorkUnitsExecutedCount")]
        getter work_units_executed_count : Int64?

        def initialize(
          @average_execution_time_millis : Int64? = nil,
          @data_scanned_bytes : Int64? = nil,
          @work_units_executed_count : Int64? = nil
        )
        end
      end

      # Contains details about an error where the query request expired.

      struct ExpiredException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ExtendTransactionRequest
        include JSON::Serializable

        # The transaction to extend.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        def initialize(
          @transaction_id : String? = nil
        )
        end
      end


      struct ExtendTransactionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration for enabling external data filtering for third-party applications to access data
      # managed by Lake Formation .

      struct ExternalFilteringConfiguration
        include JSON::Serializable

        # List of third-party application ARNs integrated with Lake Formation.

        @[JSON::Field(key: "AuthorizedTargets")]
        getter authorized_targets : Array(String)

        # Allows to enable or disable the third-party applications that are allowed to access data managed by
        # Lake Formation.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @authorized_targets : Array(String),
          @status : String
        )
        end
      end

      # This structure describes the filtering of columns in a table based on a filter condition.

      struct FilterCondition
        include JSON::Serializable

        # The comparison operator used in the filter condition.

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # The field to filter in the filter condition.

        @[JSON::Field(key: "Field")]
        getter field : String?

        # A string with values used in evaluating the filter condition.

        @[JSON::Field(key: "StringValueList")]
        getter string_value_list : Array(String)?

        def initialize(
          @comparison_operator : String? = nil,
          @field : String? = nil,
          @string_value_list : Array(String)? = nil
        )
        end
      end


      struct GetDataCellsFilterRequest
        include JSON::Serializable

        # A database in the Glue Data Catalog.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name given by the user to the data filter cell.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the catalog to which the table belongs.

        @[JSON::Field(key: "TableCatalogId")]
        getter table_catalog_id : String

        # A table in the database.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @database_name : String,
          @name : String,
          @table_catalog_id : String,
          @table_name : String
        )
        end
      end


      struct GetDataCellsFilterResponse
        include JSON::Serializable

        # A structure that describes certain columns on certain rows.

        @[JSON::Field(key: "DataCellsFilter")]
        getter data_cells_filter : Types::DataCellsFilter?

        def initialize(
          @data_cells_filter : Types::DataCellsFilter? = nil
        )
        end
      end


      struct GetDataLakePrincipalRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDataLakePrincipalResponse
        include JSON::Serializable

        # A unique identifier of the invoking principal.

        @[JSON::Field(key: "Identity")]
        getter identity : String?

        def initialize(
          @identity : String? = nil
        )
        end
      end


      struct GetDataLakeSettingsRequest
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @catalog_id : String? = nil
        )
        end
      end


      struct GetDataLakeSettingsResponse
        include JSON::Serializable

        # A structure representing a list of Lake Formation principals designated as data lake administrators.

        @[JSON::Field(key: "DataLakeSettings")]
        getter data_lake_settings : Types::DataLakeSettings?

        def initialize(
          @data_lake_settings : Types::DataLakeSettings? = nil
        )
        end
      end


      struct GetEffectivePermissionsForPathRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to get permissions.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEffectivePermissionsForPathResponse
        include JSON::Serializable

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the permissions for the specified table or database resource located at the path in Amazon
        # S3.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(Types::PrincipalResourcePermissions)?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::PrincipalResourcePermissions)? = nil
        )
        end
      end


      struct GetLFTagExpressionRequest
        include JSON::Serializable

        # The name for the LF-Tag expression

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the Data Catalog. By default, the account ID.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @name : String,
          @catalog_id : String? = nil
        )
        end
      end


      struct GetLFTagExpressionResponse
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID in which the LF-Tag expression is
        # saved.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The description with information about the LF-Tag expression.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The body of the LF-Tag expression. It is composed of one or more LF-Tag key-value pairs.

        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)?

        # The name for the LF-Tag expression.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @catalog_id : String? = nil,
          @description : String? = nil,
          @expression : Array(Types::LFTag)? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetLFTagRequest
        include JSON::Serializable

        # The key-name for the LF-tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @tag_key : String,
          @catalog_id : String? = nil
        )
        end
      end


      struct GetLFTagResponse
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The key-name for the LF-tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        # A list of possible values an attribute can take.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @catalog_id : String? = nil,
          @tag_key : String? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end


      struct GetQueryStateRequest
        include JSON::Serializable

        # The ID of the plan query operation.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end

      # A structure for the output.

      struct GetQueryStateResponse
        include JSON::Serializable

        # The state of a query previously submitted. The possible states are: PENDING: the query is pending.
        # WORKUNITS_AVAILABLE: some work units are ready for retrieval and execution. FINISHED: the query
        # planning finished successfully, and all work units are ready for retrieval and execution. ERROR: an
        # error occurred with the query, such as an invalid query ID or a backend error.

        @[JSON::Field(key: "State")]
        getter state : String

        # An error message when the operation fails.

        @[JSON::Field(key: "Error")]
        getter error : String?

        def initialize(
          @state : String,
          @error : String? = nil
        )
        end
      end


      struct GetQueryStatisticsRequest
        include JSON::Serializable

        # The ID of the plan query operation.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct GetQueryStatisticsResponse
        include JSON::Serializable

        # An ExecutionStatistics structure containing execution statistics.

        @[JSON::Field(key: "ExecutionStatistics")]
        getter execution_statistics : Types::ExecutionStatistics?

        # A PlanningStatistics structure containing query planning statistics.

        @[JSON::Field(key: "PlanningStatistics")]
        getter planning_statistics : Types::PlanningStatistics?

        # The time that the query was submitted.

        @[JSON::Field(key: "QuerySubmissionTime")]
        getter query_submission_time : Time?

        def initialize(
          @execution_statistics : Types::ExecutionStatistics? = nil,
          @planning_statistics : Types::PlanningStatistics? = nil,
          @query_submission_time : Time? = nil
        )
        end
      end


      struct GetResourceLFTagsRequest
        include JSON::Serializable

        # The database, table, or column resource for which you want to return LF-tags.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # Indicates whether to show the assigned LF-tags.

        @[JSON::Field(key: "ShowAssignedLFTags")]
        getter show_assigned_lf_tags : Bool?

        def initialize(
          @resource : Types::Resource,
          @catalog_id : String? = nil,
          @show_assigned_lf_tags : Bool? = nil
        )
        end
      end


      struct GetResourceLFTagsResponse
        include JSON::Serializable

        # A list of LF-tags applied to a database resource.

        @[JSON::Field(key: "LFTagOnDatabase")]
        getter lf_tag_on_database : Array(Types::LFTagPair)?

        # A list of LF-tags applied to a column resource.

        @[JSON::Field(key: "LFTagsOnColumns")]
        getter lf_tags_on_columns : Array(Types::ColumnLFTag)?

        # A list of LF-tags applied to a table resource.

        @[JSON::Field(key: "LFTagsOnTable")]
        getter lf_tags_on_table : Array(Types::LFTagPair)?

        def initialize(
          @lf_tag_on_database : Array(Types::LFTagPair)? = nil,
          @lf_tags_on_columns : Array(Types::ColumnLFTag)? = nil,
          @lf_tags_on_table : Array(Types::LFTagPair)? = nil
        )
        end
      end


      struct GetTableObjectsRequest
        include JSON::Serializable

        # The database containing the governed table.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The governed table for which to retrieve objects.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The catalog containing the governed table. Defaults to the caller’s account.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # Specifies how many values to return in a page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token if this is not the first call to retrieve these objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A predicate to filter the objects returned based on the partition keys defined in the governed
        # table. The comparison operators supported are: =, &gt;, &lt;, &gt;=, &lt;= The logical operators
        # supported are: AND The data types supported are integer, long, date(yyyy-MM-dd),
        # timestamp(yyyy-MM-dd HH:mm:ssXXX or yyyy-MM-dd HH:mm:ss"), string and decimal.

        @[JSON::Field(key: "PartitionPredicate")]
        getter partition_predicate : String?

        # The time as of when to read the governed table contents. If not set, the most recent transaction
        # commit time is used. Cannot be specified along with TransactionId .

        @[JSON::Field(key: "QueryAsOfTime")]
        getter query_as_of_time : Time?

        # The transaction ID at which to read the governed table contents. If this transaction has aborted, an
        # error is returned. If not set, defaults to the most recent committed transaction. Cannot be
        # specified along with QueryAsOfTime .

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        def initialize(
          @database_name : String,
          @table_name : String,
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @partition_predicate : String? = nil,
          @query_as_of_time : Time? = nil,
          @transaction_id : String? = nil
        )
        end
      end


      struct GetTableObjectsResponse
        include JSON::Serializable

        # A continuation token indicating whether additional data is available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of objects organized by partition keys.

        @[JSON::Field(key: "Objects")]
        getter objects : Array(Types::PartitionObjects)?

        def initialize(
          @next_token : String? = nil,
          @objects : Array(Types::PartitionObjects)? = nil
        )
        end
      end


      struct GetTemporaryDataLocationCredentialsRequest
        include JSON::Serializable


        @[JSON::Field(key: "AuditContext")]
        getter audit_context : Types::AuditContext?

        # The credential scope is determined by the caller's Lake Formation permission on the associated
        # table. Credential scope can be either: READ - Provides read-only access to the data location.
        # READ_WRITE - Provides both read and write access to the data location.

        @[JSON::Field(key: "CredentialsScope")]
        getter credentials_scope : String?

        # The Amazon S3 data location that you want to access.

        @[JSON::Field(key: "DataLocations")]
        getter data_locations : Array(String)?

        # The time period, between 900 and 43,200 seconds, for the timeout of the temporary credentials.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Int32?

        def initialize(
          @audit_context : Types::AuditContext? = nil,
          @credentials_scope : String? = nil,
          @data_locations : Array(String)? = nil,
          @duration_seconds : Int32? = nil
        )
        end
      end


      struct GetTemporaryDataLocationCredentialsResponse
        include JSON::Serializable

        # Refers to the Amazon S3 locations that can be accessed through the
        # GetTemporaryCredentialsForLocation API operation.

        @[JSON::Field(key: "AccessibleDataLocations")]
        getter accessible_data_locations : Array(String)?


        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::TemporaryCredentials?

        # The credential scope is determined by the caller's Lake Formation permission on the associated
        # table. Credential scope can be either: READ - Provides read-only access to the data location.
        # READ_WRITE - Provides both read and write access to the data location.

        @[JSON::Field(key: "CredentialsScope")]
        getter credentials_scope : String?

        def initialize(
          @accessible_data_locations : Array(String)? = nil,
          @credentials : Types::TemporaryCredentials? = nil,
          @credentials_scope : String? = nil
        )
        end
      end


      struct GetTemporaryGluePartitionCredentialsRequest
        include JSON::Serializable

        # A list of partition values identifying a single partition.

        @[JSON::Field(key: "Partition")]
        getter partition : Types::PartitionValueList

        # The ARN of the partitions' table.

        @[JSON::Field(key: "TableArn")]
        getter table_arn : String

        # A structure representing context to access a resource (column names, query ID, etc).

        @[JSON::Field(key: "AuditContext")]
        getter audit_context : Types::AuditContext?

        # The time period, between 900 and 21,600 seconds, for the timeout of the temporary credentials.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Int32?

        # Filters the request based on the user having been granted a list of specified permissions on the
        # requested resource(s).

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # A list of supported permission types for the partition. Valid values are COLUMN_PERMISSION and
        # CELL_FILTER_PERMISSION .

        @[JSON::Field(key: "SupportedPermissionTypes")]
        getter supported_permission_types : Array(String)?

        def initialize(
          @partition : Types::PartitionValueList,
          @table_arn : String,
          @audit_context : Types::AuditContext? = nil,
          @duration_seconds : Int32? = nil,
          @permissions : Array(String)? = nil,
          @supported_permission_types : Array(String)? = nil
        )
        end
      end


      struct GetTemporaryGluePartitionCredentialsResponse
        include JSON::Serializable

        # The access key ID for the temporary credentials.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The date and time when the temporary credentials expire.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        # The secret key for the temporary credentials.

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String?

        # The session token for the temporary credentials.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end


      struct GetTemporaryGlueTableCredentialsRequest
        include JSON::Serializable

        # The ARN identifying a table in the Data Catalog for the temporary credentials request.

        @[JSON::Field(key: "TableArn")]
        getter table_arn : String

        # A structure representing context to access a resource (column names, query ID, etc).

        @[JSON::Field(key: "AuditContext")]
        getter audit_context : Types::AuditContext?

        # The time period, between 900 and 21,600 seconds, for the timeout of the temporary credentials.

        @[JSON::Field(key: "DurationSeconds")]
        getter duration_seconds : Int32?

        # Filters the request based on the user having been granted a list of specified permissions on the
        # requested resource(s).

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # A structure used as a protocol between query engines and Lake Formation or Glue. Contains both a
        # Lake Formation generated authorization identifier and information from the request's authorization
        # context.

        @[JSON::Field(key: "QuerySessionContext")]
        getter query_session_context : Types::QuerySessionContext?

        # The Amazon S3 path for the table.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # A list of supported permission types for the table. Valid values are COLUMN_PERMISSION and
        # CELL_FILTER_PERMISSION .

        @[JSON::Field(key: "SupportedPermissionTypes")]
        getter supported_permission_types : Array(String)?

        def initialize(
          @table_arn : String,
          @audit_context : Types::AuditContext? = nil,
          @duration_seconds : Int32? = nil,
          @permissions : Array(String)? = nil,
          @query_session_context : Types::QuerySessionContext? = nil,
          @s3_path : String? = nil,
          @supported_permission_types : Array(String)? = nil
        )
        end
      end


      struct GetTemporaryGlueTableCredentialsResponse
        include JSON::Serializable

        # The access key ID for the temporary credentials.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The date and time when the temporary credentials expire.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        # The secret key for the temporary credentials.

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String?

        # The session token for the temporary credentials.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String?

        # The Amazon S3 path for the temporary credentials.

        @[JSON::Field(key: "VendedS3Path")]
        getter vended_s3_path : Array(String)?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil,
          @vended_s3_path : Array(String)? = nil
        )
        end
      end


      struct GetWorkUnitResultsRequest
        include JSON::Serializable

        # The ID of the plan query operation for which to get results.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # The work unit ID for which to get results. Value generated by enumerating WorkUnitIdMin to
        # WorkUnitIdMax (inclusive) from the WorkUnitRange in the output of GetWorkUnits .

        @[JSON::Field(key: "WorkUnitId")]
        getter work_unit_id : Int64

        # A work token used to query the execution service. Token output from GetWorkUnits .

        @[JSON::Field(key: "WorkUnitToken")]
        getter work_unit_token : String

        def initialize(
          @query_id : String,
          @work_unit_id : Int64,
          @work_unit_token : String
        )
        end
      end

      # A structure for the output.

      struct GetWorkUnitResultsResponse
        include JSON::Serializable

        # Rows returned from the GetWorkUnitResults operation as a stream of Apache Arrow v1.0 messages.

        @[JSON::Field(key: "ResultStream")]
        getter result_stream : Bytes?

        def initialize(
          @result_stream : Bytes? = nil
        )
        end
      end


      struct GetWorkUnitsRequest
        include JSON::Serializable

        # The ID of the plan query operation.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # A continuation token, if this is a continuation call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The size of each page to get in the Amazon Web Services service call. This does not affect the
        # number of items returned in the command's output. Setting a smaller page size results in more calls
        # to the Amazon Web Services service, retrieving fewer items in each call. This can help prevent the
        # Amazon Web Services service calls from timing out.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @query_id : String,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # A structure for the output.

      struct GetWorkUnitsResponse
        include JSON::Serializable

        # The ID of the plan query operation.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # A WorkUnitRangeList object that specifies the valid range of work unit IDs for querying the
        # execution service.

        @[JSON::Field(key: "WorkUnitRanges")]
        getter work_unit_ranges : Array(Types::WorkUnitRange)

        # A continuation token for paginating the returned list of tokens, returned if the current segment of
        # the list is not the last.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @query_id : String,
          @work_unit_ranges : Array(Types::WorkUnitRange),
          @next_token : String? = nil
        )
        end
      end

      # An encryption operation failed.

      struct GlueEncryptionException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GrantPermissionsRequest
        include JSON::Serializable

        # The permissions granted to the principal on the resource. Lake Formation defines privileges to grant
        # and revoke access to metadata in the Data Catalog and data organized in underlying data storage such
        # as Amazon S3. Lake Formation requires that each principal be authorized to perform a specific task
        # on Lake Formation resources.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)

        # The principal to be granted the permissions on the resource. Supported principals are IAM users or
        # IAM roles, and they are defined by their principal type and their ARN. Note that if you define a
        # resource with a particular ARN, then later delete, and recreate a resource with that same ARN, the
        # resource maintains the permissions already granted.

        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal

        # The resource to which permissions are to be granted. Resources in Lake Formation are the Data
        # Catalog, databases, and tables.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?


        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        # Indicates a list of the granted permissions that the principal may pass to other users. These
        # permissions may only be a subset of the permissions granted in the Privileges .

        @[JSON::Field(key: "PermissionsWithGrantOption")]
        getter permissions_with_grant_option : Array(String)?

        def initialize(
          @permissions : Array(String),
          @principal : Types::DataLakePrincipal,
          @resource : Types::Resource,
          @catalog_id : String? = nil,
          @condition : Types::Condition? = nil,
          @permissions_with_grant_option : Array(String)? = nil
        )
        end
      end


      struct GrantPermissionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An internal service error occurred.

      struct InternalServiceException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input provided was not valid.

      struct InvalidInputException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that allows an admin to grant user permissions on certain conditions. For example,
      # granting a role access to all columns that do not have the LF-tag 'PII' in tables that have the
      # LF-tag 'Prod'.

      struct LFTag
        include JSON::Serializable

        # The key-name for the LF-tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # A list of possible values an attribute can take. The maximum number of values that can be defined
        # for a LF-Tag is 1000. A single API call supports 50 values. You can use multiple API calls to add
        # more values.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        def initialize(
          @tag_key : String,
          @tag_values : Array(String)
        )
        end
      end

      # A structure containing an error related to a TagResource or UnTagResource operation.

      struct LFTagError
        include JSON::Serializable

        # An error that occurred with the attachment or detachment of the LF-tag.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetail?

        # The key-name of the LF-tag.

        @[JSON::Field(key: "LFTag")]
        getter lf_tag : Types::LFTagPair?

        def initialize(
          @error : Types::ErrorDetail? = nil,
          @lf_tag : Types::LFTagPair? = nil
        )
        end
      end

      # A structure consists LF-Tag expression name and catalog ID.

      struct LFTagExpression
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # A structure that contains information about the LF-Tag expression.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A logical expression composed of one or more LF-Tags.

        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)?

        # The name for saved the LF-Tag expression.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @catalog_id : String? = nil,
          @description : String? = nil,
          @expression : Array(Types::LFTag)? = nil,
          @name : String? = nil
        )
        end
      end

      # A structure containing a LF-Tag expression (keys and values).

      struct LFTagExpressionResource
        include JSON::Serializable

        # The name of the LF-Tag expression to grant permissions on.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the Data Catalog. By default, the account ID.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @name : String,
          @catalog_id : String? = nil
        )
        end
      end

      # A structure containing an LF-tag key and values for a resource.

      struct LFTagKeyResource
        include JSON::Serializable

        # The key-name for the LF-tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # A list of possible values an attribute can take.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @tag_key : String,
          @tag_values : Array(String),
          @catalog_id : String? = nil
        )
        end
      end

      # A structure containing an LF-tag key-value pair.

      struct LFTagPair
        include JSON::Serializable

        # The key-name for the LF-tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # A list of possible values an attribute can take.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @tag_key : String,
          @tag_values : Array(String),
          @catalog_id : String? = nil
        )
        end
      end

      # A structure containing a list of LF-tag conditions or saved LF-Tag expressions that apply to a
      # resource's LF-tag policy.

      struct LFTagPolicyResource
        include JSON::Serializable

        # The resource type for which the LF-tag policy applies.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # A list of LF-tag conditions or a saved expression that apply to the resource's LF-tag policy.

        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)?

        # If provided, permissions are granted to the Data Catalog resources whose assigned LF-Tags match the
        # expression body of the saved expression under the provided ExpressionName .

        @[JSON::Field(key: "ExpressionName")]
        getter expression_name : String?

        def initialize(
          @resource_type : String,
          @catalog_id : String? = nil,
          @expression : Array(Types::LFTag)? = nil,
          @expression_name : String? = nil
        )
        end
      end

      # A single principal-resource pair that has Lake Formation permissins enforced.

      struct LakeFormationOptInsInfo
        include JSON::Serializable

        # A Lake Formation condition, which applies to permissions and opt-ins that contain an expression.

        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        # The last modified date and time of the record.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The user who updated the record.

        @[JSON::Field(key: "LastUpdatedBy")]
        getter last_updated_by : String?


        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal?


        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource?

        def initialize(
          @condition : Types::Condition? = nil,
          @last_modified : Time? = nil,
          @last_updated_by : String? = nil,
          @principal : Types::DataLakePrincipal? = nil,
          @resource : Types::Resource? = nil
        )
        end
      end


      struct ListDataCellsFilterRequest
        include JSON::Serializable

        # The maximum size of the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is a continuation call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A table in the Glue Data Catalog.

        @[JSON::Field(key: "Table")]
        getter table : Types::TableResource?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @table : Types::TableResource? = nil
        )
        end
      end


      struct ListDataCellsFilterResponse
        include JSON::Serializable

        # A list of DataCellFilter structures.

        @[JSON::Field(key: "DataCellsFilters")]
        getter data_cells_filters : Array(Types::DataCellsFilter)?

        # A continuation token, if not all requested data cell filters have been returned.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data_cells_filters : Array(Types::DataCellsFilter)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLFTagExpressionsRequest
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLFTagExpressionsResponse
        include JSON::Serializable

        # Logical expressions composed of one more LF-Tag key-value pairs.

        @[JSON::Field(key: "LFTagExpressions")]
        getter lf_tag_expressions : Array(Types::LFTagExpression)?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @lf_tag_expressions : Array(Types::LFTagExpression)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLFTagsRequest
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If resource share type is ALL , returns both in-account LF-tags and shared LF-tags that the
        # requester has permission to view. If resource share type is FOREIGN , returns all share LF-tags that
        # the requester can view. If no resource share type is passed, lists LF-tags in the given catalog ID
        # that the requester has permission to view.

        @[JSON::Field(key: "ResourceShareType")]
        getter resource_share_type : String?

        def initialize(
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_share_type : String? = nil
        )
        end
      end


      struct ListLFTagsResponse
        include JSON::Serializable

        # A list of LF-tags that the requested has permission to view.

        @[JSON::Field(key: "LFTags")]
        getter lf_tags : Array(Types::LFTagPair)?

        # A continuation token, present if the current list segment is not the last.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @lf_tags : Array(Types::LFTagPair)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLakeFormationOptInsRequest
        include JSON::Serializable

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal?

        # A structure for the resource.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal : Types::DataLakePrincipal? = nil,
          @resource : Types::Resource? = nil
        )
        end
      end


      struct ListLakeFormationOptInsResponse
        include JSON::Serializable

        # A list of principal-resource pairs that have Lake Formation permissins enforced.

        @[JSON::Field(key: "LakeFormationOptInsInfoList")]
        getter lake_formation_opt_ins_info_list : Array(Types::LakeFormationOptInsInfo)?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @lake_formation_opt_ins_info_list : Array(Types::LakeFormationOptInsInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPermissionsRequest
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # Indicates that related permissions should be included in the results when listing permissions on a
        # table resource. Set the field to TRUE to show the cell filters on a table resource. Default is FALSE
        # . The Principal parameter must not be specified when requesting cell filter information.

        @[JSON::Field(key: "IncludeRelated")]
        getter include_related : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies a principal to filter the permissions returned.

        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal?

        # A resource where you will get a list of the principal permissions. This operation does not support
        # getting privileges on a table with columns. Instead, call this operation on the table, and the
        # operation returns the table and the table w columns.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource?

        # Specifies a resource type to filter the permissions returned.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @catalog_id : String? = nil,
          @include_related : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal : Types::DataLakePrincipal? = nil,
          @resource : Types::Resource? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct ListPermissionsResponse
        include JSON::Serializable

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of principals and their permissions on the resource for the specified principal and resource
        # types.

        @[JSON::Field(key: "PrincipalResourcePermissions")]
        getter principal_resource_permissions : Array(Types::PrincipalResourcePermissions)?

        def initialize(
          @next_token : String? = nil,
          @principal_resource_permissions : Array(Types::PrincipalResourcePermissions)? = nil
        )
        end
      end


      struct ListResourcesRequest
        include JSON::Serializable

        # Any applicable row-level and/or column-level filtering conditions for the resources.

        @[JSON::Field(key: "FilterConditionList")]
        getter filter_condition_list : Array(Types::FilterCondition)?

        # The maximum number of resource results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve these resources.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter_condition_list : Array(Types::FilterCondition)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourcesResponse
        include JSON::Serializable

        # A continuation token, if this is not the first call to retrieve these resources.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A summary of the data lake resources.

        @[JSON::Field(key: "ResourceInfoList")]
        getter resource_info_list : Array(Types::ResourceInfo)?

        def initialize(
          @next_token : String? = nil,
          @resource_info_list : Array(Types::ResourceInfo)? = nil
        )
        end
      end


      struct ListTableStorageOptimizersRequest
        include JSON::Serializable

        # Name of the database where the table is present.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # Name of the table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The Catalog ID of the table.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The number of storage optimizers to return on each call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is a continuation call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The specific type of storage optimizers to list. The supported value is compaction .

        @[JSON::Field(key: "StorageOptimizerType")]
        getter storage_optimizer_type : String?

        def initialize(
          @database_name : String,
          @table_name : String,
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @storage_optimizer_type : String? = nil
        )
        end
      end


      struct ListTableStorageOptimizersResponse
        include JSON::Serializable

        # A continuation token for paginating the returned list of tokens, returned if the current segment of
        # the list is not the last.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the storage optimizers associated with a table.

        @[JSON::Field(key: "StorageOptimizerList")]
        getter storage_optimizer_list : Array(Types::StorageOptimizer)?

        def initialize(
          @next_token : String? = nil,
          @storage_optimizer_list : Array(Types::StorageOptimizer)? = nil
        )
        end
      end


      struct ListTransactionsRequest
        include JSON::Serializable

        # The catalog for which to list transactions. Defaults to the account ID of the caller.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The maximum number of transactions to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token if this is not the first call to retrieve transactions.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A filter indicating the status of transactions to return. Options are ALL | COMPLETED | COMMITTED |
        # ABORTED | ACTIVE. The default is ALL .

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : String?

        def initialize(
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status_filter : String? = nil
        )
        end
      end


      struct ListTransactionsResponse
        include JSON::Serializable

        # A continuation token indicating whether additional data is available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of transactions. The record for each transaction is a TransactionDescription object.

        @[JSON::Field(key: "Transactions")]
        getter transactions : Array(Types::TransactionDescription)?

        def initialize(
          @next_token : String? = nil,
          @transactions : Array(Types::TransactionDescription)? = nil
        )
        end
      end

      # The operation timed out.

      struct OperationTimeoutException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure containing a list of partition values and table objects.

      struct PartitionObjects
        include JSON::Serializable

        # A list of table objects

        @[JSON::Field(key: "Objects")]
        getter objects : Array(Types::TableObject)?

        # A list of partition values.

        @[JSON::Field(key: "PartitionValues")]
        getter partition_values : Array(String)?

        def initialize(
          @objects : Array(Types::TableObject)? = nil,
          @partition_values : Array(String)? = nil
        )
        end
      end

      # Contains a list of values defining partitions.

      struct PartitionValueList
        include JSON::Serializable

        # The list of partition values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @values : Array(String)
        )
        end
      end

      # The engine does not support filtering data based on the enforced permissions. For example, if you
      # call the GetTemporaryGlueTableCredentials operation with SupportedPermissionType equal to
      # ColumnPermission , but cell-level permissions exist on the table, this exception is thrown.

      struct PermissionTypeMismatchException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Statistics related to the processing of a query statement.

      struct PlanningStatistics
        include JSON::Serializable

        # An estimate of the data that was scanned in bytes.

        @[JSON::Field(key: "EstimatedDataToScanBytes")]
        getter estimated_data_to_scan_bytes : Int64?

        # The time that it took to process the request.

        @[JSON::Field(key: "PlanningTimeMillis")]
        getter planning_time_millis : Int64?

        # The time the request was in queue to be processed.

        @[JSON::Field(key: "QueueTimeMillis")]
        getter queue_time_millis : Int64?

        # The number of work units generated.

        @[JSON::Field(key: "WorkUnitsGeneratedCount")]
        getter work_units_generated_count : Int64?

        def initialize(
          @estimated_data_to_scan_bytes : Int64? = nil,
          @planning_time_millis : Int64? = nil,
          @queue_time_millis : Int64? = nil,
          @work_units_generated_count : Int64? = nil
        )
        end
      end

      # Permissions granted to a principal.

      struct PrincipalPermissions
        include JSON::Serializable

        # The permissions that are granted to the principal.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # The principal who is granted permissions.

        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal?

        def initialize(
          @permissions : Array(String)? = nil,
          @principal : Types::DataLakePrincipal? = nil
        )
        end
      end

      # The permissions granted or revoked on a resource.

      struct PrincipalResourcePermissions
        include JSON::Serializable

        # This attribute can be used to return any additional details of PrincipalResourcePermissions .
        # Currently returns only as a RAM resource share ARN.

        @[JSON::Field(key: "AdditionalDetails")]
        getter additional_details : Types::DetailsMap?

        # A Lake Formation condition, which applies to permissions and opt-ins that contain an expression.

        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        # The date and time when the resource was last updated.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The user who updated the record.

        @[JSON::Field(key: "LastUpdatedBy")]
        getter last_updated_by : String?

        # The permissions to be granted or revoked on the resource.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # Indicates whether to grant the ability to grant permissions (as a subset of permissions granted).

        @[JSON::Field(key: "PermissionsWithGrantOption")]
        getter permissions_with_grant_option : Array(String)?

        # The Data Lake principal to be granted or revoked permissions.

        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal?

        # The resource where permissions are to be granted or revoked.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource?

        def initialize(
          @additional_details : Types::DetailsMap? = nil,
          @condition : Types::Condition? = nil,
          @last_updated : Time? = nil,
          @last_updated_by : String? = nil,
          @permissions : Array(String)? = nil,
          @permissions_with_grant_option : Array(String)? = nil,
          @principal : Types::DataLakePrincipal? = nil,
          @resource : Types::Resource? = nil
        )
        end
      end


      struct PutDataLakeSettingsRequest
        include JSON::Serializable

        # A structure representing a list of Lake Formation principals designated as data lake administrators.

        @[JSON::Field(key: "DataLakeSettings")]
        getter data_lake_settings : Types::DataLakeSettings

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @data_lake_settings : Types::DataLakeSettings,
          @catalog_id : String? = nil
        )
        end
      end


      struct PutDataLakeSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure containing information about the query plan.

      struct QueryPlanningContext
        include JSON::Serializable

        # The database containing the table.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The ID of the Data Catalog where the partition in question resides. If none is provided, the Amazon
        # Web Services account ID is used by default.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The time as of when to read the table contents. If not set, the most recent transaction commit time
        # will be used. Cannot be specified along with TransactionId .

        @[JSON::Field(key: "QueryAsOfTime")]
        getter query_as_of_time : Time?

        # A map consisting of key-value pairs.

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Hash(String, String)?

        # The transaction ID at which to read the table contents. If this transaction is not committed, the
        # read will be treated as part of that transaction and will see its writes. If this transaction has
        # aborted, an error will be returned. If not set, defaults to the most recent committed transaction.
        # Cannot be specified along with QueryAsOfTime .

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        def initialize(
          @database_name : String,
          @catalog_id : String? = nil,
          @query_as_of_time : Time? = nil,
          @query_parameters : Hash(String, String)? = nil,
          @transaction_id : String? = nil
        )
        end
      end

      # A structure used as a protocol between query engines and Lake Formation or Glue. Contains both a
      # Lake Formation generated authorization identifier and information from the request's authorization
      # context.

      struct QuerySessionContext
        include JSON::Serializable

        # An opaque string-string map passed by the query engine.

        @[JSON::Field(key: "AdditionalContext")]
        getter additional_context : Hash(String, String)?

        # An identifier string for the consumer cluster.

        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # A cryptographically generated query identifier generated by Glue or Lake Formation.

        @[JSON::Field(key: "QueryAuthorizationId")]
        getter query_authorization_id : String?

        # A unique identifier generated by the query engine for the query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # A timestamp provided by the query engine for when the query started.

        @[JSON::Field(key: "QueryStartTime")]
        getter query_start_time : Time?

        def initialize(
          @additional_context : Hash(String, String)? = nil,
          @cluster_id : String? = nil,
          @query_authorization_id : String? = nil,
          @query_id : String? = nil,
          @query_start_time : Time? = nil
        )
        end
      end

      # Configuration for enabling trusted identity propagation with Redshift Connect.

      struct RedshiftConnect
        include JSON::Serializable

        # The authorization status for Redshift Connect. Valid values are ENABLED or DISABLED.

        @[JSON::Field(key: "Authorization")]
        getter authorization : String

        def initialize(
          @authorization : String
        )
        end
      end

      # A union structure representing different Redshift integration scopes.

      struct RedshiftScopeUnion
        include JSON::Serializable

        # Configuration for Redshift Connect integration.

        @[JSON::Field(key: "RedshiftConnect")]
        getter redshift_connect : Types::RedshiftConnect?

        def initialize(
          @redshift_connect : Types::RedshiftConnect? = nil
        )
        end
      end


      struct RegisterResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to register.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The Amazon Web Services account that owns the Glue tables associated with specific Amazon S3
        # locations.

        @[JSON::Field(key: "ExpectedResourceOwnerAccount")]
        getter expected_resource_owner_account : String?

        # Specifies whether the data access of tables pointing to the location can be managed by both Lake
        # Formation permissions as well as Amazon S3 bucket policies.

        @[JSON::Field(key: "HybridAccessEnabled")]
        getter hybrid_access_enabled : Bool?

        # The identifier for the role that registers the resource.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Designates an Identity and Access Management (IAM) service-linked role by registering this role with
        # the Data Catalog. A service-linked role is a unique type of IAM role that is linked directly to Lake
        # Formation. For more information, see Using Service-Linked Roles for Lake Formation .

        @[JSON::Field(key: "UseServiceLinkedRole")]
        getter use_service_linked_role : Bool?

        # Whether or not the resource is a federated resource.

        @[JSON::Field(key: "WithFederation")]
        getter with_federation : Bool?

        # Grants the calling principal the permissions to perform all supported Lake Formation operations on
        # the registered data location.

        @[JSON::Field(key: "WithPrivilegedAccess")]
        getter with_privileged_access : Bool?

        def initialize(
          @resource_arn : String,
          @expected_resource_owner_account : String? = nil,
          @hybrid_access_enabled : Bool? = nil,
          @role_arn : String? = nil,
          @use_service_linked_role : Bool? = nil,
          @with_federation : Bool? = nil,
          @with_privileged_access : Bool? = nil
        )
        end
      end


      struct RegisterResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveLFTagsFromResourceRequest
        include JSON::Serializable

        # The LF-tags to be removed from the resource.

        @[JSON::Field(key: "LFTags")]
        getter lf_tags : Array(Types::LFTagPair)

        # The database, table, or column resource where you want to remove an LF-tag.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @lf_tags : Array(Types::LFTagPair),
          @resource : Types::Resource,
          @catalog_id : String? = nil
        )
        end
      end


      struct RemoveLFTagsFromResourceResponse
        include JSON::Serializable

        # A list of failures to untag a resource.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(Types::LFTagError)?

        def initialize(
          @failures : Array(Types::LFTagError)? = nil
        )
        end
      end

      # A structure for the resource.

      struct Resource
        include JSON::Serializable

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "Catalog")]
        getter catalog : Types::CatalogResource?

        # A data cell filter.

        @[JSON::Field(key: "DataCellsFilter")]
        getter data_cells_filter : Types::DataCellsFilterResource?

        # The location of an Amazon S3 path where permissions are granted or revoked.

        @[JSON::Field(key: "DataLocation")]
        getter data_location : Types::DataLocationResource?

        # The database for the resource. Unique to the Data Catalog. A database is a set of associated table
        # definitions organized into a logical group. You can Grant and Revoke database permissions to a
        # principal.

        @[JSON::Field(key: "Database")]
        getter database : Types::DatabaseResource?

        # The LF-Tag key and values attached to a resource.

        @[JSON::Field(key: "LFTag")]
        getter lf_tag : Types::LFTagKeyResource?

        # LF-Tag expression resource. A logical expression composed of one or more LF-Tag key:value pairs.

        @[JSON::Field(key: "LFTagExpression")]
        getter lf_tag_expression : Types::LFTagExpressionResource?

        # A list of LF-tag conditions or saved LF-Tag expressions that define a resource's LF-tag policy.

        @[JSON::Field(key: "LFTagPolicy")]
        getter lf_tag_policy : Types::LFTagPolicyResource?

        # The table for the resource. A table is a metadata definition that represents your data. You can
        # Grant and Revoke table privileges to a principal.

        @[JSON::Field(key: "Table")]
        getter table : Types::TableResource?

        # The table with columns for the resource. A principal with permissions to this resource can select
        # metadata from the columns of a table in the Data Catalog and the underlying data in Amazon S3.

        @[JSON::Field(key: "TableWithColumns")]
        getter table_with_columns : Types::TableWithColumnsResource?

        def initialize(
          @catalog : Types::CatalogResource? = nil,
          @data_cells_filter : Types::DataCellsFilterResource? = nil,
          @data_location : Types::DataLocationResource? = nil,
          @database : Types::DatabaseResource? = nil,
          @lf_tag : Types::LFTagKeyResource? = nil,
          @lf_tag_expression : Types::LFTagExpressionResource? = nil,
          @lf_tag_policy : Types::LFTagPolicyResource? = nil,
          @table : Types::TableResource? = nil,
          @table_with_columns : Types::TableWithColumnsResource? = nil
        )
        end
      end

      # A structure containing information about an Lake Formation resource.

      struct ResourceInfo
        include JSON::Serializable

        # The Amazon Web Services account that owns the Glue tables associated with specific Amazon S3
        # locations.

        @[JSON::Field(key: "ExpectedResourceOwnerAccount")]
        getter expected_resource_owner_account : String?

        # Indicates whether the data access of tables pointing to the location can be managed by both Lake
        # Formation permissions as well as Amazon S3 bucket policies.

        @[JSON::Field(key: "HybridAccessEnabled")]
        getter hybrid_access_enabled : Bool?

        # The date and time the resource was last modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The IAM role that registered a resource.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Indicates whether the registered role has sufficient permissions to access registered Amazon S3
        # location. Verification Status can be one of the following: VERIFIED - Registered role has sufficient
        # permissions to access registered Amazon S3 location. NOT_VERIFIED - Registered role does not have
        # sufficient permissions to access registered Amazon S3 location. VERIFICATION_FAILED - Unable to
        # verify if the registered role can access the registered Amazon S3 location.

        @[JSON::Field(key: "VerificationStatus")]
        getter verification_status : String?

        # Whether or not the resource is a federated resource.

        @[JSON::Field(key: "WithFederation")]
        getter with_federation : Bool?

        # Grants the calling principal the permissions to perform all supported Lake Formation operations on
        # the registered data location.

        @[JSON::Field(key: "WithPrivilegedAccess")]
        getter with_privileged_access : Bool?

        def initialize(
          @expected_resource_owner_account : String? = nil,
          @hybrid_access_enabled : Bool? = nil,
          @last_modified : Time? = nil,
          @resource_arn : String? = nil,
          @role_arn : String? = nil,
          @verification_status : String? = nil,
          @with_federation : Bool? = nil,
          @with_privileged_access : Bool? = nil
        )
        end
      end

      # Contains details about an error related to a resource which is not ready for a transaction.

      struct ResourceNotReadyException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A resource numerical limit was exceeded.

      struct ResourceNumberLimitExceededException
        include JSON::Serializable

        # A message describing the problem.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RevokePermissionsRequest
        include JSON::Serializable

        # The permissions revoked to the principal on the resource. For information about permissions, see
        # Security and Access Control to Metadata and Data .

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)

        # The principal to be revoked permissions on the resource.

        @[JSON::Field(key: "Principal")]
        getter principal : Types::DataLakePrincipal

        # The resource to which permissions are to be revoked.

        @[JSON::Field(key: "Resource")]
        getter resource : Types::Resource

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?


        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        # Indicates a list of permissions for which to revoke the grant option allowing the principal to pass
        # permissions to other principals.

        @[JSON::Field(key: "PermissionsWithGrantOption")]
        getter permissions_with_grant_option : Array(String)?

        def initialize(
          @permissions : Array(String),
          @principal : Types::DataLakePrincipal,
          @resource : Types::Resource,
          @catalog_id : String? = nil,
          @condition : Types::Condition? = nil,
          @permissions_with_grant_option : Array(String)? = nil
        )
        end
      end


      struct RevokePermissionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A PartiQL predicate.

      struct RowFilter
        include JSON::Serializable

        # A wildcard for all rows.

        @[JSON::Field(key: "AllRowsWildcard")]
        getter all_rows_wildcard : Types::AllRowsWildcard?

        # A filter expression.

        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        def initialize(
          @all_rows_wildcard : Types::AllRowsWildcard? = nil,
          @filter_expression : String? = nil
        )
        end
      end


      struct SearchDatabasesByLFTagsRequest
        include JSON::Serializable

        # A list of conditions ( LFTag structures) to search for in database resources.

        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @expression : Array(Types::LFTag),
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchDatabasesByLFTagsResponse
        include JSON::Serializable

        # A list of databases that meet the LF-tag conditions.

        @[JSON::Field(key: "DatabaseList")]
        getter database_list : Array(Types::TaggedDatabase)?

        # A continuation token, present if the current list segment is not the last.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @database_list : Array(Types::TaggedDatabase)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchTablesByLFTagsRequest
        include JSON::Serializable

        # A list of conditions ( LFTag structures) to search for in table resources.

        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A continuation token, if this is not the first call to retrieve this list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @expression : Array(Types::LFTag),
          @catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchTablesByLFTagsResponse
        include JSON::Serializable

        # A continuation token, present if the current list segment is not the last. On the first run, if you
        # include a not null (a value) token you can get empty pages.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tables that meet the LF-tag conditions.

        @[JSON::Field(key: "TableList")]
        getter table_list : Array(Types::TaggedTable)?

        def initialize(
          @next_token : String? = nil,
          @table_list : Array(Types::TaggedTable)? = nil
        )
        end
      end

      # A union structure representing different service integration types.

      struct ServiceIntegrationUnion
        include JSON::Serializable

        # Redshift service integration configuration.

        @[JSON::Field(key: "Redshift")]
        getter redshift : Array(Types::RedshiftScopeUnion)?

        def initialize(
          @redshift : Array(Types::RedshiftScopeUnion)? = nil
        )
        end
      end


      struct StartQueryPlanningRequest
        include JSON::Serializable

        # A structure containing information about the query plan.

        @[JSON::Field(key: "QueryPlanningContext")]
        getter query_planning_context : Types::QueryPlanningContext

        # A PartiQL query statement used as an input to the planner service.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        def initialize(
          @query_planning_context : Types::QueryPlanningContext,
          @query_string : String
        )
        end
      end

      # A structure for the output.

      struct StartQueryPlanningResponse
        include JSON::Serializable

        # The ID of the plan query operation can be used to fetch the actual work unit descriptors that are
        # produced as the result of the operation. The ID is also used to get the query state and as an input
        # to the Execute operation.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct StartTransactionRequest
        include JSON::Serializable

        # Indicates whether this transaction should be read only or read and write. Writes made using a
        # read-only transaction ID will be rejected. Read-only transactions do not need to be committed.

        @[JSON::Field(key: "TransactionType")]
        getter transaction_type : String?

        def initialize(
          @transaction_type : String? = nil
        )
        end
      end


      struct StartTransactionResponse
        include JSON::Serializable

        # An opaque identifier for the transaction.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        def initialize(
          @transaction_id : String? = nil
        )
        end
      end

      # Contains details about an error related to statistics not being ready.

      struct StatisticsNotReadyYetException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure describing the configuration and details of a storage optimizer.

      struct StorageOptimizer
        include JSON::Serializable

        # A map of the storage optimizer configuration. Currently contains only one key-value pair: is_enabled
        # indicates true or false for acceleration.

        @[JSON::Field(key: "Config")]
        getter config : Hash(String, String)?

        # A message that contains information about any error (if present). When an acceleration result has an
        # enabled status, the error message is empty. When an acceleration result has a disabled status, the
        # message describes an error or simply indicates "disabled by the user".

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # When an acceleration result has an enabled status, contains the details of the last job run.

        @[JSON::Field(key: "LastRunDetails")]
        getter last_run_details : String?

        # The specific type of storage optimizer. The supported value is compaction .

        @[JSON::Field(key: "StorageOptimizerType")]
        getter storage_optimizer_type : String?

        # A message that contains information about any warnings (if present).

        @[JSON::Field(key: "Warnings")]
        getter warnings : String?

        def initialize(
          @config : Hash(String, String)? = nil,
          @error_message : String? = nil,
          @last_run_details : String? = nil,
          @storage_optimizer_type : String? = nil,
          @warnings : String? = nil
        )
        end
      end

      # Specifies the details of a governed table.

      struct TableObject
        include JSON::Serializable

        # The Amazon S3 ETag of the object. Returned by GetTableObjects for validation and used to identify
        # changes to the underlying data.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The size of the Amazon S3 object in bytes.

        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # The Amazon S3 location of the object.

        @[JSON::Field(key: "Uri")]
        getter uri : String?

        def initialize(
          @e_tag : String? = nil,
          @size : Int64? = nil,
          @uri : String? = nil
        )
        end
      end

      # A structure for the table object. A table is a metadata definition that represents your data. You
      # can Grant and Revoke table privileges to a principal.

      struct TableResource
        include JSON::Serializable

        # The name of the database for the table. Unique to a Data Catalog. A database is a set of associated
        # table definitions organized into a logical group. You can Grant and Revoke database privileges to a
        # principal.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The identifier for the Data Catalog. By default, it is the account ID of the caller.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The name of the table.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A wildcard object representing every table under a database. At least one of TableResource$Name or
        # TableResource$TableWildcard is required.

        @[JSON::Field(key: "TableWildcard")]
        getter table_wildcard : Types::TableWildcard?

        def initialize(
          @database_name : String,
          @catalog_id : String? = nil,
          @name : String? = nil,
          @table_wildcard : Types::TableWildcard? = nil
        )
        end
      end

      # A wildcard object representing every table under a database.

      struct TableWildcard
        include JSON::Serializable

        def initialize
        end
      end

      # A structure for a table with columns object. This object is only used when granting a SELECT
      # permission. This object must take a value for at least one of ColumnsNames , ColumnsIndexes , or
      # ColumnsWildcard .

      struct TableWithColumnsResource
        include JSON::Serializable

        # The name of the database for the table with columns resource. Unique to the Data Catalog. A database
        # is a set of associated table definitions organized into a logical group. You can Grant and Revoke
        # database privileges to a principal.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of the table resource. A table is a metadata definition that represents your data. You can
        # Grant and Revoke table privileges to a principal.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the Data Catalog. By default, it is the account ID of the caller.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The list of column names for the table. At least one of ColumnNames or ColumnWildcard is required.

        @[JSON::Field(key: "ColumnNames")]
        getter column_names : Array(String)?

        # A wildcard specified by a ColumnWildcard object. At least one of ColumnNames or ColumnWildcard is
        # required.

        @[JSON::Field(key: "ColumnWildcard")]
        getter column_wildcard : Types::ColumnWildcard?

        def initialize(
          @database_name : String,
          @name : String,
          @catalog_id : String? = nil,
          @column_names : Array(String)? = nil,
          @column_wildcard : Types::ColumnWildcard? = nil
        )
        end
      end

      # A structure describing a database resource with LF-tags.

      struct TaggedDatabase
        include JSON::Serializable

        # A database that has LF-tags attached to it.

        @[JSON::Field(key: "Database")]
        getter database : Types::DatabaseResource?

        # A list of LF-tags attached to the database.

        @[JSON::Field(key: "LFTags")]
        getter lf_tags : Array(Types::LFTagPair)?

        def initialize(
          @database : Types::DatabaseResource? = nil,
          @lf_tags : Array(Types::LFTagPair)? = nil
        )
        end
      end

      # A structure describing a table resource with LF-tags.

      struct TaggedTable
        include JSON::Serializable

        # A list of LF-tags attached to the database where the table resides.

        @[JSON::Field(key: "LFTagOnDatabase")]
        getter lf_tag_on_database : Array(Types::LFTagPair)?

        # A list of LF-tags attached to columns in the table.

        @[JSON::Field(key: "LFTagsOnColumns")]
        getter lf_tags_on_columns : Array(Types::ColumnLFTag)?

        # A list of LF-tags attached to the table.

        @[JSON::Field(key: "LFTagsOnTable")]
        getter lf_tags_on_table : Array(Types::LFTagPair)?

        # A table that has LF-tags attached to it.

        @[JSON::Field(key: "Table")]
        getter table : Types::TableResource?

        def initialize(
          @lf_tag_on_database : Array(Types::LFTagPair)? = nil,
          @lf_tags_on_columns : Array(Types::ColumnLFTag)? = nil,
          @lf_tags_on_table : Array(Types::LFTagPair)? = nil,
          @table : Types::TableResource? = nil
        )
        end
      end

      # A temporary set of credentials for an Lake Formation user. These credentials are scoped down to only
      # access the raw data sources that the user has access to. The temporary security credentials consist
      # of an access key and a session token. The access key consists of an access key ID and a secret key.
      # When the credentials are created, they are associated with an IAM access control policy that limits
      # what the user can do when using the credentials.

      struct TemporaryCredentials
        include JSON::Serializable

        # The access key ID for the temporary credentials.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The date and time when the temporary credentials expire.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        # The secret key for the temporary credentials.

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String?

        # The session token for the temporary credentials.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # Contains details about an error where the query request was throttled.

      struct ThrottledException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an error related to a transaction that was cancelled.

      struct TransactionCanceledException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an error related to a transaction commit that was in progress.

      struct TransactionCommitInProgressException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an error where the specified transaction has already been committed and
      # cannot be used for UpdateTableObjects .

      struct TransactionCommittedException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that contains information about a transaction.

      struct TransactionDescription
        include JSON::Serializable

        # The time when the transaction committed or aborted, if it is not currently active.

        @[JSON::Field(key: "TransactionEndTime")]
        getter transaction_end_time : Time?

        # The ID of the transaction.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        # The time when the transaction started.

        @[JSON::Field(key: "TransactionStartTime")]
        getter transaction_start_time : Time?

        # A status of ACTIVE, COMMITTED, or ABORTED.

        @[JSON::Field(key: "TransactionStatus")]
        getter transaction_status : String?

        def initialize(
          @transaction_end_time : Time? = nil,
          @transaction_id : String? = nil,
          @transaction_start_time : Time? = nil,
          @transaction_status : String? = nil
        )
        end
      end


      struct UpdateDataCellsFilterRequest
        include JSON::Serializable

        # A DataCellsFilter structure containing information about the data cells filter.

        @[JSON::Field(key: "TableData")]
        getter table_data : Types::DataCellsFilter

        def initialize(
          @table_data : Types::DataCellsFilter
        )
        end
      end


      struct UpdateDataCellsFilterResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLFTagExpressionRequest
        include JSON::Serializable

        # The LF-Tag expression body composed of one more LF-Tag key-value pairs.

        @[JSON::Field(key: "Expression")]
        getter expression : Array(Types::LFTag)

        # The name for the LF-Tag expression.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the Data Catalog. By default, the account ID.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The description with information about the saved LF-Tag expression.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @expression : Array(Types::LFTag),
          @name : String,
          @catalog_id : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateLFTagExpressionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLFTagRequest
        include JSON::Serializable

        # The key-name for the LF-tag for which to add or delete values.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, and other control information
        # to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # A list of LF-tag values to add from the LF-tag.

        @[JSON::Field(key: "TagValuesToAdd")]
        getter tag_values_to_add : Array(String)?

        # A list of LF-tag values to delete from the LF-tag.

        @[JSON::Field(key: "TagValuesToDelete")]
        getter tag_values_to_delete : Array(String)?

        def initialize(
          @tag_key : String,
          @catalog_id : String? = nil,
          @tag_values_to_add : Array(String)? = nil,
          @tag_values_to_delete : Array(String)? = nil
        )
        end
      end


      struct UpdateLFTagResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLakeFormationIdentityCenterConfigurationRequest
        include JSON::Serializable

        # Allows to enable or disable the IAM Identity Center connection.

        @[JSON::Field(key: "ApplicationStatus")]
        getter application_status : String?

        # The identifier for the Data Catalog. By default, the account ID. The Data Catalog is the persistent
        # metadata store. It contains database definitions, table definitions, view definitions, and other
        # control information to manage your Lake Formation environment.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # A list of the account IDs of Amazon Web Services accounts of third-party applications that are
        # allowed to access data managed by Lake Formation.

        @[JSON::Field(key: "ExternalFiltering")]
        getter external_filtering : Types::ExternalFilteringConfiguration?

        # A list of service integrations for enabling trusted identity propagation with external services such
        # as Redshift.

        @[JSON::Field(key: "ServiceIntegrations")]
        getter service_integrations : Array(Types::ServiceIntegrationUnion)?

        # A list of Amazon Web Services account IDs or Amazon Web Services organization/organizational unit
        # ARNs that are allowed to access to access data managed by Lake Formation. If the ShareRecipients
        # list includes valid values, then the resource share is updated with the principals you want to have
        # access to the resources. If the ShareRecipients value is null, both the list of share recipients and
        # the resource share remain unchanged. If the ShareRecipients value is an empty list, then the
        # existing share recipients list will be cleared, and the resource share will be deleted.

        @[JSON::Field(key: "ShareRecipients")]
        getter share_recipients : Array(Types::DataLakePrincipal)?

        def initialize(
          @application_status : String? = nil,
          @catalog_id : String? = nil,
          @external_filtering : Types::ExternalFilteringConfiguration? = nil,
          @service_integrations : Array(Types::ServiceIntegrationUnion)? = nil,
          @share_recipients : Array(Types::DataLakePrincipal)? = nil
        )
        end
      end


      struct UpdateLakeFormationIdentityCenterConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The new role to use for the given resource registered in Lake Formation.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The Amazon Web Services account that owns the Glue tables associated with specific Amazon S3
        # locations.

        @[JSON::Field(key: "ExpectedResourceOwnerAccount")]
        getter expected_resource_owner_account : String?

        # Specifies whether the data access of tables pointing to the location can be managed by both Lake
        # Formation permissions as well as Amazon S3 bucket policies.

        @[JSON::Field(key: "HybridAccessEnabled")]
        getter hybrid_access_enabled : Bool?

        # Whether or not the resource is a federated resource.

        @[JSON::Field(key: "WithFederation")]
        getter with_federation : Bool?

        def initialize(
          @resource_arn : String,
          @role_arn : String,
          @expected_resource_owner_account : String? = nil,
          @hybrid_access_enabled : Bool? = nil,
          @with_federation : Bool? = nil
        )
        end
      end


      struct UpdateResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateTableObjectsRequest
        include JSON::Serializable

        # The database containing the governed table to update.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The governed table to update.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # A list of WriteOperation objects that define an object to add to or delete from the manifest for a
        # governed table.

        @[JSON::Field(key: "WriteOperations")]
        getter write_operations : Array(Types::WriteOperation)

        # The catalog containing the governed table to update. Defaults to the caller’s account ID.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # The transaction at which to do the write.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        def initialize(
          @database_name : String,
          @table_name : String,
          @write_operations : Array(Types::WriteOperation),
          @catalog_id : String? = nil,
          @transaction_id : String? = nil
        )
        end
      end


      struct UpdateTableObjectsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateTableStorageOptimizerRequest
        include JSON::Serializable

        # Name of the database where the table is present.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # Name of the configuration for the storage optimizer.

        @[JSON::Field(key: "StorageOptimizerConfig")]
        getter storage_optimizer_config : Hash(String, Hash(String, String))

        # Name of the table for which to enable the storage optimizer.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The Catalog ID of the table.

        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        def initialize(
          @database_name : String,
          @storage_optimizer_config : Hash(String, Hash(String, String)),
          @table_name : String,
          @catalog_id : String? = nil
        )
        end
      end


      struct UpdateTableStorageOptimizerResponse
        include JSON::Serializable

        # A response indicating the success of failure of the operation.

        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @result : String? = nil
        )
        end
      end

      # An object that defines an Amazon S3 object to be deleted if a transaction cancels, provided that
      # VirtualPut was called before writing the object.

      struct VirtualObject
        include JSON::Serializable

        # The path to the Amazon S3 object. Must start with s3://

        @[JSON::Field(key: "Uri")]
        getter uri : String

        # The ETag of the Amazon S3 object.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @uri : String,
          @e_tag : String? = nil
        )
        end
      end

      # Defines the valid range of work unit IDs for querying the execution service.

      struct WorkUnitRange
        include JSON::Serializable

        # Defines the maximum work unit ID in the range. The maximum value is inclusive.

        @[JSON::Field(key: "WorkUnitIdMax")]
        getter work_unit_id_max : Int64

        # Defines the minimum work unit ID in the range.

        @[JSON::Field(key: "WorkUnitIdMin")]
        getter work_unit_id_min : Int64

        # A work token used to query the execution service.

        @[JSON::Field(key: "WorkUnitToken")]
        getter work_unit_token : String

        def initialize(
          @work_unit_id_max : Int64,
          @work_unit_id_min : Int64,
          @work_unit_token : String
        )
        end
      end

      # Contains details about an error related to work units not being ready.

      struct WorkUnitsNotReadyYetException
        include JSON::Serializable

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines an object to add to or delete from a governed table.

      struct WriteOperation
        include JSON::Serializable

        # A new object to add to the governed table.

        @[JSON::Field(key: "AddObject")]
        getter add_object : Types::AddObjectInput?

        # An object to delete from the governed table.

        @[JSON::Field(key: "DeleteObject")]
        getter delete_object : Types::DeleteObjectInput?

        def initialize(
          @add_object : Types::AddObjectInput? = nil,
          @delete_object : Types::DeleteObjectInput? = nil
        )
        end
      end
    end
  end
end
