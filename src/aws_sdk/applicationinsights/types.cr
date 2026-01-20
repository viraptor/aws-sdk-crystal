require "json"
require "time"

module AwsSdk
  module ApplicationInsights
    module Types

      # User does not have permissions to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AddWorkloadRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The configuration settings of the workload. The value is the escaped JSON of the configuration.

        @[JSON::Field(key: "WorkloadConfiguration")]
        getter workload_configuration : Types::WorkloadConfiguration

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @workload_configuration : Types::WorkloadConfiguration
        )
        end
      end


      struct AddWorkloadResponse
        include JSON::Serializable

        # The configuration settings of the workload. The value is the escaped JSON of the configuration.

        @[JSON::Field(key: "WorkloadConfiguration")]
        getter workload_configuration : Types::WorkloadConfiguration?

        # The ID of the workload.

        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @workload_configuration : Types::WorkloadConfiguration? = nil,
          @workload_id : String? = nil
        )
        end
      end

      # Describes a standalone resource or similarly grouped resources that the application is made up of.

      struct ApplicationComponent
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String?

        # If logging is supported for the resource type, indicates whether the component has configured logs
        # to be monitored.

        @[JSON::Field(key: "ComponentRemarks")]
        getter component_remarks : String?

        # Workloads detected in the application component.

        @[JSON::Field(key: "DetectedWorkload")]
        getter detected_workload : Hash(String, Hash(String, String))?

        # Indicates whether the application component is monitored.

        @[JSON::Field(key: "Monitor")]
        getter monitor : Bool?

        # The operating system of the component.

        @[JSON::Field(key: "OsType")]
        getter os_type : String?

        # The resource type. Supported resource types include EC2 instances, Auto Scaling group, Classic ELB,
        # Application ELB, and SQS Queue.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The stack tier of the application component.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        def initialize(
          @component_name : String? = nil,
          @component_remarks : String? = nil,
          @detected_workload : Hash(String, Hash(String, String))? = nil,
          @monitor : Bool? = nil,
          @os_type : String? = nil,
          @resource_type : String? = nil,
          @tier : String? = nil
        )
        end
      end

      # Describes the status of the application.

      struct ApplicationInfo
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the application.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # If set to true, the managed policies for SSM and CW will be attached to the instance roles if they
        # are missing.

        @[JSON::Field(key: "AttachMissingPermission")]
        getter attach_missing_permission : Bool?

        # Indicates whether auto-configuration is turned on for this application.

        @[JSON::Field(key: "AutoConfigEnabled")]
        getter auto_config_enabled : Bool?

        # Indicates whether Application Insights can listen to CloudWatch events for the application
        # resources, such as instance terminated , failed deployment , and others.

        @[JSON::Field(key: "CWEMonitorEnabled")]
        getter cwe_monitor_enabled : Bool?

        # The method used by Application Insights to onboard your resources.

        @[JSON::Field(key: "DiscoveryType")]
        getter discovery_type : String?

        # The lifecycle of the application.

        @[JSON::Field(key: "LifeCycle")]
        getter life_cycle : String?

        # Indicates whether Application Insights will create opsItems for any problem detected by Application
        # Insights for an application.

        @[JSON::Field(key: "OpsCenterEnabled")]
        getter ops_center_enabled : Bool?

        # The SNS topic provided to Application Insights that is associated to the created opsItems to receive
        # SNS notifications for opsItem updates.

        @[JSON::Field(key: "OpsItemSNSTopicArn")]
        getter ops_item_sns_topic_arn : String?

        # The issues on the user side that block Application Insights from successfully monitoring an
        # application. Example remarks include: “Configuring application, detected 1 Errors, 3 Warnings”
        # “Configuring application, detected 1 Unconfigured Components”

        @[JSON::Field(key: "Remarks")]
        getter remarks : String?

        # The name of the resource group used for the application.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        # The SNS topic ARN that is associated with SNS notifications for updates or issues.

        @[JSON::Field(key: "SNSNotificationArn")]
        getter sns_notification_arn : String?

        def initialize(
          @account_id : String? = nil,
          @attach_missing_permission : Bool? = nil,
          @auto_config_enabled : Bool? = nil,
          @cwe_monitor_enabled : Bool? = nil,
          @discovery_type : String? = nil,
          @life_cycle : String? = nil,
          @ops_center_enabled : Bool? = nil,
          @ops_item_sns_topic_arn : String? = nil,
          @remarks : String? = nil,
          @resource_group_name : String? = nil,
          @sns_notification_arn : String? = nil
        )
        end
      end

      # The request is not understood by the server.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The event information.

      struct ConfigurationEvent
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the application to which the configuration event
        # belongs.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The details of the event in plain text.

        @[JSON::Field(key: "EventDetail")]
        getter event_detail : String?

        # The name of the resource Application Insights attempted to configure.

        @[JSON::Field(key: "EventResourceName")]
        getter event_resource_name : String?

        # The resource type that Application Insights attempted to configure, for example, CLOUDWATCH_ALARM.

        @[JSON::Field(key: "EventResourceType")]
        getter event_resource_type : String?

        # The status of the configuration update event. Possible values include INFO, WARN, and ERROR.

        @[JSON::Field(key: "EventStatus")]
        getter event_status : String?

        # The timestamp of the event.

        @[JSON::Field(key: "EventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter event_time : Time?

        # The resource monitored by Application Insights.

        @[JSON::Field(key: "MonitoredResourceARN")]
        getter monitored_resource_arn : String?

        # The name of the resource group of the application to which the configuration event belongs.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        def initialize(
          @account_id : String? = nil,
          @event_detail : String? = nil,
          @event_resource_name : String? = nil,
          @event_resource_type : String? = nil,
          @event_status : String? = nil,
          @event_time : Time? = nil,
          @monitored_resource_arn : String? = nil,
          @resource_group_name : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # If set to true, the managed policies for SSM and CW will be attached to the instance roles if they
        # are missing.

        @[JSON::Field(key: "AttachMissingPermission")]
        getter attach_missing_permission : Bool?

        # Indicates whether Application Insights automatically configures unmonitored resources in the
        # resource group.

        @[JSON::Field(key: "AutoConfigEnabled")]
        getter auto_config_enabled : Bool?

        # Configures all of the resources in the resource group by applying the recommended configurations.

        @[JSON::Field(key: "AutoCreate")]
        getter auto_create : Bool?

        # Indicates whether Application Insights can listen to CloudWatch events for the application
        # resources, such as instance terminated , failed deployment , and others.

        @[JSON::Field(key: "CWEMonitorEnabled")]
        getter cwe_monitor_enabled : Bool?

        # Application Insights can create applications based on a resource group or on an account. To create
        # an account-based application using all of the resources in the account, set this parameter to
        # ACCOUNT_BASED .

        @[JSON::Field(key: "GroupingType")]
        getter grouping_type : String?

        # When set to true , creates opsItems for any problems detected on an application.

        @[JSON::Field(key: "OpsCenterEnabled")]
        getter ops_center_enabled : Bool?

        # The SNS topic provided to Application Insights that is associated to the created opsItem. Allows you
        # to receive notifications for updates to the opsItem.

        @[JSON::Field(key: "OpsItemSNSTopicArn")]
        getter ops_item_sns_topic_arn : String?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        # The SNS notification topic ARN.

        @[JSON::Field(key: "SNSNotificationArn")]
        getter sns_notification_arn : String?

        # List of tags to add to the application. tag key ( Key ) and an associated tag value ( Value ). The
        # maximum length of a tag key is 128 characters. The maximum length of a tag value is 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @attach_missing_permission : Bool? = nil,
          @auto_config_enabled : Bool? = nil,
          @auto_create : Bool? = nil,
          @cwe_monitor_enabled : Bool? = nil,
          @grouping_type : String? = nil,
          @ops_center_enabled : Bool? = nil,
          @ops_item_sns_topic_arn : String? = nil,
          @resource_group_name : String? = nil,
          @sns_notification_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # Information about the application.

        @[JSON::Field(key: "ApplicationInfo")]
        getter application_info : Types::ApplicationInfo?

        def initialize(
          @application_info : Types::ApplicationInfo? = nil
        )
        end
      end


      struct CreateComponentRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The list of resource ARNs that belong to the component.

        @[JSON::Field(key: "ResourceList")]
        getter resource_list : Array(String)

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @resource_list : Array(String)
        )
        end
      end


      struct CreateComponentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateLogPatternRequest
        include JSON::Serializable

        # The log pattern. The pattern must be DFA compatible. Patterns that utilize forward lookahead or
        # backreference constructions are not supported.

        @[JSON::Field(key: "Pattern")]
        getter pattern : String

        # The name of the log pattern.

        @[JSON::Field(key: "PatternName")]
        getter pattern_name : String

        # The name of the log pattern set.

        @[JSON::Field(key: "PatternSetName")]
        getter pattern_set_name : String

        # Rank of the log pattern. Must be a value between 1 and 1,000,000 . The patterns are sorted by rank,
        # so we recommend that you set your highest priority patterns with the lowest rank. A pattern of rank
        # 1 will be the first to get matched to a log line. A pattern of rank 1,000,000 will be last to get
        # matched. When you configure custom log patterns from the console, a Low severity pattern translates
        # to a 750,000 rank. A Medium severity pattern translates to a 500,000 rank. And a High severity
        # pattern translates to a 250,000 rank. Rank values less than 1 or greater than 1,000,000 are reserved
        # for Amazon Web Services provided patterns.

        @[JSON::Field(key: "Rank")]
        getter rank : Int32

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        def initialize(
          @pattern : String,
          @pattern_name : String,
          @pattern_set_name : String,
          @rank : Int32,
          @resource_group_name : String
        )
        end
      end


      struct CreateLogPatternResponse
        include JSON::Serializable

        # The successfully created log pattern.

        @[JSON::Field(key: "LogPattern")]
        getter log_pattern : Types::LogPattern?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        def initialize(
          @log_pattern : Types::LogPattern? = nil,
          @resource_group_name : String? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        def initialize(
          @resource_group_name : String
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteComponentRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        def initialize(
          @component_name : String,
          @resource_group_name : String
        )
        end
      end


      struct DeleteComponentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLogPatternRequest
        include JSON::Serializable

        # The name of the log pattern.

        @[JSON::Field(key: "PatternName")]
        getter pattern_name : String

        # The name of the log pattern set.

        @[JSON::Field(key: "PatternSetName")]
        getter pattern_set_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        def initialize(
          @pattern_name : String,
          @pattern_set_name : String,
          @resource_group_name : String
        )
        end
      end


      struct DeleteLogPatternResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeApplicationRequest
        include JSON::Serializable

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @resource_group_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeApplicationResponse
        include JSON::Serializable

        # Information about the application.

        @[JSON::Field(key: "ApplicationInfo")]
        getter application_info : Types::ApplicationInfo?

        def initialize(
          @application_info : Types::ApplicationInfo? = nil
        )
        end
      end


      struct DescribeComponentConfigurationRecommendationRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The tier of the application component.

        @[JSON::Field(key: "Tier")]
        getter tier : String

        # The recommended configuration type.

        @[JSON::Field(key: "RecommendationType")]
        getter recommendation_type : String?

        # The name of the workload. The name of the workload is required when the tier of the application
        # component is SAP_ASE_SINGLE_NODE or SAP_ASE_HIGH_AVAILABILITY .

        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @tier : String,
          @recommendation_type : String? = nil,
          @workload_name : String? = nil
        )
        end
      end


      struct DescribeComponentConfigurationRecommendationResponse
        include JSON::Serializable

        # The recommended configuration settings of the component. The value is the escaped JSON of the
        # configuration.

        @[JSON::Field(key: "ComponentConfiguration")]
        getter component_configuration : String?

        def initialize(
          @component_configuration : String? = nil
        )
        end
      end


      struct DescribeComponentConfigurationRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeComponentConfigurationResponse
        include JSON::Serializable

        # The configuration settings of the component. The value is the escaped JSON of the configuration.

        @[JSON::Field(key: "ComponentConfiguration")]
        getter component_configuration : String?

        # Indicates whether the application component is monitored.

        @[JSON::Field(key: "Monitor")]
        getter monitor : Bool?

        # The tier of the application component. Supported tiers include DOT_NET_CORE , DOT_NET_WORKER ,
        # DOT_NET_WEB , SQL_SERVER , and DEFAULT

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        def initialize(
          @component_configuration : String? = nil,
          @monitor : Bool? = nil,
          @tier : String? = nil
        )
        end
      end


      struct DescribeComponentRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeComponentResponse
        include JSON::Serializable


        @[JSON::Field(key: "ApplicationComponent")]
        getter application_component : Types::ApplicationComponent?

        # The list of resource ARNs that belong to the component.

        @[JSON::Field(key: "ResourceList")]
        getter resource_list : Array(String)?

        def initialize(
          @application_component : Types::ApplicationComponent? = nil,
          @resource_list : Array(String)? = nil
        )
        end
      end


      struct DescribeLogPatternRequest
        include JSON::Serializable

        # The name of the log pattern.

        @[JSON::Field(key: "PatternName")]
        getter pattern_name : String

        # The name of the log pattern set.

        @[JSON::Field(key: "PatternSetName")]
        getter pattern_set_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @pattern_name : String,
          @pattern_set_name : String,
          @resource_group_name : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeLogPatternResponse
        include JSON::Serializable

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The successfully created log pattern.

        @[JSON::Field(key: "LogPattern")]
        getter log_pattern : Types::LogPattern?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        def initialize(
          @account_id : String? = nil,
          @log_pattern : Types::LogPattern? = nil,
          @resource_group_name : String? = nil
        )
        end
      end


      struct DescribeObservationRequest
        include JSON::Serializable

        # The ID of the observation.

        @[JSON::Field(key: "ObservationId")]
        getter observation_id : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @observation_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeObservationResponse
        include JSON::Serializable

        # Information about the observation.

        @[JSON::Field(key: "Observation")]
        getter observation : Types::Observation?

        def initialize(
          @observation : Types::Observation? = nil
        )
        end
      end


      struct DescribeProblemObservationsRequest
        include JSON::Serializable

        # The ID of the problem.

        @[JSON::Field(key: "ProblemId")]
        getter problem_id : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @problem_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeProblemObservationsResponse
        include JSON::Serializable

        # Observations related to the problem.

        @[JSON::Field(key: "RelatedObservations")]
        getter related_observations : Types::RelatedObservations?

        def initialize(
          @related_observations : Types::RelatedObservations? = nil
        )
        end
      end


      struct DescribeProblemRequest
        include JSON::Serializable

        # The ID of the problem.

        @[JSON::Field(key: "ProblemId")]
        getter problem_id : String

        # The Amazon Web Services account ID for the owner of the resource group affected by the problem.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @problem_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeProblemResponse
        include JSON::Serializable

        # Information about the problem.

        @[JSON::Field(key: "Problem")]
        getter problem : Types::Problem?

        # The SNS notification topic ARN of the problem.

        @[JSON::Field(key: "SNSNotificationArn")]
        getter sns_notification_arn : String?

        def initialize(
          @problem : Types::Problem? = nil,
          @sns_notification_arn : String? = nil
        )
        end
      end


      struct DescribeWorkloadRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The ID of the workload.

        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        # The Amazon Web Services account ID for the workload owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @workload_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeWorkloadResponse
        include JSON::Serializable

        # The configuration settings of the workload. The value is the escaped JSON of the configuration.

        @[JSON::Field(key: "WorkloadConfiguration")]
        getter workload_configuration : Types::WorkloadConfiguration?

        # The ID of the workload.

        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        # If logging is supported for the resource type, shows whether the component has configured logs to be
        # monitored.

        @[JSON::Field(key: "WorkloadRemarks")]
        getter workload_remarks : String?

        def initialize(
          @workload_configuration : Types::WorkloadConfiguration? = nil,
          @workload_id : String? = nil,
          @workload_remarks : String? = nil
        )
        end
      end

      # The server encountered an internal error and is unable to complete the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # The list of applications.

        @[JSON::Field(key: "ApplicationInfoList")]
        getter application_info_list : Array(Types::ApplicationInfo)?

        # The token used to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_info_list : Array(Types::ApplicationInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentsRequest
        include JSON::Serializable

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_group_name : String,
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComponentsResponse
        include JSON::Serializable

        # The list of application components.

        @[JSON::Field(key: "ApplicationComponentList")]
        getter application_component_list : Array(Types::ApplicationComponent)?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_component_list : Array(Types::ApplicationComponent)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfigurationHistoryRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The end time of the event.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The status of the configuration update event. Possible values include INFO, WARN, and ERROR.

        @[JSON::Field(key: "EventStatus")]
        getter event_status : String?

        # The maximum number of results returned by ListConfigurationHistory in paginated output. When this
        # parameter is used, ListConfigurationHistory returns only MaxResults in a single page along with a
        # NextToken response element. The remaining results of the initial request can be seen by sending
        # another ListConfigurationHistory request with the returned NextToken value. If this parameter is not
        # used, then ListConfigurationHistory returns all results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The NextToken value returned from a previous paginated ListConfigurationHistory request where
        # MaxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the NextToken value. This value is null when there are
        # no more results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Resource group to which the application belongs.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        # The start time of the event.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @account_id : String? = nil,
          @end_time : Time? = nil,
          @event_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_group_name : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListConfigurationHistoryResponse
        include JSON::Serializable

        # The list of configuration events and their corresponding details.

        @[JSON::Field(key: "EventList")]
        getter event_list : Array(Types::ConfigurationEvent)?

        # The NextToken value to include in a future ListConfigurationHistory request. When the results of a
        # ListConfigurationHistory request exceed MaxResults , this value can be used to retrieve the next
        # page of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_list : Array(Types::ConfigurationEvent)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLogPatternSetsRequest
        include JSON::Serializable

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_group_name : String,
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLogPatternSetsResponse
        include JSON::Serializable

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The list of log pattern sets.

        @[JSON::Field(key: "LogPatternSets")]
        getter log_pattern_sets : Array(String)?

        # The token used to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        def initialize(
          @account_id : String? = nil,
          @log_pattern_sets : Array(String)? = nil,
          @next_token : String? = nil,
          @resource_group_name : String? = nil
        )
        end
      end


      struct ListLogPatternsRequest
        include JSON::Serializable

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the log pattern set.

        @[JSON::Field(key: "PatternSetName")]
        getter pattern_set_name : String?

        def initialize(
          @resource_group_name : String,
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pattern_set_name : String? = nil
        )
        end
      end


      struct ListLogPatternsResponse
        include JSON::Serializable

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The list of log patterns.

        @[JSON::Field(key: "LogPatterns")]
        getter log_patterns : Array(Types::LogPattern)?

        # The token used to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        def initialize(
          @account_id : String? = nil,
          @log_patterns : Array(Types::LogPattern)? = nil,
          @next_token : String? = nil,
          @resource_group_name : String? = nil
        )
        end
      end


      struct ListProblemsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String?

        # The time when the problem ended, in epoch seconds. If not specified, problems within the past seven
        # days are returned.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        # The time when the problem was detected, in epoch seconds. If you don't specify a time frame for the
        # request, problems within the past seven days are returned.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Specifies whether or not you can view the problem. If not specified, visible and ignored problems
        # are returned.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @account_id : String? = nil,
          @component_name : String? = nil,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_group_name : String? = nil,
          @start_time : Time? = nil,
          @visibility : String? = nil
        )
        end
      end


      struct ListProblemsResponse
        include JSON::Serializable

        # The Amazon Web Services account ID for the resource group owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The token used to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of problems.

        @[JSON::Field(key: "ProblemList")]
        getter problem_list : Array(Types::Problem)?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        def initialize(
          @account_id : String? = nil,
          @next_token : String? = nil,
          @problem_list : Array(Types::Problem)? = nil,
          @resource_group_name : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application that you want to retrieve tag information for.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # An array that lists all the tags that are associated with the application. Each tag consists of a
        # required tag key ( Key ) and an associated tag value ( Value ).

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListWorkloadsRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The Amazon Web Services account ID of the owner of the workload.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkloadsResponse
        include JSON::Serializable

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of workloads.

        @[JSON::Field(key: "WorkloadList")]
        getter workload_list : Array(Types::Workload)?

        def initialize(
          @next_token : String? = nil,
          @workload_list : Array(Types::Workload)? = nil
        )
        end
      end

      # An object that defines the log patterns that belongs to a LogPatternSet .

      struct LogPattern
        include JSON::Serializable

        # A regular expression that defines the log pattern. A log pattern can contain as many as 50
        # characters, and it cannot be empty. The pattern must be DFA compatible. Patterns that utilize
        # forward lookahead or backreference constructions are not supported.

        @[JSON::Field(key: "Pattern")]
        getter pattern : String?

        # The name of the log pattern. A log pattern name can contain as many as 50 characters, and it cannot
        # be empty. The characters can be Unicode letters, digits, or one of the following symbols: period,
        # dash, underscore.

        @[JSON::Field(key: "PatternName")]
        getter pattern_name : String?

        # The name of the log pattern. A log pattern name can contain as many as 30 characters, and it cannot
        # be empty. The characters can be Unicode letters, digits, or one of the following symbols: period,
        # dash, underscore.

        @[JSON::Field(key: "PatternSetName")]
        getter pattern_set_name : String?

        # Rank of the log pattern. Must be a value between 1 and 1,000,000 . The patterns are sorted by rank,
        # so we recommend that you set your highest priority patterns with the lowest rank. A pattern of rank
        # 1 will be the first to get matched to a log line. A pattern of rank 1,000,000 will be last to get
        # matched. When you configure custom log patterns from the console, a Low severity pattern translates
        # to a 750,000 rank. A Medium severity pattern translates to a 500,000 rank. And a High severity
        # pattern translates to a 250,000 rank. Rank values less than 1 or greater than 1,000,000 are reserved
        # for Amazon Web Services provided patterns.

        @[JSON::Field(key: "Rank")]
        getter rank : Int32?

        def initialize(
          @pattern : String? = nil,
          @pattern_name : String? = nil,
          @pattern_set_name : String? = nil,
          @rank : Int32? = nil
        )
        end
      end

      # Describes an anomaly or error with the application.

      struct Observation
        include JSON::Serializable

        # The detail type of the CloudWatch Event-based observation, for example, EC2 Instance State-change
        # Notification .

        @[JSON::Field(key: "CloudWatchEventDetailType")]
        getter cloud_watch_event_detail_type : String?

        # The ID of the CloudWatch Event-based observation related to the detected problem.

        @[JSON::Field(key: "CloudWatchEventId")]
        getter cloud_watch_event_id : String?

        # The source of the CloudWatch Event.

        @[JSON::Field(key: "CloudWatchEventSource")]
        getter cloud_watch_event_source : String?

        # The CodeDeploy application to which the deployment belongs.

        @[JSON::Field(key: "CodeDeployApplication")]
        getter code_deploy_application : String?

        # The deployment group to which the CodeDeploy deployment belongs.

        @[JSON::Field(key: "CodeDeployDeploymentGroup")]
        getter code_deploy_deployment_group : String?

        # The deployment ID of the CodeDeploy-based observation related to the detected problem.

        @[JSON::Field(key: "CodeDeployDeploymentId")]
        getter code_deploy_deployment_id : String?

        # The instance group to which the CodeDeploy instance belongs.

        @[JSON::Field(key: "CodeDeployInstanceGroupId")]
        getter code_deploy_instance_group_id : String?

        # The status of the CodeDeploy deployment, for example SUCCESS or FAILURE .

        @[JSON::Field(key: "CodeDeployState")]
        getter code_deploy_state : String?

        # The cause of an EBS CloudWatch event.

        @[JSON::Field(key: "EbsCause")]
        getter ebs_cause : String?

        # The type of EBS CloudWatch event, such as createVolume , deleteVolume or attachVolume .

        @[JSON::Field(key: "EbsEvent")]
        getter ebs_event : String?

        # The request ID of an EBS CloudWatch event.

        @[JSON::Field(key: "EbsRequestId")]
        getter ebs_request_id : String?

        # The result of an EBS CloudWatch event, such as failed or succeeded .

        @[JSON::Field(key: "EbsResult")]
        getter ebs_result : String?

        # The state of the instance, such as STOPPING or TERMINATING .

        @[JSON::Field(key: "Ec2State")]
        getter ec2_state : String?

        # The time when the observation ended, in epoch seconds.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Name (ARN) of the Health Event-based observation.

        @[JSON::Field(key: "HealthEventArn")]
        getter health_event_arn : String?

        # The description of the Health event provided by the service, such as Amazon EC2.

        @[JSON::Field(key: "HealthEventDescription")]
        getter health_event_description : String?

        # The category of the Health event, such as issue .

        @[JSON::Field(key: "HealthEventTypeCategory")]
        getter health_event_type_category : String?

        # The type of the Health event, for example, AWS_EC2_POWER_CONNECTIVITY_ISSUE .

        @[JSON::Field(key: "HealthEventTypeCode")]
        getter health_event_type_code : String?

        # The service to which the Health Event belongs, such as EC2.

        @[JSON::Field(key: "HealthService")]
        getter health_service : String?

        # The ID of the observation type.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The timestamp in the CloudWatch Logs that specifies when the matched line occurred.

        @[JSON::Field(key: "LineTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter line_time : Time?

        # The log filter of the observation.

        @[JSON::Field(key: "LogFilter")]
        getter log_filter : String?

        # The log group name.

        @[JSON::Field(key: "LogGroup")]
        getter log_group : String?

        # The log text of the observation.

        @[JSON::Field(key: "LogText")]
        getter log_text : String?

        # The name of the observation metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The namespace of the observation metric.

        @[JSON::Field(key: "MetricNamespace")]
        getter metric_namespace : String?

        # The category of an RDS event.

        @[JSON::Field(key: "RdsEventCategories")]
        getter rds_event_categories : String?

        # The message of an RDS event.

        @[JSON::Field(key: "RdsEventMessage")]
        getter rds_event_message : String?

        # The name of the S3 CloudWatch Event-based observation.

        @[JSON::Field(key: "S3EventName")]
        getter s3_event_name : String?

        # The source resource ARN of the observation.

        @[JSON::Field(key: "SourceARN")]
        getter source_arn : String?

        # The source type of the observation.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The time when the observation was first detected, in epoch seconds.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) of the step function-based observation.

        @[JSON::Field(key: "StatesArn")]
        getter states_arn : String?

        # The Amazon Resource Name (ARN) of the step function execution-based observation.

        @[JSON::Field(key: "StatesExecutionArn")]
        getter states_execution_arn : String?

        # The input to the step function-based observation.

        @[JSON::Field(key: "StatesInput")]
        getter states_input : String?

        # The status of the step function-related observation.

        @[JSON::Field(key: "StatesStatus")]
        getter states_status : String?

        # The unit of the source observation metric.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # The value of the source observation metric.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        # The X-Ray request error percentage for this node.

        @[JSON::Field(key: "XRayErrorPercent")]
        getter x_ray_error_percent : Int32?

        # The X-Ray request fault percentage for this node.

        @[JSON::Field(key: "XRayFaultPercent")]
        getter x_ray_fault_percent : Int32?

        # The name of the X-Ray node.

        @[JSON::Field(key: "XRayNodeName")]
        getter x_ray_node_name : String?

        # The type of the X-Ray node.

        @[JSON::Field(key: "XRayNodeType")]
        getter x_ray_node_type : String?

        # The X-Ray node request average latency for this node.

        @[JSON::Field(key: "XRayRequestAverageLatency")]
        getter x_ray_request_average_latency : Int64?

        # The X-Ray request count for this node.

        @[JSON::Field(key: "XRayRequestCount")]
        getter x_ray_request_count : Int32?

        # The X-Ray request throttle percentage for this node.

        @[JSON::Field(key: "XRayThrottlePercent")]
        getter x_ray_throttle_percent : Int32?

        def initialize(
          @cloud_watch_event_detail_type : String? = nil,
          @cloud_watch_event_id : String? = nil,
          @cloud_watch_event_source : String? = nil,
          @code_deploy_application : String? = nil,
          @code_deploy_deployment_group : String? = nil,
          @code_deploy_deployment_id : String? = nil,
          @code_deploy_instance_group_id : String? = nil,
          @code_deploy_state : String? = nil,
          @ebs_cause : String? = nil,
          @ebs_event : String? = nil,
          @ebs_request_id : String? = nil,
          @ebs_result : String? = nil,
          @ec2_state : String? = nil,
          @end_time : Time? = nil,
          @health_event_arn : String? = nil,
          @health_event_description : String? = nil,
          @health_event_type_category : String? = nil,
          @health_event_type_code : String? = nil,
          @health_service : String? = nil,
          @id : String? = nil,
          @line_time : Time? = nil,
          @log_filter : String? = nil,
          @log_group : String? = nil,
          @log_text : String? = nil,
          @metric_name : String? = nil,
          @metric_namespace : String? = nil,
          @rds_event_categories : String? = nil,
          @rds_event_message : String? = nil,
          @s3_event_name : String? = nil,
          @source_arn : String? = nil,
          @source_type : String? = nil,
          @start_time : Time? = nil,
          @states_arn : String? = nil,
          @states_execution_arn : String? = nil,
          @states_input : String? = nil,
          @states_status : String? = nil,
          @unit : String? = nil,
          @value : Float64? = nil,
          @x_ray_error_percent : Int32? = nil,
          @x_ray_fault_percent : Int32? = nil,
          @x_ray_node_name : String? = nil,
          @x_ray_node_type : String? = nil,
          @x_ray_request_average_latency : Int64? = nil,
          @x_ray_request_count : Int32? = nil,
          @x_ray_throttle_percent : Int32? = nil
        )
        end
      end

      # Describes a problem that is detected by correlating observations.

      struct Problem
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the resource group affected by the problem.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The resource affected by the problem.

        @[JSON::Field(key: "AffectedResource")]
        getter affected_resource : String?

        # The time when the problem ended, in epoch seconds.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Feedback provided by the user about the problem.

        @[JSON::Field(key: "Feedback")]
        getter feedback : Hash(String, String)?

        # The ID of the problem.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A detailed analysis of the problem using machine learning.

        @[JSON::Field(key: "Insights")]
        getter insights : String?

        # The last time that the problem reoccurred after its last resolution.

        @[JSON::Field(key: "LastRecurrenceTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_recurrence_time : Time?

        # The number of times that the same problem reoccurred after the first time it was resolved.

        @[JSON::Field(key: "RecurringCount")]
        getter recurring_count : Int64?

        # Specifies how the problem was resolved. If the value is AUTOMATIC , the system resolved the problem.
        # If the value is MANUAL , the user resolved the problem. If the value is UNRESOLVED , then the
        # problem is not resolved.

        @[JSON::Field(key: "ResolutionMethod")]
        getter resolution_method : String?

        # The name of the resource group affected by the problem.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        # A measure of the level of impact of the problem.

        @[JSON::Field(key: "SeverityLevel")]
        getter severity_level : String?

        # The short name of the problem associated with the SNS notification.

        @[JSON::Field(key: "ShortName")]
        getter short_name : String?

        # The time when the problem started, in epoch seconds.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the problem.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the problem.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # Specifies whether or not you can view the problem. Updates to ignored problems do not generate
        # notifications.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @account_id : String? = nil,
          @affected_resource : String? = nil,
          @end_time : Time? = nil,
          @feedback : Hash(String, String)? = nil,
          @id : String? = nil,
          @insights : String? = nil,
          @last_recurrence_time : Time? = nil,
          @recurring_count : Int64? = nil,
          @resolution_method : String? = nil,
          @resource_group_name : String? = nil,
          @severity_level : String? = nil,
          @short_name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @title : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Describes observations related to the problem.

      struct RelatedObservations
        include JSON::Serializable

        # The list of observations related to the problem.

        @[JSON::Field(key: "ObservationList")]
        getter observation_list : Array(Types::Observation)?

        def initialize(
          @observation_list : Array(Types::Observation)? = nil
        )
        end
      end


      struct RemoveWorkloadRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The ID of the workload.

        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @workload_id : String
        )
        end
      end


      struct RemoveWorkloadResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The resource is already created or in use.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource does not exist in the customer account.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that defines the tags associated with an application. A tag is a label that you optionally
      # define and associate with an application. Tags can help you categorize and manage resources in
      # different ways, such as by purpose, owner, environment, or other criteria. Each tag consists of a
      # required tag key and an associated tag value , both of which you define. A tag key is a general
      # label that acts as a category for a more specific tag value. A tag value acts as a descriptor within
      # a tag key. A tag key can contain as many as 128 characters. A tag value can contain as many as 256
      # characters. The characters can be Unicode letters, digits, white space, or one of the following
      # symbols: _ . : / = + -. The following additional restrictions apply to tags: Tag keys and values are
      # case sensitive. For each associated resource, each tag key must be unique and it can have only one
      # value. The aws: prefix is reserved for use by Amazon Web Services; you can’t use it in any tag keys
      # or values that you define. In addition, you can't edit or remove tag keys or values that use this
      # prefix.

      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that defines a tag. The maximum length of a tag key is 128 characters.
        # The minimum length is 1 character.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The optional part of a key-value pair that defines a tag. The maximum length of a tag value is 256
        # characters. The minimum length is 0 characters. If you don't want an application to have a specific
        # tag value, don't specify a value for this parameter.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application that you want to add one or more tags to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tags that to add to the application. A tag consists of a required tag key ( Key ) and an
        # associated tag value ( Value ). The maximum length of a tag key is 128 characters. The maximum
        # length of a tag value is 256 characters.

        @[JSON::Field(key: "Tags")]
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

      # Tags are already registered for the specified application ARN.

      struct TagsAlreadyExistException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of the provided tags is beyond the limit, or the number of total tags you are trying to
      # attach to the specified resource exceeds the limit.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the resource with too many tags.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application that you want to remove one or more tags from.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tags (tag keys) that you want to remove from the resource. When you specify a tag key, the
        # action removes both that key and its associated tag value. To remove more than one tag from the
        # application, append the TagKeys parameter and argument for each additional tag to remove, separated
        # by an ampersand.

        @[JSON::Field(key: "TagKeys")]
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


      struct UpdateApplicationRequest
        include JSON::Serializable

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # If set to true, the managed policies for SSM and CW will be attached to the instance roles if they
        # are missing.

        @[JSON::Field(key: "AttachMissingPermission")]
        getter attach_missing_permission : Bool?

        # Turns auto-configuration on or off.

        @[JSON::Field(key: "AutoConfigEnabled")]
        getter auto_config_enabled : Bool?

        # Indicates whether Application Insights can listen to CloudWatch events for the application
        # resources, such as instance terminated , failed deployment , and others.

        @[JSON::Field(key: "CWEMonitorEnabled")]
        getter cwe_monitor_enabled : Bool?

        # When set to true , creates opsItems for any problems detected on an application.

        @[JSON::Field(key: "OpsCenterEnabled")]
        getter ops_center_enabled : Bool?

        # The SNS topic provided to Application Insights that is associated to the created opsItem. Allows you
        # to receive notifications for updates to the opsItem.

        @[JSON::Field(key: "OpsItemSNSTopicArn")]
        getter ops_item_sns_topic_arn : String?

        # Disassociates the SNS topic from the opsItem created for detected problems.

        @[JSON::Field(key: "RemoveSNSTopic")]
        getter remove_sns_topic : Bool?

        # The SNS topic ARN. Allows you to receive SNS notifications for updates and issues with an
        # application.

        @[JSON::Field(key: "SNSNotificationArn")]
        getter sns_notification_arn : String?

        def initialize(
          @resource_group_name : String,
          @attach_missing_permission : Bool? = nil,
          @auto_config_enabled : Bool? = nil,
          @cwe_monitor_enabled : Bool? = nil,
          @ops_center_enabled : Bool? = nil,
          @ops_item_sns_topic_arn : String? = nil,
          @remove_sns_topic : Bool? = nil,
          @sns_notification_arn : String? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        # Information about the application.

        @[JSON::Field(key: "ApplicationInfo")]
        getter application_info : Types::ApplicationInfo?

        def initialize(
          @application_info : Types::ApplicationInfo? = nil
        )
        end
      end


      struct UpdateComponentConfigurationRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # Automatically configures the component by applying the recommended configurations.

        @[JSON::Field(key: "AutoConfigEnabled")]
        getter auto_config_enabled : Bool?

        # The configuration settings of the component. The value is the escaped JSON of the configuration. For
        # more information about the JSON format, see Working with JSON . You can send a request to
        # DescribeComponentConfigurationRecommendation to see the recommended configuration for a component.
        # For the complete format of the component configuration file, see Component Configuration .

        @[JSON::Field(key: "ComponentConfiguration")]
        getter component_configuration : String?

        # Indicates whether the application component is monitored.

        @[JSON::Field(key: "Monitor")]
        getter monitor : Bool?

        # The tier of the application component.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @auto_config_enabled : Bool? = nil,
          @component_configuration : String? = nil,
          @monitor : Bool? = nil,
          @tier : String? = nil
        )
        end
      end


      struct UpdateComponentConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateComponentRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The new name of the component.

        @[JSON::Field(key: "NewComponentName")]
        getter new_component_name : String?

        # The list of resource ARNs that belong to the component.

        @[JSON::Field(key: "ResourceList")]
        getter resource_list : Array(String)?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @new_component_name : String? = nil,
          @resource_list : Array(String)? = nil
        )
        end
      end


      struct UpdateComponentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLogPatternRequest
        include JSON::Serializable

        # The name of the log pattern.

        @[JSON::Field(key: "PatternName")]
        getter pattern_name : String

        # The name of the log pattern set.

        @[JSON::Field(key: "PatternSetName")]
        getter pattern_set_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The log pattern. The pattern must be DFA compatible. Patterns that utilize forward lookahead or
        # backreference constructions are not supported.

        @[JSON::Field(key: "Pattern")]
        getter pattern : String?

        # Rank of the log pattern. Must be a value between 1 and 1,000,000 . The patterns are sorted by rank,
        # so we recommend that you set your highest priority patterns with the lowest rank. A pattern of rank
        # 1 will be the first to get matched to a log line. A pattern of rank 1,000,000 will be last to get
        # matched. When you configure custom log patterns from the console, a Low severity pattern translates
        # to a 750,000 rank. A Medium severity pattern translates to a 500,000 rank. And a High severity
        # pattern translates to a 250,000 rank. Rank values less than 1 or greater than 1,000,000 are reserved
        # for Amazon Web Services provided patterns.

        @[JSON::Field(key: "Rank")]
        getter rank : Int32?

        def initialize(
          @pattern_name : String,
          @pattern_set_name : String,
          @resource_group_name : String,
          @pattern : String? = nil,
          @rank : Int32? = nil
        )
        end
      end


      struct UpdateLogPatternResponse
        include JSON::Serializable

        # The successfully created log pattern.

        @[JSON::Field(key: "LogPattern")]
        getter log_pattern : Types::LogPattern?

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String?

        def initialize(
          @log_pattern : Types::LogPattern? = nil,
          @resource_group_name : String? = nil
        )
        end
      end


      struct UpdateProblemRequest
        include JSON::Serializable

        # The ID of the problem.

        @[JSON::Field(key: "ProblemId")]
        getter problem_id : String

        # The status of the problem. Arguments can be passed for only problems that show a status of
        # RECOVERING .

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?

        # The visibility of a problem. When you pass a value of IGNORED , the problem is removed from the
        # default view, and all notifications for the problem are suspended. When VISIBLE is passed, the
        # IGNORED action is reversed.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @problem_id : String,
          @update_status : String? = nil,
          @visibility : String? = nil
        )
        end
      end


      struct UpdateProblemResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWorkloadRequest
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String

        # The name of the resource group.

        @[JSON::Field(key: "ResourceGroupName")]
        getter resource_group_name : String

        # The configuration settings of the workload. The value is the escaped JSON of the configuration.

        @[JSON::Field(key: "WorkloadConfiguration")]
        getter workload_configuration : Types::WorkloadConfiguration

        # The ID of the workload.

        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @component_name : String,
          @resource_group_name : String,
          @workload_configuration : Types::WorkloadConfiguration,
          @workload_id : String? = nil
        )
        end
      end


      struct UpdateWorkloadResponse
        include JSON::Serializable

        # The configuration settings of the workload. The value is the escaped JSON of the configuration.

        @[JSON::Field(key: "WorkloadConfiguration")]
        getter workload_configuration : Types::WorkloadConfiguration?

        # The ID of the workload.

        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @workload_configuration : Types::WorkloadConfiguration? = nil,
          @workload_id : String? = nil
        )
        end
      end

      # The parameter is not valid.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the workloads on a component.

      struct Workload
        include JSON::Serializable

        # The name of the component.

        @[JSON::Field(key: "ComponentName")]
        getter component_name : String?

        # Indicates whether all of the component configurations required to monitor a workload were provided.

        @[JSON::Field(key: "MissingWorkloadConfig")]
        getter missing_workload_config : Bool?

        # The tier of the workload.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The ID of the workload.

        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        # The name of the workload.

        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        # If logging is supported for the resource type, shows whether the component has configured logs to be
        # monitored.

        @[JSON::Field(key: "WorkloadRemarks")]
        getter workload_remarks : String?

        def initialize(
          @component_name : String? = nil,
          @missing_workload_config : Bool? = nil,
          @tier : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil,
          @workload_remarks : String? = nil
        )
        end
      end

      # The configuration of the workload.

      struct WorkloadConfiguration
        include JSON::Serializable

        # The configuration settings of the workload.

        @[JSON::Field(key: "Configuration")]
        getter configuration : String?

        # The configuration of the workload tier.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The name of the workload.

        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @configuration : String? = nil,
          @tier : String? = nil,
          @workload_name : String? = nil
        )
        end
      end
    end
  end
end
