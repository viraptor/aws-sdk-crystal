module Aws
  module LexRuntimeService
    module Errors
      class ServiceError < Exception
      end

      # Either the Amazon Lex bot is still building, or one of the dependent services (Amazon Polly, AWS
      # Lambda) failed with an internal service error.

      class BadGatewayException < ServiceError
      end

      # Request validation failed, there is no usable message in the context, or the bot build failed, is
      # still in progress, or contains unbuilt changes.

      class BadRequestException < ServiceError
      end

      # Two clients are using the same AWS account, Amazon Lex bot, and user ID.

      class ConflictException < ServiceError
      end

      # One of the dependencies, such as AWS Lambda or Amazon Polly, threw an exception. For example, If
      # Amazon Lex does not have sufficient permissions to call a Lambda function. If a Lambda function
      # takes longer than 30 seconds to execute. If a fulfillment Lambda function returns a Delegate dialog
      # action without removing any slot values.

      class DependencyFailedException < ServiceError
      end

      # Internal service error. Retry the call.

      class InternalFailureException < ServiceError
      end

      # Exceeded a limit.

      class LimitExceededException < ServiceError
      end

      # This exception is not used.

      class LoopDetectedException < ServiceError
      end

      # The accept header in the request does not have a valid value.

      class NotAcceptableException < ServiceError
      end

      # The resource (such as the Amazon Lex bot or an alias) that is referred to is not found.

      class NotFoundException < ServiceError
      end

      # The input speech is too long.

      class RequestTimeoutException < ServiceError
      end

      # The Content-Type header ( PostContent API) has an invalid value.

      class UnsupportedMediaTypeException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadGatewayException"
          BadGatewayException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DependencyFailedException"
          DependencyFailedException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "LoopDetectedException"
          LoopDetectedException.new(message)
        when "NotAcceptableException"
          NotAcceptableException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "RequestTimeoutException"
          RequestTimeoutException.new(message)
        when "UnsupportedMediaTypeException"
          UnsupportedMediaTypeException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
