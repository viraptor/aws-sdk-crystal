module AwsSdk
  module ResourceExplorer2
    module Errors
      class ServiceError < Exception
      end

      # The credentials that you used to call this operation don't have the minimum required permissions.
      class AccessDeniedException < ServiceError
      end

      # If you attempted to create a view, then the request failed because either you specified parameters
      # that didn’t match the original request, or you attempted to create a view with a name that already
      # exists in this Amazon Web Services Region. If you attempted to create an index, then the request
      # failed because either you specified parameters that didn't match the original request, or an index
      # already exists in the current Amazon Web Services Region. If you attempted to update an index type
      # to AGGREGATOR , then the request failed because you already have an AGGREGATOR index in a different
      # Amazon Web Services Region.
      class ConflictException < ServiceError
      end

      # The request failed because of internal service error. Try your request again later.
      class InternalServerException < ServiceError
      end

      # You specified a resource that doesn't exist. Check the ID or ARN that you used to identity the
      # resource, and try again.
      class ResourceNotFoundException < ServiceError
      end

      # The request failed because it exceeds a service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request failed because you exceeded a rate limit for this operation. For more information, see
      # Quotas for Resource Explorer .
      class ThrottlingException < ServiceError
      end

      # The principal making the request isn't permitted to perform the operation.
      class UnauthorizedException < ServiceError
      end

      # You provided an invalid value for one of the operation's parameters. Check the syntax for the
      # operation, and try again.
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
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
