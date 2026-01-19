module AwsSdk
  module AmplifyUIBuilder
    module Errors
      class ServiceError < Exception
      end

      # An internal error has occurred. Please retry your request.
      class InternalServerException < ServiceError
      end

      # An invalid or out-of-range value was supplied for the input parameter.
      class InvalidParameterException < ServiceError
      end

      # The resource specified in the request conflicts with an existing resource.
      class ResourceConflictException < ServiceError
      end

      # The requested resource does not exist, or access was denied.
      class ResourceNotFoundException < ServiceError
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your Amazon Web Services account.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # You don't have permission to perform this operation.
      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "ResourceConflictException"
          ResourceConflictException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
