require "json"
require "time"

module Aws
  module Health
    module Types

      # The number of entities in an account that are impacted by a specific event aggregated by the entity
      # status codes.

      struct AccountEntityAggregate
        include JSON::Serializable

        # The 12-digit Amazon Web Services account numbers that contains the affected entities.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The number of entities that match the filter criteria for the specified events.

        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The number of affected entities aggregated by the entity status codes.

        @[JSON::Field(key: "statuses")]
        getter statuses : Hash(String, Int32)?

        def initialize(
          @account_id : String? = nil,
          @count : Int32? = nil,
          @statuses : Hash(String, Int32)? = nil
        )
        end
      end

      # Information about an entity that is affected by a Health event.

      struct AffectedEntity
        include JSON::Serializable

        # The 12-digit Amazon Web Services account number that contains the affected entity.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The unique identifier for the entity. Format: arn:aws:health: entity-region : aws-account :entity/
        # entity-id . Example: arn:aws:health:us-east-1:111222333444:entity/AVh5GGT7ul1arKr1sE1K

        @[JSON::Field(key: "entityArn")]
        getter entity_arn : String?

        # Additional metadata about the affected entity.

        @[JSON::Field(key: "entityMetadata")]
        getter entity_metadata : Hash(String, String)?

        # The URL of the affected entity.

        @[JSON::Field(key: "entityUrl")]
        getter entity_url : String?

        # The ID of the affected entity.

        @[JSON::Field(key: "entityValue")]
        getter entity_value : String?

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String?

        # The most recent time that the entity was updated.

        @[JSON::Field(key: "lastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The most recent status of the entity affected by the event. The possible values are IMPAIRED ,
        # UNIMPAIRED , UNKNOWN , PENDING , and RESOLVED .

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        # A map of entity tags attached to the affected entity. Currently, the tags property isn't supported.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @aws_account_id : String? = nil,
          @entity_arn : String? = nil,
          @entity_metadata : Hash(String, String)? = nil,
          @entity_url : String? = nil,
          @entity_value : String? = nil,
          @event_arn : String? = nil,
          @last_updated_time : Time? = nil,
          @status_code : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # EnableHealthServiceAccessForOrganization is already in progress. Wait for the action to complete
      # before trying again. To get the current status, use the DescribeHealthServiceStatusForOrganization
      # operation.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A range of dates and times that is used by the EventFilter and EntityFilter objects. If from is set
      # and to is set: match items where the timestamp ( startTime , endTime , or lastUpdatedTime ) is
      # between from and to inclusive. If from is set and to is not set: match items where the timestamp
      # value is equal to or after from . If from is not set and to is set: match items where the timestamp
      # value is equal to or before to .

      struct DateTimeRange
        include JSON::Serializable

        # The starting date and time of a time range.

        @[JSON::Field(key: "from", converter: Aws::Runtime::UnixTimestampConverter)]
        getter from : Time?

        # The ending date and time of a time range.

        @[JSON::Field(key: "to", converter: Aws::Runtime::UnixTimestampConverter)]
        getter to : Time?

        def initialize(
          @from : Time? = nil,
          @to : Time? = nil
        )
        end
      end


      struct DescribeAffectedAccountsForOrganizationRequest
        include JSON::Serializable

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String

        # The maximum number of items to return in one batch, between 10 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAffectedAccountsForOrganizationResponse
        include JSON::Serializable

        # A JSON set of elements of the affected accounts.

        @[JSON::Field(key: "affectedAccounts")]
        getter affected_accounts : Array(String)?

        # This parameter specifies if the Health event is a public Amazon Web Services service event or an
        # account-specific event. If the eventScopeCode value is PUBLIC , then the affectedAccounts value is
        # always empty. If the eventScopeCode value is ACCOUNT_SPECIFIC , then the affectedAccounts value
        # lists the affected Amazon Web Services accounts in your organization. For example, if an event
        # affects a service such as Amazon Elastic Compute Cloud and you have Amazon Web Services accounts
        # that use that service, those account IDs appear in the response. If the eventScopeCode value is NONE
        # , then the eventArn that you specified in the request is invalid or doesn't exist.

        @[JSON::Field(key: "eventScopeCode")]
        getter event_scope_code : String?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @affected_accounts : Array(String)? = nil,
          @event_scope_code : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAffectedEntitiesForOrganizationRequest
        include JSON::Serializable

        # The locale (language) to return information in. English (en) is the default and the only supported
        # value at this time.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of items to return in one batch, between 10 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A JSON set of elements including the awsAccountId , eventArn and a set of statusCodes .

        @[JSON::Field(key: "organizationEntityAccountFilters")]
        getter organization_entity_account_filters : Array(Types::EntityAccountFilter)?

        # A JSON set of elements including the awsAccountId and the eventArn .

        @[JSON::Field(key: "organizationEntityFilters")]
        getter organization_entity_filters : Array(Types::EventAccountFilter)?

        def initialize(
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organization_entity_account_filters : Array(Types::EntityAccountFilter)? = nil,
          @organization_entity_filters : Array(Types::EventAccountFilter)? = nil
        )
        end
      end


      struct DescribeAffectedEntitiesForOrganizationResponse
        include JSON::Serializable

        # A JSON set of elements including the awsAccountId and its entityArn , entityValue and its entityArn
        # , lastUpdatedTime , and statusCode .

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::AffectedEntity)?

        # A JSON set of elements of the failed response, including the awsAccountId , errorMessage , errorName
        # , and eventArn .

        @[JSON::Field(key: "failedSet")]
        getter failed_set : Array(Types::OrganizationAffectedEntitiesErrorItem)?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::AffectedEntity)? = nil,
          @failed_set : Array(Types::OrganizationAffectedEntitiesErrorItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAffectedEntitiesRequest
        include JSON::Serializable

        # Values to narrow the results returned. At least one event ARN is required.

        @[JSON::Field(key: "filter")]
        getter filter : Types::EntityFilter

        # The locale (language) to return information in. English (en) is the default and the only supported
        # value at this time.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of items to return in one batch, between 10 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EntityFilter,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAffectedEntitiesResponse
        include JSON::Serializable

        # The entities that match the filter criteria.

        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::AffectedEntity)?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @entities : Array(Types::AffectedEntity)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEntityAggregatesForOrganizationRequest
        include JSON::Serializable

        # A list of event ARNs (unique identifiers). For example:
        # "arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
        # "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"

        @[JSON::Field(key: "eventArns")]
        getter event_arns : Array(String)

        # A list of 12-digit Amazon Web Services account numbers that contains the affected entities.

        @[JSON::Field(key: "awsAccountIds")]
        getter aws_account_ids : Array(String)?

        def initialize(
          @event_arns : Array(String),
          @aws_account_ids : Array(String)? = nil
        )
        end
      end


      struct DescribeEntityAggregatesForOrganizationResponse
        include JSON::Serializable

        # The list of entity aggregates for each of the specified accounts that are affected by each of the
        # specified events.

        @[JSON::Field(key: "organizationEntityAggregates")]
        getter organization_entity_aggregates : Array(Types::OrganizationEntityAggregate)?

        def initialize(
          @organization_entity_aggregates : Array(Types::OrganizationEntityAggregate)? = nil
        )
        end
      end


      struct DescribeEntityAggregatesRequest
        include JSON::Serializable

        # A list of event ARNs (unique identifiers). For example:
        # "arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
        # "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"

        @[JSON::Field(key: "eventArns")]
        getter event_arns : Array(String)?

        def initialize(
          @event_arns : Array(String)? = nil
        )
        end
      end


      struct DescribeEntityAggregatesResponse
        include JSON::Serializable

        # The number of entities that are affected by each of the specified events.

        @[JSON::Field(key: "entityAggregates")]
        getter entity_aggregates : Array(Types::EntityAggregate)?

        def initialize(
          @entity_aggregates : Array(Types::EntityAggregate)? = nil
        )
        end
      end


      struct DescribeEventAggregatesRequest
        include JSON::Serializable

        # The only currently supported value is eventTypeCategory .

        @[JSON::Field(key: "aggregateField")]
        getter aggregate_field : String

        # Values to narrow the results returned.

        @[JSON::Field(key: "filter")]
        getter filter : Types::EventFilter?

        # The maximum number of items to return in one batch, between 10 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @aggregate_field : String,
          @filter : Types::EventFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventAggregatesResponse
        include JSON::Serializable

        # The number of events in each category that meet the optional filter criteria.

        @[JSON::Field(key: "eventAggregates")]
        getter event_aggregates : Array(Types::EventAggregate)?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_aggregates : Array(Types::EventAggregate)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventDetailsForOrganizationRequest
        include JSON::Serializable

        # A set of JSON elements that includes the awsAccountId and the eventArn .

        @[JSON::Field(key: "organizationEventDetailFilters")]
        getter organization_event_detail_filters : Array(Types::EventAccountFilter)

        # The locale (language) to return information in. English (en) is the default and the only supported
        # value at this time.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @organization_event_detail_filters : Array(Types::EventAccountFilter),
          @locale : String? = nil
        )
        end
      end


      struct DescribeEventDetailsForOrganizationResponse
        include JSON::Serializable

        # Error messages for any events that could not be retrieved.

        @[JSON::Field(key: "failedSet")]
        getter failed_set : Array(Types::OrganizationEventDetailsErrorItem)?

        # Information about the events that could be retrieved.

        @[JSON::Field(key: "successfulSet")]
        getter successful_set : Array(Types::OrganizationEventDetails)?

        def initialize(
          @failed_set : Array(Types::OrganizationEventDetailsErrorItem)? = nil,
          @successful_set : Array(Types::OrganizationEventDetails)? = nil
        )
        end
      end


      struct DescribeEventDetailsRequest
        include JSON::Serializable

        # A list of event ARNs (unique identifiers). For example:
        # "arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
        # "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"

        @[JSON::Field(key: "eventArns")]
        getter event_arns : Array(String)

        # The locale (language) to return information in. English (en) is the default and the only supported
        # value at this time.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @event_arns : Array(String),
          @locale : String? = nil
        )
        end
      end


      struct DescribeEventDetailsResponse
        include JSON::Serializable

        # Error messages for any events that could not be retrieved.

        @[JSON::Field(key: "failedSet")]
        getter failed_set : Array(Types::EventDetailsErrorItem)?

        # Information about the events that could be retrieved.

        @[JSON::Field(key: "successfulSet")]
        getter successful_set : Array(Types::EventDetails)?

        def initialize(
          @failed_set : Array(Types::EventDetailsErrorItem)? = nil,
          @successful_set : Array(Types::EventDetails)? = nil
        )
        end
      end


      struct DescribeEventTypesRequest
        include JSON::Serializable

        # Values to narrow the results returned.

        @[JSON::Field(key: "filter")]
        getter filter : Types::EventTypeFilter?

        # The locale (language) to return information in. English (en) is the default and the only supported
        # value at this time.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of items to return in one batch, between 10 and 100, inclusive. If you don't
        # specify the maxResults parameter, this operation returns a maximum of 30 items by default.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EventTypeFilter? = nil,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventTypesResponse
        include JSON::Serializable

        # A list of event types that match the filter criteria. Event types have a category ( issue ,
        # accountNotification , or scheduledChange ), a service (for example, EC2 , RDS , DATAPIPELINE ,
        # BILLING ), and a code (in the format AWS_ SERVICE _ DESCRIPTION ; for example,
        # AWS_EC2_SYSTEM_MAINTENANCE_EVENT ).

        @[JSON::Field(key: "eventTypes")]
        getter event_types : Array(Types::EventType)?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_types : Array(Types::EventType)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventsForOrganizationRequest
        include JSON::Serializable

        # Values to narrow the results returned.

        @[JSON::Field(key: "filter")]
        getter filter : Types::OrganizationEventFilter?

        # The locale (language) to return information in. English (en) is the default and the only supported
        # value at this time.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of items to return in one batch, between 10 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::OrganizationEventFilter? = nil,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventsForOrganizationResponse
        include JSON::Serializable

        # The events that match the specified filter criteria.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::OrganizationEvent)?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::OrganizationEvent)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventsRequest
        include JSON::Serializable

        # Values to narrow the results returned.

        @[JSON::Field(key: "filter")]
        getter filter : Types::EventFilter?

        # The locale (language) to return information in. English (en) is the default and the only supported
        # value at this time.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The maximum number of items to return in one batch, between 10 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EventFilter? = nil,
          @locale : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventsResponse
        include JSON::Serializable

        # The events that match the specified filter criteria.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::Event)?

        # If the results of a search are large, only a portion of the results are returned, and a nextToken
        # pagination token is returned in the response. To retrieve the next batch of results, reissue the
        # search request and include the returned token. When all results have been returned, the response
        # does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeHealthServiceStatusForOrganizationResponse
        include JSON::Serializable

        # Information about the status of enabling or disabling the Health organizational view feature in your
        # organization. Valid values are ENABLED | DISABLED | PENDING .

        @[JSON::Field(key: "healthServiceAccessStatusForOrganization")]
        getter health_service_access_status_for_organization : String?

        def initialize(
          @health_service_access_status_for_organization : String? = nil
        )
        end
      end

      # A JSON set of elements including the awsAccountId , eventArn and a set of statusCodes .

      struct EntityAccountFilter
        include JSON::Serializable

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String

        # The 12-digit Amazon Web Services account numbers that contains the affected entities.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # A list of entity status codes.

        @[JSON::Field(key: "statusCodes")]
        getter status_codes : Array(String)?

        def initialize(
          @event_arn : String,
          @aws_account_id : String? = nil,
          @status_codes : Array(String)? = nil
        )
        end
      end

      # The number of entities that are affected by one or more events. Returned by the
      # DescribeEntityAggregates operation.

      struct EntityAggregate
        include JSON::Serializable

        # The number of entities that match the criteria for the specified events.

        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String?

        # The number of affected entities aggregated by the entity status codes.

        @[JSON::Field(key: "statuses")]
        getter statuses : Hash(String, Int32)?

        def initialize(
          @count : Int32? = nil,
          @event_arn : String? = nil,
          @statuses : Hash(String, Int32)? = nil
        )
        end
      end

      # The values to use to filter results from the DescribeAffectedEntities operation.

      struct EntityFilter
        include JSON::Serializable

        # A list of event ARNs (unique identifiers). For example:
        # "arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
        # "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"

        @[JSON::Field(key: "eventArns")]
        getter event_arns : Array(String)

        # A list of entity ARNs (unique identifiers).

        @[JSON::Field(key: "entityArns")]
        getter entity_arns : Array(String)?

        # A list of IDs for affected entities.

        @[JSON::Field(key: "entityValues")]
        getter entity_values : Array(String)?

        # A list of the most recent dates and times that the entity was updated.

        @[JSON::Field(key: "lastUpdatedTimes")]
        getter last_updated_times : Array(Types::DateTimeRange)?

        # A list of entity status codes ( IMPAIRED , UNIMPAIRED , or UNKNOWN ).

        @[JSON::Field(key: "statusCodes")]
        getter status_codes : Array(String)?

        # A map of entity tags attached to the affected entity. Currently, the tags property isn't supported.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Hash(String, String))?

        def initialize(
          @event_arns : Array(String),
          @entity_arns : Array(String)? = nil,
          @entity_values : Array(String)? = nil,
          @last_updated_times : Array(Types::DateTimeRange)? = nil,
          @status_codes : Array(String)? = nil,
          @tags : Array(Hash(String, String))? = nil
        )
        end
      end

      # Summary information about an Health event. Health events can be public or account-specific: Public
      # events might be service events that are not specific to an Amazon Web Services account. For example,
      # if there is an issue with an Amazon Web Services Region, Health provides information about the
      # event, even if you don't use services or resources in that Region. Account-specific events are
      # specific to either your Amazon Web Services account or an account in your organization. For example,
      # if there's an issue with Amazon Elastic Compute Cloud in a Region that you use, Health provides
      # information about the event and the affected resources in the account. You can determine if an event
      # is public or account-specific by using the eventScopeCode parameter. For more information, see
      # eventScopeCode .

      struct Event
        include JSON::Serializable

        # The actionability classification of the event. Possible values are ACTION_REQUIRED ,
        # ACTION_MAY_BE_REQUIRED and INFORMATIONAL . Events with ACTION_REQUIRED actionability require
        # customer action to resolve or mitigate the event. Events with ACTION_MAY_BE_REQUIRED actionability
        # indicates that the current status is unknown or conditional and inspection is needed to determine if
        # action is required. Events with INFORMATIONAL actionability are provided for awareness and do not
        # require immediate action.

        @[JSON::Field(key: "actionability")]
        getter actionability : String?

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Amazon Web Services Availability Zone of the event. For example, us-east-1a.

        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The date and time that the event ended.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # This parameter specifies if the Health event is a public Amazon Web Services service event or an
        # account-specific event. If the eventScopeCode value is PUBLIC , then the affectedAccounts value is
        # always empty. If the eventScopeCode value is ACCOUNT_SPECIFIC , then the affectedAccounts value
        # lists the affected Amazon Web Services accounts in your organization. For example, if an event
        # affects a service such as Amazon Elastic Compute Cloud and you have Amazon Web Services accounts
        # that use that service, those account IDs appear in the response. If the eventScopeCode value is NONE
        # , then the eventArn that you specified in the request is invalid or doesn't exist.

        @[JSON::Field(key: "eventScopeCode")]
        getter event_scope_code : String?

        # A list of event type category codes. Possible values are issue , accountNotification , or
        # scheduledChange . Currently, the investigation value isn't supported at this time.

        @[JSON::Field(key: "eventTypeCategory")]
        getter event_type_category : String?

        # The unique identifier for the event type. The format is AWS_ SERVICE _ DESCRIPTION ; for example,
        # AWS_EC2_SYSTEM_MAINTENANCE_EVENT .

        @[JSON::Field(key: "eventTypeCode")]
        getter event_type_code : String?

        # The most recent date and time that the event was updated.

        @[JSON::Field(key: "lastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # A list of persona classifications that indicate the target audience for the event. Possible values
        # are OPERATIONS , SECURITY , and BILLING . Events can be associated with multiple personas to
        # indicate relevance to different teams or roles within an organization.

        @[JSON::Field(key: "personas")]
        getter personas : Array(String)?

        # The Amazon Web Services Region name of the event.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Web Services service that is affected by the event. For example, EC2 , RDS .

        @[JSON::Field(key: "service")]
        getter service : String?

        # The date and time that the event began.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The most recent status of the event. Possible values are open , closed , and upcoming .

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @actionability : String? = nil,
          @arn : String? = nil,
          @availability_zone : String? = nil,
          @end_time : Time? = nil,
          @event_scope_code : String? = nil,
          @event_type_category : String? = nil,
          @event_type_code : String? = nil,
          @last_updated_time : Time? = nil,
          @personas : Array(String)? = nil,
          @region : String? = nil,
          @service : String? = nil,
          @start_time : Time? = nil,
          @status_code : String? = nil
        )
        end
      end

      # The values used to filter results from the DescribeEventDetailsForOrganization and
      # DescribeAffectedEntitiesForOrganization operations.

      struct EventAccountFilter
        include JSON::Serializable

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String

        # The 12-digit Amazon Web Services account numbers that contains the affected entities.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        def initialize(
          @event_arn : String,
          @aws_account_id : String? = nil
        )
        end
      end

      # The number of events of each issue type. Returned by the DescribeEventAggregates operation.

      struct EventAggregate
        include JSON::Serializable

        # The issue type for the associated count.

        @[JSON::Field(key: "aggregateValue")]
        getter aggregate_value : String?

        # The number of events of the associated issue type.

        @[JSON::Field(key: "count")]
        getter count : Int32?

        def initialize(
          @aggregate_value : String? = nil,
          @count : Int32? = nil
        )
        end
      end

      # The detailed description of the event. Included in the information returned by the
      # DescribeEventDetails operation.

      struct EventDescription
        include JSON::Serializable

        # The most recent description of the event.

        @[JSON::Field(key: "latestDescription")]
        getter latest_description : String?

        def initialize(
          @latest_description : String? = nil
        )
        end
      end

      # Detailed information about an event. A combination of an Event object, an EventDescription object,
      # and additional metadata about the event. Returned by the DescribeEventDetails operation.

      struct EventDetails
        include JSON::Serializable

        # Summary information about the event.

        @[JSON::Field(key: "event")]
        getter event : Types::Event?

        # The most recent description of the event.

        @[JSON::Field(key: "eventDescription")]
        getter event_description : Types::EventDescription?

        # Additional metadata about the event.

        @[JSON::Field(key: "eventMetadata")]
        getter event_metadata : Hash(String, String)?

        def initialize(
          @event : Types::Event? = nil,
          @event_description : Types::EventDescription? = nil,
          @event_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Error information returned when a DescribeEventDetails operation can't find a specified event.

      struct EventDetailsErrorItem
        include JSON::Serializable

        # A message that describes the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of the error.

        @[JSON::Field(key: "errorName")]
        getter error_name : String?

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String?

        def initialize(
          @error_message : String? = nil,
          @error_name : String? = nil,
          @event_arn : String? = nil
        )
        end
      end

      # The values to use to filter results from the DescribeEvents and DescribeEventAggregates operations.

      struct EventFilter
        include JSON::Serializable

        # A list of actionability values to filter events. Use this to filter events based on whether they
        # require action ( ACTION_REQUIRED ), may require action ( ACTION_MAY_BE_REQUIRED ) or are
        # informational ( INFORMATIONAL ).

        @[JSON::Field(key: "actionabilities")]
        getter actionabilities : Array(String)?

        # A list of Amazon Web Services Availability Zones.

        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)?

        # A list of dates and times that the event ended.

        @[JSON::Field(key: "endTimes")]
        getter end_times : Array(Types::DateTimeRange)?

        # A list of entity ARNs (unique identifiers).

        @[JSON::Field(key: "entityArns")]
        getter entity_arns : Array(String)?

        # A list of entity identifiers, such as EC2 instance IDs ( i-34ab692e ) or EBS volumes ( vol-426ab23e
        # ).

        @[JSON::Field(key: "entityValues")]
        getter entity_values : Array(String)?

        # A list of event ARNs (unique identifiers). For example:
        # "arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
        # "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"

        @[JSON::Field(key: "eventArns")]
        getter event_arns : Array(String)?

        # A list of event status codes.

        @[JSON::Field(key: "eventStatusCodes")]
        getter event_status_codes : Array(String)?

        # A list of event type category codes. Possible values are issue , accountNotification , or
        # scheduledChange . Currently, the investigation value isn't supported at this time.

        @[JSON::Field(key: "eventTypeCategories")]
        getter event_type_categories : Array(String)?

        # A list of unique identifiers for event types. For example,
        # "AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".

        @[JSON::Field(key: "eventTypeCodes")]
        getter event_type_codes : Array(String)?

        # A list of dates and times that the event was last updated.

        @[JSON::Field(key: "lastUpdatedTimes")]
        getter last_updated_times : Array(Types::DateTimeRange)?

        # A list of persona values to filter events. Use this to filter events based on their target audience:
        # OPERATIONS , SECURITY , or BILLING .

        @[JSON::Field(key: "personas")]
        getter personas : Array(String)?

        # A list of Amazon Web Services Regions.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        # The Amazon Web Services services associated with the event. For example, EC2 , RDS .

        @[JSON::Field(key: "services")]
        getter services : Array(String)?

        # A list of dates and times that the event began.

        @[JSON::Field(key: "startTimes")]
        getter start_times : Array(Types::DateTimeRange)?

        # A map of entity tags attached to the affected entity. Currently, the tags property isn't supported.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Hash(String, String))?

        def initialize(
          @actionabilities : Array(String)? = nil,
          @availability_zones : Array(String)? = nil,
          @end_times : Array(Types::DateTimeRange)? = nil,
          @entity_arns : Array(String)? = nil,
          @entity_values : Array(String)? = nil,
          @event_arns : Array(String)? = nil,
          @event_status_codes : Array(String)? = nil,
          @event_type_categories : Array(String)? = nil,
          @event_type_codes : Array(String)? = nil,
          @last_updated_times : Array(Types::DateTimeRange)? = nil,
          @personas : Array(String)? = nil,
          @regions : Array(String)? = nil,
          @services : Array(String)? = nil,
          @start_times : Array(Types::DateTimeRange)? = nil,
          @tags : Array(Hash(String, String))? = nil
        )
        end
      end

      # Contains the metadata about a type of event that is reported by Health. The EventType shows the
      # category, service, and the event type code of the event. For example, an issue might be the
      # category, EC2 the service, and AWS_EC2_SYSTEM_MAINTENANCE_EVENT the event type code. You can use the
      # DescribeEventTypes API operation to return this information about an event. You can also use the
      # Amazon CloudWatch Events console to create a rule so that you can get notified or take action when
      # Health delivers a specific event to your Amazon Web Services account. For more information, see
      # Monitor for Health events with Amazon CloudWatch Events in the Health User Guide .

      struct EventType
        include JSON::Serializable

        # The actionability classification of the event. Possible values are ACTION_REQUIRED ,
        # ACTION_MAY_BE_REQUIRED and INFORMATIONAL . Events with ACTION_REQUIRED actionability require
        # customer action to resolve or mitigate the event. Events with ACTION_MAY_BE_REQUIRED actionability
        # indicates that the current status is unknown or conditional and inspection is needed to determine if
        # action is required. Events with INFORMATIONAL actionability are provided for awareness and do not
        # require immediate action.

        @[JSON::Field(key: "actionability")]
        getter actionability : String?

        # A list of event type category codes. Possible values are issue , accountNotification , or
        # scheduledChange . Currently, the investigation value isn't supported at this time.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The unique identifier for the event type. The format is AWS_ SERVICE _ DESCRIPTION ; for example,
        # AWS_EC2_SYSTEM_MAINTENANCE_EVENT .

        @[JSON::Field(key: "code")]
        getter code : String?

        # A list of persona classifications that indicate the target audience for the event. Possible values
        # are OPERATIONS , SECURITY , and BILLING . Events can be associated with multiple personas to
        # indicate relevance to different teams or roles within an organization.

        @[JSON::Field(key: "personas")]
        getter personas : Array(String)?

        # The Amazon Web Services service that is affected by the event. For example, EC2 , RDS .

        @[JSON::Field(key: "service")]
        getter service : String?

        def initialize(
          @actionability : String? = nil,
          @category : String? = nil,
          @code : String? = nil,
          @personas : Array(String)? = nil,
          @service : String? = nil
        )
        end
      end

      # The values to use to filter results from the DescribeEventTypes operation.

      struct EventTypeFilter
        include JSON::Serializable

        # A list of actionability values to filter event types. Possible values are ACTION_REQUIRED ,
        # ACTION_MAY_BE_REQUIRED and INFORMATIONAL .

        @[JSON::Field(key: "actionabilities")]
        getter actionabilities : Array(String)?

        # A list of event type category codes. Possible values are issue , accountNotification , or
        # scheduledChange . Currently, the investigation value isn't supported at this time.

        @[JSON::Field(key: "eventTypeCategories")]
        getter event_type_categories : Array(String)?

        # A list of event type codes.

        @[JSON::Field(key: "eventTypeCodes")]
        getter event_type_codes : Array(String)?

        # A list of persona classifications to filter event types. Possible values are OPERATIONS , SECURITY ,
        # and BILLING .

        @[JSON::Field(key: "personas")]
        getter personas : Array(String)?

        # The Amazon Web Services services associated with the event. For example, EC2 , RDS .

        @[JSON::Field(key: "services")]
        getter services : Array(String)?

        def initialize(
          @actionabilities : Array(String)? = nil,
          @event_type_categories : Array(String)? = nil,
          @event_type_codes : Array(String)? = nil,
          @personas : Array(String)? = nil,
          @services : Array(String)? = nil
        )
        end
      end

      # The specified pagination token ( nextToken ) is not valid.

      struct InvalidPaginationToken
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Error information returned when a DescribeAffectedEntitiesForOrganization operation can't find or
      # process a specific entity.

      struct OrganizationAffectedEntitiesErrorItem
        include JSON::Serializable

        # The 12-digit Amazon Web Services account numbers that contains the affected entities.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # A message that describes the error. Follow the error message and retry your request. For example,
        # the InvalidAccountInputError error message appears if you call the
        # DescribeAffectedEntitiesForOrganization operation and specify the AccountSpecific value for the
        # EventScopeCode parameter, but don't specify an Amazon Web Services account.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of the error.

        @[JSON::Field(key: "errorName")]
        getter error_name : String?

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String?

        def initialize(
          @aws_account_id : String? = nil,
          @error_message : String? = nil,
          @error_name : String? = nil,
          @event_arn : String? = nil
        )
        end
      end

      # The aggregate results of entities affected by the specified event in your organization. The results
      # are aggregated by the entity status codes for the specified set of accountsIDs.

      struct OrganizationEntityAggregate
        include JSON::Serializable

        # A list of entity aggregates for each of the specified accounts in your organization that are
        # affected by a specific event. If there are no awsAccountIds provided in the request, this field will
        # be empty in the response.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::AccountEntityAggregate)?

        # The number of entities for the organization that match the filter criteria for the specified events.

        @[JSON::Field(key: "count")]
        getter count : Int32?

        # A list of event ARNs (unique identifiers). For example:
        # "arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456",
        # "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String?

        # The number of affected entities aggregated by the entitiy status codes.

        @[JSON::Field(key: "statuses")]
        getter statuses : Hash(String, Int32)?

        def initialize(
          @accounts : Array(Types::AccountEntityAggregate)? = nil,
          @count : Int32? = nil,
          @event_arn : String? = nil,
          @statuses : Hash(String, Int32)? = nil
        )
        end
      end

      # Summary information about an event, returned by the DescribeEventsForOrganization operation.

      struct OrganizationEvent
        include JSON::Serializable

        # The actionability classification of the event. Possible values are ACTION_REQUIRED ,
        # ACTION_MAY_BE_REQUIRED and INFORMATIONAL . Events with ACTION_REQUIRED actionability require
        # customer action to resolve or mitigate the event. Events with ACTION_MAY_BE_REQUIRED actionability
        # indicates that the current status is unknown or conditional and inspection is needed to determine if
        # action is required. Events with INFORMATIONAL actionability are provided for awareness and do not
        # require immediate action.

        @[JSON::Field(key: "actionability")]
        getter actionability : String?

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time that the event ended.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # This parameter specifies if the Health event is a public Amazon Web Services service event or an
        # account-specific event. If the eventScopeCode value is PUBLIC , then the affectedAccounts value is
        # always empty. If the eventScopeCode value is ACCOUNT_SPECIFIC , then the affectedAccounts value
        # lists the affected Amazon Web Services accounts in your organization. For example, if an event
        # affects a service such as Amazon Elastic Compute Cloud and you have Amazon Web Services accounts
        # that use that service, those account IDs appear in the response. If the eventScopeCode value is NONE
        # , then the eventArn that you specified in the request is invalid or doesn't exist.

        @[JSON::Field(key: "eventScopeCode")]
        getter event_scope_code : String?

        # A list of event type category codes. Possible values are issue , accountNotification , or
        # scheduledChange . Currently, the investigation value isn't supported at this time.

        @[JSON::Field(key: "eventTypeCategory")]
        getter event_type_category : String?

        # The unique identifier for the event type. The format is AWS_SERVICE_DESCRIPTION . For example,
        # AWS_EC2_SYSTEM_MAINTENANCE_EVENT .

        @[JSON::Field(key: "eventTypeCode")]
        getter event_type_code : String?

        # The most recent date and time that the event was updated.

        @[JSON::Field(key: "lastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # A list of persona classifications that indicate the target audience for the event. Possible values
        # are OPERATIONS , SECURITY , and BILLING . Events can be associated with multiple personas to
        # indicate relevance to different teams or roles within an organization.

        @[JSON::Field(key: "personas")]
        getter personas : Array(String)?

        # The Amazon Web Services Region name of the event.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Web Services service that is affected by the event, such as EC2 and RDS.

        @[JSON::Field(key: "service")]
        getter service : String?

        # The date and time that the event began.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The most recent status of the event. Possible values are open , closed , and upcoming .

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @actionability : String? = nil,
          @arn : String? = nil,
          @end_time : Time? = nil,
          @event_scope_code : String? = nil,
          @event_type_category : String? = nil,
          @event_type_code : String? = nil,
          @last_updated_time : Time? = nil,
          @personas : Array(String)? = nil,
          @region : String? = nil,
          @service : String? = nil,
          @start_time : Time? = nil,
          @status_code : String? = nil
        )
        end
      end

      # Detailed information about an event. A combination of an Event object, an EventDescription object,
      # and additional metadata about the event. Returned by the DescribeEventDetailsForOrganization
      # operation.

      struct OrganizationEventDetails
        include JSON::Serializable

        # The 12-digit Amazon Web Services account numbers that contains the affected entities.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?


        @[JSON::Field(key: "event")]
        getter event : Types::Event?


        @[JSON::Field(key: "eventDescription")]
        getter event_description : Types::EventDescription?

        # Additional metadata about the event.

        @[JSON::Field(key: "eventMetadata")]
        getter event_metadata : Hash(String, String)?

        def initialize(
          @aws_account_id : String? = nil,
          @event : Types::Event? = nil,
          @event_description : Types::EventDescription? = nil,
          @event_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Error information returned when a DescribeEventDetailsForOrganization operation can't find a
      # specified event.

      struct OrganizationEventDetailsErrorItem
        include JSON::Serializable

        # Error information returned when a DescribeEventDetailsForOrganization operation can't find a
        # specified event.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # A message that describes the error. If you call the DescribeEventDetailsForOrganization operation
        # and receive one of the following errors, follow the recommendations in the message: We couldn't find
        # a public event that matches your request. To find an event that is account specific, you must enter
        # an Amazon Web Services account ID in the request. We couldn't find an account specific event for the
        # specified Amazon Web Services account. To find an event that is public, you must enter a null value
        # for the Amazon Web Services account ID in the request. Your Amazon Web Services account doesn't
        # include the Amazon Web Services Support plan required to use the Health API. You must have either a
        # Business, Enterprise On-Ramp, or Enterprise Support plan.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of the error.

        @[JSON::Field(key: "errorName")]
        getter error_name : String?

        # The unique identifier for the event. The event ARN has the arn:aws:health: event-region ::event/
        # SERVICE / EVENT_TYPE_CODE / EVENT_TYPE_PLUS_ID format. For example, an event ARN might look like the
        # following:
        # arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456

        @[JSON::Field(key: "eventArn")]
        getter event_arn : String?

        def initialize(
          @aws_account_id : String? = nil,
          @error_message : String? = nil,
          @error_name : String? = nil,
          @event_arn : String? = nil
        )
        end
      end

      # The values to filter results from the DescribeEventsForOrganization operation.

      struct OrganizationEventFilter
        include JSON::Serializable

        # A list of actionability values to filter events. Use this to filter events based on whether they
        # require action ( ACTION_REQUIRED ), may require action ( ACTION_MAY_BE_REQUIRED ) or are
        # informational ( INFORMATIONAL ).

        @[JSON::Field(key: "actionabilities")]
        getter actionabilities : Array(String)?

        # A list of 12-digit Amazon Web Services account numbers that contains the affected entities.

        @[JSON::Field(key: "awsAccountIds")]
        getter aws_account_ids : Array(String)?


        @[JSON::Field(key: "endTime")]
        getter end_time : Types::DateTimeRange?

        # A list of entity ARNs (unique identifiers).

        @[JSON::Field(key: "entityArns")]
        getter entity_arns : Array(String)?

        # A list of entity identifiers, such as EC2 instance IDs (i-34ab692e) or EBS volumes (vol-426ab23e).

        @[JSON::Field(key: "entityValues")]
        getter entity_values : Array(String)?

        # A list of event status codes.

        @[JSON::Field(key: "eventStatusCodes")]
        getter event_status_codes : Array(String)?

        # A list of event type category codes. Possible values are issue , accountNotification , or
        # scheduledChange . Currently, the investigation value isn't supported at this time.

        @[JSON::Field(key: "eventTypeCategories")]
        getter event_type_categories : Array(String)?

        # A list of unique identifiers for event types. For example,
        # "AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".

        @[JSON::Field(key: "eventTypeCodes")]
        getter event_type_codes : Array(String)?


        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Types::DateTimeRange?

        # A list of persona values to filter events. Use this to filter events based on their target audience:
        # OPERATIONS , SECURITY , or BILLING .

        @[JSON::Field(key: "personas")]
        getter personas : Array(String)?

        # A list of Amazon Web Services Regions.

        @[JSON::Field(key: "regions")]
        getter regions : Array(String)?

        # The Amazon Web Services services associated with the event. For example, EC2 , RDS .

        @[JSON::Field(key: "services")]
        getter services : Array(String)?


        @[JSON::Field(key: "startTime")]
        getter start_time : Types::DateTimeRange?

        def initialize(
          @actionabilities : Array(String)? = nil,
          @aws_account_ids : Array(String)? = nil,
          @end_time : Types::DateTimeRange? = nil,
          @entity_arns : Array(String)? = nil,
          @entity_values : Array(String)? = nil,
          @event_status_codes : Array(String)? = nil,
          @event_type_categories : Array(String)? = nil,
          @event_type_codes : Array(String)? = nil,
          @last_updated_time : Types::DateTimeRange? = nil,
          @personas : Array(String)? = nil,
          @regions : Array(String)? = nil,
          @services : Array(String)? = nil,
          @start_time : Types::DateTimeRange? = nil
        )
        end
      end

      # The specified locale is not supported.

      struct UnsupportedLocale
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
