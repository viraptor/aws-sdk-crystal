module Aws
  module MarketplaceEntitlementService
    module Errors
      class ServiceError < Exception
      end

      # An internal error has occurred. Retry your request. If the problem persists, post a message with
      # details on the AWS forums.

      class InternalServiceErrorException < ServiceError
      end

      # One or more parameters in your request was invalid.

      class InvalidParameterException < ServiceError
      end

      # The calls to the GetEntitlements API are throttled.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
