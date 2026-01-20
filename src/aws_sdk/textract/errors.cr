module AwsSdk
  module Textract
    module Errors
      class ServiceError < Exception
      end

      # You aren't authorized to perform the action. Use the Amazon Resource Name (ARN) of an authorized
      # user or IAM role to perform the operation.

      class AccessDeniedException < ServiceError
      end

      # Amazon Textract isn't able to read the document. For more information on the document limits in
      # Amazon Textract, see limits .

      class BadDocumentException < ServiceError
      end

      # Updating or deleting a resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # The document can't be processed because it's too large. The maximum document size for synchronous
      # operations 10 MB. The maximum document size for asynchronous operations is 500 MB for PDF files.

      class DocumentTooLargeException < ServiceError
      end

      # Indicates you have exceeded the maximum number of active human in the loop workflows available

      class HumanLoopQuotaExceededException < ServiceError
      end

      # A ClientRequestToken input parameter was reused with an operation, but at least one of the other
      # input parameters is different from the previous call to the operation.

      class IdempotentParameterMismatchException < ServiceError
      end

      # Amazon Textract experienced a service issue. Try your call again.

      class InternalServerError < ServiceError
      end

      # An invalid job identifier was passed to an asynchronous analysis operation.

      class InvalidJobIdException < ServiceError
      end

      # Indicates you do not have decrypt permissions with the KMS key entered, or the KMS key was entered
      # incorrectly.

      class InvalidKMSKeyException < ServiceError
      end

      # An input parameter violated a constraint. For example, in synchronous operations, an
      # InvalidParameterException exception occurs when neither of the S3Object or Bytes values are supplied
      # in the Document request parameter. Validate your parameter before calling the API operation again.

      class InvalidParameterException < ServiceError
      end

      # Amazon Textract is unable to access the S3 object that's specified in the request. for more
      # information, Configure Access to Amazon S3 For troubleshooting information, see Troubleshooting
      # Amazon S3

      class InvalidS3ObjectException < ServiceError
      end

      # An Amazon Textract service limit was exceeded. For example, if you start too many asynchronous jobs
      # concurrently, calls to start operations ( StartDocumentTextDetection , for example) raise a
      # LimitExceededException exception (HTTP status code: 400) until the number of concurrently running
      # jobs is below the Amazon Textract service limit.

      class LimitExceededException < ServiceError
      end

      # The number of requests exceeded your throughput limit. If you want to increase this limit, contact
      # Amazon Textract.

      class ProvisionedThroughputExceededException < ServiceError
      end

      # Returned when an operation tried to access a nonexistent resource.

      class ResourceNotFoundException < ServiceError
      end

      # Returned when a request cannot be completed as it would exceed a maximum service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # Amazon Textract is temporarily unable to process the request. Try your call again.

      class ThrottlingException < ServiceError
      end

      # The format of the input document isn't supported. Documents for operations can be in PNG, JPEG, PDF,
      # or TIFF format.

      class UnsupportedDocumentException < ServiceError
      end

      # Indicates that a request was not valid. Check request for proper formatting.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadDocumentException"
          BadDocumentException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DocumentTooLargeException"
          DocumentTooLargeException.new(message)
        when "HumanLoopQuotaExceededException"
          HumanLoopQuotaExceededException.new(message)
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidJobIdException"
          InvalidJobIdException.new(message)
        when "InvalidKMSKeyException"
          InvalidKMSKeyException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidS3ObjectException"
          InvalidS3ObjectException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ProvisionedThroughputExceededException"
          ProvisionedThroughputExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedDocumentException"
          UnsupportedDocumentException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
