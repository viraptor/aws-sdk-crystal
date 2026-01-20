module Aws
  module IoTSecureTunneling
    module Errors
      class ServiceError < Exception
      end

      # Thrown when a tunnel limit is exceeded.

      class LimitExceededException < ServiceError
      end

      # Thrown when an operation is attempted on a resource that does not exist.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
