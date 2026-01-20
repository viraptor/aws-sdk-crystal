module Aws
  module Chatbot
    module Errors
      class ServiceError < Exception
      end

      # There was an issue processing your request.

      class ConflictException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class CreateChimeWebhookConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class CreateSlackChannelConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class CreateTeamsChannelConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DeleteChimeWebhookConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DeleteMicrosoftTeamsUserIdentityException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DeleteSlackChannelConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DeleteSlackUserIdentityException < ServiceError
      end

      # There was an issue deleting your Slack workspace.

      class DeleteSlackWorkspaceAuthorizationFault < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DeleteTeamsChannelConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DeleteTeamsConfiguredTeamException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DescribeChimeWebhookConfigurationsException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DescribeSlackChannelConfigurationsException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DescribeSlackUserIdentitiesException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class DescribeSlackWorkspacesException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class GetAccountPreferencesException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class GetTeamsChannelConfigurationException < ServiceError
      end

      # Unexpected error during processing of request.

      class InternalServiceError < ServiceError
      end

      # Your request input doesn't meet the constraints required by AWS Chatbot.

      class InvalidParameterException < ServiceError
      end

      # Your request input doesn't meet the constraints required by AWS Chatbot.

      class InvalidRequestException < ServiceError
      end

      # You have exceeded a service limit for AWS Chatbot.

      class LimitExceededException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class ListMicrosoftTeamsConfiguredTeamsException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class ListMicrosoftTeamsUserIdentitiesException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class ListTeamsChannelConfigurationsException < ServiceError
      end

      # We were unable to find the resource for your request

      class ResourceNotFoundException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class ServiceUnavailableException < ServiceError
      end

      # The supplied list of tags contains too many tags.

      class TooManyTagsException < ServiceError
      end

      # The request was rejected because it doesn't have valid credentials for the target resource.

      class UnauthorizedException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class UpdateAccountPreferencesException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class UpdateChimeWebhookConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class UpdateSlackChannelConfigurationException < ServiceError
      end

      # We can’t process your request right now because of a server issue. Try again later.

      class UpdateTeamsChannelConfigurationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "CreateChimeWebhookConfigurationException"
          CreateChimeWebhookConfigurationException.new(message)
        when "CreateSlackChannelConfigurationException"
          CreateSlackChannelConfigurationException.new(message)
        when "CreateTeamsChannelConfigurationException"
          CreateTeamsChannelConfigurationException.new(message)
        when "DeleteChimeWebhookConfigurationException"
          DeleteChimeWebhookConfigurationException.new(message)
        when "DeleteMicrosoftTeamsUserIdentityException"
          DeleteMicrosoftTeamsUserIdentityException.new(message)
        when "DeleteSlackChannelConfigurationException"
          DeleteSlackChannelConfigurationException.new(message)
        when "DeleteSlackUserIdentityException"
          DeleteSlackUserIdentityException.new(message)
        when "DeleteSlackWorkspaceAuthorizationFault"
          DeleteSlackWorkspaceAuthorizationFault.new(message)
        when "DeleteTeamsChannelConfigurationException"
          DeleteTeamsChannelConfigurationException.new(message)
        when "DeleteTeamsConfiguredTeamException"
          DeleteTeamsConfiguredTeamException.new(message)
        when "DescribeChimeWebhookConfigurationsException"
          DescribeChimeWebhookConfigurationsException.new(message)
        when "DescribeSlackChannelConfigurationsException"
          DescribeSlackChannelConfigurationsException.new(message)
        when "DescribeSlackUserIdentitiesException"
          DescribeSlackUserIdentitiesException.new(message)
        when "DescribeSlackWorkspacesException"
          DescribeSlackWorkspacesException.new(message)
        when "GetAccountPreferencesException"
          GetAccountPreferencesException.new(message)
        when "GetTeamsChannelConfigurationException"
          GetTeamsChannelConfigurationException.new(message)
        when "InternalServiceError"
          InternalServiceError.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ListMicrosoftTeamsConfiguredTeamsException"
          ListMicrosoftTeamsConfiguredTeamsException.new(message)
        when "ListMicrosoftTeamsUserIdentitiesException"
          ListMicrosoftTeamsUserIdentitiesException.new(message)
        when "ListTeamsChannelConfigurationsException"
          ListTeamsChannelConfigurationsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "UpdateAccountPreferencesException"
          UpdateAccountPreferencesException.new(message)
        when "UpdateChimeWebhookConfigurationException"
          UpdateChimeWebhookConfigurationException.new(message)
        when "UpdateSlackChannelConfigurationException"
          UpdateSlackChannelConfigurationException.new(message)
        when "UpdateTeamsChannelConfigurationException"
          UpdateTeamsChannelConfigurationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
