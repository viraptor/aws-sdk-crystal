module AwsSdk
  module TimestreamWrite
    module Errors
      class ServiceError < Exception
      end

      # You are not authorized to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Timestream was unable to process this request because it contains resource that already exists.

      class ConflictException < ServiceError
      end

      # Timestream was unable to fully process this request because of an internal server error.

      class InternalServerException < ServiceError
      end

      # The requested endpoint was not valid.

      class InvalidEndpointException < ServiceError
      end

      # WriteRecords would throw this exception in the following cases: Records with duplicate data where
      # there are multiple records with the same dimensions, timestamps, and measure names but: Measure
      # values are different Version is not present in the request or the value of version in the new record
      # is equal to or lower than the existing value In this case, if Timestream rejects data, the
      # ExistingVersion field in the RejectedRecords response will indicate the current record’s version. To
      # force an update, you can resend the request with a version for the record set to a value greater
      # than the ExistingVersion . Records with timestamps that lie outside the retention duration of the
      # memory store. Records with dimensions or measures that exceed the Timestream defined limits. For
      # more information, see Quotas in the Amazon Timestream Developer Guide.

      class RejectedRecordsException < ServiceError
      end

      # The operation tried to access a nonexistent resource. The resource might not be specified correctly,
      # or its status might not be ACTIVE.

      class ResourceNotFoundException < ServiceError
      end

      # The instance quota of resource exceeded for this account.

      class ServiceQuotaExceededException < ServiceError
      end

      # Too many requests were made by a user and they exceeded the service quotas. The request was
      # throttled.

      class ThrottlingException < ServiceError
      end

      # An invalid or malformed request.

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
        when "InvalidEndpointException"
          InvalidEndpointException.new(message)
        when "RejectedRecordsException"
          RejectedRecordsException.new(message)
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
