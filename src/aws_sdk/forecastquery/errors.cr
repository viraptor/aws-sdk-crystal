module AwsSdk
  module Forecastquery
    module Errors
      class ServiceError < Exception
      end

      # The value is invalid or is too long.
      class InvalidInputException < ServiceError
      end

      # The token is not valid. Tokens expire after 24 hours.
      class InvalidNextTokenException < ServiceError
      end

      # The limit on the number of requests per second has been exceeded.
      class LimitExceededException < ServiceError
      end

      # The specified resource is in use.
      class ResourceInUseException < ServiceError
      end

      # We can't find that resource. Check the information that you've provided and try again.
      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
