module AwsSdk
  module Athena
    module Errors
      class ServiceError < Exception
      end

      # Indicates a platform issue, which may be due to a transient condition or outage.

      class InternalServerException < ServiceError
      end

      # Indicates that something is wrong with the input to the request. For example, a required parameter
      # may be missing or out of range.

      class InvalidRequestException < ServiceError
      end

      # An exception that Athena received when it called a custom metastore. Occurs if the error is not
      # caused by user input ( InvalidRequestException ) or from the Athena platform (
      # InternalServerException ). For example, if a user-created Lambda function is missing permissions,
      # the Lambda 4XX exception is returned in a MetadataException .

      class MetadataException < ServiceError
      end

      # A resource, such as a workgroup, was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The specified session already exists.

      class SessionAlreadyExistsException < ServiceError
      end

      # Indicates that the request was throttled.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "MetadataException"
          MetadataException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "SessionAlreadyExistsException"
          SessionAlreadyExistsException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
