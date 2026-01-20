require "json"
require "time"

module Aws
  module SNS
    module Types


      struct AddPermissionInput
        include JSON::Serializable

        # The Amazon Web Services account IDs of the users (principals) who will be given access to the
        # specified actions. The users must have Amazon Web Services account, but do not need to be signed up
        # for this service.

        @[JSON::Field(key: "AWSAccountId")]
        getter aws_account_id : Array(String)

        # The action you want to allow for the specified principal(s). Valid values: Any Amazon SNS action
        # name, for example Publish .

        @[JSON::Field(key: "ActionName")]
        getter action_name : Array(String)

        # A unique identifier for the new policy statement.

        @[JSON::Field(key: "Label")]
        getter label : String

        # The ARN of the topic whose access control policy you wish to modify.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @aws_account_id : Array(String),
          @action_name : Array(String),
          @label : String,
          @topic_arn : String
        )
        end
      end

      # Indicates that the user has been denied access to the requested resource.

      struct AuthorizationErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Two or more batch entries in the request have the same Id .

      struct BatchEntryIdsNotDistinctException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The length of all the batch messages put together is more than the limit.

      struct BatchRequestTooLongException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Gives a detailed description of failed messages in the batch.

      struct BatchResultErrorEntry
        include JSON::Serializable

        # An error code representing why the action failed on this entry.

        @[JSON::Field(key: "Code")]
        getter code : String

        # The Id of an entry in a batch request

        @[JSON::Field(key: "Id")]
        getter id : String

        # Specifies whether the error happened due to the caller of the batch API action.

        @[JSON::Field(key: "SenderFault")]
        getter sender_fault : Bool

        # A message explaining why the action failed on this entry.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String,
          @id : String,
          @sender_fault : Bool,
          @message : String? = nil
        )
        end
      end

      # The input for the CheckIfPhoneNumberIsOptedOut action.

      struct CheckIfPhoneNumberIsOptedOutInput
        include JSON::Serializable

        # The phone number for which you want to check the opt out status.

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String

        def initialize(
          @phone_number : String
        )
        end
      end

      # The response from the CheckIfPhoneNumberIsOptedOut action.

      struct CheckIfPhoneNumberIsOptedOutResponse
        include JSON::Serializable

        # Indicates whether the phone number is opted out: true – The phone number is opted out, meaning you
        # cannot publish SMS messages to it. false – The phone number is opted in, meaning you can publish SMS
        # messages to it.

        @[JSON::Field(key: "isOptedOut")]
        getter is_opted_out : Bool?

        def initialize(
          @is_opted_out : Bool? = nil
        )
        end
      end

      # Can't perform multiple operations on a tag simultaneously. Perform the operations sequentially.

      struct ConcurrentAccessException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input for ConfirmSubscription action.

      struct ConfirmSubscriptionInput
        include JSON::Serializable

        # Short-lived token sent to an endpoint during the Subscribe action.

        @[JSON::Field(key: "Token")]
        getter token : String

        # The ARN of the topic for which you wish to confirm a subscription.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        # Disallows unauthenticated unsubscribes of the subscription. If the value of this parameter is true
        # and the request has an Amazon Web Services signature, then only the topic owner and the subscription
        # owner can unsubscribe the endpoint. The unsubscribe action requires Amazon Web Services
        # authentication.

        @[JSON::Field(key: "AuthenticateOnUnsubscribe")]
        getter authenticate_on_unsubscribe : String?

        def initialize(
          @token : String,
          @topic_arn : String,
          @authenticate_on_unsubscribe : String? = nil
        )
        end
      end

      # Response for ConfirmSubscriptions action.

      struct ConfirmSubscriptionResponse
        include JSON::Serializable

        # The ARN of the created subscription.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String?

        def initialize(
          @subscription_arn : String? = nil
        )
        end
      end

      # Response from CreateEndpoint action.

      struct CreateEndpointResponse
        include JSON::Serializable

        # EndpointArn returned from CreateEndpoint action.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        def initialize(
          @endpoint_arn : String? = nil
        )
        end
      end

      # Input for CreatePlatformApplication action.

      struct CreatePlatformApplicationInput
        include JSON::Serializable

        # For a list of attributes, see SetPlatformApplicationAttributes .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)

        # Application names must be made up of only uppercase and lowercase ASCII letters, numbers,
        # underscores, hyphens, and periods, and must be between 1 and 256 characters long.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push Notification
        # Service), APNS_SANDBOX, and GCM (Firebase Cloud Messaging).

        @[JSON::Field(key: "Platform")]
        getter platform : String

        def initialize(
          @attributes : Hash(String, String),
          @name : String,
          @platform : String
        )
        end
      end

      # Response from CreatePlatformApplication action.

      struct CreatePlatformApplicationResponse
        include JSON::Serializable

        # PlatformApplicationArn is returned.

        @[JSON::Field(key: "PlatformApplicationArn")]
        getter platform_application_arn : String?

        def initialize(
          @platform_application_arn : String? = nil
        )
        end
      end

      # Input for CreatePlatformEndpoint action.

      struct CreatePlatformEndpointInput
        include JSON::Serializable

        # PlatformApplicationArn returned from CreatePlatformApplication is used to create a an endpoint.

        @[JSON::Field(key: "PlatformApplicationArn")]
        getter platform_application_arn : String

        # Unique identifier created by the notification service for an app on a device. The specific name for
        # Token will vary, depending on which notification service is being used. For example, when using APNS
        # as the notification service, you need the device token. Alternatively, when using GCM (Firebase
        # Cloud Messaging) or ADM, the device token equivalent is called the registration ID.

        @[JSON::Field(key: "Token")]
        getter token : String

        # For a list of attributes, see SetEndpointAttributes .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must
        # be in UTF-8 format and less than 2KB.

        @[JSON::Field(key: "CustomUserData")]
        getter custom_user_data : String?

        def initialize(
          @platform_application_arn : String,
          @token : String,
          @attributes : Hash(String, String)? = nil,
          @custom_user_data : String? = nil
        )
        end
      end


      struct CreateSMSSandboxPhoneNumberInput
        include JSON::Serializable

        # The destination phone number to verify. On verification, Amazon SNS adds this phone number to the
        # list of verified phone numbers that you can send SMS messages to.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String

        # The language to use for sending the OTP. The default value is en-US .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        def initialize(
          @phone_number : String,
          @language_code : String? = nil
        )
        end
      end


      struct CreateSMSSandboxPhoneNumberResult
        include JSON::Serializable

        def initialize
        end
      end

      # Input for CreateTopic action.

      struct CreateTopicInput
        include JSON::Serializable

        # The name of the topic you want to create. Constraints: Topic names must be made up of only uppercase
        # and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256
        # characters long. For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A map of attributes with their corresponding values. The following lists names, descriptions, and
        # values of the special request parameters that the CreateTopic action uses: DeliveryPolicy – The
        # policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints. DisplayName – The
        # display name to use for a topic with SMS subscriptions. Policy – The policy that defines who can
        # access your topic. By default, only the topic owner can publish or subscribe to the topic.
        # TracingConfig – Tracing mode of an Amazon SNS topic. By default TracingConfig is set to PassThrough
        # , and the topic passes through the tracing header it receives from an Amazon SNS publisher to its
        # subscriptions. If set to Active , Amazon SNS will vend X-Ray segment data to topic owner account if
        # the sampled flag in the tracing header is true. This is only supported on standard topics. HTTP
        # HTTPSuccessFeedbackRoleArn – Indicates successful message delivery status for an Amazon SNS topic
        # that is subscribed to an HTTP endpoint. HTTPSuccessFeedbackSampleRate – Indicates percentage of
        # successful messages to sample for an Amazon SNS topic that is subscribed to an HTTP endpoint.
        # HTTPFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic that
        # is subscribed to an HTTP endpoint. Amazon Data Firehose FirehoseSuccessFeedbackRoleArn – Indicates
        # successful message delivery status for an Amazon SNS topic that is subscribed to an Amazon Data
        # Firehose endpoint. FirehoseSuccessFeedbackSampleRate – Indicates percentage of successful messages
        # to sample for an Amazon SNS topic that is subscribed to an Amazon Data Firehose endpoint.
        # FirehoseFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic
        # that is subscribed to an Amazon Data Firehose endpoint. Lambda LambdaSuccessFeedbackRoleArn –
        # Indicates successful message delivery status for an Amazon SNS topic that is subscribed to an Lambda
        # endpoint. LambdaSuccessFeedbackSampleRate – Indicates percentage of successful messages to sample
        # for an Amazon SNS topic that is subscribed to an Lambda endpoint. LambdaFailureFeedbackRoleArn –
        # Indicates failed message delivery status for an Amazon SNS topic that is subscribed to an Lambda
        # endpoint. Platform application endpoint ApplicationSuccessFeedbackRoleArn – Indicates successful
        # message delivery status for an Amazon SNS topic that is subscribed to a platform application
        # endpoint. ApplicationSuccessFeedbackSampleRate – Indicates percentage of successful messages to
        # sample for an Amazon SNS topic that is subscribed to an platform application endpoint.
        # ApplicationFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic
        # that is subscribed to an platform application endpoint. In addition to being able to configure topic
        # attributes for message delivery status of notification messages sent to Amazon SNS application
        # endpoints, you can also configure application attributes for the delivery status of push
        # notification messages sent to push notification services. For example, For more information, see
        # Using Amazon SNS Application Attributes for Message Delivery Status . Amazon SQS
        # SQSSuccessFeedbackRoleArn – Indicates successful message delivery status for an Amazon SNS topic
        # that is subscribed to an Amazon SQS endpoint. SQSSuccessFeedbackSampleRate – Indicates percentage of
        # successful messages to sample for an Amazon SNS topic that is subscribed to an Amazon SQS endpoint.
        # SQSFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic that is
        # subscribed to an Amazon SQS endpoint. The &lt;ENDPOINT&gt;SuccessFeedbackRoleArn and
        # &lt;ENDPOINT&gt;FailureFeedbackRoleArn attributes are used to give Amazon SNS write access to use
        # CloudWatch Logs on your behalf. The &lt;ENDPOINT&gt;SuccessFeedbackSampleRate attribute is for
        # specifying the sample rate percentage (0-100) of successfully delivered messages. After you
        # configure the &lt;ENDPOINT&gt;FailureFeedbackRoleArn attribute, then all failed message deliveries
        # generate CloudWatch Logs. The following attribute applies only to server-side encryption :
        # KmsMasterKeyId – The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SNS
        # or a custom CMK. For more information, see Key Terms . For more examples, see KeyId in the Key
        # Management Service API Reference . The following attributes apply only to FIFO topics :
        # ArchivePolicy – The policy that sets the retention period for messages stored in the message archive
        # of an Amazon SNS FIFO topic. ContentBasedDeduplication – Enables content-based deduplication for
        # FIFO topics. By default, ContentBasedDeduplication is set to false . If you create a FIFO topic and
        # this attribute is false , you must specify a value for the MessageDeduplicationId parameter for the
        # Publish action. When you set ContentBasedDeduplication to true , Amazon SNS uses a SHA-256 hash to
        # generate the MessageDeduplicationId using the body of the message (but not the attributes of the
        # message). (Optional) To override the generated value, you can specify a value for the
        # MessageDeduplicationId parameter for the Publish action. FifoThroughputScope – Enables higher
        # throughput for your FIFO topic by adjusting the scope of deduplication. This attribute has two
        # possible values: Topic – The scope of message deduplication is across the entire topic. This is the
        # default value and maintains existing behavior, with a maximum throughput of 3000 messages per second
        # or 20MB per second, whichever comes first. MessageGroup – The scope of deduplication is within each
        # individual message group, which enables higher throughput per topic subject to regional quotas. For
        # more information on quotas or to request an increase, see Amazon SNS service quotas in the Amazon
        # Web Services General Reference.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The body of the policy document you want to use for this topic. You can only add one policy per
        # topic. The policy must be in JSON string format. Length Constraints: Maximum length of 30,720.

        @[JSON::Field(key: "DataProtectionPolicy")]
        getter data_protection_policy : String?

        # The list of tags to add to a new topic. To be able to tag a topic on creation, you must have the
        # sns:CreateTopic and sns:TagResource permissions.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @attributes : Hash(String, String)? = nil,
          @data_protection_policy : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Response from CreateTopic action.

      struct CreateTopicResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) assigned to the created topic.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @topic_arn : String? = nil
        )
        end
      end

      # Input for DeleteEndpoint action.

      struct DeleteEndpointInput
        include JSON::Serializable

        # EndpointArn of endpoint to delete.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end

      # Input for DeletePlatformApplication action.

      struct DeletePlatformApplicationInput
        include JSON::Serializable

        # PlatformApplicationArn of platform application object to delete.

        @[JSON::Field(key: "PlatformApplicationArn")]
        getter platform_application_arn : String

        def initialize(
          @platform_application_arn : String
        )
        end
      end


      struct DeleteSMSSandboxPhoneNumberInput
        include JSON::Serializable

        # The destination phone number to delete.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String

        def initialize(
          @phone_number : String
        )
        end
      end


      struct DeleteSMSSandboxPhoneNumberResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTopicInput
        include JSON::Serializable

        # The ARN of the topic you want to delete.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # The batch request doesn't contain any entries.

      struct EmptyBatchRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The endpoint for mobile app and device.

      struct Endpoint
        include JSON::Serializable

        # Attributes for endpoint.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The EndpointArn for mobile app and device.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @endpoint_arn : String? = nil
        )
        end
      end

      # Exception error indicating endpoint disabled.

      struct EndpointDisabledException
        include JSON::Serializable

        # Message for endpoint disabled.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the number of filter polices in your Amazon Web Services account exceeds the limit.
      # To add more filter polices, submit an Amazon SNS Limit Increase case in the Amazon Web
      # ServicesSupport Center.

      struct FilterPolicyLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetDataProtectionPolicyInput
        include JSON::Serializable

        # The ARN of the topic whose DataProtectionPolicy you want to get. For more information about ARNs,
        # see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetDataProtectionPolicyResponse
        include JSON::Serializable

        # Retrieves the DataProtectionPolicy in JSON string format.

        @[JSON::Field(key: "DataProtectionPolicy")]
        getter data_protection_policy : String?

        def initialize(
          @data_protection_policy : String? = nil
        )
        end
      end

      # Input for GetEndpointAttributes action.

      struct GetEndpointAttributesInput
        include JSON::Serializable

        # EndpointArn for GetEndpointAttributes input.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end

      # Response from GetEndpointAttributes of the EndpointArn .

      struct GetEndpointAttributesResponse
        include JSON::Serializable

        # Attributes include the following: CustomUserData – arbitrary user data to associate with the
        # endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less than 2KB.
        # Enabled – flag that enables/disables delivery to the endpoint. Amazon SNS will set this to false
        # when a notification service indicates to Amazon SNS that the endpoint is invalid. Users can set it
        # back to true, typically after updating Token. Token – device token, also referred to as a
        # registration id, for an app and mobile device. This is returned from the notification service when
        # an app and mobile device are registered with the notification service. The device token for the iOS
        # platform is returned in lowercase.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @attributes : Hash(String, String)? = nil
        )
        end
      end

      # Input for GetPlatformApplicationAttributes action.

      struct GetPlatformApplicationAttributesInput
        include JSON::Serializable

        # PlatformApplicationArn for GetPlatformApplicationAttributesInput.

        @[JSON::Field(key: "PlatformApplicationArn")]
        getter platform_application_arn : String

        def initialize(
          @platform_application_arn : String
        )
        end
      end

      # Response for GetPlatformApplicationAttributes action.

      struct GetPlatformApplicationAttributesResponse
        include JSON::Serializable

        # Attributes include the following: AppleCertificateExpiryDate – The expiry date of the SSL
        # certificate used to configure certificate-based authentication. ApplePlatformTeamID – The Apple
        # developer account ID used to configure token-based authentication. ApplePlatformBundleID – The app
        # identifier used to configure token-based authentication. AuthenticationMethod – Returns the
        # credential type used when sending push notifications from application to APNS/APNS_Sandbox, or
        # application to GCM. APNS – Returns the token or certificate. GCM – Returns the token or key.
        # EventEndpointCreated – Topic ARN to which EndpointCreated event notifications should be sent.
        # EventEndpointDeleted – Topic ARN to which EndpointDeleted event notifications should be sent.
        # EventEndpointUpdated – Topic ARN to which EndpointUpdate event notifications should be sent.
        # EventDeliveryFailure – Topic ARN to which DeliveryFailure event notifications should be sent upon
        # Direct Publish delivery failure (permanent) to one of the application's endpoints.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @attributes : Hash(String, String)? = nil
        )
        end
      end

      # The input for the GetSMSAttributes request.

      struct GetSMSAttributesInput
        include JSON::Serializable

        # A list of the individual attribute names, such as MonthlySpendLimit , for which you want values. For
        # all attribute names, see SetSMSAttributes . If you don't use this parameter, Amazon SNS returns all
        # SMS attributes.

        @[JSON::Field(key: "attributes")]
        getter attributes : Array(String)?

        def initialize(
          @attributes : Array(String)? = nil
        )
        end
      end

      # The response from the GetSMSAttributes request.

      struct GetSMSAttributesResponse
        include JSON::Serializable

        # The SMS attribute names and their values.

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @attributes : Hash(String, String)? = nil
        )
        end
      end


      struct GetSMSSandboxAccountStatusInput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetSMSSandboxAccountStatusResult
        include JSON::Serializable

        # Indicates whether the calling Amazon Web Services account is in the SMS sandbox.

        @[JSON::Field(key: "IsInSandbox")]
        getter is_in_sandbox : Bool

        def initialize(
          @is_in_sandbox : Bool
        )
        end
      end

      # Input for GetSubscriptionAttributes.

      struct GetSubscriptionAttributesInput
        include JSON::Serializable

        # The ARN of the subscription whose properties you want to get.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String

        def initialize(
          @subscription_arn : String
        )
        end
      end

      # Response for GetSubscriptionAttributes action.

      struct GetSubscriptionAttributesResponse
        include JSON::Serializable

        # A map of the subscription's attributes. Attributes in this map include the following:
        # ConfirmationWasAuthenticated – true if the subscription confirmation request was authenticated.
        # DeliveryPolicy – The JSON serialization of the subscription's delivery policy.
        # EffectiveDeliveryPolicy – The JSON serialization of the effective delivery policy that takes into
        # account the topic delivery policy and account system defaults. FilterPolicy – The filter policy JSON
        # that is assigned to the subscription. For more information, see Amazon SNS Message Filtering in the
        # Amazon SNS Developer Guide . FilterPolicyScope – This attribute lets you choose the filtering scope
        # by using one of the following string value types: MessageAttributes (default) – The filter is
        # applied on the message attributes. MessageBody – The filter is applied on the message body. Owner –
        # The Amazon Web Services account ID of the subscription's owner. PendingConfirmation – true if the
        # subscription hasn't been confirmed. To confirm a pending subscription, call the ConfirmSubscription
        # action with a confirmation token. RawMessageDelivery – true if raw message delivery is enabled for
        # the subscription. Raw messages are free of JSON formatting and can be sent to HTTP/S and Amazon SQS
        # endpoints. RedrivePolicy – When specified, sends undeliverable messages to the specified Amazon SQS
        # dead-letter queue. Messages that can't be delivered due to client errors (for example, when the
        # subscribed endpoint is unreachable) or server errors (for example, when the service that powers the
        # subscribed endpoint becomes unavailable) are held in the dead-letter queue for further analysis or
        # reprocessing. SubscriptionArn – The subscription's ARN. TopicArn – The topic ARN that the
        # subscription is associated with. The following attribute applies only to Amazon Data Firehose
        # delivery stream subscriptions: SubscriptionRoleArn – The ARN of the IAM role that has the following:
        # Permission to write to the Firehose delivery stream Amazon SNS listed as a trusted entity Specifying
        # a valid ARN for this attribute is required for Firehose delivery stream subscriptions. For more
        # information, see Fanout to Firehose delivery streams in the Amazon SNS Developer Guide .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @attributes : Hash(String, String)? = nil
        )
        end
      end

      # Input for GetTopicAttributes action.

      struct GetTopicAttributesInput
        include JSON::Serializable

        # The ARN of the topic whose properties you want to get.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @topic_arn : String
        )
        end
      end

      # Response for GetTopicAttributes action.

      struct GetTopicAttributesResponse
        include JSON::Serializable

        # A map of the topic's attributes. Attributes in this map include the following: DeliveryPolicy – The
        # JSON serialization of the topic's delivery policy. DisplayName – The human-readable name used in the
        # From field for notifications to email and email-json endpoints. EffectiveDeliveryPolicy – The JSON
        # serialization of the effective delivery policy, taking system defaults into account. Owner – The
        # Amazon Web Services account ID of the topic's owner. Policy – The JSON serialization of the topic's
        # access control policy. SignatureVersion – The signature version corresponds to the hashing algorithm
        # used while creating the signature of the notifications, subscription confirmations, or unsubscribe
        # confirmation messages sent by Amazon SNS. By default, SignatureVersion is set to 1 . The signature
        # is a Base64-encoded SHA1withRSA signature. When you set SignatureVersion to 2 . Amazon SNS uses a
        # Base64-encoded SHA256withRSA signature. If the API response does not include the SignatureVersion
        # attribute, it means that the SignatureVersion for the topic has value 1 . SubscriptionsConfirmed –
        # The number of confirmed subscriptions for the topic. SubscriptionsDeleted – The number of deleted
        # subscriptions for the topic. SubscriptionsPending – The number of subscriptions pending confirmation
        # for the topic. TopicArn – The topic's ARN. TracingConfig – Tracing mode of an Amazon SNS topic. By
        # default TracingConfig is set to PassThrough , and the topic passes through the tracing header it
        # receives from an Amazon SNS publisher to its subscriptions. If set to Active , Amazon SNS will vend
        # X-Ray segment data to topic owner account if the sampled flag in the tracing header is true. This is
        # only supported on standard topics. The following attribute applies only to server-side-encryption :
        # KmsMasterKeyId - The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SNS
        # or a custom CMK. For more information, see Key Terms . For more examples, see KeyId in the Key
        # Management Service API Reference . The following attributes apply only to FIFO topics :
        # ArchivePolicy – The policy that sets the retention period for messages stored in the message archive
        # of an Amazon SNS FIFO topic. BeginningArchiveTime – The earliest starting point at which a message
        # in the topic’s archive can be replayed from. This point in time is based on the configured message
        # retention period set by the topic’s message archiving policy. ContentBasedDeduplication – Enables
        # content-based deduplication for FIFO topics. By default, ContentBasedDeduplication is set to false .
        # If you create a FIFO topic and this attribute is false , you must specify a value for the
        # MessageDeduplicationId parameter for the Publish action. When you set ContentBasedDeduplication to
        # true , Amazon SNS uses a SHA-256 hash to generate the MessageDeduplicationId using the body of the
        # message (but not the attributes of the message). (Optional) To override the generated value, you can
        # specify a value for the MessageDeduplicationId parameter for the Publish action. FifoTopic – When
        # this is set to true , a FIFO topic is created.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @attributes : Hash(String, String)? = nil
        )
        end
      end

      # Indicates an internal service error.

      struct InternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Id of a batch entry in a batch request doesn't abide by the specification.

      struct InvalidBatchEntryIdException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that a request parameter does not comply with the associated constraints.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that a request parameter does not comply with the associated constraints.

      struct InvalidParameterValueException
        include JSON::Serializable

        # The parameter of an entry in a request doesn't abide by the specification.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The credential signature isn't valid. You must use an HTTPS endpoint and sign your request using
      # Signature Version 4.

      struct InvalidSecurityException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the specified state is not a valid state for an event source.

      struct InvalidStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The ciphertext references a key that doesn't exist or that you don't have access to.

      struct KMSAccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the specified Amazon Web Services KMS key isn't enabled.

      struct KMSDisabledException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the state of the specified resource isn't valid for this request.
      # For more information, see Key states of Amazon Web Services KMS keys in the Key Management Service
      # Developer Guide .

      struct KMSInvalidStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the specified entity or resource can't be found.

      struct KMSNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Amazon Web Services access key ID needs a subscription for the service.

      struct KMSOptInRequired
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was denied due to request throttling. For more information about throttling, see Limits
      # in the Key Management Service Developer Guide.

      struct KMSThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input for ListEndpointsByPlatformApplication action.

      struct ListEndpointsByPlatformApplicationInput
        include JSON::Serializable

        # PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action.

        @[JSON::Field(key: "PlatformApplicationArn")]
        getter platform_application_arn : String

        # NextToken string is used when calling ListEndpointsByPlatformApplication action to retrieve
        # additional records that are available after the first page results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @platform_application_arn : String,
          @next_token : String? = nil
        )
        end
      end

      # Response for ListEndpointsByPlatformApplication action.

      struct ListEndpointsByPlatformApplicationResponse
        include JSON::Serializable

        # Endpoints returned for ListEndpointsByPlatformApplication action.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # NextToken string is returned when calling ListEndpointsByPlatformApplication action if additional
        # records are available after the first page results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @endpoints : Array(Types::Endpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOriginationNumbersRequest
        include JSON::Serializable

        # The maximum number of origination numbers to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token that the previous ListOriginationNumbers request returns.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOriginationNumbersResult
        include JSON::Serializable

        # A NextToken string is returned when you call the ListOriginationNumbers operation if additional
        # pages of records are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the calling account's verified and pending origination numbers.

        @[JSON::Field(key: "PhoneNumbers")]
        getter phone_numbers : Array(Types::PhoneNumberInformation)?

        def initialize(
          @next_token : String? = nil,
          @phone_numbers : Array(Types::PhoneNumberInformation)? = nil
        )
        end
      end

      # The input for the ListPhoneNumbersOptedOut action.

      struct ListPhoneNumbersOptedOutInput
        include JSON::Serializable

        # A NextToken string is used when you call the ListPhoneNumbersOptedOut action to retrieve additional
        # records that are available after the first page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # The response from the ListPhoneNumbersOptedOut action.

      struct ListPhoneNumbersOptedOutResponse
        include JSON::Serializable

        # A NextToken string is returned when you call the ListPhoneNumbersOptedOut action if additional
        # records are available after the first page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of phone numbers that are opted out of receiving SMS messages. The list is paginated, and
        # each page can contain up to 100 phone numbers.

        @[JSON::Field(key: "phoneNumbers")]
        getter phone_numbers : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @phone_numbers : Array(String)? = nil
        )
        end
      end

      # Input for ListPlatformApplications action.

      struct ListPlatformApplicationsInput
        include JSON::Serializable

        # NextToken string is used when calling ListPlatformApplications action to retrieve additional records
        # that are available after the first page results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Response for ListPlatformApplications action.

      struct ListPlatformApplicationsResponse
        include JSON::Serializable

        # NextToken string is returned when calling ListPlatformApplications action if additional records are
        # available after the first page results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Platform applications returned when calling ListPlatformApplications action.

        @[JSON::Field(key: "PlatformApplications")]
        getter platform_applications : Array(Types::PlatformApplication)?

        def initialize(
          @next_token : String? = nil,
          @platform_applications : Array(Types::PlatformApplication)? = nil
        )
        end
      end


      struct ListSMSSandboxPhoneNumbersInput
        include JSON::Serializable

        # The maximum number of phone numbers to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Token that the previous ListSMSSandboxPhoneNumbersInput request returns.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSMSSandboxPhoneNumbersResult
        include JSON::Serializable

        # A list of the calling account's pending and verified phone numbers.

        @[JSON::Field(key: "PhoneNumbers")]
        getter phone_numbers : Array(Types::SMSSandboxPhoneNumber)

        # A NextToken string is returned when you call the ListSMSSandboxPhoneNumbersInput operation if
        # additional pages of records are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @phone_numbers : Array(Types::SMSSandboxPhoneNumber),
          @next_token : String? = nil
        )
        end
      end

      # Input for ListSubscriptionsByTopic action.

      struct ListSubscriptionsByTopicInput
        include JSON::Serializable

        # The ARN of the topic for which you wish to find subscriptions.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        # Token returned by the previous ListSubscriptionsByTopic request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @topic_arn : String,
          @next_token : String? = nil
        )
        end
      end

      # Response for ListSubscriptionsByTopic action.

      struct ListSubscriptionsByTopicResponse
        include JSON::Serializable

        # Token to pass along to the next ListSubscriptionsByTopic request. This element is returned if there
        # are more subscriptions to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of subscriptions.

        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @next_token : String? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end

      # Input for ListSubscriptions action.

      struct ListSubscriptionsInput
        include JSON::Serializable

        # Token returned by the previous ListSubscriptions request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Response for ListSubscriptions action

      struct ListSubscriptionsResponse
        include JSON::Serializable

        # Token to pass along to the next ListSubscriptions request. This element is returned if there are
        # more subscriptions to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of subscriptions.

        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @next_token : String? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the topic for which to list tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the specified topic.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTopicsInput
        include JSON::Serializable

        # Token returned by the previous ListTopics request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Response for ListTopics action.

      struct ListTopicsResponse
        include JSON::Serializable

        # Token to pass along to the next ListTopics request. This element is returned if there are additional
        # topics to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of topic ARNs.

        @[JSON::Field(key: "Topics")]
        getter topics : Array(Types::Topic)?

        def initialize(
          @next_token : String? = nil,
          @topics : Array(Types::Topic)? = nil
        )
        end
      end

      # The user-specified message attribute value. For string data types, the value attribute has the same
      # restrictions on the content as the message body. For more information, see Publish . Name, type, and
      # value must not be empty or null. In addition, the message body should not be empty or null. All
      # parts of the message attribute, including name, type, and value, are included in the message size
      # restriction, which is currently 256 KB (262,144 bytes). For more information, see Amazon SNS message
      # attributes and Publishing to a mobile phone in the Amazon SNS Developer Guide.

      struct MessageAttributeValue
        include JSON::Serializable

        # Amazon SNS supports the following logical data types: String, String.Array, Number, and Binary. For
        # more information, see Message Attribute Data Types .

        @[JSON::Field(key: "DataType")]
        getter data_type : String

        # Binary type attributes can store any binary data, for example, compressed data, encrypted data, or
        # images.

        @[JSON::Field(key: "BinaryValue")]
        getter binary_value : Bytes?

        # Strings are Unicode with UTF8 binary encoding. For a list of code values, see ASCII Printable
        # Characters .

        @[JSON::Field(key: "StringValue")]
        getter string_value : String?

        def initialize(
          @data_type : String,
          @binary_value : Bytes? = nil,
          @string_value : String? = nil
        )
        end
      end

      # Indicates that the requested resource does not exist.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input for the OptInPhoneNumber action.

      struct OptInPhoneNumberInput
        include JSON::Serializable

        # The phone number to opt in. Use E.164 format.

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String

        def initialize(
          @phone_number : String
        )
        end
      end

      # The response for the OptInPhoneNumber action.

      struct OptInPhoneNumberResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that the specified phone number opted out of receiving SMS messages from your Amazon Web
      # Services account. You can't send SMS messages to phone numbers that opt out.

      struct OptedOutException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of phone numbers and their metadata.

      struct PhoneNumberInformation
        include JSON::Serializable

        # The date and time when the phone number was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The two-character code for the country or region, in ISO 3166-1 alpha-2 format.

        @[JSON::Field(key: "Iso2CountryCode")]
        getter iso2_country_code : String?

        # The capabilities of each phone number.

        @[JSON::Field(key: "NumberCapabilities")]
        getter number_capabilities : Array(String)?

        # The phone number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The list of supported routes.

        @[JSON::Field(key: "RouteType")]
        getter route_type : String?

        # The status of the phone number.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @iso2_country_code : String? = nil,
          @number_capabilities : Array(String)? = nil,
          @phone_number : String? = nil,
          @route_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Platform application object.

      struct PlatformApplication
        include JSON::Serializable

        # Attributes for platform application object.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # PlatformApplicationArn for platform application object.

        @[JSON::Field(key: "PlatformApplicationArn")]
        getter platform_application_arn : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @platform_application_arn : String? = nil
        )
        end
      end

      # Exception error indicating platform application disabled.

      struct PlatformApplicationDisabledException
        include JSON::Serializable

        # Message for platform application disabled.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PublishBatchInput
        include JSON::Serializable

        # A list of PublishBatch request entries to be sent to the SNS topic.

        @[JSON::Field(key: "PublishBatchRequestEntries")]
        getter publish_batch_request_entries : Array(Types::PublishBatchRequestEntry)

        # The Amazon resource name (ARN) of the topic you want to batch publish to.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @publish_batch_request_entries : Array(Types::PublishBatchRequestEntry),
          @topic_arn : String
        )
        end
      end

      # Contains the details of a single Amazon SNS message along with an Id that identifies a message
      # within the batch.

      struct PublishBatchRequestEntry
        include JSON::Serializable

        # An identifier for the message in this batch. The Ids of a batch request must be unique within a
        # request. This identifier can have up to 80 characters. The following characters are accepted:
        # alphanumeric characters, hyphens(-), and underscores (_).

        @[JSON::Field(key: "Id")]
        getter id : String

        # The body of the message.

        @[JSON::Field(key: "Message")]
        getter message : String

        # Each message attribute consists of a Name , Type , and Value . For more information, see Amazon SNS
        # message attributes in the Amazon SNS Developer Guide.

        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # This parameter applies only to FIFO (first-in-first-out) topics. This parameter applies only to FIFO
        # (first-in-first-out) topics. The MessageDeduplicationId can contain up to 128 alphanumeric
        # characters (a-z, A-Z, 0-9) and punctuation (!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~) . Every
        # message must have a unique MessageDeduplicationId , which is a token used for deduplication of sent
        # messages within the 5 minute minimum deduplication interval. The scope of deduplication depends on
        # the FifoThroughputScope attribute, when set to Topic the message deduplication scope is across the
        # entire topic, when set to MessageGroup the message deduplication scope is within each individual
        # message group. If a message with a particular MessageDeduplicationId is sent successfully,
        # subsequent messages within the deduplication scope and interval, with the same
        # MessageDeduplicationId , are accepted successfully but aren't delivered. Every message must have a
        # unique MessageDeduplicationId . You may provide a MessageDeduplicationId explicitly. If you aren't
        # able to provide a MessageDeduplicationId and you enable ContentBasedDeduplication for your topic,
        # Amazon SNS uses a SHA-256 hash to generate the MessageDeduplicationId using the body of the message
        # (but not the attributes of the message). If you don't provide a MessageDeduplicationId and the topic
        # doesn't have ContentBasedDeduplication set, the action fails with an error. If the topic has a
        # ContentBasedDeduplication set, your MessageDeduplicationId overrides the generated one. When
        # ContentBasedDeduplication is in effect, messages with identical content sent within the
        # deduplication scope and interval are treated as duplicates and only one copy of the message is
        # delivered. If you send one message with ContentBasedDeduplication enabled, and then another message
        # with a MessageDeduplicationId that is the same as the one generated for the first
        # MessageDeduplicationId , the two messages are treated as duplicates, within the deduplication scope
        # and interval, and only one copy of the message is delivered. The MessageDeduplicationId is available
        # to the consumer of the message (this can be useful for troubleshooting delivery issues). If a
        # message is sent successfully but the acknowledgement is lost and the message is resent with the same
        # MessageDeduplicationId after the deduplication interval, Amazon SNS can't detect duplicate messages.
        # Amazon SNS continues to keep track of the message deduplication ID even after the message is
        # received and deleted.

        @[JSON::Field(key: "MessageDeduplicationId")]
        getter message_deduplication_id : String?

        # FIFO topics: The tag that specifies that a message belongs to a specific message group. Messages
        # that belong to the same message group are processed in a FIFO manner (however, messages in different
        # message groups might be processed out of order). To interleave multiple ordered streams within a
        # single topic, use MessageGroupId values (for example, session data for multiple users). In this
        # scenario, multiple consumers can process the topic, but the session data of each user is processed
        # in a FIFO fashion. You must associate a non-empty MessageGroupId with a message. If you do not
        # provide a MessageGroupId , the action fails. Standard topics: The MessageGroupId is optional and is
        # forwarded only to Amazon SQS standard subscriptions to activate fair queues . The MessageGroupId is
        # not used for, or sent to, any other endpoint types. The length of MessageGroupId is 128 characters.
        # MessageGroupId can contain alphanumeric characters (a-z, A-Z, 0-9) and punctuation
        # (!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~) .

        @[JSON::Field(key: "MessageGroupId")]
        getter message_group_id : String?

        # Set MessageStructure to json if you want to send a different message for each protocol. For example,
        # using one publish action, you can send a short message to your SMS subscribers and a longer message
        # to your email subscribers. If you set MessageStructure to json , the value of the Message parameter
        # must: be a syntactically valid JSON object; and contain at least a top-level JSON key of "default"
        # with a value that is a string. You can define other top-level keys that define the message you want
        # to send to a specific transport protocol (for example, http).

        @[JSON::Field(key: "MessageStructure")]
        getter message_structure : String?

        # The subject of the batch message.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        def initialize(
          @id : String,
          @message : String,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @message_deduplication_id : String? = nil,
          @message_group_id : String? = nil,
          @message_structure : String? = nil,
          @subject : String? = nil
        )
        end
      end


      struct PublishBatchResponse
        include JSON::Serializable

        # A list of failed PublishBatch responses.

        @[JSON::Field(key: "Failed")]
        getter failed : Array(Types::BatchResultErrorEntry)?

        # A list of successful PublishBatch responses.

        @[JSON::Field(key: "Successful")]
        getter successful : Array(Types::PublishBatchResultEntry)?

        def initialize(
          @failed : Array(Types::BatchResultErrorEntry)? = nil,
          @successful : Array(Types::PublishBatchResultEntry)? = nil
        )
        end
      end

      # Encloses data related to a successful message in a batch request for topic.

      struct PublishBatchResultEntry
        include JSON::Serializable

        # The Id of an entry in a batch request.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # An identifier for the message.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # This parameter applies only to FIFO (first-in-first-out) topics. The large, non-consecutive number
        # that Amazon SNS assigns to each message. The length of SequenceNumber is 128 bits. SequenceNumber
        # continues to increase for a particular MessageGroupId .

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @id : String? = nil,
          @message_id : String? = nil,
          @sequence_number : String? = nil
        )
        end
      end

      # Input for Publish action.

      struct PublishInput
        include JSON::Serializable

        # The message you want to send. If you are publishing to a topic and you want to send the same message
        # to all transport protocols, include the text of the message as a String value. If you want to send
        # different messages for each transport protocol, set the value of the MessageStructure parameter to
        # json and use a JSON object for the Message parameter. Constraints: With the exception of SMS,
        # messages must be UTF-8 encoded strings and at most 256 KB in size (262,144 bytes, not 262,144
        # characters). For SMS, each message can contain up to 140 characters. This character limit depends on
        # the encoding schema. For example, an SMS message can contain 160 GSM characters, 140 ASCII
        # characters, or 70 UCS-2 characters. If you publish a message that exceeds this size limit, Amazon
        # SNS sends the message as multiple messages, each fitting within the size limit. Messages aren't
        # truncated mid-word but are cut off at whole-word boundaries. The total size limit for a single SMS
        # Publish action is 1,600 characters. JSON-specific constraints: Keys in the JSON object that
        # correspond to supported transport protocols must have simple JSON string values. The values will be
        # parsed (unescaped) before they are used in outgoing messages. Outbound notifications are JSON
        # encoded (meaning that the characters will be reescaped for sending). Values have a minimum length of
        # 0 (the empty string, "", is allowed). Values have a maximum length bounded by the overall message
        # size (so, including multiple protocols may limit message sizes). Non-string values will cause the
        # key to be ignored. Keys that do not correspond to supported transport protocols are ignored.
        # Duplicate keys are not allowed. Failure to parse or validate any key or value in the message will
        # cause the Publish call to return an error (no partial delivery).

        @[JSON::Field(key: "Message")]
        getter message : String

        # Message attributes for Publish action.

        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # This parameter applies only to FIFO (first-in-first-out) topics. The MessageDeduplicationId can
        # contain up to 128 alphanumeric characters (a-z, A-Z, 0-9) and punctuation
        # (!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~) . Every message must have a unique
        # MessageDeduplicationId , which is a token used for deduplication of sent messages within the 5
        # minute minimum deduplication interval. The scope of deduplication depends on the FifoThroughputScope
        # attribute, when set to Topic the message deduplication scope is across the entire topic, when set to
        # MessageGroup the message deduplication scope is within each individual message group. If a message
        # with a particular MessageDeduplicationId is sent successfully, subsequent messages within the
        # deduplication scope and interval, with the same MessageDeduplicationId , are accepted successfully
        # but aren't delivered. Every message must have a unique MessageDeduplicationId : You may provide a
        # MessageDeduplicationId explicitly. If you aren't able to provide a MessageDeduplicationId and you
        # enable ContentBasedDeduplication for your topic, Amazon SNS uses a SHA-256 hash to generate the
        # MessageDeduplicationId using the body of the message (but not the attributes of the message). If you
        # don't provide a MessageDeduplicationId and the topic doesn't have ContentBasedDeduplication set, the
        # action fails with an error. If the topic has a ContentBasedDeduplication set, your
        # MessageDeduplicationId overrides the generated one. When ContentBasedDeduplication is in effect,
        # messages with identical content sent within the deduplication scope and interval are treated as
        # duplicates and only one copy of the message is delivered. If you send one message with
        # ContentBasedDeduplication enabled, and then another message with a MessageDeduplicationId that is
        # the same as the one generated for the first MessageDeduplicationId , the two messages are treated as
        # duplicates, within the deduplication scope and interval, and only one copy of the message is
        # delivered.

        @[JSON::Field(key: "MessageDeduplicationId")]
        getter message_deduplication_id : String?

        # The MessageGroupId can contain up to 128 alphanumeric characters (a-z, A-Z, 0-9) and punctuation
        # (!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~) . For FIFO topics: The MessageGroupId is a tag that
        # specifies that a message belongs to a specific message group. Messages that belong to the same
        # message group are processed in a FIFO manner (however, messages in different message groups might be
        # processed out of order). Every message must include a MessageGroupId . For standard topics: The
        # MessageGroupId is optional and is forwarded only to Amazon SQS standard subscriptions to activate
        # fair queues . The MessageGroupId is not used for, or sent to, any other endpoint types. When
        # provided, the same validation rules apply as for FIFO topics.

        @[JSON::Field(key: "MessageGroupId")]
        getter message_group_id : String?

        # Set MessageStructure to json if you want to send a different message for each protocol. For example,
        # using one publish action, you can send a short message to your SMS subscribers and a longer message
        # to your email subscribers. If you set MessageStructure to json , the value of the Message parameter
        # must: be a syntactically valid JSON object; and contain at least a top-level JSON key of "default"
        # with a value that is a string. You can define other top-level keys that define the message you want
        # to send to a specific transport protocol (e.g., "http"). Valid value: json

        @[JSON::Field(key: "MessageStructure")]
        getter message_structure : String?

        # The phone number to which you want to deliver an SMS message. Use E.164 format. If you don't specify
        # a value for the PhoneNumber parameter, you must specify a value for the TargetArn or TopicArn
        # parameters.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # Optional parameter to be used as the "Subject" line when the message is delivered to email
        # endpoints. This field will also be included, if present, in the standard JSON messages delivered to
        # other endpoints. Constraints: Subjects must be UTF-8 text with no line breaks or control characters,
        # and less than 100 characters long.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        # If you don't specify a value for the TargetArn parameter, you must specify a value for the
        # PhoneNumber or TopicArn parameters.

        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String?

        # The topic you want to publish to. If you don't specify a value for the TopicArn parameter, you must
        # specify a value for the PhoneNumber or TargetArn parameters.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @message : String,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @message_deduplication_id : String? = nil,
          @message_group_id : String? = nil,
          @message_structure : String? = nil,
          @phone_number : String? = nil,
          @subject : String? = nil,
          @target_arn : String? = nil,
          @topic_arn : String? = nil
        )
        end
      end

      # Response for Publish action.

      struct PublishResponse
        include JSON::Serializable

        # Unique identifier assigned to the published message. Length Constraint: Maximum 100 characters

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # This response element applies only to FIFO (first-in-first-out) topics. The sequence number is a
        # large, non-consecutive number that Amazon SNS assigns to each message. The length of SequenceNumber
        # is 128 bits. SequenceNumber continues to increase for each MessageGroupId .

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @message_id : String? = nil,
          @sequence_number : String? = nil
        )
        end
      end


      struct PutDataProtectionPolicyInput
        include JSON::Serializable

        # The JSON serialization of the topic's DataProtectionPolicy . The DataProtectionPolicy must be in
        # JSON string format. Length Constraints: Maximum length of 30,720.

        @[JSON::Field(key: "DataProtectionPolicy")]
        getter data_protection_policy : String

        # The ARN of the topic whose DataProtectionPolicy you want to add or update. For more information
        # about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @data_protection_policy : String,
          @resource_arn : String
        )
        end
      end

      # Input for RemovePermission action.

      struct RemovePermissionInput
        include JSON::Serializable

        # The unique label of the statement you want to remove.

        @[JSON::Field(key: "Label")]
        getter label : String

        # The ARN of the topic whose access control policy you wish to modify.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        def initialize(
          @label : String,
          @topic_arn : String
        )
        end
      end

      # Indicates that the request parameter has exceeded the maximum number of concurrent message replays.

      struct ReplayLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Can’t perform the action on the specified resource. Make sure that the resource exists.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A verified or pending destination phone number in the SMS sandbox. When you start using Amazon SNS
      # to send SMS messages, your Amazon Web Services account is in the SMS sandbox . The SMS sandbox
      # provides a safe environment for you to try Amazon SNS features without risking your reputation as an
      # SMS sender. While your Amazon Web Services account is in the SMS sandbox, you can use all of the
      # features of Amazon SNS. However, you can send SMS messages only to verified destination phone
      # numbers. For more information, including how to move out of the sandbox to send messages without
      # restrictions, see SMS sandbox in the Amazon SNS Developer Guide .

      struct SMSSandboxPhoneNumber
        include JSON::Serializable

        # The destination phone number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The destination phone number's verification status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @phone_number : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Input for SetEndpointAttributes action.

      struct SetEndpointAttributesInput
        include JSON::Serializable

        # A map of the endpoint attributes. Attributes in this map include the following: CustomUserData –
        # arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data must
        # be in UTF-8 format and less than 2KB. Enabled – flag that enables/disables delivery to the endpoint.
        # Amazon SNS will set this to false when a notification service indicates to Amazon SNS that the
        # endpoint is invalid. Users can set it back to true, typically after updating Token. Token – device
        # token, also referred to as a registration id, for an app and mobile device. This is returned from
        # the notification service when an app and mobile device are registered with the notification service.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)

        # EndpointArn used for SetEndpointAttributes action.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        def initialize(
          @attributes : Hash(String, String),
          @endpoint_arn : String
        )
        end
      end

      # Input for SetPlatformApplicationAttributes action.

      struct SetPlatformApplicationAttributesInput
        include JSON::Serializable

        # A map of the platform application attributes. Attributes in this map include the following:
        # PlatformCredential – The credential received from the notification service. For ADM,
        # PlatformCredential is client secret. For Apple Services using certificate credentials,
        # PlatformCredential is private key. For Apple Services using token credentials, PlatformCredential is
        # signing key. For GCM (Firebase Cloud Messaging) using key credentials, there is no PlatformPrincipal
        # . The PlatformCredential is API key . For GCM (Firebase Cloud Messaging) using token credentials,
        # there is no PlatformPrincipal . The PlatformCredential is a JSON formatted private key file. When
        # using the Amazon Web Services CLI, the file must be in string format and special characters must be
        # ignored. To format the file correctly, Amazon SNS recommends using the following command:
        # SERVICE_JSON=`jq @json &lt;&lt;&lt; cat service.json` . PlatformPrincipal – The principal received
        # from the notification service. For ADM, PlatformPrincipal is client id. For Apple Services using
        # certificate credentials, PlatformPrincipal is SSL certificate. For Apple Services using token
        # credentials, PlatformPrincipal is signing key ID. For GCM (Firebase Cloud Messaging), there is no
        # PlatformPrincipal . EventEndpointCreated – Topic ARN to which EndpointCreated event notifications
        # are sent. EventEndpointDeleted – Topic ARN to which EndpointDeleted event notifications are sent.
        # EventEndpointUpdated – Topic ARN to which EndpointUpdate event notifications are sent.
        # EventDeliveryFailure – Topic ARN to which DeliveryFailure event notifications are sent upon Direct
        # Publish delivery failure (permanent) to one of the application's endpoints. SuccessFeedbackRoleArn –
        # IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on your behalf.
        # FailureFeedbackRoleArn – IAM role ARN used to give Amazon SNS write access to use CloudWatch Logs on
        # your behalf. SuccessFeedbackSampleRate – Sample rate percentage (0-100) of successfully delivered
        # messages. The following attributes only apply to APNs token-based authentication:
        # ApplePlatformTeamID – The identifier that's assigned to your Apple developer account team.
        # ApplePlatformBundleID – The bundle identifier that's assigned to your iOS app.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)

        # PlatformApplicationArn for SetPlatformApplicationAttributes action.

        @[JSON::Field(key: "PlatformApplicationArn")]
        getter platform_application_arn : String

        def initialize(
          @attributes : Hash(String, String),
          @platform_application_arn : String
        )
        end
      end

      # The input for the SetSMSAttributes action.

      struct SetSMSAttributesInput
        include JSON::Serializable

        # The default settings for sending SMS messages from your Amazon Web Services account. You can set
        # values for the following attribute names: MonthlySpendLimit – The maximum amount in USD that you are
        # willing to spend each month to send SMS messages. When Amazon SNS determines that sending an SMS
        # message would incur a cost that exceeds this limit, it stops sending SMS messages within minutes.
        # Amazon SNS stops sending SMS messages within minutes of the limit being crossed. During that
        # interval, if you continue to send SMS messages, you will incur costs that exceed your limit. By
        # default, the spend limit is set to the maximum allowed by Amazon SNS. If you want to raise the
        # limit, submit an SNS Limit Increase case . For New limit value , enter your desired monthly spend
        # limit. In the Use Case Description field, explain that you are requesting an SMS monthly spend limit
        # increase. DeliveryStatusIAMRole – The ARN of the IAM role that allows Amazon SNS to write logs about
        # SMS deliveries in CloudWatch Logs. For each SMS message that you send, Amazon SNS writes a log that
        # includes the message price, the success or failure status, the reason for failure (if the message
        # failed), the message dwell time, and other information. DeliveryStatusSuccessSamplingRate – The
        # percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The
        # value can be an integer from 0 - 100. For example, to write logs only for failed deliveries, set
        # this value to 0 . To write logs for 10% of your successful deliveries, set it to 10 .
        # DefaultSenderID – A string, such as your business brand, that is displayed as the sender on the
        # receiving device. Support for sender IDs varies by country. The sender ID can be 1 - 11 alphanumeric
        # characters, and it must contain at least one letter. DefaultSMSType – The type of SMS message that
        # you will send by default. You can assign the following values: Promotional – (Default) Noncritical
        # messages, such as marketing messages. Amazon SNS optimizes the message delivery to incur the lowest
        # cost. Transactional – Critical messages that support customer transactions, such as one-time
        # passcodes for multi-factor authentication. Amazon SNS optimizes the message delivery to achieve the
        # highest reliability. UsageReportS3Bucket – The name of the Amazon S3 bucket to receive daily SMS
        # usage reports from Amazon SNS. Each day, Amazon SNS will deliver a usage report as a CSV file to the
        # bucket. The report includes the following information for each SMS message that was successfully
        # delivered by your Amazon Web Services account: Time that the message was published (in UTC) Message
        # ID Destination phone number Message type Delivery status Message price (in USD) Part number (a
        # message is split into multiple parts if it is too long for a single message) Total number of parts
        # To receive the report, the bucket must have a policy that allows the Amazon SNS service principal to
        # perform the s3:PutObject and s3:GetBucketLocation actions. For an example bucket policy and usage
        # report, see Monitoring SMS Activity in the Amazon SNS Developer Guide .

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)

        def initialize(
          @attributes : Hash(String, String)
        )
        end
      end

      # The response for the SetSMSAttributes action.

      struct SetSMSAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Input for SetSubscriptionAttributes action.

      struct SetSubscriptionAttributesInput
        include JSON::Serializable

        # A map of attributes with their corresponding values. The following lists the names, descriptions,
        # and values of the special request parameters that this action uses: DeliveryPolicy – The policy that
        # defines how Amazon SNS retries failed deliveries to HTTP/S endpoints. FilterPolicy – The simple JSON
        # object that lets your subscriber receive only a subset of messages, rather than receiving every
        # message published to the topic. FilterPolicyScope – This attribute lets you choose the filtering
        # scope by using one of the following string value types: MessageAttributes (default) – The filter is
        # applied on the message attributes. MessageBody – The filter is applied on the message body.
        # RawMessageDelivery – When set to true , enables raw message delivery to Amazon SQS or HTTP/S
        # endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise
        # created for Amazon SNS metadata. RedrivePolicy – When specified, sends undeliverable messages to the
        # specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for
        # example, when the subscribed endpoint is unreachable) or server errors (for example, when the
        # service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue
        # for further analysis or reprocessing. The following attribute applies only to Amazon Data Firehose
        # delivery stream subscriptions: SubscriptionRoleArn – The ARN of the IAM role that has the following:
        # Permission to write to the Firehose delivery stream Amazon SNS listed as a trusted entity Specifying
        # a valid ARN for this attribute is required for Firehose delivery stream subscriptions. For more
        # information, see Fanout to Firehose delivery streams in the Amazon SNS Developer Guide .

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The ARN of the subscription to modify.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String

        # The new value for the attribute in JSON format.

        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String?

        def initialize(
          @attribute_name : String,
          @subscription_arn : String,
          @attribute_value : String? = nil
        )
        end
      end

      # Input for SetTopicAttributes action.

      struct SetTopicAttributesInput
        include JSON::Serializable

        # A map of attributes with their corresponding values. The following lists the names, descriptions,
        # and values of the special request parameters that the SetTopicAttributes action uses: DeliveryPolicy
        # – The policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints. DisplayName
        # – The display name to use for a topic with SMS subscriptions. Policy – The policy that defines who
        # can access your topic. By default, only the topic owner can publish or subscribe to the topic.
        # TracingConfig – Tracing mode of an Amazon SNS topic. By default TracingConfig is set to PassThrough
        # , and the topic passes through the tracing header it receives from an Amazon SNS publisher to its
        # subscriptions. If set to Active , Amazon SNS will vend X-Ray segment data to topic owner account if
        # the sampled flag in the tracing header is true. This is only supported on standard topics. HTTP
        # HTTPSuccessFeedbackRoleArn – Indicates successful message delivery status for an Amazon SNS topic
        # that is subscribed to an HTTP endpoint. HTTPSuccessFeedbackSampleRate – Indicates percentage of
        # successful messages to sample for an Amazon SNS topic that is subscribed to an HTTP endpoint.
        # HTTPFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic that
        # is subscribed to an HTTP endpoint. Amazon Data Firehose FirehoseSuccessFeedbackRoleArn – Indicates
        # successful message delivery status for an Amazon SNS topic that is subscribed to an Amazon Data
        # Firehose endpoint. FirehoseSuccessFeedbackSampleRate – Indicates percentage of successful messages
        # to sample for an Amazon SNS topic that is subscribed to an Amazon Data Firehose endpoint.
        # FirehoseFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic
        # that is subscribed to an Amazon Data Firehose endpoint. Lambda LambdaSuccessFeedbackRoleArn –
        # Indicates successful message delivery status for an Amazon SNS topic that is subscribed to an Lambda
        # endpoint. LambdaSuccessFeedbackSampleRate – Indicates percentage of successful messages to sample
        # for an Amazon SNS topic that is subscribed to an Lambda endpoint. LambdaFailureFeedbackRoleArn –
        # Indicates failed message delivery status for an Amazon SNS topic that is subscribed to an Lambda
        # endpoint. Platform application endpoint ApplicationSuccessFeedbackRoleArn – Indicates successful
        # message delivery status for an Amazon SNS topic that is subscribed to an platform application
        # endpoint. ApplicationSuccessFeedbackSampleRate – Indicates percentage of successful messages to
        # sample for an Amazon SNS topic that is subscribed to an platform application endpoint.
        # ApplicationFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic
        # that is subscribed to an platform application endpoint. In addition to being able to configure topic
        # attributes for message delivery status of notification messages sent to Amazon SNS application
        # endpoints, you can also configure application attributes for the delivery status of push
        # notification messages sent to push notification services. For example, For more information, see
        # Using Amazon SNS Application Attributes for Message Delivery Status . Amazon SQS
        # SQSSuccessFeedbackRoleArn – Indicates successful message delivery status for an Amazon SNS topic
        # that is subscribed to an Amazon SQS endpoint. SQSSuccessFeedbackSampleRate – Indicates percentage of
        # successful messages to sample for an Amazon SNS topic that is subscribed to an Amazon SQS endpoint.
        # SQSFailureFeedbackRoleArn – Indicates failed message delivery status for an Amazon SNS topic that is
        # subscribed to an Amazon SQS endpoint. The &lt;ENDPOINT&gt;SuccessFeedbackRoleArn and
        # &lt;ENDPOINT&gt;FailureFeedbackRoleArn attributes are used to give Amazon SNS write access to use
        # CloudWatch Logs on your behalf. The &lt;ENDPOINT&gt;SuccessFeedbackSampleRate attribute is for
        # specifying the sample rate percentage (0-100) of successfully delivered messages. After you
        # configure the &lt;ENDPOINT&gt;FailureFeedbackRoleArn attribute, then all failed message deliveries
        # generate CloudWatch Logs. The following attribute applies only to server-side-encryption :
        # KmsMasterKeyId – The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SNS
        # or a custom CMK. For more information, see Key Terms . For more examples, see KeyId in the Key
        # Management Service API Reference . SignatureVersion – The signature version corresponds to the
        # hashing algorithm used while creating the signature of the notifications, subscription
        # confirmations, or unsubscribe confirmation messages sent by Amazon SNS. By default, SignatureVersion
        # is set to 1 . The following attribute applies only to FIFO topics : ArchivePolicy – The policy that
        # sets the retention period for messages stored in the message archive of an Amazon SNS FIFO topic.
        # ContentBasedDeduplication – Enables content-based deduplication for FIFO topics. By default,
        # ContentBasedDeduplication is set to false . If you create a FIFO topic and this attribute is false ,
        # you must specify a value for the MessageDeduplicationId parameter for the Publish action. When you
        # set ContentBasedDeduplication to true , Amazon SNS uses a SHA-256 hash to generate the
        # MessageDeduplicationId using the body of the message (but not the attributes of the message).
        # (Optional) To override the generated value, you can specify a value for the MessageDeduplicationId
        # parameter for the Publish action. FifoThroughputScope – Enables higher throughput for your FIFO
        # topic by adjusting the scope of deduplication. This attribute has two possible values: Topic – The
        # scope of message deduplication is across the entire topic. This is the default value and maintains
        # existing behavior, with a maximum throughput of 3000 messages per second or 20MB per second,
        # whichever comes first. MessageGroup – The scope of deduplication is within each individual message
        # group, which enables higher throughput per topic subject to regional quotas. For more information on
        # quotas or to request an increase, see Amazon SNS service quotas in the Amazon Web Services General
        # Reference.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The ARN of the topic to modify.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        # The new value for the attribute.

        @[JSON::Field(key: "AttributeValue")]
        getter attribute_value : String?

        def initialize(
          @attribute_name : String,
          @topic_arn : String,
          @attribute_value : String? = nil
        )
        end
      end

      # A tag has been added to a resource with the same ARN as a deleted resource. Wait a short while and
      # then retry the operation.

      struct StaleTagException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input for Subscribe action.

      struct SubscribeInput
        include JSON::Serializable

        # The protocol that you want to use. Supported protocols include: http – delivery of JSON-encoded
        # message via HTTP POST https – delivery of JSON-encoded message via HTTPS POST email – delivery of
        # message via SMTP email-json – delivery of JSON-encoded message via SMTP sms – delivery of message
        # via SMS sqs – delivery of JSON-encoded message to an Amazon SQS queue application – delivery of
        # JSON-encoded message to an EndpointArn for a mobile app and device lambda – delivery of JSON-encoded
        # message to an Lambda function firehose – delivery of JSON-encoded message to an Amazon Data Firehose
        # delivery stream.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # The ARN of the topic you want to subscribe to.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        # A map of attributes with their corresponding values. The following lists the names, descriptions,
        # and values of the special request parameters that the Subscribe action uses: DeliveryPolicy – The
        # policy that defines how Amazon SNS retries failed deliveries to HTTP/S endpoints. FilterPolicy – The
        # simple JSON object that lets your subscriber receive only a subset of messages, rather than
        # receiving every message published to the topic. FilterPolicyScope – This attribute lets you choose
        # the filtering scope by using one of the following string value types: MessageAttributes (default) –
        # The filter is applied on the message attributes. MessageBody – The filter is applied on the message
        # body. RawMessageDelivery – When set to true , enables raw message delivery to Amazon SQS or HTTP/S
        # endpoints. This eliminates the need for the endpoints to process JSON formatting, which is otherwise
        # created for Amazon SNS metadata. RedrivePolicy – When specified, sends undeliverable messages to the
        # specified Amazon SQS dead-letter queue. Messages that can't be delivered due to client errors (for
        # example, when the subscribed endpoint is unreachable) or server errors (for example, when the
        # service that powers the subscribed endpoint becomes unavailable) are held in the dead-letter queue
        # for further analysis or reprocessing. The following attribute applies only to Amazon Data Firehose
        # delivery stream subscriptions: SubscriptionRoleArn – The ARN of the IAM role that has the following:
        # Permission to write to the Firehose delivery stream Amazon SNS listed as a trusted entity Specifying
        # a valid ARN for this attribute is required for Firehose delivery stream subscriptions. For more
        # information, see Fanout to Firehose delivery streams in the Amazon SNS Developer Guide . The
        # following attributes apply only to FIFO topics : ReplayPolicy – Adds or updates an inline policy
        # document for a subscription to replay messages stored in the specified Amazon SNS topic.
        # ReplayStatus – Retrieves the status of the subscription message replay, which can be one of the
        # following: Completed – The replay has successfully redelivered all messages, and is now delivering
        # newly published messages. If an ending point was specified in the ReplayPolicy then the subscription
        # will no longer receive newly published messages. In progress – The replay is currently replaying the
        # selected messages. Failed – The replay was unable to complete. Pending – The default state while the
        # replay initiates.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The endpoint that you want to receive notifications. Endpoints vary by protocol: For the http
        # protocol, the (public) endpoint is a URL beginning with http:// . For the https protocol, the
        # (public) endpoint is a URL beginning with https:// . For the email protocol, the endpoint is an
        # email address. For the email-json protocol, the endpoint is an email address. For the sms protocol,
        # the endpoint is a phone number of an SMS-enabled device. For the sqs protocol, the endpoint is the
        # ARN of an Amazon SQS queue. For the application protocol, the endpoint is the EndpointArn of a
        # mobile app and device. For the lambda protocol, the endpoint is the ARN of an Lambda function. For
        # the firehose protocol, the endpoint is the ARN of an Amazon Data Firehose delivery stream.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # Sets whether the response from the Subscribe request includes the subscription ARN, even if the
        # subscription is not yet confirmed. If you set this parameter to true , the response includes the ARN
        # in all cases, even if the subscription is not yet confirmed. In addition to the ARN for confirmed
        # subscriptions, the response also includes the pending subscription ARN value for subscriptions that
        # aren't yet confirmed. A subscription becomes confirmed when the subscriber calls the
        # ConfirmSubscription action with a confirmation token. The default value is false .

        @[JSON::Field(key: "ReturnSubscriptionArn")]
        getter return_subscription_arn : Bool?

        def initialize(
          @protocol : String,
          @topic_arn : String,
          @attributes : Hash(String, String)? = nil,
          @endpoint : String? = nil,
          @return_subscription_arn : Bool? = nil
        )
        end
      end

      # Response for Subscribe action.

      struct SubscribeResponse
        include JSON::Serializable

        # The ARN of the subscription if it is confirmed, or the string "pending confirmation" if the
        # subscription requires confirmation. However, if the API request parameter ReturnSubscriptionArn is
        # true, then the value is always the subscription ARN, even if the subscription requires confirmation.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String?

        def initialize(
          @subscription_arn : String? = nil
        )
        end
      end

      # A wrapper type for the attributes of an Amazon SNS subscription.

      struct Subscription
        include JSON::Serializable

        # The subscription's endpoint (format depends on the protocol).

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The subscription's owner.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The subscription's protocol.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The subscription's ARN.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String?

        # The ARN of the subscription's topic.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @endpoint : String? = nil,
          @owner : String? = nil,
          @protocol : String? = nil,
          @subscription_arn : String? = nil,
          @topic_arn : String? = nil
        )
        end
      end

      # Indicates that the customer already owns the maximum allowed number of subscriptions.

      struct SubscriptionLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The list of tags to be added to the specified topic.

      struct Tag
        include JSON::Serializable

        # The required key portion of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The optional value portion of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Can't add more than 50 tags to a topic.

      struct TagLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request doesn't comply with the IAM tag policy. Correct your request and then retry it.

      struct TagPolicyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the topic to which to add tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to be added to the specified topic. A tag consists of a required key and an optional value.

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

      # Indicates that the rate at which requests have been submitted for this action exceeds the limit for
      # your Amazon Web Services account.

      struct ThrottledException
        include JSON::Serializable

        # Throttled request.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The batch request contains more entries than permissible (more than 10).

      struct TooManyEntriesInBatchRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, use
      # GetTopicAttributes .

      struct Topic
        include JSON::Serializable

        # The topic's ARN.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @topic_arn : String? = nil
        )
        end
      end

      # Indicates that the customer already owns the maximum allowed number of topics.

      struct TopicLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input for Unsubscribe action.

      struct UnsubscribeInput
        include JSON::Serializable

        # The ARN of the subscription to be deleted.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String

        def initialize(
          @subscription_arn : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the topic from which to remove tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the specified topic.

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

      # Indicates that a request parameter does not comply with the associated constraints.

      struct UserErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that a parameter in the request is invalid.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Indicates that the one-time password (OTP) used for verification is invalid.

      struct VerificationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The status of the verification error.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @message : String,
          @status : String
        )
        end
      end


      struct VerifySMSSandboxPhoneNumberInput
        include JSON::Serializable

        # The OTP sent to the destination number from the CreateSMSSandBoxPhoneNumber call.

        @[JSON::Field(key: "OneTimePassword")]
        getter one_time_password : String

        # The destination phone number to verify.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String

        def initialize(
          @one_time_password : String,
          @phone_number : String
        )
        end
      end

      # The destination phone number's verification status.

      struct VerifySMSSandboxPhoneNumberResult
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
