module AwsSdk
  module CodeCatalyst
    module Errors
      class ServiceError < Exception
      end

      # The request was denied because you don't have sufficient access to perform this action. Verify that
      # you are a member of a role that allows this action.

      class AccessDeniedException < ServiceError
      end

      # The request was denied because the requested operation would cause a conflict with the current state
      # of a service resource associated with the request. Another user might have updated the resource.
      # Reload, make sure you have the latest data, and then try again.

      class ConflictException < ServiceError
      end

      # The request was denied because the specified resource was not found. Verify that the spelling is
      # correct and that you have access to the resource.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied because one or more resources has reached its limits for the tier the space
      # belongs to. Either reduce the number of resources, or change the tier if applicable.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The request was denied because an input failed to satisfy the constraints specified by the service.
      # Check the spelling and input requirements, and then try again.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
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
