module AwsSdk
  module MediaTailor
    module Errors
      class ServiceError < Exception
      end

      # A request contains unexpected data.

      class BadRequestException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
