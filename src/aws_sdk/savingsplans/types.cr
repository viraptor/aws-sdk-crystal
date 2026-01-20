require "json"
require "time"

module AwsSdk
  module Savingsplans
    module Types


      struct CreateSavingsPlanRequest
        include JSON::Serializable

        # The hourly commitment, in the same currency of the savingsPlanOfferingId . This is a value between
        # 0.001 and 1 million. You cannot specify more than five digits after the decimal point.

        @[JSON::Field(key: "commitment")]
        getter commitment : String

        # The ID of the offering.

        @[JSON::Field(key: "savingsPlanOfferingId")]
        getter savings_plan_offering_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The purchase time of the Savings Plan in UTC format (YYYY-MM-DDTHH:MM:SSZ).

        @[JSON::Field(key: "purchaseTime")]
        getter purchase_time : Time?

        # One or more tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The up-front payment amount. This is a whole number between 50 and 99 percent of the total value of
        # the Savings Plan. This parameter is only supported if the payment option is Partial Upfront .

        @[JSON::Field(key: "upfrontPaymentAmount")]
        getter upfront_payment_amount : String?

        def initialize(
          @commitment : String,
          @savings_plan_offering_id : String,
          @client_token : String? = nil,
          @purchase_time : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @upfront_payment_amount : String? = nil
        )
        end
      end


      struct CreateSavingsPlanResponse
        include JSON::Serializable

        # The ID of the Savings Plan.

        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String?

        def initialize(
          @savings_plan_id : String? = nil
        )
        end
      end


      struct DeleteQueuedSavingsPlanRequest
        include JSON::Serializable

        # The ID of the Savings Plan.

        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String

        def initialize(
          @savings_plan_id : String
        )
        end
      end


      struct DeleteQueuedSavingsPlanResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeSavingsPlanRatesRequest
        include JSON::Serializable

        # The ID of the Savings Plan.

        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String

        # The filters.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SavingsPlanRateFilter)?

        # The maximum number of results to return with a single call. To retrieve additional results, make
        # another call with the returned token value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @savings_plan_id : String,
          @filters : Array(Types::SavingsPlanRateFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSavingsPlanRatesResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the Savings Plan.

        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String?

        # Information about the Savings Plan rates.

        @[JSON::Field(key: "searchResults")]
        getter search_results : Array(Types::SavingsPlanRate)?

        def initialize(
          @next_token : String? = nil,
          @savings_plan_id : String? = nil,
          @search_results : Array(Types::SavingsPlanRate)? = nil
        )
        end
      end


      struct DescribeSavingsPlansOfferingRatesRequest
        include JSON::Serializable

        # The filters.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SavingsPlanOfferingRateFilterElement)?

        # The maximum number of results to return with a single call. To retrieve additional results, make
        # another call with the returned token value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The specific Amazon Web Services operation for the line item in the billing report.

        @[JSON::Field(key: "operations")]
        getter operations : Array(String)?

        # The Amazon Web Services products.

        @[JSON::Field(key: "products")]
        getter products : Array(String)?

        # The IDs of the offerings.

        @[JSON::Field(key: "savingsPlanOfferingIds")]
        getter savings_plan_offering_ids : Array(String)?

        # The payment options.

        @[JSON::Field(key: "savingsPlanPaymentOptions")]
        getter savings_plan_payment_options : Array(String)?

        # The plan types.

        @[JSON::Field(key: "savingsPlanTypes")]
        getter savings_plan_types : Array(String)?

        # The services.

        @[JSON::Field(key: "serviceCodes")]
        getter service_codes : Array(String)?

        # The usage details of the line item in the billing report.

        @[JSON::Field(key: "usageTypes")]
        getter usage_types : Array(String)?

        def initialize(
          @filters : Array(Types::SavingsPlanOfferingRateFilterElement)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @operations : Array(String)? = nil,
          @products : Array(String)? = nil,
          @savings_plan_offering_ids : Array(String)? = nil,
          @savings_plan_payment_options : Array(String)? = nil,
          @savings_plan_types : Array(String)? = nil,
          @service_codes : Array(String)? = nil,
          @usage_types : Array(String)? = nil
        )
        end
      end


      struct DescribeSavingsPlansOfferingRatesResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information about the Savings Plans offering rates.

        @[JSON::Field(key: "searchResults")]
        getter search_results : Array(Types::SavingsPlanOfferingRate)?

        def initialize(
          @next_token : String? = nil,
          @search_results : Array(Types::SavingsPlanOfferingRate)? = nil
        )
        end
      end


      struct DescribeSavingsPlansOfferingsRequest
        include JSON::Serializable

        # The currencies.

        @[JSON::Field(key: "currencies")]
        getter currencies : Array(String)?

        # The descriptions.

        @[JSON::Field(key: "descriptions")]
        getter descriptions : Array(String)?

        # The duration, in seconds.

        @[JSON::Field(key: "durations")]
        getter durations : Array(Int64)?

        # The filters.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SavingsPlanOfferingFilterElement)?

        # The maximum number of results to return with a single call. To retrieve additional results, make
        # another call with the returned token value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The IDs of the offerings.

        @[JSON::Field(key: "offeringIds")]
        getter offering_ids : Array(String)?

        # The specific Amazon Web Services operation for the line item in the billing report.

        @[JSON::Field(key: "operations")]
        getter operations : Array(String)?

        # The payment options.

        @[JSON::Field(key: "paymentOptions")]
        getter payment_options : Array(String)?

        # The plan types.

        @[JSON::Field(key: "planTypes")]
        getter plan_types : Array(String)?

        # The product type.

        @[JSON::Field(key: "productType")]
        getter product_type : String?

        # The services.

        @[JSON::Field(key: "serviceCodes")]
        getter service_codes : Array(String)?

        # The usage details of the line item in the billing report.

        @[JSON::Field(key: "usageTypes")]
        getter usage_types : Array(String)?

        def initialize(
          @currencies : Array(String)? = nil,
          @descriptions : Array(String)? = nil,
          @durations : Array(Int64)? = nil,
          @filters : Array(Types::SavingsPlanOfferingFilterElement)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @offering_ids : Array(String)? = nil,
          @operations : Array(String)? = nil,
          @payment_options : Array(String)? = nil,
          @plan_types : Array(String)? = nil,
          @product_type : String? = nil,
          @service_codes : Array(String)? = nil,
          @usage_types : Array(String)? = nil
        )
        end
      end


      struct DescribeSavingsPlansOfferingsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information about the Savings Plans offerings.

        @[JSON::Field(key: "searchResults")]
        getter search_results : Array(Types::SavingsPlanOffering)?

        def initialize(
          @next_token : String? = nil,
          @search_results : Array(Types::SavingsPlanOffering)? = nil
        )
        end
      end


      struct DescribeSavingsPlansRequest
        include JSON::Serializable

        # The filters.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SavingsPlanFilter)?

        # The maximum number of results to return with a single call. To retrieve additional results, make
        # another call with the returned token value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Names (ARN) of the Savings Plans.

        @[JSON::Field(key: "savingsPlanArns")]
        getter savings_plan_arns : Array(String)?

        # The IDs of the Savings Plans.

        @[JSON::Field(key: "savingsPlanIds")]
        getter savings_plan_ids : Array(String)?

        # The current states of the Savings Plans.

        @[JSON::Field(key: "states")]
        getter states : Array(String)?

        def initialize(
          @filters : Array(Types::SavingsPlanFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @savings_plan_arns : Array(String)? = nil,
          @savings_plan_ids : Array(String)? = nil,
          @states : Array(String)? = nil
        )
        end
      end


      struct DescribeSavingsPlansResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information about the Savings Plans.

        @[JSON::Field(key: "savingsPlans")]
        getter savings_plans : Array(Types::SavingsPlan)?

        def initialize(
          @next_token : String? = nil,
          @savings_plans : Array(Types::SavingsPlan)? = nil
        )
        end
      end

      # An unexpected error occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
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

        # Information about the tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about a Savings Plan offering.

      struct ParentSavingsPlanOffering
        include JSON::Serializable

        # The currency.

        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The duration, in seconds.

        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int64?

        # The ID of the offering.

        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?

        # The payment option.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The description.

        @[JSON::Field(key: "planDescription")]
        getter plan_description : String?

        # The plan type.

        @[JSON::Field(key: "planType")]
        getter plan_type : String?

        def initialize(
          @currency : String? = nil,
          @duration_seconds : Int64? = nil,
          @offering_id : String? = nil,
          @payment_option : String? = nil,
          @plan_description : String? = nil,
          @plan_type : String? = nil
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ReturnSavingsPlanRequest
        include JSON::Serializable

        # The ID of the Savings Plan.

        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @savings_plan_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct ReturnSavingsPlanResponse
        include JSON::Serializable

        # The ID of the Savings Plan.

        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String?

        def initialize(
          @savings_plan_id : String? = nil
        )
        end
      end

      # Information about a Savings Plan.

      struct SavingsPlan
        include JSON::Serializable

        # The hourly commitment amount in the specified currency.

        @[JSON::Field(key: "commitment")]
        getter commitment : String?

        # The currency.

        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The EC2 instance family.

        @[JSON::Field(key: "ec2InstanceFamily")]
        getter ec2_instance_family : String?

        # The end time.

        @[JSON::Field(key: "end")]
        getter end : String?

        # The ID of the offering.

        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?

        # The payment option.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The product types.

        @[JSON::Field(key: "productTypes")]
        getter product_types : Array(String)?

        # The recurring payment amount.

        @[JSON::Field(key: "recurringPaymentAmount")]
        getter recurring_payment_amount : String?

        # The Amazon Web Services Region.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The time until when a return for the Savings Plan can be requested. If the Savings Plan is not
        # returnable, the field reflects the Savings Plans start time.

        @[JSON::Field(key: "returnableUntil")]
        getter returnable_until : String?

        # The Amazon Resource Name (ARN) of the Savings Plan.

        @[JSON::Field(key: "savingsPlanArn")]
        getter savings_plan_arn : String?

        # The ID of the Savings Plan.

        @[JSON::Field(key: "savingsPlanId")]
        getter savings_plan_id : String?

        # The plan type.

        @[JSON::Field(key: "savingsPlanType")]
        getter savings_plan_type : String?

        # The start time.

        @[JSON::Field(key: "start")]
        getter start : String?

        # The current state.

        @[JSON::Field(key: "state")]
        getter state : String?

        # One or more tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The duration of the term, in seconds.

        @[JSON::Field(key: "termDurationInSeconds")]
        getter term_duration_in_seconds : Int64?

        # The up-front payment amount.

        @[JSON::Field(key: "upfrontPaymentAmount")]
        getter upfront_payment_amount : String?

        def initialize(
          @commitment : String? = nil,
          @currency : String? = nil,
          @description : String? = nil,
          @ec2_instance_family : String? = nil,
          @end : String? = nil,
          @offering_id : String? = nil,
          @payment_option : String? = nil,
          @product_types : Array(String)? = nil,
          @recurring_payment_amount : String? = nil,
          @region : String? = nil,
          @returnable_until : String? = nil,
          @savings_plan_arn : String? = nil,
          @savings_plan_id : String? = nil,
          @savings_plan_type : String? = nil,
          @start : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @term_duration_in_seconds : Int64? = nil,
          @upfront_payment_amount : String? = nil
        )
        end
      end

      # Information about a Savings Plan filter.

      struct SavingsPlanFilter
        include JSON::Serializable

        # The filter name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter value.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about a Savings Plan offering.

      struct SavingsPlanOffering
        include JSON::Serializable

        # The currency.

        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The duration, in seconds.

        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int64?

        # The ID of the offering.

        @[JSON::Field(key: "offeringId")]
        getter offering_id : String?

        # The specific Amazon Web Services operation for the line item in the billing report.

        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The payment option.

        @[JSON::Field(key: "paymentOption")]
        getter payment_option : String?

        # The plan type.

        @[JSON::Field(key: "planType")]
        getter plan_type : String?

        # The product type.

        @[JSON::Field(key: "productTypes")]
        getter product_types : Array(String)?

        # The properties.

        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::SavingsPlanOfferingProperty)?

        # The service.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        # The usage details of the line item in the billing report.

        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @currency : String? = nil,
          @description : String? = nil,
          @duration_seconds : Int64? = nil,
          @offering_id : String? = nil,
          @operation : String? = nil,
          @payment_option : String? = nil,
          @plan_type : String? = nil,
          @product_types : Array(String)? = nil,
          @properties : Array(Types::SavingsPlanOfferingProperty)? = nil,
          @service_code : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # Information about a Savings Plan offering filter.

      struct SavingsPlanOfferingFilterElement
        include JSON::Serializable

        # The filter name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter values.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about a Savings Plan offering property.

      struct SavingsPlanOfferingProperty
        include JSON::Serializable

        # The property name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The property value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about a Savings Plan offering rate.

      struct SavingsPlanOfferingRate
        include JSON::Serializable

        # The specific Amazon Web Services operation for the line item in the billing report.

        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The product type.

        @[JSON::Field(key: "productType")]
        getter product_type : String?

        # The properties.

        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::SavingsPlanOfferingRateProperty)?

        # The Savings Plan rate.

        @[JSON::Field(key: "rate")]
        getter rate : String?

        # The Savings Plan offering.

        @[JSON::Field(key: "savingsPlanOffering")]
        getter savings_plan_offering : Types::ParentSavingsPlanOffering?

        # The service.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        # The unit.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # The usage details of the line item in the billing report.

        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @operation : String? = nil,
          @product_type : String? = nil,
          @properties : Array(Types::SavingsPlanOfferingRateProperty)? = nil,
          @rate : String? = nil,
          @savings_plan_offering : Types::ParentSavingsPlanOffering? = nil,
          @service_code : String? = nil,
          @unit : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # Information about a Savings Plan offering rate filter.

      struct SavingsPlanOfferingRateFilterElement
        include JSON::Serializable

        # The filter name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter values.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about a Savings Plan offering rate property.

      struct SavingsPlanOfferingRateProperty
        include JSON::Serializable

        # The property name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The property value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about a Savings Plan rate.

      struct SavingsPlanRate
        include JSON::Serializable

        # The currency.

        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The specific Amazon Web Services operation for the line item in the billing report.

        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The product type.

        @[JSON::Field(key: "productType")]
        getter product_type : String?

        # The properties.

        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::SavingsPlanRateProperty)?

        # The rate.

        @[JSON::Field(key: "rate")]
        getter rate : String?

        # The service.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        # The unit.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # The usage details of the line item in the billing report.

        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @currency : String? = nil,
          @operation : String? = nil,
          @product_type : String? = nil,
          @properties : Array(Types::SavingsPlanRateProperty)? = nil,
          @rate : String? = nil,
          @service_code : String? = nil,
          @unit : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # Information about a Savings Plan rate filter.

      struct SavingsPlanRateFilter
        include JSON::Serializable

        # The filter name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter values.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about a Savings Plan rate property.

      struct SavingsPlanRateProperty
        include JSON::Serializable

        # The property name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The property value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # A service quota has been exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # One or more tags. For example, { "tags": {"key1":"value1", "key2":"value2"} }.

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


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys.

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

      # One of the input parameters is not valid.

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
