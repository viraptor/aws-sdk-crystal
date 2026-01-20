require "json"
require "time"

module Aws
  module BCMDashboards
    module Types

      # You do not have sufficient permissions to perform this action. Verify your IAM permissions and any
      # resource policies.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Defines the parameters for retrieving Amazon Web Services cost and usage data. Includes
      # specifications for metrics, time periods, granularity, grouping dimensions, and filtering
      # conditions.

      struct CostAndUsageQuery
        include JSON::Serializable

        # The granularity of the retrieved data: HOURLY , DAILY , or MONTHLY .

        @[JSON::Field(key: "granularity")]
        getter granularity : String

        # The specific cost and usage metrics to retrieve. Valid values for CostAndUsageQuery metrics are
        # AmortizedCost , BlendedCost , NetAmortizedCost , NetUnblendedCost , NormalizedUsageAmount ,
        # UnblendedCost , and UsageQuantity .

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(String)

        # The time period for which to retrieve data. Can be specified as absolute dates or relative time
        # periods.

        @[JSON::Field(key: "timeRange")]
        getter time_range : Types::DateTimeRange

        # The filter expression to be applied to the cost and usage data.

        @[JSON::Field(key: "filter")]
        getter filter : Types::Expression?

        # Specifies how to group the retrieved data, such as by SERVICE , ACCOUNT , or TAG .

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        def initialize(
          @granularity : String,
          @metrics : Array(String),
          @time_range : Types::DateTimeRange,
          @filter : Types::Expression? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil
        )
        end
      end

      # Specifies the values and match options for cost category-based filtering in cost and usage queries.

      struct CostCategoryValues
        include JSON::Serializable

        # The key of the cost category to filter on.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The match options for cost category values, such as EQUALS , CONTAINS , STARTS_WITH , or ENDS_WITH .

        @[JSON::Field(key: "matchOptions")]
        getter match_options : Array(String)?

        # The values to match for the specified cost category key.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @match_options : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct CreateDashboardRequest
        include JSON::Serializable

        # The name of the dashboard. The name must be unique within your account.

        @[JSON::Field(key: "name")]
        getter name : String

        # An array of widget configurations that define the visualizations to be displayed in the dashboard.
        # Each dashboard can contain up to 20 widgets.

        @[JSON::Field(key: "widgets")]
        getter widgets : Array(Types::Widget)

        # A description of the dashboard's purpose or contents.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags to apply to the dashboard resource for organization and management.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @name : String,
          @widgets : Array(Types::Widget),
          @description : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end


      struct CreateDashboardResponse
        include JSON::Serializable

        # The ARN of the newly created dashboard.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Contains basic information about a dashboard, including its ARN, name, type, and timestamps.

      struct DashboardReference
        include JSON::Serializable

        # The ARN of the referenced dashboard.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp when the dashboard was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The name of the referenced dashboard.

        @[JSON::Field(key: "name")]
        getter name : String

        # The dashboard type.

        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp when the dashboard was last modified.

        @[JSON::Field(key: "updatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The description of the referenced dashboard.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @name : String,
          @type : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # Defines a time period with explicit start and end times for data queries.

      struct DateTimeRange
        include JSON::Serializable

        # The end time of the date range for querying data.

        @[JSON::Field(key: "endTime")]
        getter end_time : Types::DateTimeValue

        # The start time of the date range for querying data.

        @[JSON::Field(key: "startTime")]
        getter start_time : Types::DateTimeValue

        def initialize(
          @end_time : Types::DateTimeValue,
          @start_time : Types::DateTimeValue
        )
        end
      end

      # Represents a point in time that can be specified as either an absolute date (for example,
      # "2025-07-01") or a relative time period using ISO 8601 duration format (for example, "-P3M" for
      # three months ago).

      struct DateTimeValue
        include JSON::Serializable

        # The type of date/time value: ABSOLUTE for specific dates or RELATIVE for dynamic time periods.

        @[JSON::Field(key: "type")]
        getter type : String

        # The actual date/time value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end


      struct DeleteDashboardRequest
        include JSON::Serializable

        # The ARN of the dashboard to be deleted.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteDashboardResponse
        include JSON::Serializable

        # The ARN of the dashboard that was deleted.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Specifies the values and match options for dimension-based filtering in cost and usage queries.

      struct DimensionValues
        include JSON::Serializable

        # The key of the dimension to filter on (for example, SERVICE , USAGE_TYPE , or OPERATION ).

        @[JSON::Field(key: "key")]
        getter key : String

        # The values to match for the specified dimension key.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # The match options for dimension values, such as EQUALS , CONTAINS , STARTS_WITH , or ENDS_WITH .

        @[JSON::Field(key: "matchOptions")]
        getter match_options : Array(String)?

        def initialize(
          @key : String,
          @values : Array(String),
          @match_options : Array(String)? = nil
        )
        end
      end

      # Defines how the widget's data should be visualized, including chart type, color schemes, axis
      # configurations, and other display preferences.

      struct DisplayConfig
        include JSON::Serializable

        # The configuration for graphical display of the widget data, including chart type and visual options.

        @[JSON::Field(key: "graph")]
        getter graph : Hash(String, Types::GraphDisplayConfig)?

        # The configuration for tabular display of the widget data.

        @[JSON::Field(key: "table")]
        getter table : Types::TableDisplayConfigStruct?

        def initialize(
          @graph : Hash(String, Types::GraphDisplayConfig)? = nil,
          @table : Types::TableDisplayConfigStruct? = nil
        )
        end
      end

      # Defines complex filtering conditions using logical operators ( AND , OR , NOT ) and various filter
      # types.

      struct Expression
        include JSON::Serializable

        # A list of expressions to combine with AND logic.

        @[JSON::Field(key: "and")]
        getter and : Array(Types::Expression)?

        # The cost category values to include in the filter expression.

        @[JSON::Field(key: "costCategories")]
        getter cost_categories : Types::CostCategoryValues?

        # The dimension values to include in the filter expression.

        @[JSON::Field(key: "dimensions")]
        getter dimensions : Types::DimensionValues?

        # An expression to negate with NOT logic.

        @[JSON::Field(key: "not")]
        getter not : Types::Expression?

        # A list of expressions to combine with OR logic.

        @[JSON::Field(key: "or")]
        getter or : Array(Types::Expression)?

        # The tag values to include in the filter expression.

        @[JSON::Field(key: "tags")]
        getter tags : Types::TagValues?

        def initialize(
          @and : Array(Types::Expression)? = nil,
          @cost_categories : Types::CostCategoryValues? = nil,
          @dimensions : Types::DimensionValues? = nil,
          @not : Types::Expression? = nil,
          @or : Array(Types::Expression)? = nil,
          @tags : Types::TagValues? = nil
        )
        end
      end


      struct GetDashboardRequest
        include JSON::Serializable

        # The ARN of the dashboard to retrieve. This is required to uniquely identify the dashboard.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetDashboardResponse
        include JSON::Serializable

        # The ARN of the retrieved dashboard.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp when the dashboard was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The name of the retrieved dashboard.

        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates the dashboard type.

        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp when the dashboard was last modified.

        @[JSON::Field(key: "updatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # An array of widget configurations that make up the dashboard.

        @[JSON::Field(key: "widgets")]
        getter widgets : Array(Types::Widget)

        # The description of the retrieved dashboard.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @name : String,
          @type : String,
          @updated_at : Time,
          @widgets : Array(Types::Widget),
          @description : String? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The ARN of the dashboard whose resource-based policy you want to retrieve.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The JSON policy document that represents the dashboard's resource-based policy.

        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The ARN of the dashboard for which the resource-based policy was retrieved.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy_document : String,
          @resource_arn : String
        )
        end
      end

      # Defines the visual representation settings for widget data, including the visualization type,
      # styling options, and display preferences for different metric types.

      struct GraphDisplayConfig
        include JSON::Serializable

        # The type of visualization to use for the data.

        @[JSON::Field(key: "visualType")]
        getter visual_type : String

        def initialize(
          @visual_type : String
        )
        end
      end

      # Specifies how to group cost and usage data.

      struct GroupDefinition
        include JSON::Serializable

        # The key to use for grouping cost and usage data.

        @[JSON::Field(key: "key")]
        getter key : String

        # The type of grouping to apply.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @key : String,
          @type : String? = nil
        )
        end
      end

      # An internal error occurred while processing the request. Retry your request. If the problem
      # persists, contact Amazon Web Services Support.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListDashboardsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. The default value is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results. Use the value returned in the previous response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDashboardsResponse
        include JSON::Serializable

        # An array of dashboard references, containing basic information about each dashboard.

        @[JSON::Field(key: "dashboards")]
        getter dashboards : Array(Types::DashboardReference)

        # The token to use to retrieve the next page of results. Not returned if there are no more results to
        # retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dashboards : Array(Types::DashboardReference),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The unique identifier for the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags associated with the specified dashboard resource.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      # Defines the data retrieval parameters for a widget.

      struct QueryParameters
        include JSON::Serializable

        # The parameters for querying cost and usage data, including metrics, time range, granularity,
        # grouping dimensions, and filters.

        @[JSON::Field(key: "costAndUsage")]
        getter cost_and_usage : Types::CostAndUsageQuery?

        # The parameters for querying Reserved Instance coverage data, showing how much of your eligible
        # instance usage is covered by Reserved Instances.

        @[JSON::Field(key: "reservationCoverage")]
        getter reservation_coverage : Types::ReservationCoverageQuery?

        # The parameters for querying Reserved Instance utilization data, showing how effectively your
        # Reserved Instances are being used.

        @[JSON::Field(key: "reservationUtilization")]
        getter reservation_utilization : Types::ReservationUtilizationQuery?

        # The parameters for querying Savings Plans coverage data, showing how much of your eligible compute
        # usage is covered by Savings Plans.

        @[JSON::Field(key: "savingsPlansCoverage")]
        getter savings_plans_coverage : Types::SavingsPlansCoverageQuery?

        # The parameters for querying Savings Plans utilization data, showing how effectively your Savings
        # Plans are being used.

        @[JSON::Field(key: "savingsPlansUtilization")]
        getter savings_plans_utilization : Types::SavingsPlansUtilizationQuery?

        def initialize(
          @cost_and_usage : Types::CostAndUsageQuery? = nil,
          @reservation_coverage : Types::ReservationCoverageQuery? = nil,
          @reservation_utilization : Types::ReservationUtilizationQuery? = nil,
          @savings_plans_coverage : Types::SavingsPlansCoverageQuery? = nil,
          @savings_plans_utilization : Types::SavingsPlansUtilizationQuery? = nil
        )
        end
      end

      # Defines the parameters for querying Reserved Instance coverage data, including grouping options,
      # metrics, and sorting preferences.

      struct ReservationCoverageQuery
        include JSON::Serializable


        @[JSON::Field(key: "timeRange")]
        getter time_range : Types::DateTimeRange


        @[JSON::Field(key: "filter")]
        getter filter : Types::Expression?

        # The time granularity of the retrieved data: HOURLY , DAILY , or MONTHLY .

        @[JSON::Field(key: "granularity")]
        getter granularity : String?

        # Specifies how to group the Reserved Instance coverage data, such as by service, Region, or instance
        # type.

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The coverage metrics to include in the results. Valid values for ReservationCoverageQuery metrics
        # are Hour , Unit , and Cost .

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(String)?

        def initialize(
          @time_range : Types::DateTimeRange,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @metrics : Array(String)? = nil
        )
        end
      end

      # Defines the parameters for querying Reserved Instance utilization data, including grouping options
      # and time granularity.

      struct ReservationUtilizationQuery
        include JSON::Serializable


        @[JSON::Field(key: "timeRange")]
        getter time_range : Types::DateTimeRange


        @[JSON::Field(key: "filter")]
        getter filter : Types::Expression?

        # The time granularity of the retrieved data: HOURLY , DAILY , or MONTHLY .

        @[JSON::Field(key: "granularity")]
        getter granularity : String?

        # Specifies how to group the Reserved Instance utilization data, such as by service, Region, or
        # instance type.

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        def initialize(
          @time_range : Types::DateTimeRange,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil
        )
        end
      end

      # The specified resource (dashboard, policy, or widget) was not found. Verify the ARN and try again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A key-value pair that can be attached to a dashboard for organization and management purposes.

      struct ResourceTag
        include JSON::Serializable

        # The key of the tag to be attached to the dashboard resource.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the tag to be attached to the dashboard resource.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Defines the parameters for querying Savings Plans coverage data, including metrics, grouping
      # options, and time granularity.

      struct SavingsPlansCoverageQuery
        include JSON::Serializable


        @[JSON::Field(key: "timeRange")]
        getter time_range : Types::DateTimeRange


        @[JSON::Field(key: "filter")]
        getter filter : Types::Expression?

        # The time granularity of the retrieved data: HOURLY , DAILY , or MONTHLY .

        @[JSON::Field(key: "granularity")]
        getter granularity : String?

        # Specifies how to group the Savings Plans coverage data, such as by service or instance family.

        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The coverage metrics to include in the results. Valid value for SavingsPlansCoverageQuery metrics is
        # SpendCoveredBySavingsPlans .

        @[JSON::Field(key: "metrics")]
        getter metrics : Array(String)?

        def initialize(
          @time_range : Types::DateTimeRange,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @metrics : Array(String)? = nil
        )
        end
      end

      # Defines the parameters for querying Savings Plans utilization data, including time granularity and
      # sorting preferences.

      struct SavingsPlansUtilizationQuery
        include JSON::Serializable


        @[JSON::Field(key: "timeRange")]
        getter time_range : Types::DateTimeRange


        @[JSON::Field(key: "filter")]
        getter filter : Types::Expression?

        # The time granularity of the retrieved data: HOURLY, DAILY, or MONTHLY.

        @[JSON::Field(key: "granularity")]
        getter granularity : String?

        def initialize(
          @time_range : Types::DateTimeRange,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil
        )
        end
      end

      # The request would exceed service quotas. For example, attempting to create more than 20 widgets in a
      # dashboard or exceeding the maximum number of dashboards per account.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Configuration structure for customizing the tabular display of widget data.

      struct TableDisplayConfigStruct
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The unique identifier for the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the dashboard resource.

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

      # Specifies tag-based filtering options for cost and usage queries.

      struct TagValues
        include JSON::Serializable

        # The key of the tag to filter on.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The match options for tag values, such as EQUALS , CONTAINS , STARTS_WITH , or ENDS_WITH .

        @[JSON::Field(key: "matchOptions")]
        getter match_options : Array(String)?

        # The values to match for the specified tag key.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @match_options : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The request was denied due to request throttling. Reduce the frequency of requests and use
      # exponential backoff.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The unique identifier for the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove from the dashboard resource.

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


      struct UpdateDashboardRequest
        include JSON::Serializable

        # The ARN of the dashboard to update.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The new description for the dashboard. If not specified, the existing description is retained.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The new name for the dashboard. If not specified, the existing name is retained.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The updated array of widget configurations for the dashboard. Replaces all existing widgets.

        @[JSON::Field(key: "widgets")]
        getter widgets : Array(Types::Widget)?

        def initialize(
          @arn : String,
          @description : String? = nil,
          @name : String? = nil,
          @widgets : Array(Types::Widget)? = nil
        )
        end
      end


      struct UpdateDashboardResponse
        include JSON::Serializable

        # The ARN of the updated dashboard.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The input parameters do not satisfy the requirements. Check the error message for specific
      # validation details.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A configurable visualization component within a dashboard that displays specific cost and usage
      # metrics. Each widget can show data as charts or tables and includes settings for data querying,
      # filtering, and visual presentation.

      struct Widget
        include JSON::Serializable

        # An array of configurations that define the data queries and display settings for the widget.

        @[JSON::Field(key: "configs")]
        getter configs : Array(Types::WidgetConfig)

        # The title of the widget.

        @[JSON::Field(key: "title")]
        getter title : String

        # A description of the widget's purpose or the data it displays.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The height of the widget in row spans. The dashboard layout consists of a grid system.

        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Specifies the starting column position of the widget in the dashboard's grid layout. Used to control
        # widget placement.

        @[JSON::Field(key: "horizontalOffset")]
        getter horizontal_offset : Int32?

        # The width of the widget in column spans. The dashboard layout consists of a grid system.

        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @configs : Array(Types::WidgetConfig),
          @title : String,
          @description : String? = nil,
          @height : Int32? = nil,
          @horizontal_offset : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end

      # Defines the complete configuration for a widget, including data retrieval settings and visualization
      # preferences.

      struct WidgetConfig
        include JSON::Serializable

        # The configuration that determines how the retrieved data should be visualized in the widget.

        @[JSON::Field(key: "displayConfig")]
        getter display_config : Types::DisplayConfig

        # The parameters that define what data the widget should retrieve and how it should be filtered or
        # grouped.

        @[JSON::Field(key: "queryParameters")]
        getter query_parameters : Types::QueryParameters

        def initialize(
          @display_config : Types::DisplayConfig,
          @query_parameters : Types::QueryParameters
        )
        end
      end
    end
  end
end
