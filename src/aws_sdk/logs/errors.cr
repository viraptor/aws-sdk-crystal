module AwsSdk
  module CloudWatchLogs
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permissions to perform this action.
      class AccessDeniedException < ServiceError
      end

      # This operation attempted to create a resource that already exists.
      class ConflictException < ServiceError
      end

      # The event was already logged. PutLogEvents actions are now always accepted and never return
      # DataAlreadyAcceptedException regardless of whether a given batch of log events has already been
      # accepted.
      class DataAlreadyAcceptedException < ServiceError
      end

      # An internal server error occurred while processing the request. This exception is returned when the
      # service encounters an unexpected condition that prevents it from fulfilling the request.
      class InternalServerException < ServiceError
      end

      # An internal error occurred during the streaming of log data. This exception is thrown when there's
      # an issue with the internal streaming mechanism used by the GetLogObject operation.
      class InternalStreamingException < ServiceError
      end

      # The operation is not valid on the specified resource.
      class InvalidOperationException < ServiceError
      end

      # A parameter is specified incorrectly.
      class InvalidParameterException < ServiceError
      end

      # The sequence token is not valid. You can get the correct sequence token in the expectedSequenceToken
      # field in the InvalidSequenceTokenException message. PutLogEvents actions are now always accepted and
      # never return InvalidSequenceTokenException regardless of receiving an invalid sequence token.
      class InvalidSequenceTokenException < ServiceError
      end

      # You have reached the maximum number of resources that can be created.
      class LimitExceededException < ServiceError
      end

      # The query string is not valid. Details about this error are displayed in a QueryCompileError object.
      # For more information, see QueryCompileError . For more information about valid query syntax, see
      # CloudWatch Logs Insights Query Syntax .
      class MalformedQueryException < ServiceError
      end

      # Multiple concurrent requests to update the same resource were in conflict.
      class OperationAbortedException < ServiceError
      end

      # The specified resource already exists.
      class ResourceAlreadyExistsException < ServiceError
      end

      # The specified resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # This request exceeds a service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The service cannot complete the request.
      class ServiceUnavailableException < ServiceError
      end

      # This exception is returned if an unknown error occurs during a Live Tail session.
      class SessionStreamingException < ServiceError
      end

      # This exception is returned in a Live Tail stream when the Live Tail session times out. Live Tail
      # sessions time out after three hours.
      class SessionTimeoutException < ServiceError
      end

      # The request was throttled because of quota limits.
      class ThrottlingException < ServiceError
      end

      # A resource can have no more than 50 tags.
      class TooManyTagsException < ServiceError
      end

      # The most likely cause is an Amazon Web Services access key ID or secret key that's not valid.
      class UnrecognizedClientException < ServiceError
      end

      # One of the parameters for the request is not valid.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DataAlreadyAcceptedException"
          DataAlreadyAcceptedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InternalStreamingException"
          InternalStreamingException.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidSequenceTokenException"
          InvalidSequenceTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MalformedQueryException"
          MalformedQueryException.new(message)
        when "OperationAbortedException"
          OperationAbortedException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "SessionStreamingException"
          SessionStreamingException.new(message)
        when "SessionTimeoutException"
          SessionTimeoutException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnrecognizedClientException"
          UnrecognizedClientException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
