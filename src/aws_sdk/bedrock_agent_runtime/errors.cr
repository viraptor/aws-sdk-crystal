module AwsSdk
  module BedrockAgentRuntime
    module Errors
      class ServiceError < Exception
      end

      # The request is denied because of missing access permissions. Check your permissions and retry your
      # request.
      class AccessDeniedException < ServiceError
      end

      # There was an issue with a dependency due to a server issue. Retry your request.
      class BadGatewayException < ServiceError
      end

      # There was a conflict performing an operation. Resolve the conflict and retry your request.
      class ConflictException < ServiceError
      end

      # There was an issue with a dependency. Check the resource configurations and retry the request.
      class DependencyFailedException < ServiceError
      end

      # An internal server error occurred. Retry your request.
      class InternalServerException < ServiceError
      end

      # The model specified in the request is not ready to serve inference requests. The AWS SDK will
      # automatically retry the operation up to 5 times. For information about configuring automatic
      # retries, see Retry behavior in the AWS SDKs and Tools reference guide.
      class ModelNotReadyException < ServiceError
      end

      # The specified resource Amazon Resource Name (ARN) was not found. Check the Amazon Resource Name
      # (ARN) and try your request again.
      class ResourceNotFoundException < ServiceError
      end

      # The number of requests exceeds the service quota. Resubmit your request later.
      class ServiceQuotaExceededException < ServiceError
      end

      # The number of requests exceeds the limit. Resubmit your request later.
      class ThrottlingException < ServiceError
      end

      # Input validation failed. Check your request parameters and retry the request.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadGatewayException"
          BadGatewayException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DependencyFailedException"
          DependencyFailedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ModelNotReadyException"
          ModelNotReadyException.new(message)
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
