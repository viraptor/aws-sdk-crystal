module Aws
  module RedshiftData
    module Errors
      class ServiceError < Exception
      end

      # The Amazon Redshift Data API operation failed because the maximum number of active sessions
      # exceeded.

      class ActiveSessionsExceededException < ServiceError
      end

      # The number of active statements exceeds the limit.

      class ActiveStatementsExceededException < ServiceError
      end

      # An SQL statement encountered an environmental error while running.

      class BatchExecuteStatementException < ServiceError
      end

      # Connection to a database failed.

      class DatabaseConnectionException < ServiceError
      end

      # The SQL statement encountered an environmental error while running.

      class ExecuteStatementException < ServiceError
      end

      # The Amazon Redshift Data API operation failed due to invalid input.

      class InternalServerException < ServiceError
      end

      # The Amazon Redshift Data API operation failed due to timeout.

      class QueryTimeoutException < ServiceError
      end

      # The Amazon Redshift Data API operation failed due to a missing resource.

      class ResourceNotFoundException < ServiceError
      end

      # The Amazon Redshift Data API operation failed due to invalid input.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ActiveSessionsExceededException"
          ActiveSessionsExceededException.new(message)
        when "ActiveStatementsExceededException"
          ActiveStatementsExceededException.new(message)
        when "BatchExecuteStatementException"
          BatchExecuteStatementException.new(message)
        when "DatabaseConnectionException"
          DatabaseConnectionException.new(message)
        when "ExecuteStatementException"
          ExecuteStatementException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "QueryTimeoutException"
          QueryTimeoutException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
