module AwsSdk
  module MediaStore
    module Errors
      class ServiceError < Exception
      end

      # The container that you specified in the request already exists or is being updated.

      class ContainerInUseException < ServiceError
      end

      # The container that you specified in the request does not exist.

      class ContainerNotFoundException < ServiceError
      end

      # The CORS policy that you specified in the request does not exist.

      class CorsPolicyNotFoundException < ServiceError
      end

      # The service is temporarily unavailable.

      class InternalServerError < ServiceError
      end

      # A service limit has been exceeded.

      class LimitExceededException < ServiceError
      end

      # The policy that you specified in the request does not exist.

      class PolicyNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ContainerInUseException"
          ContainerInUseException.new(message)
        when "ContainerNotFoundException"
          ContainerNotFoundException.new(message)
        when "CorsPolicyNotFoundException"
          CorsPolicyNotFoundException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "PolicyNotFoundException"
          PolicyNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
