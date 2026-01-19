module AwsSdk
  module MarketplaceReporting
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The request is malformed, or it contains an error such as an invalid parameter. Ensure the request
      # has all required parameters.
      class BadRequestException < ServiceError
      end

      # The operation failed due to a server error.
      class InternalServerException < ServiceError
      end

      # You do not have permission to perform this action.
      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
