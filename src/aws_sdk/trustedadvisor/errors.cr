module AwsSdk
  module TrustedAdvisor
    module Errors
      class ServiceError < Exception
      end

      # Exception that access has been denied due to insufficient access
      class AccessDeniedException < ServiceError
      end

      # Exception that the request was denied due to conflictions in state
      class ConflictException < ServiceError
      end

      # Exception to notify that an unexpected internal error occurred during processing of the request
      class InternalServerException < ServiceError
      end

      # Exception that the requested resource has not been found
      class ResourceNotFoundException < ServiceError
      end

      # Exception to notify that requests are being throttled
      class ThrottlingException < ServiceError
      end

      # Exception that the request failed to satisfy service constraints
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
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
