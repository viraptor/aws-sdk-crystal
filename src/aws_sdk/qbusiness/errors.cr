module AwsSdk
  module QBusiness
    module Errors
      class ServiceError < Exception
      end

      # You don't have access to perform this action. Make sure you have the required permission policies
      # and user accounts and try again.
      class AccessDeniedException < ServiceError
      end

      # You are trying to perform an action that conflicts with the current status of your resource. Fix any
      # inconsistencies with your resources and try again.
      class ConflictException < ServiceError
      end

      # An external resource that you configured with your application is returning errors and preventing
      # this operation from succeeding. Fix those errors and try again.
      class ExternalResourceException < ServiceError
      end

      # An issue occurred with the internal server used for your Amazon Q Business service. Wait some
      # minutes and try again, or contact Support for help.
      class InternalServerException < ServiceError
      end

      # You don't have permissions to perform the action because your license is inactive. Ask your admin to
      # activate your license and try again after your licence is active.
      class LicenseNotFoundException < ServiceError
      end

      # The requested media object is too large to be returned.
      class MediaTooLargeException < ServiceError
      end

      # The application or plugin resource you want to use doesn’t exist. Make sure you have provided the
      # correct resource and try again.
      class ResourceNotFoundException < ServiceError
      end

      # You have exceeded the set limits for your Amazon Q Business service.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to throttling. Reduce the number of requests and try again.
      class ThrottlingException < ServiceError
      end

      # The input doesn't meet the constraints set by the Amazon Q Business service. Provide the correct
      # input and try again.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ExternalResourceException"
          ExternalResourceException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "LicenseNotFoundException"
          LicenseNotFoundException.new(message)
        when "MediaTooLargeException"
          MediaTooLargeException.new(message)
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
