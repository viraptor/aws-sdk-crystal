module AwsSdk
  module EMR
    module Errors
      class ServiceError < Exception
      end

      # Indicates that an error occurred while processing the request and that the request was not
      # completed.

      class InternalServerError < ServiceError
      end

      # This exception occurs when there is an internal failure in the Amazon EMR service.

      class InternalServerException < ServiceError
      end

      # This exception occurs when there is something wrong with user input.

      class InvalidRequestException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerError"
          InternalServerError.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
