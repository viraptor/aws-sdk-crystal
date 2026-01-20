module Aws
  module BedrockRuntime
    module Errors
      class ServiceError < Exception
      end

      # The request is denied because you do not have sufficient permissions to perform the requested
      # action. For troubleshooting this error, see AccessDeniedException in the Amazon Bedrock User Guide

      class AccessDeniedException < ServiceError
      end

      # Error occurred because of a conflict while performing an operation.

      class ConflictException < ServiceError
      end

      # An internal server error occurred. For troubleshooting this error, see InternalFailure in the Amazon
      # Bedrock User Guide

      class InternalServerException < ServiceError
      end

      # The request failed due to an error while processing the model.

      class ModelErrorException < ServiceError
      end

      # The model specified in the request is not ready to serve inference requests. The AWS SDK will
      # automatically retry the operation up to 5 times. For information about configuring automatic
      # retries, see Retry behavior in the AWS SDKs and Tools reference guide.

      class ModelNotReadyException < ServiceError
      end

      # An error occurred while streaming the response. Retry your request.

      class ModelStreamErrorException < ServiceError
      end

      # The request took too long to process. Processing time exceeded the model timeout length.

      class ModelTimeoutException < ServiceError
      end

      # The specified resource ARN was not found. For troubleshooting this error, see ResourceNotFound in
      # the Amazon Bedrock User Guide

      class ResourceNotFoundException < ServiceError
      end

      # Your request exceeds the service quota for your account. You can view your quotas at Viewing service
      # quotas . You can resubmit your request later.

      class ServiceQuotaExceededException < ServiceError
      end

      # The service isn't currently available. For troubleshooting this error, see ServiceUnavailable in the
      # Amazon Bedrock User Guide

      class ServiceUnavailableException < ServiceError
      end

      # Your request was denied due to exceeding the account quotas for Amazon Bedrock . For troubleshooting
      # this error, see ThrottlingException in the Amazon Bedrock User Guide

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by Amazon Bedrock . For troubleshooting this
      # error, see ValidationError in the Amazon Bedrock User Guide

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
        when "ModelErrorException"
          ModelErrorException.new(message)
        when "ModelNotReadyException"
          ModelNotReadyException.new(message)
        when "ModelStreamErrorException"
          ModelStreamErrorException.new(message)
        when "ModelTimeoutException"
          ModelTimeoutException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
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
