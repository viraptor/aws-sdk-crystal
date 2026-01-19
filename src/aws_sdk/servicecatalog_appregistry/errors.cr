module AwsSdk
  module ServiceCatalogAppRegistry
    module Errors
      class ServiceError < Exception
      end

      # There was a conflict when processing the request (for example, a resource with the given name
      # already exists within the account).
      class ConflictException < ServiceError
      end

      # The service is experiencing internal problems.
      class InternalServerException < ServiceError
      end

      # The specified resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # The maximum number of resources per account has been reached.
      class ServiceQuotaExceededException < ServiceError
      end

      # The maximum number of API requests has been exceeded.
      class ThrottlingException < ServiceError
      end

      # The request has invalid or missing parameters.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
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
