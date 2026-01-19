module AwsSdk
  module Support
    module Errors
      class ServiceError < Exception
      end

      # An attachment with the specified ID could not be found.
      class AttachmentIdNotFound < ServiceError
      end

      # The limit for the number of attachment sets created in a short period of time has been exceeded.
      class AttachmentLimitExceeded < ServiceError
      end

      # The expiration time of the attachment set has passed. The set expires 1 hour after it is created.
      class AttachmentSetExpired < ServiceError
      end

      # An attachment set with the specified ID could not be found.
      class AttachmentSetIdNotFound < ServiceError
      end

      # A limit for the size of an attachment set has been exceeded. The limits are three attachments and 5
      # MB per attachment.
      class AttachmentSetSizeLimitExceeded < ServiceError
      end

      # The case creation limit for the account has been exceeded.
      class CaseCreationLimitExceeded < ServiceError
      end

      # The requested caseId couldn't be located.
      class CaseIdNotFound < ServiceError
      end

      # The limit for the number of DescribeAttachment requests in a short period of time has been exceeded.
      class DescribeAttachmentLimitExceeded < ServiceError
      end

      # An internal server error occurred.
      class InternalServerError < ServiceError
      end

      # You have exceeded the maximum allowed TPS (Transactions Per Second) for the operations.
      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AttachmentIdNotFound"
          AttachmentIdNotFound.new(message)
        when "AttachmentLimitExceeded"
          AttachmentLimitExceeded.new(message)
        when "AttachmentSetExpired"
          AttachmentSetExpired.new(message)
        when "AttachmentSetIdNotFound"
          AttachmentSetIdNotFound.new(message)
        when "AttachmentSetSizeLimitExceeded"
          AttachmentSetSizeLimitExceeded.new(message)
        when "CaseCreationLimitExceeded"
          CaseCreationLimitExceeded.new(message)
        when "CaseIdNotFound"
          CaseIdNotFound.new(message)
        when "DescribeAttachmentLimitExceeded"
          DescribeAttachmentLimitExceeded.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
