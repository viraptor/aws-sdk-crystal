module Aws
  module Ivschat
    module Errors
      class ServiceError < Exception
      end


      class AccessDeniedException < ServiceError
      end


      class ConflictException < ServiceError
      end


      class InternalServerException < ServiceError
      end


      class PendingVerification < ServiceError
      end


      class ResourceNotFoundException < ServiceError
      end


      class ServiceQuotaExceededException < ServiceError
      end


      class ThrottlingException < ServiceError
      end


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
        when "PendingVerification"
          PendingVerification.new(message)
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
