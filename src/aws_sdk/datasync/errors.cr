module AwsSdk
  module DataSync
    module Errors
      class ServiceError < Exception
      end

      # This exception is thrown when an error occurs in the DataSync service.
      class InternalException < ServiceError
      end

      # This exception is thrown when the client submits a malformed request.
      class InvalidRequestException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalException"
          InternalException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
