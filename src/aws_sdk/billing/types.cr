require "json"
require "time"

module AwsSdk
  module Billing
    module Types

      # You don't have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A time range with a start and end time.
      struct ActiveTimeRange
        include JSON::Serializable

        # The inclusive time range start date.
        @[JSON::Field(key: "activeAfterInclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter active_after_inclusive : Time

        # The inclusive time range end date.
        @[JSON::Field(key: "activeBeforeInclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter active_before_inclusive : Time

        def initialize(
          @active_after_inclusive : Time,
          @active_before_inclusive : Time
        )
        end
      end

      struct AssociateSourceViewsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing view to associate source views with.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A list of ARNs of the source billing views to associate.
        @[JSON::Field(key: "sourceViews")]
        getter source_views : Array(String)

        def initialize(
          @arn : String,
          @source_views : Array(String)
        )
        end
      end

      struct AssociateSourceViewsResponse
        include JSON::Serializable

        # The ARN of the billing view that the source views were associated with.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The metadata associated to the billing view.
      struct BillingViewElement
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of billing group.
        @[JSON::Field(key: "billingViewType")]
        getter billing_view_type : String?

        # The time when the billing view was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # See Expression . Billing view only supports LINKED_ACCOUNT , Tags , and CostCategories .
        @[JSON::Field(key: "dataFilterExpression")]
        getter data_filter_expression : Types::Expression?

        # The number of billing views that use this billing view as a source.
        @[JSON::Field(key: "derivedViewCount")]
        getter derived_view_count : Int32?

        # The description of the billing view.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The current health status of the billing view.
        @[JSON::Field(key: "healthStatus")]
        getter health_status : Types::BillingViewHealthStatus?

        # The account name of the billing view.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The account owner of the billing view.
        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String?

        # The Amazon Web Services account ID that owns the source billing view, if this is a derived billing
        # view.
        @[JSON::Field(key: "sourceAccountId")]
        getter source_account_id : String?

        # The number of source views associated with this billing view.
        @[JSON::Field(key: "sourceViewCount")]
        getter source_view_count : Int32?

        # The time when the billing view was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The timestamp of when the billing view definition was last updated.
        @[JSON::Field(key: "viewDefinitionLastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter view_definition_last_updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @billing_view_type : String? = nil,
          @created_at : Time? = nil,
          @data_filter_expression : Types::Expression? = nil,
          @derived_view_count : Int32? = nil,
          @description : String? = nil,
          @health_status : Types::BillingViewHealthStatus? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @source_account_id : String? = nil,
          @source_view_count : Int32? = nil,
          @updated_at : Time? = nil,
          @view_definition_last_updated_at : Time? = nil
        )
        end
      end

      # Represents the health status of a billing view, including a status code and optional reasons for the
      # status.
      struct BillingViewHealthStatus
        include JSON::Serializable

        # The current health status code of the billing view.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        # A list of reasons explaining the current health status, if applicable.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        def initialize(
          @status_code : String? = nil,
          @status_reasons : Array(String)? = nil
        )
        end
      end

      # Exception thrown when a billing view's health status prevents an operation from being performed.
      # This may occur if the billing view is in a state other than HEALTHY .
      struct BillingViewHealthStatusException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A representation of a billing view.
      struct BillingViewListElement
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The type of billing view.
        @[JSON::Field(key: "billingViewType")]
        getter billing_view_type : String?

        # The description of the billing view.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The current health status of the billing view.
        @[JSON::Field(key: "healthStatus")]
        getter health_status : Types::BillingViewHealthStatus?

        # A list of names of the Billing view.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The list of owners of the Billing view.
        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String?

        # The Amazon Web Services account ID that owns the source billing view, if this is a derived billing
        # view.
        @[JSON::Field(key: "sourceAccountId")]
        getter source_account_id : String?

        def initialize(
          @arn : String? = nil,
          @billing_view_type : String? = nil,
          @description : String? = nil,
          @health_status : Types::BillingViewHealthStatus? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @source_account_id : String? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the service resource associated with the request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource associated with the request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The Cost Categories values used for filtering the costs.
      struct CostCategoryValues
        include JSON::Serializable

        # The unique name of the Cost Category.
        @[JSON::Field(key: "key")]
        getter key : String

        # The specific value of the Cost Category.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      struct CreateBillingViewRequest
        include JSON::Serializable

        # The name of the billing view.
        @[JSON::Field(key: "name")]
        getter name : String

        # A list of billing views used as the data source for the custom billing view.
        @[JSON::Field(key: "sourceViews")]
        getter source_views : Array(String)

        # A unique, case-sensitive identifier you specify to ensure idempotency of the request. Idempotency
        # ensures that an API request completes no more than one time. If the original request completes
        # successfully, any subsequent retries complete successfully without performing any further actions
        # with an idempotent request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # See Expression . Billing view only supports LINKED_ACCOUNT , Tags , and CostCategories .
        @[JSON::Field(key: "dataFilterExpression")]
        getter data_filter_expression : Types::Expression?

        # The description of the billing view.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of key value map specifying tags associated to the billing view being created.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @name : String,
          @source_views : Array(String),
          @client_token : String? = nil,
          @data_filter_expression : Types::Expression? = nil,
          @description : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      struct CreateBillingViewResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the billing view was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        def initialize(
          @arn : String,
          @created_at : Time? = nil
        )
        end
      end

      struct DeleteBillingViewRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # If set to true, forces deletion of the billing view even if it has derived resources (e.g. other
        # billing views or budgets). Use with caution as this may break dependent resources.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @arn : String,
          @force : Bool? = nil
        )
        end
      end

      struct DeleteBillingViewResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The metadata that you can use to filter and group your results.
      struct DimensionValues
        include JSON::Serializable

        # The names of the metadata types that you can use to filter and group your results.
        @[JSON::Field(key: "key")]
        getter key : String

        # The metadata values that you can use to filter and group your results.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      struct DisassociateSourceViewsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing view to disassociate source views from.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A list of ARNs of the source billing views to disassociate.
        @[JSON::Field(key: "sourceViews")]
        getter source_views : Array(String)

        def initialize(
          @arn : String,
          @source_views : Array(String)
        )
        end
      end

      struct DisassociateSourceViewsResponse
        include JSON::Serializable

        # The ARN of the billing view that the source views were disassociated from.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # See Expression . Billing view only supports LINKED_ACCOUNT , Tags , and CostCategories .
      struct Expression
        include JSON::Serializable

        # The filter that's based on CostCategory values.
        @[JSON::Field(key: "costCategories")]
        getter cost_categories : Types::CostCategoryValues?

        # The specific Dimension to use for Expression .
        @[JSON::Field(key: "dimensions")]
        getter dimensions : Types::DimensionValues?

        # The specific Tag to use for Expression .
        @[JSON::Field(key: "tags")]
        getter tags : Types::TagValues?

        # Specifies a time range filter for the billing view data.
        @[JSON::Field(key: "timeRange")]
        getter time_range : Types::TimeRange?

        def initialize(
          @cost_categories : Types::CostCategoryValues? = nil,
          @dimensions : Types::DimensionValues? = nil,
          @tags : Types::TagValues? = nil,
          @time_range : Types::TimeRange? = nil
        )
        end
      end

      struct GetBillingViewRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetBillingViewResponse
        include JSON::Serializable

        # The billing view element associated with the specified ARN.
        @[JSON::Field(key: "billingView")]
        getter billing_view : Types::BillingViewElement

        def initialize(
          @billing_view : Types::BillingViewElement
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing view resource to which the policy is attached to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the billing view resource to which the policy is attached to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The resource-based policy document attached to the resource in JSON format.
        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @resource_arn : String,
          @policy : String? = nil
        )
        end
      end

      # The request processing failed because of an unknown error, exception, or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ListBillingViewsRequest
        include JSON::Serializable

        # The time range for the billing views listed. PRIMARY billing view is always listed. BILLING_GROUP
        # billing views are listed for time ranges when the associated billing group resource in Billing
        # Conductor is active. The time range must be within one calendar month.
        @[JSON::Field(key: "activeTimeRange")]
        getter active_time_range : Types::ActiveTimeRange?

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arns")]
        getter arns : Array(String)?

        # The type of billing view.
        @[JSON::Field(key: "billingViewTypes")]
        getter billing_view_types : Array(String)?

        # The maximum number of billing views to retrieve. Default is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Filters the list of billing views by name. You can specify search criteria to match billing view
        # names based on the search option provided.
        @[JSON::Field(key: "names")]
        getter names : Array(Types::StringSearch)?

        # The pagination token that is used on subsequent calls to list billing views.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of owners of the billing view.
        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String?

        # Filters the results to include only billing views that use the specified account as a source.
        @[JSON::Field(key: "sourceAccountId")]
        getter source_account_id : String?

        def initialize(
          @active_time_range : Types::ActiveTimeRange? = nil,
          @arns : Array(String)? = nil,
          @billing_view_types : Array(String)? = nil,
          @max_results : Int32? = nil,
          @names : Array(Types::StringSearch)? = nil,
          @next_token : String? = nil,
          @owner_account_id : String? = nil,
          @source_account_id : String? = nil
        )
        end
      end

      struct ListBillingViewsResponse
        include JSON::Serializable

        # A list of BillingViewListElement retrieved.
        @[JSON::Field(key: "billingViews")]
        getter billing_views : Array(Types::BillingViewListElement)

        # The pagination token to use on subsequent calls to list billing views.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @billing_views : Array(Types::BillingViewListElement),
          @next_token : String? = nil
        )
        end
      end

      struct ListSourceViewsForBillingViewRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The number of entries a paginated response contains.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that is used on subsequent calls to list billing views.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSourceViewsForBillingViewResponse
        include JSON::Serializable

        # A list of billing views used as the data source for the custom billing view.
        @[JSON::Field(key: "sourceViews")]
        getter source_views : Array(String)

        # The pagination token that is used on subsequent calls to list billing views.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @source_views : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tag key value pairs that are associated with the resource.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      # The specified ARN in the request doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Value is a list of resource IDs that were not found.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Value is the type of resource that was not found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The tag structure that contains a tag key and value.
      struct ResourceTag
        include JSON::Serializable

        # The key that's associated with the tag.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value that's associated with the tag.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # You've reached the limit of resources you can create, or exceeded the size of an individual
      # resource.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The container for the quotaCode .
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The ID of the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of Amazon Web Services resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The container for the serviceCode .
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

      # A structure that defines how to search for string values. You can specify a search option and the
      # value to search for.
      struct StringSearch
        include JSON::Serializable

        # The type of search operation to perform on the string value. Determines how the search value is
        # matched against the target field.
        @[JSON::Field(key: "searchOption")]
        getter search_option : String

        # The string value to use in the search operation. This value is compared against the target field
        # using the specified search option.
        @[JSON::Field(key: "searchValue")]
        getter search_value : String

        def initialize(
          @search_option : String,
          @search_value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag key value pairs that are associated with the resource.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)

        def initialize(
          @resource_arn : String,
          @resource_tags : Array(Types::ResourceTag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The values that are available for a tag.
      struct TagValues
        include JSON::Serializable

        # The key for the tag.
        @[JSON::Field(key: "key")]
        getter key : String

        # The specific value of the tag.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Specifies a time range with inclusive begin and end dates.
      struct TimeRange
        include JSON::Serializable

        # The inclusive start date of the time range.
        @[JSON::Field(key: "beginDateInclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter begin_date_inclusive : Time?

        # The inclusive end date of the time range.
        @[JSON::Field(key: "endDateInclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date_inclusive : Time?

        def initialize(
          @begin_date_inclusive : Time? = nil,
          @end_date_inclusive : Time? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag key value pairs that are associated with the resource.
        @[JSON::Field(key: "resourceTagKeys")]
        getter resource_tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @resource_tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateBillingViewRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # See Expression . Billing view only supports LINKED_ACCOUNT , Tags , and CostCategories .
        @[JSON::Field(key: "dataFilterExpression")]
        getter data_filter_expression : Types::Expression?

        # The description of the billing view.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the billing view.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @data_filter_expression : Types::Expression? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateBillingViewResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time when the billing view was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String,
          @updated_at : Time? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The field's information of a request that resulted in an exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # The message describing why the field failed validation.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field.
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
