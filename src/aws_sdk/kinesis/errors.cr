module AwsSdk
  module Kinesis
    module Errors
      class ServiceError < Exception
      end

      # Specifies that you do not have the permissions required to perform this operation.

      class AccessDeniedException < ServiceError
      end

      # The provided iterator exceeds the maximum age allowed.

      class ExpiredIteratorException < ServiceError
      end

      # The pagination token passed to the operation is expired.

      class ExpiredNextTokenException < ServiceError
      end

      # The processing of the request failed because of an unknown error, exception, or failure.

      class InternalFailureException < ServiceError
      end

      # A specified parameter exceeds its restrictions, is not supported, or can't be used. For more
      # information, see the returned message.

      class InvalidArgumentException < ServiceError
      end

      # The ciphertext references a key that doesn't exist or that you don't have access to.

      class KMSAccessDeniedException < ServiceError
      end

      # The request was rejected because the specified customer master key (CMK) isn't enabled.

      class KMSDisabledException < ServiceError
      end

      # The request was rejected because the state of the specified resource isn't valid for this request.
      # For more information, see How Key State Affects Use of a Customer Master Key in the Amazon Web
      # Services Key Management Service Developer Guide .

      class KMSInvalidStateException < ServiceError
      end

      # The request was rejected because the specified entity or resource can't be found.

      class KMSNotFoundException < ServiceError
      end

      # The Amazon Web Services access key ID needs a subscription for the service.

      class KMSOptInRequired < ServiceError
      end

      # The request was denied due to request throttling. For more information about throttling, see Limits
      # in the Amazon Web Services Key Management Service Developer Guide .

      class KMSThrottlingException < ServiceError
      end

      # The requested resource exceeds the maximum number allowed, or the number of concurrent stream
      # requests exceeds the maximum number allowed.

      class LimitExceededException < ServiceError
      end

      # The request rate for the stream is too high, or the requested data is too large for the available
      # throughput. Reduce the frequency or size of your requests. For more information, see Streams Limits
      # in the Amazon Kinesis Data Streams Developer Guide , and Error Retries and Exponential Backoff in
      # Amazon Web Services in the Amazon Web Services General Reference .

      class ProvisionedThroughputExceededException < ServiceError
      end

      # The resource is not available for this operation. For successful operation, the resource must be in
      # the ACTIVE state.

      class ResourceInUseException < ServiceError
      end

      # The requested resource could not be found. The stream might not be specified correctly.

      class ResourceNotFoundException < ServiceError
      end

      # Specifies that you tried to invoke this API for a data stream with the on-demand capacity mode. This
      # API is only supported for data streams with the provisioned capacity mode.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ExpiredIteratorException"
          ExpiredIteratorException.new(message)
        when "ExpiredNextTokenException"
          ExpiredNextTokenException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "KMSAccessDeniedException"
          KMSAccessDeniedException.new(message)
        when "KMSDisabledException"
          KMSDisabledException.new(message)
        when "KMSInvalidStateException"
          KMSInvalidStateException.new(message)
        when "KMSNotFoundException"
          KMSNotFoundException.new(message)
        when "KMSOptInRequired"
          KMSOptInRequired.new(message)
        when "KMSThrottlingException"
          KMSThrottlingException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ProvisionedThroughputExceededException"
          ProvisionedThroughputExceededException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
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
