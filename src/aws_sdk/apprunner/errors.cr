module AwsSdk
  module AppRunner
    module Errors
      class ServiceError < Exception
      end

      # An unexpected service exception occurred.

      class InternalServiceErrorException < ServiceError
      end

      # One or more input parameters aren't valid. Refer to the API action's document page, correct the
      # input parameters, and try the action again.

      class InvalidRequestException < ServiceError
      end

      # You can't perform this action when the resource is in its current state.

      class InvalidStateException < ServiceError
      end

      # A resource doesn't exist for the specified Amazon Resource Name (ARN) in your Amazon Web Services
      # account.

      class ResourceNotFoundException < ServiceError
      end

      # App Runner can't create this resource. You've reached your account quota for this resource type. For
      # App Runner per-resource quotas, see App Runner endpoints and quotas in the Amazon Web Services
      # General Reference .

      class ServiceQuotaExceededException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
