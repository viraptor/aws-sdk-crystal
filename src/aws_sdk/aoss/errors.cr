module AwsSdk
  module OpenSearchServerless
    module Errors
      class ServiceError < Exception
      end

      # When creating a resource, thrown when a resource with the same name already exists or is being
      # created.
      class ConflictException < ServiceError
      end

      # Thrown when an error internal to the service occurs while processing a request.
      class InternalServerException < ServiceError
      end

      # Thrown when the collection you're attempting to create results in a number of search or indexing
      # OCUs that exceeds the account limit.
      class OcuLimitExceededException < ServiceError
      end

      # Thrown when accessing or deleting a resource that does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # Thrown when you attempt to create more resources than the service allows based on service quotas.
      class ServiceQuotaExceededException < ServiceError
      end

      # Thrown when the HTTP request contains invalid input or is missing required input.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "OcuLimitExceededException"
          OcuLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
