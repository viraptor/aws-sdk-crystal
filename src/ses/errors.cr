module Aws
  module SES
    module Errors
      class ServiceError < Exception
      end

      # Indicates that email sending is disabled for your entire Amazon SES account. You can enable or
      # disable email sending for your Amazon SES account using UpdateAccountSendingEnabled .

      class AccountSendingPausedException < ServiceError
      end

      # Indicates that a resource could not be created because of a naming conflict.

      class AlreadyExistsException < ServiceError
      end

      # Indicates that the delete operation could not be completed.

      class CannotDeleteException < ServiceError
      end

      # Indicates that the configuration set could not be created because of a naming conflict.

      class ConfigurationSetAlreadyExistsException < ServiceError
      end

      # Indicates that the configuration set does not exist.

      class ConfigurationSetDoesNotExistException < ServiceError
      end

      # Indicates that email sending is disabled for the configuration set. You can enable or disable email
      # sending for a configuration set using UpdateConfigurationSetSendingEnabled .

      class ConfigurationSetSendingPausedException < ServiceError
      end

      # Indicates that custom verification email template provided content is invalid.

      class CustomVerificationEmailInvalidContentException < ServiceError
      end

      # Indicates that a custom verification email template with the name you specified already exists.

      class CustomVerificationEmailTemplateAlreadyExistsException < ServiceError
      end

      # Indicates that a custom verification email template with the name you specified does not exist.

      class CustomVerificationEmailTemplateDoesNotExistException < ServiceError
      end

      # Indicates that the event destination could not be created because of a naming conflict.

      class EventDestinationAlreadyExistsException < ServiceError
      end

      # Indicates that the event destination does not exist.

      class EventDestinationDoesNotExistException < ServiceError
      end

      # Indicates that the sender address specified for a custom verification email is not verified, and is
      # therefore not eligible to send the custom verification email.

      class FromEmailAddressNotVerifiedException < ServiceError
      end

      # Indicates that the Amazon CloudWatch destination is invalid. See the error message for details.

      class InvalidCloudWatchDestinationException < ServiceError
      end

      # Indicates that the configuration set is invalid. See the error message for details.

      class InvalidConfigurationSetException < ServiceError
      end

      # Indicates that provided delivery option is invalid.

      class InvalidDeliveryOptionsException < ServiceError
      end

      # Indicates that the Amazon Kinesis Firehose destination is invalid. See the error message for
      # details.

      class InvalidFirehoseDestinationException < ServiceError
      end

      # Indicates that the provided Amazon Web Services Lambda function is invalid, or that Amazon SES could
      # not execute the provided function, possibly due to permissions issues. For information about giving
      # permissions, see the Amazon SES Developer Guide .

      class InvalidLambdaFunctionException < ServiceError
      end

      # Indicates that the provided policy is invalid. Check the error stack for more information about what
      # caused the error.

      class InvalidPolicyException < ServiceError
      end

      # Indicates that one or more of the replacement values you provided is invalid. This error may occur
      # when the TemplateData object contains invalid JSON.

      class InvalidRenderingParameterException < ServiceError
      end

      # Indicates that the provided Amazon S3 bucket or Amazon Web Services KMS encryption key is invalid,
      # or that Amazon SES could not publish to the bucket, possibly due to permissions issues. For
      # information about giving permissions, see the Amazon SES Developer Guide .

      class InvalidS3ConfigurationException < ServiceError
      end

      # Indicates that the Amazon Simple Notification Service (Amazon SNS) destination is invalid. See the
      # error message for details.

      class InvalidSNSDestinationException < ServiceError
      end

      # Indicates that the provided Amazon SNS topic is invalid, or that Amazon SES could not publish to the
      # topic, possibly due to permissions issues. For information about giving permissions, see the Amazon
      # SES Developer Guide .

      class InvalidSnsTopicException < ServiceError
      end

      # Indicates that the template that you specified could not be rendered. This issue may occur when a
      # template refers to a partial that does not exist.

      class InvalidTemplateException < ServiceError
      end

      # Indicates that the custom domain to be used for open and click tracking redirects is invalid. This
      # error appears most often in the following situations: When the tracking domain you specified is not
      # verified in Amazon SES. When the tracking domain you specified is not a valid domain or subdomain.

      class InvalidTrackingOptionsException < ServiceError
      end

      # Indicates that a resource could not be created because of service limits. For a list of Amazon SES
      # limits, see the Amazon SES Developer Guide .

      class LimitExceededException < ServiceError
      end

      # Indicates that the message could not be sent because Amazon SES could not read the MX record
      # required to use the specified MAIL FROM domain. For information about editing the custom MAIL FROM
      # domain settings for an identity, see the Amazon SES Developer Guide .

      class MailFromDomainNotVerifiedException < ServiceError
      end

      # Indicates that the action failed, and the message could not be sent. Check the error stack for more
      # information about what caused the error.

      class MessageRejected < ServiceError
      end

      # Indicates that one or more of the replacement values for the specified template was not specified.
      # Ensure that the TemplateData object contains references to all of the replacement tags in the
      # specified template.

      class MissingRenderingAttributeException < ServiceError
      end

      # Indicates that the account has not been granted production access.

      class ProductionAccessNotGrantedException < ServiceError
      end

      # Indicates that the provided receipt rule does not exist.

      class RuleDoesNotExistException < ServiceError
      end

      # Indicates that the provided receipt rule set does not exist.

      class RuleSetDoesNotExistException < ServiceError
      end

      # Indicates that the Template object you specified does not exist in your Amazon SES account.

      class TemplateDoesNotExistException < ServiceError
      end

      # Indicates that the configuration set you specified already contains a TrackingOptions object.

      class TrackingOptionsAlreadyExistsException < ServiceError
      end

      # Indicates that the TrackingOptions object you specified does not exist.

      class TrackingOptionsDoesNotExistException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccountSendingPausedException"
          AccountSendingPausedException.new(message)
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "CannotDeleteException"
          CannotDeleteException.new(message)
        when "ConfigurationSetAlreadyExistsException"
          ConfigurationSetAlreadyExistsException.new(message)
        when "ConfigurationSetDoesNotExistException"
          ConfigurationSetDoesNotExistException.new(message)
        when "ConfigurationSetSendingPausedException"
          ConfigurationSetSendingPausedException.new(message)
        when "CustomVerificationEmailInvalidContentException"
          CustomVerificationEmailInvalidContentException.new(message)
        when "CustomVerificationEmailTemplateAlreadyExistsException"
          CustomVerificationEmailTemplateAlreadyExistsException.new(message)
        when "CustomVerificationEmailTemplateDoesNotExistException"
          CustomVerificationEmailTemplateDoesNotExistException.new(message)
        when "EventDestinationAlreadyExistsException"
          EventDestinationAlreadyExistsException.new(message)
        when "EventDestinationDoesNotExistException"
          EventDestinationDoesNotExistException.new(message)
        when "FromEmailAddressNotVerifiedException"
          FromEmailAddressNotVerifiedException.new(message)
        when "InvalidCloudWatchDestinationException"
          InvalidCloudWatchDestinationException.new(message)
        when "InvalidConfigurationSetException"
          InvalidConfigurationSetException.new(message)
        when "InvalidDeliveryOptionsException"
          InvalidDeliveryOptionsException.new(message)
        when "InvalidFirehoseDestinationException"
          InvalidFirehoseDestinationException.new(message)
        when "InvalidLambdaFunctionException"
          InvalidLambdaFunctionException.new(message)
        when "InvalidPolicyException"
          InvalidPolicyException.new(message)
        when "InvalidRenderingParameterException"
          InvalidRenderingParameterException.new(message)
        when "InvalidS3ConfigurationException"
          InvalidS3ConfigurationException.new(message)
        when "InvalidSNSDestinationException"
          InvalidSNSDestinationException.new(message)
        when "InvalidSnsTopicException"
          InvalidSnsTopicException.new(message)
        when "InvalidTemplateException"
          InvalidTemplateException.new(message)
        when "InvalidTrackingOptionsException"
          InvalidTrackingOptionsException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MailFromDomainNotVerifiedException"
          MailFromDomainNotVerifiedException.new(message)
        when "MessageRejected"
          MessageRejected.new(message)
        when "MissingRenderingAttributeException"
          MissingRenderingAttributeException.new(message)
        when "ProductionAccessNotGrantedException"
          ProductionAccessNotGrantedException.new(message)
        when "RuleDoesNotExistException"
          RuleDoesNotExistException.new(message)
        when "RuleSetDoesNotExistException"
          RuleSetDoesNotExistException.new(message)
        when "TemplateDoesNotExistException"
          TemplateDoesNotExistException.new(message)
        when "TrackingOptionsAlreadyExistsException"
          TrackingOptionsAlreadyExistsException.new(message)
        when "TrackingOptionsDoesNotExistException"
          TrackingOptionsDoesNotExistException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
