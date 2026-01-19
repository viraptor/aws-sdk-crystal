module AwsSdk
  module Health
    module Errors
      class ServiceError < Exception
      end

      # EnableHealthServiceAccessForOrganization is already in progress. Wait for the action to complete
      # before trying again. To get the current status, use the DescribeHealthServiceStatusForOrganization
      # operation.
      class ConcurrentModificationException < ServiceError
      end

      # The specified pagination token ( nextToken ) is not valid.
      class InvalidPaginationToken < ServiceError
      end

      # The specified locale is not supported.
      class UnsupportedLocale < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "InvalidPaginationToken"
          InvalidPaginationToken.new(message)
        when "UnsupportedLocale"
          UnsupportedLocale.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
