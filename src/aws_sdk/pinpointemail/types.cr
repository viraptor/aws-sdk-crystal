require "json"
require "time"

module AwsSdk
  module PinpointEmail
    module Types

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

      # The input you provided is invalid.

      struct BadRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that contains information about a blacklisting event that impacts one of the dedicated IP
      # addresses that is associated with your account.

      struct BlacklistEntry
        include JSON::Serializable

        # Additional information about the blacklisting event, as provided by the blacklist maintainer.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time when the blacklisting event occurred, shown in Unix time format.

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

      # An object that defines the dimension configuration to use when you send Amazon Pinpoint email events
      # to Amazon CloudWatch.

      struct CloudWatchDimensionConfiguration
        include JSON::Serializable

        # The default value of the dimension that is published to Amazon CloudWatch if you don't provide the
        # value of the dimension when you send an email. This value has to meet the following criteria: It can
        # only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). It can contain
        # no more than 256 characters.

        @[JSON::Field(key: "DefaultDimensionValue")]
        getter default_dimension_value : String

        # The name of an Amazon CloudWatch dimension associated with an email sending metric. The name has to
        # meet the following criteria: It can only contain ASCII letters (a-z, A-Z), numbers (0-9),
        # underscores (_), or dashes (-). It can contain no more than 256 characters.

        @[JSON::Field(key: "DimensionName")]
        getter dimension_name : String

        # The location where Amazon Pinpoint finds the value of a dimension to publish to Amazon CloudWatch.
        # If you want Amazon Pinpoint to use the message tags that you specify using an X-SES-MESSAGE-TAGS
        # header or a parameter to the SendEmail/SendRawEmail API, choose messageTag . If you want Amazon
        # Pinpoint to use your own email headers, choose emailHeader . If you want Amazon Pinpoint to use link
        # tags, choose linkTags .

        @[JSON::Field(key: "DimensionValueSource")]
        getter dimension_value_source : String

        def initialize(
          @default_dimension_value : String,
          @dimension_name : String,
          @dimension_value_source : String
        )
        end
      end

      # The resource is being modified by another operation or thread.

      struct ConcurrentModificationException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that represents the content of the email, and optionally a character set specification.

      struct Content
        include JSON::Serializable

        # The content of the message itself.

        @[JSON::Field(key: "Data")]
        getter data : String

        # The character set for the content. Because of the constraints of the SMTP protocol, Amazon Pinpoint
        # uses 7-bit ASCII by default. If the text includes characters outside of the ASCII range, you have to
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

        # The name of the configuration set that you want to add an event destination to.

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

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # An object that defines the dedicated IP pool that is used to send emails that you send using the
        # configuration set.

        @[JSON::Field(key: "DeliveryOptions")]
        getter delivery_options : Types::DeliveryOptions?

        # An object that defines whether or not Amazon Pinpoint collects reputation metrics for the emails
        # that you send that use the configuration set.

        @[JSON::Field(key: "ReputationOptions")]
        getter reputation_options : Types::ReputationOptions?

        # An object that defines whether or not Amazon Pinpoint can send email that you send using the
        # configuration set.

        @[JSON::Field(key: "SendingOptions")]
        getter sending_options : Types::SendingOptions?

        # An array of objects that define the tags (keys and values) that you want to associate with the
        # configuration set.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # An object that defines the open and click tracking options for emails that you send using the
        # configuration set.

        @[JSON::Field(key: "TrackingOptions")]
        getter tracking_options : Types::TrackingOptions?

        def initialize(
          @configuration_set_name : String,
          @delivery_options : Types::DeliveryOptions? = nil,
          @reputation_options : Types::ReputationOptions? = nil,
          @sending_options : Types::SendingOptions? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tracking_options : Types::TrackingOptions? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct CreateConfigurationSetResponse
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

        # An object that defines the tags (keys and values) that you want to associate with the pool.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @pool_name : String,
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
      # that you plan to send to your customers. Amazon Pinpoint then sends that message to special email
      # addresses spread across several major email providers. After about 24 hours, the test is complete,
      # and you can use the GetDeliverabilityTestReport operation to view the results of the test.

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

      # A request to begin the verification process for an email identity (an email address or domain).

      struct CreateEmailIdentityRequest
        include JSON::Serializable

        # The email address or domain that you want to verify.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # An array of objects that define the tags (keys and values) that you want to associate with the email
        # identity.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @email_identity : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # If the email identity is a domain, this object contains tokens that you can use to create a set of
      # CNAME records. To sucessfully verify your domain, you have to add these records to the DNS
      # configuration for your domain. If the email identity is an email address, this object is empty.

      struct CreateEmailIdentityResponse
        include JSON::Serializable

        # An object that contains information about the DKIM attributes for the identity. This object includes
        # the tokens that you use to create the CNAME records that are required to complete the DKIM
        # verification process.

        @[JSON::Field(key: "DkimAttributes")]
        getter dkim_attributes : Types::DkimAttributes?

        # The email identity type.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # Specifies whether or not the identity is verified. In Amazon Pinpoint, you can only send email from
        # verified email addresses or domains. For more information about verifying identities, see the Amazon
        # Pinpoint User Guide .

        @[JSON::Field(key: "VerifiedForSendingStatus")]
        getter verified_for_sending_status : Bool?

        def initialize(
          @dkim_attributes : Types::DkimAttributes? = nil,
          @identity_type : String? = nil,
          @verified_for_sending_status : Bool? = nil
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

      # Contains information about a dedicated IP address that is associated with your Amazon Pinpoint
      # account.

      struct DedicatedIp
        include JSON::Serializable

        # An IP address that is reserved for use by your Amazon Pinpoint account.

        @[JSON::Field(key: "Ip")]
        getter ip : String

        # Indicates how complete the dedicated IP warm-up process is. When this value equals 1, the address
        # has completed the warm-up process and is ready for use.

        @[JSON::Field(key: "WarmupPercentage")]
        getter warmup_percentage : Int32

        # The warm-up status of a dedicated IP address. The status can have one of the following values:
        # IN_PROGRESS – The IP address isn't ready to use because the dedicated IP warm-up process is ongoing.
        # DONE – The dedicated IP warm-up process is complete, and the IP address is ready to use.

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

      # A request to delete an event destination from a configuration set.

      struct DeleteConfigurationSetEventDestinationRequest
        include JSON::Serializable

        # The name of the configuration set that contains the event destination that you want to delete.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The name of the event destination that you want to delete.

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

        # The name of the configuration set that you want to delete.

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

      # A request to delete an existing email identity. When you delete an identity, you lose the ability to
      # use Amazon Pinpoint to send email from that identity. You can restore your ability to send email by
      # completing the verification process for the identity again.

      struct DeleteEmailIdentityRequest
        include JSON::Serializable

        # The identity (that is, the email address or domain) that you want to delete from your Amazon
        # Pinpoint account.

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

      # An object that contains metadata related to a predictive inbox placement test.

      struct DeliverabilityTestReport
        include JSON::Serializable

        # The date and time when the predictive inbox placement test was created, in Unix time format.

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

        # The name of the dedicated IP pool that you want to associate with the configuration set.

        @[JSON::Field(key: "SendingPoolName")]
        getter sending_pool_name : String?

        # Specifies whether messages that use the configuration set are required to use Transport Layer
        # Security (TLS). If the value is Require , messages are only delivered if a TLS connection can be
        # established. If the value is Optional , messages can be delivered in plain text if a TLS connection
        # can't be established.

        @[JSON::Field(key: "TlsPolicy")]
        getter tls_policy : String?

        def initialize(
          @sending_pool_name : String? = nil,
          @tls_policy : String? = nil
        )
        end
      end

      # An object that describes the recipients for an email.

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

      # An object that contains information about the DKIM configuration for an email identity.

      struct DkimAttributes
        include JSON::Serializable

        # If the value is true , then the messages that Amazon Pinpoint sends from the identity are
        # DKIM-signed. If the value is false , then the messages that Amazon Pinpoint sends from the identity
        # aren't DKIM-signed.

        @[JSON::Field(key: "SigningEnabled")]
        getter signing_enabled : Bool?

        # Describes whether or not Amazon Pinpoint has successfully located the DKIM records in the DNS
        # records for the domain. The status can be one of the following: PENDING – Amazon Pinpoint hasn't yet
        # located the DKIM records in the DNS configuration for the domain, but will continue to attempt to
        # locate them. SUCCESS – Amazon Pinpoint located the DKIM records in the DNS configuration for the
        # domain and determined that they're correct. Amazon Pinpoint can now send DKIM-signed email from the
        # identity. FAILED – Amazon Pinpoint was unable to locate the DKIM records in the DNS settings for the
        # domain, and won't continue to search for them. TEMPORARY_FAILURE – A temporary issue occurred, which
        # prevented Amazon Pinpoint from determining the DKIM status for the domain. NOT_STARTED – Amazon
        # Pinpoint hasn't yet started searching for the DKIM records in the DKIM records for the domain.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A set of unique strings that you use to create a set of CNAME records that you add to the DNS
        # configuration for your domain. When Amazon Pinpoint detects these records in the DNS configuration
        # for your domain, the DKIM authentication process is complete. Amazon Pinpoint usually detects these
        # records within about 72 hours of adding them to the DNS configuration for your domain.

        @[JSON::Field(key: "Tokens")]
        getter tokens : Array(String)?

        def initialize(
          @signing_enabled : Bool? = nil,
          @status : String? = nil,
          @tokens : Array(String)? = nil
        )
        end
      end

      # An object that contains the deliverability data for a specific campaign. This data is available for
      # a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is
      # enabled for ( PutDeliverabilityDashboardOption operation).

      struct DomainDeliverabilityCampaign
        include JSON::Serializable

        # The unique identifier for the campaign. Amazon Pinpoint automatically generates and assigns this
        # identifier to a campaign. This value is not the same as the campaign identifier that Amazon Pinpoint
        # assigns to campaigns that you create and manage by using the Amazon Pinpoint API or the Amazon
        # Pinpoint console.

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

        # The first time, in Unix time format, when the email message was delivered to any recipient's inbox.
        # This value can help you determine how long it took for a campaign to deliver an email message.

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

        # The last time, in Unix time format, when the email message was delivered to any recipient's inbox.
        # This value can help you determine how long it took for a campaign to deliver an email message.

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

        # A verified domain that’s associated with your AWS account and currently has an active Deliverability
        # dashboard subscription.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # An object that contains information about the inbox placement data settings for the domain.

        @[JSON::Field(key: "InboxPlacementTrackingOption")]
        getter inbox_placement_tracking_option : Types::InboxPlacementTrackingOption?

        # The date, in Unix time format, when you enabled the Deliverability dashboard for the domain.

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

      # An object that defines the entire content of the email, including the message headers and the body
      # content. You can create a simple email message, in which you specify the subject and the text and
      # HTML versions of the message body. You can also create raw messages, in which you specify a complete
      # MIME-formatted message. Raw messages can include attachments and custom headers.

      struct EmailContent
        include JSON::Serializable

        # The raw email message. The message has to meet the following criteria: The message has to contain a
        # header and a body, separated by one blank line. All of the required header fields must be present in
        # the message. Each part of a multipart MIME message must be formatted properly. If you include
        # attachments, they must be in a file format that Amazon Pinpoint supports. The entire message must be
        # Base64 encoded. If any of the MIME parts in your message contain content that is outside of the
        # 7-bit ASCII character range, you should encode that content to ensure that recipients' email clients
        # render the message properly. The length of any single line of text in the message can't exceed 1,000
        # characters. This restriction is defined in RFC 5321 .

        @[JSON::Field(key: "Raw")]
        getter raw : Types::RawMessage?

        # The simple email message. The message consists of a subject and a message body.

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

      # In Amazon Pinpoint, events include message sends, deliveries, opens, clicks, bounces, and
      # complaints. Event destinations are places that you can send information about these events to. For
      # example, you can send event data to Amazon SNS to receive notifications when you receive bounces or
      # complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term
      # storage.

      struct EventDestination
        include JSON::Serializable

        # The types of events that Amazon Pinpoint sends to the specified event destinations.

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

        # An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use
        # Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon
        # Redshift.

        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An object that defines a Amazon Pinpoint destination for email events. You can use Amazon Pinpoint
        # events to create attributes in Amazon Pinpoint projects. You can use these attributes to create
        # segments for your campaigns.

        @[JSON::Field(key: "PinpointDestination")]
        getter pinpoint_destination : Types::PinpointDestination?

        # An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send
        # notification when certain email events occur.

        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @matching_event_types : Array(String),
          @name : String,
          @cloud_watch_destination : Types::CloudWatchDestination? = nil,
          @enabled : Bool? = nil,
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

        # An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use
        # Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon
        # Redshift.

        @[JSON::Field(key: "KinesisFirehoseDestination")]
        getter kinesis_firehose_destination : Types::KinesisFirehoseDestination?

        # An array that specifies which events Amazon Pinpoint should send to the destinations in this
        # EventDestinationDefinition .

        @[JSON::Field(key: "MatchingEventTypes")]
        getter matching_event_types : Array(String)?

        # An object that defines a Amazon Pinpoint destination for email events. You can use Amazon Pinpoint
        # events to create attributes in Amazon Pinpoint projects. You can use these attributes to create
        # segments for your campaigns.

        @[JSON::Field(key: "PinpointDestination")]
        getter pinpoint_destination : Types::PinpointDestination?

        # An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send
        # notification when certain email events occur.

        @[JSON::Field(key: "SnsDestination")]
        getter sns_destination : Types::SnsDestination?

        def initialize(
          @cloud_watch_destination : Types::CloudWatchDestination? = nil,
          @enabled : Bool? = nil,
          @kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
          @matching_event_types : Array(String)? = nil,
          @pinpoint_destination : Types::PinpointDestination? = nil,
          @sns_destination : Types::SnsDestination? = nil
        )
        end
      end

      # A request to obtain information about the email-sending capabilities of your Amazon Pinpoint
      # account.

      struct GetAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      # A list of details about the email-sending capabilities of your Amazon Pinpoint account in the
      # current AWS Region.

      struct GetAccountResponse
        include JSON::Serializable

        # Indicates whether or not the automatic warm-up feature is enabled for dedicated IP addresses that
        # are associated with your account.

        @[JSON::Field(key: "DedicatedIpAutoWarmupEnabled")]
        getter dedicated_ip_auto_warmup_enabled : Bool?

        # The reputation status of your Amazon Pinpoint account. The status can be one of the following:
        # HEALTHY – There are no reputation-related issues that currently impact your account. PROBATION –
        # We've identified some issues with your Amazon Pinpoint account. We're placing your account under
        # review while you work on correcting these issues. SHUTDOWN – Your account's ability to send email is
        # currently paused because of an issue with the email sent from your account. When you correct the
        # issue, you can contact us and request that your account's ability to send email is resumed.

        @[JSON::Field(key: "EnforcementStatus")]
        getter enforcement_status : String?

        # Indicates whether or not your account has production access in the current AWS Region. If the value
        # is false , then your account is in the sandbox . When your account is in the sandbox, you can only
        # send email to verified identities. Additionally, the maximum number of emails you can send in a
        # 24-hour period (your sending quota) is 200, and the maximum number of emails you can send per second
        # (your maximum sending rate) is 1. If the value is true , then your account has production access.
        # When your account has production access, you can send email to any address. The sending quota and
        # maximum sending rate for your account vary based on your specific use case.

        @[JSON::Field(key: "ProductionAccessEnabled")]
        getter production_access_enabled : Bool?

        # An object that contains information about the per-day and per-second sending limits for your Amazon
        # Pinpoint account in the current AWS Region.

        @[JSON::Field(key: "SendQuota")]
        getter send_quota : Types::SendQuota?

        # Indicates whether or not email sending is enabled for your Amazon Pinpoint account in the current
        # AWS Region.

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        def initialize(
          @dedicated_ip_auto_warmup_enabled : Bool? = nil,
          @enforcement_status : String? = nil,
          @production_access_enabled : Bool? = nil,
          @send_quota : Types::SendQuota? = nil,
          @sending_enabled : Bool? = nil
        )
        end
      end

      # A request to retrieve a list of the blacklists that your dedicated IP addresses appear on.

      struct GetBlacklistReportsRequest
        include JSON::Serializable

        # A list of IP addresses that you want to retrieve blacklist information about. You can only specify
        # the dedicated IP addresses that you use to send email using Amazon Pinpoint or Amazon SES.

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

        # The name of the configuration set that you want to obtain more information about.

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

        # The name of the configuration set.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # An object that defines the dedicated IP pool that is used to send emails that you send using the
        # configuration set.

        @[JSON::Field(key: "DeliveryOptions")]
        getter delivery_options : Types::DeliveryOptions?

        # An object that defines whether or not Amazon Pinpoint collects reputation metrics for the emails
        # that you send that use the configuration set.

        @[JSON::Field(key: "ReputationOptions")]
        getter reputation_options : Types::ReputationOptions?

        # An object that defines whether or not Amazon Pinpoint can send email that you send using the
        # configuration set.

        @[JSON::Field(key: "SendingOptions")]
        getter sending_options : Types::SendingOptions?

        # An array of objects that define the tags (keys and values) that are associated with the
        # configuration set.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # An object that defines the open and click tracking options for emails that you send using the
        # configuration set.

        @[JSON::Field(key: "TrackingOptions")]
        getter tracking_options : Types::TrackingOptions?

        def initialize(
          @configuration_set_name : String? = nil,
          @delivery_options : Types::DeliveryOptions? = nil,
          @reputation_options : Types::ReputationOptions? = nil,
          @sending_options : Types::SendingOptions? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tracking_options : Types::TrackingOptions? = nil
        )
        end
      end

      # A request to obtain more information about a dedicated IP address.

      struct GetDedicatedIpRequest
        include JSON::Serializable

        # The IP address that you want to obtain more information about. The value you specify has to be a
        # dedicated IP address that's assocaited with your Amazon Pinpoint account.

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

      # Information about the dedicated IP addresses that are associated with your Amazon Pinpoint account.

      struct GetDedicatedIpsResponse
        include JSON::Serializable

        # A list of dedicated IP addresses that are reserved for use by your Amazon Pinpoint account.

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

      # Retrieve information about the status of the Deliverability dashboard for your Amazon Pinpoint
      # account. When the Deliverability dashboard is enabled, you gain access to reputation,
      # deliverability, and other metrics for the domains that you use to send email using Amazon Pinpoint.
      # You also gain the ability to perform predictive inbox placement tests. When you use the
      # Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that
      # you accrue by using Amazon Pinpoint. For more information about the features and cost of a
      # Deliverability dashboard subscription, see Amazon Pinpoint Pricing .

      struct GetDeliverabilityDashboardOptionsRequest
        include JSON::Serializable

        def initialize
        end
      end

      # An object that shows the status of the Deliverability dashboard for your Amazon Pinpoint account.

      struct GetDeliverabilityDashboardOptionsResponse
        include JSON::Serializable

        # Specifies whether the Deliverability dashboard is enabled for your Amazon Pinpoint account. If this
        # value is true , the dashboard is enabled.

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

        # The date, in Unix time format, when your current subscription to the Deliverability dashboard is
        # scheduled to expire, if your subscription is scheduled to expire at the end of the current calendar
        # month. This value is null if you have an active subscription that isn’t due to expire at the end of
        # the month.

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

        # The unique identifier for the campaign. Amazon Pinpoint automatically generates and assigns this
        # identifier to a campaign. This value is not the same as the campaign identifier that Amazon Pinpoint
        # assigns to campaigns that you create and manage by using the Amazon Pinpoint API or the Amazon
        # Pinpoint console.

        @[JSON::Field(key: "CampaignId")]
        getter campaign_id : String

        def initialize(
          @campaign_id : String
        )
        end
      end

      # An object that contains all the deliverability data for a specific campaign. This data is available
      # for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard
      # is enabled for ( PutDeliverabilityDashboardOption operation).

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

      # A request to return details about an email identity.

      struct GetEmailIdentityRequest
        include JSON::Serializable

        # The email identity that you want to retrieve details for.

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

        # An object that contains information about the DKIM attributes for the identity. This object includes
        # the tokens that you use to create the CNAME records that are required to complete the DKIM
        # verification process.

        @[JSON::Field(key: "DkimAttributes")]
        getter dkim_attributes : Types::DkimAttributes?

        # The feedback forwarding configuration for the identity. If the value is true , Amazon Pinpoint sends
        # you email notifications when bounce or complaint events occur. Amazon Pinpoint sends this
        # notification to the address that you specified in the Return-Path header of the original email. When
        # you set this value to false , Amazon Pinpoint sends notifications through other mechanisms, such as
        # by notifying an Amazon SNS topic or another event destination. You're required to have a method of
        # tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or
        # complaint notifications, Amazon Pinpoint sends an email notification when these events occur (even
        # if this setting is disabled).

        @[JSON::Field(key: "FeedbackForwardingStatus")]
        getter feedback_forwarding_status : Bool?

        # The email identity type.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # An object that contains information about the Mail-From attributes for the email identity.

        @[JSON::Field(key: "MailFromAttributes")]
        getter mail_from_attributes : Types::MailFromAttributes?

        # An array of objects that define the tags (keys and values) that are associated with the email
        # identity.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies whether or not the identity is verified. In Amazon Pinpoint, you can only send email from
        # verified email addresses or domains. For more information about verifying identities, see the Amazon
        # Pinpoint User Guide .

        @[JSON::Field(key: "VerifiedForSendingStatus")]
        getter verified_for_sending_status : Bool?

        def initialize(
          @dkim_attributes : Types::DkimAttributes? = nil,
          @feedback_forwarding_status : Bool? = nil,
          @identity_type : String? = nil,
          @mail_from_attributes : Types::MailFromAttributes? = nil,
          @tags : Array(Types::Tag)? = nil,
          @verified_for_sending_status : Bool? = nil
        )
        end
      end

      # Information about an email identity.

      struct IdentityInfo
        include JSON::Serializable

        # The address or domain of the identity.

        @[JSON::Field(key: "IdentityName")]
        getter identity_name : String?

        # The email identity type. The identity type can be one of the following: EMAIL_ADDRESS – The identity
        # is an email address. DOMAIN – The identity is a domain. MANAGED_DOMAIN – The identity is a domain
        # that is managed by AWS.

        @[JSON::Field(key: "IdentityType")]
        getter identity_type : String?

        # Indicates whether or not you can send email from the identity. In Amazon Pinpoint, an identity is an
        # email address or domain that you send email from. Before you can send email from an identity, you
        # have to demostrate that you own the identity, and that you authorize Amazon Pinpoint to send email
        # from that identity.

        @[JSON::Field(key: "SendingEnabled")]
        getter sending_enabled : Bool?

        def initialize(
          @identity_name : String? = nil,
          @identity_type : String? = nil,
          @sending_enabled : Bool? = nil
        )
        end
      end

      # An object that contains information about the inbox placement data settings for a verified domain
      # that’s associated with your AWS account. This data is available only if you enabled the
      # Deliverability dashboard for the domain ( PutDeliverabilityDashboardOption operation).

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

        # The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose stream that Amazon Pinpoint sends
        # email events to.

        @[JSON::Field(key: "DeliveryStreamArn")]
        getter delivery_stream_arn : String

        # The Amazon Resource Name (ARN) of the IAM role that Amazon Pinpoint uses when sending email events
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

      # A request to obtain a list of configuration sets for your Amazon Pinpoint account in the current AWS
      # Region.

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

      # A list of configuration sets in your Amazon Pinpoint account in the current AWS Region.

      struct ListConfigurationSetsResponse
        include JSON::Serializable

        # An array that contains all of the configuration sets in your Amazon Pinpoint account in the current
        # AWS Region.

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

        # A list of all of the dedicated IP pools that are associated with your Amazon Pinpoint account.

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
      # dashboard ( PutDeliverabilityDashboardOption operation) for the domain.

      struct ListDomainDeliverabilityCampaignsRequest
        include JSON::Serializable

        # The last day, in Unix time format, that you want to obtain deliverability data for. This value has
        # to be less than or equal to 30 days after the value of the StartDate parameter.

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time

        # The first day, in Unix time format, that you want to obtain deliverability data for.

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
      # enabled the Deliverability dashboard ( PutDeliverabilityDashboardOption operation) for the domain.

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

      # A request to list all of the email identities associated with your Amazon Pinpoint account. This
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

      # A list of all of the identities that you've attempted to verify for use with Amazon Pinpoint,
      # regardless of whether or not those identities were successfully verified.

      struct ListEmailIdentitiesResponse
        include JSON::Serializable

        # An array that includes all of the identities associated with your Amazon Pinpoint account.

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

      # A list of attributes that are associated with a MAIL FROM domain.

      struct MailFromAttributes
        include JSON::Serializable

        # The action that Amazon Pinpoint to takes if it can't read the required MX record for a custom MAIL
        # FROM domain. When you set this value to UseDefaultValue , Amazon Pinpoint uses amazonses.com as the
        # MAIL FROM domain. When you set this value to RejectMessage , Amazon Pinpoint returns a
        # MailFromDomainNotVerified error, and doesn't attempt to deliver the email. These behaviors are taken
        # when the custom MAIL FROM domain configuration is in the Pending , Failed , and TemporaryFailure
        # states.

        @[JSON::Field(key: "BehaviorOnMxFailure")]
        getter behavior_on_mx_failure : String

        # The name of a domain that an email identity uses as a custom MAIL FROM domain.

        @[JSON::Field(key: "MailFromDomain")]
        getter mail_from_domain : String

        # The status of the MAIL FROM domain. This status can have the following values: PENDING – Amazon
        # Pinpoint hasn't started searching for the MX record yet. SUCCESS – Amazon Pinpoint detected the
        # required MX record for the MAIL FROM domain. FAILED – Amazon Pinpoint can't find the required MX
        # record, or the record no longer exists. TEMPORARY_FAILURE – A temporary issue occurred, which
        # prevented Amazon Pinpoint from determining the status of the MAIL FROM domain.

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

        def initialize(
          @body : Types::Body,
          @subject : Types::Content
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

      # An object that defines a Amazon Pinpoint destination for email events. You can use Amazon Pinpoint
      # events to create attributes in Amazon Pinpoint projects. You can use these attributes to create
      # segments for your campaigns.

      struct PinpointDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Pinpoint project that you want to send email events to.

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
        # with your Amazon Pinpoint account in the current AWS Region. Set to true to enable the automatic
        # warm-up feature, or set to false to disable it.

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

      # A request to change the ability of your account to send email.

      struct PutAccountSendingAttributesRequest
        include JSON::Serializable

        # Enables or disables your account's ability to send email. Set to true to enable email sending, or
        # set to false to disable email sending. If AWS paused your account's ability to send email, you can't
        # use this operation to resume your account's ability to send email.

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

      # A request to associate a configuration set with a dedicated IP pool.

      struct PutConfigurationSetDeliveryOptionsRequest
        include JSON::Serializable

        # The name of the configuration set that you want to associate with a dedicated IP pool.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The name of the dedicated IP pool that you want to associate with the configuration set.

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

        # The name of the configuration set that you want to enable or disable reputation metric tracking for.

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

      # A request to enable or disable the ability of Amazon Pinpoint to send emails that use a specific
      # configuration set.

      struct PutConfigurationSetSendingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set that you want to enable or disable email sending for.

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

      # A request to add a custom domain for tracking open and click events to a configuration set.

      struct PutConfigurationSetTrackingOptionsRequest
        include JSON::Serializable

        # The name of the configuration set that you want to add a custom tracking domain to.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # The domain that you want to use to track open and click events.

        @[JSON::Field(key: "CustomRedirectDomain")]
        getter custom_redirect_domain : String?

        def initialize(
          @configuration_set_name : String,
          @custom_redirect_domain : String? = nil
        )
        end
      end

      # An HTTP 200 response if the request succeeds, or an error message if the request fails.

      struct PutConfigurationSetTrackingOptionsResponse
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
        # dedicated IP address that's associated with your Amazon Pinpoint account.

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

      # Enable or disable the Deliverability dashboard for your Amazon Pinpoint account. When you enable the
      # Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the
      # domains that you use to send email using Amazon Pinpoint. You also gain the ability to perform
      # predictive inbox placement tests. When you use the Deliverability dashboard, you pay a monthly
      # subscription charge, in addition to any other fees that you accrue by using Amazon Pinpoint. For
      # more information about the features and cost of a Deliverability dashboard subscription, see Amazon
      # Pinpoint Pricing .

      struct PutDeliverabilityDashboardOptionRequest
        include JSON::Serializable

        # Specifies whether to enable the Deliverability dashboard for your Amazon Pinpoint account. To enable
        # the dashboard, set this value to true .

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

      # A response that indicates whether the Deliverability dashboard is enabled for your Amazon Pinpoint
      # account.

      struct PutDeliverabilityDashboardOptionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to enable or disable DKIM signing of email that you send from an email identity.

      struct PutEmailIdentityDkimAttributesRequest
        include JSON::Serializable

        # The email identity that you want to change the DKIM settings for.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # Sets the DKIM signing configuration for the identity. When you set this value true , then the
        # messages that Amazon Pinpoint sends from the identity are DKIM-signed. When you set this value to
        # false , then the messages that Amazon Pinpoint sends from the identity aren't DKIM-signed.

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

      # A request to set the attributes that control how bounce and complaint events are processed.

      struct PutEmailIdentityFeedbackAttributesRequest
        include JSON::Serializable

        # The email identity that you want to configure bounce and complaint feedback forwarding for.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # Sets the feedback forwarding configuration for the identity. If the value is true , Amazon Pinpoint
        # sends you email notifications when bounce or complaint events occur. Amazon Pinpoint sends this
        # notification to the address that you specified in the Return-Path header of the original email. When
        # you set this value to false , Amazon Pinpoint sends notifications through other mechanisms, such as
        # by notifying an Amazon SNS topic or another event destination. You're required to have a method of
        # tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or
        # complaint notifications, Amazon Pinpoint sends an email notification when these events occur (even
        # if this setting is disabled).

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

        # The verified email identity that you want to set up the custom MAIL FROM domain for.

        @[JSON::Field(key: "EmailIdentity")]
        getter email_identity : String

        # The action that you want Amazon Pinpoint to take if it can't read the required MX record when you
        # send an email. When you set this value to UseDefaultValue , Amazon Pinpoint uses amazonses.com as
        # the MAIL FROM domain. When you set this value to RejectMessage , Amazon Pinpoint returns a
        # MailFromDomainNotVerified error, and doesn't attempt to deliver the email. These behaviors are taken
        # when the custom MAIL FROM domain configuration is in the Pending , Failed , and TemporaryFailure
        # states.

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

      # The raw email message.

      struct RawMessage
        include JSON::Serializable

        # The raw email message. The message has to meet the following criteria: The message has to contain a
        # header and a body, separated by one blank line. All of the required header fields must be present in
        # the message. Each part of a multipart MIME message must be formatted properly. Attachments must be
        # in a file format that Amazon Pinpoint supports. The entire message must be Base64 encoded. If any of
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

      # Enable or disable collection of reputation metrics for emails that you send using this configuration
      # set in the current AWS Region.

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

      # A request to send an email message.

      struct SendEmailRequest
        include JSON::Serializable

        # An object that contains the body of the message. You can send either a Simple message or a Raw
        # message.

        @[JSON::Field(key: "Content")]
        getter content : Types::EmailContent

        # An object that contains the recipients of the email message.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # The name of the configuration set that you want to use when sending the email.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String?

        # A list of tags, in the form of name/value pairs, to apply to an email that you send using the
        # SendEmail operation. Tags correspond to characteristics of the email that you define, so that you
        # can publish email sending events.

        @[JSON::Field(key: "EmailTags")]
        getter email_tags : Array(Types::MessageTag)?

        # The address that Amazon Pinpoint should send bounce and complaint notifications to.

        @[JSON::Field(key: "FeedbackForwardingEmailAddress")]
        getter feedback_forwarding_email_address : String?

        # The email address that you want to use as the "From" address for the email. The address that you
        # specify has to be verified.

        @[JSON::Field(key: "FromEmailAddress")]
        getter from_email_address : String?

        # The "Reply-to" email addresses for the message. When the recipient replies to the message, each
        # Reply-to address receives the reply.

        @[JSON::Field(key: "ReplyToAddresses")]
        getter reply_to_addresses : Array(String)?

        def initialize(
          @content : Types::EmailContent,
          @destination : Types::Destination,
          @configuration_set_name : String? = nil,
          @email_tags : Array(Types::MessageTag)? = nil,
          @feedback_forwarding_email_address : String? = nil,
          @from_email_address : String? = nil,
          @reply_to_addresses : Array(String)? = nil
        )
        end
      end

      # A unique message ID that you receive when Amazon Pinpoint accepts an email for sending.

      struct SendEmailResponse
        include JSON::Serializable

        # A unique identifier for the message that is generated when Amazon Pinpoint accepts the message. It
        # is possible for Amazon Pinpoint to accept a message without sending it. This can happen when the
        # message you're trying to send has an attachment doesn't pass a virus check, or when you send a
        # templated email that contains invalid personalization content, for example.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # An object that contains information about the per-day and per-second sending limits for your Amazon
      # Pinpoint account in the current AWS Region.

      struct SendQuota
        include JSON::Serializable

        # The maximum number of emails that you can send in the current AWS Region over a 24-hour period. This
        # value is also called your sending quota .

        @[JSON::Field(key: "Max24HourSend")]
        getter max24_hour_send : Float64?

        # The maximum number of emails that you can send per second in the current AWS Region. This value is
        # also called your maximum sending rate or your maximum TPS (transactions per second) rate .

        @[JSON::Field(key: "MaxSendRate")]
        getter max_send_rate : Float64?

        # The number of emails sent from your Amazon Pinpoint account in the current AWS Region over the past
        # 24 hours.

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
      # AWS Region.

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
      # notification when certain email events occur.

      struct SnsDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to publish email events to. For
        # more information about Amazon SNS topics, see the Amazon SNS Developer Guide .

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # An object that defines the tags that are associated with a resource. A tag is a label that you
      # optionally define and associate with a resource in Amazon Pinpoint. Tags can help you categorize and
      # manage resources in different ways, such as by purpose, owner, environment, or other criteria. A
      # resource can have as many as 50 tags. Each tag consists of a required tag key and an associated tag
      # value , both of which you define. A tag key is a general label that acts as a category for a more
      # specific tag value. A tag value acts as a descriptor within a tag key. A tag key can contain as many
      # as 128 characters. A tag value can contain as many as 256 characters. The characters can be Unicode
      # letters, digits, white space, or one of the following symbols: _ . : / = + -. The following
      # additional restrictions apply to tags: Tag keys and values are case sensitive. For each associated
      # resource, each tag key must be unique and it can have only one value. The aws: prefix is reserved
      # for use by AWS; you can’t use it in any tag keys or values that you define. In addition, you can't
      # edit or remove tag keys or values that use this prefix. Tags that use this prefix don’t count
      # against the limit of 50 tags per resource. You can associate tags with public or shared resources,
      # but the tags are available only for your AWS account, not any other accounts that share the
      # resource. In addition, the tags are available only for resources that are located in the specified
      # AWS Region for your AWS account.

      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that defines a tag. The maximum length of a tag key is 128 characters.
        # The minimum length is 1 character.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The optional part of a key-value pair that defines a tag. The maximum length of a tag value is 256
        # characters. The minimum length is 0 characters. If you don’t want a resource to have a specific tag
        # value, don’t specify a value for this parameter. Amazon Pinpoint will set the value to an empty
        # string.

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


      struct Template
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the template.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # An object that defines the values to use for message variables in the template. This object is a set
        # of key-value pairs. Each key defines a message variable in the template. The corresponding value
        # defines the value to use for that variable.

        @[JSON::Field(key: "TemplateData")]
        getter template_data : String?

        def initialize(
          @template_arn : String? = nil,
          @template_data : String? = nil
        )
        end
      end

      # Too many requests have been made to the operation.

      struct TooManyRequestsException
        include JSON::Serializable

        def initialize
        end
      end

      # An object that defines the tracking options for a configuration set. When you use Amazon Pinpoint to
      # send an email, it contains an invisible image that's used to track when recipients open your email.
      # If your email contains links, those links are changed slightly in order to track when recipients
      # click them. These images and links include references to a domain operated by AWS. You can
      # optionally configure Amazon Pinpoint to use a domain that you operate for these images and links.

      struct TrackingOptions
        include JSON::Serializable

        # The domain that you want to use for tracking open and click events.

        @[JSON::Field(key: "CustomRedirectDomain")]
        getter custom_redirect_domain : String

        def initialize(
          @custom_redirect_domain : String
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
        # an ampersand. For example: /v1/email/tags?ResourceArn=ResourceArn&amp;TagKeys=Key1&amp;TagKeys=Key2

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

        # The name of the configuration set that contains the event destination that you want to modify.

        @[JSON::Field(key: "ConfigurationSetName")]
        getter configuration_set_name : String

        # An object that defines the event destination.

        @[JSON::Field(key: "EventDestination")]
        getter event_destination : Types::EventDestinationDefinition

        # The name of the event destination that you want to modify.

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
