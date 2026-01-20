module AwsSdk
  module ChimeSDKVoice
    module Errors
      class ServiceError < Exception
      end

      # You don't have the permissions needed to run this action.

      class AccessDeniedException < ServiceError
      end

      # The input parameters don't match the service's restrictions.

      class BadRequestException < ServiceError
      end

      # Multiple instances of the same request were made simultaneously.

      class ConflictException < ServiceError
      end

      # The client is permanently forbidden from making the request.

      class ForbiddenException < ServiceError
      end

      # Access to the target resource is no longer available at the origin server. This condition is likely
      # to be permanent.

      class GoneException < ServiceError
      end

      # The requested resource couldn't be found.

      class NotFoundException < ServiceError
      end

      # The request exceeds the resource limit.

      class ResourceLimitExceededException < ServiceError
      end

      # The service encountered an unexpected error.

      class ServiceFailureException < ServiceError
      end

      # The service is currently unavailable.

      class ServiceUnavailableException < ServiceError
      end

      # The number of customer requests exceeds the request rate limit.

      class ThrottledClientException < ServiceError
      end

      # The client isn't authorized to request a resource.

      class UnauthorizedClientException < ServiceError
      end

      # A well-formed request couldn't be followed due to semantic errors.

      class UnprocessableEntityException < ServiceError
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
        when "GoneException"
          GoneException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ServiceFailureException"
          ServiceFailureException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottledClientException"
          ThrottledClientException.new(message)
        when "UnauthorizedClientException"
          UnauthorizedClientException.new(message)
        when "UnprocessableEntityException"
          UnprocessableEntityException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
