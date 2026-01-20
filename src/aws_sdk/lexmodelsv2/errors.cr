module AwsSdk
  module LexModelsV2
    module Errors
      class ServiceError < Exception
      end

      # The action that you tried to perform couldn't be completed because the resource is in a conflicting
      # state. For example, deleting a bot that is in the CREATING state. Try your request again.

      class ConflictException < ServiceError
      end

      # The service encountered an unexpected condition. Try your request again.

      class InternalServerException < ServiceError
      end

      # Your request couldn't be completed because one or more request fields aren't valid. Check the fields
      # in your request and try again.

      class PreconditionFailedException < ServiceError
      end

      # You asked to describe a resource that doesn't exist. Check the resource that you are requesting and
      # try again.

      class ResourceNotFoundException < ServiceError
      end

      # You have reached a quota for your bot.

      class ServiceQuotaExceededException < ServiceError
      end

      # Your request rate is too high. Reduce the frequency of requests.

      class ThrottlingException < ServiceError
      end

      # One of the input parameters in your request isn't valid. Check the parameters and try your request
      # again.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "PreconditionFailedException"
          PreconditionFailedException.new(message)
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
