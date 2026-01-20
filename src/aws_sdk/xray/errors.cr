module AwsSdk
  module XRay
    module Errors
      class ServiceError < Exception
      end

      # A policy revision id was provided which does not match the latest policy revision. This exception is
      # also if a policy revision id of 0 is provided via PutResourcePolicy and a policy with the same name
      # already exists.

      class InvalidPolicyRevisionIdException < ServiceError
      end

      # The request is missing required parameters or has invalid parameters.

      class InvalidRequestException < ServiceError
      end

      # The provided resource policy would prevent the caller of this request from calling PutResourcePolicy
      # in the future.

      class LockoutPreventionException < ServiceError
      end

      # Invalid policy document provided in request.

      class MalformedPolicyDocumentException < ServiceError
      end

      # Exceeded the maximum number of resource policies for a target Amazon Web Services account.

      class PolicyCountLimitExceededException < ServiceError
      end

      # Exceeded the maximum size for a resource policy.

      class PolicySizeLimitExceededException < ServiceError
      end

      # The resource was not found. Verify that the name or Amazon Resource Name (ARN) of the resource is
      # correct.

      class ResourceNotFoundException < ServiceError
      end

      # You have reached the maximum number of sampling rules.

      class RuleLimitExceededException < ServiceError
      end

      # The request exceeds the maximum number of requests per second.

      class ThrottledException < ServiceError
      end

      # You have exceeded the maximum number of tags you can apply to this resource.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InvalidPolicyRevisionIdException"
          InvalidPolicyRevisionIdException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LockoutPreventionException"
          LockoutPreventionException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "PolicyCountLimitExceededException"
          PolicyCountLimitExceededException.new(message)
        when "PolicySizeLimitExceededException"
          PolicySizeLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "RuleLimitExceededException"
          RuleLimitExceededException.new(message)
        when "ThrottledException"
          ThrottledException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
