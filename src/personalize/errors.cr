module Aws
  module Personalize
    module Errors
      class ServiceError < Exception
      end

      # Provide a valid value for the field or parameter.

      class InvalidInputException < ServiceError
      end

      # The token is not valid.

      class InvalidNextTokenException < ServiceError
      end

      # The limit on the number of requests per second has been exceeded.

      class LimitExceededException < ServiceError
      end

      # The specified resource already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # The specified resource is in use.

      class ResourceInUseException < ServiceError
      end

      # Could not find the specified resource.

      class ResourceNotFoundException < ServiceError
      end

      # The request contains more tag keys than can be associated with a resource (50 tag keys per
      # resource).

      class TooManyTagKeysException < ServiceError
      end

      # You have exceeded the maximum number of tags you can apply to this resource.

      class TooManyTagsException < ServiceError
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
        when "TooManyTagKeysException"
          TooManyTagKeysException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
