require "json"
require "time"

module AwsSdk
  module SageMakerMetrics
    module Types

      struct BatchGetMetricsRequest
        include JSON::Serializable

        # Queries made to retrieve training metrics from SageMaker.
        @[JSON::Field(key: "MetricQueries")]
        getter metric_queries : Array(Types::MetricQuery)

        def initialize(
          @metric_queries : Array(Types::MetricQuery)
        )
        end
      end

      struct BatchGetMetricsResponse
        include JSON::Serializable

        # The results of a query to retrieve training metrics from SageMaker.
        @[JSON::Field(key: "MetricQueryResults")]
        getter metric_query_results : Array(Types::MetricQueryResult)?

        def initialize(
          @metric_query_results : Array(Types::MetricQueryResult)? = nil
        )
        end
      end

      # An error that occured when putting the metric data.
      struct BatchPutMetricsError
        include JSON::Serializable

        # The error code of an error that occured when attempting to put metrics. METRIC_LIMIT_EXCEEDED : The
        # maximum amount of metrics per resource is exceeded. INTERNAL_ERROR : An internal error occured.
        # VALIDATION_ERROR : The metric data failed validation. CONFLICT_ERROR : Multiple requests attempted
        # to modify the same data simultaneously.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # An index that corresponds to the metric in the request.
        @[JSON::Field(key: "MetricIndex")]
        getter metric_index : Int32?

        def initialize(
          @code : String? = nil,
          @metric_index : Int32? = nil
        )
        end
      end

      struct BatchPutMetricsRequest
        include JSON::Serializable

        # A list of raw metric values to put.
        @[JSON::Field(key: "MetricData")]
        getter metric_data : Array(Types::RawMetricData)

        # The name of the Trial Component to associate with the metrics. The Trial Component name must be
        # entirely lowercase.
        @[JSON::Field(key: "TrialComponentName")]
        getter trial_component_name : String

        def initialize(
          @metric_data : Array(Types::RawMetricData),
          @trial_component_name : String
        )
        end
      end

      struct BatchPutMetricsResponse
        include JSON::Serializable

        # Lists any errors that occur when inserting metric data.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchPutMetricsError)?

        def initialize(
          @errors : Array(Types::BatchPutMetricsError)? = nil
        )
        end
      end

      # Specifies a query to retrieve training metrics from SageMaker.
      struct MetricQuery
        include JSON::Serializable

        # The name of the metric to retrieve.
        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # The metrics stat type of metrics to retrieve.
        @[JSON::Field(key: "MetricStat")]
        getter metric_stat : String

        # The time period of metrics to retrieve.
        @[JSON::Field(key: "Period")]
        getter period : String

        # The ARN of the SageMaker resource to retrieve metrics for.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The x-axis type of metrics to retrieve.
        @[JSON::Field(key: "XAxisType")]
        getter x_axis_type : String

        # The end time of metrics to retrieve.
        @[JSON::Field(key: "End")]
        getter end : Int64?

        # The start time of metrics to retrieve.
        @[JSON::Field(key: "Start")]
        getter start : Int64?

        def initialize(
          @metric_name : String,
          @metric_stat : String,
          @period : String,
          @resource_arn : String,
          @x_axis_type : String,
          @end : Int64? = nil,
          @start : Int64? = nil
        )
        end
      end

      # The result of a query to retrieve training metrics from SageMaker.
      struct MetricQueryResult
        include JSON::Serializable

        # The metric values retrieved by the query.
        @[JSON::Field(key: "MetricValues")]
        getter metric_values : Array(Float64)

        # The status of the metric query.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The values for the x-axis of the metrics.
        @[JSON::Field(key: "XAxisValues")]
        getter x_axis_values : Array(Int64)

        # A message describing the status of the metric query.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @metric_values : Array(Float64),
          @status : String,
          @x_axis_values : Array(Int64),
          @message : String? = nil
        )
        end
      end

      # The raw metric data to associate with the resource.
      struct RawMetricData
        include JSON::Serializable

        # The name of the metric.
        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # The time that the metric was recorded.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # The metric value.
        @[JSON::Field(key: "Value")]
        getter value : Float64

        # The metric step (epoch).
        @[JSON::Field(key: "Step")]
        getter step : Int32?

        def initialize(
          @metric_name : String,
          @timestamp : Time,
          @value : Float64,
          @step : Int32? = nil
        )
        end
      end
    end
  end
end
