require "json"
require "time"

module AwsSdk
  module SSMIncidents
    module Types

      # You don't have sufficient access to perform this operation.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The action that starts at the beginning of an incident. The response plan defines the action.
      struct Action
        include JSON::Serializable

        # The Systems Manager automation document to start as the runbook at the beginning of the incident.
        @[JSON::Field(key: "ssmAutomation")]
        getter ssm_automation : Types::SsmAutomation?

        def initialize(
          @ssm_automation : Types::SsmAutomation? = nil
        )
        end
      end

      # Defines the Amazon Web Services Region and KMS key to add to the replication set.
      struct AddRegionAction
        include JSON::Serializable

        # The Amazon Web Services Region name to add to the replication set.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The KMS key ID to use to encrypt your replication set.
        @[JSON::Field(key: "sseKmsKeyId")]
        getter sse_kms_key_id : String?

        def initialize(
          @region_name : String,
          @sse_kms_key_id : String? = nil
        )
        end
      end

      # Use the AttributeValueList to filter by string or integer values.
      struct AttributeValueList
        include JSON::Serializable

        # The list of integer values that the filter matches.
        @[JSON::Field(key: "integerValues")]
        getter integer_values : Array(Int32)?

        # The list of string values that the filter matches.
        @[JSON::Field(key: "stringValues")]
        getter string_values : Array(String)?

        def initialize(
          @integer_values : Array(Int32)? = nil,
          @string_values : Array(String)? = nil
        )
        end
      end

      # The Systems Manager automation document process to start as the runbook at the beginning of the
      # incident.
      struct AutomationExecution
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the automation process.
        @[JSON::Field(key: "ssmExecutionArn")]
        getter ssm_execution_arn : String?

        def initialize(
          @ssm_execution_arn : String? = nil
        )
        end
      end

      # Details about an error returned for a BatchGetIncidentFindings operation.
      struct BatchGetIncidentFindingsError
        include JSON::Serializable

        # The code associated with an error that was returned for a BatchGetIncidentFindings operation.
        @[JSON::Field(key: "code")]
        getter code : String

        # The ID of a specified finding for which an error was returned for a BatchGetIncidentFindings
        # operation.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        # The description for an error that was returned for a BatchGetIncidentFindings operation.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @finding_id : String,
          @message : String
        )
        end
      end

      struct BatchGetIncidentFindingsInput
        include JSON::Serializable

        # A list of IDs of findings for which you want to view details.
        @[JSON::Field(key: "findingIds")]
        getter finding_ids : Array(String)

        # The Amazon Resource Name (ARN) of the incident for which you want to view finding details.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        def initialize(
          @finding_ids : Array(String),
          @incident_record_arn : String
        )
        end
      end

      struct BatchGetIncidentFindingsOutput
        include JSON::Serializable

        # A list of errors encountered during the operation.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetIncidentFindingsError)

        # Information about the requested findings.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)

        def initialize(
          @errors : Array(Types::BatchGetIncidentFindingsError),
          @findings : Array(Types::Finding)
        )
        end
      end

      # The Chatbot chat channel used for collaboration during an incident.
      struct ChatChannel
        include JSON::Serializable

        # The Amazon SNS targets that Chatbot uses to notify the chat channel of updates to an incident. You
        # can also make updates to the incident through the chat channel by using the Amazon SNS topics.
        @[JSON::Field(key: "chatbotSns")]
        getter chatbot_sns : Array(String)?

        # Used to remove the chat channel from an incident record or response plan.
        @[JSON::Field(key: "empty")]
        getter empty : Types::EmptyChatChannel?

        def initialize(
          @chatbot_sns : Array(String)? = nil,
          @empty : Types::EmptyChatChannel? = nil
        )
        end
      end

      # Information about an CloudFormation stack creation or update that occurred around the time of an
      # incident and could be a potential cause of the incident.
      struct CloudFormationStackUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudFormation stack involved in the update.
        @[JSON::Field(key: "stackArn")]
        getter stack_arn : String

        # The timestamp for when the CloudFormation stack creation or update began.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The timestamp for when the CloudFormation stack creation or update ended. Not reported for
        # deployments that are still in progress.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        def initialize(
          @stack_arn : String,
          @start_time : Time,
          @end_time : Time? = nil
        )
        end
      end

      # Information about a CodeDeploy deployment that occurred around the time of an incident and could be
      # a possible cause of the incident.
      struct CodeDeployDeployment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeDeploy deployment group associated with the deployment.
        @[JSON::Field(key: "deploymentGroupArn")]
        getter deployment_group_arn : String

        # The ID of the CodeDeploy deployment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The timestamp for when the CodeDeploy deployment began.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The timestamp for when the CodeDeploy deployment ended. Not reported for deployments that are still
        # in progress.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        def initialize(
          @deployment_group_arn : String,
          @deployment_id : String,
          @start_time : Time,
          @end_time : Time? = nil
        )
        end
      end

      # A conditional statement with which to compare a value, after a timestamp, before a timestamp, or
      # equal to a string or integer. If multiple conditions are specified, the conditionals become an AND
      # ed statement. If multiple values are specified for a conditional, the values are OR d.
      struct Condition
        include JSON::Serializable

        # After the specified timestamp.
        @[JSON::Field(key: "after")]
        getter after : Time?

        # Before the specified timestamp
        @[JSON::Field(key: "before")]
        getter before : Time?

        # The value is equal to the provided string or integer.
        @[JSON::Field(key: "equals")]
        getter equals : Types::AttributeValueList?

        def initialize(
          @after : Time? = nil,
          @before : Time? = nil,
          @equals : Types::AttributeValueList? = nil
        )
        end
      end

      # Updating or deleting a resource causes an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the requested resource
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String?

        # The resource type
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # If present in the output, the operation can be retried after this time
        @[JSON::Field(key: "retryAfter")]
        getter retry_after : Time?

        def initialize(
          @message : String,
          @resource_identifier : String? = nil,
          @resource_type : String? = nil,
          @retry_after : Time? = nil
        )
        end
      end

      struct CreateReplicationSetInput
        include JSON::Serializable

        # The Regions that Incident Manager replicates your data to. You can have up to three Regions in your
        # replication set.
        @[JSON::Field(key: "regions")]
        getter regions : Hash(String, Types::RegionMapInputValue)

        # A token that ensures that the operation is called only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of tags to add to the replication set.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @regions : Hash(String, Types::RegionMapInputValue),
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateReplicationSetOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication set.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct CreateResponsePlanInput
        include JSON::Serializable

        # Details used to create an incident when using this response plan.
        @[JSON::Field(key: "incidentTemplate")]
        getter incident_template : Types::IncidentTemplate

        # The short format name of the response plan. Can't include spaces.
        @[JSON::Field(key: "name")]
        getter name : String

        # The actions that the response plan starts at the beginning of an incident.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)?

        # The Chatbot chat channel used for collaboration during an incident.
        @[JSON::Field(key: "chatChannel")]
        getter chat_channel : Types::ChatChannel?

        # A token ensuring that the operation is called only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The long format of the response plan name. This field can contain spaces.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) for the contacts and escalation plans that the response plan engages
        # during an incident.
        @[JSON::Field(key: "engagements")]
        getter engagements : Array(String)?

        # Information about third-party services integrated into the response plan.
        @[JSON::Field(key: "integrations")]
        getter integrations : Array(Types::Integration)?

        # A list of tags that you are adding to the response plan.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @incident_template : Types::IncidentTemplate,
          @name : String,
          @actions : Array(Types::Action)? = nil,
          @chat_channel : Types::ChatChannel? = nil,
          @client_token : String? = nil,
          @display_name : String? = nil,
          @engagements : Array(String)? = nil,
          @integrations : Array(Types::Integration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateResponsePlanOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct CreateTimelineEventInput
        include JSON::Serializable

        # A short description of the event.
        @[JSON::Field(key: "eventData")]
        getter event_data : String

        # The timestamp for when the event occurred.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time

        # The type of event. You can create timeline events of type Custom Event and Note . To make a
        # Note-type event appear on the Incident notes panel in the console, specify eventType as Note and
        # enter the Amazon Resource Name (ARN) of the incident as the value for eventReference .
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The Amazon Resource Name (ARN) of the incident record that the action adds the incident to.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # A token that ensures that a client calls the action only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Adds one or more references to the TimelineEvent . A reference is an Amazon Web Services resource
        # involved or associated with the incident. To specify a reference, enter its Amazon Resource Name
        # (ARN). You can also specify a related item associated with a resource. For example, to specify an
        # Amazon DynamoDB (DynamoDB) table as a resource, use the table's ARN. You can also specify an Amazon
        # CloudWatch metric associated with the DynamoDB table as a related item.
        @[JSON::Field(key: "eventReferences")]
        getter event_references : Array(Types::EventReference)?

        def initialize(
          @event_data : String,
          @event_time : Time,
          @event_type : String,
          @incident_record_arn : String,
          @client_token : String? = nil,
          @event_references : Array(Types::EventReference)? = nil
        )
        end
      end

      struct CreateTimelineEventOutput
        include JSON::Serializable

        # The ID of the event for easy reference later.
        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The ARN of the incident record that you added the event to.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        def initialize(
          @event_id : String,
          @incident_record_arn : String
        )
        end
      end

      struct DeleteIncidentRecordInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident record you are deleting.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteIncidentRecordOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Defines the information about the Amazon Web Services Region you're deleting from your replication
      # set.
      struct DeleteRegionAction
        include JSON::Serializable

        # The name of the Amazon Web Services Region you're deleting from the replication set.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        def initialize(
          @region_name : String
        )
        end
      end

      struct DeleteReplicationSetInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication set you're deleting.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteReplicationSetOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResourcePolicyInput
        include JSON::Serializable

        # The ID of the resource policy you're deleting.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The Amazon Resource Name (ARN) of the resource you're deleting the policy from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy_id : String,
          @resource_arn : String
        )
        end
      end

      struct DeleteResourcePolicyOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResponsePlanInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteResponsePlanOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTimelineEventInput
        include JSON::Serializable

        # The ID of the event to update. You can use ListTimelineEvents to find an event's ID.
        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The Amazon Resource Name (ARN) of the incident that includes the timeline event.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        def initialize(
          @event_id : String,
          @incident_record_arn : String
        )
        end
      end

      struct DeleteTimelineEventOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The dynamic SSM parameter value.
      struct DynamicSsmParameterValue
        include JSON::Serializable

        # Variable dynamic parameters. A parameter value is determined when an incident is created.
        @[JSON::Field(key: "variable")]
        getter variable : String?

        def initialize(
          @variable : String? = nil
        )
        end
      end

      # Used to remove the chat channel from an incident record or response plan.
      struct EmptyChatChannel
        include JSON::Serializable

        def initialize
        end
      end

      # An item referenced in a TimelineEvent that is involved in or somehow associated with an incident.
      # You can specify an Amazon Resource Name (ARN) for an Amazon Web Services resource or a RelatedItem
      # ID.
      struct EventReference
        include JSON::Serializable

        # The ID of a RelatedItem referenced in a TimelineEvent .
        @[JSON::Field(key: "relatedItemId")]
        getter related_item_id : String?

        # The Amazon Resource Name (ARN) of an Amazon Web Services resource referenced in a TimelineEvent .
        @[JSON::Field(key: "resource")]
        getter resource : String?

        def initialize(
          @related_item_id : String? = nil,
          @resource : String? = nil
        )
        end
      end

      # Details about a timeline event during an incident.
      struct EventSummary
        include JSON::Serializable

        # The timeline event ID.
        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The timestamp for when the event occurred.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time

        # The type of event. The timeline event must be Custom Event or Note .
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The timestamp for when the timeline event was last updated.
        @[JSON::Field(key: "eventUpdatedTime")]
        getter event_updated_time : Time

        # The Amazon Resource Name (ARN) of the incident that the event happened during.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # A list of references in a TimelineEvent .
        @[JSON::Field(key: "eventReferences")]
        getter event_references : Array(Types::EventReference)?

        def initialize(
          @event_id : String,
          @event_time : Time,
          @event_type : String,
          @event_updated_time : Time,
          @incident_record_arn : String,
          @event_references : Array(Types::EventReference)? = nil
        )
        end
      end

      # Filter the selection by using a condition.
      struct Filter
        include JSON::Serializable

        # The condition accepts before or after a specified time, equal to a string, or equal to an integer.
        @[JSON::Field(key: "condition")]
        getter condition : Types::Condition

        # The key that you're filtering on.
        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @condition : Types::Condition,
          @key : String
        )
        end
      end

      # Information about a specific CodeDeploy deployment or CloudFormation stack creation or update that
      # occurred around the time of a reported incident. These activities can be investigated as a potential
      # cause of the incident.
      struct Finding
        include JSON::Serializable

        # The timestamp for when a finding was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ID assigned to the finding.
        @[JSON::Field(key: "id")]
        getter id : String

        # The timestamp for when the finding was most recently updated with additional information.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # Details about the finding.
        @[JSON::Field(key: "details")]
        getter details : Types::FindingDetails?

        def initialize(
          @creation_time : Time,
          @id : String,
          @last_modified_time : Time,
          @details : Types::FindingDetails? = nil
        )
        end
      end

      # Extended textual information about the finding.
      struct FindingDetails
        include JSON::Serializable

        # Information about the CloudFormation stack creation or update associated with the finding.
        @[JSON::Field(key: "cloudFormationStackUpdate")]
        getter cloud_formation_stack_update : Types::CloudFormationStackUpdate?

        # Information about the CodeDeploy deployment associated with the finding.
        @[JSON::Field(key: "codeDeployDeployment")]
        getter code_deploy_deployment : Types::CodeDeployDeployment?

        def initialize(
          @cloud_formation_stack_update : Types::CloudFormationStackUpdate? = nil,
          @code_deploy_deployment : Types::CodeDeployDeployment? = nil
        )
        end
      end

      # Identifying information about the finding.
      struct FindingSummary
        include JSON::Serializable

        # The ID of the finding.
        @[JSON::Field(key: "id")]
        getter id : String

        # The timestamp for when the finding was last updated.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        def initialize(
          @id : String,
          @last_modified_time : Time
        )
        end
      end

      struct GetIncidentRecordInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident record.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetIncidentRecordOutput
        include JSON::Serializable

        # Details the structure of the incident record.
        @[JSON::Field(key: "incidentRecord")]
        getter incident_record : Types::IncidentRecord

        def initialize(
          @incident_record : Types::IncidentRecord
        )
        end
      end

      struct GetReplicationSetInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication set you want to retrieve.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetReplicationSetOutput
        include JSON::Serializable

        # Details of the replication set.
        @[JSON::Field(key: "replicationSet")]
        getter replication_set : Types::ReplicationSet

        def initialize(
          @replication_set : Types::ReplicationSet
        )
        end
      end

      struct GetResourcePoliciesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan with the attached resource policy.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of resource policies to display for each page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetResourcePoliciesOutput
        include JSON::Serializable

        # Details about the resource policy attached to the response plan.
        @[JSON::Field(key: "resourcePolicies")]
        getter resource_policies : Array(Types::ResourcePolicy)

        # The pagination token to use when requesting the next set of items. If there are no additional items
        # to return, the string is null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_policies : Array(Types::ResourcePolicy),
          @next_token : String? = nil
        )
        end
      end

      struct GetResponsePlanInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetResponsePlanOutput
        include JSON::Serializable

        # The ARN of the response plan.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Details used to create the incident when using this response plan.
        @[JSON::Field(key: "incidentTemplate")]
        getter incident_template : Types::IncidentTemplate

        # The short format name of the response plan. The name can't contain spaces.
        @[JSON::Field(key: "name")]
        getter name : String

        # The actions that this response plan takes at the beginning of the incident.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)?

        # The Chatbot chat channel used for collaboration during an incident.
        @[JSON::Field(key: "chatChannel")]
        getter chat_channel : Types::ChatChannel?

        # The long format name of the response plan. Can contain spaces.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) for the contacts and escalation plans that the response plan engages
        # during an incident.
        @[JSON::Field(key: "engagements")]
        getter engagements : Array(String)?

        # Information about third-party services integrated into the Incident Manager response plan.
        @[JSON::Field(key: "integrations")]
        getter integrations : Array(Types::Integration)?

        def initialize(
          @arn : String,
          @incident_template : Types::IncidentTemplate,
          @name : String,
          @actions : Array(Types::Action)? = nil,
          @chat_channel : Types::ChatChannel? = nil,
          @display_name : String? = nil,
          @engagements : Array(String)? = nil,
          @integrations : Array(Types::Integration)? = nil
        )
        end
      end

      struct GetTimelineEventInput
        include JSON::Serializable

        # The ID of the event. You can get an event's ID when you create it, or by using ListTimelineEvents .
        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The Amazon Resource Name (ARN) of the incident that includes the timeline event.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        def initialize(
          @event_id : String,
          @incident_record_arn : String
        )
        end
      end

      struct GetTimelineEventOutput
        include JSON::Serializable

        # Details about the timeline event.
        @[JSON::Field(key: "event")]
        getter event : Types::TimelineEvent

        def initialize(
          @event : Types::TimelineEvent
        )
        end
      end

      # The record of the incident that's created when an incident occurs.
      struct IncidentRecord
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident record.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp for when Incident Manager created the incident record.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The string Incident Manager uses to prevent duplicate incidents from being created by the same
        # incident in the same account.
        @[JSON::Field(key: "dedupeString")]
        getter dedupe_string : String

        # The impact of the incident on customers and applications. Supported impact codes 1 - Critical 2 -
        # High 3 - Medium 4 - Low 5 - No Impact
        @[JSON::Field(key: "impact")]
        getter impact : Int32

        # Details about the action that started the incident.
        @[JSON::Field(key: "incidentRecordSource")]
        getter incident_record_source : Types::IncidentRecordSource

        # Who modified the incident most recently.
        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String

        # The timestamp for when the incident was most recently modified.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The current status of the incident.
        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the incident.
        @[JSON::Field(key: "title")]
        getter title : String

        # The runbook, or automation document, that's run at the beginning of the incident.
        @[JSON::Field(key: "automationExecutions")]
        getter automation_executions : Array(Types::AutomationExecution)?

        # The chat channel used for collaboration during an incident.
        @[JSON::Field(key: "chatChannel")]
        getter chat_channel : Types::ChatChannel?

        # The Amazon SNS targets that are notified when updates are made to an incident.
        @[JSON::Field(key: "notificationTargets")]
        getter notification_targets : Array(Types::NotificationTargetItem)?

        # The timestamp for when the incident was resolved. This appears as a timeline event.
        @[JSON::Field(key: "resolvedTime")]
        getter resolved_time : Time?

        # The summary of the incident. The summary is a brief synopsis of what occurred, what's currently
        # happening, and context of the incident.
        @[JSON::Field(key: "summary")]
        getter summary : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @dedupe_string : String,
          @impact : Int32,
          @incident_record_source : Types::IncidentRecordSource,
          @last_modified_by : String,
          @last_modified_time : Time,
          @status : String,
          @title : String,
          @automation_executions : Array(Types::AutomationExecution)? = nil,
          @chat_channel : Types::ChatChannel? = nil,
          @notification_targets : Array(Types::NotificationTargetItem)? = nil,
          @resolved_time : Time? = nil,
          @summary : String? = nil
        )
        end
      end

      # Details about what created the incident record and when it was created.
      struct IncidentRecordSource
        include JSON::Serializable

        # The principal that started the incident.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The service that started the incident. This can be manually created from Incident Manager,
        # automatically created using an Amazon CloudWatch alarm, or Amazon EventBridge event.
        @[JSON::Field(key: "source")]
        getter source : String

        # The service principal that assumed the role specified in createdBy . If no service principal assumed
        # the role this will be left blank.
        @[JSON::Field(key: "invokedBy")]
        getter invoked_by : String?

        # The resource that caused the incident to be created.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @created_by : String,
          @source : String,
          @invoked_by : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Details describing an incident record.
      struct IncidentRecordSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp for when the incident was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Defines the impact to customers and applications.
        @[JSON::Field(key: "impact")]
        getter impact : Int32

        # What caused Incident Manager to create the incident.
        @[JSON::Field(key: "incidentRecordSource")]
        getter incident_record_source : Types::IncidentRecordSource

        # The current status of the incident.
        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the incident. This value is either provided by the response plan or overwritten on
        # creation.
        @[JSON::Field(key: "title")]
        getter title : String

        # The timestamp for when the incident was resolved.
        @[JSON::Field(key: "resolvedTime")]
        getter resolved_time : Time?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @impact : Int32,
          @incident_record_source : Types::IncidentRecordSource,
          @status : String,
          @title : String,
          @resolved_time : Time? = nil
        )
        end
      end

      # Basic details used in creating a response plan. The response plan is then used to create an incident
      # record.
      struct IncidentTemplate
        include JSON::Serializable

        # The impact of the incident on your customers and applications. Supported impact codes 1 - Critical 2
        # - High 3 - Medium 4 - Low 5 - No Impact
        @[JSON::Field(key: "impact")]
        getter impact : Int32

        # The title of the incident.
        @[JSON::Field(key: "title")]
        getter title : String

        # The string Incident Manager uses to prevent the same root cause from creating multiple incidents in
        # the same account. A deduplication string is a term or phrase the system uses to check for duplicate
        # incidents. If you specify a deduplication string, Incident Manager searches for open incidents that
        # contain the same string in the dedupeString field when it creates the incident. If a duplicate is
        # detected, Incident Manager deduplicates the newer incident into the existing incident. By default,
        # Incident Manager automatically deduplicates multiple incidents created by the same Amazon CloudWatch
        # alarm or Amazon EventBridge event. You don't have to enter your own deduplication string to prevent
        # duplication for these resource types.
        @[JSON::Field(key: "dedupeString")]
        getter dedupe_string : String?

        # Tags to assign to the template. When the StartIncident API action is called, Incident Manager
        # assigns the tags specified in the template to the incident.
        @[JSON::Field(key: "incidentTags")]
        getter incident_tags : Hash(String, String)?

        # The Amazon SNS targets that are notified when updates are made to an incident.
        @[JSON::Field(key: "notificationTargets")]
        getter notification_targets : Array(Types::NotificationTargetItem)?

        # The summary of the incident. The summary is a brief synopsis of what occurred, what's currently
        # happening, and context.
        @[JSON::Field(key: "summary")]
        getter summary : String?

        def initialize(
          @impact : Int32,
          @title : String,
          @dedupe_string : String? = nil,
          @incident_tags : Hash(String, String)? = nil,
          @notification_targets : Array(Types::NotificationTargetItem)? = nil,
          @summary : String? = nil
        )
        end
      end

      # Information about third-party services integrated into a response plan.
      struct Integration
        include JSON::Serializable

        # Information about the PagerDuty service where the response plan creates an incident.
        @[JSON::Field(key: "pagerDutyConfiguration")]
        getter pager_duty_configuration : Types::PagerDutyConfiguration?

        def initialize(
          @pager_duty_configuration : Types::PagerDutyConfiguration? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Details and type of a related item.
      struct ItemIdentifier
        include JSON::Serializable

        # The type of related item.
        @[JSON::Field(key: "type")]
        getter type : String

        # Details about the related item.
        @[JSON::Field(key: "value")]
        getter value : Types::ItemValue

        def initialize(
          @type : String,
          @value : Types::ItemValue
        )
        end
      end

      # Describes a related item.
      struct ItemValue
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the related item, if the related item is an Amazon resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The metric definition, if the related item is a metric in Amazon CloudWatch.
        @[JSON::Field(key: "metricDefinition")]
        getter metric_definition : String?

        # Details about an incident that is associated with a PagerDuty incident.
        @[JSON::Field(key: "pagerDutyIncidentDetail")]
        getter pager_duty_incident_detail : Types::PagerDutyIncidentDetail?

        # The URL, if the related item is a non-Amazon Web Services resource.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @arn : String? = nil,
          @metric_definition : String? = nil,
          @pager_duty_incident_detail : Types::PagerDutyIncidentDetail? = nil,
          @url : String? = nil
        )
        end
      end

      struct ListIncidentFindingsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident for which you want to view associated findings.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # The maximum number of findings to retrieve per call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @incident_record_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIncidentFindingsOutput
        include JSON::Serializable

        # A list of findings that represent deployments that might be the potential cause of the incident.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::FindingSummary)

        # The pagination token to use when requesting the next set of items. If there are no additional items
        # to return, the string is null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @findings : Array(Types::FindingSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListIncidentRecordsInput
        include JSON::Serializable

        # Filters the list of incident records you want to search through. You can filter on the following
        # keys: creationTime impact status createdBy Note the following when when you use Filters: If you
        # don't specify a Filter, the response includes all incident records. If you specify more than one
        # filter in a single request, the response returns incident records that match all filters. If you
        # specify a filter with more than one value, the response returns incident records that match any of
        # the values provided.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIncidentRecordsOutput
        include JSON::Serializable

        # The details of each listed incident record.
        @[JSON::Field(key: "incidentRecordSummaries")]
        getter incident_record_summaries : Array(Types::IncidentRecordSummary)

        # The pagination token to use when requesting the next set of items. If there are no additional items
        # to return, the string is null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @incident_record_summaries : Array(Types::IncidentRecordSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListRelatedItemsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident record containing the listed related items.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # The maximum number of related items per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @incident_record_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRelatedItemsOutput
        include JSON::Serializable

        # Details about each related item.
        @[JSON::Field(key: "relatedItems")]
        getter related_items : Array(Types::RelatedItem)

        # The pagination token to use when requesting the next set of items. If there are no additional items
        # to return, the string is null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @related_items : Array(Types::RelatedItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListReplicationSetsInput
        include JSON::Serializable

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReplicationSetsOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the list replication set.
        @[JSON::Field(key: "replicationSetArns")]
        getter replication_set_arns : Array(String)

        # The pagination token to use when requesting the next set of items. If there are no additional items
        # to return, the string is null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @replication_set_arns : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListResponsePlansInput
        include JSON::Serializable

        # The maximum number of response plans per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResponsePlansOutput
        include JSON::Serializable

        # Details of each response plan.
        @[JSON::Field(key: "responsePlanSummaries")]
        getter response_plan_summaries : Array(Types::ResponsePlanSummary)

        # The pagination token to use when requesting the next set of items. If there are no additional items
        # to return, the string is null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @response_plan_summaries : Array(Types::ResponsePlanSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan or incident.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags for the response plan or incident.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      struct ListTimelineEventsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident that includes the timeline event.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # Filters the timeline events based on the provided conditional values. You can filter timeline events
        # with the following keys: eventReference eventTime eventType Note the following when deciding how to
        # use Filters: If you don't specify a Filter, the response includes all timeline events. If you
        # specify more than one filter in a single request, the response returns timeline events that match
        # all filters. If you specify a filter with more than one value, the response returns timeline events
        # that match any of the values provided.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of results per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token for the next set of items to return. (You received this token from a previous
        # call.)
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Sort timeline events by the specified key value pair.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Sorts the order of timeline events by the value specified in the sortBy field.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @incident_record_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListTimelineEventsOutput
        include JSON::Serializable

        # Details about each event that occurred during the incident.
        @[JSON::Field(key: "eventSummaries")]
        getter event_summaries : Array(Types::EventSummary)

        # The pagination token to use when requesting the next set of items. If there are no additional items
        # to return, the string is null.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_summaries : Array(Types::EventSummary),
          @next_token : String? = nil
        )
        end
      end

      # The SNS targets that are notified when updates are made to an incident.
      struct NotificationTargetItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SNS topic.
        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String?

        def initialize(
          @sns_topic_arn : String? = nil
        )
        end
      end

      # Details about the PagerDuty configuration for a response plan.
      struct PagerDutyConfiguration
        include JSON::Serializable

        # The name of the PagerDuty configuration.
        @[JSON::Field(key: "name")]
        getter name : String

        # Details about the PagerDuty service associated with the configuration.
        @[JSON::Field(key: "pagerDutyIncidentConfiguration")]
        getter pager_duty_incident_configuration : Types::PagerDutyIncidentConfiguration

        # The ID of the Amazon Web Services Secrets Manager secret that stores your PagerDuty key, either a
        # General Access REST API Key or User Token REST API Key, and other user credentials.
        @[JSON::Field(key: "secretId")]
        getter secret_id : String

        def initialize(
          @name : String,
          @pager_duty_incident_configuration : Types::PagerDutyIncidentConfiguration,
          @secret_id : String
        )
        end
      end

      # Details about the PagerDuty service where the response plan creates an incident.
      struct PagerDutyIncidentConfiguration
        include JSON::Serializable

        # The ID of the PagerDuty service that the response plan associates with an incident when it launches.
        @[JSON::Field(key: "serviceId")]
        getter service_id : String

        def initialize(
          @service_id : String
        )
        end
      end

      # Details about the PagerDuty incident associated with an incident created by an Incident Manager
      # response plan.
      struct PagerDutyIncidentDetail
        include JSON::Serializable

        # The ID of the incident associated with the PagerDuty service for the response plan.
        @[JSON::Field(key: "id")]
        getter id : String

        # Indicates whether to resolve the PagerDuty incident when you resolve the associated Incident Manager
        # incident.
        @[JSON::Field(key: "autoResolve")]
        getter auto_resolve : Bool?

        # The ID of the Amazon Web Services Secrets Manager secret that stores your PagerDuty key, either a
        # General Access REST API Key or User Token REST API Key, and other user credentials.
        @[JSON::Field(key: "secretId")]
        getter secret_id : String?

        def initialize(
          @id : String,
          @auto_resolve : Bool? = nil,
          @secret_id : String? = nil
        )
        end
      end

      struct PutResourcePolicyInput
        include JSON::Serializable

        # Details of the resource policy.
        @[JSON::Field(key: "policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the response plan to add the resource policy to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyOutput
        include JSON::Serializable

        # The ID of the resource policy.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        def initialize(
          @policy_id : String
        )
        end
      end

      # Information about a Amazon Web Services Region in your replication set.
      struct RegionInfo
        include JSON::Serializable

        # The status of the Amazon Web Services Region in the replication set.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp for when Incident Manager updated the status of the Amazon Web Services Region.
        @[JSON::Field(key: "statusUpdateDateTime")]
        getter status_update_date_time : Time

        # The ID of the KMS key used to encrypt the data in this Amazon Web Services Region.
        @[JSON::Field(key: "sseKmsKeyId")]
        getter sse_kms_key_id : String?

        # Information displayed about the status of the Amazon Web Services Region.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @status : String,
          @status_update_date_time : Time,
          @sse_kms_key_id : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # The mapping between a Amazon Web Services Region and the key that's used to encrypt the data.
      struct RegionMapInputValue
        include JSON::Serializable

        # The KMS key used to encrypt the data in your replication set.
        @[JSON::Field(key: "sseKmsKeyId")]
        getter sse_kms_key_id : String?

        def initialize(
          @sse_kms_key_id : String? = nil
        )
        end
      end

      # Resources that responders use to triage and mitigate the incident.
      struct RelatedItem
        include JSON::Serializable

        # Details about the related item.
        @[JSON::Field(key: "identifier")]
        getter identifier : Types::ItemIdentifier

        # A unique ID for a RelatedItem . Don't specify this parameter when you add a RelatedItem by using the
        # UpdateRelatedItems API action.
        @[JSON::Field(key: "generatedId")]
        getter generated_id : String?

        # The title of the related item.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @identifier : Types::ItemIdentifier,
          @generated_id : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Details about the related item you're adding.
      struct RelatedItemsUpdate
        include JSON::Serializable

        # Details about the related item you're adding.
        @[JSON::Field(key: "itemToAdd")]
        getter item_to_add : Types::RelatedItem?

        # Details about the related item you're deleting.
        @[JSON::Field(key: "itemToRemove")]
        getter item_to_remove : Types::ItemIdentifier?

        def initialize(
          @item_to_add : Types::RelatedItem? = nil,
          @item_to_remove : Types::ItemIdentifier? = nil
        )
        end
      end

      # The set of Amazon Web Services Region that your Incident Manager data will be replicated to and the
      # KMS key used to encrypt the data.
      struct ReplicationSet
        include JSON::Serializable

        # Details about who created the replication set.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # When the replication set was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # Determines if the replication set deletion protection is enabled or not. If deletion protection is
        # enabled, you can't delete the last Amazon Web Services Region in the replication set.
        @[JSON::Field(key: "deletionProtected")]
        getter deletion_protected : Bool

        # Who last modified the replication set.
        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String

        # When the replication set was last updated.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The map between each Amazon Web Services Region in your replication set and the KMS key that's used
        # to encrypt the data in that Region.
        @[JSON::Field(key: "regionMap")]
        getter region_map : Hash(String, Types::RegionInfo)

        # The status of the replication set. If the replication set is still pending, you can't use Incident
        # Manager functionality.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the replication set.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @created_by : String,
          @created_time : Time,
          @deletion_protected : Bool,
          @last_modified_by : String,
          @last_modified_time : Time,
          @region_map : Hash(String, Types::RegionInfo),
          @status : String,
          @arn : String? = nil
        )
        end
      end

      # Request references a resource which doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the requested resource
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String?

        # The resource type
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_identifier : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The resource policy that allows Incident Manager to perform actions on resources on your behalf.
      struct ResourcePolicy
        include JSON::Serializable

        # The JSON blob that describes the policy.
        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The ID of the resource policy.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The Amazon Web Services Region that policy allows resources to be used in.
        @[JSON::Field(key: "ramResourceShareRegion")]
        getter ram_resource_share_region : String

        def initialize(
          @policy_document : String,
          @policy_id : String,
          @ram_resource_share_region : String
        )
        end
      end

      # Details of the response plan that are used when creating an incident.
      struct ResponsePlanSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the response plan. This can't include spaces.
        @[JSON::Field(key: "name")]
        getter name : String

        # The human readable name of the response plan. This can include spaces.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @arn : String,
          @name : String,
          @display_name : String? = nil
        )
        end
      end

      # Request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Originating quota code
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # Originating service code
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The identifier for the requested resource
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String?

        # The resource type
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @resource_identifier : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Details about the Systems Manager automation document that will be used as a runbook during an
      # incident.
      struct SsmAutomation
        include JSON::Serializable

        # The automation document's name.
        @[JSON::Field(key: "documentName")]
        getter document_name : String

        # The Amazon Resource Name (ARN) of the role that the automation document will assume when running
        # commands.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The automation document's version to use when running.
        @[JSON::Field(key: "documentVersion")]
        getter document_version : String?

        # The key-value pair to resolve dynamic parameter values when processing a Systems Manager Automation
        # runbook.
        @[JSON::Field(key: "dynamicParameters")]
        getter dynamic_parameters : Hash(String, Types::DynamicSsmParameterValue)?

        # The key-value pair parameters to use when running the automation document.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Array(String))?

        # The account that the automation document will be run in. This can be in either the management
        # account or an application account.
        @[JSON::Field(key: "targetAccount")]
        getter target_account : String?

        def initialize(
          @document_name : String,
          @role_arn : String,
          @document_version : String? = nil,
          @dynamic_parameters : Hash(String, Types::DynamicSsmParameterValue)? = nil,
          @parameters : Hash(String, Array(String))? = nil,
          @target_account : String? = nil
        )
        end
      end

      struct StartIncidentInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan that pre-defines summary, chat channels, Amazon
        # SNS topics, runbooks, title, and impact of the incident.
        @[JSON::Field(key: "responsePlanArn")]
        getter response_plan_arn : String

        # A token ensuring that the operation is called only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Defines the impact to the customers. Providing an impact overwrites the impact provided by a
        # response plan. Supported impact codes 1 - Critical 2 - High 3 - Medium 4 - Low 5 - No Impact
        @[JSON::Field(key: "impact")]
        getter impact : Int32?

        # Add related items to the incident for other responders to use. Related items are Amazon Web Services
        # resources, external links, or files uploaded to an Amazon S3 bucket.
        @[JSON::Field(key: "relatedItems")]
        getter related_items : Array(Types::RelatedItem)?

        # Provide a title for the incident. Providing a title overwrites the title provided by the response
        # plan.
        @[JSON::Field(key: "title")]
        getter title : String?

        # Details of what created the incident record in Incident Manager.
        @[JSON::Field(key: "triggerDetails")]
        getter trigger_details : Types::TriggerDetails?

        def initialize(
          @response_plan_arn : String,
          @client_token : String? = nil,
          @impact : Int32? = nil,
          @related_items : Array(Types::RelatedItem)? = nil,
          @title : String? = nil,
          @trigger_details : Types::TriggerDetails? = nil
        )
        end
      end

      struct StartIncidentOutput
        include JSON::Serializable

        # The ARN of the newly created incident record.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        def initialize(
          @incident_record_arn : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan you're adding the tags to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tags to add to the response plan.
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

        @[JSON::Field(key: "message")]
        getter message : String

        # Originating quota code
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # Originating service code
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String
        )
        end
      end

      # A significant event that happened during the incident.
      struct TimelineEvent
        include JSON::Serializable

        # A short description of the event.
        @[JSON::Field(key: "eventData")]
        getter event_data : String

        # The ID of the timeline event.
        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The timestamp for when the event occurred.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time

        # The type of event that occurred. Currently Incident Manager supports only the Custom Event and Note
        # types.
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The timestamp for when the timeline event was last updated.
        @[JSON::Field(key: "eventUpdatedTime")]
        getter event_updated_time : Time

        # The Amazon Resource Name (ARN) of the incident that the event occurred during.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # A list of references in a TimelineEvent .
        @[JSON::Field(key: "eventReferences")]
        getter event_references : Array(Types::EventReference)?

        def initialize(
          @event_data : String,
          @event_id : String,
          @event_time : Time,
          @event_type : String,
          @event_updated_time : Time,
          @incident_record_arn : String,
          @event_references : Array(Types::EventReference)? = nil
        )
        end
      end

      # Details about what caused the incident to be created in Incident Manager.
      struct TriggerDetails
        include JSON::Serializable

        # Identifies the service that sourced the event. All events sourced from within Amazon Web Services
        # begin with " aws. " Customer-generated events can have any value here, as long as it doesn't begin
        # with " aws. " We recommend the use of Java package-name style reverse domain-name strings.
        @[JSON::Field(key: "source")]
        getter source : String

        # The timestamp for when the incident was detected.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # Raw data passed from either Amazon EventBridge, Amazon CloudWatch, or Incident Manager when an
        # incident is created.
        @[JSON::Field(key: "rawData")]
        getter raw_data : String?

        # The Amazon Resource Name (ARN) of the source that detected the incident.
        @[JSON::Field(key: "triggerArn")]
        getter trigger_arn : String?

        def initialize(
          @source : String,
          @timestamp : Time,
          @raw_data : String? = nil,
          @trigger_arn : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan you're removing a tag from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name of the tag to remove from the response plan.
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

      struct UpdateDeletionProtectionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the replication set to update.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Specifies if deletion protection is turned on or off in your account.
        @[JSON::Field(key: "deletionProtected")]
        getter deletion_protected : Bool

        # A token that ensures that the operation is called only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @arn : String,
          @deletion_protected : Bool,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateDeletionProtectionOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateIncidentRecordInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident record you are updating.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Chatbot chat channel where responders can collaborate.
        @[JSON::Field(key: "chatChannel")]
        getter chat_channel : Types::ChatChannel?

        # A token that ensures that a client calls the operation only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Defines the impact of the incident to customers and applications. If you provide an impact for an
        # incident, it overwrites the impact provided by the response plan. Supported impact codes 1 -
        # Critical 2 - High 3 - Medium 4 - Low 5 - No Impact
        @[JSON::Field(key: "impact")]
        getter impact : Int32?

        # The Amazon SNS targets that Incident Manager notifies when a client updates an incident. Using
        # multiple SNS topics creates redundancy in the event that a Region is down during the incident.
        @[JSON::Field(key: "notificationTargets")]
        getter notification_targets : Array(Types::NotificationTargetItem)?

        # The status of the incident. Possible statuses are Open or Resolved .
        @[JSON::Field(key: "status")]
        getter status : String?

        # A longer description of what occurred during the incident.
        @[JSON::Field(key: "summary")]
        getter summary : String?

        # A brief description of the incident.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @arn : String,
          @chat_channel : Types::ChatChannel? = nil,
          @client_token : String? = nil,
          @impact : Int32? = nil,
          @notification_targets : Array(Types::NotificationTargetItem)? = nil,
          @status : String? = nil,
          @summary : String? = nil,
          @title : String? = nil
        )
        end
      end

      struct UpdateIncidentRecordOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateRelatedItemsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident record that contains the related items that you
        # update.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # Details about the item that you are add to, or delete from, an incident.
        @[JSON::Field(key: "relatedItemsUpdate")]
        getter related_items_update : Types::RelatedItemsUpdate

        # A token that ensures that a client calls the operation only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @incident_record_arn : String,
          @related_items_update : Types::RelatedItemsUpdate,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateRelatedItemsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Details used when updating the replication set.
      struct UpdateReplicationSetAction
        include JSON::Serializable

        # Details about the Amazon Web Services Region that you're adding to the replication set.
        @[JSON::Field(key: "addRegionAction")]
        getter add_region_action : Types::AddRegionAction?

        # Details about the Amazon Web Services Region that you're deleting to the replication set.
        @[JSON::Field(key: "deleteRegionAction")]
        getter delete_region_action : Types::DeleteRegionAction?

        def initialize(
          @add_region_action : Types::AddRegionAction? = nil,
          @delete_region_action : Types::DeleteRegionAction? = nil
        )
        end
      end

      struct UpdateReplicationSetInput
        include JSON::Serializable

        # An action to add or delete a Region.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::UpdateReplicationSetAction)

        # The Amazon Resource Name (ARN) of the replication set you're updating.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A token that ensures that the operation is called only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @actions : Array(Types::UpdateReplicationSetAction),
          @arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateReplicationSetOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateResponsePlanInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response plan.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The actions that this response plan takes at the beginning of an incident.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::Action)?

        # The Chatbot chat channel used for collaboration during an incident. Use the empty structure to
        # remove the chat channel from the response plan.
        @[JSON::Field(key: "chatChannel")]
        getter chat_channel : Types::ChatChannel?

        # A token ensuring that the operation is called only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The long format name of the response plan. The display name can't contain spaces.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) for the contacts and escalation plans that the response plan engages
        # during an incident.
        @[JSON::Field(key: "engagements")]
        getter engagements : Array(String)?

        # The string Incident Manager uses to prevent duplicate incidents from being created by the same
        # incident in the same account.
        @[JSON::Field(key: "incidentTemplateDedupeString")]
        getter incident_template_dedupe_string : String?

        # Defines the impact to the customers. Providing an impact overwrites the impact provided by a
        # response plan. Supported impact codes 1 - Critical 2 - High 3 - Medium 4 - Low 5 - No Impact
        @[JSON::Field(key: "incidentTemplateImpact")]
        getter incident_template_impact : Int32?

        # The Amazon SNS targets that are notified when updates are made to an incident.
        @[JSON::Field(key: "incidentTemplateNotificationTargets")]
        getter incident_template_notification_targets : Array(Types::NotificationTargetItem)?

        # A brief summary of the incident. This typically contains what has happened, what's currently
        # happening, and next steps.
        @[JSON::Field(key: "incidentTemplateSummary")]
        getter incident_template_summary : String?

        # Tags to assign to the template. When the StartIncident API action is called, Incident Manager
        # assigns the tags specified in the template to the incident. To call this action, you must also have
        # permission to call the TagResource API action for the incident record resource.
        @[JSON::Field(key: "incidentTemplateTags")]
        getter incident_template_tags : Hash(String, String)?

        # The short format name of the incident. The title can't contain spaces.
        @[JSON::Field(key: "incidentTemplateTitle")]
        getter incident_template_title : String?

        # Information about third-party services integrated into the response plan.
        @[JSON::Field(key: "integrations")]
        getter integrations : Array(Types::Integration)?

        def initialize(
          @arn : String,
          @actions : Array(Types::Action)? = nil,
          @chat_channel : Types::ChatChannel? = nil,
          @client_token : String? = nil,
          @display_name : String? = nil,
          @engagements : Array(String)? = nil,
          @incident_template_dedupe_string : String? = nil,
          @incident_template_impact : Int32? = nil,
          @incident_template_notification_targets : Array(Types::NotificationTargetItem)? = nil,
          @incident_template_summary : String? = nil,
          @incident_template_tags : Hash(String, String)? = nil,
          @incident_template_title : String? = nil,
          @integrations : Array(Types::Integration)? = nil
        )
        end
      end

      struct UpdateResponsePlanOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateTimelineEventInput
        include JSON::Serializable

        # The ID of the event to update. You can use ListTimelineEvents to find an event's ID.
        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The Amazon Resource Name (ARN) of the incident that includes the timeline event.
        @[JSON::Field(key: "incidentRecordArn")]
        getter incident_record_arn : String

        # A token that ensures that a client calls the operation only once with the specified details.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A short description of the event.
        @[JSON::Field(key: "eventData")]
        getter event_data : String?

        # Updates all existing references in a TimelineEvent . A reference is an Amazon Web Services resource
        # involved or associated with the incident. To specify a reference, enter its Amazon Resource Name
        # (ARN). You can also specify a related item associated with that resource. For example, to specify an
        # Amazon DynamoDB (DynamoDB) table as a resource, use its ARN. You can also specify an Amazon
        # CloudWatch metric associated with the DynamoDB table as a related item. This update action overrides
        # all existing references. If you want to keep existing references, you must specify them in the call.
        # If you don't, this action removes any existing references and enters only new references.
        @[JSON::Field(key: "eventReferences")]
        getter event_references : Array(Types::EventReference)?

        # The timestamp for when the event occurred.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time?

        # The type of event. You can update events of type Custom Event and Note .
        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        def initialize(
          @event_id : String,
          @incident_record_arn : String,
          @client_token : String? = nil,
          @event_data : String? = nil,
          @event_references : Array(Types::EventReference)? = nil,
          @event_time : Time? = nil,
          @event_type : String? = nil
        )
        end
      end

      struct UpdateTimelineEventOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
