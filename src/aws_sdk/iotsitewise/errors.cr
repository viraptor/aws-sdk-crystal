module AwsSdk
  module IoTSiteWise
    module Errors
      class ServiceError < Exception
      end

      # Access is denied.
      class AccessDeniedException < ServiceError
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.
      class ConflictingOperationException < ServiceError
      end

      # IoT SiteWise can't process your request right now. Try again later.
      class InternalFailureException < ServiceError
      end

      # The request isn't valid. This can occur if your request contains malformed JSON or unsupported
      # characters. Check your request and try again.
      class InvalidRequestException < ServiceError
      end

      # You've reached the quota for a resource. For example, this can occur if you're trying to associate
      # more than the allowed number of child assets or attempting to create more than the allowed number of
      # properties for an asset model. For more information, see Quotas in the IoT SiteWise User Guide .
      class LimitExceededException < ServiceError
      end

      # The precondition in one or more of the request-header fields evaluated to FALSE .
      class PreconditionFailedException < ServiceError
      end

      # The query timed out.
      class QueryTimeoutException < ServiceError
      end

      # The resource already exists.
      class ResourceAlreadyExistsException < ServiceError
      end

      # The requested resource can't be found.
      class ResourceNotFoundException < ServiceError
      end

      # The requested service is unavailable.
      class ServiceUnavailableException < ServiceError
      end

      # Your request exceeded a rate limit. For example, you might have exceeded the number of IoT SiteWise
      # assets that can be created per second, the allowed number of messages per second, and so on. For
      # more information, see Quotas in the IoT SiteWise User Guide .
      class ThrottlingException < ServiceError
      end

      # You've reached the quota for the number of tags allowed for a resource. For more information, see
      # Tag naming limits and requirements in the Amazon Web Services General Reference .
      class TooManyTagsException < ServiceError
      end

      # You are not authorized.
      class UnauthorizedException < ServiceError
      end

      # The validation failed for this query.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictingOperationException"
          ConflictingOperationException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "PreconditionFailedException"
          PreconditionFailedException.new(message)
        when "QueryTimeoutException"
          QueryTimeoutException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
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
