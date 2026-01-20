module Aws
  module AppMesh
    module Errors
      class ServiceError < Exception
      end

      # The request syntax was malformed. Check your request syntax and try again.

      class BadRequestException < ServiceError
      end

      # The request contains a client token that was used for a previous update resource call with different
      # specifications. Try the request again with a new client token.

      class ConflictException < ServiceError
      end

      # You don't have permissions to perform this action.

      class ForbiddenException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception, or failure.

      class InternalServerErrorException < ServiceError
      end

      # You have exceeded a service limit for your account. For more information, see Service Limits in the
      # App Mesh User Guide .

      class LimitExceededException < ServiceError
      end

      # The specified resource doesn't exist. Check your request syntax and try again.

      class NotFoundException < ServiceError
      end

      # You can't delete the specified resource because it's in use or required by another resource.

      class ResourceInUseException < ServiceError
      end

      # The request has failed due to a temporary failure of the service.

      class ServiceUnavailableException < ServiceError
      end

      # The maximum request rate permitted by the App Mesh APIs has been exceeded for your account. For best
      # results, use an increasing or variable sleep interval between requests.

      class TooManyRequestsException < ServiceError
      end

      # The request exceeds the maximum allowed number of tags allowed per resource. The current limit is 50
      # user tags per resource. You must reduce the number of tags in the request. None of the tags in this
      # request were applied.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
