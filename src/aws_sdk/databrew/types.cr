require "json"
require "time"

module AwsSdk
  module DataBrew
    module Types

      # Access to the specified resource was denied.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration of statistics that are allowed to be run on columns that contain detected entities.
      # When undefined, no statistics will be computed on columns that contain detected entities.
      struct AllowedStatistics
        include JSON::Serializable

        # One or more column statistics to allow for columns that contain detected entities.
        @[JSON::Field(key: "Statistics")]
        getter statistics : Array(String)

        def initialize(
          @statistics : Array(String)
        )
        end
      end

      struct BatchDeleteRecipeVersionRequest
        include JSON::Serializable

        # The name of the recipe whose versions are to be deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        # An array of version identifiers, for the recipe versions to be deleted. You can specify numeric
        # versions ( X.Y ) or LATEST_WORKING . LATEST_PUBLISHED is not supported.
        @[JSON::Field(key: "RecipeVersions")]
        getter recipe_versions : Array(String)

        def initialize(
          @name : String,
          @recipe_versions : Array(String)
        )
        end
      end

      struct BatchDeleteRecipeVersionResponse
        include JSON::Serializable

        # The name of the recipe that was modified.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Errors, if any, that occurred while attempting to delete the recipe versions.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::RecipeVersionErrorDetail)?

        def initialize(
          @name : String,
          @errors : Array(Types::RecipeVersionErrorDetail)? = nil
        )
        end
      end

      # Selector of a column from a dataset for profile job configuration. One selector includes either a
      # column name or a regular expression.
      struct ColumnSelector
        include JSON::Serializable

        # The name of a column from a dataset.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A regular expression for selecting a column from a dataset.
        @[JSON::Field(key: "Regex")]
        getter regex : String?

        def initialize(
          @name : String? = nil,
          @regex : String? = nil
        )
        end
      end

      # Configuration for column evaluations for a profile job. ColumnStatisticsConfiguration can be used to
      # select evaluations and override parameters of evaluations for particular columns.
      struct ColumnStatisticsConfiguration
        include JSON::Serializable

        # Configuration for evaluations. Statistics can be used to select evaluations and override parameters
        # of evaluations.
        @[JSON::Field(key: "Statistics")]
        getter statistics : Types::StatisticsConfiguration

        # List of column selectors. Selectors can be used to select columns from the dataset. When selectors
        # are undefined, configuration will be applied to all supported columns.
        @[JSON::Field(key: "Selectors")]
        getter selectors : Array(Types::ColumnSelector)?

        def initialize(
          @statistics : Types::StatisticsConfiguration,
          @selectors : Array(Types::ColumnSelector)? = nil
        )
        end
      end

      # Represents an individual condition that evaluates to true or false. Conditions are used with recipe
      # actions. The action is only performed for column values where the condition evaluates to true. If a
      # recipe requires more than one condition, then the recipe must specify multiple ConditionExpression
      # elements. Each condition is applied to the rows in a dataset first, before the recipe action is
      # performed.
      struct ConditionExpression
        include JSON::Serializable

        # A specific condition to apply to a recipe action. For more information, see Recipe structure in the
        # Glue DataBrew Developer Guide .
        @[JSON::Field(key: "Condition")]
        getter condition : String

        # A column to apply this condition to.
        @[JSON::Field(key: "TargetColumn")]
        getter target_column : String

        # A value that the condition must evaluate to for the condition to succeed.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @condition : String,
          @target_column : String,
          @value : String? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateDatasetRequest
        include JSON::Serializable

        @[JSON::Field(key: "Input")]
        getter input : Types::Input

        # The name of the dataset to be created. Valid characters are alphanumeric (A-Z, a-z, 0-9), hyphen
        # (-), period (.), and space.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The file format of a dataset that is created from an Amazon S3 file or folder.
        @[JSON::Field(key: "Format")]
        getter format : String?

        @[JSON::Field(key: "FormatOptions")]
        getter format_options : Types::FormatOptions?

        # A set of options that defines how DataBrew interprets an Amazon S3 path of the dataset.
        @[JSON::Field(key: "PathOptions")]
        getter path_options : Types::PathOptions?

        # Metadata tags to apply to this dataset.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input : Types::Input,
          @name : String,
          @format : String? = nil,
          @format_options : Types::FormatOptions? = nil,
          @path_options : Types::PathOptions? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDatasetResponse
        include JSON::Serializable

        # The name of the dataset that you created.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct CreateProfileJobRequest
        include JSON::Serializable

        # The name of the dataset that this job is to act upon.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The name of the job to be created. Valid characters are alphanumeric (A-Z, a-z, 0-9), hyphen (-),
        # period (.), and space.
        @[JSON::Field(key: "Name")]
        getter name : String

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::S3Location

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role to be assumed when
        # DataBrew runs the job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # Configuration for profile jobs. Used to select columns, do evaluations, and override default
        # parameters of evaluations. When configuration is null, the profile job will run with default
        # settings.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ProfileConfiguration?

        # The Amazon Resource Name (ARN) of an encryption key that is used to protect the job.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The encryption mode for the job, which can be one of the following: SSE-KMS - SSE-KMS - Server-side
        # encryption with KMS-managed keys. SSE-S3 - Server-side encryption with keys managed by Amazon S3.
        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # Sample configuration for profile jobs only. Determines the number of rows on which the profile job
        # will be executed. If a JobSample value is not provided, the default value will be used. The default
        # value is CUSTOM_ROWS for the mode parameter and 20000 for the size parameter.
        @[JSON::Field(key: "JobSample")]
        getter job_sample : Types::JobSample?

        # Enables or disables Amazon CloudWatch logging for the job. If logging is enabled, CloudWatch writes
        # one log stream for each job run.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # The maximum number of nodes that DataBrew can use when the job processes data.
        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The maximum number of times to retry the job after a job run fails.
        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32?

        # Metadata tags to apply to this job.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The job's timeout in minutes. A job that attempts to run longer than this timeout period ends with a
        # status of TIMEOUT .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # List of validation configurations that are applied to the profile job.
        @[JSON::Field(key: "ValidationConfigurations")]
        getter validation_configurations : Array(Types::ValidationConfiguration)?

        def initialize(
          @dataset_name : String,
          @name : String,
          @output_location : Types::S3Location,
          @role_arn : String,
          @configuration : Types::ProfileConfiguration? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_mode : String? = nil,
          @job_sample : Types::JobSample? = nil,
          @log_subscription : String? = nil,
          @max_capacity : Int32? = nil,
          @max_retries : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Int32? = nil,
          @validation_configurations : Array(Types::ValidationConfiguration)? = nil
        )
        end
      end

      struct CreateProfileJobResponse
        include JSON::Serializable

        # The name of the job that was created.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct CreateProjectRequest
        include JSON::Serializable

        # The name of an existing dataset to associate this project with.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # A unique name for the new project. Valid characters are alphanumeric (A-Z, a-z, 0-9), hyphen (-),
        # period (.), and space.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of an existing recipe to associate with the project.
        @[JSON::Field(key: "RecipeName")]
        getter recipe_name : String

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role to be assumed for
        # this request.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        @[JSON::Field(key: "Sample")]
        getter sample : Types::Sample?

        # Metadata tags to apply to this project.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @dataset_name : String,
          @name : String,
          @recipe_name : String,
          @role_arn : String,
          @sample : Types::Sample? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateProjectResponse
        include JSON::Serializable

        # The name of the project that you created.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct CreateRecipeJobRequest
        include JSON::Serializable

        # A unique name for the job. Valid characters are alphanumeric (A-Z, a-z, 0-9), hyphen (-), period
        # (.), and space.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role to be assumed when
        # DataBrew runs the job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # One or more artifacts that represent the Glue Data Catalog output from running the job.
        @[JSON::Field(key: "DataCatalogOutputs")]
        getter data_catalog_outputs : Array(Types::DataCatalogOutput)?

        # Represents a list of JDBC database output objects which defines the output destination for a
        # DataBrew recipe job to write to.
        @[JSON::Field(key: "DatabaseOutputs")]
        getter database_outputs : Array(Types::DatabaseOutput)?

        # The name of the dataset that this job processes.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The Amazon Resource Name (ARN) of an encryption key that is used to protect the job.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The encryption mode for the job, which can be one of the following: SSE-KMS - Server-side encryption
        # with keys managed by KMS. SSE-S3 - Server-side encryption with keys managed by Amazon S3.
        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # Enables or disables Amazon CloudWatch logging for the job. If logging is enabled, CloudWatch writes
        # one log stream for each job run.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # The maximum number of nodes that DataBrew can consume when the job processes data.
        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The maximum number of times to retry the job after a job run fails.
        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32?

        # One or more artifacts that represent the output from running the job.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # Either the name of an existing project, or a combination of a recipe and a dataset to associate with
        # the recipe.
        @[JSON::Field(key: "ProjectName")]
        getter project_name : String?

        @[JSON::Field(key: "RecipeReference")]
        getter recipe_reference : Types::RecipeReference?

        # Metadata tags to apply to this job.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The job's timeout in minutes. A job that attempts to run longer than this timeout period ends with a
        # status of TIMEOUT .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        def initialize(
          @name : String,
          @role_arn : String,
          @data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
          @database_outputs : Array(Types::DatabaseOutput)? = nil,
          @dataset_name : String? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_mode : String? = nil,
          @log_subscription : String? = nil,
          @max_capacity : Int32? = nil,
          @max_retries : Int32? = nil,
          @outputs : Array(Types::Output)? = nil,
          @project_name : String? = nil,
          @recipe_reference : Types::RecipeReference? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Int32? = nil
        )
        end
      end

      struct CreateRecipeJobResponse
        include JSON::Serializable

        # The name of the job that you created.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct CreateRecipeRequest
        include JSON::Serializable

        # A unique name for the recipe. Valid characters are alphanumeric (A-Z, a-z, 0-9), hyphen (-), period
        # (.), and space.
        @[JSON::Field(key: "Name")]
        getter name : String

        # An array containing the steps to be performed by the recipe. Each recipe step consists of one recipe
        # action and (optionally) an array of condition expressions.
        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::RecipeStep)

        # A description for the recipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Metadata tags to apply to this recipe.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @steps : Array(Types::RecipeStep),
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRecipeResponse
        include JSON::Serializable

        # The name of the recipe that you created.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct CreateRulesetRequest
        include JSON::Serializable

        # The name of the ruleset to be created. Valid characters are alphanumeric (A-Z, a-z, 0-9), hyphen
        # (-), period (.), and space.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of rules that are defined with the ruleset. A rule includes one or more checks to be
        # validated on a DataBrew dataset.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)

        # The Amazon Resource Name (ARN) of a resource (dataset) that the ruleset is associated with.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String

        # The description of the ruleset.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Metadata tags to apply to the ruleset.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @rules : Array(Types::Rule),
          @target_arn : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRulesetResponse
        include JSON::Serializable

        # The unique name of the created ruleset.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct CreateScheduleRequest
        include JSON::Serializable

        # The date or dates and time or times when the jobs are to be run. For more information, see Cron
        # expressions in the Glue DataBrew Developer Guide .
        @[JSON::Field(key: "CronExpression")]
        getter cron_expression : String

        # A unique name for the schedule. Valid characters are alphanumeric (A-Z, a-z, 0-9), hyphen (-),
        # period (.), and space.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The name or names of one or more jobs to be run.
        @[JSON::Field(key: "JobNames")]
        getter job_names : Array(String)?

        # Metadata tags to apply to this schedule.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cron_expression : String,
          @name : String,
          @job_names : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateScheduleResponse
        include JSON::Serializable

        # The name of the schedule that was created.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Represents a set of options that define how DataBrew will read a comma-separated value (CSV) file
      # when creating a dataset from that file.
      struct CsvOptions
        include JSON::Serializable

        # A single character that specifies the delimiter being used in the CSV file.
        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        # A variable that specifies whether the first row in the file is parsed as the header. If this value
        # is false, column names are auto-generated.
        @[JSON::Field(key: "HeaderRow")]
        getter header_row : Bool?

        def initialize(
          @delimiter : String? = nil,
          @header_row : Bool? = nil
        )
        end
      end

      # Represents a set of options that define how DataBrew will write a comma-separated value (CSV) file.
      struct CsvOutputOptions
        include JSON::Serializable

        # A single character that specifies the delimiter used to create CSV job output.
        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        def initialize(
          @delimiter : String? = nil
        )
        end
      end

      # Represents how metadata stored in the Glue Data Catalog is defined in a DataBrew dataset.
      struct DataCatalogInputDefinition
        include JSON::Serializable

        # The name of a database in the Data Catalog.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of a database table in the Data Catalog. This table corresponds to a DataBrew dataset.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The unique identifier of the Amazon Web Services account that holds the Data Catalog that stores the
        # data.
        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # Represents an Amazon location where DataBrew can store intermediate results.
        @[JSON::Field(key: "TempDirectory")]
        getter temp_directory : Types::S3Location?

        def initialize(
          @database_name : String,
          @table_name : String,
          @catalog_id : String? = nil,
          @temp_directory : Types::S3Location? = nil
        )
        end
      end

      # Represents options that specify how and where in the Glue Data Catalog DataBrew writes the output
      # generated by recipe jobs.
      struct DataCatalogOutput
        include JSON::Serializable

        # The name of a database in the Data Catalog.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The name of a table in the Data Catalog.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The unique identifier of the Amazon Web Services account that holds the Data Catalog that stores the
        # data.
        @[JSON::Field(key: "CatalogId")]
        getter catalog_id : String?

        # Represents options that specify how and where DataBrew writes the database output generated by
        # recipe jobs.
        @[JSON::Field(key: "DatabaseOptions")]
        getter database_options : Types::DatabaseTableOutputOptions?

        # A value that, if true, means that any data in the location specified for output is overwritten with
        # new output. Not supported with DatabaseOptions.
        @[JSON::Field(key: "Overwrite")]
        getter overwrite : Bool?

        # Represents options that specify how and where DataBrew writes the Amazon S3 output generated by
        # recipe jobs.
        @[JSON::Field(key: "S3Options")]
        getter s3_options : Types::S3TableOutputOptions?

        def initialize(
          @database_name : String,
          @table_name : String,
          @catalog_id : String? = nil,
          @database_options : Types::DatabaseTableOutputOptions? = nil,
          @overwrite : Bool? = nil,
          @s3_options : Types::S3TableOutputOptions? = nil
        )
        end
      end

      # Connection information for dataset input files stored in a database.
      struct DatabaseInputDefinition
        include JSON::Serializable

        # The Glue Connection that stores the connection information for the target database.
        @[JSON::Field(key: "GlueConnectionName")]
        getter glue_connection_name : String

        # The table within the target database.
        @[JSON::Field(key: "DatabaseTableName")]
        getter database_table_name : String?

        # Custom SQL to run against the provided Glue connection. This SQL will be used as the input for
        # DataBrew projects and jobs.
        @[JSON::Field(key: "QueryString")]
        getter query_string : String?

        @[JSON::Field(key: "TempDirectory")]
        getter temp_directory : Types::S3Location?

        def initialize(
          @glue_connection_name : String,
          @database_table_name : String? = nil,
          @query_string : String? = nil,
          @temp_directory : Types::S3Location? = nil
        )
        end
      end

      # Represents a JDBC database output object which defines the output destination for a DataBrew recipe
      # job to write into.
      struct DatabaseOutput
        include JSON::Serializable

        # Represents options that specify how and where DataBrew writes the database output generated by
        # recipe jobs.
        @[JSON::Field(key: "DatabaseOptions")]
        getter database_options : Types::DatabaseTableOutputOptions

        # The Glue connection that stores the connection information for the target database.
        @[JSON::Field(key: "GlueConnectionName")]
        getter glue_connection_name : String

        # The output mode to write into the database. Currently supported option: NEW_TABLE.
        @[JSON::Field(key: "DatabaseOutputMode")]
        getter database_output_mode : String?

        def initialize(
          @database_options : Types::DatabaseTableOutputOptions,
          @glue_connection_name : String,
          @database_output_mode : String? = nil
        )
        end
      end

      # Represents options that specify how and where DataBrew writes the database output generated by
      # recipe jobs.
      struct DatabaseTableOutputOptions
        include JSON::Serializable

        # A prefix for the name of a table DataBrew will create in the database.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Represents an Amazon S3 location (bucket name and object key) where DataBrew can store intermediate
        # results.
        @[JSON::Field(key: "TempDirectory")]
        getter temp_directory : Types::S3Location?

        def initialize(
          @table_name : String,
          @temp_directory : Types::S3Location? = nil
        )
        end
      end

      # Represents a dataset that can be processed by DataBrew.
      struct Dataset
        include JSON::Serializable

        # Information on how DataBrew can find the dataset, in either the Glue Data Catalog or Amazon S3.
        @[JSON::Field(key: "Input")]
        getter input : Types::Input

        # The unique name of the dataset.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the Amazon Web Services account that owns the dataset.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The date and time that the dataset was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The Amazon Resource Name (ARN) of the user who created the dataset.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The file format of a dataset that is created from an Amazon S3 file or folder.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # A set of options that define how DataBrew interprets the data in the dataset.
        @[JSON::Field(key: "FormatOptions")]
        getter format_options : Types::FormatOptions?

        # The Amazon Resource Name (ARN) of the user who last modified the dataset.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The last modification date and time of the dataset.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # A set of options that defines how DataBrew interprets an Amazon S3 path of the dataset.
        @[JSON::Field(key: "PathOptions")]
        getter path_options : Types::PathOptions?

        # The unique Amazon Resource Name (ARN) for the dataset.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The location of the data for the dataset, either Amazon S3 or the Glue Data Catalog.
        @[JSON::Field(key: "Source")]
        getter source : String?

        # Metadata tags that have been applied to the dataset.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input : Types::Input,
          @name : String,
          @account_id : String? = nil,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @format : String? = nil,
          @format_options : Types::FormatOptions? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @path_options : Types::PathOptions? = nil,
          @resource_arn : String? = nil,
          @source : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a dataset parameter that defines type and conditions for a parameter in the Amazon S3
      # path of the dataset.
      struct DatasetParameter
        include JSON::Serializable

        # The name of the parameter that is used in the dataset's Amazon S3 path.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of the dataset parameter, can be one of a 'String', 'Number' or 'Datetime'.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Optional boolean value that defines whether the captured value of this parameter should be used to
        # create a new column in a dataset.
        @[JSON::Field(key: "CreateColumn")]
        getter create_column : Bool?

        # Additional parameter options such as a format and a timezone. Required for datetime parameters.
        @[JSON::Field(key: "DatetimeOptions")]
        getter datetime_options : Types::DatetimeOptions?

        # The optional filter expression structure to apply additional matching criteria to the parameter.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::FilterExpression?

        def initialize(
          @name : String,
          @type : String,
          @create_column : Bool? = nil,
          @datetime_options : Types::DatetimeOptions? = nil,
          @filter : Types::FilterExpression? = nil
        )
        end
      end

      # Represents additional options for correct interpretation of datetime parameters used in the Amazon
      # S3 path of a dataset.
      struct DatetimeOptions
        include JSON::Serializable

        # Required option, that defines the datetime format used for a date parameter in the Amazon S3 path.
        # Should use only supported datetime specifiers and separation characters, all literal a-z or A-Z
        # characters should be escaped with single quotes. E.g. "MM.dd.yyyy-'at'-HH:mm".
        @[JSON::Field(key: "Format")]
        getter format : String

        # Optional value for a non-US locale code, needed for correct interpretation of some date formats.
        @[JSON::Field(key: "LocaleCode")]
        getter locale_code : String?

        # Optional value for a timezone offset of the datetime parameter value in the Amazon S3 path.
        # Shouldn't be used if Format for this parameter includes timezone fields. If no offset specified, UTC
        # is assumed.
        @[JSON::Field(key: "TimezoneOffset")]
        getter timezone_offset : String?

        def initialize(
          @format : String,
          @locale_code : String? = nil,
          @timezone_offset : String? = nil
        )
        end
      end

      struct DeleteDatasetRequest
        include JSON::Serializable

        # The name of the dataset to be deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteDatasetResponse
        include JSON::Serializable

        # The name of the dataset that you deleted.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteJobRequest
        include JSON::Serializable

        # The name of the job to be deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteJobResponse
        include JSON::Serializable

        # The name of the job that you deleted.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteProjectRequest
        include JSON::Serializable

        # The name of the project to be deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteProjectResponse
        include JSON::Serializable

        # The name of the project that you deleted.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteRecipeVersionRequest
        include JSON::Serializable

        # The name of the recipe.
        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the recipe to be deleted. You can specify a numeric versions ( X.Y ) or
        # LATEST_WORKING . LATEST_PUBLISHED is not supported.
        @[JSON::Field(key: "recipeVersion")]
        getter recipe_version : String

        def initialize(
          @name : String,
          @recipe_version : String
        )
        end
      end

      struct DeleteRecipeVersionResponse
        include JSON::Serializable

        # The name of the recipe that was deleted.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The version of the recipe that was deleted.
        @[JSON::Field(key: "RecipeVersion")]
        getter recipe_version : String

        def initialize(
          @name : String,
          @recipe_version : String
        )
        end
      end

      struct DeleteRulesetRequest
        include JSON::Serializable

        # The name of the ruleset to be deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteRulesetResponse
        include JSON::Serializable

        # The name of the deleted ruleset.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteScheduleRequest
        include JSON::Serializable

        # The name of the schedule to be deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteScheduleResponse
        include JSON::Serializable

        # The name of the schedule that was deleted.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeDatasetRequest
        include JSON::Serializable

        # The name of the dataset to be described.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeDatasetResponse
        include JSON::Serializable

        @[JSON::Field(key: "Input")]
        getter input : Types::Input

        # The name of the dataset.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the dataset was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The identifier (user name) of the user who created the dataset.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The file format of a dataset that is created from an Amazon S3 file or folder.
        @[JSON::Field(key: "Format")]
        getter format : String?

        @[JSON::Field(key: "FormatOptions")]
        getter format_options : Types::FormatOptions?

        # The identifier (user name) of the user who last modified the dataset.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time that the dataset was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # A set of options that defines how DataBrew interprets an Amazon S3 path of the dataset.
        @[JSON::Field(key: "PathOptions")]
        getter path_options : Types::PathOptions?

        # The Amazon Resource Name (ARN) of the dataset.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The location of the data for this dataset, Amazon S3 or the Glue Data Catalog.
        @[JSON::Field(key: "Source")]
        getter source : String?

        # Metadata tags associated with this dataset.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input : Types::Input,
          @name : String,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @format : String? = nil,
          @format_options : Types::FormatOptions? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @path_options : Types::PathOptions? = nil,
          @resource_arn : String? = nil,
          @source : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct DescribeJobRequest
        include JSON::Serializable

        # The name of the job to be described.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeJobResponse
        include JSON::Serializable

        # The name of the job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the job was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The identifier (user name) of the user associated with the creation of the job.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # One or more artifacts that represent the Glue Data Catalog output from running the job.
        @[JSON::Field(key: "DataCatalogOutputs")]
        getter data_catalog_outputs : Array(Types::DataCatalogOutput)?

        # Represents a list of JDBC database output objects which defines the output destination for a
        # DataBrew recipe job to write into.
        @[JSON::Field(key: "DatabaseOutputs")]
        getter database_outputs : Array(Types::DatabaseOutput)?

        # The dataset that the job acts upon.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The Amazon Resource Name (ARN) of an encryption key that is used to protect the job.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The encryption mode for the job, which can be one of the following: SSE-KMS - Server-side encryption
        # with keys managed by KMS. SSE-S3 - Server-side encryption with keys managed by Amazon S3.
        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # Sample configuration for profile jobs only. Determines the number of rows on which the profile job
        # will be executed.
        @[JSON::Field(key: "JobSample")]
        getter job_sample : Types::JobSample?

        # The identifier (user name) of the user who last modified the job.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time that the job was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # Indicates whether Amazon CloudWatch logging is enabled for this job.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # The maximum number of compute nodes that DataBrew can consume when the job processes data.
        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The maximum number of times to retry the job after a job run fails.
        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32?

        # One or more artifacts that represent the output from running the job.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # Configuration for profile jobs. Used to select columns, do evaluations, and override default
        # parameters of evaluations. When configuration is null, the profile job will run with default
        # settings.
        @[JSON::Field(key: "ProfileConfiguration")]
        getter profile_configuration : Types::ProfileConfiguration?

        # The DataBrew project associated with this job.
        @[JSON::Field(key: "ProjectName")]
        getter project_name : String?

        @[JSON::Field(key: "RecipeReference")]
        getter recipe_reference : Types::RecipeReference?

        # The Amazon Resource Name (ARN) of the job.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The ARN of the Identity and Access Management (IAM) role to be assumed when DataBrew runs the job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Metadata tags associated with this job.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The job's timeout in minutes. A job that attempts to run longer than this timeout period ends with a
        # status of TIMEOUT .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # The job type, which must be one of the following: PROFILE - The job analyzes the dataset to
        # determine its size, data types, data distribution, and more. RECIPE - The job applies one or more
        # transformations to a dataset.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # List of validation configurations that are applied to the profile job.
        @[JSON::Field(key: "ValidationConfigurations")]
        getter validation_configurations : Array(Types::ValidationConfiguration)?

        def initialize(
          @name : String,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
          @database_outputs : Array(Types::DatabaseOutput)? = nil,
          @dataset_name : String? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_mode : String? = nil,
          @job_sample : Types::JobSample? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @log_subscription : String? = nil,
          @max_capacity : Int32? = nil,
          @max_retries : Int32? = nil,
          @outputs : Array(Types::Output)? = nil,
          @profile_configuration : Types::ProfileConfiguration? = nil,
          @project_name : String? = nil,
          @recipe_reference : Types::RecipeReference? = nil,
          @resource_arn : String? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Int32? = nil,
          @type : String? = nil,
          @validation_configurations : Array(Types::ValidationConfiguration)? = nil
        )
        end
      end

      struct DescribeJobRunRequest
        include JSON::Serializable

        # The name of the job being processed during this run.
        @[JSON::Field(key: "name")]
        getter name : String

        # The unique identifier of the job run.
        @[JSON::Field(key: "runId")]
        getter run_id : String

        def initialize(
          @name : String,
          @run_id : String
        )
        end
      end

      struct DescribeJobRunResponse
        include JSON::Serializable

        # The name of the job being processed during this run.
        @[JSON::Field(key: "JobName")]
        getter job_name : String

        # The number of times that DataBrew has attempted to run the job.
        @[JSON::Field(key: "Attempt")]
        getter attempt : Int32?

        # The date and time when the job completed processing.
        @[JSON::Field(key: "CompletedOn")]
        getter completed_on : Time?

        # One or more artifacts that represent the Glue Data Catalog output from running the job.
        @[JSON::Field(key: "DataCatalogOutputs")]
        getter data_catalog_outputs : Array(Types::DataCatalogOutput)?

        # Represents a list of JDBC database output objects which defines the output destination for a
        # DataBrew recipe job to write into.
        @[JSON::Field(key: "DatabaseOutputs")]
        getter database_outputs : Array(Types::DatabaseOutput)?

        # The name of the dataset for the job to process.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # A message indicating an error (if any) that was encountered when the job ran.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The amount of time, in seconds, during which the job run consumed resources.
        @[JSON::Field(key: "ExecutionTime")]
        getter execution_time : Int32?

        # Sample configuration for profile jobs only. Determines the number of rows on which the profile job
        # will be executed. If a JobSample value is not provided, the default value will be used. The default
        # value is CUSTOM_ROWS for the mode parameter and 20000 for the size parameter.
        @[JSON::Field(key: "JobSample")]
        getter job_sample : Types::JobSample?

        # The name of an Amazon CloudWatch log group, where the job writes diagnostic messages when it runs.
        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String?

        # The current status of Amazon CloudWatch logging for the job run.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # One or more output artifacts from a job run.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # Configuration for profile jobs. Used to select columns, do evaluations, and override default
        # parameters of evaluations. When configuration is null, the profile job will run with default
        # settings.
        @[JSON::Field(key: "ProfileConfiguration")]
        getter profile_configuration : Types::ProfileConfiguration?

        @[JSON::Field(key: "RecipeReference")]
        getter recipe_reference : Types::RecipeReference?

        # The unique identifier of the job run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The Amazon Resource Name (ARN) of the user who started the job run.
        @[JSON::Field(key: "StartedBy")]
        getter started_by : String?

        # The date and time when the job run began.
        @[JSON::Field(key: "StartedOn")]
        getter started_on : Time?

        # The current state of the job run entity itself.
        @[JSON::Field(key: "State")]
        getter state : String?

        # List of validation configurations that are applied to the profile job.
        @[JSON::Field(key: "ValidationConfigurations")]
        getter validation_configurations : Array(Types::ValidationConfiguration)?

        def initialize(
          @job_name : String,
          @attempt : Int32? = nil,
          @completed_on : Time? = nil,
          @data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
          @database_outputs : Array(Types::DatabaseOutput)? = nil,
          @dataset_name : String? = nil,
          @error_message : String? = nil,
          @execution_time : Int32? = nil,
          @job_sample : Types::JobSample? = nil,
          @log_group_name : String? = nil,
          @log_subscription : String? = nil,
          @outputs : Array(Types::Output)? = nil,
          @profile_configuration : Types::ProfileConfiguration? = nil,
          @recipe_reference : Types::RecipeReference? = nil,
          @run_id : String? = nil,
          @started_by : String? = nil,
          @started_on : Time? = nil,
          @state : String? = nil,
          @validation_configurations : Array(Types::ValidationConfiguration)? = nil
        )
        end
      end

      struct DescribeProjectRequest
        include JSON::Serializable

        # The name of the project to be described.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeProjectResponse
        include JSON::Serializable

        # The name of the project.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the project was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The identifier (user name) of the user who created the project.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The dataset associated with the project.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The identifier (user name) of the user who last modified the project.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time that the project was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The date and time when the project was opened.
        @[JSON::Field(key: "OpenDate")]
        getter open_date : Time?

        # The identifier (user name) of the user that opened the project for use.
        @[JSON::Field(key: "OpenedBy")]
        getter opened_by : String?

        # The recipe associated with this job.
        @[JSON::Field(key: "RecipeName")]
        getter recipe_name : String?

        # The Amazon Resource Name (ARN) of the project.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The ARN of the Identity and Access Management (IAM) role to be assumed when DataBrew runs the job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        @[JSON::Field(key: "Sample")]
        getter sample : Types::Sample?

        # Describes the current state of the session: PROVISIONING - allocating resources for the session.
        # INITIALIZING - getting the session ready for first use. ASSIGNED - the session is ready for use.
        @[JSON::Field(key: "SessionStatus")]
        getter session_status : String?

        # Metadata tags associated with this project.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @dataset_name : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @open_date : Time? = nil,
          @opened_by : String? = nil,
          @recipe_name : String? = nil,
          @resource_arn : String? = nil,
          @role_arn : String? = nil,
          @sample : Types::Sample? = nil,
          @session_status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct DescribeRecipeRequest
        include JSON::Serializable

        # The name of the recipe to be described.
        @[JSON::Field(key: "name")]
        getter name : String

        # The recipe version identifier. If this parameter isn't specified, then the latest published version
        # is returned.
        @[JSON::Field(key: "recipeVersion")]
        getter recipe_version : String?

        def initialize(
          @name : String,
          @recipe_version : String? = nil
        )
        end
      end

      struct DescribeRecipeResponse
        include JSON::Serializable

        # The name of the recipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the recipe was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The identifier (user name) of the user who created the recipe.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The description of the recipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier (user name) of the user who last modified the recipe.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time that the recipe was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The name of the project associated with this recipe.
        @[JSON::Field(key: "ProjectName")]
        getter project_name : String?

        # The identifier (user name) of the user who last published the recipe.
        @[JSON::Field(key: "PublishedBy")]
        getter published_by : String?

        # The date and time when the recipe was last published.
        @[JSON::Field(key: "PublishedDate")]
        getter published_date : Time?

        # The recipe version identifier.
        @[JSON::Field(key: "RecipeVersion")]
        getter recipe_version : String?

        # The ARN of the recipe.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # One or more steps to be performed by the recipe. Each step consists of an action, and the conditions
        # under which the action should succeed.
        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::RecipeStep)?

        # Metadata tags associated with this project.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @project_name : String? = nil,
          @published_by : String? = nil,
          @published_date : Time? = nil,
          @recipe_version : String? = nil,
          @resource_arn : String? = nil,
          @steps : Array(Types::RecipeStep)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct DescribeRulesetRequest
        include JSON::Serializable

        # The name of the ruleset to be described.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeRulesetResponse
        include JSON::Serializable

        # The name of the ruleset.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the ruleset was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The Amazon Resource Name (ARN) of the user who created the ruleset.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The description of the ruleset.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the user who last modified the ruleset.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The modification date and time of the ruleset.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The Amazon Resource Name (ARN) for the ruleset.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # A list of rules that are defined with the ruleset. A rule includes one or more checks to be
        # validated on a DataBrew dataset.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        # Metadata tags that have been applied to the ruleset.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of a resource (dataset) that the ruleset is associated with.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String?

        def initialize(
          @name : String,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @resource_arn : String? = nil,
          @rules : Array(Types::Rule)? = nil,
          @tags : Hash(String, String)? = nil,
          @target_arn : String? = nil
        )
        end
      end

      struct DescribeScheduleRequest
        include JSON::Serializable

        # The name of the schedule to be described.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeScheduleResponse
        include JSON::Serializable

        # The name of the schedule.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the schedule was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The identifier (user name) of the user who created the schedule.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The date or dates and time or times when the jobs are to be run for the schedule. For more
        # information, see Cron expressions in the Glue DataBrew Developer Guide .
        @[JSON::Field(key: "CronExpression")]
        getter cron_expression : String?

        # The name or names of one or more jobs to be run by using the schedule.
        @[JSON::Field(key: "JobNames")]
        getter job_names : Array(String)?

        # The identifier (user name) of the user who last modified the schedule.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time that the schedule was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The Amazon Resource Name (ARN) of the schedule.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Metadata tags associated with this schedule.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @cron_expression : String? = nil,
          @job_names : Array(String)? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @resource_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration of entity detection for a profile job. When undefined, entity detection is disabled.
      struct EntityDetectorConfiguration
        include JSON::Serializable

        # Entity types to detect. Can be any of the following: USA_SSN EMAIL USA_ITIN USA_PASSPORT_NUMBER
        # PHONE_NUMBER USA_DRIVING_LICENSE BANK_ACCOUNT CREDIT_CARD IP_ADDRESS MAC_ADDRESS USA_DEA_NUMBER
        # USA_HCPCS_CODE USA_NATIONAL_PROVIDER_IDENTIFIER USA_NATIONAL_DRUG_CODE
        # USA_HEALTH_INSURANCE_CLAIM_NUMBER USA_MEDICARE_BENEFICIARY_IDENTIFIER USA_CPT_CODE PERSON_NAME DATE
        # The Entity type group USA_ALL is also supported, and includes all of the above entity types except
        # PERSON_NAME and DATE.
        @[JSON::Field(key: "EntityTypes")]
        getter entity_types : Array(String)

        # Configuration of statistics that are allowed to be run on columns that contain detected entities.
        # When undefined, no statistics will be computed on columns that contain detected entities.
        @[JSON::Field(key: "AllowedStatistics")]
        getter allowed_statistics : Array(Types::AllowedStatistics)?

        def initialize(
          @entity_types : Array(String),
          @allowed_statistics : Array(Types::AllowedStatistics)? = nil
        )
        end
      end

      # Represents a set of options that define how DataBrew will interpret a Microsoft Excel file when
      # creating a dataset from that file.
      struct ExcelOptions
        include JSON::Serializable

        # A variable that specifies whether the first row in the file is parsed as the header. If this value
        # is false, column names are auto-generated.
        @[JSON::Field(key: "HeaderRow")]
        getter header_row : Bool?

        # One or more sheet numbers in the Excel file that will be included in the dataset.
        @[JSON::Field(key: "SheetIndexes")]
        getter sheet_indexes : Array(Int32)?

        # One or more named sheets in the Excel file that will be included in the dataset.
        @[JSON::Field(key: "SheetNames")]
        getter sheet_names : Array(String)?

        def initialize(
          @header_row : Bool? = nil,
          @sheet_indexes : Array(Int32)? = nil,
          @sheet_names : Array(String)? = nil
        )
        end
      end

      # Represents a limit imposed on number of Amazon S3 files that should be selected for a dataset from a
      # connected Amazon S3 path.
      struct FilesLimit
        include JSON::Serializable

        # The number of Amazon S3 files to select.
        @[JSON::Field(key: "MaxFiles")]
        getter max_files : Int32

        # A criteria to use for Amazon S3 files sorting before their selection. By default uses DESCENDING
        # order, i.e. most recent files are selected first. Another possible value is ASCENDING.
        @[JSON::Field(key: "Order")]
        getter order : String?

        # A criteria to use for Amazon S3 files sorting before their selection. By default uses
        # LAST_MODIFIED_DATE as a sorting criteria. Currently it's the only allowed value.
        @[JSON::Field(key: "OrderedBy")]
        getter ordered_by : String?

        def initialize(
          @max_files : Int32,
          @order : String? = nil,
          @ordered_by : String? = nil
        )
        end
      end

      # Represents a structure for defining parameter conditions. Supported conditions are described here:
      # Supported conditions for dynamic datasets in the Glue DataBrew Developer Guide .
      struct FilterExpression
        include JSON::Serializable

        # The expression which includes condition names followed by substitution variables, possibly grouped
        # and combined with other conditions. For example, "(starts_with :prefix1 or starts_with :prefix2) and
        # (ends_with :suffix1 or ends_with :suffix2)". Substitution variables should start with ':' symbol.
        @[JSON::Field(key: "Expression")]
        getter expression : String

        # The map of substitution variable names to their values used in this filter expression.
        @[JSON::Field(key: "ValuesMap")]
        getter values_map : Hash(String, String)

        def initialize(
          @expression : String,
          @values_map : Hash(String, String)
        )
        end
      end

      # Represents a set of options that define the structure of either comma-separated value (CSV), Excel,
      # or JSON input.
      struct FormatOptions
        include JSON::Serializable

        # Options that define how CSV input is to be interpreted by DataBrew.
        @[JSON::Field(key: "Csv")]
        getter csv : Types::CsvOptions?

        # Options that define how Excel input is to be interpreted by DataBrew.
        @[JSON::Field(key: "Excel")]
        getter excel : Types::ExcelOptions?

        # Options that define how JSON input is to be interpreted by DataBrew.
        @[JSON::Field(key: "Json")]
        getter json : Types::JsonOptions?

        def initialize(
          @csv : Types::CsvOptions? = nil,
          @excel : Types::ExcelOptions? = nil,
          @json : Types::JsonOptions? = nil
        )
        end
      end

      # Represents information on how DataBrew can find data, in either the Glue Data Catalog or Amazon S3.
      struct Input
        include JSON::Serializable

        # The Glue Data Catalog parameters for the data.
        @[JSON::Field(key: "DataCatalogInputDefinition")]
        getter data_catalog_input_definition : Types::DataCatalogInputDefinition?

        # Connection information for dataset input files stored in a database.
        @[JSON::Field(key: "DatabaseInputDefinition")]
        getter database_input_definition : Types::DatabaseInputDefinition?

        # Contains additional resource information needed for specific datasets.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::Metadata?

        # The Amazon S3 location where the data is stored.
        @[JSON::Field(key: "S3InputDefinition")]
        getter s3_input_definition : Types::S3Location?

        def initialize(
          @data_catalog_input_definition : Types::DataCatalogInputDefinition? = nil,
          @database_input_definition : Types::DatabaseInputDefinition? = nil,
          @metadata : Types::Metadata? = nil,
          @s3_input_definition : Types::S3Location? = nil
        )
        end
      end

      # An internal service failure occurred.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents all of the attributes of a DataBrew job.
      struct Job
        include JSON::Serializable

        # The unique name of the job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the Amazon Web Services account that owns the job.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The date and time that the job was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The Amazon Resource Name (ARN) of the user who created the job.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # One or more artifacts that represent the Glue Data Catalog output from running the job.
        @[JSON::Field(key: "DataCatalogOutputs")]
        getter data_catalog_outputs : Array(Types::DataCatalogOutput)?

        # Represents a list of JDBC database output objects which defines the output destination for a
        # DataBrew recipe job to write into.
        @[JSON::Field(key: "DatabaseOutputs")]
        getter database_outputs : Array(Types::DatabaseOutput)?

        # A dataset that the job is to process.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The Amazon Resource Name (ARN) of an encryption key that is used to protect the job output. For more
        # information, see Encrypting data written by DataBrew jobs
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The encryption mode for the job, which can be one of the following: SSE-KMS - Server-side encryption
        # with keys managed by KMS. SSE-S3 - Server-side encryption with keys managed by Amazon S3.
        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # A sample configuration for profile jobs only, which determines the number of rows on which the
        # profile job is run. If a JobSample value isn't provided, the default value is used. The default
        # value is CUSTOM_ROWS for the mode parameter and 20,000 for the size parameter.
        @[JSON::Field(key: "JobSample")]
        getter job_sample : Types::JobSample?

        # The Amazon Resource Name (ARN) of the user who last modified the job.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The modification date and time of the job.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The current status of Amazon CloudWatch logging for the job.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # The maximum number of nodes that can be consumed when the job processes data.
        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The maximum number of times to retry the job after a job run fails.
        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32?

        # One or more artifacts that represent output from running the job.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # The name of the project that the job is associated with.
        @[JSON::Field(key: "ProjectName")]
        getter project_name : String?

        # A set of steps that the job runs.
        @[JSON::Field(key: "RecipeReference")]
        getter recipe_reference : Types::RecipeReference?

        # The unique Amazon Resource Name (ARN) for the job.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The Amazon Resource Name (ARN) of the role to be assumed for this job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Metadata tags that have been applied to the job.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The job's timeout in minutes. A job that attempts to run longer than this timeout period ends with a
        # status of TIMEOUT .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # The job type of the job, which must be one of the following: PROFILE - A job to analyze a dataset,
        # to determine its size, data types, data distribution, and more. RECIPE - A job to apply one or more
        # transformations to a dataset.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # List of validation configurations that are applied to the profile job.
        @[JSON::Field(key: "ValidationConfigurations")]
        getter validation_configurations : Array(Types::ValidationConfiguration)?

        def initialize(
          @name : String,
          @account_id : String? = nil,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
          @database_outputs : Array(Types::DatabaseOutput)? = nil,
          @dataset_name : String? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_mode : String? = nil,
          @job_sample : Types::JobSample? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @log_subscription : String? = nil,
          @max_capacity : Int32? = nil,
          @max_retries : Int32? = nil,
          @outputs : Array(Types::Output)? = nil,
          @project_name : String? = nil,
          @recipe_reference : Types::RecipeReference? = nil,
          @resource_arn : String? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Int32? = nil,
          @type : String? = nil,
          @validation_configurations : Array(Types::ValidationConfiguration)? = nil
        )
        end
      end

      # Represents one run of a DataBrew job.
      struct JobRun
        include JSON::Serializable

        # The number of times that DataBrew has attempted to run the job.
        @[JSON::Field(key: "Attempt")]
        getter attempt : Int32?

        # The date and time when the job completed processing.
        @[JSON::Field(key: "CompletedOn")]
        getter completed_on : Time?

        # One or more artifacts that represent the Glue Data Catalog output from running the job.
        @[JSON::Field(key: "DataCatalogOutputs")]
        getter data_catalog_outputs : Array(Types::DataCatalogOutput)?

        # Represents a list of JDBC database output objects which defines the output destination for a
        # DataBrew recipe job to write into.
        @[JSON::Field(key: "DatabaseOutputs")]
        getter database_outputs : Array(Types::DatabaseOutput)?

        # The name of the dataset for the job to process.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # A message indicating an error (if any) that was encountered when the job ran.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The amount of time, in seconds, during which a job run consumed resources.
        @[JSON::Field(key: "ExecutionTime")]
        getter execution_time : Int32?

        # The name of the job being processed during this run.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # A sample configuration for profile jobs only, which determines the number of rows on which the
        # profile job is run. If a JobSample value isn't provided, the default is used. The default value is
        # CUSTOM_ROWS for the mode parameter and 20,000 for the size parameter.
        @[JSON::Field(key: "JobSample")]
        getter job_sample : Types::JobSample?

        # The name of an Amazon CloudWatch log group, where the job writes diagnostic messages when it runs.
        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String?

        # The current status of Amazon CloudWatch logging for the job run.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # One or more output artifacts from a job run.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # The set of steps processed by the job.
        @[JSON::Field(key: "RecipeReference")]
        getter recipe_reference : Types::RecipeReference?

        # The unique identifier of the job run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The Amazon Resource Name (ARN) of the user who initiated the job run.
        @[JSON::Field(key: "StartedBy")]
        getter started_by : String?

        # The date and time when the job run began.
        @[JSON::Field(key: "StartedOn")]
        getter started_on : Time?

        # The current state of the job run entity itself.
        @[JSON::Field(key: "State")]
        getter state : String?

        # List of validation configurations that are applied to the profile job run.
        @[JSON::Field(key: "ValidationConfigurations")]
        getter validation_configurations : Array(Types::ValidationConfiguration)?

        def initialize(
          @attempt : Int32? = nil,
          @completed_on : Time? = nil,
          @data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
          @database_outputs : Array(Types::DatabaseOutput)? = nil,
          @dataset_name : String? = nil,
          @error_message : String? = nil,
          @execution_time : Int32? = nil,
          @job_name : String? = nil,
          @job_sample : Types::JobSample? = nil,
          @log_group_name : String? = nil,
          @log_subscription : String? = nil,
          @outputs : Array(Types::Output)? = nil,
          @recipe_reference : Types::RecipeReference? = nil,
          @run_id : String? = nil,
          @started_by : String? = nil,
          @started_on : Time? = nil,
          @state : String? = nil,
          @validation_configurations : Array(Types::ValidationConfiguration)? = nil
        )
        end
      end

      # A sample configuration for profile jobs only, which determines the number of rows on which the
      # profile job is run. If a JobSample value isn't provided, the default is used. The default value is
      # CUSTOM_ROWS for the mode parameter and 20,000 for the size parameter.
      struct JobSample
        include JSON::Serializable

        # A value that determines whether the profile job is run on the entire dataset or a specified number
        # of rows. This value must be one of the following: FULL_DATASET - The profile job is run on the
        # entire dataset. CUSTOM_ROWS - The profile job is run on the number of rows specified in the Size
        # parameter.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The Size parameter is only required when the mode is CUSTOM_ROWS. The profile job is run on the
        # specified number of rows. The maximum value for size is Long.MAX_VALUE. Long.MAX_VALUE =
        # 9223372036854775807
        @[JSON::Field(key: "Size")]
        getter size : Int64?

        def initialize(
          @mode : String? = nil,
          @size : Int64? = nil
        )
        end
      end

      # Represents the JSON-specific options that define how input is to be interpreted by Glue DataBrew.
      struct JsonOptions
        include JSON::Serializable

        # A value that specifies whether JSON input contains embedded new line characters.
        @[JSON::Field(key: "MultiLine")]
        getter multi_line : Bool?

        def initialize(
          @multi_line : Bool? = nil
        )
        end
      end

      struct ListDatasetsRequest
        include JSON::Serializable

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsResponse
        include JSON::Serializable

        # A list of datasets that are defined.
        @[JSON::Field(key: "Datasets")]
        getter datasets : Array(Types::Dataset)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @datasets : Array(Types::Dataset),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobRunsRequest
        include JSON::Serializable

        # The name of the job.
        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobRunsResponse
        include JSON::Serializable

        # A list of job runs that have occurred for the specified job.
        @[JSON::Field(key: "JobRuns")]
        getter job_runs : Array(Types::JobRun)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_runs : Array(Types::JobRun),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobsRequest
        include JSON::Serializable

        # The name of a dataset. Using this parameter indicates to return only those jobs that act on the
        # specified dataset.
        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String?

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token generated by DataBrew that specifies where to continue pagination if a previous request was
        # truncated. To get the next set of pages, pass in the NextToken value from the response object of the
        # previous page call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of a project. Using this parameter indicates to return only those jobs that are associated
        # with the specified project.
        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        def initialize(
          @dataset_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @project_name : String? = nil
        )
        end
      end

      struct ListJobsResponse
        include JSON::Serializable

        # A list of jobs that are defined.
        @[JSON::Field(key: "Jobs")]
        getter jobs : Array(Types::Job)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::Job),
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectsRequest
        include JSON::Serializable

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectsResponse
        include JSON::Serializable

        # A list of projects that are defined .
        @[JSON::Field(key: "Projects")]
        getter projects : Array(Types::Project)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @projects : Array(Types::Project),
          @next_token : String? = nil
        )
        end
      end

      struct ListRecipeVersionsRequest
        include JSON::Serializable

        # The name of the recipe for which to return version information.
        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRecipeVersionsResponse
        include JSON::Serializable

        # A list of versions for the specified recipe.
        @[JSON::Field(key: "Recipes")]
        getter recipes : Array(Types::Recipe)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @recipes : Array(Types::Recipe),
          @next_token : String? = nil
        )
        end
      end

      struct ListRecipesRequest
        include JSON::Serializable

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Return only those recipes with a version identifier of LATEST_WORKING or LATEST_PUBLISHED . If
        # RecipeVersion is omitted, ListRecipes returns all of the LATEST_PUBLISHED recipe versions. Valid
        # values: LATEST_WORKING | LATEST_PUBLISHED
        @[JSON::Field(key: "recipeVersion")]
        getter recipe_version : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recipe_version : String? = nil
        )
        end
      end

      struct ListRecipesResponse
        include JSON::Serializable

        # A list of recipes that are defined.
        @[JSON::Field(key: "Recipes")]
        getter recipes : Array(Types::Recipe)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @recipes : Array(Types::Recipe),
          @next_token : String? = nil
        )
        end
      end

      struct ListRulesetsRequest
        include JSON::Serializable

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token generated by DataBrew that specifies where to continue pagination if a previous request was
        # truncated. To get the next set of pages, pass in the NextToken value from the response object of the
        # previous page call.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of a resource (dataset). Using this parameter indicates to return
        # only those rulesets that are associated with the specified resource.
        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      struct ListRulesetsResponse
        include JSON::Serializable

        # A list of RulesetItem. RulesetItem contains meta data of a ruleset.
        @[JSON::Field(key: "Rulesets")]
        getter rulesets : Array(Types::RulesetItem)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @rulesets : Array(Types::RulesetItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListSchedulesRequest
        include JSON::Serializable

        # The name of the job that these schedules apply to.
        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The maximum number of results to return in this request.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSchedulesResponse
        include JSON::Serializable

        # A list of schedules that are defined.
        @[JSON::Field(key: "Schedules")]
        getter schedules : Array(Types::Schedule)

        # A token that you can use in a subsequent call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @schedules : Array(Types::Schedule),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) string that uniquely identifies the DataBrew resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags associated with the DataBrew resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains additional resource information needed for specific datasets.
      struct Metadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the dataset. Currently, DataBrew only supports ARNs
        # from Amazon AppFlow.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        def initialize(
          @source_arn : String? = nil
        )
        end
      end

      # Represents options that specify how and where in Amazon S3 DataBrew writes the output generated by
      # recipe jobs or profile jobs.
      struct Output
        include JSON::Serializable

        # The location in Amazon S3 where the job writes its output.
        @[JSON::Field(key: "Location")]
        getter location : Types::S3Location

        # The compression algorithm used to compress the output text of the job.
        @[JSON::Field(key: "CompressionFormat")]
        getter compression_format : String?

        # The data format of the output of the job.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # Represents options that define how DataBrew formats job output files.
        @[JSON::Field(key: "FormatOptions")]
        getter format_options : Types::OutputFormatOptions?

        # Maximum number of files to be generated by the job and written to the output folder. For output
        # partitioned by column(s), the MaxOutputFiles value is the maximum number of files per partition.
        @[JSON::Field(key: "MaxOutputFiles")]
        getter max_output_files : Int32?

        # A value that, if true, means that any data in the location specified for output is overwritten with
        # new output.
        @[JSON::Field(key: "Overwrite")]
        getter overwrite : Bool?

        # The names of one or more partition columns for the output of the job.
        @[JSON::Field(key: "PartitionColumns")]
        getter partition_columns : Array(String)?

        def initialize(
          @location : Types::S3Location,
          @compression_format : String? = nil,
          @format : String? = nil,
          @format_options : Types::OutputFormatOptions? = nil,
          @max_output_files : Int32? = nil,
          @overwrite : Bool? = nil,
          @partition_columns : Array(String)? = nil
        )
        end
      end

      # Represents a set of options that define the structure of comma-separated (CSV) job output.
      struct OutputFormatOptions
        include JSON::Serializable

        # Represents a set of options that define the structure of comma-separated value (CSV) job output.
        @[JSON::Field(key: "Csv")]
        getter csv : Types::CsvOutputOptions?

        def initialize(
          @csv : Types::CsvOutputOptions? = nil
        )
        end
      end

      # Represents a set of options that define how DataBrew selects files for a given Amazon S3 path in a
      # dataset.
      struct PathOptions
        include JSON::Serializable

        # If provided, this structure imposes a limit on a number of files that should be selected.
        @[JSON::Field(key: "FilesLimit")]
        getter files_limit : Types::FilesLimit?

        # If provided, this structure defines a date range for matching Amazon S3 objects based on their
        # LastModifiedDate attribute in Amazon S3.
        @[JSON::Field(key: "LastModifiedDateCondition")]
        getter last_modified_date_condition : Types::FilterExpression?

        # A structure that maps names of parameters used in the Amazon S3 path of a dataset to their
        # definitions.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, Types::DatasetParameter)?

        def initialize(
          @files_limit : Types::FilesLimit? = nil,
          @last_modified_date_condition : Types::FilterExpression? = nil,
          @parameters : Hash(String, Types::DatasetParameter)? = nil
        )
        end
      end

      # Configuration for profile jobs. Configuration can be used to select columns, do evaluations, and
      # override default parameters of evaluations. When configuration is undefined, the profile job will
      # apply default settings to all supported columns.
      struct ProfileConfiguration
        include JSON::Serializable

        # List of configurations for column evaluations. ColumnStatisticsConfigurations are used to select
        # evaluations and override parameters of evaluations for particular columns. When
        # ColumnStatisticsConfigurations is undefined, the profile job will profile all supported columns and
        # run all supported evaluations.
        @[JSON::Field(key: "ColumnStatisticsConfigurations")]
        getter column_statistics_configurations : Array(Types::ColumnStatisticsConfiguration)?

        # Configuration for inter-column evaluations. Configuration can be used to select evaluations and
        # override parameters of evaluations. When configuration is undefined, the profile job will run all
        # supported inter-column evaluations.
        @[JSON::Field(key: "DatasetStatisticsConfiguration")]
        getter dataset_statistics_configuration : Types::StatisticsConfiguration?

        # Configuration of entity detection for a profile job. When undefined, entity detection is disabled.
        @[JSON::Field(key: "EntityDetectorConfiguration")]
        getter entity_detector_configuration : Types::EntityDetectorConfiguration?

        # List of column selectors. ProfileColumns can be used to select columns from the dataset. When
        # ProfileColumns is undefined, the profile job will profile all supported columns.
        @[JSON::Field(key: "ProfileColumns")]
        getter profile_columns : Array(Types::ColumnSelector)?

        def initialize(
          @column_statistics_configurations : Array(Types::ColumnStatisticsConfiguration)? = nil,
          @dataset_statistics_configuration : Types::StatisticsConfiguration? = nil,
          @entity_detector_configuration : Types::EntityDetectorConfiguration? = nil,
          @profile_columns : Array(Types::ColumnSelector)? = nil
        )
        end
      end

      # Represents all of the attributes of a DataBrew project.
      struct Project
        include JSON::Serializable

        # The unique name of a project.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of a recipe that will be developed during a project session.
        @[JSON::Field(key: "RecipeName")]
        getter recipe_name : String

        # The ID of the Amazon Web Services account that owns the project.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The date and time that the project was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The Amazon Resource Name (ARN) of the user who crated the project.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The dataset that the project is to act upon.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The Amazon Resource Name (ARN) of the user who last modified the project.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The last modification date and time for the project.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The date and time when the project was opened.
        @[JSON::Field(key: "OpenDate")]
        getter open_date : Time?

        # The Amazon Resource Name (ARN) of the user that opened the project for use.
        @[JSON::Field(key: "OpenedBy")]
        getter opened_by : String?

        # The Amazon Resource Name (ARN) for the project.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The Amazon Resource Name (ARN) of the role that will be assumed for this project.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The sample size and sampling type to apply to the data. If this parameter isn't specified, then the
        # sample consists of the first 500 rows from the dataset.
        @[JSON::Field(key: "Sample")]
        getter sample : Types::Sample?

        # Metadata tags that have been applied to the project.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @recipe_name : String,
          @account_id : String? = nil,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @dataset_name : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @open_date : Time? = nil,
          @opened_by : String? = nil,
          @resource_arn : String? = nil,
          @role_arn : String? = nil,
          @sample : Types::Sample? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct PublishRecipeRequest
        include JSON::Serializable

        # The name of the recipe to be published.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the recipe to be published, for this version of the recipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @description : String? = nil
        )
        end
      end

      struct PublishRecipeResponse
        include JSON::Serializable

        # The name of the recipe that you published.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Represents one or more actions to be performed on a DataBrew dataset.
      struct Recipe
        include JSON::Serializable

        # The unique name for the recipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the recipe was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The Amazon Resource Name (ARN) of the user who created the recipe.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The description of the recipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the user who last modified the recipe.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The last modification date and time of the recipe.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The name of the project that the recipe is associated with.
        @[JSON::Field(key: "ProjectName")]
        getter project_name : String?

        # The Amazon Resource Name (ARN) of the user who published the recipe.
        @[JSON::Field(key: "PublishedBy")]
        getter published_by : String?

        # The date and time when the recipe was published.
        @[JSON::Field(key: "PublishedDate")]
        getter published_date : Time?

        # The identifier for the version for the recipe. Must be one of the following: Numeric version ( X.Y )
        # - X and Y stand for major and minor version numbers. The maximum length of each is 6 digits, and
        # neither can be negative values. Both X and Y are required, and "0.0" isn't a valid version.
        # LATEST_WORKING - the most recent valid version being developed in a DataBrew project.
        # LATEST_PUBLISHED - the most recent published version.
        @[JSON::Field(key: "RecipeVersion")]
        getter recipe_version : String?

        # The Amazon Resource Name (ARN) for the recipe.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # A list of steps that are defined by the recipe.
        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::RecipeStep)?

        # Metadata tags that have been applied to the recipe.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @project_name : String? = nil,
          @published_by : String? = nil,
          @published_date : Time? = nil,
          @recipe_version : String? = nil,
          @resource_arn : String? = nil,
          @steps : Array(Types::RecipeStep)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a transformation and associated parameters that are used to apply a change to a DataBrew
      # dataset. For more information, see Recipe actions reference .
      struct RecipeAction
        include JSON::Serializable

        # The name of a valid DataBrew transformation to be performed on the data.
        @[JSON::Field(key: "Operation")]
        getter operation : String

        # Contextual parameters for the transformation.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @operation : String,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # Represents the name and version of a DataBrew recipe.
      struct RecipeReference
        include JSON::Serializable

        # The name of the recipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the version for the recipe.
        @[JSON::Field(key: "RecipeVersion")]
        getter recipe_version : String?

        def initialize(
          @name : String,
          @recipe_version : String? = nil
        )
        end
      end

      # Represents a single step from a DataBrew recipe to be performed.
      struct RecipeStep
        include JSON::Serializable

        # The particular action to be performed in the recipe step.
        @[JSON::Field(key: "Action")]
        getter action : Types::RecipeAction

        # One or more conditions that must be met for the recipe step to succeed. All of the conditions in the
        # array must be met. In other words, all of the conditions must be combined using a logical AND
        # operation.
        @[JSON::Field(key: "ConditionExpressions")]
        getter condition_expressions : Array(Types::ConditionExpression)?

        def initialize(
          @action : Types::RecipeAction,
          @condition_expressions : Array(Types::ConditionExpression)? = nil
        )
        end
      end

      # Represents any errors encountered when attempting to delete multiple recipe versions.
      struct RecipeVersionErrorDetail
        include JSON::Serializable

        # The HTTP status code for the error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier for the recipe version associated with this error.
        @[JSON::Field(key: "RecipeVersion")]
        getter recipe_version : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @recipe_version : String? = nil
        )
        end
      end

      # One or more resources can't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a single data quality requirement that should be validated in the scope of this dataset.
      struct Rule
        include JSON::Serializable

        # The expression which includes column references, condition names followed by variable references,
        # possibly grouped and combined with other conditions. For example, (:col1 starts_with :prefix1 or
        # :col1 starts_with :prefix2) and (:col1 ends_with :suffix1 or :col1 ends_with :suffix2) . Column and
        # value references are substitution variables that should start with the ':' symbol. Depending on the
        # context, substitution variables' values can be either an actual value or a column name. These values
        # are defined in the SubstitutionMap. If a CheckExpression starts with a column reference, then
        # ColumnSelectors in the rule should be null. If ColumnSelectors has been defined, then there should
        # be no column reference in the left side of a condition, for example, is_between :val1 and :val2 .
        # For more information, see Available checks
        @[JSON::Field(key: "CheckExpression")]
        getter check_expression : String

        # The name of the rule.
        @[JSON::Field(key: "Name")]
        getter name : String

        # List of column selectors. Selectors can be used to select columns using a name or regular expression
        # from the dataset. Rule will be applied to selected columns.
        @[JSON::Field(key: "ColumnSelectors")]
        getter column_selectors : Array(Types::ColumnSelector)?

        # A value that specifies whether the rule is disabled. Once a rule is disabled, a profile job will not
        # validate it during a job run. Default value is false.
        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # The map of substitution variable names to their values used in a check expression. Variable names
        # should start with a ':' (colon). Variable values can either be actual values or column names. To
        # differentiate between the two, column names should be enclosed in backticks, for example, ":col1":
        # "`Column A`".
        @[JSON::Field(key: "SubstitutionMap")]
        getter substitution_map : Hash(String, String)?

        # The threshold used with a non-aggregate check expression. Non-aggregate check expressions will be
        # applied to each row in a specific column, and the threshold will be used to determine whether the
        # validation succeeds.
        @[JSON::Field(key: "Threshold")]
        getter threshold : Types::Threshold?

        def initialize(
          @check_expression : String,
          @name : String,
          @column_selectors : Array(Types::ColumnSelector)? = nil,
          @disabled : Bool? = nil,
          @substitution_map : Hash(String, String)? = nil,
          @threshold : Types::Threshold? = nil
        )
        end
      end

      # Contains metadata about the ruleset.
      struct RulesetItem
        include JSON::Serializable

        # The name of the ruleset.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of a resource (dataset) that the ruleset is associated with.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String

        # The ID of the Amazon Web Services account that owns the ruleset.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The date and time that the ruleset was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The Amazon Resource Name (ARN) of the user who created the ruleset.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The description of the ruleset.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the user who last modified the ruleset.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The modification date and time of the ruleset.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The Amazon Resource Name (ARN) for the ruleset.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The number of rules that are defined in the ruleset.
        @[JSON::Field(key: "RuleCount")]
        getter rule_count : Int32?

        # Metadata tags that have been applied to the ruleset.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @target_arn : String,
          @account_id : String? = nil,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @resource_arn : String? = nil,
          @rule_count : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents an Amazon S3 location (bucket name, bucket owner, and object key) where DataBrew can read
      # input data, or write output from a job.
      struct S3Location
        include JSON::Serializable

        # The Amazon S3 bucket name.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The Amazon Web Services account ID of the bucket owner.
        @[JSON::Field(key: "BucketOwner")]
        getter bucket_owner : String?

        # The unique name of the object in the bucket.
        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @bucket : String,
          @bucket_owner : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Represents options that specify how and where DataBrew writes the Amazon S3 output generated by
      # recipe jobs.
      struct S3TableOutputOptions
        include JSON::Serializable

        # Represents an Amazon S3 location (bucket name and object key) where DataBrew can write output from a
        # job.
        @[JSON::Field(key: "Location")]
        getter location : Types::S3Location

        def initialize(
          @location : Types::S3Location
        )
        end
      end

      # Represents the sample size and sampling type for DataBrew to use for interactive data analysis.
      struct Sample
        include JSON::Serializable

        # The way in which DataBrew obtains rows from a dataset.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The number of rows in the sample.
        @[JSON::Field(key: "Size")]
        getter size : Int32?

        def initialize(
          @type : String,
          @size : Int32? = nil
        )
        end
      end

      # Represents one or more dates and times when a job is to run.
      struct Schedule
        include JSON::Serializable

        # The name of the schedule.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the Amazon Web Services account that owns the schedule.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The date and time that the schedule was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The Amazon Resource Name (ARN) of the user who created the schedule.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The dates and times when the job is to run. For more information, see Cron expressions in the Glue
        # DataBrew Developer Guide .
        @[JSON::Field(key: "CronExpression")]
        getter cron_expression : String?

        # A list of jobs to be run, according to the schedule.
        @[JSON::Field(key: "JobNames")]
        getter job_names : Array(String)?

        # The Amazon Resource Name (ARN) of the user who last modified the schedule.
        @[JSON::Field(key: "LastModifiedBy")]
        getter last_modified_by : String?

        # The date and time when the schedule was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The Amazon Resource Name (ARN) of the schedule.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Metadata tags that have been applied to the schedule.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @account_id : String? = nil,
          @create_date : Time? = nil,
          @created_by : String? = nil,
          @cron_expression : String? = nil,
          @job_names : Array(String)? = nil,
          @last_modified_by : String? = nil,
          @last_modified_date : Time? = nil,
          @resource_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct SendProjectSessionActionRequest
        include JSON::Serializable

        # The name of the project to apply the action to.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique identifier for an interactive session that's currently open and ready for work. The action
        # will be performed on this session.
        @[JSON::Field(key: "ClientSessionId")]
        getter client_session_id : String?

        # If true, the result of the recipe step will be returned, but not applied.
        @[JSON::Field(key: "Preview")]
        getter preview : Bool?

        @[JSON::Field(key: "RecipeStep")]
        getter recipe_step : Types::RecipeStep?

        # The index from which to preview a step. This index is used to preview the result of steps that have
        # already been applied, so that the resulting view frame is from earlier in the view frame stack.
        @[JSON::Field(key: "StepIndex")]
        getter step_index : Int32?

        @[JSON::Field(key: "ViewFrame")]
        getter view_frame : Types::ViewFrame?

        def initialize(
          @name : String,
          @client_session_id : String? = nil,
          @preview : Bool? = nil,
          @recipe_step : Types::RecipeStep? = nil,
          @step_index : Int32? = nil,
          @view_frame : Types::ViewFrame? = nil
        )
        end
      end

      struct SendProjectSessionActionResponse
        include JSON::Serializable

        # The name of the project that was affected by the action.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for the action that was performed.
        @[JSON::Field(key: "ActionId")]
        getter action_id : Int32?

        # A message indicating the result of performing the action.
        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @name : String,
          @action_id : Int32? = nil,
          @result : String? = nil
        )
        end
      end

      # A service quota is exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct StartJobRunRequest
        include JSON::Serializable

        # The name of the job to be run.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct StartJobRunResponse
        include JSON::Serializable

        # A system-generated identifier for this particular job run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String

        def initialize(
          @run_id : String
        )
        end
      end

      struct StartProjectSessionRequest
        include JSON::Serializable

        # The name of the project to act upon.
        @[JSON::Field(key: "name")]
        getter name : String

        # A value that, if true, enables you to take control of a session, even if a different client is
        # currently accessing the project.
        @[JSON::Field(key: "AssumeControl")]
        getter assume_control : Bool?

        def initialize(
          @name : String,
          @assume_control : Bool? = nil
        )
        end
      end

      struct StartProjectSessionResponse
        include JSON::Serializable

        # The name of the project to be acted upon.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A system-generated identifier for the session.
        @[JSON::Field(key: "ClientSessionId")]
        getter client_session_id : String?

        def initialize(
          @name : String,
          @client_session_id : String? = nil
        )
        end
      end

      # Override of a particular evaluation for a profile job.
      struct StatisticOverride
        include JSON::Serializable

        # A map that includes overrides of an evaluation’s parameters.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)

        # The name of an evaluation
        @[JSON::Field(key: "Statistic")]
        getter statistic : String

        def initialize(
          @parameters : Hash(String, String),
          @statistic : String
        )
        end
      end

      # Configuration of evaluations for a profile job. This configuration can be used to select evaluations
      # and override the parameters of selected evaluations.
      struct StatisticsConfiguration
        include JSON::Serializable

        # List of included evaluations. When the list is undefined, all supported evaluations will be
        # included.
        @[JSON::Field(key: "IncludedStatistics")]
        getter included_statistics : Array(String)?

        # List of overrides for evaluations.
        @[JSON::Field(key: "Overrides")]
        getter overrides : Array(Types::StatisticOverride)?

        def initialize(
          @included_statistics : Array(String)? = nil,
          @overrides : Array(Types::StatisticOverride)? = nil
        )
        end
      end

      struct StopJobRunRequest
        include JSON::Serializable

        # The name of the job to be stopped.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the job run to be stopped.
        @[JSON::Field(key: "runId")]
        getter run_id : String

        def initialize(
          @name : String,
          @run_id : String
        )
        end
      end

      struct StopJobRunResponse
        include JSON::Serializable

        # The ID of the job run that you stopped.
        @[JSON::Field(key: "RunId")]
        getter run_id : String

        def initialize(
          @run_id : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The DataBrew resource to which tags should be added. The value for this parameter is an Amazon
        # Resource Name (ARN). For DataBrew, you can tag a dataset, a job, a project, or a recipe.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # One or more tags to be assigned to the resource.
        @[JSON::Field(key: "Tags")]
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

      # The threshold used with a non-aggregate check expression. The non-aggregate check expression will be
      # applied to each row in a specific column. Then the threshold will be used to determine whether the
      # validation succeeds.
      struct Threshold
        include JSON::Serializable

        # The value of a threshold.
        @[JSON::Field(key: "Value")]
        getter value : Float64

        # The type of a threshold. Used for comparison of an actual count of rows that satisfy the rule to the
        # threshold value.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # Unit of threshold value. Can be either a COUNT or PERCENTAGE of the full sample size used for
        # validation.
        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @value : Float64,
          @type : String? = nil,
          @unit : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # A DataBrew resource from which you want to remove a tag or tags. The value for this parameter is an
        # Amazon Resource Name (ARN).
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys (names) of one or more tags to be removed.
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

      struct UpdateDatasetRequest
        include JSON::Serializable

        @[JSON::Field(key: "Input")]
        getter input : Types::Input

        # The name of the dataset to be updated.
        @[JSON::Field(key: "name")]
        getter name : String

        # The file format of a dataset that is created from an Amazon S3 file or folder.
        @[JSON::Field(key: "Format")]
        getter format : String?

        @[JSON::Field(key: "FormatOptions")]
        getter format_options : Types::FormatOptions?

        # A set of options that defines how DataBrew interprets an Amazon S3 path of the dataset.
        @[JSON::Field(key: "PathOptions")]
        getter path_options : Types::PathOptions?

        def initialize(
          @input : Types::Input,
          @name : String,
          @format : String? = nil,
          @format_options : Types::FormatOptions? = nil,
          @path_options : Types::PathOptions? = nil
        )
        end
      end

      struct UpdateDatasetResponse
        include JSON::Serializable

        # The name of the dataset that you updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UpdateProfileJobRequest
        include JSON::Serializable

        # The name of the job to be updated.
        @[JSON::Field(key: "name")]
        getter name : String

        @[JSON::Field(key: "OutputLocation")]
        getter output_location : Types::S3Location

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role to be assumed when
        # DataBrew runs the job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # Configuration for profile jobs. Used to select columns, do evaluations, and override default
        # parameters of evaluations. When configuration is null, the profile job will run with default
        # settings.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ProfileConfiguration?

        # The Amazon Resource Name (ARN) of an encryption key that is used to protect the job.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The encryption mode for the job, which can be one of the following: SSE-KMS - Server-side encryption
        # with keys managed by KMS. SSE-S3 - Server-side encryption with keys managed by Amazon S3.
        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # Sample configuration for Profile Jobs only. Determines the number of rows on which the Profile job
        # will be executed. If a JobSample value is not provided for profile jobs, the default value will be
        # used. The default value is CUSTOM_ROWS for the mode parameter and 20000 for the size parameter.
        @[JSON::Field(key: "JobSample")]
        getter job_sample : Types::JobSample?

        # Enables or disables Amazon CloudWatch logging for the job. If logging is enabled, CloudWatch writes
        # one log stream for each job run.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # The maximum number of compute nodes that DataBrew can use when the job processes data.
        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The maximum number of times to retry the job after a job run fails.
        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32?

        # The job's timeout in minutes. A job that attempts to run longer than this timeout period ends with a
        # status of TIMEOUT .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # List of validation configurations that are applied to the profile job.
        @[JSON::Field(key: "ValidationConfigurations")]
        getter validation_configurations : Array(Types::ValidationConfiguration)?

        def initialize(
          @name : String,
          @output_location : Types::S3Location,
          @role_arn : String,
          @configuration : Types::ProfileConfiguration? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_mode : String? = nil,
          @job_sample : Types::JobSample? = nil,
          @log_subscription : String? = nil,
          @max_capacity : Int32? = nil,
          @max_retries : Int32? = nil,
          @timeout : Int32? = nil,
          @validation_configurations : Array(Types::ValidationConfiguration)? = nil
        )
        end
      end

      struct UpdateProfileJobResponse
        include JSON::Serializable

        # The name of the job that was updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UpdateProjectRequest
        include JSON::Serializable

        # The name of the project to be updated.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM role to be assumed for this request.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        @[JSON::Field(key: "Sample")]
        getter sample : Types::Sample?

        def initialize(
          @name : String,
          @role_arn : String,
          @sample : Types::Sample? = nil
        )
        end
      end

      struct UpdateProjectResponse
        include JSON::Serializable

        # The name of the project that you updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that the project was last modified.
        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        def initialize(
          @name : String,
          @last_modified_date : Time? = nil
        )
        end
      end

      struct UpdateRecipeJobRequest
        include JSON::Serializable

        # The name of the job to update.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role to be assumed when
        # DataBrew runs the job.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # One or more artifacts that represent the Glue Data Catalog output from running the job.
        @[JSON::Field(key: "DataCatalogOutputs")]
        getter data_catalog_outputs : Array(Types::DataCatalogOutput)?

        # Represents a list of JDBC database output objects which defines the output destination for a
        # DataBrew recipe job to write into.
        @[JSON::Field(key: "DatabaseOutputs")]
        getter database_outputs : Array(Types::DatabaseOutput)?

        # The Amazon Resource Name (ARN) of an encryption key that is used to protect the job.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The encryption mode for the job, which can be one of the following: SSE-KMS - Server-side encryption
        # with keys managed by KMS. SSE-S3 - Server-side encryption with keys managed by Amazon S3.
        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # Enables or disables Amazon CloudWatch logging for the job. If logging is enabled, CloudWatch writes
        # one log stream for each job run.
        @[JSON::Field(key: "LogSubscription")]
        getter log_subscription : String?

        # The maximum number of nodes that DataBrew can consume when the job processes data.
        @[JSON::Field(key: "MaxCapacity")]
        getter max_capacity : Int32?

        # The maximum number of times to retry the job after a job run fails.
        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32?

        # One or more artifacts that represent the output from running the job.
        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::Output)?

        # The job's timeout in minutes. A job that attempts to run longer than this timeout period ends with a
        # status of TIMEOUT .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        def initialize(
          @name : String,
          @role_arn : String,
          @data_catalog_outputs : Array(Types::DataCatalogOutput)? = nil,
          @database_outputs : Array(Types::DatabaseOutput)? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_mode : String? = nil,
          @log_subscription : String? = nil,
          @max_capacity : Int32? = nil,
          @max_retries : Int32? = nil,
          @outputs : Array(Types::Output)? = nil,
          @timeout : Int32? = nil
        )
        end
      end

      struct UpdateRecipeJobResponse
        include JSON::Serializable

        # The name of the job that you updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UpdateRecipeRequest
        include JSON::Serializable

        # The name of the recipe to be updated.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the recipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # One or more steps to be performed by the recipe. Each step consists of an action, and the conditions
        # under which the action should succeed.
        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::RecipeStep)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @steps : Array(Types::RecipeStep)? = nil
        )
        end
      end

      struct UpdateRecipeResponse
        include JSON::Serializable

        # The name of the recipe that was updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UpdateRulesetRequest
        include JSON::Serializable

        # The name of the ruleset to be updated.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of rules that are defined with the ruleset. A rule includes one or more checks to be
        # validated on a DataBrew dataset.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)

        # The description of the ruleset.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @rules : Array(Types::Rule),
          @description : String? = nil
        )
        end
      end

      struct UpdateRulesetResponse
        include JSON::Serializable

        # The name of the updated ruleset.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UpdateScheduleRequest
        include JSON::Serializable

        # The date or dates and time or times when the jobs are to be run. For more information, see Cron
        # expressions in the Glue DataBrew Developer Guide .
        @[JSON::Field(key: "CronExpression")]
        getter cron_expression : String

        # The name of the schedule to update.
        @[JSON::Field(key: "name")]
        getter name : String

        # The name or names of one or more jobs to be run for this schedule.
        @[JSON::Field(key: "JobNames")]
        getter job_names : Array(String)?

        def initialize(
          @cron_expression : String,
          @name : String,
          @job_names : Array(String)? = nil
        )
        end
      end

      struct UpdateScheduleResponse
        include JSON::Serializable

        # The name of the schedule that was updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Configuration for data quality validation. Used to select the Rulesets and Validation Mode to be
      # used in the profile job. When ValidationConfiguration is null, the profile job will run without data
      # quality validation.
      struct ValidationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the ruleset to be validated in the profile job. The TargetArn of
        # the selected ruleset should be the same as the Amazon Resource Name (ARN) of the dataset that is
        # associated with the profile job.
        @[JSON::Field(key: "RulesetArn")]
        getter ruleset_arn : String

        # Mode of data quality validation. Default mode is “CHECK_ALL” which verifies all rules defined in the
        # selected ruleset.
        @[JSON::Field(key: "ValidationMode")]
        getter validation_mode : String?

        def initialize(
          @ruleset_arn : String,
          @validation_mode : String? = nil
        )
        end
      end

      # The input parameters for this request failed validation.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the data being transformed during an action.
      struct ViewFrame
        include JSON::Serializable

        # The starting index for the range of columns to return in the view frame.
        @[JSON::Field(key: "StartColumnIndex")]
        getter start_column_index : Int32

        # Controls if analytics computation is enabled or disabled. Enabled by default.
        @[JSON::Field(key: "Analytics")]
        getter analytics : String?

        # The number of columns to include in the view frame, beginning with the StartColumnIndex value and
        # ignoring any columns in the HiddenColumns list.
        @[JSON::Field(key: "ColumnRange")]
        getter column_range : Int32?

        # A list of columns to hide in the view frame.
        @[JSON::Field(key: "HiddenColumns")]
        getter hidden_columns : Array(String)?

        # The number of rows to include in the view frame, beginning with the StartRowIndex value.
        @[JSON::Field(key: "RowRange")]
        getter row_range : Int32?

        # The starting index for the range of rows to return in the view frame.
        @[JSON::Field(key: "StartRowIndex")]
        getter start_row_index : Int32?

        def initialize(
          @start_column_index : Int32,
          @analytics : String? = nil,
          @column_range : Int32? = nil,
          @hidden_columns : Array(String)? = nil,
          @row_range : Int32? = nil,
          @start_row_index : Int32? = nil
        )
        end
      end
    end
  end
end
