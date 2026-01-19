module AwsSdk
  module Rbin
    module Errors
      class ServiceError < Exception
      end

      # The specified retention rule lock request can't be completed.
      class ConflictException < ServiceError
      end

      # The service could not respond to the request due to an internal problem.
      class InternalServerException < ServiceError
      end

      # The specified resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service quota for the number of tags per resource to be exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # One or more of the parameters in the request is not valid.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
