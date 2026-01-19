module AwsSdk
  module Macie2
    module Errors
      class ServiceError < Exception
      end

      # Provides information about an error that occurred due to insufficient access to a specified
      # resource.
      class AccessDeniedException < ServiceError
      end

      # Provides information about an error that occurred due to a versioning conflict for a specified
      # resource.
      class ConflictException < ServiceError
      end

      # Provides information about an error that occurred due to an unknown internal server error,
      # exception, or failure.
      class InternalServerException < ServiceError
      end

      # Provides information about an error that occurred because a specified resource wasn't found.
      class ResourceNotFoundException < ServiceError
      end

      # Provides information about an error that occurred due to one or more service quotas for an account.
      class ServiceQuotaExceededException < ServiceError
      end

      # Provides information about an error that occurred because too many requests were sent during a
      # certain amount of time.
      class ThrottlingException < ServiceError
      end

      # Provides information about an error that occurred due to an unprocessable entity.
      class UnprocessableEntityException < ServiceError
      end

      # Provides information about an error that occurred due to a syntax error in a request.
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
        when "UnprocessableEntityException"
          UnprocessableEntityException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
