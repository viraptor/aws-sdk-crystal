require "json"
require "time"

module Aws
  module Notifications
    module Types

      # User does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Provides detailed information about the dimensions used for aggregation.

      struct AggregationDetail
        include JSON::Serializable

        # Properties used to summarize aggregated events.

        @[JSON::Field(key: "summarizationDimensions")]
        getter summarization_dimensions : Array(Types::SummarizationDimensionDetail)?

        def initialize(
          @summarization_dimensions : Array(Types::SummarizationDimensionDetail)? = nil
        )
        end
      end

      # Key-value collection that indicate how notifications are grouped.

      struct AggregationKey
        include JSON::Serializable

        # Indicates the type of aggregation key.

        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates the value associated with the aggregation key name.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Provides additional information about the aggregation key.

      struct AggregationSummary
        include JSON::Serializable

        # Indicates the Amazon Web Services accounts in the aggregation key.

        @[JSON::Field(key: "aggregatedAccounts")]
        getter aggregated_accounts : Types::SummarizationDimensionOverview

        # Indicates the criteria or rules by which notifications have been grouped together.

        @[JSON::Field(key: "aggregatedBy")]
        getter aggregated_by : Array(Types::AggregationKey)

        # Indicates the Amazon Web Services Regions in the aggregation key.

        @[JSON::Field(key: "aggregatedRegions")]
        getter aggregated_regions : Types::SummarizationDimensionOverview

        # Indicates the number of events associated with the aggregation key.

        @[JSON::Field(key: "eventCount")]
        getter event_count : Int32

        # List of additional dimensions used to group and summarize data.

        @[JSON::Field(key: "additionalSummarizationDimensions")]
        getter additional_summarization_dimensions : Array(Types::SummarizationDimensionOverview)?

        # Indicates the collection of organizational units that are involved in the aggregation key.

        @[JSON::Field(key: "aggregatedOrganizationalUnits")]
        getter aggregated_organizational_units : Types::SummarizationDimensionOverview?

        def initialize(
          @aggregated_accounts : Types::SummarizationDimensionOverview,
          @aggregated_by : Array(Types::AggregationKey),
          @aggregated_regions : Types::SummarizationDimensionOverview,
          @event_count : Int32,
          @additional_summarization_dimensions : Array(Types::SummarizationDimensionOverview)? = nil,
          @aggregated_organizational_units : Types::SummarizationDimensionOverview? = nil
        )
        end
      end


      struct AssociateChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Channel to associate with the NotificationConfiguration .
        # Supported ARNs include Amazon Q Developer in chat applications, the Console Mobile Application, and
        # notifications-contacts.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ARN of the NotificationConfiguration to associate with the Channel.

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        def initialize(
          @arn : String,
          @notification_configuration_arn : String
        )
        end
      end


      struct AssociateChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateManagedNotificationAccountContactRequest
        include JSON::Serializable

        # A unique value of an Account Contact Type to associate with the ManagedNotificationConfiguration .

        @[JSON::Field(key: "contactIdentifier")]
        getter contact_identifier : String

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration to associate with the Account
        # Contact.

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        def initialize(
          @contact_identifier : String,
          @managed_notification_configuration_arn : String
        )
        end
      end


      struct AssociateManagedNotificationAccountContactResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateManagedNotificationAdditionalChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Channel to associate with the ManagedNotificationConfiguration
        # . Supported ARNs include Amazon Q Developer in chat applications, the Console Mobile Application,
        # and email (notifications-contacts).

        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration to associate with the
        # additional Channel.

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        def initialize(
          @channel_arn : String,
          @managed_notification_configuration_arn : String
        )
        end
      end


      struct AssociateManagedNotificationAdditionalChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateOrganizationalUnitRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the notification configuration to associate with the
        # organizational unit.

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # The unique identifier of the organizational unit to associate.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String

        def initialize(
          @notification_configuration_arn : String,
          @organizational_unit_id : String
        )
        end
      end


      struct AssociateOrganizationalUnitResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The resource ID that prompted the conflict error.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_id : String
        )
        end
      end


      struct CreateEventRuleRequest
        include JSON::Serializable

        # The event type to match. Must match one of the valid Amazon EventBridge event types. For example,
        # EC2 Instance State-change Notification and Amazon CloudWatch Alarm State Change. For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The Amazon Resource Name (ARN) of the NotificationConfiguration associated with this EventRule .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # A list of Amazon Web Services Regions that send events to this EventRule .

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The matched event source. Must match one of the valid EventBridge sources. Only Amazon Web Services
        # service sourced events are supported. For example, aws.ec2 and aws.cloudwatch . For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "source")]
        getter source : String

        # An additional event pattern used to further filter the events this EventRule receives. For more
        # information, see Amazon EventBridge event patterns in the Amazon EventBridge User Guide.

        @[JSON::Field(key: "eventPattern")]
        getter event_pattern : String?

        def initialize(
          @event_type : String,
          @notification_configuration_arn : String,
          @regions : Array(String),
          @source : String,
          @event_pattern : String? = nil
        )
        end
      end


      struct CreateEventRuleResponse
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ARN of a NotificationConfiguration .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # A list of an EventRule 's status by Region. Regions are mapped to EventRuleStatusSummary .

        @[JSON::Field(key: "statusSummaryByRegion")]
        getter status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)

        def initialize(
          @arn : String,
          @notification_configuration_arn : String,
          @status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)
        )
        end
      end


      struct CreateNotificationConfigurationRequest
        include JSON::Serializable

        # The description of the NotificationConfiguration .

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the NotificationConfiguration . Supports RFC 3986's unreserved characters.

        @[JSON::Field(key: "name")]
        getter name : String

        # The aggregation preference of the NotificationConfiguration . Values: LONG Aggregate notifications
        # for long periods of time (12 hours). SHORT Aggregate notifications for short periods of time (5
        # minutes). NONE Don't aggregate notifications.

        @[JSON::Field(key: "aggregationDuration")]
        getter aggregation_duration : String?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @name : String,
          @aggregation_duration : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateNotificationConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the NotificationConfiguration .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The current status of this NotificationConfiguration .

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @status : String
        )
        end
      end


      struct DeleteEventRuleRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the EventRule to delete.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteEventRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteNotificationConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the NotificationConfiguration to delete.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteNotificationConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterNotificationHubRequest
        include JSON::Serializable

        # The NotificationConfiguration Region.

        @[JSON::Field(key: "notificationHubRegion")]
        getter notification_hub_region : String

        def initialize(
          @notification_hub_region : String
        )
        end
      end


      struct DeregisterNotificationHubResponse
        include JSON::Serializable

        # The NotificationConfiguration Region.

        @[JSON::Field(key: "notificationHubRegion")]
        getter notification_hub_region : String

        # NotificationConfiguration status information.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Types::NotificationHubStatusSummary

        def initialize(
          @notification_hub_region : String,
          @status_summary : Types::NotificationHubStatusSummary
        )
        end
      end

      # The key-value pair of properties for an event.

      struct Dimension
        include JSON::Serializable

        # The name of the dimension

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the dimension.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end


      struct DisableNotificationsAccessForOrganizationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DisableNotificationsAccessForOrganizationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Channel to disassociate.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ARN of the NotificationConfiguration to disassociate.

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        def initialize(
          @arn : String,
          @notification_configuration_arn : String
        )
        end
      end


      struct DisassociateChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateManagedNotificationAccountContactRequest
        include JSON::Serializable

        # The unique value of an Account Contact Type to associate with the ManagedNotificationConfiguration .

        @[JSON::Field(key: "contactIdentifier")]
        getter contact_identifier : String

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration to associate with the Account
        # Contact.

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        def initialize(
          @contact_identifier : String,
          @managed_notification_configuration_arn : String
        )
        end
      end


      struct DisassociateManagedNotificationAccountContactResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateManagedNotificationAdditionalChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Channel to associate with the ManagedNotificationConfiguration
        # .

        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The Amazon Resource Name (ARN) of the Managed Notification Configuration to associate with the
        # additional Channel.

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        def initialize(
          @channel_arn : String,
          @managed_notification_configuration_arn : String
        )
        end
      end


      struct DisassociateManagedNotificationAdditionalChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateOrganizationalUnitRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the notification configuration to disassociate from the
        # organizational unit.

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # The unique identifier of the organizational unit to disassociate.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String

        def initialize(
          @notification_configuration_arn : String,
          @organizational_unit_id : String
        )
        end
      end


      struct DisassociateOrganizationalUnitResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct EnableNotificationsAccessForOrganizationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct EnableNotificationsAccessForOrganizationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides additional information about the current EventRule status.

      struct EventRuleStatusSummary
        include JSON::Serializable

        # A human-readable reason for EventRuleStatus .

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The status of the EventRule . Values: ACTIVE The EventRule can process events. INACTIVE The
        # EventRule may be unable to process events. CREATING The EventRule is being created. Only GET and
        # LIST calls can be run. UPDATING The EventRule is being updated. Only GET and LIST calls can be run.
        # DELETING The EventRule is being deleted. Only GET and LIST calls can be run.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @reason : String,
          @status : String
        )
        end
      end

      # Contains a complete list of fields related to an EventRule .

      struct EventRuleStructure
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the EventRule . CloudFormation stack generates this ARN and then
        # uses this ARN to associate with the NotificationConfiguration .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation time of the EventRule .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # An additional event pattern used to further filter the events this EventRule receives. For more
        # information, see Amazon EventBridge event patterns in the Amazon EventBridge User Guide.

        @[JSON::Field(key: "eventPattern")]
        getter event_pattern : String

        # The event type this rule should match with the EventBridge events. It must match with atleast one of
        # the valid EventBridge event types. For example, Amazon EC2 Instance State change Notification and
        # Amazon CloudWatch State Change. For more information, see Event delivery from Amazon Web Services
        # services in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # A list of Amazon EventBridge Managed Rule ARNs associated with this EventRule . These are created by
        # User Notifications within your account so your EventRules can function.

        @[JSON::Field(key: "managedRules")]
        getter managed_rules : Array(String)

        # The ARN for the NotificationConfiguration associated with this EventRule .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # A list of Amazon Web Services Regions that send events to this EventRule .

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The event source this rule should match with the EventBridge event sources. It must match with
        # atleast one of the valid EventBridge event sources. Only Amazon Web Services service sourced events
        # are supported. For example, aws.ec2 and aws.cloudwatch . For more information, see Event delivery
        # from Amazon Web Services services in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "source")]
        getter source : String

        # A list of an EventRule 's status by Region. Regions are mapped to EventRuleStatusSummary .

        @[JSON::Field(key: "statusSummaryByRegion")]
        getter status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)

        def initialize(
          @arn : String,
          @creation_time : Time,
          @event_pattern : String,
          @event_type : String,
          @managed_rules : Array(String),
          @notification_configuration_arn : String,
          @regions : Array(String),
          @source : String,
          @status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)
        )
        end
      end


      struct GetEventRuleRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the EventRule to return.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetEventRuleResponse
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date when the EventRule was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # An additional event pattern used to further filter the events this EventRule receives. For more
        # information, see Amazon EventBridge event patterns in the Amazon EventBridge User Guide.

        @[JSON::Field(key: "eventPattern")]
        getter event_pattern : String

        # The event type to match. Must match one of the valid Amazon EventBridge event types. For example,
        # EC2 Instance State-change Notification and Amazon CloudWatch Alarm State Change. For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # A list of managed rules from EventBridge that are associated with this EventRule . These are created
        # by User Notifications within your account so this EventRule functions.

        @[JSON::Field(key: "managedRules")]
        getter managed_rules : Array(String)

        # The ARN of a NotificationConfiguration .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # A list of Amazon Web Services Regions that send events to this EventRule .

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)

        # The matched event source. Must match one of the valid EventBridge sources. Only Amazon Web Services
        # service sourced events are supported. For example, aws.ec2 and aws.cloudwatch . For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "source")]
        getter source : String

        # A list of an EventRule 's status by Region. Regions are mapped to EventRuleStatusSummary .

        @[JSON::Field(key: "statusSummaryByRegion")]
        getter status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)

        def initialize(
          @arn : String,
          @creation_time : Time,
          @event_pattern : String,
          @event_type : String,
          @managed_rules : Array(String),
          @notification_configuration_arn : String,
          @regions : Array(String),
          @source : String,
          @status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)
        )
        end
      end


      struct GetManagedNotificationChildEventRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationChildEvent to return.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The locale code of the language used for the retrieved ManagedNotificationChildEvent . The default
        # locale is English en_US .

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @arn : String,
          @locale : String? = nil
        )
        end
      end


      struct GetManagedNotificationChildEventResponse
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The content of the ManagedNotificationChildEvent .

        @[JSON::Field(key: "content")]
        getter content : Types::ManagedNotificationChildEvent

        # The creation time of the ManagedNotificationChildEvent .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration associated with the
        # ManagedNotificationChildEvent .

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        def initialize(
          @arn : String,
          @content : Types::ManagedNotificationChildEvent,
          @creation_time : Time,
          @managed_notification_configuration_arn : String
        )
        end
      end


      struct GetManagedNotificationConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration to return.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetManagedNotificationConfigurationResponse
        include JSON::Serializable

        # The ARN of the ManagedNotificationConfiguration resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The category of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "category")]
        getter category : String

        # The description of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "name")]
        getter name : String

        # The subCategory of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "subCategory")]
        getter sub_category : String

        def initialize(
          @arn : String,
          @category : String,
          @description : String,
          @name : String,
          @sub_category : String
        )
        end
      end


      struct GetManagedNotificationEventRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationEvent to return.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The locale code of the language used for the retrieved ManagedNotificationEvent . The default locale
        # is English (en_US) .

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @arn : String,
          @locale : String? = nil
        )
        end
      end


      struct GetManagedNotificationEventResponse
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The content of the ManagedNotificationEvent .

        @[JSON::Field(key: "content")]
        getter content : Types::ManagedNotificationEvent

        # The creation time of the ManagedNotificationEvent .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ARN of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        def initialize(
          @arn : String,
          @content : Types::ManagedNotificationEvent,
          @creation_time : Time,
          @managed_notification_configuration_arn : String
        )
        end
      end


      struct GetNotificationConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the NotificationConfiguration to return.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetNotificationConfigurationResponse
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation time of the NotificationConfiguration .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The description of the NotificationConfiguration .

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the NotificationConfiguration .

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of this NotificationConfiguration .

        @[JSON::Field(key: "status")]
        getter status : String

        # The aggregation preference of the NotificationConfiguration . Values: LONG Aggregate notifications
        # for long periods of time (12 hours). SHORT Aggregate notifications for short periods of time (5
        # minutes). NONE Don't aggregate notifications.

        @[JSON::Field(key: "aggregationDuration")]
        getter aggregation_duration : String?

        # The subtype of the notification configuration returned in the response.

        @[JSON::Field(key: "subtype")]
        getter subtype : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @description : String,
          @name : String,
          @status : String,
          @aggregation_duration : String? = nil,
          @subtype : String? = nil
        )
        end
      end


      struct GetNotificationEventRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the NotificationEvent to return.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The locale code of the language used for the retrieved NotificationEvent . The default locale is
        # English en_US .

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @arn : String,
          @locale : String? = nil
        )
        end
      end


      struct GetNotificationEventResponse
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The content of the NotificationEvent .

        @[JSON::Field(key: "content")]
        getter content : Types::NotificationEvent

        # The creation time of the NotificationEvent .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ARN of the NotificationConfiguration .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        def initialize(
          @arn : String,
          @content : Types::NotificationEvent,
          @creation_time : Time,
          @notification_configuration_arn : String
        )
        end
      end


      struct GetNotificationsAccessForOrganizationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetNotificationsAccessForOrganizationResponse
        include JSON::Serializable

        # The AccessStatus of Service Trust Enablement for User Notifications to Amazon Web Services
        # Organizations.

        @[JSON::Field(key: "notificationsAccessForOrganization")]
        getter notifications_access_for_organization : Types::NotificationsAccessForOrganization

        def initialize(
          @notifications_access_for_organization : Types::NotificationsAccessForOrganization
        )
        end
      end

      # Unexpected error during processing of request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListChannelsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the NotificationConfiguration .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # The maximum number of results to be returned in this call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous
        # ListNotificationEvents call. NextToken uses Base64 encoding.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @notification_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelsResponse
        include JSON::Serializable

        # A list of Channels.

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListEventRulesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the NotificationConfiguration .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # The maximum number of results to be returned in this call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous ListEventRules call.
        # Next token uses Base64 encoding.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @notification_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventRulesResponse
        include JSON::Serializable

        # A list of EventRules .

        @[JSON::Field(key: "eventRules")]
        getter event_rules : Array(Types::EventRuleStructure)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_rules : Array(Types::EventRuleStructure),
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedNotificationChannelAssociationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration to match.

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        # The maximum number of results to be returned in this call. Defaults to 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous
        # ListManagedNotificationChannelAssociations call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @managed_notification_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedNotificationChannelAssociationsResponse
        include JSON::Serializable

        # A list that contains the following information about a channel association.

        @[JSON::Field(key: "channelAssociations")]
        getter channel_associations : Array(Types::ManagedNotificationChannelAssociationSummary)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_associations : Array(Types::ManagedNotificationChannelAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedNotificationChildEventsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationEvent .

        @[JSON::Field(key: "aggregateManagedNotificationEventArn")]
        getter aggregate_managed_notification_event_arn : String

        # Latest time of events to return from this call.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The locale code of the language used for the retrieved NotificationEvent . The default locale is
        # English. en_US .

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of results to be returned in this call. Defaults to 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous
        # ListManagedNotificationChannelAssociations call. Next token uses Base64 encoding.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier of the Amazon Web Services Organizations organizational unit (OU) associated with the
        # Managed Notification Child Events.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        # The Amazon Web Services account ID associated with the Managed Notification Child Events.

        @[JSON::Field(key: "relatedAccount")]
        getter related_account : String?

        # The earliest time of events to return from this call.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @aggregate_managed_notification_event_arn : String,
          @end_time : Time? = nil,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organizational_unit_id : String? = nil,
          @related_account : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListManagedNotificationChildEventsResponse
        include JSON::Serializable

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "managedNotificationChildEvents")]
        getter managed_notification_child_events : Array(Types::ManagedNotificationChildEventOverview)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @managed_notification_child_events : Array(Types::ManagedNotificationChildEventOverview),
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedNotificationConfigurationsRequest
        include JSON::Serializable

        # The identifier or ARN of the notification channel to filter configurations by.

        @[JSON::Field(key: "channelIdentifier")]
        getter channel_identifier : String?

        # The maximum number of results to be returned in this call. Defaults to 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous
        # ListManagedNotificationChannelAssociations call. Next token uses Base64 encoding.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedNotificationConfigurationsResponse
        include JSON::Serializable

        # A list of Managed Notification Configurations matching the request criteria.

        @[JSON::Field(key: "managedNotificationConfigurations")]
        getter managed_notification_configurations : Array(Types::ManagedNotificationConfigurationStructure)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @managed_notification_configurations : Array(Types::ManagedNotificationConfigurationStructure),
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedNotificationEventsRequest
        include JSON::Serializable

        # Latest time of events to return from this call.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The locale code of the language used for the retrieved NotificationEvent. The default locale is
        # English (en_US).

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of results to be returned in this call. Defaults to 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous
        # ListManagedNotificationChannelAssociations call. Next token uses Base64 encoding.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Organizational Unit Id that an Amazon Web Services account belongs to.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        # The Amazon Web Services account ID associated with the Managed Notification Events.

        @[JSON::Field(key: "relatedAccount")]
        getter related_account : String?

        # The Amazon Web Services service the event originates from. For example aws.cloudwatch.

        @[JSON::Field(key: "source")]
        getter source : String?

        # The earliest time of events to return from this call.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organizational_unit_id : String? = nil,
          @related_account : String? = nil,
          @source : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListManagedNotificationEventsResponse
        include JSON::Serializable

        # A list of Managed Notification Events matching the request criteria.

        @[JSON::Field(key: "managedNotificationEvents")]
        getter managed_notification_events : Array(Types::ManagedNotificationEventOverview)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @managed_notification_events : Array(Types::ManagedNotificationEventOverview),
          @next_token : String? = nil
        )
        end
      end


      struct ListMemberAccountsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the notification configuration used to filter the member accounts.

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # The maximum number of results to return in a single call. Valid values are 1-100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The member account identifier used to filter the results.

        @[JSON::Field(key: "memberAccount")]
        getter member_account : String?

        # The token for the next page of results. Use the value returned in the previous response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The organizational unit ID used to filter the member accounts.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        # The status used to filter the member accounts.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @notification_configuration_arn : String,
          @max_results : Int32? = nil,
          @member_account : String? = nil,
          @next_token : String? = nil,
          @organizational_unit_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListMemberAccountsResponse
        include JSON::Serializable

        # The list of member accounts that match the specified criteria.

        @[JSON::Field(key: "memberAccounts")]
        getter member_accounts : Array(Types::MemberAccount)

        # The token to use for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @member_accounts : Array(Types::MemberAccount),
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationConfigurationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Channel to match.

        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String?

        # The matched event source. Must match one of the valid EventBridge sources. Only Amazon Web Services
        # service sourced events are supported. For example, aws.ec2 and aws.cloudwatch . For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "eventRuleSource")]
        getter event_rule_source : String?

        # The maximum number of results to be returned in this call. Defaults to 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous ListEventRules call.
        # Next token uses Base64 encoding.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The NotificationConfiguration status to match. Values: ACTIVE All EventRules are ACTIVE and any call
        # can be run. PARTIALLY_ACTIVE Some EventRules are ACTIVE and some are INACTIVE . Any call can be run.
        # Any call can be run. INACTIVE All EventRules are INACTIVE and any call can be run. DELETING This
        # NotificationConfiguration is being deleted. Only GET and LIST calls can be run.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The subtype used to filter the notification configurations in the request.

        @[JSON::Field(key: "subtype")]
        getter subtype : String?

        def initialize(
          @channel_arn : String? = nil,
          @event_rule_source : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @subtype : String? = nil
        )
        end
      end


      struct ListNotificationConfigurationsResponse
        include JSON::Serializable

        # The NotificationConfigurations in the account.

        @[JSON::Field(key: "notificationConfigurations")]
        getter notification_configurations : Array(Types::NotificationConfigurationStructure)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @notification_configurations : Array(Types::NotificationConfigurationStructure),
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationEventsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the aggregatedNotificationEventArn to match.

        @[JSON::Field(key: "aggregateNotificationEventArn")]
        getter aggregate_notification_event_arn : String?

        # Latest time of events to return from this call.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Include aggregated child events in the result.

        @[JSON::Field(key: "includeChildEvents")]
        getter include_child_events : Bool?

        # The locale code of the language used for the retrieved NotificationEvent . The default locale is
        # English (en_US) .

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of results to be returned in this call. Defaults to 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The start token for paginated calls. Retrieved from the response of a previous ListEventRules call.
        # Next token uses Base64 encoding.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The unique identifier of the organizational unit used to filter notification events.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        # The matched event source. Must match one of the valid EventBridge sources. Only Amazon Web Services
        # service sourced events are supported. For example, aws.ec2 and aws.cloudwatch . For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "source")]
        getter source : String?

        # The earliest time of events to return from this call.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @aggregate_notification_event_arn : String? = nil,
          @end_time : Time? = nil,
          @include_child_events : Bool? = nil,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organizational_unit_id : String? = nil,
          @source : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListNotificationEventsResponse
        include JSON::Serializable

        # The list of notification events.

        @[JSON::Field(key: "notificationEvents")]
        getter notification_events : Array(Types::NotificationEventOverview)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @notification_events : Array(Types::NotificationEventOverview),
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationHubsRequest
        include JSON::Serializable

        # The maximum number of records to list in a single response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token. Set to null to start listing notification hubs from the start.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationHubsResponse
        include JSON::Serializable

        # The NotificationHubs in the account.

        @[JSON::Field(key: "notificationHubs")]
        getter notification_hubs : Array(Types::NotificationHubOverview)

        # A pagination token. If a non-null pagination token is returned in a result, pass its value in
        # another request to retrieve more entries.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @notification_hubs : Array(Types::NotificationHubOverview),
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationalUnitsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the notification configuration used to filter the organizational
        # units.

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # The maximum number of organizational units to return in a single call. Valid values are 1-100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results. Use the value returned in the previous response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @notification_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationalUnitsResponse
        include JSON::Serializable

        # The list of organizational units that match the specified criteria.

        @[JSON::Field(key: "organizationalUnits")]
        getter organizational_units : Array(String)

        # The token to use for the next page of results. If there are no additional results, this value is
        # null.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @organizational_units : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to list tags.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags for the specified ARN.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Provides a summary of channel associations for a managed notification configuration.

      struct ManagedNotificationChannelAssociationSummary
        include JSON::Serializable

        # The unique identifier for the notification channel.

        @[JSON::Field(key: "channelIdentifier")]
        getter channel_identifier : String

        # The type of notification channel used for message delivery. Values: ACCOUNT_CONTACT Delivers
        # notifications to Account Managed contacts through the User Notification Service. MOBILE Delivers
        # notifications through the Amazon Web Services Console Mobile Application to mobile devices. CHATBOT
        # Delivers notifications through Amazon Q Developer in chat applications to collaboration platforms
        # (Slack, Chime). EMAIL Delivers notifications to email addresses.

        @[JSON::Field(key: "channelType")]
        getter channel_type : String

        # Controls whether users can modify channel associations for a notification configuration. Values:
        # ENABLED Users can associate or disassociate channels with the notification configuration. DISABLED
        # Users cannot associate or disassociate channels with the notification configuration.

        @[JSON::Field(key: "overrideOption")]
        getter override_option : String?

        def initialize(
          @channel_identifier : String,
          @channel_type : String,
          @override_option : String? = nil
        )
        end
      end

      # A ManagedNotificationChildEvent is a notification-focused representation of an event. They contain
      # semantic information used to create aggregated or non-aggregated end-user notifications.

      struct ManagedNotificationChildEvent
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationEvent that is associated with this Managed
        # Notification Child Event.

        @[JSON::Field(key: "aggregateManagedNotificationEventArn")]
        getter aggregate_managed_notification_event_arn : String

        # The unique identifier for a Managed Notification Child Event.

        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "messageComponents")]
        getter message_components : Types::MessageComponents

        # The type of event causing the notification. Values: ALERT A notification about an event where
        # something was triggered, initiated, reopened, deployed, or a threshold was breached. WARNING A
        # notification about an event where an issue is about to arise. For example, something is approaching
        # a threshold. ANNOUNCEMENT A notification about an important event. For example, a step in a workflow
        # or escalation path or that a workflow was updated. INFORMATIONAL A notification about informational
        # messages. For example, recommendations, service announcements, or reminders.

        @[JSON::Field(key: "notificationType")]
        getter notification_type : String

        # The schema version of the Managed Notification Child Event.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # A list of text values.

        @[JSON::Field(key: "textParts")]
        getter text_parts : Hash(String, Types::TextPartValue)

        # Provides detailed information about the dimensions used for event summarization and aggregation.

        @[JSON::Field(key: "aggregationDetail")]
        getter aggregation_detail : Types::AggregationDetail?

        # The end time of the event.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The assesed nature of the event. Values: HEALTHY All EventRules are ACTIVE . UNHEALTHY Some
        # EventRules are ACTIVE and some are INACTIVE .

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        # The Organizational Unit Id that an Amazon Web Services account belongs to.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        # The source event URL.

        @[JSON::Field(key: "sourceEventDetailUrl")]
        getter source_event_detail_url : String?

        # The detailed URL for the source event.

        @[JSON::Field(key: "sourceEventDetailUrlDisplayText")]
        getter source_event_detail_url_display_text : String?

        # The notification event start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @aggregate_managed_notification_event_arn : String,
          @id : String,
          @message_components : Types::MessageComponents,
          @notification_type : String,
          @schema_version : String,
          @text_parts : Hash(String, Types::TextPartValue),
          @aggregation_detail : Types::AggregationDetail? = nil,
          @end_time : Time? = nil,
          @event_status : String? = nil,
          @organizational_unit_id : String? = nil,
          @source_event_detail_url : String? = nil,
          @source_event_detail_url_display_text : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Describes an overview and metadata for a ManagedNotificationChildEvent .

      struct ManagedNotificationChildEventOverview
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationEvent that is associated with this
        # ManagedNotificationChildEvent .

        @[JSON::Field(key: "aggregateManagedNotificationEventArn")]
        getter aggregate_managed_notification_event_arn : String

        # The Amazon Resource Name (ARN) of the ManagedNotificationChildEvent .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The content of the ManagedNotificationChildEvent .

        @[JSON::Field(key: "childEvent")]
        getter child_event : Types::ManagedNotificationChildEventSummary

        # The creation time of the ManagedNotificationChildEvent .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String

        # The account that related to the ManagedNotificationChildEvent .

        @[JSON::Field(key: "relatedAccount")]
        getter related_account : String

        # The Organizational Unit Id that an AWS account belongs to.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        def initialize(
          @aggregate_managed_notification_event_arn : String,
          @arn : String,
          @child_event : Types::ManagedNotificationChildEventSummary,
          @creation_time : Time,
          @managed_notification_configuration_arn : String,
          @related_account : String,
          @organizational_unit_id : String? = nil
        )
        end
      end

      # Describes a short summary and metadata for a ManagedNotificationChildEvent .

      struct ManagedNotificationChildEventSummary
        include JSON::Serializable

        # Provides detailed information about the dimensions used for event summarization and aggregation.

        @[JSON::Field(key: "aggregationDetail")]
        getter aggregation_detail : Types::AggregationDetail

        # The perceived nature of the event. Values: HEALTHY All EventRules are ACTIVE and any call can be
        # run. UNHEALTHY Some EventRules are ACTIVE and some are INACTIVE . Any call can be run.

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String


        @[JSON::Field(key: "messageComponents")]
        getter message_components : Types::MessageComponentsSummary

        # The Type of the event causing this notification. Values: ALERT A notification about an event where
        # something was triggered, initiated, reopened, deployed, or a threshold was breached. WARNING A
        # notification about an event where an issue is about to arise. For example, something is approaching
        # a threshold. ANNOUNCEMENT A notification about an important event. For example, a step in a workflow
        # or escalation path or that a workflow was updated. INFORMATIONAL A notification about informational
        # messages. For example, recommendations, service announcements, or reminders.

        @[JSON::Field(key: "notificationType")]
        getter notification_type : String

        # The schema version of the ManagedNotificationChildEvent .

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # Contains all event metadata present identically across all NotificationEvents . All fields are
        # present in Source Events via Eventbridge.

        @[JSON::Field(key: "sourceEventMetadata")]
        getter source_event_metadata : Types::ManagedSourceEventMetadataSummary

        def initialize(
          @aggregation_detail : Types::AggregationDetail,
          @event_status : String,
          @message_components : Types::MessageComponentsSummary,
          @notification_type : String,
          @schema_version : String,
          @source_event_metadata : Types::ManagedSourceEventMetadataSummary
        )
        end
      end

      # Describes the basic structure and properties of a ManagedNotificationConfiguration .

      struct ManagedNotificationConfigurationStructure
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The description of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @description : String,
          @name : String
        )
        end
      end

      # A notification-focused representation of an event. They contain semantic information used by
      # AccountContacts or Additional Channels to create end-user notifications.

      struct ManagedNotificationEvent
        include JSON::Serializable

        # Unique identifier for a ManagedNotificationEvent .

        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "messageComponents")]
        getter message_components : Types::MessageComponents

        # The nature of the event causing this notification. Values: ALERT A notification about an event where
        # something was triggered, initiated, reopened, deployed, or a threshold was breached. WARNING A
        # notification about an event where an issue is about to arise. For example, something is approaching
        # a threshold. ANNOUNCEMENT A notification about an important event. For example, a step in a workflow
        # or escalation path or that a workflow was updated. INFORMATIONAL A notification about informational
        # messages. For example, recommendations, service announcements, or reminders.

        @[JSON::Field(key: "notificationType")]
        getter notification_type : String

        # Version of the ManagedNotificationEvent schema.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # A list of text values.

        @[JSON::Field(key: "textParts")]
        getter text_parts : Hash(String, Types::TextPartValue)

        # The notifications aggregation type.

        @[JSON::Field(key: "aggregationEventType")]
        getter aggregation_event_type : String?


        @[JSON::Field(key: "aggregationSummary")]
        getter aggregation_summary : Types::AggregationSummary?

        # The end time of the notification event.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The status of an event. Values: HEALTHY All EventRules are ACTIVE and any call can be run. UNHEALTHY
        # Some EventRules are ACTIVE and some are INACTIVE . Any call can be run.

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        # The Organizational Unit Id that an Amazon Web Services account belongs to.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        # URL defined by Source Service to be used by notification consumers to get additional information
        # about event.

        @[JSON::Field(key: "sourceEventDetailUrl")]
        getter source_event_detail_url : String?

        # Text that needs to be hyperlinked with the sourceEventDetailUrl. For example, the description of the
        # sourceEventDetailUrl.

        @[JSON::Field(key: "sourceEventDetailUrlDisplayText")]
        getter source_event_detail_url_display_text : String?

        # The earliest time of events to return from this call.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @id : String,
          @message_components : Types::MessageComponents,
          @notification_type : String,
          @schema_version : String,
          @text_parts : Hash(String, Types::TextPartValue),
          @aggregation_event_type : String? = nil,
          @aggregation_summary : Types::AggregationSummary? = nil,
          @end_time : Time? = nil,
          @event_status : String? = nil,
          @organizational_unit_id : String? = nil,
          @source_event_detail_url : String? = nil,
          @source_event_detail_url_display_text : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Describes an overview and metadata for a ManagedNotificationEvent.

      struct ManagedNotificationEventOverview
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ManagedNotificationEvent.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation time of the ManagedNotificationEvent .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the ManagedNotificationConfiguration .

        @[JSON::Field(key: "managedNotificationConfigurationArn")]
        getter managed_notification_configuration_arn : String


        @[JSON::Field(key: "notificationEvent")]
        getter notification_event : Types::ManagedNotificationEventSummary

        # The account that related to the ManagedNotificationEvent .

        @[JSON::Field(key: "relatedAccount")]
        getter related_account : String

        # The list of the regions where the aggregated notifications in this NotificationEvent originated.

        @[JSON::Field(key: "aggregatedNotificationRegions")]
        getter aggregated_notification_regions : Array(String)?

        # The notifications aggregation type. Values: AGGREGATE The notification event is an aggregate
        # notification. Aggregate notifications summarize grouped events over a specified time period. CHILD
        # Some EventRules are ACTIVE and some are INACTIVE . Any call can be run. NONE The notification isn't
        # aggregated.

        @[JSON::Field(key: "aggregationEventType")]
        getter aggregation_event_type : String?


        @[JSON::Field(key: "aggregationSummary")]
        getter aggregation_summary : Types::AggregationSummary?

        # The Organizational Unit Id that an Amazon Web Services account belongs to.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @managed_notification_configuration_arn : String,
          @notification_event : Types::ManagedNotificationEventSummary,
          @related_account : String,
          @aggregated_notification_regions : Array(String)? = nil,
          @aggregation_event_type : String? = nil,
          @aggregation_summary : Types::AggregationSummary? = nil,
          @organizational_unit_id : String? = nil
        )
        end
      end

      # A short summary of a ManagedNotificationEvent . This is only used when listing managed notification
      # events.

      struct ManagedNotificationEventSummary
        include JSON::Serializable

        # The managed notification event status. Values: HEALTHY All EventRules are ACTIVE . UNHEALTHY Some
        # EventRules are ACTIVE and some are INACTIVE .

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String


        @[JSON::Field(key: "messageComponents")]
        getter message_components : Types::MessageComponentsSummary

        # The Type of event causing the notification. Values: ALERT A notification about an event where
        # something was triggered, initiated, reopened, deployed, or a threshold was breached. WARNING A
        # notification about an event where an issue is about to arise. For example, something is approaching
        # a threshold. ANNOUNCEMENT A notification about an important event. For example, a step in a workflow
        # or escalation path or that a workflow was updated. INFORMATIONAL A notification about informational
        # messages. For example, recommendations, service announcements, or reminders.

        @[JSON::Field(key: "notificationType")]
        getter notification_type : String

        # The schema version of the ManagedNotificationEvent .

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # Contains metadata about the event that caused the ManagedNotificationEvent .

        @[JSON::Field(key: "sourceEventMetadata")]
        getter source_event_metadata : Types::ManagedSourceEventMetadataSummary

        def initialize(
          @event_status : String,
          @message_components : Types::MessageComponentsSummary,
          @notification_type : String,
          @schema_version : String,
          @source_event_metadata : Types::ManagedSourceEventMetadataSummary
        )
        end
      end

      # A short summary and metadata for a managed notification event.

      struct ManagedSourceEventMetadataSummary
        include JSON::Serializable

        # The event Type of the notification.

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The source service of the notification. Must match one of the valid EventBridge sources. Only Amazon
        # Web Services service sourced events are supported. For example, aws.ec2 and aws.cloudwatch . For
        # more information, see Event delivery from Amazon Web Services services in the Amazon EventBridge
        # User Guide .

        @[JSON::Field(key: "source")]
        getter source : String

        # The Region where the notification originated.

        @[JSON::Field(key: "eventOriginRegion")]
        getter event_origin_region : String?

        def initialize(
          @event_type : String,
          @source : String,
          @event_origin_region : String? = nil
        )
        end
      end

      # Describes a media element.

      struct MediaElement
        include JSON::Serializable

        # The caption of the media.

        @[JSON::Field(key: "caption")]
        getter caption : String

        # The unique ID for the media.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String

        # The type of media.

        @[JSON::Field(key: "type")]
        getter type : String

        # The URL of the media.

        @[JSON::Field(key: "url")]
        getter url : String

        def initialize(
          @caption : String,
          @media_id : String,
          @type : String,
          @url : String
        )
        end
      end

      # Contains information about a member account.

      struct MemberAccount
        include JSON::Serializable

        # The AWS account ID of the member account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The unique identifier of the organizational unit containing the member account.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String

        # The current status of the member account.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the current status of the member account.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String

        # The Amazon Resource Name (ARN) of the notification configuration associated with the member account.

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String?

        def initialize(
          @account_id : String,
          @organizational_unit_id : String,
          @status : String,
          @status_reason : String,
          @notification_configuration_arn : String? = nil
        )
        end
      end

      # Describes the components of a notification message.

      struct MessageComponents
        include JSON::Serializable

        # A complete summary with all possible relevant information.

        @[JSON::Field(key: "completeDescription")]
        getter complete_description : String?

        # A list of properties in key-value pairs. Pairs are shown in order of importance from most important
        # to least important. Channels may limit the number of dimensions shown to the notification viewer.
        # Included dimensions, keys, and values are subject to change.

        @[JSON::Field(key: "dimensions")]
        getter dimensions : Array(Types::Dimension)?

        # A sentence long summary. For example, titles or an email subject line.

        @[JSON::Field(key: "headline")]
        getter headline : String?

        # A paragraph long or multiple sentence summary. For example, Amazon Q Developer in chat applications
        # notifications.

        @[JSON::Field(key: "paragraphSummary")]
        getter paragraph_summary : String?

        def initialize(
          @complete_description : String? = nil,
          @dimensions : Array(Types::Dimension)? = nil,
          @headline : String? = nil,
          @paragraph_summary : String? = nil
        )
        end
      end

      # Contains the headline message component.

      struct MessageComponentsSummary
        include JSON::Serializable

        # A sentence long summary. For example, titles or an email subject line.

        @[JSON::Field(key: "headline")]
        getter headline : String

        def initialize(
          @headline : String
        )
        end
      end

      # Contains the complete list of fields for a NotificationConfiguration.

      struct NotificationConfigurationStructure
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the NotificationConfiguration resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation time of the NotificationConfiguration .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The description of the NotificationConfiguration .

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the NotificationConfiguration . Supports RFC 3986's unreserved characters.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the NotificationConfiguration .

        @[JSON::Field(key: "status")]
        getter status : String

        # The aggregation preference of the NotificationConfiguration . Values: LONG Aggregate notifications
        # for long periods of time (12 hours). SHORT Aggregate notifications for short periods of time (5
        # minutes). NONE Don't aggregate notifications.

        @[JSON::Field(key: "aggregationDuration")]
        getter aggregation_duration : String?

        # The subtype of the notification configuration.

        @[JSON::Field(key: "subtype")]
        getter subtype : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @description : String,
          @name : String,
          @status : String,
          @aggregation_duration : String? = nil,
          @subtype : String? = nil
        )
        end
      end

      # A NotificationEvent is a notification-focused representation of an event. They contain semantic
      # information used by Channels to create end-user notifications.

      struct NotificationEvent
        include JSON::Serializable

        # The unique identifier for a NotificationEvent .

        @[JSON::Field(key: "id")]
        getter id : String

        # A list of media elements.

        @[JSON::Field(key: "media")]
        getter media : Array(Types::MediaElement)


        @[JSON::Field(key: "messageComponents")]
        getter message_components : Types::MessageComponents

        # The type of event causing the notification. Values: ALERT A notification about an event where
        # something was triggered, initiated, reopened, deployed, or a threshold was breached. WARNING A
        # notification about an event where an issue is about to arise. For example, something is approaching
        # a threshold. ANNOUNCEMENT A notification about an important event. For example, a step in a workflow
        # or escalation path or that a workflow was updated. INFORMATIONAL A notification about informational
        # messages. For example, recommendations, service announcements, or reminders.

        @[JSON::Field(key: "notificationType")]
        getter notification_type : String

        # The schema version of the Notification Event.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # The source event metadata.

        @[JSON::Field(key: "sourceEventMetadata")]
        getter source_event_metadata : Types::SourceEventMetadata

        # A list of text values.

        @[JSON::Field(key: "textParts")]
        getter text_parts : Hash(String, Types::TextPartValue)

        # If the value of aggregationEventType is not NONE , this is the Amazon Resource Event (ARN) of the
        # parent aggregate notification. This is omitted if notification isn't aggregated.

        @[JSON::Field(key: "aggregateNotificationEventArn")]
        getter aggregate_notification_event_arn : String?

        # The aggregation type of the NotificationConfiguration . Values: AGGREGATE The notification event is
        # an aggregate notification. Aggregate notifications summarize grouped events over a specified time
        # period. CHILD Some EventRules are ACTIVE and some are INACTIVE . Any call can be run. NONE The
        # notification isn't aggregated.

        @[JSON::Field(key: "aggregationEventType")]
        getter aggregation_event_type : String?

        # Provides additional information about how multiple notifications are grouped.

        @[JSON::Field(key: "aggregationSummary")]
        getter aggregation_summary : Types::AggregationSummary?

        # The end time of the event.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The assessed nature of the event. Values: HEALTHY All EventRules are ACTIVE and any call can be run.
        # UNHEALTHY Some EventRules are ACTIVE and some are INACTIVE . Any call can be run.

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        # The unique identifier of the organizational unit associated with the notification event.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        # The source event URL.

        @[JSON::Field(key: "sourceEventDetailUrl")]
        getter source_event_detail_url : String?

        # The detailed URL for the source event.

        @[JSON::Field(key: "sourceEventDetailUrlDisplayText")]
        getter source_event_detail_url_display_text : String?

        # The notification event start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @id : String,
          @media : Array(Types::MediaElement),
          @message_components : Types::MessageComponents,
          @notification_type : String,
          @schema_version : String,
          @source_event_metadata : Types::SourceEventMetadata,
          @text_parts : Hash(String, Types::TextPartValue),
          @aggregate_notification_event_arn : String? = nil,
          @aggregation_event_type : String? = nil,
          @aggregation_summary : Types::AggregationSummary? = nil,
          @end_time : Time? = nil,
          @event_status : String? = nil,
          @organizational_unit_id : String? = nil,
          @source_event_detail_url : String? = nil,
          @source_event_detail_url_display_text : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Describes a short summary of a NotificationEvent . This is only used when listing notification
      # events.

      struct NotificationEventOverview
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The creation time of the NotificationEvent .

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ARN of the NotificationConfiguration .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # Refers to a NotificationEventSummary object. Similar in structure to content in the
        # GetNotificationEvent response.

        @[JSON::Field(key: "notificationEvent")]
        getter notification_event : Types::NotificationEventSummary

        # The account name containing the NotificationHub .

        @[JSON::Field(key: "relatedAccount")]
        getter related_account : String

        # The ARN of the aggregatedNotificationEventArn to match.

        @[JSON::Field(key: "aggregateNotificationEventArn")]
        getter aggregate_notification_event_arn : String?

        # The NotificationConfiguration 's aggregation type. Values: AGGREGATE The notification event is an
        # aggregate notification. Aggregate notifications summarize grouped events over a specified time
        # period. CHILD Some EventRules are ACTIVE and some are INACTIVE . Any call can be run. NONE The
        # notification isn't aggregated.

        @[JSON::Field(key: "aggregationEventType")]
        getter aggregation_event_type : String?

        # Provides an aggregated summary data for notification events.

        @[JSON::Field(key: "aggregationSummary")]
        getter aggregation_summary : Types::AggregationSummary?

        # The unique identifier of the organizational unit in the notification event overview.

        @[JSON::Field(key: "organizationalUnitId")]
        getter organizational_unit_id : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @notification_configuration_arn : String,
          @notification_event : Types::NotificationEventSummary,
          @related_account : String,
          @aggregate_notification_event_arn : String? = nil,
          @aggregation_event_type : String? = nil,
          @aggregation_summary : Types::AggregationSummary? = nil,
          @organizational_unit_id : String? = nil
        )
        end
      end

      # Describes a short summary and metadata for a NotificationEvent .

      struct NotificationEventSummary
        include JSON::Serializable

        # Provides additional information about the current status of the NotificationEvent . Values: HEALTHY
        # All EventRules are ACTIVE . UNHEALTHY Some EventRules are ACTIVE and some are INACTIVE .

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String

        # The message components of a notification event.

        @[JSON::Field(key: "messageComponents")]
        getter message_components : Types::MessageComponentsSummary

        # The type of event causing the notification. Values: ALERT A notification about an event where
        # something was triggered, initiated, reopened, deployed, or a threshold was breached. WARNING A
        # notification about an event where an issue is about to arise. For example, something is approaching
        # a threshold. ANNOUNCEMENT A notification about an important event. For example, a step in a workflow
        # or escalation path or that a workflow was updated. INFORMATIONAL A notification about informational
        # messages. For example, recommendations, service announcements, or reminders.

        @[JSON::Field(key: "notificationType")]
        getter notification_type : String

        # The schema version of the Notification Event.

        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # The source event metadata.

        @[JSON::Field(key: "sourceEventMetadata")]
        getter source_event_metadata : Types::SourceEventMetadataSummary

        def initialize(
          @event_status : String,
          @message_components : Types::MessageComponentsSummary,
          @notification_type : String,
          @schema_version : String,
          @source_event_metadata : Types::SourceEventMetadataSummary
        )
        end
      end

      # Describes an overview of a NotificationHub . A NotificationConfiguration is an account-level setting
      # used to select the Regions where you want to store, process and replicate your notifications.

      struct NotificationHubOverview
        include JSON::Serializable

        # The date and time the NotificationHubOverview was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Region of the resource.

        @[JSON::Field(key: "notificationHubRegion")]
        getter notification_hub_region : String

        # The status summary of the resource.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Types::NotificationHubStatusSummary

        # The most recent time this NotificationHub had an ACTIVE status.

        @[JSON::Field(key: "lastActivationTime")]
        getter last_activation_time : Time?

        def initialize(
          @creation_time : Time,
          @notification_hub_region : String,
          @status_summary : Types::NotificationHubStatusSummary,
          @last_activation_time : Time? = nil
        )
        end
      end

      # Provides additional information about the current NotificationHub status.

      struct NotificationHubStatusSummary
        include JSON::Serializable

        # An explanation for the current status.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # Status information about the NotificationHub . Values: ACTIVE Incoming NotificationEvents are
        # replicated to this NotificationHub . REGISTERING The NotificationConfiguration is initializing. A
        # NotificationConfiguration with this status can't be deregistered. DEREGISTERING The
        # NotificationConfiguration is being deleted. You can't register additional NotificationHubs in the
        # same Region as a NotificationConfiguration with this status.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @reason : String,
          @status : String
        )
        end
      end

      # Orgs Service trust for User Notifications.

      struct NotificationsAccessForOrganization
        include JSON::Serializable

        # Access Status for the Orgs Service.

        @[JSON::Field(key: "accessStatus")]
        getter access_status : String

        def initialize(
          @access_status : String
        )
        end
      end


      struct RegisterNotificationHubRequest
        include JSON::Serializable

        # The Region of the NotificationHub .

        @[JSON::Field(key: "notificationHubRegion")]
        getter notification_hub_region : String

        def initialize(
          @notification_hub_region : String
        )
        end
      end


      struct RegisterNotificationHubResponse
        include JSON::Serializable

        # The date the resource was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Region of the NotificationHub .

        @[JSON::Field(key: "notificationHubRegion")]
        getter notification_hub_region : String

        # Provides additional information about the current NotificationConfiguration status information.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Types::NotificationHubStatusSummary

        # The date the resource was last activated.

        @[JSON::Field(key: "lastActivationTime")]
        getter last_activation_time : Time?

        def initialize(
          @creation_time : Time,
          @notification_hub_region : String,
          @status_summary : Types::NotificationHubStatusSummary,
          @last_activation_time : Time? = nil
        )
        end
      end

      # A resource affected by or closely linked to an event.

      struct Resource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. At least one id or ARN is required.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The URL to the resource's detail page. If a detail page URL is unavailable, it is the URL to an
        # informational page that describes the resource's type.

        @[JSON::Field(key: "detailUrl")]
        getter detail_url : String?

        # The unique identifier for the resource. At least one id or ARN is required.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Array(String)?

        def initialize(
          @arn : String? = nil,
          @detail_url : String? = nil,
          @id : String? = nil,
          @tags : Array(String)? = nil
        )
        end
      end

      # Request references a resource which does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that wasn't found.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_id : String
        )
        end
      end

      # Request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The type of the resource that exceeds the service quota.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The code for the service quota in Service Quotas .

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The ID of the resource that exceeds the service quota.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The code for the service quota exceeded in Service Quotas .

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @resource_type : String,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Describes the metadata for a source event. For more information, see Event structure reference in
      # the Amazon EventBridge User Guide .

      struct SourceEventMetadata
        include JSON::Serializable

        # The date and time the source event occurred. This is based on the Source Event.

        @[JSON::Field(key: "eventOccurrenceTime")]
        getter event_occurrence_time : Time

        # The type of event. For example, an Amazon CloudWatch state change.

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The version of the type of event.

        @[JSON::Field(key: "eventTypeVersion")]
        getter event_type_version : String

        # The primary Amazon Web Services account of SourceEvent .

        @[JSON::Field(key: "relatedAccount")]
        getter related_account : String

        # A list of resources related to this NotificationEvent .

        @[JSON::Field(key: "relatedResources")]
        getter related_resources : Array(Types::Resource)

        # The Amazon Web Services service the event originates from. For example aws.cloudwatch .

        @[JSON::Field(key: "source")]
        getter source : String

        # The source event id.

        @[JSON::Field(key: "sourceEventId")]
        getter source_event_id : String

        # The Region the event originated from.

        @[JSON::Field(key: "eventOriginRegion")]
        getter event_origin_region : String?

        def initialize(
          @event_occurrence_time : Time,
          @event_type : String,
          @event_type_version : String,
          @related_account : String,
          @related_resources : Array(Types::Resource),
          @source : String,
          @source_event_id : String,
          @event_origin_region : String? = nil
        )
        end
      end

      # Contains metadata about the event that caused the NotificationEvent . For other specific values, see
      # sourceEventMetadata .

      struct SourceEventMetadataSummary
        include JSON::Serializable

        # The event type to match. Must match one of the valid Amazon EventBridge event types. For example,
        # EC2 Instance State-change Notification and Amazon CloudWatch Alarm State Change. For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The matched event source. Must match one of the valid EventBridge sources. Only Amazon Web Services
        # service sourced events are supported. For example, aws.ec2 and aws.cloudwatch . For more
        # information, see Event delivery from Amazon Web Services services in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "source")]
        getter source : String

        # The Region where the notification originated. Unavailable for aggregated notifications.

        @[JSON::Field(key: "eventOriginRegion")]
        getter event_origin_region : String?

        def initialize(
          @event_type : String,
          @source : String,
          @event_origin_region : String? = nil
        )
        end
      end

      # Provides detailed information about the dimensions used for event summarization and aggregation.

      struct SummarizationDimensionDetail
        include JSON::Serializable

        # The name of the SummarizationDimensionDetail.

        @[JSON::Field(key: "name")]
        getter name : String

        # Value of the property used to summarize aggregated events.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Provides an overview of how data is summarized across different dimensions.

      struct SummarizationDimensionOverview
        include JSON::Serializable

        # Total number of occurrences for this dimension.

        @[JSON::Field(key: "count")]
        getter count : Int32

        # Name of the summarization dimension.

        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates the sample values found within the dimension.

        @[JSON::Field(key: "sampleValues")]
        getter sample_values : Array(String)?

        def initialize(
          @count : Int32,
          @name : String,
          @sample_values : Array(String)? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to tag a resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # A map of tags assigned to a resource. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes text information objects containing fields that determine how text part objects are
      # composed.

      struct TextPartValue
        include JSON::Serializable

        # The type of text part. Determines the usage of all other fields and whether or not they're required.

        @[JSON::Field(key: "type")]
        getter type : String

        # A short single line description of the link. Must be hyper-linked with the URL itself. Used for text
        # parts with the type URL .

        @[JSON::Field(key: "displayText")]
        getter display_text : String?

        # A map of locales to the text in that locale.

        @[JSON::Field(key: "textByLocale")]
        getter text_by_locale : Hash(String, String)?

        # The URL itself.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @type : String,
          @display_text : String? = nil,
          @text_by_locale : Hash(String, String)? = nil,
          @url : String? = nil
        )
        end
      end

      # Request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Identifies the quota that is being throttled.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds a client should wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # Identifies the service being throttled.

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

        # The Amazon Resource Name (ARN) to use to untag a resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The tag keys to use to untag a resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateEventRuleRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to update the EventRule .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # An additional event pattern used to further filter the events this EventRule receives. For more
        # information, see Amazon EventBridge event patterns in the Amazon EventBridge User Guide.

        @[JSON::Field(key: "eventPattern")]
        getter event_pattern : String?

        # A list of Amazon Web Services Regions that sends events to this EventRule .

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        def initialize(
          @arn : String,
          @event_pattern : String? = nil,
          @regions : Array(String)? = nil
        )
        end
      end


      struct UpdateEventRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to use to update the EventRule .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ARN of the NotificationConfiguration .

        @[JSON::Field(key: "notificationConfigurationArn")]
        getter notification_configuration_arn : String

        # The status of the action by Region.

        @[JSON::Field(key: "statusSummaryByRegion")]
        getter status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)

        def initialize(
          @arn : String,
          @notification_configuration_arn : String,
          @status_summary_by_region : Hash(String, Types::EventRuleStatusSummary)
        )
        end
      end


      struct UpdateNotificationConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) used to update the NotificationConfiguration .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The aggregation preference of the NotificationConfiguration . Values: LONG Aggregate notifications
        # for long periods of time (12 hours). SHORT Aggregate notifications for short periods of time (5
        # minutes). NONE Don't aggregate notifications.

        @[JSON::Field(key: "aggregationDuration")]
        getter aggregation_duration : String?

        # The description of the NotificationConfiguration .

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the NotificationConfiguration .

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @aggregation_duration : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateNotificationConfigurationResponse
        include JSON::Serializable

        # The ARN used to update the NotificationConfiguration .

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # This exception is thrown when the notification event fails validation.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The list of input fields that are invalid.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        # The reason why your input is considered invalid.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message with the reason for the validation exception error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The field name where the invalid entry was detected.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
