module AwsSdk
  module SsmSap
    module Errors
      class ServiceError < Exception
      end

      # A conflict has occurred.
      class ConflictException < ServiceError
      end

      # An internal error has occurred.
      class InternalServerException < ServiceError
      end

      # The resource is not available.
      class ResourceNotFoundException < ServiceError
      end

      # The request is not authorized.
      class UnauthorizedException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an AWS service.
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
