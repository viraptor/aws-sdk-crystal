module AwsSdk
  module KendraRanking
    module Errors
      class ServiceError < Exception
      end

      # You don’t have sufficient access to perform this action. Please ensure you have the required
      # permission policies and user accounts and try again.

      class AccessDeniedException < ServiceError
      end

      # A conflict occurred with the request. Please fix any inconsistencies with your resources and try
      # again.

      class ConflictException < ServiceError
      end

      # An issue occurred with the internal server used for your Amazon Kendra Intelligent Ranking service.
      # Please wait a few minutes and try again, or contact Support for help.

      class InternalServerException < ServiceError
      end

      # The resource you want to use doesn't exist. Please check you have provided the correct resource and
      # try again.

      class ResourceNotFoundException < ServiceError
      end

      # The resource you want to use is unavailable. Please check you have provided the correct resource
      # information and try again.

      class ResourceUnavailableException < ServiceError
      end

      # You have exceeded the set limits for your Amazon Kendra Intelligent Ranking service. Please see
      # Quotas for more information, or contact Support to inquire about an increase of limits.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling. Please reduce the number of requests and try
      # again.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints set by the Amazon Kendra Intelligent Ranking service.
      # Please provide the correct input and try again.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
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
