module AwsSdk
  module LicenseManagerLinuxSubscriptions
    module Errors
      class ServiceError < Exception
      end

      # An exception occurred with the service.
      class InternalServerException < ServiceError
      end

      # Unable to find the requested Amazon Web Services resource.
      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The provided input is not valid. Try your request again.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
