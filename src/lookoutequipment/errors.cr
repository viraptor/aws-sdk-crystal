module Aws
  module LookoutEquipment
    module Errors
      class ServiceError < Exception
      end

      # The request could not be completed because you do not have access to the resource.

      class AccessDeniedException < ServiceError
      end

      # The request could not be completed due to a conflict with the current state of the target resource.

      class ConflictException < ServiceError
      end

      # Processing of the request has failed because of an unknown error, exception or failure.

      class InternalServerException < ServiceError
      end

      # The resource requested could not be found. Verify the resource ID and retry your request.

      class ResourceNotFoundException < ServiceError
      end

      # Resource limitations have been exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy constraints specified by Amazon Lookout for Equipment or a related Amazon
      # Web Services service that's being utilized.

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
