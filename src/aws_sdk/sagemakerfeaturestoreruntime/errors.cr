module AwsSdk
  module SageMakerFeatureStoreRuntime
    module Errors
      class ServiceError < Exception
      end

      # You do not have permission to perform an action.

      class AccessForbidden < ServiceError
      end

      # An internal failure occurred. Try your request again. If the problem persists, contact Amazon Web
      # Services customer support.

      class InternalFailure < ServiceError
      end

      # A resource that is required to perform an action was not found.

      class ResourceNotFound < ServiceError
      end

      # The service is currently unavailable.

      class ServiceUnavailable < ServiceError
      end

      # There was an error validating your request.

      class ValidationError < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessForbidden"
          AccessForbidden.new(message)
        when "InternalFailure"
          InternalFailure.new(message)
        when "ResourceNotFound"
          ResourceNotFound.new(message)
        when "ServiceUnavailable"
          ServiceUnavailable.new(message)
        when "ValidationError"
          ValidationError.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
