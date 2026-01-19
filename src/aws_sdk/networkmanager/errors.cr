module AwsSdk
  module NetworkManager
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # There was a conflict processing the request. Updating or deleting the resource can cause an
      # inconsistent state.
      class ConflictException < ServiceError
      end

      # Describes a core network policy exception.
      class CoreNetworkPolicyException < ServiceError
      end

      # The request has failed due to an internal error.
      class InternalServerException < ServiceError
      end

      # The specified resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # A service limit was exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "CoreNetworkPolicyException"
          CoreNetworkPolicyException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
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
