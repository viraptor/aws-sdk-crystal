module AwsSdk
  module SupportApp
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permission to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Your request has a conflict. For example, you might receive this error if you try the following:
      # Add, update, or delete a Slack channel configuration before you add a Slack workspace to your Amazon
      # Web Services account. Add a Slack channel configuration that already exists in your Amazon Web
      # Services account. Delete a Slack channel configuration for a live chat channel. Delete a Slack
      # workspace from your Amazon Web Services account that has an active live chat channel. Call the
      # RegisterSlackWorkspaceForOrganization API from an Amazon Web Services account that doesn't belong to
      # an organization. Call the RegisterSlackWorkspaceForOrganization API from a member account, but the
      # management account hasn't registered that workspace yet for the organization.

      class ConflictException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class InternalServerException < ServiceError
      end

      # The specified resource is missing or doesn't exist, such as an account alias, Slack channel
      # configuration, or Slack workspace configuration.

      class ResourceNotFoundException < ServiceError
      end

      # Your Service Quotas request exceeds the quota for the service. For example, your Service Quotas
      # request to Amazon Web Services Support App might exceed the maximum number of workspaces or channels
      # per account, or the maximum number of accounts per Slack channel.

      class ServiceQuotaExceededException < ServiceError
      end

      # Your request input doesn't meet the constraints that the Amazon Web Services Support App specifies.

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
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
