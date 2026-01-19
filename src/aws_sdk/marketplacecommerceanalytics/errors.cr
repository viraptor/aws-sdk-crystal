module AwsSdk
  module MarketplaceCommerceAnalytics
    module Errors
      class ServiceError < Exception
      end

      # This exception is thrown when an internal service error occurs.
      class MarketplaceCommerceAnalyticsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "MarketplaceCommerceAnalyticsException"
          MarketplaceCommerceAnalyticsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
