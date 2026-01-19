module AwsSdk
  module MPA
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action. Check your permissions, and try again.
      class AccessDeniedException < ServiceError
      end

      # The request cannot be completed because it conflicts with the current state of a resource.
      class ConflictException < ServiceError
      end

      # The service encountered an internal error. Try your request again. If the problem persists, contact
      # Amazon Web Services Support.
      class InternalServerException < ServiceError
      end

      # The request contains an invalid parameter value.
      class InvalidParameterException < ServiceError
      end

      # The specified resource doesn't exist. Check the resource ID, and try again.
      class ResourceNotFoundException < ServiceError
      end

      # The request exceeds the service quota for your account. Request a quota increase or reduce your
      # request size.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The request exceeds the maximum number of tags allowed for this resource. Remove some tags, and try
      # again.
      class TooManyTagsException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
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
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
