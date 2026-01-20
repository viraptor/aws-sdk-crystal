module Aws
  module Route53Resolver
    module Errors
      class ServiceError < Exception
      end

      # The current account doesn't have the IAM permissions required to perform the specified Resolver
      # operation. This error can also be thrown when a customer has reached the 5120 character limit for a
      # resource policy for CloudWatch Logs.

      class AccessDeniedException < ServiceError
      end

      # The requested state transition isn't valid. For example, you can't delete a firewall domain list if
      # it is in the process of being deleted, or you can't import domains into a domain list that is in the
      # process of being deleted.

      class ConflictException < ServiceError
      end

      # We encountered an unknown error. Try again in a few minutes.

      class InternalServiceErrorException < ServiceError
      end

      # The value that you specified for NextToken in a List request isn't valid.

      class InvalidNextTokenException < ServiceError
      end

      # One or more parameters in this request are not valid.

      class InvalidParameterException < ServiceError
      end

      # The specified Resolver rule policy is invalid.

      class InvalidPolicyDocument < ServiceError
      end

      # The request is invalid.

      class InvalidRequestException < ServiceError
      end

      # The specified tag is invalid.

      class InvalidTagException < ServiceError
      end

      # The request caused one or more limits to be exceeded.

      class LimitExceededException < ServiceError
      end

      # The resource that you tried to create already exists.

      class ResourceExistsException < ServiceError
      end

      # The resource that you tried to update or delete is currently in use.

      class ResourceInUseException < ServiceError
      end

      # The specified resource doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The specified resource isn't available.

      class ResourceUnavailableException < ServiceError
      end

      # Fulfilling the request would cause one or more quotas to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled. Try again in a few minutes.

      class ThrottlingException < ServiceError
      end

      # The specified resource doesn't exist.

      class UnknownResourceException < ServiceError
      end

      # You have provided an invalid command. If you ran the UpdateFirewallDomains request. supported values
      # are ADD , REMOVE , or REPLACE a domain.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidPolicyDocument"
          InvalidPolicyDocument.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidTagException"
          InvalidTagException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceExistsException"
          ResourceExistsException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnknownResourceException"
          UnknownResourceException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
