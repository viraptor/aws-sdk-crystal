module AwsSdk
  module FraudDetector
    module Errors
      class ServiceError < Exception
      end

      # An exception indicating Amazon Fraud Detector does not have the needed permissions. This can occur
      # if you submit a request, such as PutExternalModel , that specifies a role that is not in your
      # account.
      class AccessDeniedException < ServiceError
      end

      # An exception indicating there was a conflict during a delete operation.
      class ConflictException < ServiceError
      end

      # An exception indicating an internal server error.
      class InternalServerException < ServiceError
      end

      # An exception indicating the specified resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # An exception indicating that the attached customer-owned (external) model threw an exception when
      # Amazon Fraud Detector invoked the model.
      class ResourceUnavailableException < ServiceError
      end

      # An exception indicating a throttling error.
      class ThrottlingException < ServiceError
      end

      # An exception indicating a specified value is not allowed.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
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
