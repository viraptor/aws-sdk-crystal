module AwsSdk
  module CloudHSMV2
    module Errors
      class ServiceError < Exception
      end

      # The request was rejected because the requester does not have permission to perform the requested
      # operation.

      class CloudHsmAccessDeniedException < ServiceError
      end

      # The request was rejected because of an CloudHSM internal failure. The request can be retried.

      class CloudHsmInternalFailureException < ServiceError
      end

      # The request was rejected because it is not a valid request.

      class CloudHsmInvalidRequestException < ServiceError
      end

      # The request was rejected because it exceeds an CloudHSM limit.

      class CloudHsmResourceLimitExceededException < ServiceError
      end

      # The request was rejected because it refers to a resource that cannot be found.

      class CloudHsmResourceNotFoundException < ServiceError
      end

      # The request was rejected because an error occurred.

      class CloudHsmServiceException < ServiceError
      end

      # The request was rejected because of a tagging failure. Verify the tag conditions in all applicable
      # policies, and then retry the request.

      class CloudHsmTagException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CloudHsmAccessDeniedException"
          CloudHsmAccessDeniedException.new(message)
        when "CloudHsmInternalFailureException"
          CloudHsmInternalFailureException.new(message)
        when "CloudHsmInvalidRequestException"
          CloudHsmInvalidRequestException.new(message)
        when "CloudHsmResourceLimitExceededException"
          CloudHsmResourceLimitExceededException.new(message)
        when "CloudHsmResourceNotFoundException"
          CloudHsmResourceNotFoundException.new(message)
        when "CloudHsmServiceException"
          CloudHsmServiceException.new(message)
        when "CloudHsmTagException"
          CloudHsmTagException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
