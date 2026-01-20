module AwsSdk
  module SimpleDB
    module Errors
      class ServiceError < Exception
      end

      # The specified attribute does not exist.

      class AttributeDoesNotExist < ServiceError
      end

      # The item name was specified more than once.

      class DuplicateItemName < ServiceError
      end

      # The specified NextToken is not valid.

      class InvalidNextToken < ServiceError
      end

      # Too many predicates exist in the query expression.

      class InvalidNumberPredicates < ServiceError
      end

      # Too many predicates exist in the query expression.

      class InvalidNumberValueTests < ServiceError
      end

      # The value for a parameter is invalid.

      class InvalidParameterValue < ServiceError
      end

      # The specified query expression syntax is not valid.

      class InvalidQueryExpression < ServiceError
      end

      # The request must contain the specified missing parameter.

      class MissingParameter < ServiceError
      end

      # The specified domain does not exist.

      class NoSuchDomain < ServiceError
      end

      # Too many attributes in this domain.

      class NumberDomainAttributesExceeded < ServiceError
      end

      # Too many bytes in this domain.

      class NumberDomainBytesExceeded < ServiceError
      end

      # Too many domains exist per this account.

      class NumberDomainsExceeded < ServiceError
      end

      # Too many attributes in this item.

      class NumberItemAttributesExceeded < ServiceError
      end

      # Too many attributes exist in a single call.

      class NumberSubmittedAttributesExceeded < ServiceError
      end

      # Too many items exist in a single call.

      class NumberSubmittedItemsExceeded < ServiceError
      end

      # A timeout occurred when attempting to query the specified domain with specified query expression.

      class RequestTimeout < ServiceError
      end

      # Too many attributes requested.

      class TooManyRequestedAttributes < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AttributeDoesNotExist"
          AttributeDoesNotExist.new(message)
        when "DuplicateItemName"
          DuplicateItemName.new(message)
        when "InvalidNextToken"
          InvalidNextToken.new(message)
        when "InvalidNumberPredicates"
          InvalidNumberPredicates.new(message)
        when "InvalidNumberValueTests"
          InvalidNumberValueTests.new(message)
        when "InvalidParameterValue"
          InvalidParameterValue.new(message)
        when "InvalidQueryExpression"
          InvalidQueryExpression.new(message)
        when "MissingParameter"
          MissingParameter.new(message)
        when "NoSuchDomain"
          NoSuchDomain.new(message)
        when "NumberDomainAttributesExceeded"
          NumberDomainAttributesExceeded.new(message)
        when "NumberDomainBytesExceeded"
          NumberDomainBytesExceeded.new(message)
        when "NumberDomainsExceeded"
          NumberDomainsExceeded.new(message)
        when "NumberItemAttributesExceeded"
          NumberItemAttributesExceeded.new(message)
        when "NumberSubmittedAttributesExceeded"
          NumberSubmittedAttributesExceeded.new(message)
        when "NumberSubmittedItemsExceeded"
          NumberSubmittedItemsExceeded.new(message)
        when "RequestTimeout"
          RequestTimeout.new(message)
        when "TooManyRequestedAttributes"
          TooManyRequestedAttributes.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
