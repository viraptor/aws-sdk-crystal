module AwsSdk
  module AppSync
    module Errors
      class ServiceError < Exception
      end

      # You don't have access to perform this operation on this resource.

      class AccessDeniedException < ServiceError
      end

      # The API key exceeded a limit. Try your request again.

      class ApiKeyLimitExceededException < ServiceError
      end

      # The API key expiration must be set to a value between 1 and 365 days from creation (for CreateApiKey
      # ) or from update (for UpdateApiKey ).

      class ApiKeyValidityOutOfBoundsException < ServiceError
      end

      # The GraphQL API exceeded a limit. Try your request again.

      class ApiLimitExceededException < ServiceError
      end

      # The request is not well formed. For example, a value is invalid or a required field is missing.
      # Check the field values, and then try again.

      class BadRequestException < ServiceError
      end

      # Another modification is in progress at this time and it must complete before you can make your
      # change.

      class ConcurrentModificationException < ServiceError
      end

      # A conflict with a previous successful update is detected. This typically occurs when the previous
      # update did not have time to propagate before the next update was made. A retry (with appropriate
      # backoff logic) is the recommended response to this exception.

      class ConflictException < ServiceError
      end

      # The GraphQL schema is not valid.

      class GraphQLSchemaException < ServiceError
      end

      # An internal AppSync error occurred. Try your request again.

      class InternalFailureException < ServiceError
      end

      # The request exceeded a limit. Try your request again.

      class LimitExceededException < ServiceError
      end

      # The resource specified in the request was not found. Check the resource, and then try again.

      class NotFoundException < ServiceError
      end

      # The operation exceeded the service quota for this resource.

      class ServiceQuotaExceededException < ServiceError
      end

      # You aren't authorized to perform this operation.

      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ApiKeyLimitExceededException"
          ApiKeyLimitExceededException.new(message)
        when "ApiKeyValidityOutOfBoundsException"
          ApiKeyValidityOutOfBoundsException.new(message)
        when "ApiLimitExceededException"
          ApiLimitExceededException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "GraphQLSchemaException"
          GraphQLSchemaException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
