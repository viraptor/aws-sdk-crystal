module Aws
  module Kendra
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action. Please ensure you have the required
      # permission policies and user accounts and try again.

      class AccessDeniedException < ServiceError
      end

      # A conflict occurred with the request. Please fix any inconsistences with your resources and try
      # again.

      class ConflictException < ServiceError
      end

      # An error message with a list of conflicting queries used across different sets of featured results.
      # This occurred with the request for a new featured results set. Check that the queries you specified
      # for featured results are unique per featured results set for each index.

      class FeaturedResultsConflictException < ServiceError
      end

      # An issue occurred with the internal server used for your Amazon Kendra service. Please wait a few
      # minutes and try again, or contact Support for help.

      class InternalServerException < ServiceError
      end

      # The input to the request is not valid. Please provide the correct input and try again.

      class InvalidRequestException < ServiceError
      end

      # The resource you want to use already exists. Please check you have provided the correct resource and
      # try again.

      class ResourceAlreadyExistException < ServiceError
      end

      # The resource you want to use is currently in use. Please check you have provided the correct
      # resource and try again.

      class ResourceInUseException < ServiceError
      end

      # The resource you want to use doesn’t exist. Please check you have provided the correct resource and
      # try again.

      class ResourceNotFoundException < ServiceError
      end

      # The resource you want to use isn't available. Please check you have provided the correct resource
      # and try again.

      class ResourceUnavailableException < ServiceError
      end

      # You have exceeded the set limits for your Amazon Kendra service. Please see Quotas for more
      # information, or contact Support to inquire about an increase of limits.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling. Please reduce the number of requests and try
      # again.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints set by the Amazon Kendra service. Please provide the
      # correct input and try again.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "FeaturedResultsConflictException"
          FeaturedResultsConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "ResourceAlreadyExistException"
          ResourceAlreadyExistException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
