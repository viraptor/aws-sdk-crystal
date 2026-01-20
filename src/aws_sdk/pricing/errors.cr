module AwsSdk
  module Pricing
    module Errors
      class ServiceError < Exception
      end

      # General authentication failure. The request wasn't signed correctly.

      class AccessDeniedException < ServiceError
      end

      # The pagination token expired. Try again without a pagination token.

      class ExpiredNextTokenException < ServiceError
      end

      # An error on the server occurred during the processing of your request. Try again later.

      class InternalErrorException < ServiceError
      end

      # The pagination token is invalid. Try again without a pagination token.

      class InvalidNextTokenException < ServiceError
      end

      # One or more parameters had an invalid value.

      class InvalidParameterException < ServiceError
      end

      # The requested resource can't be found.

      class NotFoundException < ServiceError
      end

      # The requested resource can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # You've made too many requests exceeding service quotas.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ExpiredNextTokenException"
          ExpiredNextTokenException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
