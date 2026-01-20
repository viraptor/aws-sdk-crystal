module AwsSdk
  module CloudHSM
    module Errors
      class ServiceError < Exception
      end

      # Indicates that an internal error occurred.

      class CloudHsmInternalException < ServiceError
      end

      # Indicates that an exception occurred in the AWS CloudHSM service.

      class CloudHsmServiceException < ServiceError
      end

      # Indicates that one or more of the request parameters are not valid.

      class InvalidRequestException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CloudHsmInternalException"
          CloudHsmInternalException.new(message)
        when "CloudHsmServiceException"
          CloudHsmServiceException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
