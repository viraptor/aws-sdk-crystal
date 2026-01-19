module AwsSdk
  module PersonalizeEvents
    module Errors
      class ServiceError < Exception
      end

      # Provide a valid value for the field or parameter.
      class InvalidInputException < ServiceError
      end

      # The specified resource is in use.
      class ResourceInUseException < ServiceError
      end

      # Could not find the specified resource.
      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
