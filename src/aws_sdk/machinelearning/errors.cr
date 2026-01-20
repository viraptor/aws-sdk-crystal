module AwsSdk
  module MachineLearning
    module Errors
      class ServiceError < Exception
      end

      # A second request to use or change an object was not allowed. This can result from retrying a request
      # using a parameter that was not present in the original request.

      class IdempotentParameterMismatchException < ServiceError
      end

      # An error on the server occurred when trying to process a request.

      class InternalServerException < ServiceError
      end

      # An error on the client occurred. Typically, the cause is an invalid input value.

      class InvalidInputException < ServiceError
      end


      class InvalidTagException < ServiceError
      end

      # The subscriber exceeded the maximum number of operations. This exception can occur when listing
      # objects such as DataSource .

      class LimitExceededException < ServiceError
      end

      # The exception is thrown when a predict request is made to an unmounted MLModel .

      class PredictorNotMountedException < ServiceError
      end

      # A specified resource cannot be located.

      class ResourceNotFoundException < ServiceError
      end


      class TagLimitExceededException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "InvalidTagException"
          InvalidTagException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "PredictorNotMountedException"
          PredictorNotMountedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TagLimitExceededException"
          TagLimitExceededException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
