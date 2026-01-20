module AwsSdk
  module ChimeSDKMessaging
    module Errors
      class ServiceError < Exception
      end

      # The input parameters don't match the service's restrictions.

      class BadRequestException < ServiceError
      end

      # The request could not be processed because of conflict in the current state of the resource.

      class ConflictException < ServiceError
      end

      # The client is permanently forbidden from making the request.

      class ForbiddenException < ServiceError
      end

      # One or more of the resources in the request does not exist in the system.

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

      # The client exceeded its request rate limit.

      class ThrottledClientException < ServiceError
      end

      # The client is not currently authorized to make the request.

      class UnauthorizedClientException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
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
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
