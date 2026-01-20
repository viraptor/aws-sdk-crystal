module Aws
  module GroundStation
    module Errors
      class ServiceError < Exception
      end

      # Dependency encountered an error.

      class DependencyException < ServiceError
      end

      # One or more parameters are not valid.

      class InvalidParameterException < ServiceError
      end

      # The specified resource is in use by non-terminal state contacts and cannot be modified or deleted.

      class ResourceInUseException < ServiceError
      end

      # Account limits for this resource have been exceeded.

      class ResourceLimitExceededException < ServiceError
      end

      # Resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # Request would cause a service quota to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DependencyException"
          DependencyException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
