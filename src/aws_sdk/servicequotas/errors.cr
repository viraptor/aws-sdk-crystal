module AwsSdk
  module ServiceQuotas
    module Errors
      class ServiceError < Exception
      end

      # The action you attempted is not allowed unless Service Access with Service Quotas is enabled in your
      # organization.
      class AWSServiceAccessNotEnabledException < ServiceError
      end

      # You do not have sufficient permission to perform this action.
      class AccessDeniedException < ServiceError
      end

      # You can't perform this action because a dependency does not have access.
      class DependencyAccessDeniedException < ServiceError
      end

      # Invalid input was provided.
      class IllegalArgumentException < ServiceError
      end

      # Invalid input was provided.
      class InvalidPaginationTokenException < ServiceError
      end

      # The resource is in an invalid state.
      class InvalidResourceStateException < ServiceError
      end

      # The Amazon Web Services account making this call is not a member of an organization.
      class NoAvailableOrganizationException < ServiceError
      end

      # The specified resource does not exist.
      class NoSuchResourceException < ServiceError
      end

      # The organization that your Amazon Web Services account belongs to is not in All Features mode.
      class OrganizationNotInAllFeaturesModeException < ServiceError
      end

      # You have exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use Service Quotas to request a service quota increase.
      class QuotaExceededException < ServiceError
      end

      # The specified resource already exists.
      class ResourceAlreadyExistsException < ServiceError
      end

      # Something went wrong.
      class ServiceException < ServiceError
      end

      # The quota request template is not associated with your organization.
      class ServiceQuotaTemplateNotInUseException < ServiceError
      end

      # The specified tag is a reserved word and cannot be used.
      class TagPolicyViolationException < ServiceError
      end

      # The Service Quotas template is not available in this Amazon Web Services Region.
      class TemplatesNotAvailableInRegionException < ServiceError
      end

      # Due to throttling, the request was denied. Slow down the rate of request calls, or request an
      # increase for this quota.
      class TooManyRequestsException < ServiceError
      end

      # You've exceeded the number of tags allowed for a resource. For more information, see Tag
      # restrictions in the Service Quotas User Guide .
      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AWSServiceAccessNotEnabledException"
          AWSServiceAccessNotEnabledException.new(message)
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "DependencyAccessDeniedException"
          DependencyAccessDeniedException.new(message)
        when "IllegalArgumentException"
          IllegalArgumentException.new(message)
        when "InvalidPaginationTokenException"
          InvalidPaginationTokenException.new(message)
        when "InvalidResourceStateException"
          InvalidResourceStateException.new(message)
        when "NoAvailableOrganizationException"
          NoAvailableOrganizationException.new(message)
        when "NoSuchResourceException"
          NoSuchResourceException.new(message)
        when "OrganizationNotInAllFeaturesModeException"
          OrganizationNotInAllFeaturesModeException.new(message)
        when "QuotaExceededException"
          QuotaExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "ServiceQuotaTemplateNotInUseException"
          ServiceQuotaTemplateNotInUseException.new(message)
        when "TagPolicyViolationException"
          TagPolicyViolationException.new(message)
        when "TemplatesNotAvailableInRegionException"
          TemplatesNotAvailableInRegionException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
