require "json"
require "time"

module AwsSdk
  module Amp
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The details of an alert manager definition. It is the configuration for the alert manager, including
      # information about receivers for routing alerts.
      struct AlertManagerDefinitionDescription
        include JSON::Serializable

        # The date and time that the alert manager definition was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The actual alert manager definition. For details about the alert manager definition, see
        # AlertManagedDefinitionData .
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The date and time that the alert manager definition was most recently changed.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # A structure that displays the current status of the alert manager definition..
        @[JSON::Field(key: "status")]
        getter status : Types::AlertManagerDefinitionStatus

        def initialize(
          @created_at : Time,
          @data : Bytes,
          @modified_at : Time,
          @status : Types::AlertManagerDefinitionStatus
        )
        end
      end

      # The status of the alert manager.
      struct AlertManagerDefinitionStatus
        include JSON::Serializable

        # The current status of the alert manager.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        # If there is a failure, the reason for the failure.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String,
          @status_reason : String? = nil
        )
        end
      end

      # The AmpConfiguration structure defines the Amazon Managed Service for Prometheus instance a scraper
      # should send metrics to.
      struct AmpConfiguration
        include JSON::Serializable

        # ARN of the Amazon Managed Service for Prometheus workspace.
        @[JSON::Field(key: "workspaceArn")]
        getter workspace_arn : String

        def initialize(
          @workspace_arn : String
        )
        end
      end

      # The configuration for the anomaly detection algorithm.
      struct AnomalyDetectorConfiguration
        include JSON::Serializable

        # The Random Cut Forest algorithm configuration for anomaly detection.
        @[JSON::Field(key: "randomCutForest")]
        getter random_cut_forest : Types::RandomCutForestConfiguration?

        def initialize(
          @random_cut_forest : Types::RandomCutForestConfiguration? = nil
        )
        end
      end

      # Detailed information about an anomaly detector.
      struct AnomalyDetectorDescription
        include JSON::Serializable

        # The user-friendly name of the anomaly detector.
        @[JSON::Field(key: "alias")]
        getter alias : String

        # The unique identifier of the anomaly detector.
        @[JSON::Field(key: "anomalyDetectorId")]
        getter anomaly_detector_id : String

        # The Amazon Resource Name (ARN) of the anomaly detector.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp when the anomaly detector was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the anomaly detector was last modified.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The current status of the anomaly detector.
        @[JSON::Field(key: "status")]
        getter status : Types::AnomalyDetectorStatus

        # The algorithm configuration of the anomaly detector.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AnomalyDetectorConfiguration?

        # The frequency, in seconds, at which the anomaly detector evaluates metrics.
        @[JSON::Field(key: "evaluationIntervalInSeconds")]
        getter evaluation_interval_in_seconds : Int32?

        # The Amazon Managed Service for Prometheus metric labels associated with the anomaly detector.
        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # The action taken when data is missing during evaluation.
        @[JSON::Field(key: "missingDataAction")]
        getter missing_data_action : Types::AnomalyDetectorMissingDataAction?

        # The tags applied to the anomaly detector.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @alias : String,
          @anomaly_detector_id : String,
          @arn : String,
          @created_at : Time,
          @modified_at : Time,
          @status : Types::AnomalyDetectorStatus,
          @configuration : Types::AnomalyDetectorConfiguration? = nil,
          @evaluation_interval_in_seconds : Int32? = nil,
          @labels : Hash(String, String)? = nil,
          @missing_data_action : Types::AnomalyDetectorMissingDataAction? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the action to take when data is missing during anomaly detection evaluation.
      struct AnomalyDetectorMissingDataAction
        include JSON::Serializable

        # Marks missing data points as anomalies.
        @[JSON::Field(key: "markAsAnomaly")]
        getter mark_as_anomaly : Bool?

        # Skips evaluation when data is missing.
        @[JSON::Field(key: "skip")]
        getter skip : Bool?

        def initialize(
          @mark_as_anomaly : Bool? = nil,
          @skip : Bool? = nil
        )
        end
      end

      # The status information of an anomaly detector.
      struct AnomalyDetectorStatus
        include JSON::Serializable

        # The status code of the anomaly detector.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        # A description of the current status of the anomaly detector.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String,
          @status_reason : String? = nil
        )
        end
      end

      # Summary information about an anomaly detector for list operations.
      struct AnomalyDetectorSummary
        include JSON::Serializable

        # The user-friendly name of the anomaly detector.
        @[JSON::Field(key: "alias")]
        getter alias : String

        # The unique identifier of the anomaly detector.
        @[JSON::Field(key: "anomalyDetectorId")]
        getter anomaly_detector_id : String

        # The Amazon Resource Name (ARN) of the anomaly detector.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp when the anomaly detector was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the anomaly detector was last modified.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The current status of the anomaly detector.
        @[JSON::Field(key: "status")]
        getter status : Types::AnomalyDetectorStatus

        # The tags applied to the anomaly detector.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @alias : String,
          @anomaly_detector_id : String,
          @arn : String,
          @created_at : Time,
          @modified_at : Time,
          @status : Types::AnomalyDetectorStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration details for logging to CloudWatch Logs.
      struct CloudWatchLogDestination
        include JSON::Serializable

        # The ARN of the CloudWatch log group to which the vended log data will be published. This log group
        # must exist prior to calling this operation.
        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String

        def initialize(
          @log_group_arn : String
        )
        end
      end

      # Configuration settings for a scraper component.
      struct ComponentConfig
        include JSON::Serializable

        # Configuration options for the scraper component.
        @[JSON::Field(key: "options")]
        getter options : Hash(String, String)?

        def initialize(
          @options : Hash(String, String)? = nil
        )
        end
      end

      # The request would cause an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # Identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Represents the input of a CreateAlertManagerDefinition operation.
      struct CreateAlertManagerDefinitionRequest
        include JSON::Serializable

        # The alert manager definition to add. A base64-encoded version of the YAML alert manager definition
        # file. For details about the alert manager definition, see AlertManagedDefinitionData .
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The ID of the workspace to add the alert manager definition to.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @data : Bytes,
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the output of a CreateAlertManagerDefinition operation.
      struct CreateAlertManagerDefinitionResponse
        include JSON::Serializable

        # A structure that displays the current status of the alert manager definition.
        @[JSON::Field(key: "status")]
        getter status : Types::AlertManagerDefinitionStatus

        def initialize(
          @status : Types::AlertManagerDefinitionStatus
        )
        end
      end

      struct CreateAnomalyDetectorRequest
        include JSON::Serializable

        # A user-friendly name for the anomaly detector.
        @[JSON::Field(key: "alias")]
        getter alias : String

        # The algorithm configuration for the anomaly detector.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AnomalyDetectorConfiguration

        # The identifier of the workspace where the anomaly detector will be created.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The frequency, in seconds, at which the anomaly detector evaluates metrics. The default value is 60
        # seconds.
        @[JSON::Field(key: "evaluationIntervalInSeconds")]
        getter evaluation_interval_in_seconds : Int32?

        # The Amazon Managed Service for Prometheus metric labels to associate with the anomaly detector.
        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # Specifies the action to take when data is missing during evaluation.
        @[JSON::Field(key: "missingDataAction")]
        getter missing_data_action : Types::AnomalyDetectorMissingDataAction?

        # The metadata to apply to the anomaly detector to assist with categorization and organization.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @alias : String,
          @configuration : Types::AnomalyDetectorConfiguration,
          @workspace_id : String,
          @client_token : String? = nil,
          @evaluation_interval_in_seconds : Int32? = nil,
          @labels : Hash(String, String)? = nil,
          @missing_data_action : Types::AnomalyDetectorMissingDataAction? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAnomalyDetectorResponse
        include JSON::Serializable

        # The unique identifier of the created anomaly detector.
        @[JSON::Field(key: "anomalyDetectorId")]
        getter anomaly_detector_id : String

        # The Amazon Resource Name (ARN) of the created anomaly detector.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The status information of the created anomaly detector.
        @[JSON::Field(key: "status")]
        getter status : Types::AnomalyDetectorStatus

        # The tags applied to the created anomaly detector.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @anomaly_detector_id : String,
          @arn : String,
          @status : Types::AnomalyDetectorStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input of a CreateLoggingConfiguration operation.
      struct CreateLoggingConfigurationRequest
        include JSON::Serializable

        # The ARN of the CloudWatch log group to which the vended log data will be published. This log group
        # must exist prior to calling this operation.
        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String

        # The ID of the workspace to create the logging configuration for.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @log_group_arn : String,
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the output of a CreateLoggingConfiguration operation.
      struct CreateLoggingConfigurationResponse
        include JSON::Serializable

        # A structure that displays the current status of the logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::LoggingConfigurationStatus

        def initialize(
          @status : Types::LoggingConfigurationStatus
        )
        end
      end

      struct CreateQueryLoggingConfigurationRequest
        include JSON::Serializable

        # The destinations where query logs will be sent. Only CloudWatch Logs destination is supported. The
        # list must contain exactly one element.
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::LoggingDestination)

        # The ID of the workspace for which to create the query logging configuration.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # (Optional) A unique, case-sensitive identifier that you can provide to ensure the idempotency of the
        # request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @destinations : Array(Types::LoggingDestination),
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateQueryLoggingConfigurationResponse
        include JSON::Serializable

        # The current status of the query logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::QueryLoggingConfigurationStatus

        def initialize(
          @status : Types::QueryLoggingConfigurationStatus
        )
        end
      end

      # Represents the input of a CreateRuleGroupsNamespace operation.
      struct CreateRuleGroupsNamespaceRequest
        include JSON::Serializable

        # The rules file to use in the new namespace. Contains the base64-encoded version of the YAML rules
        # file. For details about the rule groups namespace structure, see RuleGroupsNamespaceData .
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The name for the new rule groups namespace.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the workspace to add the rule groups namespace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The list of tag keys and values to associate with the rule groups namespace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @data : Bytes,
          @name : String,
          @workspace_id : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the output of a CreateRuleGroupsNamespace operation.
      struct CreateRuleGroupsNamespaceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new rule groups namespace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the new rule groups namespace.
        @[JSON::Field(key: "name")]
        getter name : String

        # A structure that returns the current status of the rule groups namespace.
        @[JSON::Field(key: "status")]
        getter status : Types::RuleGroupsNamespaceStatus

        # The list of tag keys and values that are associated with the namespace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @name : String,
          @status : Types::RuleGroupsNamespaceStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input of a CreateScraper operation.
      struct CreateScraperRequest
        include JSON::Serializable

        # The Amazon Managed Service for Prometheus workspace to send metrics to.
        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination

        # The configuration file to use in the new scraper. For more information, see Scraper configuration in
        # the Amazon Managed Service for Prometheus User Guide .
        @[JSON::Field(key: "scrapeConfiguration")]
        getter scrape_configuration : Types::ScrapeConfiguration

        # The Amazon EKS or Amazon Web Services cluster from which the scraper will collect metrics.
        @[JSON::Field(key: "source")]
        getter source : Types::Source

        # (optional) An alias to associate with the scraper. This is for your use, and does not need to be
        # unique.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # (Optional) A unique, case-sensitive identifier that you can provide to ensure the idempotency of the
        # request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Use this structure to enable cross-account access, so that you can use a target account to access
        # Prometheus metrics from source accounts.
        @[JSON::Field(key: "roleConfiguration")]
        getter role_configuration : Types::RoleConfiguration?

        # (Optional) The list of tag keys and values to associate with the scraper.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination : Types::Destination,
          @scrape_configuration : Types::ScrapeConfiguration,
          @source : Types::Source,
          @alias : String? = nil,
          @client_token : String? = nil,
          @role_configuration : Types::RoleConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the output of a CreateScraper operation.
      struct CreateScraperResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new scraper.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the new scraper.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # A structure that displays the current status of the scraper.
        @[JSON::Field(key: "status")]
        getter status : Types::ScraperStatus

        # The list of tag keys and values that are associated with the scraper.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @scraper_id : String,
          @status : Types::ScraperStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input of a CreateWorkspace operation.
      struct CreateWorkspaceRequest
        include JSON::Serializable

        # An alias that you assign to this workspace to help you identify it. It does not need to be unique.
        # Blank spaces at the beginning or end of the alias that you specify will be trimmed from the value
        # used.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # (optional) The ARN for a customer managed KMS key to use for encrypting data within your workspace.
        # For more information about using your own key in your workspace, see Encryption at rest in the
        # Amazon Managed Service for Prometheus User Guide .
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The list of tag keys and values to associate with the workspace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @alias : String? = nil,
          @client_token : String? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the output of a CreateWorkspace operation.
      struct CreateWorkspaceResponse
        include JSON::Serializable

        # The ARN for the new workspace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The current status of the new workspace. Immediately after you create the workspace, the status is
        # usually CREATING .
        @[JSON::Field(key: "status")]
        getter status : Types::WorkspaceStatus

        # The unique ID for the new workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # (optional) If the workspace was created with a customer managed KMS key, the ARN for the key used.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The list of tag keys and values that are associated with the workspace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @status : Types::WorkspaceStatus,
          @workspace_id : String,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input of a DeleteAlertManagerDefinition operation.
      struct DeleteAlertManagerDefinitionRequest
        include JSON::Serializable

        # The ID of the workspace to delete the alert manager definition from.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteAnomalyDetectorRequest
        include JSON::Serializable

        # The identifier of the anomaly detector to delete.
        @[JSON::Field(key: "anomalyDetectorId")]
        getter anomaly_detector_id : String

        # The identifier of the workspace containing the anomaly detector to delete.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @anomaly_detector_id : String,
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the input of a DeleteLoggingConfiguration operation.
      struct DeleteLoggingConfigurationRequest
        include JSON::Serializable

        # The ID of the workspace containing the logging configuration to delete.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteQueryLoggingConfigurationRequest
        include JSON::Serializable

        # The ID of the workspace from which to delete the query logging configuration.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # (Optional) A unique, case-sensitive identifier that you can provide to ensure the idempotency of the
        # request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The ID of the workspace from which to delete the resource-based policy.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique, case-sensitive identifier that you provide to ensure the request is safe to retry
        # (idempotent).
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The revision ID of the policy to delete. Use this parameter to ensure that you are deleting the
        # correct version of the policy.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @workspace_id : String,
          @client_token : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      # Represents the input of a DeleteRuleGroupsNamespace operation.
      struct DeleteRuleGroupsNamespaceRequest
        include JSON::Serializable

        # The name of the rule groups namespace to delete.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the workspace containing the rule groups namespace and definition to delete.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @name : String,
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteScraperLoggingConfigurationRequest
        include JSON::Serializable

        # The ID of the scraper whose logging configuration will be deleted.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # A unique, case-sensitive identifier that you provide to ensure the request is processed exactly
        # once.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @scraper_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the input of a DeleteScraper operation.
      struct DeleteScraperRequest
        include JSON::Serializable

        # The ID of the scraper to delete.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # (Optional) A unique, case-sensitive identifier that you can provide to ensure the idempotency of the
        # request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @scraper_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the output of a DeleteScraper operation.
      struct DeleteScraperResponse
        include JSON::Serializable

        # The ID of the scraper to delete.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # The current status of the scraper.
        @[JSON::Field(key: "status")]
        getter status : Types::ScraperStatus

        def initialize(
          @scraper_id : String,
          @status : Types::ScraperStatus
        )
        end
      end

      # Represents the input of a DeleteWorkspace operation.
      struct DeleteWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace to delete.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the input of a DescribeAlertManagerDefinition operation.
      struct DescribeAlertManagerDefinitionRequest
        include JSON::Serializable

        # The ID of the workspace to retrieve the alert manager definition from.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      # Represents the output of a DescribeAlertManagerDefinition operation.
      struct DescribeAlertManagerDefinitionResponse
        include JSON::Serializable

        # The alert manager definition.
        @[JSON::Field(key: "alertManagerDefinition")]
        getter alert_manager_definition : Types::AlertManagerDefinitionDescription

        def initialize(
          @alert_manager_definition : Types::AlertManagerDefinitionDescription
        )
        end
      end

      struct DescribeAnomalyDetectorRequest
        include JSON::Serializable

        # The identifier of the anomaly detector to describe.
        @[JSON::Field(key: "anomalyDetectorId")]
        getter anomaly_detector_id : String

        # The identifier of the workspace containing the anomaly detector.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @anomaly_detector_id : String,
          @workspace_id : String
        )
        end
      end

      struct DescribeAnomalyDetectorResponse
        include JSON::Serializable

        # The detailed information about the anomaly detector.
        @[JSON::Field(key: "anomalyDetector")]
        getter anomaly_detector : Types::AnomalyDetectorDescription

        def initialize(
          @anomaly_detector : Types::AnomalyDetectorDescription
        )
        end
      end

      # Represents the input of a DescribeLoggingConfiguration operation.
      struct DescribeLoggingConfigurationRequest
        include JSON::Serializable

        # The ID of the workspace to describe the logging configuration for.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      # Represents the output of a DescribeLoggingConfiguration operation.
      struct DescribeLoggingConfigurationResponse
        include JSON::Serializable

        # A structure that displays the information about the logging configuration.
        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::LoggingConfigurationMetadata

        def initialize(
          @logging_configuration : Types::LoggingConfigurationMetadata
        )
        end
      end

      struct DescribeQueryLoggingConfigurationRequest
        include JSON::Serializable

        # The ID of the workspace for which to retrieve the query logging configuration.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      struct DescribeQueryLoggingConfigurationResponse
        include JSON::Serializable

        # The detailed information about the query logging configuration for the specified workspace.
        @[JSON::Field(key: "queryLoggingConfiguration")]
        getter query_logging_configuration : Types::QueryLoggingConfigurationMetadata

        def initialize(
          @query_logging_configuration : Types::QueryLoggingConfigurationMetadata
        )
        end
      end

      struct DescribeResourcePolicyRequest
        include JSON::Serializable

        # The ID of the workspace to describe the resource-based policy for.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      struct DescribeResourcePolicyResponse
        include JSON::Serializable

        # The JSON policy document for the resource-based policy attached to the workspace.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The current status of the resource-based policy.
        @[JSON::Field(key: "policyStatus")]
        getter policy_status : String

        # The revision ID of the current resource-based policy.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @policy_document : String,
          @policy_status : String,
          @revision_id : String
        )
        end
      end

      # Represents the input of a DescribeRuleGroupsNamespace operation.
      struct DescribeRuleGroupsNamespaceRequest
        include JSON::Serializable

        # The name of the rule groups namespace that you want information for.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the workspace containing the rule groups namespace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @name : String,
          @workspace_id : String
        )
        end
      end

      # Represents the output of a DescribeRuleGroupsNamespace operation.
      struct DescribeRuleGroupsNamespaceResponse
        include JSON::Serializable

        # The information about the rule groups namespace.
        @[JSON::Field(key: "ruleGroupsNamespace")]
        getter rule_groups_namespace : Types::RuleGroupsNamespaceDescription

        def initialize(
          @rule_groups_namespace : Types::RuleGroupsNamespaceDescription
        )
        end
      end

      struct DescribeScraperLoggingConfigurationRequest
        include JSON::Serializable

        # The ID of the scraper whose logging configuration will be described.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        def initialize(
          @scraper_id : String
        )
        end
      end

      struct DescribeScraperLoggingConfigurationResponse
        include JSON::Serializable

        # The destination where scraper logs are sent.
        @[JSON::Field(key: "loggingDestination")]
        getter logging_destination : Types::ScraperLoggingDestination

        # The date and time when the logging configuration was last modified.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The list of scraper components configured for logging.
        @[JSON::Field(key: "scraperComponents")]
        getter scraper_components : Array(Types::ScraperComponent)

        # The ID of the scraper.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # The status of the scraper logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::ScraperLoggingConfigurationStatus

        def initialize(
          @logging_destination : Types::ScraperLoggingDestination,
          @modified_at : Time,
          @scraper_components : Array(Types::ScraperComponent),
          @scraper_id : String,
          @status : Types::ScraperLoggingConfigurationStatus
        )
        end
      end

      # Represents the input of a DescribeScraper operation.
      struct DescribeScraperRequest
        include JSON::Serializable

        # The ID of the scraper to describe.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        def initialize(
          @scraper_id : String
        )
        end
      end

      # Represents the output of a DescribeScraper operation.
      struct DescribeScraperResponse
        include JSON::Serializable

        # Contains details about the scraper.
        @[JSON::Field(key: "scraper")]
        getter scraper : Types::ScraperDescription

        def initialize(
          @scraper : Types::ScraperDescription
        )
        end
      end

      struct DescribeWorkspaceConfigurationRequest
        include JSON::Serializable

        # The ID of the workspace that you want to retrieve information for. To find the IDs of your
        # workspaces, use the ListWorkspaces operation.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      struct DescribeWorkspaceConfigurationResponse
        include JSON::Serializable

        # This structure contains the information about the workspace configuration.
        @[JSON::Field(key: "workspaceConfiguration")]
        getter workspace_configuration : Types::WorkspaceConfigurationDescription

        def initialize(
          @workspace_configuration : Types::WorkspaceConfigurationDescription
        )
        end
      end

      # Represents the input of a DescribeWorkspace operation.
      struct DescribeWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace to describe.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end

      # Represents the output of a DescribeWorkspace operation.
      struct DescribeWorkspaceResponse
        include JSON::Serializable

        # A structure that contains details about the workspace.
        @[JSON::Field(key: "workspace")]
        getter workspace : Types::WorkspaceDescription

        def initialize(
          @workspace : Types::WorkspaceDescription
        )
        end
      end

      # Where to send the metrics from a scraper.
      struct Destination
        include JSON::Serializable

        # The Amazon Managed Service for Prometheus workspace to send metrics to.
        @[JSON::Field(key: "ampConfiguration")]
        getter amp_configuration : Types::AmpConfiguration?

        def initialize(
          @amp_configuration : Types::AmpConfiguration? = nil
        )
        end
      end

      # The EksConfiguration structure describes the connection to the Amazon EKS cluster from which a
      # scraper collects metrics.
      struct EksConfiguration
        include JSON::Serializable

        # ARN of the Amazon EKS cluster.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # A list of subnet IDs for the Amazon EKS cluster VPC configuration.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # A list of the security group IDs for the Amazon EKS cluster VPC configuration.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @cluster_arn : String,
          @subnet_ids : Array(String),
          @security_group_ids : Array(String)? = nil
        )
        end
      end

      # Represents the input of a GetDefaultScraperConfiguration operation.
      struct GetDefaultScraperConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a GetDefaultScraperConfiguration operation.
      struct GetDefaultScraperConfigurationResponse
        include JSON::Serializable

        # The configuration file. Base 64 encoded. For more information, see Scraper configuration in the
        # Amazon Managed Service for Prometheus User Guide .
        @[JSON::Field(key: "configuration")]
        getter configuration : Bytes

        def initialize(
          @configuration : Bytes
        )
        end
      end

      # Configuration for threshold settings that determine when values near expected values should be
      # ignored during anomaly detection.
      struct IgnoreNearExpected
        include JSON::Serializable

        # The absolute amount by which values can differ from expected values before being considered
        # anomalous.
        @[JSON::Field(key: "amount")]
        getter amount : Float64?

        # The ratio by which values can differ from expected values before being considered anomalous.
        @[JSON::Field(key: "ratio")]
        getter ratio : Float64?

        def initialize(
          @amount : Float64? = nil,
          @ratio : Float64? = nil
        )
        end
      end

      # An unexpected error occurred during the processing of the request.
      struct InternalServerException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # Advice to clients on when the call can be safely retried.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # This structure defines one label set used to enforce active time series limits for the workspace,
      # and defines the limit for that label set. A label set is a unique combination of label-value pairs.
      # Use them to control time series limits and to monitor usage by specific label groups. Example label
      # sets might be team:finance or env:prod
      struct LimitsPerLabelSet
        include JSON::Serializable

        # This defines one label set that will have an enforced active time series limit. Label values accept
        # ASCII characters and must contain at least one character that isn't whitespace. ASCII control
        # characters are not accepted. If the label name is metric name label __ name __ , then the metric
        # part of the name must conform to the following pattern: [a-zA-Z_:][a-zA-Z0-9_:]*
        @[JSON::Field(key: "labelSet")]
        getter label_set : Hash(String, String)

        # This structure contains the information about the limits that apply to time series that match this
        # label set.
        @[JSON::Field(key: "limits")]
        getter limits : Types::LimitsPerLabelSetEntry

        def initialize(
          @label_set : Hash(String, String),
          @limits : Types::LimitsPerLabelSetEntry
        )
        end
      end

      # This structure contains the information about the limits that apply to time series that match one
      # label set.
      struct LimitsPerLabelSetEntry
        include JSON::Serializable

        # The maximum number of active series that can be ingested that match this label set. Setting this to
        # 0 causes no label set limit to be enforced, but it does cause Amazon Managed Service for Prometheus
        # to vend label set metrics to CloudWatch
        @[JSON::Field(key: "maxSeries")]
        getter max_series : Int64?

        def initialize(
          @max_series : Int64? = nil
        )
        end
      end

      struct ListAnomalyDetectorsRequest
        include JSON::Serializable

        # The identifier of the workspace containing the anomaly detectors to list.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # Filters the results to anomaly detectors with the specified alias.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The maximum number of results to return in a single call. Valid range is 1 to 1000.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token to continue retrieving results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspace_id : String,
          @alias : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAnomalyDetectorsResponse
        include JSON::Serializable

        # The list of anomaly detectors in the workspace.
        @[JSON::Field(key: "anomalyDetectors")]
        getter anomaly_detectors : Array(Types::AnomalyDetectorSummary)

        # The pagination token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @anomaly_detectors : Array(Types::AnomalyDetectorSummary),
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListRuleGroupsNamespaces operation.
      struct ListRuleGroupsNamespacesRequest
        include JSON::Serializable

        # The ID of the workspace containing the rule groups namespaces.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The maximum number of results to return. The default is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use this parameter to filter the rule groups namespaces that are returned. Only the namespaces with
        # names that begin with the value that you specify are returned.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The token for the next set of items to return. You receive this token from a previous call, and use
        # it to get the next page of results. The other parameters must be the same as the initial call. For
        # example, if your initial request has maxResults of 10, and there are 12 rule groups namespaces to
        # return, then your initial request will return 10 and a nextToken . Using the next token in a
        # subsequent call will return the remaining 2 namespaces.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspace_id : String,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListRuleGroupsNamespaces operation.
      struct ListRuleGroupsNamespacesResponse
        include JSON::Serializable

        # The returned list of rule groups namespaces.
        @[JSON::Field(key: "ruleGroupsNamespaces")]
        getter rule_groups_namespaces : Array(Types::RuleGroupsNamespaceSummary)

        # A token indicating that there are more results to retrieve. You can use this token as part of your
        # next ListRuleGroupsNamespaces request to retrieve those results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @rule_groups_namespaces : Array(Types::RuleGroupsNamespaceSummary),
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListScrapers operation.
      struct ListScrapersRequest
        include JSON::Serializable

        # (Optional) A list of key-value pairs to filter the list of scrapers returned. Keys include status ,
        # sourceArn , destinationArn , and alias . Filters on the same key are OR 'd together, and filters on
        # different keys are AND 'd together. For example, status=ACTIVE&amp;status=CREATING&amp;alias=Test ,
        # will return all scrapers that have the alias Test, and are either in status ACTIVE or CREATING. To
        # find all active scrapers that are sending metrics to a specific Amazon Managed Service for
        # Prometheus workspace, you would use the ARN of the workspace in a query:
        # status=ACTIVE&amp;destinationArn=arn:aws:aps:us-east-1:123456789012:workspace/ws-example1-1234-abcd-56ef-123456789012
        # If this is included, it filters the results to only the scrapers that match the filter.
        @[JSON::Field(key: "filters")]
        getter filters : Hash(String, Array(String))?

        # Optional) The maximum number of scrapers to return in one ListScrapers operation. The range is
        # 1-1000. If you omit this parameter, the default of 100 is used.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # (Optional) The token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Hash(String, Array(String))? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListScrapers operation.
      struct ListScrapersResponse
        include JSON::Serializable

        # A list of ScraperSummary structures giving information about scrapers in the account that match the
        # filters provided.
        @[JSON::Field(key: "scrapers")]
        getter scrapers : Array(Types::ScraperSummary)

        # A token indicating that there are more results to retrieve. You can use this token as part of your
        # next ListScrapers operation to retrieve those results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @scrapers : Array(Types::ScraperSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource to list tages for. Must be a workspace, scraper, or rule groups namespace
        # resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tag keys and values associated with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input of a ListWorkspaces operation.
      struct ListWorkspacesRequest
        include JSON::Serializable

        # If this is included, it filters the results to only the workspaces with names that start with the
        # value that you specify here. Amazon Managed Service for Prometheus will automatically strip any
        # blank spaces from the beginning and end of the alias that you specify.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # The maximum number of workspaces to return per request. The default is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. You receive this token from a previous call, and use
        # it to get the next page of results. The other parameters must be the same as the initial call. For
        # example, if your initial request has maxResults of 10, and there are 12 workspaces to return, then
        # your initial request will return 10 and a nextToken . Using the next token in a subsequent call will
        # return the remaining 2 workspaces.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @alias : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListWorkspaces operation.
      struct ListWorkspacesResponse
        include JSON::Serializable

        # An array of WorkspaceSummary structures containing information about the workspaces requested.
        @[JSON::Field(key: "workspaces")]
        getter workspaces : Array(Types::WorkspaceSummary)

        # A token indicating that there are more results to retrieve. You can use this token as part of your
        # next ListWorkspaces request to retrieve those results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspaces : Array(Types::WorkspaceSummary),
          @next_token : String? = nil
        )
        end
      end

      # Contains information about the current rules and alerting logging configuration for the workspace.
      # These logging configurations are only for rules and alerting logs.
      struct LoggingConfigurationMetadata
        include JSON::Serializable

        # The date and time that the logging configuration was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ARN of the CloudWatch log group to which the vended log data will be published.
        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String

        # The date and time that the logging configuration was most recently changed.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The current status of the logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::LoggingConfigurationStatus

        # The ID of the workspace the logging configuration is for.
        @[JSON::Field(key: "workspace")]
        getter workspace : String

        def initialize(
          @created_at : Time,
          @log_group_arn : String,
          @modified_at : Time,
          @status : Types::LoggingConfigurationStatus,
          @workspace : String
        )
        end
      end

      # The status of the logging configuration.
      struct LoggingConfigurationStatus
        include JSON::Serializable

        # The current status of the current rules and alerting logging configuration. These logging
        # configurations are only for rules and alerting logs.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        # If failed, the reason for the failure.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String,
          @status_reason : String? = nil
        )
        end
      end

      # Defines a destination and its associated filtering criteria for query logging.
      struct LoggingDestination
        include JSON::Serializable

        # Configuration details for logging to CloudWatch Logs.
        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogDestination

        # Filtering criteria that determine which queries are logged.
        @[JSON::Field(key: "filters")]
        getter filters : Types::LoggingFilter

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogDestination,
          @filters : Types::LoggingFilter
        )
        end
      end

      # Filtering criteria that determine which queries are logged.
      struct LoggingFilter
        include JSON::Serializable

        # The Query Samples Processed (QSP) threshold above which queries will be logged. Queries processing
        # more samples than this threshold will be captured in logs.
        @[JSON::Field(key: "qspThreshold")]
        getter qsp_threshold : Int64

        def initialize(
          @qsp_threshold : Int64
        )
        end
      end

      # Represents the input of a PutAlertManagerDefinition operation.
      struct PutAlertManagerDefinitionRequest
        include JSON::Serializable

        # The alert manager definition to use. A base64-encoded version of the YAML alert manager definition
        # file. For details about the alert manager definition, see AlertManagedDefinitionData .
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The ID of the workspace to update the alert manager definition in.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @data : Bytes,
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the output of a PutAlertManagerDefinition operation.
      struct PutAlertManagerDefinitionResponse
        include JSON::Serializable

        # A structure that returns the current status of the alert manager definition.
        @[JSON::Field(key: "status")]
        getter status : Types::AlertManagerDefinitionStatus

        def initialize(
          @status : Types::AlertManagerDefinitionStatus
        )
        end
      end

      struct PutAnomalyDetectorRequest
        include JSON::Serializable

        # The identifier of the anomaly detector to update.
        @[JSON::Field(key: "anomalyDetectorId")]
        getter anomaly_detector_id : String

        # The algorithm configuration for the anomaly detector.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AnomalyDetectorConfiguration

        # The identifier of the workspace containing the anomaly detector to update.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The frequency, in seconds, at which the anomaly detector evaluates metrics.
        @[JSON::Field(key: "evaluationIntervalInSeconds")]
        getter evaluation_interval_in_seconds : Int32?

        # The Amazon Managed Service for Prometheus metric labels to associate with the anomaly detector.
        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # Specifies the action to take when data is missing during evaluation.
        @[JSON::Field(key: "missingDataAction")]
        getter missing_data_action : Types::AnomalyDetectorMissingDataAction?

        def initialize(
          @anomaly_detector_id : String,
          @configuration : Types::AnomalyDetectorConfiguration,
          @workspace_id : String,
          @client_token : String? = nil,
          @evaluation_interval_in_seconds : Int32? = nil,
          @labels : Hash(String, String)? = nil,
          @missing_data_action : Types::AnomalyDetectorMissingDataAction? = nil
        )
        end
      end

      struct PutAnomalyDetectorResponse
        include JSON::Serializable

        # The unique identifier of the updated anomaly detector.
        @[JSON::Field(key: "anomalyDetectorId")]
        getter anomaly_detector_id : String

        # The Amazon Resource Name (ARN) of the updated anomaly detector.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The status information of the updated anomaly detector.
        @[JSON::Field(key: "status")]
        getter status : Types::AnomalyDetectorStatus

        # The tags applied to the updated anomaly detector.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @anomaly_detector_id : String,
          @arn : String,
          @status : Types::AnomalyDetectorStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The JSON policy document to use as the resource-based policy. This policy defines the permissions
        # that other AWS accounts or services have to access your workspace.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The ID of the workspace to attach the resource-based policy to.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique, case-sensitive identifier that you provide to ensure the request is safe to retry
        # (idempotent).
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The revision ID of the policy to update. Use this parameter to ensure that you are updating the
        # correct version of the policy. If you don't specify a revision ID, the policy is updated regardless
        # of its current revision. For the first PUT request on a workspace that doesn't have an existing
        # resource policy, you can specify NO_POLICY as the revision ID.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @policy_document : String,
          @workspace_id : String,
          @client_token : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The current status of the resource-based policy.
        @[JSON::Field(key: "policyStatus")]
        getter policy_status : String

        # The revision ID of the newly created or updated resource-based policy.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @policy_status : String,
          @revision_id : String
        )
        end
      end

      # Represents the input of a PutRuleGroupsNamespace operation.
      struct PutRuleGroupsNamespaceRequest
        include JSON::Serializable

        # The new rules file to use in the namespace. A base64-encoded version of the YAML rule groups file.
        # For details about the rule groups namespace structure, see RuleGroupsNamespaceData .
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The name of the rule groups namespace that you are updating.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the workspace where you are updating the rule groups namespace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @data : Bytes,
          @name : String,
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the output of a PutRuleGroupsNamespace operation.
      struct PutRuleGroupsNamespaceResponse
        include JSON::Serializable

        # The ARN of the rule groups namespace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the rule groups namespace that was updated.
        @[JSON::Field(key: "name")]
        getter name : String

        # A structure that includes the current status of the rule groups namespace.
        @[JSON::Field(key: "status")]
        getter status : Types::RuleGroupsNamespaceStatus

        # The list of tag keys and values that are associated with the namespace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @name : String,
          @status : Types::RuleGroupsNamespaceStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The metadata for a query logging configuration.
      struct QueryLoggingConfigurationMetadata
        include JSON::Serializable

        # The date and time when the query logging configuration was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The configured destinations for the query logging configuration.
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::LoggingDestination)

        # The date and time when the query logging configuration was last modified.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The current status of the query logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::QueryLoggingConfigurationStatus

        # The ID of the workspace associated with this query logging configuration.
        @[JSON::Field(key: "workspace")]
        getter workspace : String

        def initialize(
          @created_at : Time,
          @destinations : Array(Types::LoggingDestination),
          @modified_at : Time,
          @status : Types::QueryLoggingConfigurationStatus,
          @workspace : String
        )
        end
      end

      # The status information for a query logging configuration.
      struct QueryLoggingConfigurationStatus
        include JSON::Serializable

        # The current status of the query logging configuration.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        # If there is a failure, the reason for the failure.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String,
          @status_reason : String? = nil
        )
        end
      end

      # Configuration for the Random Cut Forest algorithm used for anomaly detection in time-series data.
      struct RandomCutForestConfiguration
        include JSON::Serializable

        # The Prometheus query used to retrieve the time-series data for anomaly detection. Random Cut Forest
        # queries must be wrapped by a supported PromQL aggregation operator. For more information, see
        # Aggregation operators on the Prometheus docs website. Supported PromQL aggregation operators : avg ,
        # count , group , max , min , quantile , stddev , stdvar , and sum .
        @[JSON::Field(key: "query")]
        getter query : String

        # Configuration for ignoring values that are near expected values from above during anomaly detection.
        @[JSON::Field(key: "ignoreNearExpectedFromAbove")]
        getter ignore_near_expected_from_above : Types::IgnoreNearExpected?

        # Configuration for ignoring values that are near expected values from below during anomaly detection.
        @[JSON::Field(key: "ignoreNearExpectedFromBelow")]
        getter ignore_near_expected_from_below : Types::IgnoreNearExpected?

        # The number of data points sampled from the input stream for the Random Cut Forest algorithm. The
        # default number is 256 consecutive data points.
        @[JSON::Field(key: "sampleSize")]
        getter sample_size : Int32?

        # The number of consecutive data points used to create a shingle for the Random Cut Forest algorithm.
        # The default number is 8 consecutive data points.
        @[JSON::Field(key: "shingleSize")]
        getter shingle_size : Int32?

        def initialize(
          @query : String,
          @ignore_near_expected_from_above : Types::IgnoreNearExpected? = nil,
          @ignore_near_expected_from_below : Types::IgnoreNearExpected? = nil,
          @sample_size : Int32? = nil,
          @shingle_size : Int32? = nil
        )
        end
      end

      # The request references a resources that doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # Identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Use this structure to enable cross-account access, so that you can use a target account to access
      # Prometheus metrics from source accounts.
      struct RoleConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the role used in the source account to enable cross-account
        # scraping. For information about the contents of this policy, see Cross-account setup .
        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String?

        # The Amazon Resource Name (ARN) of the role used in the target account to enable cross-account
        # scraping. For information about the contents of this policy, see Cross-account setup .
        @[JSON::Field(key: "targetRoleArn")]
        getter target_role_arn : String?

        def initialize(
          @source_role_arn : String? = nil,
          @target_role_arn : String? = nil
        )
        end
      end

      # The details about one rule groups namespace.
      struct RuleGroupsNamespaceDescription
        include JSON::Serializable

        # The ARN of the rule groups namespace. For example,
        # arn:aws:aps:&lt;region&gt;:123456789012:rulegroupsnamespace/ws-example1-1234-abcd-5678-ef90abcd1234/rulesfile1
        # .
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the rule groups namespace was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The rule groups file used in the namespace. For details about the rule groups namespace structure,
        # see RuleGroupsNamespaceData .
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The date and time that the rule groups namespace was most recently changed.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The name of the rule groups namespace.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the rule groups namespace.
        @[JSON::Field(key: "status")]
        getter status : Types::RuleGroupsNamespaceStatus

        # The list of tag keys and values that are associated with the rule groups namespace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @data : Bytes,
          @modified_at : Time,
          @name : String,
          @status : Types::RuleGroupsNamespaceStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The status information about a rule groups namespace.
      struct RuleGroupsNamespaceStatus
        include JSON::Serializable

        # The current status of the namespace.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        # The reason for the failure, if any.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String,
          @status_reason : String? = nil
        )
        end
      end

      # The high-level information about a rule groups namespace. To retrieve more information, use
      # DescribeRuleGroupsNamespace .
      struct RuleGroupsNamespaceSummary
        include JSON::Serializable

        # The ARN of the rule groups namespace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the rule groups namespace was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date and time that the rule groups namespace was most recently changed.
        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The name of the rule groups namespace.
        @[JSON::Field(key: "name")]
        getter name : String

        # A structure that displays the current status of the rule groups namespace.
        @[JSON::Field(key: "status")]
        getter status : Types::RuleGroupsNamespaceStatus

        # The list of tag keys and values that are associated with the rule groups namespace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @modified_at : Time,
          @name : String,
          @status : Types::RuleGroupsNamespaceStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A scrape configuration for a scraper, base 64 encoded. For more information, see Scraper
      # configuration in the Amazon Managed Service for Prometheus User Guide .
      struct ScrapeConfiguration
        include JSON::Serializable

        # The base 64 encoded scrape configuration file.
        @[JSON::Field(key: "configurationBlob")]
        getter configuration_blob : Bytes?

        def initialize(
          @configuration_blob : Bytes? = nil
        )
        end
      end

      # A component of a Amazon Managed Service for Prometheus scraper that can be configured for logging.
      struct ScraperComponent
        include JSON::Serializable

        # The type of the scraper component.
        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration settings for the scraper component.
        @[JSON::Field(key: "config")]
        getter config : Types::ComponentConfig?

        def initialize(
          @type : String,
          @config : Types::ComponentConfig? = nil
        )
        end
      end

      # The ScraperDescription structure contains the full details about one scraper in your account.
      struct ScraperDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scraper. For example,
        # arn:aws:aps:&lt;region&gt;:123456798012:scraper/s-example1-1234-abcd-5678-ef9012abcd34 .
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the scraper was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Managed Service for Prometheus workspace the scraper sends metrics to.
        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination

        # The date and time that the scraper was last modified.
        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Time

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the scraper to discover
        # and collect metrics on your behalf. For example,
        # arn:aws:iam::123456789012:role/service-role/AmazonGrafanaServiceRole-12example .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The configuration in use by the scraper.
        @[JSON::Field(key: "scrapeConfiguration")]
        getter scrape_configuration : Types::ScrapeConfiguration

        # The ID of the scraper. For example, s-example1-1234-abcd-5678-ef9012abcd34 .
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # The Amazon EKS cluster from which the scraper collects metrics.
        @[JSON::Field(key: "source")]
        getter source : Types::Source

        # A structure that contains the current status of the scraper.
        @[JSON::Field(key: "status")]
        getter status : Types::ScraperStatus

        # (Optional) A name associated with the scraper.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # This structure displays information about the IAM roles used for cross-account scraping
        # configuration.
        @[JSON::Field(key: "roleConfiguration")]
        getter role_configuration : Types::RoleConfiguration?

        # If there is a failure, the reason for the failure.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # (Optional) The list of tag keys and values associated with the scraper.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @destination : Types::Destination,
          @last_modified_at : Time,
          @role_arn : String,
          @scrape_configuration : Types::ScrapeConfiguration,
          @scraper_id : String,
          @source : Types::Source,
          @status : Types::ScraperStatus,
          @alias : String? = nil,
          @role_configuration : Types::RoleConfiguration? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The status of a scraper logging configuration.
      struct ScraperLoggingConfigurationStatus
        include JSON::Serializable

        # The status code of the scraper logging configuration.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        # The reason for the current status of the scraper logging configuration.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String,
          @status_reason : String? = nil
        )
        end
      end

      # The destination where scraper logs are sent.
      struct ScraperLoggingDestination
        include JSON::Serializable

        # The CloudWatch Logs configuration for the scraper logging destination.
        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogDestination?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogDestination? = nil
        )
        end
      end

      # The ScraperStatus structure contains status information about the scraper.
      struct ScraperStatus
        include JSON::Serializable

        # The current status of the scraper.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        def initialize(
          @status_code : String
        )
        end
      end

      # The ScraperSummary structure contains a summary of the details about one scraper in your account.
      struct ScraperSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scraper.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the scraper was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Managed Service for Prometheus workspace the scraper sends metrics to.
        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination

        # The date and time that the scraper was last modified.
        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Time

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the scraper to discover
        # and collect metrics on your behalf.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The ID of the scraper.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # The Amazon EKS cluster from which the scraper collects metrics.
        @[JSON::Field(key: "source")]
        getter source : Types::Source

        # A structure that contains the current status of the scraper.
        @[JSON::Field(key: "status")]
        getter status : Types::ScraperStatus

        # (Optional) A name associated with the scraper.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # This structure displays information about the IAM roles used for cross-account scraping
        # configuration.
        @[JSON::Field(key: "roleConfiguration")]
        getter role_configuration : Types::RoleConfiguration?

        # If there is a failure, the reason for the failure.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # (Optional) The list of tag keys and values associated with the scraper.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @destination : Types::Destination,
          @last_modified_at : Time,
          @role_arn : String,
          @scraper_id : String,
          @source : Types::Source,
          @status : Types::ScraperStatus,
          @alias : String? = nil,
          @role_configuration : Types::RoleConfiguration? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Completing the request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # Service quotas code of the originating quota.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # Identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Service quotas code for the originating service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      # The source of collected metrics for a scraper.
      struct Source
        include JSON::Serializable

        # The Amazon EKS cluster from which a scraper collects metrics.
        @[JSON::Field(key: "eksConfiguration")]
        getter eks_configuration : Types::EksConfiguration?

        # The Amazon VPC configuration for the Prometheus collector when connecting to Amazon MSK clusters.
        # This configuration enables secure, private network connectivity between the collector and your
        # Amazon MSK cluster within your Amazon VPC.
        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @eks_configuration : Types::EksConfiguration? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to apply tags to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys and values to associate with the resource. Keys must not begin with aws: .
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # Service quotas code for the originating quota.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Advice to clients on when the call can be safely retried.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # Service quotas code for the originating service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource from which to remove a tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove.
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

      # Represents the input of an UpdateLoggingConfiguration operation.
      struct UpdateLoggingConfigurationRequest
        include JSON::Serializable

        # The ARN of the CloudWatch log group to which the vended log data will be published.
        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String

        # The ID of the workspace to update the logging configuration for.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @log_group_arn : String,
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      # Represents the output of an UpdateLoggingConfiguration operation.
      struct UpdateLoggingConfigurationResponse
        include JSON::Serializable

        # A structure that contains the current status of the logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::LoggingConfigurationStatus

        def initialize(
          @status : Types::LoggingConfigurationStatus
        )
        end
      end

      struct UpdateQueryLoggingConfigurationRequest
        include JSON::Serializable

        # The destinations where query logs will be sent. Only CloudWatch Logs destination is supported. The
        # list must contain exactly one element.
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::LoggingDestination)

        # The ID of the workspace for which to update the query logging configuration.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # (Optional) A unique, case-sensitive identifier that you can provide to ensure the idempotency of the
        # request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @destinations : Array(Types::LoggingDestination),
          @workspace_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateQueryLoggingConfigurationResponse
        include JSON::Serializable

        # The current status of the query logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::QueryLoggingConfigurationStatus

        def initialize(
          @status : Types::QueryLoggingConfigurationStatus
        )
        end
      end

      struct UpdateScraperLoggingConfigurationRequest
        include JSON::Serializable

        # The destination where scraper logs will be sent.
        @[JSON::Field(key: "loggingDestination")]
        getter logging_destination : Types::ScraperLoggingDestination

        # The ID of the scraper whose logging configuration will be updated.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # The list of scraper components to configure for logging.
        @[JSON::Field(key: "scraperComponents")]
        getter scraper_components : Array(Types::ScraperComponent)?

        def initialize(
          @logging_destination : Types::ScraperLoggingDestination,
          @scraper_id : String,
          @scraper_components : Array(Types::ScraperComponent)? = nil
        )
        end
      end

      struct UpdateScraperLoggingConfigurationResponse
        include JSON::Serializable

        # The status of the updated scraper logging configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::ScraperLoggingConfigurationStatus

        def initialize(
          @status : Types::ScraperLoggingConfigurationStatus
        )
        end
      end

      struct UpdateScraperRequest
        include JSON::Serializable

        # The ID of the scraper to update.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # The new alias of the scraper.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The new Amazon Managed Service for Prometheus workspace to send metrics to.
        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination?

        # Use this structure to enable cross-account access, so that you can use a target account to access
        # Prometheus metrics from source accounts.
        @[JSON::Field(key: "roleConfiguration")]
        getter role_configuration : Types::RoleConfiguration?

        # Contains the base-64 encoded YAML configuration for the scraper. For more information about
        # configuring a scraper, see Using an Amazon Web Services managed collector in the Amazon Managed
        # Service for Prometheus User Guide .
        @[JSON::Field(key: "scrapeConfiguration")]
        getter scrape_configuration : Types::ScrapeConfiguration?

        def initialize(
          @scraper_id : String,
          @alias : String? = nil,
          @client_token : String? = nil,
          @destination : Types::Destination? = nil,
          @role_configuration : Types::RoleConfiguration? = nil,
          @scrape_configuration : Types::ScrapeConfiguration? = nil
        )
        end
      end

      struct UpdateScraperResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated scraper.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the updated scraper.
        @[JSON::Field(key: "scraperId")]
        getter scraper_id : String

        # A structure that displays the current status of the scraper.
        @[JSON::Field(key: "status")]
        getter status : Types::ScraperStatus

        # The list of tag keys and values that are associated with the scraper.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @scraper_id : String,
          @status : Types::ScraperStatus,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input of an UpdateWorkspaceAlias operation.
      struct UpdateWorkspaceAliasRequest
        include JSON::Serializable

        # The ID of the workspace to update.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The new alias for the workspace. It does not need to be unique. Amazon Managed Service for
        # Prometheus will automatically strip any blank spaces from the beginning and end of the alias that
        # you specify.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # A unique identifier that you can provide to ensure the idempotency of the request. Case-sensitive.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @workspace_id : String,
          @alias : String? = nil,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateWorkspaceConfigurationRequest
        include JSON::Serializable

        # The ID of the workspace that you want to update. To find the IDs of your workspaces, use the
        # ListWorkspaces operation.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # You can include a token in your operation to make it an idempotent opeartion.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # This is an array of structures, where each structure defines a label set for the workspace, and
        # defines the active time series limit for each of those label sets. Each label name in a label set
        # must be unique.
        @[JSON::Field(key: "limitsPerLabelSet")]
        getter limits_per_label_set : Array(Types::LimitsPerLabelSet)?

        # Specifies how many days that metrics will be retained in the workspace.
        @[JSON::Field(key: "retentionPeriodInDays")]
        getter retention_period_in_days : Int32?

        def initialize(
          @workspace_id : String,
          @client_token : String? = nil,
          @limits_per_label_set : Array(Types::LimitsPerLabelSet)? = nil,
          @retention_period_in_days : Int32? = nil
        )
        end
      end

      struct UpdateWorkspaceConfigurationResponse
        include JSON::Serializable

        # The status of the workspace configuration.
        @[JSON::Field(key: "status")]
        getter status : Types::WorkspaceConfigurationStatus

        def initialize(
          @status : Types::WorkspaceConfigurationStatus
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # Reason the request failed validation.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The field that caused the error, if applicable.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Information about a field passed into a request that resulted in an exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # A message describing why the field caused an exception.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that caused an exception.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The Amazon VPC configuration that specifies the network settings for a Prometheus collector to
      # securely connect to Amazon MSK clusters. This configuration includes the security groups and subnets
      # that control network access and placement for the collector.
      struct VpcConfiguration
        include JSON::Serializable

        # The security group IDs that control network access for the Prometheus collector. These security
        # groups must allow the collector to communicate with your Amazon MSK cluster on the required ports.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The subnet IDs where the Prometheus collector will be deployed. The subnets must be in the same
        # Amazon VPC as your Amazon MSK cluster and have network connectivity to the cluster.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # This structure contains the description of the workspace configuration.
      struct WorkspaceConfigurationDescription
        include JSON::Serializable

        # This structure displays the current status of the workspace configuration, and might also contain a
        # reason for that status.
        @[JSON::Field(key: "status")]
        getter status : Types::WorkspaceConfigurationStatus

        # This is an array of structures, where each structure displays one label sets for the workspace and
        # the limits for that label set.
        @[JSON::Field(key: "limitsPerLabelSet")]
        getter limits_per_label_set : Array(Types::LimitsPerLabelSet)?

        # This field displays how many days that metrics are retained in the workspace.
        @[JSON::Field(key: "retentionPeriodInDays")]
        getter retention_period_in_days : Int32?

        def initialize(
          @status : Types::WorkspaceConfigurationStatus,
          @limits_per_label_set : Array(Types::LimitsPerLabelSet)? = nil,
          @retention_period_in_days : Int32? = nil
        )
        end
      end

      # This structure displays the current status of the workspace configuration, and might also contain a
      # reason for that status.
      struct WorkspaceConfigurationStatus
        include JSON::Serializable

        # The current status of the workspace configuration.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        # The reason for the current status, if a reason is available.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String,
          @status_reason : String? = nil
        )
        end
      end

      # The full details about one Amazon Managed Service for Prometheus workspace in your account.
      struct WorkspaceDescription
        include JSON::Serializable

        # The ARN of the workspace. For example,
        # arn:aws:aps:&lt;region&gt;:123456789012:workspace/ws-example1-1234-abcd-5678-ef90abcd1234 .
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the workspace was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the workspace.
        @[JSON::Field(key: "status")]
        getter status : Types::WorkspaceStatus

        # The unique ID for the workspace. For example, ws-example1-1234-abcd-5678-ef90abcd1234 .
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The alias that is assigned to this workspace to help identify it. It does not need to be unique.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # (optional) If the workspace was created with a customer managed KMS key, the ARN for the key used.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The Prometheus endpoint available for this workspace. For example,
        # https://aps-workspaces.&lt;region&gt;.amazonaws.com/workspaces/ws-example1-1234-abcd-5678-ef90abcd1234/api/v1/
        # .
        @[JSON::Field(key: "prometheusEndpoint")]
        getter prometheus_endpoint : String?

        # The list of tag keys and values that are associated with the workspace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @status : Types::WorkspaceStatus,
          @workspace_id : String,
          @alias : String? = nil,
          @kms_key_arn : String? = nil,
          @prometheus_endpoint : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The status of the workspace.
      struct WorkspaceStatus
        include JSON::Serializable

        # The current status of the workspace.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        def initialize(
          @status_code : String
        )
        end
      end

      # The information about one Amazon Managed Service for Prometheus workspace in your account.
      struct WorkspaceSummary
        include JSON::Serializable

        # The ARN of the workspace.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the workspace was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the workspace.
        @[JSON::Field(key: "status")]
        getter status : Types::WorkspaceStatus

        # The unique ID for the workspace.
        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The alias that is assigned to this workspace to help identify it. It does not need to be unique.
        @[JSON::Field(key: "alias")]
        getter alias : String?

        # (optional) If the workspace was created with a customer managed KMS key, the ARN for the key used.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The list of tag keys and values that are associated with the workspace.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @status : Types::WorkspaceStatus,
          @workspace_id : String,
          @alias : String? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
