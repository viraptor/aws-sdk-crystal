require "json"
require "time"

module Aws
  module SESv2
    module Types

      # An object that contains information about your account details.

      struct AccountDetails
        include JSON::Serializable

        # Additional email addresses where updates are sent about your account review process.

        @[JSON::Field(key: "AdditionalContactEmailAddresses")]
        getter additional_contact_email_addresses : Array(String)?

        # The language you would prefer for the case. The contact language can be one of ENGLISH or JAPANESE .

        @[JSON::Field(key: "ContactLanguage")]
        getter contact_language : String?

        # The type of email your account is sending. The mail type can be one of the following: MARKETING –
        # Most of your sending traffic is to keep your customers informed of your latest offering.
        # TRANSACTIONAL – Most of your sending traffic is to communicate during a transaction with a customer.

        @[JSON::Field(key: "MailType")]
        getter mail_type : String?

        # Information about the review of the latest details you submitted.

        @[JSON::Field(key: "ReviewDetails")]
        getter review_details : Types::ReviewDetails?

        # A description of the types of email that you plan to send.

        @[JSON::Field(key: "UseCaseDescription")]
        getter use_case_description : String?

        # The URL of your website. This information helps us better understand the type of content that you
        # plan to send.

        @[JSON::Field(key: "WebsiteURL")]
        getter website_url : String?

        def initialize(
          @additional_contact_email_addresses : Array(String)? = nil,
          @contact_language : String? = nil,
          @mail_type : String? = nil,
          @review_details : Types::ReviewDetails? = nil,
          @use_case_description : String? = nil,
          @website_url : String? = nil
        )
        end
      end

      # The message can't be sent because the account's ability to send email has been permanently
      # restricted.

      struct AccountSuspendedException
        include JSON::Serializable

        def initialize
        end
      end

      # The resource specified in your request already exists.

      struct AlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # Used to associate a configuration set with a MailManager archive.

      struct ArchivingOptions
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the MailManager archive where the Amazon SES API v2 will archive
        # sent emails.

        @[JSON::Field(key: "ArchiveArn")]
        getter archive_arn : String?

        def initialize(
          @archive_arn : String? = nil
        )
        end
      end

      # Contains metadata and attachment raw content.

      struct Attachment
        include JSON::Serializable

        # The file name for the attachment as it will appear in the email. Amazon SES restricts certain file
        # extensions. To ensure attachments are accepted, check the Unsupported attachment types in the Amazon
        # SES Developer Guide.

        @[JSON::Field(key: "FileName")]
        getter file_name : String

        # The raw data of the attachment. It needs to be base64-encoded if you are accessing Amazon SES
        # directly through the HTTPS interface. If you are accessing Amazon SES using an Amazon Web Services
        # SDK, the SDK takes care of the base 64-encoding for you.

        @[JSON::Field(key: "RawContent")]
        getter raw_content : Bytes

        # A brief description of the attachment content.

        @[JSON::Field(key: "ContentDescription")]
        getter content_description : String?

        # A standard descriptor indicating how the attachment should be rendered in the email. Supported
        # values: ATTACHMENT or INLINE .

        @[JSON::Field(key: "ContentDisposition")]
        getter content_disposition : String?

        # Unique identifier for the attachment, used for referencing attachments with INLINE disposition in
        # HTML content.

        @[JSON::Field(key: "ContentId")]
        getter content_id : String?

        # Specifies how the attachment is encoded. Supported values: BASE64 , QUOTED_PRINTABLE , SEVEN_BIT .

        @[JSON::Field(key: "ContentTransferEncoding")]
        getter content_transfer_encoding : String?

        # The MIME type of the attachment. Example: application/pdf , image/jpeg

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        def initialize(
          @file_name : String,
          @raw_content : Bytes,
          @content_description : String? = nil,
          @content_disposition : String? = nil,
          @content_id : String? = nil,
          @content_transfer_encoding : String? = nil,
          @content_type : String? = nil
        )
        end
      end

      # The input you provided is invalid.

      struct BadRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a single metric data query to include in a batch.

      struct BatchGetMetricDataQuery
        include JSON::Serializable

        # Represents the end date for the query interval.

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time

        # The query identifier.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The queried metric. This can be one of the following: SEND – Emails sent eligible for tracking in
        # the VDM dashboard. This excludes emails sent to the mailbox simulator and emails addressed to more
        # than one recipient. COMPLAINT – Complaints received for your account. This excludes complaints from
        # the mailbox simulator, those originating from your account-level suppression list (if enabled), and
        # those for emails addressed to more than one recipient PERMANENT_BOUNCE – Permanent bounces - i.e.
        # feedback received for emails sent to non-existent mailboxes. Excludes bounces from the mailbox
        # simulator, those originating from your account-level suppression list (if enabled), and those for
        # emails addressed to more than one recipient. TRANSIENT_BOUNCE – Transient bounces - i.e. feedback
        # received for delivery failures excluding issues with non-existent mailboxes. Excludes bounces from
        # the mailbox simulator, and those for emails addressed to more than one recipient. OPEN – Unique open
        # events for emails including open trackers. Excludes opens for emails addressed to more than one
        # recipient. CLICK – Unique click events for emails including wrapped links. Excludes clicks for
        # emails addressed to more than one recipient. DELIVERY – Successful deliveries for email sending
        # attempts. Excludes deliveries to the mailbox simulator and for emails addressed to more than one
        # recipient. DELIVERY_OPEN – Successful deliveries for email sending attempts. Excludes deliveries to
        # the mailbox simulator, for emails addressed to more than one recipient, and emails without open
        # trackers. DELIVERY_CLICK – Successful deliveries for email sending attempts. Excludes deliveries to
        # the mailbox simulator, for emails addressed to more than one recipient, and emails without click
        # trackers. DELIVERY_COMPLAINT – Successful deliveries for email sending attempts. Excludes deliveries
        # to the mailbox simulator, for emails addressed to more than one recipient, and emails addressed to
        # recipients hosted by ISPs with which Amazon SES does not have a feedback loop agreement.

        @[JSON::Field(key: "Metric")]
        getter metric : String

        # The query namespace - e.g. VDM

        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # Represents the start date for the query interval.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time

        # An object that contains mapping between MetricDimensionName and MetricDimensionValue to filter
        # metrics by.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Hash(String, String)?

        def initialize(
          @end_date : Time,
          @id : String,
          @metric : String,
          @namespace : String,
          @start_date : Time,
          @dimensions : Hash(String, String)? = nil
        )
        end
      end

      # Represents a request to retrieve a batch of metric data.

      struct BatchGetMetricDataRequest
        include JSON::Serializable

        # A list of queries for metrics to be retrieved.

        @[JSON::Field(key: "Queries")]
        getter queries : Array(Types::BatchGetMetricDataQuery)

        def initialize(
          @queries : Array(Types::BatchGetMetricDataQuery)
        )
        end
      end

      # Represents the result of processing your metric data batch request

      struct BatchGetMetricDataResponse
        include JSON::Serializable

        # A list of MetricDataError encountered while processing your metric data batch request.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::MetricDataError)?

        # A list of successfully retrieved MetricDataResult .

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::MetricDataResult)?

        def initialize(
          @errors : Array(Types::MetricDataError)? = nil,
          @results : Array(Types::MetricDataResult)? = nil
        )
        end
      end

      # An object that contains information about a blacklisting event that impacts one of the dedicated IP
      # addresses that is associated with your account.

      struct BlacklistEntry
        include JSON::Serializable

        # Additional information about the blacklisting event, as provided by the blacklist maintainer.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time when the blacklisting event occurred.

        @[JSON::Field(key: "ListingTime")]
        getter listing_time : Time?

        # The name of the blacklist that the IP address appears on.

        @[JSON::Field(key: "RblName")]
        getter rbl_name : String?

        def initialize(
          @description : String? = nil,
          @listing_time : Time? = nil,
          @rbl_name : String? = nil
        )
        end
      end

      # Represents the body of the email message.

      struct Body
        include JSON::Serializable

        # An object that represents the version of the message that is displayed in email clients that support
        # HTML. HTML messages can include formatted text, hyperlinks, images, and more.

        @[JSON::Field(key: "Html")]
        getter html : Types::Content?

        # An object that represents the version of the message that is displayed in email clients that don't
        # support HTML, or clients where the recipient has disabled HTML rendering.

        @[JSON::Field(key: "Text")]
        getter text : Types::Content?

        def initialize(
          @html : Types::Content? = nil,
          @text : Types::Content? = nil
        )
        end
      end

      # Information about a Bounce event.

      struct Bounce
        include JSON::Serializable

        # The subtype of the bounce, as determined by SES.

        @[JSON::Field(key: "BounceSubType")]
        getter bounce_sub_type : String?

        # The type of the bounce, as determined by SES. Can be one of UNDETERMINED , TRANSIENT , or PERMANENT

        @[JSON::Field(key: "BounceType")]
        getter bounce_type : String?

        # The status code issued by the reporting Message Transfer Authority (MTA). This field only appears if
        # a delivery status notification (DSN) was attached to the bounce and the Diagnostic-Code was provided
        # in the DSN.

        @[JSON::Field(key: "DiagnosticCode")]
        getter diagnostic_code : String?

        def initialize(
          @bounce_sub_type : String? = nil,
          @bounce_type : String? = nil,
          @diagnostic_code : String? = nil
        )
        end
      end

      # An object that contains the body of the message. You can specify a template message.

      struct BulkEmailContent
        include JSON::Serializable

        # The template to use for the bulk email message.

        @[JSON::Field(key: "Template")]
        getter template : Types::Template?

        def initialize(
          @template : Types::Template? = nil
        )
        end
      end


      struct BulkEmailEntry
        include JSON::Serializable

        # Represents the destination of the message, consisting of To:, CC:, and BCC: fields. Amazon SES does
        # not support the SMTPUTF8 extension, as described in RFC6531 . For this reason, the local part of a
        # destination email address (the part of the email address that precedes the @ sign) may only contain
        # 7-bit ASCII characters . If the domain part of an address (the part after the @ sign) contains
        # non-ASCII characters, they must be encoded using Punycode, as described in RFC3492 .

        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # The ReplacementEmailContent associated with a BulkEmailEntry .

        @[JSON::Field(key: "ReplacementEmailContent")]
        getter replacement_email_content : Types::ReplacementEmailContent?

        # The list of message headers associated with the BulkEmailEntry data type. Headers Not Present in
        # BulkEmailEntry : If a header is specified in Template but not in BulkEmailEntry , the header from
        # Template will be added to the outgoing email. Headers Present in BulkEmailEntry : If a header is
        # specified in BulkEmailEntry , it takes precedence over any header of the same name specified in
        # Template : If the header is also defined within Template , the value from BulkEmailEntry will
        # replace the header's value in the email. If the header is not defined within Template , it will
        # simply be added to the email as specified in BulkEmailEntry .

        @[JSON::Field(key: "ReplacementHeaders")]
        getter replacement_headers : Array(Types::MessageHeader)?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using the
        # SendBulkTemplatedEmail operation. Tags correspond to characteristics of the email that you define,
        # so that you can publish email sending events.

        @[JSON::Field(key: "ReplacementTags")]
        getter replacement_tags : Array(Types::MessageTag)?

        def initialize(
          @destination : Types::Destination,
          @replacement_email_content : Types::ReplacementEmailContent? = nil,
          @replacement_headers : Array(Types::MessageHeader)? = nil,
          @replacement_tags : Array(Types::MessageTag)? = nil
        )
        end
      end

      # The result of the SendBulkEmail operation of each specified BulkEmailEntry .

      struct BulkEmailEntryResult
        include JSON::Serializable

        # A description of an error that prevented a message being sent using the SendBulkTemplatedEmail
        # operation.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # The unique message identifier returned from the SendBulkTemplatedEmail operation.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The status of a message sent using the SendBulkTemplatedEmail operation. Possible values for this
        # parameter include: SUCCESS: Amazon SES accepted the message, and will attempt to deliver it to the
        # recipients. MESSAGE_REJECTED: The message was rejected because it contained a virus.
        # MAIL_FROM_DOMAIN_NOT_VERIFIED: The sender's email address or domain was not verified.
        # CONFIGURATION_SET_DOES_NOT_EXIST: The configuration set you specified does not exist.
        # TEMPLATE_DOES_NOT_EXIST: The template you specified does not exist. ACCOUNT_SUSPENDED: Your account
        # has been shut down because of issues related to your email sending practices. ACCOUNT_THROTTLED: The
        # number of emails you can send has been reduced because your account has exceeded its allocated
        # sending limit. ACCOUNT_DAILY_QUOTA_EXCEEDED: You have reached or exceeded the maximum number of
        # emails you can send from your account in a 24-hour period. INVALID_SENDING_POOL_NAME: The
        # configuration set you specified refers to an IP pool that does not exist. ACCOUNT_SENDING_PAUSED:
        # Email sending for the Amazon SES account was disabled using the UpdateAccountSendingEnabled
        # operation. CONFIGURATION_SET_SENDING_PAUSED: Email sending for this configuration set was disabled
        # using the UpdateConfigurationSetSendingEnabled operation. INVALID_PARAMETER_VALUE: One or more of
        # the parameters you specified when calling this operation was invalid. See the error message for
        # additional information. TRANSIENT_FAILURE: Amazon SES was unable to process your request because of
        # a temporary issue. FAILED: Amazon SES was unable to process your request. See the error message for
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

      # Represents a request to cancel an export job using the export job ID.

      struct CancelExportJobRequest
        include JSON::Serializable

        # The export job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CancelExportJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that defines an Amazon CloudWatch destination for email events. You can use Amazon
      # CloudWatch to monitor and gain insights on your email sending metrics.

      struct CloudWatchDestination
        include JSON::Serializable

        # An array of objects that define the dimensions to use when you send email events to Amazon
        # CloudWatch.

        @[JSON::Field(key: "DimensionConfigurations")]
        getter dimension_configurations : Array(Types::CloudWatchDimensionConfiguration)

        def initialize(
          @dimension_configurations : Array(Types::CloudWatchDimensionConfiguration)
        )
        end
      end

      # An object that defines the dimension configuration to use when you send email events to Amazon
      # CloudWatch.

      struct CloudWatchDimensionConfiguration
        include JSON::Serializable

        # The default value of the dimension that is published to Amazon CloudWatch if you don't provide the
        # value of the dimension when you send an email. This value has to meet the following criteria: Can
        # only contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_), or dashes (-), at signs (@),
        # and periods (.). It can contain no more than 256 characters.

        @[JSON::Field(key: "DefaultDimensionValue")]
        getter default_dimension_value : String

        # The name of an Amazon CloudWatch dimension associated with an email sending metric. The name has to
        # meet the following criteria: It can only contain ASCII letters (a–z, A–Z), numbers (0–9),
        # underscores (_), or dashes (-). It can contain no more than 256 characters.

        @[JSON::Field(key: "DimensionName")]
        getter dimension_name : String

        # The location where the Amazon SES API v2 finds the value of a dimension to publish to Amazon
        # CloudWatch. To use the message tags that you specify using an X-SES-MESSAGE-TAGS header or a
        # parameter to the SendEmail or SendRawEmail API, choose messageTag . To use your own email headers,
        # choose emailHeader . To use link tags, choose linkTags .

        @[JSON::Field(key: "DimensionValueSource")]
        getter dimension_value_source : String

        def initialize(
          @default_dimension_value : String,
          @dimension_name : String,
          @dimension_value_source : String
        )
        end
      end

      # Information about a Complaint event.

      struct Complaint
        include JSON::Serializable

        # The value of the Feedback-Type field from the feedback report received from the ISP.

        @[JSON::Field(key: "ComplaintFeedbackType")]
        getter complaint_feedback_type : String?

        # Can either be null or OnAccountSuppressionList . If the value is OnAccountSuppressionList , SES
        # accepted the message, but didn't attempt to send it because it was on the account-level suppression
        # list.

        @[JSON::Field(key: "ComplaintSubType")]
        getter complaint_sub_type : String?

        def initialize(
          @complaint_feedback_type : String? = nil,
          @complaint_sub_type : String? = nil
        )
        end
      end

      # The resource is being modified by another operation or thread.

      struct ConcurrentModificationException
        include JSON::Serializable

        def initialize
        end
      end

      # If there is already an ongoing account details update under review.

      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end

      # A contact is the end-user who is receiving the email.

      struct Contact
        include JSON::Serializable

        # The contact's email address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # A timestamp noting the last time the contact's information was updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The default topic preferences applied to the contact.

        @[JSON::Field(key: "TopicDefaultPreferences")]
        getter topic_default_preferences : Array(Types::TopicPreference)?

        # The contact's preference for being opted-in to or opted-out of a topic.

        @[JSON::Field(key: "TopicPreferences")]
        getter topic_preferences : Array(Types::TopicPreference)?

        # A boolean value status noting if the contact is unsubscribed from all contact list topics.

        @[JSON::Field(key: "UnsubscribeAll")]
        getter unsubscribe_all : Bool?

        def initialize(
          @email_address : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @topic_default_preferences : Array(Types::TopicPreference)? = nil,
          @topic_preferences : Array(Types::TopicPreference)? = nil,
          @unsubscribe_all : Bool? = nil
        )
        end
      end

      # A list that contains contacts that have subscribed to a particular topic or topics.

      struct ContactList
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String?

        # A timestamp noting the last time the contact list was updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        def initialize(
          @contact_list_name : String? = nil,
          @last_updated_timestamp : Time? = nil
        )
        end
      end

      # An object that contains details about the action of a contact list.

      struct ContactListDestination
        include JSON::Serializable

        # &gt;The type of action to perform on the addresses. The following are the possible values: PUT: add
        # the addresses to the contact list. If the record already exists, it will override it with the new
        # value. DELETE: remove the addresses from the contact list.

        @[JSON::Field(key: "ContactListImportAction")]
        getter contact_list_import_action : String

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        def initialize(
          @contact_list_import_action : String,
          @contact_list_name : String
        )
        end
      end

      # An object that represents the content of the email, and optionally a character set specification.

      struct Content
        include JSON::Serializable

        # The content of the message itself.

        @[JSON::Field(key: "Data")]
        getter data : String

        # The character set for the content. Because of the constraints of the SMTP protocol, Amazon SES uses
        # 7-bit ASCII by default. If the text includes characters outside of the ASCII range, you have to
        # specify a character set. For example, you could specify UTF-8 , ISO-8859-1 , or Shift_JIS .

        @[JSON::Field(key: "Charset")]
        getter charset : String?

        def initialize(
          @data : String,
          @charset : String? = nil
        )
        end
      end

      # A request to add an event destination to a configuration set.

      struct CreateConfigurationSetEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set .

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # An object that defines the event destination.

        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestinationDefinition

        # A name that identifies the event destination within the configuration set.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String

        def initialize(
          @configuration_set_name : String,
          @event_destination : Types::EventDestinationDefinition,
          @event_destination_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to create a configuration set.

      struct CreateConfigurationSetRequest
        include JSON::Serializable

        # The name of the configuration set. The name can contain up to 64 alphanumeric characters, including
        # letters, numbers, hyphens (-) and underscores (_) only.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # An object that defines the MailManager archiving options for emails that you send using the
        # configuration set.

        @[JSON::Field(key: "ArchivingOptions")]
        getter archiving_options : Types::ArchivingOptions?

        # An object that defines the dedicated IP pool that is used to send emails that you send using the
        # configuration set.

        @[JSON::Field(key: "DeliveryOptions")]
        getter delivery_options : Types::DeliveryOptions?

        # An object that defines whether or not Amazon SES collects reputation metrics for the emails that you
        # send that use the configuration set.

        @[JSON::Field(key: "ReputationOptions")]
        getter reputation_options : Types::ReputationOptions?

        # An object that defines whether or not Amazon SES can send email that you send using the
        # configuration set.

        @[JSON::Field(key: "SendingOptions")]
        getter sending_options : Types::SendingOptions?


        @[JSON::Field(key: "SuppressionOptions")]
        getter suppression_options : Types::SuppressionOptions?

        # An array of objects that define the tags (keys and values) to associate with the configuration set.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # An object that defines the open and click tracking options for emails that you send using the
        # configuration set.

        @[JSON::Field(key: "TrackingOptions")]
        getter tracking_options : Types::TrackingOptions?

        # An object that defines the VDM options for emails that you send using the configuration set.

        @[JSON::Field(key: "VdmOptions")]
        getter vdm_options : Types::VdmOptions?

        def initialize(
          @configuration_set_name : String,
          @archiving_options : Types::ArchivingOptions? = nil,
          @delivery_options : Types::DeliveryOptions? = nil,
          @reputation_options : Types::ReputationOptions? = nil,
          @sending_options : Types::SendingOptions? = nil,
          @suppression_options : Types::SuppressionOptions? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tracking_options : Types::TrackingOptions? = nil,
          @vdm_options : Types::VdmOptions? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateConfigurationSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateContactListRequest
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # A description of what the contact list is about.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags associated with a contact list.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # An interest group, theme, or label within a list. A contact list can have multiple topics.

        @[JSON::Field(key: "Topics")]
        getter topics : Array(Types::Topic)?

        def initialize(
          @contact_list_name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @topics : Array(Types::Topic)? = nil
        )
        end
      end


      struct CreateContactListResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateContactRequest
        include JSON::Serializable

        # The name of the contact list to which the contact should be added.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # The contact's email address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # The attribute data attached to a contact.

        @[JSON::Field(key: "AttributesData")]
        getter attributes_data : String?

        # The contact's preferences for being opted-in to or opted-out of topics.

        @[JSON::Field(key: "TopicPreferences")]
        getter topic_preferences : Array(Types::TopicPreference)?

        # A boolean value status noting if the contact is unsubscribed from all contact list topics.

        @[JSON::Field(key: "UnsubscribeAll")]
        getter unsubscribe_all : Bool?

        def initialize(
          @contact_list_name : String,
          @email_address : String,
          @attributes_data : String? = nil,
          @topic_preferences : Array(Types::TopicPreference)? = nil,
          @unsubscribe_all : Bool? = nil
        )
        end
      end


      struct CreateContactResponse
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
        # verification email frequently asked questions in the Amazon SES Developer Guide .

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : String

        # The name of the custom verification email template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # The subject line of the custom verification email.

        @[JSON::Field(key: "TemplateSubject")]
        getter template_subject : String

        # An array of objects that define the tags (keys and values) to associate with the custom verification
        # email template.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @failure_redirection_url : String,
          @from_email_address : String,
          @success_redirection_url : String,
          @template_content : String,
          @template_name : String,
          @template_subject : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct CreateCustomVerificationEmailTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to create a new dedicated IP pool.

      struct CreateDedicatedIpPoolRequest
        include JSON::Serializable

        # The name of the dedicated IP pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # The type of scaling mode.

        @[JSON::Field(key: "ScalingMode")]
        getter scaling_mode : String?

        # An object that defines the tags (keys and values) that you want to associate with the pool.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @pool_name : String,
          @scaling_mode : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateDedicatedIpPoolResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to perform a predictive inbox placement test. Predictive inbox placement tests can help
      # you predict how your messages will be handled by various email providers around the world. When you
      # perform a predictive inbox placement test, you provide a sample message that contains the content
      # that you plan to send to your customers. We send that message to special email addresses spread
      # across several major email providers around the world. The test takes about 24 hours to complete.
      # When the test is complete, you can use the GetDeliverabilityTestReport operation to view the results
      # of the test.

      struct CreateDeliverabilityTestReportRequest
        include JSON::Serializable

        # The HTML body of the message that you sent when you performed the predictive inbox placement test.

        @[JSON::Field(key: "Content")]
        getter content : Types::EmailContent

        # The email address that the predictive inbox placement test email was sent from.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String

        # A unique name that helps you to identify the predictive inbox placement test when you retrieve the
        # results.

        @[JSON::Field(key: "ReportName")]
        getter report_name : String?

        # An array of objects that define the tags (keys and values) that you want to associate with the
        # predictive inbox placement test.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @content : Types::EmailContent,
          @from_email_address : String,
          @report_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about the predictive inbox placement test that you created.

      struct CreateDeliverabilityTestReportResponse
        include JSON::Serializable

        # The status of the predictive inbox placement test. If the status is IN_PROGRESS , then the
        # predictive inbox placement test is currently running. Predictive inbox placement tests are usually
        # complete within 24 hours of creating the test. If the status is COMPLETE , then the test is
        # finished, and you can use the GetDeliverabilityTestReport to view the results of the test.

        @[JSON::Field(key: "DeliverabilityTestStatus")]
        getter deliverability_test_status : String

        # A unique string that identifies the predictive inbox placement test.

        @[JSON::Field(key: "ReportId")]
        getter report_id : String

        def initialize(
          @deliverability_test_status : String,
          @report_id : String
        )
        end
      end

      # Represents a request to create a sending authorization policy for an identity. Sending authorization
      # is an Amazon SES feature that enables you to authorize other senders to use your identities. For
      # information, see the Amazon SES Developer Guide .

      struct CreateEmailIdentityPolicyRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The text of the policy in JSON format. The policy cannot exceed 4 KB. For information about the
        # syntax of sending authorization policies, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The name of the policy. The policy name cannot exceed 64 characters and can only include
        # alphanumeric characters, dashes, and underscores.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @email_identity : String,
          @policy : String,
          @policy_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateEmailIdentityPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to begin the verification process for an email identity (an email address or domain).

      struct CreateEmailIdentityRequest
        include JSON::Serializable

        # The email address or domain to verify.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The configuration set to use by default when sending from this identity. Note that any configuration
        # set defined in the email sending request takes precedence.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # If your request includes this object, Amazon SES configures the identity to use Bring Your Own DKIM
        # (BYODKIM) for DKIM authentication purposes, or, configures the key length to be used for Easy DKIM .
        # You can only specify this object if the email identity is a domain, as opposed to an address.

        @[JSON::Field(key: "DkimSigningAttributes")]
        getter dkim_signing_attributes : Types::DkimSigningAttributes?

        # An array of objects that define the tags (keys and values) to associate with the email identity.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @email_identity : String,
          @configuration_set_name : String? = nil,
          @dkim_signing_attributes : Types::DkimSigningAttributes? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # If the email identity is a domain, this object contains information about the DKIM verification
      # status for the domain. If the email identity is an email address, this object is empty.

      struct CreateEmailIdentityResponse
        include JSON::Serializable

        # An object that contains information about the DKIM attributes for the identity.

        @[JSON::Field(key: "DkimAttributes")]
        getter dkim_attributes : Types::DkimAttributes?

        # The email identity type. Note: the MANAGED_DOMAIN identity type is not supported.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # Specifies whether or not the identity is verified. You can only send email from verified email
        # addresses or domains. For more information about verifying identities, see the Amazon Pinpoint User
        # Guide .

        @[JSON::Field(key: "VerifiedForSendingStatus")]
        getter verified_for_sending_status : Bool?

        def initialize(
          @dkim_attributes : Types::DkimAttributes? = nil,
          @identity_type : String? = nil,
          @verified_for_sending_status : Bool? = nil
        )
        end
      end

      # Represents a request to create an email template. For more information, see the Amazon SES Developer
      # Guide .

      struct CreateEmailTemplateRequest
        include JSON::Serializable

        # The content of the email template, composed of a subject line, an HTML part, and a text-only part.

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : Types::EmailTemplateContent

        # The name of the template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # An array of objects that define the tags (keys and values) to associate with the email template.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @template_content : Types::EmailTemplateContent,
          @template_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct CreateEmailTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to create an export job from a data source to a data destination.

      struct CreateExportJobRequest
        include JSON::Serializable

        # The data source for the export job.

        @[JSON::Field(key: "ExportDataSource")]
        getter export_data_source : Types::ExportDataSource

        # The destination for the export job.

        @[JSON::Field(key: "ExportDestination")]
        getter export_destination : Types::ExportDestination

        def initialize(
          @export_data_source : Types::ExportDataSource,
          @export_destination : Types::ExportDestination
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateExportJobResponse
        include JSON::Serializable

        # A string that represents the export job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      # Represents a request to create an import job from a data source for a data destination.

      struct CreateImportJobRequest
        include JSON::Serializable

        # The data source for the import job.

        @[JSON::Field(key: "ImportDataSource")]
        getter import_data_source : Types::ImportDataSource

        # The destination for the import job.

        @[JSON::Field(key: "ImportDestination")]
        getter import_destination : Types::ImportDestination

        def initialize(
          @import_data_source : Types::ImportDataSource,
          @import_destination : Types::ImportDestination
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateImportJobResponse
        include JSON::Serializable

        # A string that represents the import job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      # Represents a request to create a multi-region endpoint (global-endpoint).

      struct CreateMultiRegionEndpointRequest
        include JSON::Serializable

        # Contains details of a multi-region endpoint (global-endpoint) being created.

        @[JSON::Field(key: "Details")]
        getter details : Types::Details

        # The name of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # An array of objects that define the tags (keys and values) to associate with the multi-region
        # endpoint (global-endpoint).

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @details : Types::Details,
          @endpoint_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateMultiRegionEndpointResponse
        include JSON::Serializable

        # The ID of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # A status of the multi-region endpoint (global-endpoint) right after the create request. CREATING –
        # The resource is being provisioned. READY – The resource is ready to use. FAILED – The resource
        # failed to be provisioned. DELETING – The resource is being deleted as requested.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @endpoint_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents a request to create a tenant. Tenants are logical containers that group related SES
      # resources together. Each tenant can have its own set of resources like email identities,
      # configuration sets, and templates, along with reputation metrics and sending status. This helps
      # isolate and manage email sending for different customers or business units within your Amazon SES
      # API v2 account.

      struct CreateTenantRequest
        include JSON::Serializable

        # The name of the tenant to create. The name can contain up to 64 alphanumeric characters, including
        # letters, numbers, hyphens (-) and underscores (_) only.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String

        # An array of objects that define the tags (keys and values) to associate with the tenant

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tenant_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents a request to associate a resource with a tenant. Resources can be email identities,
      # configuration sets, or email templates. When you associate a resource with a tenant, you can use
      # that resource when sending emails on behalf of that tenant.

      struct CreateTenantResourceAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to associate with the tenant.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The name of the tenant to associate the resource with.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String

        def initialize(
          @resource_arn : String,
          @tenant_name : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct CreateTenantResourceAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a newly created tenant.

      struct CreateTenantResponse
        include JSON::Serializable

        # The date and time when the tenant was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The status of email sending capability for the tenant.

        @[JSON::Field(key: "SendingStatus")]
        getter sending_status : String?

        # An array of objects that define the tags (keys and values) associated with the tenant.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Resource Name (ARN) of the tenant.

        @[JSON::Field(key: "TenantArn")]
        getter tenant_arn : String?

        # A unique identifier for the tenant.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String?

        # The name of the tenant.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @sending_status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tenant_arn : String? = nil,
          @tenant_id : String? = nil,
          @tenant_name : String? = nil
        )
        end
      end

      # Contains information about a custom verification email template.

      struct CustomVerificationEmailTemplateMetadata
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

      # An object that contains information about the volume of email sent on each day of the analysis
      # period.

      struct DailyVolume
        include JSON::Serializable

        # An object that contains inbox placement metrics for a specified day in the analysis period, broken
        # out by the recipient's email provider.

        @[JSON::Field(key: "DomainIspPlacements")]
        getter domain_isp_placements : Array(Types::DomainIspPlacement)?

        # The date that the DailyVolume metrics apply to, in Unix time.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time?

        # An object that contains inbox placement metrics for a specific day in the analysis period.

        @[JSON::Field(key: "VolumeStatistics")]
        getter volume_statistics : Types::VolumeStatistics?

        def initialize(
          @domain_isp_placements : Array(Types::DomainIspPlacement)? = nil,
          @start_date : Time? = nil,
          @volume_statistics : Types::VolumeStatistics? = nil
        )
        end
      end

      # An object containing additional settings for your VDM configuration as applicable to the Dashboard.

      struct DashboardAttributes
        include JSON::Serializable

        # Specifies the status of your VDM engagement metrics collection. Can be one of the following: ENABLED
        # – Amazon SES enables engagement metrics for your account. DISABLED – Amazon SES disables engagement
        # metrics for your account.

        @[JSON::Field(key: "EngagementMetrics")]
        getter engagement_metrics : String?

        def initialize(
          @engagement_metrics : String? = nil
        )
        end
      end

      # An object containing additional settings for your VDM configuration as applicable to the Dashboard.

      struct DashboardOptions
        include JSON::Serializable

        # Specifies the status of your VDM engagement metrics collection. Can be one of the following: ENABLED
        # – Amazon SES enables engagement metrics for the configuration set. DISABLED – Amazon SES disables
        # engagement metrics for the configuration set.

        @[JSON::Field(key: "EngagementMetrics")]
        getter engagement_metrics : String?

        def initialize(
          @engagement_metrics : String? = nil
        )
        end
      end

      # Contains information about a dedicated IP address that is associated with your Amazon SES account.
      # To learn more about requesting dedicated IP addresses, see Requesting and Relinquishing Dedicated IP
      # Addresses in the Amazon SES Developer Guide .

      struct DedicatedIp
        include JSON::Serializable

        # An IPv4 address.

        @[JSON::Field(key: "Ip")]
        getter ip : String

        # Indicates the progress of your dedicated IP warm-up: 0-100 – For standard dedicated IP addresses,
        # this shows the warm-up completion percentage. A value of 100 means the IP address is fully warmed up
        # and ready for use. -1 – Appears for IP addresses in managed dedicated pools where Amazon SES
        # automatically handles the warm-up process, making the percentage not applicable.

        @[JSON::Field(key: "WarmupPercentage")]
        getter warmup_percentage : Int32

        # The warm-up status of a dedicated IP address. The status can have one of the following values:
        # IN_PROGRESS – The IP address isn't ready to use because the dedicated IP warm-up process is ongoing.
        # DONE – The dedicated IP warm-up process is complete, and the IP address is ready to use.
        # NOT_APPLICABLE – The warm-up status doesn't apply to this IP address. This status is used for IP
        # addresses in managed dedicated IP pools, where Amazon SES automatically handles the warm-up process.

        @[JSON::Field(key: "WarmupStatus")]
        getter warmup_status : String

        # The name of the dedicated IP pool that the IP address is associated with.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String?

        def initialize(
          @ip : String,
          @warmup_percentage : Int32,
          @warmup_status : String,
          @pool_name : String? = nil
        )
        end
      end

      # Contains information about a dedicated IP pool.

      struct DedicatedIpPool
        include JSON::Serializable

        # The name of the dedicated IP pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # The type of the dedicated IP pool. STANDARD – A dedicated IP pool where you can control which IPs
        # are part of the pool. MANAGED – A dedicated IP pool where the reputation and number of IPs are
        # automatically managed by Amazon SES.

        @[JSON::Field(key: "ScalingMode")]
        getter scaling_mode : String

        def initialize(
          @pool_name : String,
          @scaling_mode : String
        )
        end
      end

      # A request to delete an event destination from a configuration set.

      struct DeleteConfigurationSetEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set that contains the event destination to delete.

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

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct DeleteConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to delete a configuration set.

      struct DeleteConfigurationSetRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct DeleteConfigurationSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContactListRequest
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        def initialize(
          @contact_list_name : String
        )
        end
      end


      struct DeleteContactListResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContactRequest
        include JSON::Serializable

        # The name of the contact list from which the contact should be removed.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # The contact's email address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @contact_list_name : String,
          @email_address : String
        )
        end
      end


      struct DeleteContactResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete an existing custom verification email template.

      struct DeleteCustomVerificationEmailTemplateRequest
        include JSON::Serializable

        # The name of the custom verification email template that you want to delete.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct DeleteCustomVerificationEmailTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to delete a dedicated IP pool.

      struct DeleteDedicatedIpPoolRequest
        include JSON::Serializable

        # The name of the dedicated IP pool that you want to delete.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        def initialize(
          @pool_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct DeleteDedicatedIpPoolResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete a sending authorization policy for an identity. Sending authorization
      # is an Amazon SES feature that enables you to authorize other senders to use your identities. For
      # information, see the Amazon SES Developer Guide .

      struct DeleteEmailIdentityPolicyRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The name of the policy. The policy name cannot exceed 64 characters and can only include
        # alphanumeric characters, dashes, and underscores.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @email_identity : String,
          @policy_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct DeleteEmailIdentityPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to delete an existing email identity. When you delete an identity, you lose the ability to
      # send email from that identity. You can restore your ability to send email by completing the
      # verification process for the identity again.

      struct DeleteEmailIdentityRequest
        include JSON::Serializable

        # The identity (that is, the email address or domain) to delete.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        def initialize(
          @email_identity : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct DeleteEmailIdentityResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete an email template. For more information, see the Amazon SES Developer
      # Guide .

      struct DeleteEmailTemplateRequest
        include JSON::Serializable

        # The name of the template to be deleted.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct DeleteEmailTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete a multi-region endpoint (global-endpoint).

      struct DeleteMultiRegionEndpointRequest
        include JSON::Serializable

        # The name of the multi-region endpoint (global-endpoint) to be deleted.

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        def initialize(
          @endpoint_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct DeleteMultiRegionEndpointResponse
        include JSON::Serializable

        # A status of the multi-region endpoint (global-endpoint) right after the delete request. CREATING –
        # The resource is being provisioned. READY – The resource is ready to use. FAILED – The resource
        # failed to be provisioned. DELETING – The resource is being deleted as requested.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # A request to remove an email address from the suppression list for your account.

      struct DeleteSuppressedDestinationRequest
        include JSON::Serializable

        # The suppressed email destination to remove from the account suppression list.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @email_address : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct DeleteSuppressedDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to delete a tenant.

      struct DeleteTenantRequest
        include JSON::Serializable

        # The name of the tenant to delete.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String

        def initialize(
          @tenant_name : String
        )
        end
      end

      # Represents a request to delete an association between a tenant and a resource.

      struct DeleteTenantResourceAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove from the tenant association.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The name of the tenant to remove the resource association from.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String

        def initialize(
          @resource_arn : String,
          @tenant_name : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct DeleteTenantResourceAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct DeleteTenantResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that contains metadata related to a predictive inbox placement test.

      struct DeliverabilityTestReport
        include JSON::Serializable

        # The date and time when the predictive inbox placement test was created.

        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The status of the predictive inbox placement test. If the status is IN_PROGRESS , then the
        # predictive inbox placement test is currently running. Predictive inbox placement tests are usually
        # complete within 24 hours of creating the test. If the status is COMPLETE , then the test is
        # finished, and you can use the GetDeliverabilityTestReport to view the results of the test.

        @[JSON::Field(key: "DeliverabilityTestStatus")]
        getter deliverability_test_status : String?

        # The sender address that you specified for the predictive inbox placement test.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # A unique string that identifies the predictive inbox placement test.

        @[JSON::Field(key: "ReportId")]
        getter report_id : String?

        # A name that helps you identify a predictive inbox placement test report.

        @[JSON::Field(key: "ReportName")]
        getter report_name : String?

        # The subject line for an email that you submitted in a predictive inbox placement test.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        def initialize(
          @create_date : Time? = nil,
          @deliverability_test_status : String? = nil,
          @from_email_address : String? = nil,
          @report_id : String? = nil,
          @report_name : String? = nil,
          @subject : String? = nil
        )
        end
      end

      # Used to associate a configuration set with a dedicated IP pool.

      struct DeliveryOptions
        include JSON::Serializable

        # The maximum amount of time, in seconds, that Amazon SES API v2 will attempt delivery of email. If
        # specified, the value must greater than or equal to 300 seconds (5 minutes) and less than or equal to
        # 50400 seconds (840 minutes).

        @[JSON::Field(key: "MaxDeliverySeconds")]
        getter max_delivery_seconds : Int64?

        # The name of the dedicated IP pool to associate with the configuration set.

        @[JSON::Field(key: "SendingPoolName")]
        getter sending_pool_name : String?

        # Specifies whether messages that use the configuration set are required to use Transport Layer
        # Security (TLS). If the value is Require , messages are only delivered if a TLS connection can be
        # established. If the value is Optional , messages can be delivered in plain text if a TLS connection
        # can't be established.

        @[JSON::Field(key: "TlsPolicy")]
        getter tls_policy : String?

        def initialize(
          @max_delivery_seconds : Int64? = nil,
          @sending_pool_name : String? = nil,
          @tls_policy : String? = nil
        )
        end
      end

      # An object that describes the recipients for an email. Amazon SES does not support the SMTPUTF8
      # extension, as described in RFC6531 . For this reason, the local part of a destination email address
      # (the part of the email address that precedes the @ sign) may only contain 7-bit ASCII characters .
      # If the domain part of an address (the part after the @ sign) contains non-ASCII characters, they
      # must be encoded using Punycode, as described in RFC3492 .

      struct Destination
        include JSON::Serializable

        # An array that contains the email addresses of the "BCC" (blind carbon copy) recipients for the
        # email.

        @[JSON::Field(key: "BccAddresses")]
        getter bcc_addresses : Array(String)?

        # An array that contains the email addresses of the "CC" (carbon copy) recipients for the email.

        @[JSON::Field(key: "CcAddresses")]
        getter cc_addresses : Array(String)?

        # An array that contains the email addresses of the "To" recipients for the email.

        @[JSON::Field(key: "ToAddresses")]
        getter to_addresses : Array(String)?

        def initialize(
          @bcc_addresses : Array(String)? = nil,
          @cc_addresses : Array(String)? = nil,
          @to_addresses : Array(String)? = nil
        )
        end
      end

      # An object that contains configuration details of multi-region endpoint (global-endpoint).

      struct Details
        include JSON::Serializable

        # A list of route configuration details. Must contain exactly one route configuration.

        @[JSON::Field(key: "RoutesDetails")]
        getter routes_details : Array(Types::RouteDetails)

        def initialize(
          @routes_details : Array(Types::RouteDetails)
        )
        end
      end

      # An object that contains information about the DKIM authentication status for an email identity.
      # Amazon SES determines the authentication status by searching for specific records in the DNS
      # configuration for the domain. If you used Easy DKIM to set up DKIM authentication, Amazon SES tries
      # to find three unique CNAME records in the DNS configuration for your domain. If you provided a
      # public key to perform DKIM authentication, Amazon SES tries to find a TXT record that uses the
      # selector that you specified. The value of the TXT record must be a public key that's paired with the
      # private key that you specified in the process of creating the identity

      struct DkimAttributes
        include JSON::Serializable

        # [Easy DKIM] The key length of the DKIM key pair in use.

        @[JSON::Field(key: "CurrentSigningKeyLength")]
        getter current_signing_key_length : String?

        # [Easy DKIM] The last time a key pair was generated for this identity.

        @[JSON::Field(key: "LastKeyGenerationTimestamp")]
        getter last_key_generation_timestamp : Time?

        # [Easy DKIM] The key length of the future DKIM key pair to be generated. This can be changed at most
        # once per day.

        @[JSON::Field(key: "NextSigningKeyLength")]
        getter next_signing_key_length : String?

        # A string that indicates how DKIM was configured for the identity. These are the possible values:
        # AWS_SES – Indicates that DKIM was configured for the identity by using Easy DKIM . EXTERNAL –
        # Indicates that DKIM was configured for the identity by using Bring Your Own DKIM (BYODKIM).
        # AWS_SES_AF_SOUTH_1 – Indicates that DKIM was configured for the identity by replicating signing
        # attributes from a parent identity in Africa (Cape Town) region using Deterministic Easy-DKIM (DEED).
        # AWS_SES_EU_NORTH_1 – Indicates that DKIM was configured for the identity by replicating signing
        # attributes from a parent identity in Europe (Stockholm) region using Deterministic Easy-DKIM (DEED).
        # AWS_SES_AP_SOUTH_1 – Indicates that DKIM was configured for the identity by replicating signing
        # attributes from a parent identity in Asia Pacific (Mumbai) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_AP_SOUTH_2 – Indicates that DKIM was configured for the identity by replicating
        # signing attributes from a parent identity in Asia Pacific (Hyderabad) region using Deterministic
        # Easy-DKIM (DEED). AWS_SES_EU_WEST_3 – Indicates that DKIM was configured for the identity by
        # replicating signing attributes from a parent identity in Europe (Paris) region using Deterministic
        # Easy-DKIM (DEED). AWS_SES_EU_WEST_2 – Indicates that DKIM was configured for the identity by
        # replicating signing attributes from a parent identity in Europe (London) region using Deterministic
        # Easy-DKIM (DEED). AWS_SES_EU_SOUTH_1 – Indicates that DKIM was configured for the identity by
        # replicating signing attributes from a parent identity in Europe (Milan) region using Deterministic
        # Easy-DKIM (DEED). AWS_SES_EU_WEST_1 – Indicates that DKIM was configured for the identity by
        # replicating signing attributes from a parent identity in Europe (Ireland) region using Deterministic
        # Easy-DKIM (DEED). AWS_SES_AP_NORTHEAST_3 – Indicates that DKIM was configured for the identity by
        # replicating signing attributes from a parent identity in Asia Pacific (Osaka) region using
        # Deterministic Easy-DKIM (DEED). AWS_SES_AP_NORTHEAST_2 – Indicates that DKIM was configured for the
        # identity by replicating signing attributes from a parent identity in Asia Pacific (Seoul) region
        # using Deterministic Easy-DKIM (DEED). AWS_SES_ME_CENTRAL_1 – Indicates that DKIM was configured for
        # the identity by replicating signing attributes from a parent identity in Middle East (UAE) region
        # using Deterministic Easy-DKIM (DEED). AWS_SES_ME_SOUTH_1 – Indicates that DKIM was configured for
        # the identity by replicating signing attributes from a parent identity in Middle East (Bahrain)
        # region using Deterministic Easy-DKIM (DEED). AWS_SES_AP_NORTHEAST_1 – Indicates that DKIM was
        # configured for the identity by replicating signing attributes from a parent identity in Asia Pacific
        # (Tokyo) region using Deterministic Easy-DKIM (DEED). AWS_SES_IL_CENTRAL_1 – Indicates that DKIM was
        # configured for the identity by replicating signing attributes from a parent identity in Israel (Tel
        # Aviv) region using Deterministic Easy-DKIM (DEED). AWS_SES_SA_EAST_1 – Indicates that DKIM was
        # configured for the identity by replicating signing attributes from a parent identity in South
        # America (São Paulo) region using Deterministic Easy-DKIM (DEED). AWS_SES_CA_CENTRAL_1 – Indicates
        # that DKIM was configured for the identity by replicating signing attributes from a parent identity
        # in Canada (Central) region using Deterministic Easy-DKIM (DEED). AWS_SES_CA_WEST_1 – Indicates that
        # DKIM was configured for the identity by replicating signing attributes from a parent identity in
        # Canada (Calgary) region using Deterministic Easy-DKIM (DEED). AWS_SES_AP_SOUTHEAST_1 – Indicates
        # that DKIM was configured for the identity by replicating signing attributes from a parent identity
        # in Asia Pacific (Singapore) region using Deterministic Easy-DKIM (DEED). AWS_SES_AP_SOUTHEAST_2 –
        # Indicates that DKIM was configured for the identity by replicating signing attributes from a parent
        # identity in Asia Pacific (Sydney) region using Deterministic Easy-DKIM (DEED).
        # AWS_SES_AP_SOUTHEAST_3 – Indicates that DKIM was configured for the identity by replicating signing
        # attributes from a parent identity in Asia Pacific (Jakarta) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_AP_SOUTHEAST_5 – Indicates that DKIM was configured for the identity by replicating
        # signing attributes from a parent identity in Asia Pacific (Malaysia) region using Deterministic
        # Easy-DKIM (DEED). AWS_SES_EU_CENTRAL_1 – Indicates that DKIM was configured for the identity by
        # replicating signing attributes from a parent identity in Europe (Frankfurt) region using
        # Deterministic Easy-DKIM (DEED). AWS_SES_EU_CENTRAL_2 – Indicates that DKIM was configured for the
        # identity by replicating signing attributes from a parent identity in Europe (Zurich) region using
        # Deterministic Easy-DKIM (DEED). AWS_SES_US_EAST_1 – Indicates that DKIM was configured for the
        # identity by replicating signing attributes from a parent identity in US East (N. Virginia) region
        # using Deterministic Easy-DKIM (DEED). AWS_SES_US_EAST_2 – Indicates that DKIM was configured for the
        # identity by replicating signing attributes from a parent identity in US East (Ohio) region using
        # Deterministic Easy-DKIM (DEED). AWS_SES_US_WEST_1 – Indicates that DKIM was configured for the
        # identity by replicating signing attributes from a parent identity in US West (N. California) region
        # using Deterministic Easy-DKIM (DEED). AWS_SES_US_WEST_2 – Indicates that DKIM was configured for the
        # identity by replicating signing attributes from a parent identity in US West (Oregon) region using
        # Deterministic Easy-DKIM (DEED).

        @[JSON::Field(key: "SigningAttributesOrigin")]
        getter signing_attributes_origin : String?

        # If the value is true , then the messages that you send from the identity are signed using DKIM. If
        # the value is false , then the messages that you send from the identity aren't DKIM-signed.

        @[JSON::Field(key: "SigningEnabled")]
        getter signing_enabled : Bool?

        # The hosted zone where Amazon SES publishes the DKIM public key TXT records for this email identity.
        # This value indicates the DNS zone that customers must reference when configuring their CNAME records
        # for DKIM authentication. When configuring DKIM for your domain, create CNAME records in your DNS
        # that point to the selectors in this hosted zone. For example: selector1._domainkey.yourdomain.com
        # CNAME selector1.&lt;SigningHostedZone&gt; selector2._domainkey.yourdomain.com CNAME
        # selector2.&lt;SigningHostedZone&gt; selector3._domainkey.yourdomain.com CNAME
        # selector3.&lt;SigningHostedZone&gt;

        @[JSON::Field(key: "SigningHostedZone")]
        getter signing_hosted_zone : String?

        # Describes whether or not Amazon SES has successfully located the DKIM records in the DNS records for
        # the domain. The status can be one of the following: PENDING – The verification process was
        # initiated, but Amazon SES hasn't yet detected the DKIM records in the DNS configuration for the
        # domain. SUCCESS – The verification process completed successfully. FAILED – The verification process
        # failed. This typically occurs when Amazon SES fails to find the DKIM records in the DNS
        # configuration of the domain. TEMPORARY_FAILURE – A temporary issue is preventing Amazon SES from
        # determining the DKIM authentication status of the domain. NOT_STARTED – The DKIM verification
        # process hasn't been initiated for the domain.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # If you used Easy DKIM to configure DKIM authentication for the domain, then this object contains a
        # set of unique strings that you use to create a set of CNAME records that you add to the DNS
        # configuration for your domain. When Amazon SES detects these records in the DNS configuration for
        # your domain, the DKIM authentication process is complete. If you configured DKIM authentication for
        # the domain by providing your own public-private key pair, then this object contains the selector for
        # the public key. Regardless of the DKIM authentication method you use, Amazon SES searches for the
        # appropriate records in the DNS configuration of the domain for up to 72 hours.

        @[JSON::Field(key: "Tokens")]
        getter tokens : Array(String)?

        def initialize(
          @current_signing_key_length : String? = nil,
          @last_key_generation_timestamp : Time? = nil,
          @next_signing_key_length : String? = nil,
          @signing_attributes_origin : String? = nil,
          @signing_enabled : Bool? = nil,
          @signing_hosted_zone : String? = nil,
          @status : String? = nil,
          @tokens : Array(String)? = nil
        )
        end
      end

      # An object that contains configuration for Bring Your Own DKIM (BYODKIM), or, for Easy DKIM

      struct DkimSigningAttributes
        include JSON::Serializable

        # The attribute to use for configuring DKIM for the identity depends on the operation: For
        # PutEmailIdentityDkimSigningAttributes : None of the values are allowed - use the
        # SigningAttributesOrigin parameter instead For CreateEmailIdentity when replicating a parent
        # identity's DKIM configuration: Allowed values: All values except AWS_SES and EXTERNAL AWS_SES –
        # Configure DKIM for the identity by using Easy DKIM. EXTERNAL – Configure DKIM for the identity by
        # using Bring Your Own DKIM (BYODKIM). AWS_SES_AF_SOUTH_1 – Configure DKIM for the identity by
        # replicating from a parent identity in Africa (Cape Town) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_EU_NORTH_1 – Configure DKIM for the identity by replicating from a parent identity
        # in Europe (Stockholm) region using Deterministic Easy-DKIM (DEED). AWS_SES_AP_SOUTH_1 – Configure
        # DKIM for the identity by replicating from a parent identity in Asia Pacific (Mumbai) region using
        # Deterministic Easy-DKIM (DEED). AWS_SES_AP_SOUTH_2 – Configure DKIM for the identity by replicating
        # from a parent identity in Asia Pacific (Hyderabad) region using Deterministic Easy-DKIM (DEED).
        # AWS_SES_EU_WEST_3 – Configure DKIM for the identity by replicating from a parent identity in Europe
        # (Paris) region using Deterministic Easy-DKIM (DEED). AWS_SES_EU_WEST_2 – Configure DKIM for the
        # identity by replicating from a parent identity in Europe (London) region using Deterministic
        # Easy-DKIM (DEED). AWS_SES_EU_SOUTH_1 – Configure DKIM for the identity by replicating from a parent
        # identity in Europe (Milan) region using Deterministic Easy-DKIM (DEED). AWS_SES_EU_WEST_1 –
        # Configure DKIM for the identity by replicating from a parent identity in Europe (Ireland) region
        # using Deterministic Easy-DKIM (DEED). AWS_SES_AP_NORTHEAST_3 – Configure DKIM for the identity by
        # replicating from a parent identity in Asia Pacific (Osaka) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_AP_NORTHEAST_2 – Configure DKIM for the identity by replicating from a parent
        # identity in Asia Pacific (Seoul) region using Deterministic Easy-DKIM (DEED). AWS_SES_ME_CENTRAL_1 –
        # Configure DKIM for the identity by replicating from a parent identity in Middle East (UAE) region
        # using Deterministic Easy-DKIM (DEED). AWS_SES_ME_SOUTH_1 – Configure DKIM for the identity by
        # replicating from a parent identity in Middle East (Bahrain) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_AP_NORTHEAST_1 – Configure DKIM for the identity by replicating from a parent
        # identity in Asia Pacific (Tokyo) region using Deterministic Easy-DKIM (DEED). AWS_SES_IL_CENTRAL_1 –
        # Configure DKIM for the identity by replicating from a parent identity in Israel (Tel Aviv) region
        # using Deterministic Easy-DKIM (DEED). AWS_SES_SA_EAST_1 – Configure DKIM for the identity by
        # replicating from a parent identity in South America (São Paulo) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_CA_CENTRAL_1 – Configure DKIM for the identity by replicating from a parent identity
        # in Canada (Central) region using Deterministic Easy-DKIM (DEED). AWS_SES_CA_WEST_1 – Configure DKIM
        # for the identity by replicating from a parent identity in Canada (Calgary) region using
        # Deterministic Easy-DKIM (DEED). AWS_SES_AP_SOUTHEAST_1 – Configure DKIM for the identity by
        # replicating from a parent identity in Asia Pacific (Singapore) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_AP_SOUTHEAST_2 – Configure DKIM for the identity by replicating from a parent
        # identity in Asia Pacific (Sydney) region using Deterministic Easy-DKIM (DEED).
        # AWS_SES_AP_SOUTHEAST_3 – Configure DKIM for the identity by replicating from a parent identity in
        # Asia Pacific (Jakarta) region using Deterministic Easy-DKIM (DEED). AWS_SES_AP_SOUTHEAST_5 –
        # Configure DKIM for the identity by replicating from a parent identity in Asia Pacific (Malaysia)
        # region using Deterministic Easy-DKIM (DEED). AWS_SES_EU_CENTRAL_1 – Configure DKIM for the identity
        # by replicating from a parent identity in Europe (Frankfurt) region using Deterministic Easy-DKIM
        # (DEED). AWS_SES_EU_CENTRAL_2 – Configure DKIM for the identity by replicating from a parent identity
        # in Europe (Zurich) region using Deterministic Easy-DKIM (DEED). AWS_SES_US_EAST_1 – Configure DKIM
        # for the identity by replicating from a parent identity in US East (N. Virginia) region using
        # Deterministic Easy-DKIM (DEED). AWS_SES_US_EAST_2 – Configure DKIM for the identity by replicating
        # from a parent identity in US East (Ohio) region using Deterministic Easy-DKIM (DEED).
        # AWS_SES_US_WEST_1 – Configure DKIM for the identity by replicating from a parent identity in US West
        # (N. California) region using Deterministic Easy-DKIM (DEED). AWS_SES_US_WEST_2 – Configure DKIM for
        # the identity by replicating from a parent identity in US West (Oregon) region using Deterministic
        # Easy-DKIM (DEED).

        @[JSON::Field(key: "DomainSigningAttributesOrigin")]
        getter domain_signing_attributes_origin : String?

        # [Bring Your Own DKIM] A private key that's used to generate a DKIM signature. The private key must
        # use 1024 or 2048-bit RSA encryption, and must be encoded using base64 encoding.

        @[JSON::Field(key: "DomainSigningPrivateKey")]
        getter domain_signing_private_key : String?

        # [Bring Your Own DKIM] A string that's used to identify a public key in the DNS configuration for a
        # domain.

        @[JSON::Field(key: "DomainSigningSelector")]
        getter domain_signing_selector : String?

        # [Easy DKIM] The key length of the future DKIM key pair to be generated. This can be changed at most
        # once per day.

        @[JSON::Field(key: "NextSigningKeyLength")]
        getter next_signing_key_length : String?

        def initialize(
          @domain_signing_attributes_origin : String? = nil,
          @domain_signing_private_key : String? = nil,
          @domain_signing_selector : String? = nil,
          @next_signing_key_length : String? = nil
        )
        end
      end

      # An object that contains the deliverability data for a specific campaign. This data is available for
      # a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is
      # enabled for ( PutDeliverabilityDashboardOption operation).

      struct DomainDeliverabilityCampaign
        include JSON::Serializable

        # The unique identifier for the campaign. The Deliverability dashboard automatically generates and
        # assigns this identifier to a campaign.

        @[JSON::Field(key: "CampaignId")]
        getter campaign_id : String?

        # The percentage of email messages that were deleted by recipients, without being opened first. Due to
        # technical limitations, this value only includes recipients who opened the message by using an email
        # client that supports images.

        @[JSON::Field(key: "DeleteRate")]
        getter delete_rate : Float64?

        # The major email providers who handled the email message.

        @[JSON::Field(key: "Esps")]
        getter esps : Array(String)?

        # The first time when the email message was delivered to any recipient's inbox. This value can help
        # you determine how long it took for a campaign to deliver an email message.

        @[JSON::Field(key: "FirstSeenDateTime")]
        getter first_seen_date_time : Time?

        # The verified email address that the email message was sent from.

        @[JSON::Field(key: "FromAddress")]
        getter from_address : String?

        # The URL of an image that contains a snapshot of the email message that was sent.

        @[JSON::Field(key: "ImageUrl")]
        getter image_url : String?

        # The number of email messages that were delivered to recipients’ inboxes.

        @[JSON::Field(key: "InboxCount")]
        getter inbox_count : Int64?

        # The last time when the email message was delivered to any recipient's inbox. This value can help you
        # determine how long it took for a campaign to deliver an email message.

        @[JSON::Field(key: "LastSeenDateTime")]
        getter last_seen_date_time : Time?

        # The projected number of recipients that the email message was sent to.

        @[JSON::Field(key: "ProjectedVolume")]
        getter projected_volume : Int64?

        # The percentage of email messages that were opened and then deleted by recipients. Due to technical
        # limitations, this value only includes recipients who opened the message by using an email client
        # that supports images.

        @[JSON::Field(key: "ReadDeleteRate")]
        getter read_delete_rate : Float64?

        # The percentage of email messages that were opened by recipients. Due to technical limitations, this
        # value only includes recipients who opened the message by using an email client that supports images.

        @[JSON::Field(key: "ReadRate")]
        getter read_rate : Float64?

        # The IP addresses that were used to send the email message.

        @[JSON::Field(key: "SendingIps")]
        getter sending_ips : Array(String)?

        # The number of email messages that were delivered to recipients' spam or junk mail folders.

        @[JSON::Field(key: "SpamCount")]
        getter spam_count : Int64?

        # The subject line, or title, of the email message.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        def initialize(
          @campaign_id : String? = nil,
          @delete_rate : Float64? = nil,
          @esps : Array(String)? = nil,
          @first_seen_date_time : Time? = nil,
          @from_address : String? = nil,
          @image_url : String? = nil,
          @inbox_count : Int64? = nil,
          @last_seen_date_time : Time? = nil,
          @projected_volume : Int64? = nil,
          @read_delete_rate : Float64? = nil,
          @read_rate : Float64? = nil,
          @sending_ips : Array(String)? = nil,
          @spam_count : Int64? = nil,
          @subject : String? = nil
        )
        end
      end

      # An object that contains information about the Deliverability dashboard subscription for a verified
      # domain that you use to send email and currently has an active Deliverability dashboard subscription.
      # If a Deliverability dashboard subscription is active for a domain, you gain access to reputation,
      # inbox placement, and other metrics for the domain.

      struct DomainDeliverabilityTrackingOption
        include JSON::Serializable

        # A verified domain that’s associated with your Amazon Web Services account and currently has an
        # active Deliverability dashboard subscription.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # An object that contains information about the inbox placement data settings for the domain.

        @[JSON::Field(key: "InboxPlacementTrackingOption")]
        getter inbox_placement_tracking_option : Types::InboxPlacementTrackingOption?

        # The date when you enabled the Deliverability dashboard for the domain.

        @[JSON::Field(key: "SubscriptionStartDate")]
        getter subscription_start_date : Time?

        def initialize(
          @domain : String? = nil,
          @inbox_placement_tracking_option : Types::InboxPlacementTrackingOption? = nil,
          @subscription_start_date : Time? = nil
        )
        end
      end

      # An object that contains inbox placement data for email sent from one of your email domains to a
      # specific email provider.

      struct DomainIspPlacement
        include JSON::Serializable

        # The percentage of messages that were sent from the selected domain to the specified email provider
        # that arrived in recipients' inboxes.

        @[JSON::Field(key: "InboxPercentage")]
        getter inbox_percentage : Float64?

        # The total number of messages that were sent from the selected domain to the specified email provider
        # that arrived in recipients' inboxes.

        @[JSON::Field(key: "InboxRawCount")]
        getter inbox_raw_count : Int64?

        # The name of the email provider that the inbox placement data applies to.

        @[JSON::Field(key: "IspName")]
        getter isp_name : String?

        # The percentage of messages that were sent from the selected domain to the specified email provider
        # that arrived in recipients' spam or junk mail folders.

        @[JSON::Field(key: "SpamPercentage")]
        getter spam_percentage : Float64?

        # The total number of messages that were sent from the selected domain to the specified email provider
        # that arrived in recipients' spam or junk mail folders.

        @[JSON::Field(key: "SpamRawCount")]
        getter spam_raw_count : Int64?

        def initialize(
          @inbox_percentage : Float64? = nil,
          @inbox_raw_count : Int64? = nil,
          @isp_name : String? = nil,
          @spam_percentage : Float64? = nil,
          @spam_raw_count : Int64? = nil
        )
        end
      end

      # Contains individual validation checks performed on an email address.

      struct EmailAddressInsightsMailboxEvaluations
        include JSON::Serializable

        # Checks that the domain exists, has valid DNS records, and is conﬁgured to receive email.

        @[JSON::Field(key: "HasValidDnsRecords")]
        getter has_valid_dns_records : Types::EmailAddressInsightsVerdict?

        # Checks that the email address follows proper RFC standards and contains valid characters in the
        # correct format.

        @[JSON::Field(key: "HasValidSyntax")]
        getter has_valid_syntax : Types::EmailAddressInsightsVerdict?

        # Checks disposable or temporary email addresses that could negatively impact your sender reputation.

        @[JSON::Field(key: "IsDisposable")]
        getter is_disposable : Types::EmailAddressInsightsVerdict?

        # Checks if the input appears to be random text.

        @[JSON::Field(key: "IsRandomInput")]
        getter is_random_input : Types::EmailAddressInsightsVerdict?

        # Identiﬁes role-based addresses (such as admin@, support@, or info@) that may have lower engagement
        # rates.

        @[JSON::Field(key: "IsRoleAddress")]
        getter is_role_address : Types::EmailAddressInsightsVerdict?

        # Checks that the mailbox exists and can receive messages without actually sending an email.

        @[JSON::Field(key: "MailboxExists")]
        getter mailbox_exists : Types::EmailAddressInsightsVerdict?

        def initialize(
          @has_valid_dns_records : Types::EmailAddressInsightsVerdict? = nil,
          @has_valid_syntax : Types::EmailAddressInsightsVerdict? = nil,
          @is_disposable : Types::EmailAddressInsightsVerdict? = nil,
          @is_random_input : Types::EmailAddressInsightsVerdict? = nil,
          @is_role_address : Types::EmailAddressInsightsVerdict? = nil,
          @mailbox_exists : Types::EmailAddressInsightsVerdict? = nil
        )
        end
      end

      # Contains the overall validation verdict for an email address.

      struct EmailAddressInsightsVerdict
        include JSON::Serializable

        # The confidence level of the validation verdict.

        @[JSON::Field(key: "ConfidenceVerdict")]
        getter confidence_verdict : String?

        def initialize(
          @confidence_verdict : String? = nil
        )
        end
      end

      # An object that defines the entire content of the email, including the message headers, body content,
      # and attachments. For a simple email message, you specify the subject and provide both text and HTML
      # versions of the message body. You can also add attachments to simple and templated messages. For a
      # raw message, you provide a complete MIME-formatted message, which can include custom headers and
      # attachments.

      struct EmailContent
        include JSON::Serializable

        # The raw email message. The message has to meet the following criteria: The message has to contain a
        # header and a body, separated by one blank line. All of the required header fields must be present in
        # the message. Each part of a multipart MIME message must be formatted properly. If you include
        # attachments, they must be in a file format that the Amazon SES API v2 supports. The raw data of the
        # message needs to base64-encoded if you are accessing Amazon SES directly through the HTTPS
        # interface. If you are accessing Amazon SES using an Amazon Web Services SDK, the SDK takes care of
        # the base 64-encoding for you. If any of the MIME parts in your message contain content that is
        # outside of the 7-bit ASCII character range, you should encode that content to ensure that
        # recipients' email clients render the message properly. The length of any single line of text in the
        # message can't exceed 1,000 characters. This restriction is defined in RFC 5321 .

        @[JSON::Field(key: "Raw")]
        getter raw : Types::RawMessage?

        # The simple email message. The message consists of a subject, message body and attachments list.

        @[JSON::Field(key: "Simple")]
        getter simple : Types::Message?

        # The template to use for the email message.

        @[JSON::Field(key: "Template")]
        getter template : Types::Template?

        def initialize(
          @raw : Types::RawMessage? = nil,
          @simple : Types::Message? = nil,
          @template : Types::Template? = nil
        )
        end
      end

      # An email's insights contain metadata and delivery information about a specific email.

      struct EmailInsights
        include JSON::Serializable

        # The recipient of the email.

        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # A list of events associated with the sent email.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::InsightsEvent)?

        # The recipient's ISP (e.g., Gmail , Yahoo , etc.).

        @[JSON::Field(key: "Isp")]
        getter isp : String?

        def initialize(
          @destination : String? = nil,
          @events : Array(Types::InsightsEvent)? = nil,
          @isp : String? = nil
        )
        end
      end

      # The content of the email, composed of a subject line, an HTML part, and a text-only part.

      struct EmailTemplateContent
        include JSON::Serializable

        # The HTML body of the email.

        @[JSON::Field(key: "Html")]
        getter html : String?

        # The subject line of the email.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        # The email body that will be visible to recipients whose email clients do not display HTML.

        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @html : String? = nil,
          @subject : String? = nil,
          @text : String? = nil
        )
        end
      end

      # Contains information about an email template.

      struct EmailTemplateMetadata
        include JSON::Serializable

        # The time and date the template was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The name of the template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @template_name : String? = nil
        )
        end
      end

      # An object that defines an Amazon EventBridge destination for email events. You can use Amazon
      # EventBridge to send notifications when certain email events occur.

      struct EventBridgeDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon EventBridge bus to publish email events to. Only the
        # default bus is supported.

        @[JSON::Field(key: "EventBusArn")]
        getter event_bus_arn : String

        def initialize(
          @event_bus_arn : String
        )
        end
      end

      # In the Amazon SES API v2, events include message sends, deliveries, opens, clicks, bounces,
      # complaints and delivery delays. Event destinations are places that you can send information about
      # these events to. For example, you can send event data to Amazon SNS to receive notifications when
      # you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to
      # Amazon S3 for long-term storage.

      struct EventDestination
        include JSON::Serializable

        # The types of events that Amazon SES sends to the specified event destinations. SEND - The send
        # request was successful and SES will attempt to deliver the message to the recipient’s mail server.
        # (If account-level or global suppression is being used, SES will still count it as a send, but
        # delivery is suppressed.) REJECT - SES accepted the email, but determined that it contained a virus
        # and didn’t attempt to deliver it to the recipient’s mail server. BOUNCE - ( Hard bounce ) The
        # recipient's mail server permanently rejected the email. ( Soft bounces are only included when SES
        # fails to deliver the email after retrying for a period of time.) COMPLAINT - The email was
        # successfully delivered to the recipient’s mail server, but the recipient marked it as spam. DELIVERY
        # - SES successfully delivered the email to the recipient's mail server. OPEN - The recipient received
        # the message and opened it in their email client. CLICK - The recipient clicked one or more links in
        # the email. RENDERING_FAILURE - The email wasn't sent because of a template rendering issue. This
        # event type can occur when template data is missing, or when there is a mismatch between template
        # parameters and data. (This event type only occurs when you send email using the SendEmail or
        # SendBulkEmail API operations.) DELIVERY_DELAY - The email couldn't be delivered to the recipient’s
        # mail server because a temporary issue occurred. Delivery delays can occur, for example, when the
        # recipient's inbox is full, or when the receiving email server experiences a transient issue.
        # SUBSCRIPTION - The email was successfully delivered, but the recipient updated their subscription
        # preferences by clicking on an unsubscribe link as part of your subscription management .

        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)

        # A name that identifies the event destination.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An object that defines an Amazon CloudWatch destination for email events. You can use Amazon
        # CloudWatch to monitor and gain insights on your email sending metrics.

        @[JSON::Field(key: "CloudWatchDestination")]
        getter cloud_watch_destination : Types::CloudWatchDestination?

        # If true , the event destination is enabled. When the event destination is enabled, the specified
        # event types are sent to the destinations in this EventDestinationDefinition . If false , the event
        # destination is disabled. When the event destination is disabled, events aren't sent to the specified
        # destinations.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # An object that defines an Amazon EventBridge destination for email events. You can use Amazon
        # EventBridge to send notifications when certain email events occur.

        @[JSON::Field(key: "EventBridgeDestination")]
        getter event_bridge_destination : Types::EventBridgeDestination?

        # An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use
        # Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon
        # Redshift.

        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An object that defines an Amazon Pinpoint project destination for email events. You can send email
        # event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards
        # that are built in to Amazon Pinpoint. For more information, see Transactional Messaging Charts in
        # the Amazon Pinpoint User Guide .

        @[JSON::Field(key: "PinpointDestination")]
        getter pinpoint_destination : Types::PinpointDestination?

        # An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send
        # notifications when certain email events occur.

        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @matching_event_types : Array(String),
          @name : String,
          @cloud_watch_destination : Types::CloudWatchDestination? = nil,
          @enabled : Bool? = nil,
          @event_bridge_destination : Types::EventBridgeDestination? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @pinpoint_destination : Types::PinpointDestination? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end

      # An object that defines the event destination. Specifically, it defines which services receive events
      # from emails sent using the configuration set that the event destination is associated with. Also
      # defines the types of events that are sent to the event destination.

      struct EventDestinationDefinition
        include JSON::Serializable

        # An object that defines an Amazon CloudWatch destination for email events. You can use Amazon
        # CloudWatch to monitor and gain insights on your email sending metrics.

        @[JSON::Field(key: "CloudWatchDestination")]
        getter cloud_watch_destination : Types::CloudWatchDestination?

        # If true , the event destination is enabled. When the event destination is enabled, the specified
        # event types are sent to the destinations in this EventDestinationDefinition . If false , the event
        # destination is disabled. When the event destination is disabled, events aren't sent to the specified
        # destinations.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # An object that defines an Amazon EventBridge destination for email events. You can use Amazon
        # EventBridge to send notifications when certain email events occur.

        @[JSON::Field(key: "EventBridgeDestination")]
        getter event_bridge_destination : Types::EventBridgeDestination?

        # An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use
        # Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon
        # Redshift.

        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An array that specifies which events the Amazon SES API v2 should send to the destinations in this
        # EventDestinationDefinition .

        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)?

        # An object that defines an Amazon Pinpoint project destination for email events. You can send email
        # event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards
        # that are built in to Amazon Pinpoint. For more information, see Transactional Messaging Charts in
        # the Amazon Pinpoint User Guide .

        @[JSON::Field(key: "PinpointDestination")]
        getter pinpoint_destination : Types::PinpointDestination?

        # An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send
        # notifications when certain email events occur.

        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @cloud_watch_destination : Types::CloudWatchDestination? = nil,
          @enabled : Bool? = nil,
          @event_bridge_destination : Types::EventBridgeDestination? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @matching_event_types : Array(String)? = nil,
          @pinpoint_destination : Types::PinpointDestination? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end

      # Contains a Bounce object if the event type is BOUNCE . Contains a Complaint object if the event type
      # is COMPLAINT .

      struct EventDetails
        include JSON::Serializable

        # Information about a Bounce event.

        @[JSON::Field(key: "Bounce")]
        getter bounce : Types::Bounce?

        # Information about a Complaint event.

        @[JSON::Field(key: "Complaint")]
        getter complaint : Types::Complaint?

        def initialize(
          @bounce : Types::Bounce? = nil,
          @complaint : Types::Complaint? = nil
        )
        end
      end

      # An object that contains details about the data source of the export job. It can only contain one of
      # MetricsDataSource or MessageInsightsDataSource object.

      struct ExportDataSource
        include JSON::Serializable


        @[JSON::Field(key: "MessageInsightsDataSource")]
        getter message_insights_data_source : Types::MessageInsightsDataSource?


        @[JSON::Field(key: "MetricsDataSource")]
        getter metrics_data_source : Types::MetricsDataSource?

        def initialize(
          @message_insights_data_source : Types::MessageInsightsDataSource? = nil,
          @metrics_data_source : Types::MetricsDataSource? = nil
        )
        end
      end

      # An object that contains details about the destination of the export job.

      struct ExportDestination
        include JSON::Serializable

        # The data format of the final export job file, can be one of the following: CSV - A comma-separated
        # values file. JSON - A Json file.

        @[JSON::Field(key: "DataFormat")]
        getter data_format : String

        # An Amazon S3 pre-signed URL that points to the generated export file.

        @[JSON::Field(key: "S3Url")]
        getter s3_url : String?

        def initialize(
          @data_format : String,
          @s3_url : String? = nil
        )
        end
      end

      # A summary of the export job.

      struct ExportJobSummary
        include JSON::Serializable

        # The timestamp of when the export job was completed.

        @[JSON::Field(key: "CompletedTimestamp")]
        getter completed_timestamp : Time?

        # The timestamp of when the export job was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The source type of the export job.

        @[JSON::Field(key: "ExportSourceType")]
        getter export_source_type : String?

        # The export job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the export job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @completed_timestamp : Time? = nil,
          @created_timestamp : Time? = nil,
          @export_source_type : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      # An object that contains a mapping between a Metric and MetricAggregation .

      struct ExportMetric
        include JSON::Serializable


        @[JSON::Field(key: "Aggregation")]
        getter aggregation : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @aggregation : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Statistics about the execution of an export job.

      struct ExportStatistics
        include JSON::Serializable

        # The number of records that were exported to the final export file. This value might not be available
        # for all export source types

        @[JSON::Field(key: "ExportedRecordsCount")]
        getter exported_records_count : Int32?

        # The number of records that were processed to generate the final export file.

        @[JSON::Field(key: "ProcessedRecordsCount")]
        getter processed_records_count : Int32?

        def initialize(
          @exported_records_count : Int32? = nil,
          @processed_records_count : Int32? = nil
        )
        end
      end

      # An object that contains the failure details about a job.

      struct FailureInfo
        include JSON::Serializable

        # A message about why the job failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # An Amazon S3 pre-signed URL that contains all the failed records and related information.

        @[JSON::Field(key: "FailedRecordsS3Url")]
        getter failed_records_s3_url : String?

        def initialize(
          @error_message : String? = nil,
          @failed_records_s3_url : String? = nil
        )
        end
      end

      # A request to obtain information about the email-sending capabilities of your Amazon SES account.

      struct GetAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A list of details about the email-sending capabilities of your Amazon SES account in the current
      # Amazon Web Services Region.

      struct GetAccountResponse
        include JSON::Serializable

        # Indicates whether or not the automatic warm-up feature is enabled for dedicated IP addresses that
        # are associated with your account.

        @[JSON::Field(key: "DedicatedIpAutoWarmupEnabled")]
        getter dedicated_ip_auto_warmup_enabled : Bool?

        # An object that defines your account details.

        @[JSON::Field(key: "Details")]
        getter details : Types::AccountDetails?

        # The reputation status of your Amazon SES account. The status can be one of the following: HEALTHY –
        # There are no reputation-related issues that currently impact your account. PROBATION – We've
        # identified potential issues with your Amazon SES account. We're placing your account under review
        # while you work on correcting these issues. SHUTDOWN – Your account's ability to send email is
        # currently paused because of an issue with the email sent from your account. When you correct the
        # issue, you can contact us and request that your account's ability to send email is resumed.

        @[JSON::Field(key: "EnforcementStatus")]
        getter enforcement_status : String?

        # Indicates whether or not your account has production access in the current Amazon Web Services
        # Region. If the value is false , then your account is in the sandbox . When your account is in the
        # sandbox, you can only send email to verified identities. If the value is true , then your account
        # has production access. When your account has production access, you can send email to any address.
        # The sending quota and maximum sending rate for your account vary based on your specific use case.

        @[JSON::Field(key: "ProductionAccessEnabled")]
        getter production_access_enabled : Bool?

        # An object that contains information about the per-day and per-second sending limits for your Amazon
        # SES account in the current Amazon Web Services Region.

        @[JSON::Field(key: "SendQuota")]
        getter send_quota : Types::SendQuota?

        # Indicates whether or not email sending is enabled for your Amazon SES account in the current Amazon
        # Web Services Region.

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        # An object that contains information about the email address suppression preferences for your account
        # in the current Amazon Web Services Region.

        @[JSON::Field(key: "SuppressionAttributes")]
        getter suppression_attributes : Types::SuppressionAttributes?

        # The VDM attributes that apply to your Amazon SES account.

        @[JSON::Field(key: "VdmAttributes")]
        getter vdm_attributes : Types::VdmAttributes?

        def initialize(
          @dedicated_ip_auto_warmup_enabled : Bool? = nil,
          @details : Types::AccountDetails? = nil,
          @enforcement_status : String? = nil,
          @production_access_enabled : Bool? = nil,
          @send_quota : Types::SendQuota? = nil,
          @sending_enabled : Bool? = nil,
          @suppression_attributes : Types::SuppressionAttributes? = nil,
          @vdm_attributes : Types::VdmAttributes? = nil
        )
        end
      end

      # A request to retrieve a list of the blacklists that your dedicated IP addresses appear on.

      struct GetBlacklistReportsRequest
        include JSON::Serializable

        # A list of IP addresses that you want to retrieve blacklist information about. You can only specify
        # the dedicated IP addresses that you use to send email using Amazon SES or Amazon Pinpoint.

        @[JSON::Field(key: "BlacklistItemNames")]
        getter blacklist_item_names : Array(String)

        def initialize(
          @blacklist_item_names : Array(String)
        )
        end
      end

      # An object that contains information about blacklist events.

      struct GetBlacklistReportsResponse
        include JSON::Serializable

        # An object that contains information about a blacklist that one of your dedicated IP addresses
        # appears on.

        @[JSON::Field(key: "BlacklistReport")]
        getter blacklist_report : Hash(String, Array(Types::BlacklistEntry))

        def initialize(
          @blacklist_report : Hash(String, Array(Types::BlacklistEntry))
        )
        end
      end

      # A request to obtain information about the event destinations for a configuration set.

      struct GetConfigurationSetEventDestinationsRequest
        include JSON::Serializable

        # The name of the configuration set that contains the event destination.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      # Information about an event destination for a configuration set.

      struct GetConfigurationSetEventDestinationsResponse
        include JSON::Serializable

        # An array that includes all of the events destinations that have been configured for the
        # configuration set.

        @[JSON::Field(key: "EventDestinations")]
        getter event_destinations : Array(Types::EventDestination)?

        def initialize(
          @event_destinations : Array(Types::EventDestination)? = nil
        )
        end
      end

      # A request to obtain information about a configuration set.

      struct GetConfigurationSetRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        def initialize(
          @configuration_set_name : String
        )
        end
      end

      # Information about a configuration set.

      struct GetConfigurationSetResponse
        include JSON::Serializable

        # An object that defines the MailManager archive where sent emails are archived that you send using
        # the configuration set.

        @[JSON::Field(key: "ArchivingOptions")]
        getter archiving_options : Types::ArchivingOptions?

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # An object that defines the dedicated IP pool that is used to send emails that you send using the
        # configuration set.

        @[JSON::Field(key: "DeliveryOptions")]
        getter delivery_options : Types::DeliveryOptions?

        # An object that defines whether or not Amazon SES collects reputation metrics for the emails that you
        # send that use the configuration set.

        @[JSON::Field(key: "ReputationOptions")]
        getter reputation_options : Types::ReputationOptions?

        # An object that defines whether or not Amazon SES can send email that you send using the
        # configuration set.

        @[JSON::Field(key: "SendingOptions")]
        getter sending_options : Types::SendingOptions?

        # An object that contains information about the suppression list preferences for your account.

        @[JSON::Field(key: "SuppressionOptions")]
        getter suppression_options : Types::SuppressionOptions?

        # An array of objects that define the tags (keys and values) that are associated with the
        # configuration set.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # An object that defines the open and click tracking options for emails that you send using the
        # configuration set.

        @[JSON::Field(key: "TrackingOptions")]
        getter tracking_options : Types::TrackingOptions?

        # An object that contains information about the VDM preferences for your configuration set.

        @[JSON::Field(key: "VdmOptions")]
        getter vdm_options : Types::VdmOptions?

        def initialize(
          @archiving_options : Types::ArchivingOptions? = nil,
          @configuration_set_name : String? = nil,
          @delivery_options : Types::DeliveryOptions? = nil,
          @reputation_options : Types::ReputationOptions? = nil,
          @sending_options : Types::SendingOptions? = nil,
          @suppression_options : Types::SuppressionOptions? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tracking_options : Types::TrackingOptions? = nil,
          @vdm_options : Types::VdmOptions? = nil
        )
        end
      end


      struct GetContactListRequest
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        def initialize(
          @contact_list_name : String
        )
        end
      end


      struct GetContactListResponse
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String?

        # A timestamp noting when the contact list was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # A description of what the contact list is about.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A timestamp noting the last time the contact list was updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The tags associated with a contact list.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # An interest group, theme, or label within a list. A contact list can have multiple topics.

        @[JSON::Field(key: "Topics")]
        getter topics : Array(Types::Topic)?

        def initialize(
          @contact_list_name : String? = nil,
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @tags : Array(Types::Tag)? = nil,
          @topics : Array(Types::Topic)? = nil
        )
        end
      end


      struct GetContactRequest
        include JSON::Serializable

        # The name of the contact list to which the contact belongs.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # The contact's email address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @contact_list_name : String,
          @email_address : String
        )
        end
      end


      struct GetContactResponse
        include JSON::Serializable

        # The attribute data attached to a contact.

        @[JSON::Field(key: "AttributesData")]
        getter attributes_data : String?

        # The name of the contact list to which the contact belongs.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String?

        # A timestamp noting when the contact was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The contact's email address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # A timestamp noting the last time the contact's information was updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The default topic preferences applied to the contact.

        @[JSON::Field(key: "TopicDefaultPreferences")]
        getter topic_default_preferences : Array(Types::TopicPreference)?

        # The contact's preference for being opted-in to or opted-out of a topic.&gt;

        @[JSON::Field(key: "TopicPreferences")]
        getter topic_preferences : Array(Types::TopicPreference)?

        # A boolean value status noting if the contact is unsubscribed from all contact list topics.

        @[JSON::Field(key: "UnsubscribeAll")]
        getter unsubscribe_all : Bool?

        def initialize(
          @attributes_data : String? = nil,
          @contact_list_name : String? = nil,
          @created_timestamp : Time? = nil,
          @email_address : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @topic_default_preferences : Array(Types::TopicPreference)? = nil,
          @topic_preferences : Array(Types::TopicPreference)? = nil,
          @unsubscribe_all : Bool? = nil
        )
        end
      end

      # Represents a request to retrieve an existing custom verification email template.

      struct GetCustomVerificationEmailTemplateRequest
        include JSON::Serializable

        # The name of the custom verification email template that you want to retrieve.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      # The following elements are returned by the service.

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

        # An array of objects that define the tags (keys and values) that are associated with the custom
        # verification email template.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

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
          @tags : Array(Types::Tag)? = nil,
          @template_content : String? = nil,
          @template_name : String? = nil,
          @template_subject : String? = nil
        )
        end
      end

      # A request to obtain more information about a dedicated IP pool.

      struct GetDedicatedIpPoolRequest
        include JSON::Serializable

        # The name of the dedicated IP pool to retrieve.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        def initialize(
          @pool_name : String
        )
        end
      end

      # The following element is returned by the service.

      struct GetDedicatedIpPoolResponse
        include JSON::Serializable

        # An object that contains information about a dedicated IP pool.

        @[JSON::Field(key: "DedicatedIpPool")]
        getter dedicated_ip_pool : Types::DedicatedIpPool?

        def initialize(
          @dedicated_ip_pool : Types::DedicatedIpPool? = nil
        )
        end
      end

      # A request to obtain more information about a dedicated IP address.

      struct GetDedicatedIpRequest
        include JSON::Serializable

        # The IP address that you want to obtain more information about. The value you specify has to be a
        # dedicated IP address that's assocaited with your Amazon Web Services account.

        @[JSON::Field(key: "IP")]
        getter ip : String

        def initialize(
          @ip : String
        )
        end
      end

      # Information about a dedicated IP address.

      struct GetDedicatedIpResponse
        include JSON::Serializable

        # An object that contains information about a dedicated IP address.

        @[JSON::Field(key: "DedicatedIp")]
        getter dedicated_ip : Types::DedicatedIp?

        def initialize(
          @dedicated_ip : Types::DedicatedIp? = nil
        )
        end
      end

      # A request to obtain more information about dedicated IP pools.

      struct GetDedicatedIpsRequest
        include JSON::Serializable

        # A token returned from a previous call to GetDedicatedIps to indicate the position of the dedicated
        # IP pool in the list of IP pools.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to GetDedicatedIpsRequest . If the number of results
        # is larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The name of the IP pool that the dedicated IP address is associated with.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil,
          @pool_name : String? = nil
        )
        end
      end

      # Information about the dedicated IP addresses that are associated with your Amazon Web Services
      # account.

      struct GetDedicatedIpsResponse
        include JSON::Serializable

        # A list of dedicated IP addresses that are associated with your Amazon Web Services account.

        @[JSON::Field(key: "DedicatedIps")]
        getter dedicated_ips : Array(Types::DedicatedIp)?

        # A token that indicates that there are additional dedicated IP addresses to list. To view additional
        # addresses, issue another request to GetDedicatedIps , passing this token in the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dedicated_ips : Array(Types::DedicatedIp)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Retrieve information about the status of the Deliverability dashboard for your Amazon Web Services
      # account. When the Deliverability dashboard is enabled, you gain access to reputation,
      # deliverability, and other metrics for your domains. You also gain the ability to perform predictive
      # inbox placement tests. When you use the Deliverability dashboard, you pay a monthly subscription
      # charge, in addition to any other fees that you accrue by using Amazon SES and other Amazon Web
      # Services services. For more information about the features and cost of a Deliverability dashboard
      # subscription, see Amazon Pinpoint Pricing .

      struct GetDeliverabilityDashboardOptionsRequest
        include JSON::Serializable

        def initialize
        end
      end

      # An object that shows the status of the Deliverability dashboard.

      struct GetDeliverabilityDashboardOptionsResponse
        include JSON::Serializable

        # Specifies whether the Deliverability dashboard is enabled. If this value is true , the dashboard is
        # enabled.

        @[JSON::Field(key: "DashboardEnabled")]
        getter dashboard_enabled : Bool

        # The current status of your Deliverability dashboard subscription. If this value is
        # PENDING_EXPIRATION , your subscription is scheduled to expire at the end of the current calendar
        # month.

        @[JSON::Field(key: "AccountStatus")]
        getter account_status : String?

        # An array of objects, one for each verified domain that you use to send email and currently has an
        # active Deliverability dashboard subscription that isn’t scheduled to expire at the end of the
        # current calendar month.

        @[JSON::Field(key: "ActiveSubscribedDomains")]
        getter active_subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)?

        # An array of objects, one for each verified domain that you use to send email and currently has an
        # active Deliverability dashboard subscription that's scheduled to expire at the end of the current
        # calendar month.

        @[JSON::Field(key: "PendingExpirationSubscribedDomains")]
        getter pending_expiration_subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)?

        # The date when your current subscription to the Deliverability dashboard is scheduled to expire, if
        # your subscription is scheduled to expire at the end of the current calendar month. This value is
        # null if you have an active subscription that isn’t due to expire at the end of the month.

        @[JSON::Field(key: "SubscriptionExpiryDate")]
        getter subscription_expiry_date : Time?

        def initialize(
          @dashboard_enabled : Bool,
          @account_status : String? = nil,
          @active_subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)? = nil,
          @pending_expiration_subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)? = nil,
          @subscription_expiry_date : Time? = nil
        )
        end
      end

      # A request to retrieve the results of a predictive inbox placement test.

      struct GetDeliverabilityTestReportRequest
        include JSON::Serializable

        # A unique string that identifies the predictive inbox placement test.

        @[JSON::Field(key: "ReportId")]
        getter report_id : String

        def initialize(
          @report_id : String
        )
        end
      end

      # The results of the predictive inbox placement test.

      struct GetDeliverabilityTestReportResponse
        include JSON::Serializable

        # An object that contains the results of the predictive inbox placement test.

        @[JSON::Field(key: "DeliverabilityTestReport")]
        getter deliverability_test_report : Types::DeliverabilityTestReport

        # An object that describes how the test email was handled by several email providers, including Gmail,
        # Hotmail, Yahoo, AOL, and others.

        @[JSON::Field(key: "IspPlacements")]
        getter isp_placements : Array(Types::IspPlacement)

        # An object that specifies how many test messages that were sent during the predictive inbox placement
        # test were delivered to recipients' inboxes, how many were sent to recipients' spam folders, and how
        # many weren't delivered.

        @[JSON::Field(key: "OverallPlacement")]
        getter overall_placement : Types::PlacementStatistics

        # An object that contains the message that you sent when you performed this predictive inbox placement
        # test.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # An array of objects that define the tags (keys and values) that are associated with the predictive
        # inbox placement test.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @deliverability_test_report : Types::DeliverabilityTestReport,
          @isp_placements : Array(Types::IspPlacement),
          @overall_placement : Types::PlacementStatistics,
          @message : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Retrieve all the deliverability data for a specific campaign. This data is available for a campaign
      # only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for (
      # PutDeliverabilityDashboardOption operation).

      struct GetDomainDeliverabilityCampaignRequest
        include JSON::Serializable

        # The unique identifier for the campaign. The Deliverability dashboard automatically generates and
        # assigns this identifier to a campaign.

        @[JSON::Field(key: "CampaignId")]
        getter campaign_id : String

        def initialize(
          @campaign_id : String
        )
        end
      end

      # An object that contains all the deliverability data for a specific campaign. This data is available
      # for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard
      # is enabled for.

      struct GetDomainDeliverabilityCampaignResponse
        include JSON::Serializable

        # An object that contains the deliverability data for the campaign.

        @[JSON::Field(key: "DomainDeliverabilityCampaign")]
        getter domain_deliverability_campaign : Types::DomainDeliverabilityCampaign

        def initialize(
          @domain_deliverability_campaign : Types::DomainDeliverabilityCampaign
        )
        end
      end

      # A request to obtain deliverability metrics for a domain.

      struct GetDomainStatisticsReportRequest
        include JSON::Serializable

        # The domain that you want to obtain deliverability metrics for.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The last day (in Unix time) that you want to obtain domain deliverability metrics for. The EndDate
        # that you specify has to be less than or equal to 30 days after the StartDate .

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time

        # The first day (in Unix time) that you want to obtain domain deliverability metrics for.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time

        def initialize(
          @domain : String,
          @end_date : Time,
          @start_date : Time
        )
        end
      end

      # An object that includes statistics that are related to the domain that you specified.

      struct GetDomainStatisticsReportResponse
        include JSON::Serializable

        # An object that contains deliverability metrics for the domain that you specified. This object
        # contains data for each day, starting on the StartDate and ending on the EndDate .

        @[JSON::Field(key: "DailyVolumes")]
        getter daily_volumes : Array(Types::DailyVolume)

        # An object that contains deliverability metrics for the domain that you specified. The data in this
        # object is a summary of all of the data that was collected from the StartDate to the EndDate .

        @[JSON::Field(key: "OverallVolume")]
        getter overall_volume : Types::OverallVolume

        def initialize(
          @daily_volumes : Array(Types::DailyVolume),
          @overall_volume : Types::OverallVolume
        )
        end
      end

      # A request to return validation insights about an email address.

      struct GetEmailAddressInsightsRequest
        include JSON::Serializable

        # The email address to analyze for validation insights.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @email_address : String
        )
        end
      end

      # Validation insights about an email address.

      struct GetEmailAddressInsightsResponse
        include JSON::Serializable

        # Detailed validation results for the email address.

        @[JSON::Field(key: "MailboxValidation")]
        getter mailbox_validation : Types::MailboxValidation?

        def initialize(
          @mailbox_validation : Types::MailboxValidation? = nil
        )
        end
      end

      # A request to return the policies of an email identity.

      struct GetEmailIdentityPoliciesRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        def initialize(
          @email_identity : String
        )
        end
      end

      # Identity policies associated with email identity.

      struct GetEmailIdentityPoliciesResponse
        include JSON::Serializable

        # A map of policy names to policies.

        @[JSON::Field(key: "Policies")]
        getter policies : Hash(String, String)?

        def initialize(
          @policies : Hash(String, String)? = nil
        )
        end
      end

      # A request to return details about an email identity.

      struct GetEmailIdentityRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        def initialize(
          @email_identity : String
        )
        end
      end

      # Details about an email identity.

      struct GetEmailIdentityResponse
        include JSON::Serializable

        # The configuration set used by default when sending from this identity.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # An object that contains information about the DKIM attributes for the identity.

        @[JSON::Field(key: "DkimAttributes")]
        getter dkim_attributes : Types::DkimAttributes?

        # The feedback forwarding configuration for the identity. If the value is true , you receive email
        # notifications when bounce or complaint events occur. These notifications are sent to the address
        # that you specified in the Return-Path header of the original email. You're required to have a method
        # of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or
        # complaint notifications (for example, by setting up an event destination), you receive an email
        # notification when these events occur (even if this setting is disabled).

        @[JSON::Field(key: "FeedbackForwardingStatus")]
        getter feedback_forwarding_status : Bool?

        # The email identity type. Note: the MANAGED_DOMAIN identity type is not supported.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # An object that contains information about the Mail-From attributes for the email identity.

        @[JSON::Field(key: "MailFromAttributes")]
        getter mail_from_attributes : Types::MailFromAttributes?

        # A map of policy names to policies.

        @[JSON::Field(key: "Policies")]
        getter policies : Hash(String, String)?

        # An array of objects that define the tags (keys and values) that are associated with the email
        # identity.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # An object that contains additional information about the verification status for the identity.

        @[JSON::Field(key: "VerificationInfo")]
        getter verification_info : Types::VerificationInfo?

        # The verification status of the identity. The status can be one of the following: PENDING – The
        # verification process was initiated, but Amazon SES hasn't yet been able to verify the identity.
        # SUCCESS – The verification process completed successfully. FAILED – The verification process failed.
        # TEMPORARY_FAILURE – A temporary issue is preventing Amazon SES from determining the verification
        # status of the identity. NOT_STARTED – The verification process hasn't been initiated for the
        # identity.

        @[JSON::Field(key: "VerificationStatus")]
        getter verification_status : String?

        # Specifies whether or not the identity is verified. You can only send email from verified email
        # addresses or domains. For more information about verifying identities, see the Amazon Pinpoint User
        # Guide .

        @[JSON::Field(key: "VerifiedForSendingStatus")]
        getter verified_for_sending_status : Bool?

        def initialize(
          @configuration_set_name : String? = nil,
          @dkim_attributes : Types::DkimAttributes? = nil,
          @feedback_forwarding_status : Bool? = nil,
          @identity_type : String? = nil,
          @mail_from_attributes : Types::MailFromAttributes? = nil,
          @policies : Hash(String, String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @verification_info : Types::VerificationInfo? = nil,
          @verification_status : String? = nil,
          @verified_for_sending_status : Bool? = nil
        )
        end
      end

      # Represents a request to display the template object (which includes the subject line, HTML part and
      # text part) for the template you specify.

      struct GetEmailTemplateRequest
        include JSON::Serializable

        # The name of the template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_name : String
        )
        end
      end

      # The following element is returned by the service.

      struct GetEmailTemplateResponse
        include JSON::Serializable

        # The content of the email template, composed of a subject line, an HTML part, and a text-only part.

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : Types::EmailTemplateContent

        # The name of the template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # An array of objects that define the tags (keys and values) that are associated with the email
        # template.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @template_content : Types::EmailTemplateContent,
          @template_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents a request to retrieve information about an export job using the export job ID.

      struct GetExportJobRequest
        include JSON::Serializable

        # The export job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct GetExportJobResponse
        include JSON::Serializable

        # The timestamp of when the export job was completed.

        @[JSON::Field(key: "CompletedTimestamp")]
        getter completed_timestamp : Time?

        # The timestamp of when the export job was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The data source of the export job.

        @[JSON::Field(key: "ExportDataSource")]
        getter export_data_source : Types::ExportDataSource?

        # The destination of the export job.

        @[JSON::Field(key: "ExportDestination")]
        getter export_destination : Types::ExportDestination?

        # The type of source of the export job.

        @[JSON::Field(key: "ExportSourceType")]
        getter export_source_type : String?

        # The failure details about an export job.

        @[JSON::Field(key: "FailureInfo")]
        getter failure_info : Types::FailureInfo?

        # The export job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the export job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The statistics about the export job.

        @[JSON::Field(key: "Statistics")]
        getter statistics : Types::ExportStatistics?

        def initialize(
          @completed_timestamp : Time? = nil,
          @created_timestamp : Time? = nil,
          @export_data_source : Types::ExportDataSource? = nil,
          @export_destination : Types::ExportDestination? = nil,
          @export_source_type : String? = nil,
          @failure_info : Types::FailureInfo? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @statistics : Types::ExportStatistics? = nil
        )
        end
      end

      # Represents a request for information about an import job using the import job ID.

      struct GetImportJobRequest
        include JSON::Serializable

        # The ID of the import job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct GetImportJobResponse
        include JSON::Serializable

        # The time stamp of when the import job was completed.

        @[JSON::Field(key: "CompletedTimestamp")]
        getter completed_timestamp : Time?

        # The time stamp of when the import job was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The number of records that failed processing because of invalid input or other reasons.

        @[JSON::Field(key: "FailedRecordsCount")]
        getter failed_records_count : Int32?

        # The failure details about an import job.

        @[JSON::Field(key: "FailureInfo")]
        getter failure_info : Types::FailureInfo?

        # The data source of the import job.

        @[JSON::Field(key: "ImportDataSource")]
        getter import_data_source : Types::ImportDataSource?

        # The destination of the import job.

        @[JSON::Field(key: "ImportDestination")]
        getter import_destination : Types::ImportDestination?

        # A string that represents the import job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the import job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The current number of records processed.

        @[JSON::Field(key: "ProcessedRecordsCount")]
        getter processed_records_count : Int32?

        def initialize(
          @completed_timestamp : Time? = nil,
          @created_timestamp : Time? = nil,
          @failed_records_count : Int32? = nil,
          @failure_info : Types::FailureInfo? = nil,
          @import_data_source : Types::ImportDataSource? = nil,
          @import_destination : Types::ImportDestination? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @processed_records_count : Int32? = nil
        )
        end
      end

      # A request to return information about a message.

      struct GetMessageInsightsRequest
        include JSON::Serializable

        # A MessageId is a unique identifier for a message, and is returned when sending emails through Amazon
        # SES.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        def initialize(
          @message_id : String
        )
        end
      end

      # Information about a message.

      struct GetMessageInsightsResponse
        include JSON::Serializable

        # A list of tags, in the form of name/value pairs, that were applied to the email you sent, along with
        # Amazon SES Auto-Tags .

        @[JSON::Field(key: "EmailTags")]
        getter email_tags : Array(Types::MessageTag)?

        # The from address used to send the message.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # A set of insights associated with the message.

        @[JSON::Field(key: "Insights")]
        getter insights : Array(Types::EmailInsights)?

        # A unique identifier for the message.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The subject line of the message.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        def initialize(
          @email_tags : Array(Types::MessageTag)? = nil,
          @from_email_address : String? = nil,
          @insights : Array(Types::EmailInsights)? = nil,
          @message_id : String? = nil,
          @subject : String? = nil
        )
        end
      end

      # Represents a request to display the multi-region endpoint (global-endpoint).

      struct GetMultiRegionEndpointRequest
        include JSON::Serializable

        # The name of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        def initialize(
          @endpoint_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct GetMultiRegionEndpointResponse
        include JSON::Serializable

        # The time stamp of when the multi-region endpoint (global-endpoint) was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ID of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The name of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String?

        # The time stamp of when the multi-region endpoint (global-endpoint) was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # Contains routes information for the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "Routes")]
        getter routes : Array(Types::Route)?

        # The status of the multi-region endpoint (global-endpoint). CREATING – The resource is being
        # provisioned. READY – The resource is ready to use. FAILED – The resource failed to be provisioned.
        # DELETING – The resource is being deleted as requested.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @endpoint_id : String? = nil,
          @endpoint_name : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @routes : Array(Types::Route)? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents a request to retrieve information about a specific reputation entity.

      struct GetReputationEntityRequest
        include JSON::Serializable

        # The unique identifier for the reputation entity. For resource-type entities, this is the Amazon
        # Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ReputationEntityReference")]
        getter reputation_entity_reference : String

        # The type of reputation entity. Currently, only RESOURCE type entities are supported.

        @[JSON::Field(key: "ReputationEntityType")]
        getter reputation_entity_type : String

        def initialize(
          @reputation_entity_reference : String,
          @reputation_entity_type : String
        )
        end
      end

      # Information about the requested reputation entity.

      struct GetReputationEntityResponse
        include JSON::Serializable

        # The reputation entity information, including status records, policy configuration, and reputation
        # impact.

        @[JSON::Field(key: "ReputationEntity")]
        getter reputation_entity : Types::ReputationEntity?

        def initialize(
          @reputation_entity : Types::ReputationEntity? = nil
        )
        end
      end

      # A request to retrieve information about an email address that's on the suppression list for your
      # account.

      struct GetSuppressedDestinationRequest
        include JSON::Serializable

        # The email address that's on the account suppression list.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @email_address : String
        )
        end
      end

      # Information about the suppressed email address.

      struct GetSuppressedDestinationResponse
        include JSON::Serializable

        # An object containing information about the suppressed email address.

        @[JSON::Field(key: "SuppressedDestination")]
        getter suppressed_destination : Types::SuppressedDestination

        def initialize(
          @suppressed_destination : Types::SuppressedDestination
        )
        end
      end

      # Represents a request to get information about a specific tenant.

      struct GetTenantRequest
        include JSON::Serializable

        # The name of the tenant to retrieve information about.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String

        def initialize(
          @tenant_name : String
        )
        end
      end

      # Information about a specific tenant.

      struct GetTenantResponse
        include JSON::Serializable

        # A structure that contains details about the tenant.

        @[JSON::Field(key: "Tenant")]
        getter tenant : Types::Tenant?

        def initialize(
          @tenant : Types::Tenant? = nil
        )
        end
      end

      # An object containing additional settings for your VDM configuration as applicable to the Guardian.

      struct GuardianAttributes
        include JSON::Serializable

        # Specifies the status of your VDM optimized shared delivery. Can be one of the following: ENABLED –
        # Amazon SES enables optimized shared delivery for your account. DISABLED – Amazon SES disables
        # optimized shared delivery for your account.

        @[JSON::Field(key: "OptimizedSharedDelivery")]
        getter optimized_shared_delivery : String?

        def initialize(
          @optimized_shared_delivery : String? = nil
        )
        end
      end

      # An object containing additional settings for your VDM configuration as applicable to the Guardian.

      struct GuardianOptions
        include JSON::Serializable

        # Specifies the status of your VDM optimized shared delivery. Can be one of the following: ENABLED –
        # Amazon SES enables optimized shared delivery for the configuration set. DISABLED – Amazon SES
        # disables optimized shared delivery for the configuration set.

        @[JSON::Field(key: "OptimizedSharedDelivery")]
        getter optimized_shared_delivery : String?

        def initialize(
          @optimized_shared_delivery : String? = nil
        )
        end
      end

      # Information about an email identity.

      struct IdentityInfo
        include JSON::Serializable

        # The address or domain of the identity.

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        # The email identity type. Note: the MANAGED_DOMAIN type is not supported for email identity types.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # Indicates whether or not you can send email from the identity. An identity is an email address or
        # domain that you send email from. Before you can send email from an identity, you have to demostrate
        # that you own the identity, and that you authorize Amazon SES to send email from that identity.

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        # The verification status of the identity. The status can be one of the following: PENDING – The
        # verification process was initiated, but Amazon SES hasn't yet been able to verify the identity.
        # SUCCESS – The verification process completed successfully. FAILED – The verification process failed.
        # TEMPORARY_FAILURE – A temporary issue is preventing Amazon SES from determining the verification
        # status of the identity. NOT_STARTED – The verification process hasn't been initiated for the
        # identity.

        @[JSON::Field(key: "VerificationStatus")]
        getter verification_status : String?

        def initialize(
          @identity_name : String? = nil,
          @identity_type : String? = nil,
          @sending_enabled : Bool? = nil,
          @verification_status : String? = nil
        )
        end
      end

      # An object that contains details about the data source of the import job.

      struct ImportDataSource
        include JSON::Serializable

        # The data format of the import job's data source.

        @[JSON::Field(key: "DataFormat")]
        getter data_format : String

        # An Amazon S3 URL in the format s3:// &lt;bucket_name&gt; / &lt;object&gt; .

        @[JSON::Field(key: "S3Url")]
        getter s3_url : String

        def initialize(
          @data_format : String,
          @s3_url : String
        )
        end
      end

      # An object that contains details about the resource destination the import job is going to target.

      struct ImportDestination
        include JSON::Serializable

        # An object that contains the action of the import job towards a contact list.

        @[JSON::Field(key: "ContactListDestination")]
        getter contact_list_destination : Types::ContactListDestination?

        # An object that contains the action of the import job towards suppression list.

        @[JSON::Field(key: "SuppressionListDestination")]
        getter suppression_list_destination : Types::SuppressionListDestination?

        def initialize(
          @contact_list_destination : Types::ContactListDestination? = nil,
          @suppression_list_destination : Types::SuppressionListDestination? = nil
        )
        end
      end

      # A summary of the import job.

      struct ImportJobSummary
        include JSON::Serializable

        # The date and time when the import job was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The number of records that failed processing because of invalid input or other reasons.

        @[JSON::Field(key: "FailedRecordsCount")]
        getter failed_records_count : Int32?


        @[JSON::Field(key: "ImportDestination")]
        getter import_destination : Types::ImportDestination?


        @[JSON::Field(key: "JobId")]
        getter job_id : String?


        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The current number of records processed.

        @[JSON::Field(key: "ProcessedRecordsCount")]
        getter processed_records_count : Int32?

        def initialize(
          @created_timestamp : Time? = nil,
          @failed_records_count : Int32? = nil,
          @import_destination : Types::ImportDestination? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @processed_records_count : Int32? = nil
        )
        end
      end

      # An object that contains information about the inbox placement data settings for a verified domain
      # that’s associated with your Amazon Web Services account. This data is available only if you enabled
      # the Deliverability dashboard for the domain.

      struct InboxPlacementTrackingOption
        include JSON::Serializable

        # Specifies whether inbox placement data is being tracked for the domain.

        @[JSON::Field(key: "Global")]
        getter global : Bool?

        # An array of strings, one for each major email provider that the inbox placement data applies to.

        @[JSON::Field(key: "TrackedIsps")]
        getter tracked_isps : Array(String)?

        def initialize(
          @global : Bool? = nil,
          @tracked_isps : Array(String)? = nil
        )
        end
      end

      # An object containing details about a specific event.

      struct InsightsEvent
        include JSON::Serializable

        # Details about bounce or complaint events.

        @[JSON::Field(key: "Details")]
        getter details : Types::EventDetails?

        # The timestamp of the event.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        # The type of event: SEND - The send request was successful and SES will attempt to deliver the
        # message to the recipient’s mail server. (If account-level or global suppression is being used, SES
        # will still count it as a send, but delivery is suppressed.) DELIVERY - SES successfully delivered
        # the email to the recipient's mail server. Excludes deliveries to the mailbox simulator, and those
        # from emails addressed to more than one recipient. BOUNCE - Feedback received for delivery failures.
        # Additional details about the bounce are provided in the Details object. Excludes bounces from the
        # mailbox simulator, and those from emails addressed to more than one recipient. COMPLAINT - Complaint
        # received for the email. Additional details about the complaint are provided in the Details object.
        # This excludes complaints from the mailbox simulator, those originating from your account-level
        # suppression list (if enabled), and those from emails addressed to more than one recipient. OPEN -
        # Open event for emails including open trackers. Excludes opens for emails addressed to more than one
        # recipient. CLICK - Click event for emails including wrapped links. Excludes clicks for emails
        # addressed to more than one recipient.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @details : Types::EventDetails? = nil,
          @timestamp : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # The request couldn't be processed because an error occurred with the Amazon SES API v2.

      struct InternalServiceErrorException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified request includes an invalid or expired token.

      struct InvalidNextTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that describes how email sent during the predictive inbox placement test was handled by a
      # certain email provider.

      struct IspPlacement
        include JSON::Serializable

        # The name of the email provider that the inbox placement data applies to.

        @[JSON::Field(key: "IspName")]
        getter isp_name : String?

        # An object that contains inbox placement metrics for a specific email provider.

        @[JSON::Field(key: "PlacementStatistics")]
        getter placement_statistics : Types::PlacementStatistics?

        def initialize(
          @isp_name : String? = nil,
          @placement_statistics : Types::PlacementStatistics? = nil
        )
        end
      end

      # An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use
      # Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon
      # Redshift.

      struct KinesisFirehoseDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose stream that the Amazon SES API v2
        # sends email events to.

        @[JSON::Field(key: "DeliveryStreamArn")]
        getter delivery_stream_arn : String

        # The Amazon Resource Name (ARN) of the IAM role that the Amazon SES API v2 uses to send email events
        # to the Amazon Kinesis Data Firehose stream.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        def initialize(
          @delivery_stream_arn : String,
          @iam_role_arn : String
        )
        end
      end

      # There are too many instances of the specified resource type.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A request to obtain a list of configuration sets for your Amazon SES account in the current Amazon
      # Web Services Region.

      struct ListConfigurationSetsRequest
        include JSON::Serializable

        # A token returned from a previous call to ListConfigurationSets to indicate the position in the list
        # of configuration sets.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListConfigurationSets . If the number of results
        # is larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # A list of configuration sets in your Amazon SES account in the current Amazon Web Services Region.

      struct ListConfigurationSetsResponse
        include JSON::Serializable

        # An array that contains all of the configuration sets in your Amazon SES account in the current
        # Amazon Web Services Region.

        @[JSON::Field(key: "ConfigurationSets")]
        getter configuration_sets : Array(String)?

        # A token that indicates that there are additional configuration sets to list. To view additional
        # configuration sets, issue another request to ListConfigurationSets , and pass this token in the
        # NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @configuration_sets : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContactListsRequest
        include JSON::Serializable

        # A string token indicating that there might be additional contact lists available to be listed. Use
        # the token provided in the Response to use in the subsequent call to ListContactLists with the same
        # parameters to retrieve the next page of contact lists.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Maximum number of contact lists to return at once. Use this parameter to paginate results. If
        # additional contact lists exist beyond the specified limit, the NextToken element is sent in the
        # response. Use the NextToken value in subsequent requests to retrieve additional lists.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListContactListsResponse
        include JSON::Serializable

        # The available contact lists.

        @[JSON::Field(key: "ContactLists")]
        getter contact_lists : Array(Types::ContactList)?

        # A string token indicating that there might be additional contact lists available to be listed. Copy
        # this token to a subsequent call to ListContactLists with the same parameters to retrieve the next
        # page of contact lists.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contact_lists : Array(Types::ContactList)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A filter that can be applied to a list of contacts.

      struct ListContactsFilter
        include JSON::Serializable

        # The status by which you are filtering: OPT_IN or OPT_OUT .

        @[JSON::Field(key: "FilteredStatus")]
        getter filtered_status : String?

        # Used for filtering by a specific topic preference.

        @[JSON::Field(key: "TopicFilter")]
        getter topic_filter : Types::TopicFilter?

        def initialize(
          @filtered_status : String? = nil,
          @topic_filter : Types::TopicFilter? = nil
        )
        end
      end


      struct ListContactsRequest
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # A filter that can be applied to a list of contacts.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ListContactsFilter?

        # A string token indicating that there might be additional contacts available to be listed. Use the
        # token provided in the Response to use in the subsequent call to ListContacts with the same
        # parameters to retrieve the next page of contacts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of contacts that may be returned at once, which is dependent on if there are more or less
        # contacts than the value of the PageSize. Use this parameter to paginate results. If additional
        # contacts exist beyond the specified limit, the NextToken element is sent in the response. Use the
        # NextToken value in subsequent requests to retrieve additional contacts.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @contact_list_name : String,
          @filter : Types::ListContactsFilter? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListContactsResponse
        include JSON::Serializable

        # The contacts present in a specific contact list.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Array(Types::Contact)?

        # A string token indicating that there might be additional contacts available to be listed. Copy this
        # token to a subsequent call to ListContacts with the same parameters to retrieve the next page of
        # contacts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contacts : Array(Types::Contact)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a request to list the existing custom verification email templates for your account.

      struct ListCustomVerificationEmailTemplatesRequest
        include JSON::Serializable

        # A token returned from a previous call to ListCustomVerificationEmailTemplates to indicate the
        # position in the list of custom verification email templates.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListCustomVerificationEmailTemplates . If the
        # number of results is larger than the number you specified in this parameter, then the response
        # includes a NextToken element, which you can use to obtain additional results. The value you specify
        # has to be at least 1, and can be no more than 50.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The following elements are returned by the service.

      struct ListCustomVerificationEmailTemplatesResponse
        include JSON::Serializable

        # A list of the custom verification email templates that exist in your account.

        @[JSON::Field(key: "CustomVerificationEmailTemplates")]
        getter custom_verification_email_templates : Array(Types::CustomVerificationEmailTemplateMetadata)?

        # A token indicating that there are additional custom verification email templates available to be
        # listed. Pass this token to a subsequent call to ListCustomVerificationEmailTemplates to retrieve the
        # next 50 custom verification email templates.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @custom_verification_email_templates : Array(Types::CustomVerificationEmailTemplateMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A request to obtain a list of dedicated IP pools.

      struct ListDedicatedIpPoolsRequest
        include JSON::Serializable

        # A token returned from a previous call to ListDedicatedIpPools to indicate the position in the list
        # of dedicated IP pools.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListDedicatedIpPools . If the number of results is
        # larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # A list of dedicated IP pools.

      struct ListDedicatedIpPoolsResponse
        include JSON::Serializable

        # A list of all of the dedicated IP pools that are associated with your Amazon Web Services account in
        # the current Region.

        @[JSON::Field(key: "DedicatedIpPools")]
        getter dedicated_ip_pools : Array(String)?

        # A token that indicates that there are additional IP pools to list. To view additional IP pools,
        # issue another request to ListDedicatedIpPools , passing this token in the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dedicated_ip_pools : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A request to list all of the predictive inbox placement tests that you've performed.

      struct ListDeliverabilityTestReportsRequest
        include JSON::Serializable

        # A token returned from a previous call to ListDeliverabilityTestReports to indicate the position in
        # the list of predictive inbox placement tests.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListDeliverabilityTestReports . If the number of
        # results is larger than the number you specified in this parameter, then the response includes a
        # NextToken element, which you can use to obtain additional results. The value you specify has to be
        # at least 0, and can be no more than 1000.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # A list of the predictive inbox placement test reports that are available for your account,
      # regardless of whether or not those tests are complete.

      struct ListDeliverabilityTestReportsResponse
        include JSON::Serializable

        # An object that contains a lists of predictive inbox placement tests that you've performed.

        @[JSON::Field(key: "DeliverabilityTestReports")]
        getter deliverability_test_reports : Array(Types::DeliverabilityTestReport)

        # A token that indicates that there are additional predictive inbox placement tests to list. To view
        # additional predictive inbox placement tests, issue another request to ListDeliverabilityTestReports
        # , and pass this token in the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @deliverability_test_reports : Array(Types::DeliverabilityTestReport),
          @next_token : String? = nil
        )
        end
      end

      # Retrieve deliverability data for all the campaigns that used a specific domain to send email during
      # a specified time range. This data is available for a domain only if you enabled the Deliverability
      # dashboard.

      struct ListDomainDeliverabilityCampaignsRequest
        include JSON::Serializable

        # The last day that you want to obtain deliverability data for. This value has to be less than or
        # equal to 30 days after the value of the StartDate parameter.

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time

        # The first day that you want to obtain deliverability data for.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time

        # The domain to obtain deliverability data for.

        @[JSON::Field(key: "SubscribedDomain")]
        getter subscribed_domain : String

        # A token that’s returned from a previous call to the ListDomainDeliverabilityCampaigns operation.
        # This token indicates the position of a campaign in the list of campaigns.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of results to include in response to a single call to the
        # ListDomainDeliverabilityCampaigns operation. If the number of results is larger than the number that
        # you specify in this parameter, the response includes a NextToken element, which you can use to
        # obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @end_date : Time,
          @start_date : Time,
          @subscribed_domain : String,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # An array of objects that provide deliverability data for all the campaigns that used a specific
      # domain to send email during a specified time range. This data is available for a domain only if you
      # enabled the Deliverability dashboard for the domain.

      struct ListDomainDeliverabilityCampaignsResponse
        include JSON::Serializable

        # An array of responses, one for each campaign that used the domain to send email during the specified
        # time range.

        @[JSON::Field(key: "DomainDeliverabilityCampaigns")]
        getter domain_deliverability_campaigns : Array(Types::DomainDeliverabilityCampaign)

        # A token that’s returned from a previous call to the ListDomainDeliverabilityCampaigns operation.
        # This token indicates the position of the campaign in the list of campaigns.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_deliverability_campaigns : Array(Types::DomainDeliverabilityCampaign),
          @next_token : String? = nil
        )
        end
      end

      # A request to list all of the email identities associated with your Amazon Web Services account. This
      # list includes identities that you've already verified, identities that are unverified, and
      # identities that were verified in the past, but are no longer verified.

      struct ListEmailIdentitiesRequest
        include JSON::Serializable

        # A token returned from a previous call to ListEmailIdentities to indicate the position in the list of
        # identities.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListEmailIdentities . If the number of results is
        # larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results. The value you specify has to be at least 0,
        # and can be no more than 1000.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # A list of all of the identities that you've attempted to verify, regardless of whether or not those
      # identities were successfully verified.

      struct ListEmailIdentitiesResponse
        include JSON::Serializable

        # An array that includes all of the email identities associated with your Amazon Web Services account.

        @[JSON::Field(key: "EmailIdentities")]
        getter email_identities : Array(Types::IdentityInfo)?

        # A token that indicates that there are additional configuration sets to list. To view additional
        # configuration sets, issue another request to ListEmailIdentities , and pass this token in the
        # NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @email_identities : Array(Types::IdentityInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a request to list the email templates present in your Amazon SES account in the current
      # Amazon Web Services Region. For more information, see the Amazon SES Developer Guide .

      struct ListEmailTemplatesRequest
        include JSON::Serializable

        # A token returned from a previous call to ListEmailTemplates to indicate the position in the list of
        # email templates.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListEmailTemplates . If the number of results is
        # larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results. The value you specify has to be at least 1,
        # and can be no more than 100.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The following elements are returned by the service.

      struct ListEmailTemplatesResponse
        include JSON::Serializable

        # A token indicating that there are additional email templates available to be listed. Pass this token
        # to a subsequent ListEmailTemplates call to retrieve the next 10 email templates.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array the contains the name and creation time stamp for each template in your Amazon SES account.

        @[JSON::Field(key: "TemplatesMetadata")]
        getter templates_metadata : Array(Types::EmailTemplateMetadata)?

        def initialize(
          @next_token : String? = nil,
          @templates_metadata : Array(Types::EmailTemplateMetadata)? = nil
        )
        end
      end

      # Represents a request to list all export jobs with filters.

      struct ListExportJobsRequest
        include JSON::Serializable

        # A value used to list export jobs that have a certain ExportSourceType .

        @[JSON::Field(key: "ExportSourceType")]
        getter export_source_type : String?

        # A value used to list export jobs that have a certain JobStatus .

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The pagination token returned from a previous call to ListExportJobs to indicate the position in the
        # list of export jobs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Maximum number of export jobs to return at once. Use this parameter to paginate results. If
        # additional export jobs exist beyond the specified limit, the NextToken element is sent in the
        # response. Use the NextToken value in subsequent calls to ListExportJobs to retrieve additional
        # export jobs.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @export_source_type : String? = nil,
          @job_status : String? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct ListExportJobsResponse
        include JSON::Serializable

        # A list of the export job summaries.

        @[JSON::Field(key: "ExportJobs")]
        getter export_jobs : Array(Types::ExportJobSummary)?

        # A string token indicating that there might be additional export jobs available to be listed. Use
        # this token to a subsequent call to ListExportJobs with the same parameters to retrieve the next page
        # of export jobs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @export_jobs : Array(Types::ExportJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a request to list all of the import jobs for a data destination within the specified
      # maximum number of import jobs.

      struct ListImportJobsRequest
        include JSON::Serializable

        # The destination of the import job, which can be used to list import jobs that have a certain
        # ImportDestinationType .

        @[JSON::Field(key: "ImportDestinationType")]
        getter import_destination_type : String?

        # A string token indicating that there might be additional import jobs available to be listed. Copy
        # this token to a subsequent call to ListImportJobs with the same parameters to retrieve the next page
        # of import jobs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Maximum number of import jobs to return at once. Use this parameter to paginate results. If
        # additional import jobs exist beyond the specified limit, the NextToken element is sent in the
        # response. Use the NextToken value in subsequent requests to retrieve additional addresses.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @import_destination_type : String? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct ListImportJobsResponse
        include JSON::Serializable

        # A list of the import job summaries.

        @[JSON::Field(key: "ImportJobs")]
        getter import_jobs : Array(Types::ImportJobSummary)?

        # A string token indicating that there might be additional import jobs available to be listed. Copy
        # this token to a subsequent call to ListImportJobs with the same parameters to retrieve the next page
        # of import jobs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @import_jobs : Array(Types::ImportJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # An object used to specify a list or topic to which an email belongs, which will be used when a
      # contact chooses to unsubscribe.

      struct ListManagementOptions
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # The name of the topic.

        @[JSON::Field(key: "TopicName")]
        getter topic_name : String?

        def initialize(
          @contact_list_name : String,
          @topic_name : String? = nil
        )
        end
      end

      # Represents a request to list all the multi-region endpoints (global-endpoints) whose primary region
      # is the AWS-Region where operation is executed.

      struct ListMultiRegionEndpointsRequest
        include JSON::Serializable

        # A token returned from a previous call to ListMultiRegionEndpoints to indicate the position in the
        # list of multi-region endpoints (global-endpoints).

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListMultiRegionEndpoints . If the number of
        # results is larger than the number you specified in this parameter, the response includes a NextToken
        # element that you can use to retrieve the next page of results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The following elements are returned by the service.

      struct ListMultiRegionEndpointsResponse
        include JSON::Serializable

        # An array that contains key multi-region endpoint (global-endpoint) properties.

        @[JSON::Field(key: "MultiRegionEndpoints")]
        getter multi_region_endpoints : Array(Types::MultiRegionEndpoint)?

        # A token indicating that there are additional multi-region endpoints (global-endpoints) available to
        # be listed. Pass this token to a subsequent ListMultiRegionEndpoints call to retrieve the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @multi_region_endpoints : Array(Types::MultiRegionEndpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a request to list the existing recommendations for your account.

      struct ListRecommendationsRequest
        include JSON::Serializable

        # Filters applied when retrieving recommendations. Can eiter be an individual filter, or combinations
        # of STATUS and IMPACT or STATUS and TYPE

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, String)?

        # A token returned from a previous call to ListRecommendations to indicate the position in the list of
        # recommendations.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListRecommendations . If the number of results is
        # larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results. The value you specify has to be at least 1,
        # and can be no more than 100.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @filter : Hash(String, String)? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # Contains the response to your request to retrieve the list of recommendations for your account.

      struct ListRecommendationsResponse
        include JSON::Serializable

        # A string token indicating that there might be additional recommendations available to be listed. Use
        # the token provided in the ListRecommendationsResponse to use in the subsequent call to
        # ListRecommendations with the same parameters to retrieve the next page of recommendations.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The recommendations applicable to your account.

        @[JSON::Field(key: "Recommendations")]
        getter recommendations : Array(Types::Recommendation)?

        def initialize(
          @next_token : String? = nil,
          @recommendations : Array(Types::Recommendation)? = nil
        )
        end
      end

      # Represents a request to list reputation entities with optional filtering.

      struct ListReputationEntitiesRequest
        include JSON::Serializable

        # An object that contains filters to apply when listing reputation entities. You can filter by entity
        # type, reputation impact, sending status, or entity reference prefix.

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, String)?

        # A token returned from a previous call to ListReputationEntities to indicate the position in the list
        # of reputation entities.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListReputationEntities . If the number of results
        # is larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @filter : Hash(String, String)? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # A list of reputation entities in your account.

      struct ListReputationEntitiesResponse
        include JSON::Serializable

        # A token that indicates that there are additional reputation entities to list. To view additional
        # reputation entities, issue another request to ListReputationEntities , and pass this token in the
        # NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains information about the reputation entities in your account.

        @[JSON::Field(key: "ReputationEntities")]
        getter reputation_entities : Array(Types::ReputationEntity)?

        def initialize(
          @next_token : String? = nil,
          @reputation_entities : Array(Types::ReputationEntity)? = nil
        )
        end
      end

      # Represents a request to list tenants associated with a specific resource.

      struct ListResourceTenantsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to list associated tenants for.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A token returned from a previous call to ListResourceTenants to indicate the position in the list of
        # resource tenants.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListResourceTenants . If the number of results is
        # larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # Information about tenants associated with a specific resource.

      struct ListResourceTenantsResponse
        include JSON::Serializable

        # A token that indicates that there are additional tenants to list. To view additional tenants, issue
        # another request to ListResourceTenants , and pass this token in the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains information about each tenant associated with the resource.

        @[JSON::Field(key: "ResourceTenants")]
        getter resource_tenants : Array(Types::ResourceTenantMetadata)?

        def initialize(
          @next_token : String? = nil,
          @resource_tenants : Array(Types::ResourceTenantMetadata)? = nil
        )
        end
      end

      # A request to obtain a list of email destinations that are on the suppression list for your account.

      struct ListSuppressedDestinationsRequest
        include JSON::Serializable

        # Used to filter the list of suppressed email destinations so that it only includes addresses that
        # were added to the list before a specific date.

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time?

        # A token returned from a previous call to ListSuppressedDestinations to indicate the position in the
        # list of suppressed email addresses.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListSuppressedDestinations . If the number of
        # results is larger than the number you specified in this parameter, then the response includes a
        # NextToken element, which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The factors that caused the email address to be added to .

        @[JSON::Field(key: "Reason")]
        getter reasons : Array(String)?

        # Used to filter the list of suppressed email destinations so that it only includes addresses that
        # were added to the list after a specific date.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time?

        def initialize(
          @end_date : Time? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil,
          @reasons : Array(String)? = nil,
          @start_date : Time? = nil
        )
        end
      end

      # A list of suppressed email addresses.

      struct ListSuppressedDestinationsResponse
        include JSON::Serializable

        # A token that indicates that there are additional email addresses on the suppression list for your
        # account. To view additional suppressed addresses, issue another request to
        # ListSuppressedDestinations , and pass this token in the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of summaries, each containing a summary for a suppressed email destination.

        @[JSON::Field(key: "SuppressedDestinationSummaries")]
        getter suppressed_destination_summaries : Array(Types::SuppressedDestinationSummary)?

        def initialize(
          @next_token : String? = nil,
          @suppressed_destination_summaries : Array(Types::SuppressedDestinationSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to retrieve tag information for.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # An array that lists all the tags that are associated with the resource. Each tag consists of a
        # required tag key ( Key ) and an associated tag value ( Value )

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @tags : Array(Types::Tag)
        )
        end
      end

      # Represents a request to list resources associated with a specific tenant.

      struct ListTenantResourcesRequest
        include JSON::Serializable

        # The name of the tenant to list resources for.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String

        # A map of filter keys and values for filtering the list of tenant resources. Currently, the only
        # supported filter key is RESOURCE_TYPE .

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, String)?

        # A token returned from a previous call to ListTenantResources to indicate the position in the list of
        # tenant resources.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListTenantResources . If the number of results is
        # larger than the number you specified in this parameter, then the response includes a NextToken
        # element, which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @tenant_name : String,
          @filter : Hash(String, String)? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # Information about resources associated with a specific tenant.

      struct ListTenantResourcesResponse
        include JSON::Serializable

        # A token that indicates that there are additional resources to list. To view additional resources,
        # issue another request to ListTenantResources , and pass this token in the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains information about each resource associated with the tenant.

        @[JSON::Field(key: "TenantResources")]
        getter tenant_resources : Array(Types::TenantResource)?

        def initialize(
          @next_token : String? = nil,
          @tenant_resources : Array(Types::TenantResource)? = nil
        )
        end
      end

      # Represents a request to list all tenants associated with your account in the current Amazon Web
      # Services Region.

      struct ListTenantsRequest
        include JSON::Serializable

        # A token returned from a previous call to ListTenants to indicate the position in the list of
        # tenants.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of results to show in a single call to ListTenants . If the number of results is larger
        # than the number you specified in this parameter, then the response includes a NextToken element,
        # which you can use to obtain additional results.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # Information about tenants associated with your account.

      struct ListTenantsResponse
        include JSON::Serializable

        # A token that indicates that there are additional tenants to list. To view additional tenants, issue
        # another request to ListTenants , and pass this token in the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains basic information about each tenant.

        @[JSON::Field(key: "Tenants")]
        getter tenants : Array(Types::TenantInfo)?

        def initialize(
          @next_token : String? = nil,
          @tenants : Array(Types::TenantInfo)? = nil
        )
        end
      end

      # A list of attributes that are associated with a MAIL FROM domain.

      struct MailFromAttributes
        include JSON::Serializable

        # The action to take if the required MX record can't be found when you send an email. When you set
        # this value to USE_DEFAULT_VALUE , the mail is sent using amazonses.com as the MAIL FROM domain. When
        # you set this value to REJECT_MESSAGE , the Amazon SES API v2 returns a MailFromDomainNotVerified
        # error, and doesn't attempt to deliver the email. These behaviors are taken when the custom MAIL FROM
        # domain configuration is in the Pending , Failed , and TemporaryFailure states.

        @[JSON::Field(key: "BehaviorOnMxFailure")]
        getter behavior_on_mx_failure : String

        # The name of a domain that an email identity uses as a custom MAIL FROM domain.

        @[JSON::Field(key: "MailFromDomain")]
        getter mail_from_domain : String

        # The status of the MAIL FROM domain. This status can have the following values: PENDING – Amazon SES
        # hasn't started searching for the MX record yet. SUCCESS – Amazon SES detected the required MX record
        # for the MAIL FROM domain. FAILED – Amazon SES can't find the required MX record, or the record no
        # longer exists. TEMPORARY_FAILURE – A temporary issue occurred, which prevented Amazon SES from
        # determining the status of the MAIL FROM domain.

        @[JSON::Field(key: "MailFromDomainStatus")]
        getter mail_from_domain_status : String

        def initialize(
          @behavior_on_mx_failure : String,
          @mail_from_domain : String,
          @mail_from_domain_status : String
        )
        end
      end

      # The message can't be sent because the sending domain isn't verified.

      struct MailFromDomainNotVerifiedException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains detailed validation information about an email address.

      struct MailboxValidation
        include JSON::Serializable

        # Specific validation checks performed on the email address.

        @[JSON::Field(key: "Evaluations")]
        getter evaluations : Types::EmailAddressInsightsMailboxEvaluations?

        # Overall validity assessment with a conﬁdence verdict.

        @[JSON::Field(key: "IsValid")]
        getter is_valid : Types::EmailAddressInsightsVerdict?

        def initialize(
          @evaluations : Types::EmailAddressInsightsMailboxEvaluations? = nil,
          @is_valid : Types::EmailAddressInsightsVerdict? = nil
        )
        end
      end

      # Represents the email message that you're sending. The Message object consists of a subject line and
      # a message body.

      struct Message
        include JSON::Serializable

        # The body of the message. You can specify an HTML version of the message, a text-only version of the
        # message, or both.

        @[JSON::Field(key: "Body")]
        getter body : Types::Body

        # The subject line of the email. The subject line can only contain 7-bit ASCII characters. However,
        # you can specify non-ASCII characters in the subject line by using encoded-word syntax, as described
        # in RFC 2047 .

        @[JSON::Field(key: "Subject")]
        getter subject : Types::Content

        # The List of attachments to include in your email. All recipients will receive the same attachments.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::Attachment)?

        # The list of message headers that will be added to the email message.

        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::MessageHeader)?

        def initialize(
          @body : Types::Body,
          @subject : Types::Content,
          @attachments : Array(Types::Attachment)? = nil,
          @headers : Array(Types::MessageHeader)? = nil
        )
        end
      end

      # Contains the name and value of a message header that you add to an email.

      struct MessageHeader
        include JSON::Serializable

        # The name of the message header. The message header name has to meet the following criteria: Can
        # contain any printable ASCII character (33 - 126) except for colon (:). Can contain no more than 126
        # characters.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the message header. The message header value has to meet the following criteria: Can
        # contain any printable ASCII character. Can contain no more than 870 characters.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # An object that contains filters applied when performing the Message Insights export.

      struct MessageInsightsDataSource
        include JSON::Serializable

        # Represents the end date for the export interval as a timestamp. The end date is inclusive.

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time

        # Represents the start date for the export interval as a timestamp. The start date is inclusive.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time

        # Filters for results to be excluded from the export file.

        @[JSON::Field(key: "Exclude")]
        getter exclude : Types::MessageInsightsFilters?

        # Filters for results to be included in the export file.

        @[JSON::Field(key: "Include")]
        getter include : Types::MessageInsightsFilters?

        # The maximum number of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @end_date : Time,
          @start_date : Time,
          @exclude : Types::MessageInsightsFilters? = nil,
          @include : Types::MessageInsightsFilters? = nil,
          @max_results : Int32? = nil
        )
        end
      end

      # An object containing Message Insights filters. If you specify multiple filters, the filters are
      # joined by AND. If you specify multiple values for a filter, the values are joined by OR. Filter
      # values are case-sensitive. FromEmailAddress , Destination , and Subject filters support partial
      # match. A partial match is performed by using the * wildcard character placed at the beginning
      # (suffix match), the end (prefix match) or both ends of the string (contains match). In order to
      # match the literal characters * or \ , they must be escaped using the \ character. If no wildcard
      # character is present, an exact match is performed.

      struct MessageInsightsFilters
        include JSON::Serializable

        # The recipient's email address.

        @[JSON::Field(key: "Destination")]
        getter destination : Array(String)?

        # The from address used to send the message.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : Array(String)?

        # The recipient's ISP (e.g., Gmail , Yahoo , etc.).

        @[JSON::Field(key: "Isp")]
        getter isp : Array(String)?

        # The last delivery-related event for the email, where the ordering is as follows: SEND &lt; BOUNCE
        # &lt; DELIVERY &lt; COMPLAINT .

        @[JSON::Field(key: "LastDeliveryEvent")]
        getter last_delivery_event : Array(String)?

        # The last engagement-related event for the email, where the ordering is as follows: OPEN &lt; CLICK .
        # Engagement events are only available if Engagement tracking is enabled.

        @[JSON::Field(key: "LastEngagementEvent")]
        getter last_engagement_event : Array(String)?

        # The subject line of the message.

        @[JSON::Field(key: "Subject")]
        getter subject : Array(String)?

        def initialize(
          @destination : Array(String)? = nil,
          @from_email_address : Array(String)? = nil,
          @isp : Array(String)? = nil,
          @last_delivery_event : Array(String)? = nil,
          @last_engagement_event : Array(String)? = nil,
          @subject : Array(String)? = nil
        )
        end
      end

      # The message can't be sent because it contains invalid content.

      struct MessageRejected
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the name and value of a tag that you apply to an email. You can use message tags when you
      # publish email sending events.

      struct MessageTag
        include JSON::Serializable

        # The name of the message tag. The message tag name has to meet the following criteria: It can only
        # contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_), or dashes (-). It can contain no
        # more than 256 characters.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the message tag. The message tag value has to meet the following criteria: It can only
        # contain ASCII letters (a–z, A–Z), numbers (0–9), underscores (_), or dashes (-). It can contain no
        # more than 256 characters.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # An error corresponding to the unsuccessful processing of a single metric data query.

      struct MetricDataError
        include JSON::Serializable

        # The query error code. Can be one of: INTERNAL_FAILURE – Amazon SES has failed to process one of the
        # queries. ACCESS_DENIED – You have insufficient access to retrieve metrics based on the given query.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The query identifier.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The error message associated with the current query error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The result of a single metric data query.

      struct MetricDataResult
        include JSON::Serializable

        # The query identifier.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A list of timestamps for the metric data results.

        @[JSON::Field(key: "Timestamps")]
        getter timestamps : Array(Time)?

        # A list of values (cumulative / sum) for the metric data results.

        @[JSON::Field(key: "Values")]
        getter values : Array(Int64)?

        def initialize(
          @id : String? = nil,
          @timestamps : Array(Time)? = nil,
          @values : Array(Int64)? = nil
        )
        end
      end

      # An object that contains details about the data source for the metrics export.

      struct MetricsDataSource
        include JSON::Serializable

        # An object that contains a mapping between a MetricDimensionName and MetricDimensionValue to filter
        # metrics by. Must contain a least 1 dimension but no more than 3 unique ones.

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Hash(String, Array(String))

        # Represents the end date for the export interval as a timestamp.

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time

        # A list of ExportMetric objects to export.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(Types::ExportMetric)

        # The metrics namespace - e.g., VDM .

        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # Represents the start date for the export interval as a timestamp.

        @[JSON::Field(key: "StartDate")]
        getter start_date : Time

        def initialize(
          @dimensions : Hash(String, Array(String)),
          @end_date : Time,
          @metrics : Array(Types::ExportMetric),
          @namespace : String,
          @start_date : Time
        )
        end
      end

      # An object that contains multi-region endpoint (global-endpoint) properties.

      struct MultiRegionEndpoint
        include JSON::Serializable

        # The time stamp of when the multi-region endpoint (global-endpoint) was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ID of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The name of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String?

        # The time stamp of when the multi-region endpoint (global-endpoint) was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # Primary and secondary regions between which multi-region endpoint splits sending traffic.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        # The status of the multi-region endpoint (global-endpoint). CREATING – The resource is being
        # provisioned. READY – The resource is ready to use. FAILED – The resource failed to be provisioned.
        # DELETING – The resource is being deleted as requested.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @endpoint_id : String? = nil,
          @endpoint_name : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @regions : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # The resource you attempted to access doesn't exist.

      struct NotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that contains information about email that was sent from the selected domain.

      struct OverallVolume
        include JSON::Serializable

        # An object that contains inbox and junk mail placement metrics for individual email providers.

        @[JSON::Field(key: "DomainIspPlacements")]
        getter domain_isp_placements : Array(Types::DomainIspPlacement)?

        # The percentage of emails that were sent from the domain that were read by their recipients.

        @[JSON::Field(key: "ReadRatePercent")]
        getter read_rate_percent : Float64?

        # An object that contains information about the numbers of messages that arrived in recipients'
        # inboxes and junk mail folders.

        @[JSON::Field(key: "VolumeStatistics")]
        getter volume_statistics : Types::VolumeStatistics?

        def initialize(
          @domain_isp_placements : Array(Types::DomainIspPlacement)? = nil,
          @read_rate_percent : Float64? = nil,
          @volume_statistics : Types::VolumeStatistics? = nil
        )
        end
      end

      # An object that defines an Amazon Pinpoint project destination for email events. You can send email
      # event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards
      # that are built in to Amazon Pinpoint. For more information, see Transactional Messaging Charts in
      # the Amazon Pinpoint User Guide .

      struct PinpointDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Pinpoint project to send email events to.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        def initialize(
          @application_arn : String? = nil
        )
        end
      end

      # An object that contains inbox placement data for an email provider.

      struct PlacementStatistics
        include JSON::Serializable

        # The percentage of emails that were authenticated by using DomainKeys Identified Mail (DKIM) during
        # the predictive inbox placement test.

        @[JSON::Field(key: "DkimPercentage")]
        getter dkim_percentage : Float64?

        # The percentage of emails that arrived in recipients' inboxes during the predictive inbox placement
        # test.

        @[JSON::Field(key: "InboxPercentage")]
        getter inbox_percentage : Float64?

        # The percentage of emails that didn't arrive in recipients' inboxes at all during the predictive
        # inbox placement test.

        @[JSON::Field(key: "MissingPercentage")]
        getter missing_percentage : Float64?

        # The percentage of emails that arrived in recipients' spam or junk mail folders during the predictive
        # inbox placement test.

        @[JSON::Field(key: "SpamPercentage")]
        getter spam_percentage : Float64?

        # The percentage of emails that were authenticated by using Sender Policy Framework (SPF) during the
        # predictive inbox placement test.

        @[JSON::Field(key: "SpfPercentage")]
        getter spf_percentage : Float64?

        def initialize(
          @dkim_percentage : Float64? = nil,
          @inbox_percentage : Float64? = nil,
          @missing_percentage : Float64? = nil,
          @spam_percentage : Float64? = nil,
          @spf_percentage : Float64? = nil
        )
        end
      end

      # A request to enable or disable the automatic IP address warm-up feature.

      struct PutAccountDedicatedIpWarmupAttributesRequest
        include JSON::Serializable

        # Enables or disables the automatic warm-up feature for dedicated IP addresses that are associated
        # with your Amazon SES account in the current Amazon Web Services Region. Set to true to enable the
        # automatic warm-up feature, or set to false to disable it.

        @[JSON::Field(key: "AutoWarmupEnabled")]
        getter auto_warmup_enabled : Bool?

        def initialize(
          @auto_warmup_enabled : Bool? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutAccountDedicatedIpWarmupAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to submit new account details.

      struct PutAccountDetailsRequest
        include JSON::Serializable

        # The type of email your account will send.

        @[JSON::Field(key: "MailType")]
        getter mail_type : String

        # The URL of your website. This information helps us better understand the type of content that you
        # plan to send.

        @[JSON::Field(key: "WebsiteURL")]
        getter website_url : String

        # Additional email addresses that you would like to be notified regarding Amazon SES matters.

        @[JSON::Field(key: "AdditionalContactEmailAddresses")]
        getter additional_contact_email_addresses : Array(String)?

        # The language you would prefer to be contacted with.

        @[JSON::Field(key: "ContactLanguage")]
        getter contact_language : String?

        # Indicates whether or not your account should have production access in the current Amazon Web
        # Services Region. If the value is false , then your account is in the sandbox . When your account is
        # in the sandbox, you can only send email to verified identities. If the value is true , then your
        # account has production access. When your account has production access, you can send email to any
        # address. The sending quota and maximum sending rate for your account vary based on your specific use
        # case.

        @[JSON::Field(key: "ProductionAccessEnabled")]
        getter production_access_enabled : Bool?

        # A description of the types of email that you plan to send.

        @[JSON::Field(key: "UseCaseDescription")]
        getter use_case_description : String?

        def initialize(
          @mail_type : String,
          @website_url : String,
          @additional_contact_email_addresses : Array(String)? = nil,
          @contact_language : String? = nil,
          @production_access_enabled : Bool? = nil,
          @use_case_description : String? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutAccountDetailsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to change the ability of your account to send email.

      struct PutAccountSendingAttributesRequest
        include JSON::Serializable

        # Enables or disables your account's ability to send email. Set to true to enable email sending, or
        # set to false to disable email sending. If Amazon Web Services paused your account's ability to send
        # email, you can't use this operation to resume your account's ability to send email.

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        def initialize(
          @sending_enabled : Bool? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutAccountSendingAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to change your account's suppression preferences.

      struct PutAccountSuppressionAttributesRequest
        include JSON::Serializable

        # A list that contains the reasons that email addresses will be automatically added to the suppression
        # list for your account. This list can contain any or all of the following: COMPLAINT – Amazon SES
        # adds an email address to the suppression list for your account when a message sent to that address
        # results in a complaint. BOUNCE – Amazon SES adds an email address to the suppression list for your
        # account when a message sent to that address results in a hard bounce.

        @[JSON::Field(key: "SuppressedReasons")]
        getter suppressed_reasons : Array(String)?

        # An object that contains additional suppression attributes for your account.

        @[JSON::Field(key: "ValidationAttributes")]
        getter validation_attributes : Types::SuppressionValidationAttributes?

        def initialize(
          @suppressed_reasons : Array(String)? = nil,
          @validation_attributes : Types::SuppressionValidationAttributes? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutAccountSuppressionAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to submit new account VDM attributes.

      struct PutAccountVdmAttributesRequest
        include JSON::Serializable

        # The VDM attributes that you wish to apply to your Amazon SES account.

        @[JSON::Field(key: "VdmAttributes")]
        getter vdm_attributes : Types::VdmAttributes

        def initialize(
          @vdm_attributes : Types::VdmAttributes
        )
        end
      end


      struct PutAccountVdmAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to associate a configuration set with a MailManager archive.

      struct PutConfigurationSetArchivingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set to associate with a MailManager archive.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The Amazon Resource Name (ARN) of the MailManager archive that the Amazon SES API v2 sends email to.

        @[JSON::Field(key: "ArchiveArn")]
        getter archive_arn : String?

        def initialize(
          @configuration_set_name : String,
          @archive_arn : String? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetArchivingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to associate a configuration set with a dedicated IP pool.

      struct PutConfigurationSetDeliveryOptionsRequest
        include JSON::Serializable

        # The name of the configuration set to associate with a dedicated IP pool.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The maximum amount of time, in seconds, that Amazon SES API v2 will attempt delivery of email. If
        # specified, the value must greater than or equal to 300 seconds (5 minutes) and less than or equal to
        # 50400 seconds (840 minutes).

        @[JSON::Field(key: "MaxDeliverySeconds")]
        getter max_delivery_seconds : Int64?

        # The name of the dedicated IP pool to associate with the configuration set.

        @[JSON::Field(key: "SendingPoolName")]
        getter sending_pool_name : String?

        # Specifies whether messages that use the configuration set are required to use Transport Layer
        # Security (TLS). If the value is Require , messages are only delivered if a TLS connection can be
        # established. If the value is Optional , messages can be delivered in plain text if a TLS connection
        # can't be established.

        @[JSON::Field(key: "TlsPolicy")]
        getter tls_policy : String?

        def initialize(
          @configuration_set_name : String,
          @max_delivery_seconds : Int64? = nil,
          @sending_pool_name : String? = nil,
          @tls_policy : String? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetDeliveryOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to enable or disable tracking of reputation metrics for a configuration set.

      struct PutConfigurationSetReputationOptionsRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # If true , tracking of reputation metrics is enabled for the configuration set. If false , tracking
        # of reputation metrics is disabled for the configuration set.

        @[JSON::Field(key: "ReputationMetricsEnabled")]
        getter reputation_metrics_enabled : Bool?

        def initialize(
          @configuration_set_name : String,
          @reputation_metrics_enabled : Bool? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetReputationOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to enable or disable the ability of Amazon SES to send emails that use a specific
      # configuration set.

      struct PutConfigurationSetSendingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set to enable or disable email sending for.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # If true , email sending is enabled for the configuration set. If false , email sending is disabled
        # for the configuration set.

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        def initialize(
          @configuration_set_name : String,
          @sending_enabled : Bool? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetSendingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to change the account suppression list preferences for a specific configuration set.

      struct PutConfigurationSetSuppressionOptionsRequest
        include JSON::Serializable

        # The name of the configuration set to change the suppression list preferences for.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # A list that contains the reasons that email addresses are automatically added to the suppression
        # list for your account. This list can contain any or all of the following: COMPLAINT – Amazon SES
        # adds an email address to the suppression list for your account when a message sent to that address
        # results in a complaint. BOUNCE – Amazon SES adds an email address to the suppression list for your
        # account when a message sent to that address results in a hard bounce.

        @[JSON::Field(key: "SuppressedReasons")]
        getter suppressed_reasons : Array(String)?

        # An object that contains information about the email address suppression preferences for the
        # configuration set in the current Amazon Web Services Region.

        @[JSON::Field(key: "ValidationOptions")]
        getter validation_options : Types::SuppressionValidationOptions?

        def initialize(
          @configuration_set_name : String,
          @suppressed_reasons : Array(String)? = nil,
          @validation_options : Types::SuppressionValidationOptions? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetSuppressionOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to add a custom domain for tracking open and click events to a configuration set.

      struct PutConfigurationSetTrackingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The domain to use to track open and click events.

        @[JSON::Field(key: "CustomRedirectDomain")]
        getter custom_redirect_domain : String?


        @[JSON::Field(key: "HttpsPolicy")]
        getter https_policy : String?

        def initialize(
          @configuration_set_name : String,
          @custom_redirect_domain : String? = nil,
          @https_policy : String? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetTrackingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to add specific VDM settings to a configuration set.

      struct PutConfigurationSetVdmOptionsRequest
        include JSON::Serializable

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The VDM options to apply to the configuration set.

        @[JSON::Field(key: "VdmOptions")]
        getter vdm_options : Types::VdmOptions?

        def initialize(
          @configuration_set_name : String,
          @vdm_options : Types::VdmOptions? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetVdmOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to move a dedicated IP address to a dedicated IP pool.

      struct PutDedicatedIpInPoolRequest
        include JSON::Serializable

        # The name of the IP pool that you want to add the dedicated IP address to. You have to specify an IP
        # pool that already exists.

        @[JSON::Field(key: "DestinationPoolName")]
        getter destination_pool_name : String

        # The IP address that you want to move to the dedicated IP pool. The value you specify has to be a
        # dedicated IP address that's associated with your Amazon Web Services account.

        @[JSON::Field(key: "IP")]
        getter ip : String

        def initialize(
          @destination_pool_name : String,
          @ip : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutDedicatedIpInPoolResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to convert a dedicated IP pool to a different scaling mode.

      struct PutDedicatedIpPoolScalingAttributesRequest
        include JSON::Serializable

        # The name of the dedicated IP pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # The scaling mode to apply to the dedicated IP pool. Changing the scaling mode from MANAGED to
        # STANDARD is not supported.

        @[JSON::Field(key: "ScalingMode")]
        getter scaling_mode : String

        def initialize(
          @pool_name : String,
          @scaling_mode : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutDedicatedIpPoolScalingAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to change the warm-up attributes for a dedicated IP address. This operation is useful when
      # you want to resume the warm-up process for an existing IP address.

      struct PutDedicatedIpWarmupAttributesRequest
        include JSON::Serializable

        # The dedicated IP address that you want to update the warm-up attributes for.

        @[JSON::Field(key: "IP")]
        getter ip : String

        # The warm-up percentage that you want to associate with the dedicated IP address.

        @[JSON::Field(key: "WarmupPercentage")]
        getter warmup_percentage : Int32

        def initialize(
          @ip : String,
          @warmup_percentage : Int32
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutDedicatedIpWarmupAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you
      # gain access to reputation, deliverability, and other metrics for the domains that you use to send
      # email using Amazon SES API v2. You also gain the ability to perform predictive inbox placement
      # tests. When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition
      # to any other fees that you accrue by using Amazon SES and other Amazon Web Services services. For
      # more information about the features and cost of a Deliverability dashboard subscription, see Amazon
      # Pinpoint Pricing .

      struct PutDeliverabilityDashboardOptionRequest
        include JSON::Serializable

        # Specifies whether to enable the Deliverability dashboard. To enable the dashboard, set this value to
        # true .

        @[JSON::Field(key: "DashboardEnabled")]
        getter dashboard_enabled : Bool

        # An array of objects, one for each verified domain that you use to send email and enabled the
        # Deliverability dashboard for.

        @[JSON::Field(key: "SubscribedDomains")]
        getter subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)?

        def initialize(
          @dashboard_enabled : Bool,
          @subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)? = nil
        )
        end
      end

      # A response that indicates whether the Deliverability dashboard is enabled.

      struct PutDeliverabilityDashboardOptionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to associate a configuration set with an email identity.

      struct PutEmailIdentityConfigurationSetAttributesRequest
        include JSON::Serializable

        # The email address or domain to associate with a configuration set.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The configuration set to associate with an email identity.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        def initialize(
          @email_identity : String,
          @configuration_set_name : String? = nil
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct PutEmailIdentityConfigurationSetAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to enable or disable DKIM signing of email that you send from an email identity.

      struct PutEmailIdentityDkimAttributesRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # Sets the DKIM signing configuration for the identity. When you set this value true , then the
        # messages that are sent from the identity are signed using DKIM. If you set this value to false ,
        # your messages are sent without DKIM signing.

        @[JSON::Field(key: "SigningEnabled")]
        getter signing_enabled : Bool?

        def initialize(
          @email_identity : String,
          @signing_enabled : Bool? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutEmailIdentityDkimAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to change the DKIM attributes for an email identity.

      struct PutEmailIdentityDkimSigningAttributesRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The method to use to configure DKIM for the identity. There are the following possible values:
        # AWS_SES – Configure DKIM for the identity by using Easy DKIM . EXTERNAL – Configure DKIM for the
        # identity by using Bring Your Own DKIM (BYODKIM).

        @[JSON::Field(key: "SigningAttributesOrigin")]
        getter signing_attributes_origin : String

        # An object that contains information about the private key and selector that you want to use to
        # configure DKIM for the identity for Bring Your Own DKIM (BYODKIM) for the identity, or, configures
        # the key length to be used for Easy DKIM .

        @[JSON::Field(key: "SigningAttributes")]
        getter signing_attributes : Types::DkimSigningAttributes?

        def initialize(
          @email_identity : String,
          @signing_attributes_origin : String,
          @signing_attributes : Types::DkimSigningAttributes? = nil
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response. The following data is
      # returned in JSON format by the service.

      struct PutEmailIdentityDkimSigningAttributesResponse
        include JSON::Serializable

        # The DKIM authentication status of the identity. Amazon SES determines the authentication status by
        # searching for specific records in the DNS configuration for your domain. If you used Easy DKIM to
        # set up DKIM authentication, Amazon SES tries to find three unique CNAME records in the DNS
        # configuration for your domain. If you provided a public key to perform DKIM authentication, Amazon
        # SES tries to find a TXT record that uses the selector that you specified. The value of the TXT
        # record must be a public key that's paired with the private key that you specified in the process of
        # creating the identity. The status can be one of the following: PENDING – The verification process
        # was initiated, but Amazon SES hasn't yet detected the DKIM records in the DNS configuration for the
        # domain. SUCCESS – The verification process completed successfully. FAILED – The verification process
        # failed. This typically occurs when Amazon SES fails to find the DKIM records in the DNS
        # configuration of the domain. TEMPORARY_FAILURE – A temporary issue is preventing Amazon SES from
        # determining the DKIM authentication status of the domain. NOT_STARTED – The DKIM verification
        # process hasn't been initiated for the domain.

        @[JSON::Field(key: "DkimStatus")]
        getter dkim_status : String?

        # If you used Easy DKIM to configure DKIM authentication for the domain, then this object contains a
        # set of unique strings that you use to create a set of CNAME records that you add to the DNS
        # configuration for your domain. When Amazon SES detects these records in the DNS configuration for
        # your domain, the DKIM authentication process is complete. If you configured DKIM authentication for
        # the domain by providing your own public-private key pair, then this object contains the selector
        # that's associated with your public key. Regardless of the DKIM authentication method you use, Amazon
        # SES searches for the appropriate records in the DNS configuration of the domain for up to 72 hours.

        @[JSON::Field(key: "DkimTokens")]
        getter dkim_tokens : Array(String)?

        # The hosted zone where Amazon SES publishes the DKIM public key TXT records for this email identity.
        # This value indicates the DNS zone that customers must reference when configuring their CNAME records
        # for DKIM authentication. When configuring DKIM for your domain, create CNAME records in your DNS
        # that point to the selectors in this hosted zone. For example: selector1._domainkey.yourdomain.com
        # CNAME selector1.&lt;SigningHostedZone&gt; selector2._domainkey.yourdomain.com CNAME
        # selector2.&lt;SigningHostedZone&gt; selector3._domainkey.yourdomain.com CNAME
        # selector3.&lt;SigningHostedZone&gt;

        @[JSON::Field(key: "SigningHostedZone")]
        getter signing_hosted_zone : String?

        def initialize(
          @dkim_status : String? = nil,
          @dkim_tokens : Array(String)? = nil,
          @signing_hosted_zone : String? = nil
        )
        end
      end

      # A request to set the attributes that control how bounce and complaint events are processed.

      struct PutEmailIdentityFeedbackAttributesRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # Sets the feedback forwarding configuration for the identity. If the value is true , you receive
        # email notifications when bounce or complaint events occur. These notifications are sent to the
        # address that you specified in the Return-Path header of the original email. You're required to have
        # a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving
        # bounce or complaint notifications (for example, by setting up an event destination), you receive an
        # email notification when these events occur (even if this setting is disabled).

        @[JSON::Field(key: "EmailForwardingEnabled")]
        getter email_forwarding_enabled : Bool?

        def initialize(
          @email_identity : String,
          @email_forwarding_enabled : Bool? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutEmailIdentityFeedbackAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to configure the custom MAIL FROM domain for a verified identity.

      struct PutEmailIdentityMailFromAttributesRequest
        include JSON::Serializable

        # The verified email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The action to take if the required MX record isn't found when you send an email. When you set this
        # value to UseDefaultValue , the mail is sent using amazonses.com as the MAIL FROM domain. When you
        # set this value to RejectMessage , the Amazon SES API v2 returns a MailFromDomainNotVerified error,
        # and doesn't attempt to deliver the email. These behaviors are taken when the custom MAIL FROM domain
        # configuration is in the Pending , Failed , and TemporaryFailure states.

        @[JSON::Field(key: "BehaviorOnMxFailure")]
        getter behavior_on_mx_failure : String?

        # The custom MAIL FROM domain that you want the verified identity to use. The MAIL FROM domain must
        # meet the following criteria: It has to be a subdomain of the verified identity. It can't be used to
        # receive email. It can't be used in a "From" address if the MAIL FROM domain is a destination for
        # feedback forwarding emails.

        @[JSON::Field(key: "MailFromDomain")]
        getter mail_from_domain : String?

        def initialize(
          @email_identity : String,
          @behavior_on_mx_failure : String? = nil,
          @mail_from_domain : String? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutEmailIdentityMailFromAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to add an email destination to the suppression list for your account.

      struct PutSuppressedDestinationRequest
        include JSON::Serializable

        # The email address that should be added to the suppression list for your account.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # The factors that should cause the email address to be added to the suppression list for your
        # account.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @email_address : String,
          @reason : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutSuppressedDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the raw content of an email message.

      struct RawMessage
        include JSON::Serializable

        # The raw email message. The message has to meet the following criteria: The message has to contain a
        # header and a body, separated by one blank line. All of the required header fields must be present in
        # the message. Each part of a multipart MIME message must be formatted properly. Attachments must be
        # in a file format that the Amazon SES supports. The raw data of the message needs to base64-encoded
        # if you are accessing Amazon SES directly through the HTTPS interface. If you are accessing Amazon
        # SES using an Amazon Web Services SDK, the SDK takes care of the base 64-encoding for you. If any of
        # the MIME parts in your message contain content that is outside of the 7-bit ASCII character range,
        # you should encode that content to ensure that recipients' email clients render the message properly.
        # The length of any single line of text in the message can't exceed 1,000 characters. This restriction
        # is defined in RFC 5321 .

        @[JSON::Field(key: "Data")]
        getter data : Bytes

        def initialize(
          @data : Bytes
        )
        end
      end

      # A recommendation generated for your account.

      struct Recommendation
        include JSON::Serializable

        # The first time this issue was encountered and the recommendation was generated.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The recommendation description / disambiguator - e.g. DKIM1 and DKIM2 are different recommendations
        # about your DKIM setup.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The recommendation impact, with values like HIGH or LOW .

        @[JSON::Field(key: "Impact")]
        getter impact : String?

        # The last time the recommendation was updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The resource affected by the recommendation, with values like
        # arn:aws:ses:us-east-1:123456789012:identity/example.com .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The recommendation status, with values like OPEN or FIXED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The recommendation type, with values like DKIM , SPF , DMARC , BIMI , or COMPLAINT .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @impact : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @resource_arn : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The ReplaceEmailContent object to be used for a specific BulkEmailEntry . The ReplacementTemplate
      # can be specified within this object.

      struct ReplacementEmailContent
        include JSON::Serializable

        # The ReplacementTemplate associated with ReplacementEmailContent .

        @[JSON::Field(key: "ReplacementTemplate")]
        getter replacement_template : Types::ReplacementTemplate?

        def initialize(
          @replacement_template : Types::ReplacementTemplate? = nil
        )
        end
      end

      # An object which contains ReplacementTemplateData to be used for a specific BulkEmailEntry .

      struct ReplacementTemplate
        include JSON::Serializable

        # A list of replacement values to apply to the template. This parameter is a JSON object, typically
        # consisting of key-value pairs in which the keys correspond to replacement tags in the email
        # template.

        @[JSON::Field(key: "ReplacementTemplateData")]
        getter replacement_template_data : String?

        def initialize(
          @replacement_template_data : String? = nil
        )
        end
      end

      # An object that contains information about a reputation entity, including its reference, type,
      # policy, status records, and reputation impact.

      struct ReputationEntity
        include JSON::Serializable

        # The Amazon Web Services Amazon SES-managed status record for this reputation entity, including the
        # current status, cause description, and last updated timestamp.

        @[JSON::Field(key: "AwsSesManagedStatus")]
        getter aws_ses_managed_status : Types::StatusRecord?

        # The customer-managed status record for this reputation entity, including the current status, cause
        # description, and last updated timestamp.

        @[JSON::Field(key: "CustomerManagedStatus")]
        getter customer_managed_status : Types::StatusRecord?

        # The unique identifier for the reputation entity. For resource-type entities, this is the Amazon
        # Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ReputationEntityReference")]
        getter reputation_entity_reference : String?

        # The type of reputation entity. Currently, only RESOURCE type entities are supported.

        @[JSON::Field(key: "ReputationEntityType")]
        getter reputation_entity_type : String?

        # The reputation impact level for this entity, representing the highest impact reputation finding
        # currently active. Reputation findings can be retrieved using the ListRecommendations operation.

        @[JSON::Field(key: "ReputationImpact")]
        getter reputation_impact : String?

        # The Amazon Resource Name (ARN) of the reputation management policy applied to this entity. This is
        # an Amazon Web Services Amazon SES-managed policy.

        @[JSON::Field(key: "ReputationManagementPolicy")]
        getter reputation_management_policy : String?

        # The aggregate sending status that determines whether the entity is allowed to send emails. This
        # status is derived from both the customer-managed and Amazon Web Services Amazon SES-managed
        # statuses. If either the customer-managed status or the Amazon Web Services Amazon SES-managed status
        # is DISABLED , the aggregate status will be DISABLED and the entity will not be allowed to send
        # emails. When the customer-managed status is set to REINSTATED , the entity can continue sending even
        # if there are active reputation findings, provided the Amazon Web Services Amazon SES-managed status
        # also permits sending. The entity can only send emails when both statuses permit sending.

        @[JSON::Field(key: "SendingStatusAggregate")]
        getter sending_status_aggregate : String?

        def initialize(
          @aws_ses_managed_status : Types::StatusRecord? = nil,
          @customer_managed_status : Types::StatusRecord? = nil,
          @reputation_entity_reference : String? = nil,
          @reputation_entity_type : String? = nil,
          @reputation_impact : String? = nil,
          @reputation_management_policy : String? = nil,
          @sending_status_aggregate : String? = nil
        )
        end
      end

      # Enable or disable collection of reputation metrics for emails that you send using this configuration
      # set in the current Amazon Web Services Region.

      struct ReputationOptions
        include JSON::Serializable

        # The date and time (in Unix time) when the reputation metrics were last given a fresh start. When
        # your account is given a fresh start, your reputation metrics are calculated starting from the date
        # of the fresh start.

        @[JSON::Field(key: "LastFreshStart")]
        getter last_fresh_start : Time?

        # If true , tracking of reputation metrics is enabled for the configuration set. If false , tracking
        # of reputation metrics is disabled for the configuration set.

        @[JSON::Field(key: "ReputationMetricsEnabled")]
        getter reputation_metrics_enabled : Bool?

        def initialize(
          @last_fresh_start : Time? = nil,
          @reputation_metrics_enabled : Bool? = nil
        )
        end
      end

      # A structure that contains information about a tenant associated with a resource.

      struct ResourceTenantMetadata
        include JSON::Serializable

        # The date and time when the resource was associated with the tenant.

        @[JSON::Field(key: "AssociatedTimestamp")]
        getter associated_timestamp : Time?

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # A unique identifier for the tenant associated with the resource.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String?

        # The name of the tenant associated with the resource.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String?

        def initialize(
          @associated_timestamp : Time? = nil,
          @resource_arn : String? = nil,
          @tenant_id : String? = nil,
          @tenant_name : String? = nil
        )
        end
      end

      # An object that contains information about your account details review.

      struct ReviewDetails
        include JSON::Serializable

        # The associated support center case ID (if any).

        @[JSON::Field(key: "CaseId")]
        getter case_id : String?

        # The status of the latest review of your account. The status can be one of the following: PENDING –
        # We have received your appeal and are in the process of reviewing it. GRANTED – Your appeal has been
        # reviewed and your production access has been granted. DENIED – Your appeal has been reviewed and
        # your production access has been denied. FAILED – An internal error occurred and we didn't receive
        # your appeal. You can submit your appeal again.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @case_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An object which contains an AWS-Region and routing status.

      struct Route
        include JSON::Serializable

        # The name of an AWS-Region.

        @[JSON::Field(key: "Region")]
        getter region : String

        def initialize(
          @region : String
        )
        end
      end

      # An object that contains route configuration. Includes secondary region name.

      struct RouteDetails
        include JSON::Serializable

        # The name of an AWS-Region to be a secondary region for the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "Region")]
        getter region : String

        def initialize(
          @region : String
        )
        end
      end

      # An object that contains information about the start of authority (SOA) record associated with the
      # identity.

      struct SOARecord
        include JSON::Serializable

        # Administrative contact email from the SOA record.

        @[JSON::Field(key: "AdminEmail")]
        getter admin_email : String?

        # Primary name server specified in the SOA record.

        @[JSON::Field(key: "PrimaryNameServer")]
        getter primary_name_server : String?

        # Serial number from the SOA record.

        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : Int64?

        def initialize(
          @admin_email : String? = nil,
          @primary_name_server : String? = nil,
          @serial_number : Int64? = nil
        )
        end
      end

      # Represents a request to send email messages to multiple destinations using Amazon SES. For more
      # information, see the Amazon SES Developer Guide .

      struct SendBulkEmailRequest
        include JSON::Serializable

        # The list of bulk email entry objects.

        @[JSON::Field(key: "BulkEmailEntries")]
        getter bulk_email_entries : Array(Types::BulkEmailEntry)

        # An object that contains the body of the message. You can specify a template message.

        @[JSON::Field(key: "DefaultContent")]
        getter default_content : Types::BulkEmailContent

        # The name of the configuration set to use when sending the email.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using the
        # SendEmail operation. Tags correspond to characteristics of the email that you define, so that you
        # can publish email sending events.

        @[JSON::Field(key: "DefaultEmailTags")]
        getter default_email_tags : Array(Types::MessageTag)?

        # The ID of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The address that you want bounce and complaint notifications to be sent to.

        @[JSON::Field(key: "FeedbackForwardingEmailAddress")]
        getter feedback_forwarding_email_address : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the FeedbackForwardingEmailAddress parameter. For example, if the owner of example.com (which has
        # ARN arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy to it that authorizes
        # you to use feedback@example.com, then you would specify the
        # FeedbackForwardingEmailAddressIdentityArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com, and the FeedbackForwardingEmailAddress to
        # be feedback@example.com. For more information about sending authorization, see the Amazon SES
        # Developer Guide .

        @[JSON::Field(key: "FeedbackForwardingEmailAddressIdentityArn")]
        getter feedback_forwarding_email_address_identity_arn : String?

        # The email address to use as the "From" address for the email. The address that you specify has to be
        # verified.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the FromEmailAddress parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy to it that authorizes you
        # to use sender@example.com, then you would specify the FromEmailAddressIdentityArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com, and the FromEmailAddress to be
        # sender@example.com. For more information about sending authorization, see the Amazon SES Developer
        # Guide .

        @[JSON::Field(key: "FromEmailAddressIdentityArn")]
        getter from_email_address_identity_arn : String?

        # The "Reply-to" email addresses for the message. When the recipient replies to the message, each
        # Reply-to address receives the reply.

        @[JSON::Field(key: "ReplyToAddresses")]
        getter reply_to_addresses : Array(String)?

        # The name of the tenant through which this bulk email will be sent. The email sending operation will
        # only succeed if all referenced resources (identities, configuration sets, and templates) are
        # associated with this tenant.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String?

        def initialize(
          @bulk_email_entries : Array(Types::BulkEmailEntry),
          @default_content : Types::BulkEmailContent,
          @configuration_set_name : String? = nil,
          @default_email_tags : Array(Types::MessageTag)? = nil,
          @endpoint_id : String? = nil,
          @feedback_forwarding_email_address : String? = nil,
          @feedback_forwarding_email_address_identity_arn : String? = nil,
          @from_email_address : String? = nil,
          @from_email_address_identity_arn : String? = nil,
          @reply_to_addresses : Array(String)? = nil,
          @tenant_name : String? = nil
        )
        end
      end

      # The following data is returned in JSON format by the service.

      struct SendBulkEmailResponse
        include JSON::Serializable

        # One object per intended recipient. Check each response object and retry any messages with a failure
        # status.

        @[JSON::Field(key: "BulkEmailEntryResults")]
        getter bulk_email_entry_results : Array(Types::BulkEmailEntryResult)

        def initialize(
          @bulk_email_entry_results : Array(Types::BulkEmailEntryResult)
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

      # The following element is returned by the service.

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

      # Represents a request to send a single formatted email using Amazon SES. For more information, see
      # the Amazon SES Developer Guide .

      struct SendEmailRequest
        include JSON::Serializable

        # An object that contains the body of the message. You can send either a Simple message, Raw message,
        # or a Templated message.

        @[JSON::Field(key: "Content")]
        getter content : Types::EmailContent

        # The name of the configuration set to use when sending the email.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # An object that contains the recipients of the email message.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using the
        # SendEmail operation. Tags correspond to characteristics of the email that you define, so that you
        # can publish email sending events.

        @[JSON::Field(key: "EmailTags")]
        getter email_tags : Array(Types::MessageTag)?

        # The ID of the multi-region endpoint (global-endpoint).

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The address that you want bounce and complaint notifications to be sent to.

        @[JSON::Field(key: "FeedbackForwardingEmailAddress")]
        getter feedback_forwarding_email_address : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the FeedbackForwardingEmailAddress parameter. For example, if the owner of example.com (which has
        # ARN arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy to it that authorizes
        # you to use feedback@example.com, then you would specify the
        # FeedbackForwardingEmailAddressIdentityArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com, and the FeedbackForwardingEmailAddress to
        # be feedback@example.com. For more information about sending authorization, see the Amazon SES
        # Developer Guide .

        @[JSON::Field(key: "FeedbackForwardingEmailAddressIdentityArn")]
        getter feedback_forwarding_email_address_identity_arn : String?

        # The email address to use as the "From" address for the email. The address that you specify has to be
        # verified.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # This parameter is used only for sending authorization. It is the ARN of the identity that is
        # associated with the sending authorization policy that permits you to use the email address specified
        # in the FromEmailAddress parameter. For example, if the owner of example.com (which has ARN
        # arn:aws:ses:us-east-1:123456789012:identity/example.com) attaches a policy to it that authorizes you
        # to use sender@example.com, then you would specify the FromEmailAddressIdentityArn to be
        # arn:aws:ses:us-east-1:123456789012:identity/example.com, and the FromEmailAddress to be
        # sender@example.com. For more information about sending authorization, see the Amazon SES Developer
        # Guide . For Raw emails, the FromEmailAddressIdentityArn value overrides the X-SES-SOURCE-ARN and
        # X-SES-FROM-ARN headers specified in raw email message content.

        @[JSON::Field(key: "FromEmailAddressIdentityArn")]
        getter from_email_address_identity_arn : String?

        # An object used to specify a list or topic to which an email belongs, which will be used when a
        # contact chooses to unsubscribe.

        @[JSON::Field(key: "ListManagementOptions")]
        getter list_management_options : Types::ListManagementOptions?

        # The "Reply-to" email addresses for the message. When the recipient replies to the message, each
        # Reply-to address receives the reply.

        @[JSON::Field(key: "ReplyToAddresses")]
        getter reply_to_addresses : Array(String)?

        # The name of the tenant through which this email will be sent. The email sending operation will only
        # succeed if all referenced resources (identities, configuration sets, and templates) are associated
        # with this tenant.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String?

        def initialize(
          @content : Types::EmailContent,
          @configuration_set_name : String? = nil,
          @destination : Types::Destination? = nil,
          @email_tags : Array(Types::MessageTag)? = nil,
          @endpoint_id : String? = nil,
          @feedback_forwarding_email_address : String? = nil,
          @feedback_forwarding_email_address_identity_arn : String? = nil,
          @from_email_address : String? = nil,
          @from_email_address_identity_arn : String? = nil,
          @list_management_options : Types::ListManagementOptions? = nil,
          @reply_to_addresses : Array(String)? = nil,
          @tenant_name : String? = nil
        )
        end
      end

      # A unique message ID that you receive when an email is accepted for sending.

      struct SendEmailResponse
        include JSON::Serializable

        # A unique identifier for the message that is generated when the message is accepted. It's possible
        # for Amazon SES to accept a message without sending it. For example, this can happen when the message
        # that you're trying to send has an attachment that contains a virus, or when you send a templated
        # email that contains invalid personalization content.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # An object that contains information about the per-day and per-second sending limits for your Amazon
      # SES account in the current Amazon Web Services Region.

      struct SendQuota
        include JSON::Serializable

        # The maximum number of emails that you can send in the current Amazon Web Services Region over a
        # 24-hour period. A value of -1 signifies an unlimited quota. (This value is also referred to as your
        # sending quota .)

        @[JSON::Field(key: "Max24HourSend")]
        getter max24_hour_send : Float64?

        # The maximum number of emails that you can send per second in the current Amazon Web Services Region.
        # This value is also called your maximum sending rate or your maximum TPS (transactions per second)
        # rate .

        @[JSON::Field(key: "MaxSendRate")]
        getter max_send_rate : Float64?

        # The number of emails sent from your Amazon SES account in the current Amazon Web Services Region
        # over the past 24 hours.

        @[JSON::Field(key: "SentLast24Hours")]
        getter sent_last24_hours : Float64?

        def initialize(
          @max24_hour_send : Float64? = nil,
          @max_send_rate : Float64? = nil,
          @sent_last24_hours : Float64? = nil
        )
        end
      end

      # Used to enable or disable email sending for messages that use this configuration set in the current
      # Amazon Web Services Region.

      struct SendingOptions
        include JSON::Serializable

        # If true , email sending is enabled for the configuration set. If false , email sending is disabled
        # for the configuration set.

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        def initialize(
          @sending_enabled : Bool? = nil
        )
        end
      end

      # The message can't be sent because the account's ability to send email is currently paused.

      struct SendingPausedException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send
      # notifications when certain email events occur.

      struct SnsDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to publish email events to. For more
        # information about Amazon SNS topics, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # An object that contains status information for a reputation entity, including the current status,
      # cause description, and timestamp.

      struct StatusRecord
        include JSON::Serializable

        # A description of the reason for the current status, or null if no specific cause is available.

        @[JSON::Field(key: "Cause")]
        getter cause : String?

        # The timestamp when this status was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Time?

        # The current sending status. This can be one of the following: ENABLED – Sending is allowed. DISABLED
        # – Sending is prevented. REINSTATED – Sending is allowed even with active reputation findings.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @cause : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # An object that contains information about an email address that is on the suppression list for your
      # account.

      struct SuppressedDestination
        include JSON::Serializable

        # The email address that is on the suppression list for your account.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # The date and time when the suppressed destination was last updated, shown in Unix time format.

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time

        # The reason that the address was added to the suppression list for your account.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # An optional value that can contain additional information about the reasons that the address was
        # added to the suppression list for your account.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Types::SuppressedDestinationAttributes?

        def initialize(
          @email_address : String,
          @last_update_time : Time,
          @reason : String,
          @attributes : Types::SuppressedDestinationAttributes? = nil
        )
        end
      end

      # An object that contains additional attributes that are related an email address that is on the
      # suppression list for your account.

      struct SuppressedDestinationAttributes
        include JSON::Serializable

        # A unique identifier that's generated when an email address is added to the suppression list for your
        # account.

        @[JSON::Field(key: "FeedbackId")]
        getter feedback_id : String?

        # The unique identifier of the email message that caused the email address to be added to the
        # suppression list for your account.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @feedback_id : String? = nil,
          @message_id : String? = nil
        )
        end
      end

      # A summary that describes the suppressed email address.

      struct SuppressedDestinationSummary
        include JSON::Serializable

        # The email address that's on the suppression list for your account.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # The date and time when the suppressed destination was last updated, shown in Unix time format.

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time

        # The reason that the address was added to the suppression list for your account.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @email_address : String,
          @last_update_time : Time,
          @reason : String
        )
        end
      end

      # An object that contains information about the email address suppression preferences for your account
      # in the current Amazon Web Services Region.

      struct SuppressionAttributes
        include JSON::Serializable

        # A list that contains the reasons that email addresses will be automatically added to the suppression
        # list for your account. This list can contain any or all of the following: COMPLAINT – Amazon SES
        # adds an email address to the suppression list for your account when a message sent to that address
        # results in a complaint. BOUNCE – Amazon SES adds an email address to the suppression list for your
        # account when a message sent to that address results in a hard bounce.

        @[JSON::Field(key: "SuppressedReasons")]
        getter suppressed_reasons : Array(String)?


        @[JSON::Field(key: "ValidationAttributes")]
        getter validation_attributes : Types::SuppressionValidationAttributes?

        def initialize(
          @suppressed_reasons : Array(String)? = nil,
          @validation_attributes : Types::SuppressionValidationAttributes? = nil
        )
        end
      end

      # Contains Auto Validation settings, allowing you to suppress sending to specific destination(s) if
      # they do not meet required threshold. For details on Auto Validation, see Auto Validation .

      struct SuppressionConditionThreshold
        include JSON::Serializable

        # Indicates whether Auto Validation is enabled for suppression. Set to ENABLED to enable the Auto
        # Validation feature, or set to DISABLED to disable it.

        @[JSON::Field(key: "ConditionThresholdEnabled")]
        getter condition_threshold_enabled : String

        # The overall confidence threshold used to determine suppression decisions.

        @[JSON::Field(key: "OverallConfidenceThreshold")]
        getter overall_confidence_threshold : Types::SuppressionConfidenceThreshold?

        def initialize(
          @condition_threshold_enabled : String,
          @overall_confidence_threshold : Types::SuppressionConfidenceThreshold? = nil
        )
        end
      end

      # Contains the confidence threshold settings for Auto Validation.

      struct SuppressionConfidenceThreshold
        include JSON::Serializable

        # The confidence level threshold for suppression decisions.

        @[JSON::Field(key: "ConfidenceVerdictThreshold")]
        getter confidence_verdict_threshold : String

        def initialize(
          @confidence_verdict_threshold : String
        )
        end
      end

      # An object that contains details about the action of suppression list.

      struct SuppressionListDestination
        include JSON::Serializable

        # The type of action to perform on the address. The following are possible values: PUT: add the
        # addresses to the suppression list. If the record already exists, it will override it with the new
        # value. DELETE: remove the addresses from the suppression list.

        @[JSON::Field(key: "SuppressionListImportAction")]
        getter suppression_list_import_action : String

        def initialize(
          @suppression_list_import_action : String
        )
        end
      end

      # An object that contains information about the suppression list preferences for your account.

      struct SuppressionOptions
        include JSON::Serializable

        # A list that contains the reasons that email addresses are automatically added to the suppression
        # list for your account. This list can contain any or all of the following: COMPLAINT – Amazon SES
        # adds an email address to the suppression list for your account when a message sent to that address
        # results in a complaint. BOUNCE – Amazon SES adds an email address to the suppression list for your
        # account when a message sent to that address results in a hard bounce.

        @[JSON::Field(key: "SuppressedReasons")]
        getter suppressed_reasons : Array(String)?


        @[JSON::Field(key: "ValidationOptions")]
        getter validation_options : Types::SuppressionValidationOptions?

        def initialize(
          @suppressed_reasons : Array(String)? = nil,
          @validation_options : Types::SuppressionValidationOptions? = nil
        )
        end
      end

      # Structure containing validation attributes used for suppressing sending to specific destination on
      # account level.

      struct SuppressionValidationAttributes
        include JSON::Serializable

        # Specifies the condition threshold settings for account-level suppression.

        @[JSON::Field(key: "ConditionThreshold")]
        getter condition_threshold : Types::SuppressionConditionThreshold

        def initialize(
          @condition_threshold : Types::SuppressionConditionThreshold
        )
        end
      end

      # Contains validation options for email address suppression.

      struct SuppressionValidationOptions
        include JSON::Serializable

        # Specifies the condition threshold settings for suppression validation.

        @[JSON::Field(key: "ConditionThreshold")]
        getter condition_threshold : Types::SuppressionConditionThreshold

        def initialize(
          @condition_threshold : Types::SuppressionConditionThreshold
        )
        end
      end

      # An object that defines the tags that are associated with a resource. A tag is a label that you
      # optionally define and associate with a resource. Tags can help you categorize and manage resources
      # in different ways, such as by purpose, owner, environment, or other criteria. A resource can have as
      # many as 50 tags. Each tag consists of a required tag key and an associated tag value , both of which
      # you define. A tag key is a general label that acts as a category for a more specific tag value. A
      # tag value acts as a descriptor within a tag key. A tag key can contain as many as 128 characters. A
      # tag value can contain as many as 256 characters. The characters can be Unicode letters, digits,
      # white space, or one of the following symbols: _ . : / = + -. The following additional restrictions
      # apply to tags: Tag keys and values are case sensitive. For each associated resource, each tag key
      # must be unique and it can have only one value. The aws: prefix is reserved for use by Amazon Web
      # Services; you can’t use it in any tag keys or values that you define. In addition, you can't edit or
      # remove tag keys or values that use this prefix. Tags that use this prefix don’t count against the
      # limit of 50 tags per resource. You can associate tags with public or shared resources, but the tags
      # are available only for your Amazon Web Services account, not any other accounts that share the
      # resource. In addition, the tags are available only for resources that are located in the specified
      # Amazon Web Services Region for your Amazon Web Services account.

      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that defines a tag. The maximum length of a tag key is 128 characters.
        # The minimum length is 1 character.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The optional part of a key-value pair that defines a tag. The maximum length of a tag value is 256
        # characters. The minimum length is 0 characters. If you don't want a resource to have a specific tag
        # value, don't specify a value for this parameter. If you don't specify a value, Amazon SES sets the
        # value to an empty string.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to add one or more tags to.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of the tags that you want to add to the resource. A tag consists of a required tag key ( Key
        # ) and an associated tag value ( Value ). The maximum length of a tag key is 128 characters. The
        # maximum length of a tag value is 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that defines the email template to use for an email message, and the values to use for any
      # message variables in that template. An email template is a type of message template that contains
      # content that you want to reuse in email messages that you send. You can specifiy the email template
      # by providing the name or ARN of an email template previously saved in your Amazon SES account or by
      # providing the full template content.

      struct Template
        include JSON::Serializable

        # The List of attachments to include in your email. All recipients will receive the same attachments.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::Attachment)?

        # The list of message headers that will be added to the email message.

        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::MessageHeader)?

        # The Amazon Resource Name (ARN) of the template.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # The content of the template. Amazon SES supports only simple substitions when you send email using
        # the SendEmail or SendBulkEmail operations and you provide the full template content in the request.

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : Types::EmailTemplateContent?

        # An object that defines the values to use for message variables in the template. This object is a set
        # of key-value pairs. Each key defines a message variable in the template. The corresponding value
        # defines the value to use for that variable.

        @[JSON::Field(key: "TemplateData")]
        getter template_data : String?

        # The name of the template. You will refer to this name when you send email using the SendEmail or
        # SendBulkEmail operations.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @attachments : Array(Types::Attachment)? = nil,
          @headers : Array(Types::MessageHeader)? = nil,
          @template_arn : String? = nil,
          @template_content : Types::EmailTemplateContent? = nil,
          @template_data : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      # A structure that contains details about a tenant.

      struct Tenant
        include JSON::Serializable

        # The date and time when the tenant was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The status of sending capability for the tenant.

        @[JSON::Field(key: "SendingStatus")]
        getter sending_status : String?

        # An array of objects that define the tags (keys and values) associated with the tenant.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Resource Name (ARN) of the tenant.

        @[JSON::Field(key: "TenantArn")]
        getter tenant_arn : String?

        # A unique identifier for the tenant.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String?

        # The name of the tenant.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @sending_status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tenant_arn : String? = nil,
          @tenant_id : String? = nil,
          @tenant_name : String? = nil
        )
        end
      end

      # A structure that contains basic information about a tenant.

      struct TenantInfo
        include JSON::Serializable

        # The date and time when the tenant was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The Amazon Resource Name (ARN) of the tenant.

        @[JSON::Field(key: "TenantArn")]
        getter tenant_arn : String?

        # A unique identifier for the tenant.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String?

        # The name of the tenant.

        @[JSON::Field(key: "TenantName")]
        getter tenant_name : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @tenant_arn : String? = nil,
          @tenant_id : String? = nil,
          @tenant_name : String? = nil
        )
        end
      end

      # A structure that contains information about a resource associated with a tenant.

      struct TenantResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource associated with the tenant.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The type of resource associated with the tenant. Valid values are EMAIL_IDENTITY , CONFIGURATION_SET
        # , or EMAIL_TEMPLATE .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # &gt;Represents a request to create a preview of the MIME content of an email when provided with a
      # template and a set of replacement data.

      struct TestRenderEmailTemplateRequest
        include JSON::Serializable

        # A list of replacement values to apply to the template. This parameter is a JSON object, typically
        # consisting of key-value pairs in which the keys correspond to replacement tags in the email
        # template.

        @[JSON::Field(key: "TemplateData")]
        getter template_data : String

        # The name of the template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_data : String,
          @template_name : String
        )
        end
      end

      # The following element is returned by the service.

      struct TestRenderEmailTemplateResponse
        include JSON::Serializable

        # The complete MIME message rendered by applying the data in the TemplateData parameter to the
        # template specified in the TemplateName parameter.

        @[JSON::Field(key: "RenderedTemplate")]
        getter rendered_template : String

        def initialize(
          @rendered_template : String
        )
        end
      end

      # Too many requests have been made to the operation.

      struct TooManyRequestsException
        include JSON::Serializable

        def initialize
        end
      end

      # An interest group, theme, or label within a list. Lists can have multiple topics.

      struct Topic
        include JSON::Serializable

        # The default subscription status to be applied to a contact if the contact has not noted their
        # preference for subscribing to a topic.

        @[JSON::Field(key: "DefaultSubscriptionStatus")]
        getter default_subscription_status : String

        # The name of the topic the contact will see.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The name of the topic.

        @[JSON::Field(key: "TopicName")]
        getter topic_name : String

        # A description of what the topic is about, which the contact will see.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @default_subscription_status : String,
          @display_name : String,
          @topic_name : String,
          @description : String? = nil
        )
        end
      end

      # Used for filtering by a specific topic preference.

      struct TopicFilter
        include JSON::Serializable

        # The name of a topic on which you wish to apply the filter.

        @[JSON::Field(key: "TopicName")]
        getter topic_name : String?

        # Notes that the default subscription status should be applied to a contact because the contact has
        # not noted their preference for subscribing to a topic.

        @[JSON::Field(key: "UseDefaultIfPreferenceUnavailable")]
        getter use_default_if_preference_unavailable : Bool?

        def initialize(
          @topic_name : String? = nil,
          @use_default_if_preference_unavailable : Bool? = nil
        )
        end
      end

      # The contact's preference for being opted-in to or opted-out of a topic.

      struct TopicPreference
        include JSON::Serializable

        # The contact's subscription status to a topic which is either OPT_IN or OPT_OUT .

        @[JSON::Field(key: "SubscriptionStatus")]
        getter subscription_status : String

        # The name of the topic.

        @[JSON::Field(key: "TopicName")]
        getter topic_name : String

        def initialize(
          @subscription_status : String,
          @topic_name : String
        )
        end
      end

      # An object that defines the tracking options for a configuration set. When you use the Amazon SES API
      # v2 to send an email, it contains an invisible image that's used to track when recipients open your
      # email. If your email contains links, those links are changed slightly in order to track when
      # recipients click them. These images and links include references to a domain operated by Amazon Web
      # Services. You can optionally configure the Amazon SES to use a domain that you operate for these
      # images and links.

      struct TrackingOptions
        include JSON::Serializable

        # The domain to use for tracking open and click events.

        @[JSON::Field(key: "CustomRedirectDomain")]
        getter custom_redirect_domain : String

        # The https policy to use for tracking open and click events.

        @[JSON::Field(key: "HttpsPolicy")]
        getter https_policy : String?

        def initialize(
          @custom_redirect_domain : String,
          @https_policy : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove one or more tags from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags (tag keys) that you want to remove from the resource. When you specify a tag key, the
        # action removes both that key and its associated tag value. To remove more than one tag from the
        # resource, append the TagKeys parameter and argument for each additional tag to remove, separated by
        # an ampersand. For example: /v2/email/tags?ResourceArn=ResourceArn&amp;TagKeys=Key1&amp;TagKeys=Key2

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to change the settings for an event destination for a configuration set.

      struct UpdateConfigurationSetEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set that contains the event destination to modify.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # An object that defines the event destination.

        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestinationDefinition

        # The name of the event destination.

        @[JSON::Field(key: "EventDestinationName")]
        getter event_destination_name : String

        def initialize(
          @configuration_set_name : String,
          @event_destination : Types::EventDestinationDefinition,
          @event_destination_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct UpdateConfigurationSetEventDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateContactListRequest
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # A description of what the contact list is about.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An interest group, theme, or label within a list. A contact list can have multiple topics.

        @[JSON::Field(key: "Topics")]
        getter topics : Array(Types::Topic)?

        def initialize(
          @contact_list_name : String,
          @description : String? = nil,
          @topics : Array(Types::Topic)? = nil
        )
        end
      end


      struct UpdateContactListResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateContactRequest
        include JSON::Serializable

        # The name of the contact list.

        @[JSON::Field(key: "ContactListName")]
        getter contact_list_name : String

        # The contact's email address.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        # The attribute data attached to a contact.

        @[JSON::Field(key: "AttributesData")]
        getter attributes_data : String?

        # The contact's preference for being opted-in to or opted-out of a topic.

        @[JSON::Field(key: "TopicPreferences")]
        getter topic_preferences : Array(Types::TopicPreference)?

        # A boolean value status noting if the contact is unsubscribed from all contact list topics.

        @[JSON::Field(key: "UnsubscribeAll")]
        getter unsubscribe_all : Bool?

        def initialize(
          @contact_list_name : String,
          @email_address : String,
          @attributes_data : String? = nil,
          @topic_preferences : Array(Types::TopicPreference)? = nil,
          @unsubscribe_all : Bool? = nil
        )
        end
      end


      struct UpdateContactResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to update an existing custom verification email template.

      struct UpdateCustomVerificationEmailTemplateRequest
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
        # verification email frequently asked questions in the Amazon SES Developer Guide .

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : String

        # The name of the custom verification email template that you want to update.

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

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct UpdateCustomVerificationEmailTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to update a sending authorization policy for an identity. Sending authorization
      # is an Amazon SES feature that enables you to authorize other senders to use your identities. For
      # information, see the Amazon SES Developer Guide .

      struct UpdateEmailIdentityPolicyRequest
        include JSON::Serializable

        # The email identity.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The text of the policy in JSON format. The policy cannot exceed 4 KB. For information about the
        # syntax of sending authorization policies, see the Amazon SES Developer Guide .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The name of the policy. The policy name cannot exceed 64 characters and can only include
        # alphanumeric characters, dashes, and underscores.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @email_identity : String,
          @policy : String,
          @policy_name : String
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct UpdateEmailIdentityPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to update an email template. For more information, see the Amazon SES Developer
      # Guide .

      struct UpdateEmailTemplateRequest
        include JSON::Serializable

        # The content of the email template, composed of a subject line, an HTML part, and a text-only part.

        @[JSON::Field(key: "TemplateContent")]
        getter template_content : Types::EmailTemplateContent

        # The name of the template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @template_content : Types::EmailTemplateContent,
          @template_name : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct UpdateEmailTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to update the customer-managed sending status for a reputation entity.

      struct UpdateReputationEntityCustomerManagedStatusRequest
        include JSON::Serializable

        # The unique identifier for the reputation entity. For resource-type entities, this is the Amazon
        # Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ReputationEntityReference")]
        getter reputation_entity_reference : String

        # The type of reputation entity. Currently, only RESOURCE type entities are supported.

        @[JSON::Field(key: "ReputationEntityType")]
        getter reputation_entity_type : String

        # The new customer-managed sending status for the reputation entity. This can be one of the following:
        # ENABLED – Allow sending for this entity. DISABLED – Prevent sending for this entity. REINSTATED –
        # Allow sending even if there are active reputation findings.

        @[JSON::Field(key: "SendingStatus")]
        getter sending_status : String

        def initialize(
          @reputation_entity_reference : String,
          @reputation_entity_type : String,
          @sending_status : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct UpdateReputationEntityCustomerManagedStatusResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a request to update the reputation management policy for a reputation entity.

      struct UpdateReputationEntityPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the reputation management policy to apply to this entity. This is
        # an Amazon Web Services Amazon SES-managed policy.

        @[JSON::Field(key: "ReputationEntityPolicy")]
        getter reputation_entity_policy : String

        # The unique identifier for the reputation entity. For resource-type entities, this is the Amazon
        # Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ReputationEntityReference")]
        getter reputation_entity_reference : String

        # The type of reputation entity. Currently, only RESOURCE type entities are supported.

        @[JSON::Field(key: "ReputationEntityType")]
        getter reputation_entity_type : String

        def initialize(
          @reputation_entity_policy : String,
          @reputation_entity_reference : String,
          @reputation_entity_type : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.

      struct UpdateReputationEntityPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The VDM attributes that apply to your Amazon SES account.

      struct VdmAttributes
        include JSON::Serializable

        # Specifies the status of your VDM configuration. Can be one of the following: ENABLED – Amazon SES
        # enables VDM for your account. DISABLED – Amazon SES disables VDM for your account.

        @[JSON::Field(key: "VdmEnabled")]
        getter vdm_enabled : String

        # Specifies additional settings for your VDM configuration as applicable to the Dashboard.

        @[JSON::Field(key: "DashboardAttributes")]
        getter dashboard_attributes : Types::DashboardAttributes?

        # Specifies additional settings for your VDM configuration as applicable to the Guardian.

        @[JSON::Field(key: "GuardianAttributes")]
        getter guardian_attributes : Types::GuardianAttributes?

        def initialize(
          @vdm_enabled : String,
          @dashboard_attributes : Types::DashboardAttributes? = nil,
          @guardian_attributes : Types::GuardianAttributes? = nil
        )
        end
      end

      # An object that defines the VDM settings that apply to emails that you send using the configuration
      # set.

      struct VdmOptions
        include JSON::Serializable

        # Specifies additional settings for your VDM configuration as applicable to the Dashboard.

        @[JSON::Field(key: "DashboardOptions")]
        getter dashboard_options : Types::DashboardOptions?

        # Specifies additional settings for your VDM configuration as applicable to the Guardian.

        @[JSON::Field(key: "GuardianOptions")]
        getter guardian_options : Types::GuardianOptions?

        def initialize(
          @dashboard_options : Types::DashboardOptions? = nil,
          @guardian_options : Types::GuardianOptions? = nil
        )
        end
      end

      # An object that contains additional information about the verification status for the identity.

      struct VerificationInfo
        include JSON::Serializable

        # Provides the reason for the failure describing why Amazon SES was not able to successfully verify
        # the identity. Below are the possible values: INVALID_VALUE – Amazon SES was able to find the record,
        # but the value contained within the record was invalid. Ensure you have published the correct values
        # for the record. TYPE_NOT_FOUND – The queried hostname exists but does not have the requested type of
        # DNS record. Ensure that you have published the correct type of DNS record. HOST_NOT_FOUND – The
        # queried hostname does not exist or was not reachable at the time of the request. Ensure that you
        # have published the required DNS record(s). SERVICE_ERROR – A temporary issue is preventing Amazon
        # SES from determining the verification status of the domain. DNS_SERVER_ERROR – The DNS server
        # encountered an issue and was unable to complete the request. REPLICATION_ACCESS_DENIED – The
        # verification failed because the user does not have the required permissions to replicate the DKIM
        # key from the primary region. Ensure you have the necessary permissions in both primary and replica
        # regions. REPLICATION_PRIMARY_NOT_FOUND – The verification failed because no corresponding identity
        # was found in the specified primary region. Ensure the identity exists in the primary region before
        # attempting replication. REPLICATION_PRIMARY_BYO_DKIM_NOT_SUPPORTED – The verification failed because
        # the identity in the primary region is configured with Bring Your Own DKIM (BYODKIM). DKIM key
        # replication is only supported for identities using Easy DKIM.
        # REPLICATION_REPLICA_AS_PRIMARY_NOT_SUPPORTED – The verification failed because the specified primary
        # identity is a replica of another identity, and multi-level replication is not supported; the primary
        # identity must be a non-replica identity. REPLICATION_PRIMARY_INVALID_REGION – The verification
        # failed due to an invalid primary region specified. Ensure you provide a valid Amazon Web Services
        # region where Amazon SES is available and different from the replica region.

        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        # The last time a verification attempt was made for this identity.

        @[JSON::Field(key: "LastCheckedTimestamp")]
        getter last_checked_timestamp : Time?

        # The last time a successful verification was made for this identity.

        @[JSON::Field(key: "LastSuccessTimestamp")]
        getter last_success_timestamp : Time?

        # An object that contains information about the start of authority (SOA) record associated with the
        # identity.

        @[JSON::Field(key: "SOARecord")]
        getter soa_record : Types::SOARecord?

        def initialize(
          @error_type : String? = nil,
          @last_checked_timestamp : Time? = nil,
          @last_success_timestamp : Time? = nil,
          @soa_record : Types::SOARecord? = nil
        )
        end
      end

      # An object that contains information about the amount of email that was delivered to recipients.

      struct VolumeStatistics
        include JSON::Serializable

        # The total number of emails that arrived in recipients' inboxes.

        @[JSON::Field(key: "InboxRawCount")]
        getter inbox_raw_count : Int64?

        # An estimate of the percentage of emails sent from the current domain that will arrive in recipients'
        # inboxes.

        @[JSON::Field(key: "ProjectedInbox")]
        getter projected_inbox : Int64?

        # An estimate of the percentage of emails sent from the current domain that will arrive in recipients'
        # spam or junk mail folders.

        @[JSON::Field(key: "ProjectedSpam")]
        getter projected_spam : Int64?

        # The total number of emails that arrived in recipients' spam or junk mail folders.

        @[JSON::Field(key: "SpamRawCount")]
        getter spam_raw_count : Int64?

        def initialize(
          @inbox_raw_count : Int64? = nil,
          @projected_inbox : Int64? = nil,
          @projected_spam : Int64? = nil,
          @spam_raw_count : Int64? = nil
        )
        end
      end
    end
  end
end
