require "json"
require "time"

module AwsSdk
  module SES
    module Types

      # Indicates that email sending is disabled for your entire Amazon SES account. You can enable or
      # disable email sending for your Amazon SES account using UpdateAccountSendingEnabled .

      struct AccountSendingPausedException
        include JSON::Serializable

        def initialize
        end
      end

      # When included in a receipt rule, this action adds a header to the received email. For information
      # about adding a header using a receipt rule, see the Amazon SES Developer Guide .

      struct AddHeaderAction
        include JSON::Serializable

        # The name of the header to add to the incoming message. The name must contain at least one character,
        # and can contain up to 50 characters. It consists of alphanumeric (a–z, A–Z, 0–9) characters and
        # dashes.

        @[JSON::Field(key: "HeaderName")]
        getter header_name : String

        # The content to include in the header. This value can contain up to 2048 characters. It can't contain
        # newline ( \n ) or carriage return ( \r ) characters.

        @[JSON::Field(key: "HeaderValue")]
        getter header_value : String

        def initialize(
          @header_name : String,
          @header_value : String
        )
        end
      end

      # Indicates that a resource could not be created because of a naming conflict.

      struct AlreadyExistsException
        include JSON::Serializable

        # Indicates that a resource could not be created because the resource name already exists.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Represents the body of the message. You can specify text, HTML, or both. If you use both, then the
      # message should display correctly in the widest variety of email clients.

      struct Body
        include JSON::Serializable

        # The content of the message, in HTML format. Use this for email clients that can process HTML. You
        # can include clickable links, formatted text, and much more in an HTML message.

        @[JSON::Field(key: "Html")]
        getter html : Types::Content?

        # The content of the message, in text format. Use this for text-based email clients, or clients on
        # high-latency networks (such as mobile devices).

        @[JSON::Field(key: "Text")]
        getter text : Types::Content?

        def initialize(
          @html : Types::Content? = nil,
          @text : Types::Content? = nil
        )
        end
      end

      # When included in a receipt rule, this action rejects the received email by returning a bounce
      # response to the sender and, optionally, publishes a notification to Amazon Simple Notification
      # Service (Amazon SNS). For information about sending a bounce message in response to a received
      # email, see the Amazon SES Developer Guide .

      struct BounceAction
        include JSON::Serializable

        # Human-readable text to include in the bounce message.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The email address of the sender of the bounced email. This is the address from which the bounce
        # message is sent.

        @[JSON::Field(key: "Sender")]
        getter sender : String

        # The SMTP reply code, as defined by RFC 5321 .

        @[JSON::Field(key: "SmtpReplyCode")]
        getter smtp_reply_code : String

        # The SMTP enhanced status code, as defined by RFC 3463 .

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the bounce action is taken.
        # You can find the ARN of a topic by using the ListTopics operation in Amazon SNS. For more
        # information about Amazon SNS topics, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @message : String,
          @sender : String,
          @smtp_reply_code : String,
          @status_code : String? = nil,
          @topic_arn : String? = nil
        )
        end
      end

      # Recipient-related information to include in the Delivery Status Notification (DSN) when an email
      # that Amazon SES receives on your behalf bounces. For information about receiving email through
      # Amazon SES, see the Amazon SES Developer Guide .

      struct BouncedRecipientInfo
        include JSON::Serializable

        # The email address of the recipient of the bounced email.

        @[JSON::Field(key: "Recipient")]
        getter recipient : String

        # The reason for the bounce. You must provide either this parameter or RecipientDsnFields .

        @[JSON::Field(key: "BounceType")]
        getter bounce_type : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to receive email for the recipient
        # of the bounced email. For more information about sending authorization, see the Amazon SES Developer
        # Guide .

        @[JSON::Field(key: "RecipientArn")]
        getter recipient_arn : String?

        # Recipient-related DSN fields, most of which would normally be filled in automatically when provided
        # with a BounceType . You must provide either this parameter or BounceType .

        @[JSON::Field(key: "RecipientDsnFields")]
        getter recipient_dsn_fields : Types::RecipientDsnFields?

        def initialize(
          @recipient : String,
          @bounce_type : String? = nil,
          @recipient_arn : String? = nil,
          @recipient_dsn_fields : Types::RecipientDsnFields? = nil
        )
        end
      end

      # An array that contains one or more Destinations, as well as the tags and replacement data associated
      # with each of those Destinations.

      struct BulkEmailDestination
        include JSON::Serializable


        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using
        # SendBulkTemplatedEmail . Tags correspond to characteristics of the email that you define, so that
        # you can publish email sending events.

        @[JSON::Field(key: "ReplacementTags")]
        getter replacement_tags : Array(Types::MessageTag)?

        # A list of replacement values to apply to the template. This parameter is a JSON object, typically
        # consisting of key-value pairs in which the keys correspond to replacement tags in the email
        # template.

        @[JSON::Field(key: "ReplacementTemplateData")]
        getter replacement_template_data : String?

        def initialize(
          @destination : Types::Destination,
          @replacement_tags : Array(Types::MessageTag)? = nil,
          @replacement_template_data : String? = nil
        )
        end
      end

      # An object that contains the response from the SendBulkTemplatedEmail operation.

      struct BulkEmailDestinationStatus
        include JSON::Serializable

        # A description of an error that prevented a message being sent using the SendBulkTemplatedEmail
        # operation.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # The unique message identifier returned from the SendBulkTemplatedEmail operation.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The status of a message sent using the SendBulkTemplatedEmail operation. Possible values for this
        # parameter include: Success : Amazon SES accepted the message, and attempts to deliver it to the
        # recipients. MessageRejected : The message was rejected because it contained a virus.
        # MailFromDomainNotVerified : The sender's email address or domain was not verified.
        # ConfigurationSetDoesNotExist : The configuration set you specified does not exist.
        # TemplateDoesNotExist : The template you specified does not exist. AccountSuspended : Your account
        # has been shut down because of issues related to your email sending practices. AccountThrottled : The
        # number of emails you can send has been reduced because your account has exceeded its allocated
        # sending limit. AccountDailyQuotaExceeded : You have reached or exceeded the maximum number of emails
        # you can send from your account in a 24-hour period. InvalidSendingPoolName : The configuration set
        # you specified refers to an IP pool that does not exist. AccountSendingPaused : Email sending for the
        # Amazon SES account was disabled using the UpdateAccountSendingEnabled operation.
        # ConfigurationSetSendingPaused : Email sending for this configuration set was disabled using the
        # UpdateConfigurationSetSendingEnabled operation. InvalidParameterValue : One or more of the
        # parameters you specified when calling this operation was invalid. See the error message for
        # additional information. TransientFailure : Amazon SES was unable to process your request because of
        # a temporary issue. Failed : Amazon SES was unable to process your request. See the error message for
        # additional information.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @error : String? = nil,
          @message_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Indicates that the delete operation could not be completed.

      struct CannotDeleteException
        include JSON::Serializable

        # Indicates that a resource could not be deleted because no resource with the specified name exists.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Represents a request to create a receipt rule set by cloning an existing one. You use receipt rule
      # sets to receive email with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct CloneReceiptRuleSetRequest
        include JSON::Serializable

        # The name of the rule set to clone.

        @[JSON::Field(key: "OriginalRuleSetName")]
        getter original_rule_set_name : String

        # The name of the rule set to create. The name must meet the following requirements: Contain only
        # ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). Start and end with a letter
        # or number. Contain 64 characters or fewer.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @original_rule_set_name : String,
          @rule_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct CloneReceiptRuleSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information associated with an Amazon CloudWatch event destination to which email sending
      # events are published. Event destinations, such as Amazon CloudWatch, are associated with
      # configuration sets, which enable you to publish email sending events. For information about using
      # configuration sets, see the Amazon SES Developer Guide .

      struct CloudWatchDestination
        include JSON::Serializable

        # A list of dimensions upon which to categorize your emails when you publish email sending events to
        # Amazon CloudWatch.

        @[JSON::Field(key: "DimensionConfigurations")]
        getter dimension_configurations : Array(Types::CloudWatchDimensionConfiguration)

        def initialize(
          @dimension_configurations : Array(Types::CloudWatchDimensionConfiguration)
        )
        end
      end

      # Contains the dimension configuration to use when you publish email sending events to Amazon
      # CloudWatch. For information about publishing email sending events to Amazon CloudWatch, see the
      # Amazon SES Developer Guide .

      struct CloudWatchDimensionConfiguration
        include JSON::Serializable

        # The default value of the dimension that is published to Amazon CloudWatch if you do not provide the
        # value of the dimension when you send an email. The default value must meet the following
        # requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), dashes (-), at
        # signs (@), or periods (.). Contain 256 characters or fewer.

        @[JSON::Field(key: "DefaultDimensionValue")]
        getter default_dimension_value : String

        # The name of an Amazon CloudWatch dimension associated with an email sending metric. The name must
        # meet the following requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores
        # (_), dashes (-), or colons (:). Contain 256 characters or fewer.

        @[JSON::Field(key: "DimensionName")]
        getter dimension_name : String

        # The place where Amazon SES finds the value of a dimension to publish to Amazon CloudWatch. To use
        # the message tags that you specify using an X-SES-MESSAGE-TAGS header or a parameter to the SendEmail
        # / SendRawEmail API, specify messageTag . To use your own email headers, specify emailHeader . To put
        # a custom tag on any link included in your email, specify linkTag .

        @[JSON::Field(key: "DimensionValueSource")]
        getter dimension_value_source : String

        def initialize(
          @default_dimension_value : String,
          @dimension_name : String,
          @dimension_value_source : String
        )
        end
      end

      # The name of the configuration set. Configuration sets let you create groups of rules that you can
      # apply to the emails you send using Amazon SES. For more information about using configuration sets,
      # see Using Amazon SES Configuration Sets in the Amazon SES Developer Guide .

      struct ConfigurationSet
        include JSON::Serializable

        # The name of the configuration set. The name must meet the following requirements: Contain only
        # letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). Contain 64 characters or fewer.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Indicates that the configuration set could not be created because of a naming conflict.

      struct ConfigurationSetAlreadyExistsException
        include JSON::Serializable

        # Indicates that the configuration set does not exist.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @configuration_set_name : String? = nil
        )
        end
      end

      # Indicates that the configuration set does not exist.

      struct ConfigurationSetDoesNotExistException
        include JSON::Serializable

        # Indicates that the configuration set does not exist.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @configuration_set_name : String? = nil
        )
        end
      end

      # Indicates that email sending is disabled for the configuration set. You can enable or disable email
      # sending for a configuration set using UpdateConfigurationSetSendingEnabled .

      struct ConfigurationSetSendingPausedException
        include JSON::Serializable

        # The name of the configuration set for which email sending is disabled.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @configuration_set_name : String? = nil
        )
        end
      end

      # When included in a receipt rule, this action parses the received message and starts an email contact
      # in Amazon Connect on your behalf. When you receive emails, the maximum email size (including
      # headers) is 40 MB. Additionally, emails may only have up to 10 attachments. Emails larger than 40 MB
      # or with more than 10 attachments will be bounced. We recommend that you configure this action via
      # Amazon Connect.

      struct ConnectAction
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role to be used by Amazon Simple Email Service while
        # starting email contacts to the Amazon Connect instance. This role should have permission to invoke
        # connect:StartEmailContact for the given Amazon Connect instance.

        @[JSON::Field(key: "IAMRoleARN")]
        getter iam_role_arn : String

        # The Amazon Resource Name (ARN) for the Amazon Connect instance that Amazon SES integrates with for
        # starting email contacts. For more information about Amazon Connect instances, see the Amazon Connect
        # Administrator Guide

        @[JSON::Field(key: "InstanceARN")]
        getter instance_arn : String

        def initialize(
          @iam_role_arn : String,
          @instance_arn : String
        )
        end
      end

      # Represents textual data, plus an optional character set specification. By default, the text must be
      # 7-bit ASCII, due to the constraints of the SMTP protocol. If the text must contain any other
      # characters, then you must also specify a character set. Examples include UTF-8, ISO-8859-1, and
      # Shift_JIS.

      struct Content
        include JSON::Serializable

        # The textual data of the content.

        @[JSON::Field(key: "Data")]
        getter data : String

        # The character set of the content.

        @[JSON::Field(key: "Charset")]
        getter charset : String?

        def initialize(
          @data : String,
          @charset : String? = nil
        )
        end
      end

      # Represents a request to create a configuration set event destination. A configuration set event
      # destination, which can be either Amazon CloudWatch or Amazon Kinesis Firehose, describes an Amazon
      # Web Services service in which Amazon SES publishes the email sending events associated with a
      # configuration set. For information about using configuration sets, see the Amazon SES Developer
      # Guide .

      struct CreateConfigurationSetEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set that the event destination should be associated with.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # An object that describes the Amazon Web Services service that email sending event where information
        # is published.

        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestination

        def initialize(
          @configuration_set_name : String,
          @event_destination : Types::EventDestination
        )
        end
      end

      # An empty element returned on a successful request.

      struct CreateConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to create a configuration set. Configuration sets enable you to publish email
      # sending events. For information about using configuration sets, see the Amazon SES Developer Guide .

      struct CreateConfigurationSetRequest
        include JSON::Serializable

        # A data structure that contains the name of the configuration set.

        @[JSON::Field(key: "ConfigurationSet")]
        getter configuration_set : Types::ConfigurationSet

        def initialize(
          @configuration_set : Types::ConfigurationSet
        )
        end
      end

      # An empty element returned on a successful request.

      struct CreateConfigurationSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to create an open and click tracking option object in a configuration set.

      struct CreateConfigurationSetTrackingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set that the tracking options should be associated with.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String


        @[JSON::Field(key: "TrackingOptions")]
        getter tracking_options : Types::TrackingOptions

        def initialize(
          @configuration_set_name : String,
          @tracking_options : Types::TrackingOptions
        )
        end
      end

      # An empty element returned on a successful request.

      struct CreateConfigurationSetTrackingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to create a custom verification email template.

      struct CreateCustomVerificationEmailTemplateRequest
        include JSON::Serializable

        # The URL that the recipient of the verification email is sent to if his or her address is not
        # successfully verified.

        @[JSON::Field(key: "FailureRedirectionURL")]
        getter failure_redirection_url : String

        # The email address that the custom verification email is sent from.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String

        # The URL that the recipient of the verification email is sent to if his or her address is
        # successfully verified.

        @[JSON::Field(key: "SuccessRedirectionURL")]
        getter success_redirection_url : String

        # The content of the custom verification email. The total size of the email must be less than 10 MB.
        # The message body may contain HTML, with some limitations. For more information, see Custom
        # Verification Email Frequently Asked Questions in the Amazon SES Developer Guide .

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : String

        # The name of the custom verification email template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The subject line of the custom verification email.

        @[JSON::Field(key: "TemplateSubject")]
        getter template_subject : String

        def initialize(
          @failure_redirection_url : String,
          @from_email_address : String,
          @success_redirection_url : String,
          @template_content : String,
          @template_name : String,
          @template_subject : String
        )
        end
      end

      # Represents a request to create a new IP address filter. You use IP address filters when you receive
      # email with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct CreateReceiptFilterRequest
        include JSON::Serializable

        # A data structure that describes the IP address filter to create, which consists of a name, an IP
        # address range, and whether to allow or block mail from it.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ReceiptFilter

        def initialize(
          @filter : Types::ReceiptFilter
        )
        end
      end

      # An empty element returned on a successful request.

      struct CreateReceiptFilterResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to create a receipt rule. You use receipt rules to receive email with Amazon
      # SES. For more information, see the Amazon SES Developer Guide .

      struct CreateReceiptRuleRequest
        include JSON::Serializable

        # A data structure that contains the specified rule's name, actions, recipients, domains, enabled
        # status, scan status, and TLS policy.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::ReceiptRule

        # The name of the rule set where the receipt rule is added.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        # The name of an existing rule after which the new rule is placed. If this parameter is null, the new
        # rule is inserted at the beginning of the rule list.

        @[JSON::Field(key: "After")]
        getter after : String?

        def initialize(
          @rule : Types::ReceiptRule,
          @rule_set_name : String,
          @after : String? = nil
        )
        end
      end

      # An empty element returned on a successful request.

      struct CreateReceiptRuleResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to create an empty receipt rule set. You use receipt rule sets to receive email
      # with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct CreateReceiptRuleSetRequest
        include JSON::Serializable

        # The name of the rule set to create. The name must meet the following requirements: Contain only
        # ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). Start and end with a letter
        # or number. Contain 64 characters or fewer.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @rule_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct CreateReceiptRuleSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to create an email template. For more information, see the Amazon SES Developer
      # Guide .

      struct CreateTemplateRequest
        include JSON::Serializable

        # The content of the email, composed of a subject line and either an HTML part or a text-only part.

        @[JSON::Field(key: "Template")]
        getter template : Types::Template

        def initialize(
          @template : Types::Template
        )
        end
      end


      struct CreateTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that custom verification email template provided content is invalid.

      struct CustomVerificationEmailInvalidContentException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a custom verification email template.

      struct CustomVerificationEmailTemplate
        include JSON::Serializable

        # The URL that the recipient of the verification email is sent to if his or her address is not
        # successfully verified.

        @[JSON::Field(key: "FailureRedirectionURL")]
        getter failure_redirection_url : String?

        # The email address that the custom verification email is sent from.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # The URL that the recipient of the verification email is sent to if his or her address is
        # successfully verified.

        @[JSON::Field(key: "SuccessRedirectionURL")]
        getter success_redirection_url : String?

        # The name of the custom verification email template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The subject line of the custom verification email.

        @[JSON::Field(key: "TemplateSubject")]
        getter template_subject : String?

        def initialize(
          @failure_redirection_url : String? = nil,
          @from_email_address : String? = nil,
          @success_redirection_url : String? = nil,
          @template_name : String? = nil,
          @template_subject : String? = nil
        )
        end
      end

      # Indicates that a custom verification email template with the name you specified already exists.

      struct CustomVerificationEmailTemplateAlreadyExistsException
        include JSON::Serializable

        # Indicates that the provided custom verification email template with the specified template name
        # already exists.

        @[JSON::Field(key: "CustomVerificationEmailTemplateName")]
        getter custom_verification_email_template_name : String?

        def initialize(
          @custom_verification_email_template_name : String? = nil
        )
        end
      end

      # Indicates that a custom verification email template with the name you specified does not exist.

      struct CustomVerificationEmailTemplateDoesNotExistException
        include JSON::Serializable

        # Indicates that the provided custom verification email template does not exist.

        @[JSON::Field(key: "CustomVerificationEmailTemplateName")]
        getter custom_verification_email_template_name : String?

        def initialize(
          @custom_verification_email_template_name : String? = nil
        )
        end
      end

      # Represents a request to delete a configuration set event destination. Configuration set event
      # destinations are associated with configuration sets, which enable you to publish email sending
      # events. For information about using configuration sets, see the Amazon SES Developer Guide .

      struct DeleteConfigurationSetEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set from which to delete the event destination.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The name of the event destination to delete.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String

        def initialize(
          @configuration_set_name : String,
          @event_destination_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete a configuration set. Configuration sets enable you to publish email
      # sending events. For information about using configuration sets, see the Amazon SES Developer Guide .

      struct DeleteConfigurationSetRequest
        include JSON::Serializable

        # The name of the configuration set to delete.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteConfigurationSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete open and click tracking options in a configuration set.

      struct DeleteConfigurationSetTrackingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteConfigurationSetTrackingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete an existing custom verification email template.

      struct DeleteCustomVerificationEmailTemplateRequest
        include JSON::Serializable

        # The name of the custom verification email template to delete.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      # Represents a request to delete a sending authorization policy for an identity. Sending authorization
      # is an Amazon SES feature that enables you to authorize other senders to use your identities. For
      # information, see the Amazon SES Developer Guide .

      struct DeleteIdentityPolicyRequest
        include JSON::Serializable

        # The identity that is associated with the policy to delete. You can specify the identity by using its
        # name or by using its Amazon Resource Name (ARN). Examples: user@example.com , example.com ,
        # arn:aws:ses:us-east-1:123456789012:identity/example.com . To successfully call this operation, you
        # must own the identity.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        # The name of the policy to be deleted.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @identity : String,
          @policy_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteIdentityPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete one of your Amazon SES identities (an email address or domain).

      struct DeleteIdentityRequest
        include JSON::Serializable

        # The identity to be removed from the list of identities for the Amazon Web Services account.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        def initialize(
          @identity : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteIdentityResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete an IP address filter. You use IP address filters when you receive
      # email with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct DeleteReceiptFilterRequest
        include JSON::Serializable

        # The name of the IP address filter to delete.

        @[JSON::Field(key: "FilterName")]
        getter filter_name : String

        def initialize(
          @filter_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteReceiptFilterResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete a receipt rule. You use receipt rules to receive email with Amazon
      # SES. For more information, see the Amazon SES Developer Guide .

      struct DeleteReceiptRuleRequest
        include JSON::Serializable

        # The name of the receipt rule to delete.

        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The name of the receipt rule set that contains the receipt rule to delete.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @rule_name : String,
          @rule_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteReceiptRuleResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete a receipt rule set and all of the receipt rules it contains. You use
      # receipt rule sets to receive email with Amazon SES. For more information, see the Amazon SES
      # Developer Guide .

      struct DeleteReceiptRuleSetRequest
        include JSON::Serializable

        # The name of the receipt rule set to delete.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @rule_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct DeleteReceiptRuleSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete an email template. For more information, see the Amazon SES Developer
      # Guide .

      struct DeleteTemplateRequest
        include JSON::Serializable

        # The name of the template to be deleted.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end


      struct DeleteTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete an email address from the list of email addresses you have attempted
      # to verify under your Amazon Web Services account.

      struct DeleteVerifiedEmailAddressRequest
        include JSON::Serializable

        # An email address to be removed from the list of verified addresses.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @email_address : String
        )
        end
      end

      # Specifies whether messages that use the configuration set are required to use Transport Layer
      # Security (TLS).

      struct DeliveryOptions
        include JSON::Serializable

        # Specifies whether messages that use the configuration set are required to use Transport Layer
        # Security (TLS). If the value is Require , messages are only delivered if a TLS connection can be
        # established. If the value is Optional , messages can be delivered in plain text if a TLS connection
        # can't be established.

        @[JSON::Field(key: "TlsPolicy")]
        getter tls_policy : String?

        def initialize(
          @tls_policy : String? = nil
        )
        end
      end

      # Represents a request to return the metadata and receipt rules for the receipt rule set that is
      # currently active. You use receipt rule sets to receive email with Amazon SES. For more information,
      # see the Amazon SES Developer Guide .

      struct DescribeActiveReceiptRuleSetRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the metadata and receipt rules for the receipt rule set that is currently active.

      struct DescribeActiveReceiptRuleSetResponse
        include JSON::Serializable

        # The metadata for the currently active receipt rule set. The metadata consists of the rule set name
        # and a timestamp of when the rule set was created.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::ReceiptRuleSetMetadata?

        # The receipt rules that belong to the active rule set.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ReceiptRule)?

        def initialize(
          @metadata : Types::ReceiptRuleSetMetadata? = nil,
          @rules : Array(Types::ReceiptRule)? = nil
        )
        end
      end

      # Represents a request to return the details of a configuration set. Configuration sets enable you to
      # publish email sending events. For information about using configuration sets, see the Amazon SES
      # Developer Guide .

      struct DescribeConfigurationSetRequest
        include JSON::Serializable

        # The name of the configuration set to describe.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # A list of configuration set attributes to return.

        @[JSON::Field(key: "ConfigurationSetAttributeNames")]
        getter configuration_set_attribute_names : Array(String)?

        def initialize(
          @configuration_set_name : String,
          @configuration_set_attribute_names : Array(String)? = nil
        )
        end
      end

      # Represents the details of a configuration set. Configuration sets enable you to publish email
      # sending events. For information about using configuration sets, see the Amazon SES Developer Guide .

      struct DescribeConfigurationSetResponse
        include JSON::Serializable

        # The configuration set object associated with the specified configuration set.

        @[JSON::Field(key: "ConfigurationSet")]
        getter configuration_set : Types::ConfigurationSet?


        @[JSON::Field(key: "DeliveryOptions")]
        getter delivery_options : Types::DeliveryOptions?

        # A list of event destinations associated with the configuration set.

        @[JSON::Field(key: "EventDestinations")]
        getter event_destinations : Array(Types::EventDestination)?

        # An object that represents the reputation settings for the configuration set.

        @[JSON::Field(key: "ReputationOptions")]
        getter reputation_options : Types::ReputationOptions?

        # The name of the custom open and click tracking domain associated with the configuration set.

        @[JSON::Field(key: "TrackingOptions")]
        getter tracking_options : Types::TrackingOptions?

        def initialize(
          @configuration_set : Types::ConfigurationSet? = nil,
          @delivery_options : Types::DeliveryOptions? = nil,
          @event_destinations : Array(Types::EventDestination)? = nil,
          @reputation_options : Types::ReputationOptions? = nil,
          @tracking_options : Types::TrackingOptions? = nil
        )
        end
      end

      # Represents a request to return the details of a receipt rule. You use receipt rules to receive email
      # with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct DescribeReceiptRuleRequest
        include JSON::Serializable

        # The name of the receipt rule.

        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The name of the receipt rule set that the receipt rule belongs to.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @rule_name : String,
          @rule_set_name : String
        )
        end
      end

      # Represents the details of a receipt rule.

      struct DescribeReceiptRuleResponse
        include JSON::Serializable

        # A data structure that contains the specified receipt rule's name, actions, recipients, domains,
        # enabled status, scan status, and Transport Layer Security (TLS) policy.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::ReceiptRule?

        def initialize(
          @rule : Types::ReceiptRule? = nil
        )
        end
      end

      # Represents a request to return the details of a receipt rule set. You use receipt rule sets to
      # receive email with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct DescribeReceiptRuleSetRequest
        include JSON::Serializable

        # The name of the receipt rule set to describe.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @rule_set_name : String
        )
        end
      end

      # Represents the details of the specified receipt rule set.

      struct DescribeReceiptRuleSetResponse
        include JSON::Serializable

        # The metadata for the receipt rule set, which consists of the rule set name and the timestamp of when
        # the rule set was created.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::ReceiptRuleSetMetadata?

        # A list of the receipt rules that belong to the specified receipt rule set.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ReceiptRule)?

        def initialize(
          @metadata : Types::ReceiptRuleSetMetadata? = nil,
          @rules : Array(Types::ReceiptRule)? = nil
        )
        end
      end

      # Represents the destination of the message, consisting of To:, CC:, and BCC: fields. Amazon SES does
      # not support the SMTPUTF8 extension, as described in RFC6531 . For this reason, the email address
      # string must be 7-bit ASCII. If you want to send to or from email addresses that contain Unicode
      # characters in the domain part of an address, you must encode the domain using Punycode. Punycode is
      # not permitted in the local part of the email address (the part before the @ sign) nor in the
      # "friendly from" name. If you want to use Unicode characters in the "friendly from" name, you must
      # encode the "friendly from" name using MIME encoded-word syntax, as described in Sending raw email
      # using the Amazon SES API . For more information about Punycode, see RFC 3492 .

      struct Destination
        include JSON::Serializable

        # The recipients to place on the BCC: line of the message.

        @[JSON::Field(key: "BccAddresses")]
        getter bcc_addresses : Array(String)?

        # The recipients to place on the CC: line of the message.

        @[JSON::Field(key: "CcAddresses")]
        getter cc_addresses : Array(String)?

        # The recipients to place on the To: line of the message.

        @[JSON::Field(key: "ToAddresses")]
        getter to_addresses : Array(String)?

        def initialize(
          @bcc_addresses : Array(String)? = nil,
          @cc_addresses : Array(String)? = nil,
          @to_addresses : Array(String)? = nil
        )
        end
      end

      # Contains information about an event destination. When you create or update an event destination, you
      # must provide one, and only one, destination. The destination can be Amazon CloudWatch, Amazon
      # Kinesis Firehose or Amazon Simple Notification Service (Amazon SNS). Event destinations are
      # associated with configuration sets, which enable you to publish email sending events to Amazon
      # CloudWatch, Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS). For
      # information about using configuration sets, see the Amazon SES Developer Guide .

      struct EventDestination
        include JSON::Serializable

        # The type of email sending events to publish to the event destination. send - The call was successful
        # and Amazon SES is attempting to deliver the email. reject - Amazon SES determined that the email
        # contained a virus and rejected it. bounce - The recipient's mail server permanently rejected the
        # email. This corresponds to a hard bounce. complaint - The recipient marked the email as spam.
        # delivery - Amazon SES successfully delivered the email to the recipient's mail server. open - The
        # recipient received the email and opened it in their email client. click - The recipient clicked one
        # or more links in the email. renderingFailure - Amazon SES did not send the email because of a
        # template rendering issue.

        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)

        # The name of the event destination. The name must meet the following requirements: Contain only ASCII
        # letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). Contain 64 characters or fewer.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An object that contains the names, default values, and sources of the dimensions associated with an
        # Amazon CloudWatch event destination.

        @[JSON::Field(key: "CloudWatchDestination")]
        getter cloud_watch_destination : Types::CloudWatchDestination?

        # Sets whether Amazon SES publishes events to this destination when you send an email with the
        # associated configuration set. Set to true to enable publishing to this destination; set to false to
        # prevent publishing to this destination. The default value is false .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # An object that contains the delivery stream ARN and the IAM role ARN associated with an Amazon
        # Kinesis Firehose event destination.

        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An object that contains the topic ARN associated with an Amazon Simple Notification Service (Amazon
        # SNS) event destination.

        @[JSON::Field(key: "SNSDestination")]
        getter sns_destination : Types::SNSDestination?

        def initialize(
          @matching_event_types : Array(String),
          @name : String,
          @cloud_watch_destination : Types::CloudWatchDestination? = nil,
          @enabled : Bool? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @sns_destination : Types::SNSDestination? = nil
        )
        end
      end

      # Indicates that the event destination could not be created because of a naming conflict.

      struct EventDestinationAlreadyExistsException
        include JSON::Serializable

        # Indicates that the configuration set does not exist.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # Indicates that the event destination does not exist.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String?

        def initialize(
          @configuration_set_name : String? = nil,
          @event_destination_name : String? = nil
        )
        end
      end

      # Indicates that the event destination does not exist.

      struct EventDestinationDoesNotExistException
        include JSON::Serializable

        # Indicates that the configuration set does not exist.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # Indicates that the event destination does not exist.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String?

        def initialize(
          @configuration_set_name : String? = nil,
          @event_destination_name : String? = nil
        )
        end
      end

      # Additional X-headers to include in the Delivery Status Notification (DSN) when an email that Amazon
      # SES receives on your behalf bounces. For information about receiving email through Amazon SES, see
      # the Amazon SES Developer Guide .

      struct ExtensionField
        include JSON::Serializable

        # The name of the header to add. Must be between 1 and 50 characters, inclusive, and consist of
        # alphanumeric (a-z, A-Z, 0-9) characters and dashes only.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the header to add. Must contain 2048 characters or fewer, and must not contain newline
        # characters ("\r" or "\n").

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Indicates that the sender address specified for a custom verification email is not verified, and is
      # therefore not eligible to send the custom verification email.

      struct FromEmailAddressNotVerifiedException
        include JSON::Serializable

        # Indicates that the from email address associated with the custom verification email template is not
        # verified.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        def initialize(
          @from_email_address : String? = nil
        )
        end
      end

      # Represents a request to return the email sending status for your Amazon SES account in the current
      # Amazon Web Services Region.

      struct GetAccountSendingEnabledResponse
        include JSON::Serializable

        # Describes whether email sending is enabled or disabled for your Amazon SES account in the current
        # Amazon Web Services Region.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Represents a request to retrieve an existing custom verification email template.

      struct GetCustomVerificationEmailTemplateRequest
        include JSON::Serializable

        # The name of the custom verification email template to retrieve.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      # The content of the custom verification email template.

      struct GetCustomVerificationEmailTemplateResponse
        include JSON::Serializable

        # The URL that the recipient of the verification email is sent to if his or her address is not
        # successfully verified.

        @[JSON::Field(key: "FailureRedirectionURL")]
        getter failure_redirection_url : String?

        # The email address that the custom verification email is sent from.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # The URL that the recipient of the verification email is sent to if his or her address is
        # successfully verified.

        @[JSON::Field(key: "SuccessRedirectionURL")]
        getter success_redirection_url : String?

        # The content of the custom verification email.

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : String?

        # The name of the custom verification email template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The subject line of the custom verification email.

        @[JSON::Field(key: "TemplateSubject")]
        getter template_subject : String?

        def initialize(
          @failure_redirection_url : String? = nil,
          @from_email_address : String? = nil,
          @success_redirection_url : String? = nil,
          @template_content : String? = nil,
          @template_name : String? = nil,
          @template_subject : String? = nil
        )
        end
      end

      # Represents a request for the status of Amazon SES Easy DKIM signing for an identity. For domain
      # identities, this request also returns the DKIM tokens that are required for Easy DKIM signing, and
      # whether Amazon SES successfully verified that these tokens were published. For more information
      # about Easy DKIM, see the Amazon SES Developer Guide .

      struct GetIdentityDkimAttributesRequest
        include JSON::Serializable

        # A list of one or more verified identities - email addresses, domains, or both.

        @[JSON::Field(key: "Identities")]
        getter identities : Array(String)

        def initialize(
          @identities : Array(String)
        )
        end
      end

      # Represents the status of Amazon SES Easy DKIM signing for an identity. For domain identities, this
      # response also contains the DKIM tokens that are required for Easy DKIM signing, and whether Amazon
      # SES successfully verified that these tokens were published.

      struct GetIdentityDkimAttributesResponse
        include JSON::Serializable

        # The DKIM attributes for an email address or a domain.

        @[JSON::Field(key: "DkimAttributes")]
        getter dkim_attributes : Hash(String, Types::IdentityDkimAttributes)

        def initialize(
          @dkim_attributes : Hash(String, Types::IdentityDkimAttributes)
        )
        end
      end

      # Represents a request to return the Amazon SES custom MAIL FROM attributes for a list of identities.
      # For information about using a custom MAIL FROM domain, see the Amazon SES Developer Guide .

      struct GetIdentityMailFromDomainAttributesRequest
        include JSON::Serializable

        # A list of one or more identities.

        @[JSON::Field(key: "Identities")]
        getter identities : Array(String)

        def initialize(
          @identities : Array(String)
        )
        end
      end

      # Represents the custom MAIL FROM attributes for a list of identities.

      struct GetIdentityMailFromDomainAttributesResponse
        include JSON::Serializable

        # A map of identities to custom MAIL FROM attributes.

        @[JSON::Field(key: "MailFromDomainAttributes")]
        getter mail_from_domain_attributes : Hash(String, Types::IdentityMailFromDomainAttributes)

        def initialize(
          @mail_from_domain_attributes : Hash(String, Types::IdentityMailFromDomainAttributes)
        )
        end
      end

      # Represents a request to return the notification attributes for a list of identities you verified
      # with Amazon SES. For information about Amazon SES notifications, see the Amazon SES Developer Guide
      # .

      struct GetIdentityNotificationAttributesRequest
        include JSON::Serializable

        # A list of one or more identities. You can specify an identity by using its name or by using its
        # Amazon Resource Name (ARN). Examples: user@example.com , example.com ,
        # arn:aws:ses:us-east-1:123456789012:identity/example.com .

        @[JSON::Field(key: "Identities")]
        getter identities : Array(String)

        def initialize(
          @identities : Array(String)
        )
        end
      end

      # Represents the notification attributes for a list of identities.

      struct GetIdentityNotificationAttributesResponse
        include JSON::Serializable

        # A map of Identity to IdentityNotificationAttributes.

        @[JSON::Field(key: "NotificationAttributes")]
        getter notification_attributes : Hash(String, Types::IdentityNotificationAttributes)

        def initialize(
          @notification_attributes : Hash(String, Types::IdentityNotificationAttributes)
        )
        end
      end

      # Represents a request to return the requested sending authorization policies for an identity. Sending
      # authorization is an Amazon SES feature that enables you to authorize other senders to use your
      # identities. For information, see the Amazon SES Developer Guide .

      struct GetIdentityPoliciesRequest
        include JSON::Serializable

        # The identity for which the policies are retrieved. You can specify an identity by using its name or
        # by using its Amazon Resource Name (ARN). Examples: user@example.com , example.com ,
        # arn:aws:ses:us-east-1:123456789012:identity/example.com . To successfully call this operation, you
        # must own the identity.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        # A list of the names of policies to be retrieved. You can retrieve a maximum of 20 policies at a
        # time. If you do not know the names of the policies that are attached to the identity, you can use
        # ListIdentityPolicies .

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)

        def initialize(
          @identity : String,
          @policy_names : Array(String)
        )
        end
      end

      # Represents the requested sending authorization policies.

      struct GetIdentityPoliciesResponse
        include JSON::Serializable

        # A map of policy names to policies.

        @[JSON::Field(key: "Policies")]
        getter policies : Hash(String, String)

        def initialize(
          @policies : Hash(String, String)
        )
        end
      end

      # Represents a request to return the Amazon SES verification status of a list of identities. For
      # domain identities, this request also returns the verification token. For information about verifying
      # identities with Amazon SES, see the Amazon SES Developer Guide .

      struct GetIdentityVerificationAttributesRequest
        include JSON::Serializable

        # A list of identities.

        @[JSON::Field(key: "Identities")]
        getter identities : Array(String)

        def initialize(
          @identities : Array(String)
        )
        end
      end

      # The Amazon SES verification status of a list of identities. For domain identities, this response
      # also contains the verification token.

      struct GetIdentityVerificationAttributesResponse
        include JSON::Serializable

        # A map of Identities to IdentityVerificationAttributes objects.

        @[JSON::Field(key: "VerificationAttributes")]
        getter verification_attributes : Hash(String, Types::IdentityVerificationAttributes)

        def initialize(
          @verification_attributes : Hash(String, Types::IdentityVerificationAttributes)
        )
        end
      end

      # Represents your Amazon SES daily sending quota, maximum send rate, and the number of emails you have
      # sent in the last 24 hours.

      struct GetSendQuotaResponse
        include JSON::Serializable

        # The maximum number of emails the user is allowed to send in a 24-hour interval. A value of -1
        # signifies an unlimited quota.

        @[JSON::Field(key: "Max24HourSend")]
        getter max24_hour_send : Float64?

        # The maximum number of emails that Amazon SES can accept from the user's account per second. The rate
        # at which Amazon SES accepts the user's messages might be less than the maximum send rate.

        @[JSON::Field(key: "MaxSendRate")]
        getter max_send_rate : Float64?

        # The number of emails sent during the previous 24 hours.

        @[JSON::Field(key: "SentLast24Hours")]
        getter sent_last24_hours : Float64?

        def initialize(
          @max24_hour_send : Float64? = nil,
          @max_send_rate : Float64? = nil,
          @sent_last24_hours : Float64? = nil
        )
        end
      end

      # Represents a list of data points. This list contains aggregated data from the previous two weeks of
      # your sending activity with Amazon SES.

      struct GetSendStatisticsResponse
        include JSON::Serializable

        # A list of data points, each of which represents 15 minutes of activity.

        @[JSON::Field(key: "SendDataPoints")]
        getter send_data_points : Array(Types::SendDataPoint)?

        def initialize(
          @send_data_points : Array(Types::SendDataPoint)? = nil
        )
        end
      end


      struct GetTemplateRequest
        include JSON::Serializable

        # The name of the template to retrieve.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end


      struct GetTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "Template")]
        getter template : Types::Template?

        def initialize(
          @template : Types::Template? = nil
        )
        end
      end

      # Represents the DKIM attributes of a verified email address or a domain.

      struct IdentityDkimAttributes
        include JSON::Serializable

        # Is true if DKIM signing is enabled for email sent from the identity. It's false otherwise. The
        # default value is true.

        @[JSON::Field(key: "DkimEnabled")]
        getter dkim_enabled : Bool

        # Describes whether Amazon SES has successfully verified the DKIM DNS records (tokens) published in
        # the domain name's DNS. (This only applies to domain identities, not email address identities.)

        @[JSON::Field(key: "DkimVerificationStatus")]
        getter dkim_verification_status : String

        # A set of character strings that represent the domain's identity. Using these tokens, you need to
        # create DNS CNAME records that point to DKIM public keys that are hosted by Amazon SES. Amazon Web
        # Services eventually detects that you've updated your DNS records. This detection process might take
        # up to 72 hours. After successful detection, Amazon SES is able to DKIM-sign email originating from
        # that domain. (This only applies to domain identities, not email address identities.) For more
        # information about creating DNS records using DKIM tokens, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "DkimTokens")]
        getter dkim_tokens : Array(String)?

        def initialize(
          @dkim_enabled : Bool,
          @dkim_verification_status : String,
          @dkim_tokens : Array(String)? = nil
        )
        end
      end

      # Represents the custom MAIL FROM domain attributes of a verified identity (email address or domain).

      struct IdentityMailFromDomainAttributes
        include JSON::Serializable

        # The action that Amazon SES takes if it cannot successfully read the required MX record when you send
        # an email. A value of UseDefaultValue indicates that if Amazon SES cannot read the required MX
        # record, it uses amazonses.com (or a subdomain of that) as the MAIL FROM domain. A value of
        # RejectMessage indicates that if Amazon SES cannot read the required MX record, Amazon SES returns a
        # MailFromDomainNotVerified error and does not send the email. The custom MAIL FROM setup states that
        # result in this behavior are Pending , Failed , and TemporaryFailure .

        @[JSON::Field(key: "BehaviorOnMXFailure")]
        getter behavior_on_mx_failure : String

        # The custom MAIL FROM domain that the identity is configured to use.

        @[JSON::Field(key: "MailFromDomain")]
        getter mail_from_domain : String

        # The state that indicates whether Amazon SES has successfully read the MX record required for custom
        # MAIL FROM domain setup. If the state is Success , Amazon SES uses the specified custom MAIL FROM
        # domain when the verified identity sends an email. All other states indicate that Amazon SES takes
        # the action described by BehaviorOnMXFailure .

        @[JSON::Field(key: "MailFromDomainStatus")]
        getter mail_from_domain_status : String

        def initialize(
          @behavior_on_mx_failure : String,
          @mail_from_domain : String,
          @mail_from_domain_status : String
        )
        end
      end

      # Represents the notification attributes of an identity, including whether an identity has Amazon
      # Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery
      # notifications, and whether feedback forwarding is enabled for bounce and complaint notifications.

      struct IdentityNotificationAttributes
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES publishes bounce
        # notifications.

        @[JSON::Field(key: "BounceTopic")]
        getter bounce_topic : String

        # The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES publishes complaint
        # notifications.

        @[JSON::Field(key: "ComplaintTopic")]
        getter complaint_topic : String

        # The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES publishes delivery
        # notifications.

        @[JSON::Field(key: "DeliveryTopic")]
        getter delivery_topic : String

        # Describes whether Amazon SES forwards bounce and complaint notifications as email. true indicates
        # that Amazon SES forwards bounce and complaint notifications as email, while false indicates that
        # bounce and complaint notifications are published only to the specified bounce and complaint Amazon
        # SNS topics.

        @[JSON::Field(key: "ForwardingEnabled")]
        getter forwarding_enabled : Bool

        # Describes whether Amazon SES includes the original email headers in Amazon SNS notifications of type
        # Bounce . A value of true specifies that Amazon SES includes headers in bounce notifications, and a
        # value of false specifies that Amazon SES does not include headers in bounce notifications.

        @[JSON::Field(key: "HeadersInBounceNotificationsEnabled")]
        getter headers_in_bounce_notifications_enabled : Bool?

        # Describes whether Amazon SES includes the original email headers in Amazon SNS notifications of type
        # Complaint . A value of true specifies that Amazon SES includes headers in complaint notifications,
        # and a value of false specifies that Amazon SES does not include headers in complaint notifications.

        @[JSON::Field(key: "HeadersInComplaintNotificationsEnabled")]
        getter headers_in_complaint_notifications_enabled : Bool?

        # Describes whether Amazon SES includes the original email headers in Amazon SNS notifications of type
        # Delivery . A value of true specifies that Amazon SES includes headers in delivery notifications, and
        # a value of false specifies that Amazon SES does not include headers in delivery notifications.

        @[JSON::Field(key: "HeadersInDeliveryNotificationsEnabled")]
        getter headers_in_delivery_notifications_enabled : Bool?

        def initialize(
          @bounce_topic : String,
          @complaint_topic : String,
          @delivery_topic : String,
          @forwarding_enabled : Bool,
          @headers_in_bounce_notifications_enabled : Bool? = nil,
          @headers_in_complaint_notifications_enabled : Bool? = nil,
          @headers_in_delivery_notifications_enabled : Bool? = nil
        )
        end
      end

      # Represents the verification attributes of a single identity.

      struct IdentityVerificationAttributes
        include JSON::Serializable

        # The verification status of the identity: "Pending", "Success", "Failed", or "TemporaryFailure".

        @[JSON::Field(key: "VerificationStatus")]
        getter verification_status : String

        # The verification token for a domain identity. Null for email address identities.

        @[JSON::Field(key: "VerificationToken")]
        getter verification_token : String?

        def initialize(
          @verification_status : String,
          @verification_token : String? = nil
        )
        end
      end

      # Indicates that the Amazon CloudWatch destination is invalid. See the error message for details.

      struct InvalidCloudWatchDestinationException
        include JSON::Serializable

        # Indicates that the configuration set does not exist.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # Indicates that the event destination does not exist.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String?

        def initialize(
          @configuration_set_name : String? = nil,
          @event_destination_name : String? = nil
        )
        end
      end

      # Indicates that the configuration set is invalid. See the error message for details.

      struct InvalidConfigurationSetException
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that provided delivery option is invalid.

      struct InvalidDeliveryOptionsException
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that the Amazon Kinesis Firehose destination is invalid. See the error message for
      # details.

      struct InvalidFirehoseDestinationException
        include JSON::Serializable

        # Indicates that the configuration set does not exist.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # Indicates that the event destination does not exist.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String?

        def initialize(
          @configuration_set_name : String? = nil,
          @event_destination_name : String? = nil
        )
        end
      end

      # Indicates that the provided Amazon Web Services Lambda function is invalid, or that Amazon SES could
      # not execute the provided function, possibly due to permissions issues. For information about giving
      # permissions, see the Amazon SES Developer Guide .

      struct InvalidLambdaFunctionException
        include JSON::Serializable

        # Indicates that the ARN of the function was not found.

        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        def initialize(
          @function_arn : String? = nil
        )
        end
      end

      # Indicates that the provided policy is invalid. Check the error stack for more information about what
      # caused the error.

      struct InvalidPolicyException
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that one or more of the replacement values you provided is invalid. This error may occur
      # when the TemplateData object contains invalid JSON.

      struct InvalidRenderingParameterException
        include JSON::Serializable


        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @template_name : String? = nil
        )
        end
      end

      # Indicates that the provided Amazon S3 bucket or Amazon Web Services KMS encryption key is invalid,
      # or that Amazon SES could not publish to the bucket, possibly due to permissions issues. For
      # information about giving permissions, see the Amazon SES Developer Guide .

      struct InvalidS3ConfigurationException
        include JSON::Serializable

        # Indicated that the S3 Bucket was not found.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        def initialize(
          @bucket : String? = nil
        )
        end
      end

      # Indicates that the Amazon Simple Notification Service (Amazon SNS) destination is invalid. See the
      # error message for details.

      struct InvalidSNSDestinationException
        include JSON::Serializable

        # Indicates that the configuration set does not exist.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # Indicates that the event destination does not exist.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String?

        def initialize(
          @configuration_set_name : String? = nil,
          @event_destination_name : String? = nil
        )
        end
      end

      # Indicates that the provided Amazon SNS topic is invalid, or that Amazon SES could not publish to the
      # topic, possibly due to permissions issues. For information about giving permissions, see the Amazon
      # SES Developer Guide .

      struct InvalidSnsTopicException
        include JSON::Serializable

        # Indicates that the topic does not exist.

        @[JSON::Field(key: "Topic")]
        getter topic : String?

        def initialize(
          @topic : String? = nil
        )
        end
      end

      # Indicates that the template that you specified could not be rendered. This issue may occur when a
      # template refers to a partial that does not exist.

      struct InvalidTemplateException
        include JSON::Serializable


        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @template_name : String? = nil
        )
        end
      end

      # Indicates that the custom domain to be used for open and click tracking redirects is invalid. This
      # error appears most often in the following situations: When the tracking domain you specified is not
      # verified in Amazon SES. When the tracking domain you specified is not a valid domain or subdomain.

      struct InvalidTrackingOptionsException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the delivery stream ARN and the IAM role ARN associated with an Amazon Kinesis Firehose
      # event destination. Event destinations, such as Amazon Kinesis Firehose, are associated with
      # configuration sets, which enable you to publish email sending events. For information about using
      # configuration sets, see the Amazon SES Developer Guide .

      struct KinesisFirehoseDestination
        include JSON::Serializable

        # The ARN of the Amazon Kinesis Firehose stream that email sending events should be published to.

        @[JSON::Field(key: "DeliveryStreamARN")]
        getter delivery_stream_arn : String

        # The ARN of the IAM role under which Amazon SES publishes email sending events to the Amazon Kinesis
        # Firehose stream.

        @[JSON::Field(key: "IAMRoleARN")]
        getter iam_role_arn : String

        def initialize(
          @delivery_stream_arn : String,
          @iam_role_arn : String
        )
        end
      end

      # When included in a receipt rule, this action calls an Amazon Web Services Lambda function and,
      # optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS). To enable
      # Amazon SES to call your Amazon Web Services Lambda function or to publish to an Amazon SNS topic of
      # another account, Amazon SES must have permission to access those resources. For information about
      # giving permissions, see the Amazon SES Developer Guide . For information about using Amazon Web
      # Services Lambda actions in receipt rules, see the Amazon SES Developer Guide .

      struct LambdaAction
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services Lambda function. An example of an Amazon
        # Web Services Lambda function ARN is arn:aws:lambda:us-west-2:account-id:function:MyFunction . For
        # more information about Amazon Web Services Lambda, see the Amazon Web Services Lambda Developer
        # Guide .

        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The invocation type of the Amazon Web Services Lambda function. An invocation type of
        # RequestResponse means that the execution of the function immediately results in a response, and a
        # value of Event means that the function is invoked asynchronously. The default value is Event . For
        # information about Amazon Web Services Lambda invocation types, see the Amazon Web Services Lambda
        # Developer Guide . There is a 30-second timeout on RequestResponse invocations. You should use Event
        # invocation in most cases. Use RequestResponse only to make a mail flow decision, such as whether to
        # stop the receipt rule or the receipt rule set.

        @[JSON::Field(key: "InvocationType")]
        getter invocation_type : String?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the Lambda action is executed.
        # You can find the ARN of a topic by using the ListTopics operation in Amazon SNS. For more
        # information about Amazon SNS topics, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @function_arn : String,
          @invocation_type : String? = nil,
          @topic_arn : String? = nil
        )
        end
      end

      # Indicates that a resource could not be created because of service limits. For a list of Amazon SES
      # limits, see the Amazon SES Developer Guide .

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to list the configuration sets associated with your Amazon Web Services
      # account. Configuration sets enable you to publish email sending events. For information about using
      # configuration sets, see the Amazon SES Developer Guide .

      struct ListConfigurationSetsRequest
        include JSON::Serializable

        # The number of configuration sets to return.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # A token returned from a previous call to ListConfigurationSets to indicate the position of the
        # configuration set in the configuration set list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_items : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A list of configuration sets associated with your Amazon Web Services account. Configuration sets
      # enable you to publish email sending events. For information about using configuration sets, see the
      # Amazon SES Developer Guide .

      struct ListConfigurationSetsResponse
        include JSON::Serializable

        # A list of configuration sets.

        @[JSON::Field(key: "ConfigurationSets")]
        getter configuration_sets : Array(Types::ConfigurationSet)?

        # A token indicating that there are additional configuration sets available to be listed. Pass this
        # token to successive calls of ListConfigurationSets .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_sets : Array(Types::ConfigurationSet)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a request to list the existing custom verification email templates for your account. For
      # more information about custom verification email templates, see Using Custom Verification Email
      # Templates in the Amazon SES Developer Guide .

      struct ListCustomVerificationEmailTemplatesRequest
        include JSON::Serializable

        # The maximum number of custom verification email templates to return. This value must be at least 1
        # and less than or equal to 50. If you do not specify a value, or if you specify a value less than 1
        # or greater than 50, the operation returns up to 50 results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An array the contains the name and creation time stamp for each template in your Amazon SES account.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A paginated list of custom verification email templates.

      struct ListCustomVerificationEmailTemplatesResponse
        include JSON::Serializable

        # A list of the custom verification email templates that exist in your account.

        @[JSON::Field(key: "CustomVerificationEmailTemplates")]
        getter custom_verification_email_templates : Array(Types::CustomVerificationEmailTemplate)?

        # A token indicating that there are additional custom verification email templates available to be
        # listed. Pass this token to a subsequent call to ListTemplates to retrieve the next 50 custom
        # verification email templates.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @custom_verification_email_templates : Array(Types::CustomVerificationEmailTemplate)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a request to return a list of all identities (email addresses and domains) that you have
      # attempted to verify under your Amazon Web Services account, regardless of verification status.

      struct ListIdentitiesRequest
        include JSON::Serializable

        # The type of the identities to list. Possible values are "EmailAddress" and "Domain". If this
        # parameter is omitted, then all identities are listed.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # The maximum number of identities per page. Possible values are 1-1000 inclusive.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The token to use for pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_type : String? = nil,
          @max_items : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A list of all identities that you have attempted to verify under your Amazon Web Services account,
      # regardless of verification status.

      struct ListIdentitiesResponse
        include JSON::Serializable

        # A list of identities.

        @[JSON::Field(key: "Identities")]
        getter identities : Array(String)

        # The token used for pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identities : Array(String),
          @next_token : String? = nil
        )
        end
      end

      # Represents a request to return a list of sending authorization policies that are attached to an
      # identity. Sending authorization is an Amazon SES feature that enables you to authorize other senders
      # to use your identities. For information, see the Amazon SES Developer Guide .

      struct ListIdentityPoliciesRequest
        include JSON::Serializable

        # The identity that is associated with the policy for which the policies are listed. You can specify
        # an identity by using its name or by using its Amazon Resource Name (ARN). Examples: user@example.com
        # , example.com , arn:aws:ses:us-east-1:123456789012:identity/example.com . To successfully call this
        # operation, you must own the identity.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        def initialize(
          @identity : String
        )
        end
      end

      # A list of names of sending authorization policies that apply to an identity.

      struct ListIdentityPoliciesResponse
        include JSON::Serializable

        # A list of names of policies that apply to the specified identity.

        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)

        def initialize(
          @policy_names : Array(String)
        )
        end
      end

      # Represents a request to list the IP address filters that exist under your Amazon Web Services
      # account. You use IP address filters when you receive email with Amazon SES. For more information,
      # see the Amazon SES Developer Guide .

      struct ListReceiptFiltersRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A list of IP address filters that exist under your Amazon Web Services account.

      struct ListReceiptFiltersResponse
        include JSON::Serializable

        # A list of IP address filter data structures, which each consist of a name, an IP address range, and
        # whether to allow or block mail from it.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ReceiptFilter)?

        def initialize(
          @filters : Array(Types::ReceiptFilter)? = nil
        )
        end
      end

      # Represents a request to list the receipt rule sets that exist under your Amazon Web Services
      # account. You use receipt rule sets to receive email with Amazon SES. For more information, see the
      # Amazon SES Developer Guide .

      struct ListReceiptRuleSetsRequest
        include JSON::Serializable

        # A token returned from a previous call to ListReceiptRuleSets to indicate the position in the receipt
        # rule set list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # A list of receipt rule sets that exist under your Amazon Web Services account.

      struct ListReceiptRuleSetsResponse
        include JSON::Serializable

        # A token indicating that there are additional receipt rule sets available to be listed. Pass this
        # token to successive calls of ListReceiptRuleSets to retrieve up to 100 receipt rule sets at a time.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The metadata for the currently active receipt rule set. The metadata consists of the rule set name
        # and the timestamp of when the rule set was created.

        @[JSON::Field(key: "RuleSets")]
        getter rule_sets : Array(Types::ReceiptRuleSetMetadata)?

        def initialize(
          @next_token : String? = nil,
          @rule_sets : Array(Types::ReceiptRuleSetMetadata)? = nil
        )
        end
      end


      struct ListTemplatesRequest
        include JSON::Serializable

        # The maximum number of templates to return. This value must be at least 1 and less than or equal to
        # 100. If more than 100 items are requested, the page size will automatically set to 100. If you do
        # not specify a value, 10 is the default page size.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # A token returned from a previous call to ListTemplates to indicate the position in the list of email
        # templates.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_items : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTemplatesResponse
        include JSON::Serializable

        # A token indicating that there are additional email templates available to be listed. Pass this token
        # to a subsequent call to ListTemplates to retrieve the next set of email templates within your page
        # size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array the contains the name and creation time stamp for each template in your Amazon SES account.

        @[JSON::Field(key: "TemplatesMetadata")]
        getter templates_metadata : Array(Types::TemplateMetadata)?

        def initialize(
          @next_token : String? = nil,
          @templates_metadata : Array(Types::TemplateMetadata)? = nil
        )
        end
      end

      # A list of email addresses that you have verified with Amazon SES under your Amazon Web Services
      # account.

      struct ListVerifiedEmailAddressesResponse
        include JSON::Serializable

        # A list of email addresses that have been verified.

        @[JSON::Field(key: "VerifiedEmailAddresses")]
        getter verified_email_addresses : Array(String)?

        def initialize(
          @verified_email_addresses : Array(String)? = nil
        )
        end
      end

      # Indicates that the message could not be sent because Amazon SES could not read the MX record
      # required to use the specified MAIL FROM domain. For information about editing the custom MAIL FROM
      # domain settings for an identity, see the Amazon SES Developer Guide .

      struct MailFromDomainNotVerifiedException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the message to be sent, composed of a subject and a body.

      struct Message
        include JSON::Serializable

        # The message body.

        @[JSON::Field(key: "Body")]
        getter body : Types::Body

        # The subject of the message: A short summary of the content, which appears in the recipient's inbox.

        @[JSON::Field(key: "Subject")]
        getter subject : Types::Content

        def initialize(
          @body : Types::Body,
          @subject : Types::Content
        )
        end
      end

      # Message-related information to include in the Delivery Status Notification (DSN) when an email that
      # Amazon SES receives on your behalf bounces. For information about receiving email through Amazon
      # SES, see the Amazon SES Developer Guide .

      struct MessageDsn
        include JSON::Serializable

        # The reporting MTA that attempted to deliver the message, formatted as specified in RFC 3464 (
        # mta-name-type; mta-name ). The default value is dns; inbound-smtp.[region].amazonaws.com .

        @[JSON::Field(key: "ReportingMta")]
        getter reporting_mta : String

        # When the message was received by the reporting mail transfer agent (MTA), in RFC 822 date-time
        # format.

        @[JSON::Field(key: "ArrivalDate")]
        getter arrival_date : Time?

        # Additional X-headers to include in the DSN.

        @[JSON::Field(key: "ExtensionFields")]
        getter extension_fields : Array(Types::ExtensionField)?

        def initialize(
          @reporting_mta : String,
          @arrival_date : Time? = nil,
          @extension_fields : Array(Types::ExtensionField)? = nil
        )
        end
      end

      # Indicates that the action failed, and the message could not be sent. Check the error stack for more
      # information about what caused the error.

      struct MessageRejected
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the name and value of a tag that you can provide to SendEmail or SendRawEmail to apply to
      # an email. Message tags, which you use with configuration sets, enable you to publish email sending
      # events. For information about using configuration sets, see the Amazon SES Developer Guide .

      struct MessageTag
        include JSON::Serializable

        # The name of the tag. The name must meet the following requirements: Contain only ASCII letters (a-z,
        # A-Z), numbers (0-9), underscores (_), or dashes (-). Contain 256 characters or fewer.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the tag. The value must meet the following requirements: Contain only ASCII letters
        # (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). Contain 256 characters or fewer.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Indicates that one or more of the replacement values for the specified template was not specified.
      # Ensure that the TemplateData object contains references to all of the replacement tags in the
      # specified template.

      struct MissingRenderingAttributeException
        include JSON::Serializable


        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @template_name : String? = nil
        )
        end
      end

      # Indicates that the account has not been granted production access.

      struct ProductionAccessNotGrantedException
        include JSON::Serializable

        def initialize
        end
      end

      # A request to modify the delivery options for a configuration set.

      struct PutConfigurationSetDeliveryOptionsRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # Specifies whether messages that use the configuration set are required to use Transport Layer
        # Security (TLS).

        @[JSON::Field(key: "DeliveryOptions")]
        getter delivery_options : Types::DeliveryOptions?

        def initialize(
          @configuration_set_name : String,
          @delivery_options : Types::DeliveryOptions? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetDeliveryOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to add or update a sending authorization policy for an identity. Sending
      # authorization is an Amazon SES feature that enables you to authorize other senders to use your
      # identities. For information, see the Amazon SES Developer Guide .

      struct PutIdentityPolicyRequest
        include JSON::Serializable

        # The identity to which that the policy applies. You can specify an identity by using its name or by
        # using its Amazon Resource Name (ARN). Examples: user@example.com , example.com ,
        # arn:aws:ses:us-east-1:123456789012:identity/example.com . To successfully call this operation, you
        # must own the identity.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        # The text of the policy in JSON format. The policy cannot exceed 4 KB. For information about the
        # syntax of sending authorization policies, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The name of the policy. The policy name cannot exceed 64 characters and can only include
        # alphanumeric characters, dashes, and underscores.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @identity : String,
          @policy : String,
          @policy_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct PutIdentityPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the raw data of the message.

      struct RawMessage
        include JSON::Serializable

        # The raw data of the message. This data needs to base64-encoded if you are accessing Amazon SES
        # directly through the HTTPS interface. If you are accessing Amazon SES using an Amazon Web Services
        # SDK, the SDK takes care of the base 64-encoding for you. In all cases, the client must ensure that
        # the message format complies with Internet email standards regarding email header fields, MIME types,
        # and MIME encoding. The To:, CC:, and BCC: headers in the raw message can contain a group list. If
        # you are using SendRawEmail with sending authorization, you can include X-headers in the raw message
        # to specify the "Source," "From," and "Return-Path" addresses. For more information, see the
        # documentation for SendRawEmail . Do not include these X-headers in the DKIM signature, because they
        # are removed by Amazon SES before sending the email. For more information, go to the Amazon SES
        # Developer Guide .

        @[JSON::Field(key: "Data")]
        getter data : Bytes

        def initialize(
          @data : Bytes
        )
        end
      end

      # An action that Amazon SES can take when it receives an email on behalf of one or more email
      # addresses or domains that you own. An instance of this data type can represent only one action. For
      # information about setting up receipt rules, see the Amazon SES Developer Guide .

      struct ReceiptAction
        include JSON::Serializable

        # Adds a header to the received email.

        @[JSON::Field(key: "AddHeaderAction")]
        getter add_header_action : Types::AddHeaderAction?

        # Rejects the received email by returning a bounce response to the sender and, optionally, publishes a
        # notification to Amazon Simple Notification Service (Amazon SNS).

        @[JSON::Field(key: "BounceAction")]
        getter bounce_action : Types::BounceAction?

        # Parses the received message and starts an email contact in Amazon Connect on your behalf.

        @[JSON::Field(key: "ConnectAction")]
        getter connect_action : Types::ConnectAction?

        # Calls an Amazon Web Services Lambda function, and optionally, publishes a notification to Amazon
        # SNS.

        @[JSON::Field(key: "LambdaAction")]
        getter lambda_action : Types::LambdaAction?

        # Saves the received message to an Amazon Simple Storage Service (Amazon S3) bucket and, optionally,
        # publishes a notification to Amazon SNS.

        @[JSON::Field(key: "S3Action")]
        getter s3_action : Types::S3Action?

        # Publishes the email content within a notification to Amazon SNS.

        @[JSON::Field(key: "SNSAction")]
        getter sns_action : Types::SNSAction?

        # Terminates the evaluation of the receipt rule set and optionally publishes a notification to Amazon
        # SNS.

        @[JSON::Field(key: "StopAction")]
        getter stop_action : Types::StopAction?

        # Calls Amazon WorkMail and, optionally, publishes a notification to Amazon Amazon SNS.

        @[JSON::Field(key: "WorkmailAction")]
        getter workmail_action : Types::WorkmailAction?

        def initialize(
          @add_header_action : Types::AddHeaderAction? = nil,
          @bounce_action : Types::BounceAction? = nil,
          @connect_action : Types::ConnectAction? = nil,
          @lambda_action : Types::LambdaAction? = nil,
          @s3_action : Types::S3Action? = nil,
          @sns_action : Types::SNSAction? = nil,
          @stop_action : Types::StopAction? = nil,
          @workmail_action : Types::WorkmailAction? = nil
        )
        end
      end

      # A receipt IP address filter enables you to specify whether to accept or reject mail originating from
      # an IP address or range of IP addresses. For information about setting up IP address filters, see the
      # Amazon SES Developer Guide .

      struct ReceiptFilter
        include JSON::Serializable

        # A structure that provides the IP addresses to block or allow, and whether to block or allow incoming
        # mail from them.

        @[JSON::Field(key: "IpFilter")]
        getter ip_filter : Types::ReceiptIpFilter

        # The name of the IP address filter. The name must meet the following requirements: Contain only ASCII
        # letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). Start and end with a letter or
        # number. Contain 64 characters or fewer.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @ip_filter : Types::ReceiptIpFilter,
          @name : String
        )
        end
      end

      # A receipt IP address filter enables you to specify whether to accept or reject mail originating from
      # an IP address or range of IP addresses. For information about setting up IP address filters, see the
      # Amazon SES Developer Guide .

      struct ReceiptIpFilter
        include JSON::Serializable

        # A single IP address or a range of IP addresses to block or allow, specified in Classless
        # Inter-Domain Routing (CIDR) notation. An example of a single email address is 10.0.0.1. An example
        # of a range of IP addresses is 10.0.0.1/24. For more information about CIDR notation, see RFC 2317 .

        @[JSON::Field(key: "Cidr")]
        getter cidr : String

        # Indicates whether to block or allow incoming mail from the specified IP addresses.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @cidr : String,
          @policy : String
        )
        end
      end

      # Receipt rules enable you to specify which actions Amazon SES should take when it receives mail on
      # behalf of one or more email addresses or domains that you own. Each receipt rule defines a set of
      # email addresses or domains that it applies to. If the email addresses or domains match at least one
      # recipient address of the message, Amazon SES executes all of the receipt rule's actions on the
      # message. For information about setting up receipt rules, see the Amazon SES Developer Guide .

      struct ReceiptRule
        include JSON::Serializable

        # The name of the receipt rule. The name must meet the following requirements: Contain only ASCII
        # letters (a-z, A-Z), numbers (0-9), underscores (_), dashes (-), or periods (.). Start and end with a
        # letter or number. Contain 64 characters or fewer.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An ordered list of actions to perform on messages that match at least one of the recipient email
        # addresses or domains specified in the receipt rule.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(Types::ReceiptAction)?

        # If true , the receipt rule is active. The default value is false .

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The recipient domains and email addresses that the receipt rule applies to. If this field is not
        # specified, this rule matches all recipients on all verified domains.

        @[JSON::Field(key: "Recipients")]
        getter recipients : Array(String)?

        # If true , then messages that this receipt rule applies to are scanned for spam and viruses. The
        # default value is false .

        @[JSON::Field(key: "ScanEnabled")]
        getter scan_enabled : Bool?

        # Specifies whether Amazon SES should require that incoming email is delivered over a connection
        # encrypted with Transport Layer Security (TLS). If this parameter is set to Require , Amazon SES
        # bounces emails that are not received over TLS. The default is Optional .

        @[JSON::Field(key: "TlsPolicy")]
        getter tls_policy : String?

        def initialize(
          @name : String,
          @actions : Array(Types::ReceiptAction)? = nil,
          @enabled : Bool? = nil,
          @recipients : Array(String)? = nil,
          @scan_enabled : Bool? = nil,
          @tls_policy : String? = nil
        )
        end
      end

      # Information about a receipt rule set. A receipt rule set is a collection of rules that specify what
      # Amazon SES should do with mail it receives on behalf of your account's verified domains. For
      # information about setting up receipt rule sets, see the Amazon SES Developer Guide .

      struct ReceiptRuleSetMetadata
        include JSON::Serializable

        # The date and time the receipt rule set was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The name of the receipt rule set. The name must meet the following requirements: Contain only ASCII
        # letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). Start and end with a letter or
        # number. Contain 64 characters or fewer.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Recipient-related information to include in the Delivery Status Notification (DSN) when an email
      # that Amazon SES receives on your behalf bounces. For information about receiving email through
      # Amazon SES, see the Amazon SES Developer Guide .

      struct RecipientDsnFields
        include JSON::Serializable

        # The action performed by the reporting mail transfer agent (MTA) as a result of its attempt to
        # deliver the message to the recipient address. This is required by RFC 3464 .

        @[JSON::Field(key: "Action")]
        getter action : String

        # The status code that indicates what went wrong. This is required by RFC 3464 .

        @[JSON::Field(key: "Status")]
        getter status : String

        # An extended explanation of what went wrong; this is usually an SMTP response. See RFC 3463 for the
        # correct formatting of this parameter.

        @[JSON::Field(key: "DiagnosticCode")]
        getter diagnostic_code : String?

        # Additional X-headers to include in the DSN.

        @[JSON::Field(key: "ExtensionFields")]
        getter extension_fields : Array(Types::ExtensionField)?

        # The email address that the message was ultimately delivered to. This corresponds to the
        # Final-Recipient in the DSN. If not specified, FinalRecipient is set to the Recipient specified in
        # the BouncedRecipientInfo structure. Either FinalRecipient or the recipient in BouncedRecipientInfo
        # must be a recipient of the original bounced message. Do not prepend the FinalRecipient email address
        # with rfc 822; , as described in RFC 3798 .

        @[JSON::Field(key: "FinalRecipient")]
        getter final_recipient : String?

        # The time the final delivery attempt was made, in RFC 822 date-time format.

        @[JSON::Field(key: "LastAttemptDate")]
        getter last_attempt_date : Time?

        # The MTA to which the remote MTA attempted to deliver the message, formatted as specified in RFC 3464
        # ( mta-name-type; mta-name ). This parameter typically applies only to propagating synchronous
        # bounces.

        @[JSON::Field(key: "RemoteMta")]
        getter remote_mta : String?

        def initialize(
          @action : String,
          @status : String,
          @diagnostic_code : String? = nil,
          @extension_fields : Array(Types::ExtensionField)? = nil,
          @final_recipient : String? = nil,
          @last_attempt_date : Time? = nil,
          @remote_mta : String? = nil
        )
        end
      end

      # Represents a request to reorder the receipt rules within a receipt rule set. You use receipt rule
      # sets to receive email with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct ReorderReceiptRuleSetRequest
        include JSON::Serializable

        # The specified receipt rule set's receipt rules, in order.

        @[JSON::Field(key: "RuleNames")]
        getter rule_names : Array(String)

        # The name of the receipt rule set to reorder.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @rule_names : Array(String),
          @rule_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct ReorderReceiptRuleSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the reputation settings for a configuration set.

      struct ReputationOptions
        include JSON::Serializable

        # The date and time at which the reputation metrics for the configuration set were last reset.
        # Resetting these metrics is known as a fresh start . When you disable email sending for a
        # configuration set using UpdateConfigurationSetSendingEnabled and later re-enable it, the reputation
        # metrics for the configuration set (but not for the entire Amazon SES account) are reset. If email
        # sending for the configuration set has never been disabled and later re-enabled, the value of this
        # attribute is null .

        @[JSON::Field(key: "LastFreshStart")]
        getter last_fresh_start : Time?

        # Describes whether or not Amazon SES publishes reputation metrics for the configuration set, such as
        # bounce and complaint rates, to Amazon CloudWatch. If the value is true , reputation metrics are
        # published. If the value is false , reputation metrics are not published. The default value is false
        # .

        @[JSON::Field(key: "ReputationMetricsEnabled")]
        getter reputation_metrics_enabled : Bool?

        # Describes whether email sending is enabled or disabled for the configuration set. If the value is
        # true , then Amazon SES sends emails that use the configuration set. If the value is false , Amazon
        # SES does not send emails that use the configuration set. The default value is true . You can change
        # this setting using UpdateConfigurationSetSendingEnabled .

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        def initialize(
          @last_fresh_start : Time? = nil,
          @reputation_metrics_enabled : Bool? = nil,
          @sending_enabled : Bool? = nil
        )
        end
      end

      # Indicates that the provided receipt rule does not exist.

      struct RuleDoesNotExistException
        include JSON::Serializable

        # Indicates that the named receipt rule does not exist.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Indicates that the provided receipt rule set does not exist.

      struct RuleSetDoesNotExistException
        include JSON::Serializable

        # Indicates that the named receipt rule set does not exist.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # When included in a receipt rule, this action saves the received message to an Amazon Simple Storage
      # Service (Amazon S3) bucket and, optionally, publishes a notification to Amazon Simple Notification
      # Service (Amazon SNS). To enable Amazon SES to write emails to your Amazon S3 bucket, use an Amazon
      # Web Services KMS key to encrypt your emails, or publish to an Amazon SNS topic of another account,
      # Amazon SES must have permission to access those resources. For information about granting
      # permissions, see the Amazon SES Developer Guide . When you save your emails to an Amazon S3 bucket,
      # the maximum email size (including headers) is 40 MB. Emails larger than that bounces. For
      # information about specifying Amazon S3 actions in receipt rules, see the Amazon SES Developer Guide
      # .

      struct S3Action
        include JSON::Serializable

        # The name of the Amazon S3 bucket for incoming email.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The ARN of the IAM role to be used by Amazon Simple Email Service while writing to the Amazon S3
        # bucket, optionally encrypting your mail via the provided customer managed key, and publishing to the
        # Amazon SNS topic. This role should have access to the following APIs: s3:PutObject , kms:Encrypt and
        # kms:GenerateDataKey for the given Amazon S3 bucket. kms:GenerateDataKey for the given Amazon Web
        # Services KMS customer managed key. sns:Publish for the given Amazon SNS topic. If an IAM role ARN is
        # provided, the role (and only the role) is used to access all the given resources (Amazon S3 bucket,
        # Amazon Web Services KMS customer managed key and Amazon SNS topic). Therefore, setting up individual
        # resource access permissions is not required.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The customer managed key that Amazon SES should use to encrypt your emails before saving them to the
        # Amazon S3 bucket. You can use the Amazon Web Services managed key or a customer managed key that you
        # created in Amazon Web Services KMS as follows: To use the Amazon Web Services managed key, provide
        # an ARN in the form of arn:aws:kms:REGION:ACCOUNT-ID-WITHOUT-HYPHENS:alias/aws/ses . For example, if
        # your Amazon Web Services account ID is 123456789012 and you want to use the Amazon Web Services
        # managed key in the US West (Oregon) Region, the ARN of the Amazon Web Services managed key would be
        # arn:aws:kms:us-west-2:123456789012:alias/aws/ses . If you use the Amazon Web Services managed key,
        # you don't need to perform any extra steps to give Amazon SES permission to use the key. To use a
        # customer managed key that you created in Amazon Web Services KMS, provide the ARN of the customer
        # managed key and ensure that you add a statement to your key's policy to give Amazon SES permission
        # to use it. For more information about giving permissions, see the Amazon SES Developer Guide . For
        # more information about key policies, see the Amazon Web Services KMS Developer Guide . If you do not
        # specify an Amazon Web Services KMS key, Amazon SES does not encrypt your emails. Your mail is
        # encrypted by Amazon SES using the Amazon S3 encryption client before the mail is submitted to Amazon
        # S3 for storage. It is not encrypted using Amazon S3 server-side encryption. This means that you must
        # use the Amazon S3 encryption client to decrypt the email after retrieving it from Amazon S3, as the
        # service has no access to use your Amazon Web Services KMS keys for decryption. This encryption
        # client is currently available with the Amazon Web Services SDK for Java and Amazon Web Services SDK
        # for Ruby only. For more information about client-side encryption using Amazon Web Services KMS
        # managed keys, see the Amazon S3 Developer Guide .

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The key prefix of the Amazon S3 bucket. The key prefix is similar to a directory name that enables
        # you to store similar data under the same directory in a bucket.

        @[JSON::Field(key: "ObjectKeyPrefix")]
        getter object_key_prefix : String?

        # The ARN of the Amazon SNS topic to notify when the message is saved to the Amazon S3 bucket. You can
        # find the ARN of a topic by using the ListTopics operation in Amazon SNS. For more information about
        # Amazon SNS topics, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @bucket_name : String,
          @iam_role_arn : String? = nil,
          @kms_key_arn : String? = nil,
          @object_key_prefix : String? = nil,
          @topic_arn : String? = nil
        )
        end
      end

      # When included in a receipt rule, this action publishes a notification to Amazon Simple Notification
      # Service (Amazon SNS). This action includes a complete copy of the email content in the Amazon SNS
      # notifications. Amazon SNS notifications for all other actions simply provide information about the
      # email. They do not include the email content itself. If you own the Amazon SNS topic, you don't need
      # to do anything to give Amazon SES permission to publish emails to it. However, if you don't own the
      # Amazon SNS topic, you need to attach a policy to the topic to give Amazon SES permissions to access
      # it. For information about giving permissions, see the Amazon SES Developer Guide . You can only
      # publish emails that are 150 KB or less (including the header) to Amazon SNS. Larger emails bounce.
      # If you anticipate emails larger than 150 KB, use the S3 action instead. For information about using
      # a receipt rule to publish an Amazon SNS notification, see the Amazon SES Developer Guide .

      struct SNSAction
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. You can find the ARN of a topic by
        # using the ListTopics operation in Amazon SNS. For more information about Amazon SNS topics, see the
        # Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        # The encoding to use for the email within the Amazon SNS notification. UTF-8 is easier to use, but
        # may not preserve all special characters when a message was encoded with a different encoding format.
        # Base64 preserves all special characters. The default value is UTF-8.

        @[JSON::Field(key: "Encoding")]
        getter encoding : String?

        def initialize(
          @topic_arn : String,
          @encoding : String? = nil
        )
        end
      end

      # Contains the topic ARN associated with an Amazon Simple Notification Service (Amazon SNS) event
      # destination. Event destinations, such as Amazon SNS, are associated with configuration sets, which
      # enable you to publish email sending events. For information about using configuration sets, see the
      # Amazon SES Developer Guide .

      struct SNSDestination
        include JSON::Serializable

        # The ARN of the Amazon SNS topic for email sending events. You can find the ARN of a topic by using
        # the ListTopics Amazon SNS operation. For more information about Amazon SNS topics, see the Amazon
        # SNS Developer Guide .

        @[JSON::Field(key: "TopicARN")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # Represents a request to send a bounce message to the sender of an email you received through Amazon
      # SES.

      struct SendBounceRequest
        include JSON::Serializable

        # The address to use in the "From" header of the bounce message. This must be an identity that you
        # have verified with Amazon SES.

        @[JSON::Field(key: "BounceSender")]
        getter bounce_sender : String

        # A list of recipients of the bounced message, including the information required to create the
        # Delivery Status Notifications (DSNs) for the recipients. You must specify at least one
        # BouncedRecipientInfo in the list.

        @[JSON::Field(key: "BouncedRecipientInfoList")]
        getter bounced_recipient_info_list : Array(Types::BouncedRecipientInfo)

        # The message ID of the message to be bounced.

        @[JSON::Field(key: "OriginalMessageId")]
        getter original_message_id : String

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the address in the "From"
        # header of the bounce. For more information about sending authorization, see the Amazon SES Developer
        # Guide .

        @[JSON::Field(key: "BounceSenderArn")]
        getter bounce_sender_arn : String?

        # Human-readable text for the bounce message to explain the failure. If not specified, the text is
        # auto-generated based on the bounced recipient information.

        @[JSON::Field(key: "Explanation")]
        getter explanation : String?

        # Message-related DSN fields. If not specified, Amazon SES chooses the values.

        @[JSON::Field(key: "MessageDsn")]
        getter message_dsn : Types::MessageDsn?

        def initialize(
          @bounce_sender : String,
          @bounced_recipient_info_list : Array(Types::BouncedRecipientInfo),
          @original_message_id : String,
          @bounce_sender_arn : String? = nil,
          @explanation : String? = nil,
          @message_dsn : Types::MessageDsn? = nil
        )
        end
      end

      # Represents a unique message ID.

      struct SendBounceResponse
        include JSON::Serializable

        # The message ID of the bounce message.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # Represents a request to send a templated email to multiple destinations using Amazon SES. For more
      # information, see the Amazon SES Developer Guide .

      struct SendBulkTemplatedEmailRequest
        include JSON::Serializable

        # A list of replacement values to apply to the template when replacement data is not specified in a
        # Destination object. These values act as a default or fallback option when no other data is
        # available. The template data is a JSON object, typically consisting of key-value pairs in which the
        # keys correspond to replacement tags in the email template.

        @[JSON::Field(key: "DefaultTemplateData")]
        getter default_template_data : String

        # One or more Destination objects. All of the recipients in a Destination receive the same version of
        # the email. You can specify up to 50 Destination objects within a Destinations array.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::BulkEmailDestination)

        # The email address that is sending the email. This email address must be either individually verified
        # with Amazon SES, or from a domain that has been verified with Amazon SES. For information about
        # verifying identities, see the Amazon SES Developer Guide . If you are sending on behalf of another
        # user and have been permitted to do so by a sending authorization policy, then you must also specify
        # the SourceArn parameter. For more information about sending authorization, see the Amazon SES
        # Developer Guide . Amazon SES does not support the SMTPUTF8 extension, as described in RFC6531 . For
        # this reason, the email address string must be 7-bit ASCII. If you want to send to or from email
        # addresses that contain Unicode characters in the domain part of an address, you must encode the
        # domain using Punycode. Punycode is not permitted in the local part of the email address (the part
        # before the @ sign) nor in the "friendly from" name. If you want to use Unicode characters in the
        # "friendly from" name, you must encode the "friendly from" name using MIME encoded-word syntax, as
        # described in Sending raw email using the Amazon SES API . For more information about Punycode, see
        # RFC 3492 .

        @[JSON::Field(key: "Source")]
        getter source : String

        # The template to use when sending this email.

        @[JSON::Field(key: "Template")]
        getter template : String

        # The name of the configuration set to use when you send an email using SendBulkTemplatedEmail .

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send to a destination
        # using SendBulkTemplatedEmail .

        @[JSON::Field(key: "DefaultTags")]
        getter default_tags : Array(Types::MessageTag)?

        # The reply-to email address(es) for the message. If the recipient replies to the message, each
        # reply-to address receives the reply.

        @[JSON::Field(key: "ReplyToAddresses")]
        getter reply_to_addresses : Array(String)?

        # The email address that bounces and complaints are forwarded to when feedback forwarding is enabled.
        # If the message cannot be delivered to the recipient, then an error message is returned from the
        # recipient's ISP; this message is forwarded to the email address specified by the ReturnPath
        # parameter. The ReturnPath parameter is never overwritten. This email address must be either
        # individually verified with Amazon SES, or from a domain that has been verified with Amazon SES.

        @[JSON::Field(key: "ReturnPath")]
        getter return_path : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the ReturnPath parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to use feedback@example.com , then you would specify the ReturnPathArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the ReturnPath to be
        # feedback@example.com . For more information about sending authorization, see the Amazon SES
        # Developer Guide .

        @[JSON::Field(key: "ReturnPathArn")]
        getter return_path_arn : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to send for the email address
        # specified in the Source parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to send from user@example.com , then you would specify the SourceArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the Source to be user@example.com .
        # For more information about sending authorization, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The ARN of the template to use when sending this email.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @default_template_data : String,
          @destinations : Array(Types::BulkEmailDestination),
          @source : String,
          @template : String,
          @configuration_set_name : String? = nil,
          @default_tags : Array(Types::MessageTag)? = nil,
          @reply_to_addresses : Array(String)? = nil,
          @return_path : String? = nil,
          @return_path_arn : String? = nil,
          @source_arn : String? = nil,
          @template_arn : String? = nil
        )
        end
      end


      struct SendBulkTemplatedEmailResponse
        include JSON::Serializable

        # One object per intended recipient. Check each response object and retry any messages with a failure
        # status. (Note that order of responses will be respective to order of destinations in the
        # request.)Receipt rules enable you to specify which actions

        @[JSON::Field(key: "Status")]
        getter status : Array(Types::BulkEmailDestinationStatus)

        def initialize(
          @status : Array(Types::BulkEmailDestinationStatus)
        )
        end
      end

      # Represents a request to send a custom verification email to a specified recipient.

      struct SendCustomVerificationEmailRequest
        include JSON::Serializable

        # The email address to verify.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # The name of the custom verification email template to use when sending the verification email.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # Name of a configuration set to use when sending the verification email.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @email_address : String,
          @template_name : String,
          @configuration_set_name : String? = nil
        )
        end
      end

      # The response received when attempting to send the custom verification email.

      struct SendCustomVerificationEmailResponse
        include JSON::Serializable

        # The unique message identifier returned from the SendCustomVerificationEmail operation.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # Represents sending statistics data. Each SendDataPoint contains statistics for a 15-minute period of
      # sending activity.

      struct SendDataPoint
        include JSON::Serializable

        # Number of emails that have bounced.

        @[JSON::Field(key: "Bounces")]
        getter bounces : Int64?

        # Number of unwanted emails that were rejected by recipients.

        @[JSON::Field(key: "Complaints")]
        getter complaints : Int64?

        # Number of emails that have been sent.

        @[JSON::Field(key: "DeliveryAttempts")]
        getter delivery_attempts : Int64?

        # Number of emails rejected by Amazon SES.

        @[JSON::Field(key: "Rejects")]
        getter rejects : Int64?

        # Time of the data point.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @bounces : Int64? = nil,
          @complaints : Int64? = nil,
          @delivery_attempts : Int64? = nil,
          @rejects : Int64? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Represents a request to send a single formatted email using Amazon SES. For more information, see
      # the Amazon SES Developer Guide .

      struct SendEmailRequest
        include JSON::Serializable

        # The destination for this email, composed of To:, CC:, and BCC: fields.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # The message to be sent.

        @[JSON::Field(key: "Message")]
        getter message : Types::Message

        # The email address that is sending the email. This email address must be either individually verified
        # with Amazon SES, or from a domain that has been verified with Amazon SES. For information about
        # verifying identities, see the Amazon SES Developer Guide . If you are sending on behalf of another
        # user and have been permitted to do so by a sending authorization policy, then you must also specify
        # the SourceArn parameter. For more information about sending authorization, see the Amazon SES
        # Developer Guide . Amazon SES does not support the SMTPUTF8 extension, as described in RFC6531 . For
        # this reason, the email address string must be 7-bit ASCII. If you want to send to or from email
        # addresses that contain Unicode characters in the domain part of an address, you must encode the
        # domain using Punycode. Punycode is not permitted in the local part of the email address (the part
        # before the @ sign) nor in the "friendly from" name. If you want to use Unicode characters in the
        # "friendly from" name, you must encode the "friendly from" name using MIME encoded-word syntax, as
        # described in Sending raw email using the Amazon SES API . For more information about Punycode, see
        # RFC 3492 .

        @[JSON::Field(key: "Source")]
        getter source : String

        # The name of the configuration set to use when you send an email using SendEmail .

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The reply-to email address(es) for the message. If the recipient replies to the message, each
        # reply-to address receives the reply.

        @[JSON::Field(key: "ReplyToAddresses")]
        getter reply_to_addresses : Array(String)?

        # The email address that bounces and complaints are forwarded to when feedback forwarding is enabled.
        # If the message cannot be delivered to the recipient, then an error message is returned from the
        # recipient's ISP; this message is forwarded to the email address specified by the ReturnPath
        # parameter. The ReturnPath parameter is never overwritten. This email address must be either
        # individually verified with Amazon SES, or from a domain that has been verified with Amazon SES.

        @[JSON::Field(key: "ReturnPath")]
        getter return_path : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the ReturnPath parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to use feedback@example.com , then you would specify the ReturnPathArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the ReturnPath to be
        # feedback@example.com . For more information about sending authorization, see the Amazon SES
        # Developer Guide .

        @[JSON::Field(key: "ReturnPathArn")]
        getter return_path_arn : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to send for the email address
        # specified in the Source parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to send from user@example.com , then you would specify the SourceArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the Source to be user@example.com .
        # For more information about sending authorization, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using SendEmail
        # . Tags correspond to characteristics of the email that you define, so that you can publish email
        # sending events.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::MessageTag)?

        def initialize(
          @destination : Types::Destination,
          @message : Types::Message,
          @source : String,
          @configuration_set_name : String? = nil,
          @reply_to_addresses : Array(String)? = nil,
          @return_path : String? = nil,
          @return_path_arn : String? = nil,
          @source_arn : String? = nil,
          @tags : Array(Types::MessageTag)? = nil
        )
        end
      end

      # Represents a unique message ID.

      struct SendEmailResponse
        include JSON::Serializable

        # The unique message identifier returned from the SendEmail action.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        def initialize(
          @message_id : String
        )
        end
      end

      # Represents a request to send a single raw email using Amazon SES. For more information, see the
      # Amazon SES Developer Guide .

      struct SendRawEmailRequest
        include JSON::Serializable

        # The raw email message itself. The message has to meet the following criteria: The message has to
        # contain a header and a body, separated by a blank line. All of the required header fields must be
        # present in the message. Each part of a multipart MIME message must be formatted properly.
        # Attachments must be of a content type that Amazon SES supports. For a list on unsupported content
        # types, see Unsupported Attachment Types in the Amazon SES Developer Guide . The entire message must
        # be base64-encoded. If any of the MIME parts in your message contain content that is outside of the
        # 7-bit ASCII character range, we highly recommend that you encode that content. For more information,
        # see Sending Raw Email in the Amazon SES Developer Guide . Per RFC 5321 , the maximum length of each
        # line of text, including the &lt;CRLF&gt;, must not exceed 1,000 characters.

        @[JSON::Field(key: "RawMessage")]
        getter raw_message : Types::RawMessage

        # The name of the configuration set to use when you send an email using SendRawEmail .

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # A list of destinations for the message, consisting of To:, CC:, and BCC: addresses.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(String)?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to specify a particular "From"
        # address in the header of the raw email. Instead of using this parameter, you can use the X-header
        # X-SES-FROM-ARN in the raw message of the email. If you use both the FromArn parameter and the
        # corresponding X-header, Amazon SES uses the value of the FromArn parameter. For information about
        # when to use this parameter, see the description of SendRawEmail in this guide, or see the Amazon SES
        # Developer Guide .

        @[JSON::Field(key: "FromArn")]
        getter from_arn : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the ReturnPath parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to use feedback@example.com , then you would specify the ReturnPathArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the ReturnPath to be
        # feedback@example.com . Instead of using this parameter, you can use the X-header
        # X-SES-RETURN-PATH-ARN in the raw message of the email. If you use both the ReturnPathArn parameter
        # and the corresponding X-header, Amazon SES uses the value of the ReturnPathArn parameter. For
        # information about when to use this parameter, see the description of SendRawEmail in this guide, or
        # see the Amazon SES Developer Guide .

        @[JSON::Field(key: "ReturnPathArn")]
        getter return_path_arn : String?

        # The identity's email address. If you do not provide a value for this parameter, you must specify a
        # "From" address in the raw text of the message. (You can also specify both.) Amazon SES does not
        # support the SMTPUTF8 extension, as described in RFC6531 . For this reason, the email address string
        # must be 7-bit ASCII. If you want to send to or from email addresses that contain Unicode characters
        # in the domain part of an address, you must encode the domain using Punycode. Punycode is not
        # permitted in the local part of the email address (the part before the @ sign) nor in the "friendly
        # from" name. If you want to use Unicode characters in the "friendly from" name, you must encode the
        # "friendly from" name using MIME encoded-word syntax, as described in Sending raw email using the
        # Amazon SES API . For more information about Punycode, see RFC 3492 . If you specify the Source
        # parameter and have feedback forwarding enabled, then bounces and complaints are sent to this email
        # address. This takes precedence over any Return-Path header that you might include in the raw text of
        # the message.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to send for the email address
        # specified in the Source parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to send from user@example.com , then you would specify the SourceArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the Source to be user@example.com .
        # Instead of using this parameter, you can use the X-header X-SES-SOURCE-ARN in the raw message of the
        # email. If you use both the SourceArn parameter and the corresponding X-header, Amazon SES uses the
        # value of the SourceArn parameter. For information about when to use this parameter, see the
        # description of SendRawEmail in this guide, or see the Amazon SES Developer Guide .

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using
        # SendRawEmail . Tags correspond to characteristics of the email that you define, so that you can
        # publish email sending events.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::MessageTag)?

        def initialize(
          @raw_message : Types::RawMessage,
          @configuration_set_name : String? = nil,
          @destinations : Array(String)? = nil,
          @from_arn : String? = nil,
          @return_path_arn : String? = nil,
          @source : String? = nil,
          @source_arn : String? = nil,
          @tags : Array(Types::MessageTag)? = nil
        )
        end
      end

      # Represents a unique message ID.

      struct SendRawEmailResponse
        include JSON::Serializable

        # The unique message identifier returned from the SendRawEmail action.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        def initialize(
          @message_id : String
        )
        end
      end

      # Represents a request to send a templated email using Amazon SES. For more information, see the
      # Amazon SES Developer Guide .

      struct SendTemplatedEmailRequest
        include JSON::Serializable

        # The destination for this email, composed of To:, CC:, and BCC: fields. A Destination can include up
        # to 50 recipients across these three fields.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # The email address that is sending the email. This email address must be either individually verified
        # with Amazon SES, or from a domain that has been verified with Amazon SES. For information about
        # verifying identities, see the Amazon SES Developer Guide . If you are sending on behalf of another
        # user and have been permitted to do so by a sending authorization policy, then you must also specify
        # the SourceArn parameter. For more information about sending authorization, see the Amazon SES
        # Developer Guide . Amazon SES does not support the SMTPUTF8 extension, as described in RFC6531 . for
        # this reason, The email address string must be 7-bit ASCII. If you want to send to or from email
        # addresses that contain Unicode characters in the domain part of an address, you must encode the
        # domain using Punycode. Punycode is not permitted in the local part of the email address (the part
        # before the @ sign) nor in the "friendly from" name. If you want to use Unicode characters in the
        # "friendly from" name, you must encode the "friendly from" name using MIME encoded-word syntax, as
        # described in Sending raw email using the Amazon SES API . For more information about Punycode, see
        # RFC 3492 .

        @[JSON::Field(key: "Source")]
        getter source : String

        # The template to use when sending this email.

        @[JSON::Field(key: "Template")]
        getter template : String

        # A list of replacement values to apply to the template. This parameter is a JSON object, typically
        # consisting of key-value pairs in which the keys correspond to replacement tags in the email
        # template.

        @[JSON::Field(key: "TemplateData")]
        getter template_data : String

        # The name of the configuration set to use when you send an email using SendTemplatedEmail .

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # The reply-to email address(es) for the message. If the recipient replies to the message, each
        # reply-to address receives the reply.

        @[JSON::Field(key: "ReplyToAddresses")]
        getter reply_to_addresses : Array(String)?

        # The email address that bounces and complaints are forwarded to when feedback forwarding is enabled.
        # If the message cannot be delivered to the recipient, then an error message is returned from the
        # recipient's ISP; this message is forwarded to the email address specified by the ReturnPath
        # parameter. The ReturnPath parameter is never overwritten. This email address must be either
        # individually verified with Amazon SES, or from a domain that has been verified with Amazon SES.

        @[JSON::Field(key: "ReturnPath")]
        getter return_path : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the ReturnPath parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to use feedback@example.com , then you would specify the ReturnPathArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the ReturnPath to be
        # feedback@example.com . For more information about sending authorization, see the Amazon SES
        # Developer Guide .

        @[JSON::Field(key: "ReturnPathArn")]
        getter return_path_arn : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to send for the email address
        # specified in the Source parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com ) attaches a policy to it that authorizes
        # you to send from user@example.com , then you would specify the SourceArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com , and the Source to be user@example.com .
        # For more information about sending authorization, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using
        # SendTemplatedEmail . Tags correspond to characteristics of the email that you define, so that you
        # can publish email sending events.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::MessageTag)?

        # The ARN of the template to use when sending this email.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @destination : Types::Destination,
          @source : String,
          @template : String,
          @template_data : String,
          @configuration_set_name : String? = nil,
          @reply_to_addresses : Array(String)? = nil,
          @return_path : String? = nil,
          @return_path_arn : String? = nil,
          @source_arn : String? = nil,
          @tags : Array(Types::MessageTag)? = nil,
          @template_arn : String? = nil
        )
        end
      end


      struct SendTemplatedEmailResponse
        include JSON::Serializable

        # The unique message identifier returned from the SendTemplatedEmail action.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        def initialize(
          @message_id : String
        )
        end
      end

      # Represents a request to set a receipt rule set as the active receipt rule set. You use receipt rule
      # sets to receive email with Amazon SES. For more information, see the Amazon SES Developer Guide .

      struct SetActiveReceiptRuleSetRequest
        include JSON::Serializable

        # The name of the receipt rule set to make active. Setting this value to null disables all email
        # receiving.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String?

        def initialize(
          @rule_set_name : String? = nil
        )
        end
      end

      # An empty element returned on a successful request.

      struct SetActiveReceiptRuleSetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to enable or disable Amazon SES Easy DKIM signing for an identity. For more
      # information about setting up Easy DKIM, see the Amazon SES Developer Guide .

      struct SetIdentityDkimEnabledRequest
        include JSON::Serializable

        # Sets whether DKIM signing is enabled for an identity. Set to true to enable DKIM signing for this
        # identity; false to disable it.

        @[JSON::Field(key: "DkimEnabled")]
        getter dkim_enabled : Bool

        # The identity for which DKIM signing should be enabled or disabled.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        def initialize(
          @dkim_enabled : Bool,
          @identity : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct SetIdentityDkimEnabledResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to enable or disable whether Amazon SES forwards you bounce and complaint
      # notifications through email. For information about email feedback forwarding, see the Amazon SES
      # Developer Guide .

      struct SetIdentityFeedbackForwardingEnabledRequest
        include JSON::Serializable

        # Sets whether Amazon SES forwards bounce and complaint notifications as email. true specifies that
        # Amazon SES forwards bounce and complaint notifications as email, in addition to any Amazon SNS topic
        # publishing otherwise specified. false specifies that Amazon SES publishes bounce and complaint
        # notifications only through Amazon SNS. This value can only be set to false when Amazon SNS topics
        # are set for both Bounce and Complaint notification types.

        @[JSON::Field(key: "ForwardingEnabled")]
        getter forwarding_enabled : Bool

        # The identity for which to set bounce and complaint notification forwarding. Examples:
        # user@example.com , example.com .

        @[JSON::Field(key: "Identity")]
        getter identity : String

        def initialize(
          @forwarding_enabled : Bool,
          @identity : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct SetIdentityFeedbackForwardingEnabledResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to set whether Amazon SES includes the original email headers in the Amazon SNS
      # notifications of a specified type. For information about notifications, see the Amazon SES Developer
      # Guide .

      struct SetIdentityHeadersInNotificationsEnabledRequest
        include JSON::Serializable

        # Sets whether Amazon SES includes the original email headers in Amazon SNS notifications of the
        # specified notification type. A value of true specifies that Amazon SES includes headers in
        # notifications, and a value of false specifies that Amazon SES does not include headers in
        # notifications. This value can only be set when NotificationType is already set to use a particular
        # Amazon SNS topic.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The identity for which to enable or disable headers in notifications. Examples: user@example.com ,
        # example.com .

        @[JSON::Field(key: "Identity")]
        getter identity : String

        # The notification type for which to enable or disable headers in notifications.

        @[JSON::Field(key: "NotificationType")]
        getter notification_type : String

        def initialize(
          @enabled : Bool,
          @identity : String,
          @notification_type : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct SetIdentityHeadersInNotificationsEnabledResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to enable or disable the Amazon SES custom MAIL FROM domain setup for a
      # verified identity. For information about using a custom MAIL FROM domain, see the Amazon SES
      # Developer Guide .

      struct SetIdentityMailFromDomainRequest
        include JSON::Serializable

        # The verified identity.

        @[JSON::Field(key: "Identity")]
        getter identity : String

        # The action for Amazon SES to take if it cannot successfully read the required MX record when you
        # send an email. If you choose UseDefaultValue , Amazon SES uses amazonses.com (or a subdomain of
        # that) as the MAIL FROM domain. If you choose RejectMessage , Amazon SES returns a
        # MailFromDomainNotVerified error and not send the email. The action specified in BehaviorOnMXFailure
        # is taken when the custom MAIL FROM domain setup is in the Pending , Failed , and TemporaryFailure
        # states.

        @[JSON::Field(key: "BehaviorOnMXFailure")]
        getter behavior_on_mx_failure : String?

        # The custom MAIL FROM domain for the verified identity to use. The MAIL FROM domain must 1) be a
        # subdomain of the verified identity, 2) not be used in a "From" address if the MAIL FROM domain is
        # the destination of email feedback forwarding (for more information, see the Amazon SES Developer
        # Guide ), and 3) not be used to receive emails. A value of null disables the custom MAIL FROM setting
        # for the identity.

        @[JSON::Field(key: "MailFromDomain")]
        getter mail_from_domain : String?

        def initialize(
          @identity : String,
          @behavior_on_mx_failure : String? = nil,
          @mail_from_domain : String? = nil
        )
        end
      end

      # An empty element returned on a successful request.

      struct SetIdentityMailFromDomainResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to specify the Amazon SNS topic to which Amazon SES publishes bounce,
      # complaint, or delivery notifications for emails sent with that identity as the source. For
      # information about Amazon SES notifications, see the Amazon SES Developer Guide .

      struct SetIdentityNotificationTopicRequest
        include JSON::Serializable

        # The identity (email address or domain) for the Amazon SNS topic. You can only specify a verified
        # identity for this parameter. You can specify an identity by using its name or by using its Amazon
        # Resource Name (ARN). The following examples are all valid identities: sender@example.com ,
        # example.com , arn:aws:ses:us-east-1:123456789012:identity/example.com .

        @[JSON::Field(key: "Identity")]
        getter identity : String

        # The type of notifications that are published to the specified Amazon SNS topic.

        @[JSON::Field(key: "NotificationType")]
        getter notification_type : String

        # The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter is omitted from the request
        # or a null value is passed, SnsTopic is cleared and publishing is disabled.

        @[JSON::Field(key: "SnsTopic")]
        getter sns_topic : String?

        def initialize(
          @identity : String,
          @notification_type : String,
          @sns_topic : String? = nil
        )
        end
      end

      # An empty element returned on a successful request.

      struct SetIdentityNotificationTopicResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to set the position of a receipt rule in a receipt rule set. You use receipt
      # rule sets to receive email with Amazon SES. For more information, see the Amazon SES Developer Guide
      # .

      struct SetReceiptRulePositionRequest
        include JSON::Serializable

        # The name of the receipt rule to reposition.

        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The name of the receipt rule set that contains the receipt rule to reposition.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        # The name of the receipt rule after which to place the specified receipt rule.

        @[JSON::Field(key: "After")]
        getter after : String?

        def initialize(
          @rule_name : String,
          @rule_set_name : String,
          @after : String? = nil
        )
        end
      end

      # An empty element returned on a successful request.

      struct SetReceiptRulePositionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # When included in a receipt rule, this action terminates the evaluation of the receipt rule set and,
      # optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS). For
      # information about setting a stop action in a receipt rule, see the Amazon SES Developer Guide .

      struct StopAction
        include JSON::Serializable

        # The scope of the StopAction. The only acceptable value is RuleSet .

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the stop action is taken. You
        # can find the ARN of a topic by using the ListTopics Amazon SNS operation. For more information about
        # Amazon SNS topics, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @scope : String,
          @topic_arn : String? = nil
        )
        end
      end

      # The content of the email, composed of a subject line and either an HTML part or a text-only part.

      struct Template
        include JSON::Serializable

        # The name of the template. You use this name when you send email using the SendTemplatedEmail or
        # SendBulkTemplatedEmail operations.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The HTML body of the email.

        @[JSON::Field(key: "HtmlPart")]
        getter html_part : String?

        # The subject line of the email.

        @[JSON::Field(key: "SubjectPart")]
        getter subject_part : String?

        # The email body that is visible to recipients whose email clients do not display HTML content.

        @[JSON::Field(key: "TextPart")]
        getter text_part : String?

        def initialize(
          @template_name : String,
          @html_part : String? = nil,
          @subject_part : String? = nil,
          @text_part : String? = nil
        )
        end
      end

      # Indicates that the Template object you specified does not exist in your Amazon SES account.

      struct TemplateDoesNotExistException
        include JSON::Serializable


        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @template_name : String? = nil
        )
        end
      end

      # Contains information about an email template.

      struct TemplateMetadata
        include JSON::Serializable

        # The time and date the template was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The name of the template.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @name : String? = nil
        )
        end
      end


      struct TestRenderTemplateRequest
        include JSON::Serializable

        # A list of replacement values to apply to the template. This parameter is a JSON object, typically
        # consisting of key-value pairs in which the keys correspond to replacement tags in the email
        # template.

        @[JSON::Field(key: "TemplateData")]
        getter template_data : String

        # The name of the template to render.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_data : String,
          @template_name : String
        )
        end
      end


      struct TestRenderTemplateResponse
        include JSON::Serializable

        # The complete MIME message rendered by applying the data in the TemplateData parameter to the
        # template specified in the TemplateName parameter.

        @[JSON::Field(key: "RenderedTemplate")]
        getter rendered_template : String?

        def initialize(
          @rendered_template : String? = nil
        )
        end
      end

      # A domain that is used to redirect email recipients to an Amazon SES-operated domain. This domain
      # captures open and click events generated by Amazon SES emails. For more information, see Configuring
      # Custom Domains to Handle Open and Click Tracking in the Amazon SES Developer Guide .

      struct TrackingOptions
        include JSON::Serializable

        # The custom subdomain that is used to redirect email recipients to the Amazon SES event tracking
        # domain.

        @[JSON::Field(key: "CustomRedirectDomain")]
        getter custom_redirect_domain : String?

        def initialize(
          @custom_redirect_domain : String? = nil
        )
        end
      end

      # Indicates that the configuration set you specified already contains a TrackingOptions object.

      struct TrackingOptionsAlreadyExistsException
        include JSON::Serializable

        # Indicates that a TrackingOptions object already exists in the specified configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @configuration_set_name : String? = nil
        )
        end
      end

      # Indicates that the TrackingOptions object you specified does not exist.

      struct TrackingOptionsDoesNotExistException
        include JSON::Serializable

        # Indicates that a TrackingOptions object does not exist in the specified configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @configuration_set_name : String? = nil
        )
        end
      end

      # Represents a request to enable or disable the email sending capabilities for your entire Amazon SES
      # account.

      struct UpdateAccountSendingEnabledRequest
        include JSON::Serializable

        # Describes whether email sending is enabled or disabled for your Amazon SES account in the current
        # Amazon Web Services Region.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Represents a request to update the event destination of a configuration set. Configuration sets
      # enable you to publish email sending events. For information about using configuration sets, see the
      # Amazon SES Developer Guide .

      struct UpdateConfigurationSetEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set that contains the event destination.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The event destination object.

        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestination

        def initialize(
          @configuration_set_name : String,
          @event_destination : Types::EventDestination
        )
        end
      end

      # An empty element returned on a successful request.

      struct UpdateConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to modify the reputation metric publishing settings for a configuration set.

      struct UpdateConfigurationSetReputationMetricsEnabledRequest
        include JSON::Serializable

        # The name of the configuration set to update.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # Describes whether or not Amazon SES publishes reputation metrics for the configuration set, such as
        # bounce and complaint rates, to Amazon CloudWatch.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @configuration_set_name : String,
          @enabled : Bool
        )
        end
      end

      # Represents a request to enable or disable the email sending capabilities for a specific
      # configuration set.

      struct UpdateConfigurationSetSendingEnabledRequest
        include JSON::Serializable

        # The name of the configuration set to update.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # Describes whether email sending is enabled or disabled for the configuration set.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @configuration_set_name : String,
          @enabled : Bool
        )
        end
      end

      # Represents a request to update the tracking options for a configuration set.

      struct UpdateConfigurationSetTrackingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String


        @[JSON::Field(key: "TrackingOptions")]
        getter tracking_options : Types::TrackingOptions

        def initialize(
          @configuration_set_name : String,
          @tracking_options : Types::TrackingOptions
        )
        end
      end

      # An empty element returned on a successful request.

      struct UpdateConfigurationSetTrackingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to update an existing custom verification email template.

      struct UpdateCustomVerificationEmailTemplateRequest
        include JSON::Serializable

        # The name of the custom verification email template to update.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The URL that the recipient of the verification email is sent to if his or her address is not
        # successfully verified.

        @[JSON::Field(key: "FailureRedirectionURL")]
        getter failure_redirection_url : String?

        # The email address that the custom verification email is sent from.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # The URL that the recipient of the verification email is sent to if his or her address is
        # successfully verified.

        @[JSON::Field(key: "SuccessRedirectionURL")]
        getter success_redirection_url : String?

        # The content of the custom verification email. The total size of the email must be less than 10 MB.
        # The message body may contain HTML, with some limitations. For more information, see Custom
        # Verification Email Frequently Asked Questions in the Amazon SES Developer Guide .

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : String?

        # The subject line of the custom verification email.

        @[JSON::Field(key: "TemplateSubject")]
        getter template_subject : String?

        def initialize(
          @template_name : String,
          @failure_redirection_url : String? = nil,
          @from_email_address : String? = nil,
          @success_redirection_url : String? = nil,
          @template_content : String? = nil,
          @template_subject : String? = nil
        )
        end
      end

      # Represents a request to update a receipt rule. You use receipt rules to receive email with Amazon
      # SES. For more information, see the Amazon SES Developer Guide .

      struct UpdateReceiptRuleRequest
        include JSON::Serializable

        # A data structure that contains the updated receipt rule information.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::ReceiptRule

        # The name of the receipt rule set that the receipt rule belongs to.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        def initialize(
          @rule : Types::ReceiptRule,
          @rule_set_name : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct UpdateReceiptRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "Template")]
        getter template : Types::Template

        def initialize(
          @template : Types::Template
        )
        end
      end


      struct UpdateTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to generate the CNAME records needed to set up Easy DKIM with Amazon SES. For
      # more information about setting up Easy DKIM, see the Amazon SES Developer Guide .

      struct VerifyDomainDkimRequest
        include JSON::Serializable

        # The name of the domain to be verified for Easy DKIM signing.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        def initialize(
          @domain : String
        )
        end
      end

      # Returns CNAME records that you must publish to the DNS server of your domain to set up Easy DKIM
      # with Amazon SES.

      struct VerifyDomainDkimResponse
        include JSON::Serializable

        # A set of character strings that represent the domain's identity. If the identity is an email
        # address, the tokens represent the domain of that address. Using these tokens, you need to create DNS
        # CNAME records that point to DKIM public keys that are hosted by Amazon SES. Amazon Web Services
        # eventually detects that you've updated your DNS records. This detection process might take up to 72
        # hours. After successful detection, Amazon SES is able to DKIM-sign email originating from that
        # domain. (This only applies to domain identities, not email address identities.) For more information
        # about creating DNS records using DKIM tokens, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "DkimTokens")]
        getter dkim_tokens : Array(String)

        def initialize(
          @dkim_tokens : Array(String)
        )
        end
      end

      # Represents a request to begin Amazon SES domain verification and to generate the TXT records that
      # you must publish to the DNS server of your domain to complete the verification. For information
      # about domain verification, see the Amazon SES Developer Guide .

      struct VerifyDomainIdentityRequest
        include JSON::Serializable

        # The domain to be verified.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        def initialize(
          @domain : String
        )
        end
      end

      # Returns a TXT record that you must publish to the DNS server of your domain to complete domain
      # verification with Amazon SES.

      struct VerifyDomainIdentityResponse
        include JSON::Serializable

        # A TXT record that you must place in the DNS settings of the domain to complete domain verification
        # with Amazon SES. As Amazon SES searches for the TXT record, the domain's verification status is
        # "Pending". When Amazon SES detects the record, the domain's verification status changes to
        # "Success". If Amazon SES is unable to detect the record within 72 hours, the domain's verification
        # status changes to "Failed." In that case, to verify the domain, you must restart the verification
        # process from the beginning. The domain's verification status also changes to "Success" when it is
        # DKIM verified.

        @[JSON::Field(key: "VerificationToken")]
        getter verification_token : String

        def initialize(
          @verification_token : String
        )
        end
      end

      # Represents a request to begin email address verification with Amazon SES. For information about
      # email address verification, see the Amazon SES Developer Guide .

      struct VerifyEmailAddressRequest
        include JSON::Serializable

        # The email address to be verified.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @email_address : String
        )
        end
      end

      # Represents a request to begin email address verification with Amazon SES. For information about
      # email address verification, see the Amazon SES Developer Guide .

      struct VerifyEmailIdentityRequest
        include JSON::Serializable

        # The email address to be verified.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @email_address : String
        )
        end
      end

      # An empty element returned on a successful request.

      struct VerifyEmailIdentityResponse
        include JSON::Serializable

        def initialize
        end
      end

      # When included in a receipt rule, this action calls Amazon WorkMail and, optionally, publishes a
      # notification to Amazon Simple Notification Service (Amazon SNS). It usually isn't necessary to set
      # this up manually, because Amazon WorkMail adds the rule automatically during its setup procedure.
      # For information using a receipt rule to call Amazon WorkMail, see the Amazon SES Developer Guide .

      struct WorkmailAction
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon WorkMail organization. Amazon WorkMail ARNs use the
        # following format:
        # arn:aws:workmail:&lt;region&gt;:&lt;awsAccountId&gt;:organization/&lt;workmailOrganizationId&gt; You
        # can find the ID of your organization by using the ListOrganizations operation in Amazon WorkMail.
        # Amazon WorkMail organization IDs begin with " m- ", followed by a string of alphanumeric characters.
        # For information about Amazon WorkMail organizations, see the Amazon WorkMail Administrator Guide .

        @[JSON::Field(key: "OrganizationArn")]
        getter organization_arn : String

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the WorkMail action is called.
        # You can find the ARN of a topic by using the ListTopics operation in Amazon SNS. For more
        # information about Amazon SNS topics, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @organization_arn : String,
          @topic_arn : String? = nil
        )
        end
      end
    end
  end
end
