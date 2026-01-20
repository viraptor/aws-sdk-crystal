module Aws
  module RDSData
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # There is an error in the call or in a SQL statement. (This error only appears in calls from Aurora
      # Serverless v1 databases.)

      class BadRequestException < ServiceError
      end

      # There was an error in processing the SQL statement.

      class DatabaseErrorException < ServiceError
      end

      # The DB cluster doesn't have a DB instance.

      class DatabaseNotFoundException < ServiceError
      end

      # A request was cancelled because the Aurora Serverless v2 DB instance was paused. The Data API
      # request automatically resumes the DB instance. Wait a few seconds and try again.

      class DatabaseResumingException < ServiceError
      end

      # The writer instance in the DB cluster isn't available.

      class DatabaseUnavailableException < ServiceError
      end

      # There are insufficient privileges to make the call.

      class ForbiddenException < ServiceError
      end

      # The HTTP endpoint for using RDS Data API isn't enabled for the DB cluster.

      class HttpEndpointNotEnabledException < ServiceError
      end

      # An internal error occurred.

      class InternalServerErrorException < ServiceError
      end

      # The resource is in an invalid state.

      class InvalidResourceStateException < ServiceError
      end

      # The Secrets Manager secret used with the request isn't valid.

      class InvalidSecretException < ServiceError
      end

      # The resourceArn , secretArn , or transactionId value can't be found.

      class NotFoundException < ServiceError
      end

      # There was a problem with the Secrets Manager secret used with the request, caused by one of the
      # following conditions: RDS Data API timed out retrieving the secret. The secret provided wasn't
      # found. The secret couldn't be decrypted.

      class SecretsErrorException < ServiceError
      end

      # The service specified by the resourceArn parameter isn't available.

      class ServiceUnavailableError < ServiceError
      end

      # The execution of the SQL statement timed out.

      class StatementTimeoutException < ServiceError
      end

      # The transaction ID wasn't found.

      class TransactionNotFoundException < ServiceError
      end

      # There was a problem with the result because of one of the following conditions: It contained an
      # unsupported data type. It contained a multidimensional array. The size was too large.

      class UnsupportedResultException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "DatabaseErrorException"
          DatabaseErrorException.new(message)
        when "DatabaseNotFoundException"
          DatabaseNotFoundException.new(message)
        when "DatabaseResumingException"
          DatabaseResumingException.new(message)
        when "DatabaseUnavailableException"
          DatabaseUnavailableException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "HttpEndpointNotEnabledException"
          HttpEndpointNotEnabledException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "InvalidResourceStateException"
          InvalidResourceStateException.new(message)
        when "InvalidSecretException"
          InvalidSecretException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "SecretsErrorException"
          SecretsErrorException.new(message)
        when "ServiceUnavailableError"
          ServiceUnavailableError.new(message)
        when "StatementTimeoutException"
          StatementTimeoutException.new(message)
        when "TransactionNotFoundException"
          TransactionNotFoundException.new(message)
        when "UnsupportedResultException"
          UnsupportedResultException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
