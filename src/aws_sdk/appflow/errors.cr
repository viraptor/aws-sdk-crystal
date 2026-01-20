module AwsSdk
  module Appflow
    module Errors
      class ServiceError < Exception
      end

      # AppFlow/Requester has invalid or missing permissions.

      class AccessDeniedException < ServiceError
      end

      # There was a conflict when processing the request (for example, a flow with the given name already
      # exists within the account. Check for conflicting resource names and try again.

      class ConflictException < ServiceError
      end

      # An error occurred when authenticating with the connector endpoint.

      class ConnectorAuthenticationException < ServiceError
      end

      # An error occurred when retrieving data from the connector endpoint.

      class ConnectorServerException < ServiceError
      end

      # An internal service error occurred during the processing of your request. Try again later.

      class InternalServerException < ServiceError
      end

      # The resource specified in the request (such as the source or destination connector profile) is not
      # found.

      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service quota (such as the number of flows) to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # API calls have exceeded the maximum allowed API request rate per account and per Region.

      class ThrottlingException < ServiceError
      end

      # The requested operation is not supported for the current flow.

      class UnsupportedOperationException < ServiceError
      end

      # The request has invalid or missing parameters.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ConnectorAuthenticationException"
          ConnectorAuthenticationException.new(message)
        when "ConnectorServerException"
          ConnectorServerException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
