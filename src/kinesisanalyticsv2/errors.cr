module Aws
  module KinesisAnalyticsV2
    module Errors
      class ServiceError < Exception
      end

      # The user-provided application code (query) is not valid. This can be a simple syntax error.

      class CodeValidationException < ServiceError
      end

      # Exception thrown as a result of concurrent modifications to an application. This error can be the
      # result of attempting to modify an application without using the current application ID.

      class ConcurrentModificationException < ServiceError
      end

      # The user-provided application configuration is not valid.

      class InvalidApplicationConfigurationException < ServiceError
      end

      # The specified input parameter value is not valid.

      class InvalidArgumentException < ServiceError
      end

      # The request JSON is not valid for the operation.

      class InvalidRequestException < ServiceError
      end

      # The number of allowed resources has been exceeded.

      class LimitExceededException < ServiceError
      end

      # The application is not available for this operation.

      class ResourceInUseException < ServiceError
      end

      # Specified application can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # Discovery failed to get a record from the streaming source because of the Kinesis Streams
      # ProvisionedThroughputExceededException . For more information, see GetRecords in the Amazon Kinesis
      # Streams API Reference.

      class ResourceProvisionedThroughputExceededException < ServiceError
      end

      # The service cannot complete the request.

      class ServiceUnavailableException < ServiceError
      end

      # Application created with too many tags, or too many tags added to an application. Note that the
      # maximum number of application tags includes system tags. The maximum number of user-defined
      # application tags is 50.

      class TooManyTagsException < ServiceError
      end

      # The data format is not valid. Kinesis Data Analytics cannot detect the schema for the given
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
        when "InvalidRequestException"
          InvalidRequestException.new(message)
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
