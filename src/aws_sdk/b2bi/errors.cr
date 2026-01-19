module AwsSdk
  module B2bi
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # A conflict exception is thrown when you attempt to delete a resource (such as a profile or a
      # capability) that is being used by other resources.
      class ConflictException < ServiceError
      end

      # This exception is thrown when an error occurs in the Amazon Web Services B2B Data Interchange
      # service.
      class InternalServerException < ServiceError
      end

      # Occurs when the requested resource does not exist, or cannot be found. In some cases, the resource
      # exists in a region other than the region specified in the API call.
      class ResourceNotFoundException < ServiceError
      end

      # Occurs when the calling command attempts to exceed one of the service quotas, for example trying to
      # create a capability when you already have the maximum number of capabilities allowed.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to throttling: the data speed and rendering may be limited depending on
      # various parameters and conditions.
      class ThrottlingException < ServiceError
      end

      # Occurs when a B2BI object cannot be validated against a request from another object. This exception
      # can be thrown during standard EDI validation or when custom validation rules fail, such as when
      # element length constraints are violated, invalid codes are used in code list validations, or
      # required elements are missing based on configured element requirement rules.
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
