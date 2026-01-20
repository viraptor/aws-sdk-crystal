require "json"
require "time"

module AwsSdk
  module CleanRooms
    module Types

      # Controls and tracks usage limits for associated configured tables within a collaboration across
      # queries and job. Supports both period-based budgets that can renew (daily, weekly, or monthly) and
      # fixed lifetime budgets. Contains the resource ARN, remaining budget information, and up to two
      # budget configurations (period-based and lifetime). By default, table usage is unlimited unless a
      # budget is configured.

      struct AccessBudget
        include JSON::Serializable

        # The total remaining budget across all budget parameters, showing the lower value between the
        # per-period budget and lifetime budget for this access budget. For individual parameter budgets, see
        # remainingBudget .

        @[JSON::Field(key: "aggregateRemainingBudget")]
        getter aggregate_remaining_budget : Int32

        # Detailed budget information including time bounds, remaining budget, and refresh settings.

        @[JSON::Field(key: "details")]
        getter details : Array(Types::AccessBudgetDetails)

        # The Amazon Resource Name (ARN) of the access budget resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @aggregate_remaining_budget : Int32,
          @details : Array(Types::AccessBudgetDetails),
          @resource_arn : String
        )
        end
      end

      # Detailed information about an access budget including time bounds, budget allocation, and
      # configuration settings.

      struct AccessBudgetDetails
        include JSON::Serializable

        # The total budget allocation amount for this access budget.

        @[JSON::Field(key: "budget")]
        getter budget : Int32

        # Specifies the time period for limiting table usage in queries and jobs. For calendar-based periods,
        # the budget can renew if auto refresh is enabled. For lifetime budgets, the limit applies to the
        # total usage throughout the collaboration. Valid values are: CALENDAR_DAY - Limit table usage per
        # day. CALENDAR_WEEK - Limit table usage per week. CALENDAR_MONTH - Limit table usage per month.
        # LIFETIME - Limit total table usage for the collaboration duration.

        @[JSON::Field(key: "budgetType")]
        getter budget_type : String

        # The remaining budget amount available for use within this access budget.

        @[JSON::Field(key: "remainingBudget")]
        getter remaining_budget : Int32

        # The start time for the access budget period.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # Indicates whether the budget automatically refreshes for each time period specified in budgetType .
        # Valid values are: ENABLED - The budget refreshes automatically at the start of each period. DISABLED
        # - The budget must be refreshed manually. NULL - The value is null when budgetType is set to LIFETIME
        # .

        @[JSON::Field(key: "autoRefresh")]
        getter auto_refresh : String?

        # The end time for the access budget period.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        def initialize(
          @budget : Int32,
          @budget_type : String,
          @remaining_budget : Int32,
          @start_time : Time,
          @auto_refresh : String? = nil,
          @end_time : Time? = nil
        )
        end
      end

      # Input parameters for privacy budget templates that support access budgets functionality, enabling
      # enhanced budget management capabilities.

      struct AccessBudgetsPrivacyTemplateParametersInput
        include JSON::Serializable

        # An array of budget parameters that define the access budget configuration for the privacy template.

        @[JSON::Field(key: "budgetParameters")]
        getter budget_parameters : Array(Types::BudgetParameter)

        # The Amazon Resource Name (ARN) of the resource associated with this privacy budget template.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @budget_parameters : Array(Types::BudgetParameter),
          @resource_arn : String
        )
        end
      end

      # Output parameters for privacy budget templates with access budgets support, containing the
      # configured budget information.

      struct AccessBudgetsPrivacyTemplateParametersOutput
        include JSON::Serializable

        # An array of budget parameters returned from the access budget configuration.

        @[JSON::Field(key: "budgetParameters")]
        getter budget_parameters : Array(Types::BudgetParameter)

        # The Amazon Resource Name (ARN) of the resource associated with this privacy budget template.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @budget_parameters : Array(Types::BudgetParameter),
          @resource_arn : String
        )
        end
      end

      # Update parameters for privacy budget templates with access budgets functionality, allowing
      # modification of existing budget configurations.

      struct AccessBudgetsPrivacyTemplateUpdateParameters
        include JSON::Serializable

        # Updated array of budget parameters for the access budget configuration.

        @[JSON::Field(key: "budgetParameters")]
        getter budget_parameters : Array(Types::BudgetParameter)

        def initialize(
          @budget_parameters : Array(Types::BudgetParameter)
        )
        end
      end

      # Caller does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # A reason code for the exception.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Column in configured table that can be used in aggregate function in query.

      struct AggregateColumn
        include JSON::Serializable

        # Column names in configured table of aggregate columns.

        @[JSON::Field(key: "columnNames")]
        getter column_names : Array(String)

        # Aggregation function that can be applied to aggregate column in query.

        @[JSON::Field(key: "function")]
        getter function : String

        def initialize(
          @column_names : Array(String),
          @function : String
        )
        end
      end

      # Constraint on query output removing output rows that do not meet a minimum number of distinct values
      # of a specified column.

      struct AggregationConstraint
        include JSON::Serializable

        # Column in aggregation constraint for which there must be a minimum number of distinct values in an
        # output row for it to be in the query output.

        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The minimum number of distinct values that an output row must be an aggregation of. Minimum
        # threshold of distinct values for a specified column that must exist in an output row for it to be in
        # the query output.

        @[JSON::Field(key: "minimum")]
        getter minimum : Int32

        # The type of aggregation the constraint allows. The only valid value is currently `COUNT_DISTINCT`.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @column_name : String,
          @minimum : Int32,
          @type : String
        )
        end
      end

      # Optional. The member who can query can provide this placeholder for a literal data value in an
      # analysis template.

      struct AnalysisParameter
        include JSON::Serializable

        # The name of the parameter. The name must use only alphanumeric or underscore (_) characters.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of parameter.

        @[JSON::Field(key: "type")]
        getter type : String

        # Optional. The default value that is applied in the analysis template. The member who can query can
        # override this value in the query editor.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        def initialize(
          @name : String,
          @type : String,
          @default_value : String? = nil
        )
        end
      end

      # A specification about how data from the configured table can be used in a query.

      struct AnalysisRule
        include JSON::Serializable

        # The unique ID for the associated collaboration.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time the analysis rule was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name for the analysis rule.

        @[JSON::Field(key: "name")]
        getter name : String

        # A policy that describes the associated data usage limitations.

        @[JSON::Field(key: "policy")]
        getter policy : Types::AnalysisRulePolicy

        # The type of analysis rule.

        @[JSON::Field(key: "type")]
        getter type : String

        # The time the analysis rule was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time


        @[JSON::Field(key: "collaborationPolicy")]
        getter collaboration_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy?

        # The consolidated policy for the analysis rule.

        @[JSON::Field(key: "consolidatedPolicy")]
        getter consolidated_policy : Types::ConsolidatedPolicy?

        def initialize(
          @collaboration_id : String,
          @create_time : Time,
          @name : String,
          @policy : Types::AnalysisRulePolicy,
          @type : String,
          @update_time : Time,
          @collaboration_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy? = nil,
          @consolidated_policy : Types::ConsolidatedPolicy? = nil
        )
        end
      end

      # A type of analysis rule that enables query structure and specified queries that produce aggregate
      # statistics.

      struct AnalysisRuleAggregation
        include JSON::Serializable

        # The columns that query runners are allowed to use in aggregation queries.

        @[JSON::Field(key: "aggregateColumns")]
        getter aggregate_columns : Array(Types::AggregateColumn)

        # The columns that query runners are allowed to select, group by, or filter by.

        @[JSON::Field(key: "dimensionColumns")]
        getter dimension_columns : Array(String)

        # Columns in configured table that can be used in join statements and/or as aggregate columns. They
        # can never be outputted directly.

        @[JSON::Field(key: "joinColumns")]
        getter join_columns : Array(String)

        # Columns that must meet a specific threshold value (after an aggregation function is applied to it)
        # for each output row to be returned.

        @[JSON::Field(key: "outputConstraints")]
        getter output_constraints : Array(Types::AggregationConstraint)

        # Set of scalar functions that are allowed to be used on dimension columns and the output of
        # aggregation of metrics.

        @[JSON::Field(key: "scalarFunctions")]
        getter scalar_functions : Array(String)

        # An indicator as to whether additional analyses (such as Clean Rooms ML) can be applied to the output
        # of the direct query. The additionalAnalyses parameter is currently supported for the list analysis
        # rule ( AnalysisRuleList ) and the custom analysis rule ( AnalysisRuleCustom ).

        @[JSON::Field(key: "additionalAnalyses")]
        getter additional_analyses : String?

        # Which logical operators (if any) are to be used in an INNER JOIN match condition. Default is AND .

        @[JSON::Field(key: "allowedJoinOperators")]
        getter allowed_join_operators : Array(String)?

        # Control that requires member who runs query to do a join with their configured table and/or other
        # configured table in query.

        @[JSON::Field(key: "joinRequired")]
        getter join_required : String?

        def initialize(
          @aggregate_columns : Array(Types::AggregateColumn),
          @dimension_columns : Array(String),
          @join_columns : Array(String),
          @output_constraints : Array(Types::AggregationConstraint),
          @scalar_functions : Array(String),
          @additional_analyses : String? = nil,
          @allowed_join_operators : Array(String)? = nil,
          @join_required : String? = nil
        )
        end
      end

      # A type of analysis rule that enables the table owner to approve custom SQL queries on their
      # configured tables. It supports differential privacy.

      struct AnalysisRuleCustom
        include JSON::Serializable

        # The ARN of the analysis templates that are allowed by the custom analysis rule.

        @[JSON::Field(key: "allowedAnalyses")]
        getter allowed_analyses : Array(String)

        # An indicator as to whether additional analyses (such as Clean Rooms ML) can be applied to the output
        # of the direct query.

        @[JSON::Field(key: "additionalAnalyses")]
        getter additional_analyses : String?

        # The IDs of the Amazon Web Services accounts that are allowed to query by the custom analysis rule.
        # Required when allowedAnalyses is ANY_QUERY .

        @[JSON::Field(key: "allowedAnalysisProviders")]
        getter allowed_analysis_providers : Array(String)?

        # The differential privacy configuration.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyConfiguration?

        # A list of columns that aren't allowed to be shown in the query output.

        @[JSON::Field(key: "disallowedOutputColumns")]
        getter disallowed_output_columns : Array(String)?

        def initialize(
          @allowed_analyses : Array(String),
          @additional_analyses : String? = nil,
          @allowed_analysis_providers : Array(String)? = nil,
          @differential_privacy : Types::DifferentialPrivacyConfiguration? = nil,
          @disallowed_output_columns : Array(String)? = nil
        )
        end
      end

      # Defines details for the analysis rule ID mapping table.

      struct AnalysisRuleIdMappingTable
        include JSON::Serializable

        # The columns that query runners are allowed to use in an INNER JOIN statement.

        @[JSON::Field(key: "joinColumns")]
        getter join_columns : Array(String)

        # The query constraints of the analysis rule ID mapping table.

        @[JSON::Field(key: "queryConstraints")]
        getter query_constraints : Array(Types::QueryConstraint)

        # The columns that query runners are allowed to select, group by, or filter by.

        @[JSON::Field(key: "dimensionColumns")]
        getter dimension_columns : Array(String)?

        def initialize(
          @join_columns : Array(String),
          @query_constraints : Array(Types::QueryConstraint),
          @dimension_columns : Array(String)? = nil
        )
        end
      end

      # A type of analysis rule that enables row-level analysis.

      struct AnalysisRuleList
        include JSON::Serializable

        # Columns that can be used to join a configured table with the table of the member who can query and
        # other members' configured tables.

        @[JSON::Field(key: "joinColumns")]
        getter join_columns : Array(String)

        # Columns that can be listed in the output.

        @[JSON::Field(key: "listColumns")]
        getter list_columns : Array(String)

        # An indicator as to whether additional analyses (such as Clean Rooms ML) can be applied to the output
        # of the direct query.

        @[JSON::Field(key: "additionalAnalyses")]
        getter additional_analyses : String?

        # The logical operators (if any) that are to be used in an INNER JOIN match condition. Default is AND
        # .

        @[JSON::Field(key: "allowedJoinOperators")]
        getter allowed_join_operators : Array(String)?

        def initialize(
          @join_columns : Array(String),
          @list_columns : Array(String),
          @additional_analyses : String? = nil,
          @allowed_join_operators : Array(String)? = nil
        )
        end
      end

      # Controls on the query specifications that can be run on configured table.

      struct AnalysisRulePolicy
        include JSON::Serializable

        # Controls on the query specifications that can be run on configured table.

        @[JSON::Field(key: "v1")]
        getter v1 : Types::AnalysisRulePolicyV1?

        def initialize(
          @v1 : Types::AnalysisRulePolicyV1? = nil
        )
        end
      end

      # Controls on the query specifications that can be run on configured table.

      struct AnalysisRulePolicyV1
        include JSON::Serializable

        # Analysis rule type that enables only aggregation queries on a configured table.

        @[JSON::Field(key: "aggregation")]
        getter aggregation : Types::AnalysisRuleAggregation?

        # Analysis rule type that enables custom SQL queries on a configured table.

        @[JSON::Field(key: "custom")]
        getter custom : Types::AnalysisRuleCustom?

        # The ID mapping table.

        @[JSON::Field(key: "idMappingTable")]
        getter id_mapping_table : Types::AnalysisRuleIdMappingTable?

        # Analysis rule type that enables only list queries on a configured table.

        @[JSON::Field(key: "list")]
        getter list : Types::AnalysisRuleList?

        def initialize(
          @aggregation : Types::AnalysisRuleAggregation? = nil,
          @custom : Types::AnalysisRuleCustom? = nil,
          @id_mapping_table : Types::AnalysisRuleIdMappingTable? = nil,
          @list : Types::AnalysisRuleList? = nil
        )
        end
      end

      # A relation within an analysis.

      struct AnalysisSchema
        include JSON::Serializable

        # The tables referenced in the analysis schema.

        @[JSON::Field(key: "referencedTables")]
        getter referenced_tables : Array(String)?

        def initialize(
          @referenced_tables : Array(String)? = nil
        )
        end
      end

      # The structure that defines the body of the analysis template.

      struct AnalysisSource
        include JSON::Serializable

        # The artifacts of the analysis source.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Types::AnalysisTemplateArtifacts?

        # The query text.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @artifacts : Types::AnalysisTemplateArtifacts? = nil,
          @text : String? = nil
        )
        end
      end

      # The analysis source metadata.

      struct AnalysisSourceMetadata
        include JSON::Serializable

        # The artifacts of the analysis source metadata.

        @[JSON::Field(key: "artifacts")]
        getter artifacts : Types::AnalysisTemplateArtifactMetadata?

        def initialize(
          @artifacts : Types::AnalysisTemplateArtifactMetadata? = nil
        )
        end
      end

      # The analysis template.

      struct AnalysisTemplate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the analysis template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the analysis template’s associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique ID for the associated collaboration of the analysis template.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time that the analysis template was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The format of the analysis template.

        @[JSON::Field(key: "format")]
        getter format : String

        # The identifier for the analysis template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the member who created the analysis template.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The identifier of a member who created the analysis template.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the analysis template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The entire schema object.

        @[JSON::Field(key: "schema")]
        getter schema : Types::AnalysisSchema

        # The source of the analysis template.

        @[JSON::Field(key: "source")]
        getter source : Types::AnalysisSource

        # The time that the analysis template was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The parameters of the analysis template.

        @[JSON::Field(key: "analysisParameters")]
        getter analysis_parameters : Array(Types::AnalysisParameter)?

        # The description of the analysis template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration that specifies the level of detail in error messages returned by analyses using
        # this template. When set to DETAILED , error messages include more information to help troubleshoot
        # issues with PySpark jobs. Detailed error messages may expose underlying data, including sensitive
        # information. Recommended for faster troubleshooting in development and testing environments.

        @[JSON::Field(key: "errorMessageConfiguration")]
        getter error_message_configuration : Types::ErrorMessageConfiguration?

        # The source metadata for the analysis template.

        @[JSON::Field(key: "sourceMetadata")]
        getter source_metadata : Types::AnalysisSourceMetadata?

        # The parameters used to generate synthetic data for this analysis template.

        @[JSON::Field(key: "syntheticDataParameters")]
        getter synthetic_data_parameters : Types::SyntheticDataParameters?

        # Information about the validations performed on the analysis template.

        @[JSON::Field(key: "validations")]
        getter validations : Array(Types::AnalysisTemplateValidationStatusDetail)?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @format : String,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @schema : Types::AnalysisSchema,
          @source : Types::AnalysisSource,
          @update_time : Time,
          @analysis_parameters : Array(Types::AnalysisParameter)? = nil,
          @description : String? = nil,
          @error_message_configuration : Types::ErrorMessageConfiguration? = nil,
          @source_metadata : Types::AnalysisSourceMetadata? = nil,
          @synthetic_data_parameters : Types::SyntheticDataParameters? = nil,
          @validations : Array(Types::AnalysisTemplateValidationStatusDetail)? = nil
        )
        end
      end

      # The analysis template artifact.

      struct AnalysisTemplateArtifact
        include JSON::Serializable

        # The artifact location.

        @[JSON::Field(key: "location")]
        getter location : Types::S3Location

        def initialize(
          @location : Types::S3Location
        )
        end
      end

      # The analysis template artifact metadata.

      struct AnalysisTemplateArtifactMetadata
        include JSON::Serializable

        # The hash of the entry point for the analysis template artifact metadata.

        @[JSON::Field(key: "entryPointHash")]
        getter entry_point_hash : Types::Hash

        # Additional artifact hashes for the analysis template.

        @[JSON::Field(key: "additionalArtifactHashes")]
        getter additional_artifact_hashes : Array(Types::Hash)?

        def initialize(
          @entry_point_hash : Types::Hash,
          @additional_artifact_hashes : Array(Types::Hash)? = nil
        )
        end
      end

      # The analysis template artifacts.

      struct AnalysisTemplateArtifacts
        include JSON::Serializable

        # The entry point for the analysis template artifacts.

        @[JSON::Field(key: "entryPoint")]
        getter entry_point : Types::AnalysisTemplateArtifact

        # The role ARN for the analysis template artifacts.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Additional artifacts for the analysis template.

        @[JSON::Field(key: "additionalArtifacts")]
        getter additional_artifacts : Array(Types::AnalysisTemplateArtifact)?

        def initialize(
          @entry_point : Types::AnalysisTemplateArtifact,
          @role_arn : String,
          @additional_artifacts : Array(Types::AnalysisTemplateArtifact)? = nil
        )
        end
      end

      # The metadata of the analysis template.

      struct AnalysisTemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the analysis template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the analysis template summary’s associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # A unique identifier for the collaboration that the analysis template summary belongs to. Currently
        # accepts collaboration ID.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time that the analysis template summary was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier of the analysis template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the member who created the analysis template.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the analysis template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time that the analysis template summary was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the analysis template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates if this analysis template summary generated synthetic data.

        @[JSON::Field(key: "isSyntheticData")]
        getter is_synthetic_data : Bool?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil,
          @is_synthetic_data : Bool? = nil
        )
        end
      end

      # The status details of the analysis template validation. Clean Rooms Differential Privacy uses a
      # general-purpose query structure to support complex SQL queries and validates whether an analysis
      # template fits that general-purpose query structure. Validation is performed when analysis templates
      # are created and fetched. Because analysis templates are immutable by design, we recommend that you
      # create analysis templates after you associate the configured tables with their analysis rule to your
      # collaboration. For more information, see
      # https://docs.aws.amazon.com/clean-rooms/latest/userguide/analysis-rules-custom.html#custom-diff-privacy
      # .

      struct AnalysisTemplateValidationStatusDetail
        include JSON::Serializable

        # The status of the validation.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of validation that was performed.

        @[JSON::Field(key: "type")]
        getter type : String

        # The reasons for the validation results.

        @[JSON::Field(key: "reasons")]
        getter reasons : Array(Types::AnalysisTemplateValidationStatusReason)?

        def initialize(
          @status : String,
          @type : String,
          @reasons : Array(Types::AnalysisTemplateValidationStatusReason)? = nil
        )
        end
      end

      # The reasons for the validation results.

      struct AnalysisTemplateValidationStatusReason
        include JSON::Serializable

        # The validation message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains detailed information about the approval state of a given member in the collaboration for a
      # given collaboration change request.

      struct ApprovalStatusDetails
        include JSON::Serializable

        # The approval status of a member's vote on the change request. Valid values are PENDING (if they
        # haven't voted), APPROVED, or DENIED.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # A reference to a table within Athena.

      struct AthenaTableReference
        include JSON::Serializable

        # The database name.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The table reference.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The workgroup of the Athena table reference.

        @[JSON::Field(key: "workGroup")]
        getter work_group : String

        # The output location for the Athena table.

        @[JSON::Field(key: "outputLocation")]
        getter output_location : String?

        # The Amazon Web Services Region where the Athena table is located. This parameter is required to
        # uniquely identify and access tables across different Regions.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @database_name : String,
          @table_name : String,
          @work_group : String,
          @output_location : String? = nil,
          @region : String? = nil
        )
        end
      end

      # Details of errors thrown by the call to retrieve multiple analysis templates within a collaboration
      # by their identifiers.

      struct BatchGetCollaborationAnalysisTemplateError
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the analysis template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # An error code for the error.

        @[JSON::Field(key: "code")]
        getter code : String

        # A description of why the call failed.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @arn : String,
          @code : String,
          @message : String
        )
        end
      end


      struct BatchGetCollaborationAnalysisTemplateInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the analysis template within a collaboration.

        @[JSON::Field(key: "analysisTemplateArns")]
        getter analysis_template_arns : Array(String)

        # A unique identifier for the collaboration that the analysis templates belong to. Currently accepts
        # collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @analysis_template_arns : Array(String),
          @collaboration_identifier : String
        )
        end
      end


      struct BatchGetCollaborationAnalysisTemplateOutput
        include JSON::Serializable

        # The retrieved list of analysis templates within a collaboration.

        @[JSON::Field(key: "collaborationAnalysisTemplates")]
        getter collaboration_analysis_templates : Array(Types::CollaborationAnalysisTemplate)

        # Error reasons for collaboration analysis templates that could not be retrieved. One error is
        # returned for every collaboration analysis template that could not be retrieved.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetCollaborationAnalysisTemplateError)

        def initialize(
          @collaboration_analysis_templates : Array(Types::CollaborationAnalysisTemplate),
          @errors : Array(Types::BatchGetCollaborationAnalysisTemplateError)
        )
        end
      end

      # An error that describes why a schema could not be fetched.

      struct BatchGetSchemaAnalysisRuleError
        include JSON::Serializable

        # An error code for the error.

        @[JSON::Field(key: "code")]
        getter code : String

        # A description of why the call failed.

        @[JSON::Field(key: "message")]
        getter message : String

        # An error name for the error.

        @[JSON::Field(key: "name")]
        getter name : String

        # The analysis rule type.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @code : String,
          @message : String,
          @name : String,
          @type : String
        )
        end
      end


      struct BatchGetSchemaAnalysisRuleInput
        include JSON::Serializable

        # The unique identifier of the collaboration that contains the schema analysis rule.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The information that's necessary to retrieve a schema analysis rule.

        @[JSON::Field(key: "schemaAnalysisRuleRequests")]
        getter schema_analysis_rule_requests : Array(Types::SchemaAnalysisRuleRequest)

        def initialize(
          @collaboration_identifier : String,
          @schema_analysis_rule_requests : Array(Types::SchemaAnalysisRuleRequest)
        )
        end
      end


      struct BatchGetSchemaAnalysisRuleOutput
        include JSON::Serializable

        # The retrieved list of analysis rules.

        @[JSON::Field(key: "analysisRules")]
        getter analysis_rules : Array(Types::AnalysisRule)

        # Error reasons for schemas that could not be retrieved. One error is returned for every schema that
        # could not be retrieved.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetSchemaAnalysisRuleError)

        def initialize(
          @analysis_rules : Array(Types::AnalysisRule),
          @errors : Array(Types::BatchGetSchemaAnalysisRuleError)
        )
        end
      end

      # An error describing why a schema could not be fetched.

      struct BatchGetSchemaError
        include JSON::Serializable

        # An error code for the error.

        @[JSON::Field(key: "code")]
        getter code : String

        # An error message for the error.

        @[JSON::Field(key: "message")]
        getter message : String

        # An error name for the error.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @code : String,
          @message : String,
          @name : String
        )
        end
      end


      struct BatchGetSchemaInput
        include JSON::Serializable

        # A unique identifier for the collaboration that the schemas belong to. Currently accepts
        # collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The names for the schema objects to retrieve.

        @[JSON::Field(key: "names")]
        getter names : Array(String)

        def initialize(
          @collaboration_identifier : String,
          @names : Array(String)
        )
        end
      end


      struct BatchGetSchemaOutput
        include JSON::Serializable

        # Error reasons for schemas that could not be retrieved. One error is returned for every schema that
        # could not be retrieved.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetSchemaError)

        # The retrieved list of schemas.

        @[JSON::Field(key: "schemas")]
        getter schemas : Array(Types::Schema)

        def initialize(
          @errors : Array(Types::BatchGetSchemaError),
          @schemas : Array(Types::Schema)
        )
        end
      end

      # Information related to the utilization of resources that have been billed or charged for in a given
      # context, such as a protected job.

      struct BilledJobResourceUtilization
        include JSON::Serializable

        # The number of Clean Rooms Processing Unit (CRPU) hours that have been billed.

        @[JSON::Field(key: "units")]
        getter units : Float64

        def initialize(
          @units : Float64
        )
        end
      end

      # Information related to the utilization of resources that have been billed or charged for in a given
      # context, such as a protected query.

      struct BilledResourceUtilization
        include JSON::Serializable

        # The number of Clean Rooms Processing Unit (CRPU) hours that have been billed.

        @[JSON::Field(key: "units")]
        getter units : Float64

        def initialize(
          @units : Float64
        )
        end
      end

      # Individual budget parameter configuration that defines specific budget allocation settings for
      # access budgets.

      struct BudgetParameter
        include JSON::Serializable

        # The budget allocation amount for this specific parameter.

        @[JSON::Field(key: "budget")]
        getter budget : Int32

        # The type of budget parameter being configured.

        @[JSON::Field(key: "type")]
        getter type : String

        # Whether this individual budget parameter automatically refreshes when the budget period resets.

        @[JSON::Field(key: "autoRefresh")]
        getter auto_refresh : String?

        def initialize(
          @budget : Int32,
          @type : String,
          @auto_refresh : String? = nil
        )
        end
      end

      # Represents a single change within a collaboration change request, containing the change identifier
      # and specification.

      struct Change
        include JSON::Serializable

        # The specification details for this change.

        @[JSON::Field(key: "specification")]
        getter specification : Types::ChangeSpecification

        # The type of specification for this change.

        @[JSON::Field(key: "specificationType")]
        getter specification_type : String

        # The list of change types that were applied.

        @[JSON::Field(key: "types")]
        getter types : Array(String)

        def initialize(
          @specification : Types::ChangeSpecification,
          @specification_type : String,
          @types : Array(String)
        )
        end
      end

      # Specifies a change to apply to a collaboration.

      struct ChangeInput
        include JSON::Serializable

        # The specification details for the change. The structure depends on the specification type.

        @[JSON::Field(key: "specification")]
        getter specification : Types::ChangeSpecification

        # The type of specification for the change. Currently supports MEMBER for member-related changes.

        @[JSON::Field(key: "specificationType")]
        getter specification_type : String

        def initialize(
          @specification : Types::ChangeSpecification,
          @specification_type : String
        )
        end
      end

      # A union that contains the specification details for different types of changes.

      struct ChangeSpecification
        include JSON::Serializable

        # The collaboration configuration changes being requested. Currently, this only supports modifying
        # which change types are auto-approved for the collaboration.

        @[JSON::Field(key: "collaboration")]
        getter collaboration : Types::CollaborationChangeSpecification?

        # The member change specification when the change type is MEMBER .

        @[JSON::Field(key: "member")]
        getter member : Types::MemberChangeSpecification?

        def initialize(
          @collaboration : Types::CollaborationChangeSpecification? = nil,
          @member : Types::MemberChangeSpecification? = nil
        )
        end
      end

      # The multi-party data share environment. The collaboration contains metadata about its purpose and
      # participants.

      struct Collaboration
        include JSON::Serializable

        # The unique ARN for the collaboration.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the collaboration was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier used to reference members of the collaboration. Currently only supports Amazon Web
        # Services account ID.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # A display name of the collaboration creator.

        @[JSON::Field(key: "creatorDisplayName")]
        getter creator_display_name : String

        # The unique ID for the collaboration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The status of a member in a collaboration.

        @[JSON::Field(key: "memberStatus")]
        getter member_status : String

        # A human-readable identifier provided by the collaboration owner. Display names are not unique.

        @[JSON::Field(key: "name")]
        getter name : String

        # An indicator as to whether query logging has been enabled or disabled for the collaboration. When
        # ENABLED , Clean Rooms logs details about queries run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "queryLogStatus")]
        getter query_log_status : String

        # The time the collaboration metadata was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The Amazon Web Services Regions where collaboration query results can be stored. Returns the list of
        # Region identifiers that were specified when the collaboration was created. This list is used to
        # enforce regional storage policies and compliance requirements.

        @[JSON::Field(key: "allowedResultRegions")]
        getter allowed_result_regions : Array(String)?

        # The analytics engine for the collaboration. After July 16, 2025, the CLEAN_ROOMS_SQL parameter will
        # no longer be available.

        @[JSON::Field(key: "analyticsEngine")]
        getter analytics_engine : String?

        # The types of change requests that are automatically approved for this collaboration.

        @[JSON::Field(key: "autoApprovedChangeTypes")]
        getter auto_approved_change_types : Array(String)?

        # The settings for client-side encryption for cryptographic computing.

        @[JSON::Field(key: "dataEncryptionMetadata")]
        getter data_encryption_metadata : Types::DataEncryptionMetadata?

        # A description of the collaboration provided by the collaboration owner.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An indicator as to whether metrics are enabled for the collaboration. When true , collaboration
        # members can opt in to Amazon CloudWatch metrics for their membership queries.

        @[JSON::Field(key: "isMetricsEnabled")]
        getter is_metrics_enabled : Bool?

        # An indicator as to whether job logging has been enabled or disabled for the collaboration. When
        # ENABLED , Clean Rooms logs details about jobs run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "jobLogStatus")]
        getter job_log_status : String?

        # The unique ARN for your membership within the collaboration.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String?

        # The unique ID for your membership within the collaboration.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String?

        def initialize(
          @arn : String,
          @create_time : Time,
          @creator_account_id : String,
          @creator_display_name : String,
          @id : String,
          @member_status : String,
          @name : String,
          @query_log_status : String,
          @update_time : Time,
          @allowed_result_regions : Array(String)? = nil,
          @analytics_engine : String? = nil,
          @auto_approved_change_types : Array(String)? = nil,
          @data_encryption_metadata : Types::DataEncryptionMetadata? = nil,
          @description : String? = nil,
          @is_metrics_enabled : Bool? = nil,
          @job_log_status : String? = nil,
          @membership_arn : String? = nil,
          @membership_id : String? = nil
        )
        end
      end

      # The analysis template within a collaboration.

      struct CollaborationAnalysisTemplate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the analysis template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the analysis template’s associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # A unique identifier for the collaboration that the analysis templates belong to. Currently accepts
        # collaboration ID.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time that the analysis template within a collaboration was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier used to reference members of the collaboration. Currently only supports Amazon Web
        # Services account ID.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The format of the analysis template in the collaboration.

        @[JSON::Field(key: "format")]
        getter format : String

        # The identifier of the analysis template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the analysis template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The entire schema object.

        @[JSON::Field(key: "schema")]
        getter schema : Types::AnalysisSchema

        # The time that the analysis template in the collaboration was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The analysis parameters that have been specified in the analysis template.

        @[JSON::Field(key: "analysisParameters")]
        getter analysis_parameters : Array(Types::AnalysisParameter)?

        # The description of the analysis template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration that specifies the level of detail in error messages returned by analyses using
        # this template. When set to DETAILED , error messages include more information to help troubleshoot
        # issues with PySpark jobs. Detailed error messages may expose underlying data, including sensitive
        # information. Recommended for faster troubleshooting in development and testing environments.

        @[JSON::Field(key: "errorMessageConfiguration")]
        getter error_message_configuration : Types::ErrorMessageConfiguration?

        # The source of the analysis template within a collaboration.

        @[JSON::Field(key: "source")]
        getter source : Types::AnalysisSource?

        # The source metadata for the collaboration analysis template.

        @[JSON::Field(key: "sourceMetadata")]
        getter source_metadata : Types::AnalysisSourceMetadata?

        # The synthetic data generation parameters configured for this collaboration analysis template.

        @[JSON::Field(key: "syntheticDataParameters")]
        getter synthetic_data_parameters : Types::SyntheticDataParameters?

        # The validations that were performed.

        @[JSON::Field(key: "validations")]
        getter validations : Array(Types::AnalysisTemplateValidationStatusDetail)?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @format : String,
          @id : String,
          @name : String,
          @schema : Types::AnalysisSchema,
          @update_time : Time,
          @analysis_parameters : Array(Types::AnalysisParameter)? = nil,
          @description : String? = nil,
          @error_message_configuration : Types::ErrorMessageConfiguration? = nil,
          @source : Types::AnalysisSource? = nil,
          @source_metadata : Types::AnalysisSourceMetadata? = nil,
          @synthetic_data_parameters : Types::SyntheticDataParameters? = nil,
          @validations : Array(Types::AnalysisTemplateValidationStatusDetail)? = nil
        )
        end
      end

      # The metadata of the analysis template within a collaboration.

      struct CollaborationAnalysisTemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the analysis template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the analysis template’s associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # A unique identifier for the collaboration that the analysis templates belong to. Currently accepts
        # collaboration ID.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time that the summary of the analysis template in a collaboration was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier used to reference members of the collaboration. Currently only supports Amazon Web
        # Services account ID.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The identifier of the analysis template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the analysis template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time that the summary of the analysis template in the collaboration was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the analysis template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates if this collaboration analysis template uses synthetic data generation.

        @[JSON::Field(key: "isSyntheticData")]
        getter is_synthetic_data : Bool?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil,
          @is_synthetic_data : Bool? = nil
        )
        end
      end

      # Represents a request to modify a collaboration. Change requests enable structured modifications to
      # collaborations after they have been created.

      struct CollaborationChangeRequest
        include JSON::Serializable

        # The list of changes specified in this change request.

        @[JSON::Field(key: "changes")]
        getter changes : Array(Types::Change)

        # The unique identifier for the collaboration being modified.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time when the change request was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier for the change request.

        @[JSON::Field(key: "id")]
        getter id : String

        # Whether the change request was automatically approved based on the collaboration's auto-approval
        # settings.

        @[JSON::Field(key: "isAutoApproved")]
        getter is_auto_approved : Bool

        # The current status of the change request. Valid values are PENDING , APPROVED , DENIED , COMMITTED ,
        # and CANCELLED .

        @[JSON::Field(key: "status")]
        getter status : String

        # The time when the change request was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # A list of approval details from collaboration members, including approval status and multi-party
        # approval workflow information.

        @[JSON::Field(key: "approvals")]
        getter approvals : Hash(String, Types::ApprovalStatusDetails)?

        def initialize(
          @changes : Array(Types::Change),
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @is_auto_approved : Bool,
          @status : String,
          @update_time : Time,
          @approvals : Hash(String, Types::ApprovalStatusDetails)? = nil
        )
        end
      end

      # Summary information about a collaboration change request.

      struct CollaborationChangeRequestSummary
        include JSON::Serializable

        # Summary of the changes in this change request.

        @[JSON::Field(key: "changes")]
        getter changes : Array(Types::Change)

        # The unique identifier for the collaboration.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time when the change request was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier for the change request.

        @[JSON::Field(key: "id")]
        getter id : String

        # Whether the change request was automatically approved.

        @[JSON::Field(key: "isAutoApproved")]
        getter is_auto_approved : Bool

        # The current status of the change request.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time when the change request was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # Summary of approval statuses from all collaboration members for this change request.

        @[JSON::Field(key: "approvals")]
        getter approvals : Hash(String, Types::ApprovalStatusDetails)?

        def initialize(
          @changes : Array(Types::Change),
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @is_auto_approved : Bool,
          @status : String,
          @update_time : Time,
          @approvals : Hash(String, Types::ApprovalStatusDetails)? = nil
        )
        end
      end

      # Defines the specific changes being requested for a collaboration, including configuration
      # modifications and approval requirements.

      struct CollaborationChangeSpecification
        include JSON::Serializable

        # Defines requested updates to properties of the collaboration. Currently, this only supports
        # modifying which change types are auto-approved for the collaboration.

        @[JSON::Field(key: "autoApprovedChangeTypes")]
        getter auto_approved_change_types : Array(String)?

        def initialize(
          @auto_approved_change_types : Array(String)? = nil
        )
        end
      end

      # The configured audience model association within a collaboration.

      struct CollaborationConfiguredAudienceModelAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the configured audience model's associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # A unique identifier for the collaboration that the configured audience model associations belong to.
        # Accepts collaboration ID.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The Amazon Resource Name (ARN) of the configure audience model.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The time at which the configured audience model association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier used to reference members of the collaboration. Only supports Amazon Web Services
        # account ID.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The identifier of the configured audience model association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the configured audience model association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured audience model association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured audience model association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @configured_audience_model_arn : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # A summary of the configured audience model association in the collaboration.

      struct CollaborationConfiguredAudienceModelAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the configured audience model's associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # A unique identifier for the collaboration that the configured audience model associations belong to.
        # Accepts collaboration ID.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the configured audience model association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier used to reference members of the collaboration. Only supports Amazon Web Services
        # account ID.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The identifier of the configured audience model association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the configured audience model association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured audience model association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured audience model association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Defines details for the collaboration ID namespace association.

      struct CollaborationIdNamespaceAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collaboration ID namespace association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains the collaboration ID namespace
        # association.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains the collaboration ID namespace association.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the collaboration ID namespace association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the Amazon Web Services account that created the collaboration ID namespace
        # association.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The unique identifier of the collaboration ID namespace association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The input reference configuration that's necessary to create the collaboration ID namespace
        # association.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig

        # The input reference properties that are needed to create the collaboration ID namespace association.

        @[JSON::Field(key: "inputReferenceProperties")]
        getter input_reference_properties : Types::IdNamespaceAssociationInputReferenceProperties

        # The name of the collaboration ID namespace association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the collaboration ID namespace was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the collaboration ID namespace association.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "idMappingConfig")]
        getter id_mapping_config : Types::IdMappingConfig?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig,
          @input_reference_properties : Types::IdNamespaceAssociationInputReferenceProperties,
          @name : String,
          @update_time : Time,
          @description : String? = nil,
          @id_mapping_config : Types::IdMappingConfig? = nil
        )
        end
      end

      # Provides summary information about the collaboration ID namespace association.

      struct CollaborationIdNamespaceAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collaboration ID namespace association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains this collaboration ID namespace
        # association.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains this collaboration ID namespace
        # association.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the collaboration ID namespace association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The Amazon Web Services account that created this collaboration ID namespace association.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The unique identifier of the collaboration ID namespace association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The input reference configuration that's used to create the collaboration ID namespace association.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig

        # The input reference properties that are used to create the collaboration ID namespace association.

        @[JSON::Field(key: "inputReferenceProperties")]
        getter input_reference_properties : Types::IdNamespaceAssociationInputReferencePropertiesSummary

        # The name of the collaboration ID namespace association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the collaboration ID namespace association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the collaboration ID namepsace association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig,
          @input_reference_properties : Types::IdNamespaceAssociationInputReferencePropertiesSummary,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # A summary of the collaboration privacy budgets. This summary includes the collaboration information,
      # creation information, epsilon provided, and utility in terms of aggregations.

      struct CollaborationPrivacyBudgetSummary
        include JSON::Serializable

        # The includes epsilon provided and utility in terms of aggregations.

        @[JSON::Field(key: "budget")]
        getter budget : Types::PrivacyBudget

        # The ARN of the collaboration that includes this privacy budget.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that includes this privacy budget.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the privacy budget was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the account that created this privacy budget.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The unique identifier of the collaboration privacy budget.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of the collaboration privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplateArn")]
        getter privacy_budget_template_arn : String

        # The unique identifier of the collaboration privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplateId")]
        getter privacy_budget_template_id : String

        # The type of privacy budget template.

        @[JSON::Field(key: "type")]
        getter type : String

        # The most recent time at which the privacy budget was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @budget : Types::PrivacyBudget,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @privacy_budget_template_arn : String,
          @privacy_budget_template_id : String,
          @type : String,
          @update_time : Time
        )
        end
      end

      # An array that specifies the information for a collaboration's privacy budget template.

      struct CollaborationPrivacyBudgetTemplate
        include JSON::Serializable

        # The ARN of the collaboration privacy budget template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # How often the privacy budget refreshes. If you plan to regularly bring new data into the
        # collaboration, use CALENDAR_MONTH to automatically get a new privacy budget for the collaboration
        # every calendar month. Choosing this option allows arbitrary amounts of information to be revealed
        # about rows of the data when repeatedly queried across refreshes. Avoid choosing this if the same
        # rows will be repeatedly queried between privacy budget refreshes.

        @[JSON::Field(key: "autoRefresh")]
        getter auto_refresh : String

        # The ARN of the collaboration that includes this collaboration privacy budget template.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that includes this collaboration privacy budget template.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the collaboration privacy budget template was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the account that created this collaboration privacy budget template.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The unique identifier of the collaboration privacy budget template.

        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies the epsilon and noise parameters for the privacy budget template.

        @[JSON::Field(key: "parameters")]
        getter parameters : Types::PrivacyBudgetTemplateParametersOutput

        # The type of privacy budget template.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # The most recent time at which the collaboration privacy budget template was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @arn : String,
          @auto_refresh : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @parameters : Types::PrivacyBudgetTemplateParametersOutput,
          @privacy_budget_type : String,
          @update_time : Time
        )
        end
      end

      # A summary of the collaboration's privacy budget template. This summary includes information about
      # who created the privacy budget template and what collaborations it belongs to.

      struct CollaborationPrivacyBudgetTemplateSummary
        include JSON::Serializable

        # The ARN of the collaboration privacy budget template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ARN of the collaboration that contains this collaboration privacy budget template.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains this collaboration privacy budget template.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the collaboration privacy budget template was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the account that created this collaboration privacy budget template.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The unique identifier of the collaboration privacy budget template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The type of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # The most recent time at which the collaboration privacy budget template was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @id : String,
          @privacy_budget_type : String,
          @update_time : Time
        )
        end
      end

      # The metadata of the collaboration.

      struct CollaborationSummary
        include JSON::Serializable

        # The ARN of the collaboration.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the collaboration was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier used to reference members of the collaboration. Currently only supports Amazon Web
        # Services account ID.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The display name of the collaboration creator.

        @[JSON::Field(key: "creatorDisplayName")]
        getter creator_display_name : String

        # The identifier for the collaboration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The status of a member in a collaboration.

        @[JSON::Field(key: "memberStatus")]
        getter member_status : String

        # A human-readable identifier provided by the collaboration owner. Display names are not unique.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time the collaboration metadata was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The analytics engine. After July 16, 2025, the CLEAN_ROOMS_SQL parameter will no longer be
        # available.

        @[JSON::Field(key: "analyticsEngine")]
        getter analytics_engine : String?

        # The ARN of a member in a collaboration.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String?

        # The identifier of a member in a collaboration.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String?

        def initialize(
          @arn : String,
          @create_time : Time,
          @creator_account_id : String,
          @creator_display_name : String,
          @id : String,
          @member_status : String,
          @name : String,
          @update_time : Time,
          @analytics_engine : String? = nil,
          @membership_arn : String? = nil,
          @membership_id : String? = nil
        )
        end
      end

      # A column within a schema relation, derived from the underlying table.

      struct Column
        include JSON::Serializable

        # The name of the column.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the column.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # Contains classification information for data columns, including mappings that specify how columns
      # should be handled during synthetic data generation and privacy analysis.

      struct ColumnClassificationDetails
        include JSON::Serializable

        # A mapping that defines the classification of data columns for synthetic data generation and
        # specifies how each column should be handled during the privacy-preserving data synthesis process.

        @[JSON::Field(key: "columnMapping")]
        getter column_mapping : Array(Types::SyntheticDataColumnProperties)

        def initialize(
          @column_mapping : Array(Types::SyntheticDataColumnProperties)
        )
        end
      end

      # The configuration of the compute resources for an analysis with the Spark analytics engine.

      struct ComputeConfiguration
        include JSON::Serializable

        # The worker configuration for the compute environment.

        @[JSON::Field(key: "worker")]
        getter worker : Types::WorkerComputeConfiguration?

        def initialize(
          @worker : Types::WorkerComputeConfiguration? = nil
        )
        end
      end

      # The configuration details.

      struct ConfigurationDetails
        include JSON::Serializable

        # The direct analysis configuration details.

        @[JSON::Field(key: "directAnalysisConfigurationDetails")]
        getter direct_analysis_configuration_details : Types::DirectAnalysisConfigurationDetails?

        def initialize(
          @direct_analysis_configuration_details : Types::DirectAnalysisConfigurationDetails? = nil
        )
        end
      end

      # Details about the configured audience model association.

      struct ConfiguredAudienceModelAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains this configured audience model
        # association.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # A unique identifier of the collaboration that contains this configured audience model association.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The Amazon Resource Name (ARN) of the configured audience model that was used for this configured
        # audience model association.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The time at which the configured audience model association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # A unique identifier of the configured audience model association.

        @[JSON::Field(key: "id")]
        getter id : String

        # When TRUE , indicates that the resource policy for the configured audience model resource being
        # associated is configured for Clean Rooms to manage permissions related to the given collaboration.
        # When FALSE , indicates that the configured audience model resource owner will manage permissions
        # related to the given collaboration.

        @[JSON::Field(key: "manageResourcePolicies")]
        getter manage_resource_policies : Bool

        # The Amazon Resource Name (ARN) of the membership that contains this configured audience model
        # association.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # A unique identifier for the membership that contains this configured audience model association.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the configured audience model association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured audience model association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured audience model association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @configured_audience_model_arn : String,
          @create_time : Time,
          @id : String,
          @manage_resource_policies : Bool,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # A summary of the configured audience model association.

      struct ConfiguredAudienceModelAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains the configured audience model
        # association.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # A unique identifier of the collaboration that configured audience model is associated with.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The Amazon Resource Name (ARN) of the configured audience model that was used for this configured
        # audience model association.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The time at which the configured audience model association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # A unique identifier of the configured audience model association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the membership that contains the configured audience model
        # association.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # A unique identifier of the membership that contains the configured audience model association.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the configured audience model association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured audience model association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured audience model association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @configured_audience_model_arn : String,
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # A table that has been configured for use in a collaboration.

      struct ConfiguredTable
        include JSON::Serializable

        # The columns within the underlying Glue table that can be used within collaborations.

        @[JSON::Field(key: "allowedColumns")]
        getter allowed_columns : Array(String)

        # The analysis method for the configured table. DIRECT_QUERY allows SQL queries to be run directly on
        # this table. DIRECT_JOB allows PySpark jobs to be run directly on this table. MULTIPLE allows both
        # SQL queries and PySpark jobs to be run directly on this table.

        @[JSON::Field(key: "analysisMethod")]
        getter analysis_method : String

        # The types of analysis rules associated with this configured table. Currently, only one analysis rule
        # may be associated with a configured table.

        @[JSON::Field(key: "analysisRuleTypes")]
        getter analysis_rule_types : Array(String)

        # The unique ARN for the configured table.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the configured table was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique ID for the configured table.

        @[JSON::Field(key: "id")]
        getter id : String

        # A name for the configured table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The table that this configured table represents.

        @[JSON::Field(key: "tableReference")]
        getter table_reference : Types::TableReference

        # The time the configured table was last updated

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # A description for the configured table.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The selected analysis methods for the configured table.

        @[JSON::Field(key: "selectedAnalysisMethods")]
        getter selected_analysis_methods : Array(String)?

        def initialize(
          @allowed_columns : Array(String),
          @analysis_method : String,
          @analysis_rule_types : Array(String),
          @arn : String,
          @create_time : Time,
          @id : String,
          @name : String,
          @table_reference : Types::TableReference,
          @update_time : Time,
          @description : String? = nil,
          @selected_analysis_methods : Array(String)? = nil
        )
        end
      end

      # A configured table analysis rule, which limits how data for this table can be used.

      struct ConfiguredTableAnalysisRule
        include JSON::Serializable

        # The unique ARN for the configured table.

        @[JSON::Field(key: "configuredTableArn")]
        getter configured_table_arn : String

        # The unique ID for the configured table.

        @[JSON::Field(key: "configuredTableId")]
        getter configured_table_id : String

        # The time the configured table analysis rule was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The policy that controls SQL query rules.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ConfiguredTableAnalysisRulePolicy

        # The type of configured table analysis rule.

        @[JSON::Field(key: "type")]
        getter type : String

        # The time the configured table analysis rule was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @configured_table_arn : String,
          @configured_table_id : String,
          @create_time : Time,
          @policy : Types::ConfiguredTableAnalysisRulePolicy,
          @type : String,
          @update_time : Time
        )
        end
      end

      # Controls on the query specifications that can be run on a configured table.

      struct ConfiguredTableAnalysisRulePolicy
        include JSON::Serializable

        # Controls on the query specifications that can be run on a configured table.

        @[JSON::Field(key: "v1")]
        getter v1 : Types::ConfiguredTableAnalysisRulePolicyV1?

        def initialize(
          @v1 : Types::ConfiguredTableAnalysisRulePolicyV1? = nil
        )
        end
      end

      # Controls on the query specifications that can be run on a configured table.

      struct ConfiguredTableAnalysisRulePolicyV1
        include JSON::Serializable

        # Analysis rule type that enables only aggregation queries on a configured table.

        @[JSON::Field(key: "aggregation")]
        getter aggregation : Types::AnalysisRuleAggregation?


        @[JSON::Field(key: "custom")]
        getter custom : Types::AnalysisRuleCustom?

        # Analysis rule type that enables only list queries on a configured table.

        @[JSON::Field(key: "list")]
        getter list : Types::AnalysisRuleList?

        def initialize(
          @aggregation : Types::AnalysisRuleAggregation? = nil,
          @custom : Types::AnalysisRuleCustom? = nil,
          @list : Types::AnalysisRuleList? = nil
        )
        end
      end

      # A configured table association links a configured table to a collaboration.

      struct ConfiguredTableAssociation
        include JSON::Serializable

        # The unique ARN for the configured table association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the configured table that the association refers to.

        @[JSON::Field(key: "configuredTableArn")]
        getter configured_table_arn : String

        # The unique ID for the configured table that the association refers to.

        @[JSON::Field(key: "configuredTableId")]
        getter configured_table_id : String

        # The time the configured table association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique ID for the configured table association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The unique ARN for the membership this configured table association belongs to.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique ID for the membership this configured table association belongs to.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the configured table association, in lowercase. The table is identified by this name
        # when running protected queries against the underlying data.

        @[JSON::Field(key: "name")]
        getter name : String

        # The service will assume this role to access catalog metadata and query the table.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The time the configured table association was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The analysis rule types for the configured table association.

        @[JSON::Field(key: "analysisRuleTypes")]
        getter analysis_rule_types : Array(String)?

        # A description of the configured table association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @configured_table_arn : String,
          @configured_table_id : String,
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @role_arn : String,
          @update_time : Time,
          @analysis_rule_types : Array(String)? = nil,
          @description : String? = nil
        )
        end
      end

      # An analysis rule for a configured table association. This analysis rule specifies how data from the
      # table can be used within its associated collaboration. In the console, the
      # ConfiguredTableAssociationAnalysisRule is referred to as the collaboration analysis rule .

      struct ConfiguredTableAssociationAnalysisRule
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured table association.

        @[JSON::Field(key: "configuredTableAssociationArn")]
        getter configured_table_association_arn : String

        # The unique identifier for the configured table association.

        @[JSON::Field(key: "configuredTableAssociationId")]
        getter configured_table_association_id : String

        # The creation time of the configured table association analysis rule.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The membership identifier for the configured table association analysis rule.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The policy of the configured table association analysis rule.

        @[JSON::Field(key: "policy")]
        getter policy : Types::ConfiguredTableAssociationAnalysisRulePolicy

        # The type of the configured table association analysis rule.

        @[JSON::Field(key: "type")]
        getter type : String

        # The update time of the configured table association analysis rule.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @configured_table_association_arn : String,
          @configured_table_association_id : String,
          @create_time : Time,
          @membership_identifier : String,
          @policy : Types::ConfiguredTableAssociationAnalysisRulePolicy,
          @type : String,
          @update_time : Time
        )
        end
      end

      # The configured table association analysis rule applied to a configured table with the aggregation
      # analysis rule.

      struct ConfiguredTableAssociationAnalysisRuleAggregation
        include JSON::Serializable

        # The list of resources or wildcards (ARNs) that are allowed to perform additional analysis on query
        # output. The allowedAdditionalAnalyses parameter is currently supported for the list analysis rule (
        # AnalysisRuleList ) and the custom analysis rule ( AnalysisRuleCustom ).

        @[JSON::Field(key: "allowedAdditionalAnalyses")]
        getter allowed_additional_analyses : Array(String)?

        # The list of collaboration members who are allowed to receive results of queries run with this
        # configured table.

        @[JSON::Field(key: "allowedResultReceivers")]
        getter allowed_result_receivers : Array(String)?

        def initialize(
          @allowed_additional_analyses : Array(String)? = nil,
          @allowed_result_receivers : Array(String)? = nil
        )
        end
      end

      # The configured table association analysis rule applied to a configured table with the custom
      # analysis rule.

      struct ConfiguredTableAssociationAnalysisRuleCustom
        include JSON::Serializable

        # The list of resources or wildcards (ARNs) that are allowed to perform additional analysis on query
        # output.

        @[JSON::Field(key: "allowedAdditionalAnalyses")]
        getter allowed_additional_analyses : Array(String)?

        # The list of collaboration members who are allowed to receive results of queries run with this
        # configured table.

        @[JSON::Field(key: "allowedResultReceivers")]
        getter allowed_result_receivers : Array(String)?

        def initialize(
          @allowed_additional_analyses : Array(String)? = nil,
          @allowed_result_receivers : Array(String)? = nil
        )
        end
      end

      # The configured table association analysis rule applied to a configured table with the list analysis
      # rule.

      struct ConfiguredTableAssociationAnalysisRuleList
        include JSON::Serializable

        # The list of resources or wildcards (ARNs) that are allowed to perform additional analysis on query
        # output.

        @[JSON::Field(key: "allowedAdditionalAnalyses")]
        getter allowed_additional_analyses : Array(String)?

        # The list of collaboration members who are allowed to receive results of queries run with this
        # configured table.

        @[JSON::Field(key: "allowedResultReceivers")]
        getter allowed_result_receivers : Array(String)?

        def initialize(
          @allowed_additional_analyses : Array(String)? = nil,
          @allowed_result_receivers : Array(String)? = nil
        )
        end
      end

      # Controls on the query specifications that can be run on an associated configured table.

      struct ConfiguredTableAssociationAnalysisRulePolicy
        include JSON::Serializable

        # The policy for the configured table association analysis rule.

        @[JSON::Field(key: "v1")]
        getter v1 : Types::ConfiguredTableAssociationAnalysisRulePolicyV1?

        def initialize(
          @v1 : Types::ConfiguredTableAssociationAnalysisRulePolicyV1? = nil
        )
        end
      end

      # Controls on the query specifications that can be run on an associated configured table.

      struct ConfiguredTableAssociationAnalysisRulePolicyV1
        include JSON::Serializable

        # Analysis rule type that enables only aggregation queries on a configured table.

        @[JSON::Field(key: "aggregation")]
        getter aggregation : Types::ConfiguredTableAssociationAnalysisRuleAggregation?

        # Analysis rule type that enables the table owner to approve custom SQL queries on their configured
        # tables. It supports differential privacy.

        @[JSON::Field(key: "custom")]
        getter custom : Types::ConfiguredTableAssociationAnalysisRuleCustom?

        # Analysis rule type that enables only list queries on a configured table.

        @[JSON::Field(key: "list")]
        getter list : Types::ConfiguredTableAssociationAnalysisRuleList?

        def initialize(
          @aggregation : Types::ConfiguredTableAssociationAnalysisRuleAggregation? = nil,
          @custom : Types::ConfiguredTableAssociationAnalysisRuleCustom? = nil,
          @list : Types::ConfiguredTableAssociationAnalysisRuleList? = nil
        )
        end
      end

      # The configured table association summary for the objects listed by the request.

      struct ConfiguredTableAssociationSummary
        include JSON::Serializable

        # The unique ARN for the configured table association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique configured table ID that this configured table association refers to.

        @[JSON::Field(key: "configuredTableId")]
        getter configured_table_id : String

        # The time the configured table association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique ID for the configured table association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The unique ARN for the membership that the configured table association belongs to.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique ID for the membership that the configured table association belongs to.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the configured table association. The table is identified by this name when running
        # Protected Queries against the underlying data.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time the configured table association was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The analysis rule types that are associated with the configured table associations in this summary.

        @[JSON::Field(key: "analysisRuleTypes")]
        getter analysis_rule_types : Array(String)?

        def initialize(
          @arn : String,
          @configured_table_id : String,
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @analysis_rule_types : Array(String)? = nil
        )
        end
      end

      # The configured table summary for the objects listed by the request.

      struct ConfiguredTableSummary
        include JSON::Serializable

        # The analysis method for the configured tables. DIRECT_QUERY allows SQL queries to be run directly on
        # this table. DIRECT_JOB allows PySpark jobs to be run directly on this table. MULTIPLE allows both
        # SQL queries and PySpark jobs to be run directly on this table.

        @[JSON::Field(key: "analysisMethod")]
        getter analysis_method : String

        # The types of analysis rules associated with this configured table.

        @[JSON::Field(key: "analysisRuleTypes")]
        getter analysis_rule_types : Array(String)

        # The unique ARN of the configured table.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the configured table was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique ID of the configured table.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the configured table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time the configured table was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The selected analysis methods for the configured table summary.

        @[JSON::Field(key: "selectedAnalysisMethods")]
        getter selected_analysis_methods : Array(String)?

        def initialize(
          @analysis_method : String,
          @analysis_rule_types : Array(String),
          @arn : String,
          @create_time : Time,
          @id : String,
          @name : String,
          @update_time : Time,
          @selected_analysis_methods : Array(String)? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # A reason code for the exception.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The ID of the conflicting resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the conflicting resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Controls on the analysis specifications that can be run on a configured table.

      struct ConsolidatedPolicy
        include JSON::Serializable

        # The consolidated policy version 1.

        @[JSON::Field(key: "v1")]
        getter v1 : Types::ConsolidatedPolicyV1?

        def initialize(
          @v1 : Types::ConsolidatedPolicyV1? = nil
        )
        end
      end

      # Controls on the analysis specifications that can be run on a configured table.

      struct ConsolidatedPolicyAggregation
        include JSON::Serializable

        # Aggregate columns in consolidated policy aggregation.

        @[JSON::Field(key: "aggregateColumns")]
        getter aggregate_columns : Array(Types::AggregateColumn)

        # The dimension columns of the consolidated policy aggregation.

        @[JSON::Field(key: "dimensionColumns")]
        getter dimension_columns : Array(String)

        # The columns to join on.

        @[JSON::Field(key: "joinColumns")]
        getter join_columns : Array(String)

        # The output constraints of the consolidated policy aggregation.

        @[JSON::Field(key: "outputConstraints")]
        getter output_constraints : Array(Types::AggregationConstraint)

        # The scalar functions.

        @[JSON::Field(key: "scalarFunctions")]
        getter scalar_functions : Array(String)

        # Additional analyses for the consolidated policy aggregation.

        @[JSON::Field(key: "additionalAnalyses")]
        getter additional_analyses : String?

        # The additional analyses allowed by the consolidated policy aggregation.

        @[JSON::Field(key: "allowedAdditionalAnalyses")]
        getter allowed_additional_analyses : Array(String)?

        # The allowed join operators.

        @[JSON::Field(key: "allowedJoinOperators")]
        getter allowed_join_operators : Array(String)?

        # The allowed result receivers.

        @[JSON::Field(key: "allowedResultReceivers")]
        getter allowed_result_receivers : Array(String)?

        # Join required

        @[JSON::Field(key: "joinRequired")]
        getter join_required : String?

        def initialize(
          @aggregate_columns : Array(Types::AggregateColumn),
          @dimension_columns : Array(String),
          @join_columns : Array(String),
          @output_constraints : Array(Types::AggregationConstraint),
          @scalar_functions : Array(String),
          @additional_analyses : String? = nil,
          @allowed_additional_analyses : Array(String)? = nil,
          @allowed_join_operators : Array(String)? = nil,
          @allowed_result_receivers : Array(String)? = nil,
          @join_required : String? = nil
        )
        end
      end

      # Controls on the analysis specifications that can be run on a configured table.

      struct ConsolidatedPolicyCustom
        include JSON::Serializable

        # The allowed analyses.

        @[JSON::Field(key: "allowedAnalyses")]
        getter allowed_analyses : Array(String)

        # Additional analyses for the consolidated policy.

        @[JSON::Field(key: "additionalAnalyses")]
        getter additional_analyses : String?

        # The additional analyses allowed by the consolidated policy.

        @[JSON::Field(key: "allowedAdditionalAnalyses")]
        getter allowed_additional_analyses : Array(String)?

        # The allowed analysis providers.

        @[JSON::Field(key: "allowedAnalysisProviders")]
        getter allowed_analysis_providers : Array(String)?

        # The allowed result receivers.

        @[JSON::Field(key: "allowedResultReceivers")]
        getter allowed_result_receivers : Array(String)?


        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyConfiguration?

        # Disallowed output columns

        @[JSON::Field(key: "disallowedOutputColumns")]
        getter disallowed_output_columns : Array(String)?

        def initialize(
          @allowed_analyses : Array(String),
          @additional_analyses : String? = nil,
          @allowed_additional_analyses : Array(String)? = nil,
          @allowed_analysis_providers : Array(String)? = nil,
          @allowed_result_receivers : Array(String)? = nil,
          @differential_privacy : Types::DifferentialPrivacyConfiguration? = nil,
          @disallowed_output_columns : Array(String)? = nil
        )
        end
      end

      # Controls on the analysis specifications that can be run on a configured table.

      struct ConsolidatedPolicyList
        include JSON::Serializable

        # The columns to join on.

        @[JSON::Field(key: "joinColumns")]
        getter join_columns : Array(String)

        # The columns in the consolidated policy list.

        @[JSON::Field(key: "listColumns")]
        getter list_columns : Array(String)

        # Additional analyses for the consolidated policy list.

        @[JSON::Field(key: "additionalAnalyses")]
        getter additional_analyses : String?

        # The additional analyses allowed by the consolidated policy list.

        @[JSON::Field(key: "allowedAdditionalAnalyses")]
        getter allowed_additional_analyses : Array(String)?

        # The allowed join operators in the consolidated policy list.

        @[JSON::Field(key: "allowedJoinOperators")]
        getter allowed_join_operators : Array(String)?

        # The allowed result receivers.

        @[JSON::Field(key: "allowedResultReceivers")]
        getter allowed_result_receivers : Array(String)?

        def initialize(
          @join_columns : Array(String),
          @list_columns : Array(String),
          @additional_analyses : String? = nil,
          @allowed_additional_analyses : Array(String)? = nil,
          @allowed_join_operators : Array(String)? = nil,
          @allowed_result_receivers : Array(String)? = nil
        )
        end
      end

      # Controls on the analysis specifications that can be run on a configured table.

      struct ConsolidatedPolicyV1
        include JSON::Serializable

        # The aggregation setting for the consolidated policy.

        @[JSON::Field(key: "aggregation")]
        getter aggregation : Types::ConsolidatedPolicyAggregation?

        # Custom policy

        @[JSON::Field(key: "custom")]
        getter custom : Types::ConsolidatedPolicyCustom?

        # The list of consolidated policies.

        @[JSON::Field(key: "list")]
        getter list : Types::ConsolidatedPolicyList?

        def initialize(
          @aggregation : Types::ConsolidatedPolicyAggregation? = nil,
          @custom : Types::ConsolidatedPolicyCustom? = nil,
          @list : Types::ConsolidatedPolicyList? = nil
        )
        end
      end


      struct CreateAnalysisTemplateInput
        include JSON::Serializable

        # The format of the analysis template.

        @[JSON::Field(key: "format")]
        getter format : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the analysis template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The information in the analysis template.

        @[JSON::Field(key: "source")]
        getter source : Types::AnalysisSource

        # The parameters of the analysis template.

        @[JSON::Field(key: "analysisParameters")]
        getter analysis_parameters : Array(Types::AnalysisParameter)?

        # The description of the analysis template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration that specifies the level of detail in error messages returned by analyses using
        # this template. When set to DETAILED , error messages include more information to help troubleshoot
        # issues with PySpark jobs. Detailed error messages may expose underlying data, including sensitive
        # information. Recommended for faster troubleshooting in development and testing environments.

        @[JSON::Field(key: "errorMessageConfiguration")]
        getter error_message_configuration : Types::ErrorMessageConfiguration?


        @[JSON::Field(key: "schema")]
        getter schema : Types::AnalysisSchema?

        # The parameters for generating synthetic data when running the analysis template.

        @[JSON::Field(key: "syntheticDataParameters")]
        getter synthetic_data_parameters : Types::SyntheticDataParameters?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @format : String,
          @membership_identifier : String,
          @name : String,
          @source : Types::AnalysisSource,
          @analysis_parameters : Array(Types::AnalysisParameter)? = nil,
          @description : String? = nil,
          @error_message_configuration : Types::ErrorMessageConfiguration? = nil,
          @schema : Types::AnalysisSchema? = nil,
          @synthetic_data_parameters : Types::SyntheticDataParameters? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAnalysisTemplateOutput
        include JSON::Serializable

        # The analysis template.

        @[JSON::Field(key: "analysisTemplate")]
        getter analysis_template : Types::AnalysisTemplate

        def initialize(
          @analysis_template : Types::AnalysisTemplate
        )
        end
      end


      struct CreateCollaborationChangeRequestInput
        include JSON::Serializable

        # The list of changes to apply to the collaboration. Each change specifies the type of modification
        # and the details of what should be changed.

        @[JSON::Field(key: "changes")]
        getter changes : Array(Types::ChangeInput)

        # The identifier of the collaboration that the change request is made against.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @changes : Array(Types::ChangeInput),
          @collaboration_identifier : String
        )
        end
      end


      struct CreateCollaborationChangeRequestOutput
        include JSON::Serializable


        @[JSON::Field(key: "collaborationChangeRequest")]
        getter collaboration_change_request : Types::CollaborationChangeRequest

        def initialize(
          @collaboration_change_request : Types::CollaborationChangeRequest
        )
        end
      end


      struct CreateCollaborationInput
        include JSON::Serializable

        # The display name of the collaboration creator.

        @[JSON::Field(key: "creatorDisplayName")]
        getter creator_display_name : String

        # The abilities granted to the collaboration creator.

        @[JSON::Field(key: "creatorMemberAbilities")]
        getter creator_member_abilities : Array(String)

        # A description of the collaboration provided by the collaboration owner.

        @[JSON::Field(key: "description")]
        getter description : String

        # A list of initial members, not including the creator. This list is immutable.

        @[JSON::Field(key: "members")]
        getter members : Array(Types::MemberSpecification)

        # The display name for a collaboration.

        @[JSON::Field(key: "name")]
        getter name : String

        # An indicator as to whether query logging has been enabled or disabled for the collaboration. When
        # ENABLED , Clean Rooms logs details about queries run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "queryLogStatus")]
        getter query_log_status : String

        # The Amazon Web Services Regions where collaboration query results can be stored. When specified,
        # results can only be written to these Regions. This parameter enables you to meet your compliance and
        # data governance requirements, and implement regional data governance policies.

        @[JSON::Field(key: "allowedResultRegions")]
        getter allowed_result_regions : Array(String)?

        # The analytics engine. After July 16, 2025, the CLEAN_ROOMS_SQL parameter will no longer be
        # available.

        @[JSON::Field(key: "analyticsEngine")]
        getter analytics_engine : String?

        # The types of change requests that are automatically approved for this collaboration.

        @[JSON::Field(key: "autoApprovedChangeRequestTypes")]
        getter auto_approved_change_request_types : Array(String)?

        # The ML abilities granted to the collaboration creator.

        @[JSON::Field(key: "creatorMLMemberAbilities")]
        getter creator_ml_member_abilities : Types::MLMemberAbilities?

        # The collaboration creator's payment responsibilities set by the collaboration creator. If the
        # collaboration creator hasn't specified anyone as the member paying for query compute costs, then the
        # member who can query is the default payer.

        @[JSON::Field(key: "creatorPaymentConfiguration")]
        getter creator_payment_configuration : Types::PaymentConfiguration?

        # The settings for client-side encryption with Cryptographic Computing for Clean Rooms.

        @[JSON::Field(key: "dataEncryptionMetadata")]
        getter data_encryption_metadata : Types::DataEncryptionMetadata?

        # An indicator as to whether metrics have been enabled or disabled for the collaboration. When true ,
        # collaboration members can opt in to Amazon CloudWatch metrics for their membership queries. The
        # default value is false .

        @[JSON::Field(key: "isMetricsEnabled")]
        getter is_metrics_enabled : Bool?

        # Specifies whether job logs are enabled for this collaboration. When ENABLED , Clean Rooms logs
        # details about jobs run within this collaboration; those logs can be viewed in Amazon CloudWatch
        # Logs. The default value is DISABLED .

        @[JSON::Field(key: "jobLogStatus")]
        getter job_log_status : String?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creator_display_name : String,
          @creator_member_abilities : Array(String),
          @description : String,
          @members : Array(Types::MemberSpecification),
          @name : String,
          @query_log_status : String,
          @allowed_result_regions : Array(String)? = nil,
          @analytics_engine : String? = nil,
          @auto_approved_change_request_types : Array(String)? = nil,
          @creator_ml_member_abilities : Types::MLMemberAbilities? = nil,
          @creator_payment_configuration : Types::PaymentConfiguration? = nil,
          @data_encryption_metadata : Types::DataEncryptionMetadata? = nil,
          @is_metrics_enabled : Bool? = nil,
          @job_log_status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCollaborationOutput
        include JSON::Serializable

        # The collaboration.

        @[JSON::Field(key: "collaboration")]
        getter collaboration : Types::Collaboration

        def initialize(
          @collaboration : Types::Collaboration
        )
        end
      end


      struct CreateConfiguredAudienceModelAssociationInput
        include JSON::Serializable

        # A unique identifier for the configured audience model that you want to associate.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The name of the configured audience model association.

        @[JSON::Field(key: "configuredAudienceModelAssociationName")]
        getter configured_audience_model_association_name : String

        # When TRUE , indicates that the resource policy for the configured audience model resource being
        # associated is configured for Clean Rooms to manage permissions related to the given collaboration.
        # When FALSE , indicates that the configured audience model resource owner will manage permissions
        # related to the given collaboration. Setting this to TRUE requires you to have permissions to create,
        # update, and delete the resource policy for the cleanrooms-ml resource when you call the
        # DeleteConfiguredAudienceModelAssociation resource. In addition, if you are the collaboration creator
        # and specify TRUE , you must have the same permissions when you call the DeleteMember and
        # DeleteCollaboration APIs.

        @[JSON::Field(key: "manageResourcePolicies")]
        getter manage_resource_policies : Bool

        # A unique identifier for one of your memberships for a collaboration. The configured audience model
        # is associated to the collaboration that this membership belongs to. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A description of the configured audience model association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configured_audience_model_arn : String,
          @configured_audience_model_association_name : String,
          @manage_resource_policies : Bool,
          @membership_identifier : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConfiguredAudienceModelAssociationOutput
        include JSON::Serializable

        # Information about the configured audience model association.

        @[JSON::Field(key: "configuredAudienceModelAssociation")]
        getter configured_audience_model_association : Types::ConfiguredAudienceModelAssociation

        def initialize(
          @configured_audience_model_association : Types::ConfiguredAudienceModelAssociation
        )
        end
      end


      struct CreateConfiguredTableAnalysisRuleInput
        include JSON::Serializable

        # The analysis rule policy that was created for the configured table.

        @[JSON::Field(key: "analysisRulePolicy")]
        getter analysis_rule_policy : Types::ConfiguredTableAnalysisRulePolicy

        # The type of analysis rule.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The identifier for the configured table to create the analysis rule for. Currently accepts the
        # configured table ID.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        def initialize(
          @analysis_rule_policy : Types::ConfiguredTableAnalysisRulePolicy,
          @analysis_rule_type : String,
          @configured_table_identifier : String
        )
        end
      end


      struct CreateConfiguredTableAnalysisRuleOutput
        include JSON::Serializable

        # The analysis rule that was created for the configured table.

        @[JSON::Field(key: "analysisRule")]
        getter analysis_rule : Types::ConfiguredTableAnalysisRule

        def initialize(
          @analysis_rule : Types::ConfiguredTableAnalysisRule
        )
        end
      end


      struct CreateConfiguredTableAssociationAnalysisRuleInput
        include JSON::Serializable

        # The analysis rule policy that was created for the configured table association.

        @[JSON::Field(key: "analysisRulePolicy")]
        getter analysis_rule_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy

        # The type of analysis rule.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The unique ID for the configured table association. Currently accepts the configured table
        # association ID.

        @[JSON::Field(key: "configuredTableAssociationIdentifier")]
        getter configured_table_association_identifier : String

        # A unique identifier for the membership that the configured table association belongs to. Currently
        # accepts the membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @analysis_rule_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy,
          @analysis_rule_type : String,
          @configured_table_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct CreateConfiguredTableAssociationAnalysisRuleOutput
        include JSON::Serializable

        # The analysis rule for the conﬁgured table association. In the console, the
        # ConfiguredTableAssociationAnalysisRule is referred to as the collaboration analysis rule .

        @[JSON::Field(key: "analysisRule")]
        getter analysis_rule : Types::ConfiguredTableAssociationAnalysisRule

        def initialize(
          @analysis_rule : Types::ConfiguredTableAssociationAnalysisRule
        )
        end
      end


      struct CreateConfiguredTableAssociationInput
        include JSON::Serializable

        # A unique identifier for the configured table to be associated to. Currently accepts a configured
        # table ID.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        # A unique identifier for one of your memberships for a collaboration. The configured table is
        # associated to the collaboration that this membership belongs to. Currently accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the configured table association. This name is used to query the underlying configured
        # table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The service will assume this role to access catalog metadata and query the table.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A description for the configured table association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configured_table_identifier : String,
          @membership_identifier : String,
          @name : String,
          @role_arn : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConfiguredTableAssociationOutput
        include JSON::Serializable

        # The configured table association.

        @[JSON::Field(key: "configuredTableAssociation")]
        getter configured_table_association : Types::ConfiguredTableAssociation

        def initialize(
          @configured_table_association : Types::ConfiguredTableAssociation
        )
        end
      end


      struct CreateConfiguredTableInput
        include JSON::Serializable

        # The columns of the underlying table that can be used by collaborations or analysis rules.

        @[JSON::Field(key: "allowedColumns")]
        getter allowed_columns : Array(String)

        # The analysis method allowed for the configured tables. DIRECT_QUERY allows SQL queries to be run
        # directly on this table. DIRECT_JOB allows PySpark jobs to be run directly on this table. MULTIPLE
        # allows both SQL queries and PySpark jobs to be run directly on this table.

        @[JSON::Field(key: "analysisMethod")]
        getter analysis_method : String

        # The name of the configured table.

        @[JSON::Field(key: "name")]
        getter name : String

        # A reference to the table being configured.

        @[JSON::Field(key: "tableReference")]
        getter table_reference : Types::TableReference

        # A description for the configured table.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The analysis methods to enable for the configured table. When configured, you must specify at least
        # two analysis methods.

        @[JSON::Field(key: "selectedAnalysisMethods")]
        getter selected_analysis_methods : Array(String)?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @allowed_columns : Array(String),
          @analysis_method : String,
          @name : String,
          @table_reference : Types::TableReference,
          @description : String? = nil,
          @selected_analysis_methods : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConfiguredTableOutput
        include JSON::Serializable

        # The created configured table.

        @[JSON::Field(key: "configuredTable")]
        getter configured_table : Types::ConfiguredTable

        def initialize(
          @configured_table : Types::ConfiguredTable
        )
        end
      end


      struct CreateIdMappingTableInput
        include JSON::Serializable

        # The input reference configuration needed to create the ID mapping table.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdMappingTableInputReferenceConfig

        # The unique identifier of the membership that contains the ID mapping table.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A name for the ID mapping table.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the ID mapping table.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services KMS key. This value is used to encrypt the
        # mapping table data that is stored by Clean Rooms.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input_reference_config : Types::IdMappingTableInputReferenceConfig,
          @membership_identifier : String,
          @name : String,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIdMappingTableOutput
        include JSON::Serializable

        # The ID mapping table that was created.

        @[JSON::Field(key: "idMappingTable")]
        getter id_mapping_table : Types::IdMappingTable

        def initialize(
          @id_mapping_table : Types::IdMappingTable
        )
        end
      end


      struct CreateIdNamespaceAssociationInput
        include JSON::Serializable

        # The input reference configuration needed to create the ID namespace association.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig

        # The unique identifier of the membership that contains the ID namespace association.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name for the ID namespace association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the ID namespace association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration settings for the ID mapping table.

        @[JSON::Field(key: "idMappingConfig")]
        getter id_mapping_config : Types::IdMappingConfig?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig,
          @membership_identifier : String,
          @name : String,
          @description : String? = nil,
          @id_mapping_config : Types::IdMappingConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIdNamespaceAssociationOutput
        include JSON::Serializable

        # The ID namespace association that was created.

        @[JSON::Field(key: "idNamespaceAssociation")]
        getter id_namespace_association : Types::IdNamespaceAssociation

        def initialize(
          @id_namespace_association : Types::IdNamespaceAssociation
        )
        end
      end


      struct CreateMembershipInput
        include JSON::Serializable

        # The unique ID for the associated collaboration.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # An indicator as to whether query logging has been enabled or disabled for the membership. When
        # ENABLED , Clean Rooms logs details about queries run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "queryLogStatus")]
        getter query_log_status : String

        # The default job result configuration that determines how job results are protected and managed
        # within this membership. This configuration applies to all jobs.

        @[JSON::Field(key: "defaultJobResultConfiguration")]
        getter default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration?

        # The default protected query result configuration as specified by the member who can receive results.

        @[JSON::Field(key: "defaultResultConfiguration")]
        getter default_result_configuration : Types::MembershipProtectedQueryResultConfiguration?

        # An indicator as to whether Amazon CloudWatch metrics have been enabled or disabled for the
        # membership. Amazon CloudWatch metrics are only available when the collaboration has metrics enabled.
        # This option can be set by collaboration members who have the ability to run queries (analysis
        # runners) or by members who are configured as payers. When true , metrics about query execution are
        # collected in Amazon CloudWatch. The default value is false .

        @[JSON::Field(key: "isMetricsEnabled")]
        getter is_metrics_enabled : Bool?

        # An indicator as to whether job logging has been enabled or disabled for the collaboration. When
        # ENABLED , Clean Rooms logs details about jobs run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "jobLogStatus")]
        getter job_log_status : String?

        # The payment responsibilities accepted by the collaboration member. Not required if the collaboration
        # member has the member ability to run queries. Required if the collaboration member doesn't have the
        # member ability to run queries but is configured as a payer by the collaboration creator.

        @[JSON::Field(key: "paymentConfiguration")]
        getter payment_configuration : Types::MembershipPaymentConfiguration?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @collaboration_identifier : String,
          @query_log_status : String,
          @default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration? = nil,
          @default_result_configuration : Types::MembershipProtectedQueryResultConfiguration? = nil,
          @is_metrics_enabled : Bool? = nil,
          @job_log_status : String? = nil,
          @payment_configuration : Types::MembershipPaymentConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMembershipOutput
        include JSON::Serializable

        # The membership that was created.

        @[JSON::Field(key: "membership")]
        getter membership : Types::Membership

        def initialize(
          @membership : Types::Membership
        )
        end
      end


      struct CreatePrivacyBudgetTemplateInput
        include JSON::Serializable

        # A unique identifier for one of your memberships for a collaboration. The privacy budget template is
        # created in the collaboration that this membership belongs to. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # Specifies your parameters for the privacy budget template.

        @[JSON::Field(key: "parameters")]
        getter parameters : Types::PrivacyBudgetTemplateParametersInput

        # Specifies the type of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # How often the privacy budget refreshes. If you plan to regularly bring new data into the
        # collaboration, you can use CALENDAR_MONTH to automatically get a new privacy budget for the
        # collaboration every calendar month. Choosing this option allows arbitrary amounts of information to
        # be revealed about rows of the data when repeatedly queries across refreshes. Avoid choosing this if
        # the same rows will be repeatedly queried between privacy budget refreshes.

        @[JSON::Field(key: "autoRefresh")]
        getter auto_refresh : String?

        # An optional label that you can assign to a resource when you create it. Each tag consists of a key
        # and an optional value, both of which you define. When you use tagging, you can also use tag-based
        # access control in IAM policies to control access to this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @membership_identifier : String,
          @parameters : Types::PrivacyBudgetTemplateParametersInput,
          @privacy_budget_type : String,
          @auto_refresh : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePrivacyBudgetTemplateOutput
        include JSON::Serializable

        # A summary of the elements in the privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplate")]
        getter privacy_budget_template : Types::PrivacyBudgetTemplate

        def initialize(
          @privacy_budget_template : Types::PrivacyBudgetTemplate
        )
        end
      end

      # The settings for client-side encryption for cryptographic computing.

      struct DataEncryptionMetadata
        include JSON::Serializable

        # Indicates whether encrypted tables can contain cleartext data ( TRUE ) or are to cryptographically
        # process every column ( FALSE ).

        @[JSON::Field(key: "allowCleartext")]
        getter allow_cleartext : Bool

        # Indicates whether Fingerprint columns can contain duplicate entries ( TRUE ) or are to contain only
        # non-repeated values ( FALSE ).

        @[JSON::Field(key: "allowDuplicates")]
        getter allow_duplicates : Bool

        # Indicates whether Fingerprint columns can be joined on any other Fingerprint column with a different
        # name ( TRUE ) or can only be joined on Fingerprint columns of the same name ( FALSE ).

        @[JSON::Field(key: "allowJoinsOnColumnsWithDifferentNames")]
        getter allow_joins_on_columns_with_different_names : Bool

        # Indicates whether NULL values are to be copied as NULL to encrypted tables ( TRUE ) or
        # cryptographically processed ( FALSE ).

        @[JSON::Field(key: "preserveNulls")]
        getter preserve_nulls : Bool

        def initialize(
          @allow_cleartext : Bool,
          @allow_duplicates : Bool,
          @allow_joins_on_columns_with_different_names : Bool,
          @preserve_nulls : Bool
        )
        end
      end


      struct DeleteAnalysisTemplateInput
        include JSON::Serializable

        # The identifier for the analysis template resource.

        @[JSON::Field(key: "analysisTemplateIdentifier")]
        getter analysis_template_identifier : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @analysis_template_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct DeleteAnalysisTemplateOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCollaborationInput
        include JSON::Serializable

        # The identifier for the collaboration.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @collaboration_identifier : String
        )
        end
      end


      struct DeleteCollaborationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConfiguredAudienceModelAssociationInput
        include JSON::Serializable

        # A unique identifier of the configured audience model association that you want to delete.

        @[JSON::Field(key: "configuredAudienceModelAssociationIdentifier")]
        getter configured_audience_model_association_identifier : String

        # A unique identifier of the membership that contains the audience model association that you want to
        # delete.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @configured_audience_model_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct DeleteConfiguredAudienceModelAssociationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConfiguredTableAnalysisRuleInput
        include JSON::Serializable

        # The analysis rule type to be deleted. Configured table analysis rules are uniquely identified by
        # their configured table identifier and analysis rule type.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The unique identifier for the configured table that the analysis rule applies to. Currently accepts
        # the configured table ID.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        def initialize(
          @analysis_rule_type : String,
          @configured_table_identifier : String
        )
        end
      end

      # An empty response that indicates a successful delete.

      struct DeleteConfiguredTableAnalysisRuleOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConfiguredTableAssociationAnalysisRuleInput
        include JSON::Serializable

        # The type of the analysis rule that you want to delete.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The identiﬁer for the conﬁgured table association that's related to the analysis rule that you want
        # to delete.

        @[JSON::Field(key: "configuredTableAssociationIdentifier")]
        getter configured_table_association_identifier : String

        # A unique identifier for the membership that the configured table association belongs to. Currently
        # accepts the membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @analysis_rule_type : String,
          @configured_table_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct DeleteConfiguredTableAssociationAnalysisRuleOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConfiguredTableAssociationInput
        include JSON::Serializable

        # The unique ID for the configured table association to be deleted. Currently accepts the configured
        # table ID.

        @[JSON::Field(key: "configuredTableAssociationIdentifier")]
        getter configured_table_association_identifier : String

        # A unique identifier for the membership that the configured table association belongs to. Currently
        # accepts the membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @configured_table_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct DeleteConfiguredTableAssociationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConfiguredTableInput
        include JSON::Serializable

        # The unique ID for the configured table to delete.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        def initialize(
          @configured_table_identifier : String
        )
        end
      end

      # The empty output for a successful deletion.

      struct DeleteConfiguredTableOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteIdMappingTableInput
        include JSON::Serializable

        # The unique identifier of the ID mapping table that you want to delete.

        @[JSON::Field(key: "idMappingTableIdentifier")]
        getter id_mapping_table_identifier : String

        # The unique identifier of the membership that contains the ID mapping table that you want to delete.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @id_mapping_table_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct DeleteIdMappingTableOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteIdNamespaceAssociationInput
        include JSON::Serializable

        # The unique identifier of the ID namespace association that you want to delete.

        @[JSON::Field(key: "idNamespaceAssociationIdentifier")]
        getter id_namespace_association_identifier : String

        # The unique identifier of the membership that contains the ID namespace association that you want to
        # delete.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @id_namespace_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct DeleteIdNamespaceAssociationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMemberInput
        include JSON::Serializable

        # The account ID of the member to remove.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The unique identifier for the associated collaboration.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @account_id : String,
          @collaboration_identifier : String
        )
        end
      end


      struct DeleteMemberOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMembershipInput
        include JSON::Serializable

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @membership_identifier : String
        )
        end
      end


      struct DeleteMembershipOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePrivacyBudgetTemplateInput
        include JSON::Serializable

        # A unique identifier for one of your memberships for a collaboration. The privacy budget template is
        # deleted from the collaboration that this membership belongs to. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A unique identifier for your privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplateIdentifier")]
        getter privacy_budget_template_identifier : String

        def initialize(
          @membership_identifier : String,
          @privacy_budget_template_identifier : String
        )
        end
      end


      struct DeletePrivacyBudgetTemplateOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the name of the column that contains the unique identifier of your users, whose privacy
      # you want to protect.

      struct DifferentialPrivacyColumn
        include JSON::Serializable

        # The name of the column, such as user_id, that contains the unique identifier of your users, whose
        # privacy you want to protect. If you want to turn on differential privacy for two or more tables in a
        # collaboration, you must configure the same column as the user identifier column in both analysis
        # rules.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Specifies the unique identifier for your users.

      struct DifferentialPrivacyConfiguration
        include JSON::Serializable

        # The name of the column (such as user_id) that contains the unique identifier of your users whose
        # privacy you want to protect. If you want to turn on diﬀerential privacy for two or more tables in a
        # collaboration, you must conﬁgure the same column as the user identiﬁer column in both analysis
        # rules.

        @[JSON::Field(key: "columns")]
        getter columns : Array(Types::DifferentialPrivacyColumn)

        def initialize(
          @columns : Array(Types::DifferentialPrivacyColumn)
        )
        end
      end

      # An array that contains the sensitivity parameters.

      struct DifferentialPrivacyParameters
        include JSON::Serializable

        # Provides the sensitivity parameters that you can use to better understand the total amount of noise
        # in query results.

        @[JSON::Field(key: "sensitivityParameters")]
        getter sensitivity_parameters : Array(Types::DifferentialPrivacySensitivityParameters)

        def initialize(
          @sensitivity_parameters : Array(Types::DifferentialPrivacySensitivityParameters)
        )
        end
      end

      # Provides an estimate of the number of aggregation functions that the member who can query can run
      # given the epsilon and noise parameters.

      struct DifferentialPrivacyPreviewAggregation
        include JSON::Serializable

        # The maximum number of aggregations that the member who can query can run given the epsilon and noise
        # parameters.

        @[JSON::Field(key: "maxCount")]
        getter max_count : Int32

        # The type of aggregation function.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @max_count : Int32,
          @type : String
        )
        end
      end

      # The epsilon and noise parameters that you want to preview.

      struct DifferentialPrivacyPreviewParametersInput
        include JSON::Serializable

        # The epsilon value that you want to preview.

        @[JSON::Field(key: "epsilon")]
        getter epsilon : Int32

        # Noise added per query is measured in terms of the number of users whose contributions you want to
        # obscure. This value governs the rate at which the privacy budget is depleted.

        @[JSON::Field(key: "usersNoisePerQuery")]
        getter users_noise_per_query : Int32

        def initialize(
          @epsilon : Int32,
          @users_noise_per_query : Int32
        )
        end
      end

      # Specifies the configured epsilon value and the utility in terms of total aggregations, as well as
      # the remaining aggregations available.

      struct DifferentialPrivacyPrivacyBudget
        include JSON::Serializable

        # This information includes the configured epsilon value and the utility in terms of total
        # aggregations, as well as the remaining aggregations.

        @[JSON::Field(key: "aggregations")]
        getter aggregations : Array(Types::DifferentialPrivacyPrivacyBudgetAggregation)

        # The epsilon value that you configured.

        @[JSON::Field(key: "epsilon")]
        getter epsilon : Int32

        def initialize(
          @aggregations : Array(Types::DifferentialPrivacyPrivacyBudgetAggregation),
          @epsilon : Int32
        )
        end
      end

      # Information about the total number of aggregations, as well as the remaining aggregations.

      struct DifferentialPrivacyPrivacyBudgetAggregation
        include JSON::Serializable

        # The maximum number of aggregation functions that you can perform with the given privacy budget.

        @[JSON::Field(key: "maxCount")]
        getter max_count : Int32

        # The remaining number of aggregation functions that can be run with the available privacy budget.

        @[JSON::Field(key: "remainingCount")]
        getter remaining_count : Int32

        # The different types of aggregation functions that you can perform.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @max_count : Int32,
          @remaining_count : Int32,
          @type : String
        )
        end
      end

      # Information about the number of aggregation functions that the member who can query can run given
      # the epsilon and noise parameters.

      struct DifferentialPrivacyPrivacyImpact
        include JSON::Serializable

        # The number of aggregation functions that you can perform.

        @[JSON::Field(key: "aggregations")]
        getter aggregations : Array(Types::DifferentialPrivacyPreviewAggregation)

        def initialize(
          @aggregations : Array(Types::DifferentialPrivacyPreviewAggregation)
        )
        end
      end

      # Provides the sensitivity parameters.

      struct DifferentialPrivacySensitivityParameters
        include JSON::Serializable

        # The aggregation expression that was run.

        @[JSON::Field(key: "aggregationExpression")]
        getter aggregation_expression : String

        # The type of aggregation function that was run.

        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : String

        # The maximum number of rows contributed by a user in a SQL query.

        @[JSON::Field(key: "userContributionLimit")]
        getter user_contribution_limit : Int32

        # The upper bound of the aggregation expression.

        @[JSON::Field(key: "maxColumnValue")]
        getter max_column_value : Float64?

        # The lower bound of the aggregation expression.

        @[JSON::Field(key: "minColumnValue")]
        getter min_column_value : Float64?

        def initialize(
          @aggregation_expression : String,
          @aggregation_type : String,
          @user_contribution_limit : Int32,
          @max_column_value : Float64? = nil,
          @min_column_value : Float64? = nil
        )
        end
      end

      # The epsilon and noise parameter values that you want to use for the differential privacy template.

      struct DifferentialPrivacyTemplateParametersInput
        include JSON::Serializable

        # The epsilon value that you want to use.

        @[JSON::Field(key: "epsilon")]
        getter epsilon : Int32

        # Noise added per query is measured in terms of the number of users whose contributions you want to
        # obscure. This value governs the rate at which the privacy budget is depleted.

        @[JSON::Field(key: "usersNoisePerQuery")]
        getter users_noise_per_query : Int32

        def initialize(
          @epsilon : Int32,
          @users_noise_per_query : Int32
        )
        end
      end

      # The epsilon and noise parameter values that were used for the differential privacy template.

      struct DifferentialPrivacyTemplateParametersOutput
        include JSON::Serializable

        # The epsilon value that you specified.

        @[JSON::Field(key: "epsilon")]
        getter epsilon : Int32

        # Noise added per query is measured in terms of the number of users whose contributions you want to
        # obscure. This value governs the rate at which the privacy budget is depleted.

        @[JSON::Field(key: "usersNoisePerQuery")]
        getter users_noise_per_query : Int32

        def initialize(
          @epsilon : Int32,
          @users_noise_per_query : Int32
        )
        end
      end

      # The epsilon and noise parameter values that you want to update in the differential privacy template.

      struct DifferentialPrivacyTemplateUpdateParameters
        include JSON::Serializable

        # The updated epsilon value that you want to use.

        @[JSON::Field(key: "epsilon")]
        getter epsilon : Int32?

        # The updated value of noise added per query. It is measured in terms of the number of users whose
        # contributions you want to obscure. This value governs the rate at which the privacy budget is
        # depleted.

        @[JSON::Field(key: "usersNoisePerQuery")]
        getter users_noise_per_query : Int32?

        def initialize(
          @epsilon : Int32? = nil,
          @users_noise_per_query : Int32? = nil
        )
        end
      end

      # The direct analysis configuration details.

      struct DirectAnalysisConfigurationDetails
        include JSON::Serializable

        # The account IDs for the member who received the results of a protected query.

        @[JSON::Field(key: "receiverAccountIds")]
        getter receiver_account_ids : Array(String)?

        def initialize(
          @receiver_account_ids : Array(String)? = nil
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that defines the level of detail included in error messages returned by PySpark jobs.
      # This configuration allows you to control the verbosity of error messages to help with
      # troubleshooting PySpark jobs while maintaining appropriate security controls.

      struct ErrorMessageConfiguration
        include JSON::Serializable

        # The level of detail for error messages returned by the PySpark job. When set to DETAILED, error
        # messages include more information to help troubleshoot issues with your PySpark job. Because this
        # setting may expose sensitive data, it is recommended for development and testing environments.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end


      struct GetAnalysisTemplateInput
        include JSON::Serializable

        # The identifier for the analysis template resource.

        @[JSON::Field(key: "analysisTemplateIdentifier")]
        getter analysis_template_identifier : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @analysis_template_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct GetAnalysisTemplateOutput
        include JSON::Serializable

        # The analysis template.

        @[JSON::Field(key: "analysisTemplate")]
        getter analysis_template : Types::AnalysisTemplate

        def initialize(
          @analysis_template : Types::AnalysisTemplate
        )
        end
      end


      struct GetCollaborationAnalysisTemplateInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the analysis template within a collaboration.

        @[JSON::Field(key: "analysisTemplateArn")]
        getter analysis_template_arn : String

        # A unique identifier for the collaboration that the analysis templates belong to. Currently accepts
        # collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @analysis_template_arn : String,
          @collaboration_identifier : String
        )
        end
      end


      struct GetCollaborationAnalysisTemplateOutput
        include JSON::Serializable

        # The analysis template within a collaboration.

        @[JSON::Field(key: "collaborationAnalysisTemplate")]
        getter collaboration_analysis_template : Types::CollaborationAnalysisTemplate

        def initialize(
          @collaboration_analysis_template : Types::CollaborationAnalysisTemplate
        )
        end
      end


      struct GetCollaborationChangeRequestInput
        include JSON::Serializable

        # A unique identifier for the change request to retrieve.

        @[JSON::Field(key: "changeRequestIdentifier")]
        getter change_request_identifier : String

        # The identifier of the collaboration that the change request is made against.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @change_request_identifier : String,
          @collaboration_identifier : String
        )
        end
      end


      struct GetCollaborationChangeRequestOutput
        include JSON::Serializable

        # The collaboration change request that was requested.

        @[JSON::Field(key: "collaborationChangeRequest")]
        getter collaboration_change_request : Types::CollaborationChangeRequest

        def initialize(
          @collaboration_change_request : Types::CollaborationChangeRequest
        )
        end
      end


      struct GetCollaborationConfiguredAudienceModelAssociationInput
        include JSON::Serializable

        # A unique identifier for the collaboration that the configured audience model association belongs to.
        # Accepts a collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # A unique identifier for the configured audience model association that you want to retrieve.

        @[JSON::Field(key: "configuredAudienceModelAssociationIdentifier")]
        getter configured_audience_model_association_identifier : String

        def initialize(
          @collaboration_identifier : String,
          @configured_audience_model_association_identifier : String
        )
        end
      end


      struct GetCollaborationConfiguredAudienceModelAssociationOutput
        include JSON::Serializable

        # The metadata of the configured audience model association.

        @[JSON::Field(key: "collaborationConfiguredAudienceModelAssociation")]
        getter collaboration_configured_audience_model_association : Types::CollaborationConfiguredAudienceModelAssociation

        def initialize(
          @collaboration_configured_audience_model_association : Types::CollaborationConfiguredAudienceModelAssociation
        )
        end
      end


      struct GetCollaborationIdNamespaceAssociationInput
        include JSON::Serializable

        # The unique identifier of the collaboration that contains the ID namespace association that you want
        # to retrieve.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The unique identifier of the ID namespace association that you want to retrieve.

        @[JSON::Field(key: "idNamespaceAssociationIdentifier")]
        getter id_namespace_association_identifier : String

        def initialize(
          @collaboration_identifier : String,
          @id_namespace_association_identifier : String
        )
        end
      end


      struct GetCollaborationIdNamespaceAssociationOutput
        include JSON::Serializable

        # The ID namespace association that you requested.

        @[JSON::Field(key: "collaborationIdNamespaceAssociation")]
        getter collaboration_id_namespace_association : Types::CollaborationIdNamespaceAssociation

        def initialize(
          @collaboration_id_namespace_association : Types::CollaborationIdNamespaceAssociation
        )
        end
      end


      struct GetCollaborationInput
        include JSON::Serializable

        # The identifier for the collaboration.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @collaboration_identifier : String
        )
        end
      end


      struct GetCollaborationOutput
        include JSON::Serializable

        # The entire collaboration for this identifier.

        @[JSON::Field(key: "collaboration")]
        getter collaboration : Types::Collaboration

        def initialize(
          @collaboration : Types::Collaboration
        )
        end
      end


      struct GetCollaborationPrivacyBudgetTemplateInput
        include JSON::Serializable

        # A unique identifier for one of your collaborations.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # A unique identifier for one of your privacy budget templates.

        @[JSON::Field(key: "privacyBudgetTemplateIdentifier")]
        getter privacy_budget_template_identifier : String

        def initialize(
          @collaboration_identifier : String,
          @privacy_budget_template_identifier : String
        )
        end
      end


      struct GetCollaborationPrivacyBudgetTemplateOutput
        include JSON::Serializable

        # Returns the details of the privacy budget template that you requested.

        @[JSON::Field(key: "collaborationPrivacyBudgetTemplate")]
        getter collaboration_privacy_budget_template : Types::CollaborationPrivacyBudgetTemplate

        def initialize(
          @collaboration_privacy_budget_template : Types::CollaborationPrivacyBudgetTemplate
        )
        end
      end


      struct GetConfiguredAudienceModelAssociationInput
        include JSON::Serializable

        # A unique identifier for the configured audience model association that you want to retrieve.

        @[JSON::Field(key: "configuredAudienceModelAssociationIdentifier")]
        getter configured_audience_model_association_identifier : String

        # A unique identifier for the membership that contains the configured audience model association that
        # you want to retrieve.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @configured_audience_model_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct GetConfiguredAudienceModelAssociationOutput
        include JSON::Serializable

        # Information about the configured audience model association that you requested.

        @[JSON::Field(key: "configuredAudienceModelAssociation")]
        getter configured_audience_model_association : Types::ConfiguredAudienceModelAssociation

        def initialize(
          @configured_audience_model_association : Types::ConfiguredAudienceModelAssociation
        )
        end
      end


      struct GetConfiguredTableAnalysisRuleInput
        include JSON::Serializable

        # The analysis rule to be retrieved. Configured table analysis rules are uniquely identified by their
        # configured table identifier and analysis rule type.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The unique identifier for the configured table to retrieve. Currently accepts the configured table
        # ID.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        def initialize(
          @analysis_rule_type : String,
          @configured_table_identifier : String
        )
        end
      end


      struct GetConfiguredTableAnalysisRuleOutput
        include JSON::Serializable

        # The entire analysis rule output.

        @[JSON::Field(key: "analysisRule")]
        getter analysis_rule : Types::ConfiguredTableAnalysisRule

        def initialize(
          @analysis_rule : Types::ConfiguredTableAnalysisRule
        )
        end
      end


      struct GetConfiguredTableAssociationAnalysisRuleInput
        include JSON::Serializable

        # The type of analysis rule that you want to retrieve.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The identiﬁer for the conﬁgured table association that's related to the analysis rule.

        @[JSON::Field(key: "configuredTableAssociationIdentifier")]
        getter configured_table_association_identifier : String

        # A unique identifier for the membership that the configured table association belongs to. Currently
        # accepts the membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @analysis_rule_type : String,
          @configured_table_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct GetConfiguredTableAssociationAnalysisRuleOutput
        include JSON::Serializable

        # The analysis rule for the conﬁgured table association. In the console, the
        # ConfiguredTableAssociationAnalysisRule is referred to as the collaboration analysis rule .

        @[JSON::Field(key: "analysisRule")]
        getter analysis_rule : Types::ConfiguredTableAssociationAnalysisRule

        def initialize(
          @analysis_rule : Types::ConfiguredTableAssociationAnalysisRule
        )
        end
      end


      struct GetConfiguredTableAssociationInput
        include JSON::Serializable

        # The unique ID for the configured table association to retrieve. Currently accepts the configured
        # table ID.

        @[JSON::Field(key: "configuredTableAssociationIdentifier")]
        getter configured_table_association_identifier : String

        # A unique identifier for the membership that the configured table association belongs to. Currently
        # accepts the membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @configured_table_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct GetConfiguredTableAssociationOutput
        include JSON::Serializable

        # The entire configured table association object.

        @[JSON::Field(key: "configuredTableAssociation")]
        getter configured_table_association : Types::ConfiguredTableAssociation

        def initialize(
          @configured_table_association : Types::ConfiguredTableAssociation
        )
        end
      end


      struct GetConfiguredTableInput
        include JSON::Serializable

        # The unique ID for the configured table to retrieve.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        def initialize(
          @configured_table_identifier : String
        )
        end
      end


      struct GetConfiguredTableOutput
        include JSON::Serializable

        # The retrieved configured table.

        @[JSON::Field(key: "configuredTable")]
        getter configured_table : Types::ConfiguredTable

        def initialize(
          @configured_table : Types::ConfiguredTable
        )
        end
      end


      struct GetIdMappingTableInput
        include JSON::Serializable

        # The unique identifier of the ID mapping table identifier that you want to retrieve.

        @[JSON::Field(key: "idMappingTableIdentifier")]
        getter id_mapping_table_identifier : String

        # The unique identifier of the membership that contains the ID mapping table that you want to
        # retrieve.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @id_mapping_table_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct GetIdMappingTableOutput
        include JSON::Serializable

        # The ID mapping table that you requested.

        @[JSON::Field(key: "idMappingTable")]
        getter id_mapping_table : Types::IdMappingTable

        def initialize(
          @id_mapping_table : Types::IdMappingTable
        )
        end
      end


      struct GetIdNamespaceAssociationInput
        include JSON::Serializable

        # The unique identifier of the ID namespace association that you want to retrieve.

        @[JSON::Field(key: "idNamespaceAssociationIdentifier")]
        getter id_namespace_association_identifier : String

        # The unique identifier of the membership that contains the ID namespace association that you want to
        # retrieve.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @id_namespace_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct GetIdNamespaceAssociationOutput
        include JSON::Serializable

        # The ID namespace association that you requested.

        @[JSON::Field(key: "idNamespaceAssociation")]
        getter id_namespace_association : Types::IdNamespaceAssociation

        def initialize(
          @id_namespace_association : Types::IdNamespaceAssociation
        )
        end
      end


      struct GetMembershipInput
        include JSON::Serializable

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @membership_identifier : String
        )
        end
      end


      struct GetMembershipOutput
        include JSON::Serializable

        # The membership retrieved for the provided identifier.

        @[JSON::Field(key: "membership")]
        getter membership : Types::Membership

        def initialize(
          @membership : Types::Membership
        )
        end
      end


      struct GetPrivacyBudgetTemplateInput
        include JSON::Serializable

        # A unique identifier for one of your memberships for a collaboration. The privacy budget template is
        # retrieved from the collaboration that this membership belongs to. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A unique identifier for your privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplateIdentifier")]
        getter privacy_budget_template_identifier : String

        def initialize(
          @membership_identifier : String,
          @privacy_budget_template_identifier : String
        )
        end
      end


      struct GetPrivacyBudgetTemplateOutput
        include JSON::Serializable

        # Returns the details of the privacy budget template that you requested.

        @[JSON::Field(key: "privacyBudgetTemplate")]
        getter privacy_budget_template : Types::PrivacyBudgetTemplate

        def initialize(
          @privacy_budget_template : Types::PrivacyBudgetTemplate
        )
        end
      end


      struct GetProtectedJobInput
        include JSON::Serializable

        # The identifier for a membership in a protected job instance.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The identifier for the protected job instance.

        @[JSON::Field(key: "protectedJobIdentifier")]
        getter protected_job_identifier : String

        def initialize(
          @membership_identifier : String,
          @protected_job_identifier : String
        )
        end
      end


      struct GetProtectedJobOutput
        include JSON::Serializable

        # The protected job metadata.

        @[JSON::Field(key: "protectedJob")]
        getter protected_job : Types::ProtectedJob

        def initialize(
          @protected_job : Types::ProtectedJob
        )
        end
      end


      struct GetProtectedQueryInput
        include JSON::Serializable

        # The identifier for a membership in a protected query instance.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The identifier for a protected query instance.

        @[JSON::Field(key: "protectedQueryIdentifier")]
        getter protected_query_identifier : String

        def initialize(
          @membership_identifier : String,
          @protected_query_identifier : String
        )
        end
      end


      struct GetProtectedQueryOutput
        include JSON::Serializable

        # The query processing metadata.

        @[JSON::Field(key: "protectedQuery")]
        getter protected_query : Types::ProtectedQuery

        def initialize(
          @protected_query : Types::ProtectedQuery
        )
        end
      end


      struct GetSchemaAnalysisRuleInput
        include JSON::Serializable

        # A unique identifier for the collaboration that the schema belongs to. Currently accepts a
        # collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The name of the schema to retrieve the analysis rule for.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the schema analysis rule to retrieve. Schema analysis rules are uniquely identified by a
        # combination of the collaboration, the schema name, and their type.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @collaboration_identifier : String,
          @name : String,
          @type : String
        )
        end
      end


      struct GetSchemaAnalysisRuleOutput
        include JSON::Serializable

        # A specification about how data from the configured table can be used.

        @[JSON::Field(key: "analysisRule")]
        getter analysis_rule : Types::AnalysisRule

        def initialize(
          @analysis_rule : Types::AnalysisRule
        )
        end
      end


      struct GetSchemaInput
        include JSON::Serializable

        # A unique identifier for the collaboration that the schema belongs to. Currently accepts a
        # collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The name of the relation to retrieve the schema for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @collaboration_identifier : String,
          @name : String
        )
        end
      end


      struct GetSchemaOutput
        include JSON::Serializable

        # The entire schema object.

        @[JSON::Field(key: "schema")]
        getter schema : Types::Schema

        def initialize(
          @schema : Types::Schema
        )
        end
      end

      # A reference to a table within an Glue data catalog.

      struct GlueTableReference
        include JSON::Serializable

        # The name of the database the Glue table belongs to.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The name of the Glue table.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The Amazon Web Services Region where the Glue table is located. This parameter is required to
        # uniquely identify and access tables across different Regions.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @database_name : String,
          @table_name : String,
          @region : String? = nil
        )
        end
      end

      # Hash

      struct Hash
        include JSON::Serializable

        # The SHA-256 hash value.

        @[JSON::Field(key: "sha256")]
        getter sha256 : String?

        def initialize(
          @sha256 : String? = nil
        )
        end
      end

      # The configuration settings for the ID mapping table.

      struct IdMappingConfig
        include JSON::Serializable

        # An indicator as to whether you can use your column as a dimension column in the ID mapping table (
        # TRUE ) or not ( FALSE ). Default is FALSE .

        @[JSON::Field(key: "allowUseAsDimensionColumn")]
        getter allow_use_as_dimension_column : Bool

        def initialize(
          @allow_use_as_dimension_column : Bool
        )
        end
      end

      # Describes information about the ID mapping table.

      struct IdMappingTable
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ID mapping table.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains this ID mapping table.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains this ID mapping table.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the ID mapping table was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the ID mapping table.

        @[JSON::Field(key: "id")]
        getter id : String

        # The input reference configuration for the ID mapping table.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdMappingTableInputReferenceConfig

        # The input reference properties for the ID mapping table.

        @[JSON::Field(key: "inputReferenceProperties")]
        getter input_reference_properties : Types::IdMappingTableInputReferenceProperties

        # The Amazon Resource Name (ARN) of the membership resource for the ID mapping table.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique identifier of the membership resource for the ID mapping table.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the ID mapping table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the ID mapping table was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the ID mapping table.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services KMS key.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @input_reference_config : Types::IdMappingTableInputReferenceConfig,
          @input_reference_properties : Types::IdMappingTableInputReferenceProperties,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Provides the input reference configuration for the ID mapping table.

      struct IdMappingTableInputReferenceConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the referenced resource in Entity Resolution. Valid values are ID
        # mapping workflow ARNs.

        @[JSON::Field(key: "inputReferenceArn")]
        getter input_reference_arn : String

        # When TRUE , Clean Rooms manages permissions for the ID mapping table resource. When FALSE , the
        # resource owner manages permissions for the ID mapping table resource.

        @[JSON::Field(key: "manageResourcePolicies")]
        getter manage_resource_policies : Bool

        def initialize(
          @input_reference_arn : String,
          @manage_resource_policies : Bool
        )
        end
      end

      # The input reference properties for the ID mapping table.

      struct IdMappingTableInputReferenceProperties
        include JSON::Serializable

        # The input source of the ID mapping table.

        @[JSON::Field(key: "idMappingTableInputSource")]
        getter id_mapping_table_input_source : Array(Types::IdMappingTableInputSource)

        def initialize(
          @id_mapping_table_input_source : Array(Types::IdMappingTableInputSource)
        )
        end
      end

      # The input source of the ID mapping table.

      struct IdMappingTableInputSource
        include JSON::Serializable

        # The unique identifier of the ID namespace association.

        @[JSON::Field(key: "idNamespaceAssociationId")]
        getter id_namespace_association_id : String

        # The type of the input source of the ID mapping table.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @id_namespace_association_id : String,
          @type : String
        )
        end
      end

      # Additional properties that are specific to the type of the associated schema.

      struct IdMappingTableSchemaTypeProperties
        include JSON::Serializable

        # Defines which ID namespace associations are used to create the ID mapping table.

        @[JSON::Field(key: "idMappingTableInputSource")]
        getter id_mapping_table_input_source : Array(Types::IdMappingTableInputSource)

        def initialize(
          @id_mapping_table_input_source : Array(Types::IdMappingTableInputSource)
        )
        end
      end

      # Detailed information about the ID mapping table.

      struct IdMappingTableSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this ID mapping table.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains this ID mapping table.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains this ID mapping table.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which this ID mapping table was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of this ID mapping table.

        @[JSON::Field(key: "id")]
        getter id : String

        # The input reference configuration for the ID mapping table.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdMappingTableInputReferenceConfig

        # The Amazon Resource Name (ARN) of the membership resource for this ID mapping table.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique identifier of the membership resource for this ID mapping table.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of this ID mapping table.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which this ID mapping table was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of this ID mapping table.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @input_reference_config : Types::IdMappingTableInputReferenceConfig,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Provides information to create the ID namespace association.

      struct IdNamespaceAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ID namespace association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains this ID namespace association.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains this ID namespace association.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the ID namespace association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier for this ID namespace association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The input reference configuration for the ID namespace association.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig

        # The input reference properties for the ID namespace association.

        @[JSON::Field(key: "inputReferenceProperties")]
        getter input_reference_properties : Types::IdNamespaceAssociationInputReferenceProperties

        # The Amazon Resource Name (ARN) of the membership resource for this ID namespace association.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique identifier of the membership resource for this ID namespace association.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of this ID namespace association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the ID namespace association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the ID namespace association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration settings for the ID mapping table.

        @[JSON::Field(key: "idMappingConfig")]
        getter id_mapping_config : Types::IdMappingConfig?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig,
          @input_reference_properties : Types::IdNamespaceAssociationInputReferenceProperties,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil,
          @id_mapping_config : Types::IdMappingConfig? = nil
        )
        end
      end

      # Provides the information for the ID namespace association input reference configuration.

      struct IdNamespaceAssociationInputReferenceConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Entity Resolution resource that is being associated to the
        # collaboration. Valid resource ARNs are from the ID namespaces that you own.

        @[JSON::Field(key: "inputReferenceArn")]
        getter input_reference_arn : String

        # When TRUE , Clean Rooms manages permissions for the ID namespace association resource. When FALSE ,
        # the resource owner manages permissions for the ID namespace association resource.

        @[JSON::Field(key: "manageResourcePolicies")]
        getter manage_resource_policies : Bool

        def initialize(
          @input_reference_arn : String,
          @manage_resource_policies : Bool
        )
        end
      end

      # Provides the information for the ID namespace association input reference properties.

      struct IdNamespaceAssociationInputReferenceProperties
        include JSON::Serializable

        # Defines how ID mapping workflows are supported for this ID namespace association.

        @[JSON::Field(key: "idMappingWorkflowsSupported")]
        getter id_mapping_workflows_supported : Array(Types::Document)

        # The ID namespace type for this ID namespace association.

        @[JSON::Field(key: "idNamespaceType")]
        getter id_namespace_type : String

        def initialize(
          @id_mapping_workflows_supported : Array(Types::Document),
          @id_namespace_type : String
        )
        end
      end

      # Detailed information about the ID namespace association input reference properties.

      struct IdNamespaceAssociationInputReferencePropertiesSummary
        include JSON::Serializable

        # The ID namespace type for this ID namespace association.

        @[JSON::Field(key: "idNamespaceType")]
        getter id_namespace_type : String

        def initialize(
          @id_namespace_type : String
        )
        end
      end

      # Detailed information about the ID namespace association.

      struct IdNamespaceAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this ID namespace association.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the collaboration that contains this ID namespace association.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains this ID namespace association.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which this ID namespace association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of this ID namespace association.

        @[JSON::Field(key: "id")]
        getter id : String

        # The input reference configuration details for this ID namespace association.

        @[JSON::Field(key: "inputReferenceConfig")]
        getter input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig

        # The input reference properties for this ID namespace association.

        @[JSON::Field(key: "inputReferenceProperties")]
        getter input_reference_properties : Types::IdNamespaceAssociationInputReferencePropertiesSummary

        # The Amazon Resource Name (ARN) of the membership resource for this ID namespace association.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique identifier of the membership resource for this ID namespace association.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The name of the ID namespace association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which this ID namespace association has been updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the ID namespace association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig,
          @input_reference_properties : Types::IdNamespaceAssociationInputReferencePropertiesSummary,
          @membership_arn : String,
          @membership_id : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Unexpected error during processing of request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing the collaboration member's payment responsibilities set by the collaboration
      # creator for query and job compute costs.

      struct JobComputePaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration creator has configured the collaboration member to pay for query
        # and job compute costs ( TRUE ) or has not configured the collaboration member to pay for query and
        # job compute costs ( FALSE ). Exactly one member can be configured to pay for query and job compute
        # costs. An error is returned if the collaboration creator sets a TRUE value for more than one member
        # in the collaboration. An error is returned if the collaboration creator sets a FALSE value for the
        # member who can run queries and jobs.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end


      struct ListAnalysisTemplatesInput
        include JSON::Serializable

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAnalysisTemplatesOutput
        include JSON::Serializable

        # Lists analysis template metadata.

        @[JSON::Field(key: "analysisTemplateSummaries")]
        getter analysis_template_summaries : Array(Types::AnalysisTemplateSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @analysis_template_summaries : Array(Types::AnalysisTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationAnalysisTemplatesInput
        include JSON::Serializable

        # A unique identifier for the collaboration that the analysis templates belong to. Currently accepts
        # collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationAnalysisTemplatesOutput
        include JSON::Serializable

        # The metadata of the analysis template within a collaboration.

        @[JSON::Field(key: "collaborationAnalysisTemplateSummaries")]
        getter collaboration_analysis_template_summaries : Array(Types::CollaborationAnalysisTemplateSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_analysis_template_summaries : Array(Types::CollaborationAnalysisTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationChangeRequestsInput
        include JSON::Serializable

        # The identifier of the collaboration that the change request is made against.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum number of results that are returned for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter to only return change requests with the specified status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListCollaborationChangeRequestsOutput
        include JSON::Serializable

        # The list of collaboration change request summaries.

        @[JSON::Field(key: "collaborationChangeRequestSummaries")]
        getter collaboration_change_request_summaries : Array(Types::CollaborationChangeRequestSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_change_request_summaries : Array(Types::CollaborationChangeRequestSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationConfiguredAudienceModelAssociationsInput
        include JSON::Serializable

        # A unique identifier for the collaboration that the configured audience model association belongs to.
        # Accepts a collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationConfiguredAudienceModelAssociationsOutput
        include JSON::Serializable

        # The metadata of the configured audience model association within a collaboration.

        @[JSON::Field(key: "collaborationConfiguredAudienceModelAssociationSummaries")]
        getter collaboration_configured_audience_model_association_summaries : Array(Types::CollaborationConfiguredAudienceModelAssociationSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_configured_audience_model_association_summaries : Array(Types::CollaborationConfiguredAudienceModelAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationIdNamespaceAssociationsInput
        include JSON::Serializable

        # The unique identifier of the collaboration that contains the ID namespace associations that you want
        # to retrieve.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum size of the results that is returned per call. Service chooses a default if it has not
        # been set. Service may return a nextToken even if the maximum results has not been met.&gt;

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationIdNamespaceAssociationsOutput
        include JSON::Serializable

        # The summary information of the collaboration ID namespace associations that you requested.

        @[JSON::Field(key: "collaborationIdNamespaceAssociationSummaries")]
        getter collaboration_id_namespace_association_summaries : Array(Types::CollaborationIdNamespaceAssociationSummary)

        # The token value provided to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_id_namespace_association_summaries : Array(Types::CollaborationIdNamespaceAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationPrivacyBudgetTemplatesInput
        include JSON::Serializable

        # A unique identifier for one of your collaborations.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationPrivacyBudgetTemplatesOutput
        include JSON::Serializable

        # An array that summarizes the collaboration privacy budget templates. The summary includes
        # collaboration information, creation information, the privacy budget type.

        @[JSON::Field(key: "collaborationPrivacyBudgetTemplateSummaries")]
        getter collaboration_privacy_budget_template_summaries : Array(Types::CollaborationPrivacyBudgetTemplateSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_privacy_budget_template_summaries : Array(Types::CollaborationPrivacyBudgetTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationPrivacyBudgetsInput
        include JSON::Serializable

        # A unique identifier for one of your collaborations.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # Specifies the type of the privacy budget.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # The Amazon Resource Name (ARN) of the Configured Table Association (ConfiguredTableAssociation) used
        # to filter privacy budgets.

        @[JSON::Field(key: "accessBudgetResourceArn")]
        getter access_budget_resource_arn : String?

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @privacy_budget_type : String,
          @access_budget_resource_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationPrivacyBudgetsOutput
        include JSON::Serializable

        # Summaries of the collaboration privacy budgets.

        @[JSON::Field(key: "collaborationPrivacyBudgetSummaries")]
        getter collaboration_privacy_budget_summaries : Array(Types::CollaborationPrivacyBudgetSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_privacy_budget_summaries : Array(Types::CollaborationPrivacyBudgetSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationsInput
        include JSON::Serializable

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The caller's status in a collaboration.

        @[JSON::Field(key: "memberStatus")]
        getter member_status : String?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @member_status : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationsOutput
        include JSON::Serializable

        # The list of collaborations.

        @[JSON::Field(key: "collaborationList")]
        getter collaboration_list : Array(Types::CollaborationSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_list : Array(Types::CollaborationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredAudienceModelAssociationsInput
        include JSON::Serializable

        # A unique identifier for a membership that contains the configured audience model associations that
        # you want to retrieve.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredAudienceModelAssociationsOutput
        include JSON::Serializable

        # Summaries of the configured audience model associations that you requested.

        @[JSON::Field(key: "configuredAudienceModelAssociationSummaries")]
        getter configured_audience_model_association_summaries : Array(Types::ConfiguredAudienceModelAssociationSummary)

        # The token value provided to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configured_audience_model_association_summaries : Array(Types::ConfiguredAudienceModelAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredTableAssociationsInput
        include JSON::Serializable

        # A unique identifier for the membership to list configured table associations for. Currently accepts
        # the membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredTableAssociationsOutput
        include JSON::Serializable

        # The retrieved list of configured table associations.

        @[JSON::Field(key: "configuredTableAssociationSummaries")]
        getter configured_table_association_summaries : Array(Types::ConfiguredTableAssociationSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configured_table_association_summaries : Array(Types::ConfiguredTableAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredTablesInput
        include JSON::Serializable

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredTablesOutput
        include JSON::Serializable

        # The configured tables listed by the request.

        @[JSON::Field(key: "configuredTableSummaries")]
        getter configured_table_summaries : Array(Types::ConfiguredTableSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configured_table_summaries : Array(Types::ConfiguredTableSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListIdMappingTablesInput
        include JSON::Serializable

        # The unique identifier of the membership that contains the ID mapping tables that you want to view.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum size of the results that is returned per call. Service chooses a default if it has not
        # been set. Service may return a nextToken even if the maximum results has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdMappingTablesOutput
        include JSON::Serializable

        # The summary information of the ID mapping tables that you requested.

        @[JSON::Field(key: "idMappingTableSummaries")]
        getter id_mapping_table_summaries : Array(Types::IdMappingTableSummary)

        # The token value provided to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id_mapping_table_summaries : Array(Types::IdMappingTableSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListIdNamespaceAssociationsInput
        include JSON::Serializable

        # The unique identifier of the membership that contains the ID namespace association that you want to
        # view.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum size of the results that is returned per call. Service chooses a default if it has not
        # been set. Service may return a nextToken even if the maximum results has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdNamespaceAssociationsOutput
        include JSON::Serializable

        # The summary information of the ID namespace associations that you requested.

        @[JSON::Field(key: "idNamespaceAssociationSummaries")]
        getter id_namespace_association_summaries : Array(Types::IdNamespaceAssociationSummary)

        # The token value provided to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id_namespace_association_summaries : Array(Types::IdNamespaceAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMembersInput
        include JSON::Serializable

        # The identifier of the collaboration in which the members are listed.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMembersOutput
        include JSON::Serializable

        # The list of members returned by the ListMembers operation.

        @[JSON::Field(key: "memberSummaries")]
        getter member_summaries : Array(Types::MemberSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @member_summaries : Array(Types::MemberSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMembershipsInput
        include JSON::Serializable

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter which will return only memberships in the specified status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListMembershipsOutput
        include JSON::Serializable

        # The list of memberships returned from the ListMemberships operation.

        @[JSON::Field(key: "membershipSummaries")]
        getter membership_summaries : Array(Types::MembershipSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_summaries : Array(Types::MembershipSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPrivacyBudgetTemplatesInput
        include JSON::Serializable

        # A unique identifier for one of your memberships for a collaboration. The privacy budget templates
        # are retrieved from the collaboration that this membership belongs to. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPrivacyBudgetTemplatesOutput
        include JSON::Serializable

        # An array that summarizes the privacy budget templates. The summary includes collaboration
        # information, creation information, and privacy budget type.

        @[JSON::Field(key: "privacyBudgetTemplateSummaries")]
        getter privacy_budget_template_summaries : Array(Types::PrivacyBudgetTemplateSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @privacy_budget_template_summaries : Array(Types::PrivacyBudgetTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPrivacyBudgetsInput
        include JSON::Serializable

        # A unique identifier for one of your memberships for a collaboration. The privacy budget is retrieved
        # from the collaboration that this membership belongs to. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The privacy budget type.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # The Amazon Resource Name (ARN) of the access budget resource to filter privacy budgets by.

        @[JSON::Field(key: "accessBudgetResourceArn")]
        getter access_budget_resource_arn : String?

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @privacy_budget_type : String,
          @access_budget_resource_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPrivacyBudgetsOutput
        include JSON::Serializable

        # An array that summarizes the privacy budgets. The summary includes collaboration information,
        # membership information, privacy budget template information, and privacy budget details.

        @[JSON::Field(key: "privacyBudgetSummaries")]
        getter privacy_budget_summaries : Array(Types::PrivacyBudgetSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @privacy_budget_summaries : Array(Types::PrivacyBudgetSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListProtectedJobsInput
        include JSON::Serializable

        # The identifier for the membership in the collaboration.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter on the status of the protected job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListProtectedJobsOutput
        include JSON::Serializable

        # A list of protected job summaries.

        @[JSON::Field(key: "protectedJobs")]
        getter protected_jobs : Array(Types::ProtectedJobSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @protected_jobs : Array(Types::ProtectedJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListProtectedQueriesInput
        include JSON::Serializable

        # The identifier for the membership in the collaboration.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A filter on the status of the protected query.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListProtectedQueriesOutput
        include JSON::Serializable

        # A list of protected queries.

        @[JSON::Field(key: "protectedQueries")]
        getter protected_queries : Array(Types::ProtectedQuerySummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @protected_queries : Array(Types::ProtectedQuerySummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemasInput
        include JSON::Serializable

        # A unique identifier for the collaboration that the schema belongs to. Currently accepts a
        # collaboration ID.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum number of results that are returned for an API request call. The service chooses a
        # default number if you don't set one. The service might return a `nextToken` even if the `maxResults`
        # value has not been met.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # If present, filter schemas by schema type.

        @[JSON::Field(key: "schemaType")]
        getter schema_type : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schema_type : String? = nil
        )
        end
      end


      struct ListSchemasOutput
        include JSON::Serializable

        # The retrieved list of schemas.

        @[JSON::Field(key: "schemaSummaries")]
        getter schema_summaries : Array(Types::SchemaSummary)

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @schema_summaries : Array(Types::SchemaSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource you want to list tags on.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # A map of objects specifying each key name and value.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # The ML member abilities for a collaboration member.

      struct MLMemberAbilities
        include JSON::Serializable

        # The custom ML member abilities for a collaboration member.

        @[JSON::Field(key: "customMLMemberAbilities")]
        getter custom_ml_member_abilities : Array(String)

        def initialize(
          @custom_ml_member_abilities : Array(String)
        )
        end
      end

      # An object representing the collaboration member's machine learning payment responsibilities set by
      # the collaboration creator.

      struct MLPaymentConfig
        include JSON::Serializable

        # The payment responsibilities accepted by the member for model inference.

        @[JSON::Field(key: "modelInference")]
        getter model_inference : Types::ModelInferencePaymentConfig?

        # The payment responsibilities accepted by the member for model training.

        @[JSON::Field(key: "modelTraining")]
        getter model_training : Types::ModelTrainingPaymentConfig?

        # The payment configuration for machine learning synthetic data generation.

        @[JSON::Field(key: "syntheticDataGeneration")]
        getter synthetic_data_generation : Types::SyntheticDataGenerationPaymentConfig?

        def initialize(
          @model_inference : Types::ModelInferencePaymentConfig? = nil,
          @model_training : Types::ModelTrainingPaymentConfig? = nil,
          @synthetic_data_generation : Types::SyntheticDataGenerationPaymentConfig? = nil
        )
        end
      end

      # Parameters that control the generation of synthetic data for machine learning, including privacy
      # settings and column classification details.

      struct MLSyntheticDataParameters
        include JSON::Serializable

        # Classification details for data columns that specify how each column should be treated during
        # synthetic data generation.

        @[JSON::Field(key: "columnClassification")]
        getter column_classification : Types::ColumnClassificationDetails

        # The epsilon value for differential privacy when generating synthetic data. Lower values provide
        # stronger privacy guarantees but may reduce data utility.

        @[JSON::Field(key: "epsilon")]
        getter epsilon : Float64

        # The maximum acceptable score for membership inference attack vulnerability. Synthetic data
        # generation fails if the score for the resulting data exceeds this threshold.

        @[JSON::Field(key: "maxMembershipInferenceAttackScore")]
        getter max_membership_inference_attack_score : Float64

        def initialize(
          @column_classification : Types::ColumnClassificationDetails,
          @epsilon : Float64,
          @max_membership_inference_attack_score : Float64
        )
        end
      end

      # Specifies changes to collaboration membership, including adding new members with their abilities and
      # display names.

      struct MemberChangeSpecification
        include JSON::Serializable

        # The Amazon Web Services account ID of the member to add to the collaboration.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The abilities granted to the collaboration member. These determine what actions the member can
        # perform within the collaboration. The following values are currently not supported: CAN_QUERY ,
        # CAN_RECEIVE_RESULTS, and CAN_RUN_JOB . Set the value of memberAbilities to [] to allow a member to
        # contribute data.

        @[JSON::Field(key: "memberAbilities")]
        getter member_abilities : Array(String)

        # Specifies the display name that will be shown for this member in the collaboration. While this field
        # is required when inviting new members, it becomes optional when modifying abilities of existing
        # collaboration members.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @account_id : String,
          @member_abilities : Array(String),
          @display_name : String? = nil
        )
        end
      end

      # Basic metadata used to construct a new member.

      struct MemberSpecification
        include JSON::Serializable

        # The identifier used to reference members of the collaboration. Currently only supports Amazon Web
        # Services account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The member's display name.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The abilities granted to the collaboration member.

        @[JSON::Field(key: "memberAbilities")]
        getter member_abilities : Array(String)

        # The ML abilities granted to the collaboration member.

        @[JSON::Field(key: "mlMemberAbilities")]
        getter ml_member_abilities : Types::MLMemberAbilities?

        # The collaboration member's payment responsibilities set by the collaboration creator. If the
        # collaboration creator hasn't speciﬁed anyone as the member paying for query compute costs, then the
        # member who can query is the default payer.

        @[JSON::Field(key: "paymentConfiguration")]
        getter payment_configuration : Types::PaymentConfiguration?

        def initialize(
          @account_id : String,
          @display_name : String,
          @member_abilities : Array(String),
          @ml_member_abilities : Types::MLMemberAbilities? = nil,
          @payment_configuration : Types::PaymentConfiguration? = nil
        )
        end
      end

      # The member object listed by the request.

      struct MemberSummary
        include JSON::Serializable

        # The abilities granted to the collaboration member.

        @[JSON::Field(key: "abilities")]
        getter abilities : Array(String)

        # The identifier used to reference members of the collaboration. Currently only supports Amazon Web
        # Services account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The time when the member was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The member's display name.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The collaboration member's payment responsibilities set by the collaboration creator.

        @[JSON::Field(key: "paymentConfiguration")]
        getter payment_configuration : Types::PaymentConfiguration

        # The status of the member.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time the member metadata was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The unique ARN for the member's associated membership, if present.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String?

        # The unique ID for the member's associated membership, if present.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String?

        # Provides a summary of the ML abilities for the collaboration member.

        @[JSON::Field(key: "mlAbilities")]
        getter ml_abilities : Types::MLMemberAbilities?

        def initialize(
          @abilities : Array(String),
          @account_id : String,
          @create_time : Time,
          @display_name : String,
          @payment_configuration : Types::PaymentConfiguration,
          @status : String,
          @update_time : Time,
          @membership_arn : String? = nil,
          @membership_id : String? = nil,
          @ml_abilities : Types::MLMemberAbilities? = nil
        )
        end
      end

      # The membership object.

      struct Membership
        include JSON::Serializable

        # The unique ARN for the membership.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the membership's associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The identifier used to reference members of the collaboration. Currently only supports Amazon Web
        # Services account ID.

        @[JSON::Field(key: "collaborationCreatorAccountId")]
        getter collaboration_creator_account_id : String

        # The display name of the collaboration creator.

        @[JSON::Field(key: "collaborationCreatorDisplayName")]
        getter collaboration_creator_display_name : String

        # The unique ID for the membership's collaboration.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The name of the membership's collaboration.

        @[JSON::Field(key: "collaborationName")]
        getter collaboration_name : String

        # The time when the membership was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique ID of the membership.

        @[JSON::Field(key: "id")]
        getter id : String

        # The abilities granted to the collaboration member.

        @[JSON::Field(key: "memberAbilities")]
        getter member_abilities : Array(String)

        # The payment responsibilities accepted by the collaboration member.

        @[JSON::Field(key: "paymentConfiguration")]
        getter payment_configuration : Types::MembershipPaymentConfiguration

        # An indicator as to whether query logging has been enabled or disabled for the membership. When
        # ENABLED , Clean Rooms logs details about queries run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "queryLogStatus")]
        getter query_log_status : String

        # The status of the membership.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time the membership metadata was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The default job result configuration for the membership.

        @[JSON::Field(key: "defaultJobResultConfiguration")]
        getter default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration?

        # The default protected query result configuration as specified by the member who can receive results.

        @[JSON::Field(key: "defaultResultConfiguration")]
        getter default_result_configuration : Types::MembershipProtectedQueryResultConfiguration?

        # An indicator as to whether Amazon CloudWatch metrics are enabled for the membership. When true ,
        # metrics about query execution are collected in Amazon CloudWatch.

        @[JSON::Field(key: "isMetricsEnabled")]
        getter is_metrics_enabled : Bool?

        # An indicator as to whether job logging has been enabled or disabled for the collaboration. When
        # ENABLED , Clean Rooms logs details about jobs run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "jobLogStatus")]
        getter job_log_status : String?

        # Specifies the ML member abilities that are granted to a collaboration member.

        @[JSON::Field(key: "mlMemberAbilities")]
        getter ml_member_abilities : Types::MLMemberAbilities?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_creator_account_id : String,
          @collaboration_creator_display_name : String,
          @collaboration_id : String,
          @collaboration_name : String,
          @create_time : Time,
          @id : String,
          @member_abilities : Array(String),
          @payment_configuration : Types::MembershipPaymentConfiguration,
          @query_log_status : String,
          @status : String,
          @update_time : Time,
          @default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration? = nil,
          @default_result_configuration : Types::MembershipProtectedQueryResultConfiguration? = nil,
          @is_metrics_enabled : Bool? = nil,
          @job_log_status : String? = nil,
          @ml_member_abilities : Types::MLMemberAbilities? = nil
        )
        end
      end

      # An object representing the payment responsibilities accepted by the collaboration member for query
      # and job compute costs.

      struct MembershipJobComputePaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration member has accepted to pay for job compute costs ( TRUE ) or has
        # not accepted to pay for query and job compute costs ( FALSE ). There is only one member who pays for
        # queries and jobs. An error message is returned for the following reasons: If you set the value to
        # FALSE but you are responsible to pay for query and job compute costs. If you set the value to TRUE
        # but you are not responsible to pay for query and job compute costs.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # An object representing the collaboration member's machine learning payment responsibilities set by
      # the collaboration creator.

      struct MembershipMLPaymentConfig
        include JSON::Serializable

        # The payment responsibilities accepted by the member for model inference.

        @[JSON::Field(key: "modelInference")]
        getter model_inference : Types::MembershipModelInferencePaymentConfig?

        # The payment responsibilities accepted by the member for model training.

        @[JSON::Field(key: "modelTraining")]
        getter model_training : Types::MembershipModelTrainingPaymentConfig?

        # The payment configuration for synthetic data generation for this machine learning membership.

        @[JSON::Field(key: "syntheticDataGeneration")]
        getter synthetic_data_generation : Types::MembershipSyntheticDataGenerationPaymentConfig?

        def initialize(
          @model_inference : Types::MembershipModelInferencePaymentConfig? = nil,
          @model_training : Types::MembershipModelTrainingPaymentConfig? = nil,
          @synthetic_data_generation : Types::MembershipSyntheticDataGenerationPaymentConfig? = nil
        )
        end
      end

      # An object representing the collaboration member's model inference payment responsibilities set by
      # the collaboration creator.

      struct MembershipModelInferencePaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration member has accepted to pay for model inference costs ( TRUE ) or
        # has not accepted to pay for model inference costs ( FALSE ). If the collaboration creator has not
        # specified anyone to pay for model inference costs, then the member who can query is the default
        # payer. An error message is returned for the following reasons: If you set the value to FALSE but you
        # are responsible to pay for model inference costs. If you set the value to TRUE but you are not
        # responsible to pay for model inference costs.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # An object representing the collaboration member's model training payment responsibilities set by the
      # collaboration creator.

      struct MembershipModelTrainingPaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration member has accepted to pay for model training costs ( TRUE ) or
        # has not accepted to pay for model training costs ( FALSE ). If the collaboration creator has not
        # specified anyone to pay for model training costs, then the member who can query is the default
        # payer. An error message is returned for the following reasons: If you set the value to FALSE but you
        # are responsible to pay for model training costs. If you set the value to TRUE but you are not
        # responsible to pay for model training costs.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # An object representing the payment responsibilities accepted by the collaboration member.

      struct MembershipPaymentConfiguration
        include JSON::Serializable

        # The payment responsibilities accepted by the collaboration member for query compute costs.

        @[JSON::Field(key: "queryCompute")]
        getter query_compute : Types::MembershipQueryComputePaymentConfig

        # The payment responsibilities accepted by the collaboration member for job compute costs.

        @[JSON::Field(key: "jobCompute")]
        getter job_compute : Types::MembershipJobComputePaymentConfig?

        # The payment responsibilities accepted by the collaboration member for machine learning costs.

        @[JSON::Field(key: "machineLearning")]
        getter machine_learning : Types::MembershipMLPaymentConfig?

        def initialize(
          @query_compute : Types::MembershipQueryComputePaymentConfig,
          @job_compute : Types::MembershipJobComputePaymentConfig? = nil,
          @machine_learning : Types::MembershipMLPaymentConfig? = nil
        )
        end
      end

      # Contains configurations for protected job results.

      struct MembershipProtectedJobOutputConfiguration
        include JSON::Serializable

        # Contains the configuration to write the job results to S3.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedJobS3OutputConfigurationInput?

        def initialize(
          @s3 : Types::ProtectedJobS3OutputConfigurationInput? = nil
        )
        end
      end

      # Contains configurations for protected job results.

      struct MembershipProtectedJobResultConfiguration
        include JSON::Serializable

        # The output configuration for a protected job result.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::MembershipProtectedJobOutputConfiguration

        # The unique ARN for an IAM role that is used by Clean Rooms to write protected job results to the
        # result location, given by the member who can receive results.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @output_configuration : Types::MembershipProtectedJobOutputConfiguration,
          @role_arn : String
        )
        end
      end

      # Contains configurations for protected query results.

      struct MembershipProtectedQueryOutputConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedQueryS3OutputConfiguration?

        def initialize(
          @s3 : Types::ProtectedQueryS3OutputConfiguration? = nil
        )
        end
      end

      # Contains configurations for protected query results.

      struct MembershipProtectedQueryResultConfiguration
        include JSON::Serializable

        # Configuration for protected query results.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::MembershipProtectedQueryOutputConfiguration

        # The unique ARN for an IAM role that is used by Clean Rooms to write protected query results to the
        # result location, given by the member who can receive results.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @output_configuration : Types::MembershipProtectedQueryOutputConfiguration,
          @role_arn : String? = nil
        )
        end
      end

      # An object representing the payment responsibilities accepted by the collaboration member for query
      # compute costs.

      struct MembershipQueryComputePaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration member has accepted to pay for query compute costs ( TRUE ) or
        # has not accepted to pay for query compute costs ( FALSE ). If the collaboration creator has not
        # specified anyone to pay for query compute costs, then the member who can query is the default payer.
        # An error message is returned for the following reasons: If you set the value to FALSE but you are
        # responsible to pay for query compute costs. If you set the value to TRUE but you are not responsible
        # to pay for query compute costs.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # The membership object listed by the request.

      struct MembershipSummary
        include JSON::Serializable

        # The unique ARN for the membership.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The unique ARN for the membership's associated collaboration.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The identifier of the Amazon Web Services principal that created the collaboration. Currently only
        # supports Amazon Web Services account ID.

        @[JSON::Field(key: "collaborationCreatorAccountId")]
        getter collaboration_creator_account_id : String

        # The display name of the collaboration creator.

        @[JSON::Field(key: "collaborationCreatorDisplayName")]
        getter collaboration_creator_display_name : String

        # The unique ID for the membership's collaboration.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The name for the membership's collaboration.

        @[JSON::Field(key: "collaborationName")]
        getter collaboration_name : String

        # The time when the membership was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique ID for the membership's collaboration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The abilities granted to the collaboration member.

        @[JSON::Field(key: "memberAbilities")]
        getter member_abilities : Array(String)

        # The payment responsibilities accepted by the collaboration member.

        @[JSON::Field(key: "paymentConfiguration")]
        getter payment_configuration : Types::MembershipPaymentConfiguration

        # The status of the membership.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time the membership metadata was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # Provides a summary of the ML abilities for the collaboration member.

        @[JSON::Field(key: "mlMemberAbilities")]
        getter ml_member_abilities : Types::MLMemberAbilities?

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_creator_account_id : String,
          @collaboration_creator_display_name : String,
          @collaboration_id : String,
          @collaboration_name : String,
          @create_time : Time,
          @id : String,
          @member_abilities : Array(String),
          @payment_configuration : Types::MembershipPaymentConfiguration,
          @status : String,
          @update_time : Time,
          @ml_member_abilities : Types::MLMemberAbilities? = nil
        )
        end
      end

      # Configuration for payment for synthetic data generation in a membership.

      struct MembershipSyntheticDataGenerationPaymentConfig
        include JSON::Serializable

        # Indicates if this membership is responsible for paying for synthetic data generation.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # An object representing the collaboration member's model inference payment responsibilities set by
      # the collaboration creator.

      struct ModelInferencePaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration creator has configured the collaboration member to pay for model
        # inference costs ( TRUE ) or has not configured the collaboration member to pay for model inference
        # costs ( FALSE ). Exactly one member can be configured to pay for model inference costs. An error is
        # returned if the collaboration creator sets a TRUE value for more than one member in the
        # collaboration. If the collaboration creator hasn't specified anyone as the member paying for model
        # inference costs, then the member who can query is the default payer. An error is returned if the
        # collaboration creator sets a FALSE value for the member who can query.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # An object representing the collaboration member's model training payment responsibilities set by the
      # collaboration creator.

      struct ModelTrainingPaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration creator has configured the collaboration member to pay for model
        # training costs ( TRUE ) or has not configured the collaboration member to pay for model training
        # costs ( FALSE ). Exactly one member can be configured to pay for model training costs. An error is
        # returned if the collaboration creator sets a TRUE value for more than one member in the
        # collaboration. If the collaboration creator hasn't specified anyone as the member paying for model
        # training costs, then the member who can query is the default payer. An error is returned if the
        # collaboration creator sets a FALSE value for the member who can query.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # An object representing the collaboration member's payment responsibilities set by the collaboration
      # creator.

      struct PaymentConfiguration
        include JSON::Serializable

        # The collaboration member's payment responsibilities set by the collaboration creator for query
        # compute costs.

        @[JSON::Field(key: "queryCompute")]
        getter query_compute : Types::QueryComputePaymentConfig

        # The compute configuration for the job.

        @[JSON::Field(key: "jobCompute")]
        getter job_compute : Types::JobComputePaymentConfig?

        # An object representing the collaboration member's machine learning payment responsibilities set by
        # the collaboration creator.

        @[JSON::Field(key: "machineLearning")]
        getter machine_learning : Types::MLPaymentConfig?

        def initialize(
          @query_compute : Types::QueryComputePaymentConfig,
          @job_compute : Types::JobComputePaymentConfig? = nil,
          @machine_learning : Types::MLPaymentConfig? = nil
        )
        end
      end


      struct PopulateIdMappingTableInput
        include JSON::Serializable

        # The unique identifier of the ID mapping table that you want to populate.

        @[JSON::Field(key: "idMappingTableIdentifier")]
        getter id_mapping_table_identifier : String

        # The unique identifier of the membership that contains the ID mapping table that you want to
        # populate.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The job type of the rule-based ID mapping job. Valid values include: INCREMENTAL : Processes only
        # new or changed data since the last job run. This is the default job type if the ID mapping workflow
        # was created in Entity Resolution with incrementalRunConfig specified. BATCH : Processes all data
        # from the input source, regardless of previous job runs. This is the default job type if the ID
        # mapping workflow was created in Entity Resolution but incrementalRunConfig wasn't specified.
        # DELETE_ONLY : Processes only deletion requests from BatchDeleteUniqueId , which is set in Entity
        # Resolution. For more information about incrementalRunConfig and BatchDeleteUniqueId , see the Entity
        # Resolution API Reference .

        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        def initialize(
          @id_mapping_table_identifier : String,
          @membership_identifier : String,
          @job_type : String? = nil
        )
        end
      end


      struct PopulateIdMappingTableOutput
        include JSON::Serializable

        # The unique identifier of the mapping job that will populate the ID mapping table.

        @[JSON::Field(key: "idMappingJobId")]
        getter id_mapping_job_id : String

        def initialize(
          @id_mapping_job_id : String
        )
        end
      end


      struct PreviewPrivacyImpactInput
        include JSON::Serializable

        # A unique identifier for one of your memberships for a collaboration. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # Specifies the desired epsilon and noise parameters to preview.

        @[JSON::Field(key: "parameters")]
        getter parameters : Types::PreviewPrivacyImpactParametersInput

        def initialize(
          @membership_identifier : String,
          @parameters : Types::PreviewPrivacyImpactParametersInput
        )
        end
      end


      struct PreviewPrivacyImpactOutput
        include JSON::Serializable

        # An estimate of the number of aggregation functions that the member who can query can run given the
        # epsilon and noise parameters. This does not change the privacy budget.

        @[JSON::Field(key: "privacyImpact")]
        getter privacy_impact : Types::PrivacyImpact

        def initialize(
          @privacy_impact : Types::PrivacyImpact
        )
        end
      end

      # Specifies the updated epsilon and noise parameters to preview. The preview allows you to see how the
      # maximum number of each type of aggregation function would change with the new parameters.

      struct PreviewPrivacyImpactParametersInput
        include JSON::Serializable

        # An array that specifies the epsilon and noise parameters.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyPreviewParametersInput?

        def initialize(
          @differential_privacy : Types::DifferentialPrivacyPreviewParametersInput? = nil
        )
        end
      end

      # The epsilon parameter value and number of each aggregation function that you can perform.

      struct PrivacyBudget
        include JSON::Serializable

        # Access budget information associated with this privacy budget.

        @[JSON::Field(key: "accessBudget")]
        getter access_budget : Types::AccessBudget?

        # An object that specifies the epsilon parameter and the utility in terms of total aggregations, as
        # well as the remaining aggregations available.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyPrivacyBudget?

        def initialize(
          @access_budget : Types::AccessBudget? = nil,
          @differential_privacy : Types::DifferentialPrivacyPrivacyBudget? = nil
        )
        end
      end

      # An array that summaries the specified privacy budget. This summary includes collaboration
      # information, creation information, membership information, and privacy budget information.

      struct PrivacyBudgetSummary
        include JSON::Serializable

        # The provided privacy budget.

        @[JSON::Field(key: "budget")]
        getter budget : Types::PrivacyBudget

        # The ARN of the collaboration that contains this privacy budget.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique identifier of the collaboration that contains this privacy budget.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the privacy budget was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the privacy budget.

        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the member who created the privacy budget summary.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The ARN of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplateArn")]
        getter privacy_budget_template_arn : String

        # The unique identifier of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplateId")]
        getter privacy_budget_template_id : String

        # Specifies the type of the privacy budget.

        @[JSON::Field(key: "type")]
        getter type : String

        # The most recent time at which the privacy budget was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @budget : Types::PrivacyBudget,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @privacy_budget_template_arn : String,
          @privacy_budget_template_id : String,
          @type : String,
          @update_time : Time
        )
        end
      end

      # An object that defines the privacy budget template.

      struct PrivacyBudgetTemplate
        include JSON::Serializable

        # The ARN of the privacy budget template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # How often the privacy budget refreshes. If you plan to regularly bring new data into the
        # collaboration, use CALENDAR_MONTH to automatically get a new privacy budget for the collaboration
        # every calendar month. Choosing this option allows arbitrary amounts of information to be revealed
        # about rows of the data when repeatedly queried across refreshes. Avoid choosing this if the same
        # rows will be repeatedly queried between privacy budget refreshes.

        @[JSON::Field(key: "autoRefresh")]
        getter auto_refresh : String

        # The ARN of the collaboration that contains this privacy budget template.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique ID of the collaboration that contains this privacy budget template.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the privacy budget template was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the privacy budget template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the member who created the privacy budget template.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # Specifies the epsilon and noise parameters for the privacy budget template.

        @[JSON::Field(key: "parameters")]
        getter parameters : Types::PrivacyBudgetTemplateParametersOutput

        # Specifies the type of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # The most recent time at which the privacy budget template was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @arn : String,
          @auto_refresh : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @parameters : Types::PrivacyBudgetTemplateParametersOutput,
          @privacy_budget_type : String,
          @update_time : Time
        )
        end
      end

      # The epsilon and noise parameters that you want to use for the privacy budget template.

      struct PrivacyBudgetTemplateParametersInput
        include JSON::Serializable

        # Access budget configuration for the privacy budget template input, enabling integration with access
        # budget functionality.

        @[JSON::Field(key: "accessBudget")]
        getter access_budget : Types::AccessBudgetsPrivacyTemplateParametersInput?

        # An object that specifies the epsilon and noise parameters.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyTemplateParametersInput?

        def initialize(
          @access_budget : Types::AccessBudgetsPrivacyTemplateParametersInput? = nil,
          @differential_privacy : Types::DifferentialPrivacyTemplateParametersInput? = nil
        )
        end
      end

      # The epsilon and noise parameters that were used in the privacy budget template.

      struct PrivacyBudgetTemplateParametersOutput
        include JSON::Serializable

        # Access budget configuration returned from the privacy budget template, containing the configured
        # access budget settings.

        @[JSON::Field(key: "accessBudget")]
        getter access_budget : Types::AccessBudgetsPrivacyTemplateParametersOutput?

        # The epsilon and noise parameters.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyTemplateParametersOutput?

        def initialize(
          @access_budget : Types::AccessBudgetsPrivacyTemplateParametersOutput? = nil,
          @differential_privacy : Types::DifferentialPrivacyTemplateParametersOutput? = nil
        )
        end
      end

      # A summary of the privacy budget template. The summary includes membership information, collaboration
      # information, and creation information.

      struct PrivacyBudgetTemplateSummary
        include JSON::Serializable

        # The ARN of the privacy budget template.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ARN of the collaboration that contains this privacy budget template.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique ID of the collaboration that contains this privacy budget template.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time at which the privacy budget template was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique identifier of the privacy budget template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon Resource Name (ARN) of the member who created the privacy budget template.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The type of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # The most recent time at which the privacy budget template was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @arn : String,
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @privacy_budget_type : String,
          @update_time : Time
        )
        end
      end

      # The epsilon and noise parameters that you want to update in the privacy budget template.

      struct PrivacyBudgetTemplateUpdateParameters
        include JSON::Serializable

        # The new access budget configuration that completely replaces the existing access budget settings in
        # the privacy budget template.

        @[JSON::Field(key: "accessBudget")]
        getter access_budget : Types::AccessBudgetsPrivacyTemplateUpdateParameters?

        # An object that specifies the new values for the epsilon and noise parameters.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyTemplateUpdateParameters?

        def initialize(
          @access_budget : Types::AccessBudgetsPrivacyTemplateUpdateParameters? = nil,
          @differential_privacy : Types::DifferentialPrivacyTemplateUpdateParameters? = nil
        )
        end
      end

      # Provides an estimate of the number of aggregation functions that the member who can query can run
      # given the epsilon and noise parameters.

      struct PrivacyImpact
        include JSON::Serializable

        # An object that lists the number and type of aggregation functions you can perform.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyPrivacyImpact?

        def initialize(
          @differential_privacy : Types::DifferentialPrivacyPrivacyImpact? = nil
        )
        end
      end

      # The parameters for an Clean Rooms protected job.

      struct ProtectedJob
        include JSON::Serializable

        # The creation time of the protected job.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier for a protected job instance.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of the membership.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # he identifier for the membership.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The status of the protected job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The compute configuration for the protected job.

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ProtectedJobComputeConfiguration?

        # The error from the protected job.

        @[JSON::Field(key: "error")]
        getter error : Types::ProtectedJobError?

        # The job parameters for the protected job.

        @[JSON::Field(key: "jobParameters")]
        getter job_parameters : Types::ProtectedJobParameters?

        # The result of the protected job.

        @[JSON::Field(key: "result")]
        getter result : Types::ProtectedJobResult?

        # Contains any details needed to write the job results.

        @[JSON::Field(key: "resultConfiguration")]
        getter result_configuration : Types::ProtectedJobResultConfigurationOutput?

        # The statistics of the protected job.

        @[JSON::Field(key: "statistics")]
        getter statistics : Types::ProtectedJobStatistics?

        def initialize(
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @status : String,
          @compute_configuration : Types::ProtectedJobComputeConfiguration? = nil,
          @error : Types::ProtectedJobError? = nil,
          @job_parameters : Types::ProtectedJobParameters? = nil,
          @result : Types::ProtectedJobResult? = nil,
          @result_configuration : Types::ProtectedJobResultConfigurationOutput? = nil,
          @statistics : Types::ProtectedJobStatistics? = nil
        )
        end
      end

      # The configuration of the compute resources for a PySpark job.

      struct ProtectedJobComputeConfiguration
        include JSON::Serializable

        # The worker configuration for the compute environment.

        @[JSON::Field(key: "worker")]
        getter worker : Types::ProtectedJobWorkerComputeConfiguration?

        def initialize(
          @worker : Types::ProtectedJobWorkerComputeConfiguration? = nil
        )
        end
      end

      # The protected job configuration details.

      struct ProtectedJobConfigurationDetails
        include JSON::Serializable

        # The details needed to configure the direct analysis.

        @[JSON::Field(key: "directAnalysisConfigurationDetails")]
        getter direct_analysis_configuration_details : Types::ProtectedJobDirectAnalysisConfigurationDetails?

        def initialize(
          @direct_analysis_configuration_details : Types::ProtectedJobDirectAnalysisConfigurationDetails? = nil
        )
        end
      end

      # The protected job direct analysis configuration details.

      struct ProtectedJobDirectAnalysisConfigurationDetails
        include JSON::Serializable

        # The receiver account IDs.

        @[JSON::Field(key: "receiverAccountIds")]
        getter receiver_account_ids : Array(String)?

        def initialize(
          @receiver_account_ids : Array(String)? = nil
        )
        end
      end

      # The protected job error.

      struct ProtectedJobError
        include JSON::Serializable

        # The error code for the protected job.

        @[JSON::Field(key: "code")]
        getter code : String

        # The message for the protected job error.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # The protected job member output configuration input.

      struct ProtectedJobMemberOutputConfigurationInput
        include JSON::Serializable

        # The account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # The protected job member output configuration output.

      struct ProtectedJobMemberOutputConfigurationOutput
        include JSON::Serializable

        # The account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Contains details about the protected job output.

      struct ProtectedJobOutput
        include JSON::Serializable

        # The list of member Amazon Web Services account(s) that received the results of the job.

        @[JSON::Field(key: "memberList")]
        getter member_list : Array(Types::ProtectedJobSingleMemberOutput)?

        # If present, the output for a protected job with an `S3` output type.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedJobS3Output?

        def initialize(
          @member_list : Array(Types::ProtectedJobSingleMemberOutput)? = nil,
          @s3 : Types::ProtectedJobS3Output? = nil
        )
        end
      end

      # The protected job output configuration input.

      struct ProtectedJobOutputConfigurationInput
        include JSON::Serializable

        # The member of the protected job output configuration input.

        @[JSON::Field(key: "member")]
        getter member : Types::ProtectedJobMemberOutputConfigurationInput?

        def initialize(
          @member : Types::ProtectedJobMemberOutputConfigurationInput? = nil
        )
        end
      end

      # The protected job output configuration output.

      struct ProtectedJobOutputConfigurationOutput
        include JSON::Serializable

        # The member output configuration for a protected job.

        @[JSON::Field(key: "member")]
        getter member : Types::ProtectedJobMemberOutputConfigurationOutput?

        # If present, the output for a protected job with an `S3` output type.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedJobS3OutputConfigurationOutput?

        def initialize(
          @member : Types::ProtectedJobMemberOutputConfigurationOutput? = nil,
          @s3 : Types::ProtectedJobS3OutputConfigurationOutput? = nil
        )
        end
      end

      # The parameters for the protected job.

      struct ProtectedJobParameters
        include JSON::Serializable

        # The ARN of the analysis template.

        @[JSON::Field(key: "analysisTemplateArn")]
        getter analysis_template_arn : String

        # Runtime configuration values passed to the PySpark analysis script. Parameter names and types must
        # match those defined in the analysis template.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @analysis_template_arn : String,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # The protected job receiver configuration.

      struct ProtectedJobReceiverConfiguration
        include JSON::Serializable

        # The analysis type for the protected job receiver configuration.

        @[JSON::Field(key: "analysisType")]
        getter analysis_type : String

        # The configuration details for the protected job receiver.

        @[JSON::Field(key: "configurationDetails")]
        getter configuration_details : Types::ProtectedJobConfigurationDetails?

        def initialize(
          @analysis_type : String,
          @configuration_details : Types::ProtectedJobConfigurationDetails? = nil
        )
        end
      end

      # Details about the job results.

      struct ProtectedJobResult
        include JSON::Serializable

        # The output of the protected job.

        @[JSON::Field(key: "output")]
        getter output : Types::ProtectedJobOutput

        def initialize(
          @output : Types::ProtectedJobOutput
        )
        end
      end

      # The protected job result configuration input.

      struct ProtectedJobResultConfigurationInput
        include JSON::Serializable

        # The output configuration for a protected job result.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::ProtectedJobOutputConfigurationInput

        def initialize(
          @output_configuration : Types::ProtectedJobOutputConfigurationInput
        )
        end
      end

      # The output configuration for a protected job result.

      struct ProtectedJobResultConfigurationOutput
        include JSON::Serializable

        # The output configuration.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::ProtectedJobOutputConfigurationOutput

        def initialize(
          @output_configuration : Types::ProtectedJobOutputConfigurationOutput
        )
        end
      end

      # Contains output information for protected jobs with an S3 output type.

      struct ProtectedJobS3Output
        include JSON::Serializable

        # The S3 location for the protected job output.

        @[JSON::Field(key: "location")]
        getter location : String

        def initialize(
          @location : String
        )
        end
      end

      # Contains input information for protected jobs with an S3 output type.

      struct ProtectedJobS3OutputConfigurationInput
        include JSON::Serializable

        # The S3 bucket for job output.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The S3 prefix to unload the protected job results.

        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String,
          @key_prefix : String? = nil
        )
        end
      end

      # The output configuration for a protected job's S3 output.

      struct ProtectedJobS3OutputConfigurationOutput
        include JSON::Serializable

        # The S3 bucket for job output.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The S3 prefix to unload the protected job results.

        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String,
          @key_prefix : String? = nil
        )
        end
      end

      # Details about the member who received the job result.

      struct ProtectedJobSingleMemberOutput
        include JSON::Serializable

        # The Amazon Web Services account ID of the member in the collaboration who can receive results from
        # analyses.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Contains statistics about the execution of the protected job.

      struct ProtectedJobStatistics
        include JSON::Serializable

        # The billed resource utilization for the protected job.

        @[JSON::Field(key: "billedResourceUtilization")]
        getter billed_resource_utilization : Types::BilledJobResourceUtilization?

        # The duration of the protected job, from creation until job completion, in milliseconds.

        @[JSON::Field(key: "totalDurationInMillis")]
        getter total_duration_in_millis : Int64?

        def initialize(
          @billed_resource_utilization : Types::BilledJobResourceUtilization? = nil,
          @total_duration_in_millis : Int64? = nil
        )
        end
      end

      # The protected job summary for the objects listed by the request.

      struct ProtectedJobSummary
        include JSON::Serializable

        # The time the protected job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The ID of the protected job.

        @[JSON::Field(key: "id")]
        getter id : String

        # The unique ARN for the membership that initiated the protected job.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique ID for the membership that initiated the protected job.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The receiver configurations for the protected job.

        @[JSON::Field(key: "receiverConfigurations")]
        getter receiver_configurations : Array(Types::ProtectedJobReceiverConfiguration)

        # The status of the protected job.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @receiver_configurations : Array(Types::ProtectedJobReceiverConfiguration),
          @status : String
        )
        end
      end

      # The configuration of the compute resources for a PySpark job.

      struct ProtectedJobWorkerComputeConfiguration
        include JSON::Serializable

        # The number of workers for a PySpark job.

        @[JSON::Field(key: "number")]
        getter number : Int32

        # The worker compute configuration type.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @number : Int32,
          @type : String
        )
        end
      end

      # The parameters for an Clean Rooms protected query.

      struct ProtectedQuery
        include JSON::Serializable

        # The time at which the protected query was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The identifier for a protected query instance.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of the membership.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The identifier for the membership.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The status of the query.

        @[JSON::Field(key: "status")]
        getter status : String

        # The compute configuration for the protected query.

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ComputeConfiguration?

        # The sensitivity parameters of the differential privacy results of the protected query.

        @[JSON::Field(key: "differentialPrivacy")]
        getter differential_privacy : Types::DifferentialPrivacyParameters?

        # An error thrown by the protected query.

        @[JSON::Field(key: "error")]
        getter error : Types::ProtectedQueryError?

        # The result of the protected query.

        @[JSON::Field(key: "result")]
        getter result : Types::ProtectedQueryResult?

        # Contains any details needed to write the query results.

        @[JSON::Field(key: "resultConfiguration")]
        getter result_configuration : Types::ProtectedQueryResultConfiguration?

        # The protected query SQL parameters.

        @[JSON::Field(key: "sqlParameters")]
        getter sql_parameters : Types::ProtectedQuerySQLParameters?

        # Statistics about protected query execution.

        @[JSON::Field(key: "statistics")]
        getter statistics : Types::ProtectedQueryStatistics?

        def initialize(
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @status : String,
          @compute_configuration : Types::ComputeConfiguration? = nil,
          @differential_privacy : Types::DifferentialPrivacyParameters? = nil,
          @error : Types::ProtectedQueryError? = nil,
          @result : Types::ProtectedQueryResult? = nil,
          @result_configuration : Types::ProtectedQueryResultConfiguration? = nil,
          @sql_parameters : Types::ProtectedQuerySQLParameters? = nil,
          @statistics : Types::ProtectedQueryStatistics? = nil
        )
        end
      end

      # Contains the output information for a protected query with a distribute output configuration. This
      # output type allows query results to be distributed to multiple receivers, including S3 and
      # collaboration members. It is only available for queries using the Spark analytics engine.

      struct ProtectedQueryDistributeOutput
        include JSON::Serializable

        # Contains the output results for each member location specified in the distribute output
        # configuration. Each entry provides details about the result distribution to a specific collaboration
        # member.

        @[JSON::Field(key: "memberList")]
        getter member_list : Array(Types::ProtectedQuerySingleMemberOutput)?


        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedQueryS3Output?

        def initialize(
          @member_list : Array(Types::ProtectedQuerySingleMemberOutput)? = nil,
          @s3 : Types::ProtectedQueryS3Output? = nil
        )
        end
      end

      # Specifies the configuration for distributing protected query results to multiple receivers,
      # including S3 and collaboration members.

      struct ProtectedQueryDistributeOutputConfiguration
        include JSON::Serializable

        # A list of locations where you want to distribute the protected query results. Each location must
        # specify either an S3 destination or a collaboration member destination. You can't specify more than
        # one S3 location. You can't specify the query runner's account as a member location. You must include
        # either an S3 or member output configuration for each location, but not both.

        @[JSON::Field(key: "locations")]
        getter locations : Array(Types::ProtectedQueryDistributeOutputConfigurationLocation)

        def initialize(
          @locations : Array(Types::ProtectedQueryDistributeOutputConfigurationLocation)
        )
        end
      end

      # Specifies where you'll distribute the results of your protected query. You must configure either an
      # S3 destination or a collaboration member destination.

      struct ProtectedQueryDistributeOutputConfigurationLocation
        include JSON::Serializable


        @[JSON::Field(key: "member")]
        getter member : Types::ProtectedQueryMemberOutputConfiguration?


        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedQueryS3OutputConfiguration?

        def initialize(
          @member : Types::ProtectedQueryMemberOutputConfiguration? = nil,
          @s3 : Types::ProtectedQueryS3OutputConfiguration? = nil
        )
        end
      end

      # Details of errors thrown by the protected query.

      struct ProtectedQueryError
        include JSON::Serializable

        # An error code for the error.

        @[JSON::Field(key: "code")]
        getter code : String

        # A description of why the query failed.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # Contains configuration details for the protected query member output.

      struct ProtectedQueryMemberOutputConfiguration
        include JSON::Serializable

        # The unique identifier for the account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Contains details about the protected query output.

      struct ProtectedQueryOutput
        include JSON::Serializable

        # Contains output information for protected queries that use a distribute output type. This output
        # type lets you send query results to multiple locations - either to S3 or to collaboration members.
        # You can only use the distribute output type with the Spark analytics engine.

        @[JSON::Field(key: "distribute")]
        getter distribute : Types::ProtectedQueryDistributeOutput?

        # The list of member Amazon Web Services account(s) that received the results of the query.

        @[JSON::Field(key: "memberList")]
        getter member_list : Array(Types::ProtectedQuerySingleMemberOutput)?

        # If present, the output for a protected query with an S3 output type.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedQueryS3Output?

        def initialize(
          @distribute : Types::ProtectedQueryDistributeOutput? = nil,
          @member_list : Array(Types::ProtectedQuerySingleMemberOutput)? = nil,
          @s3 : Types::ProtectedQueryS3Output? = nil
        )
        end
      end

      # Contains configuration details for protected query output.

      struct ProtectedQueryOutputConfiguration
        include JSON::Serializable

        # Required configuration for a protected query with a distribute output type.

        @[JSON::Field(key: "distribute")]
        getter distribute : Types::ProtectedQueryDistributeOutputConfiguration?

        # Required configuration for a protected query with a member output type.

        @[JSON::Field(key: "member")]
        getter member : Types::ProtectedQueryMemberOutputConfiguration?

        # Required configuration for a protected query with an s3 output type.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::ProtectedQueryS3OutputConfiguration?

        def initialize(
          @distribute : Types::ProtectedQueryDistributeOutputConfiguration? = nil,
          @member : Types::ProtectedQueryMemberOutputConfiguration? = nil,
          @s3 : Types::ProtectedQueryS3OutputConfiguration? = nil
        )
        end
      end

      # Details about the query results.

      struct ProtectedQueryResult
        include JSON::Serializable

        # The output of the protected query.

        @[JSON::Field(key: "output")]
        getter output : Types::ProtectedQueryOutput

        def initialize(
          @output : Types::ProtectedQueryOutput
        )
        end
      end

      # Contains configurations for protected query results.

      struct ProtectedQueryResultConfiguration
        include JSON::Serializable

        # Configuration for protected query results.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::ProtectedQueryOutputConfiguration

        def initialize(
          @output_configuration : Types::ProtectedQueryOutputConfiguration
        )
        end
      end

      # Contains output information for protected queries with an S3 output type.

      struct ProtectedQueryS3Output
        include JSON::Serializable

        # The S3 location of the result.

        @[JSON::Field(key: "location")]
        getter location : String

        def initialize(
          @location : String
        )
        end
      end

      # Contains the configuration to write the query results to S3.

      struct ProtectedQueryS3OutputConfiguration
        include JSON::Serializable

        # The S3 bucket to unload the protected query results.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # Intended file format of the result.

        @[JSON::Field(key: "resultFormat")]
        getter result_format : String

        # The S3 prefix to unload the protected query results.

        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        # Indicates whether files should be output as a single file ( TRUE ) or output as multiple files (
        # FALSE ). This parameter is only supported for analyses with the Spark analytics engine.

        @[JSON::Field(key: "singleFileOutput")]
        getter single_file_output : Bool?

        def initialize(
          @bucket : String,
          @result_format : String,
          @key_prefix : String? = nil,
          @single_file_output : Bool? = nil
        )
        end
      end

      # The parameters for the SQL type Protected Query.

      struct ProtectedQuerySQLParameters
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the analysis template within a collaboration.

        @[JSON::Field(key: "analysisTemplateArn")]
        getter analysis_template_arn : String?

        # The protected query SQL parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The query string to be submitted.

        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        def initialize(
          @analysis_template_arn : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @query_string : String? = nil
        )
        end
      end

      # Details about the member who received the query result.

      struct ProtectedQuerySingleMemberOutput
        include JSON::Serializable

        # The Amazon Web Services account ID of the member in the collaboration who can receive results for
        # the query.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Contains statistics about the execution of the protected query.

      struct ProtectedQueryStatistics
        include JSON::Serializable

        # The billed resource utilization.

        @[JSON::Field(key: "billedResourceUtilization")]
        getter billed_resource_utilization : Types::BilledResourceUtilization?

        # The duration of the protected query, from creation until query completion, in milliseconds.

        @[JSON::Field(key: "totalDurationInMillis")]
        getter total_duration_in_millis : Int64?

        def initialize(
          @billed_resource_utilization : Types::BilledResourceUtilization? = nil,
          @total_duration_in_millis : Int64? = nil
        )
        end
      end

      # The protected query summary for the objects listed by the request.

      struct ProtectedQuerySummary
        include JSON::Serializable

        # The time the protected query was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique ID of the protected query.

        @[JSON::Field(key: "id")]
        getter id : String

        # The unique ARN for the membership that initiated the protected query.

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String

        # The unique ID for the membership that initiated the protected query.

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # The receiver configuration.

        @[JSON::Field(key: "receiverConfigurations")]
        getter receiver_configurations : Array(Types::ReceiverConfiguration)

        # The status of the protected query.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @create_time : Time,
          @id : String,
          @membership_arn : String,
          @membership_id : String,
          @receiver_configurations : Array(Types::ReceiverConfiguration),
          @status : String
        )
        end
      end

      # An object representing the collaboration member's payment responsibilities set by the collaboration
      # creator for query compute costs.

      struct QueryComputePaymentConfig
        include JSON::Serializable

        # Indicates whether the collaboration creator has configured the collaboration member to pay for query
        # compute costs ( TRUE ) or has not configured the collaboration member to pay for query compute costs
        # ( FALSE ). Exactly one member can be configured to pay for query compute costs. An error is returned
        # if the collaboration creator sets a TRUE value for more than one member in the collaboration. If the
        # collaboration creator hasn't specified anyone as the member paying for query compute costs, then the
        # member who can query is the default payer. An error is returned if the collaboration creator sets a
        # FALSE value for the member who can query.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # Provides any necessary query constraint information.

      struct QueryConstraint
        include JSON::Serializable

        # An array of column names that specifies which columns are required in the JOIN statement.

        @[JSON::Field(key: "requireOverlap")]
        getter require_overlap : Types::QueryConstraintRequireOverlap?

        def initialize(
          @require_overlap : Types::QueryConstraintRequireOverlap? = nil
        )
        end
      end

      # Provides the name of the columns that are required to overlap.

      struct QueryConstraintRequireOverlap
        include JSON::Serializable

        # The columns that are required to overlap.

        @[JSON::Field(key: "columns")]
        getter columns : Array(String)?

        def initialize(
          @columns : Array(String)? = nil
        )
        end
      end

      # The receiver configuration for a protected query.

      struct ReceiverConfiguration
        include JSON::Serializable

        # The type of analysis for the protected query. The results of the query can be analyzed directly (
        # DIRECT_ANALYSIS ) or used as input into additional analyses ( ADDITIONAL_ANALYSIS ), such as a query
        # that is a seed for a lookalike ML model.

        @[JSON::Field(key: "analysisType")]
        getter analysis_type : String

        # The configuration details of the receiver configuration.

        @[JSON::Field(key: "configurationDetails")]
        getter configuration_details : Types::ConfigurationDetails?

        def initialize(
          @analysis_type : String,
          @configuration_details : Types::ConfigurationDetails? = nil
        )
        end
      end

      # Request references a resource which does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The Id of the missing resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the missing resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The S3 location.

      struct S3Location
        include JSON::Serializable

        # The bucket name.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The object key.

        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # A schema is a relation within a collaboration.

      struct Schema
        include JSON::Serializable

        # The analysis rule types that are associated with the schema. Currently, only one entry is present.

        @[JSON::Field(key: "analysisRuleTypes")]
        getter analysis_rule_types : Array(String)

        # The unique Amazon Resource Name (ARN) for the collaboration that the schema belongs to.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique ID for the collaboration that the schema belongs to.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The columns for the relation that this schema represents.

        @[JSON::Field(key: "columns")]
        getter columns : Array(Types::Column)

        # The time at which the schema was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique account ID for the Amazon Web Services account that owns the schema.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # A description for the schema.

        @[JSON::Field(key: "description")]
        getter description : String

        # A name for the schema. The schema relation is referred to by this name when queried by a protected
        # query.

        @[JSON::Field(key: "name")]
        getter name : String

        # The partition keys for the dataset underlying this schema.

        @[JSON::Field(key: "partitionKeys")]
        getter partition_keys : Array(Types::Column)

        # Details about the status of the schema. Currently, only one entry is present.

        @[JSON::Field(key: "schemaStatusDetails")]
        getter schema_status_details : Array(Types::SchemaStatusDetail)

        # The type of schema.

        @[JSON::Field(key: "type")]
        getter type : String

        # The most recent time at which the schema was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The analysis method for the schema. DIRECT_QUERY allows SQL queries to be run directly on this
        # table. DIRECT_JOB allows PySpark jobs to be run directly on this table. MULTIPLE allows both SQL
        # queries and PySpark jobs to be run directly on this table.

        @[JSON::Field(key: "analysisMethod")]
        getter analysis_method : String?

        # The Amazon Resource Name (ARN) of the schema resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The schema type properties.

        @[JSON::Field(key: "schemaTypeProperties")]
        getter schema_type_properties : Types::SchemaTypeProperties?

        # The selected analysis methods for the schema.

        @[JSON::Field(key: "selectedAnalysisMethods")]
        getter selected_analysis_methods : Array(String)?

        def initialize(
          @analysis_rule_types : Array(String),
          @collaboration_arn : String,
          @collaboration_id : String,
          @columns : Array(Types::Column),
          @create_time : Time,
          @creator_account_id : String,
          @description : String,
          @name : String,
          @partition_keys : Array(Types::Column),
          @schema_status_details : Array(Types::SchemaStatusDetail),
          @type : String,
          @update_time : Time,
          @analysis_method : String? = nil,
          @resource_arn : String? = nil,
          @schema_type_properties : Types::SchemaTypeProperties? = nil,
          @selected_analysis_methods : Array(String)? = nil
        )
        end
      end

      # Defines the information that's necessary to retrieve an analysis rule schema. Schema analysis rules
      # are uniquely identiﬁed by a combination of the schema name and the analysis rule type for a given
      # collaboration.

      struct SchemaAnalysisRuleRequest
        include JSON::Serializable

        # The name of the analysis rule schema that you are requesting.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of analysis rule schema that you are requesting.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # Information about the schema status. A status of READY means that based on the schema analysis rule,
      # queries of the given analysis rule type are properly configured to run queries on this schema.

      struct SchemaStatusDetail
        include JSON::Serializable

        # The type of analysis that can be performed on the schema. A schema can have an analysisType of
        # DIRECT_ANALYSIS , ADDITIONAL_ANALYSIS_FOR_AUDIENCE_GENERATION , or both.

        @[JSON::Field(key: "analysisType")]
        getter analysis_type : String

        # The status of the schema, indicating if it is ready to query.

        @[JSON::Field(key: "status")]
        getter status : String

        # The analysis rule type for which the schema status has been evaluated.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String?

        # The configuration details of the schema analysis rule for the given type.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(String)?

        # The reasons why the schema status is set to its current state.

        @[JSON::Field(key: "reasons")]
        getter reasons : Array(Types::SchemaStatusReason)?

        def initialize(
          @analysis_type : String,
          @status : String,
          @analysis_rule_type : String? = nil,
          @configurations : Array(String)? = nil,
          @reasons : Array(Types::SchemaStatusReason)? = nil
        )
        end
      end

      # A reason why the schema status is set to its current value.

      struct SchemaStatusReason
        include JSON::Serializable

        # The schema status reason code.

        @[JSON::Field(key: "code")]
        getter code : String

        # An explanation of the schema status reason code.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # The schema summary for the objects listed by the request.

      struct SchemaSummary
        include JSON::Serializable

        # The types of analysis rules that are associated with this schema object.

        @[JSON::Field(key: "analysisRuleTypes")]
        getter analysis_rule_types : Array(String)

        # The unique ARN for the collaboration that the schema belongs to.

        @[JSON::Field(key: "collaborationArn")]
        getter collaboration_arn : String

        # The unique ID for the collaboration that the schema belongs to.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String

        # The time the schema object was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The unique account ID for the Amazon Web Services account that owns the schema.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The name for the schema object.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of schema object.

        @[JSON::Field(key: "type")]
        getter type : String

        # The time the schema object was last updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The analysis method for the associated schema. DIRECT_QUERY allows SQL queries to be run directly on
        # this table. DIRECT_JOB allows PySpark jobs to be run directly on this table. MULTIPLE allows both
        # SQL queries and PySpark jobs to be run directly on this table.

        @[JSON::Field(key: "analysisMethod")]
        getter analysis_method : String?

        # The Amazon Resource Name (ARN) of the schema summary resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The selected analysis methods for the schema.

        @[JSON::Field(key: "selectedAnalysisMethods")]
        getter selected_analysis_methods : Array(String)?

        def initialize(
          @analysis_rule_types : Array(String),
          @collaboration_arn : String,
          @collaboration_id : String,
          @create_time : Time,
          @creator_account_id : String,
          @name : String,
          @type : String,
          @update_time : Time,
          @analysis_method : String? = nil,
          @resource_arn : String? = nil,
          @selected_analysis_methods : Array(String)? = nil
        )
        end
      end

      # Information about the schema type properties.

      struct SchemaTypeProperties
        include JSON::Serializable

        # The ID mapping table for the schema type properties.

        @[JSON::Field(key: "idMappingTable")]
        getter id_mapping_table : Types::IdMappingTableSchemaTypeProperties?

        def initialize(
          @id_mapping_table : Types::IdMappingTableSchemaTypeProperties? = nil
        )
        end
      end

      # Request denied because service quota has been exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the quota.

        @[JSON::Field(key: "quotaName")]
        getter quota_name : String

        # The value of the quota.

        @[JSON::Field(key: "quotaValue")]
        getter quota_value : Float64

        def initialize(
          @message : String,
          @quota_name : String,
          @quota_value : Float64
        )
        end
      end

      # A reference to a table within Snowflake.

      struct SnowflakeTableReference
        include JSON::Serializable

        # The account identifier for the Snowflake table reference.

        @[JSON::Field(key: "accountIdentifier")]
        getter account_identifier : String

        # The name of the database the Snowflake table belongs to.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The schema name of the Snowflake table reference.

        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        # The secret ARN of the Snowflake table reference.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The name of the Snowflake table.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The schema of the Snowflake table.

        @[JSON::Field(key: "tableSchema")]
        getter table_schema : Types::SnowflakeTableSchema

        def initialize(
          @account_identifier : String,
          @database_name : String,
          @schema_name : String,
          @secret_arn : String,
          @table_name : String,
          @table_schema : Types::SnowflakeTableSchema
        )
        end
      end

      # The schema of a Snowflake table.

      struct SnowflakeTableSchema
        include JSON::Serializable

        # The schema of a Snowflake table.

        @[JSON::Field(key: "v1")]
        getter v1 : Array(Types::SnowflakeTableSchemaV1)?

        def initialize(
          @v1 : Array(Types::SnowflakeTableSchemaV1)? = nil
        )
        end
      end

      # The Snowflake table schema.

      struct SnowflakeTableSchemaV1
        include JSON::Serializable

        # The column name.

        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The column's data type. Supported data types: ARRAY , BIGINT , BOOLEAN , CHAR , DATE , DECIMAL ,
        # DOUBLE , DOUBLE PRECISION , FLOAT , FLOAT4 , INT , INTEGER , MAP , NUMERIC , NUMBER , REAL ,
        # SMALLINT , STRING , TIMESTAMP , TIMESTAMP_LTZ , TIMESTAMP_NTZ , DATETIME , TINYINT , VARCHAR , TEXT
        # , CHARACTER .

        @[JSON::Field(key: "columnType")]
        getter column_type : String

        def initialize(
          @column_name : String,
          @column_type : String
        )
        end
      end


      struct StartProtectedJobInput
        include JSON::Serializable

        # The job parameters.

        @[JSON::Field(key: "jobParameters")]
        getter job_parameters : Types::ProtectedJobParameters

        # A unique identifier for the membership to run this job against. Currently accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The type of protected job to start.

        @[JSON::Field(key: "type")]
        getter type : String

        # The compute configuration for the protected job.

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ProtectedJobComputeConfiguration?

        # The details needed to write the job results.

        @[JSON::Field(key: "resultConfiguration")]
        getter result_configuration : Types::ProtectedJobResultConfigurationInput?

        def initialize(
          @job_parameters : Types::ProtectedJobParameters,
          @membership_identifier : String,
          @type : String,
          @compute_configuration : Types::ProtectedJobComputeConfiguration? = nil,
          @result_configuration : Types::ProtectedJobResultConfigurationInput? = nil
        )
        end
      end


      struct StartProtectedJobOutput
        include JSON::Serializable

        # The protected job.

        @[JSON::Field(key: "protectedJob")]
        getter protected_job : Types::ProtectedJob

        def initialize(
          @protected_job : Types::ProtectedJob
        )
        end
      end


      struct StartProtectedQueryInput
        include JSON::Serializable

        # A unique identifier for the membership to run this query against. Currently accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The protected SQL query parameters.

        @[JSON::Field(key: "sqlParameters")]
        getter sql_parameters : Types::ProtectedQuerySQLParameters

        # The type of the protected query to be started.

        @[JSON::Field(key: "type")]
        getter type : String

        # The compute configuration for the protected query.

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ComputeConfiguration?

        # The details needed to write the query results.

        @[JSON::Field(key: "resultConfiguration")]
        getter result_configuration : Types::ProtectedQueryResultConfiguration?

        def initialize(
          @membership_identifier : String,
          @sql_parameters : Types::ProtectedQuerySQLParameters,
          @type : String,
          @compute_configuration : Types::ComputeConfiguration? = nil,
          @result_configuration : Types::ProtectedQueryResultConfiguration? = nil
        )
        end
      end


      struct StartProtectedQueryOutput
        include JSON::Serializable

        # The protected query.

        @[JSON::Field(key: "protectedQuery")]
        getter protected_query : Types::ProtectedQuery

        def initialize(
          @protected_query : Types::ProtectedQuery
        )
        end
      end

      # Properties that define how a specific data column should be handled during synthetic data
      # generation, including its name, type, and role in predictive modeling.

      struct SyntheticDataColumnProperties
        include JSON::Serializable

        # The name of the data column as it appears in the dataset.

        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The data type of the column, which determines how the synthetic data generation algorithm processes
        # and synthesizes values for this column.

        @[JSON::Field(key: "columnType")]
        getter column_type : String

        # Indicates if this column contains predictive values that should be treated as target variables in
        # machine learning models. This affects how the synthetic data generation preserves statistical
        # relationships.

        @[JSON::Field(key: "isPredictiveValue")]
        getter is_predictive_value : Bool

        def initialize(
          @column_name : String,
          @column_type : String,
          @is_predictive_value : Bool
        )
        end
      end

      # Payment configuration for synthetic data generation.

      struct SyntheticDataGenerationPaymentConfig
        include JSON::Serializable

        # Indicates who is responsible for paying for synthetic data generation.

        @[JSON::Field(key: "isResponsible")]
        getter is_responsible : Bool

        def initialize(
          @is_responsible : Bool
        )
        end
      end

      # The parameters that control how synthetic data is generated, including privacy settings, column
      # classifications, and other configuration options that affect the data synthesis process.

      struct SyntheticDataParameters
        include JSON::Serializable

        # The machine learning-specific parameters for synthetic data generation.

        @[JSON::Field(key: "mlSyntheticDataParameters")]
        getter ml_synthetic_data_parameters : Types::MLSyntheticDataParameters?

        def initialize(
          @ml_synthetic_data_parameters : Types::MLSyntheticDataParameters? = nil
        )
        end
      end

      # A pointer to the dataset that underlies this table.

      struct TableReference
        include JSON::Serializable

        # If present, a reference to the Athena table referred to by this table reference.

        @[JSON::Field(key: "athena")]
        getter athena : Types::AthenaTableReference?

        # If present, a reference to the Glue table referred to by this table reference.

        @[JSON::Field(key: "glue")]
        getter glue : Types::GlueTableReference?

        # If present, a reference to the Snowflake table referred to by this table reference.

        @[JSON::Field(key: "snowflake")]
        getter snowflake : Types::SnowflakeTableReference?

        def initialize(
          @athena : Types::AthenaTableReference? = nil,
          @glue : Types::GlueTableReference? = nil,
          @snowflake : Types::SnowflakeTableReference? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource you want to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A map of objects specifying each key name and value.

        @[JSON::Field(key: "tags")]
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

      # Request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource you want to remove the tag from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of key names of tags to be removed.

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


      struct UpdateAnalysisTemplateInput
        include JSON::Serializable

        # The identifier for the analysis template resource.

        @[JSON::Field(key: "analysisTemplateIdentifier")]
        getter analysis_template_identifier : String

        # The identifier for a membership resource.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A new description for the analysis template.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @analysis_template_identifier : String,
          @membership_identifier : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateAnalysisTemplateOutput
        include JSON::Serializable

        # The analysis template.

        @[JSON::Field(key: "analysisTemplate")]
        getter analysis_template : Types::AnalysisTemplate

        def initialize(
          @analysis_template : Types::AnalysisTemplate
        )
        end
      end


      struct UpdateCollaborationChangeRequestInput
        include JSON::Serializable

        # The action to perform on the change request. Valid values include APPROVE (approve the change), DENY
        # (reject the change), CANCEL (cancel the request), and COMMIT (commit after the request is approved).
        # For change requests without automatic approval, a member in the collaboration can manually APPROVE
        # or DENY a change request. The collaboration owner can manually CANCEL or COMMIT a change request.

        @[JSON::Field(key: "action")]
        getter action : String

        # The unique identifier of the specific change request to be updated within the collaboration.

        @[JSON::Field(key: "changeRequestIdentifier")]
        getter change_request_identifier : String

        # The unique identifier of the collaboration that contains the change request to be updated.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        def initialize(
          @action : String,
          @change_request_identifier : String,
          @collaboration_identifier : String
        )
        end
      end


      struct UpdateCollaborationChangeRequestOutput
        include JSON::Serializable


        @[JSON::Field(key: "collaborationChangeRequest")]
        getter collaboration_change_request : Types::CollaborationChangeRequest

        def initialize(
          @collaboration_change_request : Types::CollaborationChangeRequest
        )
        end
      end


      struct UpdateCollaborationInput
        include JSON::Serializable

        # The identifier for the collaboration.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The analytics engine. After July 16, 2025, the CLEAN_ROOMS_SQL parameter will no longer be
        # available.

        @[JSON::Field(key: "analyticsEngine")]
        getter analytics_engine : String?

        # A description of the collaboration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A human-readable identifier provided by the collaboration owner. Display names are not unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @collaboration_identifier : String,
          @analytics_engine : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateCollaborationOutput
        include JSON::Serializable

        # The entire collaboration that has been updated.

        @[JSON::Field(key: "collaboration")]
        getter collaboration : Types::Collaboration

        def initialize(
          @collaboration : Types::Collaboration
        )
        end
      end


      struct UpdateConfiguredAudienceModelAssociationInput
        include JSON::Serializable

        # A unique identifier for the configured audience model association that you want to update.

        @[JSON::Field(key: "configuredAudienceModelAssociationIdentifier")]
        getter configured_audience_model_association_identifier : String

        # A unique identifier of the membership that contains the configured audience model association that
        # you want to update.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A new description for the configured audience model association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A new name for the configured audience model association.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @configured_audience_model_association_identifier : String,
          @membership_identifier : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateConfiguredAudienceModelAssociationOutput
        include JSON::Serializable

        # Details about the configured audience model association that you updated.

        @[JSON::Field(key: "configuredAudienceModelAssociation")]
        getter configured_audience_model_association : Types::ConfiguredAudienceModelAssociation

        def initialize(
          @configured_audience_model_association : Types::ConfiguredAudienceModelAssociation
        )
        end
      end


      struct UpdateConfiguredTableAnalysisRuleInput
        include JSON::Serializable

        # The new analysis rule policy for the configured table analysis rule.

        @[JSON::Field(key: "analysisRulePolicy")]
        getter analysis_rule_policy : Types::ConfiguredTableAnalysisRulePolicy

        # The analysis rule type to be updated. Configured table analysis rules are uniquely identified by
        # their configured table identifier and analysis rule type.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The unique identifier for the configured table that the analysis rule applies to. Currently accepts
        # the configured table ID.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        def initialize(
          @analysis_rule_policy : Types::ConfiguredTableAnalysisRulePolicy,
          @analysis_rule_type : String,
          @configured_table_identifier : String
        )
        end
      end


      struct UpdateConfiguredTableAnalysisRuleOutput
        include JSON::Serializable

        # The entire updated analysis rule.

        @[JSON::Field(key: "analysisRule")]
        getter analysis_rule : Types::ConfiguredTableAnalysisRule

        def initialize(
          @analysis_rule : Types::ConfiguredTableAnalysisRule
        )
        end
      end


      struct UpdateConfiguredTableAssociationAnalysisRuleInput
        include JSON::Serializable

        # The updated analysis rule policy for the conﬁgured table association.

        @[JSON::Field(key: "analysisRulePolicy")]
        getter analysis_rule_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy

        # The analysis rule type that you want to update.

        @[JSON::Field(key: "analysisRuleType")]
        getter analysis_rule_type : String

        # The identifier for the configured table association to update.

        @[JSON::Field(key: "configuredTableAssociationIdentifier")]
        getter configured_table_association_identifier : String

        # A unique identifier for the membership that the configured table association belongs to. Currently
        # accepts the membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @analysis_rule_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy,
          @analysis_rule_type : String,
          @configured_table_association_identifier : String,
          @membership_identifier : String
        )
        end
      end


      struct UpdateConfiguredTableAssociationAnalysisRuleOutput
        include JSON::Serializable

        # The updated analysis rule for the conﬁgured table association. In the console, the
        # ConfiguredTableAssociationAnalysisRule is referred to as the collaboration analysis rule .

        @[JSON::Field(key: "analysisRule")]
        getter analysis_rule : Types::ConfiguredTableAssociationAnalysisRule

        def initialize(
          @analysis_rule : Types::ConfiguredTableAssociationAnalysisRule
        )
        end
      end


      struct UpdateConfiguredTableAssociationInput
        include JSON::Serializable

        # The unique identifier for the configured table association to update. Currently accepts the
        # configured table association ID.

        @[JSON::Field(key: "configuredTableAssociationIdentifier")]
        getter configured_table_association_identifier : String

        # The unique ID for the membership that the configured table association belongs to.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A new description for the configured table association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The service will assume this role to access catalog metadata and query the table.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @configured_table_association_identifier : String,
          @membership_identifier : String,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateConfiguredTableAssociationOutput
        include JSON::Serializable

        # The entire updated configured table association.

        @[JSON::Field(key: "configuredTableAssociation")]
        getter configured_table_association : Types::ConfiguredTableAssociation

        def initialize(
          @configured_table_association : Types::ConfiguredTableAssociation
        )
        end
      end


      struct UpdateConfiguredTableInput
        include JSON::Serializable

        # The identifier for the configured table to update. Currently accepts the configured table ID.

        @[JSON::Field(key: "configuredTableIdentifier")]
        getter configured_table_identifier : String

        # The columns of the underlying table that can be used by collaborations or analysis rules.

        @[JSON::Field(key: "allowedColumns")]
        getter allowed_columns : Array(String)?

        # The analysis method for the configured table. DIRECT_QUERY allows SQL queries to be run directly on
        # this table. DIRECT_JOB allows PySpark jobs to be run directly on this table. MULTIPLE allows both
        # SQL queries and PySpark jobs to be run directly on this table.

        @[JSON::Field(key: "analysisMethod")]
        getter analysis_method : String?

        # A new description for the configured table.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A new name for the configured table.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The selected analysis methods for the table configuration update.

        @[JSON::Field(key: "selectedAnalysisMethods")]
        getter selected_analysis_methods : Array(String)?


        @[JSON::Field(key: "tableReference")]
        getter table_reference : Types::TableReference?

        def initialize(
          @configured_table_identifier : String,
          @allowed_columns : Array(String)? = nil,
          @analysis_method : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @selected_analysis_methods : Array(String)? = nil,
          @table_reference : Types::TableReference? = nil
        )
        end
      end


      struct UpdateConfiguredTableOutput
        include JSON::Serializable

        # The updated configured table.

        @[JSON::Field(key: "configuredTable")]
        getter configured_table : Types::ConfiguredTable

        def initialize(
          @configured_table : Types::ConfiguredTable
        )
        end
      end


      struct UpdateIdMappingTableInput
        include JSON::Serializable

        # The unique identifier of the ID mapping table that you want to update.

        @[JSON::Field(key: "idMappingTableIdentifier")]
        getter id_mapping_table_identifier : String

        # The unique identifier of the membership that contains the ID mapping table that you want to update.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A new description for the ID mapping table.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services KMS key.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @id_mapping_table_identifier : String,
          @membership_identifier : String,
          @description : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct UpdateIdMappingTableOutput
        include JSON::Serializable

        # The updated ID mapping table.

        @[JSON::Field(key: "idMappingTable")]
        getter id_mapping_table : Types::IdMappingTable

        def initialize(
          @id_mapping_table : Types::IdMappingTable
        )
        end
      end


      struct UpdateIdNamespaceAssociationInput
        include JSON::Serializable

        # The unique identifier of the ID namespace association that you want to update.

        @[JSON::Field(key: "idNamespaceAssociationIdentifier")]
        getter id_namespace_association_identifier : String

        # The unique identifier of the membership that contains the ID namespace association that you want to
        # update.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A new description for the ID namespace association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration settings for the ID mapping table.

        @[JSON::Field(key: "idMappingConfig")]
        getter id_mapping_config : Types::IdMappingConfig?

        # A new name for the ID namespace association.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id_namespace_association_identifier : String,
          @membership_identifier : String,
          @description : String? = nil,
          @id_mapping_config : Types::IdMappingConfig? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateIdNamespaceAssociationOutput
        include JSON::Serializable

        # The updated ID namespace association.

        @[JSON::Field(key: "idNamespaceAssociation")]
        getter id_namespace_association : Types::IdNamespaceAssociation

        def initialize(
          @id_namespace_association : Types::IdNamespaceAssociation
        )
        end
      end


      struct UpdateMembershipInput
        include JSON::Serializable

        # The unique identifier of the membership.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The default job result configuration.

        @[JSON::Field(key: "defaultJobResultConfiguration")]
        getter default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration?

        # The default protected query result configuration as specified by the member who can receive results.

        @[JSON::Field(key: "defaultResultConfiguration")]
        getter default_result_configuration : Types::MembershipProtectedQueryResultConfiguration?

        # An indicator as to whether job logging has been enabled or disabled for the collaboration. When
        # ENABLED , Clean Rooms logs details about jobs run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "jobLogStatus")]
        getter job_log_status : String?

        # An indicator as to whether query logging has been enabled or disabled for the membership. When
        # ENABLED , Clean Rooms logs details about queries run within this collaboration and those logs can be
        # viewed in Amazon CloudWatch Logs. The default value is DISABLED .

        @[JSON::Field(key: "queryLogStatus")]
        getter query_log_status : String?

        def initialize(
          @membership_identifier : String,
          @default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration? = nil,
          @default_result_configuration : Types::MembershipProtectedQueryResultConfiguration? = nil,
          @job_log_status : String? = nil,
          @query_log_status : String? = nil
        )
        end
      end


      struct UpdateMembershipOutput
        include JSON::Serializable


        @[JSON::Field(key: "membership")]
        getter membership : Types::Membership

        def initialize(
          @membership : Types::Membership
        )
        end
      end


      struct UpdatePrivacyBudgetTemplateInput
        include JSON::Serializable

        # A unique identifier for one of your memberships for a collaboration. The privacy budget template is
        # updated in the collaboration that this membership belongs to. Accepts a membership ID.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # A unique identifier for your privacy budget template that you want to update.

        @[JSON::Field(key: "privacyBudgetTemplateIdentifier")]
        getter privacy_budget_template_identifier : String

        # Specifies the type of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetType")]
        getter privacy_budget_type : String

        # Specifies the epsilon and noise parameters for the privacy budget template.

        @[JSON::Field(key: "parameters")]
        getter parameters : Types::PrivacyBudgetTemplateUpdateParameters?

        def initialize(
          @membership_identifier : String,
          @privacy_budget_template_identifier : String,
          @privacy_budget_type : String,
          @parameters : Types::PrivacyBudgetTemplateUpdateParameters? = nil
        )
        end
      end


      struct UpdatePrivacyBudgetTemplateOutput
        include JSON::Serializable

        # Summary of the privacy budget template.

        @[JSON::Field(key: "privacyBudgetTemplate")]
        getter privacy_budget_template : Types::PrivacyBudgetTemplate

        def initialize(
          @privacy_budget_template : Types::PrivacyBudgetTemplate
        )
        end
      end


      struct UpdateProtectedJobInput
        include JSON::Serializable

        # The identifier for a member of a protected job instance.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The identifier of the protected job to update.

        @[JSON::Field(key: "protectedJobIdentifier")]
        getter protected_job_identifier : String

        # The target status of a protected job. Used to update the execution status of a currently running
        # job.

        @[JSON::Field(key: "targetStatus")]
        getter target_status : String

        def initialize(
          @membership_identifier : String,
          @protected_job_identifier : String,
          @target_status : String
        )
        end
      end


      struct UpdateProtectedJobOutput
        include JSON::Serializable

        # The protected job output.

        @[JSON::Field(key: "protectedJob")]
        getter protected_job : Types::ProtectedJob

        def initialize(
          @protected_job : Types::ProtectedJob
        )
        end
      end


      struct UpdateProtectedQueryInput
        include JSON::Serializable

        # The identifier for a member of a protected query instance.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The identifier for a protected query instance.

        @[JSON::Field(key: "protectedQueryIdentifier")]
        getter protected_query_identifier : String

        # The target status of a query. Used to update the execution status of a currently running query.

        @[JSON::Field(key: "targetStatus")]
        getter target_status : String

        def initialize(
          @membership_identifier : String,
          @protected_query_identifier : String,
          @target_status : String
        )
        end
      end


      struct UpdateProtectedQueryOutput
        include JSON::Serializable

        # The protected query output.

        @[JSON::Field(key: "protectedQuery")]
        getter protected_query : Types::ProtectedQuery

        def initialize(
          @protected_query : Types::ProtectedQuery
        )
        end
      end

      # The input fails to satisfy the specified constraints.

      struct ValidationException
        include JSON::Serializable

        # Validation errors for specific input parameters.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # A reason code for the exception.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Describes validation errors for specific input parameters.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message for the input validation error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the input parameter.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The configuration of the compute resources for workers running an analysis with the Clean Rooms SQL
      # analytics engine.

      struct WorkerComputeConfiguration
        include JSON::Serializable

        # The number of workers. SQL queries support a minimum value of 2 and a maximum value of 400. PySpark
        # jobs support a minimum value of 4 and a maximum value of 128.

        @[JSON::Field(key: "number")]
        getter number : Int32?

        # The configuration properties for the worker compute environment. These properties allow you to
        # customize the compute settings for your Clean Rooms workloads.

        @[JSON::Field(key: "properties")]
        getter properties : Types::WorkerComputeConfigurationProperties?

        # The worker compute configuration type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @number : Int32? = nil,
          @properties : Types::WorkerComputeConfigurationProperties? = nil,
          @type : String? = nil
        )
        end
      end

      # The configuration properties that define the compute environment settings for workers in Clean
      # Rooms. These properties enable customization of the underlying compute environment to optimize
      # performance for your specific workloads.

      struct WorkerComputeConfigurationProperties
        include JSON::Serializable

        # The Spark configuration properties for SQL workloads. This map contains key-value pairs that
        # configure Apache Spark settings to optimize performance for your data processing jobs. You can
        # specify up to 50 Spark properties, with each key being 1-200 characters and each value being 0-500
        # characters. These properties allow you to adjust compute capacity for large datasets and complex
        # workloads.

        @[JSON::Field(key: "spark")]
        getter spark : Hash(String, String)?

        def initialize(
          @spark : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
