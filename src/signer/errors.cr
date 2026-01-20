module Aws
  module Signer
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request contains invalid parameters for the ARN or tags. This exception also occurs when you
      # call a tagging API on a cancelled signing profile.

      class BadRequestException < ServiceError
      end

      # The resource encountered a conflicting state.

      class ConflictException < ServiceError
      end

      # An internal error occurred.

      class InternalServiceErrorException < ServiceError
      end

      # The signing profile was not found.

      class NotFoundException < ServiceError
      end

      # A specified resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The client is making a request that exceeds service limits.

      class ServiceLimitExceededException < ServiceError
      end

      # The request was denied due to request throttling. Instead of this error, TooManyRequestsException
      # should be used.

      class ThrottlingException < ServiceError
      end

      # The allowed number of job-signing requests has been exceeded. This error supersedes the error
      # ThrottlingException .

      class TooManyRequestsException < ServiceError
      end

      # You signing certificate could not be validated.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceLimitExceededException"
          ServiceLimitExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
