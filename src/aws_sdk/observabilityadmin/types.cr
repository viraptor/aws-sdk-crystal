require "json"

module AwsSdk
  module ObservabilityAdmin
    module Types

      # Indicates you don't have permissions to perform the requested operation. The user or role that is
      # making the request must have at least one IAM permissions policy attached that grants the required
      # permissions. For more information, see Access management for Amazon Web Services resources in the
      # IAM user guide.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        def initialize(
          @message : String? = nil,
          @amzn_error_type : String? = nil
        )
        end
      end

      # Condition that matches based on the specific WAF action taken on the request.
      struct ActionCondition
        include JSON::Serializable

        # The WAF action to match against (ALLOW, BLOCK, COUNT, CAPTCHA, CHALLENGE, EXCLUDED_AS_COUNT).
        @[JSON::Field(key: "Action")]
        getter action : String?

        def initialize(
          @action : String? = nil
        )
        end
      end

      # Advanced event selectors let you create fine-grained selectors for management, data, and network
      # activity events.
      struct AdvancedEventSelector
        include JSON::Serializable

        # Contains all selector statements in an advanced event selector.
        @[JSON::Field(key: "FieldSelectors")]
        getter field_selectors : Array(Types::AdvancedFieldSelector)

        # An optional, descriptive name for an advanced event selector, such as "Log data events for only two
        # S3 buckets".
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @field_selectors : Array(Types::AdvancedFieldSelector),
          @name : String? = nil
        )
        end
      end

      # Defines criteria for selecting resources based on field values.
      struct AdvancedFieldSelector
        include JSON::Serializable

        # The name of the field to use for selection.
        @[JSON::Field(key: "Field")]
        getter field : String

        # Matches if the field value ends with the specified value.
        @[JSON::Field(key: "EndsWith")]
        getter ends_with : Array(String)?

        # Matches if the field value equals the specified value.
        @[JSON::Field(key: "Equals")]
        getter equals : Array(String)?

        # Matches if the field value does not end with the specified value.
        @[JSON::Field(key: "NotEndsWith")]
        getter not_ends_with : Array(String)?

        # Matches if the field value does not equal the specified value.
        @[JSON::Field(key: "NotEquals")]
        getter not_equals : Array(String)?

        # Matches if the field value does not start with the specified value.
        @[JSON::Field(key: "NotStartsWith")]
        getter not_starts_with : Array(String)?

        # Matches if the field value starts with the specified value.
        @[JSON::Field(key: "StartsWith")]
        getter starts_with : Array(String)?

        def initialize(
          @field : String,
          @ends_with : Array(String)? = nil,
          @equals : Array(String)? = nil,
          @not_ends_with : Array(String)? = nil,
          @not_equals : Array(String)? = nil,
          @not_starts_with : Array(String)? = nil,
          @starts_with : Array(String)? = nil
        )
        end
      end

      # Defines how telemetry data should be centralized across an Amazon Web Services Organization,
      # including source and destination configurations.
      struct CentralizationRule
        include JSON::Serializable

        # Configuration determining where the telemetry data should be centralized, backed up, as well as
        # encryption configuration for the primary and backup destinations.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::CentralizationRuleDestination

        # Configuration determining the source of the telemetry data to be centralized.
        @[JSON::Field(key: "Source")]
        getter source : Types::CentralizationRuleSource

        def initialize(
          @destination : Types::CentralizationRuleDestination,
          @source : Types::CentralizationRuleSource
        )
        end
      end

      # Configuration specifying the primary destination for centralized telemetry data.
      struct CentralizationRuleDestination
        include JSON::Serializable

        # The primary destination region to which telemetry data should be centralized.
        @[JSON::Field(key: "Region")]
        getter region : String

        # The destination account (within the organization) to which the telemetry data should be centralized.
        @[JSON::Field(key: "Account")]
        getter account : String?

        # Log specific configuration for centralization destination log groups.
        @[JSON::Field(key: "DestinationLogsConfiguration")]
        getter destination_logs_configuration : Types::DestinationLogsConfiguration?

        def initialize(
          @region : String,
          @account : String? = nil,
          @destination_logs_configuration : Types::DestinationLogsConfiguration? = nil
        )
        end
      end

      # Configuration specifying the source of telemetry data to be centralized.
      struct CentralizationRuleSource
        include JSON::Serializable

        # The list of source regions from which telemetry data should be centralized.
        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)

        # The organizational scope from which telemetry data should be centralized, specified using
        # organization id, accounts or organizational unit ids.
        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # Log specific configuration for centralization source log groups.
        @[JSON::Field(key: "SourceLogsConfiguration")]
        getter source_logs_configuration : Types::SourceLogsConfiguration?

        def initialize(
          @regions : Array(String),
          @scope : String? = nil,
          @source_logs_configuration : Types::SourceLogsConfiguration? = nil
        )
        end
      end

      # A summary of a centralization rule's key properties and status.
      struct CentralizationRuleSummary
        include JSON::Serializable

        # The Amazon Web Services region where the organization centralization rule was created.
        @[JSON::Field(key: "CreatedRegion")]
        getter created_region : String?

        # The timestamp when the organization centralization rule was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The Amazon Web Services Account that created the organization centralization rule.
        @[JSON::Field(key: "CreatorAccountId")]
        getter creator_account_id : String?

        # The primary destination account of the organization centralization rule.
        @[JSON::Field(key: "DestinationAccountId")]
        getter destination_account_id : String?

        # The primary destination region of the organization centralization rule.
        @[JSON::Field(key: "DestinationRegion")]
        getter destination_region : String?

        # The reason why an organization centralization rule is marked UNHEALTHY.
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The timestamp when the organization centralization rule was last updated.
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The Amazon Resource Name (ARN) of the organization centralization rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The health status of the organization centralization rule.
        @[JSON::Field(key: "RuleHealth")]
        getter rule_health : String?

        # The name of the organization centralization rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        def initialize(
          @created_region : String? = nil,
          @created_time_stamp : Int64? = nil,
          @creator_account_id : String? = nil,
          @destination_account_id : String? = nil,
          @destination_region : String? = nil,
          @failure_reason : String? = nil,
          @last_update_time_stamp : Int64? = nil,
          @rule_arn : String? = nil,
          @rule_health : String? = nil,
          @rule_name : String? = nil
        )
        end
      end

      # Parameters specific to Amazon Web Services CloudTrail telemetry configuration.
      struct CloudtrailParameters
        include JSON::Serializable

        # The advanced event selectors to use for filtering Amazon Web Services CloudTrail events.
        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)
        )
        end
      end

      # A single condition that can match based on WAF rule action or label name.
      struct Condition
        include JSON::Serializable

        # Matches log records based on the WAF rule action taken (ALLOW, BLOCK, COUNT, etc.).
        @[JSON::Field(key: "ActionCondition")]
        getter action_condition : Types::ActionCondition?

        # Matches log records based on WAF rule labels applied to the request.
        @[JSON::Field(key: "LabelNameCondition")]
        getter label_name_condition : Types::LabelNameCondition?

        def initialize(
          @action_condition : Types::ActionCondition? = nil,
          @label_name_condition : Types::LabelNameCondition? = nil
        )
        end
      end

      # Provides a summary of pipeline configuration components including sources, processors, and
      # destinations.
      struct ConfigurationSummary
        include JSON::Serializable

        # The list of data sources that provide telemetry data to the pipeline.
        @[JSON::Field(key: "DataSources")]
        getter data_sources : Array(Types::DataSource)?

        # The total number of processors configured in the pipeline.
        @[JSON::Field(key: "ProcessorCount")]
        getter processor_count : Int32?

        # The list of processors configured in the pipeline for data transformation.
        @[JSON::Field(key: "Processors")]
        getter processors : Array(String)?

        # The list of destinations where processed data is sent.
        @[JSON::Field(key: "Sinks")]
        getter sinks : Array(String)?

        # The list of data sources configured in the pipeline.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::Source)?

        def initialize(
          @data_sources : Array(Types::DataSource)? = nil,
          @processor_count : Int32? = nil,
          @processors : Array(String)? = nil,
          @sinks : Array(String)? = nil,
          @sources : Array(Types::Source)? = nil
        )
        end
      end

      # The requested operation conflicts with the current state of the specified resource or with another
      # request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The identifier of the resource which is in conflict with the requested operation.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the resource which is in conflict with the requested operation.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct CreateCentralizationRuleForOrganizationInput
        include JSON::Serializable

        # The configuration details for the organization-wide centralization rule, including the source
        # configuration and the destination configuration to centralize telemetry data across the
        # organization.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::CentralizationRule

        # A unique name for the organization-wide centralization rule being created.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The key-value pairs to associate with the organization telemetry rule resource for categorization
        # and management purposes.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @rule : Types::CentralizationRule,
          @rule_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateCentralizationRuleForOrganizationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created organization centralization rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @rule_arn : String? = nil
        )
        end
      end

      struct CreateS3TableIntegrationInput
        include JSON::Serializable

        # The encryption configuration for the S3 Table integration, including the encryption algorithm and
        # KMS key settings.
        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::Encryption

        # The Amazon Resource Name (ARN) of the IAM role that grants permissions for the S3 Table integration
        # to access necessary resources.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The key-value pairs to associate with the S3 Table integration resource for categorization and
        # management purposes.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @encryption : Types::Encryption,
          @role_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateS3TableIntegrationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created S3 Table integration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      struct CreateTelemetryPipelineInput
        include JSON::Serializable

        # The configuration that defines how the telemetry pipeline processes data, including sources,
        # processors, and destinations. For more information about pipeline components, see the Amazon
        # CloudWatch User Guide
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::TelemetryPipelineConfiguration

        # The name of the telemetry pipeline to create. The name must be unique within your account.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The key-value pairs to associate with the telemetry pipeline resource for categorization and
        # management purposes.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::TelemetryPipelineConfiguration,
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTelemetryPipelineOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created telemetry pipeline.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      struct CreateTelemetryRuleForOrganizationInput
        include JSON::Serializable

        # The configuration details for the organization-wide telemetry rule, including the resource type,
        # telemetry type, destination configuration, and selection criteria for which resources the rule
        # applies to across the organization.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::TelemetryRule

        # A unique name for the organization-wide telemetry rule being created.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The key-value pairs to associate with the organization telemetry rule resource for categorization
        # and management purposes.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @rule : Types::TelemetryRule,
          @rule_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTelemetryRuleForOrganizationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created organization telemetry rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @rule_arn : String? = nil
        )
        end
      end

      struct CreateTelemetryRuleInput
        include JSON::Serializable

        # The configuration details for the telemetry rule, including the resource type, telemetry type,
        # destination configuration, and selection criteria for which resources the rule applies to.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::TelemetryRule

        # A unique name for the telemetry rule being created.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The key-value pairs to associate with the telemetry rule resource for categorization and management
        # purposes.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @rule : Types::TelemetryRule,
          @rule_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTelemetryRuleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created telemetry rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @rule_arn : String? = nil
        )
        end
      end

      # Information about a data source associated with the telemetry pipeline. For CloudWatch Logs sources,
      # this includes both a name and type extracted from the log event metadata. For third-party sources
      # (such as S3), this includes only a name, with the type field left empty.
      struct DataSource
        include JSON::Serializable

        # The name of the data source. For CloudWatch Logs sources, this corresponds to the data_source_name
        # from the log event metadata. For third-party sources, this is either the configured data_source_name
        # or defaults to the plugin name if not specified.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the data source. For CloudWatch Logs sources, this corresponds to the data_source_type
        # from the log event metadata. For third-party sources, this field is empty.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DeleteCentralizationRuleForOrganizationInput
        include JSON::Serializable

        # The identifier (name or ARN) of the organization centralization rule to delete.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule_identifier : String
        )
        end
      end

      struct DeleteS3TableIntegrationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 Table integration to delete.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteTelemetryPipelineInput
        include JSON::Serializable

        # The ARN of the telemetry pipeline to delete.
        @[JSON::Field(key: "PipelineIdentifier")]
        getter pipeline_identifier : String

        def initialize(
          @pipeline_identifier : String
        )
        end
      end

      struct DeleteTelemetryPipelineOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTelemetryRuleForOrganizationInput
        include JSON::Serializable

        # The identifier (name or ARN) of the organization telemetry rule to delete.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule_identifier : String
        )
        end
      end

      struct DeleteTelemetryRuleInput
        include JSON::Serializable

        # The identifier (name or ARN) of the telemetry rule to delete.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule_identifier : String
        )
        end
      end

      # Configuration for centralization destination log groups, including encryption and backup settings.
      struct DestinationLogsConfiguration
        include JSON::Serializable

        # Configuration defining the backup region and an optional KMS key for the backup destination.
        @[JSON::Field(key: "BackupConfiguration")]
        getter backup_configuration : Types::LogsBackupConfiguration?

        # The encryption configuration for centralization destination log groups.
        @[JSON::Field(key: "LogsEncryptionConfiguration")]
        getter logs_encryption_configuration : Types::LogsEncryptionConfiguration?

        def initialize(
          @backup_configuration : Types::LogsBackupConfiguration? = nil,
          @logs_encryption_configuration : Types::LogsEncryptionConfiguration? = nil
        )
        end
      end

      # Configuration parameters for ELB load balancer logging, including output format and field delimiter
      # settings.
      struct ELBLoadBalancerLoggingParameters
        include JSON::Serializable

        # The delimiter character used to separate fields in ELB access log entries when using plain text
        # format.
        @[JSON::Field(key: "FieldDelimiter")]
        getter field_delimiter : String?

        # The format for ELB access log entries (plain text or JSON format).
        @[JSON::Field(key: "OutputFormat")]
        getter output_format : String?

        def initialize(
          @field_delimiter : String? = nil,
          @output_format : String? = nil
        )
        end
      end

      # Defines the encryption configuration for S3 Table integrations, including the encryption algorithm
      # and KMS key settings.
      struct Encryption
        include JSON::Serializable

        # The server-side encryption algorithm used for encrypting data in the S3 Table integration.
        @[JSON::Field(key: "SseAlgorithm")]
        getter sse_algorithm : String

        # The Amazon Resource Name (ARN) of the KMS key used for encryption when using customer-managed keys.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @sse_algorithm : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Specifies a field in the request to redact from WAF logs, such as headers, query parameters, or body
      # content.
      struct FieldToMatch
        include JSON::Serializable

        # Redacts the HTTP method from WAF logs.
        @[JSON::Field(key: "Method")]
        getter method : String?

        # Redacts the entire query string from WAF logs.
        @[JSON::Field(key: "QueryString")]
        getter query_string : String?

        # Redacts a specific header field by name from WAF logs.
        @[JSON::Field(key: "SingleHeader")]
        getter single_header : Types::SingleHeader?

        # Redacts the URI path from WAF logs.
        @[JSON::Field(key: "UriPath")]
        getter uri_path : String?

        def initialize(
          @method : String? = nil,
          @query_string : String? = nil,
          @single_header : Types::SingleHeader? = nil,
          @uri_path : String? = nil
        )
        end
      end

      # A single filter condition that specifies behavior, requirement, and matching conditions for WAF log
      # records.
      struct Filter
        include JSON::Serializable

        # The action to take for log records matching this filter (KEEP or DROP).
        @[JSON::Field(key: "Behavior")]
        getter behavior : String?

        # The list of conditions that determine if a log record matches this filter.
        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::Condition)?

        # Whether the log record must meet all conditions (MEETS_ALL) or any condition (MEETS_ANY) to match
        # this filter.
        @[JSON::Field(key: "Requirement")]
        getter requirement : String?

        def initialize(
          @behavior : String? = nil,
          @conditions : Array(Types::Condition)? = nil,
          @requirement : String? = nil
        )
        end
      end

      struct GetCentralizationRuleForOrganizationInput
        include JSON::Serializable

        # The identifier (name or ARN) of the organization centralization rule to retrieve.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule_identifier : String
        )
        end
      end

      struct GetCentralizationRuleForOrganizationOutput
        include JSON::Serializable

        # The configuration details for the organization centralization rule.
        @[JSON::Field(key: "CentralizationRule")]
        getter centralization_rule : Types::CentralizationRule?

        # The Amazon Web Services region where the organization centralization rule was created.
        @[JSON::Field(key: "CreatedRegion")]
        getter created_region : String?

        # The timestamp when the organization centralization rule was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The Amazon Web Services Account that created the organization centralization rule.
        @[JSON::Field(key: "CreatorAccountId")]
        getter creator_account_id : String?

        # The reason why an organization centralization rule is marked UNHEALTHY.
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The timestamp when the organization centralization rule was last updated.
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The Amazon Resource Name (ARN) of the organization centralization rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The health status of the organization centralization rule.
        @[JSON::Field(key: "RuleHealth")]
        getter rule_health : String?

        # The name of the organization centralization rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        def initialize(
          @centralization_rule : Types::CentralizationRule? = nil,
          @created_region : String? = nil,
          @created_time_stamp : Int64? = nil,
          @creator_account_id : String? = nil,
          @failure_reason : String? = nil,
          @last_update_time_stamp : Int64? = nil,
          @rule_arn : String? = nil,
          @rule_health : String? = nil,
          @rule_name : String? = nil
        )
        end
      end

      struct GetS3TableIntegrationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 Table integration to retrieve.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetS3TableIntegrationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 Table integration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp when the S3 Table integration was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The Amazon Resource Name (ARN) of the S3 bucket used as the destination for the table data.
        @[JSON::Field(key: "DestinationTableBucketArn")]
        getter destination_table_bucket_arn : String?

        # The encryption configuration for the S3 Table integration.
        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::Encryption?

        # The Amazon Resource Name (ARN) of the IAM role used by the S3 Table integration.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The current status of the S3 Table integration.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @created_time_stamp : Int64? = nil,
          @destination_table_bucket_arn : String? = nil,
          @encryption : Types::Encryption? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetTelemetryEnrichmentStatusOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Resource Explorer managed view used for resource tags for
        # telemetry, if the feature is enabled.
        @[JSON::Field(key: "AwsResourceExplorerManagedViewArn")]
        getter aws_resource_explorer_managed_view_arn : String?

        # The current status of the resource tags for telemetry feature ( Running , Stopped , or Impaired ).
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @aws_resource_explorer_managed_view_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetTelemetryEvaluationStatusForOrganizationOutput
        include JSON::Serializable

        # This field describes the reason for the failure status. The field will only be populated if Status
        # is FAILED_START or FAILED_STOP .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The onboarding status of the telemetry config feature for the organization.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @failure_reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetTelemetryEvaluationStatusOutput
        include JSON::Serializable

        # Describes the reason for the failure status. The field will only be populated if Status is
        # FAILED_START or FAILED_STOP .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The onboarding status of the telemetry config feature.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @failure_reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetTelemetryPipelineInput
        include JSON::Serializable

        # The identifier (name or ARN) of the telemetry pipeline to retrieve.
        @[JSON::Field(key: "PipelineIdentifier")]
        getter pipeline_identifier : String

        def initialize(
          @pipeline_identifier : String
        )
        end
      end

      struct GetTelemetryPipelineOutput
        include JSON::Serializable

        # The complete telemetry pipeline resource information, including configuration, status, and metadata.
        @[JSON::Field(key: "Pipeline")]
        getter pipeline : Types::TelemetryPipeline?

        def initialize(
          @pipeline : Types::TelemetryPipeline? = nil
        )
        end
      end

      struct GetTelemetryRuleForOrganizationInput
        include JSON::Serializable

        # The identifier (name or ARN) of the organization telemetry rule to retrieve.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule_identifier : String
        )
        end
      end

      struct GetTelemetryRuleForOrganizationOutput
        include JSON::Serializable

        # The timestamp when the organization telemetry rule was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The timestamp when the organization telemetry rule was last updated.
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The Amazon Resource Name (ARN) of the organization telemetry rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The name of the organization telemetry rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # The configuration details of the organization telemetry rule.
        @[JSON::Field(key: "TelemetryRule")]
        getter telemetry_rule : Types::TelemetryRule?

        def initialize(
          @created_time_stamp : Int64? = nil,
          @last_update_time_stamp : Int64? = nil,
          @rule_arn : String? = nil,
          @rule_name : String? = nil,
          @telemetry_rule : Types::TelemetryRule? = nil
        )
        end
      end

      struct GetTelemetryRuleInput
        include JSON::Serializable

        # The identifier (name or ARN) of the telemetry rule to retrieve.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule_identifier : String
        )
        end
      end

      struct GetTelemetryRuleOutput
        include JSON::Serializable

        # The timestamp when the telemetry rule was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The timestamp when the telemetry rule was last updated.
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The Amazon Resource Name (ARN) of the telemetry rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The name of the telemetry rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # The configuration details of the telemetry rule.
        @[JSON::Field(key: "TelemetryRule")]
        getter telemetry_rule : Types::TelemetryRule?

        def initialize(
          @created_time_stamp : Int64? = nil,
          @last_update_time_stamp : Int64? = nil,
          @rule_arn : String? = nil,
          @rule_name : String? = nil,
          @telemetry_rule : Types::TelemetryRule? = nil
        )
        end
      end

      # Contains summary information about an S3 Table integration for listing operations.
      struct IntegrationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 Table integration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The current status of the S3 Table integration.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Indicates the request has failed to process because of an unknown server error, exception, or
      # failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        # The number of seconds to wait before retrying the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String? = nil,
          @amzn_error_type : String? = nil,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The requested operation cannot be completed on the specified resource in the current state.
      struct InvalidStateException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Condition that matches based on WAF rule labels, with label names limited to 1024 characters.
      struct LabelNameCondition
        include JSON::Serializable

        # The label name to match, supporting alphanumeric characters, underscores, hyphens, and colons.
        @[JSON::Field(key: "LabelName")]
        getter label_name : String?

        def initialize(
          @label_name : String? = nil
        )
        end
      end

      struct ListCentralizationRulesForOrganizationInput
        include JSON::Serializable

        # A flag determining whether to return organization centralization rules from all regions or only the
        # current region.
        @[JSON::Field(key: "AllRegions")]
        getter all_regions : Bool?

        # The maximum number of organization centralization rules to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. A previous call generates this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string to filter organization centralization rules whose names begin with the specified prefix.
        @[JSON::Field(key: "RuleNamePrefix")]
        getter rule_name_prefix : String?

        def initialize(
          @all_regions : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @rule_name_prefix : String? = nil
        )
        end
      end

      struct ListCentralizationRulesForOrganizationOutput
        include JSON::Serializable

        # A list of centralization rule summaries.
        @[JSON::Field(key: "CentralizationRuleSummaries")]
        getter centralization_rule_summaries : Array(Types::CentralizationRuleSummary)?

        # A token to resume pagination of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @centralization_rule_summaries : Array(Types::CentralizationRuleSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceTelemetryForOrganizationInput
        include JSON::Serializable

        # A list of Amazon Web Services accounts used to filter the resources to those associated with the
        # specified accounts.
        @[JSON::Field(key: "AccountIdentifiers")]
        getter account_identifiers : Array(String)?

        # A number field used to limit the number of results within the returned list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. A previous call provides this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string used to filter resources in the organization which have a ResourceIdentifier starting with
        # the ResourceIdentifierPrefix .
        @[JSON::Field(key: "ResourceIdentifierPrefix")]
        getter resource_identifier_prefix : String?

        # A key-value pair to filter resources in the organization based on tags associated with the resource.
        # Fore more information about tags, see What are tags?
        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Hash(String, String)?

        # A list of resource types used to filter resources in the organization. If this parameter is
        # provided, the resources will be returned in the same order used in the request.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # A key-value pair to filter resources in the organization based on the telemetry type and the state
        # of the telemetry configuration. The key is the telemetry type and the value is the state.
        @[JSON::Field(key: "TelemetryConfigurationState")]
        getter telemetry_configuration_state : Hash(String, String)?

        def initialize(
          @account_identifiers : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier_prefix : String? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @resource_types : Array(String)? = nil,
          @telemetry_configuration_state : Hash(String, String)? = nil
        )
        end
      end

      struct ListResourceTelemetryForOrganizationOutput
        include JSON::Serializable

        # The token for the next set of items to return. A previous call provides this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of telemetry configurations for Amazon Web Services resources supported by telemetry config
        # in the organization.
        @[JSON::Field(key: "TelemetryConfigurations")]
        getter telemetry_configurations : Array(Types::TelemetryConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @telemetry_configurations : Array(Types::TelemetryConfiguration)? = nil
        )
        end
      end

      struct ListResourceTelemetryInput
        include JSON::Serializable

        # A number field used to limit the number of results within the returned list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. A previous call generates this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string used to filter resources which have a ResourceIdentifier starting with the
        # ResourceIdentifierPrefix .
        @[JSON::Field(key: "ResourceIdentifierPrefix")]
        getter resource_identifier_prefix : String?

        # A key-value pair to filter resources based on tags associated with the resource. For more
        # information about tags, see What are tags?
        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Hash(String, String)?

        # A list of resource types used to filter resources supported by telemetry config. If this parameter
        # is provided, the resources will be returned in the same order used in the request.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # A key-value pair to filter resources based on the telemetry type and the state of the telemetry
        # configuration. The key is the telemetry type and the value is the state.
        @[JSON::Field(key: "TelemetryConfigurationState")]
        getter telemetry_configuration_state : Hash(String, String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier_prefix : String? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @resource_types : Array(String)? = nil,
          @telemetry_configuration_state : Hash(String, String)? = nil
        )
        end
      end

      struct ListResourceTelemetryOutput
        include JSON::Serializable

        # The token for the next set of items to return. A previous call generates this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of telemetry configurations for Amazon Web Services resources supported by telemetry config
        # in the caller's account.
        @[JSON::Field(key: "TelemetryConfigurations")]
        getter telemetry_configurations : Array(Types::TelemetryConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @telemetry_configurations : Array(Types::TelemetryConfiguration)? = nil
        )
        end
      end

      struct ListS3TableIntegrationsInput
        include JSON::Serializable

        # The maximum number of S3 Table integrations to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. A previous call generates this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListS3TableIntegrationsOutput
        include JSON::Serializable

        # A list of S3 Table integration summaries containing key information about each integration.
        @[JSON::Field(key: "IntegrationSummaries")]
        getter integration_summaries : Array(Types::IntegrationSummary)?

        # A token to resume pagination of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @integration_summaries : Array(Types::IntegrationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the telemetry rule resource whose tags you want to list.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tags associated with the telemetry rule resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      struct ListTelemetryPipelinesInput
        include JSON::Serializable

        # The maximum number of telemetry pipelines to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. A previous call generates this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTelemetryPipelinesOutput
        include JSON::Serializable

        # A token to resume pagination of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of telemetry pipeline summaries containing key information about each pipeline.
        @[JSON::Field(key: "PipelineSummaries")]
        getter pipeline_summaries : Array(Types::TelemetryPipelineSummary)?

        def initialize(
          @next_token : String? = nil,
          @pipeline_summaries : Array(Types::TelemetryPipelineSummary)? = nil
        )
        end
      end

      struct ListTelemetryRulesForOrganizationInput
        include JSON::Serializable

        # The maximum number of organization telemetry rules to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. A previous call generates this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string to filter organization telemetry rules whose names begin with the specified prefix.
        @[JSON::Field(key: "RuleNamePrefix")]
        getter rule_name_prefix : String?

        # The list of account IDs to filter organization telemetry rules by their source accounts.
        @[JSON::Field(key: "SourceAccountIds")]
        getter source_account_ids : Array(String)?

        # The list of organizational unit IDs to filter organization telemetry rules by their source
        # organizational units.
        @[JSON::Field(key: "SourceOrganizationUnitIds")]
        getter source_organization_unit_ids : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @rule_name_prefix : String? = nil,
          @source_account_ids : Array(String)? = nil,
          @source_organization_unit_ids : Array(String)? = nil
        )
        end
      end

      struct ListTelemetryRulesForOrganizationOutput
        include JSON::Serializable

        # A token to resume pagination of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of organization telemetry rule summaries.
        @[JSON::Field(key: "TelemetryRuleSummaries")]
        getter telemetry_rule_summaries : Array(Types::TelemetryRuleSummary)?

        def initialize(
          @next_token : String? = nil,
          @telemetry_rule_summaries : Array(Types::TelemetryRuleSummary)? = nil
        )
        end
      end

      struct ListTelemetryRulesInput
        include JSON::Serializable

        # The maximum number of telemetry rules to return in a single call.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. A previous call generates this token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string to filter telemetry rules whose names begin with the specified prefix.
        @[JSON::Field(key: "RuleNamePrefix")]
        getter rule_name_prefix : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @rule_name_prefix : String? = nil
        )
        end
      end

      struct ListTelemetryRulesOutput
        include JSON::Serializable

        # A token to resume pagination of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of telemetry rule summaries.
        @[JSON::Field(key: "TelemetryRuleSummaries")]
        getter telemetry_rule_summaries : Array(Types::TelemetryRuleSummary)?

        def initialize(
          @next_token : String? = nil,
          @telemetry_rule_summaries : Array(Types::TelemetryRuleSummary)? = nil
        )
        end
      end

      # Configuration parameters for Amazon Bedrock AgentCore logging, including logType settings.
      struct LogDeliveryParameters
        include JSON::Serializable

        # The type of log that the source is sending.
        @[JSON::Field(key: "LogTypes")]
        getter log_types : Array(String)?

        def initialize(
          @log_types : Array(String)? = nil
        )
        end
      end

      # Configuration that determines which WAF log records to keep or drop based on specified conditions.
      struct LoggingFilter
        include JSON::Serializable

        # The default action (KEEP or DROP) for log records that don't match any filter conditions.
        @[JSON::Field(key: "DefaultBehavior")]
        getter default_behavior : String?

        # A list of filter conditions that determine log record handling behavior.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        def initialize(
          @default_behavior : String? = nil,
          @filters : Array(Types::Filter)? = nil
        )
        end
      end

      # Configuration for backing up centralized log data to a secondary region.
      struct LogsBackupConfiguration
        include JSON::Serializable

        # Logs specific backup destination region within the primary destination account to which log data
        # should be centralized.
        @[JSON::Field(key: "Region")]
        getter region : String

        # KMS Key ARN belonging to the primary destination account and backup region, to encrypt newly created
        # central log groups in the backup destination.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @region : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Configuration for encrypting centralized log groups. This configuration is only applied to
      # destination log groups for which the corresponding source log groups are encrypted using Customer
      # Managed KMS Keys.
      struct LogsEncryptionConfiguration
        include JSON::Serializable

        # Configuration that determines the encryption strategy of the destination log groups.
        # CUSTOMER_MANAGED uses the configured KmsKeyArn to encrypt newly created destination log groups.
        @[JSON::Field(key: "EncryptionStrategy")]
        getter encryption_strategy : String

        # Conflict resolution strategy for centralization if the encryption strategy is set to
        # CUSTOMER_MANAGED and the destination log group is encrypted with an AWS_OWNED KMS Key. ALLOW lets
        # centralization go through while SKIP prevents centralization into the destination log group.
        @[JSON::Field(key: "EncryptionConflictResolutionStrategy")]
        getter encryption_conflict_resolution_strategy : String?

        # KMS Key ARN belonging to the primary destination account and region, to encrypt newly created
        # central log groups in the primary destination.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @encryption_strategy : String,
          @encryption_conflict_resolution_strategy : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Contains the output from pipeline test operations, including processed records and any errors
      # encountered.
      struct PipelineOutput
        include JSON::Serializable

        # Any error that occurred during the pipeline test operation for this record.
        @[JSON::Field(key: "Error")]
        getter error : Types::PipelineOutputError?

        # The processed record output from the pipeline test operation.
        @[JSON::Field(key: "Record")]
        getter record : Types::Record?

        def initialize(
          @error : Types::PipelineOutputError? = nil,
          @record : Types::Record? = nil
        )
        end
      end

      # Contains detailed error information from pipeline test operations, providing structured error
      # responses for better debugging and troubleshooting capabilities.
      struct PipelineOutputError
        include JSON::Serializable

        # The detailed error message describing what went wrong during the pipeline test operation for this
        # record.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a test record structure used for pipeline testing operations to validate data processing.
      struct Record
        include JSON::Serializable

        # The data content of the test record used for pipeline validation.
        @[JSON::Field(key: "Data")]
        getter data : String?

        # The type of the test record, indicating the format or category of the data.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @data : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified resource (such as a telemetry rule) could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The identifier of the resource which could not be found.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the resource which could not be found.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The requested operation would exceed the allowed quota for the specified resource type.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The code for the exceeded service quota.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The identifier of the resource which exceeds the service quota.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the resource which exceeds the service quota.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The code for the service of the exceeded quota.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil,
          @amzn_error_type : String? = nil
        )
        end
      end

      # Structure containing a name field limited to 64 characters for header or query parameter
      # identification.
      struct SingleHeader
        include JSON::Serializable

        # The name value, limited to 64 characters.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # A list of source plugin types used in the pipeline configuration (such as cloudwatch_logs or s3 ).
      # Currently supports a single source per pipeline, but is structured as a list to accommodate multiple
      # pipelines in the configuration.
      struct Source
        include JSON::Serializable

        # The plugin name of the source, such as cloudwatch_logs or s3 .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # Configuration for selecting and handling source log groups for centralization.
      struct SourceLogsConfiguration
        include JSON::Serializable

        # A strategy determining whether to centralize source log groups that are encrypted with customer
        # managed KMS keys (CMK). ALLOW will consider CMK encrypted source log groups for centralization while
        # SKIP will skip CMK encrypted source log groups from centralization.
        @[JSON::Field(key: "EncryptedLogGroupStrategy")]
        getter encrypted_log_group_strategy : String

        # The selection criteria that specifies which source log groups to centralize. The selection criteria
        # uses the same format as OAM link filters.
        @[JSON::Field(key: "LogGroupSelectionCriteria")]
        getter log_group_selection_criteria : String

        def initialize(
          @encrypted_log_group_strategy : String,
          @log_group_selection_criteria : String
        )
        end
      end

      struct StartTelemetryEnrichmentOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Resource Explorer managed view created for resource tags for
        # telemetry.
        @[JSON::Field(key: "AwsResourceExplorerManagedViewArn")]
        getter aws_resource_explorer_managed_view_arn : String?

        # The status of the resource tags for telemetry feature after the start operation ( Running , Stopped
        # , or Impaired ).
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @aws_resource_explorer_managed_view_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct StopTelemetryEnrichmentOutput
        include JSON::Serializable

        # The status of the resource tags for telemetry feature after the stop operation ( Running , Stopped ,
        # or Impaired ).
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the telemetry rule resource to tag.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The key-value pairs to add or update for the telemetry rule resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # A model representing the state of a resource within an account according to telemetry config.
      struct TelemetryConfiguration
        include JSON::Serializable

        # The account ID which contains the resource managed in telemetry configuration. An example of a valid
        # account ID is 012345678901 .
        @[JSON::Field(key: "AccountIdentifier")]
        getter account_identifier : String?

        # The timestamp of the last change to the telemetry configuration for the resource. For example,
        # 1728679196318 .
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The identifier of the resource, for example for Amazon VPC, it would be vpc-1a2b3c4d5e6f1a2b3 .
        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # Tags associated with the resource, for example { Name: "ExampleInstance", Environment: "Development"
        # } .
        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Hash(String, String)?

        # The type of resource, for example Amazon Web Services::EC2::Instance , or Amazon Web
        # Services::EKS::Cluster , etc.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The configuration state for the resource, for example { Logs: NotApplicable; Metrics: Enabled;
        # Traces: NotApplicable; } .
        @[JSON::Field(key: "TelemetryConfigurationState")]
        getter telemetry_configuration_state : Hash(String, String)?

        def initialize(
          @account_identifier : String? = nil,
          @last_update_time_stamp : Int64? = nil,
          @resource_identifier : String? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @resource_type : String? = nil,
          @telemetry_configuration_state : Hash(String, String)? = nil
        )
        end
      end

      # Configuration specifying where and how telemetry data should be delivered for Amazon Web Services
      # resources.
      struct TelemetryDestinationConfiguration
        include JSON::Serializable

        # Configuration parameters specific to Amazon Web Services CloudTrail when CloudTrail is the source
        # type.
        @[JSON::Field(key: "CloudtrailParameters")]
        getter cloudtrail_parameters : Types::CloudtrailParameters?

        # The pattern used to generate the destination path or name, supporting macros like &lt;resourceId&gt;
        # and &lt;accountId&gt;.
        @[JSON::Field(key: "DestinationPattern")]
        getter destination_pattern : String?

        # The type of destination for the telemetry data (e.g., "Amazon CloudWatch Logs", "S3").
        @[JSON::Field(key: "DestinationType")]
        getter destination_type : String?

        # Configuration parameters specific to ELB load balancer logging when ELB is the resource type.
        @[JSON::Field(key: "ELBLoadBalancerLoggingParameters")]
        getter elb_load_balancer_logging_parameters : Types::ELBLoadBalancerLoggingParameters?

        # Configuration parameters specific to Amazon Bedrock AgentCore logging when Amazon Bedrock AgentCore
        # is the resource type.
        @[JSON::Field(key: "LogDeliveryParameters")]
        getter log_delivery_parameters : Types::LogDeliveryParameters?

        # The number of days to retain the telemetry data in the destination.
        @[JSON::Field(key: "RetentionInDays")]
        getter retention_in_days : Int32?

        # Configuration parameters specific to VPC Flow Logs when VPC is the resource type.
        @[JSON::Field(key: "VPCFlowLogParameters")]
        getter vpc_flow_log_parameters : Types::VPCFlowLogParameters?

        # Configuration parameters specific to WAF logging when WAF is the resource type.
        @[JSON::Field(key: "WAFLoggingParameters")]
        getter waf_logging_parameters : Types::WAFLoggingParameters?

        def initialize(
          @cloudtrail_parameters : Types::CloudtrailParameters? = nil,
          @destination_pattern : String? = nil,
          @destination_type : String? = nil,
          @elb_load_balancer_logging_parameters : Types::ELBLoadBalancerLoggingParameters? = nil,
          @log_delivery_parameters : Types::LogDeliveryParameters? = nil,
          @retention_in_days : Int32? = nil,
          @vpc_flow_log_parameters : Types::VPCFlowLogParameters? = nil,
          @waf_logging_parameters : Types::WAFLoggingParameters? = nil
        )
        end
      end

      # Represents a complete telemetry pipeline resource with configuration, status, and metadata for data
      # processing and transformation.
      struct TelemetryPipeline
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the telemetry pipeline.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The configuration that defines how the telemetry pipeline processes data.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::TelemetryPipelineConfiguration?

        # The timestamp when the telemetry pipeline was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The timestamp when the telemetry pipeline was last updated.
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The name of the telemetry pipeline.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the telemetry pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the pipeline status, including reasons for failure states.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : Types::TelemetryPipelineStatusReason?

        # The key-value pairs associated with the telemetry pipeline resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @configuration : Types::TelemetryPipelineConfiguration? = nil,
          @created_time_stamp : Int64? = nil,
          @last_update_time_stamp : Int64? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_reason : Types::TelemetryPipelineStatusReason? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines the configuration for a telemetry pipeline, including how data flows from sources through
      # processors to destinations.
      struct TelemetryPipelineConfiguration
        include JSON::Serializable

        # The pipeline configuration body that defines the data processing rules and transformations.
        @[JSON::Field(key: "Body")]
        getter body : String

        def initialize(
          @body : String
        )
        end
      end

      # Provides detailed information about the status of a telemetry pipeline, including reasons for
      # specific states.
      struct TelemetryPipelineStatusReason
        include JSON::Serializable

        # A description of the pipeline status reason, providing additional context about the current state.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end

      # Contains summary information about a telemetry pipeline for listing operations.
      struct TelemetryPipelineSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the telemetry pipeline.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A summary of the pipeline configuration components.
        @[JSON::Field(key: "ConfigurationSummary")]
        getter configuration_summary : Types::ConfigurationSummary?

        # The timestamp when the telemetry pipeline was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The timestamp when the telemetry pipeline was last updated.
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The name of the telemetry pipeline.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the telemetry pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The key-value pairs associated with the telemetry pipeline resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @configuration_summary : Types::ConfigurationSummary? = nil,
          @created_time_stamp : Int64? = nil,
          @last_update_time_stamp : Int64? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines how telemetry should be configured for specific Amazon Web Services resources.
      struct TelemetryRule
        include JSON::Serializable

        # The type of telemetry to collect (Logs, Metrics, or Traces).
        @[JSON::Field(key: "TelemetryType")]
        getter telemetry_type : String

        # Configuration specifying where and how the telemetry data should be delivered.
        @[JSON::Field(key: "DestinationConfiguration")]
        getter destination_configuration : Types::TelemetryDestinationConfiguration?

        # The type of Amazon Web Services resource to configure telemetry for (e.g., "AWS::EC2::VPC",
        # "AWS::EKS::Cluster", "AWS::WAFv2::WebACL").
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The organizational scope to which the rule applies, specified using accounts or organizational
        # units.
        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # Criteria for selecting which resources the rule applies to, such as resource tags.
        @[JSON::Field(key: "SelectionCriteria")]
        getter selection_criteria : String?

        # The specific telemetry source types to configure for the resource, such as VPC_FLOW_LOGS or
        # EKS_AUDIT_LOGS. TelemetrySourceTypes must be correlated with the specific resource type.
        @[JSON::Field(key: "TelemetrySourceTypes")]
        getter telemetry_source_types : Array(String)?

        def initialize(
          @telemetry_type : String,
          @destination_configuration : Types::TelemetryDestinationConfiguration? = nil,
          @resource_type : String? = nil,
          @scope : String? = nil,
          @selection_criteria : String? = nil,
          @telemetry_source_types : Array(String)? = nil
        )
        end
      end

      # A summary of a telemetry rule's key properties.
      struct TelemetryRuleSummary
        include JSON::Serializable

        # The timestamp when the telemetry rule was created.
        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Int64?

        # The timestamp when the telemetry rule was last modified.
        @[JSON::Field(key: "LastUpdateTimeStamp")]
        getter last_update_time_stamp : Int64?

        # The type of Amazon Web Services resource the rule applies to.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The Amazon Resource Name (ARN) of the telemetry rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The name of the telemetry rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # The types of telemetry sources configured for this rule, such as VPC Flow Logs or EKS audit logs.
        # TelemetrySourceTypes must be correlated with the specific resource type.
        @[JSON::Field(key: "TelemetrySourceTypes")]
        getter telemetry_source_types : Array(String)?

        # The type of telemetry (Logs, Metrics, or Traces) the rule configures.
        @[JSON::Field(key: "TelemetryType")]
        getter telemetry_type : String?

        def initialize(
          @created_time_stamp : Int64? = nil,
          @last_update_time_stamp : Int64? = nil,
          @resource_type : String? = nil,
          @rule_arn : String? = nil,
          @rule_name : String? = nil,
          @telemetry_source_types : Array(String)? = nil,
          @telemetry_type : String? = nil
        )
        end
      end

      struct TestTelemetryPipelineInput
        include JSON::Serializable

        # The pipeline configuration to test with the provided sample records.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::TelemetryPipelineConfiguration

        # The sample records to process through the pipeline configuration for testing purposes.
        @[JSON::Field(key: "Records")]
        getter records : Array(Types::Record)

        def initialize(
          @configuration : Types::TelemetryPipelineConfiguration,
          @records : Array(Types::Record)
        )
        end
      end

      struct TestTelemetryPipelineOutput
        include JSON::Serializable

        # The results of processing the test records through the pipeline configuration, including any outputs
        # or errors.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::PipelineOutput)?

        def initialize(
          @results : Array(Types::PipelineOutput)? = nil
        )
        end
      end

      # The request throughput limit was exceeded.
      struct TooManyRequestsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the telemetry rule resource to remove tags from.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The list of tag keys to remove from the telemetry rule resource.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateCentralizationRuleForOrganizationInput
        include JSON::Serializable

        # The configuration details for the organization-wide centralization rule, including the source
        # configuration and the destination configuration to centralize telemetry data across the
        # organization.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::CentralizationRule

        # The identifier (name or ARN) of the organization centralization rule to update.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule : Types::CentralizationRule,
          @rule_identifier : String
        )
        end
      end

      struct UpdateCentralizationRuleForOrganizationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated organization centralization rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @rule_arn : String? = nil
        )
        end
      end

      struct UpdateTelemetryPipelineInput
        include JSON::Serializable

        # The new configuration for the telemetry pipeline, including updated sources, processors, and
        # destinations.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::TelemetryPipelineConfiguration

        # The ARN of the telemetry pipeline to update.
        @[JSON::Field(key: "PipelineIdentifier")]
        getter pipeline_identifier : String

        def initialize(
          @configuration : Types::TelemetryPipelineConfiguration,
          @pipeline_identifier : String
        )
        end
      end

      struct UpdateTelemetryPipelineOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateTelemetryRuleForOrganizationInput
        include JSON::Serializable

        # The new configuration details for the organization telemetry rule, including resource type,
        # telemetry type, and destination configuration.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::TelemetryRule

        # The identifier (name or ARN) of the organization telemetry rule to update.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule : Types::TelemetryRule,
          @rule_identifier : String
        )
        end
      end

      struct UpdateTelemetryRuleForOrganizationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated organization telemetry rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @rule_arn : String? = nil
        )
        end
      end

      struct UpdateTelemetryRuleInput
        include JSON::Serializable

        # The new configuration details for the telemetry rule.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::TelemetryRule

        # The identifier (name or ARN) of the telemetry rule to update.
        @[JSON::Field(key: "RuleIdentifier")]
        getter rule_identifier : String

        def initialize(
          @rule : Types::TelemetryRule,
          @rule_identifier : String
        )
        end
      end

      struct UpdateTelemetryRuleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated telemetry rule.
        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @rule_arn : String? = nil
        )
        end
      end

      # Configuration parameters specific to VPC Flow Logs.
      struct VPCFlowLogParameters
        include JSON::Serializable

        # The format in which VPC Flow Log entries should be logged.
        @[JSON::Field(key: "LogFormat")]
        getter log_format : String?

        # The maximum interval in seconds between the capture of flow log records.
        @[JSON::Field(key: "MaxAggregationInterval")]
        getter max_aggregation_interval : Int32?

        # The type of traffic to log (ACCEPT, REJECT, or ALL).
        @[JSON::Field(key: "TrafficType")]
        getter traffic_type : String?

        def initialize(
          @log_format : String? = nil,
          @max_aggregation_interval : Int32? = nil,
          @traffic_type : String? = nil
        )
        end
      end

      struct ValidateTelemetryPipelineConfigurationInput
        include JSON::Serializable

        # The pipeline configuration to validate for syntax and compatibility.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::TelemetryPipelineConfiguration

        def initialize(
          @configuration : Types::TelemetryPipelineConfiguration
        )
        end
      end

      struct ValidateTelemetryPipelineConfigurationOutput
        include JSON::Serializable

        # A list of validation errors found in the pipeline configuration, if any.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::ValidationError)?

        def initialize(
          @errors : Array(Types::ValidationError)? = nil
        )
        end
      end

      # Represents a detailed validation error with message, reason, and field mapping for comprehensive
      # error reporting.
      struct ValidationError
        include JSON::Serializable

        # A mapping of field names to specific validation issues within the configuration.
        @[JSON::Field(key: "FieldMap")]
        getter field_map : Hash(String, String)?

        # The error message describing the validation issue.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason code or category for the validation error.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @field_map : Hash(String, String)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Indicates input validation failed. Check your request parameters and retry the request.
      struct ValidationException
        include JSON::Serializable

        # The errors in the input which caused the exception.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::ValidationError)?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @errors : Array(Types::ValidationError)? = nil,
          @message : String? = nil
        )
        end
      end

      # Configuration parameters for WAF logging, including redacted fields and logging filters.
      struct WAFLoggingParameters
        include JSON::Serializable

        # The type of WAF logs to collect (currently supports WAF_LOGS).
        @[JSON::Field(key: "LogType")]
        getter log_type : String?

        # A filter configuration that determines which WAF log records to include or exclude.
        @[JSON::Field(key: "LoggingFilter")]
        getter logging_filter : Types::LoggingFilter?

        # The fields to redact from WAF logs to protect sensitive information.
        @[JSON::Field(key: "RedactedFields")]
        getter redacted_fields : Array(Types::FieldToMatch)?

        def initialize(
          @log_type : String? = nil,
          @logging_filter : Types::LoggingFilter? = nil,
          @redacted_fields : Array(Types::FieldToMatch)? = nil
        )
        end
      end
    end
  end
end
