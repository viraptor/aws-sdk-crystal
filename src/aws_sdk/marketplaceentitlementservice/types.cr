require "json"
require "time"

module AwsSdk
  module MarketplaceEntitlementService
    module Types

      # An entitlement represents capacity in a product owned by the customer. For example, a customer might
      # own some number of users or seats in an SaaS application or some amount of data capacity in a
      # multi-tenant database.

      struct Entitlement
        include JSON::Serializable

        # The CustomerAWSAccountID parameter specifies the AWS account ID of the buyer.

        @[JSON::Field(key: "CustomerAWSAccountId")]
        getter customer_aws_account_id : String?

        # The customer identifier is a handle to each unique customer in an application. Customer identifiers
        # are obtained through the ResolveCustomer operation in AWS Marketplace Metering Service.

        @[JSON::Field(key: "CustomerIdentifier")]
        getter customer_identifier : String?

        # The dimension for which the given entitlement applies. Dimensions represent categories of capacity
        # in a product and are specified when the product is listed in AWS Marketplace.

        @[JSON::Field(key: "Dimension")]
        getter dimension : String?

        # The expiration date represents the minimum date through which this entitlement is expected to remain
        # valid. For contractual products listed on AWS Marketplace, the expiration date is the date at which
        # the customer will renew or cancel their contract. Customers who are opting to renew their contract
        # will still have entitlements with an expiration date.

        @[JSON::Field(key: "ExpirationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # The product code for which the given entitlement applies. Product codes are provided by AWS
        # Marketplace when the product listing is created.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String?

        # The EntitlementValue represents the amount of capacity that the customer is entitled to for the
        # product.

        @[JSON::Field(key: "Value")]
        getter value : Types::EntitlementValue?

        def initialize(
          @customer_aws_account_id : String? = nil,
          @customer_identifier : String? = nil,
          @dimension : String? = nil,
          @expiration_date : Time? = nil,
          @product_code : String? = nil,
          @value : Types::EntitlementValue? = nil
        )
        end
      end

      # The EntitlementValue represents the amount of capacity that the customer is entitled to for the
      # product.

      struct EntitlementValue
        include JSON::Serializable

        # The BooleanValue field will be populated with a boolean value when the entitlement is a boolean
        # type. Otherwise, the field will not be set.

        @[JSON::Field(key: "BooleanValue")]
        getter boolean_value : Bool?

        # The DoubleValue field will be populated with a double value when the entitlement is a double type.
        # Otherwise, the field will not be set.

        @[JSON::Field(key: "DoubleValue")]
        getter double_value : Float64?

        # The IntegerValue field will be populated with an integer value when the entitlement is an integer
        # type. Otherwise, the field will not be set.

        @[JSON::Field(key: "IntegerValue")]
        getter integer_value : Int32?

        # The StringValue field will be populated with a string value when the entitlement is a string type.
        # Otherwise, the field will not be set.

        @[JSON::Field(key: "StringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @integer_value : Int32? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The GetEntitlementsRequest contains parameters for the GetEntitlements operation.

      struct GetEntitlementsRequest
        include JSON::Serializable

        # Product code is used to uniquely identify a product in AWS Marketplace. The product code will be
        # provided by AWS Marketplace when the product listing is created.

        @[JSON::Field(key: "ProductCode")]
        getter product_code : String

        # Filter is used to return entitlements for a specific customer or for a specific dimension. Filters
        # are described as keys mapped to a lists of values. Filtered requests are unioned for each value in
        # the value list, and then intersected for each filter key. CustomerIdentifier and
        # CustomerAWSAccountID are mutually exclusive. You can't specify both in the same request.

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, Array(String))?

        # The maximum number of items to retrieve from the GetEntitlements operation. For pagination, use the
        # NextToken field in subsequent calls to GetEntitlements.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For paginated calls to GetEntitlements, pass the NextToken from the previous GetEntitlementsResult.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @product_code : String,
          @filter : Hash(String, Array(String))? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The GetEntitlementsRequest contains results from the GetEntitlements operation.

      struct GetEntitlementsResult
        include JSON::Serializable

        # The set of entitlements found through the GetEntitlements operation. If the result contains an empty
        # set of entitlements, NextToken might still be present and should be used.

        @[JSON::Field(key: "Entitlements")]
        getter entitlements : Array(Types::Entitlement)?

        # For paginated results, use NextToken in subsequent calls to GetEntitlements. If the result contains
        # an empty set of entitlements, NextToken might still be present and should be used.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entitlements : Array(Types::Entitlement)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # An internal error has occurred. Retry your request. If the problem persists, post a message with
      # details on the AWS forums.

      struct InternalServiceErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters in your request was invalid.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The calls to the GetEntitlements API are throttled.

      struct ThrottlingException
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
