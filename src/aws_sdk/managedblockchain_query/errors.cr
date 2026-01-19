module AwsSdk
  module ManagedBlockchainQuery
    module Errors
      class ServiceError < Exception
      end

      # The Amazon Web Services account doesn’t have access to this resource.
      class AccessDeniedException < ServiceError
      end

      # The request processing has failed because of an internal error in the service.
      class InternalServerException < ServiceError
      end

      # The resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The service quota has been exceeded for this resource.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request or operation couldn't be performed because a service is throttling requests. The most
      # common source of throttling errors is when you create resources that exceed your service limit for
      # this resource type. Request a limit increase or delete unused resources, if possible.
      class ThrottlingException < ServiceError
      end

      # The resource passed is invalid.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
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
