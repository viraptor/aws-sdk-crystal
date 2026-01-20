module AwsSdk
  module MTurk
    module Errors
      class ServiceError < Exception
      end

      # Your request is invalid.

      class RequestError < ServiceError
      end

      # Amazon Mechanical Turk is temporarily unable to process your request. Try your call again.

      class ServiceFault < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "RequestError"
          RequestError.new(message)
        when "ServiceFault"
          ServiceFault.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
