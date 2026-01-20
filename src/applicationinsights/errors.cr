module Aws
  module ApplicationInsights
    module Errors
      class ServiceError < Exception
      end

      # User does not have permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request is not understood by the server.

      class BadRequestException < ServiceError
      end

      # The server encountered an internal error and is unable to complete the request.

      class InternalServerException < ServiceError
      end

      # The resource is already created or in use.

      class ResourceInUseException < ServiceError
      end

      # The resource does not exist in the customer account.

      class ResourceNotFoundException < ServiceError
      end

      # Tags are already registered for the specified application ARN.

      class TagsAlreadyExistException < ServiceError
      end

      # The number of the provided tags is beyond the limit, or the number of total tags you are trying to
      # attach to the specified resource exceeds the limit.

      class TooManyTagsException < ServiceError
      end

      # The parameter is not valid.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TagsAlreadyExistException"
          TagsAlreadyExistException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
