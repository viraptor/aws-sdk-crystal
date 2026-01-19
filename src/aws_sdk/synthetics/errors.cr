module AwsSdk
  module Synthetics
    module Errors
      class ServiceError < Exception
      end

      # You don't have permission to perform this operation on this resource.
      class AccessDeniedException < ServiceError
      end

      # The request was not valid.
      class BadRequestException < ServiceError
      end

      # A conflicting operation is already in progress.
      class ConflictException < ServiceError
      end

      # An internal failure occurred. Try the operation again.
      class InternalFailureException < ServiceError
      end

      # An unknown internal error occurred.
      class InternalServerException < ServiceError
      end

      # The specified resource was not found.
      class NotFoundException < ServiceError
      end

      # One of the input resources is larger than is allowed.
      class RequestEntityTooLargeException < ServiceError
      end

      # One of the specified resources was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request exceeded a service quota value.
      class ServiceQuotaExceededException < ServiceError
      end

      # There were too many simultaneous requests. Try the operation again.
      class TooManyRequestsException < ServiceError
      end

      # A parameter could not be validated.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "RequestEntityTooLargeException"
          RequestEntityTooLargeException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
