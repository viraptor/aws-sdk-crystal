module AwsSdk
  module Inspector2
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action. For Enable , you receive this error if you
      # attempt to use a feature in an unsupported Amazon Web Services Region.
      class AccessDeniedException < ServiceError
      end

      # One or more tags submitted as part of the request is not valid.
      class BadRequestException < ServiceError
      end

      # A conflict occurred. This exception occurs when the same resource is being modified by concurrent
      # requests.
      class ConflictException < ServiceError
      end

      # The request has failed due to an internal failure of the Amazon Inspector service.
      class InternalServerException < ServiceError
      end

      # The operation tried to access an invalid resource. Make sure the resource is specified correctly.
      class ResourceNotFoundException < ServiceError
      end

      # You have exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use Service Quotas to request a service quota increase.
      class ServiceQuotaExceededException < ServiceError
      end

      # The limit on the number of requests per second was exceeded.
      class ThrottlingException < ServiceError
      end

      # The request has failed validation due to missing required fields or having invalid inputs.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
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
