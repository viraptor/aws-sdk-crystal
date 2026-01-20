module Aws
  module EMRContainers
    module Errors
      class ServiceError < Exception
      end

      # The request exceeded the Amazon EKS API operation limits.

      class EKSRequestThrottledException < ServiceError
      end

      # This is an internal server exception.

      class InternalServerException < ServiceError
      end

      # The request throttled.

      class RequestThrottledException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # There are invalid parameters in the client request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "EKSRequestThrottledException"
          EKSRequestThrottledException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "RequestThrottledException"
          RequestThrottledException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
