module Aws
  module KinesisAnalytics
    module Errors
      class ServiceError < Exception
      end

      # User-provided application code (query) is invalid. This can be a simple syntax error.

      class CodeValidationException < ServiceError
      end

      # Exception thrown as a result of concurrent modification to an application. For example, two
      # individuals attempting to edit the same application at the same time.

      class ConcurrentModificationException < ServiceError
      end

      # User-provided application configuration is not valid.

      class InvalidApplicationConfigurationException < ServiceError
      end

      # Specified input parameter value is invalid.

      class InvalidArgumentException < ServiceError
      end

      # Exceeded the number of applications allowed.

      class LimitExceededException < ServiceError
      end

      # Application is not available for this operation.

      class ResourceInUseException < ServiceError
      end

      # Specified application can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # Discovery failed to get a record from the streaming source because of the Amazon Kinesis Streams
      # ProvisionedThroughputExceededException. For more information, see GetRecords in the Amazon Kinesis
      # Streams API Reference.

      class ResourceProvisionedThroughputExceededException < ServiceError
      end

      # The service is unavailable. Back off and retry the operation.

      class ServiceUnavailableException < ServiceError
      end

      # Application created with too many tags, or too many tags added to an application. Note that the
      # maximum number of application tags includes system tags. The maximum number of user-defined
      # application tags is 50.

      class TooManyTagsException < ServiceError
      end

      # Data format is not valid. Amazon Kinesis Analytics is not able to detect schema for the given
      # streaming source.

      class UnableToDetectSchemaException < ServiceError
      end

      # The request was rejected because a specified parameter is not supported or a specified resource is
      # not valid for this operation.

      class UnsupportedOperationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CodeValidationException"
          CodeValidationException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "InvalidApplicationConfigurationException"
          InvalidApplicationConfigurationException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceProvisionedThroughputExceededException"
          ResourceProvisionedThroughputExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnableToDetectSchemaException"
          UnableToDetectSchemaException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
