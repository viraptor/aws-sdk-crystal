module AwsSdk
  module PcaConnectorAd
    module Errors
      class ServiceError < Exception
      end

      # You can receive this error if you attempt to create a resource share when you don't have the
      # required permissions. This can be caused by insufficient permissions in policies attached to your
      # Amazon Web Services Identity and Access Management (IAM) principal. It can also happen because of
      # restrictions in place from an Amazon Web Services Organizations service control policy (SCP) that
      # affects your Amazon Web Services account.
      class AccessDeniedException < ServiceError
      end

      # This request cannot be completed for one of the following reasons because the requested resource was
      # being concurrently modified by another request.
      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure with an internal
      # server.
      class InternalServerException < ServiceError
      end

      # The operation tried to access a nonexistent resource. The resource might not be specified correctly,
      # or its status might not be ACTIVE.
      class ResourceNotFoundException < ServiceError
      end

      # Request would cause a service quota to be exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # The limit on the number of requests per second was exceeded.
      class ThrottlingException < ServiceError
      end

      # An input validation error occurred. For example, invalid characters in a template name, or if a
      # pagination token is invalid.
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
