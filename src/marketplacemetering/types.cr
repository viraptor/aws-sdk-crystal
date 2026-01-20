require "json"
require "time"

module Aws
  module MarketplaceMetering
    module Types

      # A BatchMeterUsageRequest contains UsageRecords , which indicate quantities of usage within your
      # application.

      struct BatchMeterUsageRequest
        include JSON::Serializable

        # Product code is used to uniquely identify a product in Amazon Web Services Marketplace. The product
        # code should be the same as the one used during the publishing of a new product.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String

        # The set of UsageRecords to submit. BatchMeterUsage accepts up to 25 UsageRecords at a time.

        @[JSON::Field(key: "UsageRecords")]
        getter usage_records : Array(Types::UsageRecord)

        def initialize(
          @product_code : String,
          @usage_records : Array(Types::UsageRecord)
        )
        end
      end

      # Contains the UsageRecords processed by BatchMeterUsage and any records that have failed due to
      # transient error.

      struct BatchMeterUsageResult
        include JSON::Serializable

        # Contains all UsageRecords processed by BatchMeterUsage . These records were either honored by Amazon
        # Web Services Marketplace Metering Service or were invalid. Invalid records should be fixed before
        # being resubmitted.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::UsageRecordResult)?

        # Contains all UsageRecords that were not processed by BatchMeterUsage . This is a list of
        # UsageRecords . You can retry the failed request by making another BatchMeterUsage call with this
        # list as input in the BatchMeterUsageRequest .

        @[JSON::Field(key: "UnprocessedRecords")]
        getter unprocessed_records : Array(Types::UsageRecord)?

        def initialize(
          @results : Array(Types::UsageRecordResult)? = nil,
          @unprocessed_records : Array(Types::UsageRecord)? = nil
        )
        end
      end

      # Exception thrown when the customer does not have a valid subscription for the product.

      struct CustomerNotEntitledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The API is disabled in the Region.

      struct DisabledApiException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A metering record has already been emitted by the same EC2 instance, ECS task, or EKS pod for the
      # given { usageDimension , timestamp } with a different usageQuantity .

      struct DuplicateRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The submitted registration token has expired. This can happen if the buyer's browser takes too long
      # to redirect to your page, the buyer has resubmitted the registration token, or your application has
      # held on to the registration token for too long. Your SaaS registration website should redeem this
      # token as soon as it is submitted by the buyer's browser.

      struct ExpiredTokenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The ClientToken is being used for multiple requests.

      struct IdempotencyConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An internal error has occurred. Retry your request. If the problem persists, post a message with
      # details on the Amazon Web Services forums.

      struct InternalServiceErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have metered usage for a CustomerIdentifier that does not exist.

      struct InvalidCustomerIdentifierException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The endpoint being called is in a Amazon Web Services Region different from your EC2 instance, ECS
      # task, or EKS pod. The Region of the Metering Service endpoint and the Amazon Web Services Region of
      # the resource must match.

      struct InvalidEndpointRegionException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The product code passed does not match the product code used for publishing the product.

      struct InvalidProductCodeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Public Key version is invalid.

      struct InvalidPublicKeyVersionException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # RegisterUsage must be called in the same Amazon Web Services Region the ECS task was launched in.
      # This prevents a container from hardcoding a Region (e.g. withRegion(“us-east-1”) when calling
      # RegisterUsage .

      struct InvalidRegionException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The tag is invalid, or the number of tags is greater than 5.

      struct InvalidTagException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Registration token is invalid.

      struct InvalidTokenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Sum of allocated usage quantities is not equal to the usage quantity.

      struct InvalidUsageAllocationsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The usage dimension does not match one of the UsageDimensions associated with products.

      struct InvalidUsageDimensionException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct MeterUsageRequest
        include JSON::Serializable

        # Product code is used to uniquely identify a product in Amazon Web Services Marketplace. The product
        # code should be the same as the one used during the publishing of a new product.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String

        # Timestamp, in UTC, for which the usage is being reported. Your application can meter usage for up to
        # six hours in the past. Make sure the timestamp value is not before the start of the software usage.

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time

        # It will be one of the fcp dimension name provided during the publishing of the product.

        @[JSON::Field(key: "UsageDimension")]
        getter usage_dimension : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotencyConflictException error.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Checks whether you have the permissions required for the action, but does not make the request. If
        # you have the permissions, the request returns DryRunOperation ; otherwise, it returns
        # UnauthorizedException . Defaults to false if not specified.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # The set of UsageAllocations to submit. The sum of all UsageAllocation quantities must equal the
        # UsageQuantity of the MeterUsage request, and each UsageAllocation must have a unique set of tags
        # (include no tags).

        @[JSON::Field(key: "UsageAllocations")]
        getter usage_allocations : Array(Types::UsageAllocation)?

        # Consumption value for the hour. Defaults to 0 if not specified.

        @[JSON::Field(key: "UsageQuantity")]
        getter usage_quantity : Int32?

        def initialize(
          @product_code : String,
          @timestamp : Time,
          @usage_dimension : String,
          @client_token : String? = nil,
          @dry_run : Bool? = nil,
          @usage_allocations : Array(Types::UsageAllocation)? = nil,
          @usage_quantity : Int32? = nil
        )
        end
      end


      struct MeterUsageResult
        include JSON::Serializable

        # Metering record id.

        @[JSON::Field(key: "MeteringRecordId")]
        getter metering_record_id : String?

        def initialize(
          @metering_record_id : String? = nil
        )
        end
      end

      # Amazon Web Services Marketplace does not support metering usage from the underlying platform.
      # Currently, Amazon ECS, Amazon EKS, and Fargate are supported.

      struct PlatformNotSupportedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RegisterUsageRequest
        include JSON::Serializable

        # Product code is used to uniquely identify a product in Amazon Web Services Marketplace. The product
        # code should be the same as the one used during the publishing of a new product.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String

        # Public Key Version provided by Amazon Web Services Marketplace

        @[JSON::Field(key: "PublicKeyVersion")]
        getter public_key_version : Int32

        # (Optional) To scope down the registration to a specific running software instance and guard against
        # replay attacks.

        @[JSON::Field(key: "Nonce")]
        getter nonce : String?

        def initialize(
          @product_code : String,
          @public_key_version : Int32,
          @nonce : String? = nil
        )
        end
      end


      struct RegisterUsageResult
        include JSON::Serializable

        # (Optional) Only included when public key version has expired

        @[JSON::Field(key: "PublicKeyRotationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter public_key_rotation_timestamp : Time?

        # JWT Token

        @[JSON::Field(key: "Signature")]
        getter signature : String?

        def initialize(
          @public_key_rotation_timestamp : Time? = nil,
          @signature : String? = nil
        )
        end
      end

      # Contains input to the ResolveCustomer operation.

      struct ResolveCustomerRequest
        include JSON::Serializable

        # When a buyer visits your website during the registration process, the buyer submits a registration
        # token through the browser. The registration token is resolved to obtain a CustomerIdentifier along
        # with the CustomerAWSAccountId and ProductCode .

        @[JSON::Field(key: "RegistrationToken")]
        getter registration_token : String

        def initialize(
          @registration_token : String
        )
        end
      end

      # The result of the ResolveCustomer operation. Contains the CustomerIdentifier along with the
      # CustomerAWSAccountId and ProductCode .

      struct ResolveCustomerResult
        include JSON::Serializable

        # The CustomerAWSAccountId provides the Amazon Web Services account ID associated with the
        # CustomerIdentifier for the individual customer.

        @[JSON::Field(key: "CustomerAWSAccountId")]
        getter customer_aws_account_id : String?

        # The CustomerIdentifier is used to identify an individual customer in your application. Calls to
        # BatchMeterUsage require CustomerIdentifiers for each UsageRecord .

        @[JSON::Field(key: "CustomerIdentifier")]
        getter customer_identifier : String?

        # The product code is returned to confirm that the buyer is registering for your product. Subsequent
        # BatchMeterUsage calls should be made using this product code.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String?

        def initialize(
          @customer_aws_account_id : String? = nil,
          @customer_identifier : String? = nil,
          @product_code : String? = nil
        )
        end
      end

      # Metadata assigned to an allocation. Each tag is made up of a key and a value .

      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that makes up a tag . A key is a label that acts like a category for
        # the specific tag values.

        @[JSON::Field(key: "Key")]
        getter key : String

        # One part of a key-value pair that makes up a tag . A value acts as a descriptor within a tag
        # category (key). The value can be empty or null.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The calls to the API are throttled.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The timestamp value passed in the UsageRecord is out of allowed range. For BatchMeterUsage , if any
      # of the records are outside of the allowed range, the entire batch is not processed. You must remove
      # invalid records and try again.

      struct TimestampOutOfBoundsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Usage allocations allow you to split usage into buckets by tags. Each UsageAllocation indicates the
      # usage quantity for a specific set of tags.

      struct UsageAllocation
        include JSON::Serializable

        # The total quantity allocated to this bucket of usage.

        @[JSON::Field(key: "AllocatedUsageQuantity")]
        getter allocated_usage_quantity : Int32

        # The set of tags that define the bucket of usage. For the bucket of items with no tags, this
        # parameter can be left out.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @allocated_usage_quantity : Int32,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A UsageRecord indicates a quantity of usage for a given product, customer, dimension and time.
      # Multiple requests with the same UsageRecords as input will be de-duplicated to prevent double
      # charges.

      struct UsageRecord
        include JSON::Serializable

        # During the process of registering a product on Amazon Web Services Marketplace, dimensions are
        # specified. These represent different units of value in your application.

        @[JSON::Field(key: "Dimension")]
        getter dimension : String

        # Timestamp, in UTC, for which the usage is being reported. Your application can meter usage for up to
        # six hours in the past. Make sure the timestamp value is not before the start of the software usage.

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time

        # The CustomerAWSAccountID parameter specifies the AWS account ID of the buyer.

        @[JSON::Field(key: "CustomerAWSAccountId")]
        getter customer_aws_account_id : String?

        # The CustomerIdentifier is obtained through the ResolveCustomer operation and represents an
        # individual buyer in your application.

        @[JSON::Field(key: "CustomerIdentifier")]
        getter customer_identifier : String?

        # The quantity of usage consumed by the customer for the given dimension and time. Defaults to 0 if
        # not specified.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32?

        # The set of UsageAllocations to submit. The sum of all UsageAllocation quantities must equal the
        # Quantity of the UsageRecord .

        @[JSON::Field(key: "UsageAllocations")]
        getter usage_allocations : Array(Types::UsageAllocation)?

        def initialize(
          @dimension : String,
          @timestamp : Time,
          @customer_aws_account_id : String? = nil,
          @customer_identifier : String? = nil,
          @quantity : Int32? = nil,
          @usage_allocations : Array(Types::UsageAllocation)? = nil
        )
        end
      end

      # A UsageRecordResult indicates the status of a given UsageRecord processed by BatchMeterUsage .

      struct UsageRecordResult
        include JSON::Serializable

        # The MeteringRecordId is a unique identifier for this metering event.

        @[JSON::Field(key: "MeteringRecordId")]
        getter metering_record_id : String?

        # The UsageRecordResult Status indicates the status of an individual UsageRecord processed by
        # BatchMeterUsage . Success - The UsageRecord was accepted and honored by BatchMeterUsage .
        # CustomerNotSubscribed - The CustomerIdentifier specified is not able to use your product. The
        # UsageRecord was not honored. There are three causes for this result: The customer identifier is
        # invalid. The customer identifier provided in the metering record does not have an active agreement
        # or subscription with this product. Future UsageRecords for this customer will fail until the
        # customer subscribes to your product. The customer's Amazon Web Services account was suspended.
        # DuplicateRecord - Indicates that the UsageRecord was invalid and not honored. A previously metered
        # UsageRecord had the same customer, dimension, and time, but a different quantity.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The UsageRecord that was part of the BatchMeterUsage request.

        @[JSON::Field(key: "UsageRecord")]
        getter usage_record : Types::UsageRecord?

        def initialize(
          @metering_record_id : String? = nil,
          @status : String? = nil,
          @usage_record : Types::UsageRecord? = nil
        )
        end
      end
    end
  end
end
