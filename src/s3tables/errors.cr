module Aws
  module S3Tables
    module Errors
      class ServiceError < Exception
      end

      # The action cannot be performed because you do not have the required permission.

      class AccessDeniedException < ServiceError
      end

      # The request is invalid or malformed.

      class BadRequestException < ServiceError
      end

      # The request failed because there is a conflict with a previous write. You can retry the request.

      class ConflictException < ServiceError
      end

      # The caller isn't authorized to make the request.

      class ForbiddenException < ServiceError
      end

      # The request failed due to an internal server error.

      class InternalServerErrorException < ServiceError
      end

      # The requested operation is not allowed on this resource. This may occur when attempting to modify a
      # resource that is managed by a service or has restrictions that prevent the operation.

      class MethodNotAllowedException < ServiceError
      end

      # The request was rejected because the specified resource could not be found.

      class NotFoundException < ServiceError
      end

      # The limit on the number of requests per second was exceeded.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "MethodNotAllowedException"
          MethodNotAllowedException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
