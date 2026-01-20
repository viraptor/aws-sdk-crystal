module AwsSdk
  module MarketplaceMetering
    module Errors
      class ServiceError < Exception
      end

      # Exception thrown when the customer does not have a valid subscription for the product.

      class CustomerNotEntitledException < ServiceError
      end

      # The API is disabled in the Region.

      class DisabledApiException < ServiceError
      end

      # A metering record has already been emitted by the same EC2 instance, ECS task, or EKS pod for the
      # given { usageDimension , timestamp } with a different usageQuantity .

      class DuplicateRequestException < ServiceError
      end

      # The submitted registration token has expired. This can happen if the buyer's browser takes too long
      # to redirect to your page, the buyer has resubmitted the registration token, or your application has
      # held on to the registration token for too long. Your SaaS registration website should redeem this
      # token as soon as it is submitted by the buyer's browser.

      class ExpiredTokenException < ServiceError
      end

      # The ClientToken is being used for multiple requests.

      class IdempotencyConflictException < ServiceError
      end

      # An internal error has occurred. Retry your request. If the problem persists, post a message with
      # details on the Amazon Web Services forums.

      class InternalServiceErrorException < ServiceError
      end

      # You have metered usage for a CustomerIdentifier that does not exist.

      class InvalidCustomerIdentifierException < ServiceError
      end

      # The endpoint being called is in a Amazon Web Services Region different from your EC2 instance, ECS
      # task, or EKS pod. The Region of the Metering Service endpoint and the Amazon Web Services Region of
      # the resource must match.

      class InvalidEndpointRegionException < ServiceError
      end

      # The product code passed does not match the product code used for publishing the product.

      class InvalidProductCodeException < ServiceError
      end

      # Public Key version is invalid.

      class InvalidPublicKeyVersionException < ServiceError
      end

      # RegisterUsage must be called in the same Amazon Web Services Region the ECS task was launched in.
      # This prevents a container from hardcoding a Region (e.g. withRegion(“us-east-1”) when calling
      # RegisterUsage .

      class InvalidRegionException < ServiceError
      end

      # The tag is invalid, or the number of tags is greater than 5.

      class InvalidTagException < ServiceError
      end

      # Registration token is invalid.

      class InvalidTokenException < ServiceError
      end

      # Sum of allocated usage quantities is not equal to the usage quantity.

      class InvalidUsageAllocationsException < ServiceError
      end

      # The usage dimension does not match one of the UsageDimensions associated with products.

      class InvalidUsageDimensionException < ServiceError
      end

      # Amazon Web Services Marketplace does not support metering usage from the underlying platform.
      # Currently, Amazon ECS, Amazon EKS, and Fargate are supported.

      class PlatformNotSupportedException < ServiceError
      end

      # The calls to the API are throttled.

      class ThrottlingException < ServiceError
      end

      # The timestamp value passed in the UsageRecord is out of allowed range. For BatchMeterUsage , if any
      # of the records are outside of the allowed range, the entire batch is not processed. You must remove
      # invalid records and try again.

      class TimestampOutOfBoundsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CustomerNotEntitledException"
          CustomerNotEntitledException.new(message)
        when "DisabledApiException"
          DisabledApiException.new(message)
        when "DuplicateRequestException"
          DuplicateRequestException.new(message)
        when "ExpiredTokenException"
          ExpiredTokenException.new(message)
        when "IdempotencyConflictException"
          IdempotencyConflictException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidCustomerIdentifierException"
          InvalidCustomerIdentifierException.new(message)
        when "InvalidEndpointRegionException"
          InvalidEndpointRegionException.new(message)
        when "InvalidProductCodeException"
          InvalidProductCodeException.new(message)
        when "InvalidPublicKeyVersionException"
          InvalidPublicKeyVersionException.new(message)
        when "InvalidRegionException"
          InvalidRegionException.new(message)
        when "InvalidTagException"
          InvalidTagException.new(message)
        when "InvalidTokenException"
          InvalidTokenException.new(message)
        when "InvalidUsageAllocationsException"
          InvalidUsageAllocationsException.new(message)
        when "InvalidUsageDimensionException"
          InvalidUsageDimensionException.new(message)
        when "PlatformNotSupportedException"
          PlatformNotSupportedException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TimestampOutOfBoundsException"
          TimestampOutOfBoundsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
