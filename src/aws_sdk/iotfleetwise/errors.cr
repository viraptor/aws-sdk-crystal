module AwsSdk
  module IoTFleetWise
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permission to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.
      class ConflictException < ServiceError
      end

      # The request couldn't be completed because it contains signal decoders with one or more validation
      # errors.
      class DecoderManifestValidationException < ServiceError
      end

      # The request couldn't be completed because the server temporarily failed.
      class InternalServerException < ServiceError
      end

      # The specified node type doesn't match the expected node type for a node. You can specify the node
      # type as branch, sensor, actuator, or attribute.
      class InvalidNodeException < ServiceError
      end

      # The request couldn't be completed because it contains signals that aren't valid.
      class InvalidSignalsException < ServiceError
      end

      # A service quota was exceeded.
      class LimitExceededException < ServiceError
      end

      # The resource wasn't found.
      class ResourceNotFoundException < ServiceError
      end

      # The request couldn't be completed due to throttling.
      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DecoderManifestValidationException"
          DecoderManifestValidationException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidNodeException"
          InvalidNodeException.new(message)
        when "InvalidSignalsException"
          InvalidSignalsException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
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
