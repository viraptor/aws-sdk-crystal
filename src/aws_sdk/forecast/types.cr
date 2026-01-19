require "json"
require "time"

module AwsSdk
  module Forecast
    module Types

      # Defines the modifications that you are making to an attribute for a what-if forecast. For example,
      # you can use this operation to create a what-if forecast that investigates a 10% off sale on all
      # shoes. To do this, you specify "AttributeName": "shoes" , "Operation": "MULTIPLY" , and "Value":
      # "0.90" . Pair this operation with the TimeSeriesCondition operation within the
      # CreateWhatIfForecastRequest$TimeSeriesTransformations operation to define a subset of attribute
      # items that are modified.
      struct Action
        include JSON::Serializable

        # The related time series that you are modifying. This value is case insensitive.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The operation that is applied to the provided attribute. Operations include: ADD - adds Value to all
        # rows of AttributeName . SUBTRACT - subtracts Value from all rows of AttributeName . MULTIPLY -
        # multiplies all rows of AttributeName by Value . DIVIDE - divides all rows of AttributeName by Value
        # .
        @[JSON::Field(key: "Operation")]
        getter operation : String

        # The value that is applied for the chosen Operation .
        @[JSON::Field(key: "Value")]
        getter value : Float64

        def initialize(
          @attribute_name : String,
          @operation : String,
          @value : Float64
        )
        end
      end

      # Describes an additional dataset. This object is part of the DataConfig object. Forecast supports the
      # Weather Index and Holidays additional datasets. Weather Index The Amazon Forecast Weather Index is a
      # built-in dataset that incorporates historical and projected weather information into your model. The
      # Weather Index supplements your datasets with over two years of historical weather data and up to 14
      # days of projected weather data. For more information, see Amazon Forecast Weather Index . Holidays
      # Holidays is a built-in dataset that incorporates national holiday information into your model. It
      # provides native support for the holiday calendars of 66 countries. To view the holiday calendars,
      # refer to the Jollyday library. For more information, see Holidays Featurization .
      struct AdditionalDataset
        include JSON::Serializable

        # The name of the additional dataset. Valid names: "holiday" and "weather" .
        @[JSON::Field(key: "Name")]
        getter name : String

        # Weather Index To enable the Weather Index, do not specify a value for Configuration . Holidays
        # Holidays To enable Holidays, set CountryCode to one of the following two-letter country codes: "AL"
        # - ALBANIA "AR" - ARGENTINA "AT" - AUSTRIA "AU" - AUSTRALIA "BA" - BOSNIA HERZEGOVINA "BE" - BELGIUM
        # "BG" - BULGARIA "BO" - BOLIVIA "BR" - BRAZIL "BY" - BELARUS "CA" - CANADA "CL" - CHILE "CO" -
        # COLOMBIA "CR" - COSTA RICA "HR" - CROATIA "CZ" - CZECH REPUBLIC "DK" - DENMARK "EC" - ECUADOR "EE" -
        # ESTONIA "ET" - ETHIOPIA "FI" - FINLAND "FR" - FRANCE "DE" - GERMANY "GR" - GREECE "HU" - HUNGARY
        # "IS" - ICELAND "IN" - INDIA "IE" - IRELAND "IT" - ITALY "JP" - JAPAN "KZ" - KAZAKHSTAN "KR" - KOREA
        # "LV" - LATVIA "LI" - LIECHTENSTEIN "LT" - LITHUANIA "LU" - LUXEMBOURG "MK" - MACEDONIA "MT" - MALTA
        # "MX" - MEXICO "MD" - MOLDOVA "ME" - MONTENEGRO "NL" - NETHERLANDS "NZ" - NEW ZEALAND "NI" -
        # NICARAGUA "NG" - NIGERIA "NO" - NORWAY "PA" - PANAMA "PY" - PARAGUAY "PE" - PERU "PL" - POLAND "PT"
        # - PORTUGAL "RO" - ROMANIA "RU" - RUSSIA "RS" - SERBIA "SK" - SLOVAKIA "SI" - SLOVENIA "ZA" - SOUTH
        # AFRICA "ES" - SPAIN "SE" - SWEDEN "CH" - SWITZERLAND "UA" - UKRAINE "AE" - UNITED ARAB EMIRATES "US"
        # - UNITED STATES "UK" - UNITED KINGDOM "UY" - URUGUAY "VE" - VENEZUELA
        @[JSON::Field(key: "Configuration")]
        getter configuration : Hash(String, Array(String))?

        def initialize(
          @name : String,
          @configuration : Hash(String, Array(String))? = nil
        )
        end
      end

      # Provides information about the method used to transform attributes. The following is an example
      # using the RETAIL domain: { "AttributeName": "demand", "Transformations": {"aggregation": "sum",
      # "middlefill": "zero", "backfill": "zero"} }
      struct AttributeConfig
        include JSON::Serializable

        # The name of the attribute as specified in the schema. Amazon Forecast supports the target field of
        # the target time series and the related time series datasets. For example, for the RETAIL domain, the
        # target is demand .
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The method parameters (key-value pairs), which are a map of override parameters. Specify these
        # parameters to override the default values. Related Time Series attributes do not accept aggregation
        # parameters. The following list shows the parameters and their valid values for the "filling"
        # featurization method for a Target Time Series dataset. Default values are bolded. aggregation : sum
        # , avg , first , min , max frontfill : none middlefill : zero , nan (not a number), value , median ,
        # mean , min , max backfill : zero , nan , value , median , mean , min , max The following list shows
        # the parameters and their valid values for a Related Time Series featurization method (there are no
        # defaults): middlefill : zero , value , median , mean , min , max backfill : zero , value , median ,
        # mean , min , max futurefill : zero , value , median , mean , min , max To set a filling method to a
        # specific value, set the fill parameter to value and define the value in a corresponding _value
        # parameter. For example, to set backfilling to a value of 2, include the following: "backfill":
        # "value" and "backfill_value":"2" .
        @[JSON::Field(key: "Transformations")]
        getter transformations : Hash(String, String)

        def initialize(
          @attribute_name : String,
          @transformations : Hash(String, String)
        )
        end
      end

      # Metrics you can use as a baseline for comparison purposes. Use these metrics when you interpret
      # monitoring results for an auto predictor.
      struct Baseline
        include JSON::Serializable

        # The initial accuracy metrics for the predictor you are monitoring. Use these metrics as a baseline
        # for comparison purposes as you use your predictor and the metrics change.
        @[JSON::Field(key: "PredictorBaseline")]
        getter predictor_baseline : Types::PredictorBaseline?

        def initialize(
          @predictor_baseline : Types::PredictorBaseline? = nil
        )
        end
      end

      # An individual metric that you can use for comparison as you evaluate your monitoring results.
      struct BaselineMetric
        include JSON::Serializable

        # The name of the metric.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value for the metric.
        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Specifies a categorical hyperparameter and it's range of tunable values. This object is part of the
      # ParameterRanges object.
      struct CategoricalParameterRange
        include JSON::Serializable

        # The name of the categorical hyperparameter to tune.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of the tunable categories for the hyperparameter.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Specifies a continuous hyperparameter and it's range of tunable values. This object is part of the
      # ParameterRanges object.
      struct ContinuousParameterRange
        include JSON::Serializable

        # The maximum tunable value of the hyperparameter.
        @[JSON::Field(key: "MaxValue")]
        getter max_value : Float64

        # The minimum tunable value of the hyperparameter.
        @[JSON::Field(key: "MinValue")]
        getter min_value : Float64

        # The name of the hyperparameter to tune.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The scale that hyperparameter tuning uses to search the hyperparameter range. Valid values: Auto
        # Amazon Forecast hyperparameter tuning chooses the best scale for the hyperparameter. Linear
        # Hyperparameter tuning searches the values in the hyperparameter range by using a linear scale.
        # Logarithmic Hyperparameter tuning searches the values in the hyperparameter range by using a
        # logarithmic scale. Logarithmic scaling works only for ranges that have values greater than 0.
        # ReverseLogarithmic hyperparameter tuning searches the values in the hyperparameter range by using a
        # reverse logarithmic scale. Reverse logarithmic scaling works only for ranges that are entirely
        # within the range 0 &lt;= x &lt; 1.0. For information about choosing a hyperparameter scale, see
        # Hyperparameter Scaling . One of the following values:
        @[JSON::Field(key: "ScalingType")]
        getter scaling_type : String?

        def initialize(
          @max_value : Float64,
          @min_value : Float64,
          @name : String,
          @scaling_type : String? = nil
        )
        end
      end

      struct CreateAutoPredictorRequest
        include JSON::Serializable

        # A unique name for the predictor
        @[JSON::Field(key: "PredictorName")]
        getter predictor_name : String

        # The data configuration for your dataset group and any additional datasets.
        @[JSON::Field(key: "DataConfig")]
        getter data_config : Types::DataConfig?

        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        # Create an Explainability resource for the predictor.
        @[JSON::Field(key: "ExplainPredictor")]
        getter explain_predictor : Bool?

        # An array of dimension (field) names that specify how to group the generated forecast. For example,
        # if you are generating forecasts for item sales across all your stores, and your dataset contains a
        # store_id field, you would specify store_id as a dimension to group sales forecasts for each store.
        @[JSON::Field(key: "ForecastDimensions")]
        getter forecast_dimensions : Array(String)?

        # The frequency of predictions in a forecast. Valid intervals are an integer followed by Y (Year), M
        # (Month), W (Week), D (Day), H (Hour), and min (Minute). For example, "1D" indicates every day and
        # "15min" indicates every 15 minutes. You cannot specify a value that would overlap with the next
        # larger frequency. That means, for example, you cannot specify a frequency of 60 minutes, because
        # that is equivalent to 1 hour. The valid values for each frequency are the following: Minute - 1-59
        # Hour - 1-23 Day - 1-6 Week - 1-4 Month - 1-11 Year - 1 Thus, if you want every other week forecasts,
        # specify "2W". Or, if you want quarterly forecasts, you specify "3M". The frequency must be greater
        # than or equal to the TARGET_TIME_SERIES dataset frequency. When a RELATED_TIME_SERIES dataset is
        # provided, the frequency must be equal to the RELATED_TIME_SERIES dataset frequency.
        @[JSON::Field(key: "ForecastFrequency")]
        getter forecast_frequency : String?

        # The number of time-steps that the model predicts. The forecast horizon is also called the prediction
        # length. The maximum forecast horizon is the lesser of 500 time-steps or 1/4 of the
        # TARGET_TIME_SERIES dataset length. If you are retraining an existing AutoPredictor, then the maximum
        # forecast horizon is the lesser of 500 time-steps or 1/3 of the TARGET_TIME_SERIES dataset length. If
        # you are upgrading to an AutoPredictor or retraining an existing AutoPredictor, you cannot update the
        # forecast horizon parameter. You can meet this requirement by providing longer time-series in the
        # dataset.
        @[JSON::Field(key: "ForecastHorizon")]
        getter forecast_horizon : Int32?

        # The forecast types used to train a predictor. You can specify up to five forecast types. Forecast
        # types can be quantiles from 0.01 to 0.99, by increments of 0.01 or higher. You can also specify the
        # mean forecast with mean .
        @[JSON::Field(key: "ForecastTypes")]
        getter forecast_types : Array(String)?

        # The configuration details for predictor monitoring. Provide a name for the monitor resource to
        # enable predictor monitoring. Predictor monitoring allows you to see how your predictor's performance
        # changes over time. For more information, see Predictor Monitoring .
        @[JSON::Field(key: "MonitorConfig")]
        getter monitor_config : Types::MonitorConfig?

        # The accuracy metric used to optimize the predictor.
        @[JSON::Field(key: "OptimizationMetric")]
        getter optimization_metric : String?

        # The ARN of the predictor to retrain or upgrade. This parameter is only used when retraining or
        # upgrading a predictor. When creating a new predictor, do not specify a value for this parameter.
        # When upgrading or retraining a predictor, only specify values for the ReferencePredictorArn and
        # PredictorName . The value for PredictorName must be a unique predictor name.
        @[JSON::Field(key: "ReferencePredictorArn")]
        getter reference_predictor_arn : String?

        # Optional metadata to help you categorize and organize your predictors. Each tag consists of a key
        # and an optional value, both of which you define. Tag keys and values are case sensitive. The
        # following restrictions apply to tags: For each resource, each tag key must be unique and each tag
        # key must have one value. Maximum number of tags per resource: 50. Maximum key length: 128 Unicode
        # characters in UTF-8. Maximum value length: 256 Unicode characters in UTF-8. Accepted characters: all
        # letters and numbers, spaces representable in UTF-8, and + - = . _ : / @. If your tagging schema is
        # used across other services and resources, the character restrictions of those services also apply.
        # Key prefixes cannot include any upper or lowercase combination of aws: or AWS: . Values can have
        # this prefix. If a tag value has aws as its prefix but the key does not, Forecast considers it to be
        # a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws do not
        # count against your tags per resource limit. You cannot edit or delete tag keys with this prefix.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The time boundary Forecast uses to align and aggregate any data that doesn't align with your
        # forecast frequency. Provide the unit of time and the time boundary as a key value pair. For more
        # information on specifying a time boundary, see Specifying a Time Boundary . If you don't provide a
        # time boundary, Forecast uses a set of Default Time Boundaries .
        @[JSON::Field(key: "TimeAlignmentBoundary")]
        getter time_alignment_boundary : Types::TimeAlignmentBoundary?

        def initialize(
          @predictor_name : String,
          @data_config : Types::DataConfig? = nil,
          @encryption_config : Types::EncryptionConfig? = nil,
          @explain_predictor : Bool? = nil,
          @forecast_dimensions : Array(String)? = nil,
          @forecast_frequency : String? = nil,
          @forecast_horizon : Int32? = nil,
          @forecast_types : Array(String)? = nil,
          @monitor_config : Types::MonitorConfig? = nil,
          @optimization_metric : String? = nil,
          @reference_predictor_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @time_alignment_boundary : Types::TimeAlignmentBoundary? = nil
        )
        end
      end

      struct CreateAutoPredictorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        def initialize(
          @predictor_arn : String? = nil
        )
        end
      end

      struct CreateDatasetGroupRequest
        include JSON::Serializable

        # A name for the dataset group.
        @[JSON::Field(key: "DatasetGroupName")]
        getter dataset_group_name : String

        # The domain associated with the dataset group. When you add a dataset to a dataset group, this value
        # and the value specified for the Domain parameter of the CreateDataset operation must match. The
        # Domain and DatasetType that you choose determine the fields that must be present in training data
        # that you import to a dataset. For example, if you choose the RETAIL domain and TARGET_TIME_SERIES as
        # the DatasetType , Amazon Forecast requires that item_id , timestamp , and demand fields are present
        # in your data. For more information, see Dataset groups .
        @[JSON::Field(key: "Domain")]
        getter domain : String

        # An array of Amazon Resource Names (ARNs) of the datasets that you want to include in the dataset
        # group.
        @[JSON::Field(key: "DatasetArns")]
        getter dataset_arns : Array(String)?

        # The optional metadata that you apply to the dataset group to help you categorize and organize them.
        # Each tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
        # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
        # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
        # prefix of aws do not count against your tags per resource limit.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_group_name : String,
          @domain : String,
          @dataset_arns : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDatasetGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String?

        def initialize(
          @dataset_group_arn : String? = nil
        )
        end
      end

      struct CreateDatasetImportJobRequest
        include JSON::Serializable

        # The location of the training data to import and an Identity and Access Management (IAM) role that
        # Amazon Forecast can assume to access the data. The training data must be stored in an Amazon S3
        # bucket. If encryption is used, DataSource must include an Key Management Service (KMS) key and the
        # IAM role must allow Amazon Forecast permission to access the key. The KMS key and IAM role must
        # match those specified in the EncryptionConfig parameter of the CreateDataset operation.
        @[JSON::Field(key: "DataSource")]
        getter data_source : Types::DataSource

        # The Amazon Resource Name (ARN) of the Amazon Forecast dataset that you want to import data to.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        # The name for the dataset import job. We recommend including the current timestamp in the name, for
        # example, 20190721DatasetImport . This can help you avoid getting a ResourceAlreadyExistsException
        # exception.
        @[JSON::Field(key: "DatasetImportJobName")]
        getter dataset_import_job_name : String

        # The format of the imported data, CSV or PARQUET. The default value is CSV.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The format of the geolocation attribute. The geolocation attribute can be formatted in one of two
        # ways: LAT_LONG - the latitude and longitude in decimal format (Example: 47.61_-122.33).
        # CC_POSTALCODE (US Only) - the country code (US), followed by the 5-digit ZIP code (Example:
        # US_98121).
        @[JSON::Field(key: "GeolocationFormat")]
        getter geolocation_format : String?

        # Specifies whether the dataset import job is a FULL or INCREMENTAL import. A FULL dataset import
        # replaces all of the existing data with the newly imported data. An INCREMENTAL import appends the
        # imported data to the existing data.
        @[JSON::Field(key: "ImportMode")]
        getter import_mode : String?

        # The optional metadata that you apply to the dataset import job to help you categorize and organize
        # them. Each tag consists of a key and an optional value, both of which you define. The following
        # basic restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each
        # tag key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
        # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
        # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
        # prefix of aws do not count against your tags per resource limit.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A single time zone for every item in your dataset. This option is ideal for datasets with all
        # timestamps within a single time zone, or if all timestamps are normalized to a single time zone.
        # Refer to the Joda-Time API for a complete list of valid time zone names.
        @[JSON::Field(key: "TimeZone")]
        getter time_zone : String?

        # The format of timestamps in the dataset. The format that you specify depends on the DataFrequency
        # specified when the dataset was created. The following formats are supported "yyyy-MM-dd" For the
        # following data frequencies: Y, M, W, and D "yyyy-MM-dd HH:mm:ss" For the following data frequencies:
        # H, 30min, 15min, and 1min; and optionally, for: Y, M, W, and D If the format isn't specified, Amazon
        # Forecast expects the format to be "yyyy-MM-dd HH:mm:ss".
        @[JSON::Field(key: "TimestampFormat")]
        getter timestamp_format : String?

        # Automatically derive time zone information from the geolocation attribute. This option is ideal for
        # datasets that contain timestamps in multiple time zones and those timestamps are expressed in local
        # time.
        @[JSON::Field(key: "UseGeolocationForTimeZone")]
        getter use_geolocation_for_time_zone : Bool?

        def initialize(
          @data_source : Types::DataSource,
          @dataset_arn : String,
          @dataset_import_job_name : String,
          @format : String? = nil,
          @geolocation_format : String? = nil,
          @import_mode : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @time_zone : String? = nil,
          @timestamp_format : String? = nil,
          @use_geolocation_for_time_zone : Bool? = nil
        )
        end
      end

      struct CreateDatasetImportJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset import job.
        @[JSON::Field(key: "DatasetImportJobArn")]
        getter dataset_import_job_arn : String?

        def initialize(
          @dataset_import_job_arn : String? = nil
        )
        end
      end

      struct CreateDatasetRequest
        include JSON::Serializable

        # A name for the dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The dataset type. Valid values depend on the chosen Domain .
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String

        # The domain associated with the dataset. When you add a dataset to a dataset group, this value and
        # the value specified for the Domain parameter of the CreateDatasetGroup operation must match. The
        # Domain and DatasetType that you choose determine the fields that must be present in the training
        # data that you import to the dataset. For example, if you choose the RETAIL domain and
        # TARGET_TIME_SERIES as the DatasetType , Amazon Forecast requires item_id , timestamp , and demand
        # fields to be present in your data. For more information, see Importing datasets .
        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The schema for the dataset. The schema attributes and their order must match the fields in your
        # data. The dataset Domain and DatasetType that you choose determine the minimum required fields in
        # your training data. For information about the required fields for a specific dataset domain and
        # type, see Dataset Domains and Dataset Types .
        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema

        # The frequency of data collection. This parameter is required for RELATED_TIME_SERIES datasets. Valid
        # intervals are an integer followed by Y (Year), M (Month), W (Week), D (Day), H (Hour), and min
        # (Minute). For example, "1D" indicates every day and "15min" indicates every 15 minutes. You cannot
        # specify a value that would overlap with the next larger frequency. That means, for example, you
        # cannot specify a frequency of 60 minutes, because that is equivalent to 1 hour. The valid values for
        # each frequency are the following: Minute - 1-59 Hour - 1-23 Day - 1-6 Week - 1-4 Month - 1-11 Year -
        # 1 Thus, if you want every other week forecasts, specify "2W". Or, if you want quarterly forecasts,
        # you specify "3M".
        @[JSON::Field(key: "DataFrequency")]
        getter data_frequency : String?

        # An Key Management Service (KMS) key and the Identity and Access Management (IAM) role that Amazon
        # Forecast can assume to access the key.
        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        # The optional metadata that you apply to the dataset to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
        # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
        # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
        # prefix of aws do not count against your tags per resource limit.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_name : String,
          @dataset_type : String,
          @domain : String,
          @schema : Types::Schema,
          @data_frequency : String? = nil,
          @encryption_config : Types::EncryptionConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDatasetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        def initialize(
          @dataset_arn : String? = nil
        )
        end
      end

      struct CreateExplainabilityExportRequest
        include JSON::Serializable

        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination

        # The Amazon Resource Name (ARN) of the Explainability to export.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String

        # A unique name for the Explainability export.
        @[JSON::Field(key: "ExplainabilityExportName")]
        getter explainability_export_name : String

        # The format of the exported data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # Optional metadata to help you categorize and organize your resources. Each tag consists of a key and
        # an optional value, both of which you define. Tag keys and values are case sensitive. The following
        # restrictions apply to tags: For each resource, each tag key must be unique and each tag key must
        # have one value. Maximum number of tags per resource: 50. Maximum key length: 128 Unicode characters
        # in UTF-8. Maximum value length: 256 Unicode characters in UTF-8. Accepted characters: all letters
        # and numbers, spaces representable in UTF-8, and + - = . _ : / @. If your tagging schema is used
        # across other services and resources, the character restrictions of those services also apply. Key
        # prefixes cannot include any upper or lowercase combination of aws: or AWS: . Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, Forecast considers it to be a
        # user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws do not
        # count against your tags per resource limit. You cannot edit or delete tag keys with this prefix.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination : Types::DataDestination,
          @explainability_arn : String,
          @explainability_export_name : String,
          @format : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateExplainabilityExportResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the export.
        @[JSON::Field(key: "ExplainabilityExportArn")]
        getter explainability_export_arn : String?

        def initialize(
          @explainability_export_arn : String? = nil
        )
        end
      end

      struct CreateExplainabilityRequest
        include JSON::Serializable

        # The configuration settings that define the granularity of time series and time points for the
        # Explainability.
        @[JSON::Field(key: "ExplainabilityConfig")]
        getter explainability_config : Types::ExplainabilityConfig

        # A unique name for the Explainability.
        @[JSON::Field(key: "ExplainabilityName")]
        getter explainability_name : String

        # The Amazon Resource Name (ARN) of the Predictor or Forecast used to create the Explainability.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        @[JSON::Field(key: "DataSource")]
        getter data_source : Types::DataSource?

        # Create an Explainability visualization that is viewable within the Amazon Web Services console.
        @[JSON::Field(key: "EnableVisualization")]
        getter enable_visualization : Bool?

        # If TimePointGranularity is set to SPECIFIC , define the last time point for the Explainability. Use
        # the following timestamp format: yyyy-MM-ddTHH:mm:ss (example: 2015-01-01T20:00:00)
        @[JSON::Field(key: "EndDateTime")]
        getter end_date_time : String?

        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema?

        # If TimePointGranularity is set to SPECIFIC , define the first point for the Explainability. Use the
        # following timestamp format: yyyy-MM-ddTHH:mm:ss (example: 2015-01-01T20:00:00)
        @[JSON::Field(key: "StartDateTime")]
        getter start_date_time : String?

        # Optional metadata to help you categorize and organize your resources. Each tag consists of a key and
        # an optional value, both of which you define. Tag keys and values are case sensitive. The following
        # restrictions apply to tags: For each resource, each tag key must be unique and each tag key must
        # have one value. Maximum number of tags per resource: 50. Maximum key length: 128 Unicode characters
        # in UTF-8. Maximum value length: 256 Unicode characters in UTF-8. Accepted characters: all letters
        # and numbers, spaces representable in UTF-8, and + - = . _ : / @. If your tagging schema is used
        # across other services and resources, the character restrictions of those services also apply. Key
        # prefixes cannot include any upper or lowercase combination of aws: or AWS: . Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, Forecast considers it to be a
        # user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws do not
        # count against your tags per resource limit. You cannot edit or delete tag keys with this prefix.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @explainability_config : Types::ExplainabilityConfig,
          @explainability_name : String,
          @resource_arn : String,
          @data_source : Types::DataSource? = nil,
          @enable_visualization : Bool? = nil,
          @end_date_time : String? = nil,
          @schema : Types::Schema? = nil,
          @start_date_time : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateExplainabilityResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Explainability.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String?

        def initialize(
          @explainability_arn : String? = nil
        )
        end
      end

      struct CreateForecastExportJobRequest
        include JSON::Serializable

        # The location where you want to save the forecast and an Identity and Access Management (IAM) role
        # that Amazon Forecast can assume to access the location. The forecast must be exported to an Amazon
        # S3 bucket. If encryption is used, Destination must include an Key Management Service (KMS) key. The
        # IAM role must allow Amazon Forecast permission to access the key.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination

        # The Amazon Resource Name (ARN) of the forecast that you want to export.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String

        # The name for the forecast export job.
        @[JSON::Field(key: "ForecastExportJobName")]
        getter forecast_export_job_name : String

        # The format of the exported data, CSV or PARQUET. The default value is CSV.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The optional metadata that you apply to the forecast export job to help you categorize and organize
        # them. Each tag consists of a key and an optional value, both of which you define. The following
        # basic restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each
        # tag key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
        # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
        # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
        # prefix of aws do not count against your tags per resource limit.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination : Types::DataDestination,
          @forecast_arn : String,
          @forecast_export_job_name : String,
          @format : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateForecastExportJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the export job.
        @[JSON::Field(key: "ForecastExportJobArn")]
        getter forecast_export_job_arn : String?

        def initialize(
          @forecast_export_job_arn : String? = nil
        )
        end
      end

      struct CreateForecastRequest
        include JSON::Serializable

        # A name for the forecast.
        @[JSON::Field(key: "ForecastName")]
        getter forecast_name : String

        # The Amazon Resource Name (ARN) of the predictor to use to generate the forecast.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String

        # The quantiles at which probabilistic forecasts are generated. You can currently specify up to 5
        # quantiles per forecast . Accepted values include 0.01 to 0.99 (increments of .01 only) and mean .
        # The mean forecast is different from the median (0.50) when the distribution is not symmetric (for
        # example, Beta and Negative Binomial). The default quantiles are the quantiles you specified during
        # predictor creation. If you didn't specify quantiles, the default values are ["0.1", "0.5", "0.9"] .
        @[JSON::Field(key: "ForecastTypes")]
        getter forecast_types : Array(String)?

        # The optional metadata that you apply to the forecast to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
        # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
        # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
        # prefix of aws do not count against your tags per resource limit.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Defines the set of time series that are used to create the forecasts in a TimeSeriesIdentifiers
        # object. The TimeSeriesIdentifiers object needs the following information: DataSource Format Schema
        @[JSON::Field(key: "TimeSeriesSelector")]
        getter time_series_selector : Types::TimeSeriesSelector?

        def initialize(
          @forecast_name : String,
          @predictor_arn : String,
          @forecast_types : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @time_series_selector : Types::TimeSeriesSelector? = nil
        )
        end
      end

      struct CreateForecastResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the forecast.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String?

        def initialize(
          @forecast_arn : String? = nil
        )
        end
      end

      struct CreateMonitorRequest
        include JSON::Serializable

        # The name of the monitor resource.
        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The Amazon Resource Name (ARN) of the predictor to monitor.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags to apply to the monitor resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @monitor_name : String,
          @resource_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMonitorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor resource.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        def initialize(
          @monitor_arn : String? = nil
        )
        end
      end

      struct CreatePredictorBacktestExportJobRequest
        include JSON::Serializable

        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination

        # The Amazon Resource Name (ARN) of the predictor that you want to export.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String

        # The name for the backtest export job.
        @[JSON::Field(key: "PredictorBacktestExportJobName")]
        getter predictor_backtest_export_job_name : String

        # The format of the exported data, CSV or PARQUET. The default value is CSV.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # Optional metadata to help you categorize and organize your backtests. Each tag consists of a key and
        # an optional value, both of which you define. Tag keys and values are case sensitive. The following
        # restrictions apply to tags: For each resource, each tag key must be unique and each tag key must
        # have one value. Maximum number of tags per resource: 50. Maximum key length: 128 Unicode characters
        # in UTF-8. Maximum value length: 256 Unicode characters in UTF-8. Accepted characters: all letters
        # and numbers, spaces representable in UTF-8, and + - = . _ : / @. If your tagging schema is used
        # across other services and resources, the character restrictions of those services also apply. Key
        # prefixes cannot include any upper or lowercase combination of aws: or AWS: . Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, Forecast considers it to be a
        # user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws do not
        # count against your tags per resource limit. You cannot edit or delete tag keys with this prefix.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination : Types::DataDestination,
          @predictor_arn : String,
          @predictor_backtest_export_job_name : String,
          @format : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePredictorBacktestExportJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor backtest export job that you want to export.
        @[JSON::Field(key: "PredictorBacktestExportJobArn")]
        getter predictor_backtest_export_job_arn : String?

        def initialize(
          @predictor_backtest_export_job_arn : String? = nil
        )
        end
      end

      struct CreatePredictorRequest
        include JSON::Serializable

        # The featurization configuration.
        @[JSON::Field(key: "FeaturizationConfig")]
        getter featurization_config : Types::FeaturizationConfig

        # Specifies the number of time-steps that the model is trained to predict. The forecast horizon is
        # also called the prediction length. For example, if you configure a dataset for daily data collection
        # (using the DataFrequency parameter of the CreateDataset operation) and set the forecast horizon to
        # 10, the model returns predictions for 10 days. The maximum forecast horizon is the lesser of 500
        # time-steps or 1/3 of the TARGET_TIME_SERIES dataset length.
        @[JSON::Field(key: "ForecastHorizon")]
        getter forecast_horizon : Int32

        # Describes the dataset group that contains the data to use to train the predictor.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # A name for the predictor.
        @[JSON::Field(key: "PredictorName")]
        getter predictor_name : String

        # The Amazon Resource Name (ARN) of the algorithm to use for model training. Required if PerformAutoML
        # is not set to true . Supported algorithms: arn:aws:forecast:::algorithm/ARIMA
        # arn:aws:forecast:::algorithm/CNN-QR arn:aws:forecast:::algorithm/Deep_AR_Plus
        # arn:aws:forecast:::algorithm/ETS arn:aws:forecast:::algorithm/NPTS
        # arn:aws:forecast:::algorithm/Prophet
        @[JSON::Field(key: "AlgorithmArn")]
        getter algorithm_arn : String?

        # The LatencyOptimized AutoML override strategy is only available in private beta. Contact Amazon Web
        # Services Support or your account manager to learn more about access privileges. Used to overide the
        # default AutoML strategy, which is to optimize predictor accuracy. To apply an AutoML strategy that
        # minimizes training time, use LatencyOptimized . This parameter is only valid for predictors trained
        # using AutoML.
        @[JSON::Field(key: "AutoMLOverrideStrategy")]
        getter auto_ml_override_strategy : String?

        # An Key Management Service (KMS) key and the Identity and Access Management (IAM) role that Amazon
        # Forecast can assume to access the key.
        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        # Used to override the default evaluation parameters of the specified algorithm. Amazon Forecast
        # evaluates a predictor by splitting a dataset into training data and testing data. The evaluation
        # parameters define how to perform the split and the number of iterations.
        @[JSON::Field(key: "EvaluationParameters")]
        getter evaluation_parameters : Types::EvaluationParameters?

        # Specifies the forecast types used to train a predictor. You can specify up to five forecast types.
        # Forecast types can be quantiles from 0.01 to 0.99, by increments of 0.01 or higher. You can also
        # specify the mean forecast with mean . The default value is ["0.10", "0.50", "0.9"] .
        @[JSON::Field(key: "ForecastTypes")]
        getter forecast_types : Array(String)?

        # Provides hyperparameter override values for the algorithm. If you don't provide this parameter,
        # Amazon Forecast uses default values. The individual algorithms specify which hyperparameters support
        # hyperparameter optimization (HPO). For more information, see aws-forecast-choosing-recipes . If you
        # included the HPOConfig object, you must set PerformHPO to true.
        @[JSON::Field(key: "HPOConfig")]
        getter hpo_config : Types::HyperParameterTuningJobConfig?

        # The accuracy metric used to optimize the predictor.
        @[JSON::Field(key: "OptimizationMetric")]
        getter optimization_metric : String?

        # Whether to perform AutoML. When Amazon Forecast performs AutoML, it evaluates the algorithms it
        # provides and chooses the best algorithm and configuration for your training dataset. The default
        # value is false . In this case, you are required to specify an algorithm. Set PerformAutoML to true
        # to have Amazon Forecast perform AutoML. This is a good option if you aren't sure which algorithm is
        # suitable for your training data. In this case, PerformHPO must be false.
        @[JSON::Field(key: "PerformAutoML")]
        getter perform_auto_ml : Bool?

        # Whether to perform hyperparameter optimization (HPO). HPO finds optimal hyperparameter values for
        # your training data. The process of performing HPO is known as running a hyperparameter tuning job.
        # The default value is false . In this case, Amazon Forecast uses default hyperparameter values from
        # the chosen algorithm. To override the default values, set PerformHPO to true and, optionally, supply
        # the HyperParameterTuningJobConfig object. The tuning job specifies a metric to optimize, which
        # hyperparameters participate in tuning, and the valid range for each tunable hyperparameter. In this
        # case, you are required to specify an algorithm and PerformAutoML must be false. The following
        # algorithms support HPO: DeepAR+ CNN-QR
        @[JSON::Field(key: "PerformHPO")]
        getter perform_hpo : Bool?

        # The optional metadata that you apply to the predictor to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
        # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
        # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
        # prefix of aws do not count against your tags per resource limit.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The hyperparameters to override for model training. The hyperparameters that you can override are
        # listed in the individual algorithms. For the list of supported algorithms, see
        # aws-forecast-choosing-recipes .
        @[JSON::Field(key: "TrainingParameters")]
        getter training_parameters : Hash(String, String)?

        def initialize(
          @featurization_config : Types::FeaturizationConfig,
          @forecast_horizon : Int32,
          @input_data_config : Types::InputDataConfig,
          @predictor_name : String,
          @algorithm_arn : String? = nil,
          @auto_ml_override_strategy : String? = nil,
          @encryption_config : Types::EncryptionConfig? = nil,
          @evaluation_parameters : Types::EvaluationParameters? = nil,
          @forecast_types : Array(String)? = nil,
          @hpo_config : Types::HyperParameterTuningJobConfig? = nil,
          @optimization_metric : String? = nil,
          @perform_auto_ml : Bool? = nil,
          @perform_hpo : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @training_parameters : Hash(String, String)? = nil
        )
        end
      end

      struct CreatePredictorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        def initialize(
          @predictor_arn : String? = nil
        )
        end
      end

      struct CreateWhatIfAnalysisRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the baseline forecast.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String

        # The name of the what-if analysis. Each name must be unique.
        @[JSON::Field(key: "WhatIfAnalysisName")]
        getter what_if_analysis_name : String

        # A list of tags to apply to the what if forecast.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Defines the set of time series that are used in the what-if analysis with a TimeSeriesIdentifiers
        # object. What-if analyses are performed only for the time series in this object. The
        # TimeSeriesIdentifiers object needs the following information: DataSource Format Schema
        @[JSON::Field(key: "TimeSeriesSelector")]
        getter time_series_selector : Types::TimeSeriesSelector?

        def initialize(
          @forecast_arn : String,
          @what_if_analysis_name : String,
          @tags : Array(Types::Tag)? = nil,
          @time_series_selector : Types::TimeSeriesSelector? = nil
        )
        end
      end

      struct CreateWhatIfAnalysisResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if analysis.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String?

        def initialize(
          @what_if_analysis_arn : String? = nil
        )
        end
      end

      struct CreateWhatIfForecastExportRequest
        include JSON::Serializable

        # The location where you want to save the forecast and an Identity and Access Management (IAM) role
        # that Amazon Forecast can assume to access the location. The forecast must be exported to an Amazon
        # S3 bucket. If encryption is used, Destination must include an Key Management Service (KMS) key. The
        # IAM role must allow Amazon Forecast permission to access the key.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination

        # The list of what-if forecast Amazon Resource Names (ARNs) to export.
        @[JSON::Field(key: "WhatIfForecastArns")]
        getter what_if_forecast_arns : Array(String)

        # The name of the what-if forecast to export.
        @[JSON::Field(key: "WhatIfForecastExportName")]
        getter what_if_forecast_export_name : String

        # The format of the exported data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # A list of tags to apply to the what if forecast.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @destination : Types::DataDestination,
          @what_if_forecast_arns : Array(String),
          @what_if_forecast_export_name : String,
          @format : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateWhatIfForecastExportResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if forecast.
        @[JSON::Field(key: "WhatIfForecastExportArn")]
        getter what_if_forecast_export_arn : String?

        def initialize(
          @what_if_forecast_export_arn : String? = nil
        )
        end
      end

      struct CreateWhatIfForecastRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if analysis.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String

        # The name of the what-if forecast. Names must be unique within each what-if analysis.
        @[JSON::Field(key: "WhatIfForecastName")]
        getter what_if_forecast_name : String

        # A list of tags to apply to the what if forecast.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The replacement time series dataset, which contains the rows that you want to change in the related
        # time series dataset. A replacement time series does not need to contain all rows that are in the
        # baseline related time series. Include only the rows (measure-dimension combinations) that you want
        # to include in the what-if forecast. This dataset is merged with the original time series to create a
        # transformed dataset that is used for the what-if analysis. This dataset should contain the items to
        # modify (such as item_id or workforce_type), any relevant dimensions, the timestamp column, and at
        # least one of the related time series columns. This file should not contain duplicate timestamps for
        # the same time series. Timestamps and item_ids not included in this dataset are not included in the
        # what-if analysis.
        @[JSON::Field(key: "TimeSeriesReplacementsDataSource")]
        getter time_series_replacements_data_source : Types::TimeSeriesReplacementsDataSource?

        # The transformations that are applied to the baseline time series. Each transformation contains an
        # action and a set of conditions. An action is applied only when all conditions are met. If no
        # conditions are provided, the action is applied to all items.
        @[JSON::Field(key: "TimeSeriesTransformations")]
        getter time_series_transformations : Array(Types::TimeSeriesTransformation)?

        def initialize(
          @what_if_analysis_arn : String,
          @what_if_forecast_name : String,
          @tags : Array(Types::Tag)? = nil,
          @time_series_replacements_data_source : Types::TimeSeriesReplacementsDataSource? = nil,
          @time_series_transformations : Array(Types::TimeSeriesTransformation)? = nil
        )
        end
      end

      struct CreateWhatIfForecastResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if forecast.
        @[JSON::Field(key: "WhatIfForecastArn")]
        getter what_if_forecast_arn : String?

        def initialize(
          @what_if_forecast_arn : String? = nil
        )
        end
      end

      # The data configuration for your dataset group and any additional datasets.
      struct DataConfig
        include JSON::Serializable

        # The ARN of the dataset group used to train the predictor.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String

        # Additional built-in datasets like Holidays and the Weather Index.
        @[JSON::Field(key: "AdditionalDatasets")]
        getter additional_datasets : Array(Types::AdditionalDataset)?

        # Aggregation and filling options for attributes in your dataset group.
        @[JSON::Field(key: "AttributeConfigs")]
        getter attribute_configs : Array(Types::AttributeConfig)?

        def initialize(
          @dataset_group_arn : String,
          @additional_datasets : Array(Types::AdditionalDataset)? = nil,
          @attribute_configs : Array(Types::AttributeConfig)? = nil
        )
        end
      end

      # The destination for an export job. Provide an S3 path, an Identity and Access Management (IAM) role
      # that allows Amazon Forecast to access the location, and an Key Management Service (KMS) key
      # (optional).
      struct DataDestination
        include JSON::Serializable

        # The path to an Amazon Simple Storage Service (Amazon S3) bucket along with the credentials to access
        # the bucket.
        @[JSON::Field(key: "S3Config")]
        getter s3_config : Types::S3Config

        def initialize(
          @s3_config : Types::S3Config
        )
        end
      end

      # The source of your data, an Identity and Access Management (IAM) role that allows Amazon Forecast to
      # access the data and, optionally, an Key Management Service (KMS) key.
      struct DataSource
        include JSON::Serializable

        # The path to the data stored in an Amazon Simple Storage Service (Amazon S3) bucket along with the
        # credentials to access the data.
        @[JSON::Field(key: "S3Config")]
        getter s3_config : Types::S3Config

        def initialize(
          @s3_config : Types::S3Config
        )
        end
      end

      # Provides a summary of the dataset group properties used in the ListDatasetGroups operation. To get
      # the complete set of properties, call the DescribeDatasetGroup operation, and provide the
      # DatasetGroupArn .
      struct DatasetGroupSummary
        include JSON::Serializable

        # When the dataset group was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String?

        # The name of the dataset group.
        @[JSON::Field(key: "DatasetGroupName")]
        getter dataset_group_name : String?

        # When the dataset group was created or last updated from a call to the UpdateDatasetGroup operation.
        # While the dataset group is being updated, LastModificationTime is the current time of the
        # ListDatasetGroups call.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        def initialize(
          @creation_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @dataset_group_name : String? = nil,
          @last_modification_time : Time? = nil
        )
        end
      end

      # Provides a summary of the dataset import job properties used in the ListDatasetImportJobs operation.
      # To get the complete set of properties, call the DescribeDatasetImportJob operation, and provide the
      # DatasetImportJobArn .
      struct DatasetImportJobSummary
        include JSON::Serializable

        # When the dataset import job was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The location of the training data to import and an Identity and Access Management (IAM) role that
        # Amazon Forecast can assume to access the data. The training data must be stored in an Amazon S3
        # bucket. If encryption is used, DataSource includes an Key Management Service (KMS) key.
        @[JSON::Field(key: "DataSource")]
        getter data_source : Types::DataSource?

        # The Amazon Resource Name (ARN) of the dataset import job.
        @[JSON::Field(key: "DatasetImportJobArn")]
        getter dataset_import_job_arn : String?

        # The name of the dataset import job.
        @[JSON::Field(key: "DatasetImportJobName")]
        getter dataset_import_job_name : String?

        # The import mode of the dataset import job, FULL or INCREMENTAL.
        @[JSON::Field(key: "ImportMode")]
        getter import_mode : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the dataset import job. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED CREATE_STOPPING , CREATE_STOPPED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @data_source : Types::DataSource? = nil,
          @dataset_import_job_arn : String? = nil,
          @dataset_import_job_name : String? = nil,
          @import_mode : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the dataset properties used in the ListDatasets operation. To get the complete
      # set of properties, call the DescribeDataset operation, and provide the DatasetArn .
      struct DatasetSummary
        include JSON::Serializable

        # When the dataset was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The dataset type.
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String?

        # The domain associated with the dataset.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # When you create a dataset, LastModificationTime is the same as CreationTime . While data is being
        # imported to the dataset, LastModificationTime is the current time of the ListDatasets call. After a
        # CreateDatasetImportJob operation has finished, LastModificationTime is when the import job completed
        # or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        def initialize(
          @creation_time : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @dataset_type : String? = nil,
          @domain : String? = nil,
          @last_modification_time : Time? = nil
        )
        end
      end

      struct DeleteDatasetGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group to delete.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String

        def initialize(
          @dataset_group_arn : String
        )
        end
      end

      struct DeleteDatasetImportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset import job to delete.
        @[JSON::Field(key: "DatasetImportJobArn")]
        getter dataset_import_job_arn : String

        def initialize(
          @dataset_import_job_arn : String
        )
        end
      end

      struct DeleteDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset to delete.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        def initialize(
          @dataset_arn : String
        )
        end
      end

      struct DeleteExplainabilityExportRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Explainability export to delete.
        @[JSON::Field(key: "ExplainabilityExportArn")]
        getter explainability_export_arn : String

        def initialize(
          @explainability_export_arn : String
        )
        end
      end

      struct DeleteExplainabilityRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Explainability resource to delete.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String

        def initialize(
          @explainability_arn : String
        )
        end
      end

      struct DeleteForecastExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the forecast export job to delete.
        @[JSON::Field(key: "ForecastExportJobArn")]
        getter forecast_export_job_arn : String

        def initialize(
          @forecast_export_job_arn : String
        )
        end
      end

      struct DeleteForecastRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the forecast to delete.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String

        def initialize(
          @forecast_arn : String
        )
        end
      end

      struct DeleteMonitorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor resource to delete.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        def initialize(
          @monitor_arn : String
        )
        end
      end

      struct DeletePredictorBacktestExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor backtest export job to delete.
        @[JSON::Field(key: "PredictorBacktestExportJobArn")]
        getter predictor_backtest_export_job_arn : String

        def initialize(
          @predictor_backtest_export_job_arn : String
        )
        end
      end

      struct DeletePredictorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor to delete.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String

        def initialize(
          @predictor_arn : String
        )
        end
      end

      struct DeleteResourceTreeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the parent resource to delete. All child resources of the parent
        # resource will also be deleted.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteWhatIfAnalysisRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if analysis that you want to delete.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String

        def initialize(
          @what_if_analysis_arn : String
        )
        end
      end

      struct DeleteWhatIfForecastExportRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if forecast export that you want to delete.
        @[JSON::Field(key: "WhatIfForecastExportArn")]
        getter what_if_forecast_export_arn : String

        def initialize(
          @what_if_forecast_export_arn : String
        )
        end
      end

      struct DeleteWhatIfForecastRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if forecast that you want to delete.
        @[JSON::Field(key: "WhatIfForecastArn")]
        getter what_if_forecast_arn : String

        def initialize(
          @what_if_forecast_arn : String
        )
        end
      end

      struct DescribeAutoPredictorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String

        def initialize(
          @predictor_arn : String
        )
        end
      end

      struct DescribeAutoPredictorResponse
        include JSON::Serializable

        # The timestamp of the CreateAutoPredictor request.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The data configuration for your dataset group and any additional datasets.
        @[JSON::Field(key: "DataConfig")]
        getter data_config : Types::DataConfig?

        # An array of the ARNs of the dataset import jobs used to import training data for the predictor.
        @[JSON::Field(key: "DatasetImportJobArns")]
        getter dataset_import_job_arns : Array(String)?

        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        # The estimated time remaining in minutes for the predictor training job to complete.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # Provides the status and ARN of the Predictor Explainability.
        @[JSON::Field(key: "ExplainabilityInfo")]
        getter explainability_info : Types::ExplainabilityInfo?

        # An array of dimension (field) names that specify the attributes used to group your time series.
        @[JSON::Field(key: "ForecastDimensions")]
        getter forecast_dimensions : Array(String)?

        # The frequency of predictions in a forecast. Valid intervals are Y (Year), M (Month), W (Week), D
        # (Day), H (Hour), 30min (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and
        # 1min (1 minute). For example, "Y" indicates every year and "5min" indicates every five minutes.
        @[JSON::Field(key: "ForecastFrequency")]
        getter forecast_frequency : String?

        # The number of time-steps that the model predicts. The forecast horizon is also called the prediction
        # length.
        @[JSON::Field(key: "ForecastHorizon")]
        getter forecast_horizon : Int32?

        # The forecast types used during predictor training. Default value is ["0.1","0.5","0.9"].
        @[JSON::Field(key: "ForecastTypes")]
        getter forecast_types : Array(String)?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # In the event of an error, a message detailing the cause of the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A object with the Amazon Resource Name (ARN) and status of the monitor resource.
        @[JSON::Field(key: "MonitorInfo")]
        getter monitor_info : Types::MonitorInfo?

        # The accuracy metric used to optimize the predictor.
        @[JSON::Field(key: "OptimizationMetric")]
        getter optimization_metric : String?

        # The Amazon Resource Name (ARN) of the predictor
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        # The name of the predictor.
        @[JSON::Field(key: "PredictorName")]
        getter predictor_name : String?

        # The ARN and state of the reference predictor. This parameter is only valid for retrained or upgraded
        # predictors.
        @[JSON::Field(key: "ReferencePredictorSummary")]
        getter reference_predictor_summary : Types::ReferencePredictorSummary?

        # The status of the predictor. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time boundary Forecast uses when aggregating data.
        @[JSON::Field(key: "TimeAlignmentBoundary")]
        getter time_alignment_boundary : Types::TimeAlignmentBoundary?

        def initialize(
          @creation_time : Time? = nil,
          @data_config : Types::DataConfig? = nil,
          @dataset_import_job_arns : Array(String)? = nil,
          @encryption_config : Types::EncryptionConfig? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @explainability_info : Types::ExplainabilityInfo? = nil,
          @forecast_dimensions : Array(String)? = nil,
          @forecast_frequency : String? = nil,
          @forecast_horizon : Int32? = nil,
          @forecast_types : Array(String)? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @monitor_info : Types::MonitorInfo? = nil,
          @optimization_metric : String? = nil,
          @predictor_arn : String? = nil,
          @predictor_name : String? = nil,
          @reference_predictor_summary : Types::ReferencePredictorSummary? = nil,
          @status : String? = nil,
          @time_alignment_boundary : Types::TimeAlignmentBoundary? = nil
        )
        end
      end

      struct DescribeDatasetGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String

        def initialize(
          @dataset_group_arn : String
        )
        end
      end

      struct DescribeDatasetGroupResponse
        include JSON::Serializable

        # When the dataset group was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # An array of Amazon Resource Names (ARNs) of the datasets contained in the dataset group.
        @[JSON::Field(key: "DatasetArns")]
        getter dataset_arns : Array(String)?

        # The ARN of the dataset group.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String?

        # The name of the dataset group.
        @[JSON::Field(key: "DatasetGroupName")]
        getter dataset_group_name : String?

        # The domain associated with the dataset group.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # When the dataset group was created or last updated from a call to the UpdateDatasetGroup operation.
        # While the dataset group is being updated, LastModificationTime is the current time of the
        # DescribeDatasetGroup call.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # The status of the dataset group. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED UPDATE_PENDING ,
        # UPDATE_IN_PROGRESS , UPDATE_FAILED The UPDATE states apply when you call the UpdateDatasetGroup
        # operation. The Status of the dataset group must be ACTIVE before you can use the dataset group to
        # create a predictor.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @dataset_arns : Array(String)? = nil,
          @dataset_group_arn : String? = nil,
          @dataset_group_name : String? = nil,
          @domain : String? = nil,
          @last_modification_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeDatasetImportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset import job.
        @[JSON::Field(key: "DatasetImportJobArn")]
        getter dataset_import_job_arn : String

        def initialize(
          @dataset_import_job_arn : String
        )
        end
      end

      struct DescribeDatasetImportJobResponse
        include JSON::Serializable

        # When the dataset import job was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The size of the dataset in gigabytes (GB) after the import job has finished.
        @[JSON::Field(key: "DataSize")]
        getter data_size : Float64?

        # The location of the training data to import and an Identity and Access Management (IAM) role that
        # Amazon Forecast can assume to access the data. If encryption is used, DataSource includes an Key
        # Management Service (KMS) key.
        @[JSON::Field(key: "DataSource")]
        getter data_source : Types::DataSource?

        # The Amazon Resource Name (ARN) of the dataset that the training data was imported to.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The ARN of the dataset import job.
        @[JSON::Field(key: "DatasetImportJobArn")]
        getter dataset_import_job_arn : String?

        # The name of the dataset import job.
        @[JSON::Field(key: "DatasetImportJobName")]
        getter dataset_import_job_name : String?

        # The estimated time remaining in minutes for the dataset import job to complete.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # Statistical information about each field in the input data.
        @[JSON::Field(key: "FieldStatistics")]
        getter field_statistics : Hash(String, Types::Statistics)?

        # The format of the imported data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The format of the geolocation attribute. Valid Values: "LAT_LONG" and "CC_POSTALCODE" .
        @[JSON::Field(key: "GeolocationFormat")]
        getter geolocation_format : String?

        # The import mode of the dataset import job, FULL or INCREMENTAL.
        @[JSON::Field(key: "ImportMode")]
        getter import_mode : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the dataset import job. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED CREATE_STOPPING , CREATE_STOPPED
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The single time zone applied to every item in the dataset
        @[JSON::Field(key: "TimeZone")]
        getter time_zone : String?

        # The format of timestamps in the dataset. The format that you specify depends on the DataFrequency
        # specified when the dataset was created. The following formats are supported "yyyy-MM-dd" For the
        # following data frequencies: Y, M, W, and D "yyyy-MM-dd HH:mm:ss" For the following data frequencies:
        # H, 30min, 15min, and 1min; and optionally, for: Y, M, W, and D
        @[JSON::Field(key: "TimestampFormat")]
        getter timestamp_format : String?

        # Whether TimeZone is automatically derived from the geolocation attribute.
        @[JSON::Field(key: "UseGeolocationForTimeZone")]
        getter use_geolocation_for_time_zone : Bool?

        def initialize(
          @creation_time : Time? = nil,
          @data_size : Float64? = nil,
          @data_source : Types::DataSource? = nil,
          @dataset_arn : String? = nil,
          @dataset_import_job_arn : String? = nil,
          @dataset_import_job_name : String? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @field_statistics : Hash(String, Types::Statistics)? = nil,
          @format : String? = nil,
          @geolocation_format : String? = nil,
          @import_mode : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @time_zone : String? = nil,
          @timestamp_format : String? = nil,
          @use_geolocation_for_time_zone : Bool? = nil
        )
        end
      end

      struct DescribeDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        def initialize(
          @dataset_arn : String
        )
        end
      end

      struct DescribeDatasetResponse
        include JSON::Serializable

        # When the dataset was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The frequency of data collection. Valid intervals are Y (Year), M (Month), W (Week), D (Day), H
        # (Hour), 30min (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and 1min (1
        # minute). For example, "M" indicates every month and "30min" indicates every 30 minutes.
        @[JSON::Field(key: "DataFrequency")]
        getter data_frequency : String?

        # The Amazon Resource Name (ARN) of the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The dataset type.
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String?

        # The domain associated with the dataset.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The Key Management Service (KMS) key and the Identity and Access Management (IAM) role that Amazon
        # Forecast can assume to access the key.
        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        # When you create a dataset, LastModificationTime is the same as CreationTime . While data is being
        # imported to the dataset, LastModificationTime is the current time of the DescribeDataset call. After
        # a CreateDatasetImportJob operation has finished, LastModificationTime is when the import job
        # completed or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # An array of SchemaAttribute objects that specify the dataset fields. Each SchemaAttribute specifies
        # the name and data type of a field.
        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema?

        # The status of the dataset. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED UPDATE_PENDING ,
        # UPDATE_IN_PROGRESS , UPDATE_FAILED The UPDATE states apply while data is imported to the dataset
        # from a call to the CreateDatasetImportJob operation and reflect the status of the dataset import
        # job. For example, when the import job status is CREATE_IN_PROGRESS , the status of the dataset is
        # UPDATE_IN_PROGRESS . The Status of the dataset must be ACTIVE before you can import training data.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @data_frequency : String? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @dataset_type : String? = nil,
          @domain : String? = nil,
          @encryption_config : Types::EncryptionConfig? = nil,
          @last_modification_time : Time? = nil,
          @schema : Types::Schema? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeExplainabilityExportRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Explainability export.
        @[JSON::Field(key: "ExplainabilityExportArn")]
        getter explainability_export_arn : String

        def initialize(
          @explainability_export_arn : String
        )
        end
      end

      struct DescribeExplainabilityExportResponse
        include JSON::Serializable

        # When the Explainability export was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The Amazon Resource Name (ARN) of the Explainability export.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String?

        # The Amazon Resource Name (ARN) of the Explainability export.
        @[JSON::Field(key: "ExplainabilityExportArn")]
        getter explainability_export_arn : String?

        # The name of the Explainability export.
        @[JSON::Field(key: "ExplainabilityExportName")]
        getter explainability_export_name : String?

        # The format of the exported data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # Information about any errors that occurred during the export.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the Explainability export. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS
        # , CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @explainability_arn : String? = nil,
          @explainability_export_arn : String? = nil,
          @explainability_export_name : String? = nil,
          @format : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeExplainabilityRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Explaianability to describe.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String

        def initialize(
          @explainability_arn : String
        )
        end
      end

      struct DescribeExplainabilityResponse
        include JSON::Serializable

        # When the Explainability resource was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        @[JSON::Field(key: "DataSource")]
        getter data_source : Types::DataSource?

        # Whether the visualization was enabled for the Explainability resource.
        @[JSON::Field(key: "EnableVisualization")]
        getter enable_visualization : Bool?

        # If TimePointGranularity is set to SPECIFIC , the last time point in the Explainability.
        @[JSON::Field(key: "EndDateTime")]
        getter end_date_time : String?

        # The estimated time remaining in minutes for the CreateExplainability job to complete.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # The Amazon Resource Name (ARN) of the Explainability.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String?

        # The configuration settings that define the granularity of time series and time points for the
        # Explainability.
        @[JSON::Field(key: "ExplainabilityConfig")]
        getter explainability_config : Types::ExplainabilityConfig?

        # The name of the Explainability.
        @[JSON::Field(key: "ExplainabilityName")]
        getter explainability_name : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, a message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Amazon Resource Name (ARN) of the Predictor or Forecast used to create the Explainability
        # resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema?

        # If TimePointGranularity is set to SPECIFIC , the first time point in the Explainability.
        @[JSON::Field(key: "StartDateTime")]
        getter start_date_time : String?

        # The status of the Explainability resource. States include: ACTIVE CREATE_PENDING ,
        # CREATE_IN_PROGRESS , CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING ,
        # DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @data_source : Types::DataSource? = nil,
          @enable_visualization : Bool? = nil,
          @end_date_time : String? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @explainability_arn : String? = nil,
          @explainability_config : Types::ExplainabilityConfig? = nil,
          @explainability_name : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @resource_arn : String? = nil,
          @schema : Types::Schema? = nil,
          @start_date_time : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeForecastExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the forecast export job.
        @[JSON::Field(key: "ForecastExportJobArn")]
        getter forecast_export_job_arn : String

        def initialize(
          @forecast_export_job_arn : String
        )
        end
      end

      struct DescribeForecastExportJobResponse
        include JSON::Serializable

        # When the forecast export job was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The path to the Amazon Simple Storage Service (Amazon S3) bucket where the forecast is exported.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The Amazon Resource Name (ARN) of the exported forecast.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String?

        # The ARN of the forecast export job.
        @[JSON::Field(key: "ForecastExportJobArn")]
        getter forecast_export_job_arn : String?

        # The name of the forecast export job.
        @[JSON::Field(key: "ForecastExportJobName")]
        getter forecast_export_job_name : String?

        # The format of the exported data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the forecast export job. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the forecast export job must be ACTIVE before you can access the forecast in your S3
        # bucket.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @forecast_arn : String? = nil,
          @forecast_export_job_arn : String? = nil,
          @forecast_export_job_name : String? = nil,
          @format : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribeForecastRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the forecast.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String

        def initialize(
          @forecast_arn : String
        )
        end
      end

      struct DescribeForecastResponse
        include JSON::Serializable

        # When the forecast creation task was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The ARN of the dataset group that provided the data used to train the predictor.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String?

        # The estimated time remaining in minutes for the forecast job to complete.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # The forecast ARN as specified in the request.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String?

        # The name of the forecast.
        @[JSON::Field(key: "ForecastName")]
        getter forecast_name : String?

        # The quantiles at which probabilistic forecasts were generated.
        @[JSON::Field(key: "ForecastTypes")]
        getter forecast_types : Array(String)?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ARN of the predictor used to generate the forecast.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        # The status of the forecast. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the forecast must be ACTIVE before you can query or export the forecast.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time series to include in the forecast.
        @[JSON::Field(key: "TimeSeriesSelector")]
        getter time_series_selector : Types::TimeSeriesSelector?

        def initialize(
          @creation_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @forecast_arn : String? = nil,
          @forecast_name : String? = nil,
          @forecast_types : Array(String)? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @predictor_arn : String? = nil,
          @status : String? = nil,
          @time_series_selector : Types::TimeSeriesSelector? = nil
        )
        end
      end

      struct DescribeMonitorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor resource to describe.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        def initialize(
          @monitor_arn : String
        )
        end
      end

      struct DescribeMonitorResponse
        include JSON::Serializable

        # Metrics you can use as a baseline for comparison purposes. Use these values you interpret monitoring
        # results for an auto predictor.
        @[JSON::Field(key: "Baseline")]
        getter baseline : Types::Baseline?

        # The timestamp for when the monitor resource was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The estimated number of minutes remaining before the monitor resource finishes its current
        # evaluation.
        @[JSON::Field(key: "EstimatedEvaluationTimeRemainingInMinutes")]
        getter estimated_evaluation_time_remaining_in_minutes : Int64?

        # The state of the monitor's latest evaluation.
        @[JSON::Field(key: "LastEvaluationState")]
        getter last_evaluation_state : String?

        # The timestamp of the latest evaluation completed by the monitor.
        @[JSON::Field(key: "LastEvaluationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_evaluation_time : Time?

        # The timestamp of the latest modification to the monitor.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # An error message, if any, for the monitor.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Amazon Resource Name (ARN) of the monitor resource described.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        # The name of the monitor.
        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String?

        # The Amazon Resource Name (ARN) of the auto predictor being monitored.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The status of the monitor resource.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @baseline : Types::Baseline? = nil,
          @creation_time : Time? = nil,
          @estimated_evaluation_time_remaining_in_minutes : Int64? = nil,
          @last_evaluation_state : String? = nil,
          @last_evaluation_time : Time? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @monitor_arn : String? = nil,
          @monitor_name : String? = nil,
          @resource_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribePredictorBacktestExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor backtest export job.
        @[JSON::Field(key: "PredictorBacktestExportJobArn")]
        getter predictor_backtest_export_job_arn : String

        def initialize(
          @predictor_backtest_export_job_arn : String
        )
        end
      end

      struct DescribePredictorBacktestExportJobResponse
        include JSON::Serializable

        # When the predictor backtest export job was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The format of the exported data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # Information about any errors that may have occurred during the backtest export.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Amazon Resource Name (ARN) of the predictor.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        # The Amazon Resource Name (ARN) of the predictor backtest export job.
        @[JSON::Field(key: "PredictorBacktestExportJobArn")]
        getter predictor_backtest_export_job_arn : String?

        # The name of the predictor backtest export job.
        @[JSON::Field(key: "PredictorBacktestExportJobName")]
        getter predictor_backtest_export_job_name : String?

        # The status of the predictor backtest export job. States include: ACTIVE CREATE_PENDING ,
        # CREATE_IN_PROGRESS , CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING ,
        # DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @format : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @predictor_arn : String? = nil,
          @predictor_backtest_export_job_arn : String? = nil,
          @predictor_backtest_export_job_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DescribePredictorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor that you want information about.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String

        def initialize(
          @predictor_arn : String
        )
        end
      end

      struct DescribePredictorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the algorithm used for model training.
        @[JSON::Field(key: "AlgorithmArn")]
        getter algorithm_arn : String?

        # When PerformAutoML is specified, the ARN of the chosen algorithm.
        @[JSON::Field(key: "AutoMLAlgorithmArns")]
        getter auto_ml_algorithm_arns : Array(String)?

        # The LatencyOptimized AutoML override strategy is only available in private beta. Contact Amazon Web
        # Services Support or your account manager to learn more about access privileges. The AutoML strategy
        # used to train the predictor. Unless LatencyOptimized is specified, the AutoML strategy optimizes
        # predictor accuracy. This parameter is only valid for predictors trained using AutoML.
        @[JSON::Field(key: "AutoMLOverrideStrategy")]
        getter auto_ml_override_strategy : String?

        # When the model training task was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # An array of the ARNs of the dataset import jobs used to import training data for the predictor.
        @[JSON::Field(key: "DatasetImportJobArns")]
        getter dataset_import_job_arns : Array(String)?

        # An Key Management Service (KMS) key and the Identity and Access Management (IAM) role that Amazon
        # Forecast can assume to access the key.
        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        # The estimated time remaining in minutes for the predictor training job to complete.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # Used to override the default evaluation parameters of the specified algorithm. Amazon Forecast
        # evaluates a predictor by splitting a dataset into training data and testing data. The evaluation
        # parameters define how to perform the split and the number of iterations.
        @[JSON::Field(key: "EvaluationParameters")]
        getter evaluation_parameters : Types::EvaluationParameters?

        # The featurization configuration.
        @[JSON::Field(key: "FeaturizationConfig")]
        getter featurization_config : Types::FeaturizationConfig?

        # The number of time-steps of the forecast. The forecast horizon is also called the prediction length.
        @[JSON::Field(key: "ForecastHorizon")]
        getter forecast_horizon : Int32?

        # The forecast types used during predictor training. Default value is ["0.1","0.5","0.9"]
        @[JSON::Field(key: "ForecastTypes")]
        getter forecast_types : Array(String)?

        # The hyperparameter override values for the algorithm.
        @[JSON::Field(key: "HPOConfig")]
        getter hpo_config : Types::HyperParameterTuningJobConfig?

        # Describes the dataset group that contains the data to use to train the predictor.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # Whether the predictor was created with CreateAutoPredictor .
        @[JSON::Field(key: "IsAutoPredictor")]
        getter is_auto_predictor : Bool?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The accuracy metric used to optimize the predictor.
        @[JSON::Field(key: "OptimizationMetric")]
        getter optimization_metric : String?

        # Whether the predictor is set to perform AutoML.
        @[JSON::Field(key: "PerformAutoML")]
        getter perform_auto_ml : Bool?

        # Whether the predictor is set to perform hyperparameter optimization (HPO).
        @[JSON::Field(key: "PerformHPO")]
        getter perform_hpo : Bool?

        # The ARN of the predictor.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        # Details on the the status and results of the backtests performed to evaluate the accuracy of the
        # predictor. You specify the number of backtests to perform when you call the operation.
        @[JSON::Field(key: "PredictorExecutionDetails")]
        getter predictor_execution_details : Types::PredictorExecutionDetails?

        # The name of the predictor.
        @[JSON::Field(key: "PredictorName")]
        getter predictor_name : String?

        # The status of the predictor. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED CREATE_STOPPING , CREATE_STOPPED
        # The Status of the predictor must be ACTIVE before you can use the predictor to create a forecast.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The default training parameters or overrides selected during model training. When running AutoML or
        # choosing HPO with CNN-QR or DeepAR+, the optimized values for the chosen hyperparameters are
        # returned. For more information, see aws-forecast-choosing-recipes .
        @[JSON::Field(key: "TrainingParameters")]
        getter training_parameters : Hash(String, String)?

        def initialize(
          @algorithm_arn : String? = nil,
          @auto_ml_algorithm_arns : Array(String)? = nil,
          @auto_ml_override_strategy : String? = nil,
          @creation_time : Time? = nil,
          @dataset_import_job_arns : Array(String)? = nil,
          @encryption_config : Types::EncryptionConfig? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @evaluation_parameters : Types::EvaluationParameters? = nil,
          @featurization_config : Types::FeaturizationConfig? = nil,
          @forecast_horizon : Int32? = nil,
          @forecast_types : Array(String)? = nil,
          @hpo_config : Types::HyperParameterTuningJobConfig? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @is_auto_predictor : Bool? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @optimization_metric : String? = nil,
          @perform_auto_ml : Bool? = nil,
          @perform_hpo : Bool? = nil,
          @predictor_arn : String? = nil,
          @predictor_execution_details : Types::PredictorExecutionDetails? = nil,
          @predictor_name : String? = nil,
          @status : String? = nil,
          @training_parameters : Hash(String, String)? = nil
        )
        end
      end

      struct DescribeWhatIfAnalysisRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if analysis that you are interested in.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String

        def initialize(
          @what_if_analysis_arn : String
        )
        end
      end

      struct DescribeWhatIfAnalysisResponse
        include JSON::Serializable

        # When the what-if analysis was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The approximate time remaining to complete the what-if analysis, in minutes.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # The Amazon Resource Name (ARN) of the what-if forecast.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the what-if analysis. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the what-if analysis must be ACTIVE before you can access the analysis.
        @[JSON::Field(key: "Status")]
        getter status : String?

        @[JSON::Field(key: "TimeSeriesSelector")]
        getter time_series_selector : Types::TimeSeriesSelector?

        # The Amazon Resource Name (ARN) of the what-if analysis.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String?

        # The name of the what-if analysis.
        @[JSON::Field(key: "WhatIfAnalysisName")]
        getter what_if_analysis_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @forecast_arn : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @time_series_selector : Types::TimeSeriesSelector? = nil,
          @what_if_analysis_arn : String? = nil,
          @what_if_analysis_name : String? = nil
        )
        end
      end

      struct DescribeWhatIfForecastExportRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if forecast export that you are interested in.
        @[JSON::Field(key: "WhatIfForecastExportArn")]
        getter what_if_forecast_export_arn : String

        def initialize(
          @what_if_forecast_export_arn : String
        )
        end
      end

      struct DescribeWhatIfForecastExportResponse
        include JSON::Serializable

        # When the what-if forecast export was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The approximate time remaining to complete the what-if forecast export, in minutes.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # The format of the exported data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the what-if forecast. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the what-if forecast export must be ACTIVE before you can access the forecast export.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # An array of Amazon Resource Names (ARNs) that represent all of the what-if forecasts exported in
        # this resource.
        @[JSON::Field(key: "WhatIfForecastArns")]
        getter what_if_forecast_arns : Array(String)?

        # The Amazon Resource Name (ARN) of the what-if forecast export.
        @[JSON::Field(key: "WhatIfForecastExportArn")]
        getter what_if_forecast_export_arn : String?

        # The name of the what-if forecast export.
        @[JSON::Field(key: "WhatIfForecastExportName")]
        getter what_if_forecast_export_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @format : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @what_if_forecast_arns : Array(String)? = nil,
          @what_if_forecast_export_arn : String? = nil,
          @what_if_forecast_export_name : String? = nil
        )
        end
      end

      struct DescribeWhatIfForecastRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the what-if forecast that you are interested in.
        @[JSON::Field(key: "WhatIfForecastArn")]
        getter what_if_forecast_arn : String

        def initialize(
          @what_if_forecast_arn : String
        )
        end
      end

      struct DescribeWhatIfForecastResponse
        include JSON::Serializable

        # When the what-if forecast was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The approximate time remaining to complete the what-if forecast, in minutes.
        @[JSON::Field(key: "EstimatedTimeRemainingInMinutes")]
        getter estimated_time_remaining_in_minutes : Int64?

        # The quantiles at which probabilistic forecasts are generated. You can specify up to five quantiles
        # per what-if forecast in the CreateWhatIfForecast operation. If you didn't specify quantiles, the
        # default values are ["0.1", "0.5", "0.9"] .
        @[JSON::Field(key: "ForecastTypes")]
        getter forecast_types : Array(String)?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the what-if forecast. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the what-if forecast must be ACTIVE before you can access the forecast.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # An array of S3Config , Schema , and Format elements that describe the replacement time series.
        @[JSON::Field(key: "TimeSeriesReplacementsDataSource")]
        getter time_series_replacements_data_source : Types::TimeSeriesReplacementsDataSource?

        # An array of Action and TimeSeriesConditions elements that describe what transformations were applied
        # to which time series.
        @[JSON::Field(key: "TimeSeriesTransformations")]
        getter time_series_transformations : Array(Types::TimeSeriesTransformation)?

        # The Amazon Resource Name (ARN) of the what-if analysis that contains this forecast.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String?

        # The Amazon Resource Name (ARN) of the what-if forecast.
        @[JSON::Field(key: "WhatIfForecastArn")]
        getter what_if_forecast_arn : String?

        # The name of the what-if forecast.
        @[JSON::Field(key: "WhatIfForecastName")]
        getter what_if_forecast_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @estimated_time_remaining_in_minutes : Int64? = nil,
          @forecast_types : Array(String)? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @time_series_replacements_data_source : Types::TimeSeriesReplacementsDataSource? = nil,
          @time_series_transformations : Array(Types::TimeSeriesTransformation)? = nil,
          @what_if_analysis_arn : String? = nil,
          @what_if_forecast_arn : String? = nil,
          @what_if_forecast_name : String? = nil
        )
        end
      end

      # An Key Management Service (KMS) key and an Identity and Access Management (IAM) role that Amazon
      # Forecast can assume to access the key. You can specify this optional object in the CreateDataset and
      # CreatePredictor requests.
      struct EncryptionConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the KMS key.
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String

        # The ARN of the IAM role that Amazon Forecast can assume to access the KMS key. Passing a role across
        # Amazon Web Services accounts is not allowed. If you pass a role that isn't in your account, you get
        # an InvalidInputException error.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        def initialize(
          @kms_key_arn : String,
          @role_arn : String
        )
        end
      end

      # Provides detailed error metrics to evaluate the performance of a predictor. This object is part of
      # the Metrics object.
      struct ErrorMetric
        include JSON::Serializable

        # The Forecast type used to compute WAPE, MAPE, MASE, and RMSE.
        @[JSON::Field(key: "ForecastType")]
        getter forecast_type : String?

        # The Mean Absolute Percentage Error (MAPE)
        @[JSON::Field(key: "MAPE")]
        getter mape : Float64?

        # The Mean Absolute Scaled Error (MASE)
        @[JSON::Field(key: "MASE")]
        getter mase : Float64?

        # The root-mean-square error (RMSE).
        @[JSON::Field(key: "RMSE")]
        getter rmse : Float64?

        # The weighted absolute percentage error (WAPE).
        @[JSON::Field(key: "WAPE")]
        getter wape : Float64?

        def initialize(
          @forecast_type : String? = nil,
          @mape : Float64? = nil,
          @mase : Float64? = nil,
          @rmse : Float64? = nil,
          @wape : Float64? = nil
        )
        end
      end

      # Parameters that define how to split a dataset into training data and testing data, and the number of
      # iterations to perform. These parameters are specified in the predefined algorithms but you can
      # override them in the CreatePredictor request.
      struct EvaluationParameters
        include JSON::Serializable

        # The point from the end of the dataset where you want to split the data for model training and
        # testing (evaluation). Specify the value as the number of data points. The default is the value of
        # the forecast horizon. BackTestWindowOffset can be used to mimic a past virtual forecast start date.
        # This value must be greater than or equal to the forecast horizon and less than half of the
        # TARGET_TIME_SERIES dataset length. ForecastHorizon &lt;= BackTestWindowOffset &lt; 1/2 *
        # TARGET_TIME_SERIES dataset length
        @[JSON::Field(key: "BackTestWindowOffset")]
        getter back_test_window_offset : Int32?

        # The number of times to split the input data. The default is 1. Valid values are 1 through 5.
        @[JSON::Field(key: "NumberOfBacktestWindows")]
        getter number_of_backtest_windows : Int32?

        def initialize(
          @back_test_window_offset : Int32? = nil,
          @number_of_backtest_windows : Int32? = nil
        )
        end
      end

      # The results of evaluating an algorithm. Returned as part of the GetAccuracyMetrics response.
      struct EvaluationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the algorithm that was evaluated.
        @[JSON::Field(key: "AlgorithmArn")]
        getter algorithm_arn : String?

        # The array of test windows used for evaluating the algorithm. The NumberOfBacktestWindows from the
        # EvaluationParameters object determines the number of windows in the array.
        @[JSON::Field(key: "TestWindows")]
        getter test_windows : Array(Types::WindowSummary)?

        def initialize(
          @algorithm_arn : String? = nil,
          @test_windows : Array(Types::WindowSummary)? = nil
        )
        end
      end

      # The ExplainabilityConfig data type defines the number of time series and time points included in
      # CreateExplainability . If you provide a predictor ARN for ResourceArn , you must set both
      # TimePointGranularity and TimeSeriesGranularity to “ALL”. When creating Predictor Explainability,
      # Amazon Forecast considers all time series and time points. If you provide a forecast ARN for
      # ResourceArn , you can set TimePointGranularity and TimeSeriesGranularity to either “ALL” or
      # “Specific”.
      struct ExplainabilityConfig
        include JSON::Serializable

        # To create an Explainability for all time points in your forecast horizon, use ALL . To create an
        # Explainability for specific time points in your forecast horizon, use SPECIFIC . Specify time points
        # with the StartDateTime and EndDateTime parameters within the CreateExplainability operation.
        @[JSON::Field(key: "TimePointGranularity")]
        getter time_point_granularity : String

        # To create an Explainability for all time series in your datasets, use ALL . To create an
        # Explainability for specific time series in your datasets, use SPECIFIC . Specify time series by
        # uploading a CSV or Parquet file to an Amazon S3 bucket and set the location within the
        # DataDestination data type.
        @[JSON::Field(key: "TimeSeriesGranularity")]
        getter time_series_granularity : String

        def initialize(
          @time_point_granularity : String,
          @time_series_granularity : String
        )
        end
      end

      # Provides a summary of the Explainability export properties used in the ListExplainabilityExports
      # operation. To get a complete set of properties, call the DescribeExplainabilityExport operation, and
      # provide the ExplainabilityExportArn .
      struct ExplainabilityExportSummary
        include JSON::Serializable

        # When the Explainability was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The Amazon Resource Name (ARN) of the Explainability export.
        @[JSON::Field(key: "ExplainabilityExportArn")]
        getter explainability_export_arn : String?

        # The name of the Explainability export
        @[JSON::Field(key: "ExplainabilityExportName")]
        getter explainability_export_name : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # Information about any errors that may have occurred during the Explainability export.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the Explainability export. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS
        # , CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @explainability_export_arn : String? = nil,
          @explainability_export_name : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides information about the Explainability resource.
      struct ExplainabilityInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Explainability.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String?

        # The status of the Explainability. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @explainability_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the Explainability properties used in the ListExplainabilities operation. To
      # get a complete set of properties, call the DescribeExplainability operation, and provide the listed
      # ExplainabilityArn .
      struct ExplainabilitySummary
        include JSON::Serializable

        # When the Explainability was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the Explainability.
        @[JSON::Field(key: "ExplainabilityArn")]
        getter explainability_arn : String?

        # The configuration settings that define the granularity of time series and time points for the
        # Explainability.
        @[JSON::Field(key: "ExplainabilityConfig")]
        getter explainability_config : Types::ExplainabilityConfig?

        # The name of the Explainability.
        @[JSON::Field(key: "ExplainabilityName")]
        getter explainability_name : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # Information about any errors that may have occurred during the Explainability creation process.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Amazon Resource Name (ARN) of the Predictor or Forecast used to create the Explainability.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The status of the Explainability. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @explainability_arn : String? = nil,
          @explainability_config : Types::ExplainabilityConfig? = nil,
          @explainability_name : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @resource_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # This object belongs to the CreatePredictor operation. If you created your predictor with
      # CreateAutoPredictor , see AttributeConfig . Provides featurization (transformation) information for
      # a dataset field. This object is part of the FeaturizationConfig object. For example: {
      # "AttributeName": "demand", FeaturizationPipeline [ { "FeaturizationMethodName": "filling",
      # "FeaturizationMethodParameters": {"aggregation": "avg", "backfill": "nan"} } ] }
      struct Featurization
        include JSON::Serializable

        # The name of the schema attribute that specifies the data field to be featurized. Amazon Forecast
        # supports the target field of the TARGET_TIME_SERIES and the RELATED_TIME_SERIES datasets. For
        # example, for the RETAIL domain, the target is demand , and for the CUSTOM domain, the target is
        # target_value . For more information, see howitworks-missing-values .
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # An array of one FeaturizationMethod object that specifies the feature transformation method.
        @[JSON::Field(key: "FeaturizationPipeline")]
        getter featurization_pipeline : Array(Types::FeaturizationMethod)?

        def initialize(
          @attribute_name : String,
          @featurization_pipeline : Array(Types::FeaturizationMethod)? = nil
        )
        end
      end

      # This object belongs to the CreatePredictor operation. If you created your predictor with
      # CreateAutoPredictor , see AttributeConfig . In a CreatePredictor operation, the specified algorithm
      # trains a model using the specified dataset group. You can optionally tell the operation to modify
      # data fields prior to training a model. These modifications are referred to as featurization . You
      # define featurization using the FeaturizationConfig object. You specify an array of transformations,
      # one for each field that you want to featurize. You then include the FeaturizationConfig object in
      # your CreatePredictor request. Amazon Forecast applies the featurization to the TARGET_TIME_SERIES
      # and RELATED_TIME_SERIES datasets before model training. You can create multiple featurization
      # configurations. For example, you might call the CreatePredictor operation twice by specifying
      # different featurization configurations.
      struct FeaturizationConfig
        include JSON::Serializable

        # The frequency of predictions in a forecast. Valid intervals are an integer followed by Y (Year), M
        # (Month), W (Week), D (Day), H (Hour), and min (Minute). For example, "1D" indicates every day and
        # "15min" indicates every 15 minutes. You cannot specify a value that would overlap with the next
        # larger frequency. That means, for example, you cannot specify a frequency of 60 minutes, because
        # that is equivalent to 1 hour. The valid values for each frequency are the following: Minute - 1-59
        # Hour - 1-23 Day - 1-6 Week - 1-4 Month - 1-11 Year - 1 Thus, if you want every other week forecasts,
        # specify "2W". Or, if you want quarterly forecasts, you specify "3M". The frequency must be greater
        # than or equal to the TARGET_TIME_SERIES dataset frequency. When a RELATED_TIME_SERIES dataset is
        # provided, the frequency must be equal to the TARGET_TIME_SERIES dataset frequency.
        @[JSON::Field(key: "ForecastFrequency")]
        getter forecast_frequency : String

        # An array of featurization (transformation) information for the fields of a dataset.
        @[JSON::Field(key: "Featurizations")]
        getter featurizations : Array(Types::Featurization)?

        # An array of dimension (field) names that specify how to group the generated forecast. For example,
        # suppose that you are generating a forecast for item sales across all of your stores, and your
        # dataset contains a store_id field. If you want the sales forecast for each item by store, you would
        # specify store_id as the dimension. All forecast dimensions specified in the TARGET_TIME_SERIES
        # dataset don't need to be specified in the CreatePredictor request. All forecast dimensions specified
        # in the RELATED_TIME_SERIES dataset must be specified in the CreatePredictor request.
        @[JSON::Field(key: "ForecastDimensions")]
        getter forecast_dimensions : Array(String)?

        def initialize(
          @forecast_frequency : String,
          @featurizations : Array(Types::Featurization)? = nil,
          @forecast_dimensions : Array(String)? = nil
        )
        end
      end

      # Provides information about the method that featurizes (transforms) a dataset field. The method is
      # part of the FeaturizationPipeline of the Featurization object. The following is an example of how
      # you specify a FeaturizationMethod object. { "FeaturizationMethodName": "filling",
      # "FeaturizationMethodParameters": {"aggregation": "sum", "middlefill": "zero", "backfill": "zero"} }
      struct FeaturizationMethod
        include JSON::Serializable

        # The name of the method. The "filling" method is the only supported method.
        @[JSON::Field(key: "FeaturizationMethodName")]
        getter featurization_method_name : String

        # The method parameters (key-value pairs), which are a map of override parameters. Specify these
        # parameters to override the default values. Related Time Series attributes do not accept aggregation
        # parameters. The following list shows the parameters and their valid values for the "filling"
        # featurization method for a Target Time Series dataset. Bold signifies the default value. aggregation
        # : sum , avg , first , min , max frontfill : none middlefill : zero , nan (not a number), value ,
        # median , mean , min , max backfill : zero , nan , value , median , mean , min , max The following
        # list shows the parameters and their valid values for a Related Time Series featurization method
        # (there are no defaults): middlefill : zero , value , median , mean , min , max backfill : zero ,
        # value , median , mean , min , max futurefill : zero , value , median , mean , min , max To set a
        # filling method to a specific value, set the fill parameter to value and define the value in a
        # corresponding _value parameter. For example, to set backfilling to a value of 2, include the
        # following: "backfill": "value" and "backfill_value":"2" .
        @[JSON::Field(key: "FeaturizationMethodParameters")]
        getter featurization_method_parameters : Hash(String, String)?

        def initialize(
          @featurization_method_name : String,
          @featurization_method_parameters : Hash(String, String)? = nil
        )
        end
      end

      # Describes a filter for choosing a subset of objects. Each filter consists of a condition and a match
      # statement. The condition is either IS or IS_NOT , which specifies whether to include or exclude the
      # objects that match the statement, respectively. The match statement consists of a key and a value.
      struct Filter
        include JSON::Serializable

        # The condition to apply. To include the objects that match the statement, specify IS . To exclude
        # matching objects, specify IS_NOT .
        @[JSON::Field(key: "Condition")]
        getter condition : String

        # The name of the parameter to filter on.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value to match.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @condition : String,
          @key : String,
          @value : String
        )
        end
      end

      # Provides a summary of the forecast export job properties used in the ListForecastExportJobs
      # operation. To get the complete set of properties, call the DescribeForecastExportJob operation, and
      # provide the listed ForecastExportJobArn .
      struct ForecastExportJobSummary
        include JSON::Serializable

        # When the forecast export job was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The path to the Amazon Simple Storage Service (Amazon S3) bucket where the forecast is exported.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The Amazon Resource Name (ARN) of the forecast export job.
        @[JSON::Field(key: "ForecastExportJobArn")]
        getter forecast_export_job_arn : String?

        # The name of the forecast export job.
        @[JSON::Field(key: "ForecastExportJobName")]
        getter forecast_export_job_name : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the forecast export job. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the forecast export job must be ACTIVE before you can access the forecast in your S3
        # bucket.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @forecast_export_job_arn : String? = nil,
          @forecast_export_job_name : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the forecast properties used in the ListForecasts operation. To get the
      # complete set of properties, call the DescribeForecast operation, and provide the ForecastArn that is
      # listed in the summary.
      struct ForecastSummary
        include JSON::Serializable

        # Whether the Forecast was created from an AutoPredictor.
        @[JSON::Field(key: "CreatedUsingAutoPredictor")]
        getter created_using_auto_predictor : Bool?

        # When the forecast creation task was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group that provided the data used to train the
        # predictor.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String?

        # The ARN of the forecast.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String?

        # The name of the forecast.
        @[JSON::Field(key: "ForecastName")]
        getter forecast_name : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ARN of the predictor used to generate the forecast.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        # The status of the forecast. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the forecast must be ACTIVE before you can query or export the forecast.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_using_auto_predictor : Bool? = nil,
          @creation_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @forecast_arn : String? = nil,
          @forecast_name : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @predictor_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetAccuracyMetricsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the predictor to get metrics for.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String

        def initialize(
          @predictor_arn : String
        )
        end
      end

      struct GetAccuracyMetricsResponse
        include JSON::Serializable

        # The LatencyOptimized AutoML override strategy is only available in private beta. Contact Amazon Web
        # Services Support or your account manager to learn more about access privileges. The AutoML strategy
        # used to train the predictor. Unless LatencyOptimized is specified, the AutoML strategy optimizes
        # predictor accuracy. This parameter is only valid for predictors trained using AutoML.
        @[JSON::Field(key: "AutoMLOverrideStrategy")]
        getter auto_ml_override_strategy : String?

        # Whether the predictor was created with CreateAutoPredictor .
        @[JSON::Field(key: "IsAutoPredictor")]
        getter is_auto_predictor : Bool?

        # The accuracy metric used to optimize the predictor.
        @[JSON::Field(key: "OptimizationMetric")]
        getter optimization_metric : String?

        # An array of results from evaluating the predictor.
        @[JSON::Field(key: "PredictorEvaluationResults")]
        getter predictor_evaluation_results : Array(Types::EvaluationResult)?

        def initialize(
          @auto_ml_override_strategy : String? = nil,
          @is_auto_predictor : Bool? = nil,
          @optimization_metric : String? = nil,
          @predictor_evaluation_results : Array(Types::EvaluationResult)? = nil
        )
        end
      end

      # Configuration information for a hyperparameter tuning job. You specify this object in the
      # CreatePredictor request. A hyperparameter is a parameter that governs the model training process.
      # You set hyperparameters before training starts, unlike model parameters, which are determined during
      # training. The values of the hyperparameters effect which values are chosen for the model parameters.
      # In a hyperparameter tuning job , Amazon Forecast chooses the set of hyperparameter values that
      # optimize a specified metric. Forecast accomplishes this by running many training jobs over a range
      # of hyperparameter values. The optimum set of values depends on the algorithm, the training data, and
      # the specified metric objective.
      struct HyperParameterTuningJobConfig
        include JSON::Serializable

        # Specifies the ranges of valid values for the hyperparameters.
        @[JSON::Field(key: "ParameterRanges")]
        getter parameter_ranges : Types::ParameterRanges?

        def initialize(
          @parameter_ranges : Types::ParameterRanges? = nil
        )
        end
      end

      # This object belongs to the CreatePredictor operation. If you created your predictor with
      # CreateAutoPredictor , see DataConfig . The data used to train a predictor. The data includes a
      # dataset group and any supplementary features. You specify this object in the CreatePredictor
      # request.
      struct InputDataConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset group.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String

        # An array of supplementary features. The only supported feature is a holiday calendar.
        @[JSON::Field(key: "SupplementaryFeatures")]
        getter supplementary_features : Array(Types::SupplementaryFeature)?

        def initialize(
          @dataset_group_arn : String,
          @supplementary_features : Array(Types::SupplementaryFeature)? = nil
        )
        end
      end

      # Specifies an integer hyperparameter and it's range of tunable values. This object is part of the
      # ParameterRanges object.
      struct IntegerParameterRange
        include JSON::Serializable

        # The maximum tunable value of the hyperparameter.
        @[JSON::Field(key: "MaxValue")]
        getter max_value : Int32

        # The minimum tunable value of the hyperparameter.
        @[JSON::Field(key: "MinValue")]
        getter min_value : Int32

        # The name of the hyperparameter to tune.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The scale that hyperparameter tuning uses to search the hyperparameter range. Valid values: Auto
        # Amazon Forecast hyperparameter tuning chooses the best scale for the hyperparameter. Linear
        # Hyperparameter tuning searches the values in the hyperparameter range by using a linear scale.
        # Logarithmic Hyperparameter tuning searches the values in the hyperparameter range by using a
        # logarithmic scale. Logarithmic scaling works only for ranges that have values greater than 0.
        # ReverseLogarithmic Not supported for IntegerParameterRange . Reverse logarithmic scaling works only
        # for ranges that are entirely within the range 0 &lt;= x &lt; 1.0. For information about choosing a
        # hyperparameter scale, see Hyperparameter Scaling . One of the following values:
        @[JSON::Field(key: "ScalingType")]
        getter scaling_type : String?

        def initialize(
          @max_value : Int32,
          @min_value : Int32,
          @name : String,
          @scaling_type : String? = nil
        )
        end
      end

      # We can't process the request because it includes an invalid value or a value that exceeds the valid
      # range.
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

      # The limit on the number of resources per account has been exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListDatasetGroupsRequest
        include JSON::Serializable

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetGroupsResponse
        include JSON::Serializable

        # An array of objects that summarize each dataset group's properties.
        @[JSON::Field(key: "DatasetGroups")]
        getter dataset_groups : Array(Types::DatasetGroupSummary)?

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_groups : Array(Types::DatasetGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetImportJobsRequest
        include JSON::Serializable

        # An array of filters. For each filter, you provide a condition and a match statement. The condition
        # is either IS or IS_NOT , which specifies whether to include or exclude the datasets that match the
        # statement from the list, respectively. The match statement consists of a key and a value. Filter
        # properties Condition - The condition to apply. Valid values are IS and IS_NOT . To include the
        # datasets that match the statement, specify IS . To exclude matching datasets, specify IS_NOT . Key -
        # The name of the parameter to filter on. Valid values are DatasetArn and Status . Value - The value
        # to match. For example, to list all dataset import jobs whose status is ACTIVE, you specify the
        # following filter: "Filters": [ { "Condition": "IS", "Key": "Status", "Value": "ACTIVE" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetImportJobsResponse
        include JSON::Serializable

        # An array of objects that summarize each dataset import job's properties.
        @[JSON::Field(key: "DatasetImportJobs")]
        getter dataset_import_jobs : Array(Types::DatasetImportJobSummary)?

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_import_jobs : Array(Types::DatasetImportJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsRequest
        include JSON::Serializable

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsResponse
        include JSON::Serializable

        # An array of objects that summarize each dataset's properties.
        @[JSON::Field(key: "Datasets")]
        getter datasets : Array(Types::DatasetSummary)?

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @datasets : Array(Types::DatasetSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExplainabilitiesRequest
        include JSON::Serializable

        # An array of filters. For each filter, provide a condition and a match statement. The condition is
        # either IS or IS_NOT , which specifies whether to include or exclude the resources that match the
        # statement from the list. The match statement consists of a key and a value. Filter properties
        # Condition - The condition to apply. Valid values are IS and IS_NOT . Key - The name of the parameter
        # to filter on. Valid values are ResourceArn and Status . Value - The value to match.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items returned in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken. To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExplainabilitiesResponse
        include JSON::Serializable

        # An array of objects that summarize the properties of each Explainability resource.
        @[JSON::Field(key: "Explainabilities")]
        getter explainabilities : Array(Types::ExplainabilitySummary)?

        # Returns this token if the response is truncated. To retrieve the next set of results, use the token
        # in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @explainabilities : Array(Types::ExplainabilitySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExplainabilityExportsRequest
        include JSON::Serializable

        # An array of filters. For each filter, provide a condition and a match statement. The condition is
        # either IS or IS_NOT , which specifies whether to include or exclude resources that match the
        # statement from the list. The match statement consists of a key and a value. Filter properties
        # Condition - The condition to apply. Valid values are IS and IS_NOT . Key - The name of the parameter
        # to filter on. Valid values are ResourceArn and Status . Value - The value to match.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken. To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExplainabilityExportsResponse
        include JSON::Serializable

        # An array of objects that summarize the properties of each Explainability export.
        @[JSON::Field(key: "ExplainabilityExports")]
        getter explainability_exports : Array(Types::ExplainabilityExportSummary)?

        # Returns this token if the response is truncated. To retrieve the next set of results, use the token
        # in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @explainability_exports : Array(Types::ExplainabilityExportSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListForecastExportJobsRequest
        include JSON::Serializable

        # An array of filters. For each filter, you provide a condition and a match statement. The condition
        # is either IS or IS_NOT , which specifies whether to include or exclude the forecast export jobs that
        # match the statement from the list, respectively. The match statement consists of a key and a value.
        # Filter properties Condition - The condition to apply. Valid values are IS and IS_NOT . To include
        # the forecast export jobs that match the statement, specify IS . To exclude matching forecast export
        # jobs, specify IS_NOT . Key - The name of the parameter to filter on. Valid values are ForecastArn
        # and Status . Value - The value to match. For example, to list all jobs that export a forecast named
        # electricityforecast , specify the following filter: "Filters": [ { "Condition": "IS", "Key":
        # "ForecastArn", "Value": "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityforecast" }
        # ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListForecastExportJobsResponse
        include JSON::Serializable

        # An array of objects that summarize each export job's properties.
        @[JSON::Field(key: "ForecastExportJobs")]
        getter forecast_export_jobs : Array(Types::ForecastExportJobSummary)?

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @forecast_export_jobs : Array(Types::ForecastExportJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListForecastsRequest
        include JSON::Serializable

        # An array of filters. For each filter, you provide a condition and a match statement. The condition
        # is either IS or IS_NOT , which specifies whether to include or exclude the forecasts that match the
        # statement from the list, respectively. The match statement consists of a key and a value. Filter
        # properties Condition - The condition to apply. Valid values are IS and IS_NOT . To include the
        # forecasts that match the statement, specify IS . To exclude matching forecasts, specify IS_NOT . Key
        # - The name of the parameter to filter on. Valid values are DatasetGroupArn , PredictorArn , and
        # Status . Value - The value to match. For example, to list all forecasts whose status is not ACTIVE,
        # you would specify: "Filters": [ { "Condition": "IS_NOT", "Key": "Status", "Value": "ACTIVE" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListForecastsResponse
        include JSON::Serializable

        # An array of objects that summarize each forecast's properties.
        @[JSON::Field(key: "Forecasts")]
        getter forecasts : Array(Types::ForecastSummary)?

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @forecasts : Array(Types::ForecastSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMonitorEvaluationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor resource to get results from.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        # An array of filters. For each filter, provide a condition and a match statement. The condition is
        # either IS or IS_NOT , which specifies whether to include or exclude the resources that match the
        # statement from the list. The match statement consists of a key and a value. Filter properties
        # Condition - The condition to apply. Valid values are IS and IS_NOT . Key - The name of the parameter
        # to filter on. The only valid value is EvaluationState . Value - The value to match. Valid values are
        # only SUCCESS or FAILURE . For example, to list only successful monitor evaluations, you would
        # specify: "Filters": [ { "Condition": "IS", "Key": "EvaluationState", "Value": "SUCCESS" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of monitoring results to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @monitor_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMonitorEvaluationsResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The monitoring results and predictor events collected by the monitor resource during different
        # windows of time. For information about monitoring see Viewing Monitoring Results . For more
        # information about retrieving monitoring results see Viewing Monitoring Results .
        @[JSON::Field(key: "PredictorMonitorEvaluations")]
        getter predictor_monitor_evaluations : Array(Types::PredictorMonitorEvaluation)?

        def initialize(
          @next_token : String? = nil,
          @predictor_monitor_evaluations : Array(Types::PredictorMonitorEvaluation)? = nil
        )
        end
      end

      struct ListMonitorsRequest
        include JSON::Serializable

        # An array of filters. For each filter, provide a condition and a match statement. The condition is
        # either IS or IS_NOT , which specifies whether to include or exclude the resources that match the
        # statement from the list. The match statement consists of a key and a value. Filter properties
        # Condition - The condition to apply. Valid values are IS and IS_NOT . Key - The name of the parameter
        # to filter on. The only valid value is Status . Value - The value to match. For example, to list all
        # monitors who's status is ACTIVE, you would specify: "Filters": [ { "Condition": "IS", "Key":
        # "Status", "Value": "ACTIVE" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of monitors to include in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMonitorsResponse
        include JSON::Serializable

        # An array of objects that summarize each monitor's properties.
        @[JSON::Field(key: "Monitors")]
        getter monitors : Array(Types::MonitorSummary)?

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @monitors : Array(Types::MonitorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPredictorBacktestExportJobsRequest
        include JSON::Serializable

        # An array of filters. For each filter, provide a condition and a match statement. The condition is
        # either IS or IS_NOT , which specifies whether to include or exclude the predictor backtest export
        # jobs that match the statement from the list. The match statement consists of a key and a value.
        # Filter properties Condition - The condition to apply. Valid values are IS and IS_NOT . To include
        # the predictor backtest export jobs that match the statement, specify IS . To exclude matching
        # predictor backtest export jobs, specify IS_NOT . Key - The name of the parameter to filter on. Valid
        # values are PredictorArn and Status . Value - The value to match.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken. To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPredictorBacktestExportJobsResponse
        include JSON::Serializable

        # Returns this token if the response is truncated. To retrieve the next set of results, use the token
        # in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of objects that summarize the properties of each predictor backtest export job.
        @[JSON::Field(key: "PredictorBacktestExportJobs")]
        getter predictor_backtest_export_jobs : Array(Types::PredictorBacktestExportJobSummary)?

        def initialize(
          @next_token : String? = nil,
          @predictor_backtest_export_jobs : Array(Types::PredictorBacktestExportJobSummary)? = nil
        )
        end
      end

      struct ListPredictorsRequest
        include JSON::Serializable

        # An array of filters. For each filter, you provide a condition and a match statement. The condition
        # is either IS or IS_NOT , which specifies whether to include or exclude the predictors that match the
        # statement from the list, respectively. The match statement consists of a key and a value. Filter
        # properties Condition - The condition to apply. Valid values are IS and IS_NOT . To include the
        # predictors that match the statement, specify IS . To exclude matching predictors, specify IS_NOT .
        # Key - The name of the parameter to filter on. Valid values are DatasetGroupArn and Status . Value -
        # The value to match. For example, to list all predictors whose status is ACTIVE, you would specify:
        # "Filters": [ { "Condition": "IS", "Key": "Status", "Value": "ACTIVE" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPredictorsResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Forecast returns this token. To retrieve the next set of
        # results, use the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of objects that summarize each predictor's properties.
        @[JSON::Field(key: "Predictors")]
        getter predictors : Array(Types::PredictorSummary)?

        def initialize(
          @next_token : String? = nil,
          @predictors : Array(Types::PredictorSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource for which to list the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListWhatIfAnalysesRequest
        include JSON::Serializable

        # An array of filters. For each filter, you provide a condition and a match statement. The condition
        # is either IS or IS_NOT , which specifies whether to include or exclude the what-if analysis jobs
        # that match the statement from the list, respectively. The match statement consists of a key and a
        # value. Filter properties Condition - The condition to apply. Valid values are IS and IS_NOT . To
        # include the what-if analysis jobs that match the statement, specify IS . To exclude matching what-if
        # analysis jobs, specify IS_NOT . Key - The name of the parameter to filter on. Valid values are
        # WhatIfAnalysisArn and Status . Value - The value to match. For example, to list all jobs that export
        # a forecast named electricityWhatIf , specify the following filter: "Filters": [ { "Condition": "IS",
        # "Key": "WhatIfAnalysisArn", "Value":
        # "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityWhatIf" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWhatIfAnalysesResponse
        include JSON::Serializable

        # If the response is truncated, Forecast returns this token. To retrieve the next set of results, use
        # the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of WhatIfAnalysisSummary objects that describe the matched analyses.
        @[JSON::Field(key: "WhatIfAnalyses")]
        getter what_if_analyses : Array(Types::WhatIfAnalysisSummary)?

        def initialize(
          @next_token : String? = nil,
          @what_if_analyses : Array(Types::WhatIfAnalysisSummary)? = nil
        )
        end
      end

      struct ListWhatIfForecastExportsRequest
        include JSON::Serializable

        # An array of filters. For each filter, you provide a condition and a match statement. The condition
        # is either IS or IS_NOT , which specifies whether to include or exclude the what-if forecast export
        # jobs that match the statement from the list, respectively. The match statement consists of a key and
        # a value. Filter properties Condition - The condition to apply. Valid values are IS and IS_NOT . To
        # include the forecast export jobs that match the statement, specify IS . To exclude matching forecast
        # export jobs, specify IS_NOT . Key - The name of the parameter to filter on. Valid values are
        # WhatIfForecastExportArn and Status . Value - The value to match. For example, to list all jobs that
        # export a forecast named electricityWIFExport , specify the following filter: "Filters": [ {
        # "Condition": "IS", "Key": "WhatIfForecastExportArn", "Value":
        # "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityWIFExport" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next&#x2028; request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWhatIfForecastExportsResponse
        include JSON::Serializable

        # If the response is truncated, Forecast returns this token. To retrieve the next set of results, use
        # the token in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of WhatIfForecastExports objects that describe the matched forecast exports.
        @[JSON::Field(key: "WhatIfForecastExports")]
        getter what_if_forecast_exports : Array(Types::WhatIfForecastExportSummary)?

        def initialize(
          @next_token : String? = nil,
          @what_if_forecast_exports : Array(Types::WhatIfForecastExportSummary)? = nil
        )
        end
      end

      struct ListWhatIfForecastsRequest
        include JSON::Serializable

        # An array of filters. For each filter, you provide a condition and a match statement. The condition
        # is either IS or IS_NOT , which specifies whether to include or exclude the what-if forecast export
        # jobs that match the statement from the list, respectively. The match statement consists of a key and
        # a value. Filter properties Condition - The condition to apply. Valid values are IS and IS_NOT . To
        # include the forecast export jobs that match the statement, specify IS . To exclude matching forecast
        # export jobs, specify IS_NOT . Key - The name of the parameter to filter on. Valid values are
        # WhatIfForecastArn and Status . Value - The value to match. For example, to list all jobs that export
        # a forecast named electricityWhatIfForecast , specify the following filter: "Filters": [ {
        # "Condition": "IS", "Key": "WhatIfForecastArn", "Value":
        # "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityWhatIfForecast" } ]
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of items to return in the response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next&#x2028; request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWhatIfForecastsResponse
        include JSON::Serializable

        # If the result of the previous request was truncated, the response includes a NextToken . To retrieve
        # the next set of results, use the token in the next&#x2028; request. Tokens expire after 24 hours.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of WhatIfForecasts objects that describe the matched forecasts.
        @[JSON::Field(key: "WhatIfForecasts")]
        getter what_if_forecasts : Array(Types::WhatIfForecastSummary)?

        def initialize(
          @next_token : String? = nil,
          @what_if_forecasts : Array(Types::WhatIfForecastSummary)? = nil
        )
        end
      end

      # An individual metric Forecast calculated when monitoring predictor usage. You can compare the value
      # for this metric to the metric's value in the Baseline to see how your predictor's performance is
      # changing. For more information about metrics generated by Forecast see Evaluating Predictor Accuracy
      struct MetricResult
        include JSON::Serializable

        # The name of the metric.
        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The value for the metric.
        @[JSON::Field(key: "MetricValue")]
        getter metric_value : Float64?

        def initialize(
          @metric_name : String? = nil,
          @metric_value : Float64? = nil
        )
        end
      end

      # Provides metrics that are used to evaluate the performance of a predictor. This object is part of
      # the WindowSummary object.
      struct Metrics
        include JSON::Serializable

        # The average value of all weighted quantile losses.
        @[JSON::Field(key: "AverageWeightedQuantileLoss")]
        getter average_weighted_quantile_loss : Float64?

        # Provides detailed error metrics for each forecast type. Metrics include root-mean square-error
        # (RMSE), mean absolute percentage error (MAPE), mean absolute scaled error (MASE), and weighted
        # average percentage error (WAPE).
        @[JSON::Field(key: "ErrorMetrics")]
        getter error_metrics : Array(Types::ErrorMetric)?

        # The root-mean-square error (RMSE).
        @[JSON::Field(key: "RMSE")]
        getter rmse : Float64?

        # An array of weighted quantile losses. Quantiles divide a probability distribution into regions of
        # equal probability. The distribution in this case is the loss function.
        @[JSON::Field(key: "WeightedQuantileLosses")]
        getter weighted_quantile_losses : Array(Types::WeightedQuantileLoss)?

        def initialize(
          @average_weighted_quantile_loss : Float64? = nil,
          @error_metrics : Array(Types::ErrorMetric)? = nil,
          @rmse : Float64? = nil,
          @weighted_quantile_losses : Array(Types::WeightedQuantileLoss)? = nil
        )
        end
      end

      # The configuration details for the predictor monitor.
      struct MonitorConfig
        include JSON::Serializable

        # The name of the monitor resource.
        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        def initialize(
          @monitor_name : String
        )
        end
      end

      # The source of the data the monitor used during the evaluation.
      struct MonitorDataSource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset import job used to import the data that initiated the
        # monitor evaluation.
        @[JSON::Field(key: "DatasetImportJobArn")]
        getter dataset_import_job_arn : String?

        # The Amazon Resource Name (ARN) of the forecast the monitor used during the evaluation.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String?

        # The Amazon Resource Name (ARN) of the predictor resource you are monitoring.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        def initialize(
          @dataset_import_job_arn : String? = nil,
          @forecast_arn : String? = nil,
          @predictor_arn : String? = nil
        )
        end
      end

      # Provides information about the monitor resource.
      struct MonitorInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor resource.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        # The status of the monitor. States include: ACTIVE ACTIVE_STOPPING , ACTIVE_STOPPED
        # UPDATE_IN_PROGRESS CREATE_PENDING , CREATE_IN_PROGRESS , CREATE_FAILED DELETE_PENDING ,
        # DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @monitor_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the monitor properties used in the ListMonitors operation. To get a complete
      # set of properties, call the DescribeMonitor operation, and provide the listed MonitorArn .
      struct MonitorSummary
        include JSON::Serializable

        # When the monitor resource was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The last time the monitor resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. STOPPED - When the
        # resource stopped. ACTIVE or CREATE_FAILED - When the monitor creation finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # The Amazon Resource Name (ARN) of the monitor resource.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        # The name of the monitor resource.
        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String?

        # The Amazon Resource Name (ARN) of the predictor being monitored.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The status of the monitor. States include: ACTIVE ACTIVE_STOPPING , ACTIVE_STOPPED
        # UPDATE_IN_PROGRESS CREATE_PENDING , CREATE_IN_PROGRESS , CREATE_FAILED DELETE_PENDING ,
        # DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modification_time : Time? = nil,
          @monitor_arn : String? = nil,
          @monitor_name : String? = nil,
          @resource_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the categorical, continuous, and integer hyperparameters, and their ranges of tunable
      # values. The range of tunable values determines which values that a hyperparameter tuning job can
      # choose for the specified hyperparameter. This object is part of the HyperParameterTuningJobConfig
      # object.
      struct ParameterRanges
        include JSON::Serializable

        # Specifies the tunable range for each categorical hyperparameter.
        @[JSON::Field(key: "CategoricalParameterRanges")]
        getter categorical_parameter_ranges : Array(Types::CategoricalParameterRange)?

        # Specifies the tunable range for each continuous hyperparameter.
        @[JSON::Field(key: "ContinuousParameterRanges")]
        getter continuous_parameter_ranges : Array(Types::ContinuousParameterRange)?

        # Specifies the tunable range for each integer hyperparameter.
        @[JSON::Field(key: "IntegerParameterRanges")]
        getter integer_parameter_ranges : Array(Types::IntegerParameterRange)?

        def initialize(
          @categorical_parameter_ranges : Array(Types::CategoricalParameterRange)? = nil,
          @continuous_parameter_ranges : Array(Types::ContinuousParameterRange)? = nil,
          @integer_parameter_ranges : Array(Types::IntegerParameterRange)? = nil
        )
        end
      end

      # Provides a summary of the predictor backtest export job properties used in the
      # ListPredictorBacktestExportJobs operation. To get a complete set of properties, call the
      # DescribePredictorBacktestExportJob operation, and provide the listed PredictorBacktestExportJobArn .
      struct PredictorBacktestExportJobSummary
        include JSON::Serializable

        # When the predictor backtest export job was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # Information about any errors that may have occurred during the backtest export.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Amazon Resource Name (ARN) of the predictor backtest export job.
        @[JSON::Field(key: "PredictorBacktestExportJobArn")]
        getter predictor_backtest_export_job_arn : String?

        # The name of the predictor backtest export job.
        @[JSON::Field(key: "PredictorBacktestExportJobName")]
        getter predictor_backtest_export_job_name : String?

        # The status of the predictor backtest export job. States include: ACTIVE CREATE_PENDING ,
        # CREATE_IN_PROGRESS , CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING ,
        # DELETE_IN_PROGRESS , DELETE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @predictor_backtest_export_job_arn : String? = nil,
          @predictor_backtest_export_job_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Metrics you can use as a baseline for comparison purposes. Use these metrics when you interpret
      # monitoring results for an auto predictor.
      struct PredictorBaseline
        include JSON::Serializable

        # The initial accuracy metrics for the predictor. Use these metrics as a baseline for comparison
        # purposes as you use your predictor and the metrics change.
        @[JSON::Field(key: "BaselineMetrics")]
        getter baseline_metrics : Array(Types::BaselineMetric)?

        def initialize(
          @baseline_metrics : Array(Types::BaselineMetric)? = nil
        )
        end
      end

      # Provides details about a predictor event, such as a retraining.
      struct PredictorEvent
        include JSON::Serializable

        # The timestamp for when the event occurred.
        @[JSON::Field(key: "Datetime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter datetime : Time?

        # The type of event. For example, Retrain . A retraining event denotes the timepoint when a predictor
        # was retrained. Any monitor results from before the Datetime are from the previous predictor. Any new
        # metrics are for the newly retrained predictor.
        @[JSON::Field(key: "Detail")]
        getter detail : String?

        def initialize(
          @datetime : Time? = nil,
          @detail : String? = nil
        )
        end
      end

      # The algorithm used to perform a backtest and the status of those tests.
      struct PredictorExecution
        include JSON::Serializable

        # The ARN of the algorithm used to test the predictor.
        @[JSON::Field(key: "AlgorithmArn")]
        getter algorithm_arn : String?

        # An array of test windows used to evaluate the algorithm. The NumberOfBacktestWindows from the object
        # determines the number of windows in the array.
        @[JSON::Field(key: "TestWindows")]
        getter test_windows : Array(Types::TestWindowSummary)?

        def initialize(
          @algorithm_arn : String? = nil,
          @test_windows : Array(Types::TestWindowSummary)? = nil
        )
        end
      end

      # Contains details on the backtests performed to evaluate the accuracy of the predictor. The tests are
      # returned in descending order of accuracy, with the most accurate backtest appearing first. You
      # specify the number of backtests to perform when you call the operation.
      struct PredictorExecutionDetails
        include JSON::Serializable

        # An array of the backtests performed to evaluate the accuracy of the predictor against a particular
        # algorithm. The NumberOfBacktestWindows from the object determines the number of windows in the
        # array.
        @[JSON::Field(key: "PredictorExecutions")]
        getter predictor_executions : Array(Types::PredictorExecution)?

        def initialize(
          @predictor_executions : Array(Types::PredictorExecution)? = nil
        )
        end
      end

      # Describes the results of a monitor evaluation.
      struct PredictorMonitorEvaluation
        include JSON::Serializable

        # The status of the monitor evaluation. The state can be SUCCESS or FAILURE .
        @[JSON::Field(key: "EvaluationState")]
        getter evaluation_state : String?

        # The timestamp that indicates when the monitor evaluation was started.
        @[JSON::Field(key: "EvaluationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_time : Time?

        # Information about any errors that may have occurred during the monitor evaluation.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # A list of metrics Forecast calculated when monitoring a predictor. You can compare the value for
        # each metric in the list to the metric's value in the Baseline to see how your predictor's
        # performance is changing.
        @[JSON::Field(key: "MetricResults")]
        getter metric_results : Array(Types::MetricResult)?

        # The Amazon Resource Name (ARN) of the monitor resource.
        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        # The source of the data the monitor resource used during the evaluation.
        @[JSON::Field(key: "MonitorDataSource")]
        getter monitor_data_source : Types::MonitorDataSource?

        # The number of items considered during the evaluation.
        @[JSON::Field(key: "NumItemsEvaluated")]
        getter num_items_evaluated : Int64?

        # Provides details about a predictor event, such as a retraining.
        @[JSON::Field(key: "PredictorEvent")]
        getter predictor_event : Types::PredictorEvent?

        # The Amazon Resource Name (ARN) of the resource to monitor.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The timestamp that indicates the end of the window that is used for monitor evaluation.
        @[JSON::Field(key: "WindowEndDatetime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter window_end_datetime : Time?

        # The timestamp that indicates the start of the window that is used for monitor evaluation.
        @[JSON::Field(key: "WindowStartDatetime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter window_start_datetime : Time?

        def initialize(
          @evaluation_state : String? = nil,
          @evaluation_time : Time? = nil,
          @message : String? = nil,
          @metric_results : Array(Types::MetricResult)? = nil,
          @monitor_arn : String? = nil,
          @monitor_data_source : Types::MonitorDataSource? = nil,
          @num_items_evaluated : Int64? = nil,
          @predictor_event : Types::PredictorEvent? = nil,
          @resource_arn : String? = nil,
          @window_end_datetime : Time? = nil,
          @window_start_datetime : Time? = nil
        )
        end
      end

      # Provides a summary of the predictor properties that are used in the ListPredictors operation. To get
      # the complete set of properties, call the DescribePredictor operation, and provide the listed
      # PredictorArn .
      struct PredictorSummary
        include JSON::Serializable

        # When the model training task was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the dataset group that contains the data used to train the
        # predictor.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String?

        # Whether AutoPredictor was used to create the predictor.
        @[JSON::Field(key: "IsAutoPredictor")]
        getter is_auto_predictor : Bool?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ARN of the predictor.
        @[JSON::Field(key: "PredictorArn")]
        getter predictor_arn : String?

        # The name of the predictor.
        @[JSON::Field(key: "PredictorName")]
        getter predictor_name : String?

        # A summary of the reference predictor used if the predictor was retrained or upgraded.
        @[JSON::Field(key: "ReferencePredictorSummary")]
        getter reference_predictor_summary : Types::ReferencePredictorSummary?

        # The status of the predictor. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED CREATE_STOPPING , CREATE_STOPPED
        # The Status of the predictor must be ACTIVE before you can use the predictor to create a forecast.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @dataset_group_arn : String? = nil,
          @is_auto_predictor : Bool? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @predictor_arn : String? = nil,
          @predictor_name : String? = nil,
          @reference_predictor_summary : Types::ReferencePredictorSummary? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides a summary of the reference predictor used when retraining or upgrading a predictor.
      struct ReferencePredictorSummary
        include JSON::Serializable

        # The ARN of the reference predictor.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Whether the reference predictor is Active or Deleted .
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @state : String? = nil
        )
        end
      end

      # There is already a resource with this name. Try again with a different name.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
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

      # We can't find a resource with that Amazon Resource Name (ARN). Check the ARN and try again.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ResumeResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor resource to resume.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # The path to the file(s) in an Amazon Simple Storage Service (Amazon S3) bucket, and an Identity and
      # Access Management (IAM) role that Amazon Forecast can assume to access the file(s). Optionally,
      # includes an Key Management Service (KMS) key. This object is part of the DataSource object that is
      # submitted in the CreateDatasetImportJob request, and part of the DataDestination object.
      struct S3Config
        include JSON::Serializable

        # The path to an Amazon Simple Storage Service (Amazon S3) bucket or file(s) in an Amazon S3 bucket.
        @[JSON::Field(key: "Path")]
        getter path : String

        # The ARN of the Identity and Access Management (IAM) role that Amazon Forecast can assume to access
        # the Amazon S3 bucket or files. If you provide a value for the KMSKeyArn key, the role must allow
        # access to the key. Passing a role across Amazon Web Services accounts is not allowed. If you pass a
        # role that isn't in your account, you get an InvalidInputException error.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) of an Key Management Service (KMS) key.
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @path : String,
          @role_arn : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # Defines the fields of a dataset.
      struct Schema
        include JSON::Serializable

        # An array of attributes specifying the name and type of each field in a dataset.
        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::SchemaAttribute)?

        def initialize(
          @attributes : Array(Types::SchemaAttribute)? = nil
        )
        end
      end

      # An attribute of a schema, which defines a dataset field. A schema attribute is required for every
      # field in a dataset. The Schema object contains an array of SchemaAttribute objects.
      struct SchemaAttribute
        include JSON::Serializable

        # The name of the dataset field.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The data type of the field. For a related time series dataset, other than date, item_id, and
        # forecast dimensions attributes, all attributes should be of numerical type (integer/float).
        @[JSON::Field(key: "AttributeType")]
        getter attribute_type : String?

        def initialize(
          @attribute_name : String? = nil,
          @attribute_type : String? = nil
        )
        end
      end

      # Provides statistics for each data field imported into to an Amazon Forecast dataset with the
      # CreateDatasetImportJob operation.
      struct Statistics
        include JSON::Serializable

        # For a numeric field, the average value in the field.
        @[JSON::Field(key: "Avg")]
        getter avg : Float64?

        # The number of values in the field. If the response value is -1, refer to CountLong .
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The number of distinct values in the field. If the response value is -1, refer to CountDistinctLong
        # .
        @[JSON::Field(key: "CountDistinct")]
        getter count_distinct : Int32?

        # The number of distinct values in the field. CountDistinctLong is used instead of CountDistinct if
        # the value is greater than 2,147,483,647.
        @[JSON::Field(key: "CountDistinctLong")]
        getter count_distinct_long : Int64?

        # The number of values in the field. CountLong is used instead of Count if the value is greater than
        # 2,147,483,647.
        @[JSON::Field(key: "CountLong")]
        getter count_long : Int64?

        # The number of NAN (not a number) values in the field. If the response value is -1, refer to
        # CountNanLong .
        @[JSON::Field(key: "CountNan")]
        getter count_nan : Int32?

        # The number of NAN (not a number) values in the field. CountNanLong is used instead of CountNan if
        # the value is greater than 2,147,483,647.
        @[JSON::Field(key: "CountNanLong")]
        getter count_nan_long : Int64?

        # The number of null values in the field. If the response value is -1, refer to CountNullLong .
        @[JSON::Field(key: "CountNull")]
        getter count_null : Int32?

        # The number of null values in the field. CountNullLong is used instead of CountNull if the value is
        # greater than 2,147,483,647.
        @[JSON::Field(key: "CountNullLong")]
        getter count_null_long : Int64?

        # For a numeric field, the maximum value in the field.
        @[JSON::Field(key: "Max")]
        getter max : String?

        # For a numeric field, the minimum value in the field.
        @[JSON::Field(key: "Min")]
        getter min : String?

        # For a numeric field, the standard deviation.
        @[JSON::Field(key: "Stddev")]
        getter stddev : Float64?

        def initialize(
          @avg : Float64? = nil,
          @count : Int32? = nil,
          @count_distinct : Int32? = nil,
          @count_distinct_long : Int64? = nil,
          @count_long : Int64? = nil,
          @count_nan : Int32? = nil,
          @count_nan_long : Int64? = nil,
          @count_null : Int32? = nil,
          @count_null_long : Int64? = nil,
          @max : String? = nil,
          @min : String? = nil,
          @stddev : Float64? = nil
        )
        end
      end

      struct StopResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to stop. The supported ARNs are
        # DatasetImportJobArn , PredictorArn , PredictorBacktestExportJobArn , ForecastArn ,
        # ForecastExportJobArn , ExplainabilityArn , and ExplainabilityExportArn .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # This object belongs to the CreatePredictor operation. If you created your predictor with
      # CreateAutoPredictor , see AdditionalDataset . Describes a supplementary feature of a dataset group.
      # This object is part of the InputDataConfig object. Forecast supports the Weather Index and Holidays
      # built-in featurizations. Weather Index The Amazon Forecast Weather Index is a built-in featurization
      # that incorporates historical and projected weather information into your model. The Weather Index
      # supplements your datasets with over two years of historical weather data and up to 14 days of
      # projected weather data. For more information, see Amazon Forecast Weather Index . Holidays Holidays
      # is a built-in featurization that incorporates a feature-engineered dataset of national holiday
      # information into your model. It provides native support for the holiday calendars of 66 countries.
      # To view the holiday calendars, refer to the Jollyday library. For more information, see Holidays
      # Featurization .
      struct SupplementaryFeature
        include JSON::Serializable

        # The name of the feature. Valid values: "holiday" and "weather" .
        @[JSON::Field(key: "Name")]
        getter name : String

        # Weather Index To enable the Weather Index, set the value to "true" Holidays To enable Holidays,
        # specify a country with one of the following two-letter country codes: "AL" - ALBANIA "AR" -
        # ARGENTINA "AT" - AUSTRIA "AU" - AUSTRALIA "BA" - BOSNIA HERZEGOVINA "BE" - BELGIUM "BG" - BULGARIA
        # "BO" - BOLIVIA "BR" - BRAZIL "BY" - BELARUS "CA" - CANADA "CL" - CHILE "CO" - COLOMBIA "CR" - COSTA
        # RICA "HR" - CROATIA "CZ" - CZECH REPUBLIC "DK" - DENMARK "EC" - ECUADOR "EE" - ESTONIA "ET" -
        # ETHIOPIA "FI" - FINLAND "FR" - FRANCE "DE" - GERMANY "GR" - GREECE "HU" - HUNGARY "IS" - ICELAND
        # "IN" - INDIA "IE" - IRELAND "IT" - ITALY "JP" - JAPAN "KZ" - KAZAKHSTAN "KR" - KOREA "LV" - LATVIA
        # "LI" - LIECHTENSTEIN "LT" - LITHUANIA "LU" - LUXEMBOURG "MK" - MACEDONIA "MT" - MALTA "MX" - MEXICO
        # "MD" - MOLDOVA "ME" - MONTENEGRO "NL" - NETHERLANDS "NZ" - NEW ZEALAND "NI" - NICARAGUA "NG" -
        # NIGERIA "NO" - NORWAY "PA" - PANAMA "PY" - PARAGUAY "PE" - PERU "PL" - POLAND "PT" - PORTUGAL "RO" -
        # ROMANIA "RU" - RUSSIA "RS" - SERBIA "SK" - SLOVAKIA "SI" - SLOVENIA "ZA" - SOUTH AFRICA "ES" - SPAIN
        # "SE" - SWEDEN "CH" - SWITZERLAND "UA" - UKRAINE "AE" - UNITED ARAB EMIRATES "US" - UNITED STATES
        # "UK" - UNITED KINGDOM "UY" - URUGUAY "VE" - VENEZUELA
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # The optional metadata that you apply to a resource to help you categorize and organize them. Each
      # tag consists of a key and an optional value, both of which you define. The following basic
      # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
      # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
      # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
      # is used across multiple services and resources, remember that other services may have restrictions
      # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
      # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
      # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
      # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
      # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
      # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
      # prefix of aws do not count against your tags per resource limit.
      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that makes up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The optional part of a key-value pair that makes up a tag. A value acts as a descriptor within a tag
        # category (key).
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

        # The Amazon Resource Name (ARN) that identifies the resource for which to list the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to add to the resource. A tag is an array of key-value pairs. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws: , AWS: , or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys with this prefix. Values
        # can have this prefix. If a tag value has aws as its prefix but the key does not, then Forecast
        # considers it to be a user tag and will count against the limit of 50 tags. Tags with only the key
        # prefix of aws do not count against your tags per resource limit.
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

      # The status, start time, and end time of a backtest, as well as a failure reason if applicable.
      struct TestWindowSummary
        include JSON::Serializable

        # If the test failed, the reason why it failed.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the test. Possible status values are: ACTIVE CREATE_IN_PROGRESS CREATE_FAILED
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time at which the test ended.
        @[JSON::Field(key: "TestWindowEnd", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter test_window_end : Time?

        # The time at which the test began.
        @[JSON::Field(key: "TestWindowStart", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter test_window_start : Time?

        def initialize(
          @message : String? = nil,
          @status : String? = nil,
          @test_window_end : Time? = nil,
          @test_window_start : Time? = nil
        )
        end
      end

      # The time boundary Forecast uses to align and aggregate your data to match your forecast frequency.
      # Provide the unit of time and the time boundary as a key value pair. If you don't provide a time
      # boundary, Forecast uses a set of Default Time Boundaries . For more information about aggregation,
      # see Data Aggregation for Different Forecast Frequencies . For more information setting a custom time
      # boundary, see Specifying a Time Boundary .
      struct TimeAlignmentBoundary
        include JSON::Serializable

        # The day of the month to use for time alignment during aggregation.
        @[JSON::Field(key: "DayOfMonth")]
        getter day_of_month : Int32?

        # The day of week to use for time alignment during aggregation. The day must be in uppercase.
        @[JSON::Field(key: "DayOfWeek")]
        getter day_of_week : String?

        # The hour of day to use for time alignment during aggregation.
        @[JSON::Field(key: "Hour")]
        getter hour : Int32?

        # The month to use for time alignment during aggregation. The month must be in uppercase.
        @[JSON::Field(key: "Month")]
        getter month : String?

        def initialize(
          @day_of_month : Int32? = nil,
          @day_of_week : String? = nil,
          @hour : Int32? = nil,
          @month : String? = nil
        )
        end
      end

      # Creates a subset of items within an attribute that are modified. For example, you can use this
      # operation to create a subset of items that cost $5 or less. To do this, you specify "AttributeName":
      # "price" , "AttributeValue": "5" , and "Condition": "LESS_THAN" . Pair this operation with the Action
      # operation within the CreateWhatIfForecastRequest$TimeSeriesTransformations operation to define how
      # the attribute is modified.
      struct TimeSeriesCondition
        include JSON::Serializable

        # The item_id, dimension name, IM name, or timestamp that you are modifying.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The value that is applied for the chosen Condition .
        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String

        # The condition to apply. Valid values are EQUALS , NOT_EQUALS , LESS_THAN and GREATER_THAN .
        @[JSON::Field(key: "Condition")]
        getter condition : String

        def initialize(
          @attribute_name : String,
          @attribute_value : String,
          @condition : String
        )
        end
      end

      # Details about the import file that contains the time series for which you want to create forecasts.
      struct TimeSeriesIdentifiers
        include JSON::Serializable

        @[JSON::Field(key: "DataSource")]
        getter data_source : Types::DataSource?

        # The format of the data, either CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema?

        def initialize(
          @data_source : Types::DataSource? = nil,
          @format : String? = nil,
          @schema : Types::Schema? = nil
        )
        end
      end

      # A replacement dataset is a modified version of the baseline related time series that contains only
      # the values that you want to include in a what-if forecast. The replacement dataset must contain the
      # forecast dimensions and item identifiers in the baseline related time series as well as at least 1
      # changed time series. This dataset is merged with the baseline related time series to create a
      # transformed dataset that is used for the what-if forecast.
      struct TimeSeriesReplacementsDataSource
        include JSON::Serializable

        @[JSON::Field(key: "S3Config")]
        getter s3_config : Types::S3Config

        @[JSON::Field(key: "Schema")]
        getter schema : Types::Schema

        # The format of the replacement data, CSV or PARQUET.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The timestamp format of the replacement data.
        @[JSON::Field(key: "TimestampFormat")]
        getter timestamp_format : String?

        def initialize(
          @s3_config : Types::S3Config,
          @schema : Types::Schema,
          @format : String? = nil,
          @timestamp_format : String? = nil
        )
        end
      end

      # Defines the set of time series that are used to create the forecasts in a TimeSeriesIdentifiers
      # object. The TimeSeriesIdentifiers object needs the following information: DataSource Format Schema
      struct TimeSeriesSelector
        include JSON::Serializable

        # Details about the import file that contains the time series for which you want to create forecasts.
        @[JSON::Field(key: "TimeSeriesIdentifiers")]
        getter time_series_identifiers : Types::TimeSeriesIdentifiers?

        def initialize(
          @time_series_identifiers : Types::TimeSeriesIdentifiers? = nil
        )
        end
      end

      # A transformation function is a pair of operations that select and modify the rows in a related time
      # series. You select the rows that you want with a condition operation and you modify the rows with a
      # transformation operation. All conditions are joined with an AND operation, meaning that all
      # conditions must be true for the transformation to be applied. Transformations are applied in the
      # order that they are listed.
      struct TimeSeriesTransformation
        include JSON::Serializable

        # An array of actions that define a time series and how it is transformed. These transformations
        # create a new time series that is used for the what-if analysis.
        @[JSON::Field(key: "Action")]
        getter action : Types::Action?

        # An array of conditions that define which members of the related time series are transformed.
        @[JSON::Field(key: "TimeSeriesConditions")]
        getter time_series_conditions : Array(Types::TimeSeriesCondition)?

        def initialize(
          @action : Types::Action? = nil,
          @time_series_conditions : Array(Types::TimeSeriesCondition)? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource for which to list the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the tags to be removed.
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

      struct UpdateDatasetGroupRequest
        include JSON::Serializable

        # An array of the Amazon Resource Names (ARNs) of the datasets to add to the dataset group.
        @[JSON::Field(key: "DatasetArns")]
        getter dataset_arns : Array(String)

        # The ARN of the dataset group.
        @[JSON::Field(key: "DatasetGroupArn")]
        getter dataset_group_arn : String

        def initialize(
          @dataset_arns : Array(String),
          @dataset_group_arn : String
        )
        end
      end

      struct UpdateDatasetGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The weighted loss value for a quantile. This object is part of the Metrics object.
      struct WeightedQuantileLoss
        include JSON::Serializable

        # The difference between the predicted value and the actual value over the quantile, weighted
        # (normalized) by dividing by the sum over all quantiles.
        @[JSON::Field(key: "LossValue")]
        getter loss_value : Float64?

        # The quantile. Quantiles divide a probability distribution into regions of equal probability. For
        # example, if the distribution was divided into 5 regions of equal probability, the quantiles would be
        # 0.2, 0.4, 0.6, and 0.8.
        @[JSON::Field(key: "Quantile")]
        getter quantile : Float64?

        def initialize(
          @loss_value : Float64? = nil,
          @quantile : Float64? = nil
        )
        end
      end

      # Provides a summary of the what-if analysis properties used in the ListWhatIfAnalyses operation. To
      # get the complete set of properties, call the DescribeWhatIfAnalysis operation, and provide the
      # WhatIfAnalysisArn that is listed in the summary.
      struct WhatIfAnalysisSummary
        include JSON::Serializable

        # When the what-if analysis was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the baseline forecast that is being used in this what-if analysis.
        @[JSON::Field(key: "ForecastArn")]
        getter forecast_arn : String?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the what-if analysis. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the what-if analysis must be ACTIVE before you can access the analysis.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the what-if analysis.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String?

        # The name of the what-if analysis.
        @[JSON::Field(key: "WhatIfAnalysisName")]
        getter what_if_analysis_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @forecast_arn : String? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @what_if_analysis_arn : String? = nil,
          @what_if_analysis_name : String? = nil
        )
        end
      end

      # Provides a summary of the what-if forecast export properties used in the ListWhatIfForecastExports
      # operation. To get the complete set of properties, call the DescribeWhatIfForecastExport operation,
      # and provide the WhatIfForecastExportArn that is listed in the summary.
      struct WhatIfForecastExportSummary
        include JSON::Serializable

        # When the what-if forecast export was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The path to the Amazon Simple Storage Service (Amazon S3) bucket where the forecast is exported.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::DataDestination?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the what-if forecast export. States include: ACTIVE CREATE_PENDING ,
        # CREATE_IN_PROGRESS , CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING ,
        # DELETE_IN_PROGRESS , DELETE_FAILED The Status of the what-if analysis must be ACTIVE before you can
        # access the analysis.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # An array of Amazon Resource Names (ARNs) that define the what-if forecasts included in the export.
        @[JSON::Field(key: "WhatIfForecastArns")]
        getter what_if_forecast_arns : Array(String)?

        # The Amazon Resource Name (ARN) of the what-if forecast export.
        @[JSON::Field(key: "WhatIfForecastExportArn")]
        getter what_if_forecast_export_arn : String?

        # The what-if forecast export name.
        @[JSON::Field(key: "WhatIfForecastExportName")]
        getter what_if_forecast_export_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @destination : Types::DataDestination? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @what_if_forecast_arns : Array(String)? = nil,
          @what_if_forecast_export_arn : String? = nil,
          @what_if_forecast_export_name : String? = nil
        )
        end
      end

      # Provides a summary of the what-if forecast properties used in the ListWhatIfForecasts operation. To
      # get the complete set of properties, call the DescribeWhatIfForecast operation, and provide the
      # WhatIfForecastArn that is listed in the summary.
      struct WhatIfForecastSummary
        include JSON::Serializable

        # When the what-if forecast was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The last time the resource was modified. The timestamp depends on the status of the job:
        # CREATE_PENDING - The CreationTime . CREATE_IN_PROGRESS - The current timestamp. CREATE_STOPPING -
        # The current timestamp. CREATE_STOPPED - When the job stopped. ACTIVE or CREATE_FAILED - When the job
        # finished or failed.
        @[JSON::Field(key: "LastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # If an error occurred, an informational message about the error.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the what-if forecast. States include: ACTIVE CREATE_PENDING , CREATE_IN_PROGRESS ,
        # CREATE_FAILED CREATE_STOPPING , CREATE_STOPPED DELETE_PENDING , DELETE_IN_PROGRESS , DELETE_FAILED
        # The Status of the what-if analysis must be ACTIVE before you can access the analysis.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the what-if analysis that contains this what-if forecast.
        @[JSON::Field(key: "WhatIfAnalysisArn")]
        getter what_if_analysis_arn : String?

        # The Amazon Resource Name (ARN) of the what-if forecast.
        @[JSON::Field(key: "WhatIfForecastArn")]
        getter what_if_forecast_arn : String?

        # The name of the what-if forecast.
        @[JSON::Field(key: "WhatIfForecastName")]
        getter what_if_forecast_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modification_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @what_if_analysis_arn : String? = nil,
          @what_if_forecast_arn : String? = nil,
          @what_if_forecast_name : String? = nil
        )
        end
      end

      # The metrics for a time range within the evaluation portion of a dataset. This object is part of the
      # EvaluationResult object. The TestWindowStart and TestWindowEnd parameters are determined by the
      # BackTestWindowOffset parameter of the EvaluationParameters object.
      struct WindowSummary
        include JSON::Serializable

        # The type of evaluation. SUMMARY - The average metrics across all windows. COMPUTED - The metrics for
        # the specified window.
        @[JSON::Field(key: "EvaluationType")]
        getter evaluation_type : String?

        # The number of data points within the window.
        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32?

        # Provides metrics used to evaluate the performance of a predictor.
        @[JSON::Field(key: "Metrics")]
        getter metrics : Types::Metrics?

        # The timestamp that defines the end of the window.
        @[JSON::Field(key: "TestWindowEnd", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter test_window_end : Time?

        # The timestamp that defines the start of the window.
        @[JSON::Field(key: "TestWindowStart", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter test_window_start : Time?

        def initialize(
          @evaluation_type : String? = nil,
          @item_count : Int32? = nil,
          @metrics : Types::Metrics? = nil,
          @test_window_end : Time? = nil,
          @test_window_start : Time? = nil
        )
        end
      end
    end
  end
end
