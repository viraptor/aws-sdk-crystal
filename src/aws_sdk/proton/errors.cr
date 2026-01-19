module AwsSdk
  module Proton
    module Errors
      class ServiceError < Exception
      end

      # There isn't sufficient access for performing this action.
      class AccessDeniedException < ServiceError
      end

      # The request couldn't be made due to a conflicting operation or resource.
      class ConflictException < ServiceError
      end

      # The request failed to register with the service.
      class InternalServerException < ServiceError
      end

      # The requested resource wasn't found.
      class ResourceNotFoundException < ServiceError
      end

      # A quota was exceeded. For more information, see Proton Quotas in the Proton User Guide .
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The input is invalid or an out-of-range value was supplied for the input parameter.
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
