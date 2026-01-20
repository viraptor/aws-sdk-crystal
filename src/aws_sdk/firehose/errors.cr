module AwsSdk
  module Firehose
    module Errors
      class ServiceError < Exception
      end

      # Another modification has already happened. Fetch VersionId again and use it to update the
      # destination.

      class ConcurrentModificationException < ServiceError
      end

      # The specified input parameter has a value that is not valid.

      class InvalidArgumentException < ServiceError
      end

      # Firehose throws this exception when an attempt to put records or to start or stop Firehose stream
      # encryption fails. This happens when the KMS service throws one of the following exception types:
      # AccessDeniedException , InvalidStateException , DisabledException , or NotFoundException .

      class InvalidKMSResourceException < ServiceError
      end

      # Only requests from CloudWatch Logs are supported when CloudWatch Logs decompression is enabled.

      class InvalidSourceException < ServiceError
      end

      # You have already reached the limit for a requested resource.

      class LimitExceededException < ServiceError
      end

      # The resource is already in use and not available for this operation.

      class ResourceInUseException < ServiceError
      end

      # The specified resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The service is unavailable. Back off and retry the operation. If you continue to see the exception,
      # throughput limits for the Firehose stream may have been exceeded. For more information about limits
      # and how to request an increase, see Amazon Firehose Limits .

      class ServiceUnavailableException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidKMSResourceException"
          InvalidKMSResourceException.new(message)
        when "InvalidSourceException"
          InvalidSourceException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
