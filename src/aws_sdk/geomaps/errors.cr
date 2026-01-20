module AwsSdk
  module GeoMaps
    module Errors
      class ServiceError < Exception
      end

      # The request was denied because of insufficient access or permissions. Check with an administrator to
      # verify your permissions.

      class AccessDeniedException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.

      class InternalServerException < ServiceError
      end

      # Exception thrown when the associated resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
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
