module AwsSdk
  module Glacier
    module Errors
      class ServiceError < Exception
      end

      # Returned if there is insufficient capacity to process this expedited request. This error only
      # applies to expedited retrievals and not to standard or bulk retrievals.
      class InsufficientCapacityException < ServiceError
      end

      # Returned if a parameter of the request is incorrectly specified.
      class InvalidParameterValueException < ServiceError
      end

      # Returned if the request results in a vault or account limit being exceeded.
      class LimitExceededException < ServiceError
      end

      # Returned if a required header or parameter is missing from the request.
      class MissingParameterValueException < ServiceError
      end

      # Returned if the request was made by a customer with no Amazon Glacier storage. The request is denied
      # as the API is no longer supported for new customers. Please use Amazon S3 Glacier storage classes
      # instead.
      class NoLongerSupportedException < ServiceError
      end

      # Returned if a retrieval job would exceed the current data policy's retrieval rate limit. For more
      # information about data retrieval policies,
      class PolicyEnforcedException < ServiceError
      end

      # Returned if, when uploading an archive, Amazon Glacier times out while receiving the upload.
      class RequestTimeoutException < ServiceError
      end

      # Returned if the specified resource (such as a vault, upload ID, or job ID) doesn't exist.
      class ResourceNotFoundException < ServiceError
      end

      # Returned if the service cannot complete the request.
      class ServiceUnavailableException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InsufficientCapacityException"
          InsufficientCapacityException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MissingParameterValueException"
          MissingParameterValueException.new(message)
        when "NoLongerSupportedException"
          NoLongerSupportedException.new(message)
        when "PolicyEnforcedException"
          PolicyEnforcedException.new(message)
        when "RequestTimeoutException"
          RequestTimeoutException.new(message)
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
