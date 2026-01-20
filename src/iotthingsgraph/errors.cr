module Aws
  module IoTThingsGraph
    module Errors
      class ServiceError < Exception
      end


      class InternalFailureException < ServiceError
      end


      class InvalidRequestException < ServiceError
      end


      class LimitExceededException < ServiceError
      end


      class ResourceAlreadyExistsException < ServiceError
      end


      class ResourceInUseException < ServiceError
      end


      class ResourceNotFoundException < ServiceError
      end


      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
