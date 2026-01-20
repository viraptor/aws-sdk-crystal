module AwsSdk
  module Route53Domains
    module Errors
      class ServiceError < Exception
      end

      # This error is returned if you call AssociateDelegationSignerToDomain when the specified domain has
      # reached the maximum number of DS records. You can't add any additional DS records unless you delete
      # an existing one first.

      class DnssecLimitExceeded < ServiceError
      end

      # The number of domains has exceeded the allowed threshold for the account.

      class DomainLimitExceeded < ServiceError
      end

      # The request is already in progress for the domain.

      class DuplicateRequest < ServiceError
      end

      # The requested item is not acceptable. For example, for APIs that accept a domain name, the request
      # might specify a domain name that doesn't belong to the account that submitted the request. For
      # AcceptDomainTransferFromAnotherAwsAccount , the password might be invalid.

      class InvalidInput < ServiceError
      end

      # The number of operations or jobs running exceeded the allowed threshold for the account.

      class OperationLimitExceeded < ServiceError
      end

      # The top-level domain does not support this operation.

      class TLDRulesViolation < ServiceError
      end

      # Amazon Route 53 does not support this top-level domain (TLD).

      class UnsupportedTLD < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DnssecLimitExceeded"
          DnssecLimitExceeded.new(message)
        when "DomainLimitExceeded"
          DomainLimitExceeded.new(message)
        when "DuplicateRequest"
          DuplicateRequest.new(message)
        when "InvalidInput"
          InvalidInput.new(message)
        when "OperationLimitExceeded"
          OperationLimitExceeded.new(message)
        when "TLDRulesViolation"
          TLDRulesViolation.new(message)
        when "UnsupportedTLD"
          UnsupportedTLD.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
