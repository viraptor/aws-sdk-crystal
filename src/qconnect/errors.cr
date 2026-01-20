module Aws
  module QConnect
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request could not be processed because of conflict in the current state of the resource. For
      # example, if you're using a Create API (such as CreateAssistant ) that accepts name, a conflicting
      # resource (usually with the same name) is being created or mutated.

      class ConflictException < ServiceError
      end

      # The request failed because it depends on another request that failed.

      class DependencyFailedException < ServiceError
      end

      # The provided revisionId does not match, indicating the content has been modified since it was last
      # read.

      class PreconditionFailedException < ServiceError
      end

      # The request reached the service more than 15 minutes after the date stamp on the request or more
      # than 15 minutes after the request expiration date (such as for pre-signed URLs), or the date stamp
      # on the request is more than 15 minutes in the future.

      class RequestTimeoutException < ServiceError
      end

      # The specified resource does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # You've exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use service quotas to request a service quota increase.

      class ServiceQuotaExceededException < ServiceError
      end

      # The throttling limit has been exceeded.

      class ThrottlingException < ServiceError
      end

      # Amazon Q in Connect throws this exception if you have too many tags in your tag set.

      class TooManyTagsException < ServiceError
      end

      # You do not have permission to perform this action.

      class UnauthorizedException < ServiceError
      end

      # The server has a failure of processing the message

      class UnprocessableContentException < ServiceError
      end

      # The input fails to satisfy the constraints specified by a service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DependencyFailedException"
          DependencyFailedException.new(message)
        when "PreconditionFailedException"
          PreconditionFailedException.new(message)
        when "RequestTimeoutException"
          RequestTimeoutException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "UnprocessableContentException"
          UnprocessableContentException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
