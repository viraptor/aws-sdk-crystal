module AwsSdk
  module Wisdom
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

      # Amazon Connect Wisdom throws this exception if you have too many tags in your tag set.
      class TooManyTagsException < ServiceError
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
        when "PreconditionFailedException"
          PreconditionFailedException.new(message)
        when "RequestTimeoutException"
          RequestTimeoutException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
