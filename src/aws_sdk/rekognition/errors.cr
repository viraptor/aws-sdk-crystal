module AwsSdk
  module Rekognition
    module Errors
      class ServiceError < Exception
      end

      # You are not authorized to perform the action.

      class AccessDeniedException < ServiceError
      end

      # A User with the same Id already exists within the collection, or the update or deletion of the User
      # caused an inconsistent state. **

      class ConflictException < ServiceError
      end

      # The number of in-progress human reviews you have has exceeded the number allowed.

      class HumanLoopQuotaExceededException < ServiceError
      end

      # A ClientRequestToken input parameter was reused with an operation, but at least one of the other
      # input parameters is different from the previous call to the operation.

      class IdempotentParameterMismatchException < ServiceError
      end

      # The input image size exceeds the allowed limit. If you are calling DetectProtectiveEquipment, the
      # image size or resolution exceeds the allowed limit. For more information, see Guidelines and quotas
      # in Amazon Rekognition in the Amazon Rekognition Developer Guide.

      class ImageTooLargeException < ServiceError
      end

      # Amazon Rekognition experienced a service issue. Try your call again.

      class InternalServerError < ServiceError
      end

      # The provided image format is not supported.

      class InvalidImageFormatException < ServiceError
      end

      # Indicates that a provided manifest file is empty or larger than the allowed limit.

      class InvalidManifestException < ServiceError
      end

      # Pagination token in the request is not valid.

      class InvalidPaginationTokenException < ServiceError
      end

      # Input parameter violated a constraint. Validate your parameter before calling the API operation
      # again.

      class InvalidParameterException < ServiceError
      end

      # The supplied revision id for the project policy is invalid.

      class InvalidPolicyRevisionIdException < ServiceError
      end

      # Amazon Rekognition is unable to access the S3 object specified in the request.

      class InvalidS3ObjectException < ServiceError
      end

      # An Amazon Rekognition service limit was exceeded. For example, if you start too many jobs
      # concurrently, subsequent calls to start operations (ex: StartLabelDetection ) will raise a
      # LimitExceededException exception (HTTP status code: 400) until the number of concurrently running
      # jobs is below the Amazon Rekognition service limit.

      class LimitExceededException < ServiceError
      end

      # The format of the project policy document that you supplied to PutProjectPolicy is incorrect.

      class MalformedPolicyDocumentException < ServiceError
      end

      # The number of requests exceeded your throughput limit. If you want to increase this limit, contact
      # Amazon Rekognition.

      class ProvisionedThroughputExceededException < ServiceError
      end

      # A resource with the specified ID already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # The specified resource is already being used.

      class ResourceInUseException < ServiceError
      end

      # The resource specified in the request cannot be found.

      class ResourceNotFoundException < ServiceError
      end

      # The requested resource isn't ready. For example, this exception occurs when you call
      # DetectCustomLabels with a model version that isn't deployed.

      class ResourceNotReadyException < ServiceError
      end

      # The size of the collection exceeds the allowed limit. For more information, see Guidelines and
      # quotas in Amazon Rekognition in the Amazon Rekognition Developer Guide.

      class ServiceQuotaExceededException < ServiceError
      end

      # Occurs when a given sessionId is not found.

      class SessionNotFoundException < ServiceError
      end

      # Amazon Rekognition is temporarily unable to process the request. Try your call again.

      class ThrottlingException < ServiceError
      end

      # The file size or duration of the supplied media is too large. The maximum file size is 10GB. The
      # maximum duration is 6 hours.

      class VideoTooLargeException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "HumanLoopQuotaExceededException"
          HumanLoopQuotaExceededException.new(message)
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "ImageTooLargeException"
          ImageTooLargeException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidImageFormatException"
          InvalidImageFormatException.new(message)
        when "InvalidManifestException"
          InvalidManifestException.new(message)
        when "InvalidPaginationTokenException"
          InvalidPaginationTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidPolicyRevisionIdException"
          InvalidPolicyRevisionIdException.new(message)
        when "InvalidS3ObjectException"
          InvalidS3ObjectException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "ProvisionedThroughputExceededException"
          ProvisionedThroughputExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceNotReadyException"
          ResourceNotReadyException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "SessionNotFoundException"
          SessionNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "VideoTooLargeException"
          VideoTooLargeException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
