module AwsSdk
  module AppConfigData
    module Errors
      class ServiceError < Exception
      end

      # The input fails to satisfy the constraints specified by the service.

      class BadRequestException < ServiceError
      end

      # There was an internal failure in the service.

      class InternalServerException < ServiceError
      end

      # The requested resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
