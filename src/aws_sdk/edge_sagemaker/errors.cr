module AwsSdk
  module SagemakerEdge
    module Errors
      class ServiceError < Exception
      end

      # An internal failure occurred. Try your request again. If the problem persists, contact Amazon Web
      # Services customer support.
      class InternalServiceException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServiceException"
          InternalServiceException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
