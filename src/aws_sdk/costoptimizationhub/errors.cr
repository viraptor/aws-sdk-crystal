module AwsSdk
  module CostOptimizationHub
    module Errors
      class ServiceError < Exception
      end

      # You are not authorized to use this operation with the given parameters.

      class AccessDeniedException < ServiceError
      end

      # An error on the server occurred during the processing of your request. Try again later.

      class InternalServerException < ServiceError
      end

      # The specified Amazon Resource Name (ARN) in the request doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

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
