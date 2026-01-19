module AwsSdk
  module PartnerCentralAccount
    module Errors
      class ServiceError < Exception
      end

      # The request was denied due to insufficient permissions. The caller does not have the required
      # permissions to perform this operation.
      class AccessDeniedException < ServiceError
      end

      # The request could not be completed due to a conflict with the current state of the resource. This
      # typically occurs when trying to create a resource that already exists or modify a resource that has
      # been changed by another process.
      class ConflictException < ServiceError
      end

      # An internal server error occurred while processing the request. This is typically a temporary
      # condition and the request may be retried.
      class InternalServerException < ServiceError
      end

      # The specified resource could not be found. This may occur when referencing a resource that does not
      # exist or has been deleted.
      class ResourceNotFoundException < ServiceError
      end

      # The request was rejected because it would exceed a service quota or limit. This may occur when
      # trying to create more resources than allowed by the service limits.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled due to too many requests being sent in a short period of time. The client
      # should implement exponential backoff and retry the request.
      class ThrottlingException < ServiceError
      end

      # The request failed validation. One or more input parameters are invalid, missing, or do not meet the
      # required format or constraints.
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
