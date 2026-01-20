module AwsSdk
  module Neptunedata
    module Errors
      class ServiceError < Exception
      end

      # Raised in case of an authentication or authorization failure.

      class AccessDeniedException < ServiceError
      end

      # Raised when a request is submitted that cannot be processed.

      class BadRequestException < ServiceError
      end

      # Raised when a specified bulk-load job ID cannot be found.

      class BulkLoadIdNotFoundException < ServiceError
      end

      # Raised when a user cancelled a request.

      class CancelledByUserException < ServiceError
      end

      # Raised when a request timed out in the client.

      class ClientTimeoutException < ServiceError
      end

      # Raised when a request attempts to modify data that is concurrently being modified by another
      # process.

      class ConcurrentModificationException < ServiceError
      end

      # Raised when a value in a request field did not satisfy required constraints.

      class ConstraintViolationException < ServiceError
      end

      # Raised when a request attempts to access an stream that has expired.

      class ExpiredStreamException < ServiceError
      end

      # Raised when a request fails.

      class FailureByQueryException < ServiceError
      end

      # Raised when an argument in a request is not supported.

      class IllegalArgumentException < ServiceError
      end

      # Raised when the processing of the request failed unexpectedly.

      class InternalFailureException < ServiceError
      end

      # Raised when an argument in a request has an invalid value.

      class InvalidArgumentException < ServiceError
      end

      # Raised when invalid numerical data is encountered when servicing a request.

      class InvalidNumericDataException < ServiceError
      end

      # Raised when a parameter value is not valid.

      class InvalidParameterException < ServiceError
      end

      # Raised when access is denied to a specified load URL.

      class LoadUrlAccessDeniedException < ServiceError
      end

      # Raised when a specified machine-learning resource could not be found.

      class MLResourceNotFoundException < ServiceError
      end

      # Raised when a query is submitted that is syntactically incorrect or does not pass additional
      # validation.

      class MalformedQueryException < ServiceError
      end

      # Raised when a request fails because of insufficient memory resources. The request can be retried.

      class MemoryLimitExceededException < ServiceError
      end

      # Raised when the HTTP method used by a request is not supported by the endpoint being used.

      class MethodNotAllowedException < ServiceError
      end

      # Raised when a required parameter is missing.

      class MissingParameterException < ServiceError
      end

      # Raised when a parsing issue is encountered.

      class ParsingException < ServiceError
      end

      # Raised when a precondition for processing a request is not satisfied.

      class PreconditionsFailedException < ServiceError
      end

      # Raised when the number of active queries exceeds what the server can process. The query in question
      # can be retried when the system is less busy.

      class QueryLimitExceededException < ServiceError
      end

      # Raised when the size of a query exceeds the system limit.

      class QueryLimitException < ServiceError
      end

      # Raised when the body of a query is too large.

      class QueryTooLargeException < ServiceError
      end

      # Raised when a request attempts to write to a read-only resource.

      class ReadOnlyViolationException < ServiceError
      end

      # Raised when there is a problem accessing Amazon S3.

      class S3Exception < ServiceError
      end

      # Raised when the server shuts down while processing a request.

      class ServerShutdownException < ServiceError
      end

      # Raised when statistics needed to satisfy a request are not available.

      class StatisticsNotAvailableException < ServiceError
      end

      # Raised when stream records requested by a query cannot be found.

      class StreamRecordsNotFoundException < ServiceError
      end

      # Raised when the rate of requests exceeds the maximum throughput. Requests can be retried after
      # encountering this exception.

      class ThrottlingException < ServiceError
      end

      # Raised when the an operation exceeds the time limit allowed for it.

      class TimeLimitExceededException < ServiceError
      end

      # Raised when the number of requests being processed exceeds the limit.

      class TooManyRequestsException < ServiceError
      end

      # Raised when a request attempts to initiate an operation that is not supported.

      class UnsupportedOperationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "BulkLoadIdNotFoundException"
          BulkLoadIdNotFoundException.new(message)
        when "CancelledByUserException"
          CancelledByUserException.new(message)
        when "ClientTimeoutException"
          ClientTimeoutException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConstraintViolationException"
          ConstraintViolationException.new(message)
        when "ExpiredStreamException"
          ExpiredStreamException.new(message)
        when "FailureByQueryException"
          FailureByQueryException.new(message)
        when "IllegalArgumentException"
          IllegalArgumentException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidNumericDataException"
          InvalidNumericDataException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "LoadUrlAccessDeniedException"
          LoadUrlAccessDeniedException.new(message)
        when "MLResourceNotFoundException"
          MLResourceNotFoundException.new(message)
        when "MalformedQueryException"
          MalformedQueryException.new(message)
        when "MemoryLimitExceededException"
          MemoryLimitExceededException.new(message)
        when "MethodNotAllowedException"
          MethodNotAllowedException.new(message)
        when "MissingParameterException"
          MissingParameterException.new(message)
        when "ParsingException"
          ParsingException.new(message)
        when "PreconditionsFailedException"
          PreconditionsFailedException.new(message)
        when "QueryLimitExceededException"
          QueryLimitExceededException.new(message)
        when "QueryLimitException"
          QueryLimitException.new(message)
        when "QueryTooLargeException"
          QueryTooLargeException.new(message)
        when "ReadOnlyViolationException"
          ReadOnlyViolationException.new(message)
        when "S3Exception"
          S3Exception.new(message)
        when "ServerShutdownException"
          ServerShutdownException.new(message)
        when "StatisticsNotAvailableException"
          StatisticsNotAvailableException.new(message)
        when "StreamRecordsNotFoundException"
          StreamRecordsNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TimeLimitExceededException"
          TimeLimitExceededException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
