module AwsSdk
  module Forecast
    module Errors
      class ServiceError < Exception
      end

      # We can't process the request because it includes an invalid value or a value that exceeds the valid
      # range.
      class InvalidInputException < ServiceError
      end

      # The token is not valid. Tokens expire after 24 hours.
      class InvalidNextTokenException < ServiceError
      end

      # The limit on the number of resources per account has been exceeded.
      class LimitExceededException < ServiceError
      end

      # There is already a resource with this name. Try again with a different name.
      class ResourceAlreadyExistsException < ServiceError
      end

      # The specified resource is in use.
      class ResourceInUseException < ServiceError
      end

      # We can't find a resource with that Amazon Resource Name (ARN). Check the ARN and try again.
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
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
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
