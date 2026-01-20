module Aws
  module Codeartifact
    module Errors
      class ServiceError < Exception
      end

      # The operation did not succeed because of an unauthorized access attempt.

      class AccessDeniedException < ServiceError
      end

      # The operation did not succeed because prerequisites are not met.

      class ConflictException < ServiceError
      end

      # The operation did not succeed because of an error that occurred inside CodeArtifact.

      class InternalServerException < ServiceError
      end

      # The operation did not succeed because the resource requested is not found in the service.

      class ResourceNotFoundException < ServiceError
      end

      # The operation did not succeed because it would have exceeded a service limit for your account.

      class ServiceQuotaExceededException < ServiceError
      end

      # The operation did not succeed because too many requests are sent to the service.

      class ThrottlingException < ServiceError
      end

      # The operation did not succeed because a parameter in the request was sent with an invalid value.

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
