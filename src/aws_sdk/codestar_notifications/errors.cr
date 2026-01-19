module AwsSdk
  module CodestarNotifications
    module Errors
      class ServiceError < Exception
      end

      # CodeStar Notifications can't create the notification rule because you do not have sufficient
      # permissions.
      class AccessDeniedException < ServiceError
      end

      # CodeStar Notifications can't complete the request because the resource is being modified by another
      # process. Wait a few minutes and try again.
      class ConcurrentModificationException < ServiceError
      end

      # Some or all of the configuration is incomplete, missing, or not valid.
      class ConfigurationException < ServiceError
      end

      # The value for the enumeration token used in the request to return the next batch of the results is
      # not valid.
      class InvalidNextTokenException < ServiceError
      end

      # One of the CodeStar Notifications limits has been exceeded. Limits apply to accounts, notification
      # rules, notifications, resources, and targets. For more information, see Limits.
      class LimitExceededException < ServiceError
      end

      # A resource with the same name or ID already exists. Notification rule names must be unique in your
      # Amazon Web Services account.
      class ResourceAlreadyExistsException < ServiceError
      end

      # CodeStar Notifications can't find a resource that matches the provided ARN.
      class ResourceNotFoundException < ServiceError
      end

      # One or more parameter values are not valid.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConfigurationException"
          ConfigurationException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
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
