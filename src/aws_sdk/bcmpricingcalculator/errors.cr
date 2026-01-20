module AwsSdk
  module BCMPricingCalculator
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request could not be processed because of conflict in the current state of the resource.

      class ConflictException < ServiceError
      end

      # The requested data is currently unavailable.

      class DataUnavailableException < ServiceError
      end

      # An internal error has occurred. Retry your request, but if the problem persists, contact Amazon Web
      # Services support.

      class InternalServerException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The request would cause you to exceed your service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input provided fails to satisfy the constraints specified by an Amazon Web Services service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DataUnavailableException"
          DataUnavailableException.new(message)
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
