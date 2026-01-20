module AwsSdk
  module SecurityLake
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action. Access denied errors appear when Amazon
      # Security Lake explicitly or implicitly denies an authorization request. An explicit denial occurs
      # when a policy contains a Deny statement for the specific Amazon Web Services action. An implicit
      # denial occurs when there is no applicable Deny statement and also no applicable Allow statement.

      class AccessDeniedException < ServiceError
      end

      # The request is malformed or contains an error such as an invalid parameter value or a missing
      # required parameter.

      class BadRequestException < ServiceError
      end

      # Occurs when a conflict with a previous successful write is detected. This generally occurs when the
      # previous write did not have time to propagate to the host serving the current request. A retry (with
      # appropriate backoff logic) is the recommended response to this exception.

      class ConflictException < ServiceError
      end

      # Internal service exceptions are sometimes caused by transient issues. Before you start
      # troubleshooting, perform the operation again.

      class InternalServerException < ServiceError
      end

      # The resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The limit on the number of requests per second was exceeded.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
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
