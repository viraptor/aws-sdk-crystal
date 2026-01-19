require "json"
require "time"

module AwsSdk
  module Inspector
    module Types

      # You do not have required permissions to access the requested resource.
      struct AccessDeniedException
        include JSON::Serializable

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Code that indicates the type of error that is generated.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @error_code : String,
          @message : String
        )
        end
      end

      struct AddAttributesToFindingsRequest
        include JSON::Serializable

        # The array of attributes that you want to assign to specified findings.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)

        # The ARNs that specify the findings that you want to assign attributes to.
        @[JSON::Field(key: "findingArns")]
        getter finding_arns : Array(String)

        def initialize(
          @attributes : Array(Types::Attribute),
          @finding_arns : Array(String)
        )
        end
      end

      struct AddAttributesToFindingsResponse
        include JSON::Serializable

        # Attribute details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        def initialize(
          @failed_items : Hash(String, Types::FailedItemDetails)
        )
        end
      end

      # Used in the exception error that is thrown if you start an assessment run for an assessment target
      # that includes an EC2 instance that is already participating in another started assessment run.
      struct AgentAlreadyRunningAssessment
        include JSON::Serializable

        # ID of the agent that is running on an EC2 instance that is already participating in another started
        # assessment run.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The ARN of the assessment run that has already been started.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        def initialize(
          @agent_id : String,
          @assessment_run_arn : String
        )
        end
      end

      # Contains information about an Amazon Inspector agent. This data type is used as a request parameter
      # in the ListAssessmentRunAgents action.
      struct AgentFilter
        include JSON::Serializable

        # The detailed health state of the agent. Values can be set to IDLE , RUNNING , SHUTDOWN , UNHEALTHY ,
        # THROTTLED , and UNKNOWN .
        @[JSON::Field(key: "agentHealthCodes")]
        getter agent_health_codes : Array(String)

        # The current health state of the agent. Values can be set to HEALTHY or UNHEALTHY .
        @[JSON::Field(key: "agentHealths")]
        getter agent_healths : Array(String)

        def initialize(
          @agent_health_codes : Array(String),
          @agent_healths : Array(String)
        )
        end
      end

      # Used as a response element in the PreviewAgents action.
      struct AgentPreview
        include JSON::Serializable

        # The ID of the EC2 instance where the agent is installed.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The health status of the Amazon Inspector Agent.
        @[JSON::Field(key: "agentHealth")]
        getter agent_health : String?

        # The version of the Amazon Inspector Agent.
        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String?

        # The Auto Scaling group for the EC2 instance where the agent is installed.
        @[JSON::Field(key: "autoScalingGroup")]
        getter auto_scaling_group : String?

        # The hostname of the EC2 instance on which the Amazon Inspector Agent is installed.
        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # The IP address of the EC2 instance on which the Amazon Inspector Agent is installed.
        @[JSON::Field(key: "ipv4Address")]
        getter ipv4_address : String?

        # The kernel version of the operating system running on the EC2 instance on which the Amazon Inspector
        # Agent is installed.
        @[JSON::Field(key: "kernelVersion")]
        getter kernel_version : String?

        # The operating system running on the EC2 instance on which the Amazon Inspector Agent is installed.
        @[JSON::Field(key: "operatingSystem")]
        getter operating_system : String?

        def initialize(
          @agent_id : String,
          @agent_health : String? = nil,
          @agent_version : String? = nil,
          @auto_scaling_group : String? = nil,
          @hostname : String? = nil,
          @ipv4_address : String? = nil,
          @kernel_version : String? = nil,
          @operating_system : String? = nil
        )
        end
      end

      # You started an assessment run, but one of the instances is already participating in another
      # assessment run.
      struct AgentsAlreadyRunningAssessmentException
        include JSON::Serializable

        @[JSON::Field(key: "agents")]
        getter agents : Array(Types::AgentAlreadyRunningAssessment)

        @[JSON::Field(key: "agentsTruncated")]
        getter agents_truncated : Bool

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @agents : Array(Types::AgentAlreadyRunningAssessment),
          @agents_truncated : Bool,
          @can_retry : Bool,
          @message : String
        )
        end
      end

      # A snapshot of an Amazon Inspector assessment run that contains the findings of the assessment run .
      # Used as the response element in the DescribeAssessmentRuns action.
      struct AssessmentRun
        include JSON::Serializable

        # The ARN of the assessment run.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ARN of the assessment template that is associated with the assessment run.
        @[JSON::Field(key: "assessmentTemplateArn")]
        getter assessment_template_arn : String

        # The time when StartAssessmentRun was called.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # A Boolean value (true or false) that specifies whether the process of collecting data from the
        # agents is completed.
        @[JSON::Field(key: "dataCollected")]
        getter data_collected : Bool

        # The duration of the assessment run.
        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int32

        # Provides a total count of generated findings per severity.
        @[JSON::Field(key: "findingCounts")]
        getter finding_counts : Hash(String, Int32)

        # The auto-generated name for the assessment run.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of notifications for the event subscriptions. A notification about a particular generated
        # finding is added to this list only once.
        @[JSON::Field(key: "notifications")]
        getter notifications : Array(Types::AssessmentRunNotification)

        # The rules packages selected for the assessment run.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)

        # The state of the assessment run.
        @[JSON::Field(key: "state")]
        getter state : String

        # The last time when the assessment run's state changed.
        @[JSON::Field(key: "stateChangedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter state_changed_at : Time

        # A list of the assessment run state changes.
        @[JSON::Field(key: "stateChanges")]
        getter state_changes : Array(Types::AssessmentRunStateChange)

        # The user-defined attributes that are assigned to every generated finding.
        @[JSON::Field(key: "userAttributesForFindings")]
        getter user_attributes_for_findings : Array(Types::Attribute)

        # The assessment run completion time that corresponds to the rules packages evaluation completion time
        # or failure.
        @[JSON::Field(key: "completedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_at : Time?

        # The time when StartAssessmentRun was called.
        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        def initialize(
          @arn : String,
          @assessment_template_arn : String,
          @created_at : Time,
          @data_collected : Bool,
          @duration_in_seconds : Int32,
          @finding_counts : Hash(String, Int32),
          @name : String,
          @notifications : Array(Types::AssessmentRunNotification),
          @rules_package_arns : Array(String),
          @state : String,
          @state_changed_at : Time,
          @state_changes : Array(Types::AssessmentRunStateChange),
          @user_attributes_for_findings : Array(Types::Attribute),
          @completed_at : Time? = nil,
          @started_at : Time? = nil
        )
        end
      end

      # Contains information about an Amazon Inspector agent. This data type is used as a response element
      # in the ListAssessmentRunAgents action.
      struct AssessmentRunAgent
        include JSON::Serializable

        # The current health state of the agent.
        @[JSON::Field(key: "agentHealth")]
        getter agent_health : String

        # The detailed health state of the agent.
        @[JSON::Field(key: "agentHealthCode")]
        getter agent_health_code : String

        # The AWS account of the EC2 instance where the agent is installed.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The ARN of the assessment run that is associated with the agent.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        # The Amazon Inspector application data metrics that are collected by the agent.
        @[JSON::Field(key: "telemetryMetadata")]
        getter telemetry_metadata : Array(Types::TelemetryMetadata)

        # The description for the agent health code.
        @[JSON::Field(key: "agentHealthDetails")]
        getter agent_health_details : String?

        # The Auto Scaling group of the EC2 instance that is specified by the agent ID.
        @[JSON::Field(key: "autoScalingGroup")]
        getter auto_scaling_group : String?

        def initialize(
          @agent_health : String,
          @agent_health_code : String,
          @agent_id : String,
          @assessment_run_arn : String,
          @telemetry_metadata : Array(Types::TelemetryMetadata),
          @agent_health_details : String? = nil,
          @auto_scaling_group : String? = nil
        )
        end
      end

      # Used as the request parameter in the ListAssessmentRuns action.
      struct AssessmentRunFilter
        include JSON::Serializable

        # For a record to match a filter, the value that is specified for this data type property must
        # inclusively match any value between the specified minimum and maximum values of the completedAt
        # property of the AssessmentRun data type.
        @[JSON::Field(key: "completionTimeRange")]
        getter completion_time_range : Types::TimestampRange?

        # For a record to match a filter, the value that is specified for this data type property must
        # inclusively match any value between the specified minimum and maximum values of the
        # durationInSeconds property of the AssessmentRun data type.
        @[JSON::Field(key: "durationRange")]
        getter duration_range : Types::DurationRange?

        # For a record to match a filter, an explicit value or a string containing a wildcard that is
        # specified for this data type property must match the value of the assessmentRunName property of the
        # AssessmentRun data type.
        @[JSON::Field(key: "namePattern")]
        getter name_pattern : String?

        # For a record to match a filter, the value that is specified for this data type property must be
        # contained in the list of values of the rulesPackages property of the AssessmentRun data type.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)?

        # For a record to match a filter, the value that is specified for this data type property must
        # inclusively match any value between the specified minimum and maximum values of the startTime
        # property of the AssessmentRun data type.
        @[JSON::Field(key: "startTimeRange")]
        getter start_time_range : Types::TimestampRange?

        # For a record to match a filter, the value that is specified for this data type property must match
        # the stateChangedAt property of the AssessmentRun data type.
        @[JSON::Field(key: "stateChangeTimeRange")]
        getter state_change_time_range : Types::TimestampRange?

        # For a record to match a filter, one of the values specified for this data type property must be the
        # exact match of the value of the assessmentRunState property of the AssessmentRun data type.
        @[JSON::Field(key: "states")]
        getter states : Array(String)?

        def initialize(
          @completion_time_range : Types::TimestampRange? = nil,
          @duration_range : Types::DurationRange? = nil,
          @name_pattern : String? = nil,
          @rules_package_arns : Array(String)? = nil,
          @start_time_range : Types::TimestampRange? = nil,
          @state_change_time_range : Types::TimestampRange? = nil,
          @states : Array(String)? = nil
        )
        end
      end

      # You cannot perform a specified action if an assessment run is currently in progress.
      struct AssessmentRunInProgressException
        include JSON::Serializable

        # The ARNs of the assessment runs that are currently in progress.
        @[JSON::Field(key: "assessmentRunArns")]
        getter assessment_run_arns : Array(String)

        # Boolean value that indicates whether the ARN list of the assessment runs is truncated.
        @[JSON::Field(key: "assessmentRunArnsTruncated")]
        getter assessment_run_arns_truncated : Bool

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @assessment_run_arns : Array(String),
          @assessment_run_arns_truncated : Bool,
          @can_retry : Bool,
          @message : String
        )
        end
      end

      # Used as one of the elements of the AssessmentRun data type.
      struct AssessmentRunNotification
        include JSON::Serializable

        # The date of the notification.
        @[JSON::Field(key: "date", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date : Time

        # The Boolean value that specifies whether the notification represents an error.
        @[JSON::Field(key: "error")]
        getter error : Bool

        # The event for which a notification is sent.
        @[JSON::Field(key: "event")]
        getter event : String

        # The message included in the notification.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The status code of the SNS notification.
        @[JSON::Field(key: "snsPublishStatusCode")]
        getter sns_publish_status_code : String?

        # The SNS topic to which the SNS notification is sent.
        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String?

        def initialize(
          @date : Time,
          @error : Bool,
          @event : String,
          @message : String? = nil,
          @sns_publish_status_code : String? = nil,
          @sns_topic_arn : String? = nil
        )
        end
      end

      # Used as one of the elements of the AssessmentRun data type.
      struct AssessmentRunStateChange
        include JSON::Serializable

        # The assessment run state.
        @[JSON::Field(key: "state")]
        getter state : String

        # The last time the assessment run state changed.
        @[JSON::Field(key: "stateChangedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter state_changed_at : Time

        def initialize(
          @state : String,
          @state_changed_at : Time
        )
        end
      end

      # Contains information about an Amazon Inspector application. This data type is used as the response
      # element in the DescribeAssessmentTargets action.
      struct AssessmentTarget
        include JSON::Serializable

        # The ARN that specifies the Amazon Inspector assessment target.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the assessment target is created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The name of the Amazon Inspector assessment target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The time at which UpdateAssessmentTarget is called.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The ARN that specifies the resource group that is associated with the assessment target.
        @[JSON::Field(key: "resourceGroupArn")]
        getter resource_group_arn : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @name : String,
          @updated_at : Time,
          @resource_group_arn : String? = nil
        )
        end
      end

      # Used as the request parameter in the ListAssessmentTargets action.
      struct AssessmentTargetFilter
        include JSON::Serializable

        # For a record to match a filter, an explicit value or a string that contains a wildcard that is
        # specified for this data type property must match the value of the assessmentTargetName property of
        # the AssessmentTarget data type.
        @[JSON::Field(key: "assessmentTargetNamePattern")]
        getter assessment_target_name_pattern : String?

        def initialize(
          @assessment_target_name_pattern : String? = nil
        )
        end
      end

      # Contains information about an Amazon Inspector assessment template. This data type is used as the
      # response element in the DescribeAssessmentTemplates action.
      struct AssessmentTemplate
        include JSON::Serializable

        # The ARN of the assessment template.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The number of existing assessment runs associated with this assessment template. This value can be
        # zero or a positive integer.
        @[JSON::Field(key: "assessmentRunCount")]
        getter assessment_run_count : Int32

        # The ARN of the assessment target that corresponds to this assessment template.
        @[JSON::Field(key: "assessmentTargetArn")]
        getter assessment_target_arn : String

        # The time at which the assessment template is created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The duration in seconds specified for this assessment template. The default value is 3600 seconds
        # (one hour). The maximum value is 86400 seconds (one day).
        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int32

        # The name of the assessment template.
        @[JSON::Field(key: "name")]
        getter name : String

        # The rules packages that are specified for this assessment template.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)

        # The user-defined attributes that are assigned to every generated finding from the assessment run
        # that uses this assessment template.
        @[JSON::Field(key: "userAttributesForFindings")]
        getter user_attributes_for_findings : Array(Types::Attribute)

        # The Amazon Resource Name (ARN) of the most recent assessment run associated with this assessment
        # template. This value exists only when the value of assessmentRunCount is greaterpa than zero.
        @[JSON::Field(key: "lastAssessmentRunArn")]
        getter last_assessment_run_arn : String?

        def initialize(
          @arn : String,
          @assessment_run_count : Int32,
          @assessment_target_arn : String,
          @created_at : Time,
          @duration_in_seconds : Int32,
          @name : String,
          @rules_package_arns : Array(String),
          @user_attributes_for_findings : Array(Types::Attribute),
          @last_assessment_run_arn : String? = nil
        )
        end
      end

      # Used as the request parameter in the ListAssessmentTemplates action.
      struct AssessmentTemplateFilter
        include JSON::Serializable

        # For a record to match a filter, the value specified for this data type property must inclusively
        # match any value between the specified minimum and maximum values of the durationInSeconds property
        # of the AssessmentTemplate data type.
        @[JSON::Field(key: "durationRange")]
        getter duration_range : Types::DurationRange?

        # For a record to match a filter, an explicit value or a string that contains a wildcard that is
        # specified for this data type property must match the value of the assessmentTemplateName property of
        # the AssessmentTemplate data type.
        @[JSON::Field(key: "namePattern")]
        getter name_pattern : String?

        # For a record to match a filter, the values that are specified for this data type property must be
        # contained in the list of values of the rulesPackageArns property of the AssessmentTemplate data
        # type.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)?

        def initialize(
          @duration_range : Types::DurationRange? = nil,
          @name_pattern : String? = nil,
          @rules_package_arns : Array(String)? = nil
        )
        end
      end

      # A collection of attributes of the host from which the finding is generated.
      struct AssetAttributes
        include JSON::Serializable

        # The schema version of this data type.
        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : Int32

        # The ID of the agent that is installed on the EC2 instance where the finding is generated.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # The ID of the Amazon Machine Image (AMI) that is installed on the EC2 instance where the finding is
        # generated.
        @[JSON::Field(key: "amiId")]
        getter ami_id : String?

        # The Auto Scaling group of the EC2 instance where the finding is generated.
        @[JSON::Field(key: "autoScalingGroup")]
        getter auto_scaling_group : String?

        # The hostname of the EC2 instance where the finding is generated.
        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # The list of IP v4 addresses of the EC2 instance where the finding is generated.
        @[JSON::Field(key: "ipv4Addresses")]
        getter ipv4_addresses : Array(String)?

        # An array of the network interfaces interacting with the EC2 instance where the finding is generated.
        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # The tags related to the EC2 instance where the finding is generated.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @schema_version : Int32,
          @agent_id : String? = nil,
          @ami_id : String? = nil,
          @auto_scaling_group : String? = nil,
          @hostname : String? = nil,
          @ipv4_addresses : Array(String)? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # This data type is used as a request parameter in the AddAttributesToFindings and
      # CreateAssessmentTemplate actions.
      struct Attribute
        include JSON::Serializable

        # The attribute key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value assigned to the attribute key.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      struct CreateAssessmentTargetRequest
        include JSON::Serializable

        # The user-defined name that identifies the assessment target that you want to create. The name must
        # be unique within the AWS account.
        @[JSON::Field(key: "assessmentTargetName")]
        getter assessment_target_name : String

        # The ARN that specifies the resource group that is used to create the assessment target. If
        # resourceGroupArn is not specified, all EC2 instances in the current AWS account and region are
        # included in the assessment target.
        @[JSON::Field(key: "resourceGroupArn")]
        getter resource_group_arn : String?

        def initialize(
          @assessment_target_name : String,
          @resource_group_arn : String? = nil
        )
        end
      end

      struct CreateAssessmentTargetResponse
        include JSON::Serializable

        # The ARN that specifies the assessment target that is created.
        @[JSON::Field(key: "assessmentTargetArn")]
        getter assessment_target_arn : String

        def initialize(
          @assessment_target_arn : String
        )
        end
      end

      struct CreateAssessmentTemplateRequest
        include JSON::Serializable

        # The ARN that specifies the assessment target for which you want to create the assessment template.
        @[JSON::Field(key: "assessmentTargetArn")]
        getter assessment_target_arn : String

        # The user-defined name that identifies the assessment template that you want to create. You can
        # create several assessment templates for an assessment target. The names of the assessment templates
        # that correspond to a particular assessment target must be unique.
        @[JSON::Field(key: "assessmentTemplateName")]
        getter assessment_template_name : String

        # The duration of the assessment run in seconds.
        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int32

        # The ARNs that specify the rules packages that you want to attach to the assessment template.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)

        # The user-defined attributes that are assigned to every finding that is generated by the assessment
        # run that uses this assessment template. An attribute is a key and value pair (an Attribute object).
        # Within an assessment template, each key must be unique.
        @[JSON::Field(key: "userAttributesForFindings")]
        getter user_attributes_for_findings : Array(Types::Attribute)?

        def initialize(
          @assessment_target_arn : String,
          @assessment_template_name : String,
          @duration_in_seconds : Int32,
          @rules_package_arns : Array(String),
          @user_attributes_for_findings : Array(Types::Attribute)? = nil
        )
        end
      end

      struct CreateAssessmentTemplateResponse
        include JSON::Serializable

        # The ARN that specifies the assessment template that is created.
        @[JSON::Field(key: "assessmentTemplateArn")]
        getter assessment_template_arn : String

        def initialize(
          @assessment_template_arn : String
        )
        end
      end

      struct CreateExclusionsPreviewRequest
        include JSON::Serializable

        # The ARN that specifies the assessment template for which you want to create an exclusions preview.
        @[JSON::Field(key: "assessmentTemplateArn")]
        getter assessment_template_arn : String

        def initialize(
          @assessment_template_arn : String
        )
        end
      end

      struct CreateExclusionsPreviewResponse
        include JSON::Serializable

        # Specifies the unique identifier of the requested exclusions preview. You can use the unique
        # identifier to retrieve the exclusions preview when running the GetExclusionsPreview API.
        @[JSON::Field(key: "previewToken")]
        getter preview_token : String

        def initialize(
          @preview_token : String
        )
        end
      end

      struct CreateResourceGroupRequest
        include JSON::Serializable

        # A collection of keys and an array of possible values,
        # '[{"key":"key1","values":["Value1","Value2"]},{"key":"Key2","values":["Value3"]}]'. For
        # example,'[{"key":"Name","values":["TestEC2Instance"]}]'.
        @[JSON::Field(key: "resourceGroupTags")]
        getter resource_group_tags : Array(Types::ResourceGroupTag)

        def initialize(
          @resource_group_tags : Array(Types::ResourceGroupTag)
        )
        end
      end

      struct CreateResourceGroupResponse
        include JSON::Serializable

        # The ARN that specifies the resource group that is created.
        @[JSON::Field(key: "resourceGroupArn")]
        getter resource_group_arn : String

        def initialize(
          @resource_group_arn : String
        )
        end
      end

      struct DeleteAssessmentRunRequest
        include JSON::Serializable

        # The ARN that specifies the assessment run that you want to delete.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        def initialize(
          @assessment_run_arn : String
        )
        end
      end

      struct DeleteAssessmentTargetRequest
        include JSON::Serializable

        # The ARN that specifies the assessment target that you want to delete.
        @[JSON::Field(key: "assessmentTargetArn")]
        getter assessment_target_arn : String

        def initialize(
          @assessment_target_arn : String
        )
        end
      end

      struct DeleteAssessmentTemplateRequest
        include JSON::Serializable

        # The ARN that specifies the assessment template that you want to delete.
        @[JSON::Field(key: "assessmentTemplateArn")]
        getter assessment_template_arn : String

        def initialize(
          @assessment_template_arn : String
        )
        end
      end

      struct DescribeAssessmentRunsRequest
        include JSON::Serializable

        # The ARN that specifies the assessment run that you want to describe.
        @[JSON::Field(key: "assessmentRunArns")]
        getter assessment_run_arns : Array(String)

        def initialize(
          @assessment_run_arns : Array(String)
        )
        end
      end

      struct DescribeAssessmentRunsResponse
        include JSON::Serializable

        # Information about the assessment run.
        @[JSON::Field(key: "assessmentRuns")]
        getter assessment_runs : Array(Types::AssessmentRun)

        # Assessment run details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        def initialize(
          @assessment_runs : Array(Types::AssessmentRun),
          @failed_items : Hash(String, Types::FailedItemDetails)
        )
        end
      end

      struct DescribeAssessmentTargetsRequest
        include JSON::Serializable

        # The ARNs that specifies the assessment targets that you want to describe.
        @[JSON::Field(key: "assessmentTargetArns")]
        getter assessment_target_arns : Array(String)

        def initialize(
          @assessment_target_arns : Array(String)
        )
        end
      end

      struct DescribeAssessmentTargetsResponse
        include JSON::Serializable

        # Information about the assessment targets.
        @[JSON::Field(key: "assessmentTargets")]
        getter assessment_targets : Array(Types::AssessmentTarget)

        # Assessment target details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        def initialize(
          @assessment_targets : Array(Types::AssessmentTarget),
          @failed_items : Hash(String, Types::FailedItemDetails)
        )
        end
      end

      struct DescribeAssessmentTemplatesRequest
        include JSON::Serializable

        @[JSON::Field(key: "assessmentTemplateArns")]
        getter assessment_template_arns : Array(String)

        def initialize(
          @assessment_template_arns : Array(String)
        )
        end
      end

      struct DescribeAssessmentTemplatesResponse
        include JSON::Serializable

        # Information about the assessment templates.
        @[JSON::Field(key: "assessmentTemplates")]
        getter assessment_templates : Array(Types::AssessmentTemplate)

        # Assessment template details that cannot be described. An error code is provided for each failed
        # item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        def initialize(
          @assessment_templates : Array(Types::AssessmentTemplate),
          @failed_items : Hash(String, Types::FailedItemDetails)
        )
        end
      end

      struct DescribeCrossAccountAccessRoleResponse
        include JSON::Serializable

        # The date when the cross-account access role was registered.
        @[JSON::Field(key: "registeredAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter registered_at : Time

        # The ARN that specifies the IAM role that Amazon Inspector uses to access your AWS account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A Boolean value that specifies whether the IAM role has the necessary policies attached to enable
        # Amazon Inspector to access your AWS account.
        @[JSON::Field(key: "valid")]
        getter valid : Bool

        def initialize(
          @registered_at : Time,
          @role_arn : String,
          @valid : Bool
        )
        end
      end

      struct DescribeExclusionsRequest
        include JSON::Serializable

        # The list of ARNs that specify the exclusions that you want to describe.
        @[JSON::Field(key: "exclusionArns")]
        getter exclusion_arns : Array(String)

        # The locale into which you want to translate the exclusion's title, description, and recommendation.
        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @exclusion_arns : Array(String),
          @locale : String? = nil
        )
        end
      end

      struct DescribeExclusionsResponse
        include JSON::Serializable

        # Information about the exclusions.
        @[JSON::Field(key: "exclusions")]
        getter exclusions : Hash(String, Types::Exclusion)

        # Exclusion details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        def initialize(
          @exclusions : Hash(String, Types::Exclusion),
          @failed_items : Hash(String, Types::FailedItemDetails)
        )
        end
      end

      struct DescribeFindingsRequest
        include JSON::Serializable

        # The ARN that specifies the finding that you want to describe.
        @[JSON::Field(key: "findingArns")]
        getter finding_arns : Array(String)

        # The locale into which you want to translate a finding description, recommendation, and the short
        # description that identifies the finding.
        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @finding_arns : Array(String),
          @locale : String? = nil
        )
        end
      end

      struct DescribeFindingsResponse
        include JSON::Serializable

        # Finding details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        # Information about the finding.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)

        def initialize(
          @failed_items : Hash(String, Types::FailedItemDetails),
          @findings : Array(Types::Finding)
        )
        end
      end

      struct DescribeResourceGroupsRequest
        include JSON::Serializable

        # The ARN that specifies the resource group that you want to describe.
        @[JSON::Field(key: "resourceGroupArns")]
        getter resource_group_arns : Array(String)

        def initialize(
          @resource_group_arns : Array(String)
        )
        end
      end

      struct DescribeResourceGroupsResponse
        include JSON::Serializable

        # Resource group details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        # Information about a resource group.
        @[JSON::Field(key: "resourceGroups")]
        getter resource_groups : Array(Types::ResourceGroup)

        def initialize(
          @failed_items : Hash(String, Types::FailedItemDetails),
          @resource_groups : Array(Types::ResourceGroup)
        )
        end
      end

      struct DescribeRulesPackagesRequest
        include JSON::Serializable

        # The ARN that specifies the rules package that you want to describe.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)

        # The locale that you want to translate a rules package description into.
        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @rules_package_arns : Array(String),
          @locale : String? = nil
        )
        end
      end

      struct DescribeRulesPackagesResponse
        include JSON::Serializable

        # Rules package details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        # Information about the rules package.
        @[JSON::Field(key: "rulesPackages")]
        getter rules_packages : Array(Types::RulesPackage)

        def initialize(
          @failed_items : Hash(String, Types::FailedItemDetails),
          @rules_packages : Array(Types::RulesPackage)
        )
        end
      end

      # This data type is used in the AssessmentTemplateFilter data type.
      struct DurationRange
        include JSON::Serializable

        # The maximum value of the duration range. Must be less than or equal to 604800 seconds (1 week).
        @[JSON::Field(key: "maxSeconds")]
        getter max_seconds : Int32?

        # The minimum value of the duration range. Must be greater than zero.
        @[JSON::Field(key: "minSeconds")]
        getter min_seconds : Int32?

        def initialize(
          @max_seconds : Int32? = nil,
          @min_seconds : Int32? = nil
        )
        end
      end

      # This data type is used in the Subscription data type.
      struct EventSubscription
        include JSON::Serializable

        # The event for which Amazon Simple Notification Service (SNS) notifications are sent.
        @[JSON::Field(key: "event")]
        getter event : String

        # The time at which SubscribeToEvent is called.
        @[JSON::Field(key: "subscribedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter subscribed_at : Time

        def initialize(
          @event : String,
          @subscribed_at : Time
        )
        end
      end

      # Contains information about what was excluded from an assessment run.
      struct Exclusion
        include JSON::Serializable

        # The ARN that specifies the exclusion.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The description of the exclusion.
        @[JSON::Field(key: "description")]
        getter description : String

        # The recommendation for the exclusion.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : String

        # The AWS resources for which the exclusion pertains.
        @[JSON::Field(key: "scopes")]
        getter scopes : Array(Types::Scope)

        # The name of the exclusion.
        @[JSON::Field(key: "title")]
        getter title : String

        # The system-defined attributes for the exclusion.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        def initialize(
          @arn : String,
          @description : String,
          @recommendation : String,
          @scopes : Array(Types::Scope),
          @title : String,
          @attributes : Array(Types::Attribute)? = nil
        )
        end
      end

      # Contains information about what is excluded from an assessment run given the current state of the
      # assessment template.
      struct ExclusionPreview
        include JSON::Serializable

        # The description of the exclusion preview.
        @[JSON::Field(key: "description")]
        getter description : String

        # The recommendation for the exclusion preview.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : String

        # The AWS resources for which the exclusion preview pertains.
        @[JSON::Field(key: "scopes")]
        getter scopes : Array(Types::Scope)

        # The name of the exclusion preview.
        @[JSON::Field(key: "title")]
        getter title : String

        # The system-defined attributes for the exclusion preview.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        def initialize(
          @description : String,
          @recommendation : String,
          @scopes : Array(Types::Scope),
          @title : String,
          @attributes : Array(Types::Attribute)? = nil
        )
        end
      end

      # Includes details about the failed items.
      struct FailedItemDetails
        include JSON::Serializable

        # The status code of a failed item.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : String

        # Indicates whether you can immediately retry a request for this item for a specified resource.
        @[JSON::Field(key: "retryable")]
        getter retryable : Bool

        def initialize(
          @failure_code : String,
          @retryable : Bool
        )
        end
      end

      # Contains information about an Amazon Inspector finding. This data type is used as the response
      # element in the DescribeFindings action.
      struct Finding
        include JSON::Serializable

        # The ARN that specifies the finding.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The system-defined attributes for the finding.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)

        # The time when the finding was generated.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The time when AddAttributesToFindings is called.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The user-defined attributes that are assigned to the finding.
        @[JSON::Field(key: "userAttributes")]
        getter user_attributes : Array(Types::Attribute)

        # A collection of attributes of the host from which the finding is generated.
        @[JSON::Field(key: "assetAttributes")]
        getter asset_attributes : Types::AssetAttributes?

        # The type of the host from which the finding is generated.
        @[JSON::Field(key: "assetType")]
        getter asset_type : String?

        # This data element is currently not used.
        @[JSON::Field(key: "confidence")]
        getter confidence : Int32?

        # The description of the finding.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the finding.
        @[JSON::Field(key: "id")]
        getter id : String?

        # This data element is currently not used.
        @[JSON::Field(key: "indicatorOfCompromise")]
        getter indicator_of_compromise : Bool?

        # The numeric value of the finding severity.
        @[JSON::Field(key: "numericSeverity")]
        getter numeric_severity : Float64?

        # The recommendation for the finding.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : String?

        # The schema version of this data type.
        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : Int32?

        # The data element is set to "Inspector".
        @[JSON::Field(key: "service")]
        getter service : String?

        # This data type is used in the Finding data type.
        @[JSON::Field(key: "serviceAttributes")]
        getter service_attributes : Types::InspectorServiceAttributes?

        # The finding severity. Values can be set to High, Medium, Low, and Informational.
        @[JSON::Field(key: "severity")]
        getter severity : String?

        # The name of the finding.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @arn : String,
          @attributes : Array(Types::Attribute),
          @created_at : Time,
          @updated_at : Time,
          @user_attributes : Array(Types::Attribute),
          @asset_attributes : Types::AssetAttributes? = nil,
          @asset_type : String? = nil,
          @confidence : Int32? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @indicator_of_compromise : Bool? = nil,
          @numeric_severity : Float64? = nil,
          @recommendation : String? = nil,
          @schema_version : Int32? = nil,
          @service : String? = nil,
          @service_attributes : Types::InspectorServiceAttributes? = nil,
          @severity : String? = nil,
          @title : String? = nil
        )
        end
      end

      # This data type is used as a request parameter in the ListFindings action.
      struct FindingFilter
        include JSON::Serializable

        # For a record to match a filter, one of the values that is specified for this data type property must
        # be the exact match of the value of the agentId property of the Finding data type.
        @[JSON::Field(key: "agentIds")]
        getter agent_ids : Array(String)?

        # For a record to match a filter, the list of values that are specified for this data type property
        # must be contained in the list of values of the attributes property of the Finding data type.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        # For a record to match a filter, one of the values that is specified for this data type property must
        # be the exact match of the value of the autoScalingGroup property of the Finding data type.
        @[JSON::Field(key: "autoScalingGroups")]
        getter auto_scaling_groups : Array(String)?

        # The time range during which the finding is generated.
        @[JSON::Field(key: "creationTimeRange")]
        getter creation_time_range : Types::TimestampRange?

        # For a record to match a filter, one of the values that is specified for this data type property must
        # be the exact match of the value of the ruleName property of the Finding data type.
        @[JSON::Field(key: "ruleNames")]
        getter rule_names : Array(String)?

        # For a record to match a filter, one of the values that is specified for this data type property must
        # be the exact match of the value of the rulesPackageArn property of the Finding data type.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)?

        # For a record to match a filter, one of the values that is specified for this data type property must
        # be the exact match of the value of the severity property of the Finding data type.
        @[JSON::Field(key: "severities")]
        getter severities : Array(String)?

        # For a record to match a filter, the value that is specified for this data type property must be
        # contained in the list of values of the userAttributes property of the Finding data type.
        @[JSON::Field(key: "userAttributes")]
        getter user_attributes : Array(Types::Attribute)?

        def initialize(
          @agent_ids : Array(String)? = nil,
          @attributes : Array(Types::Attribute)? = nil,
          @auto_scaling_groups : Array(String)? = nil,
          @creation_time_range : Types::TimestampRange? = nil,
          @rule_names : Array(String)? = nil,
          @rules_package_arns : Array(String)? = nil,
          @severities : Array(String)? = nil,
          @user_attributes : Array(Types::Attribute)? = nil
        )
        end
      end

      struct GetAssessmentReportRequest
        include JSON::Serializable

        # The ARN that specifies the assessment run for which you want to generate a report.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        # Specifies the file format (html or pdf) of the assessment report that you want to generate.
        @[JSON::Field(key: "reportFileFormat")]
        getter report_file_format : String

        # Specifies the type of the assessment report that you want to generate. There are two types of
        # assessment reports: a finding report and a full report. For more information, see Assessment Reports
        # .
        @[JSON::Field(key: "reportType")]
        getter report_type : String

        def initialize(
          @assessment_run_arn : String,
          @report_file_format : String,
          @report_type : String
        )
        end
      end

      struct GetAssessmentReportResponse
        include JSON::Serializable

        # Specifies the status of the request to generate an assessment report.
        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies the URL where you can find the generated assessment report. This parameter is only
        # returned if the report is successfully generated.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @status : String,
          @url : String? = nil
        )
        end
      end

      struct GetExclusionsPreviewRequest
        include JSON::Serializable

        # The ARN that specifies the assessment template for which the exclusions preview was requested.
        @[JSON::Field(key: "assessmentTemplateArn")]
        getter assessment_template_arn : String

        # The unique identifier associated of the exclusions preview.
        @[JSON::Field(key: "previewToken")]
        getter preview_token : String

        # The locale into which you want to translate the exclusion's title, description, and recommendation.
        @[JSON::Field(key: "locale")]
        getter locale : String?

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 100. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the GetExclusionsPreviewRequest action. Subsequent calls to the action fill nextToken
        # in the request with the value of nextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_template_arn : String,
          @preview_token : String,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetExclusionsPreviewResponse
        include JSON::Serializable

        # Specifies the status of the request to generate an exclusions preview.
        @[JSON::Field(key: "previewStatus")]
        getter preview_status : String

        # Information about the exclusions included in the preview.
        @[JSON::Field(key: "exclusionPreviews")]
        getter exclusion_previews : Array(Types::ExclusionPreview)?

        # When a response is generated, if there is more data to be listed, this parameters is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @preview_status : String,
          @exclusion_previews : Array(Types::ExclusionPreview)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetTelemetryMetadataRequest
        include JSON::Serializable

        # The ARN that specifies the assessment run that has the telemetry data that you want to obtain.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        def initialize(
          @assessment_run_arn : String
        )
        end
      end

      struct GetTelemetryMetadataResponse
        include JSON::Serializable

        # Telemetry details.
        @[JSON::Field(key: "telemetryMetadata")]
        getter telemetry_metadata : Array(Types::TelemetryMetadata)

        def initialize(
          @telemetry_metadata : Array(Types::TelemetryMetadata)
        )
        end
      end

      # This data type is used in the Finding data type.
      struct InspectorServiceAttributes
        include JSON::Serializable

        # The schema version of this data type.
        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : Int32

        # The ARN of the assessment run during which the finding is generated.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String?

        # The ARN of the rules package that is used to generate the finding.
        @[JSON::Field(key: "rulesPackageArn")]
        getter rules_package_arn : String?

        def initialize(
          @schema_version : Int32,
          @assessment_run_arn : String? = nil,
          @rules_package_arn : String? = nil
        )
        end
      end

      # Internal server error.
      struct InternalException
        include JSON::Serializable

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @message : String
        )
        end
      end

      # Amazon Inspector cannot assume the cross-account role that it needs to list your EC2 instances
      # during the assessment run.
      struct InvalidCrossAccountRoleException
        include JSON::Serializable

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Code that indicates the type of error that is generated.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @error_code : String,
          @message : String
        )
        end
      end

      # The request was rejected because an invalid or out-of-range value was supplied for an input
      # parameter.
      struct InvalidInputException
        include JSON::Serializable

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Code that indicates the type of error that is generated.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @error_code : String,
          @message : String
        )
        end
      end

      # The request was rejected because it attempted to create resources beyond the current AWS account
      # limits. The error code describes the limit exceeded.
      struct LimitExceededException
        include JSON::Serializable

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Code that indicates the type of error that is generated.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @error_code : String,
          @message : String
        )
        end
      end

      struct ListAssessmentRunAgentsRequest
        include JSON::Serializable

        # The ARN that specifies the assessment run whose agents you want to list.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        # You can use this parameter to specify a subset of data to be included in the action's response. For
        # a record to match a filter, all specified filter attributes must match. When multiple values are
        # specified for a filter attribute, any of the values can match.
        @[JSON::Field(key: "filter")]
        getter filter : Types::AgentFilter?

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListAssessmentRunAgents action. Subsequent calls to the action fill nextToken in
        # the request with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_run_arn : String,
          @filter : Types::AgentFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssessmentRunAgentsResponse
        include JSON::Serializable

        # A list of ARNs that specifies the agents returned by the action.
        @[JSON::Field(key: "assessmentRunAgents")]
        getter assessment_run_agents : Array(Types::AssessmentRunAgent)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_run_agents : Array(Types::AssessmentRunAgent),
          @next_token : String? = nil
        )
        end
      end

      struct ListAssessmentRunsRequest
        include JSON::Serializable

        # The ARNs that specify the assessment templates whose assessment runs you want to list.
        @[JSON::Field(key: "assessmentTemplateArns")]
        getter assessment_template_arns : Array(String)?

        # You can use this parameter to specify a subset of data to be included in the action's response. For
        # a record to match a filter, all specified filter attributes must match. When multiple values are
        # specified for a filter attribute, any of the values can match.
        @[JSON::Field(key: "filter")]
        getter filter : Types::AssessmentRunFilter?

        # You can use this parameter to indicate the maximum number of items that you want in the response.
        # The default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListAssessmentRuns action. Subsequent calls to the action fill nextToken in the
        # request with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_template_arns : Array(String)? = nil,
          @filter : Types::AssessmentRunFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssessmentRunsResponse
        include JSON::Serializable

        # A list of ARNs that specifies the assessment runs that are returned by the action.
        @[JSON::Field(key: "assessmentRunArns")]
        getter assessment_run_arns : Array(String)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_run_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListAssessmentTargetsRequest
        include JSON::Serializable

        # You can use this parameter to specify a subset of data to be included in the action's response. For
        # a record to match a filter, all specified filter attributes must match. When multiple values are
        # specified for a filter attribute, any of the values can match.
        @[JSON::Field(key: "filter")]
        getter filter : Types::AssessmentTargetFilter?

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListAssessmentTargets action. Subsequent calls to the action fill nextToken in the
        # request with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::AssessmentTargetFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssessmentTargetsResponse
        include JSON::Serializable

        # A list of ARNs that specifies the assessment targets that are returned by the action.
        @[JSON::Field(key: "assessmentTargetArns")]
        getter assessment_target_arns : Array(String)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_target_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListAssessmentTemplatesRequest
        include JSON::Serializable

        # A list of ARNs that specifies the assessment targets whose assessment templates you want to list.
        @[JSON::Field(key: "assessmentTargetArns")]
        getter assessment_target_arns : Array(String)?

        # You can use this parameter to specify a subset of data to be included in the action's response. For
        # a record to match a filter, all specified filter attributes must match. When multiple values are
        # specified for a filter attribute, any of the values can match.
        @[JSON::Field(key: "filter")]
        getter filter : Types::AssessmentTemplateFilter?

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListAssessmentTemplates action. Subsequent calls to the action fill nextToken in
        # the request with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_target_arns : Array(String)? = nil,
          @filter : Types::AssessmentTemplateFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssessmentTemplatesResponse
        include JSON::Serializable

        # A list of ARNs that specifies the assessment templates returned by the action.
        @[JSON::Field(key: "assessmentTemplateArns")]
        getter assessment_template_arns : Array(String)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_template_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListEventSubscriptionsRequest
        include JSON::Serializable

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListEventSubscriptions action. Subsequent calls to the action fill nextToken in
        # the request with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of the assessment template for which you want to list the existing event subscriptions.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct ListEventSubscriptionsResponse
        include JSON::Serializable

        # Details of the returned event subscriptions.
        @[JSON::Field(key: "subscriptions")]
        getter subscriptions : Array(Types::Subscription)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @subscriptions : Array(Types::Subscription),
          @next_token : String? = nil
        )
        end
      end

      struct ListExclusionsRequest
        include JSON::Serializable

        # The ARN of the assessment run that generated the exclusions that you want to list.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 100. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListExclusionsRequest action. Subsequent calls to the action fill nextToken in the
        # request with the value of nextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_run_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExclusionsResponse
        include JSON::Serializable

        # A list of exclusions' ARNs returned by the action.
        @[JSON::Field(key: "exclusionArns")]
        getter exclusion_arns : Array(String)

        # When a response is generated, if there is more data to be listed, this parameters is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @exclusion_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListFindingsRequest
        include JSON::Serializable

        # The ARNs of the assessment runs that generate the findings that you want to list.
        @[JSON::Field(key: "assessmentRunArns")]
        getter assessment_run_arns : Array(String)?

        # You can use this parameter to specify a subset of data to be included in the action's response. For
        # a record to match a filter, all specified filter attributes must match. When multiple values are
        # specified for a filter attribute, any of the values can match.
        @[JSON::Field(key: "filter")]
        getter filter : Types::FindingFilter?

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListFindings action. Subsequent calls to the action fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_run_arns : Array(String)? = nil,
          @filter : Types::FindingFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFindingsResponse
        include JSON::Serializable

        # A list of ARNs that specifies the findings returned by the action.
        @[JSON::Field(key: "findingArns")]
        getter finding_arns : Array(String)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @finding_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListRulesPackagesRequest
        include JSON::Serializable

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the ListRulesPackages action. Subsequent calls to the action fill nextToken in the
        # request with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRulesPackagesResponse
        include JSON::Serializable

        # The list of ARNs that specifies the rules packages returned by the action.
        @[JSON::Field(key: "rulesPackageArns")]
        getter rules_package_arns : Array(String)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @rules_package_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN that specifies the assessment template whose tags you want to list.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A collection of key and value pairs.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @tags : Array(Types::Tag)
        )
        end
      end

      # Contains information about the network interfaces interacting with an EC2 instance. This data type
      # is used as one of the elements of the AssetAttributes data type.
      struct NetworkInterface
        include JSON::Serializable

        # The IP addresses associated with the network interface.
        @[JSON::Field(key: "ipv6Addresses")]
        getter ipv6_addresses : Array(String)?

        # The ID of the network interface.
        @[JSON::Field(key: "networkInterfaceId")]
        getter network_interface_id : String?

        # The name of a private DNS associated with the network interface.
        @[JSON::Field(key: "privateDnsName")]
        getter private_dns_name : String?

        # The private IP address associated with the network interface.
        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String?

        # A list of the private IP addresses associated with the network interface. Includes the
        # privateDnsName and privateIpAddress.
        @[JSON::Field(key: "privateIpAddresses")]
        getter private_ip_addresses : Array(Types::PrivateIp)?

        # The name of a public DNS associated with the network interface.
        @[JSON::Field(key: "publicDnsName")]
        getter public_dns_name : String?

        # The public IP address from which the network interface is reachable.
        @[JSON::Field(key: "publicIp")]
        getter public_ip : String?

        # A list of the security groups associated with the network interface. Includes the groupId and
        # groupName.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(Types::SecurityGroup)?

        # The ID of a subnet associated with the network interface.
        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The ID of a VPC associated with the network interface.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @ipv6_addresses : Array(String)? = nil,
          @network_interface_id : String? = nil,
          @private_dns_name : String? = nil,
          @private_ip_address : String? = nil,
          @private_ip_addresses : Array(Types::PrivateIp)? = nil,
          @public_dns_name : String? = nil,
          @public_ip : String? = nil,
          @security_groups : Array(Types::SecurityGroup)? = nil,
          @subnet_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The request was rejected because it referenced an entity that does not exist. The error code
      # describes the entity.
      struct NoSuchEntityException
        include JSON::Serializable

        # You can immediately retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Code that indicates the type of error that is generated.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @error_code : String,
          @message : String
        )
        end
      end

      struct PreviewAgentsRequest
        include JSON::Serializable

        # The ARN of the assessment target whose agents you want to preview.
        @[JSON::Field(key: "previewAgentsArn")]
        getter preview_agents_arn : String

        # You can use this parameter to indicate the maximum number of items you want in the response. The
        # default value is 10. The maximum value is 500.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # You can use this parameter when paginating results. Set the value of this parameter to null on your
        # first call to the PreviewAgents action. Subsequent calls to the action fill nextToken in the request
        # with the value of NextToken from the previous response to continue listing data.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @preview_agents_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct PreviewAgentsResponse
        include JSON::Serializable

        # The resulting list of agents.
        @[JSON::Field(key: "agentPreviews")]
        getter agent_previews : Array(Types::AgentPreview)

        # When a response is generated, if there is more data to be listed, this parameter is present in the
        # response and contains the value to use for the nextToken parameter in a subsequent pagination
        # request. If there is no more data to be listed, this parameter is set to null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_previews : Array(Types::AgentPreview),
          @next_token : String? = nil
        )
        end
      end

      # The request is rejected. The specified assessment template is currently generating an exclusions
      # preview.
      struct PreviewGenerationInProgressException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains information about a private IP address associated with a network interface. This data type
      # is used as a response element in the DescribeFindings action.
      struct PrivateIp
        include JSON::Serializable

        # The DNS name of the private IP address.
        @[JSON::Field(key: "privateDnsName")]
        getter private_dns_name : String?

        # The full IP address of the network inteface.
        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String?

        def initialize(
          @private_dns_name : String? = nil,
          @private_ip_address : String? = nil
        )
        end
      end

      struct RegisterCrossAccountAccessRoleRequest
        include JSON::Serializable

        # The ARN of the IAM role that grants Amazon Inspector access to AWS Services needed to perform
        # security assessments.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end

      struct RemoveAttributesFromFindingsRequest
        include JSON::Serializable

        # The array of attribute keys that you want to remove from specified findings.
        @[JSON::Field(key: "attributeKeys")]
        getter attribute_keys : Array(String)

        # The ARNs that specify the findings that you want to remove attributes from.
        @[JSON::Field(key: "findingArns")]
        getter finding_arns : Array(String)

        def initialize(
          @attribute_keys : Array(String),
          @finding_arns : Array(String)
        )
        end
      end

      struct RemoveAttributesFromFindingsResponse
        include JSON::Serializable

        # Attributes details that cannot be described. An error code is provided for each failed item.
        @[JSON::Field(key: "failedItems")]
        getter failed_items : Hash(String, Types::FailedItemDetails)

        def initialize(
          @failed_items : Hash(String, Types::FailedItemDetails)
        )
        end
      end

      # Contains information about a resource group. The resource group defines a set of tags that, when
      # queried, identify the AWS resources that make up the assessment target. This data type is used as
      # the response element in the DescribeResourceGroups action.
      struct ResourceGroup
        include JSON::Serializable

        # The ARN of the resource group.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which resource group is created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The tags (key and value pairs) of the resource group. This data type property is used in the
        # CreateResourceGroup action.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::ResourceGroupTag)

        def initialize(
          @arn : String,
          @created_at : Time,
          @tags : Array(Types::ResourceGroupTag)
        )
        end
      end

      # This data type is used as one of the elements of the ResourceGroup data type.
      struct ResourceGroupTag
        include JSON::Serializable

        # A tag key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value assigned to a tag key.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # Contains information about an Amazon Inspector rules package. This data type is used as the response
      # element in the DescribeRulesPackages action.
      struct RulesPackage
        include JSON::Serializable

        # The ARN of the rules package.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the rules package.
        @[JSON::Field(key: "name")]
        getter name : String

        # The provider of the rules package.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The version ID of the rules package.
        @[JSON::Field(key: "version")]
        getter version : String

        # The description of the rules package.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @name : String,
          @provider : String,
          @version : String,
          @description : String? = nil
        )
        end
      end

      # This data type contains key-value pairs that identify various Amazon resources.
      struct Scope
        include JSON::Serializable

        # The type of the scope.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The resource identifier for the specified scope type.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains information about a security group associated with a network interface. This data type is
      # used as one of the elements of the NetworkInterface data type.
      struct SecurityGroup
        include JSON::Serializable

        # The ID of the security group.
        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # The name of the security group.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @group_id : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      # The serice is temporary unavailable.
      struct ServiceTemporarilyUnavailableException
        include JSON::Serializable

        # You can wait and then retry your request.
        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        # Details of the exception error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @message : String
        )
        end
      end

      struct SetTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the assessment template that you want to set tags to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A collection of key and value pairs that you want to set to the assessment template.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartAssessmentRunRequest
        include JSON::Serializable

        # The ARN of the assessment template of the assessment run that you want to start.
        @[JSON::Field(key: "assessmentTemplateArn")]
        getter assessment_template_arn : String

        # You can specify the name for the assessment run. The name must be unique for the assessment template
        # whose ARN is used to start the assessment run.
        @[JSON::Field(key: "assessmentRunName")]
        getter assessment_run_name : String?

        def initialize(
          @assessment_template_arn : String,
          @assessment_run_name : String? = nil
        )
        end
      end

      struct StartAssessmentRunResponse
        include JSON::Serializable

        # The ARN of the assessment run that has been started.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        def initialize(
          @assessment_run_arn : String
        )
        end
      end

      struct StopAssessmentRunRequest
        include JSON::Serializable

        # The ARN of the assessment run that you want to stop.
        @[JSON::Field(key: "assessmentRunArn")]
        getter assessment_run_arn : String

        # An input option that can be set to either START_EVALUATION or SKIP_EVALUATION. START_EVALUATION (the
        # default value), stops the AWS agent from collecting data and begins the results evaluation and the
        # findings generation process. SKIP_EVALUATION cancels the assessment run immediately, after which no
        # findings are generated.
        @[JSON::Field(key: "stopAction")]
        getter stop_action : String?

        def initialize(
          @assessment_run_arn : String,
          @stop_action : String? = nil
        )
        end
      end

      struct SubscribeToEventRequest
        include JSON::Serializable

        # The event for which you want to receive SNS notifications.
        @[JSON::Field(key: "event")]
        getter event : String

        # The ARN of the assessment template that is used during the event for which you want to receive SNS
        # notifications.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ARN of the SNS topic to which the SNS notifications are sent.
        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String

        def initialize(
          @event : String,
          @resource_arn : String,
          @topic_arn : String
        )
        end
      end

      # This data type is used as a response element in the ListEventSubscriptions action.
      struct Subscription
        include JSON::Serializable

        # The list of existing event subscriptions.
        @[JSON::Field(key: "eventSubscriptions")]
        getter event_subscriptions : Array(Types::EventSubscription)

        # The ARN of the assessment template that is used during the event for which the SNS notification is
        # sent.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ARN of the Amazon Simple Notification Service (SNS) topic to which the SNS notifications are
        # sent.
        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String

        def initialize(
          @event_subscriptions : Array(Types::EventSubscription),
          @resource_arn : String,
          @topic_arn : String
        )
        end
      end

      # A key and value pair. This data type is used as a request parameter in the SetTagsForResource action
      # and a response element in the ListTagsForResource action.
      struct Tag
        include JSON::Serializable

        # A tag key.
        @[JSON::Field(key: "key")]
        getter key : String

        # A value assigned to a tag key.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # The metadata about the Amazon Inspector application data metrics collected by the agent. This data
      # type is used as the response element in the GetTelemetryMetadata action.
      struct TelemetryMetadata
        include JSON::Serializable

        # The count of messages that the agent sends to the Amazon Inspector service.
        @[JSON::Field(key: "count")]
        getter count : Int64

        # A specific type of behavioral data that is collected by the agent.
        @[JSON::Field(key: "messageType")]
        getter message_type : String

        # The data size of messages that the agent sends to the Amazon Inspector service.
        @[JSON::Field(key: "dataSize")]
        getter data_size : Int64?

        def initialize(
          @count : Int64,
          @message_type : String,
          @data_size : Int64? = nil
        )
        end
      end

      # This data type is used in the AssessmentRunFilter data type.
      struct TimestampRange
        include JSON::Serializable

        # The minimum value of the timestamp range.
        @[JSON::Field(key: "beginDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter begin_date : Time?

        # The maximum value of the timestamp range.
        @[JSON::Field(key: "endDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date : Time?

        def initialize(
          @begin_date : Time? = nil,
          @end_date : Time? = nil
        )
        end
      end

      struct UnsubscribeFromEventRequest
        include JSON::Serializable

        # The event for which you want to stop receiving SNS notifications.
        @[JSON::Field(key: "event")]
        getter event : String

        # The ARN of the assessment template that is used during the event for which you want to stop
        # receiving SNS notifications.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The ARN of the SNS topic to which SNS notifications are sent.
        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String

        def initialize(
          @event : String,
          @resource_arn : String,
          @topic_arn : String
        )
        end
      end

      # Used by the GetAssessmentReport API. The request was rejected because you tried to generate a report
      # for an assessment run that existed before reporting was supported in Amazon Inspector. You can only
      # generate reports for assessment runs that took place or will take place after generating reports in
      # Amazon Inspector became available.
      struct UnsupportedFeatureException
        include JSON::Serializable

        @[JSON::Field(key: "canRetry")]
        getter can_retry : Bool

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @can_retry : Bool,
          @message : String
        )
        end
      end

      struct UpdateAssessmentTargetRequest
        include JSON::Serializable

        # The ARN of the assessment target that you want to update.
        @[JSON::Field(key: "assessmentTargetArn")]
        getter assessment_target_arn : String

        # The name of the assessment target that you want to update.
        @[JSON::Field(key: "assessmentTargetName")]
        getter assessment_target_name : String

        # The ARN of the resource group that is used to specify the new resource group to associate with the
        # assessment target.
        @[JSON::Field(key: "resourceGroupArn")]
        getter resource_group_arn : String?

        def initialize(
          @assessment_target_arn : String,
          @assessment_target_name : String,
          @resource_group_arn : String? = nil
        )
        end
      end
    end
  end
end
