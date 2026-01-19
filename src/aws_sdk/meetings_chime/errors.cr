module AwsSdk
  module ChimeSDKMeetings
    module Errors
      class ServiceError < Exception
      end

      # The input parameters don't match the service's restrictions.
      class BadRequestException < ServiceError
      end

      # Multiple instances of the same request have been made simultaneously.
      class ConflictException < ServiceError
      end

      # The client is permanently forbidden from making the request.
      class ForbiddenException < ServiceError
      end

      # The request exceeds the resource limit.
      class LimitExceededException < ServiceError
      end

      # One or more of the resources in the request does not exist in the system.
      class NotFoundException < ServiceError
      end

      # The resource that you want to tag couldn't be found.
      class ResourceNotFoundException < ServiceError
      end

      # The service encountered an unexpected error.
      class ServiceFailureException < ServiceError
      end

      # The service is currently unavailable.
      class ServiceUnavailableException < ServiceError
      end

      # The number of customer requests exceeds the request rate limit.
      class ThrottlingException < ServiceError
      end

      # Too many tags were added to the specified resource.
      class TooManyTagsException < ServiceError
      end

      # The user isn't authorized to request a resource.
      class UnauthorizedException < ServiceError
      end

      # The request was well-formed but was unable to be followed due to semantic errors.
      class UnprocessableEntityException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceFailureException"
          ServiceFailureException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "UnprocessableEntityException"
          UnprocessableEntityException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
