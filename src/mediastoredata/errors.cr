module Aws
  module MediaStoreData
    module Errors
      class ServiceError < Exception
      end

      # The specified container was not found for the specified account.

      class ContainerNotFoundException < ServiceError
      end

      # The service is temporarily unavailable.

      class InternalServerError < ServiceError
      end

      # Could not perform an operation on an object that does not exist.

      class ObjectNotFoundException < ServiceError
      end

      # The requested content range is not valid.

      class RequestedRangeNotSatisfiableException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ContainerNotFoundException"
          ContainerNotFoundException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "ObjectNotFoundException"
          ObjectNotFoundException.new(message)
        when "RequestedRangeNotSatisfiableException"
          RequestedRangeNotSatisfiableException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
