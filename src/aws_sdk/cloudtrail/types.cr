require "json"
require "time"

module AwsSdk
  module CloudTrail
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when you start a new import and a previous import is still in progress.

      struct AccountHasOngoingImportException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified account is not found or not part of an organization.

      struct AccountNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified account is not registered as the CloudTrail delegated
      # administrator.

      struct AccountNotRegisteredException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the account is already registered as the CloudTrail delegated
      # administrator.

      struct AccountRegisteredException
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the tags to add to a trail, event data store, dashboard, or channel.

      struct AddTagsRequest
        include JSON::Serializable

        # Specifies the ARN of the trail, event data store, dashboard, or channel to which one or more tags
        # will be added. The format of a trail ARN is: arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail
        # The format of an event data store ARN is:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE The
        # format of a dashboard ARN is: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash The
        # format of a channel ARN is: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Contains a list of tags, up to a limit of 50

        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tags_list : Array(Types::Tag)
        )
        end
      end

      # Returns the objects or data if successful. Otherwise, returns an error.

      struct AddTagsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Advanced event selectors let you create fine-grained selectors for CloudTrail management, data, and
      # network activity events. They help you control costs by logging only those events that are important
      # to you. For more information about configuring advanced event selectors, see the Logging data events
      # , Logging network activity events , and Logging management events topics in the CloudTrail User
      # Guide . You cannot apply both event selectors and advanced event selectors to a trail. For
      # information about configurable advanced event selector fields, see AdvancedEventSelector in the
      # CloudTrail API Reference .

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

      # A single selector statement in an advanced event selector.

      struct AdvancedFieldSelector
        include JSON::Serializable

        # A field in a CloudTrail event record on which to filter events to be logged. For event data stores
        # for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or events
        # outside of Amazon Web Services, the field is used only for selecting events as filtering is not
        # supported. For more information, see AdvancedFieldSelector in the CloudTrail API Reference .
        # Selectors don't support the use of wildcards like * . To match multiple values with a single
        # condition, you may use StartsWith , EndsWith , NotStartsWith , or NotEndsWith to explicitly match
        # the beginning or end of the event field.

        @[JSON::Field(key: "Field")]
        getter field : String

        # An operator that includes events that match the last few characters of the event record field
        # specified as the value of Field .

        @[JSON::Field(key: "EndsWith")]
        getter ends_with : Array(String)?

        # An operator that includes events that match the exact value of the event record field specified as
        # the value of Field . This is the only valid operator that you can use with the readOnly ,
        # eventCategory , and resources.type fields.

        @[JSON::Field(key: "Equals")]
        getter equals : Array(String)?

        # An operator that excludes events that match the last few characters of the event record field
        # specified as the value of Field .

        @[JSON::Field(key: "NotEndsWith")]
        getter not_ends_with : Array(String)?

        # An operator that excludes events that match the exact value of the event record field specified as
        # the value of Field .

        @[JSON::Field(key: "NotEquals")]
        getter not_equals : Array(String)?

        # An operator that excludes events that match the first few characters of the event record field
        # specified as the value of Field .

        @[JSON::Field(key: "NotStartsWith")]
        getter not_starts_with : Array(String)?

        # An operator that includes events that match the first few characters of the event record field
        # specified as the value of Field .

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

      # An object that contains configuration settings for aggregating events.

      struct AggregationConfiguration
        include JSON::Serializable

        # Specifies the event category for which aggregation should be performed.

        @[JSON::Field(key: "EventCategory")]
        getter event_category : String

        # A list of aggregation templates that can be used to configure event aggregation.

        @[JSON::Field(key: "Templates")]
        getter templates : Array(String)

        def initialize(
          @event_category : String,
          @templates : Array(String)
        )
        end
      end


      struct CancelQueryRequest
        include JSON::Serializable

        # The ID of the query that you want to cancel. The QueryId comes from the response of a StartQuery
        # operation.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # The ARN (or the ID suffix of the ARN) of an event data store on which the specified query is
        # running.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String?

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        def initialize(
          @query_id : String,
          @event_data_store : String? = nil,
          @event_data_store_owner_account_id : String? = nil
        )
        end
      end


      struct CancelQueryResponse
        include JSON::Serializable

        # The ID of the canceled query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # Shows the status of a query after a CancelQuery request. Typically, the values shown are either
        # RUNNING or CANCELLED .

        @[JSON::Field(key: "QueryStatus")]
        getter query_status : String

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        def initialize(
          @query_id : String,
          @query_status : String,
          @event_data_store_owner_account_id : String? = nil
        )
        end
      end

      # This exception is thrown when the management account of an organization is registered as the
      # CloudTrail delegated administrator.

      struct CannotDelegateManagementAccountException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a returned CloudTrail channel.

      struct Channel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a channel.

        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The name of the CloudTrail channel. For service-linked channels, the name is
        # aws-service-channel/service-name/custom-suffix where service-name represents the name of the Amazon
        # Web Services service that created the channel and custom-suffix represents the suffix created by the
        # Amazon Web Services service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @channel_arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # This exception is thrown when the specified value of ChannelARN is not valid.

      struct ChannelARNInvalidException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided channel already exists.

      struct ChannelAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified event data store cannot yet be deleted because it is in
      # use by a channel.

      struct ChannelExistsForEDSException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the maximum number of channels limit is exceeded.

      struct ChannelMaxLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when CloudTrail cannot find the specified channel.

      struct ChannelNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when an operation is called with an ARN that is not valid. The following is
      # the format of a trail ARN: arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail The following is
      # the format of an event data store ARN:
      # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE The
      # following is the format of a dashboard ARN:
      # arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash The following is the format of a
      # channel ARN: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

      struct CloudTrailARNInvalidException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when trusted access has not been enabled between CloudTrail and
      # Organizations. For more information, see How to enable or disable trusted access in the
      # Organizations User Guide and Prepare For Creating a Trail For Your Organization in the CloudTrail
      # User Guide .

      struct CloudTrailAccessNotEnabledException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when a call results in the InvalidClientTokenId error code. This can occur
      # when you are creating or updating a trail to send notifications to an Amazon SNS topic that is in a
      # suspended Amazon Web Services account.

      struct CloudTrailInvalidClientTokenIdException
        include JSON::Serializable

        def initialize
        end
      end

      # Cannot set a CloudWatch Logs delivery for this Region.

      struct CloudWatchLogsDeliveryUnavailableException
        include JSON::Serializable

        def initialize
        end
      end

      # You are trying to update a resource when another request is in progress. Allow sufficient wait time
      # for the previous request to complete, then retry your request.

      struct ConcurrentModificationException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified resource is not ready for an operation. This can occur
      # when you try to run an operation on a resource before CloudTrail has time to fully load the
      # resource, or because another operation is modifying the resource. If this exception occurs, wait a
      # few minutes, and then try the operation again.

      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that contains information types to be included in CloudTrail enriched events.

      struct ContextKeySelector
        include JSON::Serializable

        # A list of keys defined by Type to be included in CloudTrail enriched events.

        @[JSON::Field(key: "Equals")]
        getter equals : Array(String)

        # Specifies the type of the event record field in ContextKeySelector. Valid values include
        # RequestContext, TagContext.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @equals : Array(String),
          @type : String
        )
        end
      end


      struct CreateChannelRequest
        include JSON::Serializable

        # One or more event data stores to which events arriving through a channel will be logged.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Destination)

        # The name of the channel.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the partner or external event source. You cannot change this name after you create the
        # channel. A maximum of one channel is allowed per source. A source can be either Custom for all valid
        # non-Amazon Web Services events, or the name of a partner event source. For information about the
        # source names for available partners, see Additional information about integration partners in the
        # CloudTrail User Guide.

        @[JSON::Field(key: "Source")]
        getter source : String


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destinations : Array(Types::Destination),
          @name : String,
          @source : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateChannelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new channel.

        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The event data stores that log the events arriving through the channel.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Destination)?

        # The name of the new channel.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The partner or external event source name.

        @[JSON::Field(key: "Source")]
        getter source : String?


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @channel_arn : String? = nil,
          @destinations : Array(Types::Destination)? = nil,
          @name : String? = nil,
          @source : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDashboardRequest
        include JSON::Serializable

        # The name of the dashboard. The name must be unique to your account. To create the Highlights
        # dashboard, the name must be AWSCloudTrail-Highlights .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The refresh schedule configuration for the dashboard. To create the Highlights dashboard, you must
        # set a refresh schedule and set the Status to ENABLED . The Unit for the refresh schedule must be
        # HOURS and the Value must be 6 .

        @[JSON::Field(key: "RefreshSchedule")]
        getter refresh_schedule : Types::RefreshSchedule?


        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)?

        # Specifies whether termination protection is enabled for the dashboard. If termination protection is
        # enabled, you cannot delete the dashboard until termination protection is disabled.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # An array of widgets for a custom dashboard. A custom dashboard can have a maximum of ten widgets.
        # You do not need to specify widgets for the Highlights dashboard.

        @[JSON::Field(key: "Widgets")]
        getter widgets : Array(Types::RequestWidget)?

        def initialize(
          @name : String,
          @refresh_schedule : Types::RefreshSchedule? = nil,
          @tags_list : Array(Types::Tag)? = nil,
          @termination_protection_enabled : Bool? = nil,
          @widgets : Array(Types::RequestWidget)? = nil
        )
        end
      end


      struct CreateDashboardResponse
        include JSON::Serializable

        # The ARN for the dashboard.

        @[JSON::Field(key: "DashboardArn")]
        getter dashboard_arn : String?

        # The name of the dashboard.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The refresh schedule for the dashboard, if configured.

        @[JSON::Field(key: "RefreshSchedule")]
        getter refresh_schedule : Types::RefreshSchedule?


        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)?

        # Indicates whether termination protection is enabled for the dashboard.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # The dashboard type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # An array of widgets for the dashboard.

        @[JSON::Field(key: "Widgets")]
        getter widgets : Array(Types::Widget)?

        def initialize(
          @dashboard_arn : String? = nil,
          @name : String? = nil,
          @refresh_schedule : Types::RefreshSchedule? = nil,
          @tags_list : Array(Types::Tag)? = nil,
          @termination_protection_enabled : Bool? = nil,
          @type : String? = nil,
          @widgets : Array(Types::Widget)? = nil
        )
        end
      end


      struct CreateEventDataStoreRequest
        include JSON::Serializable

        # The name of the event data store.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The advanced event selectors to use to select the events for the data store. You can configure up to
        # five advanced event selectors for each event data store. For more information about how to use
        # advanced event selectors to log CloudTrail events, see Log events by using advanced event selectors
        # in the CloudTrail User Guide. For more information about how to use advanced event selectors to
        # include Config configuration items in your event data store, see Create an event data store for
        # Config configuration items in the CloudTrail User Guide. For more information about how to use
        # advanced event selectors to include events outside of Amazon Web Services events in your event data
        # store, see Create an integration to log events from outside Amazon Web Services in the CloudTrail
        # User Guide.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # The billing mode for the event data store determines the cost for ingesting events and the default
        # and maximum retention period for the event data store. The following are the possible values:
        # EXTENDABLE_RETENTION_PRICING - This billing mode is generally recommended if you want a flexible
        # retention period of up to 3653 days (about 10 years). The default retention period for this billing
        # mode is 366 days. FIXED_RETENTION_PRICING - This billing mode is recommended if you expect to ingest
        # more than 25 TB of event data per month and need a retention period of up to 2557 days (about 7
        # years). The default retention period for this billing mode is 2557 days. The default value is
        # EXTENDABLE_RETENTION_PRICING . For more information about CloudTrail pricing, see CloudTrail Pricing
        # and Managing CloudTrail Lake costs .

        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # Specifies the KMS key ID to use to encrypt the events delivered by CloudTrail. The value can be an
        # alias name prefixed by alias/ , a fully specified ARN to an alias, a fully specified ARN to a key,
        # or a globally unique identifier. Disabling or deleting the KMS key, or removing CloudTrail
        # permissions on the key, prevents CloudTrail from logging events to the event data store, and
        # prevents users from querying the data in the event data store that was encrypted with the key. After
        # you associate an event data store with a KMS key, the KMS key cannot be removed or changed. Before
        # you disable or delete a KMS key that you are using with an event data store, delete or back up your
        # event data store. CloudTrail also supports KMS multi-Region keys. For more information about
        # multi-Region keys, see Using multi-Region keys in the Key Management Service Developer Guide .
        # Examples: alias/MyAliasName arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether the event data store includes events from all Regions, or only from the Region in
        # which the event data store is created.

        @[JSON::Field(key: "MultiRegionEnabled")]
        getter multi_region_enabled : Bool?

        # Specifies whether an event data store collects events logged for an organization in Organizations.

        @[JSON::Field(key: "OrganizationEnabled")]
        getter organization_enabled : Bool?

        # The retention period of the event data store, in days. If BillingMode is set to
        # EXTENDABLE_RETENTION_PRICING , you can set a retention period of up to 3653 days, the equivalent of
        # 10 years. If BillingMode is set to FIXED_RETENTION_PRICING , you can set a retention period of up to
        # 2557 days, the equivalent of seven years. CloudTrail Lake determines whether to retain an event by
        # checking if the eventTime of the event is within the specified retention period. For example, if you
        # set a retention period of 90 days, CloudTrail will remove events when the eventTime is older than 90
        # days. If you plan to copy trail events to this event data store, we recommend that you consider both
        # the age of the events that you want to copy as well as how long you want to keep the copied events
        # in your event data store. For example, if you copy trail events that are 5 years old and specify a
        # retention period of 7 years, the event data store will retain those events for two years.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # Specifies whether the event data store should start ingesting live events. The default is true.

        @[JSON::Field(key: "StartIngestion")]
        getter start_ingestion : Bool?


        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)?

        # Specifies whether termination protection is enabled for the event data store. If termination
        # protection is enabled, you cannot delete the event data store until termination protection is
        # disabled.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        def initialize(
          @name : String,
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @billing_mode : String? = nil,
          @kms_key_id : String? = nil,
          @multi_region_enabled : Bool? = nil,
          @organization_enabled : Bool? = nil,
          @retention_period : Int32? = nil,
          @start_ingestion : Bool? = nil,
          @tags_list : Array(Types::Tag)? = nil,
          @termination_protection_enabled : Bool? = nil
        )
        end
      end


      struct CreateEventDataStoreResponse
        include JSON::Serializable

        # The advanced event selectors that were used to select the events for the data store.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # The billing mode for the event data store.

        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # The timestamp that shows when the event data store was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN of the event data store.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully
        # specified ARN to a KMS key in the following format.
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Indicates whether the event data store collects events from all Regions, or only from the Region in
        # which it was created.

        @[JSON::Field(key: "MultiRegionEnabled")]
        getter multi_region_enabled : Bool?

        # The name of the event data store.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether an event data store is collecting logged events for an organization in
        # Organizations.

        @[JSON::Field(key: "OrganizationEnabled")]
        getter organization_enabled : Bool?

        # The retention period of an event data store, in days.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # The status of event data store creation.

        @[JSON::Field(key: "Status")]
        getter status : String?


        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)?

        # Indicates whether termination protection is enabled for the event data store.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # The timestamp that shows when an event data store was updated, if applicable. UpdatedTimestamp is
        # always either the same or newer than the time shown in CreatedTimestamp .

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @billing_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @event_data_store_arn : String? = nil,
          @kms_key_id : String? = nil,
          @multi_region_enabled : Bool? = nil,
          @name : String? = nil,
          @organization_enabled : Bool? = nil,
          @retention_period : Int32? = nil,
          @status : String? = nil,
          @tags_list : Array(Types::Tag)? = nil,
          @termination_protection_enabled : Bool? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # Specifies the settings for each trail.

      struct CreateTrailRequest
        include JSON::Serializable

        # Specifies the name of the trail. The name must meet the following requirements: Contain only ASCII
        # letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-) Start with a letter
        # or number, and end with a letter or number Be between 3 and 128 characters Have no adjacent periods,
        # underscores or dashes. Names like my-_namespace and my--namespace are not valid. Not be in IP
        # address format (for example, 192.168.5.4)

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the name of the Amazon S3 bucket designated for publishing log files. For information
        # about bucket naming rules, see Bucket naming rules in the Amazon Simple Storage Service User Guide .

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # Specifies a log group name using an Amazon Resource Name (ARN), a unique identifier that represents
        # the log group to which CloudTrail logs will be delivered. You must use a log group that exists in
        # your account. Not required unless you specify CloudWatchLogsRoleArn .

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String?

        # Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group. You
        # must use a role that exists in your account.

        @[JSON::Field(key: "CloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String?

        # Specifies whether log file integrity validation is enabled. The default is false. When you disable
        # log file integrity validation, the chain of digest files is broken after one hour. CloudTrail does
        # not create digest files for log files that were delivered during a period in which log file
        # integrity validation was disabled. For example, if you enable log file integrity validation at noon
        # on January 1, disable it at noon on January 2, and re-enable it at noon on January 10, digest files
        # will not be created for the log files delivered from noon on January 2 to noon on January 10. The
        # same applies whenever you stop CloudTrail logging or delete a trail.

        @[JSON::Field(key: "EnableLogFileValidation")]
        getter enable_log_file_validation : Bool?

        # Specifies whether the trail is publishing events from global services such as IAM to the log files.

        @[JSON::Field(key: "IncludeGlobalServiceEvents")]
        getter include_global_service_events : Bool?

        # Specifies whether the trail is created in the current Region or in all Regions. The default is
        # false, which creates a trail only in the Region where you are signed in. As a best practice,
        # consider creating trails that log events in all Regions.

        @[JSON::Field(key: "IsMultiRegionTrail")]
        getter is_multi_region_trail : Bool?

        # Specifies whether the trail is created for all accounts in an organization in Organizations, or only
        # for the current Amazon Web Services account. The default is false, and cannot be true unless the
        # call is made on behalf of an Amazon Web Services account that is the management account or delegated
        # administrator account for an organization in Organizations.

        @[JSON::Field(key: "IsOrganizationTrail")]
        getter is_organization_trail : Bool?

        # Specifies the KMS key ID to use to encrypt the logs and digest files delivered by CloudTrail. The
        # value can be an alias name prefixed by alias/ , a fully specified ARN to an alias, a fully specified
        # ARN to a key, or a globally unique identifier. CloudTrail also supports KMS multi-Region keys. For
        # more information about multi-Region keys, see Using multi-Region keys in the Key Management Service
        # Developer Guide . Examples: alias/MyAliasName arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for
        # log file delivery. For more information, see Finding Your CloudTrail Log Files . The maximum length
        # is 200 characters.

        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        # Specifies the name or ARN of the Amazon SNS topic defined for notification of log file delivery. The
        # maximum length is 256 characters.

        @[JSON::Field(key: "SnsTopicName")]
        getter sns_topic_name : String?


        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)?

        def initialize(
          @name : String,
          @s3_bucket_name : String,
          @cloud_watch_logs_log_group_arn : String? = nil,
          @cloud_watch_logs_role_arn : String? = nil,
          @enable_log_file_validation : Bool? = nil,
          @include_global_service_events : Bool? = nil,
          @is_multi_region_trail : Bool? = nil,
          @is_organization_trail : Bool? = nil,
          @kms_key_id : String? = nil,
          @s3_key_prefix : String? = nil,
          @sns_topic_name : String? = nil,
          @tags_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct CreateTrailResponse
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the log group to which CloudTrail logs will be
        # delivered.

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String?

        # Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.

        @[JSON::Field(key: "CloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String?

        # Specifies whether the trail is publishing events from global services such as IAM to the log files.

        @[JSON::Field(key: "IncludeGlobalServiceEvents")]
        getter include_global_service_events : Bool?

        # Specifies whether the trail exists in one Region or in all Regions.

        @[JSON::Field(key: "IsMultiRegionTrail")]
        getter is_multi_region_trail : Bool?

        # Specifies whether the trail is an organization trail.

        @[JSON::Field(key: "IsOrganizationTrail")]
        getter is_organization_trail : Bool?

        # Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully
        # specified ARN to a KMS key in the following format.
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether log file integrity validation is enabled.

        @[JSON::Field(key: "LogFileValidationEnabled")]
        getter log_file_validation_enabled : Bool?

        # Specifies the name of the trail.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the name of the Amazon S3 bucket designated for publishing log files.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for
        # log file delivery. For more information, see Finding Your CloudTrail Log Files .

        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        # Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files
        # are delivered. The format of a topic ARN is: arn:aws:sns:us-east-2:123456789012:MyTopic

        @[JSON::Field(key: "SnsTopicARN")]
        getter sns_topic_arn : String?

        # This field is no longer in use. Use SnsTopicARN .

        @[JSON::Field(key: "SnsTopicName")]
        getter sns_topic_name : String?

        # Specifies the ARN of the trail that was created. The format of a trail ARN is:
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @cloud_watch_logs_log_group_arn : String? = nil,
          @cloud_watch_logs_role_arn : String? = nil,
          @include_global_service_events : Bool? = nil,
          @is_multi_region_trail : Bool? = nil,
          @is_organization_trail : Bool? = nil,
          @kms_key_id : String? = nil,
          @log_file_validation_enabled : Bool? = nil,
          @name : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_key_prefix : String? = nil,
          @sns_topic_arn : String? = nil,
          @sns_topic_name : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end

      # Provides information about a CloudTrail Lake dashboard.

      struct DashboardDetail
        include JSON::Serializable

        # The ARN for the dashboard.

        @[JSON::Field(key: "DashboardArn")]
        getter dashboard_arn : String?

        # The type of dashboard.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @dashboard_arn : String? = nil,
          @type : String? = nil
        )
        end
      end

      # You can configure the DataResource in an EventSelector to log data events for the following three
      # resource types: AWS::DynamoDB::Table AWS::Lambda::Function AWS::S3::Object To log data events for
      # all other resource types including objects stored in directory buckets , you must use
      # AdvancedEventSelectors . You must also use AdvancedEventSelectors if you want to filter on the
      # eventName field. Configure the DataResource to specify the resource type and resource ARNs for which
      # you want to log data events. The total number of allowed data resources is 250. This number can be
      # distributed between 1 and 5 event selectors, but the total cannot exceed 250 across all selectors
      # for the trail. The following example demonstrates how logging works when you configure logging of
      # all data events for a general purpose bucket named amzn-s3-demo-bucket1 . In this example, the
      # CloudTrail user specified an empty prefix, and the option to log both Read and Write data events. A
      # user uploads an image file to amzn-s3-demo-bucket1 . The PutObject API operation is an Amazon S3
      # object-level API. It is recorded as a data event in CloudTrail. Because the CloudTrail user
      # specified an S3 bucket with an empty prefix, events that occur on any object in that bucket are
      # logged. The trail processes and logs the event. A user uploads an object to an Amazon S3 bucket
      # named arn:aws:s3:::amzn-s3-demo-bucket1 . The PutObject API operation occurred for an object in an
      # S3 bucket that the CloudTrail user didn't specify for the trail. The trail doesn’t log the event.
      # The following example demonstrates how logging works when you configure logging of Lambda data
      # events for a Lambda function named MyLambdaFunction , but not for all Lambda functions. A user runs
      # a script that includes a call to the MyLambdaFunction function and the MyOtherLambdaFunction
      # function. The Invoke API operation on MyLambdaFunction is an Lambda API. It is recorded as a data
      # event in CloudTrail. Because the CloudTrail user specified logging data events for MyLambdaFunction
      # , any invocations of that function are logged. The trail processes and logs the event. The Invoke
      # API operation on MyOtherLambdaFunction is an Lambda API. Because the CloudTrail user did not specify
      # logging data events for all Lambda functions, the Invoke operation for MyOtherLambdaFunction does
      # not match the function specified for the trail. The trail doesn’t log the event.

      struct DataResource
        include JSON::Serializable

        # The resource type in which you want to log data events. You can specify the following basic event
        # selector resource types: AWS::DynamoDB::Table AWS::Lambda::Function AWS::S3::Object Additional
        # resource types are available through advanced event selectors. For more information, see
        # AdvancedEventSelector .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # An array of Amazon Resource Name (ARN) strings or partial ARN strings for the specified resource
        # type. To log data events for all objects in all S3 buckets in your Amazon Web Services account,
        # specify the prefix as arn:aws:s3 . This also enables logging of data event activity performed by any
        # user or role in your Amazon Web Services account, even if that activity is performed on a bucket
        # that belongs to another Amazon Web Services account. To log data events for all objects in an S3
        # bucket, specify the bucket and an empty object prefix such as arn:aws:s3:::amzn-s3-demo-bucket1/ .
        # The trail logs data events for all objects in this S3 bucket. To log data events for specific
        # objects, specify the S3 bucket and object prefix such as
        # arn:aws:s3:::amzn-s3-demo-bucket1/example-images . The trail logs data events for objects in this S3
        # bucket that match the prefix. To log data events for all Lambda functions in your Amazon Web
        # Services account, specify the prefix as arn:aws:lambda . This also enables logging of Invoke
        # activity performed by any user or role in your Amazon Web Services account, even if that activity is
        # performed on a function that belongs to another Amazon Web Services account. To log data events for
        # a specific Lambda function, specify the function ARN. Lambda function ARNs are exact. For example,
        # if you specify a function ARN arn:aws:lambda:us-west-2:111111111111:function:helloworld , data
        # events will only be logged for arn:aws:lambda:us-west-2:111111111111:function:helloworld . They will
        # not be logged for arn:aws:lambda:us-west-2:111111111111:function:helloworld2 . To log data events
        # for all DynamoDB tables in your Amazon Web Services account, specify the prefix as arn:aws:dynamodb
        # .

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @type : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # This exception is thrown when the maximum number of CloudTrail delegated administrators is reached.

      struct DelegatedAdminAccountLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteChannelRequest
        include JSON::Serializable

        # The ARN or the UUID value of the channel that you want to delete.

        @[JSON::Field(key: "Channel")]
        getter channel : String

        def initialize(
          @channel : String
        )
        end
      end


      struct DeleteChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDashboardRequest
        include JSON::Serializable

        # The name or ARN for the dashboard.

        @[JSON::Field(key: "DashboardId")]
        getter dashboard_id : String

        def initialize(
          @dashboard_id : String
        )
        end
      end


      struct DeleteDashboardResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEventDataStoreRequest
        include JSON::Serializable

        # The ARN (or the ID suffix of the ARN) of the event data store to delete.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        def initialize(
          @event_data_store : String
        )
        end
      end


      struct DeleteEventDataStoreResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel you're
        # deleting the resource-based policy from. Example event data store ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE Example
        # dashboard ARN format: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash Example
        # channel ARN format: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request that specifies the name of a trail to delete.

      struct DeleteTrailRequest
        include JSON::Serializable

        # Specifies the name or the CloudTrail ARN of the trail to be deleted. The following is the format of
        # a trail ARN. arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct DeleteTrailResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Removes CloudTrail delegated administrator permissions from a specified member account in an
      # organization that is currently designated as a delegated administrator.

      struct DeregisterOrganizationDelegatedAdminRequest
        include JSON::Serializable

        # A delegated administrator account ID. This is a member account in an organization that is currently
        # designated as a delegated administrator.

        @[JSON::Field(key: "DelegatedAdminAccountId")]
        getter delegated_admin_account_id : String

        def initialize(
          @delegated_admin_account_id : String
        )
        end
      end

      # Returns the following response if successful. Otherwise, returns an error.

      struct DeregisterOrganizationDelegatedAdminResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeQueryRequest
        include JSON::Serializable

        # The ARN (or the ID suffix of the ARN) of an event data store on which the specified query was run.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String?

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        # The alias that identifies a query template.

        @[JSON::Field(key: "QueryAlias")]
        getter query_alias : String?

        # The query ID.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The ID of the dashboard refresh.

        @[JSON::Field(key: "RefreshId")]
        getter refresh_id : String?

        def initialize(
          @event_data_store : String? = nil,
          @event_data_store_owner_account_id : String? = nil,
          @query_alias : String? = nil,
          @query_id : String? = nil,
          @refresh_id : String? = nil
        )
        end
      end


      struct DescribeQueryResponse
        include JSON::Serializable

        # The URI for the S3 bucket where CloudTrail delivered query results, if applicable.

        @[JSON::Field(key: "DeliveryS3Uri")]
        getter delivery_s3_uri : String?

        # The delivery status.

        @[JSON::Field(key: "DeliveryStatus")]
        getter delivery_status : String?

        # The error message returned if a query failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        # The prompt used for a generated query. For information about generated queries, see Create
        # CloudTrail Lake queries from natural language prompts in the CloudTrail user guide.

        @[JSON::Field(key: "Prompt")]
        getter prompt : String?

        # The ID of the query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # Metadata about a query, including the number of events that were matched, the total number of events
        # scanned, the query run time in milliseconds, and the query's creation time.

        @[JSON::Field(key: "QueryStatistics")]
        getter query_statistics : Types::QueryStatisticsForDescribeQuery?

        # The status of a query. Values for QueryStatus include QUEUED , RUNNING , FINISHED , FAILED ,
        # TIMED_OUT , or CANCELLED

        @[JSON::Field(key: "QueryStatus")]
        getter query_status : String?

        # The SQL code of a query.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String?

        def initialize(
          @delivery_s3_uri : String? = nil,
          @delivery_status : String? = nil,
          @error_message : String? = nil,
          @event_data_store_owner_account_id : String? = nil,
          @prompt : String? = nil,
          @query_id : String? = nil,
          @query_statistics : Types::QueryStatisticsForDescribeQuery? = nil,
          @query_status : String? = nil,
          @query_string : String? = nil
        )
        end
      end

      # Returns information about the trail.

      struct DescribeTrailsRequest
        include JSON::Serializable

        # Specifies whether to include shadow trails in the response. A shadow trail is the replication in a
        # Region of a trail that was created in a different Region, or in the case of an organization trail,
        # the replication of an organization trail in member accounts. If you do not include shadow trails,
        # organization trails in a member account and Region replication trails will not be returned. The
        # default is true.

        @[JSON::Field(key: "includeShadowTrails")]
        getter include_shadow_trails : Bool?

        # Specifies a list of trail names, trail ARNs, or both, of the trails to describe. The format of a
        # trail ARN is: arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail If an empty list is specified,
        # information for the trail in the current Region is returned. If an empty list is specified and
        # IncludeShadowTrails is false, then information for all trails in the current Region is returned. If
        # an empty list is specified and IncludeShadowTrails is null or true, then information for all trails
        # in the current Region and any associated shadow trails in other Regions is returned. If one or more
        # trail names are specified, information is returned only if the names match the names of trails
        # belonging only to the current Region and current account. To return information about a trail in
        # another Region, you must specify its trail ARN.

        @[JSON::Field(key: "trailNameList")]
        getter trail_name_list : Array(String)?

        def initialize(
          @include_shadow_trails : Bool? = nil,
          @trail_name_list : Array(String)? = nil
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct DescribeTrailsResponse
        include JSON::Serializable

        # The list of trail objects. Trail objects with string values are only returned if values for the
        # objects exist in a trail's configuration. For example, SNSTopicName and SNSTopicARN are only
        # returned in results if a trail is configured to send SNS notifications. Similarly, KMSKeyId only
        # appears in results if a trail's log files are encrypted with KMS customer managed keys.

        @[JSON::Field(key: "trailList")]
        getter trail_list : Array(Types::Trail)?

        def initialize(
          @trail_list : Array(Types::Trail)? = nil
        )
        end
      end

      # Contains information about the destination receiving events.

      struct Destination
        include JSON::Serializable

        # For channels used for a CloudTrail Lake integration, the location is the ARN of an event data store
        # that receives events from a channel. For service-linked channels, the location is the name of the
        # Amazon Web Services service.

        @[JSON::Field(key: "Location")]
        getter location : String

        # The type of destination for events arriving from a channel. For channels used for a CloudTrail Lake
        # integration, the value is EVENT_DATA_STORE . For service-linked channels, the value is AWS_SERVICE .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @location : String,
          @type : String
        )
        end
      end


      struct DisableFederationRequest
        include JSON::Serializable

        # The ARN (or ID suffix of the ARN) of the event data store for which you want to disable Lake query
        # federation.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        def initialize(
          @event_data_store : String
        )
        end
      end


      struct DisableFederationResponse
        include JSON::Serializable

        # The ARN of the event data store for which you disabled Lake query federation.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # The federation status.

        @[JSON::Field(key: "FederationStatus")]
        getter federation_status : String?

        def initialize(
          @event_data_store_arn : String? = nil,
          @federation_status : String? = nil
        )
        end
      end


      struct EnableFederationRequest
        include JSON::Serializable

        # The ARN (or ID suffix of the ARN) of the event data store for which you want to enable Lake query
        # federation.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        # The ARN of the federation role to use for the event data store. Amazon Web Services services like
        # Lake Formation use this federation role to access data for the federated event data store. The
        # federation role must exist in your account and provide the required minimum permissions .

        @[JSON::Field(key: "FederationRoleArn")]
        getter federation_role_arn : String

        def initialize(
          @event_data_store : String,
          @federation_role_arn : String
        )
        end
      end


      struct EnableFederationResponse
        include JSON::Serializable

        # The ARN of the event data store for which you enabled Lake query federation.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # The ARN of the federation role.

        @[JSON::Field(key: "FederationRoleArn")]
        getter federation_role_arn : String?

        # The federation status.

        @[JSON::Field(key: "FederationStatus")]
        getter federation_status : String?

        def initialize(
          @event_data_store_arn : String? = nil,
          @federation_role_arn : String? = nil,
          @federation_status : String? = nil
        )
        end
      end

      # Contains information about an event that was returned by a lookup request. The result includes a
      # representation of a CloudTrail event.

      struct Event
        include JSON::Serializable

        # The Amazon Web Services access key ID that was used to sign the request. If the request was made
        # with temporary security credentials, this is the access key ID of the temporary credentials.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # A JSON string that contains a representation of the event returned.

        @[JSON::Field(key: "CloudTrailEvent")]
        getter cloud_trail_event : String?

        # The CloudTrail ID of the event returned.

        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        # The name of the event returned.

        @[JSON::Field(key: "EventName")]
        getter event_name : String?

        # The Amazon Web Services service to which the request was made.

        @[JSON::Field(key: "EventSource")]
        getter event_source : String?

        # The date and time of the event returned.

        @[JSON::Field(key: "EventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter event_time : Time?

        # Information about whether the event is a write event or a read event.

        @[JSON::Field(key: "ReadOnly")]
        getter read_only : String?

        # A list of resources referenced by the event returned.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        # A user name or role name of the requester that called the API in the event returned.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @access_key_id : String? = nil,
          @cloud_trail_event : String? = nil,
          @event_id : String? = nil,
          @event_name : String? = nil,
          @event_source : String? = nil,
          @event_time : Time? = nil,
          @read_only : String? = nil,
          @resources : Array(Types::Resource)? = nil,
          @username : String? = nil
        )
        end
      end

      # A storage lake of event data against which you can run complex SQL-based queries. An event data
      # store can include events that you have logged on your account. To select events for an event data
      # store, use advanced event selectors .

      struct EventDataStore
        include JSON::Serializable

        # The advanced event selectors that were used to select events for the data store.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # The timestamp of the event data store's creation.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN of the event data store.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # Indicates whether the event data store includes events from all Regions, or only from the Region in
        # which it was created.

        @[JSON::Field(key: "MultiRegionEnabled")]
        getter multi_region_enabled : Bool?

        # The name of the event data store.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates that an event data store is collecting logged events for an organization.

        @[JSON::Field(key: "OrganizationEnabled")]
        getter organization_enabled : Bool?

        # The retention period, in days.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # The status of an event data store.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates whether the event data store is protected from termination.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # The timestamp showing when an event data store was updated, if applicable. UpdatedTimestamp is
        # always either the same or newer than the time shown in CreatedTimestamp .

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @created_timestamp : Time? = nil,
          @event_data_store_arn : String? = nil,
          @multi_region_enabled : Bool? = nil,
          @name : String? = nil,
          @organization_enabled : Bool? = nil,
          @retention_period : Int32? = nil,
          @status : String? = nil,
          @termination_protection_enabled : Bool? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The specified event data store ARN is not valid or does not map to an event data store in your
      # account.

      struct EventDataStoreARNInvalidException
        include JSON::Serializable

        def initialize
        end
      end

      # An event data store with that name already exists.

      struct EventDataStoreAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # You cannot delete the event data store because Lake query federation is enabled. To delete the event
      # data store, run the DisableFederation operation to disable Lake query federation on the event data
      # store.

      struct EventDataStoreFederationEnabledException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when you try to update or delete an event data store that currently has an
      # import in progress.

      struct EventDataStoreHasOngoingImportException
        include JSON::Serializable

        def initialize
        end
      end

      # Your account has used the maximum number of event data stores.

      struct EventDataStoreMaxLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified event data store was not found.

      struct EventDataStoreNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The event data store cannot be deleted because termination protection is enabled for it.

      struct EventDataStoreTerminationProtectedException
        include JSON::Serializable

        def initialize
        end
      end

      # Use event selectors to further specify the management and data event settings for your trail. By
      # default, trails created without specific event selectors will be configured to log all read and
      # write management events, and no data events. When an event occurs in your account, CloudTrail
      # evaluates the event selector for all trails. For each trail, if the event matches any event
      # selector, the trail processes and logs the event. If the event doesn't match any event selector, the
      # trail doesn't log the event. You can configure up to five event selectors for a trail. You cannot
      # apply both event selectors and advanced event selectors to a trail.

      struct EventSelector
        include JSON::Serializable

        # CloudTrail supports data event logging for Amazon S3 objects in standard S3 buckets, Lambda
        # functions, and Amazon DynamoDB tables with basic event selectors. You can specify up to 250
        # resources for an individual event selector, but the total number of data resources cannot exceed 250
        # across all event selectors in a trail. This limit does not apply if you configure resource logging
        # for all data events. For more information, see Data Events and Limits in CloudTrail in the
        # CloudTrail User Guide . To log data events for all other resource types including objects stored in
        # directory buckets , you must use AdvancedEventSelectors . You must also use AdvancedEventSelectors
        # if you want to filter on the eventName field.

        @[JSON::Field(key: "DataResources")]
        getter data_resources : Array(Types::DataResource)?

        # An optional list of service event sources from which you do not want management events to be logged
        # on your trail. In this release, the list can be empty (disables the filter), or it can filter out
        # Key Management Service or Amazon RDS Data API events by containing kms.amazonaws.com or
        # rdsdata.amazonaws.com . By default, ExcludeManagementEventSources is empty, and KMS and Amazon RDS
        # Data API events are logged to your trail. You can exclude management event sources only in Regions
        # that support the event source.

        @[JSON::Field(key: "ExcludeManagementEventSources")]
        getter exclude_management_event_sources : Array(String)?

        # Specify if you want your event selector to include management events for your trail. For more
        # information, see Management Events in the CloudTrail User Guide . By default, the value is true .
        # The first copy of management events is free. You are charged for additional copies of management
        # events that you are logging on any subsequent trail in the same Region. For more information about
        # CloudTrail pricing, see CloudTrail Pricing .

        @[JSON::Field(key: "IncludeManagementEvents")]
        getter include_management_events : Bool?

        # Specify if you want your trail to log read-only events, write-only events, or all. For example, the
        # EC2 GetConsoleOutput is a read-only API operation and RunInstances is a write-only API operation. By
        # default, the value is All .

        @[JSON::Field(key: "ReadWriteType")]
        getter read_write_type : String?

        def initialize(
          @data_resources : Array(Types::DataResource)? = nil,
          @exclude_management_event_sources : Array(String)? = nil,
          @include_management_events : Bool? = nil,
          @read_write_type : String? = nil
        )
        end
      end


      struct GenerateQueryRequest
        include JSON::Serializable

        # The ARN (or ID suffix of the ARN) of the event data store that you want to query. You can only
        # specify one event data store.

        @[JSON::Field(key: "EventDataStores")]
        getter event_data_stores : Array(String)

        # The prompt that you want to use to generate the query. The prompt must be in English. For example
        # prompts, see Example prompts in the CloudTrail user guide.

        @[JSON::Field(key: "Prompt")]
        getter prompt : String

        def initialize(
          @event_data_stores : Array(String),
          @prompt : String
        )
        end
      end


      struct GenerateQueryResponse
        include JSON::Serializable

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        # An alias that identifies the prompt. When you run the StartQuery operation, you can pass in either
        # the QueryAlias or QueryStatement parameter.

        @[JSON::Field(key: "QueryAlias")]
        getter query_alias : String?

        # The SQL query statement generated from the prompt.

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String?

        def initialize(
          @event_data_store_owner_account_id : String? = nil,
          @query_alias : String? = nil,
          @query_statement : String? = nil
        )
        end
      end

      # This exception is thrown when a valid query could not be generated for the provided prompt.

      struct GenerateResponseException
        include JSON::Serializable

        def initialize
        end
      end


      struct GetChannelRequest
        include JSON::Serializable

        # The ARN or UUID of a channel.

        @[JSON::Field(key: "Channel")]
        getter channel : String

        def initialize(
          @channel : String
        )
        end
      end


      struct GetChannelResponse
        include JSON::Serializable

        # The ARN of an channel returned by a GetChannel request.

        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The destinations for the channel. For channels created for integrations, the destinations are the
        # event data stores that log events arriving through the channel. For service-linked channels, the
        # destination is the Amazon Web Services service that created the service-linked channel to receive
        # events.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Destination)?

        # A table showing information about the most recent successful and failed attempts to ingest events.

        @[JSON::Field(key: "IngestionStatus")]
        getter ingestion_status : Types::IngestionStatus?

        # The name of the CloudTrail channel. For service-linked channels, the name is
        # aws-service-channel/service-name/custom-suffix where service-name represents the name of the Amazon
        # Web Services service that created the channel and custom-suffix represents the suffix generated by
        # the Amazon Web Services service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The source for the CloudTrail channel.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # Provides information about the advanced event selectors configured for the channel, and whether the
        # channel applies to all Regions or a single Region.

        @[JSON::Field(key: "SourceConfig")]
        getter source_config : Types::SourceConfig?

        def initialize(
          @channel_arn : String? = nil,
          @destinations : Array(Types::Destination)? = nil,
          @ingestion_status : Types::IngestionStatus? = nil,
          @name : String? = nil,
          @source : String? = nil,
          @source_config : Types::SourceConfig? = nil
        )
        end
      end


      struct GetDashboardRequest
        include JSON::Serializable

        # The name or ARN for the dashboard.

        @[JSON::Field(key: "DashboardId")]
        getter dashboard_id : String

        def initialize(
          @dashboard_id : String
        )
        end
      end


      struct GetDashboardResponse
        include JSON::Serializable

        # The timestamp that shows when the dashboard was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN for the dashboard.

        @[JSON::Field(key: "DashboardArn")]
        getter dashboard_arn : String?

        # Provides information about failures for the last scheduled refresh.

        @[JSON::Field(key: "LastRefreshFailureReason")]
        getter last_refresh_failure_reason : String?

        # The ID of the last dashboard refresh.

        @[JSON::Field(key: "LastRefreshId")]
        getter last_refresh_id : String?

        # The refresh schedule for the dashboard, if configured.

        @[JSON::Field(key: "RefreshSchedule")]
        getter refresh_schedule : Types::RefreshSchedule?

        # The status of the dashboard.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates whether termination protection is enabled for the dashboard.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # The type of dashboard.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The timestamp that shows when the dashboard was last updated.

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        # An array of widgets for the dashboard.

        @[JSON::Field(key: "Widgets")]
        getter widgets : Array(Types::Widget)?

        def initialize(
          @created_timestamp : Time? = nil,
          @dashboard_arn : String? = nil,
          @last_refresh_failure_reason : String? = nil,
          @last_refresh_id : String? = nil,
          @refresh_schedule : Types::RefreshSchedule? = nil,
          @status : String? = nil,
          @termination_protection_enabled : Bool? = nil,
          @type : String? = nil,
          @updated_timestamp : Time? = nil,
          @widgets : Array(Types::Widget)? = nil
        )
        end
      end


      struct GetEventConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which you want to
        # retrieve event configuration settings.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String?

        # The name of the trail for which you want to retrieve event configuration settings.

        @[JSON::Field(key: "TrailName")]
        getter trail_name : String?

        def initialize(
          @event_data_store : String? = nil,
          @trail_name : String? = nil
        )
        end
      end


      struct GetEventConfigurationResponse
        include JSON::Serializable

        # The list of aggregation configurations that are configured for the trail.

        @[JSON::Field(key: "AggregationConfigurations")]
        getter aggregation_configurations : Array(Types::AggregationConfiguration)?

        # The list of context key selectors that are configured for the event data store.

        @[JSON::Field(key: "ContextKeySelectors")]
        getter context_key_selectors : Array(Types::ContextKeySelector)?

        # The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which the event
        # configuration settings are returned.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # The maximum allowed size for events stored in the specified event data store.

        @[JSON::Field(key: "MaxEventSize")]
        getter max_event_size : String?

        # The Amazon Resource Name (ARN) of the trail for which the event configuration settings are returned.

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @aggregation_configurations : Array(Types::AggregationConfiguration)? = nil,
          @context_key_selectors : Array(Types::ContextKeySelector)? = nil,
          @event_data_store_arn : String? = nil,
          @max_event_size : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end


      struct GetEventDataStoreRequest
        include JSON::Serializable

        # The ARN (or ID suffix of the ARN) of the event data store about which you want information.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        def initialize(
          @event_data_store : String
        )
        end
      end


      struct GetEventDataStoreResponse
        include JSON::Serializable

        # The advanced event selectors used to select events for the data store.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # The billing mode for the event data store.

        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # The timestamp of the event data store's creation.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The event data store Amazon Resource Number (ARN).

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # If Lake query federation is enabled, provides the ARN of the federation role used to access the
        # resources for the federated event data store.

        @[JSON::Field(key: "FederationRoleArn")]
        getter federation_role_arn : String?

        # Indicates the Lake query federation status. The status is ENABLED if Lake query federation is
        # enabled, or DISABLED if Lake query federation is disabled. You cannot delete an event data store if
        # the FederationStatus is ENABLED .

        @[JSON::Field(key: "FederationStatus")]
        getter federation_status : String?

        # Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully
        # specified ARN to a KMS key in the following format.
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Indicates whether the event data store includes events from all Regions, or only from the Region in
        # which it was created.

        @[JSON::Field(key: "MultiRegionEnabled")]
        getter multi_region_enabled : Bool?

        # The name of the event data store.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether an event data store is collecting logged events for an organization in
        # Organizations.

        @[JSON::Field(key: "OrganizationEnabled")]
        getter organization_enabled : Bool?

        # The partition keys for the event data store. To improve query performance and efficiency, CloudTrail
        # Lake organizes event data into partitions based on values derived from partition keys.

        @[JSON::Field(key: "PartitionKeys")]
        getter partition_keys : Array(Types::PartitionKey)?

        # The retention period of the event data store, in days.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # The status of an event data store.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates that termination protection is enabled.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # Shows the time that an event data store was updated, if applicable. UpdatedTimestamp is always
        # either the same or newer than the time shown in CreatedTimestamp .

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @billing_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @event_data_store_arn : String? = nil,
          @federation_role_arn : String? = nil,
          @federation_status : String? = nil,
          @kms_key_id : String? = nil,
          @multi_region_enabled : Bool? = nil,
          @name : String? = nil,
          @organization_enabled : Bool? = nil,
          @partition_keys : Array(Types::PartitionKey)? = nil,
          @retention_period : Int32? = nil,
          @status : String? = nil,
          @termination_protection_enabled : Bool? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end


      struct GetEventSelectorsRequest
        include JSON::Serializable

        # Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the
        # following requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
        # underscores (_), or dashes (-) Start with a letter or number, and end with a letter or number Be
        # between 3 and 128 characters Have no adjacent periods, underscores or dashes. Names like
        # my-_namespace and my--namespace are not valid. Not be in IP address format (for example,
        # 192.168.5.4) If you specify a trail ARN, it must be in the format:
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "TrailName")]
        getter trail_name : String

        def initialize(
          @trail_name : String
        )
        end
      end


      struct GetEventSelectorsResponse
        include JSON::Serializable

        # The advanced event selectors that are configured for the trail.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # The event selectors that are configured for the trail.

        @[JSON::Field(key: "EventSelectors")]
        getter event_selectors : Array(Types::EventSelector)?

        # The specified trail ARN that has the event selectors.

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @event_selectors : Array(Types::EventSelector)? = nil,
          @trail_arn : String? = nil
        )
        end
      end


      struct GetImportRequest
        include JSON::Serializable

        # The ID for the import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String

        def initialize(
          @import_id : String
        )
        end
      end


      struct GetImportResponse
        include JSON::Serializable

        # The timestamp of the import's creation.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN of the destination event data store.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(String)?

        # Used with StartEventTime to bound a StartImport request, and limit imported trail events to only
        # those events logged within a specified time period.

        @[JSON::Field(key: "EndEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_event_time : Time?

        # The ID of the import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String?

        # The source S3 bucket.

        @[JSON::Field(key: "ImportSource")]
        getter import_source : Types::ImportSource?

        # Provides statistics for the import. CloudTrail does not update import statistics in real-time.
        # Returned values for parameters such as EventsCompleted may be lower than the actual value, because
        # CloudTrail updates statistics incrementally over the course of the import.

        @[JSON::Field(key: "ImportStatistics")]
        getter import_statistics : Types::ImportStatistics?

        # The status of the import.

        @[JSON::Field(key: "ImportStatus")]
        getter import_status : String?

        # Used with EndEventTime to bound a StartImport request, and limit imported trail events to only those
        # events logged within a specified time period.

        @[JSON::Field(key: "StartEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_event_time : Time?

        # The timestamp of when the import was updated.

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @destinations : Array(String)? = nil,
          @end_event_time : Time? = nil,
          @import_id : String? = nil,
          @import_source : Types::ImportSource? = nil,
          @import_statistics : Types::ImportStatistics? = nil,
          @import_status : String? = nil,
          @start_event_time : Time? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end


      struct GetInsightSelectorsRequest
        include JSON::Serializable

        # Specifies the ARN (or ID suffix of the ARN) of the event data store for which you want to get
        # Insights selectors. You cannot use this parameter with the TrailName parameter.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String?

        # Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the
        # following requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
        # underscores (_), or dashes (-) Start with a letter or number, and end with a letter or number Be
        # between 3 and 128 characters Have no adjacent periods, underscores or dashes. Names like
        # my-_namespace and my--namespace are not valid. Not be in IP address format (for example,
        # 192.168.5.4) If you specify a trail ARN, it must be in the format:
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail You cannot use this parameter with the
        # EventDataStore parameter.

        @[JSON::Field(key: "TrailName")]
        getter trail_name : String?

        def initialize(
          @event_data_store : String? = nil,
          @trail_name : String? = nil
        )
        end
      end


      struct GetInsightSelectorsResponse
        include JSON::Serializable

        # The ARN of the source event data store that enabled Insights events.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # Contains the Insights types that are enabled on a trail or event data store. It also specifies the
        # event categories on which a particular Insight type is enabled. ApiCallRateInsight and
        # ApiErrorRateInsight are valid Insight types.The EventCategory field can specify Management or Data
        # events or both. For event data store, you can log Insights for management events only.

        @[JSON::Field(key: "InsightSelectors")]
        getter insight_selectors : Array(Types::InsightSelector)?

        # The ARN of the destination event data store that logs Insights events.

        @[JSON::Field(key: "InsightsDestination")]
        getter insights_destination : String?

        # The Amazon Resource Name (ARN) of a trail for which you want to get Insights selectors.

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @event_data_store_arn : String? = nil,
          @insight_selectors : Array(Types::InsightSelector)? = nil,
          @insights_destination : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end


      struct GetQueryResultsRequest
        include JSON::Serializable

        # The ID of the query for which you want to get results.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # The ARN (or ID suffix of the ARN) of the event data store against which the query was run.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String?

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        # The maximum number of query results to display on a single page.

        @[JSON::Field(key: "MaxQueryResults")]
        getter max_query_results : Int32?

        # A token you can use to get the next page of query results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @query_id : String,
          @event_data_store : String? = nil,
          @event_data_store_owner_account_id : String? = nil,
          @max_query_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetQueryResultsResponse
        include JSON::Serializable

        # The error message returned if a query failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # A token you can use to get the next page of query results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Contains the individual event results of the query.

        @[JSON::Field(key: "QueryResultRows")]
        getter query_result_rows : Array(Array(Hash(String, String)))?

        # Shows the count of query results.

        @[JSON::Field(key: "QueryStatistics")]
        getter query_statistics : Types::QueryStatistics?

        # The status of the query. Values include QUEUED , RUNNING , FINISHED , FAILED , TIMED_OUT , or
        # CANCELLED .

        @[JSON::Field(key: "QueryStatus")]
        getter query_status : String?

        def initialize(
          @error_message : String? = nil,
          @next_token : String? = nil,
          @query_result_rows : Array(Array(Hash(String, String)))? = nil,
          @query_statistics : Types::QueryStatistics? = nil,
          @query_status : String? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to
        # the resource-based policy. Example event data store ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE Example
        # dashboard ARN format: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash Example
        # channel ARN format: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The default resource-based policy that is automatically generated for the delegated administrator of
        # an Organizations organization. This policy will be evaluated in tandem with any policy you submit
        # for the resource. For more information about this policy, see Default resource policy for delegated
        # administrators .

        @[JSON::Field(key: "DelegatedAdminResourcePolicy")]
        getter delegated_admin_resource_policy : String?

        # The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to
        # resource-based policy. Example event data store ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE Example
        # dashboard ARN format: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash Example
        # channel ARN format: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # A JSON-formatted string that contains the resource-based policy attached to the CloudTrail event
        # data store, dashboard, or channel.

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        def initialize(
          @delegated_admin_resource_policy : String? = nil,
          @resource_arn : String? = nil,
          @resource_policy : String? = nil
        )
        end
      end


      struct GetTrailRequest
        include JSON::Serializable

        # The name or the Amazon Resource Name (ARN) of the trail for which you want to retrieve settings
        # information.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetTrailResponse
        include JSON::Serializable


        @[JSON::Field(key: "Trail")]
        getter trail : Types::Trail?

        def initialize(
          @trail : Types::Trail? = nil
        )
        end
      end

      # The name of a trail about which you want the current status.

      struct GetTrailStatusRequest
        include JSON::Serializable

        # Specifies the name or the CloudTrail ARN of the trail for which you are requesting status. To get
        # the status of a shadow trail (a replication of the trail in another Region), you must specify its
        # ARN. The following is the format of a trail ARN:
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail If the trail is an organization trail and
        # you are a member account in the organization in Organizations, you must provide the full ARN of that
        # trail, and not just the name.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct GetTrailStatusResponse
        include JSON::Serializable

        # Whether the CloudTrail trail is currently logging Amazon Web Services API calls.

        @[JSON::Field(key: "IsLogging")]
        getter is_logging : Bool?

        # Displays any CloudWatch Logs error that CloudTrail encountered when attempting to deliver logs to
        # CloudWatch Logs.

        @[JSON::Field(key: "LatestCloudWatchLogsDeliveryError")]
        getter latest_cloud_watch_logs_delivery_error : String?

        # Displays the most recent date and time when CloudTrail delivered logs to CloudWatch Logs.

        @[JSON::Field(key: "LatestCloudWatchLogsDeliveryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_cloud_watch_logs_delivery_time : Time?

        # This field is no longer in use.

        @[JSON::Field(key: "LatestDeliveryAttemptSucceeded")]
        getter latest_delivery_attempt_succeeded : String?

        # This field is no longer in use.

        @[JSON::Field(key: "LatestDeliveryAttemptTime")]
        getter latest_delivery_attempt_time : String?

        # Displays any Amazon S3 error that CloudTrail encountered when attempting to deliver log files to the
        # designated bucket. For more information, see Error Responses in the Amazon S3 API Reference. This
        # error occurs only when there is a problem with the destination S3 bucket, and does not occur for
        # requests that time out. To resolve the issue, fix the bucket policy so that CloudTrail can write to
        # the bucket; or create a new bucket and call UpdateTrail to specify the new bucket.

        @[JSON::Field(key: "LatestDeliveryError")]
        getter latest_delivery_error : String?

        # Specifies the date and time that CloudTrail last delivered log files to an account's Amazon S3
        # bucket.

        @[JSON::Field(key: "LatestDeliveryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_delivery_time : Time?

        # Displays any Amazon S3 error that CloudTrail encountered when attempting to deliver a digest file to
        # the designated bucket. For more information, see Error Responses in the Amazon S3 API Reference.
        # This error occurs only when there is a problem with the destination S3 bucket, and does not occur
        # for requests that time out. To resolve the issue, fix the bucket policy so that CloudTrail can write
        # to the bucket; or create a new bucket and call UpdateTrail to specify the new bucket.

        @[JSON::Field(key: "LatestDigestDeliveryError")]
        getter latest_digest_delivery_error : String?

        # Specifies the date and time that CloudTrail last delivered a digest file to an account's Amazon S3
        # bucket.

        @[JSON::Field(key: "LatestDigestDeliveryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_digest_delivery_time : Time?

        # This field is no longer in use.

        @[JSON::Field(key: "LatestNotificationAttemptSucceeded")]
        getter latest_notification_attempt_succeeded : String?

        # This field is no longer in use.

        @[JSON::Field(key: "LatestNotificationAttemptTime")]
        getter latest_notification_attempt_time : String?

        # Displays any Amazon SNS error that CloudTrail encountered when attempting to send a notification.
        # For more information about Amazon SNS errors, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "LatestNotificationError")]
        getter latest_notification_error : String?

        # Specifies the date and time of the most recent Amazon SNS notification that CloudTrail has written a
        # new log file to an account's Amazon S3 bucket.

        @[JSON::Field(key: "LatestNotificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_notification_time : Time?

        # Specifies the most recent date and time when CloudTrail started recording API calls for an Amazon
        # Web Services account.

        @[JSON::Field(key: "StartLoggingTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_logging_time : Time?

        # Specifies the most recent date and time when CloudTrail stopped recording API calls for an Amazon
        # Web Services account.

        @[JSON::Field(key: "StopLoggingTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_logging_time : Time?

        # This field is no longer in use.

        @[JSON::Field(key: "TimeLoggingStarted")]
        getter time_logging_started : String?

        # This field is no longer in use.

        @[JSON::Field(key: "TimeLoggingStopped")]
        getter time_logging_stopped : String?

        def initialize(
          @is_logging : Bool? = nil,
          @latest_cloud_watch_logs_delivery_error : String? = nil,
          @latest_cloud_watch_logs_delivery_time : Time? = nil,
          @latest_delivery_attempt_succeeded : String? = nil,
          @latest_delivery_attempt_time : String? = nil,
          @latest_delivery_error : String? = nil,
          @latest_delivery_time : Time? = nil,
          @latest_digest_delivery_error : String? = nil,
          @latest_digest_delivery_time : Time? = nil,
          @latest_notification_attempt_succeeded : String? = nil,
          @latest_notification_attempt_time : String? = nil,
          @latest_notification_error : String? = nil,
          @latest_notification_time : Time? = nil,
          @start_logging_time : Time? = nil,
          @stop_logging_time : Time? = nil,
          @time_logging_started : String? = nil,
          @time_logging_stopped : String? = nil
        )
        end
      end

      # Provides information about an import failure.

      struct ImportFailureListItem
        include JSON::Serializable

        # Provides the reason the import failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The type of import error.

        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        # When the import was last updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The location of the failure in the S3 bucket.

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The status of the import.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @error_type : String? = nil,
          @last_updated_time : Time? = nil,
          @location : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The specified import was not found.

      struct ImportNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The import source.

      struct ImportSource
        include JSON::Serializable

        # The source S3 bucket.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3ImportSource

        def initialize(
          @s3 : Types::S3ImportSource
        )
        end
      end

      # Provides statistics for the specified ImportID . CloudTrail does not update import statistics in
      # real-time. Returned values for parameters such as EventsCompleted may be lower than the actual
      # value, because CloudTrail updates statistics incrementally over the course of the import.

      struct ImportStatistics
        include JSON::Serializable

        # The number of trail events imported into the event data store.

        @[JSON::Field(key: "EventsCompleted")]
        getter events_completed : Int64?

        # The number of failed entries.

        @[JSON::Field(key: "FailedEntries")]
        getter failed_entries : Int64?

        # The number of log files that completed import.

        @[JSON::Field(key: "FilesCompleted")]
        getter files_completed : Int64?

        # The number of S3 prefixes that completed import.

        @[JSON::Field(key: "PrefixesCompleted")]
        getter prefixes_completed : Int64?

        # The number of S3 prefixes found for the import.

        @[JSON::Field(key: "PrefixesFound")]
        getter prefixes_found : Int64?

        def initialize(
          @events_completed : Int64? = nil,
          @failed_entries : Int64? = nil,
          @files_completed : Int64? = nil,
          @prefixes_completed : Int64? = nil,
          @prefixes_found : Int64? = nil
        )
        end
      end

      # Contains information about an import that was returned by a lookup request.

      struct ImportsListItem
        include JSON::Serializable

        # The timestamp of the import's creation.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN of the destination event data store.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(String)?

        # The ID of the import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String?

        # The status of the import.

        @[JSON::Field(key: "ImportStatus")]
        getter import_status : String?

        # The timestamp of the import's last update.

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @destinations : Array(String)? = nil,
          @import_id : String? = nil,
          @import_status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The event data store is inactive.

      struct InactiveEventDataStoreException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified query cannot be canceled because it is in the FINISHED , FAILED , TIMED_OUT , or
      # CANCELLED state.

      struct InactiveQueryException
        include JSON::Serializable

        def initialize
        end
      end

      # A table showing information about the most recent successful and failed attempts to ingest events.

      struct IngestionStatus
        include JSON::Serializable

        # The event ID of the most recent attempt to ingest events.

        @[JSON::Field(key: "LatestIngestionAttemptEventID")]
        getter latest_ingestion_attempt_event_id : String?

        # The time stamp of the most recent attempt to ingest events on the channel.

        @[JSON::Field(key: "LatestIngestionAttemptTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_ingestion_attempt_time : Time?

        # The error code for the most recent failure to ingest events.

        @[JSON::Field(key: "LatestIngestionErrorCode")]
        getter latest_ingestion_error_code : String?

        # The event ID of the most recent successful ingestion of events.

        @[JSON::Field(key: "LatestIngestionSuccessEventID")]
        getter latest_ingestion_success_event_id : String?

        # The time stamp of the most recent successful ingestion of events for the channel.

        @[JSON::Field(key: "LatestIngestionSuccessTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_ingestion_success_time : Time?

        def initialize(
          @latest_ingestion_attempt_event_id : String? = nil,
          @latest_ingestion_attempt_time : Time? = nil,
          @latest_ingestion_error_code : String? = nil,
          @latest_ingestion_success_event_id : String? = nil,
          @latest_ingestion_success_time : Time? = nil
        )
        end
      end

      # If you run GetInsightSelectors on a trail or event data store that does not have Insights events
      # enabled, the operation throws the exception InsightNotEnabledException .

      struct InsightNotEnabledException
        include JSON::Serializable

        def initialize
        end
      end

      # A JSON string that contains a list of Insights types that are logged on a trail or event data store.

      struct InsightSelector
        include JSON::Serializable

        # Select the event category on which Insights should be enabled. If EventCategories is not provided,
        # the specified Insights types are enabled on management API calls by default. If EventCategories is
        # provided, the given event categories will overwrite the existing ones. For example, if a trail
        # already has Insights enabled on management events, and then a PutInsightSelectors request is made
        # with only data events specified in EventCategories, Insights on management events will be disabled.

        @[JSON::Field(key: "EventCategories")]
        getter event_categories : Array(String)?

        # The type of Insights events to log on a trail or event data store. ApiCallRateInsight and
        # ApiErrorRateInsight are valid Insight types. The ApiCallRateInsight Insights type analyzes
        # write-only management API calls or read and write data API calls that are aggregated per minute
        # against a baseline API call volume. The ApiErrorRateInsight Insights type analyzes management and
        # data API calls that result in error codes. The error is shown if the API call is unsuccessful.

        @[JSON::Field(key: "InsightType")]
        getter insight_type : String?

        def initialize(
          @event_categories : Array(String)? = nil,
          @insight_type : String? = nil
        )
        end
      end

      # This exception is thrown when the IAM identity that is used to create the organization resource
      # lacks one or more required permissions for creating an organization resource in a required service.

      struct InsufficientDependencyServiceAccessPermissionException
        include JSON::Serializable

        def initialize
        end
      end

      # For the CreateTrail PutInsightSelectors , UpdateTrail , StartQuery , and StartImport operations,
      # this exception is thrown when the policy on the S3 bucket or KMS key does not have sufficient
      # permissions for the operation. For all other operations, this exception is thrown when the policy
      # for the KMS key does not have sufficient permissions for the operation.

      struct InsufficientEncryptionPolicyException
        include JSON::Serializable

        def initialize
        end
      end

      # The task can't be completed because you are signed in with an account that lacks permissions to view
      # or create a service-linked role. Sign in with an account that has the required permissions and then
      # try again.

      struct InsufficientIAMAccessPermissionException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the policy on the S3 bucket is not sufficient.

      struct InsufficientS3BucketPolicyException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the policy on the Amazon SNS topic is not sufficient.

      struct InsufficientSnsTopicPolicyException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided CloudWatch Logs log group is not valid.

      struct InvalidCloudWatchLogsLogGroupArnException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided role is not valid.

      struct InvalidCloudWatchLogsRoleArnException
        include JSON::Serializable

        def initialize
        end
      end

      # A date range for the query was specified that is not valid. Be sure that the start time is
      # chronologically before the end time. For more information about writing a query, see Create or edit
      # a query in the CloudTrail User Guide .

      struct InvalidDateRangeException
        include JSON::Serializable

        def initialize
        end
      end

      # Occurs if an event category that is not valid is specified as a value of EventCategory .

      struct InvalidEventCategoryException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when event categories of specified event data stores are not valid.

      struct InvalidEventDataStoreCategoryException
        include JSON::Serializable

        def initialize
        end
      end

      # The event data store is not in a status that supports the operation.

      struct InvalidEventDataStoreStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the PutEventSelectors operation is called with a number of event
      # selectors, advanced event selectors, or data resources that is not valid. The combination of event
      # selectors or advanced event selectors and data resources is not valid. A trail can have up to 5
      # event selectors. If a trail uses advanced event selectors, a maximum of 500 total values for all
      # conditions in all advanced event selectors is allowed. A trail is limited to 250 data resources.
      # These data resources can be distributed across event selectors, but the overall total cannot exceed
      # 250. You can: Specify a valid number of event selectors (1 to 5) for a trail. Specify a valid number
      # of data resources (1 to 250) for an event selector. The limit of number of resources on an
      # individual event selector is configurable up to 250. However, this upper limit is allowed only if
      # the total number of data resources does not exceed 250 across all event selectors for a trail.
      # Specify up to 500 values for all conditions in all advanced event selectors for a trail. Specify a
      # valid value for a parameter. For example, specifying the ReadWriteType parameter with a value of
      # read-only is not valid.

      struct InvalidEventSelectorsException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when an operation is called on a trail from a Region other than the Region
      # in which the trail was created.

      struct InvalidHomeRegionException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided source S3 bucket is not valid for import.

      struct InvalidImportSourceException
        include JSON::Serializable

        def initialize
        end
      end

      # For PutInsightSelectors , this exception is thrown when the formatting or syntax of the
      # InsightSelectors JSON statement is not valid, or the specified InsightType in the InsightSelectors
      # statement is not valid. Valid values for InsightType are ApiCallRateInsight and ApiErrorRateInsight
      # . To enable Insights on an event data store, the destination event data store specified by the
      # InsightsDestination parameter must log Insights events and the source event data store specified by
      # the EventDataStore parameter must log management events. For UpdateEventDataStore , this exception
      # is thrown if Insights are enabled on the event data store and the updated advanced event selectors
      # are not compatible with the configured InsightSelectors . If the InsightSelectors includes an
      # InsightType of ApiCallRateInsight , the source event data store must log write management events. If
      # the InsightSelectors includes an InsightType of ApiErrorRateInsight , the source event data store
      # must log management events.

      struct InvalidInsightSelectorsException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the KMS key ARN is not valid.

      struct InvalidKmsKeyIdException
        include JSON::Serializable

        def initialize
        end
      end

      # Occurs when a lookup attribute is specified that is not valid.

      struct InvalidLookupAttributesException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown if the limit specified is not valid.

      struct InvalidMaxResultsException
        include JSON::Serializable

        def initialize
        end
      end

      # A token that is not valid, or a token that was previously used in a request with different
      # parameters. This exception is thrown if the token is not valid.

      struct InvalidNextTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the combination of parameters provided is not valid.

      struct InvalidParameterCombinationException
        include JSON::Serializable

        def initialize
        end
      end

      # The request includes a parameter that is not valid.

      struct InvalidParameterException
        include JSON::Serializable

        def initialize
        end
      end

      # The query that was submitted has validation errors, or uses incorrect syntax or unsupported
      # keywords. For more information about writing a query, see Create or edit a query in the CloudTrail
      # User Guide .

      struct InvalidQueryStatementException
        include JSON::Serializable

        def initialize
        end
      end

      # The query status is not valid for the operation.

      struct InvalidQueryStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided S3 bucket name is not valid.

      struct InvalidS3BucketNameException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided S3 prefix is not valid.

      struct InvalidS3PrefixException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided SNS topic name is not valid.

      struct InvalidSnsTopicNameException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified value of Source is not valid.

      struct InvalidSourceException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified tag key or values are not valid. It can also occur if
      # there are duplicate tags or too many tags on the resource.

      struct InvalidTagParameterException
        include JSON::Serializable

        def initialize
        end
      end

      # Occurs if the timestamp values are not valid. Either the start time occurs after the end time, or
      # the time range is outside the range of possible values.

      struct InvalidTimeRangeException
        include JSON::Serializable

        def initialize
        end
      end

      # Reserved for future use.

      struct InvalidTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the provided trail name is not valid. Trail names must meet the
      # following requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
      # underscores (_), or dashes (-) Start with a letter or number, and end with a letter or number Be
      # between 3 and 128 characters Have no adjacent periods, underscores or dashes. Names like
      # my-_namespace and my--namespace are not valid. Not be in IP address format (for example,
      # 192.168.5.4)

      struct InvalidTrailNameException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when there is an issue with the specified KMS key and the trail or event
      # data store can't be updated.

      struct KmsException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is no longer in use.

      struct KmsKeyDisabledException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the KMS key does not exist, when the S3 bucket and the KMS key are not
      # in the same Region, or when the KMS key associated with the Amazon SNS topic either does not exist
      # or is not in the same Region.

      struct KmsKeyNotFoundException
        include JSON::Serializable

        def initialize
        end
      end


      struct ListChannelsRequest
        include JSON::Serializable

        # The maximum number of CloudTrail channels to display on a single page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to get the next page of results after a previous API call. This token must be
        # passed in with the same parameters that were specified in the original call. For example, if the
        # original call specified an AttributeKey of 'Username' with a value of 'root', the call with
        # NextToken should include those same parameters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelsResponse
        include JSON::Serializable

        # The list of channels in the account.

        @[JSON::Field(key: "Channels")]
        getter channels : Array(Types::Channel)?

        # The token to use to get the next page of results after a previous API call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::Channel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDashboardsRequest
        include JSON::Serializable

        # The maximum number of dashboards to display on a single page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specify a name prefix to filter on.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # A token you can use to get the next page of dashboard results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specify a dashboard type to filter on: CUSTOM or MANAGED .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListDashboardsResponse
        include JSON::Serializable

        # Contains information about dashboards in the account, in the current Region that match the applied
        # filters.

        @[JSON::Field(key: "Dashboards")]
        getter dashboards : Array(Types::DashboardDetail)?

        # A token you can use to get the next page of dashboard results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dashboards : Array(Types::DashboardDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventDataStoresRequest
        include JSON::Serializable

        # The maximum number of event data stores to display on a single page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token you can use to get the next page of event data store results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventDataStoresResponse
        include JSON::Serializable

        # Contains information about event data stores in the account, in the current Region.

        @[JSON::Field(key: "EventDataStores")]
        getter event_data_stores : Array(Types::EventDataStore)?

        # A token you can use to get the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_data_stores : Array(Types::EventDataStore)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportFailuresRequest
        include JSON::Serializable

        # The ID of the import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String

        # The maximum number of failures to display on a single page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token you can use to get the next page of import failures.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @import_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportFailuresResponse
        include JSON::Serializable

        # Contains information about the import failures.

        @[JSON::Field(key: "Failures")]
        getter failures : Array(Types::ImportFailureListItem)?

        # A token you can use to get the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @failures : Array(Types::ImportFailureListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportsRequest
        include JSON::Serializable

        # The ARN of the destination event data store.

        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # The status of the import.

        @[JSON::Field(key: "ImportStatus")]
        getter import_status : String?

        # The maximum number of imports to display on a single page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token you can use to get the next page of import results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @destination : String? = nil,
          @import_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportsResponse
        include JSON::Serializable

        # The list of returned imports.

        @[JSON::Field(key: "Imports")]
        getter imports : Array(Types::ImportsListItem)?

        # A token you can use to get the next page of import results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @imports : Array(Types::ImportsListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInsightsDataRequest
        include JSON::Serializable

        # Specifies the category of events returned. To fetch Insights events, specify InsightsEvents as the
        # value of DataType

        @[JSON::Field(key: "DataType")]
        getter data_type : String

        # The Amazon Resource Name(ARN) of the trail for which you want to retrieve Insights events.

        @[JSON::Field(key: "InsightSource")]
        getter insight_source : String

        # Contains a map of dimensions. Currently the map can contain only one item.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Hash(String, String)?

        # Specifies that only events that occur before or at the specified time are returned. If the specified
        # end time is before the specified start time, an error is returned.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The number of events to return. Possible values are 1 through 50. The default is 50.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to get the next page of results after a previous API call. This token must be
        # passed in with the same parameters that were specified in the original call. For example, if the
        # original call specified a EventName as a dimension with PutObject as a value, the call with
        # NextToken should include those same parameters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies that only events that occur after or at the specified time are returned. If the specified
        # start time is after the specified end time, an error is returned.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @data_type : String,
          @insight_source : String,
          @dimensions : Hash(String, String)? = nil,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListInsightsDataResponse
        include JSON::Serializable

        # A list of events returned based on the InsightSource, DataType or Dimensions specified. The events
        # list is sorted by time. The most recent event is listed first.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # The token to use to get the next page of results after a previous API call. If the token does not
        # appear, there are no more results to return. The token must be passed in with the same parameters as
        # the previous call. For example, if the original call specified a EventName as a dimension with
        # PutObject as a value, the call with NextToken should include those same parameters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInsightsMetricDataRequest
        include JSON::Serializable

        # The name of the event, typically the Amazon Web Services API on which unusual levels of activity
        # were recorded.

        @[JSON::Field(key: "EventName")]
        getter event_name : String

        # The Amazon Web Services service to which the request was made, such as iam.amazonaws.com or
        # s3.amazonaws.com .

        @[JSON::Field(key: "EventSource")]
        getter event_source : String

        # The type of CloudTrail Insights event, which is either ApiCallRateInsight or ApiErrorRateInsight .
        # The ApiCallRateInsight Insights type analyzes write-only management API calls that are aggregated
        # per minute against a baseline API call volume. The ApiErrorRateInsight Insights type analyzes
        # management API calls that result in error codes.

        @[JSON::Field(key: "InsightType")]
        getter insight_type : String

        # Type of data points to return. Valid values are NonZeroData and FillWithZeros . The default is
        # NonZeroData .

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # Specifies, in UTC, the end time for time-series data. The value specified is exclusive; results
        # include data points up to the specified time stamp. The default is the time of request.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Conditionally required if the InsightType parameter is set to ApiErrorRateInsight . If returning
        # metrics for the ApiErrorRateInsight Insights type, this is the error to retrieve data for. For
        # example, AccessDenied .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The maximum number of data points to return. Valid values are integers from 1 to 21600. The default
        # value is 21600.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Returned if all datapoints can't be returned in a single call. For example, due to reaching
        # MaxResults . Add this parameter to the request to continue retrieving results starting from the last
        # evaluated point.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Granularity of data to retrieve, in seconds. Valid values are 60 , 300 , and 3600 . If you specify
        # any other value, you will get an error. The default is 3600 seconds.

        @[JSON::Field(key: "Period")]
        getter period : Int32?

        # Specifies, in UTC, the start time for time-series data. The value specified is inclusive; results
        # include data points with the specified time stamp. The default is 90 days before the time of
        # request.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name(ARN) or name of the trail for which you want to retrieve Insights metrics
        # data. This parameter should only be provided to fetch Insights metrics data generated on trails
        # logging data events. This parameter is not required for Insights metric data generated on trails
        # logging management events.

        @[JSON::Field(key: "TrailName")]
        getter trail_name : String?

        def initialize(
          @event_name : String,
          @event_source : String,
          @insight_type : String,
          @data_type : String? = nil,
          @end_time : Time? = nil,
          @error_code : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @period : Int32? = nil,
          @start_time : Time? = nil,
          @trail_name : String? = nil
        )
        end
      end


      struct ListInsightsMetricDataResponse
        include JSON::Serializable

        # Only returned if InsightType parameter was set to ApiErrorRateInsight . If returning metrics for the
        # ApiErrorRateInsight Insights type, this is the error to retrieve data for. For example, AccessDenied
        # .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The name of the event, typically the Amazon Web Services API on which unusual levels of activity
        # were recorded.

        @[JSON::Field(key: "EventName")]
        getter event_name : String?

        # The Amazon Web Services service to which the request was made, such as iam.amazonaws.com or
        # s3.amazonaws.com .

        @[JSON::Field(key: "EventSource")]
        getter event_source : String?

        # The type of CloudTrail Insights event, which is either ApiCallRateInsight or ApiErrorRateInsight .
        # The ApiCallRateInsight Insights type analyzes write-only management API calls that are aggregated
        # per minute against a baseline API call volume. The ApiErrorRateInsight Insights type analyzes
        # management API calls that result in error codes.

        @[JSON::Field(key: "InsightType")]
        getter insight_type : String?

        # Only returned if the full results could not be returned in a single query. You can set the NextToken
        # parameter in the next request to this value to continue retrieval.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of timestamps at intervals corresponding to the specified time period.

        @[JSON::Field(key: "Timestamps")]
        getter timestamps : Array(Time)?

        # Specifies the ARN of the trail. This is only returned when Insights is enabled on a trail logging
        # data events.

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        # List of values representing the API call rate or error rate at each timestamp. The number of values
        # is equal to the number of timestamps.

        @[JSON::Field(key: "Values")]
        getter values : Array(Float64)?

        def initialize(
          @error_code : String? = nil,
          @event_name : String? = nil,
          @event_source : String? = nil,
          @insight_type : String? = nil,
          @next_token : String? = nil,
          @timestamps : Array(Time)? = nil,
          @trail_arn : String? = nil,
          @values : Array(Float64)? = nil
        )
        end
      end

      # Requests the public keys for a specified time range.

      struct ListPublicKeysRequest
        include JSON::Serializable

        # Optionally specifies, in UTC, the end of the time range to look up public keys for CloudTrail digest
        # files. If not specified, the current time is used.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Reserved for future use.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Optionally specifies, in UTC, the start of the time range to look up public keys for CloudTrail
        # digest files. If not specified, the current time is used, and the current public key is returned.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct ListPublicKeysResponse
        include JSON::Serializable

        # Reserved for future use.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Contains an array of PublicKey objects. The returned public keys may have validity time ranges that
        # overlap.

        @[JSON::Field(key: "PublicKeyList")]
        getter public_key_list : Array(Types::PublicKey)?

        def initialize(
          @next_token : String? = nil,
          @public_key_list : Array(Types::PublicKey)? = nil
        )
        end
      end


      struct ListQueriesRequest
        include JSON::Serializable

        # The ARN (or the ID suffix of the ARN) of an event data store on which queries were run.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        # Use with StartTime to bound a ListQueries request, and limit its results to only those queries run
        # within a specified time period.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The maximum number of queries to show on a page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token you can use to get the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status of queries that you want to return in results. Valid values for QueryStatus include
        # QUEUED , RUNNING , FINISHED , FAILED , TIMED_OUT , or CANCELLED .

        @[JSON::Field(key: "QueryStatus")]
        getter query_status : String?

        # Use with EndTime to bound a ListQueries request, and limit its results to only those queries run
        # within a specified time period.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @event_data_store : String,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @query_status : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListQueriesResponse
        include JSON::Serializable

        # A token you can use to get the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists matching query results, and shows query ID, status, and creation time of each query.

        @[JSON::Field(key: "Queries")]
        getter queries : Array(Types::Query)?

        def initialize(
          @next_token : String? = nil,
          @queries : Array(Types::Query)? = nil
        )
        end
      end

      # Specifies a list of tags to return.

      struct ListTagsRequest
        include JSON::Serializable

        # Specifies a list of trail, event data store, dashboard, or channel ARNs whose tags will be listed.
        # The list has a limit of 20 ARNs. Example trail ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail Example event data store ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE Example
        # dashboard ARN format: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash Example
        # channel ARN format: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceIdList")]
        getter resource_id_list : Array(String)

        # Reserved for future use.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_id_list : Array(String),
          @next_token : String? = nil
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct ListTagsResponse
        include JSON::Serializable

        # Reserved for future use.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of resource tags.

        @[JSON::Field(key: "ResourceTagList")]
        getter resource_tag_list : Array(Types::ResourceTag)?

        def initialize(
          @next_token : String? = nil,
          @resource_tag_list : Array(Types::ResourceTag)? = nil
        )
        end
      end


      struct ListTrailsRequest
        include JSON::Serializable

        # The token to use to get the next page of results after a previous API call. This token must be
        # passed in with the same parameters that were specified in the original call. For example, if the
        # original call specified an AttributeKey of 'Username' with a value of 'root', the call with
        # NextToken should include those same parameters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListTrailsResponse
        include JSON::Serializable

        # The token to use to get the next page of results after a previous API call. If the token does not
        # appear, there are no more results to return. The token must be passed in with the same parameters as
        # the previous call. For example, if the original call specified an AttributeKey of 'Username' with a
        # value of 'root', the call with NextToken should include those same parameters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the name, ARN, and home Region of trails in the current account.

        @[JSON::Field(key: "Trails")]
        getter trails : Array(Types::TrailInfo)?

        def initialize(
          @next_token : String? = nil,
          @trails : Array(Types::TrailInfo)? = nil
        )
        end
      end

      # Specifies an attribute and value that filter the events returned.

      struct LookupAttribute
        include JSON::Serializable

        # Specifies an attribute on which to filter the events returned.

        @[JSON::Field(key: "AttributeKey")]
        getter attribute_key : String

        # Specifies a value for the specified AttributeKey . The maximum length for the AttributeValue is 2000
        # characters. The following characters (' _ ', ' ', ' , ', ' \\n ') count as two characters towards
        # the 2000 character limit.

        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String

        def initialize(
          @attribute_key : String,
          @attribute_value : String
        )
        end
      end

      # Contains a request for LookupEvents.

      struct LookupEventsRequest
        include JSON::Serializable

        # Specifies that only events that occur before or at the specified time are returned. If the specified
        # end time is before the specified start time, an error is returned.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Specifies the event category. If you do not specify an event category, events of the category are
        # not returned in the response. For example, if you do not specify insight as the value of
        # EventCategory , no Insights events are returned.

        @[JSON::Field(key: "EventCategory")]
        getter event_category : String?

        # Contains a list of lookup attributes. Currently the list can contain only one item.

        @[JSON::Field(key: "LookupAttributes")]
        getter lookup_attributes : Array(Types::LookupAttribute)?

        # The number of events to return. Possible values are 1 through 50. The default is 50.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to get the next page of results after a previous API call. This token must be
        # passed in with the same parameters that were specified in the original call. For example, if the
        # original call specified an AttributeKey of 'Username' with a value of 'root', the call with
        # NextToken should include those same parameters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies that only events that occur after or at the specified time are returned. If the specified
        # start time is after the specified end time, an error is returned.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @event_category : String? = nil,
          @lookup_attributes : Array(Types::LookupAttribute)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Contains a response to a LookupEvents action.

      struct LookupEventsResponse
        include JSON::Serializable

        # A list of events returned based on the lookup attributes specified and the CloudTrail event. The
        # events list is sorted by time. The most recent event is listed first.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # The token to use to get the next page of results after a previous API call. If the token does not
        # appear, there are no more results to return. The token must be passed in with the same parameters as
        # the previous call. For example, if the original call specified an AttributeKey of 'Username' with a
        # value of 'root', the call with NextToken should include those same parameters.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # You are already running the maximum number of concurrent queries. The maximum number of concurrent
      # queries is 10. Wait a minute for some queries to finish, and then run the query again.

      struct MaxConcurrentQueriesException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the maximum number of trails is reached.

      struct MaximumNumberOfTrailsExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the management account does not have a service-linked role.

      struct NoManagementAccountSLRExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the account making the request is not the organization's management
      # account.

      struct NotOrganizationManagementAccountException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the Amazon Web Services account making the request to create or update
      # an organization trail or event data store is not the management account for an organization in
      # Organizations. For more information, see Prepare For Creating a Trail For Your Organization or
      # Organization event data stores .

      struct NotOrganizationMasterAccountException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the requested operation is not permitted.

      struct OperationNotPermittedException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when Organizations is not configured to support all features. All features
      # must be enabled in Organizations to support creating an organization trail or event data store.

      struct OrganizationNotInAllFeaturesModeException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the request is made from an Amazon Web Services account that is not a
      # member of an organization. To make this request, sign in using the credentials of an account that
      # belongs to an organization.

      struct OrganizationsNotInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a partition key for an event data store.

      struct PartitionKey
        include JSON::Serializable

        # The name of the partition key.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The data type of the partition key. For example, bigint or string .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # Contains information about a returned public key.

      struct PublicKey
        include JSON::Serializable

        # The fingerprint of the public key.

        @[JSON::Field(key: "Fingerprint")]
        getter fingerprint : String?

        # The ending time of validity of the public key.

        @[JSON::Field(key: "ValidityEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter validity_end_time : Time?

        # The starting time of validity of the public key.

        @[JSON::Field(key: "ValidityStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter validity_start_time : Time?

        # The DER encoded public key value in PKCS#1 format.

        @[JSON::Field(key: "Value")]
        getter value : Bytes?

        def initialize(
          @fingerprint : String? = nil,
          @validity_end_time : Time? = nil,
          @validity_start_time : Time? = nil,
          @value : Bytes? = nil
        )
        end
      end


      struct PutEventConfigurationRequest
        include JSON::Serializable

        # The list of aggregation configurations that you want to configure for the trail.

        @[JSON::Field(key: "AggregationConfigurations")]
        getter aggregation_configurations : Array(Types::AggregationConfiguration)?

        # A list of context key selectors that will be included to provide enriched event data.

        @[JSON::Field(key: "ContextKeySelectors")]
        getter context_key_selectors : Array(Types::ContextKeySelector)?

        # The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which event
        # configuration settings are updated.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String?

        # The maximum allowed size for events to be stored in the specified event data store. If you are using
        # context key selectors, MaxEventSize must be set to Large.

        @[JSON::Field(key: "MaxEventSize")]
        getter max_event_size : String?

        # The name of the trail for which you want to update event configuration settings.

        @[JSON::Field(key: "TrailName")]
        getter trail_name : String?

        def initialize(
          @aggregation_configurations : Array(Types::AggregationConfiguration)? = nil,
          @context_key_selectors : Array(Types::ContextKeySelector)? = nil,
          @event_data_store : String? = nil,
          @max_event_size : String? = nil,
          @trail_name : String? = nil
        )
        end
      end


      struct PutEventConfigurationResponse
        include JSON::Serializable

        # A list of aggregation configurations that are configured for the trail.

        @[JSON::Field(key: "AggregationConfigurations")]
        getter aggregation_configurations : Array(Types::AggregationConfiguration)?

        # The list of context key selectors that are configured for the event data store.

        @[JSON::Field(key: "ContextKeySelectors")]
        getter context_key_selectors : Array(Types::ContextKeySelector)?

        # The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which the event
        # configuration settings were updated.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # The maximum allowed size for events stored in the specified event data store.

        @[JSON::Field(key: "MaxEventSize")]
        getter max_event_size : String?

        # The Amazon Resource Name (ARN) of the trail that has aggregation enabled.

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @aggregation_configurations : Array(Types::AggregationConfiguration)? = nil,
          @context_key_selectors : Array(Types::ContextKeySelector)? = nil,
          @event_data_store_arn : String? = nil,
          @max_event_size : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end


      struct PutEventSelectorsRequest
        include JSON::Serializable

        # Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the
        # following requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
        # underscores (_), or dashes (-) Start with a letter or number, and end with a letter or number Be
        # between 3 and 128 characters Have no adjacent periods, underscores or dashes. Names like
        # my-_namespace and my--namespace are not valid. Not be in IP address format (for example,
        # 192.168.5.4) If you specify a trail ARN, it must be in the following format.
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "TrailName")]
        getter trail_name : String

        # Specifies the settings for advanced event selectors. You can use advanced event selectors to log
        # management events, data events for all resource types, and network activity events. You can add
        # advanced event selectors, and conditions for your advanced event selectors, up to a maximum of 500
        # values for all conditions and selectors on a trail. You can use either AdvancedEventSelectors or
        # EventSelectors , but not both. If you apply AdvancedEventSelectors to a trail, any existing
        # EventSelectors are overwritten. For more information about advanced event selectors, see Logging
        # data events and Logging network activity events in the CloudTrail User Guide .

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # Specifies the settings for your event selectors. You can use event selectors to log management
        # events and data events for the following resource types: AWS::DynamoDB::Table AWS::Lambda::Function
        # AWS::S3::Object You can't use event selectors to log network activity events. You can configure up
        # to five event selectors for a trail. You can use either EventSelectors or AdvancedEventSelectors in
        # a PutEventSelectors request, but not both. If you apply EventSelectors to a trail, any existing
        # AdvancedEventSelectors are overwritten.

        @[JSON::Field(key: "EventSelectors")]
        getter event_selectors : Array(Types::EventSelector)?

        def initialize(
          @trail_name : String,
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @event_selectors : Array(Types::EventSelector)? = nil
        )
        end
      end


      struct PutEventSelectorsResponse
        include JSON::Serializable

        # Specifies the advanced event selectors configured for your trail.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # Specifies the event selectors configured for your trail.

        @[JSON::Field(key: "EventSelectors")]
        getter event_selectors : Array(Types::EventSelector)?

        # Specifies the ARN of the trail that was updated with event selectors. The following is the format of
        # a trail ARN. arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @event_selectors : Array(Types::EventSelector)? = nil,
          @trail_arn : String? = nil
        )
        end
      end


      struct PutInsightSelectorsRequest
        include JSON::Serializable

        # Contains the Insights types you want to log on a specific category of events on a trail or event
        # data store. ApiCallRateInsight and ApiErrorRateInsight are valid Insight types.The EventCategory
        # field can specify Management or Data events or both. For event data store, you can log Insights for
        # management events only. The ApiCallRateInsight Insights type analyzes write-only management API
        # calls or read and write data API calls that are aggregated per minute against a baseline API call
        # volume. The ApiErrorRateInsight Insights type analyzes management and data API calls that result in
        # error codes. The error is shown if the API call is unsuccessful.

        @[JSON::Field(key: "InsightSelectors")]
        getter insight_selectors : Array(Types::InsightSelector)

        # The ARN (or ID suffix of the ARN) of the source event data store for which you want to change or add
        # Insights selectors. To enable Insights on an event data store, you must provide both the
        # EventDataStore and InsightsDestination parameters. You cannot use this parameter with the TrailName
        # parameter.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String?

        # The ARN (or ID suffix of the ARN) of the destination event data store that logs Insights events. To
        # enable Insights on an event data store, you must provide both the EventDataStore and
        # InsightsDestination parameters. You cannot use this parameter with the TrailName parameter.

        @[JSON::Field(key: "InsightsDestination")]
        getter insights_destination : String?

        # The name of the CloudTrail trail for which you want to change or add Insights selectors. You cannot
        # use this parameter with the EventDataStore and InsightsDestination parameters.

        @[JSON::Field(key: "TrailName")]
        getter trail_name : String?

        def initialize(
          @insight_selectors : Array(Types::InsightSelector),
          @event_data_store : String? = nil,
          @insights_destination : String? = nil,
          @trail_name : String? = nil
        )
        end
      end


      struct PutInsightSelectorsResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the source event data store for which you want to change or add
        # Insights selectors.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # Contains the Insights types you want to log on a specific category of events in a trail or event
        # data store. ApiCallRateInsight and ApiErrorRateInsight are valid Insight types.The EventCategory
        # field can specify Management or Data events or both. For event data store, you can only log Insights
        # for management events only.

        @[JSON::Field(key: "InsightSelectors")]
        getter insight_selectors : Array(Types::InsightSelector)?

        # The ARN of the destination event data store that logs Insights events.

        @[JSON::Field(key: "InsightsDestination")]
        getter insights_destination : String?

        # The Amazon Resource Name (ARN) of a trail for which you want to change or add Insights selectors.

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @event_data_store_arn : String? = nil,
          @insight_selectors : Array(Types::InsightSelector)? = nil,
          @insights_destination : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to
        # the resource-based policy. Example event data store ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE Example
        # dashboard ARN format: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash Example
        # channel ARN format: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A JSON-formatted string for an Amazon Web Services resource-based policy. For example resource-based
        # policies, see CloudTrail resource-based policy examples in the CloudTrail User Guide .

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String

        def initialize(
          @resource_arn : String,
          @resource_policy : String
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The default resource-based policy that is automatically generated for the delegated administrator of
        # an Organizations organization. This policy will be evaluated in tandem with any policy you submit
        # for the resource. For more information about this policy, see Default resource policy for delegated
        # administrators .

        @[JSON::Field(key: "DelegatedAdminResourcePolicy")]
        getter delegated_admin_resource_policy : String?

        # The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to
        # the resource-based policy. Example event data store ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE Example
        # dashboard ARN format: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash Example
        # channel ARN format: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The JSON-formatted string of the Amazon Web Services resource-based policy attached to the
        # CloudTrail event data store, dashboard, or channel.

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        def initialize(
          @delegated_admin_resource_policy : String? = nil,
          @resource_arn : String? = nil,
          @resource_policy : String? = nil
        )
        end
      end

      # A SQL string of criteria about events that you want to collect in an event data store.

      struct Query
        include JSON::Serializable

        # The creation time of a query.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The ID of a query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The status of the query. This can be QUEUED , RUNNING , FINISHED , FAILED , TIMED_OUT , or CANCELLED
        # .

        @[JSON::Field(key: "QueryStatus")]
        getter query_status : String?

        def initialize(
          @creation_time : Time? = nil,
          @query_id : String? = nil,
          @query_status : String? = nil
        )
        end
      end

      # The query ID does not exist or does not map to a query.

      struct QueryIdNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Metadata about a query, such as the number of results.

      struct QueryStatistics
        include JSON::Serializable

        # The total bytes that the query scanned in the event data store. This value matches the number of
        # bytes for which your account is billed for the query, unless the query is still running.

        @[JSON::Field(key: "BytesScanned")]
        getter bytes_scanned : Int64?

        # The number of results returned.

        @[JSON::Field(key: "ResultsCount")]
        getter results_count : Int32?

        # The total number of results returned by a query.

        @[JSON::Field(key: "TotalResultsCount")]
        getter total_results_count : Int32?

        def initialize(
          @bytes_scanned : Int64? = nil,
          @results_count : Int32? = nil,
          @total_results_count : Int32? = nil
        )
        end
      end

      # Gets metadata about a query, including the number of events that were matched, the total number of
      # events scanned, the query run time in milliseconds, and the query's creation time.

      struct QueryStatisticsForDescribeQuery
        include JSON::Serializable

        # The total bytes that the query scanned in the event data store. This value matches the number of
        # bytes for which your account is billed for the query, unless the query is still running.

        @[JSON::Field(key: "BytesScanned")]
        getter bytes_scanned : Int64?

        # The creation time of the query.

        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The number of events that matched a query.

        @[JSON::Field(key: "EventsMatched")]
        getter events_matched : Int64?

        # The number of events that the query scanned in the event data store.

        @[JSON::Field(key: "EventsScanned")]
        getter events_scanned : Int64?

        # The query's run time, in milliseconds.

        @[JSON::Field(key: "ExecutionTimeInMillis")]
        getter execution_time_in_millis : Int32?

        def initialize(
          @bytes_scanned : Int64? = nil,
          @creation_time : Time? = nil,
          @events_matched : Int64? = nil,
          @events_scanned : Int64? = nil,
          @execution_time_in_millis : Int32? = nil
        )
        end
      end

      # The schedule for a dashboard refresh.

      struct RefreshSchedule
        include JSON::Serializable

        # The frequency at which you want the dashboard refreshed.

        @[JSON::Field(key: "Frequency")]
        getter frequency : Types::RefreshScheduleFrequency?

        # Specifies whether the refresh schedule is enabled. Set the value to ENABLED to enable the refresh
        # schedule, or to DISABLED to turn off the refresh schedule.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time of day in UTC to run the schedule; for hourly only refer to minutes; default is 00:00.

        @[JSON::Field(key: "TimeOfDay")]
        getter time_of_day : String?

        def initialize(
          @frequency : Types::RefreshScheduleFrequency? = nil,
          @status : String? = nil,
          @time_of_day : String? = nil
        )
        end
      end

      # Specifies the frequency for a dashboard refresh schedule. For a custom dashboard, you can schedule a
      # refresh for every 1, 6, 12, or 24 hours, or every day.

      struct RefreshScheduleFrequency
        include JSON::Serializable

        # The unit to use for the refresh. For custom dashboards, the unit can be HOURS or DAYS . For the
        # Highlights dashboard, the Unit must be HOURS .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # The value for the refresh schedule. For custom dashboards, the following values are valid when the
        # unit is HOURS : 1 , 6 , 12 , 24 For custom dashboards, the only valid value when the unit is DAYS is
        # 1 . For the Highlights dashboard, the Value must be 6 .

        @[JSON::Field(key: "Value")]
        getter value : Int32?

        def initialize(
          @unit : String? = nil,
          @value : Int32? = nil
        )
        end
      end

      # Specifies an organization member account ID as a CloudTrail delegated administrator.

      struct RegisterOrganizationDelegatedAdminRequest
        include JSON::Serializable

        # An organization member account ID that you want to designate as a delegated administrator.

        @[JSON::Field(key: "MemberAccountId")]
        getter member_account_id : String

        def initialize(
          @member_account_id : String
        )
        end
      end

      # Returns the following response if successful. Otherwise, returns an error.

      struct RegisterOrganizationDelegatedAdminResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the tags to remove from a trail, event data store, dashboard, or channel.

      struct RemoveTagsRequest
        include JSON::Serializable

        # Specifies the ARN of the trail, event data store, dashboard, or channel from which tags should be
        # removed. Example trail ARN format: arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail Example
        # event data store ARN format:
        # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE Example
        # dashboard ARN format: arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash Example
        # channel ARN format: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Specifies a list of tags to be removed.

        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tags_list : Array(Types::Tag)
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct RemoveTagsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a widget on a CloudTrail Lake dashboard.

      struct RequestWidget
        include JSON::Serializable

        # The query statement for the widget. For custom dashboard widgets, you can query across multiple
        # event data stores as long as all event data stores exist in your account. When a query uses ? with
        # eventTime , ? must be surrounded by single quotes as follows: '?' .

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String

        # The view properties for the widget. For more information about view properties, see View properties
        # for widgets in the CloudTrail User Guide .

        @[JSON::Field(key: "ViewProperties")]
        getter view_properties : Hash(String, String)

        # The optional query parameters. The following query parameters are valid: $StartTime$ , $EndTime$ ,
        # and $Period$ .

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Array(String)?

        def initialize(
          @query_statement : String,
          @view_properties : Hash(String, String),
          @query_parameters : Array(String)? = nil
        )
        end
      end

      # Specifies the type and name of a resource referenced by an event.

      struct Resource
        include JSON::Serializable

        # The name of the resource referenced by the event returned. These are user-created names whose values
        # will depend on the environment. For example, the resource name might be "auto-scaling-test-group"
        # for an Auto Scaling Group or "i-1234567" for an EC2 Instance.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of a resource referenced by the event returned. When the resource type cannot be
        # determined, null is returned. Some examples of resource types are: Instance for EC2, Trail for
        # CloudTrail, DBInstance for Amazon RDS, and AccessKey for IAM. To learn more about how to look up and
        # filter events by the resource types supported for a service, see Filtering CloudTrail Events .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # This exception is thrown when the provided resource does not exist, or the ARN format of the
      # resource is not valid. The following is the format of an event data store ARN:
      # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE The
      # following is the format of a dashboard ARN:
      # arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash The following is the format of a
      # channel ARN: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

      struct ResourceARNNotValidException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified resource is not found.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the specified resource policy is not found.

      struct ResourcePolicyNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the resouce-based policy has syntax errors, or contains a principal
      # that is not valid.

      struct ResourcePolicyNotValidException
        include JSON::Serializable

        def initialize
        end
      end

      # A resource tag.

      struct ResourceTag
        include JSON::Serializable

        # Specifies the ARN of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # A list of tags.

        @[JSON::Field(key: "TagsList")]
        getter tags_list : Array(Types::Tag)?

        def initialize(
          @resource_id : String? = nil,
          @tags_list : Array(Types::Tag)? = nil
        )
        end
      end

      # This exception is thrown when the specified resource type is not supported by CloudTrail.

      struct ResourceTypeNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end


      struct RestoreEventDataStoreRequest
        include JSON::Serializable

        # The ARN (or the ID suffix of the ARN) of the event data store that you want to restore.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        def initialize(
          @event_data_store : String
        )
        end
      end


      struct RestoreEventDataStoreResponse
        include JSON::Serializable

        # The advanced event selectors that were used to select events.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # The billing mode for the event data store.

        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # The timestamp of an event data store's creation.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The event data store ARN.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully
        # specified ARN to a KMS key in the following format.
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Indicates whether the event data store is collecting events from all Regions, or only from the
        # Region in which the event data store was created.

        @[JSON::Field(key: "MultiRegionEnabled")]
        getter multi_region_enabled : Bool?

        # The name of the event data store.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether an event data store is collecting logged events for an organization in
        # Organizations.

        @[JSON::Field(key: "OrganizationEnabled")]
        getter organization_enabled : Bool?

        # The retention period, in days.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # The status of the event data store.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates that termination protection is enabled and the event data store cannot be automatically
        # deleted.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # The timestamp that shows when an event data store was updated, if applicable. UpdatedTimestamp is
        # always either the same or newer than the time shown in CreatedTimestamp .

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @billing_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @event_data_store_arn : String? = nil,
          @kms_key_id : String? = nil,
          @multi_region_enabled : Bool? = nil,
          @name : String? = nil,
          @organization_enabled : Bool? = nil,
          @retention_period : Int32? = nil,
          @status : String? = nil,
          @termination_protection_enabled : Bool? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # This exception is thrown when the specified S3 bucket does not exist.

      struct S3BucketDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The settings for the source S3 bucket.

      struct S3ImportSource
        include JSON::Serializable

        # The IAM ARN role used to access the source S3 bucket.

        @[JSON::Field(key: "S3BucketAccessRoleArn")]
        getter s3_bucket_access_role_arn : String

        # The Region associated with the source S3 bucket.

        @[JSON::Field(key: "S3BucketRegion")]
        getter s3_bucket_region : String

        # The URI for the source S3 bucket.

        @[JSON::Field(key: "S3LocationUri")]
        getter s3_location_uri : String

        def initialize(
          @s3_bucket_access_role_arn : String,
          @s3_bucket_region : String,
          @s3_location_uri : String
        )
        end
      end


      struct SearchSampleQueriesRequest
        include JSON::Serializable

        # The natural language phrase to use for the semantic search. The phrase must be in English. The
        # length constraint is in characters, not words.

        @[JSON::Field(key: "SearchPhrase")]
        getter search_phrase : String

        # The maximum number of results to return on a single page. The default value is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token you can use to get the next page of results. The length constraint is in characters, not
        # words.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @search_phrase : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchSampleQueriesResponse
        include JSON::Serializable

        # A token you can use to get the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of objects containing the search results ordered from most relevant to least relevant.

        @[JSON::Field(key: "SearchResults")]
        getter search_results : Array(Types::SearchSampleQueriesSearchResult)?

        def initialize(
          @next_token : String? = nil,
          @search_results : Array(Types::SearchSampleQueriesSearchResult)? = nil
        )
        end
      end

      # A search result returned by the SearchSampleQueries operation.

      struct SearchSampleQueriesSearchResult
        include JSON::Serializable

        # A longer description of a sample query.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of a sample query.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A value between 0 and 1 indicating the similarity between the search phrase and result.

        @[JSON::Field(key: "Relevance")]
        getter relevance : Float64?

        # The SQL code of the sample query.

        @[JSON::Field(key: "SQL")]
        getter sql : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @relevance : Float64? = nil,
          @sql : String? = nil
        )
        end
      end

      # This exception is thrown when the quota is exceeded. For information about CloudTrail quotas, see
      # Service quotas in the Amazon Web Services General Reference .

      struct ServiceQuotaExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains configuration information about the channel.

      struct SourceConfig
        include JSON::Serializable

        # The advanced event selectors that are configured for the channel.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # Specifies whether the channel applies to a single Region or to all Regions.

        @[JSON::Field(key: "ApplyToAllRegions")]
        getter apply_to_all_regions : Bool?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @apply_to_all_regions : Bool? = nil
        )
        end
      end


      struct StartDashboardRefreshRequest
        include JSON::Serializable

        # The name or ARN of the dashboard.

        @[JSON::Field(key: "DashboardId")]
        getter dashboard_id : String

        # The query parameter values for the dashboard For custom dashboards, the following query parameters
        # are valid: $StartTime$ , $EndTime$ , and $Period$ . For managed dashboards, the following query
        # parameters are valid: $StartTime$ , $EndTime$ , $Period$ , and $EventDataStoreId$ . The
        # $EventDataStoreId$ query parameter is required.

        @[JSON::Field(key: "QueryParameterValues")]
        getter query_parameter_values : Hash(String, String)?

        def initialize(
          @dashboard_id : String,
          @query_parameter_values : Hash(String, String)? = nil
        )
        end
      end


      struct StartDashboardRefreshResponse
        include JSON::Serializable

        # The refresh ID for the dashboard.

        @[JSON::Field(key: "RefreshId")]
        getter refresh_id : String?

        def initialize(
          @refresh_id : String? = nil
        )
        end
      end


      struct StartEventDataStoreIngestionRequest
        include JSON::Serializable

        # The ARN (or ID suffix of the ARN) of the event data store for which you want to start ingestion.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        def initialize(
          @event_data_store : String
        )
        end
      end


      struct StartEventDataStoreIngestionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartImportRequest
        include JSON::Serializable

        # The ARN of the destination event data store. Use this parameter for a new import.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(String)?

        # Use with StartEventTime to bound a StartImport request, and limit imported trail events to only
        # those events logged within a specified time period. When you specify a time range, CloudTrail checks
        # the prefix and log file names to verify the names contain a date between the specified
        # StartEventTime and EndEventTime before attempting to import events.

        @[JSON::Field(key: "EndEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_event_time : Time?

        # The ID of the import. Use this parameter when you are retrying an import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String?

        # The source S3 bucket for the import. Use this parameter for a new import.

        @[JSON::Field(key: "ImportSource")]
        getter import_source : Types::ImportSource?

        # Use with EndEventTime to bound a StartImport request, and limit imported trail events to only those
        # events logged within a specified time period. When you specify a time range, CloudTrail checks the
        # prefix and log file names to verify the names contain a date between the specified StartEventTime
        # and EndEventTime before attempting to import events.

        @[JSON::Field(key: "StartEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_event_time : Time?

        def initialize(
          @destinations : Array(String)? = nil,
          @end_event_time : Time? = nil,
          @import_id : String? = nil,
          @import_source : Types::ImportSource? = nil,
          @start_event_time : Time? = nil
        )
        end
      end


      struct StartImportResponse
        include JSON::Serializable

        # The timestamp for the import's creation.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN of the destination event data store.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(String)?

        # Used with StartEventTime to bound a StartImport request, and limit imported trail events to only
        # those events logged within a specified time period.

        @[JSON::Field(key: "EndEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_event_time : Time?

        # The ID of the import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String?

        # The source S3 bucket for the import.

        @[JSON::Field(key: "ImportSource")]
        getter import_source : Types::ImportSource?

        # Shows the status of the import after a StartImport request. An import finishes with a status of
        # COMPLETED if there were no failures, or FAILED if there were failures.

        @[JSON::Field(key: "ImportStatus")]
        getter import_status : String?

        # Used with EndEventTime to bound a StartImport request, and limit imported trail events to only those
        # events logged within a specified time period.

        @[JSON::Field(key: "StartEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_event_time : Time?

        # The timestamp of the import's last update, if applicable.

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @destinations : Array(String)? = nil,
          @end_event_time : Time? = nil,
          @import_id : String? = nil,
          @import_source : Types::ImportSource? = nil,
          @import_status : String? = nil,
          @start_event_time : Time? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The request to CloudTrail to start logging Amazon Web Services API calls for an account.

      struct StartLoggingRequest
        include JSON::Serializable

        # Specifies the name or the CloudTrail ARN of the trail for which CloudTrail logs Amazon Web Services
        # API calls. The following is the format of a trail ARN.
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct StartLoggingResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartQueryRequest
        include JSON::Serializable

        # The URI for the S3 bucket where CloudTrail delivers the query results.

        @[JSON::Field(key: "DeliveryS3Uri")]
        getter delivery_s3_uri : String?

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        # The alias that identifies a query template.

        @[JSON::Field(key: "QueryAlias")]
        getter query_alias : String?

        # The query parameters for the specified QueryAlias .

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Array(String)?

        # The SQL code of your query.

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String?

        def initialize(
          @delivery_s3_uri : String? = nil,
          @event_data_store_owner_account_id : String? = nil,
          @query_alias : String? = nil,
          @query_parameters : Array(String)? = nil,
          @query_statement : String? = nil
        )
        end
      end


      struct StartQueryResponse
        include JSON::Serializable

        # The account ID of the event data store owner.

        @[JSON::Field(key: "EventDataStoreOwnerAccountId")]
        getter event_data_store_owner_account_id : String?

        # The ID of the started query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        def initialize(
          @event_data_store_owner_account_id : String? = nil,
          @query_id : String? = nil
        )
        end
      end


      struct StopEventDataStoreIngestionRequest
        include JSON::Serializable

        # The ARN (or ID suffix of the ARN) of the event data store for which you want to stop ingestion.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        def initialize(
          @event_data_store : String
        )
        end
      end


      struct StopEventDataStoreIngestionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopImportRequest
        include JSON::Serializable

        # The ID of the import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String

        def initialize(
          @import_id : String
        )
        end
      end


      struct StopImportResponse
        include JSON::Serializable

        # The timestamp of the import's creation.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN of the destination event data store.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(String)?

        # Used with StartEventTime to bound a StartImport request, and limit imported trail events to only
        # those events logged within a specified time period.

        @[JSON::Field(key: "EndEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_event_time : Time?

        # The ID for the import.

        @[JSON::Field(key: "ImportId")]
        getter import_id : String?

        # The source S3 bucket for the import.

        @[JSON::Field(key: "ImportSource")]
        getter import_source : Types::ImportSource?

        # Returns information on the stopped import.

        @[JSON::Field(key: "ImportStatistics")]
        getter import_statistics : Types::ImportStatistics?

        # The status of the import.

        @[JSON::Field(key: "ImportStatus")]
        getter import_status : String?

        # Used with EndEventTime to bound a StartImport request, and limit imported trail events to only those
        # events logged within a specified time period.

        @[JSON::Field(key: "StartEventTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_event_time : Time?

        # The timestamp of the import's last update.

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @destinations : Array(String)? = nil,
          @end_event_time : Time? = nil,
          @import_id : String? = nil,
          @import_source : Types::ImportSource? = nil,
          @import_statistics : Types::ImportStatistics? = nil,
          @import_status : String? = nil,
          @start_event_time : Time? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # Passes the request to CloudTrail to stop logging Amazon Web Services API calls for the specified
      # account.

      struct StopLoggingRequest
        include JSON::Serializable

        # Specifies the name or the CloudTrail ARN of the trail for which CloudTrail will stop logging Amazon
        # Web Services API calls. The following is the format of a trail ARN.
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct StopLoggingResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A custom key-value pair associated with a resource such as a CloudTrail trail, event data store,
      # dashboard, or channel.

      struct Tag
        include JSON::Serializable

        # The key in a key-value pair. The key must be must be no longer than 128 Unicode characters. The key
        # must be unique for the resource to which it applies.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value in a key-value pair of a tag. The value must be no longer than 256 Unicode characters.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # The number of tags per trail, event data store, dashboard, or channel has exceeded the permitted
      # amount. Currently, the limit is 50.

      struct TagsLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the request rate exceeds the limit.

      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end

      # The settings for a trail.

      struct Trail
        include JSON::Serializable

        # Specifies an Amazon Resource Name (ARN), a unique identifier that represents the log group to which
        # CloudTrail logs will be delivered.

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String?

        # Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.

        @[JSON::Field(key: "CloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String?

        # Specifies if the trail has custom event selectors.

        @[JSON::Field(key: "HasCustomEventSelectors")]
        getter has_custom_event_selectors : Bool?

        # Specifies whether a trail has insight types specified in an InsightSelector list.

        @[JSON::Field(key: "HasInsightSelectors")]
        getter has_insight_selectors : Bool?

        # The Region in which the trail was created.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        # Set to True to include Amazon Web Services API calls from Amazon Web Services global services such
        # as IAM. Otherwise, False .

        @[JSON::Field(key: "IncludeGlobalServiceEvents")]
        getter include_global_service_events : Bool?

        # Specifies whether the trail exists only in one Region or exists in all Regions.

        @[JSON::Field(key: "IsMultiRegionTrail")]
        getter is_multi_region_trail : Bool?

        # Specifies whether the trail is an organization trail.

        @[JSON::Field(key: "IsOrganizationTrail")]
        getter is_organization_trail : Bool?

        # Specifies the KMS key ID that encrypts the logs and digest files delivered by CloudTrail. The value
        # is a fully specified ARN to a KMS key in the following format.
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether log file validation is enabled.

        @[JSON::Field(key: "LogFileValidationEnabled")]
        getter log_file_validation_enabled : Bool?

        # Name of the trail set by calling CreateTrail . The maximum length is 128 characters.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Name of the Amazon S3 bucket into which CloudTrail delivers your trail files. See Amazon S3 Bucket
        # naming rules .

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for
        # log file delivery. For more information, see Finding Your CloudTrail Log Files . The maximum length
        # is 200 characters.

        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        # Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files
        # are delivered. The following is the format of a topic ARN.
        # arn:aws:sns:us-east-2:123456789012:MyTopic

        @[JSON::Field(key: "SnsTopicARN")]
        getter sns_topic_arn : String?

        # This field is no longer in use. Use SnsTopicARN .

        @[JSON::Field(key: "SnsTopicName")]
        getter sns_topic_name : String?

        # Specifies the ARN of the trail. The following is the format of a trail ARN.
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @cloud_watch_logs_log_group_arn : String? = nil,
          @cloud_watch_logs_role_arn : String? = nil,
          @has_custom_event_selectors : Bool? = nil,
          @has_insight_selectors : Bool? = nil,
          @home_region : String? = nil,
          @include_global_service_events : Bool? = nil,
          @is_multi_region_trail : Bool? = nil,
          @is_organization_trail : Bool? = nil,
          @kms_key_id : String? = nil,
          @log_file_validation_enabled : Bool? = nil,
          @name : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_key_prefix : String? = nil,
          @sns_topic_arn : String? = nil,
          @sns_topic_name : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end

      # This exception is thrown when the specified trail already exists.

      struct TrailAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a CloudTrail trail, including the trail's name, home Region, and Amazon Resource
      # Name (ARN).

      struct TrailInfo
        include JSON::Serializable

        # The Amazon Web Services Region in which a trail was created.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        # The name of a trail.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of a trail.

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @home_region : String? = nil,
          @name : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end

      # This exception is thrown when the trail with the given name is not found.

      struct TrailNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is no longer in use.

      struct TrailNotProvidedException
        include JSON::Serializable

        def initialize
        end
      end

      # This exception is thrown when the requested operation is not supported.

      struct UnsupportedOperationException
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateChannelRequest
        include JSON::Serializable

        # The ARN or ID (the ARN suffix) of the channel that you want to update.

        @[JSON::Field(key: "Channel")]
        getter channel : String

        # The ARNs of event data stores that you want to log events arriving through the channel.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Destination)?

        # Changes the name of the channel.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @channel : String,
          @destinations : Array(Types::Destination)? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateChannelResponse
        include JSON::Serializable

        # The ARN of the channel that was updated.

        @[JSON::Field(key: "ChannelArn")]
        getter channel_arn : String?

        # The event data stores that log events arriving through the channel.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::Destination)?

        # The name of the channel that was updated.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The event source of the channel that was updated.

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @channel_arn : String? = nil,
          @destinations : Array(Types::Destination)? = nil,
          @name : String? = nil,
          @source : String? = nil
        )
        end
      end


      struct UpdateDashboardRequest
        include JSON::Serializable

        # The name or ARN of the dashboard.

        @[JSON::Field(key: "DashboardId")]
        getter dashboard_id : String

        # The refresh schedule configuration for the dashboard.

        @[JSON::Field(key: "RefreshSchedule")]
        getter refresh_schedule : Types::RefreshSchedule?

        # Specifies whether termination protection is enabled for the dashboard. If termination protection is
        # enabled, you cannot delete the dashboard until termination protection is disabled.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # An array of widgets for the dashboard. A custom dashboard can have a maximum of 10 widgets. To add
        # new widgets, pass in an array that includes the existing widgets along with any new widgets. Run the
        # GetDashboard operation to get the list of widgets for the dashboard. To remove widgets, pass in an
        # array that includes the existing widgets minus the widgets you want removed.

        @[JSON::Field(key: "Widgets")]
        getter widgets : Array(Types::RequestWidget)?

        def initialize(
          @dashboard_id : String,
          @refresh_schedule : Types::RefreshSchedule? = nil,
          @termination_protection_enabled : Bool? = nil,
          @widgets : Array(Types::RequestWidget)? = nil
        )
        end
      end


      struct UpdateDashboardResponse
        include JSON::Serializable

        # The timestamp that shows when the dashboard was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN for the dashboard.

        @[JSON::Field(key: "DashboardArn")]
        getter dashboard_arn : String?

        # The name for the dashboard.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The refresh schedule for the dashboard, if configured.

        @[JSON::Field(key: "RefreshSchedule")]
        getter refresh_schedule : Types::RefreshSchedule?

        # Indicates whether termination protection is enabled for the dashboard.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # The type of dashboard.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The timestamp that shows when the dashboard was updated.

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        # An array of widgets for the dashboard.

        @[JSON::Field(key: "Widgets")]
        getter widgets : Array(Types::Widget)?

        def initialize(
          @created_timestamp : Time? = nil,
          @dashboard_arn : String? = nil,
          @name : String? = nil,
          @refresh_schedule : Types::RefreshSchedule? = nil,
          @termination_protection_enabled : Bool? = nil,
          @type : String? = nil,
          @updated_timestamp : Time? = nil,
          @widgets : Array(Types::Widget)? = nil
        )
        end
      end


      struct UpdateEventDataStoreRequest
        include JSON::Serializable

        # The ARN (or the ID suffix of the ARN) of the event data store that you want to update.

        @[JSON::Field(key: "EventDataStore")]
        getter event_data_store : String

        # The advanced event selectors used to select events for the event data store. You can configure up to
        # five advanced event selectors for each event data store.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # You can't change the billing mode from EXTENDABLE_RETENTION_PRICING to FIXED_RETENTION_PRICING . If
        # BillingMode is set to EXTENDABLE_RETENTION_PRICING and you want to use FIXED_RETENTION_PRICING
        # instead, you'll need to stop ingestion on the event data store and create a new event data store
        # that uses FIXED_RETENTION_PRICING . The billing mode for the event data store determines the cost
        # for ingesting events and the default and maximum retention period for the event data store. The
        # following are the possible values: EXTENDABLE_RETENTION_PRICING - This billing mode is generally
        # recommended if you want a flexible retention period of up to 3653 days (about 10 years). The default
        # retention period for this billing mode is 366 days. FIXED_RETENTION_PRICING - This billing mode is
        # recommended if you expect to ingest more than 25 TB of event data per month and need a retention
        # period of up to 2557 days (about 7 years). The default retention period for this billing mode is
        # 2557 days. For more information about CloudTrail pricing, see CloudTrail Pricing and Managing
        # CloudTrail Lake costs .

        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # Specifies the KMS key ID to use to encrypt the events delivered by CloudTrail. The value can be an
        # alias name prefixed by alias/ , a fully specified ARN to an alias, a fully specified ARN to a key,
        # or a globally unique identifier. Disabling or deleting the KMS key, or removing CloudTrail
        # permissions on the key, prevents CloudTrail from logging events to the event data store, and
        # prevents users from querying the data in the event data store that was encrypted with the key. After
        # you associate an event data store with a KMS key, the KMS key cannot be removed or changed. Before
        # you disable or delete a KMS key that you are using with an event data store, delete or back up your
        # event data store. CloudTrail also supports KMS multi-Region keys. For more information about
        # multi-Region keys, see Using multi-Region keys in the Key Management Service Developer Guide .
        # Examples: alias/MyAliasName arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether an event data store collects events from all Regions, or only from the Region in
        # which it was created.

        @[JSON::Field(key: "MultiRegionEnabled")]
        getter multi_region_enabled : Bool?

        # The event data store name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies whether an event data store collects events logged for an organization in Organizations.
        # Only the management account for the organization can convert an organization event data store to a
        # non-organization event data store, or convert a non-organization event data store to an organization
        # event data store.

        @[JSON::Field(key: "OrganizationEnabled")]
        getter organization_enabled : Bool?

        # The retention period of the event data store, in days. If BillingMode is set to
        # EXTENDABLE_RETENTION_PRICING , you can set a retention period of up to 3653 days, the equivalent of
        # 10 years. If BillingMode is set to FIXED_RETENTION_PRICING , you can set a retention period of up to
        # 2557 days, the equivalent of seven years. CloudTrail Lake determines whether to retain an event by
        # checking if the eventTime of the event is within the specified retention period. For example, if you
        # set a retention period of 90 days, CloudTrail will remove events when the eventTime is older than 90
        # days. If you decrease the retention period of an event data store, CloudTrail will remove any events
        # with an eventTime older than the new retention period. For example, if the previous retention period
        # was 365 days and you decrease it to 100 days, CloudTrail will remove events with an eventTime older
        # than 100 days.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # Indicates that termination protection is enabled and the event data store cannot be automatically
        # deleted.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        def initialize(
          @event_data_store : String,
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @billing_mode : String? = nil,
          @kms_key_id : String? = nil,
          @multi_region_enabled : Bool? = nil,
          @name : String? = nil,
          @organization_enabled : Bool? = nil,
          @retention_period : Int32? = nil,
          @termination_protection_enabled : Bool? = nil
        )
        end
      end


      struct UpdateEventDataStoreResponse
        include JSON::Serializable

        # The advanced event selectors that are applied to the event data store.

        @[JSON::Field(key: "AdvancedEventSelectors")]
        getter advanced_event_selectors : Array(Types::AdvancedEventSelector)?

        # The billing mode for the event data store.

        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # The timestamp that shows when an event data store was first created.

        @[JSON::Field(key: "CreatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The ARN of the event data store.

        @[JSON::Field(key: "EventDataStoreArn")]
        getter event_data_store_arn : String?

        # If Lake query federation is enabled, provides the ARN of the federation role used to access the
        # resources for the federated event data store.

        @[JSON::Field(key: "FederationRoleArn")]
        getter federation_role_arn : String?

        # Indicates the Lake query federation status. The status is ENABLED if Lake query federation is
        # enabled, or DISABLED if Lake query federation is disabled. You cannot delete an event data store if
        # the FederationStatus is ENABLED .

        @[JSON::Field(key: "FederationStatus")]
        getter federation_status : String?

        # Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully
        # specified ARN to a KMS key in the following format.
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Indicates whether the event data store includes events from all Regions, or only from the Region in
        # which it was created.

        @[JSON::Field(key: "MultiRegionEnabled")]
        getter multi_region_enabled : Bool?

        # The name of the event data store.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether an event data store is collecting logged events for an organization in
        # Organizations.

        @[JSON::Field(key: "OrganizationEnabled")]
        getter organization_enabled : Bool?

        # The retention period, in days.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Int32?

        # The status of an event data store.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indicates whether termination protection is enabled for the event data store.

        @[JSON::Field(key: "TerminationProtectionEnabled")]
        getter termination_protection_enabled : Bool?

        # The timestamp that shows when the event data store was last updated. UpdatedTimestamp is always
        # either the same or newer than the time shown in CreatedTimestamp .

        @[JSON::Field(key: "UpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_timestamp : Time?

        def initialize(
          @advanced_event_selectors : Array(Types::AdvancedEventSelector)? = nil,
          @billing_mode : String? = nil,
          @created_timestamp : Time? = nil,
          @event_data_store_arn : String? = nil,
          @federation_role_arn : String? = nil,
          @federation_status : String? = nil,
          @kms_key_id : String? = nil,
          @multi_region_enabled : Bool? = nil,
          @name : String? = nil,
          @organization_enabled : Bool? = nil,
          @retention_period : Int32? = nil,
          @status : String? = nil,
          @termination_protection_enabled : Bool? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # Specifies settings to update for the trail.

      struct UpdateTrailRequest
        include JSON::Serializable

        # Specifies the name of the trail or trail ARN. If Name is a trail name, the string must meet the
        # following requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
        # underscores (_), or dashes (-) Start with a letter or number, and end with a letter or number Be
        # between 3 and 128 characters Have no adjacent periods, underscores or dashes. Names like
        # my-_namespace and my--namespace are not valid. Not be in IP address format (for example,
        # 192.168.5.4) If Name is a trail ARN, it must be in the following format.
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies a log group name using an Amazon Resource Name (ARN), a unique identifier that represents
        # the log group to which CloudTrail logs are delivered. You must use a log group that exists in your
        # account. Not required unless you specify CloudWatchLogsRoleArn .

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String?

        # Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group. You
        # must use a role that exists in your account.

        @[JSON::Field(key: "CloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String?

        # Specifies whether log file validation is enabled. The default is false. When you disable log file
        # integrity validation, the chain of digest files is broken after one hour. CloudTrail does not create
        # digest files for log files that were delivered during a period in which log file integrity
        # validation was disabled. For example, if you enable log file integrity validation at noon on January
        # 1, disable it at noon on January 2, and re-enable it at noon on January 10, digest files will not be
        # created for the log files delivered from noon on January 2 to noon on January 10. The same applies
        # whenever you stop CloudTrail logging or delete a trail.

        @[JSON::Field(key: "EnableLogFileValidation")]
        getter enable_log_file_validation : Bool?

        # Specifies whether the trail is publishing events from global services such as IAM to the log files.

        @[JSON::Field(key: "IncludeGlobalServiceEvents")]
        getter include_global_service_events : Bool?

        # Specifies whether the trail applies only to the current Region or to all Regions. The default is
        # false. If the trail exists only in the current Region and this value is set to true, shadow trails
        # (replications of the trail) will be created in the other Regions. If the trail exists in all Regions
        # and this value is set to false, the trail will remain in the Region where it was created, and its
        # shadow trails in other Regions will be deleted. As a best practice, consider using trails that log
        # events in all Regions.

        @[JSON::Field(key: "IsMultiRegionTrail")]
        getter is_multi_region_trail : Bool?

        # Specifies whether the trail is applied to all accounts in an organization in Organizations, or only
        # for the current Amazon Web Services account. The default is false, and cannot be true unless the
        # call is made on behalf of an Amazon Web Services account that is the management account for an
        # organization in Organizations. If the trail is not an organization trail and this is set to true ,
        # the trail will be created in all Amazon Web Services accounts that belong to the organization. If
        # the trail is an organization trail and this is set to false , the trail will remain in the current
        # Amazon Web Services account but be deleted from all member accounts in the organization. Only the
        # management account for the organization can convert an organization trail to a non-organization
        # trail, or convert a non-organization trail to an organization trail.

        @[JSON::Field(key: "IsOrganizationTrail")]
        getter is_organization_trail : Bool?

        # Specifies the KMS key ID to use to encrypt the logs and digest files delivered by CloudTrail. The
        # value can be an alias name prefixed by "alias/", a fully specified ARN to an alias, a fully
        # specified ARN to a key, or a globally unique identifier. CloudTrail also supports KMS multi-Region
        # keys. For more information about multi-Region keys, see Using multi-Region keys in the Key
        # Management Service Developer Guide . Examples: alias/MyAliasName
        # arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the name of the Amazon S3 bucket designated for publishing log files. See Amazon S3 Bucket
        # naming rules .

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for
        # log file delivery. For more information, see Finding Your CloudTrail Log Files . The maximum length
        # is 200 characters.

        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        # Specifies the name or ARN of the Amazon SNS topic defined for notification of log file delivery. The
        # maximum length is 256 characters.

        @[JSON::Field(key: "SnsTopicName")]
        getter sns_topic_name : String?

        def initialize(
          @name : String,
          @cloud_watch_logs_log_group_arn : String? = nil,
          @cloud_watch_logs_role_arn : String? = nil,
          @enable_log_file_validation : Bool? = nil,
          @include_global_service_events : Bool? = nil,
          @is_multi_region_trail : Bool? = nil,
          @is_organization_trail : Bool? = nil,
          @kms_key_id : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_key_prefix : String? = nil,
          @sns_topic_name : String? = nil
        )
        end
      end

      # Returns the objects or data listed below if successful. Otherwise, returns an error.

      struct UpdateTrailResponse
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the log group to which CloudTrail logs are delivered.

        @[JSON::Field(key: "CloudWatchLogsLogGroupArn")]
        getter cloud_watch_logs_log_group_arn : String?

        # Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.

        @[JSON::Field(key: "CloudWatchLogsRoleArn")]
        getter cloud_watch_logs_role_arn : String?

        # Specifies whether the trail is publishing events from global services such as IAM to the log files.

        @[JSON::Field(key: "IncludeGlobalServiceEvents")]
        getter include_global_service_events : Bool?

        # Specifies whether the trail exists in one Region or in all Regions.

        @[JSON::Field(key: "IsMultiRegionTrail")]
        getter is_multi_region_trail : Bool?

        # Specifies whether the trail is an organization trail.

        @[JSON::Field(key: "IsOrganizationTrail")]
        getter is_organization_trail : Bool?

        # Specifies the KMS key ID that encrypts the logs and digest files delivered by CloudTrail. The value
        # is a fully specified ARN to a KMS key in the following format.
        # arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies whether log file integrity validation is enabled.

        @[JSON::Field(key: "LogFileValidationEnabled")]
        getter log_file_validation_enabled : Bool?

        # Specifies the name of the trail.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the name of the Amazon S3 bucket designated for publishing log files.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for
        # log file delivery. For more information, see Finding Your IAM Log Files .

        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        # Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files
        # are delivered. The following is the format of a topic ARN.
        # arn:aws:sns:us-east-2:123456789012:MyTopic

        @[JSON::Field(key: "SnsTopicARN")]
        getter sns_topic_arn : String?

        # This field is no longer in use. Use SnsTopicARN .

        @[JSON::Field(key: "SnsTopicName")]
        getter sns_topic_name : String?

        # Specifies the ARN of the trail that was updated. The following is the format of a trail ARN.
        # arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail

        @[JSON::Field(key: "TrailARN")]
        getter trail_arn : String?

        def initialize(
          @cloud_watch_logs_log_group_arn : String? = nil,
          @cloud_watch_logs_role_arn : String? = nil,
          @include_global_service_events : Bool? = nil,
          @is_multi_region_trail : Bool? = nil,
          @is_organization_trail : Bool? = nil,
          @kms_key_id : String? = nil,
          @log_file_validation_enabled : Bool? = nil,
          @name : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_key_prefix : String? = nil,
          @sns_topic_arn : String? = nil,
          @sns_topic_name : String? = nil,
          @trail_arn : String? = nil
        )
        end
      end

      # A widget on a CloudTrail Lake dashboard.

      struct Widget
        include JSON::Serializable

        # The query alias used to identify the query for the widget.

        @[JSON::Field(key: "QueryAlias")]
        getter query_alias : String?

        # The query parameters for the widget.

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Array(String)?

        # The SQL query statement for the widget.

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String?

        # The view properties for the widget. For more information about view properties, see View properties
        # for widgets in the CloudTrail User Guide ..

        @[JSON::Field(key: "ViewProperties")]
        getter view_properties : Hash(String, String)?

        def initialize(
          @query_alias : String? = nil,
          @query_parameters : Array(String)? = nil,
          @query_statement : String? = nil,
          @view_properties : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
