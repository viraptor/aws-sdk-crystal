module AwsSdk
  module DataZone
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # There is a conflict while performing this action.

      class ConflictException < ServiceError
      end

      # The request has failed because of an unknown error, exception or failure.

      class InternalServerException < ServiceError
      end

      # The specified resource cannot be found.

      class ResourceNotFoundException < ServiceError
      end

      # The request has exceeded the specified service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # You do not have permission to perform this action.

      class UnauthorizedException < ServiceError
      end

      # The input fails to satisfy the constraints specified by the Amazon Web Services service.

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
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
