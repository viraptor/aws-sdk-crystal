module AwsSdk
  module TaxSettings
    module Errors
      class ServiceError < Exception
      end

      # The access is denied for the Amazon Web ServicesSupport API.
      class AccessDeniedException < ServiceError
      end

      # Failed to upload the tax exemption document to Amazon Web ServicesSupport case.
      class AttachmentUploadException < ServiceError
      end

      # You've exceeded the Amazon Web ServicesSupport case creation limit for your account.
      class CaseCreationLimitExceededException < ServiceError
      end

      # The exception when the input is creating conflict with the given state.
      class ConflictException < ServiceError
      end

      # The exception thrown when an unexpected error occurs when processing a request.
      class InternalServerException < ServiceError
      end

      # The exception thrown when the input doesn't have a resource associated to it.
      class ResourceNotFoundException < ServiceError
      end

      # The exception when the input doesn't pass validation for at least one of the input parameters.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AttachmentUploadException"
          AttachmentUploadException.new(message)
        when "CaseCreationLimitExceededException"
          CaseCreationLimitExceededException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
