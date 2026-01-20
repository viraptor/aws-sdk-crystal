require "json"
require "time"

module AwsSdk
  module Pricing
    module Types

      # General authentication failure. The request wasn't signed correctly.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The values of a given attribute, such as Throughput Optimized HDD or Provisioned IOPS for the Amazon
      # EC2 volumeType attribute.

      struct AttributeValue
        include JSON::Serializable

        # The specific value of an attributeName .

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @value : String? = nil
        )
        end
      end


      struct DescribeServicesRequest
        include JSON::Serializable

        # The format version that you want the response to be in. Valid values are: aws_v1

        @[JSON::Field(key: "FormatVersion")]
        getter format_version : String?

        # The maximum number of results that you want returned in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The code for the service whose information you want to retrieve, such as AmazonEC2 . You can use the
        # ServiceCode to filter the results in a GetProducts call. To retrieve a list of all services, leave
        # this blank.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @format_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct DescribeServicesResponse
        include JSON::Serializable

        # The format version of the response. For example, aws_v1 .

        @[JSON::Field(key: "FormatVersion")]
        getter format_version : String?

        # The pagination token for the next set of retrievable results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The service metadata for the service or services in the response.

        @[JSON::Field(key: "Services")]
        getter services : Array(Types::Service)?

        def initialize(
          @format_version : String? = nil,
          @next_token : String? = nil,
          @services : Array(Types::Service)? = nil
        )
        end
      end

      # The pagination token expired. Try again without a pagination token.

      struct ExpiredNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The constraints that you want all returned products to match.

      struct Filter
        include JSON::Serializable

        # The product metadata field that you want to filter on. You can filter by just the service code to
        # see all products for a specific service, filter by just the attribute name to see a specific
        # attribute for multiple services, or use both a service code and an attribute name to retrieve only
        # products that match both fields. Valid values include: ServiceCode , and all attribute names For
        # example, you can filter by the AmazonEC2 service code and the volumeType attribute name to get the
        # prices for only Amazon EC2 volumes.

        @[JSON::Field(key: "Field")]
        getter field : String

        # The type of filter that you want to use. Valid values are: TERM_MATCH : Returns only products that
        # match both the given filter field and the given value. EQUALS : Returns products that have a field
        # value exactly matching the provided value. CONTAINS : Returns products where the field value
        # contains the provided value as a substring. ANY_OF : Returns products where the field value is any
        # of the provided values. NONE_OF : Returns products where the field value is not any of the provided
        # values.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The service code or attribute value that you want to filter by. If you're filtering by service code
        # this is the actual service code, such as AmazonEC2 . If you're filtering by attribute name, this is
        # the attribute value that you want the returned products to match, such as a Provisioned IOPS volume.
        # For ANY_OF and NONE_OF filter types, you can provide multiple values as a comma-separated string.
        # For example, t2.micro,t2.small,t2.medium or Compute optimized, GPU instance, Micro instances .

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @field : String,
          @type : String,
          @value : String
        )
        end
      end


      struct GetAttributeValuesRequest
        include JSON::Serializable

        # The name of the attribute that you want to retrieve the values for, such as volumeType .

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The service code for the service whose attributes you want to retrieve. For example, if you want the
        # retrieve an EC2 attribute, use AmazonEC2 .

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The maximum number of results to return in response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attribute_name : String,
          @service_code : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetAttributeValuesResponse
        include JSON::Serializable

        # The list of values for an attribute. For example, Throughput Optimized HDD and Provisioned IOPS are
        # two available values for the AmazonEC2 volumeType .

        @[JSON::Field(key: "AttributeValues")]
        getter attribute_values : Array(Types::AttributeValue)?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attribute_values : Array(Types::AttributeValue)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetPriceListFileUrlRequest
        include JSON::Serializable

        # The format that you want to retrieve your Price List files in. The FileFormat can be obtained from
        # the ListPriceLists response.

        @[JSON::Field(key: "FileFormat")]
        getter file_format : String

        # The unique identifier that maps to where your Price List files are located. PriceListArn can be
        # obtained from the ListPriceLists response.

        @[JSON::Field(key: "PriceListArn")]
        getter price_list_arn : String

        def initialize(
          @file_format : String,
          @price_list_arn : String
        )
        end
      end


      struct GetPriceListFileUrlResponse
        include JSON::Serializable

        # The URL to download your Price List file from.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end


      struct GetProductsRequest
        include JSON::Serializable

        # The code for the service whose products you want to retrieve.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The list of filters that limit the returned products. only products that match all filters are
        # returned.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The format version that you want the response to be in. Valid values are: aws_v1

        @[JSON::Field(key: "FormatVersion")]
        getter format_version : String?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_code : String,
          @filters : Array(Types::Filter)? = nil,
          @format_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetProductsResponse
        include JSON::Serializable

        # The format version of the response. For example, aws_v1.

        @[JSON::Field(key: "FormatVersion")]
        getter format_version : String?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of products that match your filters. The list contains both the product metadata and the
        # price information.

        @[JSON::Field(key: "PriceList")]
        getter price_list : Array(String)?

        def initialize(
          @format_version : String? = nil,
          @next_token : String? = nil,
          @price_list : Array(String)? = nil
        )
        end
      end

      # An error on the server occurred during the processing of your request. Try again later.

      struct InternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The pagination token is invalid. Try again without a pagination token.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters had an invalid value.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListPriceListsRequest
        include JSON::Serializable

        # The three alphabetical character ISO-4217 currency code that the Price List files are denominated
        # in.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String

        # The date that the Price List file prices are effective from.

        @[JSON::Field(key: "EffectiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter effective_date : Time

        # The service code or the Savings Plan service code for the attributes that you want to retrieve. For
        # example, to get the list of applicable Amazon EC2 price lists, use AmazonEC2 . For a full list of
        # service codes containing On-Demand and Reserved Instance (RI) pricing, use the DescribeServices API.
        # To retrieve the Reserved Instance and Compute Savings Plan price lists, use ComputeSavingsPlans . To
        # retrieve Machine Learning Savings Plans price lists, use MachineLearningSavingsPlans .

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # This is used to filter the Price List by Amazon Web Services Region. For example, to get the price
        # list only for the US East (N. Virginia) Region, use us-east-1 . If nothing is specified, you
        # retrieve price lists for all applicable Regions. The available RegionCode list can be retrieved from
        # GetAttributeValues API.

        @[JSON::Field(key: "RegionCode")]
        getter region_code : String?

        def initialize(
          @currency_code : String,
          @effective_date : Time,
          @service_code : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @region_code : String? = nil
        )
        end
      end


      struct ListPriceListsResponse
        include JSON::Serializable

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of price list references that match your request.

        @[JSON::Field(key: "PriceLists")]
        getter price_lists : Array(Types::PriceList)?

        def initialize(
          @next_token : String? = nil,
          @price_lists : Array(Types::PriceList)? = nil
        )
        end
      end

      # The requested resource can't be found.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This feature is in preview release and is subject to change. Your use of Amazon Web Services Price
      # List API is subject to the Beta Service Participation terms of the Amazon Web Services Service Terms
      # (Section 1.10). This is the type of price list references that match your request.

      struct PriceList
        include JSON::Serializable

        # The three alphabetical character ISO-4217 currency code the Price List files are denominated in.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The format you want to retrieve your Price List files. The FileFormat can be obtained from the
        # ListPriceList response.

        @[JSON::Field(key: "FileFormats")]
        getter file_formats : Array(String)?

        # The unique identifier that maps to where your Price List files are located. PriceListArn can be
        # obtained from the ListPriceList response.

        @[JSON::Field(key: "PriceListArn")]
        getter price_list_arn : String?

        # This is used to filter the Price List by Amazon Web Services Region. For example, to get the price
        # list only for the US East (N. Virginia) Region, use us-east-1 . If nothing is specified, you
        # retrieve price lists for all applicable Regions. The available RegionCode list can be retrieved from
        # GetAttributeValues API.

        @[JSON::Field(key: "RegionCode")]
        getter region_code : String?

        def initialize(
          @currency_code : String? = nil,
          @file_formats : Array(String)? = nil,
          @price_list_arn : String? = nil,
          @region_code : String? = nil
        )
        end
      end

      # The requested resource can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The metadata for a service, such as the service code and available attribute names.

      struct Service
        include JSON::Serializable

        # The code for the Amazon Web Services service.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The attributes that are available for this service.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)?

        def initialize(
          @service_code : String,
          @attribute_names : Array(String)? = nil
        )
        end
      end

      # You've made too many requests exceeding service quotas.

      struct ThrottlingException
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
