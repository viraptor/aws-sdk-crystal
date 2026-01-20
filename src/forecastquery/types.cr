require "json"

module Aws
  module Forecastquery
    module Types

      # The forecast value for a specific date. Part of the Forecast object.

      struct DataPoint
        include JSON::Serializable

        # The timestamp of the specific forecast.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : String?

        # The forecast value.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @timestamp : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Provides information about a forecast. Returned as part of the QueryForecast response.

      struct Forecast
        include JSON::Serializable

        # The forecast. The string of the string-to-array map is one of the following values: p10 p50 p90 The
        # default setting is ["0.1", "0.5", "0.9"] . Use the optional ForecastTypes parameter of the
        # CreateForecast operation to change the values. The values will vary depending on how this is set,
        # with a minimum of 1 and a maximum of 5.

        @[JSON::Field(key: "Predictions")]
        getter predictions : Hash(String, Array(Types::DataPoint))?

        def initialize(
          @predictions : Hash(String, Array(Types::DataPoint))? = nil
        )
        end
      end

      # The value is invalid or is too long.

      struct InvalidInputException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The token is not valid. Tokens expire after 24 hours.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The limit on the number of requests per second has been exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct QueryForecastRequest
        include JSON::Serializable

        # The filtering criteria to apply when retrieving the forecast. For example, to get the forecast for
        # client_21 in the electricity usage dataset, specify the following: {"item_id" : "client_21"} To get
        # the full forecast, use the CreateForecastExportJob operation.

        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, String)

        # The Amazon Resource Name (ARN) of the forecast to query.

        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String

        # The end date for the forecast. Specify the date using this format: yyyy-MM-dd'T'HH:mm:ss (ISO 8601
        # format). For example, 2015-01-01T20:00:00.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The start date for the forecast. Specify the date using this format: yyyy-MM-dd'T'HH:mm:ss (ISO 8601
        # format). For example, 2015-01-01T08:00:00.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        def initialize(
          @filters : Hash(String, String),
          @forecast_arn : String,
          @end_date : String? = nil,
          @next_token : String? = nil,
          @start_date : String? = nil
        )
        end
      end


      struct QueryForecastResponse
        include JSON::Serializable

        # The forecast.

        @[JSON::Field(key: "Forecast")]
        getter forecast : Types::Forecast?

        def initialize(
          @forecast : Types::Forecast? = nil
        )
        end
      end


      struct QueryWhatIfForecastRequest
        include JSON::Serializable

        # The filtering criteria to apply when retrieving the forecast. For example, to get the forecast for
        # client_21 in the electricity usage dataset, specify the following: {"item_id" : "client_21"} To get
        # the full what-if forecast, use the CreateForecastExportJob operation.

        @[JSON::Field(key: "Filters")]
        getter filters : Hash(String, String)

        # The Amazon Resource Name (ARN) of the what-if forecast to query.

        @[JSON::Field(key: "WhatIfForecastArn")]
        getter what_if_forecast_arn : String

        # The end date for the what-if forecast. Specify the date using this format: yyyy-MM-dd'T'HH:mm:ss
        # (ISO 8601 format). For example, 2015-01-01T20:00:00.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The start date for the what-if forecast. Specify the date using this format: yyyy-MM-dd'T'HH:mm:ss
        # (ISO 8601 format). For example, 2015-01-01T08:00:00.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String?

        def initialize(
          @filters : Hash(String, String),
          @what_if_forecast_arn : String,
          @end_date : String? = nil,
          @next_token : String? = nil,
          @start_date : String? = nil
        )
        end
      end


      struct QueryWhatIfForecastResponse
        include JSON::Serializable


        @[JSON::Field(key: "Forecast")]
        getter forecast : Types::Forecast?

        def initialize(
          @forecast : Types::Forecast? = nil
        )
        end
      end

      # The specified resource is in use.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can't find that resource. Check the information that you've provided and try again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
