module AwsSdk
  module PartnerCentralSelling
    module Errors
      class ServiceError < Exception
      end

      # This error occurs when you don't have permission to perform the requested action. You don’t have
      # access to this action or resource. Review IAM policies or contact your AWS administrator for
      # assistance.

      class AccessDeniedException < ServiceError
      end

      # This error occurs when the request can’t be processed due to a conflict with the target resource's
      # current state, which could result from updating or deleting the resource. Suggested action: Fetch
      # the latest state of the resource, verify the state, and retry the request.

      class ConflictException < ServiceError
      end

      # This error occurs when the specified resource can’t be found or doesn't exist. Resource ID and type
      # might be incorrect. Suggested action: This is usually a transient error. Retry after the provided
      # retry delay or a short interval. If the problem persists, contact AWS support.

      class InternalServerException < ServiceError
      end

      # This error occurs when the specified resource can't be found. The resource might not exist, or isn't
      # visible with the current credentials. Suggested action: Verify that the resource ID is correct and
      # the resource is in the expected AWS region. Check IAM permissions for accessing the resource.

      class ResourceNotFoundException < ServiceError
      end

      # This error occurs when the request would cause a service quota to be exceeded. Service quotas
      # represent the maximum allowed use of a specific resource, and this error indicates that the request
      # would surpass that limit. Suggested action: Review the Quotas for the resource, and either reduce
      # usage or request a quota increase.

      class ServiceQuotaExceededException < ServiceError
      end

      # This error occurs when there are too many requests sent. Review the provided quotas and adapt your
      # usage to avoid throttling. This error occurs when there are too many requests sent. Review the
      # provided Quotas and retry after the provided delay.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by the service or business validation rules.
      # Suggested action: Review the error message, including the failed fields and reasons, to correct the
      # request payload.

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
